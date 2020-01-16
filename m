Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2519713DF37
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Jan 2020 16:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B506EDA2;
	Thu, 16 Jan 2020 15:50:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D466C6EDA2
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Jan 2020 15:50:30 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so19650363wrt.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Jan 2020 07:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DwdwHeO7HWr2eKm9Fc3qzOpJt5/HMRCWPw5y9gaAn4E=;
 b=cX+LjTpvNqUWfyXu1ZyxxjaYFRVlxNhnMW1uU1AZd8VX+vpyLG+PLxUgUm5Uuy5Gwk
 pgUK+tDQ1gAJx7cWj3CbtPkpJi+badAQ0l4euoGTEevDMfXhVJGpn/FDzczOuy5l6yyd
 vqVg6ggekvMq6tGzKgtAoMlzTKFmPXbQzfY2MQgTjZTrPSfWp/VVfCmUj5fXQ9iRxtld
 BucSMb+vJGFZSZXqLHj4dmAJgFuCuFT0KdpyfsqoVNGYpFYQNNjrRj23Do58K3LK3dMf
 jGzqrsRHA1WzKJIzf1CO/NFckw8q5FRGTHoYKbA6pJT7firIJp4eh8K73stmk9rFyltx
 6b/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DwdwHeO7HWr2eKm9Fc3qzOpJt5/HMRCWPw5y9gaAn4E=;
 b=BWHtN8coiYar3GyoiHd2M3nTJ3sfEcvxvdoZe+Sk7xl9jgHmNkBzELmwvxCA8L3Y/y
 4mblHfisqtEOLXgRanBVrbv+aksLUwzAwnYOSnKCQ3zAIC9KhTDo7EZx6w6P/xt1QpfK
 5eZMG6uqVIrAqgzotw3c9yfzIEcHZYHguE8nqC1BhMam/g7Yy2Rgw9PMP8iDoPYmPHY9
 WMi3DghrnX2Hhv1ySSHbhiwC16ctrvxKQLP7BQTDzUBcw/vJ5f8roDp1bTbNRNVf1q0c
 kEvcABB2S20pln1S9c8jfJroYxeiRTcz6nAt5fPYJa+aNHmMDmAFn/ZH/YhW3NM5YjfW
 L3dg==
X-Gm-Message-State: APjAAAXqjql6B1ybc6JdJz6JcTmZmQ9ctew4KP9fNV1mXzN9CHyPFOt/
 kS40tgLvgUY6GBMs0AINx5eSJLKHyQG+Z2zLjbRY7Q==
X-Google-Smtp-Source: APXvYqxsJ8+JHO3KI46D3DirmCCENWTei08B7Ust2VK9XFVj7EnuNf3UQvHM5+GWzFT2Zvc3orWi3WX3dEf0qQR5iOE=
X-Received: by 2002:adf:f2c1:: with SMTP id d1mr3955976wrp.111.1579189829501; 
 Thu, 16 Jan 2020 07:50:29 -0800 (PST)
MIME-Version: 1.0
References: <20200116130907.22410-1-christian.koenig@amd.com>
In-Reply-To: <20200116130907.22410-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Jan 2020 10:50:16 -0500
Message-ID: <CADnq5_Ood9+u-2ASKL6cL+vsL4ZPg77rOH=qhP-v_x4f1kxbhA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add coreboot workaround for KV/KB
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: fredrik.bruhn@unibap.com, amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgODowOSBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBDb3JlYm9vdCBzZWVtcyB0byBo
YXZlIGEgcHJvYmxlbSBjb3JyZWN0bHkgc2V0dGluZyB1cCBhY2Nlc3MgdG8gdGhlIHN0b2xlbiBW
UkFNCj4gb24gS1YvS0IuIFVzZSB0aGUgZGlyZWN0IGFjY2VzcyBvbmx5IHdoZW4gbmVjZXNzYXJ5
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgoKQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmMgfCAzICsr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmMKPiBpbmRleCAxOWQ1YjEzM2UxZDcuLjlk
YTk1OTZhMzYzOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djdfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYwo+IEBA
IC0zODEsNyArMzgxLDggQEAgc3RhdGljIGludCBnbWNfdjdfMF9tY19pbml0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQo+ICAgICAgICAgYWRldi0+Z21jLmFwZXJfc2l6ZSA9IHBjaV9yZXNv
dXJjZV9sZW4oYWRldi0+cGRldiwgMCk7Cj4KPiAgI2lmZGVmIENPTkZJR19YODZfNjQKPiAtICAg
ICAgIGlmIChhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpIHsKPiArICAgICAgIGlmIChhZGV2LT5m
bGFncyAmIEFNRF9JU19BUFUgJiYKPiArICAgICAgICAgICBhZGV2LT5nbWMucmVhbF92cmFtX3Np
emUgPiBhZGV2LT5nbWMuYXBlcl9zaXplKSB7Cj4gICAgICAgICAgICAgICAgIGFkZXYtPmdtYy5h
cGVyX2Jhc2UgPSAoKHU2NClSUkVHMzIobW1NQ19WTV9GQl9PRkZTRVQpKSA8PCAyMjsKPiAgICAg
ICAgICAgICAgICAgYWRldi0+Z21jLmFwZXJfc2l6ZSA9IGFkZXYtPmdtYy5yZWFsX3ZyYW1fc2l6
ZTsKPiAgICAgICAgIH0KPiAtLQo+IDIuMTcuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeAo=
