Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB2EF4477
	for <lists+amd-gfx@lfdr.de>; Fri,  8 Nov 2019 11:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E106F922;
	Fri,  8 Nov 2019 10:27:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082C96F922
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 Nov 2019 10:27:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b3so6358298wrs.13
 for <amd-gfx@lists.freedesktop.org>; Fri, 08 Nov 2019 02:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MG3wAD9fsnsuTQ9gphqPXHl6mvaT+/zddbv0e1QRETw=;
 b=Bd+xSVO4r2ZPO17yBftitKSmXxP+mttU3NwZ3jfBcWgy1CK1jV5NIdVcrZwrDzIKnF
 AV6ke40iAtDET2qzeKqskgcIpY8NfmPOTWGPSBl9TzhrAxvQ7bjGPsNbFZO9YDauKeWc
 KVMyfDNbLgeBBSRTTEECCrbAgtqfnJboItFJWAL/93aHKl7miJ9592XXixLAyRFMqzoX
 E2pzmMfulIBaW8d+uegjJYGKq0MIcZy5y/mSs2blVyg80QuRIEFJEKuS/P3o35f8amrX
 pvvJrTZRO7BJzfTpuTWHbwy1cULglMPhiHgLYcKk6uvENygHVawGDSeT8jn/JODcCo3I
 i4uA==
X-Gm-Message-State: APjAAAXUJzYTQWS9bJh2GmFpwYuWy24y/RRJuwaKAlgEf5+1Oq2XyEHC
 yqJhG+HfOtGI4t3J78XUfsjH1huJ
X-Google-Smtp-Source: APXvYqxlVlyYDPahSfI6NuJNYZPubsog+zHuDcV7bYhk8bf+HKUz/EumTKaeJfZcdSp6QAMEhNK3PA==
X-Received: by 2002:adf:dbc3:: with SMTP id e3mr5514098wrj.185.1573208827442; 
 Fri, 08 Nov 2019 02:27:07 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w4sm1094034wrs.1.2019.11.08.02.27.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Nov 2019 02:27:06 -0800 (PST)
Subject: Re: [PATCH] drm/amd/amdgpu: finish delay works before release
 resources
To: Jesse Zhang <zhexi.zhang@amd.com>, amd-gfx@lists.freedesktop.org
References: <1573208617-16260-1-git-send-email-zhexi.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <da2807d6-cb2f-f481-57e8-ca717cda54d3@gmail.com>
Date: Fri, 8 Nov 2019 11:27:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573208617-16260-1-git-send-email-zhexi.zhang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=MG3wAD9fsnsuTQ9gphqPXHl6mvaT+/zddbv0e1QRETw=;
 b=ANQxTRwp5UTQ/8TVZte1UjJXBYPdG7GeCRa6LCx0s61KYDtootaZydGCXzuD46Gi7m
 MBgq5XWDke7EkmBRtG8QHdz+2YZEAS0Q7zxF+fbWb82q85ErRPn5zrvslFXXVHzfxWXh
 rOXQSafUfue+XlOSyw8PZJDxMFAkFXGK/QnKiRGOy6GRJ/WgD95W9W4+u+lI3WMzVEIf
 sTJiQJPcrbUPptjXYl7sUijk4eJBa8b3/tixutVJ20FuekcqPAFW35YOrOWj73cBrjhP
 R2r7AdPDB/qjH/fOYIPWnu82aABtzBanOciznxeWD1eutuDfRlaWpwebMBDu4tVlJMj/
 BdOg==
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

QW0gMDguMTEuMTkgdW0gMTE6MjMgc2NocmllYiBKZXNzZSBaaGFuZzoKPiBmbHVzaC9jYW5jZWwg
ZGVsYXllZCB3b3JrcyBiZWZvcmUgZG9pbmcgZmluYWxpemF0aW9uCj4gdG8gYXZvaWQgY29uY3Vy
cmVudGx5IHJlcXVlc3RzLgo+Cj4gQ2hhbmdlLUlkOiBJODViN2ZmYmIzNDg3NWFmMWM3MzRjYjQ1
NzNhNmVjYzcxZDM5ZDY1Mgo+IFNpZ25lZC1vZmYtYnk6IEplc3NlIFpoYW5nIDx6aGV4aS56aGFu
Z0BhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMgfCAzICsrKwo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2
ZC5jICAgIHwgMSArCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMg
ICAgfCAxICsKPiAgIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gaW5kZXggMDMyODdkOS4uNWU1
NTc4YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMK
PiBAQCAtMzE0Niw2ICszMTQ2LDkgQEAgdm9pZCBhbWRncHVfZGV2aWNlX2Zpbmkoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAKPiAgIAlEUk1fSU5GTygiYW1kZ3B1OiBmaW5pc2hpbmcg
ZGV2aWNlLlxuIik7Cj4gICAJYWRldi0+c2h1dGRvd24gPSB0cnVlOwo+ICsKPiArCWZsdXNoX2Rl
bGF5ZWRfd29yaygmYWRldi0+ZGVsYXllZF9pbml0X3dvcmspOwo+ICsKPiAgIAkvKiBkaXNhYmxl
IGFsbCBpbnRlcnJ1cHRzICovCj4gICAJYW1kZ3B1X2lycV9kaXNhYmxlX2FsbChhZGV2KTsKPiAg
IAlpZiAoYWRldi0+bW9kZV9pbmZvLm1vZGVfY29uZmlnX2luaXRpYWxpemVkKXsKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jCj4gaW5kZXggZDFiMTBiNS4uMzIxMjhlOSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmMKPiBAQCAtMjk5LDYg
KzI5OSw3IEBAIGludCBhbWRncHVfdXZkX3N3X2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCj4gICB7Cj4gICAJaW50IGksIGo7Cj4gICAKPiArCWNhbmNlbF9kZWxheWVkX3dvcmtfc3lu
YygmYWRldi0+dXZkLmlkbGVfd29yayk7Cj4gICAJZHJtX3NjaGVkX2VudGl0eV9kZXN0cm95KCZh
ZGV2LT51dmQuZW50aXR5KTsKPiAgIAo+ICAgCWZvciAoaiA9IDA7IGogPCBhZGV2LT51dmQubnVt
X3V2ZF9pbnN0OyArK2opIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5j
Cj4gaW5kZXggOTJhYTNiMS4uZjcwYjU1ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdmNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdmNlLmMKPiBAQCAtMjE2LDYgKzIxNiw3IEBAIGludCBhbWRncHVfdmNlX3N3X2Zp
bmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAJaWYgKGFkZXYtPnZjZS52Y3B1X2Jv
ID09IE5VTEwpCj4gICAJCXJldHVybiAwOwo+ICAgCj4gKwljYW5jZWxfZGVsYXllZF93b3JrX3N5
bmMoJmFkZXYtPnZjZS5pZGxlX3dvcmspOwo+ICAgCWRybV9zY2hlZF9lbnRpdHlfZGVzdHJveSgm
YWRldi0+dmNlLmVudGl0eSk7Cj4gICAKPiAgIAlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYt
PnZjZS52Y3B1X2JvLCAmYWRldi0+dmNlLmdwdV9hZGRyLAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
