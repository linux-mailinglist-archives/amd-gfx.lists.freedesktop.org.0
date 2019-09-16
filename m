Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1609B4122
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 21:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D90F6EA59;
	Mon, 16 Sep 2019 19:28:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439DA6EA56
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 19:28:24 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p7so570953wmp.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 12:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ErSJETEfywuQZVfYFOk/nId5oDWpj3JaN61T2nO314g=;
 b=GVUDyvUnRkNeKLK/pgdVoOrc4pu7I9HiGAVs00sbZqKgUIJrxG5g6NdQ4AdekZeYXC
 tjxbolsLlRA8S/3U8z9N/M9NLGAXsWJSoswqBilnnw40Cw0zZ/lS9YUg8OePvziyyYr3
 3F49jzXgYWBHXpY5U3lK//Dws/sLHGCHHmNrqZvoLJdeeDTmzUaJiW3Vo435nMi/XAgg
 KECJAaFWZVUH58VNCb5ZPFo6n3/MOFr1X3A7wHg5lN171Znz8b761biX+gsgWsFa6fxb
 DiNAKNa5xlAxTl5CdB3sjP5FxJQN/8Rz6wXcnd/zCNr0epCsyaH8+mdta8LBK1Um7zjh
 eBvA==
X-Gm-Message-State: APjAAAXroVZjJEIS6sa14PwLBaDE+ZRk4Vqeu/cfaaLPoTZmbJrlILKw
 tYFY5hCh3lAoIjSHOCWSui8=
X-Google-Smtp-Source: APXvYqw1yXVLZjvkOFfBwsxwUSAlJZpqemfbA2wtlaRUniq7kl+hBa9Kfi6IGCPMPF+FozuPfYcThg==
X-Received: by 2002:a05:600c:290c:: with SMTP id
 i12mr505998wmd.77.1568662102949; 
 Mon, 16 Sep 2019 12:28:22 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id q124sm88276wma.5.2019.09.16.12.28.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 12:28:22 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu/vm: fix documentation for amdgpu_vm_bo_param
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20190916182228.11860-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3bac65c9-b80c-944e-9197-784039e92ff2@gmail.com>
Date: Mon, 16 Sep 2019 21:28:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916182228.11860-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ErSJETEfywuQZVfYFOk/nId5oDWpj3JaN61T2nO314g=;
 b=FsS5TzTkb9pKSX1yVIrF+0N6BqPAiI2WFJKoHn2Wq0GO9XhnSHOhzb/td9p6t9Vbdp
 z1lb1/4nHz1UMgvYn5Zg3tPs3Un1lj9ZWwfEsR12oZxVE2RAPgitEedcBTU1+7IRsqsy
 bFHFMpooFqW14gztDuYgRQW8eFSsuO3f2n2PFAK+kd7ZhOdmdmzAr+OQ5FDs29YLEgJN
 nyDlCckW5rX7/yHkgWYPLC4GTw/hXPnMOUOnoRpHc2NNlYPw5bv7X1pQiSUfmw4BUATQ
 dQn1/uUzSl1IyA+S3WBRIqpI2BdLmymSaR+uQ9DvDXAMdZN6Z43WKfdMln09gZcJe1SY
 ik/A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTYuMDkuMTkgdW0gMjA6MjIgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gQWRkIG5ldyBwYXJh
bWV0ZXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dm0uYyB8IDIgKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4gaW5kZXggZjExNzVmOWY0YjgwLi41NDU0
OWEyNmVlMDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+IEBA
IC04MjUsNiArODI1LDggQEAgc3RhdGljIGludCBhbWRncHVfdm1fY2xlYXJfYm8oc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAgKgo+ICAgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9p
bnRlcgo+ICAgICogQHZtOiByZXF1ZXN0aW5nIHZtCj4gKyAqIEBsZXZlbDogdGhlIHBhZ2UgdGFi
bGUgbGV2ZWwKPiArICogQGRpcmVjdDogdXNlIGEgZGlyZWN0IHVwZGF0ZQo+ICAgICogQGJwOiBy
ZXN1bHRpbmcgQk8gYWxsb2NhdGlvbiBwYXJhbWV0ZXJzCj4gICAgKi8KPiAgIHN0YXRpYyB2b2lk
IGFtZGdwdV92bV9ib19wYXJhbShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFt
ZGdwdV92bSAqdm0sCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
