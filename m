Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B525AA03
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Sep 2020 13:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D5B6E301;
	Wed,  2 Sep 2020 11:07:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3890B6E301
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Sep 2020 11:07:51 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k15so4765959wrn.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 02 Sep 2020 04:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=lsVMRp3Gq/Xg8AahAJ9+EzRF+b1bWvCZF8AxNo3VcQY=;
 b=kQwPAI5+nSoe85fGCEyoDIhspod/hLCma11FZhY5iG2vVwp7vWXjtEpwPVClTU3i2Y
 /S7lPLWjH1l5pXGyo/74jg9pKvStD9N/ThyHyN+dXDEm+8GcNWzQuypzZcQFjYozxr72
 keg/ZAiBP8IYFOVN/duRgYu3cIxc12GUFy20xJd5qjgu3pqeWIRPFEWuWG8XDEghZa03
 3i1oMIclRGettDfSOUK01sHD390UZzTyOXlatJg6L4wsj4McDLVx6Gag22H/TDYMcCqA
 J6mCPeBp2ihyWQPQ75vOJOgb/omMZ1JVtsG5kWASLduiNyvpjeFD2nzxgfwGoDFxDrib
 msPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=lsVMRp3Gq/Xg8AahAJ9+EzRF+b1bWvCZF8AxNo3VcQY=;
 b=R36NjGU5KC+uNxdK9Lya83BtmjE5DhtomhAJsmd3GBvT9UndpD9YJ23rxjJKJKEpPF
 WhCwlF0Y7EsiAIokx3GzRCIcD7eBhajNWX1+mfPO0dsam8MpyQHhkLyvDBwnTlJbvLP9
 BYmYilqbwHjOZsQF/jEhMWl6ec5NKI+WKGMdngm7tnitiWPaz9tb9vSbxJTL2CnSxfDC
 5nG62GCXfL5AX6hYsgzlXCyLBq+FmJqUmo7yenmiPE/CnwrqIpbRgnBST2xk9+BexAXX
 ttJZD6BBEFIPqj6kjkNMlJgrprXC+xzUa5Ag4mRi5LBpQy8lGtkpYgM1aiAE3KjpL7mM
 duNg==
X-Gm-Message-State: AOAM5332MY/dnJoAzew7Y74RfMh9yYRLdfA/IHfGjLmU9NQDrtYKclC1
 kWcgU3kdMCT2JD5Gr83xzRhVYTnydO0=
X-Google-Smtp-Source: ABdhPJy6dv0aZ+JwQ9Udf6sB0C6SCUfxjN96CH4efcXGXyeTWvERmVppqpjUk5xCf+xavS6VVdH0Ig==
X-Received: by 2002:a05:6000:1c8:: with SMTP id t8mr4282693wrx.3.1599044869934; 
 Wed, 02 Sep 2020 04:07:49 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id q186sm6372397wma.45.2020.09.02.04.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 04:07:49 -0700 (PDT)
Subject: Re: [PATCH 1/1] drm/amdgpu: disable gpu-sched load balance for uvd_enc
To: Nirmoy Das <nirmoy.das@amd.com>, amd-gfx@lists.freedesktop.org
References: <20200902101536.47112-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9fc4a69d-3783-0626-5e88-18a579ada03b@gmail.com>
Date: Wed, 2 Sep 2020 13:07:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902101536.47112-1-nirmoy.das@amd.com>
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
Cc: pmenzel+amd-gfx@molgen.mpg.de, alexander.deucher@amd.com,
 Tianci.Yin@amd.com, Leo.Liu@amd.com, christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDIuMDkuMjAgdW0gMTI6MTUgc2NocmllYiBOaXJtb3kgRGFzOgo+IE9uIGhhcmR3YXJlIHdp
dGggbXVsdGlwbGUgdXZkIGluc3RhbmNlcywgZGVwZW5kZW50IHV2ZF9lbmMgam9icwo+IG1heSBn
ZXQgc2NoZWR1bGVkIHRvIGRpZmZlcmVudCB1dmQgaW5zdGFuY2VzLiBCZWNhdXNlIHV2ZF9lbmMK
PiBqb2JzIHJldGFpbiBodyBjb250ZXh0LCBkZXBlbmRlbnQgam9icyBzaG91bGQgYWx3YXlzIHJ1
biBvbiB0aGUKPiBzYW1lIHV2ZCBpbnN0YW5jZS4gVGhpcyBwYXRjaCBkaXNhYmxlcyBHUFUgc2No
ZWR1bGVyJ3MgbG9hZCBiYWxhbmNlcgo+IGZvciBhIGNvbnRleHQgdGhhdCBiaW5kcyBqb2JzIGZy
b20gdGhlIHNhbWUgY29udGV4dCB0byBhIHV2ZAo+IGluc3RhbmNlLgo+Cj4gU2lnbmVkLW9mZi1i
eTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMgfCAyICsrCj4gICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2N0eC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5j
Cj4gaW5kZXggN2NkMzk4ZDI1NDk4Li5jODBkODMzOWY1OGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jCj4gQEAgLTExNCw4ICsxMTQsMTAgQEAgc3RhdGljIGlu
dCBhbWRncHVfY3R4X2luaXRfZW50aXR5KHN0cnVjdCBhbWRncHVfY3R4ICpjdHgsIHUzMiBod19p
cCwKPiAgIAlzY2hlZHMgPSBhZGV2LT5ncHVfc2NoZWRbaHdfaXBdW2h3X3ByaW9dLnNjaGVkOwo+
ICAgCW51bV9zY2hlZHMgPSBhZGV2LT5ncHVfc2NoZWRbaHdfaXBdW2h3X3ByaW9dLm51bV9zY2hl
ZHM7Cj4KPiArCS8qIGRpc2FibGUgbG9hZCBiYWxhbmNlIGlmIHRoZSBodyBlbmdpbmUgcmV0YWlu
cyBjb250ZXh0IGFtb25nIGRlcGVuZGVudCBqb2JzICovCj4gICAJaWYgKGh3X2lwID09IEFNREdQ
VV9IV19JUF9WQ05fRU5DIHx8Cj4gICAJICAgIGh3X2lwID09IEFNREdQVV9IV19JUF9WQ05fREVD
IHx8Cj4gKwkgICAgaHdfaXAgPT0gQU1ER1BVX0hXX0lQX1VWRF9FTkMgfHwKPiAgIAkgICAgaHdf
aXAgPT0gQU1ER1BVX0hXX0lQX1VWRCkgewo+ICAgCQlzY2hlZCA9IGRybV9zY2hlZF9waWNrX2Jl
c3Qoc2NoZWRzLCBudW1fc2NoZWRzKTsKPiAgIAkJc2NoZWRzID0gJnNjaGVkOwo+IC0tCj4gMi4y
OC4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
