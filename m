Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71092B48F6
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 10:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B386EB47;
	Tue, 17 Sep 2019 08:14:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7386EB47
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 08:14:14 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 5so2155238wmg.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 01:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8FCCmDWEXOGghZ4Ek7jNRHQXxLFFW8ygEmBZ0/iQjnc=;
 b=GuAzQVeaTuwGYKf/JzMokWp1fAI+gRBKgVP9v+2vsyk91GduKvS2Tl3+il/i9IEeuf
 n3cW5rZxCYM7vdG9kuRA8OJShb2BX5PwcmYmJ/11EPBMcwWKsmf2o3WFQ5Qfi9hhTFW8
 OaqZd52Pb4jQAWQpe2U8N8DLkg2HM9XlyqfqY+IAxxCNgMeTn4/i26rZ3sMBt2oyhilm
 BJplcCRd92qDni3g532YYP7EjJi4csA3YByIlm8pul4+u+w/MTTf3csqZ+BMGbTr+0dG
 cAETWey8va+sHwm9lWM6nMf9r1Q5gV6OWpysyZPw7NUxWdpYo96nnSrYVJSFqkn3dF4O
 cIIQ==
X-Gm-Message-State: APjAAAX4yj4/ZklbqKZNhoqE0Dz78c3W3MUQKZP2qdFcceWMQNIwnwOP
 MPlBKtIwhcKvlyl6Y8RDuDGZbHSB
X-Google-Smtp-Source: APXvYqxxN3F6vkaaYdk87iwGjtkAAo4wKQ9Adf24fLsgXoxZLdW1IXH7aFh0g3rTvnD5QuAW93tHxQ==
X-Received: by 2002:a7b:c949:: with SMTP id i9mr2181866wml.136.1568708053518; 
 Tue, 17 Sep 2019 01:14:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id h7sm1405097wrt.17.2019.09.17.01.14.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 01:14:12 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: use GPU PAGE SHIFT for umc retired page
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Chen, Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20190917062213.29480-1-tao.zhou1@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <37a36b18-2bfd-c737-29c5-2b146021f128@gmail.com>
Date: Tue, 17 Sep 2019 10:14:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917062213.29480-1-tao.zhou1@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8FCCmDWEXOGghZ4Ek7jNRHQXxLFFW8ygEmBZ0/iQjnc=;
 b=Bm9LvEycdK0KByBz+LusEHy0fecfjMN8c18u1L0xgS0yb3iJ/PNXMhZgoIEsLlfiEx
 yx5JtVXE2krJbzVVIcvwvEeXlakKbJ0qjwOaAgZ1pxkOYAvU23Sg4VKKKmSbGmP3XM3X
 03AxP2GjuRfgT/sb6dct7V1b70y5Nx18Qcw1OfCp9JnkV9PteswcwWUmpbs3ZILBVLL1
 ILCGhoeEUpPrFWao9o0Yif+s3zvxrOdnKuPOHTqRHUVuUHTRt9gGpSJYYDhQd5sEOo7T
 04e2RcFZmCM8AHNZCxlS8DFO8juUOdZ4UhnW03dkLxIP3qAuPmLePYS9ZpEWIxkFOCEO
 vl5g==
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

QW0gMTcuMDkuMTkgdW0gMDg6MjIgc2NocmllYiBaaG91MSwgVGFvOgo+IHVtYyByZXRpcmVkIHBh
Z2UgYmVsb25ncyB0byB2cmFtIGFuZCBpdCBzaG91bGQgYmUgYWxpZ25lZCB0byBncHUgcGFnZQo+
IHNpemUKPgo+IFNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4KClJl
dmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+
IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYyB8IDIgKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jCj4gaW5kZXggMWMwZGEzMmMxNTYxLi40N2M0Yjk2
YjE0ZDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMKPiBAQCAtMjEz
LDcgKzIxMyw3IEBAIHN0YXRpYyB2b2lkIHVtY192Nl8xX3F1ZXJ5X2Vycm9yX2FkZHJlc3Moc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAJCQkJPT0gMSkgewo+ICAgCQkJZXJyX3JlYy0+
YWRkcmVzcyA9IGVycl9hZGRyOwo+ICAgCQkJLyogcGFnZSBmcmFtZSBhZGRyZXNzIGlzIHNhdmVk
ICovCj4gLQkJCWVycl9yZWMtPnJldGlyZWRfcGFnZSA9IHJldGlyZWRfcGFnZSA+PiBQQUdFX1NI
SUZUOwo+ICsJCQllcnJfcmVjLT5yZXRpcmVkX3BhZ2UgPSByZXRpcmVkX3BhZ2UgPj4gQU1ER1BV
X0dQVV9QQUdFX1NISUZUOwo+ICAgCQkJZXJyX3JlYy0+dHMgPSAodWludDY0X3Qpa3RpbWVfZ2V0
X3JlYWxfc2Vjb25kcygpOwo+ICAgCQkJZXJyX3JlYy0+ZXJyX3R5cGUgPSBBTURHUFVfUkFTX0VF
UFJPTV9FUlJfTk9OX1JFQ09WRVJBQkxFOwo+ICAgCQkJZXJyX3JlYy0+Y3UgPSAwOwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
