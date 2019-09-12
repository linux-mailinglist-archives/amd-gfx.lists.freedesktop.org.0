Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5F4B07D6
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 06:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025DA6EC38;
	Thu, 12 Sep 2019 04:13:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC836E029
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 01:40:19 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k6so14443616wrn.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 18:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I21INLAabi1w/8CE61/bL1ASr0CpEij/1r4e/ZofUs4=;
 b=HIkDEznxBEP4+V2/8JIlqNGJsRF7EYXKdYkDb+1Ccwy8K+rvC204Wi27BAo1A7jr7q
 3dBRIWRMhRBjhhxjYZjerSpakuRLgge/X9Wvb6GVBb4j6M+UPiSjaXparq4hxaqSmSss
 +fsbFGxLttiTLzJVd9ERn8Hp7fq69gtXIocnWSJtBW/ilqOLDucpspljgMJ4sJQXx1Fu
 V97Q3t7dK/iTojr1ku0zWW4lphhLnp0PhaiaCRpolgGBmXfH9CrUCt1yEBV8pEhb9xKp
 MtMn/r6moME1YLu900+Oi7m/ANsQubZCXtEpk0/kUUeJVDfIgCy7MmvzCYEEyO16Ab8D
 K0cQ==
X-Gm-Message-State: APjAAAWguSFTmUTHUttynYosDbKXxdUSmXIAP6vVDpXSz5Vc6MmYw+iM
 Z4QiQKGdhpIX4+m8vNM8qn0VdGkph0Uh0zE+2es=
X-Google-Smtp-Source: APXvYqwDWfK+BEjLaFvOJ2DH3SrFBMvh/dkTKS55mrksQ5WOgzBtlu97dZi5OVuvzcPICrHZBI10HuUZs423wNGG130=
X-Received: by 2002:adf:e342:: with SMTP id n2mr14945053wrj.341.1568252418285; 
 Wed, 11 Sep 2019 18:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190911115001.13864-1-evan.quan@amd.com>
 <20190911115001.13864-2-evan.quan@amd.com>
In-Reply-To: <20190911115001.13864-2-evan.quan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Sep 2019 21:40:05 -0400
Message-ID: <CADnq5_N3tfu2KK2E0bkw2UBrkHeGxW_XxhXWaPqEsyOsn3xhWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: check SMU engine readiness before
 proceeding on S3 resume
To: "Quan, Evan" <Evan.Quan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=I21INLAabi1w/8CE61/bL1ASr0CpEij/1r4e/ZofUs4=;
 b=F1BgHhJ57HaUfDAOX8fy8Gs7FmZ4YvY4E2E5GQm3Rlz8JQcrsFAuk0ZPNLy2UG1pdf
 XB0eJkaSadI8STFdTPqaQyQuIlb6e5x5yDkacrg2U/Gz68w//z6NhF8jd5xOMo1t0SF8
 5R1XYUSuchG0PORHbu5F7m0WfrK4M9G9vo/U23rdUOBKR45dTlEJDDoXUmSmenzcrFjM
 4xNs/Z0tU4rljxAB7Usmpx50kMsASV8XIRTluFcq+1FGh8tnhcDC37R1wkyW0pghYJJj
 1ibzgQQ/wY1jKx7PV0xmmhZ929+nNCmKiaKhDxUmWlyYEB/ZvMO0cJChL6PErVBUx3gV
 jesw==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Ma, Le" <Le.Ma@amd.com>,
 "Gui, Jack" <Jack.Gui@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzOgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgoKT24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgNzo1MCBBTSBRdWFuLCBFdmFuIDxFdmFu
