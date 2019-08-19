Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8FF91E93
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 10:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6456E0C8;
	Mon, 19 Aug 2019 08:08:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984F06E0CB
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 08:08:01 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c3so7677000wrd.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 01:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=chrD4UvdPdIWc9CvDmONrTcdqJ4NselHnptgvNCaYzk=;
 b=rbJErnnxB/IIdaKH1o0jppahTu1eZ23EgoB+PBsVAmStuAWoQ6KMEafDrpPg64fS5S
 +kTEpKeU3UOrFWKbwRI0/T0+oHxsnQd2rKLounyRbaSkTxnrGbzEj8ihdEwSQ7YfXvIc
 OWN8bdssAr3SueaGeYYvZKPyGUPrNtbiWKG+srLIzkYo89oS8ivdBONUoPeIswP6Xk9H
 /7Qynpott5dDL9EiMnQ5fP9lUBazNwGt4s6bW+lQATWHSEDIaFnw5P4FPjICqA9kZw/t
 4FVdV8xcZ79BQzMOxXsFxtylhzYNyTdknipihNDeHxqlkrAAN5Mjt5hRUbx8rVAyh2Vd
 6UYw==
X-Gm-Message-State: APjAAAWju68V+luIOcm/i4mp7PjTFDDxmnvGNrHiHrS7nooDi5bF0nuV
 zxgf8WyNNSZUvDVeiT2G/xgDgTqh
X-Google-Smtp-Source: APXvYqzlSpCUN4fWR+5yv0nULxsmQBUMoRwn/g/jiX9BsQZKwox+bJ7opR0ujTgiIQQt8ngeT1qZXQ==
X-Received: by 2002:a05:6000:cb:: with SMTP id
 q11mr24717920wrx.50.1566202080209; 
 Mon, 19 Aug 2019 01:08:00 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id q20sm46170700wrc.79.2019.08.19.01.07.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Aug 2019 01:07:59 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu/psp: move TMR to cpu invisible vram region
