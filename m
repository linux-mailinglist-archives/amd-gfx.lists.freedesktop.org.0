Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEC4AD881
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 14:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DD7892AD;
	Mon,  9 Sep 2019 12:07:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FEA892AD
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 12:07:36 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q17so8822282wrx.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 09 Sep 2019 05:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xtQx423risZrpCtRfMKjsiweJpEhSJ4RlnOlBiNE44Q=;
 b=EZScDbaZYScDUsvhVuyzZcx/7oA/jzj9cv2MnFMfUqWjQqVhU8bm2oboIhF9sapQ+O
 Tuptd0hJeXfRbLzwWxCCC3MDEKxPz+G4BCRq6S3IwDi7pJdpij/A7/zS82OYPBvRYyY1
 v4pzs5mQIvk7SUWKbnm0IlRsbmhy+Ei5jXwT/Gk7hAbT6EtlzJ1JUiaAQSKsDuzady7K
 L/Fl2ADY3rTrO2d0nRpIwpoXB2y+IPmhql2kKUOoQ3b/4npJYf3/1Fdueah4IgCDWOP+
 LaUHTnSByBux3+j5XEKd9bkIj/RzrRrvppC/VW9BkUgbPGpDib1GEDssoyqHGX9+KI03
 G/2Q==
X-Gm-Message-State: APjAAAWHg+VHjizPS7YWcdNN4G/UO9Cua3rBo8/3cPuETQ0kBpjTZCdB
 4Xn53yrQ7NSA5OFVIttums/iXv8t
X-Google-Smtp-Source: APXvYqyDPT2wN9fgnIk+qYPWT6DZHU5KGKT78bWQcdhUmlfZiTc8dTpVIOhflILO4FF3CCrm4AOOjg==
X-Received: by 2002:a5d:6306:: with SMTP id i6mr14230165wru.323.1568030855156; 
 Mon, 09 Sep 2019 05:07:35 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x6sm22876838wmf.38.2019.09.09.05.07.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Sep 2019 05:07:34 -0700 (PDT)
Subject: Re: [PATCH 9/9] drm/amdgpu: add graceful VM fault handling v2
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190904150230.13885-1-christian.koenig@amd.com>
 <20190904150230.13885-10-christian.koenig@amd.com>
 <4b5365d3-cc8c-1c2a-2675-f74baa4b9e8b@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3051c690-fabb-953a-3ae6-2cccfe8a502c@gmail.com>
Date: Mon, 9 Sep 2019 14:07:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4b5365d3-cc8c-1c2a-2675-f74baa4b9e8b@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=xtQx423risZrpCtRfMKjsiweJpEhSJ4RlnOlBiNE44Q=;
 b=A6IwE2/ihosc7gJ0OV2CnOB8vtWw2ZK4OVdU33u79hdXTzHRcyad44oYxzQuZJ+uSE
 B3wvP5RmlQuiPRXE0KlsYibxrD2zKfrr/MUbW4JJYAHClHy/YYET1BXjBTuwPWTY8Pbg
 2dCq0sc9nywHLu91djMrcKbvqwTfI4LImXmbIL39ID03PX128pyEbZRl6yP4q26tEc/3
 61Q5dnrXN2Y/iTGemUPdNXtMq+BLSBswf2hkvvS1BxK+tK/wylTTu9+GMO4jOI7M7ihn
 d/uFSoVZYw5XZ/512UAxk4mSdzPZQI9o8cGQ7TbAku0FZA1tPyP4Df7YWpTIPEDi5FwM
 QR/g==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDUuMDkuMTkgdW0gMDA6NDcgc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gT24gMjAxOS0w
