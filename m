Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1969424D8
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 13:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264488936B;
	Wed, 12 Jun 2019 11:57:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05D88936B
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 11:57:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x17so1300284wrl.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 04:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NZrR6W4XJnVSS7uqGwvqPwm4jglsJtOCzdWYNSvoO28=;
 b=Pn8lQchENTxfnDO3TPyCSOqY9P77ez20wSdmq3CDX6kFduRdkm99uUH/4X7OPAAsqF
 5x7TpXyU/7mva9+/F9wyrC8NrAI4VM1vOBJkoaD9UMeAVVe2n6aPECywaeb4yp8mVzyh
 kGmi6nF5K1iyo2Qal7s5ADPviGxo77Pw1z4XiPZq3TshSqhwyWaLAY1jIAj67GJBcbAY
 dB2Jfmo/tegUs+ATWv/WEuB7NcXqZbJdM1+RrEmtl+IgI2BdVKOQMS8e10MR8DHJpe30
 hx+68xJp8T91jHBxu8aYigMQgm9ryueaEwPi4SqLbhtDQdmdTBw0zsyb+iHoatg8JWPW
 0x4Q==
X-Gm-Message-State: APjAAAWAauLYMA+az3We/6mS2YYfdNs9fnymQkBeWgsT5YlsbS3qMjK/
 ajHmSpAZ3pTVFSQCS3Fatgb2ngmJ
X-Google-Smtp-Source: APXvYqy4Vzcv6OELVldTEw2rT9FSb0ZsrbJqZ1hlK857TtDU2xU37Pjl0m1VT0pXM2MGrIXMFiUa2w==
X-Received: by 2002:a05:6000:42:: with SMTP id k2mr8386872wrx.80.1560340622267; 
 Wed, 12 Jun 2019 04:57:02 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f10sm27016034wrg.24.2019.06.12.04.57.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 04:57:01 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/amdgpu: Bail out of BO node creation if not
 enough VRAM (v3)
To: "StDenis, Tom" <Tom.StDenis@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190612110829.4699-1-tom.stdenis@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <122212cb-277c-5de5-56f9-3941beb77f09@gmail.com>
Date: Wed, 12 Jun 2019 13:57:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612110829.4699-1-tom.stdenis@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NZrR6W4XJnVSS7uqGwvqPwm4jglsJtOCzdWYNSvoO28=;
 b=VwQojDX4BqyVUi4wvDq2aOEVeJqgjQqigWOwNcwTwkj+DYMUV81XeixmRN0uwpOnq/
 Dm2NSBaf0mHQ2W7gjgHxscnWEo+ziamwdgmaSD7O34XNFvk9/2+u6f6MChIXv6cf+l9B
 Tpcu8ZOuLfMQM/62Uit6LvmmFErkB68cFsbx1/XwZG5aXmmXYd0gsmweVqk8YqDyoJdI
 XU58l/nI7C+RSRHAsuBALp4apYoUwjfPmjMz7Ei0lVIQe18eR1+IPDaRJAg+TX+tJiN4
 l4R/44L4xheKShS4Jo237/eD2HLjUTU+VVJmTMhabuApSQVhrYjF+xuj5nZzTRYMUK7c
 cKFg==
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

