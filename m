Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0C77A2DC
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 10:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A57089BF0;
	Tue, 30 Jul 2019 08:12:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6216E3F3;
 Tue, 30 Jul 2019 05:52:41 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hsL3u-0001K2-4x; Tue, 30 Jul 2019 05:52:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Subject: [PATCH 08/13] mm: remove the mask variable in
 hmm_vma_walk_hugetlb_entry
Date: Tue, 30 Jul 2019 08:51:58 +0300
Message-Id: <20190730055203.28467-9-hch@lst.de>
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
 bh=lQ9XWeQmmP2B/eiMeXgVV4uJBU5pKgmRyH+iL8uHSEM=; b=uq+lPiYKi3jyFWYRyJc2ZqGofZ
 AfLm7DwXmu4JT8EzoT14gmQsntskqRtuY8G1cnrd/LGbf8XPIjVfgOc8bb9ap9X0V7joXGNksytRi
 zALM22SNoQasN3BLoeBFR/vvCHaXwDoi9ZRyvE3+UeWsboS9MGuTqQ9l97jIiVzC7JdWxUgbDi94Y
 SNudo9geEIfISGK8/w858hjF3tJ5AFspbRUlnzqRM0O4lBbRAx36X7p2UDsP9spKDQweK0rlIxERO
 kDjVa7wlLGqVNCj2hmZofEs7SfZ+60OPJU4FjcxlQ7UvktaV6516z56wix5W6aeIElxYkE9PQKl+5
 u8tqsQjg==;
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

VGhlIHBhZ2V3YWxrIGNvZGUgYWxyZWFkeSBwYXNzZXMgdGhlIHZhbHVlIGFzIHRoZSBobWFzayBw
YXJhbWV0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
LS0tCiBtbS9obW0uYyB8IDcgKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4
IGYyNmQ2YWJjNGVkMi4uODhiNzdhNGE2YTFlIDEwMDY0NAotLS0gYS9tbS9obW0uYworKysgYi9t
bS9obW0uYwpAQCAtNzcxLDE5ICs3NzEsMTYgQEAgc3RhdGljIGludCBobW1fdm1hX3dhbGtfaHVn
ZXRsYl9lbnRyeShwdGVfdCAqcHRlLCB1bnNpZ25lZCBsb25nIGhtYXNrLAogCQkJCSAgICAgIHN0
cnVjdCBtbV93YWxrICp3YWxrKQogewogI2lmZGVmIENPTkZJR19IVUdFVExCX1BBR0UKLQl1bnNp
Z25lZCBsb25nIGFkZHIgPSBzdGFydCwgaSwgcGZuLCBtYXNrOworCXVuc2lnbmVkIGxvbmcgYWRk
ciA9IHN0YXJ0LCBpLCBwZm47CiAJc3RydWN0IGhtbV92bWFfd2FsayAqaG1tX3ZtYV93YWxrID0g
d2Fsay0+cHJpdmF0ZTsKIAlzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSA9IGhtbV92bWFfd2Fsay0+
cmFuZ2U7CiAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEgPSB3YWxrLT52bWE7Ci0Jc3RydWN0
IGhzdGF0ZSAqaCA9IGhzdGF0ZV92bWEodm1hKTsKIAl1aW50NjRfdCBvcmlnX3BmbiwgY3B1X2Zs
YWdzOwogCWJvb2wgZmF1bHQsIHdyaXRlX2ZhdWx0OwogCXNwaW5sb2NrX3QgKnB0bDsKIAlwdGVf
dCBlbnRyeTsKIAlpbnQgcmV0ID0gMDsKIAotCW1hc2sgPSBodWdlX3BhZ2Vfc2l6ZShoKSAtIDE7
Ci0KIAlwdGwgPSBodWdlX3B0ZV9sb2NrKGhzdGF0ZV92bWEodm1hKSwgd2Fsay0+bW0sIHB0ZSk7
CiAJZW50cnkgPSBodWdlX3B0ZXBfZ2V0KHB0ZSk7CiAKQEAgLTc5OSw3ICs3OTYsNyBAQCBzdGF0
aWMgaW50IGhtbV92bWFfd2Fsa19odWdldGxiX2VudHJ5KHB0ZV90ICpwdGUsIHVuc2lnbmVkIGxv
bmcgaG1hc2ssCiAJCWdvdG8gdW5sb2NrOwogCX0KIAotCXBmbiA9IHB0ZV9wZm4oZW50cnkpICsg
KChzdGFydCAmIG1hc2spID4+IFBBR0VfU0hJRlQpOworCXBmbiA9IHB0ZV9wZm4oZW50cnkpICsg
KChzdGFydCAmIGhtYXNrKSA+PiBQQUdFX1NISUZUKTsKIAlmb3IgKDsgYWRkciA8IGVuZDsgYWRk
ciArPSBQQUdFX1NJWkUsIGkrKywgcGZuKyspCiAJCXJhbmdlLT5wZm5zW2ldID0gaG1tX2Rldmlj
ZV9lbnRyeV9mcm9tX3BmbihyYW5nZSwgcGZuKSB8CiAJCQkJIGNwdV9mbGFnczsKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
