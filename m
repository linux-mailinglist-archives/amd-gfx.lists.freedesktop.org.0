Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 856B3EEA4
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 03:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4718936B;
	Tue, 30 Apr 2019 01:59:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C028936B
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 01:59:38 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y197so1858576wmd.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 18:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8prQ4jezfBceQxDAaD4jbgJJEfPfjRAH59lF6L9phDM=;
 b=Jx3DwBdyjkiZsV9XZK8bdaOj9/OgNyTZXBdnJmkVnRLQPA1vf6KLM4npsIeTMxV+kU
 WTb4NbWi5cOoIgEXycOBLHXss90VfOplrAG2AGP8IXJI5aRJFezGQIi+aZI+fRgpCUuo
 ic5ElQIeF8VM9vmQ1Qk9ypGUrCPL+CjMDUPvY/8r0aYdzBP3FSW0Wh9ArrY9xsI3YN/k
 p9i2j8n7GCWmFN5ns8lT8ZVJ1OKCtYeTUmrlAYiXDZA2aQyRQyGSkJa6SklAbbhi/x1m
 hYoaNDW0o/kqmXCegMe2oNqhk7KG3ar/tPFll5PA6OJjNFG16EhKXfC5vzVe73hFGghy
 5uDQ==
X-Gm-Message-State: APjAAAXiIBODXIJ/u88b2PDyesP3DLAkDjCuwqTKJB28GF77XIowzPWQ
 WobpO4N9mTasU2WG6hGE1Y3SQDbIyunmpBgTioU=
X-Google-Smtp-Source: APXvYqwkym+mIRV/0latbCPWEWkBoC0IdROWKR6kogosG+Z+uGrUokK5mk6XXeIdJaaKFS3ZOMS7U0ycJGcEeBq47pg=
X-Received: by 2002:a1c:2e89:: with SMTP id u131mr1308179wmu.82.1556589577607; 
 Mon, 29 Apr 2019 18:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <1556589516-20360-1-git-send-email-aaron.liu@amd.com>
In-Reply-To: <1556589516-20360-1-git-send-email-aaron.liu@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Apr 2019 21:59:25 -0400
Message-ID: <CADnq5_PFEb1uFFbNLggXCznR7OVfN4wxFwZgdYSaztKZZT0xOw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove ATPX_DGPU_REQ_POWER_FOR_DISPLAYS check
 when hotplug-in
To: Aaron Liu <aaron.liu@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8prQ4jezfBceQxDAaD4jbgJJEfPfjRAH59lF6L9phDM=;
 b=YIU9F+2D3nJicTsxfguu2RU6TC0RfSAjtdCQJ3FCimxP1j+KwtRu1Ol9zAF49oMb0f
 gVk/T6b2+yaUdswj9IYXmkmuciOwgyfjZPDPFtAusro6R0pJy4evaG30Q1ZQggbAdWSg
 ucXfTuZTUTrWFv0otCMKc799FjRcSVH45QyQ9fKS8uq/ruCgj/6wXOcBp6Bru3rfgvvt
 f4919Gf+6y3VucnDKvaWkh9Oow8KspXFcZPG6+K5sjGHGTuSs06RoctULvl2EKXskU5k
 ZEtOEfprxiYo7ylbWc7o8D/bhCjtNsbEF7XmN6/zJw6ck9EkZ1UKuUyjI56/YSB5Ga1y
 T28Q==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgOTo1OCBQTSBBYXJvbiBMaXUgPGFhcm9uLmxpdUBhbWQu
Y29tPiB3cm90ZToKPgo+IEluIGFtZGdwdV9hdGlmX2hhbmRsZXIsIHdoZW4gaG90cGx1ZyBldmVu
dCByZWNlaXZlZCwgcmVtb3ZlCj4gQVRQWF9ER1BVX1JFUV9QT1dFUl9GT1JfRElTUExBWVMgY2hl
Y2suIFRoaXMgYml0J3MgY2hlY2sgd2lsbCBjYXVzZSBtaXNzaW5nCj4gc3lzdGVtIHJlc3VtZS4K
Pgo+IENoYW5nZS1JZDogSWM5YTU1ZmQ0NGI3MjFlNTkzNDhhNzc2OGRhZWI0MWQ0MTRmMjEzNjYK
PiBTaWduZWQtb2ZmLWJ5OiBBYXJvbiBMaXUgPGFhcm9uLmxpdUBhbWQuY29tPgoKUmV2aWV3ZWQt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3BpLmMgfCAzICstLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FjcGkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3BpLmMKPiBpbmRleCA0Mzc2YjE3Li41NmY4Y2EyIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3BpLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwaS5jCj4gQEAgLTQ2NCw4ICs0
NjQsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9hdGlmX2hhbmRsZXIoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICB9
Cj4gICAgICAgICAgICAgICAgIGlmIChyZXEucGVuZGluZyAmIEFUSUZfREdQVV9ESVNQTEFZX0VW
RU5UKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKChhZGV2LT5mbGFncyAmIEFNRF9J
U19QWCkgJiYKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X2F0cHhfZGdwdV9y
ZXFfcG93ZXJfZm9yX2Rpc3BsYXlzKCkpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAo
YWRldi0+ZmxhZ3MgJiBBTURfSVNfUFgpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBtX3J1bnRpbWVfZ2V0X3N5bmMoYWRldi0+ZGRldi0+ZGV2KTsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC8qIEp1c3QgZmlyZSBvZmYgYSB1ZXZlbnQgYW5kIGxldCB1c2Vy
c3BhY2UgdGVsbCB1cyB3aGF0IHRvIGRvICovCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBkcm1faGVscGVyX2hwZF9pcnFfZXZlbnQoYWRldi0+ZGRldik7Cj4gLS0KPiAyLjcuNAo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQt
Z2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
