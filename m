Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFE7B412F
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 21:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822FB6EA5C;
	Mon, 16 Sep 2019 19:36:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEE06EA5C
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 19:36:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y19so682960wrd.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 12:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jsFeyVrVx2eSReNYKaj7Fb1+MbVifsJcBiNOETUjYcw=;
 b=Az/XmF7NmImXOMZvei2pZr9Fpyj1Nbqs+Wpxa4LOUBM8qpg6A7rHGxHAvywRsOjqcA
 C0bCMcbfUZ2l97uFtInkki+ElCfG13pvK/kXA/oUuQY+aiF0grjMpwoFkyfLx5ZH26V3
 PmWoCl3k98N1l4GeBhDA8VsogpZsux4KiVM9hRBBMoYLdoOxHzcg5y3KQcKW/Ja97Fjd
 RQ+93BGem22gJ6XfiHLQMofR2ESQgKJz6I5dpsRkEnKVqxwRLll4Q+v+UJ6l2xDVW/KI
 e7yn0fxmAtWP/mPmQUxVGxS70shgkOVP3soH/SpEArMwe4Rj47HEc0Okl71MBfapd69f
 9lMQ==
X-Gm-Message-State: APjAAAUEHh8G0Wy4YM4/UeszdKc4//AKdawTEiXGaaHDwNkZLsMU7a/y
 gIp0mtfwvk1Pmk6v+WC/AjMzGLk5
X-Google-Smtp-Source: APXvYqx8W8KXunn8INrCxl7DDJPUxh7xy3BjWM8aFYxSO7Eb45lS17o4MyEOkl8SlBQdbTwh3KL4OA==
X-Received: by 2002:adf:9c81:: with SMTP id d1mr7508wre.123.1568662595184;
 Mon, 16 Sep 2019 12:36:35 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e30sm73752157wra.48.2019.09.16.12.36.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 12:36:34 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Fix regression crash on boot.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <1568662536-12356-1-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <93511a0c-c706-f318-0c27-e6647d9e7a26@gmail.com>
Date: Mon, 16 Sep 2019 21:36:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568662536-12356-1-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jsFeyVrVx2eSReNYKaj7Fb1+MbVifsJcBiNOETUjYcw=;
 b=NuLVwsc4Um7LTnb60E5/TmT2DjMphVQigT+K/jBuxwkwNzZzHK7oOVXWqCHsHiBwx4
 DsaLGb/GM5ZlPq5VEZfa/GCLCojKlOF+ZXXXHuLYMR1z0mXc/wTgkPTZJ9DfCihQZT9D
 ma2ytHWQsYZSiK7U9MJJdjkuYSSFNLzGA2cFDRBVBCvCdemkIl00fAJmPaHbjugNIpSK
 MvbMaFmXPcakk3rcVMDU2lLFBCT7FW3Akdda2V7clf+YDpHWSDb0LCJ7W79TwsGZrh6b
 fsiTHpzt7vIlvnzWbLUnttIBn1kCXRMqmZXTmlbaMNlpnOaGfDDVpM2GRQVu0LkubqOX
 0VoQ==
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

QW0gMTYuMDkuMTkgdW0gMjE6MzUgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBSZWdyZXNz
aW9uIG9uIFZlZ2EyMCBjYXVzZWQgYnkgMGQ5YTgwMjEzODI5ZTA5MmMxYTg1MTY2YjY2MGViZjJj
N2FmNTczZS4KPiBOb3Qgc2V0dGluZyBCTyBwdHIgdG8gbnVsbCB3aWxsIGNvbmZ1c2UgYW1kZ3B1
X2JvX2NyZWF0ZV9yZXNlcnZlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5
IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmMKPiBpbmRleCA1MWQ2NGE2Li4xZGZiMWJlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+IEBAIC0xMzg3LDcgKzEzODcsNyBAQCBpbnQgYW1kZ3B1
X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIAlz
dHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0gYW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2KTsKPiAg
IAlzdHJ1Y3QgcmFzX2Vycl9oYW5kbGVyX2RhdGEgKmRhdGE7Cj4gICAJdWludDY0X3QgYnA7Cj4g
LQlzdHJ1Y3QgYW1kZ3B1X2JvICpibzsKPiArCXN0cnVjdCBhbWRncHVfYm8gKmJvID0gTlVMTDsK
PiAgIAlpbnQgaSwgcmV0ID0gMDsKPiAgIAo+ICAgCWlmICghY29uIHx8ICFjb24tPmVoX2RhdGEp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
