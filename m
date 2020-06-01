Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 939661EA9BD
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2306E2D1;
	Mon,  1 Jun 2020 18:04:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0559B6E2DC
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:04:43 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id i68so8441905qtb.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KbwLZWDOZyw6drEyxVpZ47SxBJ+Y81yN6pKDRW5Vee8=;
 b=TEW0cX89OHTIkjk166ZLthBSZZUPyPWN20PX5uJpV5VL2+dA0tPvWd5V/CgWPpRRrd
 /GnwLJeIAyw0JqZBF/+kaD6QXHTOynmOH8jU/da7jaBfzKEmWgC2U0w72gWpLuebaw0F
 vJv4Zxa/k+xh12ae2bZNtr3l0lX0io+q7n/6qWch72P6toDEAk/lCqJ7bPR2MMHRE4O4
 9LFGKQQDDqhN1Q2Bljm1t5p3aiG/VO7yKI6CMWGtMPOZHqPgB92dkdrkyOtPoZzELD9e
 Lv98/Q37sDXHC+nSrQgRHXN1ifaYunYgi2tmSnc8b99at60l9rd1gHg1AMqxQG9xoB36
 ilNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KbwLZWDOZyw6drEyxVpZ47SxBJ+Y81yN6pKDRW5Vee8=;
 b=phYjShex2hPYFkXfHE9Lv2eaYbxHQCnve6ER86DeXV/IdtRds2GjopxhK0R0mQYNKm
 4EiVaEso8G7jdN52CcJyvo86P2m53pTtcNEDJ9bu8kmG+pBfzUdfwt9h0hlDQn32+9vb
 JOYWFOnhi5U/jz9pQObms411dd5xtbm6exUbPilPt/KY9bwKKttHVdIeqBO3Xsuct95g
 iNU5RYGFRCZoNVFzgli7tstMHhHC/75BayKkolbIGtgHOtITe6TVuiiBaONP/W+SC+j9
 qyiA0HVFXzukA/spNcMkfsIyVtjNVOJt3syABGnLfWKkaZ3xqWM7JmtZQmMyi6RjY3Gx
 sWNg==
X-Gm-Message-State: AOAM532UxJbCk6CIJAYlnnoy7elQWfmLM9YKf3RTkW0fA56w6h1O+SSI
 cqaRwmBzx0eRW/xchZOcGgQLX00k
X-Google-Smtp-Source: ABdhPJyqqkX4Jbm1Q2jPkqzWjCXiPeMnDMk8fOCAyQJ306QKXSH2Rv7YjkWMNP3C/p3NUN+l1AuX9g==
X-Received: by 2002:ac8:7ca:: with SMTP id m10mr20597074qth.86.1591034680511; 
 Mon, 01 Jun 2020 11:04:40 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id h16sm42164qtp.1.2020.06.01.11.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:04:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 080/207] drm/amdgpu: update the num of queue per pipe for mec
 on sienna_cichlid
Date: Mon,  1 Jun 2020 14:00:32 -0400
Message-Id: <20200601180239.1267430-77-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601180239.1267430-1-alexander.deucher@amd.com>
References: <20200601180239.1267430-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Likun Gao <Likun.Gao@amd.com>

The number of queue per pipe for mec on sienna_cichlid should be 4.

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 5cbee23d2ff8..69458d5ccb09 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -4147,7 +4147,6 @@ static int gfx_v10_0_sw_init(void *handle)
 	case CHIP_NAVI10:
 	case CHIP_NAVI14:
 	case CHIP_NAVI12:
-	case CHIP_SIENNA_CICHLID:
 		adev->gfx.me.num_me = 1;
 		adev->gfx.me.num_pipe_per_me = 1;
 		adev->gfx.me.num_queue_per_pipe = 1;
@@ -4155,6 +4154,14 @@ static int gfx_v10_0_sw_init(void *handle)
 		adev->gfx.mec.num_pipe_per_mec = 4;
 		adev->gfx.mec.num_queue_per_pipe = 8;
 		break;
+	case CHIP_SIENNA_CICHLID:
+		adev->gfx.me.num_me = 1;
+		adev->gfx.me.num_pipe_per_me = 2;
+		adev->gfx.me.num_queue_per_pipe = 1;
+		adev->gfx.mec.num_mec = 2;
+		adev->gfx.mec.num_pipe_per_mec = 4;
+		adev->gfx.mec.num_queue_per_pipe = 4;
+		break;
 	default:
 		adev->gfx.me.num_me = 1;
 		adev->gfx.me.num_pipe_per_me = 1;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
