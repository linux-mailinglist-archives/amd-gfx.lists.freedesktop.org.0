Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F36F0FE82
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 19:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A9B890A6;
	Tue, 30 Apr 2019 17:10:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9EA890A6
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 17:10:22 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 26so4678900wmj.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 10:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MgK0v1SxeYlBw+d6wBPXdkbdeVswtt6nDyrmZ1lYX1k=;
 b=CJBpOI7G2pdiFkXw1nM9CNmFlSWyDfxk9K3+lU0Xr1LOyXObAuKJrsP2kPDH/NN5+V
 Org8moyQucdVilYopjwhDqS81wFn3oUtelWLSvkzR+9C2z829qH6vn6tSMzeeGpkav5Q
 vOwYaBKz9J6vtcW2CLaMM63LG8Xc5Yjl7gfvCZ3B9YaJTCtLJeXD5SB+N6KYEv8qHmqO
 F4pTwkAIPt8V92kQpaf9Ni+slAnLv61u9V4ex54MMcd84i3iQtdqhq71ACMowKSqvSxd
 PeCSMx24k+mTOpRekcqjlOR4VKICpU+iSsnhyDrEi8B07MGuphe3XPjGI1e0HqyVJHkt
 AziQ==
X-Gm-Message-State: APjAAAU+PQPJoHB9agIFB5ecbtaLQO6P+gPqyVjWAlHV0aE2f4HvEHO4
 D640AltJd2Tv60/b8H7xmhAuxeKB
X-Google-Smtp-Source: APXvYqwlvUcJHHZkb+VkMJT9DgfpwrPf8vKa7qXy+QJ+BKTgjkf7KhIs31Valu1SmB4eh9OQp42UOw==
X-Received: by 2002:a7b:cf0c:: with SMTP id l12mr3767562wmg.132.1556644221519; 
 Tue, 30 Apr 2019 10:10:21 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w10sm3538031wrv.90.2019.04.30.10.10.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 10:10:20 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Rearm IRQ in Vega10 SR-IOV if IRQ lost
To: Trigger Huang <Trigger.Huang@amd.com>, amd-gfx@lists.freedesktop.org
References: <1556637284-715-1-git-send-email-Trigger.Huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c9c462e1-f73f-64f0-31f8-3bbceefbea60@gmail.com>
Date: Tue, 30 Apr 2019 19:10:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556637284-715-1-git-send-email-Trigger.Huang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=MgK0v1SxeYlBw+d6wBPXdkbdeVswtt6nDyrmZ1lYX1k=;
 b=Huxq8CNpByTvQH/cvO63VuKd8PtZRuiH3JljiiHYblKyHnxYjafpd2WWxAvO+kB8Ab
 Kbm/GvKOI9KQAIHYn2uPl0YArR3CXl71hPLElJkUIdzVhRRRsB7FGEVPB/QerrAznHa4
 dDhVty2Yz4JCjDd3qNHyvogkAEFduIw6+/rsP4cRaVYfUPxlO2z0fb8MJ5QzdL5AicC4
 AGtzNVvWpMSfPvzGZjeEtY9K+1C1PmLiSmMJk58eLRAEqRF0OPzBa+MFn3Nzi+IuFoz6
 rcz/CVokuNzBTvnYhD5P+ujqBjyKvyjsif2eNoMXTpFXn+Y+NCDWlq3LAt3JKWYwtycR
 e7sQ==
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

