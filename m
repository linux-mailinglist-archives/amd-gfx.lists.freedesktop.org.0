Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F719134F97
	for <lists+amd-gfx@lfdr.de>; Wed,  8 Jan 2020 23:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6156E34D;
	Wed,  8 Jan 2020 22:49:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC926E34D
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Jan 2020 22:49:19 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id h126so1951359ywc.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Jan 2020 14:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X8Hvlqdc/FHhzEF664XbP4WzYZd70oqFSbAbSbQ4j5Y=;
 b=Xghl/5+/6VkBhBEbo4NEB0cBaUhS/dp1dQSK9UWy23eJRWmqldnvIL566SIumBJ78K
 HtwoXsF10t7evpsHvZ4/TPRLGoM4aKMQCdRE3utp1zyCODDM48r0GsT7cy6FL1yJnEXe
 FnMuDF1wH7gg96Q0TWsh34j4LavSE2KsGio6CypYkA98qagce/72l8QCYwxZF77Hguch
 gNXlkcgAeham0NPiISQERhMGbj6KbL1HAxREhXs5Xvx/BobC5LM1YHsJAv74L8pGqWUi
 u932y2TihtKFIMufWbjBKWdn5B2ULAWT2y17Sy4MIs18B/b8z8JKa9YR1wf3rQqDFNNy
 bXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X8Hvlqdc/FHhzEF664XbP4WzYZd70oqFSbAbSbQ4j5Y=;
 b=GZA65VbSvBurNEA7aMFWXWqpArnnlVPikLANeEOEVWtsREgd01uI0Hnhe7xV/Rtc2x
 okk76CDS5nC6pv5LQ5XVuT9GGxUgelL8Mp8uBZa+yftd0oXBqsNf8V56mFCViPN6wnUT
 DBNSMBYbyJK3xjM+ix5x8O5KnPguZKLQ+M6QGAwuym+/1K5tKqARO1698ovbpIOt5AfY
 zlitIrLuP/+uTmQZKnYjfU1xtaFw92VdKSFrDBu3yi1lU8FpP2+dBw3c/Wr2Fxc0GxQ1
 RIsFwCInW/LdckazgEWotKDlEO2G746cKg1h4C7O7wKIhrp21IUv7rw6qQ/7lGf1KVf+
 QZCA==
X-Gm-Message-State: APjAAAV0yDhN2aqrVfaYcb5KsWYie6RJykZrhne7e62m0LhIkW8Lj1uI
 bDDX9zhE79O8I9SgVVgcEDOTfN6S
X-Google-Smtp-Source: APXvYqxSieeZKDpAgOPoHPM9V0dX5fTfbv1zDGpZEgT52uFvumTUS/dXBl8PHhxFDk1V/Dd6BILj+g==
X-Received: by 2002:a81:7853:: with SMTP id t80mr5624461ywc.68.1578523758599; 
 Wed, 08 Jan 2020 14:49:18 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id t15sm1209519ywg.67.2020.01.08.14.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 14:49:18 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu/display: set gpu vm flag for all asics which
 support it
Date: Wed,  8 Jan 2020 17:49:08 -0500
Message-Id: <20200108224910.289731-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
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

It won't get used unless the driver allows the gtt domain for
display buffers which is controlled elsewhere.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1123f9ce86ee..fdf4d202ea1f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -906,13 +906,15 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 
 	init_data.dce_environment = DCE_ENV_PRODUCTION_DRV;
 
-	/*
-	 * TODO debug why this doesn't work on Raven
-	 */
-	if (adev->flags & AMD_IS_APU &&
-	    adev->asic_type >= CHIP_CARRIZO &&
-	    adev->asic_type < CHIP_RAVEN)
+	switch (adev->asic_type) {
+	case CHIP_CARRIZO:
+	case CHIP_STONEY:
+	case CHIP_RAVEN:
 		init_data.flags.gpu_vm_support = true;
+		break;
+	default:
+		break;
+	}
 
 	if (amdgpu_dc_feature_mask & DC_FBC_MASK)
 		init_data.flags.fbc_support = true;
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
