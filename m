Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3FC5DAB8
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Jul 2019 03:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2313A6E0BD;
	Wed,  3 Jul 2019 01:24:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F516E09F;
 Tue,  2 Jul 2019 22:49:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CAAB368BFE; Wed,  3 Jul 2019 00:49:12 +0200 (CEST)
Date: Wed, 3 Jul 2019 00:49:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
Message-ID: <20190702224912.GA24043@lst.de>
References: <20190608001452.7922-1-rcampbell@nvidia.com>
 <20190702195317.GT31718@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702195317.GT31718@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Wed, 03 Jul 2019 01:24:34 +0000
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
 Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMDc6NTM6MjNQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+ID4gSSdtIHNlbmRpbmcgdGhpcyBvdXQgbm93IHNpbmNlIHdlIGFyZSB1cGRhdGlu
ZyBtYW55IG9mIHRoZSBITU0gQVBJcwo+ID4gYW5kIEkgdGhpbmsgaXQgd2lsbCBiZSB1c2VmdWwu
Cj4gCj4gVGhpcyBtYWtlIHNvIG11Y2ggc2Vuc2UsIEknZCBsaWtlIHRvIGFwcGx5IHRoaXMgaW4g
aG1tLmdpdCwgaXMgdGhlcmUKPiBhbnkgb2JqZWN0aW9uPwoKQXMgdGhpcyBjcmVhdGVzIGEgc29t
ZXdoYXQgaGFpcnkgY29uZmxpY3QgZm9yIGFtZGdwdSwgd291bGRuJ3QgaXQgYmUKYSBiZXR0ZXIg
aWRlYSB0byB3YWl0IGEgYml0IGFuZCBhcHBseSBpdCBmaXJzdCB0aGluZyBmb3IgbmV4dCBtZXJn
ZQp3aW5kb3c/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