QW0gMzAuMDQuMTkgdW0gMTc6MTQgc2NocmllYiBUcmlnZ2VyIEh1YW5nOgo+IEluIE11bHRpLVZG
cyBzdHJlc3MgdGVzdCwgc29tZXRpbWVzIHdlIHNlZSBJUlEgbG9zdCB3aGVuIHJ1bm5pbmcKPiBi
ZW5jaG1hcmssIGp1c3QgcmVhcm0gaXQuCgpXZWxsIEkgdGhpbmsgSSBoYXZlIHNlZW4gdGhhdCBv
biBiYXJlIG1ldGFsIGFzIHdlbGwsIGl0IHdvdWxkIGNlcnRhaW5seSAKZXhwbGFpbiBzb21lIHZl
cnkgb2RkIGJlaGF2aW9yIEkndmUgZ290IGZyb20gdGhlIElIIGJsb2NrLgoKSGF2ZSB5b3UgcGlu
Z2VkIHRoZSBodyBndXlzIGFib3V0IHRoYXQgYWxyZWFkeT8KCj4gU2lnbmVkLW9mZi1ieTogVHJp
Z2dlciBIdWFuZyA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPgoKQWNrZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS92ZWdhMTBfaWguYyB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2lo
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMTBfaWguYwo+IGluZGV4IDFiMmY2
OWEuLjhkODlhYjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVn
YTEwX2loLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMTBfaWguYwo+
IEBAIC0zMSw3ICszMSw3IEBACj4gICAjaW5jbHVkZSAic29jMTVfY29tbW9uLmgiCj4gICAjaW5j
bHVkZSAidmVnYTEwX2loLmgiCj4gICAKPiAtCj4gKyNkZWZpbmUgTUFYX1JFQVJNX1JFVFJZIDEw
Cj4gICAKPiAgIHN0YXRpYyB2b2lkIHZlZ2ExMF9paF9zZXRfaW50ZXJydXB0X2Z1bmNzKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KTsKPiAgIAo+IEBAIC0zODIsNiArMzgyLDM4IEBAIHN0YXRp
YyB2b2lkIHZlZ2ExMF9paF9kZWNvZGVfaXYoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4g
ICB9Cj4gICAKPiAgIC8qKgo+ICsgKiB2ZWdhMTBfaWhfaXJxX3JlYXJtIC0gcmVhcm0gSVJRIGlm
IGxvc3QKPiArICoKPiArICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICsgKgo+ICsg
Ki8KPiArc3RhdGljIHZvaWQgdmVnYTEwX2loX2lycV9yZWFybShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKPiArCQkJICAgICAgIHN0cnVjdCBhbWRncHVfaWhfcmluZyAqaWgpCj4gK3sKPiAr
CXVpbnQzMl90IHJlZ19ycHRyID0gMDsKPiArCXVpbnQzMl90IHYgPSAwOwo+ICsJdWludDMyX3Qg
aSA9IDA7Cj4gKwo+ICsJaWYgKGloID09ICZhZGV2LT5pcnEuaWgpCj4gKwkJcmVnX3JwdHIgPSBT
T0MxNV9SRUdfT0ZGU0VUKE9TU1NZUywgMCwgbW1JSF9SQl9SUFRSKTsKPiArCWVsc2UgaWYgKGlo
ID09ICZhZGV2LT5pcnEuaWgxKQo+ICsJCXJlZ19ycHRyID0gU09DMTVfUkVHX09GRlNFVChPU1NT
WVMsIDAsIG1tSUhfUkJfUlBUUl9SSU5HMSk7Cj4gKwllbHNlIGlmIChpaCA9PSAmYWRldi0+aXJx
LmloMikKPiArCQlyZWdfcnB0ciA9IFNPQzE1X1JFR19PRkZTRVQoT1NTU1lTLCAwLCBtbUlIX1JC
X1JQVFJfUklORzIpOwo+ICsJZWxzZQo+ICsJCXJldHVybjsKPiArCj4gKwkvKiBSZWFybSBJUlEg
LyByZS13d3JpdGUgZG9vcmJlbGwgaWYgZG9vcmJlbGwgd3JpdGUgaXMgbG9zdCAqLwo+ICsJZm9y
IChpID0gMDsgaSA8IE1BWF9SRUFSTV9SRVRSWTsgaSsrKSB7Cj4gKwkJdiA9IFJSRUczMl9OT19L
SVEocmVnX3JwdHIpOwo+ICsJCWlmICgodiA8IGloLT5yaW5nX3NpemUpICYmICh2ICE9IGloLT5y
cHRyKSkKPiArCQkJV0RPT1JCRUxMMzIoaWgtPmRvb3JiZWxsX2luZGV4LCBpaC0+cnB0cik7Cj4g
KwkJZWxzZQo+ICsJCQlicmVhazsKPiArCX0KPiArfQo+ICsKPiArLyoqCj4gICAgKiB2ZWdhMTBf
aWhfc2V0X3JwdHIgLSBzZXQgdGhlIElIIHJpbmcgYnVmZmVyIHJwdHIKPiAgICAqCj4gICAgKiBA
YWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gQEAgLTM5NSw2ICs0MjcsOSBAQCBzdGF0aWMg
dm9pZCB2ZWdhMTBfaWhfc2V0X3JwdHIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAJ
CS8qIFhYWCBjaGVjayBpZiBzd2FwcGluZyBpcyBuZWNlc3Nhcnkgb24gQkUgKi8KPiAgIAkJKmlo
LT5ycHRyX2NwdSA9IGloLT5ycHRyOwo+ICAgCQlXRE9PUkJFTEwzMihpaC0+ZG9vcmJlbGxfaW5k
ZXgsIGloLT5ycHRyKTsKPiArCj4gKwkJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkKPiArCQkJ
dmVnYTEwX2loX2lycV9yZWFybShhZGV2LCBpaCk7Cj4gICAJfSBlbHNlIGlmIChpaCA9PSAmYWRl
di0+aXJxLmloKSB7Cj4gICAJCVdSRUczMl9TT0MxNShPU1NTWVMsIDAsIG1tSUhfUkJfUlBUUiwg
aWgtPnJwdHIpOwo+ICAgCX0gZWxzZSBpZiAoaWggPT0gJmFkZXYtPmlycS5paDEpIHsKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
