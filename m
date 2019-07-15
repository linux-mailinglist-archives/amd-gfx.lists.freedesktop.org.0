Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A83D69E10
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CC089E33;
	Mon, 15 Jul 2019 21:25:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5711389E2A
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:12 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s145so12858620qke.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+3LTCxXa4frlYsj3y6B5xZKqSlYCQ+LQXUd50X/SQuI=;
 b=fuHKs7YypW+E+B+9QcuYqEnm2/enAknmHCHwIVQJ0TuVCC5Hw0nihyXnP+NJceLTOE
 4O+Ru9Tly1ebmPP3lxM7GK1XfUzKYzbQ840YiflT/Js2W2921Qx9QECiZgq+2yJ8afgC
 vnYpWIMTSVfEt9o3/2OeT6911QND3H/phEw4WjDK3WtSNN4Vl9Szsr4g8Vmw3mUib5UE
 0rs5tTPomsJdu9VaKvAM44gVKPWdgAwIFE9GaffiKAxxvbXrQ2wPzhrWdKXuQ60hnmlY
 2rcHOGPbr1XdiztCjmVo9fyaqllQoalX4bu+EO39+eIo0b1IN8bZzxeooMZVGrS5toA1
 t/nA==
X-Gm-Message-State: APjAAAVYbGCwZN8AH7r5WqYFuBv6SqE8+iaoGAQ+vwHTlrIkPEYv3FMa
 T9MgoiX5/jPBCXCCMVPhCNUJc27w
X-Google-Smtp-Source: APXvYqz25cObePsyqb12jMGn6cgU50Py6tW4qF32wt3v3DM5WdKoYJgs5WKJfE8ha03QS/LDtjwE+Q==
X-Received: by 2002:a37:4ac3:: with SMTP id
 x186mr17904160qka.138.1563225911273; 
 Mon, 15 Jul 2019 14:25:11 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:10 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 030/102] drm/amdgpu: skip pasid mapping for second mmhub on
 Arcturus
Date: Mon, 15 Jul 2019 16:23:25 -0500
Message-Id: <20190715212437.31793-28-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+3LTCxXa4frlYsj3y6B5xZKqSlYCQ+LQXUd50X/SQuI=;
 b=B5V09jtl1t3tFNLFWF3tGVn/2ySvo0kTX0/C7Z9qb2gJcibebLWi8pVla5WsyNhRCt
 awc9c1ozIeTd1wR/gu51BD679783osLFVgYxzTXwxPS1FmE/kV/OGoPnT0h7EwF3yzar
 KTsZNxGjF0MA5QsuxBnqwQ5VsEsiNzRZYaGA173k+xL/MJTvvy5Dc87vJE+iUbbTr/qQ
 PQIxEIG8OMoIUau96GlG8sZROpWc82k1go4/imoL129Qg2yCtY7Xt9w/VGjHENFNn1Xx
 32juiIMgdPUZVoHTTyyyDBbwkA2wTuTFNFyb0AjHllc3PsbRLVeU7A4VJIwMcIZmjxYU
 UXhg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpUaGVyZSdzIG5vIExVVCByZWdpc3RlciBmb3Ig
c2Vjb25kIG1taHViIHRvIGNvbnZlcnQgcGFzaWQgc2luY2UgaXQgaGFzIG5vIEFUQy4KClNpZ25l
ZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRmVpZmVpIFh1IDxG
ZWlmZWkuWHVAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCBkNmFhMjkwZDU2N2MuLjExOTY4ZmJlMGQ2MCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCkBAIC00ODgsNiArNDg4LDEwIEBA
IHN0YXRpYyB2b2lkIGdtY192OV8wX2VtaXRfcGFzaWRfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcsIHVuc2lnbmVkIHZtaWQsCiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBy
aW5nLT5hZGV2OwogCXVpbnQzMl90IHJlZzsKIAorCS8qIERvIG5vdGhpbmcgYmVjYXVzZSB0aGVy
ZSdzIG5vIGx1dCByZWdpc3RlciBmb3IgbW1odWIxLiAqLworCWlmIChyaW5nLT5mdW5jcy0+dm1o
dWIgPT0gQU1ER1BVX01NSFVCXzEpCisJCXJldHVybjsKKwogCWlmIChyaW5nLT5mdW5jcy0+dm1o
dWIgPT0gQU1ER1BVX0dGWEhVQl8wKQogCQlyZWcgPSBTT0MxNV9SRUdfT0ZGU0VUKE9TU1NZUywg
MCwgbW1JSF9WTUlEXzBfTFVUKSArIHZtaWQ7CiAJZWxzZQotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
