Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 959AC2477B8
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Aug 2020 21:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F45A89F24;
	Mon, 17 Aug 2020 19:53:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A342589F2D
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Aug 2020 19:53:42 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id f19so8904106qtp.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Aug 2020 12:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RR2ZSE9Jm9f4DMCK2VuFkD4gPQ6umyl7a+xgHoCZVCI=;
 b=OtVWvSy6414s3tclsgHJnG127liJFrgBvO28qwPFHUhDWNbEpBsMfnuaB1k2X8hPCJ
 Qi9vTSfaiQ8OXDmqW4ho2uLn3CiU1gFZ4/MveSrpkphlQxVzdJJEZ2vVwjgZvCm8KoDr
 xzCm+cOTS3iwbUDk086ZOFQQ4A/X++7lh+1XRmCjLgz6CFcn76dki3q7e8XFr90IhP6O
 pVdfo9+uaFSVDbimjJ9/pskAvES8cIlbZUUk2DOQRSrBgzoSKQWm9NabxredrGh+P4wX
 kN6cs9EEFuk7Z9q2P6HZcXI8TyTbd9PlOFpBom45YV4vQj135+Zk88p/liPXe47YVynS
 QNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RR2ZSE9Jm9f4DMCK2VuFkD4gPQ6umyl7a+xgHoCZVCI=;
 b=s4UVQEJD8jdEuOBZFiV4PdUcb1V+9Q3e7CFj62ZuHIXCBDbHq/aL/k52QOX6zhJULA
 uvZbjwbhzJSuXj/rbnvfSLClYzpUv+WxyciV2rcVy8j0bV/+EW0sDjLC/LlcjYywxyBm
 DyN0sxNlP6qQAZk7sI94z1AWPgqYWpFRRNfDtRPunp4HbHcpCUwR3Rq0HeqOlsjjJR91
 sCAx78c/39XDo+JHsa7L+DagJdjWh7PGCz4FiFpYhQTC++df/hk+bDlzkCUE6SJtXAfU
 vZbW706gW3TnTPBIa/gvRiTPk8gDorB9obfnBhOl8NAjom0c0ifpd+h4C3daLh2ekrxm
 jinA==
X-Gm-Message-State: AOAM533qTvoazMMi41c0yo05frtuwu9Zv+gdJ3bK+g08oVxbBSyEowhP
 0lFdxUy5DTcTUMzHtG3Owr1dC3DEn7Y=
X-Google-Smtp-Source: ABdhPJzI5l57aYH2O2w2viNEaJ0Xxwj8SxUbNYcTUZZR3hqzawXCEysEf0f5o0bNapsxzyqIJWI45A==
X-Received: by 2002:aed:2821:: with SMTP id r30mr14823873qtd.3.1597694021549; 
 Mon, 17 Aug 2020 12:53:41 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id p189sm18103161qkb.61.2020.08.17.12.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 12:53:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/amdgpu/pm: only hide average power on SI and
 pre-RENOIR APUs
Date: Mon, 17 Aug 2020 15:53:29 -0400
Message-Id: <20200817195329.1971490-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200817195329.1971490-1-alexander.deucher@amd.com>
References: <20200817195329.1971490-1-alexander.deucher@amd.com>
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

We can get this on RENOIR and newer via the SMU metrics
table.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index f2e70655e8d9..a77f7347fdfc 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -3312,12 +3312,17 @@ static umode_t hwmon_attributes_visible(struct kobject *kobj,
 
 	if (((adev->flags & AMD_IS_APU) ||
 	     adev->family == AMDGPU_FAMILY_SI) &&	/* not implemented yet */
-	    (attr == &sensor_dev_attr_power1_average.dev_attr.attr ||
-	     attr == &sensor_dev_attr_power1_cap_max.dev_attr.attr ||
+	    (attr == &sensor_dev_attr_power1_cap_max.dev_attr.attr ||
 	     attr == &sensor_dev_attr_power1_cap_min.dev_attr.attr||
 	     attr == &sensor_dev_attr_power1_cap.dev_attr.attr))
 		return 0;
 
+	if (((adev->family == AMDGPU_FAMILY_SI) ||
+	     ((adev->flags & AMD_IS_APU) &&
+	      (adev->asic_type < CHIP_RENOIR))) &&	/* not implemented yet */
+	    (attr == &sensor_dev_attr_power1_average.dev_attr.attr))
+		return 0;
+
 	if (!is_support_sw_smu(adev)) {
 		/* hide max/min values if we can't both query and manage the fan */
 		if ((!adev->powerplay.pp_funcs->set_fan_speed_percent &&
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
