Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A8176E6F
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 18:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23516EDB8;
	Fri, 26 Jul 2019 16:02:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248736EDB8
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 16:02:31 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p13so54935013wru.10
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 09:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=8q8ZQw0olwbMzbdsd0cQ7LczmeCz+GIIM5xI+foxXnc=;
 b=pxJ0KSwrFEnYFsZhcJ2TJdp9DLy4rOFe21fshlC1FCz+pidZJz5QrFEzFZ52awambw
 6qhABANpCjt8XOHb2RvFI3Nqw/uNxgtAy9mI7ntUTMA0ZG/dYwU5qSDTMOX+XHb5W16l
 wlKD5VOlyz/vaX6q0zYyScIS+RpFrHhf5AJdUzui4VWpGf43Bj33X3Hh5hsnwaOed906
 FGkpLl74kknvqNCfr5/bv32BHaDSnr4eL1gP7JiLoKHpWkoXN82998Gb2Y2l0p1Ml4UB
 pCXgwrM88vWKZxU0/jH52DkYi+8610YjUmRZUHUzS9ZeelOmWRatuyV+tQxbsD4Tard1
 DkWw==
X-Gm-Message-State: APjAAAUJo5cNds2L6KJ/7QAltymgmzgfWczL5kmLzFw4d4eWxpLIAPxc
 G7TXmvuIuoIrM8wgPKtbhik=
X-Google-Smtp-Source: APXvYqwomOKy478YraHdcikU8lr3i3S2j0Sw5WaF5K/APsdRhJGzW8ggfdqnpm0aSMobTfcwZwWg2Q==
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr53345257wrn.240.1564156949801; 
 Fri, 26 Jul 2019 09:02:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f12sm58662559wrg.5.2019.07.26.09.02.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 09:02:29 -0700 (PDT)
Subject: Re: [PATCH v5 2/4] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 christian.koenig@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
 <1564064683-31796-3-git-send-email-andrey.grodzovsky@amd.com>
 <1723b531-097f-2687-6dc9-9de6e3e378a1@gmail.com>
 <fdf2600a-b0ef-bdca-f22b-51427bef9531@daenzer.net>
 <881edbab-df57-a1d7-bcf3-987fdbb384db@gmail.com>
 <7c62edf1-0e3b-d57e-fd33-f98198b6c23a@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <973beeaf-735c-777d-c493-cdfdde2dd2f1@gmail.com>
