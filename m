Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EEE20030
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 09:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53097891A8;
	Thu, 16 May 2019 07:24:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2AF891A8
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 07:24:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id n25so1927247wmk.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 00:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=dnCwx5iY9WR5hOKSCPspAcZfRKfIi6x9lB9gzPV25Dw=;
 b=JgNwv2gMyijA+adOhY6SZdOTpgeM9yiJoPpLI4mabmZNJE2z5KupVmttoh+jQlF/eH
 bTMAzi3TMK86Nz5zAYOLY+HV8/9sIpm4JsdzRNgdlYWtx+f+zaJuIZtrFkn08GiG4ycA
 V2QtHWWIwIXmhDZcQnVdClgdHvvdL1xE40+JjQ66x9p2+KiNkaGImChTPGJ5P8n3CTVj
 fly1b2EnHwrphwasJ4RQBAzBl747l8EN380htdMHtyG+lEfBwyqXyBcSfJup+f6iSmak
 i7RQqSeFFKdqQ9Frwi3v2SG5M7rkIzUZwqLBIzUcJ92pjCpqzbvJhQYrrGM4VDqPURN/
 Me+g==
X-Gm-Message-State: APjAAAUmR7ijLovsG4Eo1MO1H4ZVNf38Bobr08m+2xD7ERGM8pvDCG3E
 UN+dV7kFxdDk1OQfLWvvkyQ=
X-Google-Smtp-Source: APXvYqziymDtMMv6LK4/XN9DIyrD0LJ/IX7rUmqy3qk6XK+ZC7qLwiSG5aUp6CqKQASSwh5o7hNAHw==
X-Received: by 2002:a1c:bb84:: with SMTP id l126mr14930047wmf.92.1557991486911; 
 Thu, 16 May 2019 00:24:46 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b194sm3613435wmb.23.2019.05.16.00.24.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 00:24:46 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: skip fw pri bo alloc for SRIOV
