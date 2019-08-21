Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B5497D1A
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 16:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FFA89789;
	Wed, 21 Aug 2019 14:33:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D1F89789
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 14:33:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q12so2240933wrj.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 07:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=H1W72rezKaypUEc3CuxuxmeV06MpM15Z6wSL71slAYk=;
 b=WJkbCV6O02y1nBIBibZt3n4ziqfPTMh2NDWa2HlOU2IucTzd0ffHPFL24ryknRP6wV
 EmYtmoSGUdq9OvQJSA2derBksEyQEFr+euc2gfUZk4vK/GyMY2NJa6lG1evA64cZhlR2
 4sy7fCibGfJFzqQwIwpdMJr8FZLdn2jJHz8azJ2iPMipGawEvxaTCtxorMWhhenDTfyt
 uSETWjfwsnkfHfYtjerdEiHKnzxAHFKDESrLS6kMnxjrr4fWduv1lo1UArULm7IB8kIi
 kVGMGoprAAnOTGEakO3OiNLXeIusYrap4DdxZ4Vi3cx5vyJUBMYbGyqtgIFglUtn1A6M
 66uw==
X-Gm-Message-State: APjAAAXNdvxLeUnnr92F7sAp4Ge2t+isT/wQGsFRocvYuwS1qBWCbVw1
 NLJE1uNwQJCEhURt/7wQMrWmSQAz
X-Google-Smtp-Source: APXvYqxzioE5jbFzYXS+aK4uvvLWgyCiCdSPHJRZN/kG+y3D9bJ4sa4/8CwGqUm5SZDQtBMFgxwXXw==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr40662019wrp.38.1566398012253; 
 Wed, 21 Aug 2019 07:33:32 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id o16sm29181426wrp.23.2019.08.21.07.33.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Aug 2019 07:33:31 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: prevent memory leaks in AMDGPU_CS ioctl
To: "Haehnle, Nicolai" <Nicolai.Haehnle@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190821142859.42579-1-nicolai.haehnle@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d86bbc1e-ac7a-17a5-f62a-7043a306bc94@gmail.com>
Date: Wed, 21 Aug 2019 16:33:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821142859.42579-1-nicolai.haehnle@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=H1W72rezKaypUEc3CuxuxmeV06MpM15Z6wSL71slAYk=;
 b=sifYX/2uhlyZRyrV6qVsUj1TnRutkY06SG6MRMRRDatuNgacEZ10E9RmDVo9E8LLVw
 2pi7SSqz4XZsUznvdZ2BwFYQ3+hBXxiWP+lSk/zQnNEBsDxKz7D9d0NKZI69m5IjcjRX
 ouMKrRvEEitmPgFB//jo1RjfZrjO8iSCnYTYOso7h/SPgsr2Z3i0wKEr+me0Y4WhTfe/
 EEC5ii/ZrFdwrBe933Ez1zAWxEuo3rc8SibQRICwUg8g0Zd5zpPrKz2Z+nkLRW127NMY
 BLZtK7p4dsnmeyyDe3+vLvCgcbTqkzRX/7q7STIY42JAPqB68USutDC+DZksiFZ+GMmf
 kM3Q==
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

