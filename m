Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF4D15E6D
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 09:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A1089E5F;
	Tue,  7 May 2019 07:43:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647C889E5F
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 07:43:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l2so20828031wrb.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 May 2019 00:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=P5DS0Qii6hJJMHkZjnObMLALQ5EgkDMCFb7jc6hnwP4=;
 b=T/KjAb+m8kdumdF/FYEi1gZSN1nl6LgxopbZ4zJ7PsHEkMxxYmAdtoglnwpmEiJwcM
 0Xb9OrV1ws78RA6P4PDqvS1mBf6VVlhXA87EiPf5rzLtavjnakWOzg+db2mOp0tmVz3w
 9DoHMjPnDUZVClzivJJ7vjFA58k4xXWMJ+LewE81OaXaWlTjNoIm5MQfBY8ruA5rryLd
 sXkfzB2m8pmfaQPgOoQzGJxv2KEG/LEfdMLBEoP9KCwJpuhzHxglPiHDU1gtm6X+gtkv
 0Wnpe/bJZDKY1ev8QRKkRDBb87AMIVCstjge1tw5Z4r4lOK9Z9/fhgSPgbniwGwYjR94
 BHDw==
X-Gm-Message-State: APjAAAUzQFPrFSzno8A2KQAPmY/rDPUQiJWpD5xgSH1jA1Mo03JDpHt9
 iXy9UH42VGKMw8B86kCQYToODCaF
X-Google-Smtp-Source: APXvYqw54ZUtV5wnuAflZ+tAKS0HAB3iofSAMc/tFEvYh/7zFn9LHCau5m6XFgoQFMaff345GwVJag==
X-Received: by 2002:adf:8184:: with SMTP id 4mr8133282wra.27.1557214980110;
 Tue, 07 May 2019 00:43:00 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id y3sm3730454wrh.90.2019.05.07.00.42.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 00:42:59 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: treat negative lockup timeout as 'infinite
 timeout' V2
