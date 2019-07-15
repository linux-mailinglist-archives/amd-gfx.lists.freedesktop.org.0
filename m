Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534CA69E0C
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B007889E1A;
	Mon, 15 Jul 2019 21:25:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8B289E11
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:08 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id v22so12853772qkj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RA3vZdnDw4k/LeTon3IX19WtgOGLN0LlhAUGN/2FUIs=;
 b=pSUJN7Ltqllj48FaabPqmbk8MJ3D9i6tuuPX+j9tPoaw0CvlfNE3/tYLwrmR1rmIUi
 YGsgiGhIwezYxj2onnY5SbGnt8vdJkyzgfnNi8dKGXy3L8ikYfmT68w9CXQepe97yVWA
 NNPggAk/D0TF9yejA8vkv0g+3BhuoOwsf0A/3V+XgsAAmcsCGtVnHJ80DWjbeQqvjFHn
 /vPsz2sqG0vwByiJCBlm/hDnQfFiZug0yNUGpBlo+NbfJz97RYwGJLpc9cfQp5nKK5Fb
 kDy/m/XE4gYQtVlzN5JexGMmC5OV3CeQzFSJOrNcJMQL6eEuLuCSQbJ7DIbDWmzZWwyD
 Uwuw==
X-Gm-Message-State: APjAAAVcChyG/UqK/I08O9KEParQ3MEPo/BLiigDy7Lh/9SNzWaV/6fp
 QBMhW8m0P55/qqbyPI4/FrNNa8A5
X-Google-Smtp-Source: APXvYqzi0c94Gp7gG2H/ldJc+WrbI4iLah4SkvCIRWDAOixnIr/FhXx8jBRdvJvmUgi6S/BN7v3lTA==
X-Received: by 2002:a05:620a:10bc:: with SMTP id
 h28mr18616027qkk.289.1563225907605; 
 Mon, 15 Jul 2019 14:25:07 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:07 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 026/102] drm/amdgpu: add gfx config for Arcturus
Date: Mon, 15 Jul 2019 16:23:21 -0500
Message-Id: <20190715212437.31793-24-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RA3vZdnDw4k/LeTon3IX19WtgOGLN0LlhAUGN/2FUIs=;
 b=IIaDqaSTcWL2FkRD/bRMU7ut8aH8tUAqgG3QdwPXhWZTgOETNQp1/xbsaSahaN8MZB
 UG/Bb+npO3wtT02GLc7DB/RSv3Nfca+jUjiojc8nHigrbPVLCfHggRFlgwW3GFdHWZeD
 zFMeGD1LMvWVVUI0O7N1mAob1AQhMEABZAvfEEpYvWaMMPfXBjuTQEcf4HTLLNOZmNG/
 nkF8OHFGsh2EgBu/ufWR7rLkCwx5T2YyRa1C+n6H+9UiXpssSirXIdonNEMotZJjSnEd
 dy1N4WNuXnENN5WF8rDq61lEa5GLQYyULtOeagsdqGSKW3zshW41/MDnyWpo0aisBsz0
 vs1w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAxMCArKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IDYyNjA3MGUwZDFlMi4uOWQ1N2I0YWU0OWNmIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTEzODMsNiArMTM4MywxNiBAQCBz
dGF0aWMgaW50IGdmeF92OV8wX2dwdV9lYXJseV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQogCQllbHNlCiAJCQlnYl9hZGRyX2NvbmZpZyA9IFJBVkVOX0dCX0FERFJfQ09ORklHX0dP
TERFTjsKIAkJYnJlYWs7CisJY2FzZSBDSElQX0FSQ1RVUlVTOgorCQlhZGV2LT5nZnguY29uZmln
Lm1heF9od19jb250ZXh0cyA9IDg7CisJCWFkZXYtPmdmeC5jb25maWcuc2NfcHJpbV9maWZvX3Np
emVfZnJvbnRlbmQgPSAweDIwOworCQlhZGV2LT5nZnguY29uZmlnLnNjX3ByaW1fZmlmb19zaXpl
X2JhY2tlbmQgPSAweDEwMDsKKwkJYWRldi0+Z2Z4LmNvbmZpZy5zY19oaXpfdGlsZV9maWZvX3Np
emUgPSAweDMwOworCQlhZGV2LT5nZnguY29uZmlnLnNjX2Vhcmx5el90aWxlX2ZpZm9fc2l6ZSA9
IDB4NEMwOworCQlnYl9hZGRyX2NvbmZpZyA9IFJSRUczMl9TT0MxNShHQywgMCwgbW1HQl9BRERS
X0NPTkZJRyk7CisJCWdiX2FkZHJfY29uZmlnICY9IH4weGYzZTc3N2ZmOworCQlnYl9hZGRyX2Nv
bmZpZyB8PSAweDIyMDE0MDQyOworCQlicmVhazsKIAlkZWZhdWx0OgogCQlCVUcoKTsKIAkJYnJl
YWs7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
