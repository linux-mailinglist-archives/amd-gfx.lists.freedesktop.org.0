Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A27D92C02A
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 09:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441A389BFE;
	Tue, 28 May 2019 07:38:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717A289BFE
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 07:38:26 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 15so1599609wmg.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 00:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Db/FL+bqbpGlgJrmYMQgiGjmVbemofKuwAmlEhdGy24=;
 b=nqo2EbW3ZBt2AKnp8U0Zy5A1STcN0VkVzPx+m2JrR2JHKWv+j8q9+nBx46uuLLnL6Z
 j2wycQaGpTCSB7b1mndTWlFnWh1SWZ/ojx/FKBXac47PJTrPXdoFhEG8TCft4XWLNGWw
 SQtGameJ6/2nwjxVCEox/lFDAZNbEquNApNQTSH6uBjhtUZg/BL5RpYcUway6kTVpQLM
 11o+kHSRNFO8Zroop5XeslvecDHmCbkft3+MkMTwkLKSChQvlf8nK/ujnfGUsv2vB/1+
 R3TIT52ZMXiViY2UL2OLq99FARCGbLsb1va0yC/qQKre4MUPuCWAWqj5fZ+sc67FE8cY
 hf5Q==
X-Gm-Message-State: APjAAAU576io/JQ42Zd+tCp67Zkd4crQsCYz46gY8p65C0wR+TsCz9PE
 9rJ+ig874a4SdKG5JSwbHSAmIvjQ
X-Google-Smtp-Source: APXvYqx5qDXSNls2TW0j4O1PLNL4C8CdFTqAd7sNeumMimVahjboHBZ2syFkkLJlJkvLUoeqaO5noQ==
X-Received: by 2002:a1c:cb0c:: with SMTP id b12mr1856730wmg.86.1559029105109; 
 Tue, 28 May 2019 00:38:25 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f197sm1752191wme.39.2019.05.28.00.38.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 00:38:24 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: add DRIVER_SYNCOBJ_TIMELINE to amdgpu
To: "Cui, Flora" <fcui@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Cui, Flora" <Flora.Cui@amd.com>
References: <20190528025203.11593-1-david1.zhou@amd.com>
 <3e5a2a4c-f4b5-d600-30a4-ce6e50e2cd72@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4e147e0d-fa0d-ce56-8dfd-e1bdce390a01@gmail.com>
Date: Tue, 28 May 2019 09:38:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3e5a2a4c-f4b5-d600-30a4-ce6e50e2cd72@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Db/FL+bqbpGlgJrmYMQgiGjmVbemofKuwAmlEhdGy24=;
 b=X9JqM7ByKiX7sAf8zoroFO9PAahNPKVvDDjMdPVBZVxc/6rIYYhWtvmW0c+sQHYc1s
 5b5KlPoAh83khZ2Lppo1FXQ7CmP8egwphRLyCsp5LcJrMA9NSvpNuXKif34rC4F6Ass7
 2pSmr8AOvnklLPOLJtH3wU4MU+wr/ijEAm6MPX+xEVFCzmDq/6y3+3aVZczNp9Yyc/TM
 q9av6rNDcfZpaWkLSoECypMCtJjQJvwBhgBGT2TKrplnVhcsgWohJ3qwDKEGPdRqcF1p
 cyPcSdJ3LFCVgw3OR+f6bOVcVU3LV0Kfj8zl7O0F5dle0LCxZ5RwZJKum1S4ZMhur3a4
 1qmQ==
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
CkFtIDI4LjA1LjE5IHVtIDA1OjA1IHNjaHJpZWIgQ3VpLCBGbG9yYToKPiB0aGUgcGF0Y2ggaXMg
UmV2aWV3ZWQtYnk6IEZsb3JhIEN1aSA8RmxvcmEuQ3VpQGFtZC5jb20+Cj4KPiDlnKggNS8yOC8y
MDE5IDEwOjUyIEFNLCBDaHVubWluZyBaaG91IOWGmemBkzoKPj4gQ2hhbmdlLUlkOiBJMmIxYWYx
NDc4ZmJkZGJiNTA4NGI5MGIzZmY4NWMyZWI5NjRiZDIxNwo+PiBTaWduZWQtb2ZmLWJ5OiBDaHVu
bWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29tPgo+PiAtLS0KPj4gICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMyArKy0KPj4gICAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rydi5jCj4+IGluZGV4IDc4NzA2ZGZhNzUzYS4uMWYzOGQ2ZmMxZmUzIDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+IEBAIC0xMzA3
LDcgKzEzMDcsOCBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIga21zX2RyaXZlciA9IHsKPj4g
ICAgCS5kcml2ZXJfZmVhdHVyZXMgPQo+PiAgICAJICAgIERSSVZFUl9VU0VfQUdQIHwgRFJJVkVS
X0FUT01JQyB8Cj4+ICAgIAkgICAgRFJJVkVSX0dFTSB8Cj4+IC0JICAgIERSSVZFUl9QUklNRSB8
IERSSVZFUl9SRU5ERVIgfCBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9TWU5DT0JKLAo+PiArCSAg
ICBEUklWRVJfUFJJTUUgfCBEUklWRVJfUkVOREVSIHwgRFJJVkVSX01PREVTRVQgfCBEUklWRVJf
U1lOQ09CSiB8Cj4+ICsJICAgIERSSVZFUl9TWU5DT0JKX1RJTUVMSU5FLAo+PiAgICAJLmxvYWQg
PSBhbWRncHVfZHJpdmVyX2xvYWRfa21zLAo+PiAgICAJLm9wZW4gPSBhbWRncHVfZHJpdmVyX29w
ZW5fa21zLAo+PiAgICAJLnBvc3RjbG9zZSA9IGFtZGdwdV9kcml2ZXJfcG9zdGNsb3NlX2ttcywK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1n
ZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