Date: Fri, 26 Jul 2019 18:02:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7c62edf1-0e3b-d57e-fd33-f98198b6c23a@daenzer.net>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8q8ZQw0olwbMzbdsd0cQ7LczmeCz+GIIM5xI+foxXnc=;
 b=BSlH7ijzSGDFgfXApw9xyM6ke6p5uqB1ublSYGHefgohGS9aIFl+CuwS5UdMhBw+qg
 FbXxhYdn+txwmRGVegwohaUWMCwBrNvkC8q3HR+cWyoy8ZS8AgNvkM8YLkEUD7mukJXw
 miNVet3DoNajLp1tHX/w1kRQi5QXQqLi+SosdqjtBgSf7M9O2crrVRzImljRuw874ZM0
 eItSmbZ4gDfr705kzdR3zB/2IH+ldkGf1pYWqMszv87rHsDGi2MXLWbGOLRfUxwkCNs/
 XS0MydknPbz2efGSuhaw8Z0IztvgA559X1CzgQFns5+oj/1ibVdvicXzBBFQrINbzhtz
 RA9A==
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
Reply-To: christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, shirish.s@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjYuMDcuMTkgdW0gMTY6NTMgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiBPbiAyMDE5LTA3
LTI2IDE6NTUgcC5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMjYuMDcuMTkgdW0g
MTA6NTQgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPj4+IE9uIDIwMTktMDctMjYgOToxMSBhLm0u
LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+IEFtIDI1LjA3LjE5IHVtIDE2OjI0IHNjaHJp
ZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+IE1vdmUgdGhlIGxvZ2ljIHRvIGNsZWFyIEFNREdQ
VV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQyBpbgo+Pj4+PiBhbWRncHVfYm9fZG9fY3JlYXRlIGlu
dG8gc3RhbmRhbG9uZSBoZWxwZXIgc28gaXQgY2FuIGJlIHJldXNlZAo+Pj4+PiBpbiBvdGhlciBm
dW5jdGlvbnMuCj4+Pj4+Cj4+Pj4+IHY0Ogo+Pj4+PiBTd2l0Y2ggdG8gcmV0dXJuIGJvb2wuCj4+
Pj4+Cj4+Pj4+IHY1OiBGaXggdHlwb3MuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
eSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+Pj4+PiAtLS0KPj4+Pj4g
IMKgwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIHwgNjEKPj4+
Pj4gKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4+Pj4+ICDCoMKgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaCB8wqAgMiArCj4+Pj4+ICDCoMKgIDIgZmls
ZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMK
Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKPj4+Pj4g
aW5kZXggOTg5YjdiNS4uODcwMjA2MiAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwo+Pj4+PiBAQCAtNDEzLDYgKzQxMyw0MCBAQCBzdGF0
aWMgYm9vbCBhbWRncHVfYm9fdmFsaWRhdGVfc2l6ZShzdHJ1Y3QKPj4+Pj4gYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKPj4+Pj4gIMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4+Pj4+ICDCoMKgIH0K
Pj4+Pj4gIMKgwqAgK2Jvb2wgYW1kZ3B1X2JvX3N1cHBvcnRfdXN3Yyh1NjQgYm9fZmxhZ3MpCj4+
Pj4+ICt7Cj4+Pj4+ICsKPj4+Pj4gKyNpZmRlZiBDT05GSUdfWDg2XzMyCj4+Pj4+ICvCoMKgwqAg
LyogWFhYOiBXcml0ZS1jb21iaW5lZCBDUFUgbWFwcGluZ3Mgb2YgR1RUIHNlZW0gYnJva2VuIG9u
IDMyLWJpdAo+Pj4+PiArwqDCoMKgwqAgKiBTZWUgaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9ODQ2MjcKPj4+Pj4gK8KgwqDCoMKgICovCj4+Pj4+ICvCoMKgwqAg
cmV0dXJuIGZhbHNlOwo+Pj4+PiArI2VsaWYgZGVmaW5lZChDT05GSUdfWDg2KSAmJiAhZGVmaW5l
ZChDT05GSUdfWDg2X1BBVCkKPj4+Pj4gK8KgwqDCoCAvKiBEb24ndCB0cnkgdG8gZW5hYmxlIHdy
aXRlLWNvbWJpbmluZyB3aGVuIGl0IGNhbid0IHdvcmssIG9yCj4+Pj4+IHRoaW5ncwo+Pj4+PiAr
wqDCoMKgwqAgKiBtYXkgYmUgc2xvdwo+Pj4+PiArwqDCoMKgwqAgKiBTZWUgaHR0cHM6Ly9idWdz
LmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9ODg3NTgKPj4+Pj4gK8KgwqDCoMKgICov
Cj4+Pj4+ICsKPj4+Pj4gKyNpZm5kZWYgQ09ORklHX0NPTVBJTEVfVEVTVAo+Pj4+PiArI3dhcm5p
bmcgUGxlYXNlIGVuYWJsZSBDT05GSUdfTVRSUiBhbmQgQ09ORklHX1g4Nl9QQVQgZm9yIGJldHRl
cgo+Pj4+PiBwZXJmb3JtYW5jZSBcCj4+Pj4+ICvCoMKgwqDCoCB0aGFua3MgdG8gd3JpdGUtY29t
YmluaW5nCj4+Pj4+ICsjZW5kaWYKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIGlmIChib19mbGFncyAm
IEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQykKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIERS
TV9JTkZPX09OQ0UoIlBsZWFzZSBlbmFibGUgQ09ORklHX01UUlIgYW5kIENPTkZJR19YODZfUEFU
Cj4+Pj4+IGZvciAiCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJi
ZXR0ZXIgcGVyZm9ybWFuY2UgdGhhbmtzIHRvIHdyaXRlLWNvbWJpbmluZ1xuIik7Cj4+Pj4gSSBk
b24ndCB0aGluayB0aGlzIG1lc3NhZ2UgYmVsb25ncyBoZXJlLgo+Pj4+Cj4+Pj4gWy4uLl0KPj4+
Pj4gQEAgLTQ2NiwzMyArNTAwLDggQEAgc3RhdGljIGludCBhbWRncHVfYm9fZG9fY3JlYXRlKHN0
cnVjdAo+Pj4+PiBbLi4uXQo+Pj4+PiArwqDCoMKgIGlmICghYW1kZ3B1X2JvX3N1cHBvcnRfdXN3
Yyhiby0+ZmxhZ3MpKQo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm8tPmZsYWdzICY9IH5B
TURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0M7Cj4+Pj4gUmF0aGVyIGhlcmUgd2Ugc2hvdWxk
IGRvICJpZiAoYm9fZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0MKPj4+PiAm
JiAhYW1kZ3B1X2JvX3N1cHBvcnRfdXN3YygpKSIgYW5kIHRoZW4gY2xlYXIgdGhlIGZsYWcgYW5k
IGFsc28gcHJpbnQKPj4+PiB0aGUgd2FybmluZy4KPj4+IFRoYXQgd291bGQgcmVxdWlyZSBkdXBs
aWNhdGluZyB0aGUgQ09ORklHX1g4Nl9QQVQgcmVsYXRlZCBsb2dpYyBoZXJlIGFzCj4+PiB3ZWxs
LCB3aGljaCBpcyBhIGJpdCB1Z2x5Lgo+PiBBY3R1YWxseSBJIHdvdWxkIHNheSB3ZSBzaG91bGQg
ZHJvcCB0aGlzIGV4dHJhIGNoZWNrIGFuZCBhbHdheXMgZW1pdCBhCj4+IG1lc3NhZ2UgdGhhdCBV
U1dDIGlzIGRpc2FibGVkIGZvciB0aGlzIHBsYXRmb3JtLgo+Pgo+PiBXZSBub3cgbmVlZCBpdCBm
b3IgbW9yZSB0aGFuIGp1c3QgYmV0dGVyIHBlcmZvcm1hbmNlIGFuZCBpdCBzaG91bGQgYmUKPj4g
ZXhwbGljaXRseSBub3RlZCB0aGF0IHRoaXMgaXMgbm90IGF2YWlsYWJsZSBpbiB0aGUgbG9ncy4K
PiBBIGxvZyBtZXNzYWdlIHdoaWNoIGRvZXNuJ3QgZXhwbGFpbiB3aHkgaXQncyBkaXNhYmxlZCAv
IGhvdyB0byBlbmFibGUgaXQKPiB3b3VsZCBwcm9iYWJseSBjYXVzZSB1cyB1c2VyIHN1cHBvcnQg
cGFpbi4KCk1obSwgc291bmRzIGxpa2UgeW91IGRpZG4ndCBnb3Qgd2hhdCBJIHdhbnRlZCB0byBz
YXkuCgpObyBsb2cgbWVzc2FnZSB3YXMgZmluZSBhcyBsb25nIGFzIFVTV0Mgd2FzIG9ubHkgYSBw
ZXJmb3JtYW5jZSAKb3B0aW1pemF0aW9uLCBidXQgbm93IGl0IGJlY29tZXMgbWFuZGF0b3J5IGZv
ciBjb3JyZWN0IG9wZXJhdGlvbiBpbiBzb21lIApzZXR0aW5ncy4KCkluIG90aGVyIHdvcmRzIGlu
IHZlcnkgbG93IFZSQU0gY29uZmlndXJhdGlvbnMgaXQgY2FuIGJlIHRoYXQgd2UgY2FuJ3QgCmVu
YWJsZSBoaWdoZXIgcmVzb2x1dGlvbiBiZWNhdXNlIHRoZSBrZXJuZWwgaXMgbm90IGNvbXBpbGVk
IHdpdGggdGhlIApuZWNlc3NhcnkgZmxhZ3MgZm9yIFVTV0Mgc3VwcG9ydC4KClByaW50aW5nIHRo
YXQgd2hlbiB0aGUgZHJpdmVyIGxvYWRzIHNvdW5kcyBsaWtlIHRoZSBiZXN0IHBsYWNlIHRvIG1l
LgoKUmVnYXJkcywKQ2hyaXN0aWFuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
