Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2AC71F8D
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734C76E386;
	Tue, 23 Jul 2019 18:48:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C888C6E288;
 Tue, 23 Jul 2019 18:48:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c2so41062716wrm.8;
 Tue, 23 Jul 2019 11:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LIXup0fVFWNf86/DVnHha31m2DWJ3Zw6X12AGN8eLZA=;
 b=fzwwFcjRMQutPQeYCPRVh4g4RdxOmO+cKVDHaM9s8A/7PXEUalBztwJQSCjojkQ+ZF
 7y0bAF9YvD1bFjRXFK4wcYocb+aisiYcdJSrXvMrlf3BiRacPJODfDI8rhrjLjyFxHQ+
 DCPd0i6ckWkbYWrCRmNF2EO6Bmbv/HV+damGlCD6B6Hrn2q/z6v0YUkMssmYXVrTb5CN
 e/C4KNpomrWuAXRpxbMAVYkKgBv7YR/BEySJwtfKlFBjyxyyX6+L4+VeUIZ5Z0XFtbdy
 RKHKITlvz5wIEd93iPALm2cIwDFJqDRXEWg/mFurLdj09+HJ/NvTcm0RHtSSehMJdoQi
 HFew==
X-Gm-Message-State: APjAAAWxQ1mavrVsKLwmz0hNnrbgV8uK9pyV563dLHNu/J9qlYFXhCpM
 aOA0ersutkvqIgCsGWyZ61KWh9+lvIJb72FptyU=
X-Google-Smtp-Source: APXvYqz1JerMQNiG9+nU4ckH/5uEF5Rq8FAnFBLfDITDfzQH7v2qkrPMy4xlkOiEkhquFMr6Or+LY62Gb/nDkBD/mIE=
X-Received: by 2002:adf:a299:: with SMTP id s25mr75095757wra.74.1563907683302; 
 Tue, 23 Jul 2019 11:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190723090449.27589-1-hslester96@gmail.com>
