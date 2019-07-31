Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DEA7CB24
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 19:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C18489B49;
	Wed, 31 Jul 2019 17:58:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5456389AEB
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 17:58:29 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id u3so46780089vsh.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sA7W7NMIoOjh+XwNeGB7oGf3a+IBjxOV+WWAbLn5PfY=;
 b=RByWQniZZy3H112hOvRQvEyh5DEsJat2m6Rhj7f3iPjY+AE7Fv6QH5+irXNBWhK0z/
 WwCJzNSCKM5yL++yQ2dbDZyR7YaJwhpzR2QKMQp3DhLrhuRKFv6AZD14UfTRxWz8GM4y
 7SyZm3+rphZBP/WtEnagr51QXZZiXD5k2H8J+b5PtSD3YvO4hh+pElrpACv7lC4O1NME
 EEDB37Su5OKj7we7GHXHnOt5wqLhGKVaSLcQ1oKQUqircwZUKVh+bvYhgUzh0IZ4bFB1
 d0zaaBBljXHDcLJEV5NufPYbvb4QJGGRIEedEGR1xoRzfD/C2SvCs/wlBwsNzWNXnuf4
 48Vg==
X-Gm-Message-State: APjAAAXBY0mogQfjTmgH3t7QnNMHjb9ok2lP1pmXvszZHkKePBCNvEV7
 AA2NtM39/NdZSTE+8USg3H8QT6p0
X-Google-Smtp-Source: APXvYqw0pwrlhAMBrRHuFWd3ekP0x53MYbm1yZWyUif+9WObOHQEs/2jtK+9tH/aS4ZoFHtarWJXCw==
X-Received: by 2002:a05:6102:10da:: with SMTP id
 t26mr35421214vsr.101.1564595908203; 
 Wed, 31 Jul 2019 10:58:28 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id m123sm18189707vsm.30.2019.07.31.10.58.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:58:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/26] drm/amdgpu: init RSMU and UMC ip base address for vega20
Date: Wed, 31 Jul 2019 12:57:54 -0500
Message-Id: <20190731175818.20159-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175818.20159-1-alexander.deucher@amd.com>
References: <20190731175818.20159-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sA7W7NMIoOjh+XwNeGB7oGf3a+IBjxOV+WWAbLn5PfY=;
 b=i8QnOG31SnqoF+z7oTbEF79ftNVSsr18DEFjRCbFP62ckthFzuWZd/LLDMHljGCbid
 XMc5/fipza6kfjbGTGkS1TnvLXPtyEW697ixuUpOJDbCstkY6/X0wVk/dfPG181tNziQ
 V1s/G2VuXEqM/hZEahju8i4JzJHMDqDPnplnGKX7t+JRShzyYheLUP8MF1CFykwM+SJO
 8MNv8ftGynYG6A+4OUq756lShVfUHM/5SCl/QPDZ+nNzIPCUeA9EphEpTB+Sm6sCQoQE
 VwyALhRgoV1x8cVL60iV7kz/wr4W5CTbF/WsEAjamiMjgsQq44CA9p+i2v1AuSOTjaOF
 HqPg==
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
Cc: Dennis Li <dennis.li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKdGhlIGRyaXZlciBu
ZWVkcyB0byBwcm9ncmFtIFJTTVUgYW5kIFVNQyByZWdpc3RlcnMgdG8Kc3VwcG9ydCB2ZWdhMjAg
UkFTIGZlYXR1cmUKClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IERlbm5pcyBMaSA8ZGVubmlzLmxpQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgICAgICAgfCAyICsrCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMjBfcmVnX2luaXQuYyB8IDIgKysKIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaApp
bmRleCAxMjFjYzU1NDRiMmIuLmExOTdmNGIzM2VkYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1LmgKQEAgLTc1NSw2ICs3NTUsOCBAQCBlbnVtIGFtZF9od19pcF9ibG9ja190eXBlIHsK
IAlOQklGX0hXSVAsCiAJVEhNX0hXSVAsCiAJQ0xLX0hXSVAsCisJVU1DX0hXSVAsCisJUlNNVV9I
V0lQLAogCU1BWF9IV0lQCiB9OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS92ZWdhMjBfcmVnX2luaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2Ey
MF9yZWdfaW5pdC5jCmluZGV4IDc5MjIzMTg4YmQ0Ny4uNTg3ZTMzZjVkY2NlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMjBfcmVnX2luaXQuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMjBfcmVnX2luaXQuYwpAQCAtNTAsNiArNTAsOCBA
QCBpbnQgdmVnYTIwX3JlZ19iYXNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJ
CWFkZXYtPnJlZ19vZmZzZXRbTkJJRl9IV0lQXVtpXSA9ICh1aW50MzJfdCAqKSgmKE5CSU9fQkFT
RS5pbnN0YW5jZVtpXSkpOwogCQlhZGV2LT5yZWdfb2Zmc2V0W1RITV9IV0lQXVtpXSA9ICh1aW50
MzJfdCAqKSgmKFRITV9CQVNFLmluc3RhbmNlW2ldKSk7CiAJCWFkZXYtPnJlZ19vZmZzZXRbQ0xL
X0hXSVBdW2ldID0gKHVpbnQzMl90ICopKCYoQ0xLX0JBU0UuaW5zdGFuY2VbaV0pKTsKKwkJYWRl
di0+cmVnX29mZnNldFtVTUNfSFdJUF1baV0gPSAodWludDMyX3QgKikoJihVTUNfQkFTRS5pbnN0
YW5jZVtpXSkpOworCQlhZGV2LT5yZWdfb2Zmc2V0W1JTTVVfSFdJUF1baV0gPSAodWludDMyX3Qg
KikoJihSU01VX0JBU0UuaW5zdGFuY2VbaV0pKTsKIAl9CiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
