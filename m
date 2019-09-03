Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2EDA6445
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 10:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B291893C0;
	Tue,  3 Sep 2019 08:47:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9D9893C0
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 08:47:15 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g207so13149978wmg.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Sep 2019 01:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bgnxvJpsbuvH9fs7GxO+q4E9deTFghjLoTySYikWNZw=;
 b=tVZI6BmVmdN1f/wyqTuWLtk+2ImiPOzRPueDlgYq6KU2FSuH/VY6VnLlczmN6iSD/s
 FucWDfy3ztp1qImBcUEhY3vtvX1msTw9BVJpGu6Tz118RlBAyTyN2aQQo+xGdrD7l17g
 y20q3p04gsKDSIFpNtZOw9RaSB7xbAeKr7NpXpUDnmP6erEvOJdNFHEOqskfu6udekoa
 CaBIt6le8K1bFmFvWzR0NpPDffnh5uQqZHCcRHxFtlBx1jwlxCvpK1NrKSvGfgVATIta
 dQTBxdnGW4dMWmaPYNqwyf9P26mlAPmc875FOnfnBpBHM7EwHEbH/HjYLw+jXHw+IeMG
 Dpbw==
X-Gm-Message-State: APjAAAVLrGWjnOciGDYg5GMDu/YIZJXQvwVa6zpG5e0irDEr9rtSvWHE
 u0EEd9etdo7EwivW01CEgqBaD/Hi
X-Google-Smtp-Source: APXvYqwT/BS30aJvZecWQpaAxmMCwz+429WLx2iNOMljWWhDcJHd9XjVs+4gI5tSRw6mIbu9lhYENA==
X-Received: by 2002:a05:600c:285:: with SMTP id
 5mr19914368wmk.161.1567500433798; 
 Tue, 03 Sep 2019 01:47:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g15sm16429022wmk.17.2019.09.03.01.47.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Sep 2019 01:47:13 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm/amdgpu: reserve at least 4MB of VRAM for page
 tables
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190902105219.2813-1-christian.koenig@amd.com>
 <20190902105219.2813-2-christian.koenig@amd.com>
 <MN2PR12MB29104DDA4EBB320F67988981B4B90@MN2PR12MB2910.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <eb92584c-6409-8c10-bb9f-a44f62168588@gmail.com>
Date: Tue, 3 Sep 2019 10:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <MN2PR12MB29104DDA4EBB320F67988981B4B90@MN2PR12MB2910.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bgnxvJpsbuvH9fs7GxO+q4E9deTFghjLoTySYikWNZw=;
 b=MKnqdgXnby63s6ZHg6SDF4InjCyed/w3Ije1FOHSHri0oQuur893nZTLVKd2Fo8GBM
 qpG03PEiR/bOhMjqEqx+xw6Jv1EhP8aRfIc6jxIu3xz3Qwp9DQHW+hi1iiu6nJBvGYaF
 CkaFA9rZL8QL/PG8LxCF4KB3I2lsXGMfbm30gl9+fUUnDc9aNb7EdIzSCRM0MwTWw6Le
 D5ldkn0BR2OF9wGq5B8EEWagpj+xXGdrMl8v2ZGDGOiymqzyOTpUFy9ujvW6j7kSSsFc
 Nh53gNVejTupUw0GEE+Ume3qkJdycsa5VbBTklC54VbEjZXWmHjPIew41xDVUC9tcRzR
 wSfA==
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

