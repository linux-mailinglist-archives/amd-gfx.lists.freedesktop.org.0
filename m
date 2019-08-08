Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A06386651
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 17:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799C16E88D;
	Thu,  8 Aug 2019 15:57:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A456E819;
 Thu,  8 Aug 2019 10:24:55 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3F93F227A81; Thu,  8 Aug 2019 12:24:52 +0200 (CEST)
Date: Thu, 8 Aug 2019 12:24:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 01/11] mm/mmu_notifiers: hoist
 do_mmu_notifier_register down_write to the caller
Message-ID: <20190808102452.GA648@lst.de>
References: <20190806231548.25242-1-jgg@ziepe.ca>
 <20190806231548.25242-2-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806231548.25242-2-jgg@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 08 Aug 2019 15:56:59 +0000
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
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Dimitri Sivanich <sivanich@sgi.com>,
 Gavin Shan <shangw@linux.vnet.ibm.com>, Andrea Righi <andrea@betterlinux.com>,
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@mellanox.com>, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDg6MTU6MzhQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBU
aGlzIHNpbXBsaWZpZXMgdGhlIGNvZGUgdG8gbm90IGhhdmUgc28gbWFueSBvbmUgbGluZSBmdW5j
dGlvbnMgYW5kIGV4dHJhCj4gbG9naWMuIF9fbW11X25vdGlmaWVyX3JlZ2lzdGVyKCkgc2ltcGx5
IGJlY29tZXMgdGhlIGVudHJ5IHBvaW50IHRvCj4gcmVnaXN0ZXIgdGhlIG5vdGlmaWVyLCBhbmQg
dGhlIG90aGVyIG9uZSBjYWxscyBpdCB1bmRlciBsb2NrLgo+IAo+IEFsc28gYWRkIGEgbG9ja2Rl
cF9hc3NlcnQgdG8gY2hlY2sgdGhhdCB0aGUgY2FsbGVycyBhcmUgaG9sZGluZyB0aGUgbG9jawo+
IGFzIGV4cGVjdGVkLgo+IAo+IFN1Z2dlc3RlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBp
bmZyYWRlYWQub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxh
bm94LmNvbT4KCkxvb2tzIGdvb2Q6CgpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhj
aEBsc3QuZGU+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