LlF1YW5AYW1kLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGlzIGVzcGVjaWFsbHkgbmVlZGVkIGZvciBu
b24tcHNwIGxvYWRpbmcgd2F5Lgo+Cj4gQ2hhbmdlLUlkOiBJMWU1MjMxNjhlZDQ4OTJjMzRjOGNi
YjY2MDc3YzNmOTI4OGRkODAwNgo+IFNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFu
QGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYyB8IDI4ICsrKysrKysrKysrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jCj4gaW5kZXggMjVmM2M5ZTFiNDA0Li45NTk2OWM5OGExMDggMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCj4gQEAgLTEy
MTMsMTEgKzEyMTMsMTAgQEAgc3RhdGljIGludCBzbXVfZnJlZV9tZW1vcnlfcG9vbChzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSkKPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPgo+IC1zdGF0aWMg
aW50IHNtdV9od19pbml0KHZvaWQgKmhhbmRsZSkKPiArc3RhdGljIGludCBzbXVfc3RhcnRfc21j
X2VuZ2luZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKPiAgewo+IC0gICAgICAgaW50IHJldDsK
PiAtICAgICAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2
aWNlICopaGFuZGxlOwo+IC0gICAgICAgc3RydWN0IHNtdV9jb250ZXh0ICpzbXUgPSAmYWRldi0+
c211Owo+ICsgICAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBzbXUtPmFkZXY7Cj4g
KyAgICAgICBpbnQgcmV0ID0gMDsKPgo+ICAgICAgICAgaWYgKGFkZXYtPmZpcm13YXJlLmxvYWRf
dHlwZSAhPSBBTURHUFVfRldfTE9BRF9QU1ApIHsKPiAgICAgICAgICAgICAgICAgaWYgKGFkZXYt
PmFzaWNfdHlwZSA8IENISVBfTkFWSTEwKSB7Cj4gQEAgLTEyMjgsOCArMTIyNywyMSBAQCBzdGF0
aWMgaW50IHNtdV9od19pbml0KHZvaWQgKmhhbmRsZSkKPiAgICAgICAgIH0KPgo+ICAgICAgICAg
cmV0ID0gc211X2NoZWNrX2Z3X3N0YXR1cyhzbXUpOwo+ICsgICAgICAgaWYgKHJldCkKPiArICAg
ICAgICAgICAgICAgcHJfZXJyKCJTTUMgaXMgbm90IHJlYWR5XG4iKTsKPiArCj4gKyAgICAgICBy
ZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IHNtdV9od19pbml0KHZvaWQgKmhhbmRs
ZSkKPiArewo+ICsgICAgICAgaW50IHJldDsKPiArICAgICAgIHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwo+ICsgICAgICAgc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUgPSAmYWRldi0+c211Owo+ICsKPiArICAgICAgIHJldCA9IHNtdV9z
dGFydF9zbWNfZW5naW5lKHNtdSk7Cj4gICAgICAgICBpZiAocmV0KSB7Cj4gLSAgICAgICAgICAg
ICAgIHByX2VycigiU01DIGZpcm13YXJlIHN0YXR1cyBpcyBub3QgY29ycmVjdFxuIik7Cj4gKyAg
ICAgICAgICAgICAgIHByX2VycigiU01VIGlzIG5vdCByZWFkeSB5ZXQhXG4iKTsKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsKPiAgICAgICAgIH0KPgo+IEBAIC0xMzg5LDYgKzE0MDEsMTIg
QEAgc3RhdGljIGludCBzbXVfcmVzdW1lKHZvaWQgKmhhbmRsZSkKPgo+ICAgICAgICAgbXV0ZXhf
bG9jaygmc211LT5tdXRleCk7Cj4KPiArICAgICAgIHJldCA9IHNtdV9zdGFydF9zbWNfZW5naW5l
KHNtdSk7Cj4gKyAgICAgICBpZiAocmV0KSB7Cj4gKyAgICAgICAgICAgICAgIHByX2VycigiU01V
IGlzIG5vdCByZWFkeSB5ZXQhXG4iKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAr
ICAgICAgIH0KPiArCj4gICAgICAgICByZXQgPSBzbXVfc21jX3RhYmxlX2h3X2luaXQoc211LCBm
YWxzZSk7Cj4gICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICBnb3RvIGZhaWxlZDsK
PiAtLQo+IDIuMjMuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
