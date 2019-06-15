Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A0B475AD
	for <lists+amd-gfx@lfdr.de>; Sun, 16 Jun 2019 17:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E392891B3;
	Sun, 16 Jun 2019 15:53:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EDC891B4;
 Sat, 15 Jun 2019 14:16:14 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hc9TY-0004Oe-PU; Sat, 15 Jun 2019 14:16:12 +0000
Date: Sat, 15 Jun 2019 07:16:12 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 08/12] mm/hmm: Remove racy protection against
 double-unregistration
Message-ID: <20190615141612.GH17724@infradead.org>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-9-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614004450.20252-9-jgg@ziepe.ca>
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
 bh=gD6VIqBkLgYyVrhSIGdqF3irdAhekwacGCLxmHhYe7A=; b=qJnhMHAZBgQNHi8eUuOeP+8LI
 JxIU15mLHHerFUAADAGOP6itU3lIQb2h1qGivB7Ml7JzdNmXu2f5C2gevwIfVeOAmTRUggKSAIJoY
 l9T0oRnfDSCSkHCdqyMj6u3Y5o3reIYdhf8DdeR2dUPCvNrWxOOqHOO5UZMcmDf2QL2I05fSY3NSw
 ij7iywxXUP2MwChDJ/tZqKJ9MiVKfYktf42nkE0PVJzgVi05btfij2DbfWHgKAYVJ/5+fM+TxXQ4t
 DCCAo80gjD34vxw55WwgMV7Hv7Jj4RYXj/nbUtd5kQe/hk1oFC6PFPvPZWUDzWqT8LVwa2b+p6aHs
 AIBLPQzaQ==;
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDk6NDQ6NDZQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBO
byBvdGhlciByZWdpc3Rlci91bnJlZ2lzdGVyIGtlcm5lbCBBUEkgYXR0ZW1wdHMgdG8gcHJvdmlk
ZSB0aGlzIGtpbmQgb2YKPiBwcm90ZWN0aW9uIGFzIGl0IGlzIGluaGVyZW50bHkgcmFjeSwgc28g
anVzdCBkcm9wIGl0Lgo+IAo+IENhbGxlcnMgc2hvdWxkIHByb3ZpZGUgdGhlaXIgb3duIHByb3Rl
Y3Rpb24sIGl0IGFwcGVhcnMgbm91dmVhdSBhbHJlYWR5Cj4gZG9lcywgYnV0IGp1c3QgaW4gY2Fz
ZSBkcm9wIGEgZGVidWdnaW5nIFBPSVNPTi4KCkkgZG9uJ3QgZXZlbiB0aGluayB3ZSBldmVuIG5l
ZWQgdG8gYm90aGVyIHdpdGggdGhlIFBPSVNPTiwgbm9ybWFsIGxpc3QKZGVidWdnaW5nIHdpbGwg
YWxyZWFkeSBjYXRjaCBhIGRvdWJsZSB1bnJlZ2lzdHJhdGlvbiBhbnl3YXkuCgpPdGhlcndpc2Ug
bG9va3MgZmluZToKClJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
