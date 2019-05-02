Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03081119C3
	for <lists+amd-gfx@lfdr.de>; Thu,  2 May 2019 15:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A58894DD;
	Thu,  2 May 2019 13:08:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C678894DD
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 May 2019 13:08:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p16so2558035wma.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 02 May 2019 06:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OFcAjaSPbB/kDJqJhLltqGZYH0yI+lIMey3petvrr7U=;
 b=l+Ijy+GR+8lwG+6DpWcCcR9nY0z7f+M7c8eQnR+cg46Q9E7GiZQC5q5874KKXU/yy8
 BVUvV+vPYhaclHbSnLF0CjSc2xl8Gm4GMRv7Rstn1VR7y9FSl1/5WyRc5dtxMVsljl9d
 aoyx07f1303shvRsiaTep2+NXbvzrBBRMbMikPRdklLOQtHS03X8AOEYQ2TJLNJ3FvSw
 X7lwM0rjod/wYBLMGaduQc3MeBfCWMpS7V65FQtkuJMZUIQKRzZXQZVepQ7sbo318u2X
 BxuHjG8TOjIIQNj2zjSlX4nsar3QzRMjmtFnizqWHTABFuxYZSqKiMUVmL/6PhQOs0nz
 4O7w==
X-Gm-Message-State: APjAAAXBSHpGkwDWtrzKnNC74HvKLealBH1gXDhM20xfoEezFlNFvfpI
 TFjAHW2W+R4JF+w100H17KCEnCFa
X-Google-Smtp-Source: APXvYqyzPOuvgOKcDaFElZrQM4cFCoGoAXkFILl5KBiaXtHtbh/fZonEBDbPua9KO24Sd8AaZECaFQ==
X-Received: by 2002:a1c:1a90:: with SMTP id a138mr2310105wma.81.1556802531182; 
 Thu, 02 May 2019 06:08:51 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 195sm2693647wme.32.2019.05.02.06.08.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 06:08:50 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/display: Use int for signed error code checks in
 commit planes
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20190502130317.5506-1-nicholas.kazlauskas@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b70af187-37f7-4f19-16c2-61839968d8e8@gmail.com>
Date: Thu, 2 May 2019 15:08:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502130317.5506-1-nicholas.kazlauskas@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=OFcAjaSPbB/kDJqJhLltqGZYH0yI+lIMey3petvrr7U=;
 b=WVrkHKjDfKDaOD3/G+4QyzZNxm6O0S4qYz7dxK84J8qNm1yDeDYbEEWCsWRLLHAZP+
 A1wysrp4oho4/0gAdl32xy9y+4Q6vqt5huW1JjzdCfqlvUUhF32d6E8pcZJrShE7+RtK
 Pfz1olITTIr0au7cq+DGkzRcFdy7Apm5Ydew3dbg3LepbzRnvK3BhNrrWMMum819c0p3
 rTa6fedQ1F9cZVGx2NEINu5IC7PTNyTLGmlCnMUfo4Fel4qBhUQ5zuodBeWSLs0ld6Wt
 H4HXtKF7JRQ2tR9qpi/o9mlz1dHJyRkBSrC34pzlaWDNdvo46XJ+q/aOZd0+9jH2tcpB
 KimA==
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

QW0gMDIuMDUuMTkgdW0gMTU6MDMgc2NocmllYiBOaWNob2xhcyBLYXpsYXVza2FzOgo+IFtXaHld
Cj4KPiBUaGUgdHlwZSBvZiAncicgaXMgdWludDMyX3QgYW5kIHRoZSByZXR1cm4gY29kZXMgZm9y
IGJvdGg6Cj4KPiAtIHJlc2VydmF0aW9uX29iamVjdF93YWl0X3RpbWVvdXRfcmN1Cj4gLSBhbWRn
cHVfYm9fcmVzZXJ2ZQo+Cj4gLi4uYXJlIHNpZ25lZC4gV2hpbGUgaXQgd29ya3MgZm9yIHRoZSBs
YXR0ZXIgc2luY2UgdGhlIGNoZWNrIGlzCj4gZG9uZSBvbiAhPSAwIGl0IGRvZXNuJ3Qgd29yayBm
b3IgdGhlIGZvcm1lciBzaW5jZSB3ZSBjaGVjayA8PSAwLgo+Cj4gW0hvd10KPgo+IE1ha2UgJ3In
IGFuIGludCBpbiBjb21taXQgcGxhbmVzIHNvIHdlJ3JlIG5vdCBkb2luZyBhbnkgdW5zaWduZWQv
c2lnbmVkCj4gY29udmVyc2lvbiBoZXJlIGluIHRoZSBmaXJzdCBwbGFjZS4KPgo+IFJlcG9ydGVk
LWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jIHwgNCArKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jCj4gaW5kZXggYmVjZDhjYjNhYWI2Li43MjJmODYzY2U0YTQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMK
PiBAQCAtNTMzMiw3ICs1MzMyLDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtX2NvbW1pdF9wbGFu
ZXMoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAo+ICAgCQkJCSAgICBzdHJ1Y3QgZHJt
X2NydGMgKnBjcnRjLAo+ICAgCQkJCSAgICBib29sIHdhaXRfZm9yX3ZibGFuaykKPiAgIHsKPiAt
CXVpbnQzMl90IGksIHI7Cj4gKwl1aW50MzJfdCBpOwo+ICAgCXVpbnQ2NF90IHRpbWVzdGFtcF9u
czsKPiAgIAlzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZTsKPiAgIAlzdHJ1Y3QgZHJtX3BsYW5lX3N0
YXRlICpvbGRfcGxhbmVfc3RhdGUsICpuZXdfcGxhbmVfc3RhdGU7Cj4gQEAgLTUzNDIsNyArNTM0
Miw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb21taXRfcGxhbmVzKHN0cnVjdCBkcm1fYXRv
bWljX3N0YXRlICpzdGF0ZSwKPiAgIAlzdHJ1Y3QgZG1fY3J0Y19zdGF0ZSAqYWNydGNfc3RhdGUg
PSB0b19kbV9jcnRjX3N0YXRlKG5ld19wY3J0Y19zdGF0ZSk7Cj4gICAJc3RydWN0IGRtX2NydGNf
c3RhdGUgKmRtX29sZF9jcnRjX3N0YXRlID0KPiAgIAkJCXRvX2RtX2NydGNfc3RhdGUoZHJtX2F0
b21pY19nZXRfb2xkX2NydGNfc3RhdGUoc3RhdGUsIHBjcnRjKSk7Cj4gLQlpbnQgcGxhbmVzX2Nv
dW50ID0gMCwgdnBvcywgaHBvczsKPiArCWludCByLCBwbGFuZXNfY291bnQgPSAwLCB2cG9zLCBo
cG9zOwo+ICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gICAJc3RydWN0IGFtZGdwdV9ibyAqYWJv
Owo+ICAgCXVpbnQ2NF90IHRpbGluZ19mbGFnczsKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
