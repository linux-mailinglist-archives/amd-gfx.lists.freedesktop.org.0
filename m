Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 030B47A2DD
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 10:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADBD89C1B;
	Tue, 30 Jul 2019 08:12:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAA86E3E9;
 Tue, 30 Jul 2019 05:52:23 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hsL3c-00015E-DZ; Tue, 30 Jul 2019 05:52:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Subject: [PATCH 02/13] amdgpu: don't initialize range->list in
 amdgpu_hmm_init_range
Date: Tue, 30 Jul 2019 08:51:52 +0300
Message-Id: <20190730055203.28467-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190730055203.28467-1-hch@lst.de>
References: <20190730055203.28467-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 30 Jul 2019 08:12:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MiAJz6/LGZ9crHwvj8CLjPFMqAcUr7sr54tyumAelRs=; b=Rg7K55yowl6k/ZPgtgKzOFotco
 EVRGBimUYALuPVAK+Kd0lIYGAgz8qtzz4r7Rt2jsMd0MtpQWT8xWTjMhSpjmP6B+WzSAt0NQxsH3z
 +abmLHxfsepvGEZ16JG88WTk4KK/xmmi/835FUkRt3rJXl5jFfuGcN+T4XXHJZr+nfh2bJRDlW3PY
 pEOwZbQr5FVYHNr00EG+63WsoZ6aeTTX2HHITa6njQqVgFg/XDoSqkAj0N5KDOYMSp9n85MUhgF5D
 whhEQ2w7Jug4LOPnVeW4QA+7KPrsRNLvw5OSVDmss722pMK5UEW5tPkequZrhaCLygy8OXTJOT9po
 zeDCXljw==;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGxpc3QgaXMgdXNlZCB0byBhZGQgdGhlIHJhbmdlIHRvIGFub3RoZXIgbGlzdCBhcyBhbiBl
bnRyeSBpbiB0aGUKY29yZSBobW0gY29kZSwgc28gdGhlcmUgaXMgbm8gbmVlZCB0byBpbml0aWFs
aXplIGl0IGluIGEgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhj
aEBsc3QuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMgfCAx
IC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfbW4uYwppbmRleCBiNjk4YjQyM2IyNWQuLjYwYjlmYzk1NjFkNyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMKQEAgLTQ4NCw2ICs0ODQsNSBAQCB2b2lkIGFt
ZGdwdV9obW1faW5pdF9yYW5nZShzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKIAkJcmFuZ2UtPmZs
YWdzID0gaG1tX3JhbmdlX2ZsYWdzOwogCQlyYW5nZS0+dmFsdWVzID0gaG1tX3JhbmdlX3ZhbHVl
czsKIAkJcmFuZ2UtPnBmbl9zaGlmdCA9IFBBR0VfU0hJRlQ7Ci0JCUlOSVRfTElTVF9IRUFEKCZy
YW5nZS0+bGlzdCk7CiAJfQogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
