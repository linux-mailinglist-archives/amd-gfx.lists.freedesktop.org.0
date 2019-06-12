Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4A041E77
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 10:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB84189301;
	Wed, 12 Jun 2019 08:00:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2649389301
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 08:00:27 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n4so15728018wrw.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 01:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BImEMH1pYowaPxksVHHWVHnDx4fQ32rcWtt5S32IAOU=;
 b=eVnRFMe1mR/5zSGb1fGKpw/jrZJafMYaVUxDhpFVWTYhEm5XLcfCn8vY0oyoawwnKM
 +eTy+TtdUPoHQ4SEpDrFjJ8Q4DixPnTsX5Ml3COe/nvLlZReNAjVVtnnkpsXAtOsD62h
 Uveux3lYkOs0Sr3i8j7/YUl2TmNw7WNh45we9p26Gpx7Yz4521Fvy87dEVgPOEHcnUX3
 50o2C58xwiAtDoUMmsK74VerCe9qLWcWm4h44Gtlqxa/y9m0VC5psSCFE5q/8ZZYxq5M
 rJyNhUTJKK+ADbDD2IN+5ikUmfzxGHZBEzux50MoDbkdmuwCtGgYIMXvphoMh8eidgxE
 GeKQ==
X-Gm-Message-State: APjAAAVrFqIbo/3+MsNduytQzDdy0dv82o7ESuteKy4piMgAu2OkOqGd
 /FQ8ImwENhzjXLh4exJY9KIR7NTb
X-Google-Smtp-Source: APXvYqzooFx96QfN6X5B7A57ltT7sBYEHWuZxUWSYd3dnmWhIATex+8tdvrfB4SbqMPTwQ4LY4I03Q==
X-Received: by 2002:a5d:65c5:: with SMTP id e5mr1368557wrw.266.1560326425621; 
 Wed, 12 Jun 2019 01:00:25 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b2sm23330752wrp.72.2019.06.12.01.00.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 01:00:25 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/amdgpu: Bail out of BO node creation if not
 enough VRAM (v2)
To: "StDenis, Tom" <Tom.StDenis@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190611165444.17841-1-tom.stdenis@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0acbd9ae-65bc-52f6-df7e-b7f0c169ea6c@gmail.com>
Date: Wed, 12 Jun 2019 10:00:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611165444.17841-1-tom.stdenis@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=BImEMH1pYowaPxksVHHWVHnDx4fQ32rcWtt5S32IAOU=;
 b=UpZtEu/xeBRdyPrYiA+6e5PUpaINpKTfJyYB8dpg+Zxdo0wut2eF09TbdDdS56Cd6f
 qlulfkp4KFmlbnzZxXH0dWfqSrnBtiINEcJr9aYPWPwKfZwUgbu0un3GYja6fQ1r0+Nq
 +JAxpDC+5Zdl4L3KMZ/A5UYTTWl1sr2gAnvGNchySVJon5hYJezV5P/prYJn7BESuM8+
 fqVRoyfmd8KkIOiQt2wEFxEmKqecPFZx2Gp5uOYSrsgYtTpdPILq/66rWYiZii1HA5B/
 EAZIZbPNvvRDXjZo3FDPyFVKE/cuan0vRBYEA7Q8x3HH3J+2KM4ILbDtdV7ezKoPWJRu
 vqew==
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