QW0gMTIuMDYuMTkgdW0gMTM6MDggc2NocmllYiBTdERlbmlzLCBUb206Cj4gKHYyKTogUmV0dXJu
IDAgYW5kIHNldCBtZW0tPm1tX25vZGUgdG8gTlVMTC4KPiAodjMpOiBVc2UgYXRvbWljNjRfYWRk
X3JldHVybiBpbnN0ZWFkLgo+Cj4gU2lnbmVkLW9mZi1ieTogVG9tIFN0IERlbmlzIDx0b20uc3Rk
ZW5pc0BhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdnJhbV9tZ3IuYyB8IDE3ICsrKysrKysrKysrKy0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCj4gaW5kZXggOGFlYTJmMjFiMjAyLi5jOTYzYWQ4
NjA3MmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zy
YW1fbWdyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9t
Z3IuYwo+IEBAIC0yNzYsNyArMjc2LDcgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3
KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+ICAgCXN0cnVjdCBkcm1fbW1fbm9k
ZSAqbm9kZXM7Cj4gICAJZW51bSBkcm1fbW1faW5zZXJ0X21vZGUgbW9kZTsKPiAgIAl1bnNpZ25l
ZCBsb25nIGxwZm4sIG51bV9ub2RlcywgcGFnZXNfcGVyX25vZGUsIHBhZ2VzX2xlZnQ7Cj4gLQl1
aW50NjRfdCB1c2FnZSA9IDAsIHZpc191c2FnZSA9IDA7Cj4gKwl1aW50NjRfdCB2aXNfdXNhZ2Ug
PSAwOwo+ICAgCXVuc2lnbmVkIGk7Cj4gICAJaW50IHI7Cj4gICAKPiBAQCAtMjg0LDYgKzI4NCwx
MyBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21ncl9uZXcoc3RydWN0IHR0bV9tZW1fdHlwZV9t
YW5hZ2VyICptYW4sCj4gICAJaWYgKCFscGZuKQo+ICAgCQlscGZuID0gbWFuLT5zaXplOwo+ICAg
Cj4gKwkvKiBiYWlsIG91dCBxdWlja2x5IGlmIHRoZXJlJ3MgbGlrZWx5IG5vdCBlbm91Z2ggVlJB
TSBmb3IgdGhpcyBCTyAqLwo+ICsJaWYgKGF0b21pYzY0X2FkZF9yZXR1cm4obWVtLT5udW1fcGFn
ZXMgPDwgUEFHRV9TSElGVCwgJm1nci0+dXNhZ2UpID4gYWRldi0+Z21jLm1jX3ZyYW1fc2l6ZSkg
ewo+ICsJCWF0b21pYzY0X3N1YihtZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZULCAmbWdyLT51
c2FnZSk7Cj4gKwkJbWVtLT5tbV9ub2RlID0gTlVMTDsKPiArCQlyZXR1cm4gMDsKPiArCX0KPiAr
Cj4gICAJaWYgKHBsYWNlLT5mbGFncyAmIFRUTV9QTF9GTEFHX0NPTlRJR1VPVVMpIHsKPiAgIAkJ
cGFnZXNfcGVyX25vZGUgPSB+MHVsOwo+ICAgCQludW1fbm9kZXMgPSAxOwo+IEBAIC0zMDAsOCAr
MzA3LDEwIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgdHRtX21lbV90
eXBlX21hbmFnZXIgKm1hbiwKPiAgIAo+ICAgCW5vZGVzID0ga3ZtYWxsb2NfYXJyYXkoKHVpbnQz
Ml90KW51bV9ub2Rlcywgc2l6ZW9mKCpub2RlcyksCj4gICAJCQkgICAgICAgR0ZQX0tFUk5FTCB8
IF9fR0ZQX1pFUk8pOwo+IC0JaWYgKCFub2RlcykKPiArCWlmICghbm9kZXMpIHsKPiArCQlhdG9t
aWM2NF9zdWIobWVtLT5udW1fcGFnZXMgPDwgUEFHRV9TSElGVCwgJm1nci0+dXNhZ2UpOwo+ICAg
CQlyZXR1cm4gLUVOT01FTTsKPiArCX0KPiAgIAo+ICAgCW1vZGUgPSBEUk1fTU1fSU5TRVJUX0JF
U1Q7Cj4gICAJaWYgKHBsYWNlLT5mbGFncyAmIFRUTV9QTF9GTEFHX1RPUERPV04pCj4gQEAgLTMy
MSw3ICszMzAsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21ncl9uZXcoc3RydWN0IHR0bV9t
ZW1fdHlwZV9tYW5hZ2VyICptYW4sCj4gICAJCWlmICh1bmxpa2VseShyKSkKPiAgIAkJCWJyZWFr
Owo+ICAgCj4gLQkJdXNhZ2UgKz0gbm9kZXNbaV0uc2l6ZSA8PCBQQUdFX1NISUZUOwo+ICAgCQl2
aXNfdXNhZ2UgKz0gYW1kZ3B1X3ZyYW1fbWdyX3Zpc19zaXplKGFkZXYsICZub2Rlc1tpXSk7Cj4g
ICAJCWFtZGdwdV92cmFtX21ncl92aXJ0X3N0YXJ0KG1lbSwgJm5vZGVzW2ldKTsKPiAgIAkJcGFn
ZXNfbGVmdCAtPSBwYWdlczsKPiBAQCAtMzQxLDE0ICszNDksMTIgQEAgc3RhdGljIGludCBhbWRn
cHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+ICAgCQlp
ZiAodW5saWtlbHkocikpCj4gICAJCQlnb3RvIGVycm9yOwo+ICAgCj4gLQkJdXNhZ2UgKz0gbm9k
ZXNbaV0uc2l6ZSA8PCBQQUdFX1NISUZUOwo+ICAgCQl2aXNfdXNhZ2UgKz0gYW1kZ3B1X3ZyYW1f
bWdyX3Zpc19zaXplKGFkZXYsICZub2Rlc1tpXSk7Cj4gICAJCWFtZGdwdV92cmFtX21ncl92aXJ0
X3N0YXJ0KG1lbSwgJm5vZGVzW2ldKTsKPiAgIAkJcGFnZXNfbGVmdCAtPSBwYWdlczsKPiAgIAl9
Cj4gICAJc3Bpbl91bmxvY2soJm1nci0+bG9jayk7Cj4gICAKPiAtCWF0b21pYzY0X2FkZCh1c2Fn
ZSwgJm1nci0+dXNhZ2UpOwo+ICAgCWF0b21pYzY0X2FkZCh2aXNfdXNhZ2UsICZtZ3ItPnZpc191
c2FnZSk7Cj4gICAKPiAgIAltZW0tPm1tX25vZGUgPSBub2RlczsKPiBAQCAtMzU5LDYgKzM2NSw3
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21h
bmFnZXIgKm1hbiwKPiAgIAl3aGlsZSAoaS0tKQo+ICAgCQlkcm1fbW1fcmVtb3ZlX25vZGUoJm5v
ZGVzW2ldKTsKPiAgIAlzcGluX3VubG9jaygmbWdyLT5sb2NrKTsKPiArCWF0b21pYzY0X3N1Yiht
ZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZULCAmbWdyLT51c2FnZSk7Cj4gICAKPiAgIAlrdmZy
ZWUobm9kZXMpOwo+ICAgCXJldHVybiByID09IC1FTk9TUEMgPyAwIDogcjsKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
