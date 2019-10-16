Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40507D8BF9
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 10:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3626E904;
	Wed, 16 Oct 2019 08:59:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5A96E904
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 08:59:41 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y18so17611897wrn.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 01:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=TXu4YHJj99HadhRwFrpxC+hbmsEM+aRPdikfSj/p97Y=;
 b=KTNDdg37u4ceL658yQgmBbnXS96hcmXTZI4M+2cwvWkVTnhBk8gex5p2qoDxxaucrQ
 Q4nUZHmvK+I1+a6e7m6WrknfyKzE62sVf/UwFgC4RsQowJuiZmLHkJu7ZCu/qZKNzd3X
 7Awwezu3zPgdzD6MhBfmEv8CJDpvffeC0bmIvgXIO0Jc8NNSu3z0YycJ4fSmE97lXUCv
 HUft/H+YBoWvZYiJ1rM4w9PbuJ9QBgP7ChBS0CaVV2os7U5sMHutwWQbfWSP/z5xSPTe
 DcbA3e5jMCDYghEX5f8v7E8OtGy5l80lIAxm0hZLK9NTdonNhJyt+6AxSijT2ZWIFLZ5
 tppg==
X-Gm-Message-State: APjAAAVjQIBLvFdatHLFiZWJIYj/x6F4E0RUJj5OrMFsQza0THYPy5x5
 Gn8pxDvDb7UrVSOsj0oU71J8cDv/
X-Google-Smtp-Source: APXvYqzBFAGkgQfsPE1lp96qVCYGWCchO17X7b5kdpMAvXr9PCyjlHfp5GIHnUaiArbXAuyKUM+Fsw==
X-Received: by 2002:adf:f010:: with SMTP id j16mr1701079wro.317.1571216379695; 
 Wed, 16 Oct 2019 01:59:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p5sm2272378wmi.4.2019.10.16.01.59.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Oct 2019 01:59:39 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/amdgpu/uvd:Add uvd enc session bo
To: "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1571177279-9435-1-git-send-email-James.Zhu@amd.com>
 <1571177279-9435-2-git-send-email-James.Zhu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3198889b-9df5-dd90-0457-79a1a886ec4d@gmail.com>
Date: Wed, 16 Oct 2019 10:59:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571177279-9435-2-git-send-email-James.Zhu@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=TXu4YHJj99HadhRwFrpxC+hbmsEM+aRPdikfSj/p97Y=;
 b=QeIWLptrKkj703YLJwBsQlv3GuY0wnHmri8s6m4n9rdSR5NCW5gushBDkpp99JdP5R
 tOAonCSe+JLPYhL+/rC3C+krU9QR6j8ng/iDbwauVk/D18qErHjD1WdoQl3UNLOxHxun
 7ETpbPHV0VLI8zi/MFjpdTu04akPlo94UaS24saMhvj00woPwbwMHQNw8G39wRJYIv3H
 rGW7ExC7slmPMuYmJGXsiNSjkid//eRLTvtz35ZAFra8r0WX7GYVb0cdu8nOExhId9yX
 lDp3whkNXhS3VZFGxA1hdZZOM2BKdb9Wn3HEpySpMxQk0xIbQRSaqhDXdWxCll19tb+O
 YX3A==
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

QW0gMTYuMTAuMTkgdW0gMDA6MDggc2NocmllYiBaaHUsIEphbWVzOgo+IEFkZCB1dmQgZW5jIHNl
c3Npb24gYm8gZm9yIHV2ZCBlbmNvZGUgSUIgdGVzdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbWVz
IFpodSA8SmFtZXMuWmh1QGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdXZkLmggfCA0ICsrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dXZkLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmgKPiBpbmRleCA1
ZWI2MzI4Li4xZTM5YzhhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV91dmQuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91
dmQuaAo+IEBAIC02Nyw2ICs2NywxMCBAQCBzdHJ1Y3QgYW1kZ3B1X3V2ZCB7Cj4gICAJdW5zaWdu
ZWQJCWhhcnZlc3RfY29uZmlnOwo+ICAgCS8qIHN0b3JlIGltYWdlIHdpZHRoIHRvIGFkanVzdCBu
YiBtZW1vcnkgc3RhdGUgKi8KPiAgIAl1bnNpZ25lZAkJZGVjb2RlX2ltYWdlX3dpZHRoOwo+ICsK
PiArCXN0cnVjdCBhbWRncHVfYm8gKmVuY19zZXNzaW9uX2JvOwo+ICsJdm9pZAkJCSAqZW5jX3Nl
c3Npb25fY3B1X2FkZHI7Cj4gKwl1aW50NjRfdAkJICBlbmNfc2Vzc2lvbl9ncHVfYWRkcjsKClBs
ZWFzZSBkb24ndCBrZWVwIHRoYXQgYWxsb2NhdGVkIGFsbCB0aGUgdGltZSwgYnV0IHJhdGhlciBv
bmx5IGFsbG9jYXRlIAppdCBvbiBkZW1hbmQgZHVyaW5nIHRoZSBJQiB0ZXN0LgoKUmVnYXJkcywK
Q2hyaXN0aWFuLgoKPiAgIH07Cj4gICAKPiAgIGludCBhbWRncHVfdXZkX3N3X2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
