Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 314987A97F
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 15:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647C36E500;
	Tue, 30 Jul 2019 13:28:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444BE6E4F0;
 Tue, 30 Jul 2019 13:10:41 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 98FD768AFE; Tue, 30 Jul 2019 15:10:38 +0200 (CEST)
Date: Tue, 30 Jul 2019 15:10:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 03/13] nouveau: pass struct nouveau_svmm to
 nouveau_range_fault
Message-ID: <20190730131038.GB4566@lst.de>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-4-hch@lst.de> <20190730123554.GD24038@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730123554.GD24038@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Tue, 30 Jul 2019 13:28:39 +0000
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMTI6MzU6NTlQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFR1ZSwgSnVsIDMwLCAyMDE5IGF0IDA4OjUxOjUzQU0gKzAzMDAsIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gVGhpcyBhdm9pZCBoYXZpbmcgdG8gYWJ1c2UgdGhlIHZt
YSBmaWVsZCBpbiBzdHJ1Y3QgaG1tX3JhbmdlIHRvIHVubG9jawo+ID4gdGhlIG1tYXBfc2VtLgo+
IAo+IEkgdGhpbmsgdGhlIGNoYW5nZSBpbnNpZGUgaG1tX3JhbmdlX2ZhdWx0IGdvdCBsb3N0IG9u
IHJlYmFzZSwgaXQgaXMKPiBub3cgdXNpbmc6Cj4gCj4gICAgICAgICAgICAgICAgIHVwX3JlYWQo
JnJhbmdlLT5obW0tPm1tLT5tbWFwX3NlbSk7Cj4gCj4gQnV0LCB5ZXMsIGxldHMgY2hhbmdlIGl0
IHRvIHVzZSBzdm1tLT5tbSBhbmQgdHJ5IHRvIGtlZXAgc3RydWN0IGhtbQo+IG9wYXF1ZSB0byBk
cml2ZXJzCgpJdCBnb3QgbG9zdCBzb21ld2hhdCBpbnRlbnRpb25hbGx5IGFzIEkgZGlkbid0IHdh
bnQgdGhlIGNodXJuLCBidXQgSQpmb3Jnb3QgdG8gdXBkYXRlIHRoZSBjaGFuZ2Vsb2cuICBCdXQg
aWYgeW91IGFyZSBmaW5lIHdpdGggY2hhbmdpbmcgaXQKb3ZlciBJIGNhbiBicmluZyBpdCBiYWNr
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
