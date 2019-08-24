Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AF39CBA7
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 10:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A0E6E215;
	Mon, 26 Aug 2019 08:33:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0506E0E8;
 Sat, 24 Aug 2019 22:38:00 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5FED368B02; Sun, 25 Aug 2019 00:37:54 +0200 (CEST)
Date: Sun, 25 Aug 2019 00:37:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 1/2] mm/hmm: hmm_range_fault() NULL pointer bug
Message-ID: <20190824223754.GA21891@lst.de>
References: <20190823221753.2514-1-rcampbell@nvidia.com>
 <20190823221753.2514-2-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823221753.2514-2-rcampbell@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 26 Aug 2019 08:33:55 +0000
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMDM6MTc6NTJQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gQWx0aG91Z2ggaG1tX3JhbmdlX2ZhdWx0KCkgY2FsbHMgZmluZF92bWEoKSB0byBt
YWtlIHN1cmUgdGhhdCBhIHZtYSBleGlzdHMKPiBiZWZvcmUgY2FsbGluZyB3YWxrX3BhZ2VfcmFu
Z2UoKSwgaG1tX3ZtYV93YWxrX2hvbGUoKSBjYW4gc3RpbGwgYmUgY2FsbGVkCj4gd2l0aCB3YWxr
LT52bWEgPT0gTlVMTCBpZiB0aGUgc3RhcnQgYW5kIGVuZCBhZGRyZXNzIGFyZSBub3QgY29udGFp
bmVkCj4gd2l0aGluIHRoZSB2bWEgcmFuZ2UuCgpTaG91bGQgd2UgY29udmVydCB0byB3YWxrX3Zt
YV9yYW5nZSBpbnN0ZWFkPyAgT3Iga2VlcCB3YWxrX3BhZ2VfcmFuZ2UKYnV0IGRyb3Agc2VhcmNo
aW5nIHRoZSB2bWEgb3Vyc2VsdmVzPwoKRXhjZXB0IGZvciB0aGF0IHRoZSBwYXRjaCBsb29rcyBn
b29kIHRvIG1lOgoKUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
