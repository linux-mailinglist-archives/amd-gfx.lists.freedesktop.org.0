Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D106CE000B
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 10:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7434C6E488;
	Tue, 22 Oct 2019 08:54:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C8B6E488
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 08:54:21 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a11so985123wra.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 01:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FcILrnueaLiXh17bBhJu32cMPfnYAAdtegZ8J665vFM=;
 b=jOevtU0KtUns7dnKgS+cLq794mirl6zLNhm2tLenql9xSul5lMzXlx8DYER/omQ/FW
 Bnu8rLFoKkzGDuyrnGFF4KcflUn2H0KMY2I9sxE7p2DHrXt2mv2HpRrCw0LCJSz/9kGF
 YybN8+UegHF56qVGWzDzIa5wTcVQH87QoTnkVZuMSlRXCCDKfRu/SlU4GKVgvMxq6V9V
 H+iRC+RItarXbb60WT0ORahelNUwVIkZp3uojV/N2MmOQpW+VIteJkBZlICiNAMnM6St
 OlvP4c5XY2zehNKDy0esD6VH8t5T1uU2Wu4ct7XUFTNHZ6/0hvnuPg/vH4yU2KDaYSRq
 v4Hw==
X-Gm-Message-State: APjAAAWG0THQjuK9lOWPHoZXggLu7Z6S7/iv8rVeJb2uYJHcvGaNEoA2
 vi/NTGtNWrZBxZYUgB5v4qo=
X-Google-Smtp-Source: APXvYqw9jOcIYlSahwEMEYa38tNjcch4PtIpBSlNNO/Qv3FCsc78QpyrJe894X/7i2gy9Nz2LaZs3Q==
X-Received: by 2002:adf:e747:: with SMTP id c7mr2415599wrn.384.1571734460021; 
 Tue, 22 Oct 2019 01:54:20 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e12sm13730049wrs.49.2019.10.22.01.54.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Oct 2019 01:54:19 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: define macros for retire page reservation
To: "Chen, Guchun" <Guchun.Chen@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "Zhou1, Tao" <Tao.Zhou1@amd.com>
References: <20191022034256.30266-1-guchun.chen@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <09fabd4b-8dec-41cc-916c-ee64bad020b1@gmail.com>
Date: Tue, 22 Oct 2019 10:54:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191022034256.30266-1-guchun.chen@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=FcILrnueaLiXh17bBhJu32cMPfnYAAdtegZ8J665vFM=;
 b=hdjQCjfmL5bzkb7i2REkNwi2fZ5D8+hRBSwhdQ7vp/5PwdRag9pZqLLXP6VaYvvtjt
 idzMCycWlijHwPB1wvXkSLN8g9ThAfwOqB1oCeDJIhxNpLaXaxhL9uejkXqef4P+wU+2
 my2gEdptxfE7XlEt5gbh5v4FlLcuotx/KWYzkZlpL7MStWC32JGnh+MMwWlR5oLJ+zxC
 MD6AIpwnan8mtN+BBmRiMcb0gRIPIkkBEcFFYzcu3egdELcEq7onX4kD1nJo4qjN3+CS
 C2+fy9EExPOw01Mjjpp0iHMOerwoWfWLIP/SYH0uKZd8mfpfx5owv/U+u6z3wxnrcoTs
 RDRg==
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

