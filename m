Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6365B76784
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 15:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E6D6ED5C;
	Fri, 26 Jul 2019 13:31:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BFD6E887;
 Fri, 26 Jul 2019 06:23:24 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2300068B02; Fri, 26 Jul 2019 08:23:21 +0200 (CEST)
Date: Fri, 26 Jul 2019 08:23:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 2/7] mm/hmm: a few more C style and comment clean ups
Message-ID: <20190726062320.GA22881@lst.de>
References: <20190726005650.2566-1-rcampbell@nvidia.com>
 <20190726005650.2566-3-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726005650.2566-3-rcampbell@nvidia.com>
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

Tm90ZTogaXQgc2VlbXMgbGlrZSB5b3UndmUgb25seSBDQ2VkIG1lIG9uIHBhdGNoZXMgMi03LCBi
dXQgbm90IG9uIHRoZQpjb3ZlciBsZXR0ZXIgYW5kIHBhdGNoIDEuICBJJ2xsIHRyeSB0byBmaW5k
IHRoZW0gbGF0ZXIsIGJ1dCB0byBtYWtlIENjcwp1c2VmdWwgdGhleSBzaG91bGQgbm9ybWFsbHkg
Y292ZXIgdGhlIHdob2xlIHNlcmllcy4KCk90aGVyd2lzZSB0aGlzIGxvb2tzIGZpbmUgdG8gbWU6
CgpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
