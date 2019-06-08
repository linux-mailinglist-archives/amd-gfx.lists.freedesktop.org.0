Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBB23B6BB
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131258916B;
	Mon, 10 Jun 2019 14:08:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7125F8920F;
 Sat,  8 Jun 2019 09:10:15 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hZXMW-0001PM-Rs; Sat, 08 Jun 2019 09:10:08 +0000
Date: Sat, 8 Jun 2019 02:10:08 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
Message-ID: <20190608091008.GC32185@infradead.org>
References: <20190608001452.7922-1-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190608001452.7922-1-rcampbell@nvidia.com>
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
 bh=jWAF5+2MrHGGuTvQFl5pQjHX1gq26Kf37occ6yCO+7s=; b=egAbhAuk58EO8mWmsVFAI1IGL
 3NGx28Wqh4mlsRk6rZ00vWqQWM9snKOqvzJ8t8oTYp3b7YpQ4FN8ZhKbrlJodVCitb+Vxfv2byRPT
 NBRO5aK1ycIXMfWixI6Hii44xtfrHE8G1KXTx+YJdvNlNvFPERvkjfosNOy0pOMJSRev/soMMoM/5
 AvIuJh9HkQKbxAE+dz94FYEl91SIfv2c4vtlSkMXRjP+nFBN9qBOL2MNvAGJ9SoDWRIVQ+IolhzoT
 n7RKcTtWipcfqFeHOcfjaOXuF634N2hfWMei0HWuZlCxhD+yKfrFhXTL4UzOcxjtOOHD2M63qigYY
 y8qlfJgRQ==;
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDU6MTQ6NTJQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gSE1NIGRlZmluZXMgaXRzIG93biBzdHJ1Y3QgaG1tX3VwZGF0ZSB3aGljaCBpcyBw
YXNzZWQgdG8gdGhlCj4gc3luY19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMoKSBjYWxsYmFjayBmdW5j
dGlvbi4gVGhpcyBpcwo+IHN1ZmZpY2llbnQgd2hlbiB0aGUgb25seSBhY3Rpb24gaXMgdG8gaW52
YWxpZGF0ZS4gSG93ZXZlciwKPiBhIGRldmljZSBtYXkgd2FudCB0byBrbm93IHRoZSByZWFzb24g
Zm9yIHRoZSBpbnZhbGlkYXRpb24gYW5kCj4gYmUgYWJsZSB0byBzZWUgdGhlIG5ldyBwZXJtaXNz
aW9ucyBvbiBhIHJhbmdlLCB1cGRhdGUgZGV2aWNlIGFjY2Vzcwo+IHJpZ2h0cyBvciByYW5nZSBz
dGF0aXN0aWNzLiBTaW5jZSBzeW5jX2NwdV9kZXZpY2VfcGFnZXRhYmxlcygpCj4gY2FuIGJlIGNh
bGxlZCBmcm9tIHRyeV90b191bm1hcCgpLCB0aGUgbW1hcF9zZW0gbWF5IG5vdCBiZSBoZWxkCj4g
YW5kIGZpbmRfdm1hKCkgaXMgbm90IHNhZmUgdG8gYmUgY2FsbGVkLgo+IFBhc3MgdGhlIHN0cnVj
dCBtbXVfbm90aWZpZXJfcmFuZ2UgdG8gc3luY19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMoKQo+IHRv
IGFsbG93IHRoZSBmdWxsIGludmFsaWRhdGlvbiBpbmZvcm1hdGlvbiB0byBiZSB1c2VkLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KPiAt
LS0KPiAKPiBJJ20gc2VuZGluZyB0aGlzIG91dCBub3cgc2luY2Ugd2UgYXJlIHVwZGF0aW5nIG1h
bnkgb2YgdGhlIEhNTSBBUElzCj4gYW5kIEkgdGhpbmsgaXQgd2lsbCBiZSB1c2VmdWwuCgpUaGlz
IGlzIHRoZSByaWdodCB0aGluZyB0byBkby4gIEJ1dCB0aGUgcmVhbGx5IHJpZ2h0IHRoaW5nIGlz
IHRvIGp1c3QKa2lsbCB0aGUgaG1tX21pcnJvciBBUEkgZW50aXJlbHkgYW5kIG1vdmUgdG8gbW11
X25vdGlmaWVycy4gIEF0IGxlYXN0CmZvciBub3ZlYXUgdGhpcyBhbHJlYWR5IGlzIHdheSBzaW1w
bGVyLCBhbHRob3VnaCByaWdodCBub3cgaXQgZGVmZWF0cwpKYXNvbnMgcGF0Y2ggdG8gYXZvaWQg
YWxsb2NhdGluZyB0aGUgc3RydWN0IGhtbSBpbiB0aGUgZmF1bHQgcGF0aC4KQnV0IGFzIHNhaWQg
YmVmb3JlIHRoYXQgY2FuIGJlIGF2b2lkZWQgYnkganVzdCBraWxsaW5nIHN0cnVjdCBobW0sCndo
aWNoIGZvciBtYW55IHJlYXNvbnMgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGFueXdheS4KCkkn
dmUgZ290IGEgc2VyaWVzIGhlcmUsIHdoaWNoIGlzIGEgYml0IGJyb2tlbiAoZXBlY2lhbGx5IHRo
ZSBsYXN0CnBhdGNoIGNhbid0IHdvcmsgYXMtaXMpLCBidXQgc2hvdWxkIGV4cGxhaW4gd2hlcmUg
SSdtIHRyeWluZyB0byBoZWFkOgoKaHR0cDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJzL2hjaC9t
aXNjLmdpdC9zaG9ydGxvZy9yZWZzL2hlYWRzL2htbS1taXJyb3Itc2ltcGxpZmljYXRpb24KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