QW0gMjIuMTAuMTkgdW0gMDU6NDMgc2NocmllYiBDaGVuLCBHdWNodW46Cj4gRWFzeSBmb3IgbWFp
bnRhaW5hbmNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFt
ZC5jb20+CgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8
IDE3ICsrKysrKysrKysrLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMKPiBpbmRleCAyZDllMTNkMmE3MWEuLjc5NjMyNmIzNmUwMCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiBAQCAtNjgsNiArNjgsMTEgQEAgY29uc3QgY2hh
ciAqcmFzX2Jsb2NrX3N0cmluZ1tdID0gewo+ICAgLyogaW5qZWN0IGFkZHJlc3MgaXMgNTIgYml0
cyAqLwo+ICAgI2RlZmluZQlSQVNfVU1DX0lOSkVDVF9BRERSX0xJTUlUCSgweDFVTEwgPDwgNTIp
Cj4gICAKPiArZW51bSBhbWRncHVfcmFzX3JldGlyZV9wYWdlX3Jlc2VydmF0aW9uIHsKPiArCUFN
REdQVV9SQVNfUkVUSVJFX1BBR0VfUkVTRVJWRUQsCj4gKwlBTURHUFVfUkFTX1JFVElSRV9QQUdF
X1BFTkRJTkcsCj4gKwlBTURHUFVfUkFTX1JFVElSRV9QQUdFX0ZBVUxULAo+ICt9Owo+ICAgCj4g
ICBhdG9taWNfdCBhbWRncHVfcmFzX2luX2ludHIgPSBBVE9NSUNfSU5JVCgwKTsKPiAgIAo+IEBA
IC04MDksMTEgKzgxNCwxMSBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfYmFkcGFnZXNfcmVhZChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgIHN0YXRpYyBjaGFyICphbWRncHVfcmFzX2Jh
ZHBhZ2VfZmxhZ3Nfc3RyKHVuc2lnbmVkIGludCBmbGFncykKPiAgIHsKPiAgIAlzd2l0Y2ggKGZs
YWdzKSB7Cj4gLQljYXNlIDA6Cj4gKwljYXNlIEFNREdQVV9SQVNfUkVUSVJFX1BBR0VfUkVTRVJW
RUQ6Cj4gICAJCXJldHVybiAiUiI7Cj4gLQljYXNlIDE6Cj4gKwljYXNlIEFNREdQVV9SQVNfUkVU
SVJFX1BBR0VfUEVORElORzoKPiAgIAkJcmV0dXJuICJQIjsKPiAtCWNhc2UgMjoKPiArCWNhc2Ug
QU1ER1BVX1JBU19SRVRJUkVfUEFHRV9GQVVMVDoKPiAgIAlkZWZhdWx0Ogo+ICAgCQlyZXR1cm4g
IkYiOwo+ICAgCX07Cj4gQEAgLTEyOTQsMTMgKzEyOTksMTMgQEAgc3RhdGljIGludCBhbWRncHVf
cmFzX2JhZHBhZ2VzX3JlYWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAJCSgqYnBz
KVtpXSA9IChzdHJ1Y3QgcmFzX2JhZHBhZ2Upewo+ICAgCQkJLmJwID0gZGF0YS0+YnBzW2ldLnJl
dGlyZWRfcGFnZSwKPiAgIAkJCS5zaXplID0gQU1ER1BVX0dQVV9QQUdFX1NJWkUsCj4gLQkJCS5m
bGFncyA9IDAsCj4gKwkJCS5mbGFncyA9IEFNREdQVV9SQVNfUkVUSVJFX1BBR0VfUkVTRVJWRUQs
Cj4gICAJCX07Cj4gICAKPiAgIAkJaWYgKGRhdGEtPmxhc3RfcmVzZXJ2ZWQgPD0gaSkKPiAtCQkJ
KCpicHMpW2ldLmZsYWdzID0gMTsKPiArCQkJKCpicHMpW2ldLmZsYWdzID0gQU1ER1BVX1JBU19S
RVRJUkVfUEFHRV9QRU5ESU5HOwo+ICAgCQllbHNlIGlmIChkYXRhLT5icHNfYm9baV0gPT0gTlVM
TCkKPiAtCQkJKCpicHMpW2ldLmZsYWdzID0gMjsKPiArCQkJKCpicHMpW2ldLmZsYWdzID0gQU1E
R1BVX1JBU19SRVRJUkVfUEFHRV9GQVVMVDsKPiAgIAl9Cj4gICAKPiAgIAkqY291bnQgPSBkYXRh
LT5jb3VudDsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
