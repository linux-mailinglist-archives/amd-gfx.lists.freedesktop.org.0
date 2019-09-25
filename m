Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB7BBDE65
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 14:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B488E6EBAD;
	Wed, 25 Sep 2019 12:58:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F876EBB7
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 12:58:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h7so6838945wrw.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 05:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OAGNU5uZnwER86U7havac0lAB6vGPDeU/W0k4GHJOvc=;
 b=DdRMToljc1MDlT2vzfg7hoLoNBqtKadNhKa2N0ES0FukPsSg3KwnzDvwmz9qSLf8ep
 6dZxDA0eKSyiYAkERz+Ci4efx6POg1UbGGjFL4O0X5Z6Qir9X3xGWKTKqgcxWJJPT+6c
 f9TvntXHOZfWOAMYbS3Zlzku4OPEPKM62yhN/jZ9hrSHAZzjNGbmvqNJBimlRk6TG87q
 kS1/4wUed1up3OhMg46Cd+cwPPYZQ47+Z10SkmBTcShqFKvVWOCGJf/+LrYexq1ymW1I
 sOdaCkyyefPucoMik80WUtweNL2hkgvS6ERceU+YDDTykNR57VVAu4UrfsBHxpwki3pb
 LUYQ==
X-Gm-Message-State: APjAAAXTwRSmWRKccpOXTl1TTwDmRrZrCJgWSxSVM5ZHuBc5mKko/oKL
 QNvgLfrSmkXXPfzowoWTgPQPYWU0
X-Google-Smtp-Source: APXvYqx1o2MHQGw7P3n14j+qBZ0c2FnlQRXmnfhWUG5vuCld1Fw+BTrfi2Mjrts/1JQf3a4lu2AwgA==
X-Received: by 2002:adf:ef8d:: with SMTP id d13mr2514956wro.31.1569416300215; 
 Wed, 25 Sep 2019 05:58:20 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id s19sm10728059wrb.14.2019.09.25.05.58.19
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 05:58:19 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix error handling in amdgpu_bo_list_create
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: amd-gfx@lists.freedesktop.org
References: <20190918174308.107845-1-christian.koenig@amd.com>
Message-ID: <cb86989c-a9ab-0bb0-0570-fac840cb038b@gmail.com>
Date: Wed, 25 Sep 2019 14:58:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918174308.107845-1-christian.koenig@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=OAGNU5uZnwER86U7havac0lAB6vGPDeU/W0k4GHJOvc=;
 b=dTTyFV5URTsUjqGQ50ue+KneBriEdZgXl0zcnSWmlRJfjfgfxCnWCXAnRQM7Mfd2MJ
 gLBWdct8Prv9CEQxUif2bXvWBbcCqxroJQlpKDvIUjigYTp0Rxbe2YNxY6QJpBkWdhXF
 7XDt9sxafPgjE0sVxmQ3G5wgbQUfb20cXozzbMNusPXEGO3d7FCvZrXgVfrGwsxJdCWc
 96A1JIg1JYJ6ls3Bs0Um6d/dzChiJi9zYmZzQFLCeluGX6nNYXRz35RUchEV8Myb3wn/
 KJw3cTOa2JyO9OYTUkjlWVt0zeGH4A6tJgShUTddz5bWfym5VjkjJJCe5DFJ4IxScNRW
 hBBQ==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGluZz8gQ2FuIEkgZ2V0IGF0IGxlYXN0IGFuZCBhY2tlZC1ieSBmb3IgdGhpcz8KClRoYW5rcywK
Q2hyaXN0aWFuLgoKQW0gMTguMDkuMTkgdW0gMTk6NDMgc2NocmllYiBDaHJpc3RpYW4gS8O2bmln
Ogo+IFdlIG5lZWQgdG8gZHJvcCBub3JtYWwgYW5kIHVzZXJwdHIgQk9zIHNlcGFyYXRlbHkuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5j
IHwgNyArKysrKystCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2JvX2xpc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmMK
PiBpbmRleCBkNDk3NDY3YjdmYzYuLjk0OTA4YmYyNjlhNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuYwo+IEBAIC0xMzksNyArMTM5LDEyIEBAIGlu
dCBhbWRncHVfYm9fbGlzdF9jcmVhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVj
dCBkcm1fZmlsZSAqZmlscCwKPiAgIAlyZXR1cm4gMDsKPiAgIAo+ICAgZXJyb3JfZnJlZToKPiAt
CXdoaWxlIChpLS0pIHsKPiArCWZvciAoaSA9IDA7IGkgPCBsYXN0X2VudHJ5OyArK2kpIHsKPiAr
CQlzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IHR0bV90b19hbWRncHVfYm8oYXJyYXlbaV0udHYuYm8p
Owo+ICsKPiArCQlhbWRncHVfYm9fdW5yZWYoJmJvKTsKPiArCX0KPiArCWZvciAoaSA9IGZpcnN0
X3VzZXJwdHI7IGkgPCBudW1fZW50cmllczsgKytpKSB7Cj4gICAJCXN0cnVjdCBhbWRncHVfYm8g
KmJvID0gdHRtX3RvX2FtZGdwdV9ibyhhcnJheVtpXS50di5ibyk7Cj4gICAKPiAgIAkJYW1kZ3B1
X2JvX3VucmVmKCZibyk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
