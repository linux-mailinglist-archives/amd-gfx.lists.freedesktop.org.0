Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC268CDE9
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 10:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77166E353;
	Wed, 14 Aug 2019 08:13:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491466E353
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 08:13:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j16so7936923wrr.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 01:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=uAunzNi5ayb0GAWF2KnaBKQPuCIuDxseipSbwS9HOiY=;
 b=WrwvCyLggwi55bHfLEwWOgjih3fxlC22lGJ54P6jKBwEXNE5/6/xa7ieIML13XClA0
 nOUVKIiCqeQ0M2N+pd5QL2y9DsWUxxuG8Dl+k4B3TMBaYM95tw5MPLlQuWeTAp0tMJ7i
 ejdFCH6V1iL1XfBBHL+Nd47TiUlIGfkfpMV1MfuiGRhii9iTmS0IFSYvXx3dpgW842AX
 PUNw6YDGcnJBBzpXeiAj58EBPUyZmtBgtAr+8kuFjgXvHaN3KgggBI9koO4BDfqNTLxr
 D8s+K5PD+V+WaqBlhbPgA+iPc0GNLqPTv6oaGfrPksU9BrLRKVD0MX5Yvz3hVod4OjXc
 juAQ==
X-Gm-Message-State: APjAAAUTfnxqql115KFCEg40GwJu5k1ENKLOuJ2E7GszRg05KXu2LqhL
 Iq/3q8USABdK5JH23jzzByKRXnO4
X-Google-Smtp-Source: APXvYqwKoHECBCG7CZktSuXIIfCGTWbH2x4u1VOvi1qfiWiPpR+iSgnVYwNfH2gSxybsSO0a10cr5w==
X-Received: by 2002:adf:e782:: with SMTP id n2mr23100496wrm.1.1565770381835;
 Wed, 14 Aug 2019 01:13:01 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b186sm2767337wmb.3.2019.08.14.01.13.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 01:13:01 -0700 (PDT)
Subject: Re: [PATCH] drm/amdkfd: Fill amdgpu_task_info for KFD VMs
To: "Zhao, Yong" <Yong.Zhao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190813192007.15881-1-Yong.Zhao@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1557e6fe-60a0-39ff-1ffd-2133be879113@gmail.com>
Date: Wed, 14 Aug 2019 10:13:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813192007.15881-1-Yong.Zhao@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=uAunzNi5ayb0GAWF2KnaBKQPuCIuDxseipSbwS9HOiY=;
 b=EpAGC1NNbAoHFEpNiie+qFGiPXSD0qe/KQvldSfgZqrzBUwE183ohPzZXs0G/6J0S7
 fuKdhtRvSbE29VWXJt26tz32BlLZJQX8/fhtuCWDYlM+0oeIFvxo4Yn+Ef/2R2pjZ527
 1OyaZyVe/f1ggL1EXirR9TpHNxa4Tw+bQhzRhPWvGdBgmPYar2dUeuF5gUOa/+7F0iFp
 NgYMyTZ7B7dgwDhulJgDn7NqyBxdyO0ZeiWeagGJ6tw2IGyICzet8z75UeSUbKxPxdyv
 LvJat6+uL7DfHi9Wrn7cOAw/14aRPH7jZKqVsuCC0vg3UGV8jiMaVvMk2lxBN2XAJd3C
 hZ3g==
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

QW0gMTMuMDguMTkgdW0gMjE6MjAgc2NocmllYiBaaGFvLCBZb25nOgo+IFRoZSBhbWRncHVfdGFz
a19pbmZvIHdpbGwgYmUgdXNlZCB3aGVuIHByaW50aW5nIFZNIHBhZ2UgZmF1bHQgZm9yIEtGRAo+
IHByb2Nlc3Nlcy4KPgo+IENoYW5nZS1JZDogSWZkOTgzZGI1ZGNlYjFkNDc3ZTcyODdlNDg5M2Y4
MDU2NWE3YTZiMDYKPiBTaWduZWQtb2ZmLWJ5OiBZb25nIFpoYW8gPFlvbmcuWmhhb0BhbWQuY29t
PgoKQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jIHwgMiAr
Kwo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jCj4gaW5kZXggOGYxMDc2YzBjODhhLi4yZWM0Mjc0OWY5
NzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3Mu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMKPiBAQCAt
ODAxLDYgKzgwMSw4IEBAIGludCBrZmRfcHJvY2Vzc19kZXZpY2VfaW5pdF92bShzdHJ1Y3Qga2Zk
X3Byb2Nlc3NfZGV2aWNlICpwZGQsCj4gICAJCXJldHVybiByZXQ7Cj4gICAJfQo+ICAgCj4gKwlh
bWRncHVfdm1fc2V0X3Rhc2tfaW5mbyhwZGQtPnZtKTsKPiArCj4gICAJcmV0ID0ga2ZkX3Byb2Nl
c3NfZGV2aWNlX3Jlc2VydmVfaWJfbWVtKHBkZCk7Cj4gICAJaWYgKHJldCkKPiAgIAkJZ290byBl
cnJfcmVzZXJ2ZV9pYl9tZW07CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
