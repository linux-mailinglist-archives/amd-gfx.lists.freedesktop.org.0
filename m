Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD8129B44
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 17:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FB189FC5;
	Fri, 24 May 2019 15:39:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D89189FC5
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 15:38:59 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b18so10454766wrq.12
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 08:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MygrNQE/2QU7e9YlLAtGJqxzs1cFySm0s8dtMpwxaCI=;
 b=E0kAaZbasv8n5uFu/tBKnYMvDJZGy9DoEjHfGATSA8TCTb6wwDU+pzYvcjCb01kpW6
 Z0m9If8qx7WV9HOQMqmEDRqJD0bwJSLamutsBELC16ULRlWzq+fWsyXjKb76GEqSZ+97
 lWSzKtR4hg7u5tm/u68nQYaN5i9AMUBkysrZRs+7ZlZTPZZ2pSBQyN0Bc6H/VmyDK08H
 4CuQ1Kebu8ZwpDHtT4NeFDpdWOnP5ng9jQ1W/YCvyQ90NHJ1g2Z7c95gNgfndbuPXbIf
 BDW62ketHcr8pFNB7jTR3oVXumqM0ox86lu7LTD7j25FX3goChwlK6bj0LkVu5RGZzhB
 IuIw==
X-Gm-Message-State: APjAAAWAShEEEq36F5LxaquqWtx3fJ8A1Du4X34dN2WmmGGpYlDYnKk5
 6Mi6dCZifEy+ldWE1YWDFjSdQftPmLF7ms5bqamwyA==
X-Google-Smtp-Source: APXvYqydk6LNCc8SZfk//U+fCXDBFICP5U1E7bi6TM2jjxrPvV3VRWRUzX8oAWtdNxTP17aCy2CpDVKr73237i5d3f8=
X-Received: by 2002:adf:b6a5:: with SMTP id j37mr60300876wre.4.1558712338212; 
 Fri, 24 May 2019 08:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190524132326.7436-1-tom.stdenis@amd.com>
In-Reply-To: <20190524132326.7436-1-tom.stdenis@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 May 2019 11:38:45 -0400
Message-ID: <CADnq5_NHueKu-ahaiAHT4uzEtkGXe_d1H0O16=oayKjYp7wxwg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/doc: Add XGMI sysfs documentation
To: "StDenis, Tom" <Tom.StDenis@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MygrNQE/2QU7e9YlLAtGJqxzs1cFySm0s8dtMpwxaCI=;
 b=Qho8w9xdPd24tUyKntltuG2wW7ziF/ti2eNjVT2ANNCoplsZ4WRWOHe46n3OTVZjtp
 ecuw5vBFTxNGymgr3TgSYMrt1gMpgd/2FVHD328bDzwrGJEzmG4HzgaykO3fVjqF00Je
 VSxjMd6G7djq2c5dJe0Fl+sGOvdXErlvVvoPeWkI5yYxlvGgCwMwQYYJxeRLFYa8/wod
 wz/SvCL3/T4KiKuT7O0KKwvcENu4OvT9Lp7Z1pUkyaOmzCU8lbw9mlI1WO+dxgJD4QmX
 RLq0hOXknrs3ainxI4VJrSQ9Usb+i/JrnQBNdR6ZNUWEd2gnCVzGPiyQ6lsqei42B/Dk
 7qfA==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgOToyMyBBTSBTdERlbmlzLCBUb20gPFRvbS5TdERlbmlz
