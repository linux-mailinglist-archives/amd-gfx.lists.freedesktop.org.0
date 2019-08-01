Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 629147E1E0
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 20:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262716E760;
	Thu,  1 Aug 2019 18:01:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DA56E3AC;
 Thu,  1 Aug 2019 07:01:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8C39E68AFE; Thu,  1 Aug 2019 09:01:51 +0200 (CEST)
Date: Thu, 1 Aug 2019 09:01:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 11/13] mm: cleanup the hmm_vma_handle_pmd stub
Message-ID: <20190801070151.GB15404@lst.de>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-12-hch@lst.de> <20190730175309.GN24038@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730175309.GN24038@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 01 Aug 2019 18:00:57 +0000
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

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDU6NTM6MTRQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+ID4gLQkvKiBJZiBUSFAgaXMgbm90IGVuYWJsZWQgdGhlbiB3ZSBzaG91bGQgbmV2
ZXIgcmVhY2ggdGhpcyAKPiAKPiBUaGlzIG9sZCBjb21tZW50IHNheXMgd2Ugc2hvdWxkIG5ldmVy
IGdldCBoZXJlCj4gCj4gPiArfQo+ID4gKyNlbHNlIC8qIENPTkZJR19UUkFOU1BBUkVOVF9IVUdF
UEFHRSAqLwo+ID4gK3N0YXRpYyBpbnQgaG1tX3ZtYV9oYW5kbGVfcG1kKHN0cnVjdCBtbV93YWxr
ICp3YWxrLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gPiArCQl1bnNpZ25lZCBsb25nIGVuZCwgdWlu
dDY0X3QgKnBmbnMsIHBtZF90IHBtZCkKPiA+ICt7Cj4gPiAgCXJldHVybiAtRUlOVkFMOwo+IAo+
IFNvIGNvdWxkIHdlIGp1c3QgZG8KPiAgICAjZGVmaW5lIGhtbV92bWFfaGFuZGxlX3BtZCBOVUxM
Cj4gCj4gPwo+IAo+IEF0IHRoZSB2ZXJ5IGxlYXN0IHRoaXMgc2VlbXMgbGlrZSBhIFdBUk5fT04g
dG9vPwoKRGVzcGl0ZSB0aGUgbmFtZSBvZiB0aGUgZnVuY3Rpb24gaG1tX3ZtYV9oYW5kbGVfcG1k
IGlzIG5vdCBhIGNhbGxiYWNrCmZvciB0aGUgcGFnZXdhbGssIGJ1dCBhY3R1YWxseSBjYWxsZWQg
ZnJvbSBobW1fdm1hX2hhbmRsZV9wbWQuCgpXaGF0IHdlIGNvdWxkIHRyeSBpcyBqdXN0IGFuZCBl
bXB0eSBub24taW5saW5lIHByb3RvdHlwZSB3aXRob3V0IGFuCmFjdHVhbCBpbXBsZW1lbnRhdGlv
biwgd2hpY2ggbWVhbnMgaWYgdGhlIGNvbXBpbGVyIGRvZXNuJ3Qgb3B0aW1pemUKdGhlIGNhbGxz
IGF3YXkgd2UnbGwgZ2V0IGEgbGluayBlcnJvci4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
