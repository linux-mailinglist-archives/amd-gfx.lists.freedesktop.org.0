Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42885394B9C
	for <lists+amd-gfx@lfdr.de>; Sat, 29 May 2021 12:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BE06EB81;
	Sat, 29 May 2021 10:20:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC726E0DB;
 Sat, 29 May 2021 06:40:25 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9D0E068B05; Sat, 29 May 2021 08:40:22 +0200 (CEST)
Date: Sat, 29 May 2021 08:40:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Felix Kuehling <felix.kuehling@gmail.com>
Subject: Re: [RFC PATCH 4/5] mm: add generic type support for device zone
 page migration
Message-ID: <20210529064022.GB15834@lst.de>
References: <20210527230809.3701-1-Felix.Kuehling@amd.com>
 <20210527230809.3701-5-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210527230809.3701-5-Felix.Kuehling@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Sat, 29 May 2021 10:20:31 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Sierra <alex.sierra@amd.com>, felix.kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, jglisse@redhat.com,
 amd-gfx@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 hch@lst.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjcsIDIwMjEgYXQgMDc6MDg6MDhQTSAtMDQwMCwgRmVsaXggS3VlaGxpbmcg
d3JvdGU6Cj4gLQlleHBlY3RlZF9jb3VudCArPSBpc19kZXZpY2VfcHJpdmF0ZV9wYWdlKHBhZ2Up
Owo+ICsJZXhwZWN0ZWRfY291bnQgKz0KPiArCQkJKGlzX2RldmljZV9wcml2YXRlX3BhZ2UocGFn
ZSkgfHwgaXNfZGV2aWNlX2dlbmVyaWNfcGFnZShwYWdlKSk7CgpQbGVhc2UgYXZvaWQgdGhlIGNv
bXBsZXRlbHkgdW5yZWFkYWJsZSBvdmVybHkgbG9uZyBsaW5lcy4gIEFuZCBnaXZlbgpob3cgb2Z0
44G4biB0aGlzIGNoZWNrIGlzIGR1cGxpY2F0ZWQgeW91IHByb2JhYmx5IHJlYWxseSB3YW50IGEg
aGVscGVyLgpBbmQgcHJvcGVybHkgZG9jdW1lbnQgaXQgd2hpbGUgeW91J3JlIGF0IGl0LgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
