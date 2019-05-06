Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A440A148E2
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 13:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D0689875;
	Mon,  6 May 2019 11:26:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3273D89875
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 11:26:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p21so15271972wmc.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 04:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=sdgQ/0IfW5k1BQcrZZv347mcLmbmQYaV2g4bStf1ZrQ=;
 b=mj6t5qVpv5Qbi35iUQH0S01mwhs2HTcrTLARpj8kT3uNxPkI4brXufcHiax0PNS9Jq
 eTQgoShZb8LNgrLsgRNiYDo3xiFcWMLTlguVNks+LImrhhqUoOq3bki5w8PelB0fiGaE
 AiyQi1EzCVKVxSWyhdJFNmYEpO6nfxJlb7RxFEZa5ilkUt6wo5+92CLvwjvBJL3HnJzZ
 jm32tuC4sjsZ6EZyzS911pRfsb8cTscH52q+qLpU8IHtji7SW+eN2CrVmHWKTTXS6dOK
 cXAoT0go0lNSrCW2phonf6kBHL9Lou9IWgvHVdyf39VtHpxyTqHUujP2zE9oY4oleJ4d
 m5Lg==
X-Gm-Message-State: APjAAAUqy8vjr5nd/vMhx9DR1oZyeaRKiWCm5F6GqFsFgSpICKhdh9N0
 3rAWJvrXNNUW01fX7PQ4AJyE2J5c
X-Google-Smtp-Source: APXvYqzfAzgVseA2EcVdV+we4dcPek0NHMW4FIPfLwNCJvvda+ctJv65Fd5EywBGfjCUV5sy6vMy2Q==
X-Received: by 2002:a1c:99d5:: with SMTP id
 b204mr15625456wme.141.1557141993964; 
 Mon, 06 May 2019 04:26:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id u11sm17793131wrg.35.2019.05.06.04.26.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 04:26:33 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: treat negative lockup timeout as 'infinite
 timeout'
To: Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20190505142353.30369-1-evan.quan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <03378dca-c0bb-443e-818a-3a01b69dcccb@gmail.com>
Date: Mon, 6 May 2019 13:26:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190505142353.30369-1-evan.quan@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=sdgQ/0IfW5k1BQcrZZv347mcLmbmQYaV2g4bStf1ZrQ=;
 b=QX2Rs7U6p4qh/fEXw6UUE8489KkN+4djQmeHF/vmv/mQWVbt0Or6c+WoZxqUYRpg9s
 UBrsbnY5vUnrlCGT8eHUvhk9lWSqUWz4EobZym6L++zjD81Iu8RCVPnnzf6kL5h58WAE
 qr2NwAzKUpKEggIUlaCDcmtNNiEKeVfoU1RgrKw2sTAR4duYtPc1U5UnVKw3ne7dxIAN
 sVKWskrC9NBgVxRA2dDj4oKnkW5SQLdt8U6RXSjL8Cmqno+OdkG/O19O2b5mcYn2oaIM
 NyXzkw0yWsMPVPPZs6cSH2hEoQcvEsGj7VIWkzT0FOaHxfkPB6DzAuIezxYNaOeBBtXs
 4ovg==
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
Cc: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDUuMDUuMTkgdW0gMTY6MjMgc2NocmllYiBFdmFuIFF1YW46Cj4gTmVnYXRpdmUgbG9ja3Vw
IHRpbWVvdXQgaXMgdmFsaWQgYW5kIHdpbGwgYmUgdHJlYXRlZCBhcwo+ICdpbmZpbml0ZSB0aW1l
b3V0Jy4KPgo+IENoYW5nZS1JZDogSTBkODM4Nzk1NmE5Yzc0NDA3M2MwMjgxZWYyZTFhNTQ3ZDRm
MTZkZWMKPiBTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgo+IC0t
LQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMTQgKysrKysr
KysrKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+IGluZGV4IDVi
MDNlMTdlNmUwNi4uNGQ2ZGZmNjg1NWY4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kcnYuYwo+IEBAIC0yMzMsMTMgKzIzMywxNCBAQCBtb2R1bGVfcGFyYW1fbmFtZWQo
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
WCxDb21wdXRlLFNETUEsVmlkZW9dIik7Cj4gQEAgLTEyNDgsMTEgKzEyNDksMTYgQEAgaW50IGFt
ZGdwdV9kZXZpY2VfZ2V0X2pvYl90aW1lb3V0X3NldHRpbmdzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQo+ICAgCQkJaWYgKHJldCkKPiAgIAkJCQlyZXR1cm4gcmV0Owo+ICAgCj4gLQkJCS8q
IEludmFsaWRhdGUgMCBhbmQgbmVnYXRpdmUgdmFsdWVzICovCj4gLQkJCWlmICh0aW1lb3V0IDw9
IDApIHsKPiArCQkJLyoKPiArCQkJICogVmFsdWUgMCB3aWxsIGJlIGFkanVzdGVkIHRvIGRlZmF1
bHQgdGltZW91dCBzZXR0aW5ncy4KPiArCQkJICogTmVnYXRpdmUgdmFsdWVzIG1lYW4gJ2luZmlu
aXRlIHRpbWVvdXQnIChNQVhfSklGRllfT0ZGU0VUKS4KPiArCQkJICovCj4gKwkJCWlmICghdGlt
ZW91dCkgewo+ICAgCQkJCWluZGV4Kys7Cj4gICAJCQkJY29udGludWU7Cj4gICAJCQl9Cj4gKwkJ
CWlmICh0aW1lb3V0IDwgMCkKPiArCQkJCXRpbWVvdXQgPSBNQVhfSklGRllfT0ZGU0VUOwoKVGhp
cyBpcyBzdXBlcmZsdW91cyBhbmQgbWF5YmUgZXZlbiBoYXJtZnVsLCBtc2Vjc190b19qaWZmaWVz
KCkgc2hvdWxkIAp0YWtlIGNhcmUgb2YgdGhpcyBjb252ZXJzaW9uLgoKTWF5YmUgZXZlbiBjb252
ZXJ0IHRoZSB2YWx1ZXMgZGlyZWN0bHkgaGVyZS4KCkNocmlzdGlhbi4KCj4gICAKPiAgIAkJCXN3
aXRjaCAoaW5kZXgrKykgewo+ICAgCQkJY2FzZSAwOgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
