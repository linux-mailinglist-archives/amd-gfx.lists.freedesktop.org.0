Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E13CFEC6
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 19:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970DC891B9;
	Tue, 30 Apr 2019 17:25:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD91891B9
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 17:25:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r7so2220374wrr.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 10:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P8mTTYCoXv0/xi1Aw/cHLukpO8wNXaWXj4mU6g8MHIU=;
 b=DboJSTL79YPBGs9FZJJ3/HjwKEXSK6VZyIW4m2q/PlfMiU2uH8DuH6Q9DK4fV8MOA4
 vf66N/owcbqq4kILmPGpW29twYW1Oeb3xJ9VXqupnkHytqvIaYjQkUwbG3p0r2onyPHK
 w8VUI2aEdjvZVkTydEIuP3WGEl5cXlYkqVLN6WtU8JpPGX4wdteqpbh0uMC4UdrQBZID
 7PX3WUts8UaaV6uBsvwlKCCay5DMeGWWtwhm8mFW04Dm/k4BUAV5VQ8cvFiWPqfZJaIn
 HxqbszeJ9wIM1Sy5tTE8UJHtSR1Q1IEAmg+nZktYp4QIaNaxzR32SxADbCXSPpSkXpo4
 85vg==
X-Gm-Message-State: APjAAAVZhhKbAUwrt+RtWtlH1NOvLyINRV9+moCBFBVH0D7xmrw6aCar
 EhA3iVqWeE+CZ0fwxGW2OchBhggloI4WK3ohaIc=
X-Google-Smtp-Source: APXvYqzUCXlMJ35F2qMahyJAzPNefqF5YH+Ety7XekwCISnsbeuI1a/Y++rXIBsvSbTsRZNnjvYp/W1KZh5D/BzBQxA=
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr5424239wrw.15.1556645116217; 
 Tue, 30 Apr 2019 10:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <1556637284-715-1-git-send-email-Trigger.Huang@amd.com>
 <c9c462e1-f73f-64f0-31f8-3bbceefbea60@gmail.com>
In-Reply-To: <c9c462e1-f73f-64f0-31f8-3bbceefbea60@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 30 Apr 2019 13:25:04 -0400
Message-ID: <CADnq5_OVRDm081Ce5eZEkOwvdtS-JG8h0m=3OrB237pzjDrxcw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Rearm IRQ in Vega10 SR-IOV if IRQ lost
To: Christian Koenig <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P8mTTYCoXv0/xi1Aw/cHLukpO8wNXaWXj4mU6g8MHIU=;
 b=BdU4WAXp3pXlLxUgvyH0E1X1GvWWWYdSbAhL3oPfGbeERUJSdwRzvCRqGLSmw/aGRH
 /o+GhLdnUbN0CfezpUODSo8j7xBCuyOggpAZ7Q04WMmIg8HHY3G0VRMK/ebFZZAmzSEP
 v1O+kldjC4VxLPUk1BZuf2A24fh3PPZuQ0YRZnU8qbWNw9kZErmKtq5b3ECAhOXOk5tZ
 L7JIcqflVXFPFgjoxRX0YsUBm3fk7RutaYmlP4hSHzDFgKhz2Z98UdfA9swX7uFH7bM9
 Xn5X4pfqyIlzsLvDCgDbxyaa0CrzHYSplm1lhffl+sDa3R1AcO/YAKI0exybhpQXGheF
 tixQ==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Trigger Huang <Trigger.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMToxMCBQTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAzMC4wNC4xOSB1bSAxNzox
