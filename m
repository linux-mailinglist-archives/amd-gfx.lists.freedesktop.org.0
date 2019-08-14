Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE5E8D536
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 15:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F4E88F93;
	Wed, 14 Aug 2019 13:44:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB4B6E285;
 Wed, 14 Aug 2019 07:39:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 17B9F68B20; Wed, 14 Aug 2019 09:38:55 +0200 (CEST)
Date: Wed, 14 Aug 2019 09:38:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Message-ID: <20190814073854.GA27249@lst.de>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-5-hch@lst.de> <20190807174548.GJ1571@mellanox.com>
 <CAPcyv4hPCuHBLhSJgZZEh0CbuuJNPLFDA3f-79FX5uVOO0yubA@mail.gmail.com>
 <20190808065933.GA29382@lst.de>
 <CAPcyv4hMUzw8vyXFRPe2pdwef0npbMm9tx9wiZ9MWkHGhH1V6w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4hMUzw8vyXFRPe2pdwef0npbMm9tx9wiZ9MWkHGhH1V6w@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Wed, 14 Aug 2019 13:44:21 +0000
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
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDY6MzY6MzNQTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IFNlY3Rpb24gYWxpZ25tZW50IGNvbnN0cmFpbnRzIHNvbWV3aGF0IHNhdmUgdXMgaGVy
ZS4gVGhlIG9ubHkgZXhhbXBsZQo+IEkgY2FuIHRoaW5rIG9mIGEgUE1EIG5vdCBjb250YWluaW5n
IGEgdW5pZm9ybSBwZ21hcCBhc3NvY2lhdGlvbiBmb3IKPiBlYWNoIHB0ZSBpcyB0aGUgY2FzZSB3
aGVuIHRoZSBwZ21hcCBvdmVybGFwcyBub3JtYWwgZHJhbSwgaS5lLiBzaGFyZXMKPiB0aGUgc2Ft
ZSAnc3RydWN0IG1lbW9yeV9zZWN0aW9uJyBmb3IgYSBnaXZlbiBzcGFuLiBPdGhlcndpc2UsIGRp
c3RpbmN0Cj4gcGdtYXBzIGFycmFuZ2UgdG8gbWFuYWdlIHRoZWlyIG93biBleGNsdXNpdmUgc2Vj
dGlvbnMgKGFuZCBub3cKPiBzdWJzZWN0aW9ucyBhcyBvZiB2NS4zKS4gT3RoZXJ3aXNlIHRoZSBp
bXBsZW1lbnRhdGlvbiBjb3VsZCBub3QKPiBndWFyYW50ZWUgZGlmZmVyZW50IG1hcHBpbmcgbGlm
ZXRpbWVzLgo+IAo+IFRoYXQgc2FpZCwgdGhpcyBzZWVtcyB0byB3YW50IGEgYmV0dGVyIG1lY2hh
bmlzbSB0byBkZXRlcm1pbmUgInBmbiBpcwo+IFpPTkVfREVWSUNFIi4KClNvIEkgZ3Vlc3MgdGhp
cyBwYXRjaCBpcyBmaW5lIGZvciBub3csIGFuZCBvbmNlIHlvdSBwcm92aWRlIGEgYmV0dGVyCm1l
Y2hhbmlzbSB3ZSBjYW4gc3dpdGNoIG92ZXIgdG8gaXQ/Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
