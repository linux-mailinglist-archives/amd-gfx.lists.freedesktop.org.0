Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA30D4976
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 22:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9306EC96;
	Fri, 11 Oct 2019 20:51:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E016EC96
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 20:51:19 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id v52so15752688qtb.8
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 13:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oGKbty2Dvj0oVt2WCjvpFfXq9Z+6TnH8HhnviSK10m0=;
 b=VazUjjI+eDgHIroUnkoYguXNrotbUzSWutRgfw8TJSgOim1iT0Jm6dWfrTGaq+CAIo
 v8lhqH/HyjfZWPfbC0vm1hM2s7FEirPAvdQaPoEgDmRyRykWUuuoGD2oKCJSt15Tj3bP
 4rp2Es3Lf2F+A12uGV9k3ZUVf2MJE6KHbA2l81NGALVZFANa2K01w/kh02zyn6DS7eAj
 f3cH076QXZWMdbO5RKdmo1KF7j49BiPwJIuGEH8kav5TwpkslH/efdbXxuMHK812nIkD
 V+DTEBt4mU432jLWb+eGtTCELtoDbPyCnEm8QJKlFHWwMrpsPfchNEGqEMVaun0Tn7eK
 fxzw==
X-Gm-Message-State: APjAAAUtQhj+8+FxKO81UTUI3CZ0Iitk22aJwH+wiGLLYoHn2JxZvNKL
 c3IeVkseN72dnvtQ/JQoJuQ1hTt0
X-Google-Smtp-Source: APXvYqw8DahxAlH+faEVYQoO0iy4Yc9zhbUd5XEY5zO+qSgY6sHjT2ntV/GLcZQa9oNGRTDagVBh1w==
X-Received: by 2002:a0c:cdd0:: with SMTP id a16mr18307746qvn.160.1570827078027; 
 Fri, 11 Oct 2019 13:51:18 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id n21sm4841513qka.83.2019.10.11.13.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 13:51:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu/uvd7: fix allocation size in enc ring test
Date: Fri, 11 Oct 2019 15:50:50 -0500
Message-Id: <20191011205050.21021-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011205050.21021-1-alexander.deucher@amd.com>
References: <20191011205050.21021-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oGKbty2Dvj0oVt2WCjvpFfXq9Z+6TnH8HhnviSK10m0=;
 b=M8esc+TZWLWC8OvLooNy76EkGhb25VvSDrFwk0jL3S3oXezcNjWOwigpbRpdoXcvdD
 Fnc7LH2dX88w/pWNrQAnLO6GWHQaUxtzGD7XfDQFZ9+xDK/MXpwMvaf7d+ofmLM0SNzR
 boA40BEyXKY3Kj2nH6jCAuNSbHSYFnGSJiYqBe5CMmtKls7Mnv4NYsLMxy35NSaZfLsQ
 FnVVd6U3IkdPn/s6ZKcrw3MjZ6u1fT/QzCVBZDRUjip7g+X0hbEhWeofu22mLmflFb4l
 mQJAYqHdX2H59hip+XEnnCUNb4KqrHOY32IxIk+uZplZLH/LDfUDrHU0VwdYXYQw+Nth
 8kCQ==
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

V2UgbmVlZCB0byBhbGxvY2F0ZSBhIGxhcmdlIGVub3VnaCBidWZmZXIgZm9yIHRoZQpzZXNzaW9u
IGluZm8sIG90aGVyd2lzZSB0aGUgSUIgdGVzdCBjYW4gb3ZlcndyaXRlCm90aGVyIG1lbW9yeS4K
CkJ1ZzogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyNDEK
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92N18wLmMgfCA4ICsrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92N18wLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jCmluZGV4IDAxZjY1OGZhNzJjNi4uMGNlNmExZTdmZjc5
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92N18wLmMKQEAgLTIyMywxMiArMjIzLDEy
IEBAIHN0YXRpYyBpbnQgdXZkX3Y3XzBfZW5jX2dldF9jcmVhdGVfbXNnKHN0cnVjdCBhbWRncHVf
cmluZyAqcmluZywgdWludDMyX3QgaGFuZGxlCiAJdWludDY0X3QgZHVtbXk7CiAJaW50IGksIHI7
CiAKLQlyID0gYW1kZ3B1X2pvYl9hbGxvY193aXRoX2liKHJpbmctPmFkZXYsIGliX3NpemVfZHcg
KiA0LCAmam9iKTsKKwlyID0gYW1kZ3B1X2pvYl9hbGxvY193aXRoX2liKHJpbmctPmFkZXYsIChp
Yl9zaXplX2R3ICogNCkgKyAxMDI0LCAmam9iKTsKIAlpZiAocikKIAkJcmV0dXJuIHI7CiAKIAlp
YiA9ICZqb2ItPmlic1swXTsKLQlkdW1teSA9IGliLT5ncHVfYWRkciArIDEwMjQ7CisJZHVtbXkg
PSBpYi0+Z3B1X2FkZHIgKyAoaWJfc2l6ZV9kdyAqIDQpOwogCiAJaWItPmxlbmd0aF9kdyA9IDA7
CiAJaWItPnB0cltpYi0+bGVuZ3RoX2R3KytdID0gMHgwMDAwMDAxODsKQEAgLTI4NCwxMiArMjg0
LDEyIEBAIHN0YXRpYyBpbnQgdXZkX3Y3XzBfZW5jX2dldF9kZXN0cm95X21zZyhzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGhhbmRsCiAJdWludDY0X3QgZHVtbXk7CiAJaW50IGks
IHI7CiAKLQlyID0gYW1kZ3B1X2pvYl9hbGxvY193aXRoX2liKHJpbmctPmFkZXYsIGliX3NpemVf
ZHcgKiA0LCAmam9iKTsKKwlyID0gYW1kZ3B1X2pvYl9hbGxvY193aXRoX2liKHJpbmctPmFkZXYs
IChpYl9zaXplX2R3ICogNCkgKyAxMDI0LCAmam9iKTsKIAlpZiAocikKIAkJcmV0dXJuIHI7CiAK
IAlpYiA9ICZqb2ItPmlic1swXTsKLQlkdW1teSA9IGliLT5ncHVfYWRkciArIDEwMjQ7CisJZHVt
bXkgPSBpYi0+Z3B1X2FkZHIgKyAoaWJfc2l6ZV9kdyAqIDQpOwogCiAJaWItPmxlbmd0aF9kdyA9
IDA7CiAJaWItPnB0cltpYi0+bGVuZ3RoX2R3KytdID0gMHgwMDAwMDAxODsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