T2gsIGdvb2QgcG9pbnQhIFRoYXQgaXMgcHJvYmFibHkgZ29vZCBpZGVhLgoKQ2hyaXN0aWFuLgoK
QW0gMDMuMDkuMTkgdW0gMDg6NTIgc2NocmllYiBaaG91LCBEYXZpZChDaHVuTWluZyk6Cj4gRG8g
eW91IG5lZWQgdXBkYXRlIHRoZSB2cmFtIHNpemUgcmVwb3J0ZWQgdG8gVU1EID8KPgo+IC1EYXZp
ZAo+Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQ2hyaXN0aWFuIEvD
tm5pZwo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDIsIDIwMTkgNjo1MiBQTQo+IFRvOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFN1YmplY3Q6IFtQQVRDSCAyLzNdIGRybS9hbWRn
cHU6IHJlc2VydmUgYXQgbGVhc3QgNE1CIG9mIFZSQU0gZm9yIHBhZ2UgdGFibGVzCj4KPiBUaGlz
IGhvcGVmdWxseSBoZWxwcyByZWR1Y2UgdGhlIGNvbnRlbnRpb24gZm9yIHBhZ2UgdGFibGVzLgo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggICAg
ICAgfCAzICsrKwo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdy
LmMgfCA5ICsrKysrKystLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgKPiBp
bmRleCAyZWRhM2E4YzMzMGQuLjMzNTJhODdiODIyZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5oCj4gQEAgLTk5LDYgKzk5LDkgQEAgc3RydWN0IGFtZGdwdV9ib19s
aXN0X2VudHJ5Owo+ICAgI2RlZmluZSBBTURHUFVfVk1fRkFVTFRfU1RPUF9GSVJTVAkxCj4gICAj
ZGVmaW5lIEFNREdQVV9WTV9GQVVMVF9TVE9QX0FMV0FZUwkyCj4gICAKPiArLyogUmVzZXJ2ZSA0
TUIgVlJBTSBmb3IgcGFnZSB0YWJsZXMgKi8KPiArI2RlZmluZSBBTURHUFVfVk1fUkVTRVJWRURf
VlJBTQkJKDRVTEwgPDwgMjApCj4gKwo+ICAgLyogbWF4IG51bWJlciBvZiBWTUhVQiAqLwo+ICAg
I2RlZmluZSBBTURHUFVfTUFYX1ZNSFVCUwkJCTMKPiAgICNkZWZpbmUgQU1ER1BVX0dGWEhVQl8w
CQkJCTAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zy
YW1fbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+
IGluZGV4IDExNTBlMzRiYzI4Zi4uNTk0NDBmNzFkMzA0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKPiBAQCAtMjQsNiArMjQsNyBAQAo+ICAg
Cj4gICAjaW5jbHVkZSA8ZHJtL2RybVAuaD4KPiAgICNpbmNsdWRlICJhbWRncHUuaCIKPiArI2lu
Y2x1ZGUgImFtZGdwdV92bS5oIgo+ICAgCj4gICBzdHJ1Y3QgYW1kZ3B1X3ZyYW1fbWdyIHsKPiAg
IAlzdHJ1Y3QgZHJtX21tIG1tOwo+IEBAIC0yNzYsNyArMjc3LDcgQEAgc3RhdGljIGludCBhbWRn
cHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+ICAgCXN0
cnVjdCBkcm1fbW1fbm9kZSAqbm9kZXM7Cj4gICAJZW51bSBkcm1fbW1faW5zZXJ0X21vZGUgbW9k
ZTsKPiAgIAl1bnNpZ25lZCBsb25nIGxwZm4sIG51bV9ub2RlcywgcGFnZXNfcGVyX25vZGUsIHBh
Z2VzX2xlZnQ7Cj4gLQl1aW50NjRfdCB2aXNfdXNhZ2UgPSAwLCBtZW1fYnl0ZXM7Cj4gKwl1aW50
NjRfdCB2aXNfdXNhZ2UgPSAwLCBtZW1fYnl0ZXMsIG1heF9ieXRlczsKPiAgIAl1bnNpZ25lZCBp
Owo+ICAgCWludCByOwo+ICAgCj4gQEAgLTI4NCw5ICsyODUsMTMgQEAgc3RhdGljIGludCBhbWRn
cHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+ICAgCWlm
ICghbHBmbikKPiAgIAkJbHBmbiA9IG1hbi0+c2l6ZTsKPiAgIAo+ICsJbWF4X2J5dGVzID0gYWRl
di0+Z21jLm1jX3ZyYW1fc2l6ZTsKPiArCWlmICh0Ym8tPnR5cGUgIT0gdHRtX2JvX3R5cGVfa2Vy
bmVsKQo+ICsJCW1heF9ieXRlcyAtPSBBTURHUFVfVk1fUkVTRVJWRURfVlJBTTsKPiArCj4gICAJ
LyogYmFpbCBvdXQgcXVpY2tseSBpZiB0aGVyZSdzIGxpa2VseSBub3QgZW5vdWdoIFZSQU0gZm9y
IHRoaXMgQk8gKi8KPiAgIAltZW1fYnl0ZXMgPSAodTY0KW1lbS0+bnVtX3BhZ2VzIDw8IFBBR0Vf
U0hJRlQ7Cj4gLQlpZiAoYXRvbWljNjRfYWRkX3JldHVybihtZW1fYnl0ZXMsICZtZ3ItPnVzYWdl
KSA+IGFkZXYtPmdtYy5tY192cmFtX3NpemUpIHsKPiArCWlmIChhdG9taWM2NF9hZGRfcmV0dXJu
KG1lbV9ieXRlcywgJm1nci0+dXNhZ2UpID4gbWF4X2J5dGVzKSB7Cj4gICAJCWF0b21pYzY0X3N1
YihtZW1fYnl0ZXMsICZtZ3ItPnVzYWdlKTsKPiAgIAkJbWVtLT5tbV9ub2RlID0gTlVMTDsKPiAg
IAkJcmV0dXJuIDA7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