OS0wNCAxMTowMiBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBOZXh0IHN0ZXAgdG93
YXJkcyBITU0gc3VwcG9ydC4gRm9yIG5vdyBqdXN0IHNpbGVuY2UgdGhlIHJldHJ5IGZhdWx0IGFu
ZAo+PiBvcHRpb25hbGx5IHJlZGlyZWN0IHRoZSByZXF1ZXN0IHRvIHRoZSBkdW1teSBwYWdlLgo+
Pgo+PiB2MjogbWFrZSBzdXJlIHRoZSBWTSBpcyBub3QgZGVzdHJveWVkIHdoaWxlIHdlIGhhbmRs
ZSB0aGUgZmF1bHQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4gLS0tCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92bS5jIHwgNzQgKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggfCAgMiArCj4+ICAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgIHwgIDQgKysKPj4gICAgMyBmaWxlcyBjaGFu
Z2VkLCA4MCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5jCj4+IGluZGV4IDk1MTYwOGZjMTkyNS4uNDEwZDg5OTY2YTY2IDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+PiBAQCAtMzE0MiwzICszMTQyLDc3IEBA
IHZvaWQgYW1kZ3B1X3ZtX3NldF90YXNrX2luZm8oc3RydWN0IGFtZGdwdV92bSAqdm0pCj4+ICAg
IAkJfQo+PiAgICAJfQo+PiAgICB9Cj4+ICsKPj4gKy8qKgo+PiArICogYW1kZ3B1X3ZtX2hhbmRs
ZV9mYXVsdCAtIGdyYWNlZnVsIGhhbmRsaW5nIG9mIFZNIGZhdWx0cy4KPj4gKyAqIEBhZGV2OiBh
bWRncHUgZGV2aWNlIHBvaW50ZXIKPj4gKyAqIEBwYXNpZDogUEFTSUQgb2YgdGhlIFZNCj4+ICsg
KiBAYWRkcjogQWRkcmVzcyBvZiB0aGUgZmF1bHQKPj4gKyAqCj4+ICsgKiBUcnkgdG8gZ3JhY2Vm
dWxseSBoYW5kbGUgYSBWTSBmYXVsdC4gUmV0dXJuIHRydWUgaWYgdGhlIGZhdWx0IHdhcyBoYW5k
bGVkIGFuZAo+PiArICogc2hvdWxkbid0IGJlIHJlcG9ydGVkIGFueSBtb3JlLgo+PiArICovCj4+
ICtib29sIGFtZGdwdV92bV9oYW5kbGVfZmF1bHQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IHVuc2lnbmVkIGludCBwYXNpZCwKPj4gKwkJCSAgICB1aW50NjRfdCBhZGRyKQo+PiArewo+PiAr
CXN0cnVjdCBhbWRncHVfcmluZyAqcmluZyA9ICZhZGV2LT5zZG1hLmluc3RhbmNlWzBdLnBhZ2U7
Cj4+ICsJc3RydWN0IGFtZGdwdV9ibyAqcm9vdDsKPj4gKwl1aW50NjRfdCB2YWx1ZSwgZmxhZ3M7
Cj4+ICsJc3RydWN0IGFtZGdwdV92bSAqdm07Cj4+ICsJbG9uZyByOwo+PiArCj4+ICsJaWYgKCFy
aW5nLT5zY2hlZC5yZWFkeSkKPj4gKwkJcmV0dXJuIGZhbHNlOwo+PiArCj4+ICsJc3Bpbl9sb2Nr
KCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2spOwo+PiArCXZtID0gaWRyX2ZpbmQoJmFkZXYt
PnZtX21hbmFnZXIucGFzaWRfaWRyLCBwYXNpZCk7Cj4+ICsJaWYgKHZtKQo+PiArCQlyb290ID0g
YW1kZ3B1X2JvX3JlZih2bS0+cm9vdC5iYXNlLmJvKTsKPj4gKwllbHNlCj4+ICsJCXJvb3QgPSBO
VUxMOwo+PiArCXNwaW5fdW5sb2NrKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2spOwo+PiAr
Cj4+ICsJaWYgKCFyb290KQo+PiArCQlyZXR1cm4gZmFsc2U7Cj4+ICsKPj4gKwlyID0gYW1kZ3B1
X2JvX3Jlc2VydmUocm9vdCwgdHJ1ZSk7Cj4+ICsJaWYgKHIpCj4+ICsJCWdvdG8gZXJyb3JfdW5y
ZWY7Cj4+ICsKPj4gKwlzcGluX2xvY2soJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jayk7Cj4+
ICsJdm0gPSBpZHJfZmluZCgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9pZHIsIHBhc2lkKTsKPj4g
KwlzcGluX3VubG9jaygmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2NrKTsKPiBJIHRoaW5rIHRo
aXMgZGVzZXJ2ZXMgYSBjb21tZW50LiBJZiBJIHVuZGVyc3RhbmQgaXQgY29ycmVjdGx5LCB5b3Un
cmUKPiBsb29raW5nIHVwIHRoZSB2bSB0d2ljZSBzbyB0aGF0IHlvdSBoYXZlIHRoZSBWTSByb290
IHJlc2VydmF0aW9uIHRvCj4gcHJvdGVjdCBhZ2FpbnN0IHVzZXItYWZ0ZXItZnJlZS4gT3RoZXJ3
aXNlIHRoZSB2bSBwb2ludGVyIGlzIG9ubHkgdmFsaWQKPiBhcyBsb25nIGFzIHlvdSdyZSBob2xk
aW5nIHRoZSBzcGluLWxvY2suCj4KPgo+PiArCj4+ICsJaWYgKCF2bSB8fCB2bS0+cm9vdC5iYXNl
LmJvICE9IHJvb3QpCj4gVGhlIGNoZWNrIG9mIHZtLT5yb290LmJhc2UuYm8gc2hvdWxkIHByb2Jh
Ymx5IHN0aWxsIGJlIHVuZGVyIHRoZQo+IHNwaW5fbG9jay4gQmVjYXVzZSB5b3UncmUgbm90IHN1
cmUgeWV0IGl0J3MgdGhlIHJpZ2h0IFZNLCB5b3UgY2FuJ3QgcmVseQo+IG9uIHRoZSByZXNlcnZh
dGlvbiBoZXJlIHRvIHByZXZlbnQgdXNlLWFmdGVyLWZyZWUuCgpHb29kIHBvaW50LCBnb2luZyB0
byBmaXggdGhhdC4KCj4KPgo+PiArCQlnb3RvIGVycm9yX3VubG9jazsKPj4gKwo+PiArCWFkZHIg
Lz0gQU1ER1BVX0dQVV9QQUdFX1NJWkU7Cj4+ICsJZmxhZ3MgPSBBTURHUFVfUFRFX1ZBTElEIHwg
QU1ER1BVX1BURV9TTk9PUEVEIHwKPj4gKwkJQU1ER1BVX1BURV9TWVNURU07Cj4+ICsKPj4gKwlp
ZiAoYW1kZ3B1X3ZtX2ZhdWx0X3N0b3AgPT0gQU1ER1BVX1ZNX0ZBVUxUX1NUT1BfTkVWRVIpIHsK
Pj4gKwkJLyogUmVkaXJlY3QgdGhlIGFjY2VzcyB0byB0aGUgZHVtbXkgcGFnZSAqLwo+PiArCQl2
YWx1ZSA9IGFkZXYtPmR1bW15X3BhZ2VfYWRkcjsKPj4gKwkJZmxhZ3MgfD0gQU1ER1BVX1BURV9F
WEVDVVRBQkxFIHwgQU1ER1BVX1BURV9SRUFEQUJMRSB8Cj4+ICsJCQlBTURHUFVfUFRFX1dSSVRF
QUJMRTsKPj4gKwl9IGVsc2Ugewo+PiArCQl2YWx1ZSA9IDA7Cj4+ICsJfQo+PiArCj4+ICsJciA9
IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhhZGV2LCB2bSwgdHJ1ZSwgTlVMTCwgYWRkciwg
YWRkciArIDEsCj4+ICsJCQkJCWZsYWdzLCB2YWx1ZSwgTlVMTCwgTlVMTCk7Cj4+ICsJaWYgKHIp
Cj4+ICsJCWdvdG8gZXJyb3JfdW5sb2NrOwo+PiArCj4+ICsJciA9IGFtZGdwdV92bV91cGRhdGVf
cGRlcyhhZGV2LCB2bSwgdHJ1ZSk7Cj4+ICsKPj4gK2Vycm9yX3VubG9jazoKPj4gKwlhbWRncHVf
Ym9fdW5yZXNlcnZlKHJvb3QpOwo+PiArCWlmIChyIDwgMCkKPj4gKwkJRFJNX0VSUk9SKCJDYW4n
dCBoYW5kbGUgcGFnZSBmYXVsdCAoJWxkKVxuIiwgcik7Cj4+ICsKPj4gK2Vycm9yX3VucmVmOgo+
PiArCWFtZGdwdV9ib191bnJlZigmcm9vdCk7Cj4+ICsKPj4gKwlyZXR1cm4gZmFsc2U7Cj4+ICt9
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oCj4+IGluZGV4IDBhOTdkYzgz
OWYzYi4uNGRiYmUxYjZiNDEzIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uaAo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdm0uaAo+PiBAQCAtNDEzLDYgKzQxMyw4IEBAIHZvaWQgYW1kZ3B1X3ZtX2NoZWNrX2NvbXB1
dGVfYnVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKPj4gICAgCj4+ICAgIHZvaWQgYW1k
Z3B1X3ZtX2dldF90YXNrX2luZm8oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVuc2lnbmVk
IGludCBwYXNpZCwKPj4gICAgCQkJICAgICBzdHJ1Y3QgYW1kZ3B1X3Rhc2tfaW5mbyAqdGFza19p
bmZvKTsKPj4gK2Jvb2wgYW1kZ3B1X3ZtX2hhbmRsZV9mYXVsdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgdW5zaWduZWQgaW50IHBhc2lkLAo+PiArCQkJICAgIHVpbnQ2NF90IGFkZHIpOwo+
PiAgICAKPj4gICAgdm9pZCBhbWRncHVfdm1fc2V0X3Rhc2tfaW5mbyhzdHJ1Y3QgYW1kZ3B1X3Zt
ICp2bSk7Cj4+ICAgIAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKPj4gaW5k
ZXggOWQxNTY3OWRmNmUwLi4xNWExY2U1MWJlZmEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYwo+PiBAQCAtMzUzLDYgKzM1MywxMCBAQCBzdGF0aWMgaW50IGdtY192
OV8wX3Byb2Nlc3NfaW50ZXJydXB0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+PiAgICAJ
fQo+PiAgICAKPj4gICAgCS8qIElmIGl0J3MgdGhlIGZpcnN0IGZhdWx0IGZvciB0aGlzIGFkZHJl
c3MsIHByb2Nlc3MgaXQgbm9ybWFsbHkgKi8KPj4gKwlpZiAocmV0cnlfZmF1bHQgJiYgIWluX2lu
dGVycnVwdCgpICYmCj4+ICsJICAgIGFtZGdwdV92bV9oYW5kbGVfZmF1bHQoYWRldiwgZW50cnkt
PnBhc2lkLCBhZGRyKSkKPj4gKwkJcmV0dXJuIDE7IC8qIFRoaXMgYWxzbyBwcmV2ZW50cyBzZW5k
aW5nIGl0IHRvIEtGRCAqLwo+IFRoZSAhaW5faW50ZXJydXB0KCkgaXMgbWVhbnQgdG8gb25seSBk
byB0aGlzIG9uIHRoZSByZXJvdXRlZCBpbnRlcnJ1cHQKPiByaW5nIHRoYXQncyBoYW5kbGVkIGJ5
IGEgd29ya2VyIGZ1bmN0aW9uPwoKWWVzLCBleGFjdGx5LiBCdXQgSSBwbGFuIHRvIGFkZCBhIHdv
cmthcm91bmQgd2hlcmUgdGhlIENQVSByZWRpcmVjdHMgdGhlIApmYXVsdCB0byB0aGUgb3RoZXIg
cmluZyBidWZmZXIgZm9yIGZpcm13YXJlIHZlcnNpb25zIHdoaWNoIGRvZXNuJ3QgaGF2ZSAKdGhh
dC4KCkFkZHMgcXVpdGUgYSBidW5jaCBvZiBvdmVyaGVhZCBvbiBWZWdhMTAsIGJlY2F1c2Ugb2Yg
dGhlIGZhdWx0IHN0b3JtIGJ1dCAKc2hvdWxkIHdvcmsgZmluZSBvbiBWZWdhMjAuCgpLZXkgcG9p
bnQgaXMgdGhhdCB3ZSBhbHJlYWR5IHJlbGVhc2VkIGZpcm13YXJlIHdpdGhvdXQgdGhlIHJlZGly
ZWN0aW9uLCAKYnV0IGl0J3Mgc3RpbGwgYmV0dGVyIHRvIGhhdmUgdGhhdCB0aGFuIHRvIHJ1biBp
bnRvIHRoZSBzdG9ybS4KCj4gTG9va3MgbGlrZSBhbWRncHVfdm1faGFuZGxlX2ZhdWx0IG5ldmVy
IHJldHVybnMgdHJ1ZSBmb3Igbm93LiBTbyB3ZSdsbAo+IG5ldmVyIGdldCB0byB0aGUgInJldHVy
biAxIiBoZXJlLgoKT2gsIHllcyB0aGF0IGFjdHVhbGx5IGJlbG9uZ3MgaW50byBhIGZvbGxvdyB1
cCBwYXRjaC4KClRoYW5rcywKQ2hyaXN0aWFuLgoKPgo+IFJlZ2FyZHMsCj4gICDCoCBGZWxpeAo+
Cj4KPj4gKwo+PiAgICAJaWYgKCFhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsKPj4gICAgCQkvKgo+
PiAgICAJCSAqIElzc3VlIGEgZHVtbXkgcmVhZCB0byB3YWl0IGZvciB0aGUgc3RhdHVzIHJlZ2lz
dGVyIHRvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
