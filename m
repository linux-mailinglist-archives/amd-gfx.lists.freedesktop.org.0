Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5337CA02B0
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 15:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4BA89B42;
	Wed, 28 Aug 2019 13:09:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D8D89B42
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 13:09:42 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id i63so2798992wmg.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 06:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=hFTnnVz92DnJ7MAJ91qKsW1ORmTPDlkBlFGdXyAWP/0=;
 b=jXWXTRhvzRhR4aJ5wcL0zUYS9BDDnZI5Uij8Z+LxWIW8+zcWZd5QQsotfzDyBuT/2i
 m9dO950ChBQDi6lA5YKivhFQ92XuDe1yKzP6aJkfYT2P1NiqtxvAz37O+XTJBzuE+Iqq
 myezkJG4SXHNKu3DJOQE6pkNNSVijFBnkxpqFg9eGBZ868zM2rt+ogn8tcDSnk5qekVN
 ZsYS/iv9O0AWu/ictqm9vyYOnxNL28vVD6lzETJsjnBvOpGkJjy8JQ/qQYN0kusdk9qv
 RkVHnw3eKKmVbkamxcldl2ASvxVxebh3RBSX2RYnEltyZ2iB67weDinV1QyiNVOvZ3EG
 l2Fw==
X-Gm-Message-State: APjAAAVh3Egi8uvcrNJ23WQWb0fPkP0CrrZ7IEEIHCvwtEosFbdv9gZU
 cGuibzlfizTO6LDeqTPiEuI=
X-Google-Smtp-Source: APXvYqwkmprHhNMjlTLiG/INysN4Mg5J2ENXrzQAdhMMwzi0mfeizup/9GAJRq77K7G0jwZ7vwWzVg==
X-Received: by 2002:a1c:a8cb:: with SMTP id r194mr4273201wme.156.1566997781301; 
 Wed, 28 Aug 2019 06:09:41 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f23sm3370798wmj.37.2019.08.28.06.09.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 06:09:40 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu/psp: keep TMR in visible vram region for
 SRIOV
