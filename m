Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE829F26D
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 20:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482C589B51;
	Tue, 27 Aug 2019 18:35:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0EA89B51
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 18:35:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id i63so127051wmg.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 11:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L6jFvr0V4xkPL7jvnWXOJ9yF2KXADvhxs3mP2Zn6UjU=;
 b=KRMb1kfRQu0vAs1LXRRy1rfa3OdDWYnDY5MUpL65Nx53/c8Ev+TFksZ23A76Oh9AAX
 lQk+2hSkRHAmiA2j76PxDn/fXdNyJKN5zb5vJTKden1hjH/d0Bxhxf6SLdjmZFdqD1Yt
 xH5338T4ERKLbT49Tt8YSFQoS7sBeVWPcgaeO/M8wGTtYvgis+sTXiF9aSLgyn64MXxu
 DMhCsi+/ZOb3dYU/yvaGeP8wBw0cBDfmJuROOj59RKhLzVg3uH88dtjVYbVApWB9cAh+
 i9CSauCnJF8LpCEjrV0JKbgHSBHppFbLOMk2ahyHZiw66Q9fHbdD2zdFkfYUl0x4RP+q
 yDRg==
X-Gm-Message-State: APjAAAX2BrYb7KtDbuhi4RM1pWvX4g1bxHp0+wgml9iVROxdwbtzbQXD
 XKXTv1cwamd/OGttoiQdov6Ww61/u1ggGAmnh84=
X-Google-Smtp-Source: APXvYqwd3w6f3r3TC8C8ZgV/uRtiORODTsi700u54wh4hCaHSVX1r67HOScKzt9jCLwuZmJpvbES5dapRuN/DG40qe4=
X-Received: by 2002:a05:600c:352:: with SMTP id
 u18mr350018wmd.141.1566930940034; 
 Tue, 27 Aug 2019 11:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190827071941.23862-1-xiaojie.yuan@amd.com>
 <20190827071941.23862-3-xiaojie.yuan@amd.com>
In-Reply-To: <20190827071941.23862-3-xiaojie.yuan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Aug 2019 14:35:28 -0400
Message-ID: <CADnq5_NX5G5s4fpLTYYaTuqK=j3Um4z5RQsCZZ_6gQaKyG4GAw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amd/powerplay: enable jpeg powergating for navi1x
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=L6jFvr0V4xkPL7jvnWXOJ9yF2KXADvhxs3mP2Zn6UjU=;
 b=rz11hwe0lQ7JNgYwO5HXSKzfMLhJ+08lV+vPTht4POP129JSFnYWjagaEux6aW4C+z
 iabbMRBdITQbkVvfMhgCenqBoXmtoaBy64Lg5DUFNn/GMB7fBXiIM00LEIGv3Zs/9LU9
 tnTocJ/QxV6KR5f/YD5pLkR62JsJPV0IWgRcDZckVI4AC6k6tj8OdkPiNfG3EHNha4P4
 b+vdHG3Ej/zCanFEgjlkQwzusiI2PYhlaSG305NG/O7qjz5nWW3z5yU3L07OHY4QGO5T
 0WG5tZtLtrlqPf+G6wKJdDUkdQFN5PrgomzUcDaEH0BVPWuInz4j19RzMjL4VUfpitkk
 reow==
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzOgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgoKT24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMzoyMCBBTSBZdWFuLCBYaWFvamllIDxY
aWFvamllLll1YW5AYW1kLmNvbT4gd3JvdGU6Cj4KPiBqcGVnIHBnIGRlcGVuZHMgb24gdmNuIHBn
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCAzICsr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4gaW5kZXggMmQ5MDhh
ZmJmNTI1Li4xOTcwODQzZjIyNWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvbmF2aTEwX3BwdC5jCj4gQEAgLTM2OCw3ICszNjgsOCBAQCBuYXZpMTBfZ2V0X2FsbG93ZWRf
ZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAo+ICAgICAgICAgICAgICAgICAq
KHVpbnQ2NF90ICopZmVhdHVyZV9tYXNrIHw9IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0FUSFVCX1BH
X0JJVCk7Cj4KPiAgICAgICAgIGlmIChzbXUtPmFkZXYtPnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBP
UlRfVkNOKQo+IC0gICAgICAgICAgICAgICAqKHVpbnQ2NF90ICopZmVhdHVyZV9tYXNrIHw9IEZF
QVRVUkVfTUFTSyhGRUFUVVJFX1ZDTl9QR19CSVQpOwo+ICsgICAgICAgICAgICAgICAqKHVpbnQ2
NF90ICopZmVhdHVyZV9tYXNrIHw9IEZFQVRVUkVfTUFTSyhGRUFUVVJFX1ZDTl9QR19CSVQpCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0pQ
RUdfUEdfQklUKTsKPgo+ICAgICAgICAgLyogZGlzYWJsZSBEUE0gVUNMSyBhbmQgRFMgU09DQ0xL
IG9uIG5hdmkxMCBBMCBzZWN1cmUgYm9hcmQgKi8KPiAgICAgICAgIGlmIChpc19hc2ljX3NlY3Vy
ZShzbXUpKSB7Cj4gLS0KPiAyLjIwLjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
