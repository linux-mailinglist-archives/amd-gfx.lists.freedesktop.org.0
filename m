Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCF5D36DC
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B166EBA3;
	Fri, 11 Oct 2019 01:22:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7350D6EBA1
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:21:59 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id 3so11638082qta.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cd3vCeB2ZnXhe0QVxHjKkMGqKDpqnbOt6MXggtLkaSE=;
 b=j7nFlT/8hoyrylSGHqrx1Rrnzq+KB+43WFhq7QITZDNU1DJs972ygXb+8eIwB0mZjY
 t4CmFn61SPQM3YDeXqUoOCxgkLnBfOIdoAy43Pdj6GHMCRx502eqbxXlLHclDL3M6ma5
 bEve4boR7vrHjnLhTtoAClEQmzQT4MAluPv8xFjvF6x+L0a5dGeKXluksnje9hQzN50L
 wxNiTBkWmR13ZpIbqEwQvEk6KtAN0TIsOPsHbD6zXCk1rQq4qjhsmufKDGuQB3XuwuRy
 hnATr1/2gLBxUWwopBJXbOpPCzf3FUl7k2fAfN1wHTYD+eqqUjoaAyXtZxDzr6uesEI1
 s9yQ==
X-Gm-Message-State: APjAAAXpdWm4+JfB9R4Os2oAl9e6wAUpaemZAaH4SmtIjGfdfP/4vozB
 DETJC+b0LZrnpMETC/JogAdrDhAx
X-Google-Smtp-Source: APXvYqzCeWCgIx+9dizSpYvf56YG6F3SAgc30S5u0BNNWlZIe2LtrVtnpcRSCBZQGvuiq7M0cfMRYA==
X-Received: by 2002:ac8:fda:: with SMTP id f26mr14142453qtk.34.1570756918360; 
 Thu, 10 Oct 2019 18:21:58 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id p199sm3301590qke.18.2019.10.10.18.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:21:57 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 14/15] drm/amdgpu/powerplay: wire up BACO to powerplay API for
 smu7
Date: Thu, 10 Oct 2019 20:21:34 -0500
Message-Id: <20191011012135.18566-15-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011012135.18566-1-alexander.deucher@amd.com>
References: <20191011012135.18566-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cd3vCeB2ZnXhe0QVxHjKkMGqKDpqnbOt6MXggtLkaSE=;
 b=MPOReZd9pBxK5pLa3EJWVZLuiuxZqaV7kdgarxfOOb0v9zAdpaRAOtTXZ06CCPSoX2
 vWlxI2igid1ewoFjhW3d+OxMGPl75AHg2aJ5o4UJ3vjd3keffpXL8yfnxYfemIwsMuCE
 G+VroYMICTd0cGP9p6qQbEW/Ki8/ApfH9/UoKwR6L0B+qaOwwGFdcpoP6l/u9X0y63p+
 oaU9RSCdEyi1cDwrRi/mz3dznA71Ms+A1OQpW9Gt6CpLdZ7KbQktBEV6hDb+MupmP7ts
 tA1QZONCJelpqsEcTRcTjOsd8fzUK7uDadKYVGBYVfjBM1mYynh1aZtOsfhoJozh3U+4
 a/Vg==
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

V2lyZSB1cCB0aGUgcG93ZXJwbGF5IGNhbGxiYWNrcyBmb3IgZm9yIEJBQ08gZm9yIHNtdTcgZGV2
aWNlcy4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdy
LmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMKaW5kZXggMzRmOTVl
MGUzZWE0Li4wMzUzYTBhN2NkOGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2h3bWdyL3NtdTdfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci9zbXU3X2h3bWdyLmMKQEAgLTQ4LDYgKzQ4LDcgQEAKICNpbmNsdWRlICJzbXU3
X2Nsb2NrcG93ZXJnYXRpbmcuaCIKICNpbmNsdWRlICJwcm9jZXNzcHB0YWJsZXMuaCIKICNpbmNs
dWRlICJwcF90aGVybWFsLmgiCisjaW5jbHVkZSAic211N19iYWNvLmgiCiAKICNpbmNsdWRlICJp
dnNyY2lkL2l2c3JjaWRfdmlzbGFuZHMzMC5oIgogCkBAIC01MTQ1LDYgKzUxNDYsOSBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHBwX2h3bWdyX2Z1bmMgc211N19od21ncl9mdW5jcyA9IHsKIAkuZ2V0
X3Bvd2VyX3Byb2ZpbGVfbW9kZSA9IHNtdTdfZ2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZSwKIAkuc2V0
X3Bvd2VyX3Byb2ZpbGVfbW9kZSA9IHNtdTdfc2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZSwKIAkuZ2V0
X3BlcmZvcm1hbmNlX2xldmVsID0gc211N19nZXRfcGVyZm9ybWFuY2VfbGV2ZWwsCisJLmdldF9h
c2ljX2JhY29fY2FwYWJpbGl0eSA9IHNtdTdfYmFjb19nZXRfY2FwYWJpbGl0eSwKKwkuZ2V0X2Fz
aWNfYmFjb19zdGF0ZSA9IHNtdTdfYmFjb19nZXRfc3RhdGUsCisJLnNldF9hc2ljX2JhY29fc3Rh
dGUgPSBzbXU3X2JhY29fc2V0X3N0YXRlLAogCS5wb3dlcl9vZmZfYXNpYyA9IHNtdTdfcG93ZXJf
b2ZmX2FzaWMsCiB9OwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