To: Tianci Yin <tianci.yin@amd.com>, amd-gfx@lists.freedesktop.org
References: <1566992421-30581-1-git-send-email-tianci.yin@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9d0b1959-f209-1bf3-e2a0-aabe4bd25f1b@gmail.com>
Date: Wed, 28 Aug 2019 15:09:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566992421-30581-1-git-send-email-tianci.yin@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=hFTnnVz92DnJ7MAJ91qKsW1ORmTPDlkBlFGdXyAWP/0=;
 b=kwsHzO3sIUsDiwETmRO+2YMInTZWnFENxaJGCbemVMZnoXGBP5tsgflLNvRaq/f5Lv
 6LsnWS7DYVB7ypssMvpKmBJacZjGktoXQxybsm3Xgx843fkQD5W8Wv7m2MdFl2Jgm2+P
 8pk3dtJIFNi/QWJsZhBNJ2dIRyW4qJDtX57H48U/TqpZ0ZAIAurIQaiEam++kKOSknKZ
 aCNU3k+IZ2jpgD99+uDcvyFWx84q/r1bS5q5SZUx7/LahyQJs+iGVNBD7T5Lps0TQeWj
 AevNT+uzt4KIg7IG3tP5P9xUfRBoIVGNCCHpzVXyqSlMJc0+ngd8pX8gBVGeBvyevbJi
 GSLQ==
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
Cc: Feifei Xu <Feifei.Xu@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, "Le . Ma" <Le.Ma@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjguMDguMTkgdW0gMTM6NDAgc2NocmllYiBUaWFuY2kgWWluOgo+IEZyb206ICJUaWFuY2ku
WWluIiA8dGlhbmNpLnlpbkBhbWQuY29tPgo+Cj4gRml4IGNvbXB1dGUgcmluZyB0ZXN0IGZhaWx1
cmUgaW4gc3Jpb3Ygc2NlbmFyaW8uCj4KPiBDaGFuZ2UtSWQ6IEkxNDFkM2QwOTRlMmNiYTliY2Yy
ZjZjOTZmNGQ4YzRlZjQzYzQyMWMzCj4gU2lnbmVkLW9mZi1ieTogVGlhbmNpLllpbiA8dGlhbmNp
LnlpbkBhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4gZm9yIGJvdGggcGF0Y2hlcy4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgfCAxNSArKysrKysrKysrKy0tLS0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwo+IGluZGV4IDlmN2NjNWIuLjQzZmE4YjcgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCj4gQEAgLTIzOSw2ICsy
MzksNyBAQCBzdGF0aWMgaW50IHBzcF90bXJfaW5pdChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkK
PiAgIHsKPiAgIAlpbnQgcmV0Owo+ICAgCWludCB0bXJfc2l6ZTsKPiArCXZvaWQgKnRtcl9idWY7
Cj4gICAKPiAgIAkvKgo+ICAgCSAqIEFjY29yZGluZyB0byBIVyBlbmdpbmVlciwgdGhleSBwcmVm
ZXIgdGhlIFRNUiBhZGRyZXNzIGJlICJuYXR1cmFsbHkKPiBAQCAtMjYxLDkgKzI2MiwxNCBAQCBz
dGF0aWMgaW50IHBzcF90bXJfaW5pdChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKPiAgIAkJfQo+
ICAgCX0KPiAgIAo+IC0JcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwocHNwLT5hZGV2LCB0
bXJfc2l6ZSwgUFNQX1RNUl9TSVpFLAo+IC0JCQkJICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJB
TSwKPiAtCQkJCSAgICAgICZwc3AtPnRtcl9ibywgJnBzcC0+dG1yX21jX2FkZHIsIE5VTEwpOwo+
ICsJaWYgKCFhbWRncHVfc3Jpb3ZfdmYocHNwLT5hZGV2KSkKPiArCQlyZXQgPSBhbWRncHVfYm9f
Y3JlYXRlX2tlcm5lbChwc3AtPmFkZXYsIHRtcl9zaXplLCBQU1BfVE1SX1NJWkUsCj4gKwkJCQkJ
ICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKPiArCQkJCQkgICAgICAmcHNwLT50bXJfYm8s
ICZwc3AtPnRtcl9tY19hZGRyLCBOVUxMKTsKPiArCWVsc2UKPiArCQlyZXQgPSBhbWRncHVfYm9f
Y3JlYXRlX2tlcm5lbChwc3AtPmFkZXYsIHRtcl9zaXplLCBQU1BfVE1SX1NJWkUsCj4gKwkJCQkJ
ICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKPiArCQkJCQkgICAgICAmcHNwLT50bXJfYm8s
ICZwc3AtPnRtcl9tY19hZGRyLCAmdG1yX2J1Zik7Cj4gICAKPiAgIAlyZXR1cm4gcmV0Owo+ICAg
fQo+IEBAIC0xMjA2LDYgKzEyMTIsNyBAQCBzdGF0aWMgaW50IHBzcF9od19maW5pKHZvaWQgKmhh
bmRsZSkKPiAgIHsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqKWhhbmRsZTsKPiAgIAlzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCA9ICZhZGV2
LT5wc3A7Cj4gKwl2b2lkICp0bXJfYnVmOwo+ICAgCj4gICAJaWYgKGFkZXYtPmdtYy54Z21pLm51
bV9waHlzaWNhbF9ub2RlcyA+IDEgJiYKPiAgIAkgICAgcHNwLT54Z21pX2NvbnRleHQuaW5pdGlh
bGl6ZWQgPT0gMSkKPiBAQCAtMTIxNiw3ICsxMjIzLDcgQEAgc3RhdGljIGludCBwc3BfaHdfZmlu
aSh2b2lkICpoYW5kbGUpCj4gICAKPiAgIAlwc3BfcmluZ19kZXN0cm95KHBzcCwgUFNQX1JJTkdf
VFlQRV9fS00pOwo+ICAgCj4gLQlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+dG1yX2JvLCAm
cHNwLT50bXJfbWNfYWRkciwgTlVMTCk7Cj4gKwlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+
dG1yX2JvLCAmcHNwLT50bXJfbWNfYWRkciwgJnRtcl9idWYpOwo+ICAgCWFtZGdwdV9ib19mcmVl
X2tlcm5lbCgmcHNwLT5md19wcmlfYm8sCj4gICAJCQkgICAgICAmcHNwLT5md19wcmlfbWNfYWRk
ciwgJnBzcC0+ZndfcHJpX2J1Zik7Cj4gICAJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZwc3AtPmZl
bmNlX2J1Zl9ibywKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
