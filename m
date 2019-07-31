Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866157B85E
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 05:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08ACC6E669;
	Wed, 31 Jul 2019 03:54:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15286E669
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 03:54:15 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v19so58470076wmj.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 20:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RTyT2mdEdm6BQJ1mZpXumFvodCwny9kz3XM+C/k7TXg=;
 b=pYWJpYWXXKOU4OQKFjZ+T90taT8ZxyjOjfmD6NH+q8WxlS0JqWhUgmGkHRnGTcuOoY
 p64ZS44dx+fn8wvdO5435AbGqki16BUJh3sbPgLQHjg+Lb0bu96bN7IYZCZxMxh59V3s
 NgdAjWYcRZbAeifGwPs0OFRPvJlwPVmkjwILam1hd1JniCgY/MoewUUVS/y7dKBZ4t3E
 B3a+CMC7OsOIhRUq/jJ8si5ktp+vdAHZ2ZY2BcQ7hYEn1wyXYfVSlFWw4rc6e7iAAYjv
 yAfEmcpCs2EsASuxJ4RzWIbzZLQWpzQd0GqR7iKH4PhYHfoetP/ulrKXZgUJ2S3O67tq
 P4nQ==
X-Gm-Message-State: APjAAAXWGZIOJK/eBBKNfFQMeFGKfT62Yu6fmUTglltAdUBe2i4uuQa7
 0C0svDVx4ddoAxa+8loYE9at1BXh8gMvQJC5dS4jYg==
X-Google-Smtp-Source: APXvYqzQmEm2ZqZyV4RI5EPkNWbpLqkJuM2/CB6Zj9EzOHJeVt9AkDai/zN+7VPhm54izj8An3ls2D/DvdiSueIeLe0=
X-Received: by 2002:a1c:9e90:: with SMTP id
 h138mr111800300wme.67.1564545254441; 
 Tue, 30 Jul 2019 20:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190726191615.20351-1-alexander.deucher@amd.com>
 <20190726191615.20351-2-alexander.deucher@amd.com>
In-Reply-To: <20190726191615.20351-2-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 30 Jul 2019 23:54:02 -0400
Message-ID: <CADnq5_O2zietHydanh4PM2bFtJfQjBnUg9At1iy5WbTpovCkKQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdkfd: enable KFD support for navi14
To: amd-gfx list <amd-gfx@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RTyT2mdEdm6BQJ1mZpXumFvodCwny9kz3XM+C/k7TXg=;
 b=bAauXTq+MdbKQU5JOOGAKUQrJlcSs54E8DsAtgT5/8lmEMXpUOzcEwFbhtrGpKU70n
 BTvAU06UoBjan3RIrxVhcyLOU7Dspua1QE//nXiBL+H5rAWGlg00FO+xQ5xKxV2u0/75
 eWB6mTo7tsrL+Y5KlVK+BQRQnbLANup8tZzkG6PfCP0OF3WgQopQ56UwK1/T1n7iiAII
 e7hkq0vKRRe1wFNalD0jpFz3tXylnco8tdmFgg2V0CQat0OpThd/Wd7R/tkHZBiFml/v
 KUqKnTmY3n/gcyvHb8Rta+HJeX+eOPh/K5L9S83Uanay7bZQGNuSEoiM6jPFoj52+GTc
 wzVA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGluZz8KCk9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDM6MTYgUE0gQWxleCBEZXVjaGVyIDxhbGV4
ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gU2FtZSBhcyBuYXZpMTAuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyB8IDEgKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkLmMKPiBpbmRleCBmMDUyYzcwZTQ2NTkuLjk3ZjdjNTIzNWNjOSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMKPiBAQCAtOTEs
NiArOTEsNyBAQCB2b2lkIGFtZGdwdV9hbWRrZmRfZGV2aWNlX3Byb2JlKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQo+ICAgICAgICAgICAgICAgICBrZmQya2dkID0gYW1kZ3B1X2FtZGtmZF9h
cmN0dXJ1c19nZXRfZnVuY3Rpb25zKCk7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAg
ICAgY2FzZSBDSElQX05BVkkxMDoKPiArICAgICAgIGNhc2UgQ0hJUF9OQVZJMTQ6Cj4gICAgICAg
ICAgICAgICAgIGtmZDJrZ2QgPSBhbWRncHVfYW1ka2ZkX2dmeF8xMF8wX2dldF9mdW5jdGlvbnMo
KTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBkZWZhdWx0Ogo+IC0tCj4gMi4y
MC4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
