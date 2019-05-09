Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C61218BAE
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 16:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242348941E;
	Thu,  9 May 2019 14:25:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05CE89458
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 14:25:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r7so2698981wrr.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 May 2019 07:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=sozIJXhHuonPC8B6d/7Y0My1PhRgq/WTLBlhFx4a2dE=;
 b=tbZUXGFD5LW4BKxbxFyuHvG/eZLDQhn6eyk2nngIel5w7fSExJI6g0nQVV9T1a03B+
 MfmjpzKPalXT9EG8X+XB5+w3P2ZhG+qjWV8UpXp+GgwajK9FBMt/dgJFMXlIn7DuQvek
 LJltWzYZxd5XwbEej0VNQ7QOGNZjgi8aruxsuFYc7bEj3UdLehuD9KIOUtMFUq30G2Pg
 vCcE33X4xRF9VLJzyvERI5KCOYTgaAfB6hNEv5TBPJ0HBT52Sxwv85Ow30no2FLL/pTW
 9bT3wqSyg7RW6J/Owgd3STxEsEDhu7XSUINuNLRFW47UPBbBjIXwd0JuDwfwbMaSesDC
 niiA==
X-Gm-Message-State: APjAAAUOpYg2cdQcV+0UF+e2iQFfxpmyXx8+ogb+mzwuc8IliJ42yriu
 xhhtNIAYJvSIo6o1pzBQpNg=
X-Google-Smtp-Source: APXvYqyFXcT0qu/KKVlAYL+b+TcUiK7gduaIc9oyLweubSLGV0cfCzNy3nt+nyLs/qV9pnxTxGULpg==
X-Received: by 2002:adf:e404:: with SMTP id g4mr3335783wrm.161.1557411933545; 
 Thu, 09 May 2019 07:25:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c20sm3665731wre.28.2019.05.09.07.25.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 07:25:31 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu/psp: move psp version specific function
 pointers to early_init
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20190509142334.24760-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <054e9ddd-c373-8908-ba8f-cced87b61813@gmail.com>
Date: Thu, 9 May 2019 16:25:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509142334.24760-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=sozIJXhHuonPC8B6d/7Y0My1PhRgq/WTLBlhFx4a2dE=;
 b=HS7FpGmZ4cAY+bnJQcCzfSIPboViUyjT7CcAfn8/JrA4k3m6eo9U0KzMeaNsFKn7Pw
 AZl2eIoWtjVAmxJz4Ze+nx7chI7lTKOcDWuvgCTmxUuSuXl6PYkru/ocqoI1lpPoF1IG
 VfE26WXqoPho1FilsGF0g+gmCTb9jtyFiNZoEpGqF+gRr52JTWQVHCTAfiCWefNBYJMo
 pEgHPXUNph0HsO1PAtKlQIS618WQ7dtH2c4yWmTwKg94e3NzJMyC6TFlqdtERmy5zqFQ
 gR98IfH49eWToYrLi+L0DOED//AxJJaFH3TMt3U8SlMVkavnFCUMS1YCdauxYrl+mky4
 borg==
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

QW0gMDkuMDUuMTkgdW0gMTY6MjMgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gSW4gY2FzZSB3ZSBu
ZWVkIHRvIHVzZSB0aGVtIGZvciBHUFUgcmVzZXQgcHJpb3IgaW5pdGlhbGl6aW5nIHRoZQo+IGFz
aWMuICBGaXhlcyBhIGNyYXNoIGlmIHRoZSBkcml2ZXIgYXR0ZW1wdHMgdG8gcmVzZXQgdGhlIEdQ
VSBhdCBkcml2ZXIKPiBsb2FkIHRpbWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wc3AuYyB8IDE5ICsrKysrKysrKystLS0tLS0tLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwo+IGluZGV4IDkwNWNjZTE4MTRmMy4uMDU4OTdiMDU3
NjZiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3Au
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwo+IEBAIC0z
OCwxOCArMzgsMTAgQEAgc3RhdGljIHZvaWQgcHNwX3NldF9mdW5jcyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldik7Cj4gICBzdGF0aWMgaW50IHBzcF9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkK
PiAgIHsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqKWhhbmRsZTsKPiArCXN0cnVjdCBwc3BfY29udGV4dCAqcHNwID0gJmFkZXYtPnBzcDsK
PiAgIAo+ICAgCXBzcF9zZXRfZnVuY3MoYWRldik7Cj4gICAKPiAtCXJldHVybiAwOwo+IC19Cj4g
LQo+IC1zdGF0aWMgaW50IHBzcF9zd19pbml0KHZvaWQgKmhhbmRsZSkKPiAtewo+IC0Jc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7Cj4g
LQlzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCA9ICZhZGV2LT5wc3A7Cj4gLQlpbnQgcmV0Owo+IC0K
PiAgIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewo+ICAgCWNhc2UgQ0hJUF9WRUdBMTA6Cj4g
ICAJY2FzZSBDSElQX1ZFR0ExMjoKPiBAQCAtNjcsNiArNTksMTUgQEAgc3RhdGljIGludCBwc3Bf
c3dfaW5pdCh2b2lkICpoYW5kbGUpCj4gICAKPiAgIAlwc3AtPmFkZXYgPSBhZGV2Owo+ICAgCj4g
KwlyZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIGludCBwc3Bfc3dfaW5pdCh2b2lkICpoYW5k
bGUpCj4gK3sKPiArCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICopaGFuZGxlOwo+ICsJc3RydWN0IHBzcF9jb250ZXh0ICpwc3AgPSAmYWRldi0+cHNw
Owo+ICsJaW50IHJldDsKPiArCj4gICAJcmV0ID0gcHNwX2luaXRfbWljcm9jb2RlKHBzcCk7Cj4g
ICAJaWYgKHJldCkgewo+ICAgCQlEUk1fRVJST1IoIkZhaWxlZCB0byBsb2FkIHBzcCBmaXJtd2Fy
ZSFcbiIpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