QW0gMTEuMDYuMTkgdW0gMTg6NTQgc2NocmllYiBTdERlbmlzLCBUb206Cj4gKHYyKTogUmV0dXJu
IDAgYW5kIHNldCBtZW0tPm1tX25vZGUgdG8gTlVMTC4KPgo+IFNpZ25lZC1vZmYtYnk6IFRvbSBT
dCBEZW5pcyA8dG9tLnN0ZGVuaXNAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIHwgMTggKysrKysrKysrKysrKy0tLS0tCj4gICAx
IGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCj4gaW5kZXggOGFlYTJm
MjFiMjAyLi5jMjczMGU1YzEwODEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdnJhbV9tZ3IuYwo+IEBAIC0yNzYsNyArMjc2LDcgQEAgc3RhdGljIGludCBhbWRn
cHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+ICAgCXN0
cnVjdCBkcm1fbW1fbm9kZSAqbm9kZXM7Cj4gICAJZW51bSBkcm1fbW1faW5zZXJ0X21vZGUgbW9k
ZTsKPiAgIAl1bnNpZ25lZCBsb25nIGxwZm4sIG51bV9ub2RlcywgcGFnZXNfcGVyX25vZGUsIHBh
Z2VzX2xlZnQ7Cj4gLQl1aW50NjRfdCB1c2FnZSA9IDAsIHZpc191c2FnZSA9IDA7Cj4gKwl1aW50
NjRfdCB2aXNfdXNhZ2UgPSAwOwo+ICAgCXVuc2lnbmVkIGk7Cj4gICAJaW50IHI7Cj4gICAKPiBA
QCAtMjg0LDYgKzI4NCwxNCBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21ncl9uZXcoc3RydWN0
IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sCj4gICAJaWYgKCFscGZuKQo+ICAgCQlscGZuID0g
bWFuLT5zaXplOwo+ICAgCj4gKwkvKiBiYWlsIG91dCBxdWlja2x5IGlmIHRoZXJlJ3MgbGlrZWx5
IG5vdCBlbm91Z2ggVlJBTSBmb3IgdGhpcyBCTyAqLwo+ICsJYXRvbWljNjRfYWRkKG1lbS0+bnVt
X3BhZ2VzIDw8IFBBR0VfU0hJRlQsICZtZ3ItPnVzYWdlKTsKPiArCWlmIChhdG9taWM2NF9yZWFk
KCZtZ3ItPnVzYWdlKSA+IGFkZXYtPmdtYy5tY192cmFtX3NpemUpIHsKCllvdSBzaG91bGQgdXNl
IGF0b21pYzY0X2FkZF9yZXR1cm4gaGVyZSBpbnN0ZWFkIG9mIHR3byBvcGVyYXRpb25zLiAKT3Ro
ZXJ3aXNlIHVzaW5nIGFuIGF0b21pYyBkb2Vzbid0IG1ha2UgdG8gbXVjaCBzZW5zZS4KCkNocmlz
dGlhbi4KCj4gKwkJYXRvbWljNjRfc3ViKG1lbS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsICZt
Z3ItPnVzYWdlKTsKPiArCQltZW0tPm1tX25vZGUgPSBOVUxMOwo+ICsJCXJldHVybiAwOwo+ICsJ
fQo+ICsKPiAgIAlpZiAocGxhY2UtPmZsYWdzICYgVFRNX1BMX0ZMQUdfQ09OVElHVU9VUykgewo+
ICAgCQlwYWdlc19wZXJfbm9kZSA9IH4wdWw7Cj4gICAJCW51bV9ub2RlcyA9IDE7Cj4gQEAgLTMw
MCw4ICszMDgsMTAgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1f
bWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+ICAgCj4gICAJbm9kZXMgPSBrdm1hbGxvY19hcnJheSgo
dWludDMyX3QpbnVtX25vZGVzLCBzaXplb2YoKm5vZGVzKSwKPiAgIAkJCSAgICAgICBHRlBfS0VS
TkVMIHwgX19HRlBfWkVSTyk7Cj4gLQlpZiAoIW5vZGVzKQo+ICsJaWYgKCFub2Rlcykgewo+ICsJ
CWF0b21pYzY0X3N1YihtZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZULCAmbWdyLT51c2FnZSk7
Cj4gICAJCXJldHVybiAtRU5PTUVNOwo+ICsJfQo+ICAgCj4gICAJbW9kZSA9IERSTV9NTV9JTlNF
UlRfQkVTVDsKPiAgIAlpZiAocGxhY2UtPmZsYWdzICYgVFRNX1BMX0ZMQUdfVE9QRE9XTikKPiBA
QCAtMzIxLDcgKzMzMSw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3Qg
dHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPiAgIAkJaWYgKHVubGlrZWx5KHIpKQo+ICAgCQkJ
YnJlYWs7Cj4gICAKPiAtCQl1c2FnZSArPSBub2Rlc1tpXS5zaXplIDw8IFBBR0VfU0hJRlQ7Cj4g
ICAJCXZpc191c2FnZSArPSBhbWRncHVfdnJhbV9tZ3JfdmlzX3NpemUoYWRldiwgJm5vZGVzW2ld
KTsKPiAgIAkJYW1kZ3B1X3ZyYW1fbWdyX3ZpcnRfc3RhcnQobWVtLCAmbm9kZXNbaV0pOwo+ICAg
CQlwYWdlc19sZWZ0IC09IHBhZ2VzOwo+IEBAIC0zNDEsMTQgKzM1MCwxMiBAQCBzdGF0aWMgaW50
IGFtZGdwdV92cmFtX21ncl9uZXcoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sCj4g
ICAJCWlmICh1bmxpa2VseShyKSkKPiAgIAkJCWdvdG8gZXJyb3I7Cj4gICAKPiAtCQl1c2FnZSAr
PSBub2Rlc1tpXS5zaXplIDw8IFBBR0VfU0hJRlQ7Cj4gICAJCXZpc191c2FnZSArPSBhbWRncHVf
dnJhbV9tZ3JfdmlzX3NpemUoYWRldiwgJm5vZGVzW2ldKTsKPiAgIAkJYW1kZ3B1X3ZyYW1fbWdy
X3ZpcnRfc3RhcnQobWVtLCAmbm9kZXNbaV0pOwo+ICAgCQlwYWdlc19sZWZ0IC09IHBhZ2VzOwo+
ICAgCX0KPiAgIAlzcGluX3VubG9jaygmbWdyLT5sb2NrKTsKPiAgIAo+IC0JYXRvbWljNjRfYWRk
KHVzYWdlLCAmbWdyLT51c2FnZSk7Cj4gICAJYXRvbWljNjRfYWRkKHZpc191c2FnZSwgJm1nci0+
dmlzX3VzYWdlKTsKPiAgIAo+ICAgCW1lbS0+bW1fbm9kZSA9IG5vZGVzOwo+IEBAIC0zNTksNiAr
MzY2LDcgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5
cGVfbWFuYWdlciAqbWFuLAo+ICAgCXdoaWxlIChpLS0pCj4gICAJCWRybV9tbV9yZW1vdmVfbm9k
ZSgmbm9kZXNbaV0pOwo+ICAgCXNwaW5fdW5sb2NrKCZtZ3ItPmxvY2spOwo+ICsJYXRvbWljNjRf
c3ViKG1lbS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsICZtZ3ItPnVzYWdlKTsKPiAgIAo+ICAg
CWt2ZnJlZShub2Rlcyk7Cj4gICAJcmV0dXJuIHIgPT0gLUVOT1NQQyA/IDAgOiByOwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
