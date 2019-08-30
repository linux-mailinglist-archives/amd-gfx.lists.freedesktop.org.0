Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0D79FAED
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 08:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17ADA89C08;
	Wed, 28 Aug 2019 06:57:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8732089C08
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 06:57:15 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v15so1519122wml.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 23:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4Jy/NRH0kijb3ybN0LWbJm3NfDhH3tpXfJ+7IKyZrcc=;
 b=rUK6LkDNDkPGuJVC9UE5H5KzyXzj+w6vCDNunBPO/x9m+LhdjoTAyJMvZ0qpt7qYJJ
 oIygLdxP7hdqeKvtyZm+78yJuQYjfHvAnAGgHyC20f0XfP7EyUEvtaOwn4N9GtdPjqAB
 Jw+TchWBw1w5CxZ//pVw2hQr7RMf8XI44Y++W+6+oBGyaGXepYHKnF/CbNuGdJ6OVt+P
 dhKCb4R6DykKalheisw0MMr+YrJohOa3UXR++m5keB0QPTiUrdszE2VCPk9P1gP2F77L
 oKTdMupUctFobpW1sGDQEKeHUTlOH9qev+3z8JyxsAex3lo0LJrpu9SpPxsGG82oYeiN
 o9eg==
X-Gm-Message-State: APjAAAXPUSfnXnFHnRsCp8PzQlbZZ3Z0Osl37QLquPtxd0ykMhMvycK9
 ffeFoHHjvyDhF0Sug6G0vvNGgwUj
X-Google-Smtp-Source: APXvYqzw4LAFDOMFy03CAr7CL1Hmsf2GF0ocEHsqJJSFbU4Xo71gZ5+LbgOZGS8yX90PDnS0mEnBqA==
X-Received: by 2002:a7b:c649:: with SMTP id q9mr2717495wmk.108.1566975433791; 
 Tue, 27 Aug 2019 23:57:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:412d:35b8:9936:f84c?
 ([2a02:908:1252:fb60:412d:35b8:9936:f84c])
 by smtp.gmail.com with ESMTPSA id x6sm4570556wmf.6.2019.08.27.23.57.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 23:57:13 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: introduce vram lost for reset
To: Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org
References: <1566894873-11178-1-git-send-email-Monk.Liu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <df792b75-deb0-1f64-944b-152ed91555ec@gmail.com>
Date: Fri, 30 Aug 2019 22:15:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566894873-11178-1-git-send-email-Monk.Liu@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=4Jy/NRH0kijb3ybN0LWbJm3NfDhH3tpXfJ+7IKyZrcc=;
 b=AWNnmKY2qn2NuF1ywhFdkNJJXv25K1OTpF1ODv5pBGfWAFTuvhFOSRQmfGu3+kyEtC
 YO2ejQBPn+6E9NMChyuWBDjQTvsGUlksJndjjwqEPFC5RmgOFd2wAq+0XUVmGCtWBS76
 kNjgAKk1nyorc94TQb7o5BMm0fyBs+AwjAO7P7SsIbwP6UtkV6VD7UeIwSlcfZkvmjd5
 l/uZ4uyEHD80mOjzXAnWFIVKCuhMYO3lYVIwgOgamNJCfp12IxMYrKcvK5C+vNDr2BUS
 Hjp65F0MHaia3OyEX25naKnS4x1GdQDL8nl7B1uoqF5IeO21j9LKbRBxPMqen7YQ24j0
 cs7w==
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

