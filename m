Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F056325602C
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Aug 2020 19:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DE26EB61;
	Fri, 28 Aug 2020 17:59:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98CE6E50D
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Aug 2020 17:59:08 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id k18so102093qtm.10
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Aug 2020 10:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6pyiAd8L94ohxiDsMLd7KGVSqh1hADSxZoMbllyxEco=;
 b=ghsrLEol88qK/plEdqXjegZTb0fbeLazoyGYmkPXAicDhvxX0NR0Ln00QQu33Y1deq
 6c5NHqbx/+z/JoZdSzT00wOuv0Hz95AvxIBqqDZuOmDPrwS8WkzK+DOpccFgBIgVHevu
 xvGJQq17LrjtgxMVz39QmBHNsez4LKT0osm741o3kZVlU1bddptRmDuGmhHh5L6ZyznU
 AYmiA+AIqejB9aY03bSbkY9dc+Y4Raqe80xNr14GdeBA8zbm7CJV1YyQlvYfpSkHwxP2
 TuYhbMJAJAbw2g25HSV8JOud0O4LoUxJtKQUJJS+OAuJ/VLdG4rgpz7FP8n37s7bYt3V
 h8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6pyiAd8L94ohxiDsMLd7KGVSqh1hADSxZoMbllyxEco=;
 b=SkTm9NIBKSsg6caJaf9gkLhb1Mkes9Z7szLAntXl00PWLxCYVrZyhEfAOroy+LrlhU
 dtDq9VmHrd2pjuADZoNB9WeUmd1PYKsqfZKdTcvgyCrWH7QLJTsAwkmh0MMmwJJVaDbB
 up6ICWdPuIHsYBA1/imfh1Y5VRyN5v/CDLxRyDtSCKe+pNdAX10t/SHyFRuRKWJJZPV7
 Q9MvfVwT+JE6Rue3srufpTIg8Vij+0/cO2gysgrNaxzlaZ2omVLrqfGdYTconAii5NiA
 7IDXndoetOH0zI8z7P8/B3WiBBWnnBC5KipPWSxwbYBJWws0krGRGNmnVJCJlvobek+g
 u5tw==
X-Gm-Message-State: AOAM530rr1HJ9cM0Ko9WgJSesO+BsE1HDmKoJwBXUgcS6EfvJscP3dmO
 ttfk+Ts+GLk9ZwRk/B1y6AfX+8e/VKk=
X-Google-Smtp-Source: ABdhPJwl/hIO6tFzeZ7q33wP9VHpikWO/tF1MwwWPqmJfgj9OLHSm5eYTyoobrwoWf46HZv3S7RzRQ==
X-Received: by 2002:ac8:1415:: with SMTP id k21mr2761668qtj.374.1598637547810; 
 Fri, 28 Aug 2020 10:59:07 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id x28sm1278129qki.55.2020.08.28.10.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 10:59:07 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 6/6] drm/amdgpu/swsmu: handle manual fan readback on SMU11
Date: Fri, 28 Aug 2020 13:58:53 -0400
Message-Id: <20200828175853.2378523-6-alexander.deucher@amd.com>
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

Need to read back from registers for manual mode rather than
using the metrics table.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1164
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c     | 11 ++++++++---
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c       | 11 ++++++++---
 .../gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   | 11 ++++++++---
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
index f6d9b0db3e82..2ce6ad9c6609 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
@@ -1123,9 +1123,14 @@ static int arcturus_get_fan_speed_rpm(struct smu_context *smu,
 	if (!speed)
 		return -EINVAL;
 
-	return arcturus_get_smu_metrics_data(smu,
-					     METRICS_CURR_FANSPEED,
-					     speed);
+	switch (smu_v11_0_get_fan_control_mode(smu)) {
+	case AMD_FAN_CTRL_AUTO:
+		return arcturus_get_smu_metrics_data(smu,
+						     METRICS_CURR_FANSPEED,
+						     speed);
+	default:
+		return smu_v11_0_get_fan_speed_rpm(smu, speed);
+	}
 }
 
 static int arcturus_get_fan_parameters(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index 87b5f9ff4021..42d53cca7360 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -1362,9 +1362,14 @@ static int navi10_get_fan_speed_rpm(struct smu_context *smu,
 	if (!speed)
 		return -EINVAL;
 
-	return navi10_get_smu_metrics_data(smu,
-					   METRICS_CURR_FANSPEED,
-					   speed);
+	switch (smu_v11_0_get_fan_control_mode(smu)) {
+	case AMD_FAN_CTRL_AUTO:
+		return navi10_get_smu_metrics_data(smu,
+						   METRICS_CURR_FANSPEED,
+						   speed);
+	default:
+		return smu_v11_0_get_fan_speed_rpm(smu, speed);
+	}
 }
 
 static int navi10_get_fan_parameters(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 863372436b98..5c22611d5878 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -1169,9 +1169,14 @@ static int sienna_cichlid_get_fan_speed_rpm(struct smu_context *smu,
 	if (!speed)
 		return -EINVAL;
 
-	return sienna_cichlid_get_smu_metrics_data(smu,
-						   METRICS_CURR_FANSPEED,
-						   speed);
+	switch (smu_v11_0_get_fan_control_mode(smu)) {
+	case AMD_FAN_CTRL_AUTO:
+		return sienna_cichlid_get_smu_metrics_data(smu,
+							   METRICS_CURR_FANSPEED,
+							   speed);
+	default:
+		return smu_v11_0_get_fan_speed_rpm(smu, speed);
+	}
 }
 
 static int sienna_cichlid_get_fan_parameters(struct smu_context *smu)
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
