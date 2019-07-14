Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5943367E28
	for <lists+amd-gfx@lfdr.de>; Sun, 14 Jul 2019 09:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA2189612;
	Sun, 14 Jul 2019 07:23:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A8989612
 for <amd-gfx@lists.freedesktop.org>; Sun, 14 Jul 2019 07:23:26 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id h19so11991877wme.0
 for <amd-gfx@lists.freedesktop.org>; Sun, 14 Jul 2019 00:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tQtUP8jw3D+xpnwXeFhf/6l+xSzdLavDgwvEQ5nk/SI=;
 b=LgLbal+mC30IdCDu+TCdafkZiYcOurbk/MySCjiioN7cxa9nC1aqnhFSR3AoAp+JNR
 ZJ7t2GitV6AlsfuNTWe3O44yr3w4Tl4mBBlYn0kFlG2CKhN4tOmSGCmUa565BXvVWSo6
 rArSxig8RIc/sqwank50nxOU9ZAobOIuxsSfaXD4UJSBM4FzSt4xAGrkjSQU7px/sa/7
 +pPvRJhUI4crXN2+0U2z2Ir1UF8Fx49xv9xC34hg5yp9jEmF04WHwCsbkgcUZO+ArXDO
 hEuxvVwwjZoSC6CZd9uOYgCJhSFaGliQJnHFGNxuERd1tof5MDm4PzDo/5QeL+JaHvxH
 Nbjg==
X-Gm-Message-State: APjAAAViTUu0BT0IAdmA8nPUg82wIfRs1Y9dY1DyBybyVjOZiQkWH+/j
 pqSOmObV3clUijpv8Z4En2GiyN5p
X-Google-Smtp-Source: APXvYqzeM5VD3PBrCyg5/KFFqxzqa3tYBInhvrKWcSZilg3od0LeDo9pOqHXE0MIfjLmXaQxYOJcGg==
X-Received: by 2002:a7b:cb94:: with SMTP id m20mr17230927wmi.144.1563089005180; 
 Sun, 14 Jul 2019 00:23:25 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z25sm14289563wmf.38.2019.07.14.00.23.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jul 2019 00:23:24 -0700 (PDT)
Subject: Re: [PATCH v4] drm/amdgpu: fix scheduler timeout calc
To: "Xu, Feifei" <Feifei.Xu@amd.com>, "Cui, Flora" <Flora.Cui@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1561952220-5526-1-git-send-email-flora.cui@amd.com>
 <CH2PR12MB3767D1E71B22B99D41ECAB20FEF50@CH2PR12MB3767.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6bbd4268-2d5d-fa98-6569-412b918b1a9f@gmail.com>
Date: Sun, 14 Jul 2019 09:23:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CH2PR12MB3767D1E71B22B99D41ECAB20FEF50@CH2PR12MB3767.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=tQtUP8jw3D+xpnwXeFhf/6l+xSzdLavDgwvEQ5nk/SI=;
 b=oOXN2dOUls/CfnaHbtOW/t6xu/rkJCWKItseRiqka9XN+BZtHp0iNdofZzu5NtsxI8
 KnlLreo4iVOi/WdYgvDmdZdDOQavz3EatlUQVulWED9O0DA+z19wnD3WBdwrYNHFWl/v
 g1pzQWmXvcgnd3jznGlgFONKXOsQLvGRoB4HwwNAhUbtby+DHREqVcZ7PeoQIO/Dhj13
 r3HrWSBzkQVDhWr1q+gZUyyJ5NgFJ3FKy8HBPWHVL+iWfP7MwB21Gm7TXDmaqUsGEfmn
 viB6XuNoPJfZA4lCqO7tEfGB0S4oqwO9CmNGdy62LFdLC/2kTVuEziv29Rb9TbiQA2az
 eZeg==
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

UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
ClNvcnJ5IGZvciB0aGUgZGVsYXksIEkndmUgYmVlbiBvbiB2YWNhdGlvbiBmb3IgdHdvIHdlZWtz
LgoKQ2hyaXN0aWFuLgoKQW0gMDUuMDcuMTkgdW0gMDc6Mzcgc2NocmllYiBYdSwgRmVpZmVpOgo+
IFJldmlld2VkLWJ5OiBGZWlmZWkuWHVAYW1kLmNvbQo+Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYgT2YgQ3VpLCBGbG9yYQo+IFNlbnQ6IE1vbmRheSwgSnVseSAxLCAyMDE5
IDExOjM3IEFNCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IEN1aSwg
RmxvcmEgPEZsb3JhLkN1aUBhbWQuY29tPgo+IFN1YmplY3Q6IFtQQVRDSCB2NF0gZHJtL2FtZGdw
dTogZml4IHNjaGVkdWxlciB0aW1lb3V0IGNhbGMKPgo+IHNjaGVkdWxlciB0aW1lb3V0IGlzIGlu
IGppZmZpZXMKPiB2MjogbW92ZSB0aW1lb3V0IGNoZWNrIHRvIGFtZGdwdV9kZXZpY2VfZ2V0X2pv
Yl90aW1lb3V0X3NldHRpbmdzIGFmdGVyIHBhcnNpbmcgdGhlIHZhbHVlCj4gdjM6IGFkZCBsb2Nr
dXBfdGltZW91dCBwYXJhbSBjaGVjay4gMDoga2VlcCBkZWZhdWx0IHZhbHVlLiBuZWdhdGl2ZToK
PiBpbmZpbml0eSB0aW1lb3V0Lgo+IHY0OiByZWZhY3RvciBjb2Rlcy4KPgo+IENoYW5nZS1JZDog
STI2NzA4YzE2M2RiOTQzZmY4ZDkzMGRkODFiY2FiNGI0YjlkODRlYjIKPiBTaWduZWQtb2ZmLWJ5
OiBGbG9yYSBDdWkgPGZsb3JhLmN1aUBhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMTMgKysrKysrKysrLS0tLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPiBpbmRleCBlNzRhMTc1Li5lNDQ4ZjhlIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+IEBAIC0yNDUsNyArMjQ1LDgg
QEAgbW9kdWxlX3BhcmFtX25hbWVkKG1zaSwgYW1kZ3B1X21zaSwgaW50LCAwNDQ0KTsKPiAgICAq
IEJ5IGRlZmF1bHQod2l0aCBubyBsb2NrdXBfdGltZW91dCBzZXR0aW5ncyksIHRoZSB0aW1lb3V0
IGZvciBhbGwgbm9uLWNvbXB1dGUoR0ZYLCBTRE1BIGFuZCBWaWRlbykKPiAgICAqIGpvYnMgaXMg
MTAwMDAuIEFuZCB0aGVyZSBpcyBubyB0aW1lb3V0IGVuZm9yY2VkIG9uIGNvbXB1dGUgam9icy4K
PiAgICAqLwo+IC1NT0RVTEVfUEFSTV9ERVNDKGxvY2t1cF90aW1lb3V0LCAiR1BVIGxvY2t1cCB0
aW1lb3V0IGluIG1zIChkZWZhdWx0OiAxMDAwMCBmb3Igbm9uLWNvbXB1dGUgam9icyBhbmQgbm8g
dGltZW91dCBmb3IgY29tcHV0ZSBqb2JzKSwgIgo+ICtNT0RVTEVfUEFSTV9ERVNDKGxvY2t1cF90
aW1lb3V0LCAiR1BVIGxvY2t1cCB0aW1lb3V0IGluIG1zIChkZWZhdWx0OiAxMDAwMCBmb3Igbm9u
LWNvbXB1dGUgam9icyBhbmQgaW5maW5pdHkgdGltZW91dCBmb3IgY29tcHV0ZSBqb2JzLiIKPiAr
CQkiIDA6IGtlZXAgZGVmYXVsdCB2YWx1ZS4gbmVnYXRpdmU6IGluZmluaXR5IHRpbWVvdXQpLCAi
Cj4gICAJCSJmb3JtYXQgaXMgW05vbi1Db21wdXRlXSBvciBbR0ZYLENvbXB1dGUsU0RNQSxWaWRl
b10iKTsgIG1vZHVsZV9wYXJhbV9zdHJpbmcobG9ja3VwX3RpbWVvdXQsIGFtZGdwdV9sb2NrdXBf
dGltZW91dCwgc2l6ZW9mKGFtZGdwdV9sb2NrdXBfdGltZW91dCksIDA0NDQpOwo+ICAgCj4gQEAg
LTEzMDAsNyArMTMwMSw4IEBAIGludCBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0
aW5ncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIAkgKiBCeSBkZWZhdWx0IHRpbWVv
dXQgZm9yIG5vbiBjb21wdXRlIGpvYnMgaXMgMTAwMDAuCj4gICAJICogQW5kIHRoZXJlIGlzIG5v
IHRpbWVvdXQgZW5mb3JjZWQgb24gY29tcHV0ZSBqb2JzLgo+ICAgCSAqLwo+IC0JYWRldi0+Z2Z4
X3RpbWVvdXQgPSBhZGV2LT5zZG1hX3RpbWVvdXQgPSBhZGV2LT52aWRlb190aW1lb3V0ID0gMTAw
MDA7Cj4gKwlhZGV2LT5nZnhfdGltZW91dCA9IG1zZWNzX3RvX2ppZmZpZXMoMTAwMDApOwo+ICsJ
YWRldi0+c2RtYV90aW1lb3V0ID0gYWRldi0+dmlkZW9fdGltZW91dCA9IGFkZXYtPmdmeF90aW1l
b3V0Owo+ICAgCWFkZXYtPmNvbXB1dGVfdGltZW91dCA9IE1BWF9TQ0hFRFVMRV9USU1FT1VUOwo+
ICAgCj4gICAJaWYgKHN0cm5sZW4oaW5wdXQsIEFNREdQVV9NQVhfVElNRU9VVF9QQVJBTV9MRU5U
SCkpIHsgQEAgLTEzMTAsMTAgKzEzMTIsMTMgQEAgaW50IGFtZGdwdV9kZXZpY2VfZ2V0X2pvYl90
aW1lb3V0X3NldHRpbmdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgCQkJaWYgKHJl
dCkKPiAgIAkJCQlyZXR1cm4gcmV0Owo+ICAgCj4gLQkJCS8qIEludmFsaWRhdGUgMCBhbmQgbmVn
YXRpdmUgdmFsdWVzICovCj4gLQkJCWlmICh0aW1lb3V0IDw9IDApIHsKPiArCQkJaWYgKHRpbWVv
dXQgPT0gMCkgewo+ICAgCQkJCWluZGV4Kys7Cj4gICAJCQkJY29udGludWU7Cj4gKwkJCX0gZWxz
ZSBpZiAodGltZW91dCA8IDApIHsKPiArCQkJCXRpbWVvdXQgPSBNQVhfU0NIRURVTEVfVElNRU9V
VDsKPiArCQkJfSBlbHNlIHsKPiArCQkJCXRpbWVvdXQgPSBtc2Vjc190b19qaWZmaWVzKHRpbWVv
dXQpOwo+ICAgCQkJfQo+ICAgCj4gICAJCQlzd2l0Y2ggKGluZGV4KyspIHsKPiAtLQo+IDIuNy40
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFt
ZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFp
bGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
