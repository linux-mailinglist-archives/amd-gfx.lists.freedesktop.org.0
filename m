Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1404F2B380
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 13:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A42894EA;
	Mon, 27 May 2019 11:51:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD25898F0
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 11:51:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c2so1441542wrm.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 04:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=osW0sKIKakUGJAaLDwEmJhycRW6gsgtiUkP2GF+KgLE=;
 b=csVqGE2+UB/h8p6tTGNz0+pwI2v0jW3DMt+tv/jI8O4P16ZEDBbh4peUN3TX2OzMcs
 RRiXNBXhnozvblp7HOUa95fLgAe+OIJCvW2H4a0/npSW6IVX8jej+7ivSFXVlOMuTtza
 CfHs/fWjK0PCHPRascpVz4eJa90qSaweqGu9UyJhXOnZrhM7pLN2hIasL5b1ov69vcWv
 MJUrQ+aYdi+ShUc3vjPPhZ2zDzk+Rn8jcoXB3Vd9PH0nvTP7vuwbiUbWLJPOvKJO47m8
 Qkd/Sl/ddJZW8OC/7gEWp34CKLziHVY6U7YJcFDpmS46A5pdwRHUu5Fa19UvIYbSBMQv
 8OUQ==
X-Gm-Message-State: APjAAAVTBq+hCZoSm9UoPgsIX0JsRfIuySqrOpYKfYH3Nc/CdKDse+yq
 Vx+UI46IIU8F4EtNbPYOw1WNvfD3
X-Google-Smtp-Source: APXvYqx60IW5P++HcO/zkL2roE2lSR+xOKLb6UwREwZXFCjdhQGDmGR0Y7alIOYT/F/3t0/KwNb0Pw==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr8732073wrw.0.1558957862614;
 Mon, 27 May 2019 04:51:02 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a139sm14335356wmd.18.2019.05.27.04.51.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 04:51:01 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: enable PCIE atomics ops support
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1558952326-5611-1-git-send-email-Jack.Xiao@amd.com>
 <BYAPR12MB26323A2A4408EB2EBB1A1448FC1D0@BYAPR12MB2632.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <dc7f3fa5-2b67-0b05-e3f0-46f3733a430a@gmail.com>
Date: Mon, 27 May 2019 13:51:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB26323A2A4408EB2EBB1A1448FC1D0@BYAPR12MB2632.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=osW0sKIKakUGJAaLDwEmJhycRW6gsgtiUkP2GF+KgLE=;
 b=TI1dYucArUNb7Hcj9fyLq0sTshZmwQnnBdPBYHTIIYVfP5OyE5qo0CpjmyQ9q9OFxw
 i6rCBVbyXH3AFE9PJ5JwOrd0GpUyErcWSYCrOKSYrhkhQ7Rc+jclU/4KJT2tHKHz4V8B
 yjnPNpEzYimwotHGzDaKIv7QPYXwnU5prqwYmIzWRY4l4/Hvr+5ujrGjnABLfjtIH3lT
 HgyaSjXtGHXUdPwuzJRvG5rr/jM5Yt/j5vMoic4RuHPV5Z25IcO0PU2RxFLXVWn8l6MP
 HZtcCuivUC2LAbBH4inI8i/5/W6A9o6oV172r/9e904ti1M0R8UPAY6k2uFV6bxo3CVX
 Ulwg==
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhdCBpZGVhIHNvdW5kcyBzYW5lIHRvIG1lIGFzIHdlbGwuCgpCeSB0aGUgd2F5LCBkbyB3ZSBz
b21ld2hlcmUgc2lnbmFsIHRvIHVzZXJzcGFjZSBpZiBhdG9taWNzIGFyZSBzdXBwb3J0ZWQgCm9y
IG5vdD8KCkkgbWVhbiB3b3VsZCBiZSBuaWNlIHRvIGtlZXAgdGhlIHN0YXRlIGluc2lkZSBhZGV2
IGlmIHRoaXMgZmFpbHMgZm9yIApzb21lIHJlYXNvbi4KCkNocmlzdGlhbi4KCkFtIDI3LjA1LjE5
IHVtIDEzOjE2IHNjaHJpZWIgWmhhbmcsIEhhd2tpbmc6Cj4gSG93IGFib3V0IHB1dCBwY2lfZW5h
YmxlX2F0b21pY19vcHNfdG9fcm9vdCBhaGVhZCBvZiBhbWRncHVfZGV2aWNlX2lwX2Vhcmx5X2lu
aXQsIHdoaWxlIG1vdmUgcGNpX2F0b21pY19yZXF1ZXN0ZWQgZnJvbSBrZmQgZGV2aWNlIHRvIGtn
ZCBkZXZpY2UgPyBJbiBzdWNoIHdheSwgd2UgY2FuIGF2b2lkIGR1cGxpY2F0ZSBhdG9taWMgcmVx
dWVzdCBmcm9tIGJvdGggYW1kZ3B1IGFuZCBhbWRrZmQuCj4KPiBSZWdhcmRzLAo+IEhhd2tpbmcK
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91
bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBYaWFvLCBKYWNrCj4gU2Vu
dDogMjAxOeW5tDXmnIgyN+aXpSAxODoxOQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IENjOiBYaWFvLCBKYWNrIDxKYWNrLlhpYW9AYW1kLmNvbT4KPiBTdWJqZWN0OiBbUEFU
Q0hdIGRybS9hbWRncHU6IGVuYWJsZSBQQ0lFIGF0b21pY3Mgb3BzIHN1cHBvcnQKPgo+IEdQVSBh
dG9taWNzIG9wZXJhdGlvbiBkZXBlbmRzIG9uIFBDSUUgYXRvbWljcyBzdXBwb3J0Lgo+IEFsd2F5
cyBlbmFibGUgUENJRSBhdG9taWNzIG9wcyBzdXBwb3J0IGluIGNhc2UgdGhhdCBpdCBoYXNuJ3Qg
YmVlbiBlbmFibGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1k
LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YyB8IDcgKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IGluZGV4IGJkZDFmZTcz
Li5hMmM2MDY0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYwo+IEBAIC0yNTYyLDYgKzI1NjIsMTMgQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgIAlpZiAoYWRldi0+cmlvX21lbSA9PSBOVUxMKQo+
ICAgCQlEUk1fSU5GTygiUENJIEkvTyBCQVIgaXMgbm90IGZvdW5kLlxuIik7Cj4gICAKPiArCS8q
IGVuYWJsZSBQQ0lFIGF0b21pYyBvcHMgKi8KPiArCXIgPSBwY2lfZW5hYmxlX2F0b21pY19vcHNf
dG9fcm9vdChhZGV2LT5wZGV2LAo+ICsJCQkJUENJX0VYUF9ERVZDQVAyX0FUT01JQ19DT01QMzIg
fAo+ICsJCQkJUENJX0VYUF9ERVZDQVAyX0FUT01JQ19DT01QNjQpOwo+ICsJaWYgKHIpCj4gKwkJ
RFJNX0lORk8oIlBDSUUgYXRvbWljIG9wcyBpcyBub3Qgc3VwcG9ydGVkXG4iKTsKPiArCj4gICAJ
YW1kZ3B1X2RldmljZV9nZXRfcGNpZV9pbmZvKGFkZXYpOwo+ICAgCj4gICAJLyogZWFybHkgaW5p
dCBmdW5jdGlvbnMgKi8KPiAtLQo+IDEuOS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
