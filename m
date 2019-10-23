Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AACFAE132E
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Oct 2019 09:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5166E97A;
	Wed, 23 Oct 2019 07:33:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7FA6E97A
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Oct 2019 07:33:06 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q70so12816538wme.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Oct 2019 00:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bV3orK3iQqEZcsjqiGieY5N7Aa83GvFP9wmRqSXq2ks=;
 b=t0J2V1IpFkUuPH/tM4VxDFOxZYqRccAjMPouhWbIKK8usZJTdyAjx0gMsCa9DiYv/L
 2Z8GmjXNu3HL0aBCrgeV5mmMklF7Kz6P7B1BtRM0lwXPrO7oBWKeNxtUA7cX0Fva87hy
 sfhOv/MZjUBB7VloSrAvgS0G0+0VJxIif3eU2Rq+OcCJXwnrNl5Oubin5cZNwGUuCv2u
 3jXb2wWOn6dqzLltYCHGapJHBjik4JqX1g+TyUIHBd9L6M6Vocgb3KCoW5Tf+5FxqlT0
 JwTU28DpSnbHnvPLqkQB5yLDHAEFJqi+W/YnVTg+Rfn5rCscvHPHt0puLWgqRCcQOE3M
 dDPQ==
X-Gm-Message-State: APjAAAVaLDN1sJ2VBS+6ueksjpTagZQYqX84yOOGG9sT1sA1tb5IT1Wq
 PiCMt9BST+LBW7pL7t4LNuuw5Mlg
X-Google-Smtp-Source: APXvYqxZnEyEcXjdGguji/DEN+0U1NddNDI5BTStrS2dZ+8j6lOcdnYqjbX8dQFfcJEjSmPSxoTivQ==
X-Received: by 2002:a05:600c:1007:: with SMTP id
 c7mr1887750wmc.41.1571815985053; 
 Wed, 23 Oct 2019 00:33:05 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z9sm20618573wrv.1.2019.10.23.00.33.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Oct 2019 00:33:04 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu/sdma5: do not execute 0-sized IBs (v2)
To: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20191022172136.15391-1-pierre-eric.pelloux-prayer@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b3ddc981-c465-b008-705a-d01e44b783e3@gmail.com>
Date: Wed, 23 Oct 2019 09:33:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191022172136.15391-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bV3orK3iQqEZcsjqiGieY5N7Aa83GvFP9wmRqSXq2ks=;
 b=TnBMBOjEMkXh02AVNpLn0PZgyH40t9PjpvGJUcy3tMsbWgmQN1ewErUyVncuG3x3mN
 QI8A3nnkXIxpt4d8ZdqWCyDdJ4cd9MHcv9rZM+KdFRUcNq+tfIxvUvGZMUfO1jr7G3/7
 IwJPtuMcwdbH/1tXlPgU4OP4ria4V26L4s3X7i8+9KiHP1IvUguSQpqvqptIbOFzwdqM
 6pB0gAAh5/MSF/ekeT1rDm/KosKDDUKAD06tqqO17fCP1ygEk1s5zNHv250msAD5noWs
 aw7hK4hdcRWqnd0u/vyghaC5JlRn2NVH9SOtaGAjrxdperXTfhzQ4NlEc9MJW+2k12XQ
 71xw==
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

QW0gMjIuMTAuMTkgdW0gMTk6MjIgc2NocmllYiBQZWxsb3V4LXByYXllciwgUGllcnJlLWVyaWM6
Cj4gVGhpcyBzZWVtcyB0byBoZWxwIHdpdGggaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9z
aG93X2J1Zy5jZ2k/aWQ9MTExNDgxLgo+Cj4gdjI6IGluc2VydCBhIE5PUCBpbnN0ZWFkIG9mIHNr
aXBwaW5nIGFsbCAwLXNpemVkIElCcyB0byBhdm9pZCBicmVha2luZyBvbGRlciBodwo+Cj4gU2ln
bmVkLW9mZi1ieTogUGllcnJlLUVyaWMgUGVsbG91eC1QcmF5ZXIgPHBpZXJyZS1lcmljLnBlbGxv
dXgtcHJheWVyQGFtZC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192MTBfMC5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCj4gaW5kZXggZmI0ODYyMmMyYWJk
Li42ZTFiMjViZDFmZTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3YxMF8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAu
Ywo+IEBAIC0zMDksNiArMzA5LDcgQEAgc3RhdGljIHZvaWQgZ21jX3YxMF8wX2ZsdXNoX2dwdV90
bGIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsCj4gICAKPiAgIAlq
b2ItPnZtX3BkX2FkZHIgPSBhbWRncHVfZ21jX3BkX2FkZHIoYWRldi0+Z2FydC5ibyk7Cj4gICAJ
am9iLT52bV9uZWVkc19mbHVzaCA9IHRydWU7Cj4gKwlqb2ItPmlicy0+cHRyW2pvYi0+aWJzLT5s
ZW5ndGhfZHcrK10gPSByaW5nLT5mdW5jcy0+bm9wOwo+ICAgCWFtZGdwdV9yaW5nX3BhZF9pYihy
aW5nLCAmam9iLT5pYnNbMF0pOwo+ICAgCXIgPSBhbWRncHVfam9iX3N1Ym1pdChqb2IsICZhZGV2
LT5tbWFuLmVudGl0eSwKPiAgIAkJCSAgICAgIEFNREdQVV9GRU5DRV9PV05FUl9VTkRFRklORUQs
ICZmZW5jZSk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
