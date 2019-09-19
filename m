Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E75B74D7
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 10:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B0B6FB4B;
	Thu, 19 Sep 2019 08:14:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BB46FB4B
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 08:14:28 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a6so3213109wma.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 01:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7KFSReW6Jzb7bQCMjTE6ZOZCpyI43aKmvsQGensGHpE=;
 b=k8vRgoiY/tbrS1sYGlSGNxKEUHelSG05lCD/uN9QUMh8umrAspvuRuKebwdAoyiTon
 7i3hoYDBdSw8pBM2ZbI8WsstiNnTS8IVsDvsBur+t5dS/tkcaEL5oFYG81nKNTHgHhuN
 sCuAbARGoEnEzSl0JmXNZhqoMAjv+4DwJMF3FojwKswQbyVwPiU2CwfG0RLQrG3djTbc
 YjgHXN3AfOWwb3zqHRe2EBIZiLAngbJmiqK20JwP4DeHySnM6LyJ1W1lej/tOwRPhTQq
 GSP1anLnU/ZHGc8+OrvZdD1zcMmjOwwz7tFs55Ux8zC7WdIsTJ8+Dtyw22Z1Ly8tSUMM
 EUrA==
X-Gm-Message-State: APjAAAXr5F89jUHOxlMMazmNPUr0kkHfd0VsfUb18AotDHycWbGZpS4Y
 ZnisN6KMvrRGNBzLdqCZa8DiDxk7
X-Google-Smtp-Source: APXvYqx/Nwldbqc+GSfy4317nnl/3O79ffnkCdxqMxLCqdXUAPRcjyZKFQHwn34WEFxQK3hsr5A9Uw==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr1785074wmi.39.1568880867249; 
 Thu, 19 Sep 2019 01:14:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z1sm15501893wre.40.2019.09.19.01.14.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Sep 2019 01:14:26 -0700 (PDT)
Subject: Re: [PATCH v4] drm/amd/amdgpu:Fix compute ring unable to detect hang.
To: Jesse Zhang <zhexi.zhang@amd.com>, amd-gfx@lists.freedesktop.org
References: <1568876935-18731-2-git-send-email-zhexi.zhang@amd.com>
 <1568880041-19830-1-git-send-email-zhexi.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <11780781-0649-f4c4-ec34-7823a9bbdce0@gmail.com>
Date: Thu, 19 Sep 2019 10:14:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568880041-19830-1-git-send-email-zhexi.zhang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=7KFSReW6Jzb7bQCMjTE6ZOZCpyI43aKmvsQGensGHpE=;
 b=nbIwH8UjOebhRyWQwT0jdLDKS2TGPmkLl9mg9dyUPbQ3BPQeI11HnmV+38PC1ZzPfr
 RrldPGanAQDn2j4zAZpGhBuJGitG3Y9zq20baomQIJnuj5tBYK6NxLXXWIuG+1HbqkqI
 0vh5JAaB1AerVF7wmx+8ifge2Slhlt+CI3l+zH5wAAPIstMegYsZ5z9zD/jifR6QcXw6
 HuF+iZJhCI6DtnaTZi+sl8/Hx7YpDB878onnCIw7APL8be5+6fH/je/o+4DrlVXfpzWH
 lwmViibbyrWWQIVHnzKeGVnZ+kttWmuY4vg134cMXJpg4DTXyYg6xc80rghyy6Edt7xs
 FfcQ==
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

