Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FD0C0400
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 13:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740F16EE75;
	Fri, 27 Sep 2019 11:21:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AC16EE75
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 11:21:54 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b9so2327351wrs.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 04:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=cPkdmOR93T5IZEUIFJjEaAI7FDxTXxQyd4uGq9g8h4k=;
 b=MpVfl3kdO2xWESLH3ELWJJpzv/M1ku9OyGm89IM1nCgMC4kCVPRGAO53tT5eFCrUs9
 0yaRF6oKn0VMPAvO2dqnKYvFwCmP8wBIi3a2qBfvv9he6YFGyViGh0ohnyr+13As8l8M
 VrfnRKcuxY9EFzgALgGj3rFTykOkSX89GVnCyNRG6nLyzBGW64H3kBZnJnkRipQpJUhJ
 7vxNAtPebDEKuVU1iKvxjMFuGllFDnEi4MLwklQb9tHUVeWJPTVkujZ6ciJ6hLi3U94S
 +8NSe8w037ujDYetqn7OGmU1gUuEwuYkpJhVlDHMM9FFt4383ZrH4qVVuYUICPu0ZItt
 sW8Q==
X-Gm-Message-State: APjAAAW3pGSFl2YJwCDKiLpJsbfsz3NPTwAkLg95mhDD/cdqU2nHsVew
 5JU/K7Smy5hZfjs3cF28x2Y=
X-Google-Smtp-Source: APXvYqzEj8h1xhlmiXY03LcDI7tbKJe1bqpv1rZk/F7lj5/BhRS116SPWrXYXNt4eO8QPUjljEIy/A==
X-Received: by 2002:adf:de03:: with SMTP id b3mr2477978wrm.14.1569583312695;
 Fri, 27 Sep 2019 04:21:52 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id i7sm3874386wrb.64.2019.09.27.04.21.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 04:21:51 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/powerplay: Protect backend resource when unload
 driver
