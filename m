Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC50D4C1F
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Oct 2019 04:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E307D6E0EB;
	Sat, 12 Oct 2019 02:26:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6543D6E0EB
 for <amd-gfx@lists.freedesktop.org>; Sat, 12 Oct 2019 02:26:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q9so13758962wrm.8
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=orGiLLq6GqX6hiYYcSztI6HxRzsIshb+NDe3bcJwvS0=;
 b=Z+6nPo81qHCovW7GobvacYUl8GAh6EKvTHxBir3Li8jt/DgKHrHZIu0DIDN5fxdrKH
 qwZmhcuZaVP8UlioV0rPJgxvku4HKZcDX0h9TDNU2zPnB814xaGO9gquDumfX4U2Kry9
 PHOLIWyDt06k/l2XIUDfpLrr2W6S2iHtBbIv+OpZUIL232TrNIL28x0Hf0p4hHr8h/Or
 AvWdDD2WiLJf+etrzgatBdmAyP4pj1SAFxQ0GoVDlhBWgIYmARQFhtNpdfNxK0DwjaL7
 mRfktI2gtiCDe1jPrlGx4TSoCtMON9EVbbFqQMKVd0yyP+1Nu0GSxw59N9iSnTE2gYRG
 F6Vw==
X-Gm-Message-State: APjAAAVPT5DAN134LXfo6aZgAoSzol5fJolO9ZBafTiwIpg2zr2xf6aK
 EQQLKZyc0wvXxW0K6vVysvXfFdnPhZy+yudiPWs7YA==
X-Google-Smtp-Source: APXvYqzHxlYnfCy+JiL52xoVrCf3qaOSOl/5UTDx+VDpvZlR1bTLFmyMG91R5JFY+mjTlFmutgmR9/t879qdgr3NPf8=
X-Received: by 2002:adf:ba07:: with SMTP id o7mr16327721wrg.50.1570847176861; 
 Fri, 11 Oct 2019 19:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191011035033.24935-1-tianci.yin@amd.com>
 <20191011035033.24935-7-tianci.yin@amd.com>
 <9084e67e-adc2-b512-b593-ca218c17a366@amd.com>
In-Reply-To: <9084e67e-adc2-b512-b593-ca218c17a366@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 11 Oct 2019 22:26:04 -0400
Message-ID: <CADnq5_Mn1+ME9fUzGQ44ZEaW9eNwOMxH4D3hNzj3jK3HPYCt5Q@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
To: "Tuikov, Luben" <Luben.Tuikov@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=orGiLLq6GqX6hiYYcSztI6HxRzsIshb+NDe3bcJwvS0=;
 b=NRDeGSZUPnOHA9kTEOsT8yVeMeX4Nqc7pluNBcbuuusTeEKhQ0PgAwj11UIvADCJ4G
 XI0taMVYHBGIP3tjw5uLGK40oUU9fQ8fCO25TyIUQkdpjL0+NjTWjCNBKhF5PWUS2VuY
 ezjYgIHVNjd9N3Vl44hVqusdjWpwhxDy9xLcc1CK1KvCfVlyjz6AdV9ywkw4dISfd7r3
 XgxVsE2TFeuBSMEOYT+DjU4YhqLb9cK+rJOMN3xLx6HWpfRU+goQxpn/xedEBsiFOZX6
 /ytLBsQAYBPSb35qAv05OjnkAA6IuIA95CLsoWkMWieFHYksNfRyKpkZS0taWFzpgPtA
 5mgA==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgNzoyMyBQTSBUdWlrb3YsIEx1YmVuIDxMdWJlbi5UdWlr