QGFtZC5jb20+IHdyb3RlOgo+Cj4gU2lnbmVkLW9mZi1ieTogVG9tIFN0IERlbmlzIDx0b20uc3Rk
ZW5pc0BhbWQuY29tPgoKU2VyaWVzIGlzOgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1
LnJzdCAgICAgICAgICAgICB8ICA5ICsrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV94Z21pLmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxl
cyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9ncHUvYW1kZ3B1LnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L2FtZGdwdS5yc3QKPiBpbmRleCBh
NzQwZTQ5MWRmY2MuLmNhY2ZjZmFkMjM1NiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dw
dS9hbWRncHUucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1LnJzdAo+IEBAIC03
MCw2ICs3MCwxNSBAQCBJbnRlcnJ1cHQgSGFuZGxpbmcKPiAgLi4ga2VybmVsLWRvYzo6IGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEuYwo+ICAgICA6aW50ZXJuYWw6Cj4KPiAr
QU1ER1BVIFhHTUkgU3VwcG9ydAo+ICs9PT09PT09PT09PT09PT09PT09Cj4gKwo+ICsuLiBrZXJu
ZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYwo+ICsgICA6
ZG9jOiBBTURHUFUgWEdNSSBTdXBwb3J0Cj4gKwo+ICsuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYwo+ICsgICA6aW50ZXJuYWw6Cj4gKwo+ICBH
UFUgUG93ZXIvVGhlcm1hbCBDb250cm9scyBhbmQgTW9uaXRvcmluZwo+ICA9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfeGdtaS5jCj4gaW5kZXggZTQ4ZTkzOTRmMWU0Li5kMTFlYmEwOWVhZGQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMKPiBAQCAtNDAsNiArNDAs
MzQgQEAgdm9pZCAqYW1kZ3B1X3hnbWlfaGl2ZV90cnlfbG9jayhzdHJ1Y3QgYW1kZ3B1X2hpdmVf
aW5mbyAqaGl2ZSkKPiAgICAgICAgIHJldHVybiAmaGl2ZS0+ZGV2aWNlX2xpc3Q7Cj4gIH0KPgo+
ICsvKioKPiArICogRE9DOiBBTURHUFUgWEdNSSBTdXBwb3J0Cj4gKyAqCj4gKyAqIFhHTUkgaXMg
YSBoaWdoIHNwZWVkIGludGVyY29ubmVjdCB0aGF0IGpvaW5zIG11bHRpcGxlIEdQVSBjYXJkcwo+
ICsgKiBpbnRvIGEgaG9tb2dlbmVvdXMgbWVtb3J5IHNwYWNlIHRoYXQgaXMgb3JnYW5pemVkIGJ5
IGEgY29sbGVjdGl2ZQo+ICsgKiBoaXZlIElEIGFuZCBpbmRpdmlkdWFsIG5vZGUgSURzLCBib3Ro
IG9mIHdoaWNoIGFyZSA2NC1iaXQgbnVtYmVycy4KPiArICoKPiArICogVGhlIGZpbGUgeGdtaV9k
ZXZpY2VfaWQgY29udGFpbnMgdGhlIHVuaXF1ZSBwZXIgR1BVIGRldmljZSBJRCBhbmQKPiArICog
aXMgc3RvcmVkIGluIHRoZSAvc3lzL2NsYXNzL2RybS9jYXJkJHtjYXJkbm99L2RldmljZS8gZGly
ZWN0b3J5Lgo+ICsgKgo+ICsgKiBJbnNpZGUgdGhlIGRldmljZSBkaXJlY3RvcnkgYSBzdWItZGly
ZWN0b3J5ICd4Z21pX2hpdmVfaW5mbycgaXMKPiArICogY3JlYXRlZCB3aGljaCBjb250YWlucyB0
aGUgaGl2ZSBJRCBhbmQgdGhlIGxpc3Qgb2Ygbm9kZXMuCj4gKyAqCj4gKyAqIFRoZSBoaXZlIElE
IGlzIHN0b3JlZCBpbjoKPiArICogICAvc3lzL2NsYXNzL2RybS9jYXJkJHtjYXJkbm99L2Rldmlj
ZS94Z21pX2hpdmVfaW5mby94Z21pX2hpdmVfaWQKPiArICoKPiArICogVGhlIG5vZGUgaW5mb3Jt
YXRpb24gaXMgc3RvcmVkIGluIG51bWJlcmVkIGRpcmVjdG9yaWVzOgo+ICsgKiAgIC9zeXMvY2xh
c3MvZHJtL2NhcmQke2NhcmRub30vZGV2aWNlL3hnbWlfaGl2ZV9pbmZvL25vZGUke25vZGVub30v
eGdtaV9kZXZpY2VfaWQKPiArICoKPiArICogRWFjaCBkZXZpY2UgaGFzIHRoZWlyIG93biB4Z21p
X2hpdmVfaW5mbyBkaXJlY3Rpb24gd2l0aCBhIG1pcnJvcgo+ICsgKiBzZXQgb2Ygbm9kZSBzdWIt
ZGlyZWN0b3JpZXMuCj4gKyAqCj4gKyAqIFRoZSBYR01JIG1lbW9yeSBzcGFjZSBpcyBidWlsdCBi
eSBjb250aWd1b3VzbHkgYWRkaW5nIHRoZSBwb3dlciBvZgo+ICsgKiB0d28gcGFkZGVkIFZSQU0g
c3BhY2UgZnJvbSBlYWNoIG5vZGUgdG8gZWFjaCBvdGhlci4KPiArICoKPiArICovCj4gKwo+ICsK
PiAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X3hnbWlfc2hvd19oaXZlX2lkKHN0cnVjdCBkZXZpY2Ug
KmRldiwKPiAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNo
YXIgKmJ1ZikKPiAgewo+IC0tCj4gMi4yMS4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
