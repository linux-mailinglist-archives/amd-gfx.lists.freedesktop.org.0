Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4EEE1F2C
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Oct 2019 17:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2F26EB07;
	Wed, 23 Oct 2019 15:23:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 39B8D6EB07
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Oct 2019 15:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 4768A2A6046;
 Wed, 23 Oct 2019 17:23:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id OqNDKGsWEwjQ; Wed, 23 Oct 2019 17:23:32 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id D78D02A6045;
 Wed, 23 Oct 2019 17:23:32 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92.2)
 (envelope-from <michel@daenzer.net>)
 id 1iNIU0-0000uH-9V; Wed, 23 Oct 2019 17:23:32 +0200
Subject: Re: [PATCH 18/37] drm/amd/display: Allow inverted gamma
To: sunpeng.li@amd.com
References: <20191017191329.11857-1-sunpeng.li@amd.com>
 <20191017191329.11857-19-sunpeng.li@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <82b4b639-d1c7-c26c-cb84-4c41bb16cb41@daenzer.net>
Date: Wed, 23 Oct 2019 17:23:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191017191329.11857-19-sunpeng.li@amd.com>
Content-Language: en-CA
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
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>, Reza Amini <Reza.Amini@amd.com>,
 Aidan Yang <Aidan.Yang@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0xNyA5OjEzIHAubS4sIHN1bnBlbmcubGlAYW1kLmNvbSB3cm90ZToKPiBGcm9t
OiBBaWRhbiBZYW5nIDxBaWRhbi5ZYW5nQGFtZC5jb20+Cj4gCj4gW3doeV0KPiBUaGVyZSdzIGEg
dXNlIGNhc2UgZm9yIGludmVydGVkIGdhbW1hCj4gYW5kIGl0J3MgYmVlbiBjb25maXJtZWQgdGhh
dCBuZWdhdGl2ZSBzbG9wZXMgYXJlIG9rLgo+IAo+IFtob3ddCj4gUmVtb3ZlIGNvZGUgZm9yIGJs
b2NraW5nIG5vbi1tb25vdG9uaWNhbGx5IGluY3JlYXNpbmcgZ2FtbWEKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBaWRhbiBZYW5nIDxBaWRhbi5ZYW5nQGFtZC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtydW5v
c2xhdiBLb3ZhYyA8S3J1bm9zbGF2LktvdmFjQGFtZC5jb20+Cj4gQWNrZWQtYnk6IExlbyBMaSA8
c3VucGVuZy5saUBhbWQuY29tPgo+IEFja2VkLWJ5OiBSZXphIEFtaW5pIDxSZXphLkFtaW5pQGFt
ZC5jb20+CgpEb2VzIHRoaXMgZml4IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvMTEwNjc3
ID8gSWYgc28sIGl0IHNob3VsZCBiZQpyZWZlcmVuY2VkIGluIHRoZSBjb21taXQgbG9nLCBhbmQg
dGhlIHJlcG9ydCByZXNvbHZlZCBvbmNlIHRoaXMgbGFuZHMgaW4KZHJtLW5leHQgb3IgTGludXMn
IHRyZWUuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAg
ICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAg
ICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
