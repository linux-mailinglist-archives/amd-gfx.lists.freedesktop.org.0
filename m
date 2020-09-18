Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFD126FD8B
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Sep 2020 14:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9F56ECEC;
	Fri, 18 Sep 2020 12:51:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4786ECEC
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Sep 2020 12:51:25 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id q13so7923985ejo.9
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Sep 2020 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=2q2N0xy7Tsn7hIjI0OcHrNdkinXOe+eHB4VMdzO9zlc=;
 b=r1mxQckoK+HhZ7az5iaOREYB84A8wG9pqnZeJMAo/E4FQ+1g+F90d9WbI6RCr1rJs6
 M20NxX5ffffvx1K2cMgw8/OdTkHELInQG/z5KkDjBr0Z4QXUhQFKW30aOIa0zUzd8fS+
 cfcngOJ1RVQvVU3RzdGDLm6b+xyZPPIW7C0QKG3rdvqkelN5NqwjtDPGB4UUxy48UNqa
 HWz32NZZp7xEb/248uHHSRW0+fUNpzcTPjVPjhSDpFBRyRE1dhBPndsO5lc7iCW0Bmkx
 ZRjhFasOVoUsrfxR6/DOYMnR3UNc8py060BjE5R8Ewo+jabR6a29hrIjTTysBHXPe4h0
 PSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2q2N0xy7Tsn7hIjI0OcHrNdkinXOe+eHB4VMdzO9zlc=;
 b=gA9f0Nj20lERscBajeGHZFrJiPM5XomR14EC8qiQxc8QpHhcLDmY0xrO96fYZoDwZ0
 l0WHXWAhnRFNZQOFVAjj5UO+5NsCY5aZhuHU1Ckbv3XvzUJo3ZfsRnYHL1hYGBvD4qrf
 jG9INRIjS5Cy70m1UZkKi06y8cMgB95u8izb/X9RwZXlblnPYzxgC/Eo8DFlKF1MPPPu
 9s8aQKZWsw24j309Am16fgCLG8lDM/RpX6mEzWsbV+6S79YhciabzGvcL8aCKOIRO5Od
 mkUv+TEF7zve8k3kPBmJJtbZ5W2+x93xMSMq5dy6hPe0xqmo5uh344zppax8Bg4f64UM
 44wQ==
X-Gm-Message-State: AOAM530rZsMTu/j4kGFYeMqHjNQj5FsAOIT3ONYPDm0WJUXnAj1uSvnF
 DWtpx6KK7tbMma3yEjtC11sSPHu/wU0=
X-Google-Smtp-Source: ABdhPJyeXaL+gN+a41dWAvNXXlUwqBguLBV5gchxxpCtbuaakplEGeErzTsHlbgGsMRhZbid9JIFBQ==
X-Received: by 2002:a17:906:6b0b:: with SMTP id
 q11mr37131673ejr.412.1600433483651; 
 Fri, 18 Sep 2020 05:51:23 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r16sm2200544ejb.110.2020.09.18.05.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2020 05:51:23 -0700 (PDT)
Subject: Re: [PATCH 3/3] drm/amdgpu: support indirect access reg outside of
 mmio bar (v2)
To: Hawking Zhang <Hawking.Zhang@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Guchun Chen <guchun.chen@amd.com>
References: <20200918123747.7843-1-Hawking.Zhang@amd.com>
 <20200918123747.7843-3-Hawking.Zhang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ee9791e0-4df4-abd9-fb85-17d7e2424b2a@gmail.com>
Date: Fri, 18 Sep 2020 14:51:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200918123747.7843-3-Hawking.Zhang@amd.com>
Content-Language: en-US
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

