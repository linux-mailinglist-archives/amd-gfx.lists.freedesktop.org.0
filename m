Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688F3A644B
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 10:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0799E893C0;
	Tue,  3 Sep 2019 08:48:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD0B893C0
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 08:48:06 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g207so13153325wmg.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Sep 2019 01:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+WdgOxZ/NLQduG66Ovpjar1Ko+IPuzARDXQc0auxLho=;
 b=QOd6In8SrTynIED7OYOjhkZYM4v1Wcj5dL1DUHy4g3Wpp94dxDlKBLfb4eAG5FRMJm
 RNBDP+RW13eiNH+Styh4GkmMR2oFLQGn4QuZaJFc9i5PCJb1xt2HfcK1SYWbQq7RJAC8
 wtSb00oCQdE+RLa8qd1pn13MQrD3/3NWJap7RErlWV94hiAv2lnlEflVt+tY19XIQEt2
 3Nif7h8+gHk11TdI6U25x3i6NfjbSvcB+mstSAot6VM6QINZtcXDLyZgkatqmPiuGa74
 qoPyuXYLk8tkKkBjml0cM2flmXUiX/FkMhp+akKMRqt5d7CL7WMyeHrRdKsdJKhcbX3q
 RyEA==
X-Gm-Message-State: APjAAAVvQ/3IwLmOErwMvw2QLZffOx8fyV7C8jY49mc1rsV1TiJFV4Iu
 ko5OzzTUWppU+skNOShP1Ww=
X-Google-Smtp-Source: APXvYqzWDuCDUn6kdmt3zU6Nu4UZCBF08se9MeKWQHyp6pUEABAEyxkmDVs2P7mLxMwg6YOisTARWg==
X-Received: by 2002:a1c:a003:: with SMTP id j3mr41148584wme.42.1567500484928; 
 Tue, 03 Sep 2019 01:48:04 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g201sm19886437wmg.34.2019.09.03.01.48.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Sep 2019 01:48:04 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: change r type to int in gmc_v9_0_late_init
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Chen, Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>
References: <20190903084125.10698-1-tao.zhou1@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8e344b65-d9f8-5f0f-9afd-8566b051b594@gmail.com>
Date: Tue, 3 Sep 2019 10:48:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903084125.10698-1-tao.zhou1@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+WdgOxZ/NLQduG66Ovpjar1Ko+IPuzARDXQc0auxLho=;
 b=eDJ+IXQ7XBMbjMfJEU73oCh5XHR1ilJmv7F9pqrbwPrZTTxK5fa7+eXBaloYQ1+jPK
 4bZtcWVQCxDx1ohwohogVV6EgI2eoauqocoNlmSOKD5AVSmCl8YwqU7T93ScnYtRjJ+q
 VXfXHH/lAy8jzhlknt0JP8aE8cc4EHRsfvbYsq6cWnpQ/uPMIuKqZbMTA0YCgKkPm5qy
 3uGys3jk8wdTD/EQPCpK0pRSXtnXXlvELUQOjK6KYTJ2JmW1MoY0dkmRcjQZIRlnHtLH
 71RyGMm9bYVy0i+Ag23J2hX+lvSDVkmUX2PZNxJV06SjjqVTdOGOMibsRF2OAZNeHdU8
 pJPQ==
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

QW0gMDMuMDkuMTkgdW0gMTA6NDEgc2NocmllYiBaaG91MSwgVGFvOgo+IGNoYW5nZSByIHR5cGUg
ZnJvbSBib29sIHRvIGludCwgc3VpdGFibGUgZm9yIGJvdGggYm9vbCBhbmQgaW50IHJldHVybgo+
IHZhbHVlCj4KPiBTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+CgpS
ZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoK
PiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCAyICstCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwo+IGluZGV4IDBmZTI0OTQzZDUwZS4uZjE0MGE0
OTFhMmQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCj4gQEAgLTgz
MSw3ICs4MzEsNyBAQCBzdGF0aWMgaW50IGdtY192OV8wX2VjY19sYXRlX2luaXQodm9pZCAqaGFu
ZGxlKQo+ICAgc3RhdGljIGludCBnbWNfdjlfMF9sYXRlX2luaXQodm9pZCAqaGFuZGxlKQo+ICAg
ewo+ICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICopaGFuZGxlOwo+IC0JYm9vbCByOwo+ICsJaW50IHI7Cj4gICAKPiAgIAlpZiAoIWdtY192OV8w
X2tlZXBfc3RvbGVuX21lbW9yeShhZGV2KSkKPiAgIAkJYW1kZ3B1X2JvX2xhdGVfaW5pdChhZGV2
KTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
