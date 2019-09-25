Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F524BDFA0
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 16:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86CF6EBBB;
	Wed, 25 Sep 2019 14:04:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BF76EBBB
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 14:04:57 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 5so5851956wmg.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 07:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=T/+jHOcm+8rbCfp1jqu7uoXHj1FQuI/aaE0JLvuoc7I=;
 b=pC5q9P3ms/5jJ5S+6qcwdYmLh6j7pnPDG6z8kbVAb6wH/4KythsLaUWYhx7HPQP8cC
 12YG87MDbf+dMa5mWXa7EsR9Z2FWSNUNjyvdUgfgJ+ecWqBrvs5UAA2QMOJqLGuMIO8P
 7Zn5qwJWTdvvTBiIppTpLZ6RspGv0Xa39nByd14nHsFaPMxMt5JNiT4kwKP3UohCKXJ+
 qNRHAkr+us4uTeqmQ7kFhfrNKWqal28uVSsR5UYxVwHLSmXvIWxr4ULa4zxdSq9xGlZ2
 QQow/jNiI/JgAHT1AmYp7uXIa7l5XTG8eDiXJkg0FFt8eziqNR92gQ9JLELgnw5AEzay
 hx3A==
X-Gm-Message-State: APjAAAVgAX6rWgxWVrtGd64RhyB+n25PWnpWGZmkWgSL0ztsWqTWmjgH
 Z82QfLnNXTM7OQv4IC0azCy8/3vs
X-Google-Smtp-Source: APXvYqxIocLKhxl/YVtQYnwqpDeZrxu/igsTmfwJgsde9++KEqcF3yOucXExtqMAcv1b+J8tiTIMHA==
X-Received: by 2002:a1c:9e0b:: with SMTP id h11mr7827473wme.144.1569420296003; 
 Wed, 25 Sep 2019 07:04:56 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g185sm6732945wme.10.2019.09.25.07.04.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 07:04:55 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix potential VM faults
To: "Liu, Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190919084136.82658-1-christian.koenig@amd.com>
 <MN2PR12MB393312A21B75620C726F18DF84870@MN2PR12MB3933.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2663d42b-e627-03d8-f03c-f75a581bfd7a@gmail.com>
Date: Wed, 25 Sep 2019 16:04:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <MN2PR12MB393312A21B75620C726F18DF84870@MN2PR12MB3933.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=T/+jHOcm+8rbCfp1jqu7uoXHj1FQuI/aaE0JLvuoc7I=;
 b=DcmiUNTNLuZYwuNwD43n9esT9KzLg0qUqNQBM8KFRsOw7/9zW7xaxFET/OVT4wyaYq
 nxFViW8lNYMfoR5QYbWEmaW448Gx1dOrg+EjiYrKRO+yUcI8LEoJFgafjIW/HyM1F9KN
 7JUc5zPcQhq3wfdTlWCNPpCKNiAvyQgRVeAQNjv+X8YcI69Z2Sgf8bBDKhrFCqfnAYqi
 QCdlIfSyyL6y1IVuTQ/JWg0nY8/a86dNhVs3gHCNRrKi6BFi868cNi1UtiXQX1j6eIUz
 JVL8wqVnm0ZvA9bjnMEUuP6nF34wkOLjxuIV2JaDt1W3jeNRqZxPMOW2F6SZgerhhIjZ
 Fn3Q==
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

SGkgTW9uaywKCnRoaXMgcGF0Y2ggZG9lc24ndCBwcmV2ZW50cyBQRC9QVCBldmljdGlvbi4KClRo
ZSBpbnRlbnRpb24gb2YgdGhlIGNvZGUgaGVyZSB3YXMgdGhhdCBwZXIgVk0gQk9zIGNhbiBldmlj
dCBvdGhlciBwZXIgClZNIEJPcyBkdXJpbmcgYWxsb2NhdGlvbi4KClRoZSBwcm9ibGVtIG15IHBh
dGNoIGZpeGVzIGlzIHRoYXQgdGhpcyB1bmZvcnR1bmF0ZWx5IGFsc28gbWVhbnQgdGhhdCAKYWxs
b2NhdGlvbiBQRHMvUFRzIGNvdWxkIGV2aWN0IG90aGVyIFBEcy9QVHMgZnJvbSB0aGUgc2FtZSBw
cm9jZXNzLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKQW0gMjUuMDkuMTkgdW0gMTU6NTEgc2Nocmll
YiBMaXUsIE1vbms6Cj4gSGkgQ2hyaXN0aWFuCj4KPiBUaGVvcmV0aWNhbGx5IHRoZSB2bSBwdC9w
ZCBzaG91bGQgYmUgYWxsb3dlZCB0byBiZSBldmljdGVkIGxpa2Ugb3RoZXIgQk9zIC4uCj4KPiBJ
ZiB5b3UgZW5jb3VudGVyZWQgcGFnZSBmYXVsdCBhbmQgY291bGQgYmUgYXZvaWRlZCBieSB0aGlz
IHBhdGNoLCB0aGF0IG1lYW5zIHRoZXJlIGlzIGJ1ZyBpbiB0aGUgVk0vdHRtIHN5c3RlbSAsIGFu
ZCB5b3VyIHBhdGNoIHNpbXBseQo+Cj4gdy9hIHRoZSByb290IGNhdXNlLgo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IE1vbmsgTGl1fEdQVSBWaXJ0dWFsaXphdGlv
biBUZWFtIHxBTUQKPgo+Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBhbWQt
Z2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2Yg
Q2hyaXN0aWFuIEs/bmlnCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxOSwgMjAxOSA0OjQy
IFBNCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1OiBmaXggcG90ZW50aWFsIFZNIGZhdWx0cwo+Cj4gV2hlbiB3ZSBhbGxvY2F0
ZSBuZXcgcGFnZSB0YWJsZXMgdW5kZXIgbWVtb3J5IHByZXNzdXJlIHdlIHNob3VsZCBub3QgZXZp
Y3Qgb2xkIG9uZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfb2JqZWN0LmMgfCAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9v
YmplY3QuYwo+IGluZGV4IDcwZDQ1ZDQ4OTA3YS4uOGU0NGVjYWFkYTM1IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwo+IEBAIC01MTQsNyArNTE0LDgg
QEAgc3RhdGljIGludCBhbWRncHVfYm9fZG9fY3JlYXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAo+ICAgCQkuaW50ZXJydXB0aWJsZSA9IChicC0+dHlwZSAhPSB0dG1fYm9fdHlwZV9rZXJu
ZWwpLAo+ICAgCQkubm9fd2FpdF9ncHUgPSBicC0+bm9fd2FpdF9ncHUsCj4gICAJCS5yZXN2ID0g
YnAtPnJlc3YsCj4gLQkJLmZsYWdzID0gVFRNX09QVF9GTEFHX0FMTE9XX1JFU19FVklDVAo+ICsJ
CS5mbGFncyA9IGJwLT50eXBlICE9IHR0bV9ib190eXBlX2tlcm5lbCA/Cj4gKwkJCVRUTV9PUFRf
RkxBR19BTExPV19SRVNfRVZJQ1QgOiAwCj4gICAJfTsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2JvICpi
bzsKPiAgIAl1bnNpZ25lZCBsb25nIHBhZ2VfYWxpZ24sIHNpemUgPSBicC0+c2l6ZTsKPiAtLQo+
IDIuMTcuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
