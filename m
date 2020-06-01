Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9191EAB9A
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A716E30F;
	Mon,  1 Jun 2020 18:21:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E716E2F9
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:21:27 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c14so8976243qka.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q3cAjGOHu27NcEPkr4bPwz8RX8rnc0UwiCk7NMAp2v0=;
 b=iK7vFIPFqGb8H+TVTlbE7mWTj/N14sVRpUxdUY6prEpUTYS5Hcpep/cEvKc1zk23yd
 20n/un0GSJriMcTkaiAqo/ob0k/WLbWBdxas22eNLB/dttBQzgPJHEh/p1RlsIYPtqfI
 +cVINobQt2GDcEQga31j3olXPVWp17CSnMA8P1UM2bVw+hwSkukV2exXhTjKHl+Th8UI
 W143gNooAxJtBipfFoTbTUgsAJF3dnP7DwI2fKf9Y5wnPLVA2HT3FrtS8JEAAnoLl0Qh
 ye1/mykfonVtI88DfCzaG8M9cPI1VS6zqRPtzWjaY0/0KZLkeV5EYYaNzru5CkKuFxoQ
 iGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q3cAjGOHu27NcEPkr4bPwz8RX8rnc0UwiCk7NMAp2v0=;
 b=BXD1ntp77vMTSdyqxVoD1YokuVF8ifEfTf6sXy222YxEfZddi0mzSU04hGkAu4Pacr
 iN0gZPGRsMtPbTUjLry8X9x0zFNYk0hDN+a/lgUHPekxGfQf3hT8hM1CGhgTrybGPRWS
 jd9OPf7+y8pn0aQJ41UZCNuY2zTDAGkCqTu0Bq3eGC5vIv6YqfFLt+Gjj1SPT+nCYbJo
 7gNSePM/oo2G6k9a6xw1tB+1VE+wFApT82knJaYYx06fxPBigevLSWW1cMJgTOHlGLKS
 JrZt9dI0Qsp56UTBVD33mSpPILbiPsxsw5aUW9jiSW7dDW9MQXBsEV09n51fYnbOyAvS
 wZRA==
X-Gm-Message-State: AOAM531QgNh2nu3n9WbvxGubUN7tVza0gx/AGCv0I9a0ShGiaMk7WDIb
 As/fBSuPm8BAf7K/RSjvQA/zEpy5
X-Google-Smtp-Source: ABdhPJwg4PMI7lF4FRzrC6GUxTAcFgZD7/2ZB43w0Wf0Gt13QaDhGJ3vEZlx3I4+ifKHj8K3oojzyA==
X-Received: by 2002:a37:cca:: with SMTP id 193mr21026185qkm.208.1591035686184; 
 Mon, 01 Jun 2020 11:21:26 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:21:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 107/207] drm/amd/amdgpu: fix the HDP LS/DS/SD programming
Date: Mon,  1 Jun 2020 14:19:14 -0400
Message-Id: <20200601182054.1267858-18-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601182054.1267858-1-alexander.deucher@amd.com>
References: <20200601182054.1267858-1-alexander.deucher@amd.com>
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
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Kenneth Feng <kenneth.feng@amd.com>

confirmed that IPH_MEM_POWER_CTRL_EN and RC_MEM_POWER_CTRL_EN
have to be set for SRAM LS/DS/SD

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
Reviewed-by: Likun Gao <Likun.Gao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 5d1c2eba3412..081fde347dd4 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -889,6 +889,16 @@ static void nv_update_hdp_mem_power_gating(struct amdgpu_device *adev,
 						 RC_MEM_POWER_DS_EN, enable);
 	}
 
+	/* confirmed that IPH_MEM_POWER_CTRL_EN and RC_MEM_POWER_CTRL_EN have to
+	 * be set for SRAM LS/DS/SD */
+	if (adev->cg_flags & (AMD_CG_SUPPORT_HDP_LS | AMD_CG_SUPPORT_HDP_DS |
+							AMD_CG_SUPPORT_HDP_SD)) {
+		hdp_mem_pwr_cntl = REG_SET_FIELD(hdp_mem_pwr_cntl, HDP_MEM_POWER_CTRL,
+						IPH_MEM_POWER_CTRL_EN, 1);
+		hdp_mem_pwr_cntl = REG_SET_FIELD(hdp_mem_pwr_cntl, HDP_MEM_POWER_CTRL,
+						RC_MEM_POWER_CTRL_EN, 1);
+	}
+
 	WREG32_SOC15(HDP, 0, mmHDP_MEM_POWER_CTRL, hdp_mem_pwr_cntl);
 
 	/* restore IPH & RC clock override after clock/power mode changing */
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
