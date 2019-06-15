Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D53475A8
	for <lists+amd-gfx@lfdr.de>; Sun, 16 Jun 2019 17:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF924890E4;
	Sun, 16 Jun 2019 15:53:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378D689142;
 Sat, 15 Jun 2019 14:14:39 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hc9Rz-0002Dl-UH; Sat, 15 Jun 2019 14:14:35 +0000
Date: Sat, 15 Jun 2019 07:14:35 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 06/12] mm/hmm: Hold on to the mmget for the
 lifetime of the range
Message-ID: <20190615141435.GF17724@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-7-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614004450.20252-7-jgg@ziepe.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sun, 16 Jun 2019 15:53:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6K3IZWimfXFDx5zlj0FydVfqj2gXTabKUZsGz9eiwgw=; b=NDaar3aYYUTqIadeUzt3fjl5e
 xTvini6vXAxFVVQTpQjC/ZVFmzryOfabxlaFlyZA9bhVT+06royjNgkE6cNob+/+Zo0FZs6bvV6i2
 VV99tEpby1InU8VhqJHXDCu8OrpmNPZf177PEPtOvB64PS4aPV7XjPvCz0pCp9kzA00pOYzzGBUDW
 GenFaGRR1yzUlw7nCrOkq+FP9YqBtZNwe1bMN2gEUOqCCy6Na/j6nAQDBCzPKIOyZbbXEwoKCXER8
 g8r+0iep8vK1xgNwY+knre1ESI1PCehtG9SiyEQby/7Vugv6F9vqNXIS2/CraTZJ8jq/eDJjaRazX
 3ehroctrA==;
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAgCW11dGV4X2xvY2soJmhtbS0+bG9jayk7Cj4gLQlsaXN0X2Zvcl9lYWNoX2VudHJ5KHJhbmdl
LCAmaG1tLT5yYW5nZXMsIGxpc3QpCj4gLQkJcmFuZ2UtPnZhbGlkID0gZmFsc2U7Cj4gLQl3YWtl
X3VwX2FsbCgmaG1tLT53cSk7Cj4gKwkvKgo+ICsJICogU2luY2UgaG1tX3JhbmdlX3JlZ2lzdGVy
KCkgaG9sZHMgdGhlIG1tZ2V0KCkgbG9jayBobW1fcmVsZWFzZSgpIGlzCj4gKwkgKiBwcmV2ZW50
ZWQgYXMgbG9uZyBhcyBhIHJhbmdlIGV4aXN0cy4KPiArCSAqLwo+ICsJV0FSTl9PTighbGlzdF9l
bXB0eSgmaG1tLT5yYW5nZXMpKTsKPiAgCW11dGV4X3VubG9jaygmaG1tLT5sb2NrKTsKClRoaXMg
Y2FuIGp1c3QgdXNlIGxpc3RfZW1wdHlfY2FyZWZ1bCBhbmQgYXZvaWQgdGhlIGxvY2sgZW50aXJl
bHkuCgpPdGhlcndpc2UgbG9va3MgZ29vZDoKClJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdp
ZyA8aGNoQGxzdC5kZT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
