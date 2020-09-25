Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 855522791A3
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Sep 2020 22:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B356ED60;
	Fri, 25 Sep 2020 20:11:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6756ED5F
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 20:11:13 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d1so3080395qtr.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 13:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZD3UBRmZZVUghfP/gjkNvkcRmZiH4pM++a3jE4YIe0=;
 b=n7Pp88lKZRTzBLv3Ifb6RN5t+eyolUyHcxqRYjnqz7wO9GY+0mTFVs2vKTqdqJaTlf
 i1ihfjb4vQO8kWmyD5nqACb4c3j+Eoi/2Wsdf/rEFNPa7Y3WocomJVwN9/RRgh1x0GFa
 N7JWAivlnRBVWlLXX+/kLmKWtC5K7CLPDcV9+WjNX5KRhRt0sn9iKlEpV+emolkYnz/L
 6gaqOSweYO4l07Az5xiOppCMqYXkdVIJ0OWD9BO6G3Wk/AlRZc2xzwM/AC9MnWmW9cCa
 3jpAlw3Hf5KuSvOZVy7DCdmyDg9m7ofrere4eFRkDAY8Bow9keVo/lLwcl0e5XoMAGDB
 Afgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZD3UBRmZZVUghfP/gjkNvkcRmZiH4pM++a3jE4YIe0=;
 b=k2BjqRDvklkAmskMBAQt3wg4j+JGpLD94ol9ps6YnB3zXPnQxP/Mnl3Q0zvREIgCOi
 0tY2vCqWSnJIWaIjDEfxqTqvK5Q8Pg3nNzwRpW4zD7Vdd6kEk7bZz3H1L80z3gIBveE5
 vTCrmjIpblcVVnrpFiOSo6V6LLLM3EKzQ4sYZdclIdacWkbjWFWpR7S7vM1avZF0imTy
 WoPNAugD0c4s5xddGaCJEUMrDrSsnaGcVO2QCMcYl1254c7fUDzo0rzDjYWs58DX2mlx
 D2d2PcycS4lrwTZDSM/AaPzWaR5fEdPPkmRvFCdFr83ZW/iF2n49iCQJmJlEBABBmIOG
 LolA==
X-Gm-Message-State: AOAM530LvnZmabnrSNCz10je010eftvE7v7pIGuq0adzaMDNiUOK+uFE
 RzNDdaq7EmBl6qyMQFmVuVZYJf/XLi0=
X-Google-Smtp-Source: ABdhPJzH34+71bYRGKzE1wnIaqwCrMF3+FSNnTcrkA+lGFY4gFJhEXoLyxu9owJgf/UkQaVe+LcNkw==
X-Received: by 2002:ac8:2675:: with SMTP id v50mr1456964qtv.160.1601064672641; 
 Fri, 25 Sep 2020 13:11:12 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id m67sm2301237qkf.98.2020.09.25.13.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 13:11:12 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 13/45] drm/amdgpu: get the correct vram type for van gogh
Date: Fri, 25 Sep 2020 16:09:57 -0400
Message-Id: <20200925201029.1738724-13-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200925201029.1738724-1-alexander.deucher@amd.com>
References: <20200925201029.1738724-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Huang Rui <ray.huang@amd.com>

This patch is to get the correct vram type from atombios for van gogh.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c       | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
index 17c010d0431f..e0e3a7e4774f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
@@ -149,6 +149,10 @@ static int convert_atom_mem_type_to_vram_type(struct amdgpu_device *adev,
 		case LpDdr4MemType:
 			vram_type = AMDGPU_VRAM_TYPE_DDR4;
 			break;
+		case Ddr5MemType:
+		case LpDdr5MemType:
+			vram_type = AMDGPU_VRAM_TYPE_DDR5;
+			break;
 		default:
 			vram_type = AMDGPU_VRAM_TYPE_UNKNOWN;
 			break;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 92fbbfb16cff..2ce79bccfc30 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1063,6 +1063,7 @@ static const char *amdgpu_vram_names[] = {
 	"DDR3",
 	"DDR4",
 	"GDDR6",
+	"DDR5"
 };
 
 /**
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
