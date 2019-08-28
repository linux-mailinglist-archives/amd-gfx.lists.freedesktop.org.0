Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A1D9FE4F
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 11:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F4C897E0;
	Wed, 28 Aug 2019 09:21:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6C3897E0
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 09:21:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d16so2044540wme.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 02:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=hQeQEN3fWjNQbZfaJE9Sei7cIYW3W1/S+G6D/9CKEBQ=;
 b=ZOPrKTGAqkMEM32xTdeiaBBtVU5ZYeMEYn0mtTE0Ds05+lA1fg6TcdQw7Bvvmaulun
 1+3uVdg1t6hmS5fehAT2W+SAjChk4DmbdXgUbe5PqtXuN3ZzqRfv9gcprQnH26dSbsBt
 X9VxAzalKy0DQP+ygxvyZjwvCi8147CQEKVYlaxeSDSP5j2Ivf4SVlpwXrtRRrKIMT/8
 /hpo6EnqGqaX0QGZeC8xAkFgVhqciR9oaS7suGOvPd2muUsK+onZyXHVpsaSpE9bIBam
 cXGBWxoEPZ8rXFLbRz/Fa75VfhI2M7kBtPQlz5VGnH2WuGp/esM0fk1eeIM2kKCxcy9+
 ckcw==
X-Gm-Message-State: APjAAAVQpE9kJzCF3poU4KhKAP5P7Clxe6M9KQudP/x/sVySyDavsizC
 o7fDahY3inRHNsru1pEJTgKkDrBB
X-Google-Smtp-Source: APXvYqwQ0OAJCpft2Ywir/BsQKEQwjvYhV8CXitr1hf7CqBFge2IdfG68SFwrOqemRfPcNllbH4LYA==
X-Received: by 2002:a1c:d108:: with SMTP id i8mr3823667wmg.28.1566984069326;
 Wed, 28 Aug 2019 02:21:09 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g7sm1689907wmh.1.2019.08.28.02.21.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 02:21:08 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Handle job is NULL use case in
 amdgpu_device_gpu_recover
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <1566929823-17398-1-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a914c3cb-ab30-c751-16f3-d2e04c960276@gmail.com>
Date: Wed, 28 Aug 2019 11:21:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566929823-17398-1-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=hQeQEN3fWjNQbZfaJE9Sei7cIYW3W1/S+G6D/9CKEBQ=;
 b=Mc+7bNEHIk5yzzxow7SiOPytRgLFBdaXSWpCXPYwyU14cV7uqlRLqrJ6QGNLNRyPDn
 pW89EiHBrSn+q9L2VmfvNEWF6vQ35ZwB8xP99aCGuolDYD1eQb7obJNzE0Yx9D7XXWC1
 FA8ne1ioHLuQDieKbcfN2EI9IGIb4lEAPWeTkIHmlT2JTyzrCkDFnPtdiEifRFl7l/SE
 nw+4i696ifMfyMeL3nttjCfgwmRJKVkYdnL7J+ROc9sSIOFJy9TxV0/jCNe8gQgmh9hT
 xw2VD6wW3OndJH4NEcdb3XZ0HiScjz7BNvK/JBmRTVSvYgEvrdfs5791clx6xetB95NW
 wYlQ==
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

QW0gMjcuMDguMTkgdW0gMjA6MTcgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBUaGlzIHNo
b3VsZCBiZSBjaGVja2VkIGF0IGFsbCBwbGFjZXMgam9iIGlzIGFjY2Vzc2VkLgo+Cj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+CgpS
ZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoK
PiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDgg
KysrKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gaW5k
ZXggMDJiM2U3ZC4uMTkwZDlhMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMKPiBAQCAtMzc5MCwxNCArMzc5MCwxNCBAQCBpbnQgYW1kZ3B1X2Rldmlj
ZV9ncHVfcmVjb3ZlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgIAo+ICAgCWlmICho
aXZlICYmICFtdXRleF90cnlsb2NrKCZoaXZlLT5yZXNldF9sb2NrKSkgewo+ICAgCQlEUk1fSU5G
TygiQmFpbGluZyBvbiBURFIgZm9yIHNfam9iOiVsbHgsIGhpdmU6ICVsbHggYXMgYW5vdGhlciBh
bHJlYWR5IGluIHByb2dyZXNzIiwKPiAtCQkJIGpvYi0+YmFzZS5pZCwgaGl2ZS0+aGl2ZV9pZCk7
Cj4gKwkJCSAgam9iID8gam9iLT5iYXNlLmlkIDogLTEsIGhpdmUtPmhpdmVfaWQpOwo+ICAgCQly
ZXR1cm4gMDsKPiAgIAl9Cj4gICAKPiAgIAkvKiBTdGFydCB3aXRoIGFkZXYgcHJlIGFzaWMgcmVz
ZXQgZmlyc3QgZm9yIHNvZnQgcmVzZXQgY2hlY2suKi8KPiAgIAlpZiAoIWFtZGdwdV9kZXZpY2Vf
bG9ja19hZGV2KGFkZXYsICFoaXZlKSkgewo+ICAgCQlEUk1fSU5GTygiQmFpbGluZyBvbiBURFIg
Zm9yIHNfam9iOiVsbHgsIGFzIGFub3RoZXIgYWxyZWFkeSBpbiBwcm9ncmVzcyIsCj4gLQkJCQkJ
IGpvYi0+YmFzZS5pZCk7Cj4gKwkJCSAgam9iID8gam9iLT5iYXNlLmlkIDogLTEpOwo+ICAgCQly
ZXR1cm4gMDsKPiAgIAl9Cj4gICAKPiBAQCAtMzgzOCw3ICszODM4LDcgQEAgaW50IGFtZGdwdV9k
ZXZpY2VfZ3B1X3JlY292ZXIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAJCQlpZiAo
IXJpbmcgfHwgIXJpbmctPnNjaGVkLnRocmVhZCkKPiAgIAkJCQljb250aW51ZTsKPiAgIAo+IC0J
CQlkcm1fc2NoZWRfc3RvcCgmcmluZy0+c2NoZWQsICZqb2ItPmJhc2UpOwo+ICsJCQlkcm1fc2No
ZWRfc3RvcCgmcmluZy0+c2NoZWQsIGpvYiA/ICZqb2ItPmJhc2UgOiBOVUxMKTsKPiAgIAkJfQo+
ICAgCX0KPiAgIAo+IEBAIC0zODY0LDcgKzM4NjQsNyBAQCBpbnQgYW1kZ3B1X2RldmljZV9ncHVf
cmVjb3ZlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgIAo+ICAgCS8qIEd1aWx0eSBq
b2Igd2lsbCBiZSBmcmVlZCBhZnRlciB0aGlzKi8KPiAgIAlyID0gYW1kZ3B1X2RldmljZV9wcmVf
YXNpY19yZXNldChhZGV2LAo+IC0JCQkJCSBqb2IsCj4gKwkJCQkJIGpvYiA/IGpvYiA6IE5VTEws
Cj4gICAJCQkJCSAmbmVlZF9mdWxsX3Jlc2V0KTsKPiAgIAlpZiAocikgewo+ICAgCQkvKlRPRE8g
U2hvdWxkIHdlIHN0b3AgPyovCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
