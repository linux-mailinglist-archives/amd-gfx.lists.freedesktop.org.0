Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E425FDB3
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 22:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751E66E3E3;
	Thu,  4 Jul 2019 20:15:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.skrimstad.net (mail.skrimstad.net [139.162.145.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38CA6E3E3;
 Thu,  4 Jul 2019 20:15:41 +0000 (UTC)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by mail.skrimstad.net (Postfix) with ESMTPA id 64BC9DF2DA;
 Thu,  4 Jul 2019 20:15:37 +0000 (UTC)
Date: Thu, 4 Jul 2019 22:15:35 +0200
From: Yrjan Skrimstad <yrjan@skrimstad.net>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay/smu7_hwmgr: replace blocking delay
 with non-blocking
Message-ID: <20190704201535.GA21911@obi-wan>
References: <20190530000819.GA25416@obi-wan> <20190604202149.GA20116@obi-wan>
 <CADnq5_OqVSz7Vfo0zP88i=wJur=wtz6Jd99ZTiQSbFNBcc3j7w@mail.gmail.com>
 <20190616144309.GA8174@obi-wan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190616144309.GA8174@obi-wan>
X-Spamd-Bar: /
X-Mailman-Original-Authentication-Results: mail.skrimstad.net;
 auth=pass smtp.auth=yrjan@skrimstad.net smtp.mailfrom=yrjan@skrimstad.net
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMTYsIDIwMTkgYXQgMDQ6NDM6MTBQTSArMDIwMCwgWXJqYW4gU2tyaW1zdGFk
IHdyb3RlOgo+IFRoYXQgaXMgYW4gaW50ZXJlc3Rpbmcgb2JzZXJ2YXRpb24gdG8gbWUuIEkgYW0g
YWN0dWFsbHkgcnVubmluZwo+IGxtLXNlbnNvcnMsIGFsdGhvdWdoIG9ubHkgZXZlcnkgMTUgc2Vj
b25kcy4gSSBzdXBwb3NlIHRoYXQgdGhpcyBtaWdodAo+IGJlIHRoZSByZWFzb24gdGhpcyBoYXBw
ZW5zIHRvIG1lLgoKVGhvdWdoIEkgZG9uJ3QgdGhpbmsgdGhpcyBzaG91bGQgcmVhc29uYWJseSBj
YXVzZSBwcm9ibGVtcyB3aXRoIHRoZQpzeXN0ZW0sIGV2ZW4gaWYgaXQgZG9lcyBoZXJlLiBJcyB0
aGVyZSBhbiB1cGRhdGUgb24gdGhlIHN0YXR1cyBvZiB0aGlzCnBhdGNoPwoKLSBZcmphbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