QW0gMjcuMDguMTkgdW0gMTA6MzQgc2NocmllYiBNb25rIExpdToKPiBmb3IgU09DMTUvdmVnYTEw
IHRoZSBCQUNPIHJlc2V0ICYgbW9kZTEgd291bGQgaW50cm9kdWNlIHZyYW0gbG9zdAo+IGluIGhp
Z2ggZW5kIGFkZHJlc3MgcmFuZ2UsIGN1cnJlbnQga21kJ3MgdnJhbSBsb3N0IGNoZWNraW5nIGNh
bm5vdAo+IGNhdGNoIGl0IHNpbmNlIGl0IG9ubHkgY2hlY2sgdmVyeSBhaGVhZCB2aXNpYmxlIGZy
YW1lIGJ1ZmZlcgoKTG9va3MgbW9zdGx5IGdvb2QgdG8gbWUuCgpPbmx5IHF1ZXN0aW9uIEkgaGF2
ZSBpcyB3aHkgdG8gdXNlIGEgbWFjcm8/IFNvbWUgaW5saW5lIGZ1bmN0aW9uIHNob3VsZCAKZG8g
YXMgd2VsbC4KCkNocmlzdGlhbi4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBNb25rIExpdSA8TW9uay5M
aXVAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5o
ICAgICAgICB8IDEgKwo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jIHwgNCArKy0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jICAgICAg
ICAgfCAyICsrCj4gICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4gaW5kZXggZjZhZTU2NS4u
MTFlMGZjMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4gQEAgLTExNTUs
NiArMTE1NSw3IEBAIGludCBlbXVfc29jX2FzaWNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldik7Cj4gICAjZGVmaW5lIGFtZGdwdV9hc2ljX2dldF9wY2llX3VzYWdlKGFkZXYsIGNudDAs
IGNudDEpICgoYWRldiktPmFzaWNfZnVuY3MtPmdldF9wY2llX3VzYWdlKChhZGV2KSwgKGNudDAp
LCAoY250MSkpKQo+ICAgI2RlZmluZSBhbWRncHVfYXNpY19uZWVkX3Jlc2V0X29uX2luaXQoYWRl
dikgKGFkZXYpLT5hc2ljX2Z1bmNzLT5uZWVkX3Jlc2V0X29uX2luaXQoKGFkZXYpKQo+ICAgI2Rl
ZmluZSBhbWRncHVfYXNpY19nZXRfcGNpZV9yZXBsYXlfY291bnQoYWRldikgKChhZGV2KS0+YXNp
Y19mdW5jcy0+Z2V0X3BjaWVfcmVwbGF5X2NvdW50KChhZGV2KSkpCj4gKyNkZWZpbmUgYW1kZ3B1
X2luY192cmFtX2xvc3QoYWRldikgYXRvbWljX2luYygmKChhZGV2KS0+dnJhbV9sb3N0X2NvdW50
ZXIpKTsKPiAgIAo+ICAgLyogQ29tbW9uIGZ1bmN0aW9ucyAqLwo+ICAgYm9vbCBhbWRncHVfZGV2
aWNlX3Nob3VsZF9yZWNvdmVyX2dwdShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IGluZGV4IDAyYjNlN2Qu
LjMxNjkwZTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jCj4gQEAgLTM0ODIsNyArMzQ4Miw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9yZXNl
dF9zcmlvdihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgIAlhbWRncHVfdmlydF9pbml0
X2RhdGFfZXhjaGFuZ2UoYWRldik7Cj4gICAJYW1kZ3B1X3ZpcnRfcmVsZWFzZV9mdWxsX2dwdShh
ZGV2LCB0cnVlKTsKPiAgIAlpZiAoIXIgJiYgYWRldi0+dmlydC5naW1fZmVhdHVyZSAmIEFNREdJ
TV9GRUFUVVJFX0dJTV9GTFJfVlJBTUxPU1QpIHsKPiAtCQlhdG9taWNfaW5jKCZhZGV2LT52cmFt
X2xvc3RfY291bnRlcik7Cj4gKwkJYW1kZ3B1X2luY192cmFtX2xvc3QoYWRldik7Cj4gICAJCXIg
PSBhbWRncHVfZGV2aWNlX3JlY292ZXJfdnJhbShhZGV2KTsKPiAgIAl9Cj4gICAKPiBAQCAtMzY0
OCw3ICszNjQ4LDcgQEAgc3RhdGljIGludCBhbWRncHVfZG9fYXNpY19yZXNldChzdHJ1Y3QgYW1k
Z3B1X2hpdmVfaW5mbyAqaGl2ZSwKPiAgIAkJCQl2cmFtX2xvc3QgPSBhbWRncHVfZGV2aWNlX2No
ZWNrX3ZyYW1fbG9zdCh0bXBfYWRldik7Cj4gICAJCQkJaWYgKHZyYW1fbG9zdCkgewo+ICAgCQkJ
CQlEUk1fSU5GTygiVlJBTSBpcyBsb3N0IGR1ZSB0byBHUFUgcmVzZXQhXG4iKTsKPiAtCQkJCQlh
dG9taWNfaW5jKCZ0bXBfYWRldi0+dnJhbV9sb3N0X2NvdW50ZXIpOwo+ICsJCQkJCWFtZGdwdV9p
bmNfdnJhbV9sb3N0KHRtcF9hZGV2KTsKPiAgIAkJCQl9Cj4gICAKPiAgIAkJCQlyID0gYW1kZ3B1
X2d0dF9tZ3JfcmVjb3ZlcigKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKPiBpbmRleCBm
ZTIyMTJkZi4uOGFmNzUwMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zb2MxNS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwo+IEBA
IC01NTcsMTAgKzU1NywxMiBAQCBzdGF0aWMgaW50IHNvYzE1X2FzaWNfcmVzZXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCj4gICB7Cj4gICAJc3dpdGNoIChzb2MxNV9hc2ljX3Jlc2V0X21l
dGhvZChhZGV2KSkgewo+ICAgCQljYXNlIEFNRF9SRVNFVF9NRVRIT0RfQkFDTzoKPiArCQkJYW1k
Z3B1X2luY192cmFtX2xvc3QoYWRldik7Cj4gICAJCQlyZXR1cm4gc29jMTVfYXNpY19iYWNvX3Jl
c2V0KGFkZXYpOwo+ICAgCQljYXNlIEFNRF9SRVNFVF9NRVRIT0RfTU9ERTI6Cj4gICAJCQlyZXR1
cm4gc29jMTVfbW9kZTJfcmVzZXQoYWRldik7Cj4gICAJCWRlZmF1bHQ6Cj4gKwkJCWFtZGdwdV9p
bmNfdnJhbV9sb3N0KGFkZXYpOwo+ICAgCQkJcmV0dXJuIHNvYzE1X2FzaWNfbW9kZTFfcmVzZXQo
YWRldik7Cj4gICAJfQo+ICAgfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