To: Tianci Yin <tianci.yin@amd.com>, amd-gfx@lists.freedesktop.org
References: <1566201945-18101-1-git-send-email-tianci.yin@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b1b7dd46-8ee5-deaf-1a24-ef152c96dcb6@gmail.com>
Date: Mon, 19 Aug 2019 10:07:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566201945-18101-1-git-send-email-tianci.yin@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=chrD4UvdPdIWc9CvDmONrTcdqJ4NselHnptgvNCaYzk=;
 b=SmXcejx0rN6jI1O6N6+7KFCyih9QRILwXfnNToHv8UA5YjnuTCutBguKPgpWP/aHK6
 7+E6gRWkg4PKx6rEn8/H3fTrItSaEWbwAtzTm5eJn4q1UptWswuyqwLuMULgZjvbOsYa
 b2KJEaRtHZt3beLOWfN+7BbjH+Xq+UXgLRdp/bZqr7qTi3uIxe+iz6FVcISJ+oEhinV1
 pmxLovTmxElZVnLG1A4b3gZsqitQYHkapxlKF/GhGo7xvBAR6gdOSiE6SRQTGqp2ZKt4
 hhkdLjkb6OP16TxP5lfM5lSLTG2Z6rxnDejIbeOWqTlRJ15xBQ1G6bnuah+B1Gp296yq
 kzEg==
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTkuMDguMTkgdW0gMTA6MDUgc2NocmllYiBUaWFuY2kgWWluOgo+IEZyb206ICJUaWFuY2ku
WWluIiA8dGlhbmNpLnlpbkBhbWQuY29tPgo+Cj4gc28gdGhhdCBtb3JlIHZpc2libGUgdnJhbSBj
YW4gYmUgYXZhaWxhYmxlIGZvciB1bWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaWFuY2kuWWluIDx0
aWFuY2kueWluQGFtZC5jb20+CgpBc3N1bWluZyB0aGF0IHlvdSBjaGVja2VkIHRoYXQgd2UgZG9u
J3QgaGF2ZSBvdGhlciB1c2VycyB3aG8gYXJlIHVzaW5nIAphbWRncHVfYm9fY3JlYXRlX2tlcm5l
bCgpIHdpdGhvdXQgYSBDUFUgcG9pbnRlciB0aGlzIHBhdGNoIGlzIApSZXZpZXdlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPi4KCj4gLS0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMgfCA1ICsrKy0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgICAgfCA0ICsrLS0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaCAgICB8IDEgLQo+ICAgMyBmaWxlcyBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4gaW5kZXggMTA1OTc3MS4uMDQ3Njc5MCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKPiBAQCAt
MjQ2LDggKzI0Niw5IEBAIGludCBhbWRncHVfYm9fY3JlYXRlX3Jlc2VydmVkKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LAo+ICAgCWJwLnNpemUgPSBzaXplOwo+ICAgCWJwLmJ5dGVfYWxpZ24g
PSBhbGlnbjsKPiAgIAlicC5kb21haW4gPSBkb21haW47Cj4gLQlicC5mbGFncyA9IEFNREdQVV9H
RU1fQ1JFQVRFX0NQVV9BQ0NFU1NfUkVRVUlSRUQgfAo+IC0JCUFNREdQVV9HRU1fQ1JFQVRFX1ZS
QU1fQ09OVElHVU9VUzsKPiArCWJwLmZsYWdzID0gY3B1X2FkZHIgPyBBTURHUFVfR0VNX0NSRUFU
RV9DUFVfQUNDRVNTX1JFUVVJUkVECj4gKwkJOiBBTURHUFVfR0VNX0NSRUFURV9OT19DUFVfQUND
RVNTOwo+ICsJYnAuZmxhZ3MgfD0gQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DT05USUdVT1VTOwo+
ICAgCWJwLnR5cGUgPSB0dG1fYm9fdHlwZV9rZXJuZWw7Cj4gICAJYnAucmVzdiA9IE5VTEw7Cj4g
ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCj4gaW5kZXggNzcxNWMw
ZC4uNWU3ZmJiZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMK
PiBAQCAtMjY0LDcgKzI2NCw3IEBAIHN0YXRpYyBpbnQgcHNwX3Rtcl9pbml0KHN0cnVjdCBwc3Bf
Y29udGV4dCAqcHNwKQo+ICAgCj4gICAJcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwocHNw
LT5hZGV2LCB0bXJfc2l6ZSwgUFNQX1RNUl9TSVpFLAo+ICAgCQkJCSAgICAgIEFNREdQVV9HRU1f
RE9NQUlOX1ZSQU0sCj4gLQkJCQkgICAgICAmcHNwLT50bXJfYm8sICZwc3AtPnRtcl9tY19hZGRy
LCAmcHNwLT50bXJfYnVmKTsKPiArCQkJCSAgICAgICZwc3AtPnRtcl9ibywgJnBzcC0+dG1yX21j
X2FkZHIsIE5VTEwpOwo+ICAgCj4gICAJcmV0dXJuIHJldDsKPiAgIH0KPiBAQCAtMTIxNSw3ICsx
MjE1LDcgQEAgc3RhdGljIGludCBwc3BfaHdfZmluaSh2b2lkICpoYW5kbGUpCj4gICAKPiAgIAlw
c3BfcmluZ19kZXN0cm95KHBzcCwgUFNQX1JJTkdfVFlQRV9fS00pOwo+ICAgCj4gLQlhbWRncHVf
Ym9fZnJlZV9rZXJuZWwoJnBzcC0+dG1yX2JvLCAmcHNwLT50bXJfbWNfYWRkciwgJnBzcC0+dG1y
X2J1Zik7Cj4gKwlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+dG1yX2JvLCAmcHNwLT50bXJf
bWNfYWRkciwgTlVMTCk7Cj4gICAJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZwc3AtPmZ3X3ByaV9i
bywKPiAgIAkJCSAgICAgICZwc3AtPmZ3X3ByaV9tY19hZGRyLCAmcHNwLT5md19wcmlfYnVmKTsK
PiAgIAlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+ZmVuY2VfYnVmX2JvLAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgKPiBpbmRleCAwMDI5ZmEyLi40OGIwNTdkIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaAo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaAo+IEBAIC0xNzIsNyAr
MTcyLDYgQEAgc3RydWN0IHBzcF9jb250ZXh0Cj4gICAJLyogdG1yIGJ1ZmZlciAqLwo+ICAgCXN0
cnVjdCBhbWRncHVfYm8JCSp0bXJfYm87Cj4gICAJdWludDY0X3QJCQl0bXJfbWNfYWRkcjsKPiAt
CXZvaWQJCQkJKnRtcl9idWY7Cj4gICAKPiAgIAkvKiBhc2QgZmlybXdhcmUgYW5kIGJ1ZmZlciAq
Lwo+ICAgCWNvbnN0IHN0cnVjdCBmaXJtd2FyZQkJKmFzZF9mdzsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