QW0gMTguMDkuMjAgdW0gMTQ6Mzcgc2NocmllYiBIYXdraW5nIFpoYW5nOgo+IHN1cHBvcnQgYm90
aCBkaXJlY3QgYW5kIGluZGlyZWN0IGFjY2Vzc29yIGluIHVuaWZpZWQKPiBoZWxwZXIgZnVuY3Rp
b25zLgo+Cj4gdjI6IFJldGlyZSBpbmRpcmVjdCBtbWlvIGFjY2VzcyB2aWEgbW1faW5kZXgvZGF0
YQo+Cj4gU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
PgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAgICAgICAg
IHwgMjMgKysrLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVn
ZnMuYyB8ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMgIHwgOTUgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90cmFjZS5oICAgfCAgNCArLQo+ICAgNCBmaWxlcyBjaGFuZ2Vk
LCA1MyBpbnNlcnRpb25zKCspLCA3MSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oCj4gaW5kZXggNDBlZTQ0Yi4uNTAzNDFmMCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdS5oCj4gQEAgLTEwMTksMTIgKzEwMTksMTMgQEAgaW50IGFtZGdwdV9n
cHVfd2FpdF9mb3JfaWRsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Cj4gICAKPiAgIHZv
aWQgYW1kZ3B1X2RldmljZV92cmFtX2FjY2VzcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwg
bG9mZl90IHBvcywKPiAgIAkJCSAgICAgICB1aW50MzJfdCAqYnVmLCBzaXplX3Qgc2l6ZSwgYm9v
bCB3cml0ZSk7Cj4gLXVpbnQzMl90IGFtZGdwdV9tbV9ycmVnKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LCB1aW50MzJfdCByZWcsCj4gK3VpbnQzMl90IGFtZGdwdV9kZXZpY2VfcnJlZyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiArCQkJICAgIHVpbnQzMl90IHJlZywgdWludDMyX3Qg
YWNjX2ZsYWdzKTsKPiArdm9pZCBhbWRncHVfZGV2aWNlX3dyZWcoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCj4gKwkJCXVpbnQzMl90IHJlZywgdWludDMyX3QgdiwKPiAgIAkJCXVpbnQzMl90
IGFjY19mbGFncyk7Cj4gLXZvaWQgYW1kZ3B1X21tX3dyZWcoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIHVpbnQzMl90IHJlZywgdWludDMyX3QgdiwKPiAtCQkgICAgdWludDMyX3QgYWNjX2Zs
YWdzKTsKPiAtdm9pZCBhbWRncHVfbW1fd3JlZ19tbWlvX3JsYyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgdWludDMyX3QgcmVnLCB1aW50MzJfdCB2LAo+IC0JCSAgICB1aW50MzJfdCBhY2Nf
ZmxhZ3MpOwo+ICt2b2lkIGFtZGdwdV9tbV93cmVnX21taW9fcmxjKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LAo+ICsJCQkgICAgIHVpbnQzMl90IHJlZywgdWludDMyX3Qgdik7Cj4gICB2b2lk
IGFtZGdwdV9tbV93cmVnOChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgb2Zm
c2V0LCB1aW50OF90IHZhbHVlKTsKPiAgIHVpbnQ4X3QgYW1kZ3B1X21tX3JyZWc4KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCBvZmZzZXQpOwo+ICAgCj4gQEAgLTEwNTQsOCAr
MTA1NSw4IEBAIGludCBlbXVfc29jX2FzaWNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dik7Cj4gICAgKi8KPiAgICNkZWZpbmUgQU1ER1BVX1JFR1NfTk9fS0lRICAgICgxPDwxKQo+ICAg
Cj4gLSNkZWZpbmUgUlJFRzMyX05PX0tJUShyZWcpIGFtZGdwdV9tbV9ycmVnKGFkZXYsIChyZWcp
LCBBTURHUFVfUkVHU19OT19LSVEpCj4gLSNkZWZpbmUgV1JFRzMyX05PX0tJUShyZWcsIHYpIGFt
ZGdwdV9tbV93cmVnKGFkZXYsIChyZWcpLCAodiksIEFNREdQVV9SRUdTX05PX0tJUSkKPiArI2Rl
ZmluZSBSUkVHMzJfTk9fS0lRKHJlZykgYW1kZ3B1X2RldmljZV9ycmVnKGFkZXYsIChyZWcpLCBB
TURHUFVfUkVHU19OT19LSVEpCj4gKyNkZWZpbmUgV1JFRzMyX05PX0tJUShyZWcsIHYpIGFtZGdw
dV9kZXZpY2Vfd3JlZyhhZGV2LCAocmVnKSwgKHYpLCBBTURHUFVfUkVHU19OT19LSVEpCj4gICAK
PiAgICNkZWZpbmUgUlJFRzMyX0tJUShyZWcpIGFtZGdwdV9raXFfcnJlZyhhZGV2LCAocmVnKSkK
PiAgICNkZWZpbmUgV1JFRzMyX0tJUShyZWcsIHYpIGFtZGdwdV9raXFfd3JlZyhhZGV2LCAocmVn
KSwgKHYpKQo+IEBAIC0xMDYzLDkgKzEwNjQsOSBAQCBpbnQgZW11X3NvY19hc2ljX2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwo+ICAgI2RlZmluZSBSUkVHOChyZWcpIGFtZGdwdV9t
bV9ycmVnOChhZGV2LCAocmVnKSkKPiAgICNkZWZpbmUgV1JFRzgocmVnLCB2KSBhbWRncHVfbW1f
d3JlZzgoYWRldiwgKHJlZyksICh2KSkKPiAgIAo+IC0jZGVmaW5lIFJSRUczMihyZWcpIGFtZGdw
dV9tbV9ycmVnKGFkZXYsIChyZWcpLCAwKQo+IC0jZGVmaW5lIERSRUczMihyZWcpIHByaW50ayhL
RVJOX0lORk8gIlJFR0lTVEVSOiAiICNyZWcgIiA6IDB4JTA4WFxuIiwgYW1kZ3B1X21tX3JyZWco
YWRldiwgKHJlZyksIDApKQo+IC0jZGVmaW5lIFdSRUczMihyZWcsIHYpIGFtZGdwdV9tbV93cmVn
KGFkZXYsIChyZWcpLCAodiksIDApCj4gKyNkZWZpbmUgUlJFRzMyKHJlZykgYW1kZ3B1X2Rldmlj
ZV9ycmVnKGFkZXYsIChyZWcpLCAwKQo+ICsjZGVmaW5lIERSRUczMihyZWcpIHByaW50ayhLRVJO
X0lORk8gIlJFR0lTVEVSOiAiICNyZWcgIiA6IDB4JTA4WFxuIiwgYW1kZ3B1X2RldmljZV9ycmVn
KGFkZXYsIChyZWcpLCAwKSkKPiArI2RlZmluZSBXUkVHMzIocmVnLCB2KSBhbWRncHVfZGV2aWNl
X3dyZWcoYWRldiwgKHJlZyksICh2KSwgMCkKPiAgICNkZWZpbmUgUkVHX1NFVChGSUVMRCwgdikg
KCgodikgPDwgRklFTEQjI19TSElGVCkgJiBGSUVMRCMjX01BU0spCj4gICAjZGVmaW5lIFJFR19H
RVQoRklFTEQsIHYpICgoKHYpIDw8IEZJRUxEIyNfU0hJRlQpICYgRklFTEQjI19NQVNLKQo+ICAg
I2RlZmluZSBSUkVHMzJfUENJRShyZWcpIGFkZXYtPnBjaWVfcnJlZyhhZGV2LCAocmVnKSkKPiBA
QCAtMTExMSw3ICsxMTEyLDcgQEAgaW50IGVtdV9zb2NfYXNpY19pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KTsKPiAgIAkJV1JFRzMyX1NNQyhfUmVnLCB0bXApOyAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ICAgCX0gd2hpbGUgKDApCj4gICAKPiAtI2RlZmluZSBEUkVHMzJfU1lT
KHNxZiwgYWRldiwgcmVnKSBzZXFfcHJpbnRmKChzcWYpLCAjcmVnICIgOiAweCUwOFhcbiIsIGFt
ZGdwdV9tbV9ycmVnKChhZGV2KSwgKHJlZyksIGZhbHNlKSkKPiArI2RlZmluZSBEUkVHMzJfU1lT
KHNxZiwgYWRldiwgcmVnKSBzZXFfcHJpbnRmKChzcWYpLCAjcmVnICIgOiAweCUwOFhcbiIsIGFt
ZGdwdV9kZXZpY2VfcnJlZygoYWRldiksIChyZWcpLCBmYWxzZSkpCj4gICAjZGVmaW5lIFJSRUcz
Ml9JTyhyZWcpIGFtZGdwdV9pb19ycmVnKGFkZXYsIChyZWcpKQo+ICAgI2RlZmluZSBXUkVHMzJf
SU8ocmVnLCB2KSBhbWRncHVfaW9fd3JlZyhhZGV2LCAocmVnKSwgKHYpKQo+ICAgCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCj4gaW5kZXggYWJlMGMyNy4u
MmQxMjViOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGVidWdmcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVn
ZnMuYwo+IEBAIC0yNjcsNyArMjY3LDcgQEAgc3RhdGljIGludCAgYW1kZ3B1X2RlYnVnZnNfcHJv
Y2Vzc19yZWdfb3AoYm9vbCByZWFkLCBzdHJ1Y3QgZmlsZSAqZiwKPiAgIAkJfSBlbHNlIHsKPiAg
IAkJCXIgPSBnZXRfdXNlcih2YWx1ZSwgKHVpbnQzMl90ICopYnVmKTsKPiAgIAkJCWlmICghcikK
PiAtCQkJCWFtZGdwdV9tbV93cmVnX21taW9fcmxjKGFkZXYsICpwb3MgPj4gMiwgdmFsdWUsIDAp
Owo+ICsJCQkJYW1kZ3B1X21tX3dyZWdfbW1pb19ybGMoYWRldiwgKnBvcyA+PiAyLCB2YWx1ZSk7
Cj4gICAJCX0KPiAgIAkJaWYgKHIpIHsKPiAgIAkJCXJlc3VsdCA9IHI7Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IGluZGV4IDc3Nzg1YjIuLjM2NWNlZDYg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gQEAg
LTMwMywxMCArMzAzLDEwIEBAIHZvaWQgYW1kZ3B1X2RldmljZV92cmFtX2FjY2VzcyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgbG9mZl90IHBvcywKPiAgIH0KPiAgIAo+ICAgLyoKPiAtICog
TU1JTyByZWdpc3RlciBhY2Nlc3MgaGVscGVyIGZ1bmN0aW9ucy4KPiArICogcmVnaXN0ZXIgYWNj
ZXNzIGhlbHBlciBmdW5jdGlvbnMuCj4gICAgKi8KPiAgIC8qKgo+IC0gKiBhbWRncHVfbW1fcnJl
ZyAtIHJlYWQgYSBtZW1vcnkgbWFwcGVkIElPIHJlZ2lzdGVyCj4gKyAqIGFtZGdwdV9kZXZpY2Vf
cnJlZyAtIHJlYWQgYSBtZW1vcnkgbWFwcGVkIElPIG9yIGluZGlyZWN0IHJlZ2lzdGVyCj4gICAg
Kgo+ICAgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICAgICogQHJlZzogZHdvcmQg
YWxpZ25lZCByZWdpc3RlciBvZmZzZXQKPiBAQCAtMzE0LDMzICszMTQsMjkgQEAgdm9pZCBhbWRn
cHVfZGV2aWNlX3ZyYW1fYWNjZXNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBsb2ZmX3Qg
cG9zLAo+ICAgICoKPiAgICAqIFJldHVybnMgdGhlIDMyIGJpdCB2YWx1ZSBmcm9tIHRoZSBvZmZz
ZXQgc3BlY2lmaWVkLgo+ICAgICovCj4gLXVpbnQzMl90IGFtZGdwdV9tbV9ycmVnKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCByZWcsCj4gLQkJCXVpbnQzMl90IGFjY19mbGFn
cykKPiArdWludDMyX3QgYW1kZ3B1X2RldmljZV9ycmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAo+ICsJCQkgICAgdWludDMyX3QgcmVnLCB1aW50MzJfdCBhY2NfZmxhZ3MpCj4gICB7Cj4g
ICAJdWludDMyX3QgcmV0Owo+ICAgCj4gICAJaWYgKGFkZXYtPmluX3BjaV9lcnJfcmVjb3Zlcnkp
Cj4gICAJCXJldHVybiAwOwo+ICAgCj4gLQlpZiAoIShhY2NfZmxhZ3MgJiBBTURHUFVfUkVHU19O
T19LSVEpICYmIGFtZGdwdV9zcmlvdl9ydW50aW1lKGFkZXYpICYmCj4gLQkgICAgZG93bl9yZWFk
X3RyeWxvY2soJmFkZXYtPnJlc2V0X3NlbSkpIHsKPiAtCQlyZXQgPSBhbWRncHVfa2lxX3JyZWco
YWRldiwgcmVnKTsKPiAtCQl1cF9yZWFkKCZhZGV2LT5yZXNldF9zZW0pOwo+IC0JCXJldHVybiBy
ZXQ7Cj4gKwlpZiAoKHJlZyAqIDQpIDwgYWRldi0+cm1taW9fc2l6ZSkgewo+ICsJCWlmICghKGFj
Y19mbGFncyAmIEFNREdQVV9SRUdTX05PX0tJUSkgJiYKPiArCQkgICAgYW1kZ3B1X3NyaW92X3J1
bnRpbWUoYWRldikgJiYKPiArCQkgICAgZG93bl9yZWFkX3RyeWxvY2soJmFkZXYtPnJlc2V0X3Nl
bSkpIHsKPiArCQkJcmV0ID0gYW1kZ3B1X2tpcV9ycmVnKGFkZXYsIHJlZyk7Cj4gKwkJCXVwX3Jl
YWQoJmFkZXYtPnJlc2V0X3NlbSk7Cj4gKwkJfSBlbHNlIHsKPiArCQkJcmV0ID0gcmVhZGwoKCh2
b2lkIF9faW9tZW0gKilhZGV2LT5ybW1pbykgKyAocmVnICogNCkpOwo+ICsJCX0KPiArCX0gZWxz
ZSB7Cj4gKwkJcmV0ID0gYWRldi0+cGNpZV9ycmVnKGFkZXYsIHJlZyAqIDQpOwo+ICAgCX0KPiAg
IAo+IC0JaWYgKChyZWcgKiA0KSA8IGFkZXYtPnJtbWlvX3NpemUpCj4gLQkJcmV0ID0gcmVhZGwo
KCh2b2lkIF9faW9tZW0gKilhZGV2LT5ybW1pbykgKyAocmVnICogNCkpOwo+IC0JZWxzZSB7Cj4g
LQkJdW5zaWduZWQgbG9uZyBmbGFnczsKPiAtCj4gLQkJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYt
Pm1taW9faWR4X2xvY2ssIGZsYWdzKTsKPiAtCQl3cml0ZWwoKHJlZyAqIDQpLCAoKHZvaWQgX19p
b21lbSAqKWFkZXYtPnJtbWlvKSArIChtbU1NX0lOREVYICogNCkpOwo+IC0JCXJldCA9IHJlYWRs
KCgodm9pZCBfX2lvbWVtICopYWRldi0+cm1taW8pICsgKG1tTU1fREFUQSAqIDQpKTsKPiAtCQlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT5tbWlvX2lkeF9sb2NrLCBmbGFncyk7Cj4gLQl9
Cj4gKwl0cmFjZV9hbWRncHVfZGV2aWNlX3JyZWcoYWRldi0+cGRldi0+ZGV2aWNlLCByZWcsIHJl
dCk7Cj4gICAKPiAtCXRyYWNlX2FtZGdwdV9tbV9ycmVnKGFkZXYtPnBkZXYtPmRldmljZSwgcmVn
LCByZXQpOwo+ICAgCXJldHVybiByZXQ7Cj4gICB9Cj4gICAKPiBAQCAtMzk0LDI5ICszOTAsOCBA
QCB2b2lkIGFtZGdwdV9tbV93cmVnOChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMy
X3Qgb2Zmc2V0LCB1aW50OF90IHZhbHVlKQo+ICAgCQlCVUcoKTsKPiAgIH0KPiAgIAo+IC1zdGF0
aWMgaW5saW5lIHZvaWQgYW1kZ3B1X21tX3dyZWdfbW1pbyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKPiAtCQkJCSAgICAgICB1aW50MzJfdCByZWcsIHVpbnQzMl90IHYsCj4gLQkJCQkgICAg
ICAgdWludDMyX3QgYWNjX2ZsYWdzKQo+IC17Cj4gLQlpZiAoYWRldi0+aW5fcGNpX2Vycl9yZWNv
dmVyeSkKPiAtCQlyZXR1cm47Cj4gLQo+IC0JdHJhY2VfYW1kZ3B1X21tX3dyZWcoYWRldi0+cGRl
di0+ZGV2aWNlLCByZWcsIHYpOwo+IC0KPiAtCWlmICgocmVnICogNCkgPCBhZGV2LT5ybW1pb19z
aXplKQo+IC0JCXdyaXRlbCh2LCAoKHZvaWQgX19pb21lbSAqKWFkZXYtPnJtbWlvKSArIChyZWcg
KiA0KSk7Cj4gLQllbHNlIHsKPiAtCQl1bnNpZ25lZCBsb25nIGZsYWdzOwo+IC0KPiAtCQlzcGlu
X2xvY2tfaXJxc2F2ZSgmYWRldi0+bW1pb19pZHhfbG9jaywgZmxhZ3MpOwo+IC0JCXdyaXRlbCgo
cmVnICogNCksICgodm9pZCBfX2lvbWVtICopYWRldi0+cm1taW8pICsgKG1tTU1fSU5ERVggKiA0
KSk7Cj4gLQkJd3JpdGVsKHYsICgodm9pZCBfX2lvbWVtICopYWRldi0+cm1taW8pICsgKG1tTU1f
REFUQSAqIDQpKTsKPiAtCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT5tbWlvX2lkeF9s
b2NrLCBmbGFncyk7Cj4gLQl9Cj4gLX0KPiAtCj4gICAvKioKPiAtICogYW1kZ3B1X21tX3dyZWcg
LSB3cml0ZSB0byBhIG1lbW9yeSBtYXBwZWQgSU8gcmVnaXN0ZXIKPiArICogYW1kZ3B1X2Rldmlj
ZV93cmVnIC0gd3JpdGUgdG8gYSBtZW1vcnkgbWFwcGVkIElPIG9yIGluZGlyZWN0IHJlZ2lzdGVy
Cj4gICAgKgo+ICAgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICAgICogQHJlZzog
ZHdvcmQgYWxpZ25lZCByZWdpc3RlciBvZmZzZXQKPiBAQCAtNDI1LDIwICs0MDAsMjcgQEAgc3Rh
dGljIGlubGluZSB2b2lkIGFtZGdwdV9tbV93cmVnX21taW8oc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCj4gICAgKgo+ICAgICogV3JpdGVzIHRoZSB2YWx1ZSBzcGVjaWZpZWQgdG8gdGhlIG9m
ZnNldCBzcGVjaWZpZWQuCj4gICAgKi8KPiAtdm9pZCBhbWRncHVfbW1fd3JlZyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgcmVnLCB1aW50MzJfdCB2LAo+IC0JCSAgICB1aW50
MzJfdCBhY2NfZmxhZ3MpCj4gK3ZvaWQgYW1kZ3B1X2RldmljZV93cmVnKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LAo+ICsJCQl1aW50MzJfdCByZWcsIHVpbnQzMl90IHYsCj4gKwkJCXVpbnQz
Ml90IGFjY19mbGFncykKPiAgIHsKPiAgIAlpZiAoYWRldi0+aW5fcGNpX2Vycl9yZWNvdmVyeSkK
PiAgIAkJcmV0dXJuOwo+ICAgCj4gLQlpZiAoIShhY2NfZmxhZ3MgJiBBTURHUFVfUkVHU19OT19L
SVEpICYmIGFtZGdwdV9zcmlvdl9ydW50aW1lKGFkZXYpICYmCj4gLQkgICAgZG93bl9yZWFkX3Ry
eWxvY2soJmFkZXYtPnJlc2V0X3NlbSkpIHsKPiAtCQlhbWRncHVfa2lxX3dyZWcoYWRldiwgcmVn
LCB2KTsKPiAtCQl1cF9yZWFkKCZhZGV2LT5yZXNldF9zZW0pOwo+IC0JCXJldHVybjsKPiArCWlm
ICgocmVnICogNCkgPCBhZGV2LT5ybW1pb19zaXplKSB7Cj4gKwkJaWYgKCEoYWNjX2ZsYWdzICYg
QU1ER1BVX1JFR1NfTk9fS0lRKSAmJgo+ICsJCSAgICBhbWRncHVfc3Jpb3ZfcnVudGltZShhZGV2
KSAmJgo+ICsJCSAgICBkb3duX3JlYWRfdHJ5bG9jaygmYWRldi0+cmVzZXRfc2VtKSkgewo+ICsJ
CQlhbWRncHVfa2lxX3dyZWcoYWRldiwgcmVnLCB2KTsKPiArCQkJdXBfcmVhZCgmYWRldi0+cmVz
ZXRfc2VtKTsKPiArCQl9IGVsc2Ugewo+ICsJCQl3cml0ZWwodiwgKCh2b2lkIF9faW9tZW0gKilh
ZGV2LT5ybW1pbykgKyAocmVnICogNCkpOwo+ICsJCX0KPiArCX0gZWxzZSB7Cj4gKwkJYWRldi0+
cGNpZV93cmVnKGFkZXYsIHJlZyAqIDQsIHYpOwo+ICAgCX0KPiAgIAo+IC0JYW1kZ3B1X21tX3dy
ZWdfbW1pbyhhZGV2LCByZWcsIHYsIGFjY19mbGFncyk7Cj4gKwl0cmFjZV9hbWRncHVfZGV2aWNl
X3dyZWcoYWRldi0+cGRldi0+ZGV2aWNlLCByZWcsIHYpOwo+ICAgfQo+ICAgCj4gICAvKgo+IEBA
IC00NDYsMjEgKzQyOCwyMCBAQCB2b2lkIGFtZGdwdV9tbV93cmVnKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCB1aW50MzJfdCByZWcsIHVpbnQzMl90IHYsCj4gICAgKgo+ICAgICogdGhpcyBm
dW5jdGlvbiBpcyBpbnZva2VkIG9ubHkgdGhlIGRlYnVnZnMgcmVnaXN0ZXIgYWNjZXNzCj4gICAg
KiAqLwo+IC12b2lkIGFtZGdwdV9tbV93cmVnX21taW9fcmxjKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LCB1aW50MzJfdCByZWcsIHVpbnQzMl90IHYsCj4gLQkJICAgIHVpbnQzMl90IGFjY19m
bGFncykKPiArdm9pZCBhbWRncHVfbW1fd3JlZ19tbWlvX3JsYyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKPiArCQkJICAgICB1aW50MzJfdCByZWcsIHVpbnQzMl90IHYpCj4gICB7Cj4gICAJ
aWYgKGFkZXYtPmluX3BjaV9lcnJfcmVjb3ZlcnkpCj4gICAJCXJldHVybjsKPiAgIAo+ICAgCWlm
IChhbWRncHVfc3Jpb3ZfZnVsbGFjY2VzcyhhZGV2KSAmJgo+IC0JCWFkZXYtPmdmeC5ybGMuZnVu
Y3MgJiYKPiAtCQlhZGV2LT5nZngucmxjLmZ1bmNzLT5pc19ybGNnX2FjY2Vzc19yYW5nZSkgewo+
IC0KPiArCSAgICBhZGV2LT5nZngucmxjLmZ1bmNzICYmCj4gKwkgICAgYWRldi0+Z2Z4LnJsYy5m
dW5jcy0+aXNfcmxjZ19hY2Nlc3NfcmFuZ2UpIHsKPiAgIAkJaWYgKGFkZXYtPmdmeC5ybGMuZnVu
Y3MtPmlzX3JsY2dfYWNjZXNzX3JhbmdlKGFkZXYsIHJlZykpCj4gICAJCQlyZXR1cm4gYWRldi0+
Z2Z4LnJsYy5mdW5jcy0+cmxjZ193cmVnKGFkZXYsIHJlZywgdik7Cj4gKwl9IGVsc2Ugewo+ICsJ
CXdyaXRlbCh2LCAoKHZvaWQgX19pb21lbSAqKWFkZXYtPnJtbWlvKSArIChyZWcgKiA0KSk7Cj4g
ICAJfQo+IC0KPiAtCWFtZGdwdV9tbV93cmVnX21taW8oYWRldiwgcmVnLCB2LCBhY2NfZmxhZ3Mp
Owo+ICAgfQo+ICAgCj4gICAvKioKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3RyYWNlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHJhY2UuaAo+IGluZGV4IDYzZTczNGEuLjVkYTIwZmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3RyYWNlLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdHJhY2UuaAo+IEBAIC0zNSw3ICszNSw3IEBACj4gICAjZGVmaW5l
IEFNREdQVV9KT0JfR0VUX1RJTUVMSU5FX05BTUUoam9iKSBcCj4gICAJIGpvYi0+YmFzZS5zX2Zl
bmNlLT5maW5pc2hlZC5vcHMtPmdldF90aW1lbGluZV9uYW1lKCZqb2ItPmJhc2Uuc19mZW5jZS0+
ZmluaXNoZWQpCj4gICAKPiAtVFJBQ0VfRVZFTlQoYW1kZ3B1X21tX3JyZWcsCj4gK1RSQUNFX0VW
RU5UKGFtZGdwdV9kZXZpY2VfcnJlZywKPiAgIAkgICAgVFBfUFJPVE8odW5zaWduZWQgZGlkLCB1
aW50MzJfdCByZWcsIHVpbnQzMl90IHZhbHVlKSwKPiAgIAkgICAgVFBfQVJHUyhkaWQsIHJlZywg
dmFsdWUpLAo+ICAgCSAgICBUUF9TVFJVQ1RfX2VudHJ5KAo+IEBAIC01NCw3ICs1NCw3IEBAIFRS
QUNFX0VWRU5UKGFtZGdwdV9tbV9ycmVnLAo+ICAgCQkgICAgICAodW5zaWduZWQgbG9uZylfX2Vu
dHJ5LT52YWx1ZSkKPiAgICk7Cj4gICAKPiAtVFJBQ0VfRVZFTlQoYW1kZ3B1X21tX3dyZWcsCj4g
K1RSQUNFX0VWRU5UKGFtZGdwdV9kZXZpY2Vfd3JlZywKPiAgIAkgICAgVFBfUFJPVE8odW5zaWdu
ZWQgZGlkLCB1aW50MzJfdCByZWcsIHVpbnQzMl90IHZhbHVlKSwKPiAgIAkgICAgVFBfQVJHUyhk
aWQsIHJlZywgdmFsdWUpLAo+ICAgCSAgICBUUF9TVFJVQ1RfX2VudHJ5KAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
