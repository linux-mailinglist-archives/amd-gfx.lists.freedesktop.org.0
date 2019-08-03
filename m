Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6112D803F7
	for <lists+amd-gfx@lfdr.de>; Sat,  3 Aug 2019 04:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEE86E365;
	Sat,  3 Aug 2019 02:33:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507066E365
 for <amd-gfx@lists.freedesktop.org>; Sat,  3 Aug 2019 02:33:32 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 31so79024479wrm.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 02 Aug 2019 19:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GpRUxgclbnBvJL9t/6URJbloubUdnfEvImHnScNxl4o=;
 b=Egiql1+bbFXvNOT4kfiCFDnghP89ev3VsdTwmXmGUg1u4k14PvWObmJGLJFOnw2RoR
 /Q3TU9acqSfE6BqF0gcAXRrflCM01z7DP29zEO+YjpzdaxM+TymnAcPetVwkDXYm0OAc
 ccJakSkiE5AWS8EKmO/KU0AN6AIWopM+XgC4R0bZAxlvA7K4bj0sjW0OpqJxocoMYg3a
 5ksu1CyDRF8mwL7QWaC+Jsq4/2h487Enjbxm/ZzyAN8jwjHdkWPDGUsadRLUgPqslZyc
 T+rvCVWCAzLrOdbtZovZC463dkmhbDzMKC81gfRLWK2iggYG7HFGD0O/EfjZTH9ZzZ6G
 YG6g==
X-Gm-Message-State: APjAAAWNWfBy9WYsSITpQje3rkz7sw/SLnJatjK1nxkSHo+IUQyGzgmY
 AB0hQ2IabOUaQ05roEU+ogrLv0K/FgtgfZEQU5k=
X-Google-Smtp-Source: APXvYqwS8hWUmDZ5+DZ7QQc+e7Za5Q3OUjOvZPEfTekBBy73z7VXbQAxiEP4tkU/3hIYoDG/cF+2WWh3V3cWjdw75ro=
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr4240885wrn.142.1564799610798; 
 Fri, 02 Aug 2019 19:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <1564779184-22641-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1564779184-22641-1-git-send-email-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 2 Aug 2019 22:33:18 -0400
Message-ID: <CADnq5_PQNkPws5ZerO5Lp9aA_snDYADLK=OmSfb7aQtxq4x44w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix GPU reset crash regression.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=GpRUxgclbnBvJL9t/6URJbloubUdnfEvImHnScNxl4o=;
 b=KVzyf+SPhRvq6kB5eO4q3h2X58ihuZFtq6WpeE5NBSPP7o0hVKThf5taMAAoeSPLBs
 xdm5S1eGgqKI9a1XqcwjzuL4QKq3lH4oyb0DHsJkgCAL1BaoSMhn0VjXkkHVClmkMd1e
 21NVaQyD6gYJrSRB6pXeaQTPnFHzNvccB8+bPAgYspHBOYM0wRHhoXu6erBhe/WAs7Bk
 UinOxjcqFIgIJFShRx7syDRF/iCAOgTt0Ls+jWeuNdOaBNVI4XCLkWayc5+PhBNvn3NW
 Fm0ci7Tsp1JS7CCMhWgOTzmjWDdkzIhBt+UkznAaujHbMFVZJw8ux+cI/K1h38FaiHXe
 BZwQ==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "monk.liu" <Monk.Liu@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMiwgMjAxOSBhdCA0OjUzIFBNIEFuZHJleSBHcm9kem92c2t5CjxhbmRyZXku
Z3JvZHpvdnNreUBhbWQuY29tPiB3cm90ZToKPgo+IGFtZGdwdV9pcF9ibG9jay5zdGF0dXMuaHcg
Zm9yIEdNQyB3YXNuJ3Qgc2V0IHRvCj4gZmFsc2Ugb24gc3VzcGVuZCBkdXJpbmcgR1BVIHJlc2V0
IGFuZCBzbyBvbiByZXN1bWUgZ21jX3Y5XzBfcmVzdW1lCj4gd2Fzbid0IGNhbGxlZC4KPiBDYXVz
ZWQgYnkgJ2RybS9hbWRncHU6IGZpeCBkb3VibGUgdWNvZGUgbG9hZCBieSBQU1AodjMpJwo+Cj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5j
b20+CgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwg
MyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IGluZGV4IDMx
YWJkODguLjY3YTFmNTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jCj4gQEAgLTIyNzAsOSArMjI3MCwxMCBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZp
Y2VfaXBfc3VzcGVuZF9waGFzZTIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGV2LT5tcDFfc3Rh
dGUsIHIpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
cjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGFkZXYtPmlwX2Jsb2Nrc1tpXS5zdGF0dXMuaHcgPSBmYWxzZTsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAg
ICAgICAgICAgIGFkZXYtPmlwX2Jsb2Nrc1tpXS5zdGF0dXMuaHcgPSBmYWxzZTsKPiAgICAgICAg
IH0KPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gLS0KPiAyLjcuNAo+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
