Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E4C8E75
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 18:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CC86E8C2;
	Wed,  2 Oct 2019 16:34:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48946E209;
 Wed,  2 Oct 2019 15:39:41 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id q203so15479407qke.1;
 Wed, 02 Oct 2019 08:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N9xgxObyHlo32PssmGV4PbxM2Gv46DJwY2CihzT//HU=;
 b=R+2/PAN1QgV/VV6SQ3AW9VBgkZLv1MTNuTidsVeVTV+4PNKMS2GPkVyo7K06fVN13R
 eEN27gnoYwNVNMog/cmPs5GVFYM+jAcWdokTWHi639VPs+EKLCF7GWEuMUdj4CPM2ZFe
 AeBEqQLBvP6gwL+XuxmFtLLJTf3nyQwU0ZIx/Iy7+MtaZTEqqvZ7O+x6yK5zLYSabjfr
 s4mQS7OS7MFetx8D4Rm4QHmzmF4HWMOnC8+THvDeCpxDUgZoQqLdxMBzMuyT7CofWNV2
 8MYpfg6vF1zDW1NxKudgOuHfofASZWIYIkTl7HvD4P/8XwkHILGgr4UCxW2qVu6WvimP
 uQyQ==
X-Gm-Message-State: APjAAAXyBk8n7GFVunxuFTHRIWKQLDlCeRP8IxDCllMYUq5sdUfcJCKO
 0ug9NP+GhOa3NBWQVbluHDo8wbI9XZYCNs67o0o7y3SVjv8=
X-Google-Smtp-Source: APXvYqxIIie+ioLh/sY/tvwAt7uW3G9LAGSG/pVeE7kRPGqPrqsGloWfg5qjshHoZxBwIbW08vbocy/QOIw3DfO4kPY=
X-Received: by 2002:ae9:f503:: with SMTP id o3mr4266633qkg.3.1570030780522;
 Wed, 02 Oct 2019 08:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120136.1777161-1-arnd@arndb.de>
 <20191002120136.1777161-5-arnd@arndb.de>
 <CADnq5_PkTwTBbQY9JatZD2_sWjdU5_hK7V2GLfviEvMh_QB12Q@mail.gmail.com>
 <CAK8P3a0KMT437okhobg=Vzi5LRDgUO7L-x35LczBGXE2jYLg2A@mail.gmail.com>
 <CADnq5_PWWndBomBOXTYgmFqo+U8f8d8+OdJ5Ym3+a2mgO5=E0A@mail.gmail.com>
In-Reply-To: <CADnq5_PWWndBomBOXTYgmFqo+U8f8d8+OdJ5Ym3+a2mgO5=E0A@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 2 Oct 2019 17:39:24 +0200
Message-ID: <CAK8P3a05ZSWcw=XUZrLyjMLY7wCHLKhpe+MF9p5P3URWpAcj+A@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/amd/display: fix dcn21 Makefile for clang
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Approved-At: Wed, 02 Oct 2019 16:34:19 +0000
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCA1OjEyIFBNIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJA
Z21haWwuY29tPiB3cm90ZToKPiBPbiBXZWQsIE9jdCAyLCAyMDE5IGF0IDEwOjUxIEFNIEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlOgoKPiA+Cj4gPiBOb3RoaW5nIHNob3VsZCBy
ZWFsbHkgY2hhbmdlIHdpdGggcmVnYXJkcyB0byB0aGUgLW1zc2UgZmxhZyBoZXJlLCBvbmx5Cj4g
PiB0aGUgc3RhY2sgYWxpZ25tZW50IGZsYWcgY2hhbmdlZC4gTWF5YmUgdGhlcmUgd2FzIHNvbWUg
b3RoZXIgY2hhbmdlCj4gPiBpbiB5b3VyIE1ha2VmaWxlIHRoYXQgY29uZmxpY3RzIHdpdGggbXkg
bXkgcGF0Y2g/Cj4KPiBUaGlzIHBhdGNoIG9uIHRvcCBvZiB5b3VycyBzZWVtcyB0byBmaXggaXQg
YW5kIGFsaWducyBiZXR0ZXIgd2l0aCB0aGUKPiBvdGhlciBNYWtlZmlsZXM6Cj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL01ha2VmaWxlCj4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvTWFrZWZpbGUKPiBpbmRleCBlZjY3
M2JmZmMyNDEuLmU3MWYzZWU3NmNkMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjEvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjEvTWFrZWZpbGUKPiBAQCAtOSwxMCArOSwxMCBAQCBlbHNlIGlmbmVxICgk
KGNhbGwgY2Mtb3B0aW9uLCAtbXN0YWNrLWFsaWdubWVudD0xNiksKQo+ICAgICAgICAgY2Nfc3Rh
Y2tfYWxpZ24gOj0gLW1zdGFjay1hbGlnbm1lbnQ9MTYKPiAgZW5kaWYKPgo+IC1DRkxBR1NfJChB
TUREQUxQQVRIKS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5vIDo9IC1taGFyZC1mbG9hdCAtbXNz
ZQo+ICQoY2Nfc3RhY2tfYWxpZ24pCj4gK0NGTEFHU19kY24yMV9yZXNvdXJjZS5vIDo9IC1taGFy
ZC1mbG9hdCAtbXNzZSAkKGNjX3N0YWNrX2FsaWduKQo+Cj4gIGlmZGVmIENPTkZJR19DQ19JU19D
TEFORwo+IC1DRkxBR1NfJChBTUREQUxQQVRIKS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5vICs9
IC1tc3NlMgo+ICtDRkxBR1NfZGNuMjFfcmVzb3VyY2UubyArPSAtbXNzZTIKPiAgZW5kaWYKCk9r
LCBzbyB0aGVyZSBpcyBjbGVhcmx5IGEgZ2xvYmFsIGNoYW5nZSB0aGF0IHdlbnQgaW50byB5b3Vy
IHRyZWUsIG9yCmlzIG1pc3NpbmcgZnJvbSBpdDoKCkkgc2VlIHRoYXQgYXMgb2YgbGludXgtNS40
LXJjMSwgSSBoYXZlIGNvbW1pdCA1NGI4YWU2NmFlMWEgKCJrYnVpbGQ6IGNoYW5nZQogKkZMQUdT
XzxiYXNldGFyZ2V0Pi5vIHRvIHRha2UgdGhlIHBhdGggcmVsYXRpdmUgdG8gJChvYmopIiksIHdo
aWNoIGNoYW5nZWQKYWxsIHRoZXNlIHBhdGggbmFtZXMgdG8gaW5jbHVkZSB0aGUgQU1EREFMUEFU
SC4KCkl0IHNlZW1zIHlvdSBhcmUgZWl0aGVyIG9uIGFuIG9sZGVyIGtlcm5lbCB0aGF0IGRvZXMg
bm90IHlldCBoYXZlIHRoaXMsCm9yIHlvdSBoYXZlIGFwcGxpZWQgYW5vdGhlciBwYXRjaCB0aGF0
IHJldmVydHMgaXQuCgogICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