QW0gMjEuMDguMTkgdW0gMTY6Mjkgc2NocmllYiBIYWVobmxlLCBOaWNvbGFpOgo+IEVycm9yIG91
dCBpZiB0aGUgQU1ER1BVX0NTIGlvY3RsIGlzIGNhbGxlZCB3aXRoIG11bHRpcGxlIFNZTkNPQkpf
T1VUIGFuZC9vcgo+IFRJTUVMSU5FX1NJR05BTCBjaHVua3MsIHNpbmNlIG90aGVyd2lzZSB0aGUg
bGFzdCBjaHVuayB3aW5zIHdoaWxlIHRoZQo+IGFsbG9jYXRlZCBhcnJheSBhcyB3ZWxsIGFzIHRo
ZSByZWZlcmVuY2UgY291bnRzIG9mIHN5bmMgb2JqZWN0cyBhcmUgbGVha2VkLgo+Cj4gU2lnbmVk
LW9mZi1ieTogTmljb2xhaSBIw6RobmxlIDxuaWNvbGFpLmhhZWhubGVAYW1kLmNvbT4KCldlIGNv
dWxkIHNob3J0ZW4gdGhlIGZ1bmN0aW9uIG5hbWVzIGF0IHNvbWUgcG9pbnQgYXMgd2VsbCwgYnV0
IHRoYXQncyAKdW5yZWxhdGVkIHRvIHRoaXMgcGF0Y2guCgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jIHwgOSArKysrKysrLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfY3MuYwo+IGluZGV4IGRlZjAyOWFiNTY1Ny4uZmQ5NWI1ODZiNTkwIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKPiBAQCAtMTEzNCwyMCAr
MTEzNCwyMyBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19wcm9jZXNzX3N5bmNvYmpfb3V0X2RlcChz
dHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCwKPiAgIAkJCQkJICAgICBzdHJ1Y3QgYW1kZ3B1X2Nz
X2NodW5rICpjaHVuaykKPiAgIHsKPiAgIAlzdHJ1Y3QgZHJtX2FtZGdwdV9jc19jaHVua19zZW0g
KmRlcHM7Cj4gICAJdW5zaWduZWQgbnVtX2RlcHM7Cj4gICAJaW50IGk7Cj4gICAKPiAgIAlkZXBz
ID0gKHN0cnVjdCBkcm1fYW1kZ3B1X2NzX2NodW5rX3NlbSAqKWNodW5rLT5rZGF0YTsKPiAgIAlu
dW1fZGVwcyA9IGNodW5rLT5sZW5ndGhfZHcgKiA0IC8KPiAgIAkJc2l6ZW9mKHN0cnVjdCBkcm1f
YW1kZ3B1X2NzX2NodW5rX3NlbSk7Cj4gICAKPiArCWlmIChwLT5wb3N0X2RlcHMpCj4gKwkJcmV0
dXJuIC1FSU5WQUw7Cj4gKwo+ICAgCXAtPnBvc3RfZGVwcyA9IGttYWxsb2NfYXJyYXkobnVtX2Rl
cHMsIHNpemVvZigqcC0+cG9zdF9kZXBzKSwKPiAgIAkJCQkgICAgIEdGUF9LRVJORUwpOwo+ICAg
CXAtPm51bV9wb3N0X2RlcHMgPSAwOwo+ICAgCj4gICAJaWYgKCFwLT5wb3N0X2RlcHMpCj4gICAJ
CXJldHVybiAtRU5PTUVNOwo+ICAgCj4gICAKPiAgIAlmb3IgKGkgPSAwOyBpIDwgbnVtX2RlcHM7
ICsraSkgewo+ICAgCQlwLT5wb3N0X2RlcHNbaV0uc3luY29iaiA9Cj4gQEAgLTExNTcsMzEgKzEx
NjAsMzMgQEAgc3RhdGljIGludCBhbWRncHVfY3NfcHJvY2Vzc19zeW5jb2JqX291dF9kZXAoc3Ry
dWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCj4gICAJCXAtPnBvc3RfZGVwc1tpXS5jaGFpbiA9IE5V
TEw7Cj4gICAJCXAtPnBvc3RfZGVwc1tpXS5wb2ludCA9IDA7Cj4gICAJCXAtPm51bV9wb3N0X2Rl
cHMrKzsKPiAgIAl9Cj4gICAKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICAgCj4gICBzdGF0
aWMgaW50IGFtZGdwdV9jc19wcm9jZXNzX3N5bmNvYmpfdGltZWxpbmVfb3V0X2RlcChzdHJ1Y3Qg
YW1kZ3B1X2NzX3BhcnNlciAqcCwKPiAtCQkJCQkJICAgICAgc3RydWN0IGFtZGdwdV9jc19jaHVu
awo+IC0JCQkJCQkgICAgICAqY2h1bmspCj4gKwkJCQkJCSAgICAgIHN0cnVjdCBhbWRncHVfY3Nf
Y2h1bmsgKmNodW5rKQo+ICAgewo+ICAgCXN0cnVjdCBkcm1fYW1kZ3B1X2NzX2NodW5rX3N5bmNv
YmogKnN5bmNvYmpfZGVwczsKPiAgIAl1bnNpZ25lZCBudW1fZGVwczsKPiAgIAlpbnQgaTsKPiAg
IAo+ICAgCXN5bmNvYmpfZGVwcyA9IChzdHJ1Y3QgZHJtX2FtZGdwdV9jc19jaHVua19zeW5jb2Jq
ICopY2h1bmstPmtkYXRhOwo+ICAgCW51bV9kZXBzID0gY2h1bmstPmxlbmd0aF9kdyAqIDQgLwo+
ICAgCQlzaXplb2Yoc3RydWN0IGRybV9hbWRncHVfY3NfY2h1bmtfc3luY29iaik7Cj4gICAKPiAr
CWlmIChwLT5wb3N0X2RlcHMpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICAgCXAtPnBvc3Rf
ZGVwcyA9IGttYWxsb2NfYXJyYXkobnVtX2RlcHMsIHNpemVvZigqcC0+cG9zdF9kZXBzKSwKPiAg
IAkJCQkgICAgIEdGUF9LRVJORUwpOwo+ICAgCXAtPm51bV9wb3N0X2RlcHMgPSAwOwo+ICAgCj4g
ICAJaWYgKCFwLT5wb3N0X2RlcHMpCj4gICAJCXJldHVybiAtRU5PTUVNOwo+ICAgCj4gICAJZm9y
IChpID0gMDsgaSA8IG51bV9kZXBzOyArK2kpIHsKPiAgIAkJc3RydWN0IGFtZGdwdV9jc19wb3N0
X2RlcCAqZGVwID0gJnAtPnBvc3RfZGVwc1tpXTsKPiAgIAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