In-Reply-To: <20190723090449.27589-1-hslester96@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Jul 2019 14:47:52 -0400
Message-ID: <CADnq5_Py-Bj0947A_aj4ORDyg6UA3R5y=3v5FLttzL6nBvixkA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Use dev_get_drvdata where possible
To: Chuhong Yuan <hslester96@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LIXup0fVFWNf86/DVnHha31m2DWJ3Zw6X12AGN8eLZA=;
 b=oHdcACKPK/OVOvIbPpPDuS1Z9gmvTd1eQ0qLtJL6QJToRs78djHD1kV87A4mI4VdVI
 iVHKyScper77gwAvQatz4D0ofZBDWqK0cjPJPyt8oSc4uv1jpAKnY/lHROw6AunN6csn
 qdSdEWRgnwNRwlymecJhNTaiBoGRTUp2VbGPXRiml3PipaGvOhjWO+YIZ5GcTznU6baB
 qzhtinDaIGFYGgwwn5d95YeFQKaqVmvL7n8uZQAzXhh5cyz1ShYGATUewp/aBzR3CxMY
 aoXF7zXaLGyyQCPUT+JZYBzl1rDMwlHF2K5EVjAHc9p8F0YSlg0OCnfGW9f8oaU2e6Rz
 iihQ==
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
Cc: David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgOTozNiBBTSBDaHVob25nIFl1YW4gPGhzbGVzdGVyOTZA
Z21haWwuY29tPiB3cm90ZToKPgo+IEluc3RlYWQgb2YgdXNpbmcgdG9fcGNpX2RldiArIHBjaV9n
ZXRfZHJ2ZGF0YSwKPiB1c2UgZGV2X2dldF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZdWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KCkFw
cGxpZWQuICB0aGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMgfCAyNyArKysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPiBpbmRleCBmMmU4YjQyMzhlZmQuLmRmODIwOTFh
MjlkMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPiBAQCAt
MTA5NywxNiArMTA5NywxNCBAQCBhbWRncHVfcGNpX3NodXRkb3duKHN0cnVjdCBwY2lfZGV2ICpw
ZGV2KQo+Cj4gIHN0YXRpYyBpbnQgYW1kZ3B1X3Btb3BzX3N1c3BlbmQoc3RydWN0IGRldmljZSAq
ZGV2KQo+ICB7Cj4gLSAgICAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2
KTsKPiArICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gZGV2X2dldF9kcnZkYXRh
KGRldik7Cj4KPiAtICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gcGNpX2dldF9k
cnZkYXRhKHBkZXYpOwo+ICAgICAgICAgcmV0dXJuIGFtZGdwdV9kZXZpY2Vfc3VzcGVuZChkcm1f
ZGV2LCB0cnVlLCB0cnVlKTsKPiAgfQo+Cj4gIHN0YXRpYyBpbnQgYW1kZ3B1X3Btb3BzX3Jlc3Vt
ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIHsKPiAtICAgICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2
ID0gdG9fcGNpX2RldihkZXYpOwo+IC0gICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYg
PSBwY2lfZ2V0X2RydmRhdGEocGRldik7Cj4gKyAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
X2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+Cj4gICAgICAgICAvKiBHUFUgY29tZXMgdXAg
ZW5hYmxlZCBieSB0aGUgYmlvcyBvbiByZXN1bWUgKi8KPiAgICAgICAgIGlmIChhbWRncHVfZGV2
aWNlX2lzX3B4KGRybV9kZXYpKSB7Cj4gQEAgLTExMjAsMzMgKzExMTgsMjkgQEAgc3RhdGljIGlu
dCBhbWRncHVfcG1vcHNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPgo+ICBzdGF0aWMgaW50
IGFtZGdwdV9wbW9wc19mcmVlemUoc3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gLSAgICAgICBz
dHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsKPiAtCj4gLSAgICAgICBzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiArICAgICAg
IHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gKwo+
ICAgICAgICAgcmV0dXJuIGFtZGdwdV9kZXZpY2Vfc3VzcGVuZChkcm1fZGV2LCBmYWxzZSwgdHJ1
ZSk7Cj4gIH0KPgo+ICBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc190aGF3KHN0cnVjdCBkZXZpY2Ug
KmRldikKPiAgewo+IC0gICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRl
dik7Cj4gLQo+IC0gICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBwY2lfZ2V0X2Ry
dmRhdGEocGRldik7Cj4gKyAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOwo+ICsKPiAgICAgICAgIHJldHVybiBhbWRncHVfZGV2aWNlX3Jlc3Vt
ZShkcm1fZGV2LCBmYWxzZSwgdHJ1ZSk7Cj4gIH0KPgo+ICBzdGF0aWMgaW50IGFtZGdwdV9wbW9w
c19wb3dlcm9mZihzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIHsKPiAtICAgICAgIHN0cnVjdCBwY2lf
ZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwo+IC0KPiAtICAgICAgIHN0cnVjdCBkcm1fZGV2
aWNlICpkcm1fZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwo+ICsgICAgICAgc3RydWN0IGRy
bV9kZXZpY2UgKmRybV9kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiArCj4gICAgICAgICBy
ZXR1cm4gYW1kZ3B1X2RldmljZV9zdXNwZW5kKGRybV9kZXYsIHRydWUsIHRydWUpOwo+ICB9Cj4K
PiAgc3RhdGljIGludCBhbWRncHVfcG1vcHNfcmVzdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4g
IHsKPiAtICAgICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwo+ICsg
ICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsK
Pgo+IC0gICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBwY2lfZ2V0X2RydmRhdGEo
cGRldik7Cj4gICAgICAgICByZXR1cm4gYW1kZ3B1X2RldmljZV9yZXN1bWUoZHJtX2RldiwgZmFs
c2UsIHRydWUpOwo+ICB9Cj4KPiBAQCAtMTIwNSw4ICsxMTk5LDcgQEAgc3RhdGljIGludCBhbWRn
cHVfcG1vcHNfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+Cj4gIHN0YXRpYyBp
bnQgYW1kZ3B1X3Btb3BzX3J1bnRpbWVfaWRsZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIHsKPiAt
ICAgICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwo+IC0gICAgICAg
c3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7Cj4gKyAg
ICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+
ICAgICAgICAgc3RydWN0IGRybV9jcnRjICpjcnRjOwo+Cj4gICAgICAgICBpZiAoIWFtZGdwdV9k
ZXZpY2VfaXNfcHgoZHJtX2RldikpIHsKPiAtLQo+IDIuMjAuMQo+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
