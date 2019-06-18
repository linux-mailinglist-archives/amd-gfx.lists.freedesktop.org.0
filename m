Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E7649BB4
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 10:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9C96E10C;
	Tue, 18 Jun 2019 08:07:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F236E10C
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 08:07:17 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x4so12838638wrt.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 01:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ALIOZIHwzphwLi9yH5ycFu//67M2Lz3S70CzfdUMQIA=;
 b=IT/pD2eSygBd2G/eq6X3qG6ULj/DWfuTBm2E09fQdmeonERt17MDgPgaeS/Q3RW4W3
 HAMNnTLjsD2nTc2/8Klewfqlh5Cgs42VvGSJVTUwqCo9/SD02tbz4ffAAx/3bViS0Luk
 TiO9ZVKpGlUkEWiS0/wsNS2oKDiXsR1lZy6fvWykIBIEWo0BExlVgRWcw5y3E8Eac0fJ
 YpCRpxwWqs+VmQHvzMUwLjvc615lIoX2Ozbx4MuSY5Sa6T2IkrhPGYVv3CidzTB4oHUq
 RrJ0SsnEmAn2klVDCvdTE9c/wppAGa5+7E2dVO6VPHje7m9z187Ok4fb6mc5SUuBoTQa
 j3ag==
X-Gm-Message-State: APjAAAW1uF7jopmo8YukuDVgD3uOTvEGklsEu3ZwQ5ba3i2E9gs5WRH5
 hKhUGMbmcNGZ9HMY75fioSI=
X-Google-Smtp-Source: APXvYqxIHC/2YqEK+UQABaBLuXt/5IMlTmoNY9hegN4sDCywhXag5X7C9cpvDobmAP5hy3DJyHeDew==
X-Received: by 2002:adf:9cd0:: with SMTP id h16mr62175298wre.211.1560845235806; 
 Tue, 18 Jun 2019 01:07:15 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id s8sm19053617wra.55.2019.06.18.01.07.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 01:07:15 -0700 (PDT)
Subject: Re: [PATCH 201/459] drm/amdgpu: fix memory leak in preemption unit
 test
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20190617193106.18231-1-alexander.deucher@amd.com>
 <20190617193106.18231-2-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <065f7b53-b0ef-8659-fe14-51138a2dfefe@gmail.com>
Date: Tue, 18 Jun 2019 10:07:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617193106.18231-2-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ALIOZIHwzphwLi9yH5ycFu//67M2Lz3S70CzfdUMQIA=;
 b=sxtVfUtvecslxkhPWP8lH0ucwArX3SGbEqHTDqwPqbulQs+aOFTElMy5Dsd0ZNRvJb
 YWQrE/6lOebBP5SzUxX5SYUb8XJ76oPczCCnEA4CBF+8l3VuRbVE0HDPk/E10ZMjfECR
 Vkr7iiyqcpYco4U2OSn7PDVDajC/8Aw/OyUHMQbSZh3AqOW06u+XovrabxlP3jRN2R1k
 CLRJBnNLBRWr1HaQxawyB8C64ZSF+5bqVdRGvd6JnWkXanlG/ZaaHqTugDx9NyBS8uYr
 Ly5IhCdzQ3LFRG5h8H8Q7u6VAVbSU1mG7J64HPjF8Le3BmlHjuuHoWGFqGU9+kEP1trg
 xCcg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2FuIHByb2JhYmx5IGJlIHNxdWFzaGVkIGludG8gdGhlIG9yaWdpbmFsIGFkZGluZyBvZiB0aGUg
dW5pdCB0ZXN0LgoKQ2hyaXN0aWFuLgoKQW0gMTcuMDYuMTkgdW0gMjE6Mjkgc2NocmllYiBBbGV4
IERldWNoZXI6Cj4gRnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KPgo+IEl0IGZv
cmdvdCB0byBwdXQgam9iIGZlbmNlLCBjYXVzZWQgZmVuY2UgbWVtb3J5IGxlYWsuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQuY29tPgo+IFJldmlld2VkLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYyB8IDQgKysrLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCj4gaW5kZXggMjg2MTRkZDA1Zjg4Li40
OTk3ZWZhMDljZTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RlYnVnZnMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZWJ1Z2ZzLmMKPiBAQCAtOTY4LDEwICs5NjgsMTIgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2liX3By
ZWVtcHRfc2lnbmFsX2ZlbmNlcyhzdHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2VzLAo+ICAgc3RhdGlj
IHZvaWQgYW1kZ3B1X2liX3ByZWVtcHRfam9iX3JlY292ZXJ5KHN0cnVjdCBkcm1fZ3B1X3NjaGVk
dWxlciAqc2NoZWQpCj4gICB7Cj4gICAJc3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9iOwo+ICsJ
c3RydWN0IGRtYV9mZW5jZSAqZmVuY2U7Cj4gICAKPiAgIAlzcGluX2xvY2soJnNjaGVkLT5qb2Jf
bGlzdF9sb2NrKTsKPiAgIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KHNfam9iLCAmc2NoZWQtPnJpbmdf
bWlycm9yX2xpc3QsIG5vZGUpIHsKPiAtCQlzY2hlZC0+b3BzLT5ydW5fam9iKHNfam9iKTsKPiAr
CQlmZW5jZSA9IHNjaGVkLT5vcHMtPnJ1bl9qb2Ioc19qb2IpOwo+ICsJCWRtYV9mZW5jZV9wdXQo
ZmVuY2UpOwo+ICAgCX0KPiAgIAlzcGluX3VubG9jaygmc2NoZWQtPmpvYl9saXN0X2xvY2spOwo+
ICAgfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
