Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A51B3B6D3
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BF48919E;
	Mon, 10 Jun 2019 14:08:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E32891EB;
 Sat,  8 Jun 2019 08:49:54 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hZX2q-0001tl-4j; Sat, 08 Jun 2019 08:49:48 +0000
Date: Sat, 8 Jun 2019 01:49:48 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 hmm 01/11] mm/hmm: fix use after free with struct hmm
 in the mmu notifiers
Message-ID: <20190608084948.GA32185@infradead.org>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-2-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606184438.31646-2-jgg@ziepe.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 10 Jun 2019 14:08:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pc64FXF/YPlBK6WpAw3gK4j6mLFmyQzV+riQYtwKZZ8=; b=iUebSp4gV11prU3sOG7JF9FrI
 2JuHQ5xbLQgcMlsbPMssFX2B3mrdBqWjQjCtT5FVX6Ts2YmlNuv9z2IDexlxenS8UA0Th1fTEIKmm
 CR0M0LG9PqU4UitFs5Sf48yXHiKoecKfHQkryI2EyS8Di/+NNBxfM/MsV6R4pkffLD/8OpwqoSUgx
 7ctwS1whpMBBN/zH2e/X3zeALM4+4BZ6DOka1TloBghQ+uhU+mwfmzEWeCbmLn1wvvbnTBurEPqSd
 NnK+dH3j9gpXegzaYCHj783Wr+QDG4YBKckxG3fdF295yQrVSwBEjg5MN1S+JmRQY9LJDYC1jHhr+
 AUJjRe9kg==;
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSBzdGlsbCB0aGluayBzcnVjdCBobW0gc2hvdWxkIGRpZS4gIFdlIGFscmVhZHkgaGF2ZSBhIHN0
cnVjdHVyZSB1c2VkCmZvciBhZGRpdGlvbmFsIGluZm9ybWF0aW9uIGZvciBkcml2ZXJzIGhhdmlu
ZyBjcmF6bHkgdGlnaHQgaW50ZWdyYXRpb24KaW50byB0aGUgVk0sIGFuZCBpdCBpcyBjYWxsZWQg
c3RydWN0IG1tdV9ub3RpZmllcl9tbS4gIFdlIHJlYWxseSBuZWVkCnRvIHJldXNlIHRoYXQgaW50
ZWFkIG9mIGR1cGxpY2F0aW5nIGl0IGJhZGx5LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