To: Jesse Zhang <zhexi.zhang@amd.com>, amd-gfx@lists.freedesktop.org
References: <1569578864-4558-1-git-send-email-zhexi.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <39e06a31-a8a9-6fb3-775c-1ed57e541813@gmail.com>
Date: Fri, 27 Sep 2019 13:21:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569578864-4558-1-git-send-email-zhexi.zhang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cPkdmOR93T5IZEUIFJjEaAI7FDxTXxQyd4uGq9g8h4k=;
 b=LK+R5VfPHvHVhfXMZo7v7D2nEkQB3zk3ULswIv0BurIiMDybLuPNBccLhCOfzxMpSf
 ry53eKA9qHtFzKtvU3bPkSfu7de0vn2WcHUqnx31Wbq75xmPUBIr8Sg5AgpS/rKr6FKN
 GaN/lSyRd8rXc2s9zBBB8Z4HZmmnnN/ndBj2/s6JNg8nwr1+PwMudfmHi9tbDYNiCGgp
 dmj0th0qRZyWCNOZ4RB0fuHbTAW1ZjZmKCl5uZApid7CN11eR0/TQabU3amSMxDSyX8I
 pAix1AqqYlItrrwZ1FUjMgk95bJW4vRsTQV9+k1GYRmJBKZv+9ABjdK8MOFcbtypu5ox
 IdvA==
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
Cc: root <root@debian.debian>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjcuMDkuMTkgdW0gMTI6MDcgc2NocmllYiBKZXNzZSBaaGFuZzoKPiBGcm9tOiByb290IDxy
b290QGRlYmlhbi5kZWJpYW4+Cj4KPiBHdWVzdCBkcml2ZXIgY2FuIGJlIHVubG9hZGVkIHdoaWxl
IGVuZ2luZXMgc3RpbGwgdXNpbmcgc29tZQo+IGJhY2tlbmQgcmVzb3VyY2VzLiBUaGF0IHdvdWxk
IGxlYWQgdG8gdXNlIGFmdGVyIGZyZWUgYW5kIHRoZW4KPiBjYXVzZSBndWVzdCBkcml2ZXIgZmFp
bGVkLgo+Cj4gTmVlZCB0byBhZGQgbXV0ZXggbG9jayBiZWZvcmUgYmFja2VuZCByZXNvdXJjZXMg
ZnJlZSB0byBtYWtlCj4gc3VyZSBub2JvZHkgaXMgdXNpbmcgaXQuCj4KPiBOZWVkIHRvIGNoZWNr
IGJhY2tlbmQgZGF0YSBhdmFpbGFibGlsaXR5IGJlZm9yZSBWQ0UvVVZEIGVudGVyCj4gcG93ZXJn
YXRpbmcgbW9kZSwgaWYgYmFja2VuZCByZXNvdXJjZXMgaGF2ZSBiZWVuIGZyZWUsIHRoZW4KPiBz
a2lwIGVudGVyaW5nIHBvd2VyZ2F0aW5nLgo+Cj4gQ2hhbmdlLUlkOiBJZjdmOTMyMjFkZGVjYzU3
ODg4NGRjOWU5OWE1MmYyMmE0M2UxNmIwNwo+IFNpZ25lZC1vZmYtYnk6IEplc3NlIFpoYW5nIDx6
aGV4aS56aGFuZ0BhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMgfCAxNCArKysrKysrKysrLS0tLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYwo+IGluZGV4IGQw
ODQ5M2IuLmE5MzIwYTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci92ZWdhMTBfaHdtZ3IuYwo+IEBAIC04MTAsOCArODEwLDEwIEBAIHN0YXRpYyBp
bnQgdmVnYTEwX2h3bWdyX2JhY2tlbmRfZmluaShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQo+ICAg
CWtmcmVlKGh3bWdyLT5keW5fc3RhdGUudmRkY19kZXBfb25fZGFsX3B3cmwpOwo+ICAgCWh3bWdy
LT5keW5fc3RhdGUudmRkY19kZXBfb25fZGFsX3B3cmwgPSBOVUxMOwo+ICAgCj4gKwltdXRleF9s
b2NrKCZod21nci0+c211X2xvY2spOwo+ICAgCWtmcmVlKGh3bWdyLT5iYWNrZW5kKTsKPiAgIAlo
d21nci0+YmFja2VuZCA9IE5VTEw7Cj4gKwltdXRleF91bmxvY2soJmh3bWdyLT5zbXVfbG9jayk7
Cj4gICAKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiBAQCAtNDYxOSwxNiArNDYyMSwyMCBAQCBzdGF0
aWMgdm9pZCB2ZWdhMTBfcG93ZXJfZ2F0ZV92Y2Uoc3RydWN0IHBwX2h3bWdyICpod21nciwgYm9v
bCBiZ2F0ZSkKPiAgIHsKPiAgIAlzdHJ1Y3QgdmVnYTEwX2h3bWdyICpkYXRhID0gaHdtZ3ItPmJh
Y2tlbmQ7CgpJcyB0aGUgbXV0ZXggbG9ja2VkIGJ5IHRoZSBjYWxsZXIgaGVyZT8KCj4gICAKPiAt
CWRhdGEtPnZjZV9wb3dlcl9nYXRlZCA9IGJnYXRlOwo+IC0JdmVnYTEwX2VuYWJsZV9kaXNhYmxl
X3ZjZV9kcG0oaHdtZ3IsICFiZ2F0ZSk7Cj4gKwlpZihkYXRhKXsKCk1pc3Npbmcgc3BhY2VzIGFu
ZCBpdCBpcyB1c3VhbGx5IGJldHRlciB0byBkbyB0aGlzIGxpa2U6CgppZiAoIWRhdGEpCiDCoMKg
wqAgcmV0dXJuOwoKU2luY2UgdGhpcyBpcyBlc3NlbnRpYWxseSBlcnJvciBoYW5kbGluZy4KClJl
Z2FyZHMsCkNocmlzdGlhbi4KCj4gKwkJZGF0YS0+dmNlX3Bvd2VyX2dhdGVkID0gYmdhdGU7Cj4g
KwkJdmVnYTEwX2VuYWJsZV9kaXNhYmxlX3ZjZV9kcG0oaHdtZ3IsICFiZ2F0ZSk7Cj4gKwl9Cj4g
ICB9Cj4gICAKPiAgIHN0YXRpYyB2b2lkIHZlZ2ExMF9wb3dlcl9nYXRlX3V2ZChzdHJ1Y3QgcHBf
aHdtZ3IgKmh3bWdyLCBib29sIGJnYXRlKQo+ICAgewo+ICAgCXN0cnVjdCB2ZWdhMTBfaHdtZ3Ig
KmRhdGEgPSBod21nci0+YmFja2VuZDsKPiAgIAo+IC0JZGF0YS0+dXZkX3Bvd2VyX2dhdGVkID0g
YmdhdGU7Cj4gLQl2ZWdhMTBfZW5hYmxlX2Rpc2FibGVfdXZkX2RwbShod21nciwgIWJnYXRlKTsK
PiArCWlmKGRhdGEpewo+ICsJCWRhdGEtPnV2ZF9wb3dlcl9nYXRlZCA9IGJnYXRlOwo+ICsJCXZl
Z2ExMF9lbmFibGVfZGlzYWJsZV91dmRfZHBtKGh3bWdyLCAhYmdhdGUpOwo+ICsJfQo+ICAgfQo+
ICAgCj4gICBzdGF0aWMgaW5saW5lIGJvb2wgdmVnYTEwX2FyZV9wb3dlcl9sZXZlbHNfZXF1YWwo
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
