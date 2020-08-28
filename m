Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC74256029
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Aug 2020 19:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CB66E50B;
	Fri, 28 Aug 2020 17:59:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38856E50B
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Aug 2020 17:59:07 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id e5so131859qth.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Aug 2020 10:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+rcpq3vISB0mcBXQcVUEBRisdMti5kSKa3Oegu0PSfA=;
 b=Dxk9x8k0jJHmloO4jVH+f734Vi6V3dYLntErh8nL/icyFTAm0Qz+mTW1tB9NJQtCmx
 0VEbzAvE0ZGNRIjm+EfIHj13S79IlUqtKnmDu5DpTApZ63UmTAng3k9br/RwmJkCzXRL
 /iU3PGvUsSIDolQP3OW34jf+MrlAYOaQVgoTqAzohyDSooHxN9DnRnYhabgY2qB+pfIP
 zZd2+70WMUM5AhMtwGEOeiPfx6A3PTGWi6jlDRvTLKX/XOty64iMlQvskoK9nj4kYVLj
 yRBv5I25MW2wybBH3L7jvl4H6ujPcCNFoz8P2DT91JdXLPsBfvqxBzw+AaYUPoh6iAGg
 5+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+rcpq3vISB0mcBXQcVUEBRisdMti5kSKa3Oegu0PSfA=;
 b=AdKjFKA71izhwMxgNq8n5meAOXRHGlWI+4Cm7EL1Yq/07XOF3uNSnY5bLy+L4I5zmA
 FhoULzdS6/xxjUct7qTc06uwfGKJrqzG9yL7xZtFbJXyJj9NstU8YhcJ6ViRwVTRgqUX
 mlsKW4K7NWT47NIpWjtEVyqENL+Hbd4/ylGGLdbu0bltCEc5MCLpTMvqMkutYpTfupZO
 vfUvLQbnRZbKcSz238/tBJCYzjOpLaXjhQHENE4uGptpuChyznUz0XT1tkb3f7uk5gOn
 dFhgX1LWA/9rTZEUVlxgviH016UOFi06mQRiRhQ2NSXekMl1VVDQXv1UjaBVy/DHmP/+
 Azkw==
X-Gm-Message-State: AOAM533DzG6b6V09dorCYUo1Lut7fentJjducf6l3x8OXYdnUAmcGXEg
 Ks3tq9WCJfKOeqWYy0ls79Il+kKFA0E=
X-Google-Smtp-Source: ABdhPJy4CAUO6tRymEnbrF7enqgmyemBDAztxpkHxnXepL2/eNe4niChkEV0K9gt4aRzirEKAimC+w==
X-Received: by 2002:ac8:4643:: with SMTP id f3mr2703579qto.128.1598637546799; 
 Fri, 28 Aug 2020 10:59:06 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id x28sm1278129qki.55.2020.08.28.10.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 10:59:06 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/amdgpu/swsmu: add smu11 helper to get manual fan
 speed (v2)
Date: Fri, 28 Aug 2020 13:58:52 -0400
Message-Id: <20200828175853.2378523-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200828175853.2378523-1-alexander.deucher@amd.com>
References: <20200828175853.2378523-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Will be used to fetch the fan speeds when manual fan mode is
set.

v2: squash in a Coverity fix from Colin Ian King

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h        |  3 +++
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    | 21 +++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/inc/smu_v11_0.h b/drivers/gpu/drm/amd/pm/inc/smu_v11_0.h
index 8307e2b790da..1f9575a4dfe7 100644
--- a/drivers/gpu/drm/amd/pm/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/pm/inc/smu_v11_0.h
@@ -203,6 +203,9 @@ smu_v11_0_set_fan_control_mode(struct smu_context *smu,
 int smu_v11_0_set_fan_speed_rpm(struct smu_context *smu,
 				       uint32_t speed);
 
+int smu_v11_0_get_fan_speed_rpm(struct smu_context *smu,
+				uint32_t *speed);
+
 int smu_v11_0_set_xgmi_pstate(struct smu_context *smu,
 				     uint32_t pstate);
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index 5abc06f7c9f3..f5aeb0b5cf97 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -1153,6 +1153,27 @@ int smu_v11_0_set_fan_speed_rpm(struct smu_context *smu,
 	return ret;
 }
 
+int smu_v11_0_get_fan_speed_rpm(struct smu_context *smu,
+				uint32_t *speed)
+{
+	struct amdgpu_device *adev = smu->adev;
+	uint32_t tach_period, crystal_clock_freq;
+	uint64_t tmp64;
+
+	tach_period = REG_GET_FIELD(RREG32_SOC15(THM, 0, mmCG_TACH_CTRL),
+				    CG_TACH_CTRL, TARGET_PERIOD);
+	if (!tach_period)
+		return -EINVAL;
+
+	crystal_clock_freq = amdgpu_asic_get_xclk(adev);
+
+	tmp64 = (uint64_t)crystal_clock_freq * 60 * 10000;
+	do_div(tmp64, (tach_period * 8));
+	*speed = (uint32_t)tmp64;
+
+	return 0;
+}
+
 int smu_v11_0_set_xgmi_pstate(struct smu_context *smu,
 				     uint32_t pstate)
 {
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
