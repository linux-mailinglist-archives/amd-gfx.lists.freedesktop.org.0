Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 522532DE7FC
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Dec 2020 18:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2C589E08;
	Fri, 18 Dec 2020 17:23:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DF789E08
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Dec 2020 17:23:18 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ga15so4322501ejb.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Dec 2020 09:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=wt2GpVgzbrQZSz9YqOOf7UECLiZP/IdD9AdMrJjaOU8=;
 b=u7ygXkSauMr9S1mz5kGqFrSaNXsUOYH8PwYwn4ztGu08BXE7CfrKbqrV9RPZQLXyOJ
 kUw/4FIsq/+/FczhqlbOmpj5Hu4nkJhrFSUAf8R+XaOjWgBb+xuhaBUpGnDYBhKTAbaR
 eWK/9ZNhp4ES7yJ8k03/H9jP/5aMW1UhB99yIcIf1JEtGtKlWLmo2hUkUFpIFCMe/D04
 a0ZWtukRYqyxi93r1e/MqTxKRJ0dtV+/iaC0SgJaGr9oiRABJC6RYZsbluc6Kc6/KOWa
 rDS/dOdWUfOIH0iky6Qc0WPCPYk/2UWz/ZBRek3pLCV82U3xD7X91FWlQU3/coQm4ZNw
 aleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=wt2GpVgzbrQZSz9YqOOf7UECLiZP/IdD9AdMrJjaOU8=;
 b=J5VUWxalPNf3mfZe4Y27SkMVDVwiJM7j/62CF3cpfYQ6+eEzeerCjeEBr+2vH3djp0
 NxmAtxEBgm1Tq3IVri90n61HQYusuIBwI3Y8LeqB28Zoc8aPtmGVqT4RjxukD9xFWa/A
 5bz311m+fqYOuaNj/4whaUnL2aBYWaVJitJ2tgX8wdE6ElGoGWErXLJAjaIuvsepIQjt
 2qkc7hF8HbFaP8V/T3zjyI9+IW8sCvNJM4GZJxuu1I9dxieaIdCrCpOpujVQy/xCARO9
 RpjfgQzW8GB0jD9NAtAYvsCFnVWSnygrtN9LNrhgQy66jWWYX0GuISqkIdIKt0c1C3de
 YETw==
X-Gm-Message-State: AOAM533jssjZ1nTAq8vaNtCraLxo4sG2MItVRP44u1VdFap5PRz4P63D
 X/fh2MSd3+jQdeXql+8lt1aOJ0rdAoo=
X-Google-Smtp-Source: ABdhPJxKuAo3JOoaHBFcYRL7GZl0x3poq7xqdlw036ImpErQ5TLI2fl/slS5q3w9hqKNi3Se0CqBzA==
X-Received: by 2002:a17:906:c087:: with SMTP id
 f7mr5021040ejz.492.1608312196816; 
 Fri, 18 Dec 2020 09:23:16 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id gl23sm859480ejb.87.2020.12.18.09.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 09:23:15 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: fix handling of irq domains on soc15 and
 newer GPUs
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20201218165353.35509-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1c49e049-d396-b39c-4c7e-c92a52076d08@gmail.com>
Date: Fri, 18 Dec 2020 18:23:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218165353.35509-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTguMTIuMjAgdW0gMTc6NTMgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gV2UgbmVlZCB0byB0
YWtlIGludG8gYWNjb3VudCB0aGUgY2xpZW50IGlkIG90aGVyd2lzZSB3ZSdsbCBlbmQKPiB1cCBz
ZW5kaW5nIGdlbmVyaWMgZXZlbnRzIGZvciBhbnkgc3JjIGlkIHRoYXQgaXMgcmVnaXN0ZXJlZC4K
Pgo+IFdlIG9ubHkgc3VwcG9ydCBpcnEgZG9tYWlucyBvbiBwcmUtc29jMTUgcGFydHMgc28gY2xp
ZW50IGlzCj4gYWx3YXlzIGxlZ2FjeS4KCkkndmUgc2VlbiB0aGF0IG11bHRpcGxlIHRpbWVzIGFz
IHdlbGwgYnV0IGFsd2F5cyBmb3Jnb3QgdG8gYXNrIGlmIHRoYXQncyAKcmlnaHQgb3Igd3Jvbmcu
Cgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMg
fCAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEuYwo+IGluZGV4IGJlYTU3
ZThlNzkzZi4uYWZiYmVjODJhMjg5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9pcnEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9pcnEuYwo+IEBAIC00NDQsNyArNDQ0LDggQEAgdm9pZCBhbWRncHVfaXJxX2Rpc3BhdGNo
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgCX0gZWxzZQlpZiAoc3JjX2lkID49IEFN
REdQVV9NQVhfSVJRX1NSQ19JRCkgewo+ICAgCQlEUk1fREVCVUcoIkludmFsaWQgc3JjX2lkIGlu
IElWOiAlZFxuIiwgc3JjX2lkKTsKPiAgIAo+IC0JfSBlbHNlIGlmIChhZGV2LT5pcnEudmlycVtz
cmNfaWRdKSB7Cj4gKwl9IGVsc2UgaWYgKChjbGllbnRfaWQgPT0gQU1ER1BVX0lSUV9DTElFTlRJ
RF9MRUdBQ1kpICYmCj4gKwkJICAgYWRldi0+aXJxLnZpcnFbc3JjX2lkXSkgewo+ICAgCQlnZW5l
cmljX2hhbmRsZV9pcnEoaXJxX2ZpbmRfbWFwcGluZyhhZGV2LT5pcnEuZG9tYWluLCBzcmNfaWQp
KTsKPiAgIAo+ICAgCX0gZWxzZSBpZiAoIWFkZXYtPmlycS5jbGllbnRbY2xpZW50X2lkXS5zb3Vy
Y2VzKSB7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