NCBzY2hyaWViIFRyaWdnZXIgSHVhbmc6Cj4gPiBJbiBNdWx0aS1WRnMgc3RyZXNzIHRlc3QsIHNv
bWV0aW1lcyB3ZSBzZWUgSVJRIGxvc3Qgd2hlbiBydW5uaW5nCj4gPiBiZW5jaG1hcmssIGp1c3Qg
cmVhcm0gaXQuCj4KPiBXZWxsIEkgdGhpbmsgSSBoYXZlIHNlZW4gdGhhdCBvbiBiYXJlIG1ldGFs
IGFzIHdlbGwsIGl0IHdvdWxkIGNlcnRhaW5seQo+IGV4cGxhaW4gc29tZSB2ZXJ5IG9kZCBiZWhh
dmlvciBJJ3ZlIGdvdCBmcm9tIHRoZSBJSCBibG9jay4KCk1heWJlIHdlIHNob3VsZCBlbmFibGUg
dGhpcyBmb3IgYmFyZSBtZXRhbCB0b28gaW4gYSBmb2xsb3cgdXAgcGF0Y2guCgpBbGV4Cgo+Cj4g
SGF2ZSB5b3UgcGluZ2VkIHRoZSBodyBndXlzIGFib3V0IHRoYXQgYWxyZWFkeT8KPgo+ID4gU2ln
bmVkLW9mZi1ieTogVHJpZ2dlciBIdWFuZyA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPgo+Cj4gQWNr
ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+ID4g
LS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9paC5jIHwgMzcgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMzYg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMTBfaWguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3ZlZ2ExMF9paC5jCj4gPiBpbmRleCAxYjJmNjlhLi44ZDg5YWI3IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmMKPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9paC5jCj4gPiBAQCAtMzEsNyArMzEsNyBAQAo+
ID4gICAjaW5jbHVkZSAic29jMTVfY29tbW9uLmgiCj4gPiAgICNpbmNsdWRlICJ2ZWdhMTBfaWgu
aCIKPiA+Cj4gPiAtCj4gPiArI2RlZmluZSBNQVhfUkVBUk1fUkVUUlkgMTAKPiA+Cj4gPiAgIHN0
YXRpYyB2b2lkIHZlZ2ExMF9paF9zZXRfaW50ZXJydXB0X2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KTsKPiA+Cj4gPiBAQCAtMzgyLDYgKzM4MiwzOCBAQCBzdGF0aWMgdm9pZCB2ZWdh
MTBfaWhfZGVjb2RlX2l2KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ID4gICB9Cj4gPgo+
ID4gICAvKioKPiA+ICsgKiB2ZWdhMTBfaWhfaXJxX3JlYXJtIC0gcmVhcm0gSVJRIGlmIGxvc3QK
PiA+ICsgKgo+ID4gKyAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiA+ICsgKgo+ID4g
KyAqLwo+ID4gK3N0YXRpYyB2b2lkIHZlZ2ExMF9paF9pcnFfcmVhcm0oc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhbWRn
cHVfaWhfcmluZyAqaWgpCj4gPiArewo+ID4gKyAgICAgdWludDMyX3QgcmVnX3JwdHIgPSAwOwo+
ID4gKyAgICAgdWludDMyX3QgdiA9IDA7Cj4gPiArICAgICB1aW50MzJfdCBpID0gMDsKPiA+ICsK
PiA+ICsgICAgIGlmIChpaCA9PSAmYWRldi0+aXJxLmloKQo+ID4gKyAgICAgICAgICAgICByZWdf
cnB0ciA9IFNPQzE1X1JFR19PRkZTRVQoT1NTU1lTLCAwLCBtbUlIX1JCX1JQVFIpOwo+ID4gKyAg
ICAgZWxzZSBpZiAoaWggPT0gJmFkZXYtPmlycS5paDEpCj4gPiArICAgICAgICAgICAgIHJlZ19y
cHRyID0gU09DMTVfUkVHX09GRlNFVChPU1NTWVMsIDAsIG1tSUhfUkJfUlBUUl9SSU5HMSk7Cj4g
PiArICAgICBlbHNlIGlmIChpaCA9PSAmYWRldi0+aXJxLmloMikKPiA+ICsgICAgICAgICAgICAg
cmVnX3JwdHIgPSBTT0MxNV9SRUdfT0ZGU0VUKE9TU1NZUywgMCwgbW1JSF9SQl9SUFRSX1JJTkcy
KTsKPiA+ICsgICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gKyAg
ICAgLyogUmVhcm0gSVJRIC8gcmUtd3dyaXRlIGRvb3JiZWxsIGlmIGRvb3JiZWxsIHdyaXRlIGlz
IGxvc3QgKi8KPiA+ICsgICAgIGZvciAoaSA9IDA7IGkgPCBNQVhfUkVBUk1fUkVUUlk7IGkrKykg
ewo+ID4gKyAgICAgICAgICAgICB2ID0gUlJFRzMyX05PX0tJUShyZWdfcnB0cik7Cj4gPiArICAg
ICAgICAgICAgIGlmICgodiA8IGloLT5yaW5nX3NpemUpICYmICh2ICE9IGloLT5ycHRyKSkKPiA+
ICsgICAgICAgICAgICAgICAgICAgICBXRE9PUkJFTEwzMihpaC0+ZG9vcmJlbGxfaW5kZXgsIGlo
LT5ycHRyKTsKPiA+ICsgICAgICAgICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IGJyZWFrOwo+ID4gKyAgICAgfQo+ID4gK30KPiA+ICsKPiA+ICsvKioKPiA+ICAgICogdmVnYTEw
X2loX3NldF9ycHRyIC0gc2V0IHRoZSBJSCByaW5nIGJ1ZmZlciBycHRyCj4gPiAgICAqCj4gPiAg
ICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiA+IEBAIC0zOTUsNiArNDI3LDkgQEAg
c3RhdGljIHZvaWQgdmVnYTEwX2loX3NldF9ycHRyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LAo+ID4gICAgICAgICAgICAgICAvKiBYWFggY2hlY2sgaWYgc3dhcHBpbmcgaXMgbmVjZXNzYXJ5
IG9uIEJFICovCj4gPiAgICAgICAgICAgICAgICppaC0+cnB0cl9jcHUgPSBpaC0+cnB0cjsKPiA+
ICAgICAgICAgICAgICAgV0RPT1JCRUxMMzIoaWgtPmRvb3JiZWxsX2luZGV4LCBpaC0+cnB0cik7
Cj4gPiArCj4gPiArICAgICAgICAgICAgIGlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgdmVnYTEwX2loX2lycV9yZWFybShhZGV2LCBpaCk7Cj4gPiAg
ICAgICB9IGVsc2UgaWYgKGloID09ICZhZGV2LT5pcnEuaWgpIHsKPiA+ICAgICAgICAgICAgICAg
V1JFRzMyX1NPQzE1KE9TU1NZUywgMCwgbW1JSF9SQl9SUFRSLCBpaC0+cnB0cik7Cj4gPiAgICAg
ICB9IGVsc2UgaWYgKGloID09ICZhZGV2LT5pcnEuaWgxKSB7Cj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4g
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
