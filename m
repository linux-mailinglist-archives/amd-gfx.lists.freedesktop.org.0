Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2295E13DA1A
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Jan 2020 13:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC176ECD8;
	Thu, 16 Jan 2020 12:35:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A051E6ECD8
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Jan 2020 12:35:25 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p17so3644823wma.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Jan 2020 04:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=q/1/qtw4XDu98xlJOJ2P/KvcfU11XRt/zvWFo3d+Ua0=;
 b=hSqdWpdtXrzjbw/CrnucaQ9rOIr7Q99Ti4lX5GdwRGUx9pZ0Tz/LL7dj4WS2kTScOa
 7qLJrTGICKfS2hpFeoj26uN+IrzbzVwmnfc/Z0uhh08qF/g9/o22JkPCD/lrAEWXVeR3
 INmDQQQBXmcdjH6SL0lToZge7e6iRJHlvPaR4Zbg3jR7rnOttWV6NJ0X7e9MiOP+774G
 l4b0qxqKUnekXc7A6LHnbusiOPexuvi/pk/enlffKU+n1mRLNECtKm9GQx2FfvTyldE8
 +VQa5EnugEWGU8YlDJWA13a2YMz+dVdCyQAqOWMYEdMqzRGzYhzZjMlHzHo/HRwPxv7w
 pUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=q/1/qtw4XDu98xlJOJ2P/KvcfU11XRt/zvWFo3d+Ua0=;
 b=EpUtadJR2Eovdkr0Xow6bOY8QTaV8Ux/KcCiv0AN/5enGSLCxChPkY3PG7ZOqixTra
 +t8R2Xwqs5ppegx/cpaWBvmDJUw9kFMffg7u1mL/kCqX8JLrP+tHhEOv01BfRtBm/gVY
 ohULLt1yYo1dp4xYXxVncOyeTJemwP4Tvi4fMIlyJlmglSZ3IaBO6+Tz0qOdLZorPI7R
 z5/Jv4gCbgv6apqHelEdlGGVZwwax9GSnsArH7X2C17JppuOcetr4wv12a5ANouQpX87
 oQYJmUlpgbK5YrqJF7c0j+wSdq/j1cL+2qKZzLWcIcRi6m07y5UqoxI2lknfdtJISJnJ
 Dqkw==
X-Gm-Message-State: APjAAAVlTs4Fq6gf6+s6Et+GShpHejkoMlQZTDXv9Q1bSE0hKf8/lVzN
 0qpBlvZiokmrHjFaha/vfKQfaA5f
X-Google-Smtp-Source: APXvYqy2uOsFR06/qk0c3dz6jXAJ1kjj+4LUQfLRfgWynI+7BuY7rhhlHhv3psAMy5GSx8vrBLwZ4w==
X-Received: by 2002:a1c:2786:: with SMTP id n128mr6052231wmn.47.1579178124307; 
 Thu, 16 Jan 2020 04:35:24 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id o129sm4558955wmb.1.2020.01.16.04.35.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Jan 2020 04:35:23 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: add the lost mutex_init back
To: "Xu, Feifei" <Feifei.Xu@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <SN6PR12MB280058965C66589B199AC18C87360@SN6PR12MB2800.namprd12.prod.outlook.com>
 <CH2PR12MB3767F4115CBAA3EFADDB7BDFFE360@CH2PR12MB3767.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <fc280e58-dbdb-e32c-a81a-8d98b0b661a6@gmail.com>
Date: Thu, 16 Jan 2020 13:35:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CH2PR12MB3767F4115CBAA3EFADDB7BDFFE360@CH2PR12MB3767.namprd12.prod.outlook.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
CkFtIDE2LjAxLjIwIHVtIDA3OjMyIHNjaHJpZWIgWHUsIEZlaWZlaToKPiBSZXZpZXdlZC1ieTog
RmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4KPgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zz4gT24gQmVoYWxmIE9mIFBhbiwgWGluaHVpCj4gU2VudDogVGh1cnNkYXksIEphbnVhcnkgMTYs
IDIwMjAgMjoxMCBQTQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBE
ZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+Cj4gU3ViamVjdDog
W1BBVENIXSBkcm0vYW1kZ3B1OiBhZGQgdGhlIGxvc3QgbXV0ZXhfaW5pdCBiYWNrCj4KPgo+IElu
aXRpYWxpemUgbm90aWZpZXJfbG9jay4KPgo+IFNpZ25lZC1vZmYtYnk6IHhpbmh1aSBwYW4gPHhp
bmh1aS5wYW5AYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYyB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gaW5kZXggMmM2
NGQyYTgzZDYxLi5jMjQ1MzUzMmZkOTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jCj4gQEAgLTI4NTEsNiArMjg1MSw3IEBAIGludCBhbWRncHVfZGV2
aWNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAJaGFzaF9pbml0KGFkZXYt
Pm1uX2hhc2gpOwo+ICAgCW11dGV4X2luaXQoJmFkZXYtPmxvY2tfcmVzZXQpOwo+ICAgCW11dGV4
X2luaXQoJmFkZXYtPnBzcC5tdXRleCk7Cj4gKwltdXRleF9pbml0KCZhZGV2LT5ub3RpZmllcl9s
b2NrKTsKPiAgIAo+ICAgCXIgPSBhbWRncHVfZGV2aWNlX2NoZWNrX2FyZ3VtZW50cyhhZGV2KTsK
PiAgIAlpZiAocikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