To: Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20190507014715.16505-1-evan.quan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <62338955-c9c6-f9ca-c0b0-6ef534cdc9f8@gmail.com>
Date: Tue, 7 May 2019 09:42:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507014715.16505-1-evan.quan@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=P5DS0Qii6hJJMHkZjnObMLALQ5EgkDMCFb7jc6hnwP4=;
 b=YVLqkGw1QsoV83eKheoGEz4aYwNu27IsNb0nz1fjVGc7RIMUbbm3kAfp5d0W1WTbX0
 iUonmC6jHnTSKHPNF3RNJ++kbG4yJLj9UjzAskEEDfcdGq/gI6ssWSjWaLjWHiy2pMnb
 zL0KWeS6MNbi6ElnNWltcCwe9Xx+jO5JU0ECRqv27W9+9h5i8tafSDWo62JaCJQ2m5PV
 KVybsYzpHAuWm3XWNF/8ABlsKHXDK39VXJQCdhezh/lF9h7gL1ezsFKeS2Bu5ne3bnrQ
 s/OCOamEpk5z3Yf3+iPiqi47iFDnXGD74OSc88FPwz5YbIcBlO4gFJaDPA3CVPPIdax/
 Bm5Q==
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
Cc: Christian.Koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDcuMDUuMTkgdW0gMDM6NDcgc2NocmllYiBFdmFuIFF1YW46Cj4gTmVnYXRpdmUgbG9ja3Vw
IHRpbWVvdXQgaXMgdmFsaWQgYW5kIHdpbGwgYmUgdHJlYXRlZCBhcwo+ICdpbmZpbml0ZSB0aW1l
b3V0Jy4KPgo+IC0gVjI6IHVzZSBtc2Vjc190b19qaWZmaWVzIGZvciBuZWdhdGl2ZSB2YWx1ZXMK
Pgo+IENoYW5nZS1JZDogSTBkODM4Nzk1NmE5Yzc0NDA3M2MwMjgxZWYyZTFhNTQ3ZDRmMTZkZWMK
PiBTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgo+IC0tLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMjAgKysrKysrKysrKysr
LS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+IGluZGV4IGM1
ZmJhNzljMzY2MC4uYmNkNTliYTA3YmIwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kcnYuYwo+IEBAIC0yMzcsMTMgKzIzNywxNCBAQCBtb2R1bGVfcGFyYW1fbmFtZWQo
bXNpLCBhbWRncHVfbXNpLCBpbnQsIDA0NDQpOwo+ICAgICogU2V0IEdQVSBzY2hlZHVsZXIgdGlt
ZW91dCB2YWx1ZSBpbiBtcy4KPiAgICAqCj4gICAgKiBUaGUgZm9ybWF0IGNhbiBiZSBbTm9uLUNv
bXB1dGVdIG9yIFtHRlgsQ29tcHV0ZSxTRE1BLFZpZGVvXS4gVGhhdCBpcyB0aGVyZSBjYW4gYmUg
b25lIG9yCj4gLSAqIG11bHRpcGxlIHZhbHVlcyBzcGVjaWZpZWQuIDAgYW5kIG5lZ2F0aXZlIHZh
bHVlcyBhcmUgaW52YWxpZGF0ZWQuIFRoZXkgd2lsbCBiZSBhZGp1c3RlZAo+IC0gKiB0byBkZWZh
dWx0IHRpbWVvdXQuCj4gKyAqIG11bHRpcGxlIHZhbHVlcyBzcGVjaWZpZWQuCj4gICAgKiAgLSBX
aXRoIG9uZSB2YWx1ZSBzcGVjaWZpZWQsIHRoZSBzZXR0aW5nIHdpbGwgYXBwbHkgdG8gYWxsIG5v
bi1jb21wdXRlIGpvYnMuCj4gICAgKiAgLSBXaXRoIG11bHRpcGxlIHZhbHVlcyBzcGVjaWZpZWQs
IHRoZSBmaXJzdCBvbmUgd2lsbCBiZSBmb3IgR0ZYLiBUaGUgc2Vjb25kIG9uZSBpcyBmb3IgQ29t
cHV0ZS4KPiAgICAqICAgIEFuZCB0aGUgdGhpcmQgYW5kIGZvdXJ0aCBvbmVzIGFyZSBmb3IgU0RN
QSBhbmQgVmlkZW8uCj4gICAgKiBCeSBkZWZhdWx0KHdpdGggbm8gbG9ja3VwX3RpbWVvdXQgc2V0
dGluZ3MpLCB0aGUgdGltZW91dCBmb3IgYWxsIG5vbi1jb21wdXRlKEdGWCwgU0RNQSBhbmQgVmlk
ZW8pCj4gICAgKiBqb2JzIGlzIDEwMDAwLiBBbmQgdGhlcmUgaXMgbm8gdGltZW91dCBlbmZvcmNl
ZCBvbiBjb21wdXRlIGpvYnMuCj4gKyAqIFZhbHVlIDAgaXMgaW52YWxpZGF0ZWQsIHdpbGwgYmUg
YWRqdXN0ZWQgdG8gZGVmYXVsdCB0aW1lb3V0IHNldHRpbmdzLgo+ICsgKiBOZWdhdGl2ZSB2YWx1
ZXMgbWVhbiAnaW5maW5pdGUgdGltZW91dCcgKE1BWF9KSUZGWV9PRkZTRVQpLgo+ICAgICovCj4g
ICBNT0RVTEVfUEFSTV9ERVNDKGxvY2t1cF90aW1lb3V0LCAiR1BVIGxvY2t1cCB0aW1lb3V0IGlu
IG1zIChkZWZhdWx0OiAxMDAwMCBmb3Igbm9uLWNvbXB1dGUgam9icyBhbmQgbm8gdGltZW91dCBm
b3IgY29tcHV0ZSBqb2JzKSwgIgo+ICAgCQkiZm9ybWF0IGlzIFtOb24tQ29tcHV0ZV0gb3IgW0dG
WCxDb21wdXRlLFNETUEsVmlkZW9dIik7Cj4gQEAgLTEzMzksMjQgKzEzNDAsMjcgQEAgaW50IGFt
ZGdwdV9kZXZpY2VfZ2V0X2pvYl90aW1lb3V0X3NldHRpbmdzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQo+ICAgCQkJaWYgKHJldCkKPiAgIAkJCQlyZXR1cm4gcmV0Owo+ICAgCj4gLQkJCS8q
IEludmFsaWRhdGUgMCBhbmQgbmVnYXRpdmUgdmFsdWVzICovCj4gLQkJCWlmICh0aW1lb3V0IDw9
IDApIHsKPiArCQkJLyoKPiArCQkJICogVmFsdWUgMCB3aWxsIGJlIGFkanVzdGVkIHRvIGRlZmF1
bHQgdGltZW91dCBzZXR0aW5ncy4KPiArCQkJICogTmVnYXRpdmUgdmFsdWVzIG1lYW4gJ2luZmlu
aXRlIHRpbWVvdXQnIChNQVhfSklGRllfT0ZGU0VUKS4KPiArCQkJICovCj4gKwkJCWlmICghdGlt
ZW91dCkgewo+ICAgCQkJCWluZGV4Kys7Cj4gICAJCQkJY29udGludWU7Cj4gICAJCQl9Cj4gICAK
PiAgIAkJCXN3aXRjaCAoaW5kZXgrKykgewo+ICAgCQkJY2FzZSAwOgo+IC0JCQkJYWRldi0+Z2Z4
X3RpbWVvdXQgPSB0aW1lb3V0Owo+ICsJCQkJYWRldi0+Z2Z4X3RpbWVvdXQgPSBtc2Vjc190b19q
aWZmaWVzKHRpbWVvdXQpOwo+ICAgCQkJCWJyZWFrOwo+ICAgCQkJY2FzZSAxOgo+IC0JCQkJYWRl
di0+Y29tcHV0ZV90aW1lb3V0ID0gdGltZW91dDsKPiArCQkJCWFkZXYtPmNvbXB1dGVfdGltZW91
dCA9IG1zZWNzX3RvX2ppZmZpZXModGltZW91dCk7Cj4gICAJCQkJYnJlYWs7Cj4gICAJCQljYXNl
IDI6Cj4gLQkJCQlhZGV2LT5zZG1hX3RpbWVvdXQgPSB0aW1lb3V0Owo+ICsJCQkJYWRldi0+c2Rt
YV90aW1lb3V0ID0gbXNlY3NfdG9famlmZmllcyh0aW1lb3V0KTsKPiAgIAkJCQlicmVhazsKPiAg
IAkJCWNhc2UgMzoKPiAtCQkJCWFkZXYtPnZpZGVvX3RpbWVvdXQgPSB0aW1lb3V0Owo+ICsJCQkJ
YWRldi0+dmlkZW9fdGltZW91dCA9IG1zZWNzX3RvX2ppZmZpZXModGltZW91dCk7CgpNYXliZSBt
b3ZlIHRoZSBtc2Vjc190b19qaWZmaWVzKCkgY2FsbCBiZWZvcmUgdGhlIHN3aXRjaCB0byBhZGQg
aXQgb25seSAKb25jZS4KCkFwYXJ0IGZyb20gdGhhdCBsb29rcyBnb29kIHRvIG1lLApDaHJpc3Rp
YW4uCgo+ICAgCQkJCWJyZWFrOwo+ICAgCQkJZGVmYXVsdDoKPiAgIAkJCQlicmVhazsKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
