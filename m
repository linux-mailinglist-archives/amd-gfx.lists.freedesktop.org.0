Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AC15DAB7
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Jul 2019 03:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DBE6E0BA;
	Wed,  3 Jul 2019 01:24:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB246E0A6;
 Wed,  3 Jul 2019 00:03:35 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1A7B468CEC; Wed,  3 Jul 2019 02:03:34 +0200 (CEST)
Date: Wed, 3 Jul 2019 02:03:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
Message-ID: <20190703000333.GA29316@lst.de>
References: <20190608001452.7922-1-rcampbell@nvidia.com>
 <20190702195317.GT31718@mellanox.com> <20190702224912.GA24043@lst.de>
 <20190702225911.GA11833@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702225911.GA11833@mellanox.com>
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

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMTA6NTk6MTZQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+ID4gQXMgdGhpcyBjcmVhdGVzIGEgc29tZXdoYXQgaGFpcnkgY29uZmxpY3QgZm9y
IGFtZGdwdSwgd291bGRuJ3QgaXQgYmUKPiA+IGEgYmV0dGVyIGlkZWEgdG8gd2FpdCBhIGJpdCBh
bmQgYXBwbHkgaXQgZmlyc3QgdGhpbmcgZm9yIG5leHQgbWVyZ2UKPiA+IHdpbmRvdz8KPiAKPiBN
eSB0aGlua2luZyBpcyB0aGF0IEFNRCBHUFUgYWxyZWFkeSBoYXMgYSBtb25zdGVyIGNvbmZsaWN0
IGZyb20gdGhpczoKPiAKPiAgaW50IGhtbV9yYW5nZV9yZWdpc3RlcihzdHJ1Y3QgaG1tX3Jhbmdl
ICpyYW5nZSwKPiAtICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwKPiAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIGVuZCwKPiAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIHBhZ2Vfc2hpZnQpOwoKV2VsbCwgdGhhdCBzZWVtcyBsaWtlIGEgcmVsYXRpdmVseSBlYXN5
IHRvIGZpeCBjb25mbGljdCwgYXQgbGVhc3QgYXMKbG9uZyBhcyB5b3UgaGF2ZSB0aGUgbWlycm9y
IGVhc2lseSBhdmFpbGFibGUuICBUaGUgbm90aWZpZXIgY2hhbmdlCm9uIHRoZSBvdGhlciBoYW5k
IGJhc2ljYWxseSByZXF1aXJlcyByZXdyaXRpbmcgYWJvdXQgdHdvIGRvemVuIGxpbmVzCm9mIGNv
ZGUgZW50aXJlbHkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
