Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A4351021
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 17:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC0689C63;
	Mon, 24 Jun 2019 15:16:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C59789C51
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 15:15:58 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 136so10335122lfa.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 08:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=um4BLaL6M8RoqYSq0EcuvDTPZcZvnKVbsZFs21LVGPs=;
 b=H77Tt7V/M1OvZJ7wAeI16Z7Wub2iQB91TEPUphw60MDdITochd37rSWeMbXSAasfwm
 bfOeh4FYHoCP868hBZhnuFCWD3seqknxyREZcSKOuKTa6WSLf82AQg3fUzWssvlQ/MfO
 06bQiMaxmLYudmjyjOvDgi2rRMI2sp57K1KxbutZW5qz4ICmkmo+5rLtNvwqUT/fm0hr
 ipa7tRlPD61LiX97kVE3DYr+5wYj2VEOeNN8M19rCFWHd5xaIBY7Clqg5rTXbiX6Ih9/
 3AgcPXwbJfcq9ra4+SxssVKNSiOdKwL7Mpg3J5JighWljvF+TtoJ6z5gFfLQGc7efKv1
 EEfw==
X-Gm-Message-State: APjAAAVH4eN43/qtMdTkACTKuR4L1mvAj3W8VRu8f53I9GcAaAEVr8fG
 +isO/8NjeQLfcN0qZ333YW8pF3LaS9k=
X-Google-Smtp-Source: APXvYqy9cZyFF1Z/sL03bzUyFMq67CfOjGp0GJA/XAAK6CrIZ+smrOhw2hdwivZPNVp/GMbvxL403g==
X-Received: by 2002:ac2:5a01:: with SMTP id q1mr63069511lfn.46.1561389356789; 
 Mon, 24 Jun 2019 08:15:56 -0700 (PDT)
Received: from localhost.localdomain ([188.151.232.219])
 by smtp.googlemail.com with ESMTPSA id u18sm1797201ljj.32.2019.06.24.08.15.55
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 08:15:56 -0700 (PDT)
From: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/amd/amdgpu: Fix style issues in dcn20_resource.c
Date: Mon, 24 Jun 2019 17:15:43 +0200
Message-Id: <20190624151544.13934-5-ernstp@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624151544.13934-1-ernstp@gmail.com>
References: <20190624151544.13934-1-ernstp@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=um4BLaL6M8RoqYSq0EcuvDTPZcZvnKVbsZFs21LVGPs=;
 b=lZZUawVx0RqK7/8GPobAeEm/pr3gEONBAuD1osjEm55xfKUfjuqI8hc0Z06IWj7yMV
 WsIMz/lKlVa8363Isa1etjQGexVvWqMTuv95ZB9S3w/ZoQ96Yx1J6rUvYFbr1036hUZw
 VJ3b8yMUN/WJ5lVFEtOyJcGw6417rVACZLPJmdMrILQzuQ34gpxJe7rqXEnjdJ490sgu
 DeNQpUxcEdWt4/S10j5QEkcT9Gwtl7FP8JDFoKf0XUgXY+o2dZbJJHdPRpDyfu7rmkPH
 G3bM6Cilggo572/PJk9azecAP0FhJ7C9GmCF1NKwV1OHxqhH1ASw6GdAngdMyH8ipBk8
 IIww==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW5jb25zaXN0ZW50IGluZGVudGF0aW9uIGFuZCBtaXhlZCB1c2Ugb2YgYnJhY2tldHMuCgpTaWdu
ZWQtb2ZmLWJ5OiBFcm5zdCBTasO2c3RyYW5kIDxlcm5zdHBAZ21haWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgMTAgKysr
KystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBf
cmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9y
ZXNvdXJjZS5jCmluZGV4IGM1YWMyNTk4MGYxOS4uZmE0ZjM3OGVmZTViIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpA
QCAtMjg4NywxNSArMjg4NywxNSBAQCBzdGF0aWMgYm9vbCBjb25zdHJ1Y3QoCiAJZGMtPmNhcHMu
Zm9yY2VfZHBfdHBzNF9mb3JfY3AyNTIwID0gdHJ1ZTsKIAlkYy0+Y2Fwcy5od18zZF9sdXQgPSB0
cnVlOwogCi0JaWYgKGRjLT5jdHgtPmRjZV9lbnZpcm9ubWVudCA9PSBEQ0VfRU5WX1BST0RVQ1RJ
T05fRFJWKQorCWlmIChkYy0+Y3R4LT5kY2VfZW52aXJvbm1lbnQgPT0gRENFX0VOVl9QUk9EVUNU
SU9OX0RSVikgewogCQlkYy0+ZGVidWcgPSBkZWJ1Z19kZWZhdWx0c19kcnY7Ci0JZWxzZSBpZiAo
ZGMtPmN0eC0+ZGNlX2Vudmlyb25tZW50ID09IERDRV9FTlZfRlBHQV9NQVhJTVVTKSB7Ci0JCQlw
b29sLT5iYXNlLnBpcGVfY291bnQgPSA0OwotCisJfSBlbHNlIGlmIChkYy0+Y3R4LT5kY2VfZW52
aXJvbm1lbnQgPT0gRENFX0VOVl9GUEdBX01BWElNVVMpIHsKKwkJcG9vbC0+YmFzZS5waXBlX2Nv
dW50ID0gNDsKIAkJcG9vbC0+YmFzZS5tcGNjX2NvdW50ID0gcG9vbC0+YmFzZS5waXBlX2NvdW50
OwogCQlkYy0+ZGVidWcgPSBkZWJ1Z19kZWZhdWx0c19kaWFnczsKLQl9IGVsc2UKKwl9IGVsc2Ug
ewogCQlkYy0+ZGVidWcgPSBkZWJ1Z19kZWZhdWx0c19kaWFnczsKKwl9CiAJLy9kY24yLjB4CiAJ
ZGMtPndvcmtfYXJvdW5kcy5kZWRjbjIwXzMwNV93YSA9IHRydWU7CiAKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
