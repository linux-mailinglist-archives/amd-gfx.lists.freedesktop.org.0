Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A83AD76787
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 15:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941226ED61;
	Fri, 26 Jul 2019 13:31:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9336E85F;
 Fri, 26 Jul 2019 06:24:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 75E5C68BFE; Fri, 26 Jul 2019 08:24:37 +0200 (CEST)
Date: Fri, 26 Jul 2019 08:24:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 6/7] mm/hmm: remove hugetlbfs check in hmm_vma_walk_pmd
Message-ID: <20190726062437.GC22881@lst.de>
References: <20190726005650.2566-1-rcampbell@nvidia.com>
 <20190726005650.2566-7-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726005650.2566-7-rcampbell@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Fri, 26 Jul 2019 13:31:49 +0000
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
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDU6NTY6NDlQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gd2Fsa19wYWdlX3JhbmdlKCkgd2lsbCBvbmx5IGNhbGwgaG1tX3ZtYV93YWxrX2h1
Z2V0bGJfZW50cnkoKSBmb3IKPiBodWdldGxiZnMgcGFnZXMgYW5kIGRvZXNuJ3QgY2FsbCBobW1f
dm1hX3dhbGtfcG1kKCkgaW4gdGhpcyBjYXNlLgo+IFRoZXJlZm9yZSwgaXQgaXMgc2FmZSB0byBy
ZW1vdmUgdGhlIGNoZWNrIGZvciB2bWEtPnZtX2ZsYWdzICYgVk1fSFVHRVRMQgo+IGluIGhtbV92
bWFfd2Fsa19wbWQoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBi
ZWxsQG52aWRpYS5jb20+CgpMb29rcyBnb29kLAoKUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxs
d2lnIDxoY2hAbHN0LmRlPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