To: Yintian Tao <yttao@amd.com>, amd-gfx@lists.freedesktop.org
References: <1557983492-25237-1-git-send-email-yttao@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3b9d9e94-35f9-dd5c-ec27-19705a3f8172@gmail.com>
Date: Thu, 16 May 2019 09:24:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557983492-25237-1-git-send-email-yttao@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dnCwx5iY9WR5hOKSCPspAcZfRKfIi6x9lB9gzPV25Dw=;
 b=DjAY5H0hAf69k4ssK93V9gTCx2nIXLKS5gCi34VS4acbKuM8Go9hGwoe3Lp25+3gUv
 mK3CiZTcQvOfM1AINn2mF1SZy7iqhfnVt3P1FDRTYoEb0iNuQ9eytL06zzwQ8efSWZT2
 XygsPpgU0lIv4jjj3v8X3IgwcyPKvqLwKukm9tDYsWqfF6CHl/YzAxT4MzfTaLCew2XQ
 WswQpRg6OgmXbTc+gWHOODwvuWXlwAPnvAzFy8votSeUUnOQTgdfNXl2canJwY2/bVAY
 vjdzXU0Kfy2cU48oB1GNY/0s/jtOsMtKf621mTqxky2SXn7Kq/PUcrgLOrFOe13MX9nH
 2tTQ==
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
Cc: Monk Liu <Monk.Liu@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTYuMDUuMTkgdW0gMDc6MTEgc2NocmllYiBZaW50aWFuIFRhbzoKPiBQU1AgZncgcHJpbWFy
eSBidWZmZXIgaXMgbm90IHVzZWQgdW5kZXIgU1JJT1YKPiBUaGVyZWZvcmUsIHdlIGRvbid0IG5l
ZWQgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFlpbnRpYW4g
VGFvIDx5dHRhb0BhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25rLkxpdUBh
bWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5j
IHwgMjIgKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BzcC5jCj4gaW5kZXggYzU2N2E1NS4uZDNjNzdkMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKPiBAQCAtOTA1LDEzICs5MDUsMTYgQEAgc3RhdGljIGlu
dCBwc3BfbG9hZF9mdyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIAlpZiAoIXBzcC0+
Y21kKQo+ICAgCQlyZXR1cm4gLUVOT01FTTsKPiAgIAo+IC0JcmV0ID0gYW1kZ3B1X2JvX2NyZWF0
ZV9rZXJuZWwoYWRldiwgUFNQXzFfTUVHLCBQU1BfMV9NRUcsCj4gLQkJCQkJQU1ER1BVX0dFTV9E
T01BSU5fR1RULAo+IC0JCQkJCSZwc3AtPmZ3X3ByaV9ibywKPiAtCQkJCQkmcHNwLT5md19wcmlf
bWNfYWRkciwKPiAtCQkJCQkmcHNwLT5md19wcmlfYnVmKTsKPiAtCWlmIChyZXQpCj4gLQkJZ290
byBmYWlsZWQ7Cj4gKwkvKiB0aGlzIGZ3IHByaSBibyBpcyBub3QgdXNlZCB1bmRlciBTUklPViAq
Lwo+ICsJaWYgKCFhbWRncHVfc3Jpb3ZfdmYocHNwLT5hZGV2KSkgewo+ICsJCXJldCA9IGFtZGdw
dV9ib19jcmVhdGVfa2VybmVsKGFkZXYsIFBTUF8xX01FRywgUFNQXzFfTUVHLAo+ICsJCQkJCSAg
ICAgIEFNREdQVV9HRU1fRE9NQUlOX0dUVCwKPiArCQkJCQkgICAgICAmcHNwLT5md19wcmlfYm8s
Cj4gKwkJCQkJICAgICAgJnBzcC0+ZndfcHJpX21jX2FkZHIsCj4gKwkJCQkJICAgICAgJnBzcC0+
ZndfcHJpX2J1Zik7Cj4gKwkJaWYgKHJldCkKPiArCQkJZ290byBmYWlsZWQ7Cj4gKwl9Cj4gICAK
PiAgIAlyZXQgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChhZGV2LCBQU1BfRkVOQ0VfQlVGRkVS
X1NJWkUsIFBBR0VfU0laRSwKPiAgIAkJCQkJQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKPiBAQCAt
MTAxMiw4ICsxMDE1LDkgQEAgc3RhdGljIGludCBwc3BfaHdfZmluaSh2b2lkICpoYW5kbGUpCj4g
ICAJcHNwX3JpbmdfZGVzdHJveShwc3AsIFBTUF9SSU5HX1RZUEVfX0tNKTsKPiAgIAo+ICAgCWFt
ZGdwdV9ib19mcmVlX2tlcm5lbCgmcHNwLT50bXJfYm8sICZwc3AtPnRtcl9tY19hZGRyLCAmcHNw
LT50bXJfYnVmKTsKPiAtCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmcHNwLT5md19wcmlfYm8sCj4g
LQkJCSAgICAgICZwc3AtPmZ3X3ByaV9tY19hZGRyLCAmcHNwLT5md19wcmlfYnVmKTsKPiArCWlm
ICghYW1kZ3B1X3NyaW92X3ZmKHBzcC0+YWRldikpCj4gKwkJYW1kZ3B1X2JvX2ZyZWVfa2VybmVs
KCZwc3AtPmZ3X3ByaV9ibywKPiArCQkJCSAgICAgICZwc3AtPmZ3X3ByaV9tY19hZGRyLCAmcHNw
LT5md19wcmlfYnVmKTsKClRoaXMgaXMgc3VwZXJmbHVvdXMsIGFtZGdwdV9ib19mcmVlX2tlcm5l
bCgpIGRvZXMgYSBOVUxMIGNoZWNrIGFueXdheS4KCkFwYXJ0IGZyb20gdGhhdCBsb29rcyBnb29k
IHRvIG1lLApDaHJpc3RpYW4uCgo+ICAgCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmcHNwLT5mZW5j
ZV9idWZfYm8sCj4gICAJCQkgICAgICAmcHNwLT5mZW5jZV9idWZfbWNfYWRkciwgJnBzcC0+ZmVu
Y2VfYnVmKTsKPiAgIAlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+YXNkX3NoYXJlZF9ibywg
JnBzcC0+YXNkX3NoYXJlZF9tY19hZGRyLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
