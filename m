Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5D898739
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B937C89715;
	Wed, 21 Aug 2019 22:24:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886D16E3A2
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:34 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 201so3337182qkm.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=frPQunTCf/cqB1Uc1+E2M0upw7C+hQK9kiMASxAhy60=;
 b=gWlRjPD8RW27g/vAqekoYajeN6LzgY0vxQKdXb5jUWDU+m0v/XE2OhRWSWTpi1jQhM
 /NHpsNTYPgTpo4ZpPStaztQ81NBJ/cgMZxTndLmOeN1lfIxUBthR6i7sGPzwYedV0xoT
 eUmYCCXeIop7aJAqKkMe/KneVjZZ9DysItNGDH6B9oJp1sMEvaoA4xTcv7lCyweKHRmk
 8BX0ZEx7aL+bfrMdX/gfinxKVo6IBkpBeVyOrA+KymeR7xboUNbjy7gDuiSFQwPROV0q
 HBo5dmA0VcFKA6l90qrl/P4TbSDbhG/EQOodU3g2DDrJZZwxzXAkGmR8UbNeiMjNSpmp
 lVhQ==
X-Gm-Message-State: APjAAAX+rsJipwRn8Z5LraMUKJRWzEEQ4DXIbsJwB7JbpICj8nAGLp2A
 gEd5ieF8AsjOniVDW56EXh/oV2YP
X-Google-Smtp-Source: APXvYqw9bpdXab/JzsuxiGYwLQ0xyswRwJLHJiAL+d091/UYV0vKgvXZ9v2nFGOJSLL6Fxm1950f5g==
X-Received: by 2002:ae9:e845:: with SMTP id a66mr33626242qkg.451.1566426273433; 
 Wed, 21 Aug 2019 15:24:33 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 25/37] drm/amdgpu: enable vcn clock gating for rn
Date: Wed, 21 Aug 2019 17:23:47 -0500
Message-Id: <20190821222359.13578-26-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=frPQunTCf/cqB1Uc1+E2M0upw7C+hQK9kiMASxAhy60=;
 b=PV/9uY5AyAVwft/4q+yGDnfZ6RjNRz+RbaHj4hTxbw6feMPSqRm3i8SIciEuXUMGWB
 qfXM3VGkD/hxmXeq7qHhHNRo4JwQT7GkATuY+d3SbtugeADZvMwohv621418Eq2oUMkF
 pkZekp2urpXRDPAzDgKhHUzJMVUOGtIR+YjtW3MqIU4xeigCv6XbpDp06JzrOJWhnWgx
 2pyh9bYfITPvSENAp3sTzVYrBi8aMDnOxXDoLdD/JR89SVKQt53eDCh1RheSzO8iu97w
 gIAN1pVBCSHg1YlRUaC37I0VHJ6O0AIQY2FpbKHBT6UTKFmWJWlZsuPYkBDgZDmZNbaY
 Gh/A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpFbmFibGUgVkNOIG1pZGRs
ZSBncmFpbiBjbG9jayBnYXRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2Uu
TGlhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IDIwZDMxMjBjNmJjMi4uM2I5MmRhNGZmNjljIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTExNjcsNyArMTE2Nyw4IEBAIHN0YXRp
YyBpbnQgc29jMTVfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogCQkJCSBBTURfQ0df
U1VQUE9SVF9TRE1BX0xTIHwKIAkJCQkgQU1EX0NHX1NVUFBPUlRfQklGX0xTIHwKIAkJCQkgQU1E
X0NHX1NVUFBPUlRfSERQX0xTIHwKLQkJCQkgQU1EX0NHX1NVUFBPUlRfUk9NX01HQ0c7CisJCQkJ
IEFNRF9DR19TVVBQT1JUX1JPTV9NR0NHIHwKKwkJCQkgQU1EX0NHX1NVUFBPUlRfVkNOX01HQ0c7
CiAJCWFkZXYtPnBnX2ZsYWdzID0gMDsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID0gYWRldi0+
cmV2X2lkICsgMHg5MTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
