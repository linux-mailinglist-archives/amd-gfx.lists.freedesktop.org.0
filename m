Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7866A0CD
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 05:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3258E6E088;
	Tue, 16 Jul 2019 03:29:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767786E088
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 03:29:48 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c2so16011506wrm.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 20:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8sxTFWOg0AmpMsXl0+q9hCtsoS09U6K6bPfLEHVZPiI=;
 b=ch12SRGE4YKNgYTVGNI+w91WV50VQ4xIOT9Z3g4UDTC2BU34b2Rj2Z2cpTEwQM7abe
 5XeLNb+B/NpKRV8z8KnV2F+WP+dX+496HdcRWfB0hy29r71BHbWR55X+UFvnet6XY17G
 kvKCoTI+w5clYbHFy61PcLUG+RxMDPb0ZcVjpwJWtruTEAhM7+yVdHWX8bIiFDIeMK/D
 iy2yB71qRQCzjHjIsnVBCDPukrVWfpg1OYGFyQDKVBlolrYbJMW1NJ9dybhnkp88LfC4
 mbtOSLJ1YUMlslYZ/ATZfjzmomDFvUkZsZv/Gomfx4Z5GQeorWxNHIefWkfMDixNvSPk
 F/Og==
X-Gm-Message-State: APjAAAW/r1IcCEE7kdzsKXK/XvAK1Q5l/T2PpmPxb/dEmXdHlYNjdbWW
 ete8sXf0tt4YrhpR6iK0nUFEhwTnZSoqWkP9w5X7qlwQ
X-Google-Smtp-Source: APXvYqzaUSC+PrvI9wihAJA1I5fcggCbuFGU9hRZuDsOzc64gMvK90NZxWf3iVP0uJhv/s3F0GMS7GYn9qPy13m3vu4=
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr34023604wrn.142.1563247787082; 
 Mon, 15 Jul 2019 20:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190712052242.20369-1-evan.quan@amd.com>
In-Reply-To: <20190712052242.20369-1-evan.quan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Jul 2019 23:29:35 -0400
Message-ID: <CADnq5_NeEeGk4VxLJQqo37zpHGKgcnyYzvV7etB8q5OQg6V63g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: fix memory allocation failure check V2
To: Evan Quan <evan.quan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8sxTFWOg0AmpMsXl0+q9hCtsoS09U6K6bPfLEHVZPiI=;
 b=WVVB+k4eSzXN3EkXGTUTLcosFfT2rh67Mgoo1eTTPS06zbCyY1ZtU8yb5v3FJmL3aq
 7usCZgCIOYRiPW3JeNsZL0IPSb57u9DD9+fvNPi66Lt0qJJfPPIjMu5vVq5FnSeUi4nh
 bJ/yGVRuOl+ViFIR/9S/wt8vS/Vx/WSyKG/nRfaW3/K91B/rQ5MamIUTWrdc28DZwiBg
 z8B/q1bMn7oqVn9pHTDf9BCnbGxj8d6XUEhWUfwLKxXFQg3tdabeVysf7Ru7GGgacBRs
 osG4xTq6VH5Y/LpfvvcsWMJF0/xyfuJWW6l8y67UeCtSUZqguOCSTXo1FX6HInmaKKH4
 k4dA==
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

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgMToyMiBBTSBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQu
Y29tPiB3cm90ZToKPgo+IEZpeCBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsdXJlIGNoZWNrLgo+Cj4g
LSBWMjogZml4IG9uZSBtb3JlIHNpbWlsYXIgZXJyb3IKPgo+IENoYW5nZS1JZDogSTAxMmIwODJh
N2EyYjkyOTczYTc2ZGI4MDI5ODk3ZmI0YTM0NDE2OTQKPiBTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1
YW4gPGV2YW4ucXVhbkBhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3ZlZ2EyMF9wcHQuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Zl
Z2EyMF9wcHQuYwo+IGluZGV4IDFmYzM2NzMwN2FjMC4uYzgyNmU2NTQzMGI2IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwo+IEBAIC0zMTksNyArMzE5
LDcgQEAgc3RhdGljIGludCB2ZWdhMjBfdGFibGVzX2luaXQoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUsIHN0cnVjdCBzbXVfdGFibGUgKnRhYmxlcykKPiAgICAgICAgICAgICAgICAgICAgICAgIEFN
REdQVV9HRU1fRE9NQUlOX1ZSQU0pOwo+Cj4gICAgICAgICBzbXVfdGFibGUtPm1ldHJpY3NfdGFi
bGUgPSBremFsbG9jKHNpemVvZihTbXVNZXRyaWNzX3QpLCBHRlBfS0VSTkVMKTsKPiAtICAgICAg
IGlmIChzbXVfdGFibGUtPm1ldHJpY3NfdGFibGUpCj4gKyAgICAgICBpZiAoIXNtdV90YWJsZS0+
bWV0cmljc190YWJsZSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gICAgICAg
ICBzbXVfdGFibGUtPm1ldHJpY3NfdGltZSA9IDA7Cj4KPiBAQCAtMTUwMiw3ICsxNTAyLDcgQEAg
c3RhdGljIGludCB2ZWdhMjBfc2V0X2RlZmF1bHRfb2Q4X3NldHR0aW5ncyhzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSkKPgo+ICAgICAgICAgb2Q4X3NldHRpbmdzID0ga3phbGxvYyhzaXplb2Yoc3Ry
dWN0IHZlZ2EyMF9vZDhfc2V0dGluZ3MpLCBHRlBfS0VSTkVMKTsKPgo+IC0gICAgICAgaWYgKG9k
OF9zZXR0aW5ncykKPiArICAgICAgIGlmICghb2Q4X3NldHRpbmdzKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVOT01FTTsKPgo+ICAgICAgICAgc211LT5vZF9zZXR0aW5ncyA9ICh2b2lkICop
b2Q4X3NldHRpbmdzOwo+IC0tCj4gMi4yMS4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
