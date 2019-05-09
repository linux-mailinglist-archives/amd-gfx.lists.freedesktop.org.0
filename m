Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C2D18616
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 09:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180E9899EA;
	Thu,  9 May 2019 07:18:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE24C899D5
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 07:18:16 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id o189so1796837wmb.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 May 2019 00:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3BuSMMIdmewAQy+sJHlVTgGgz1pXZLDfcpduAlXFXY0=;
 b=J5n8leHX8MLOQd3ID6wGHfepuq4m56dUA7Q8hrjeetJ0ozGlu6S+IwprRpJKNV17W6
 KYOT5G0AMQF3B7PF0oOdvvcnbRFQ/5Iku+2wnkFULqWJBiiJCzliT6rwAVDD4RCP2KYL
 +VmjYXjodjshsLDRhXnbW0uv4IaV2Z0/Mzdf0yew38IZuJOv9wWWmfPj/pd0qdAiP0sE
 VTaH7hAvmnxt/pieVixVMVnfrD4HUTtEEEsOJV2LaCmWAS8cSN9+c0MvABQqcnuzcA9y
 3dwQxEgliGbR1N3tnY+ScXParW3KPrjSkqaFvf0fNKIuoxYqwtTJTJhW2EeejH6bcgg+
 Fpyw==
X-Gm-Message-State: APjAAAXB60q54AohwFEWaMhXnIlRLSpCfMhQnD6THrFcH0q1c4R1jLlE
 NR/U1W0Xu44OpR4i6zbis5hRVMGM
X-Google-Smtp-Source: APXvYqwPJxNpqvU16FVPf0ZfSZQhdfwi5wlqoml/U+xhu3JSz/V9buEF57LpOYYO4VmpJZMDEOWvwg==
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr1559411wmj.139.1557386295228; 
 Thu, 09 May 2019 00:18:15 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id t18sm1973490wrg.19.2019.05.09.00.18.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 00:18:14 -0700 (PDT)
Subject: Re: [PATCH] drm/sched: fix the duplicated TMO message for one IB
To: Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org
References: <1557376305-24294-1-git-send-email-Monk.Liu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ca57f69d-eced-8e9d-5a07-42a642d96a0f@gmail.com>
Date: Thu, 9 May 2019 09:18:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557376305-24294-1-git-send-email-Monk.Liu@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=3BuSMMIdmewAQy+sJHlVTgGgz1pXZLDfcpduAlXFXY0=;
 b=AUdoZeRC6G6tEuWLfEj/Oj0mN9zbNhaVjrKBRNMmzag9e6DGTT7QU9yu2VOHymvMOr
 MjrOVWK6q8/YVU1moMUHu19STAWumqHhuEJU44Cl/L88lMSLjT0nJTuXMxPZWWvsv3LD
 mzKKvMpz2UUXkzLzGNzRNhW0HOR+gpIQEQerWbp0Qy2D8hpMk+t2DYPLQ37JqkANkczK
 KGGcAzggG2fftBqalRkccf8slT97FMq2fvmUoBQo/IoQUznHZR6nDlpffRD/rtgCsqK9
 qz0dY+zzh6dq1HM5PdpuOALfwxrG5ROkILo5WbIf2REJqx4XffgXBFp1jEAclrb2CDE3
 4XYQ==
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

QW0gMDkuMDUuMTkgdW0gMDY6MzEgc2NocmllYiBNb25rIExpdToKPiB3ZSBkb24ndCBuZWVkIGR1
cGxpY2F0ZWQgSUIncyB0aW1lb3V0IGVycm9yIG1lc3NhZ2UgcmVwb3J0ZWQgZW5kbGVzc2x5LAo+
IGp1c3Qgb25lIHJlcG9ydCBwZXIgdGltZWRvdXQgSUIgaXMgZW5vdWdoCgpXZWxsLCBOQUsuIFdl
IGRvbid0IG5lZWQgbXVsdGlwbGUgdGltZW91dCByZXBvcnRzLCBidXQgd2UgcmVhbGx5IG5lZWQg
dG8gCnJlc3RhcnQgdGhlIHRpbWVvdXQgY291bnRlciBhZnRlciBoYW5kbGluZyBpdC4KCk90aGVy
d2lzZSB3ZSB3aWxsIG5ldmVyIHJ1biBpbnRvIGEgdGltZW91dCBhZ2FpbiBhZnRlciBoYW5kbGlu
ZyBvbmUgYW5kIAppdCBpc24ndCB1bmxpa2VseSB0aGF0IG11bHRpcGxlIElCcyBpbiBhIHJvdyBk
b2Vzbid0IHdvcmsgY29ycmVjdGx5LgoKQ2hyaXN0aWFuLgoKPgo+IFNpZ25lZC1vZmYtYnk6IE1v
bmsgTGl1IDxNb25rLkxpdUBhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3NjaGVk
dWxlci9zY2hlZF9tYWluLmMgfCA1IC0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21h
aW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4gaW5kZXggYzFh
YWY4NS4uZDZjMTdmMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3Nj
aGVkX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5j
Cj4gQEAgLTMwOCw3ICszMDgsNiBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfam9iX3RpbWVkb3V0
KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgIHsKPiAgIAlzdHJ1Y3QgZHJtX2dwdV9zY2hl
ZHVsZXIgKnNjaGVkOwo+ICAgCXN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2I7Cj4gLQl1bnNpZ25l
ZCBsb25nIGZsYWdzOwo+ICAgCj4gICAJc2NoZWQgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0
IGRybV9ncHVfc2NoZWR1bGVyLCB3b3JrX3Rkci53b3JrKTsKPiAgIAlqb2IgPSBsaXN0X2ZpcnN0
X2VudHJ5X29yX251bGwoJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0LAo+IEBAIC0zMTYsMTAgKzMx
NSw2IEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9qb2JfdGltZWRvdXQoc3RydWN0IHdvcmtfc3Ry
dWN0ICp3b3JrKQo+ICAgCj4gICAJaWYgKGpvYikKPiAgIAkJam9iLT5zY2hlZC0+b3BzLT50aW1l
ZG91dF9qb2Ioam9iKTsKPiAtCj4gLQlzcGluX2xvY2tfaXJxc2F2ZSgmc2NoZWQtPmpvYl9saXN0
X2xvY2ssIGZsYWdzKTsKPiAtCWRybV9zY2hlZF9zdGFydF90aW1lb3V0KHNjaGVkKTsKPiAtCXNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7Cj4gICB9
Cj4gICAKPiAgICAvKioKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