b3ZAYW1kLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDE5LTEwLTEwIDExOjUwIHAubS4sIFRpYW5jaSBZ
aW4gd3JvdGU6Cj4gPiBGcm9tOiAiVGlhbmNpLllpbiIgPHRpYW5jaS55aW5AYW1kLmNvbT4KPiA+
Cj4gPiBtZW1vcnkgdHJhaW5pbmcgdXNpbmcgc3BlY2lmaWMgZml4ZWQgdnJhbSBzZWdtZW50LCBy
ZXNlcnZlIHRoZXNlCj4gPiBzZWdtZW50cyBiZWZvcmUgYW55b25lIG1heSBhbGxvY2F0ZSBpdC4K
PiA+Cj4gPiBDaGFuZ2UtSWQ6IEkxNDM2NzU1ODEzYTU2NTYwOGEyODU3YTY4M2Y1MzUzNzc2MjBh
NjM3Cj4gPiBSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogVGlhbmNpLllpbiA8dGlhbmNpLnlpbkBhbWQuY29tPgo+
ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgOTYg
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5NiBpbnNlcnRp
b25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+ID4g
aW5kZXggOWRhNjM1MGE0YmEyLi40MmQwZmNiOTgzODIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+ID4gQEAgLTE2NjcsNiArMTY2Nyw5MyBAQCBzdGF0
aWMgaW50IGFtZGdwdV90dG1fZndfcmVzZXJ2ZV92cmFtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmFk
ZXYtPmZ3X3ZyYW1fdXNhZ2UudmEpOwo+ID4gIH0KPiA+Cj4gPiArLyoKPiA+ICsgKiBNZW1veSB0
cmFpbmluZyByZXNlcnZhdGlvbiBmdW5jdGlvbnMKPiA+ICsgKi8KPiA+ICsKPiA+ICsvKioKPiA+
ICsgKiBhbWRncHVfdHRtX3RyYWluaW5nX3Jlc2VydmVfdnJhbV9maW5pIC0gZnJlZSBtZW1vcnkg
dHJhaW5pbmcgcmVzZXJ2ZWQgdnJhbQo+ID4gKyAqCj4gPiArICogQGFkZXY6IGFtZGdwdV9kZXZp
Y2UgcG9pbnRlcgo+ID4gKyAqCj4gPiArICogZnJlZSBtZW1vcnkgdHJhaW5pbmcgcmVzZXJ2ZWQg
dnJhbSBpZiBpdCBoYXMgYmVlbiByZXNlcnZlZC4KPiA+ICsgKi8KPiA+ICtzdGF0aWMgaW50IGFt
ZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IHBzcF9tZW1vcnlfdHJhaW5pbmdfY29udGV4
dCAqY3R4ID0gJmFkZXYtPnBzcC5tZW1fdHJhaW5fY3R4Owo+ID4gKwo+ID4gKyAgICAgY3R4LT5p
bml0ID0gUFNQX01FTV9UUkFJTl9OT1RfU1VQUE9SVDsKPiA+ICsgICAgIGlmIChjdHgtPmMycF9i
bykgewo+ID4gKyAgICAgICAgICAgICBhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmN0eC0+YzJwX2Jv
LCBOVUxMLCBOVUxMKTsKPiA+ICsgICAgICAgICAgICAgY3R4LT5jMnBfYm8gPSBOVUxMOwo+ID4g
KyAgICAgfQo+Cj4gR2VuZXJhbGx5IGl0IGlzIGEgZ29vZCBpZGVhIHRvIHBhcmFncmFwaCB5b3Vy
IGNvZGUuCj4gU28gYW4gZW1wdHkgbGluZSBiZXR3ZWVuIGlmLXN0YXRlbWVudHMgaXMgYSBnb29k
IGlkZWEuCj4gSG93ZXZlciwgdGhlcmUgaXMgbm8gbmVlZCBpbjoKPgo+IHJldCA9IGYoeCk7Cj4g
aWYgKHJldCkgewo+ICAgICAgICAgPGJvZHkgb2YgY29kZT4KPiB9Cj4KPiBpZiAoYmxhaCkgewo+
ICAgICAgICAgPGJvZHkgb2YgY29kZT4KPiB9Cj4KPiBUaGUgYWJvdmUgYXJlIHR3byAoMikgd2Vs
bC1mb3JtZWQgcGFyYWdyYXBocy4KPgo+ID4gKyAgICAgaWYgKGN0eC0+cDJjX2JvKSB7Cj4gPiAr
ICAgICAgICAgICAgIGFtZGdwdV9ib19mcmVlX2tlcm5lbCgmY3R4LT5wMmNfYm8sIE5VTEwsIE5V
TEwpOwo+ID4gKyAgICAgICAgICAgICBjdHgtPnAyY19ibyA9IE5VTEw7Cj4gPiArICAgICB9Cj4g
PiArCj4gPiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArLyoqCj4gPiArICogYW1k
Z3B1X3R0bV90cmFpbmluZ19yZXNlcnZlX3ZyYW1faW5pdCAtIGNyZWF0ZSBibyB2cmFtIHJlc2Vy
dmF0aW9uIGZyb20gbWVtb3J5IHRyYWluaW5nCj4gPiArICoKPiA+ICsgKiBAYWRldjogYW1kZ3B1
X2RldmljZSBwb2ludGVyCj4gPiArICoKPiA+ICsgKiBjcmVhdGUgYm8gdnJhbSByZXNlcnZhdGlv
biBmcm9tIG1lbW9yeSB0cmFpbmluZy4KPiA+ICsgKi8KPiA+ICtzdGF0aWMgaW50IGFtZGdwdV90
dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
Cj4gPiArewo+ID4gKyAgICAgaW50IHJldDsKPiA+ICsgICAgIHN0cnVjdCBwc3BfbWVtb3J5X3Ry
YWluaW5nX2NvbnRleHQgKmN0eCA9ICZhZGV2LT5wc3AubWVtX3RyYWluX2N0eDsKPiA+ICsKPiA+
ICsgICAgIG1lbXNldChjdHgsIDAsIHNpemVvZigqY3R4KSk7Cj4gPiArICAgICBpZiAoIWFkZXYt
PmZ3X3ZyYW1fdXNhZ2UubWVtX3RyYWluX3N1cHBvcnQpIHsKPiA+ICsgICAgICAgICAgICAgRFJN
X0RFQlVHKCJtZW1vcnkgdHJhaW5pbmcgZG9lcyBub3Qgc3VwcG9ydCFcbiIpOwo+ID4gKyAgICAg
ICAgICAgICByZXR1cm4gMDsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIGN0eC0+YzJwX3Ry
YWluX2RhdGFfb2Zmc2V0ID0gYWRldi0+ZndfdnJhbV91c2FnZS5tZW1fdHJhaW5fZmJfbG9jOwo+
ID4gKyAgICAgY3R4LT5wMmNfdHJhaW5fZGF0YV9vZmZzZXQgPSAoYWRldi0+Z21jLm1jX3ZyYW1f
c2l6ZSAtIEdERFI2X01FTV9UUkFJTklOR19PRkZTRVQpOwo+ID4gKyAgICAgY3R4LT50cmFpbl9k
YXRhX3NpemUgPSBHRERSNl9NRU1fVFJBSU5JTkdfREFUQV9TSVpFX0lOX0JZVEVTOwo+ID4gKwo+
ID4gKyAgICAgRFJNX0RFQlVHKCJ0cmFpbl9kYXRhX3NpemU6JWxseCxwMmNfdHJhaW5fZGF0YV9v
ZmZzZXQ6JWxseCxjMnBfdHJhaW5fZGF0YV9vZmZzZXQ6JWxseC5cbiIsCj4gPiArICAgICAgICAg
ICAgICAgY3R4LT50cmFpbl9kYXRhX3NpemUsCj4gPiArICAgICAgICAgICAgICAgY3R4LT5wMmNf
dHJhaW5fZGF0YV9vZmZzZXQsCj4gPiArICAgICAgICAgICAgICAgY3R4LT5jMnBfdHJhaW5fZGF0
YV9vZmZzZXQpOwo+ID4gKwo+ID4gKyAgICAgcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxf
YXQoYWRldiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGN0eC0+
cDJjX3RyYWluX2RhdGFfb2Zmc2V0LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY3R4LT50cmFpbl9kYXRhX3NpemUsCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJmN0eC0+cDJjX2JvLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCk7Cj4gPiArICAgICBpZiAocmV0KSB7Cj4g
PiArICAgICAgICAgICAgIERSTV9FUlJPUigiYWxsb2MgcDJjX2JvIGZhaWxlZCglZCkhXG4iLCBy
ZXQpOwo+ID4gKyAgICAgICAgICAgICByZXQgPSAtRU5PTUVNOwo+ID4gKyAgICAgICAgICAgICBn
b3RvIGVycl9vdXQ7Cj4gPiArICAgICB9Cj4KPiBOQUshCj4gV2h5IGFyZSB5b3UgcmUtd3JpdGlu
ZyB0aGUgZXJyb3IgY29kZSBmcm9tICJhbWRncHVfYm9fY3JlYXRlX2tlbnJlbF9hdCgpIj8KPiBQ
YXNzIHRoZSBlcnJvciBhcyBpcy4KPgo+ID4gKwo+ID4gKyAgICAgcmV0ID0gYW1kZ3B1X2JvX2Ny
ZWF0ZV9rZXJuZWxfYXQoYWRldiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGN0eC0+YzJwX3RyYWluX2RhdGFfb2Zmc2V0LAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY3R4LT50cmFpbl9kYXRhX3NpemUsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmN0eC0+YzJwX2JvLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCk7Cj4gPiArICAgICBp
ZiAocmV0KSB7Cj4gPiArICAgICAgICAgICAgIERSTV9FUlJPUigiYWxsb2MgYzJwX2JvIGZhaWxl
ZCglZCkhXG4iLCByZXQpOwo+ID4gKyAgICAgICAgICAgICByZXQgPSAtRU5PTUVNOwo+ID4gKyAg
ICAgICAgICAgICBnb3RvIGVycl9vdXQ7Cj4gPiArICAgICB9Cj4KPiBOQUshCj4gV2h5IGFyZSB5
b3UgcmUtd3JpdGluZyB0aGUgZXJyb3IgY29kZSBmcm9tICJhbWRncHVfYm9fY3JlYXRlX2tlbnJl
bF9hdCgpIj8KPiBQYXNzIHRoZSBlcnJvciBhcyBpcy4KPgo+ID4gKwo+ID4gKyAgICAgY3R4LT5p
bml0ID0gUFNQX01FTV9UUkFJTl9SRVNFUlZFX1NVQ0NFU1M7Cj4gPiArICAgICByZXR1cm4gMDsK
PiA+ICsKPiA+ICtlcnJfb3V0Ogo+Cj4gWWVzLi4uIHdlbGwgImVycl9vdXQiIGNvdWxkIGJlIGFu
eSBpZGVudGlmaWVyLCBpbmNsdWRpbmcKPiBhIHZhcmlhYmxlLCBhcyBvdXIgdmFyaWFibGVzIGZv
bGxvdyBzbmFrZS1ub3RhdGlvbiwgYWxsIGxvd2VyY2FzZS4KPgo+IEJhY2sgYXQgdGhlIHR1cm4g
b2YgdGhpcyBjZW50dXJ5LCBMaW51eCBmb2xsb3dlZCBjYXBpdGFsaXplZAo+IGdvdG8gbGFiZWxz
IHRvIGRpc3Rpbmd1aXNoIHRoZW0gZnJvbSBhbnl0aGluZyBlbHNlIGFyb3VuZAo+IGluIHRoZSBr
ZXJuZWwgY29kZToKPgo+ICAgICAgICAgZ290byBCYWRfZXJyOwo+ICAgICAgICAgLi4uCj4KPiAg
ICAgICAgIHJldHVybiAwOwo+IEJhZF9lcnI6Cj4gICAgICAgICByZXR1cm4gYmFkX2dpZnQ7Cj4g
fQo+Cj4gVG8gZGlzdGluZ3Vpc2ggdGhhdCBhIGNhcGl0YWxpemVkIGlkZW50aWZpZXIgaXMgYSBn
b3RvIGxhYmVsLAo+ICJCYWRfZXJyIiBhbmQgYWxsIGxvd2VyLWNhc2UgbGFiZWwgaXMganVzdCBh
bm90aGVyIHZhcmlhYmxlCj4gb3IgZnVuY3Rpb24gaWRlbnRpZmllciwgImJhZF9naWZ0Ii4KCkkg
d291bGRuJ3Qgd29ycnkgdG9vIG11Y2ggYWJvdXQgdGhpcy4gIE1vc3Qga2VybmVsIGNvZGUgdXNl
cyBsb3dlcgpjYXNlIGxhYmVscyBub3cuICBUaGV5IGFyZSBlYXNpZXIgb24gdGhlIGV5ZXMuCgpB
bGV4Cgo+Cj4gUmVnYXJkcywKPiBMdWJlbgo+Cj4gPiArICAgICBhbWRncHVfdHRtX3RyYWluaW5n
X3Jlc2VydmVfdnJhbV9maW5pKGFkZXYpOwo+ID4gKyAgICAgcmV0dXJuIHJldDsKPiA+ICt9Cj4g
PiArCj4gPiAgLyoqCj4gPiAgICogYW1kZ3B1X3R0bV9pbml0IC0gSW5pdCB0aGUgbWVtb3J5IG1h
bmFnZW1lbnQgKHR0bSkgYXMgd2VsbCBhcyB2YXJpb3VzCj4gPiAgICogZ3R0L3ZyYW0gcmVsYXRl
ZCBmaWVsZHMuCj4gPiBAQCAtMTc0MCw2ICsxODI3LDE0IEBAIGludCBhbWRncHVfdHRtX2luaXQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gPiAgICAgICAgICAgICAgIHJldHVybiByOwo+
ID4gICAgICAgfQo+ID4KPiA+ICsgICAgIC8qCj4gPiArICAgICAgKlRoZSByZXNlcnZlZCB2cmFt
IGZvciBtZW1vcnkgdHJhaW5pbmcgbXVzdCBiZSBwaW5uZWQgdG8gdGhlIHNwZWNpZmllZAo+ID4g
KyAgICAgICpwbGFjZSBvbiB0aGUgVlJBTSwgc28gcmVzZXJ2ZSBpdCBlYXJseS4KPiA+ICsgICAg
ICAqLwo+ID4gKyAgICAgciA9IGFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2luaXQo
YWRldik7Cj4gPiArICAgICBpZiAocikKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHI7Cj4gPiAr
Cj4gPiAgICAgICAvKiBhbGxvY2F0ZSBtZW1vcnkgYXMgcmVxdWlyZWQgZm9yIFZHQQo+ID4gICAg
ICAgICogVGhpcyBpcyB1c2VkIGZvciBWR0EgZW11bGF0aW9uIGFuZCBwcmUtT1Mgc2Nhbm91dCBi
dWZmZXJzIHRvCj4gPiAgICAgICAgKiBhdm9pZCBkaXNwbGF5IGFydGlmYWN0cyB3aGlsZSB0cmFu
c2l0aW9uaW5nIGJldHdlZW4gcHJlLU9TCj4gPiBAQCAtMTgyNSw2ICsxOTIwLDcgQEAgdm9pZCBh
bWRncHVfdHRtX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gPiAgICAgICAgICAg
ICAgIHJldHVybjsKPiA+Cj4gPiAgICAgICBhbWRncHVfdHRtX2RlYnVnZnNfZmluaShhZGV2KTsK
PiA+ICsgICAgIGFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2ZpbmkoYWRldik7Cj4g
PiAgICAgICBhbWRncHVfdHRtX2Z3X3Jlc2VydmVfdnJhbV9maW5pKGFkZXYpOwo+ID4gICAgICAg
aWYgKGFkZXYtPm1tYW4uYXBlcl9iYXNlX2thZGRyKQo+ID4gICAgICAgICAgICAgICBpb3VubWFw
KGFkZXYtPm1tYW4uYXBlcl9iYXNlX2thZGRyKTsKPiA+Cj4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