QW0gMTkuMDkuMTkgdW0gMTA6MDAgc2NocmllYiBKZXNzZSBaaGFuZzoKPiBXaGVuIGNvbXB1dGUg
ZmVuY2UgZGlkIG5vdCBzaWduYWwsIGNvbXB1dGUgcmluZyBjYW5ub3QgZGV0ZWN0IGhhcmR3YXJl
Cj4gaGFuZyBiZWNhdXNlIGl0cyB0aW1lb3V0IHZhbHVlIGlzIHNldCB0byBiZSBpbmZpbml0ZSBi
eSBkZWZhdWx0Lgo+Cj4gSW4gU1ItSU9WIGFuZCBwYXNzdGhyb3VnaCBtb2RlLCBpZiB1c2VyIGRv
ZXMgbm90IGRlY2xhcmUgY3VzdG9tZSB0aW1lb3V0Cj4gdmFsdWUgZm9yIGNvbXB1dGUgcmluZywg
dGhlbiB1c2UgZ2Z4IHJpbmcgdGltZW91dCB2YWx1ZSBhcyBkZWZhdWx0LiBTbwo+IHRoYXQgd2hl
biB0aGVyZSBpcyBhIHR1cmUgaGFyZHdhcmUgaGFuZywgY29tcHV0ZSByaW5nIGNhbiBkZXRlY3Qg
aXQuCj4KPiBDaGFuZ2UtSWQ6IEk3OTRlYzA4NjhjNmMwYWFkNDA3NzQ5NDU3MjYwZWNmZWUwNjE3
YzEwCj4gU2lnbmVkLW9mZi1ieTogSmVzc2UgWmhhbmcgPHpoZXhpLnpoYW5nQGFtZC5jb20+Cj4g
LS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYyB8ICA1ICst
LS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jICAgICAgICB8IDEwICsr
KysrKysrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZmVuY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jCj4gaW5k
ZXggY2JjYWE3Yy4uOTYzYjZkMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZmVuY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9mZW5jZS5jCj4gQEAgLTQ2OCwxMCArNDY4LDcgQEAgaW50IGFtZGdwdV9mZW5jZV9kcml2
ZXJfaW5pdF9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywKPiAgIAkJCSAqIEZvciBzcmlv
diBjYXNlLCBhbHdheXMgdXNlIHRoZSB0aW1lb3V0Cj4gICAJCQkgKiBhcyBnZnggcmluZwo+ICAg
CQkJICovCgpQbGVhc2UgYWxzbyByZW1vdmUgdGhlIGNvbW1lbnQgc2luY2UgdGhhdCBpcyBub3cg
c3RhbGUuCgpBcGFydCBmcm9tIHRoYXQgbG9va3MgZ29vZCB0byBtZSwKQ2hyaXN0aWFuLgoKPiAt
CQkJaWYgKCFhbWRncHVfc3Jpb3ZfdmYocmluZy0+YWRldikpCj4gLQkJCQl0aW1lb3V0ID0gYWRl
di0+Y29tcHV0ZV90aW1lb3V0Owo+IC0JCQllbHNlCj4gLQkJCQl0aW1lb3V0ID0gYWRldi0+Z2Z4
X3RpbWVvdXQ7Cj4gKwkJCXRpbWVvdXQgPSBhZGV2LT5jb21wdXRlX3RpbWVvdXQ7Cj4gICAJCQli
cmVhazsKPiAgIAkJY2FzZSBBTURHUFVfUklOR19UWVBFX1NETUE6Cj4gICAJCQl0aW1lb3V0ID0g
YWRldi0+c2RtYV90aW1lb3V0Owo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwo+IGluZGV4
IDdjN2U5ZjUuLjZjZDU1NDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc29jMTUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKPiBA
QCAtNjg3LDYgKzY4NywxNiBAQCBpbnQgc29jMTVfc2V0X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKPiAgIAlhZGV2LT5yZXZfaWQgPSBzb2MxNV9nZXRfcmV2X2lkKGFkZXYp
Owo+ICAgCWFkZXYtPm5iaW8uZnVuY3MtPmRldGVjdF9od192aXJ0KGFkZXYpOwo+ICAgCj4gKwkv
Kgo+ICsJICogSWYgcnVubmluZyB1bmRlciBTUi1JT1Ygb3IgcGFzc3Rocm91Z2ggbW9kZSBhbmQg
dXNlciBkaWQgbm90IHNldAo+ICsJICogY3VzdG9tIHZhbHVlIGZvciBjb21wdXRlIHJpbmcgdGlt
ZW91dCwgc2V0IHRpbWVvdXQgdG8gYmUgdGhlIHNhbWUKPiArCSAqIGFzIGdmeCByaW5nIHRpbWVv
dXQgdG8gYXZvaWQgY29tcHV0ZSByaW5nIGNhbm5vdCBkZXRlY3QgYW4gdHJ1ZQo+ICsJICogaGFu
Zy4KPiArCSAqLwo+ICsJaWYgKChhbWRncHVfc3Jpb3ZfdmYoYWRldikgfHwgYW1kZ3B1X3Bhc3N0
aHJvdWdoKGFkZXYpKSAmJgo+ICsJCShhZGV2LT5jb21wdXRlX3RpbWVvdXQgPT0gTUFYX1NDSEVE
VUxFX1RJTUVPVVQpKQo+ICsJCWFkZXYtPmNvbXB1dGVfdGltZW91dCA9IGFkZXYtPmdmeF90aW1l
b3V0Owo+ICsKPiAgIAlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQo+ICAgCQlhZGV2LT52aXJ0
Lm9wcyA9ICZ4Z3B1X2FpX3ZpcnRfb3BzOwo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
