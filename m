Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41228CF464
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 10:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE476E26F;
	Tue,  8 Oct 2019 08:00:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3316E229
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 08:00:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h4so9449802wrv.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 08 Oct 2019 01:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=tCB/EdyxLqqdgrILHQLIfopMRKci2X54gNV8L/lLq/Y=;
 b=N986Muhau00gSRPFA5I4/+/cIu4MbYkBdR756ksyiO/bx5iuvw6aM761fOtqtqoOvZ
 t/Bkk65naTvTj1D5TU4d0smwKw7/PUKg3OFKcp/YtfwLzcdHiLe4EyTDKpWwED9Z/1sR
 cBPZ1QNbu4CARhc5wIAx/ArSyT+7eIYEQzhGXACN3qcfgovnqjfGU0eLqHP1E+81AT8S
 9BGj+LpR9th+YOi2PVH1nld1Xe6SyGr/S6+bh2rgCkoQ8NTQYdD+irtyotkT4qYFCevD
 b+GFlU6fQjfmL3EQoWuP8AuQJ0Lu5hMR++UgcmIk8iUVfqdBbZDg3zpXpyYckY0Zxd7I
 sfhQ==
X-Gm-Message-State: APjAAAU4KBz//bfuTYRUcurgPwhejhM788QV3KY7rgGdCW7bocRUVgEV
 hRFEYKEbY53P2Ovbzz4x8binC5Om
X-Google-Smtp-Source: APXvYqzwBENXm+SGSO7CX9XNG58AvW+iwBH0WVGEGjmU93d89X3QROGFe/KUj1WQzaAzFiC0hMrwrw==
X-Received: by 2002:adf:b60b:: with SMTP id f11mr24435150wre.95.1570521603564; 
 Tue, 08 Oct 2019 01:00:03 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e3sm2334536wme.39.2019.10.08.01.00.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 01:00:03 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/amdgpu: Enable gfx cache probing on HDP write for
 arcturus
To: "Zeng, Oak" <Oak.Zeng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1570480448-29861-1-git-send-email-Oak.Zeng@amd.com>
 <1570480448-29861-2-git-send-email-Oak.Zeng@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <380de858-270b-84b2-df1c-4f24d59f6fb3@gmail.com>
Date: Tue, 8 Oct 2019 10:00:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570480448-29861-2-git-send-email-Oak.Zeng@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=tCB/EdyxLqqdgrILHQLIfopMRKci2X54gNV8L/lLq/Y=;
 b=uQAYhkahSVGE5U7YkLVNqxp4PvcaCXScP68cG8HpN7eJshOcps6PtBfj5E2dNx3Y93
 iNLgc9CA0LYI+9yw6iqAnGjAwxLqTFNy1QX/DicMlP3TCcsb07TLS2YmMjgBW56lWOIl
 gnKZkxtGypqloObozvhmKDudgCXTDn0EAqiZ7fAkTPFkgseO+JWfBffx6wCRXfqpQF9E
 C5K+Wm+ez4B4G4B3mffB8kTAIo68Sed4E3McnFBQ9KhHIrwTZhck1wTzHy4Xecl5mFyR
 aVuOTWdiQdS70Q94tJz1WmCFsX7a4qu9Te0nL3v6lROT1adVIs1W+F55abtpZijO1yYH
 HRXg==
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDcuMTAuMTkgdW0gMjI6MzQgc2NocmllYiBaZW5nLCBPYWs6Cj4gVGhpcyBhbGxvd3MgZ2Z4
IGNhY2hlIHRvIGJlIHByb2JlZCBhbmQgaW52YWxpZGF0ZWQgKGZvciBub25lLWRpcnR5IGNhY2hl
IGxpbmVzKQo+IG9uIGEgSERQIHdyaXRlIChmcm9tIGVpdGhlciBhbm90aGVyIEdQVSBvciBDUFUp
LiBUaGlzIHNob3VsZCB3b3JrIG9ubHkgZm9yIHRoZQo+IG1lbW9yeSBtYXBwZWQgYXMgUlcgbWVt
b3J5IHR5cGUgbmV3bHkgYWRkZWQgZm9yIGFyY3R1cnVzLCB0byBhY2hpZXZlIHNvbWUgY2FjaGUK
PiBjb2hlcmVuY2UgYi90IG11bHRpcGxlIG1lbW9yeSBjbGllbnRzLgo+Cj4gQ2hhbmdlLUlkOiBJ
NWM5YTZhMjVkODhjZDc1YzcxYzg4ODIyMTIzZTBkNGMwNjdhYTNmOAo+IFNpZ25lZC1vZmYtYnk6
IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPgoKQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jIHwgMyArKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlf
MC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwo+IGluZGV4IGM3ZTA3
ZjEuLjZlNDVlYmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y5XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKPiBA
QCAtMTE5Miw2ICsxMTkyLDkgQEAgc3RhdGljIGludCBnbWNfdjlfMF9od19pbml0KHZvaWQgKmhh
bmRsZSkKPiAgIAkJLyogVE9ETyBmb3IgcmVub2lyICovCj4gICAJCW1taHViX3YxXzBfdXBkYXRl
X3Bvd2VyX2dhdGluZyhhZGV2LCB0cnVlKTsKPiAgIAkJYnJlYWs7Cj4gKwljYXNlIENISVBfQVJD
VFVSVVM6Cj4gKwkJV1JFRzMyX0ZJRUxEMTUoSERQLCAwLCBIRFBfTU1IVUJfQ05UTCwgSERQX01N
SFVCX0dDQywgMSk7Cj4gKwkJYnJlYWs7Cj4gICAJZGVmYXVsdDoKPiAgIAkJYnJlYWs7Cj4gICAJ
fQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
