Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA2EB48C9
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 10:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4445C89C85;
	Tue, 17 Sep 2019 08:09:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CF189C85
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 08:09:24 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l3so2046966wru.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 01:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=8IthkYK1OyD4+6C/GBjH94h+m5k4IXQNFNyo8QEp1QM=;
 b=mcXogTgF1SZJNg162VaBlxtmcG4tNddE1DVEX+GrFfPAsLax4Yn/Z60LNWr1SqlAPj
 Guopez0/ejzZTjBkf8Hjt0zO3tz7iKSbbuRcBQELBfB3B8VmDXTAU78/BSCHWqBvQ4WK
 eOwNSY17B6M/UNufb8ccnS4BrPpmbGfd9/ixhDggjSMVp0ZYVY1uoLhtaReo7JymyCuG
 4EmQZJSwLGbXb9nqUgMM9k2Yz1jpBL4/MXM8DhYhaZhv9xvTc98wfdup7u28Ah6yAKHV
 hMlMBy+HsyurhUjjoqdioO5WUXc4AbhOmUh9WKYETAFlAwZjXdsLKOBWnqjyRbpaku7V
 S9OQ==
X-Gm-Message-State: APjAAAXBD66CRBaq5BIAO2NYNuNiJ89gUBoeGFVV4ynGAAnJEXUpH4bo
 9WWh8NuCv0bVYGJTyoPvCeToJVls
X-Google-Smtp-Source: APXvYqwLAMKkySLjwl0lDc1vZtdPfPQmngilQo/0+zqCegX9vZVyK+AfPs6nTvbBvy2BT/yGv204Eg==
X-Received: by 2002:a5d:678a:: with SMTP id v10mr1824502wru.145.1568707763198; 
 Tue, 17 Sep 2019 01:09:23 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id q10sm4198864wrd.39.2019.09.17.01.09.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 01:09:22 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu/ras: use GPU PAGE_SIZE/SHIFT for reserving
 pages
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20190916195052.29281-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c233de22-2e5d-385f-6164-e35f51e439e0@gmail.com>
Date: Tue, 17 Sep 2019 10:09:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916195052.29281-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8IthkYK1OyD4+6C/GBjH94h+m5k4IXQNFNyo8QEp1QM=;
 b=tJrXbd2Qs81JK7jGKEqPzGhTq/HBewGFBDrRsKgGf0sRaERWx6QVdebHrP5vBuSnhS
 IiK/QduWPCUbqXpo2Chpfy2iS6EXBpdx9hZWm8jTDD+6boL6lv2uvpH1eTT/x/zqZzFh
 ea8yfaUOuLQOZsPsUmkCu6fEs0CuU3xql8STUUv803bQxan4GrnckUKksHiFlp4kVuIi
 hk63WZm7atm+lmK/Cnepx9Nn0EJpR/jwB7I8FA0oaDs3mnJoOMIZN7pMM1JAm1JFGmrM
 NtUr5hLVPx0MiezE1EOetpdgS611udVNBtmz/F7GnHTIFhrdumcVbqB5t8LCYBDr9BVm
 ZU3A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTYuMDkuMTkgdW0gMjE6NTAgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gV2UgYXJlIHJlc2Vy
dmluZyB2cmFtIHBhZ2VzIHNvIHRoZXkgc2hvdWxkIGJlIGFsaWduZWQgdG8gdGhlCj4gR1BVIHBh
Z2Ugc2l6ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Jhcy5jIHwgMyArKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiBpbmRl
eCBmZjFmYzA4NGZmZTEuLjEzMWM1M2ZhOGVmZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmFzLmMKPiBAQCAtMTQwOSw3ICsxNDA5LDggQEAgaW50IGFtZGdwdV9yYXNf
cmVzZXJ2ZV9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAJZm9yIChp
ID0gZGF0YS0+bGFzdF9yZXNlcnZlZDsgaSA8IGRhdGEtPmNvdW50OyBpKyspIHsKPiAgIAkJYnAg
PSBkYXRhLT5icHNbaV0ucmV0aXJlZF9wYWdlOwo+ICAgCj4gLQkJaWYgKGFtZGdwdV9ib19jcmVh
dGVfa2VybmVsX2F0KGFkZXYsIGJwIDw8IFBBR0VfU0hJRlQsIFBBR0VfU0laRSwKPiArCQlpZiAo
YW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRldiwgYnAgPDwgQU1ER1BVX0dQVV9QQUdFX1NI
SUZULAo+ICsJCQkJCSAgICAgICBBTURHUFVfR1BVX1BBR0VfU0laRSwKPiAgIAkJCQkJICAgICAg
IEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCj4gICAJCQkJCSAgICAgICAmYm8sIE5VTEwpKQo+ICAg
CQkJRFJNX0VSUk9SKCJSQVMgRVJST1I6IHJlc2VydmUgdnJhbSAlbGx4IGZhaWxcbiIsIGJwKTsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
