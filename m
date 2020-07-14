Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF26C21F952
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 20:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596C46E864;
	Tue, 14 Jul 2020 18:25:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57926E864
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 18:24:59 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id r22so16480466qke.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 11:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wxt2UO7MVqZwn3vy+eEwKDL1dvEQ2rt/LoMpy6NP+1M=;
 b=D6cDddLR5z+oQAXB56V7wIwxHeeNC06Nvfw7MTzzNEVySQI7otrbXClMQLroAFwuau
 dnLPvXvvulhAG6UWAo/GzwbYRl37KAGYmj3EywHrD916APtucOwZNlJaM+dcmjdKzB36
 LUeuHt3TrZVxyOgCMBECunOnYo/N9CGEGRod4t11V6MFrdaRZR6WX5HW1FAGN/w/3Rze
 Fw7pYqmbkle0EFlpIzwabUzNpX5rf7SH6aEv3cLiJ6fvG+/C8oN+TKqMoKdC/mMje/9g
 NZoR1UgsbIVuXMImh2dmij9IEJoIMEnqlZXtC0E23fhxUq+NI0NLVq3AhCve8LRrRbL2
 ZSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wxt2UO7MVqZwn3vy+eEwKDL1dvEQ2rt/LoMpy6NP+1M=;
 b=Y/WMgg5dA8McPFlqZOV+ST2U4LmHjIwOn4f/NuHA/eKkuynavs+36kLQIyNMx2w2WK
 GuDj2tD4dJ0EMgodc9sOjNJltcuICvE1uACe+r+ipPXgtlF43FT+kuW71uV7M3gN4nPo
 9t+3sLIsUQUTfTjHsQBKIf4mouDYaYMm6YLQqx0/4tg+kdVaIelIO+uS/U/j/bxI+Al5
 NyAkIQ6OOEVotJLE2g6ZY51nJIk/izzShBGxk1bjS5tDtWb6pxvLWsLFocyhMddHVAJv
 uoRR1YOHud4sOQmscLOOOxQB2bXDohl928MuVL7yCCRDvxzqZcbfm5b8/FkmHDoxH13i
 qvXw==
X-Gm-Message-State: AOAM5321oqEDlU66SvcGaxFdMOi0mE9XARSy7+yBT9AEySisPuwo6M+p
 9lwE/ZxqbBQZIgn0QNLqzj8v/uZ4
X-Google-Smtp-Source: ABdhPJwG1f8Fo9YQ/pUyrtyLikoMbdHKERP2p04L4TWbrpL0u9gFGXkGUXDJ94tLQQrUXJXOEB+dEg==
X-Received: by 2002:a37:b941:: with SMTP id j62mr5748314qkf.233.1594751098915; 
 Tue, 14 Jul 2020 11:24:58 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id d53sm26046456qtc.47.2020.07.14.11.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:24:58 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 38/42] drm/amd/powerplay: set VCN1 pg only for sienna_cichlid
Date: Tue, 14 Jul 2020 14:23:49 -0400
Message-Id: <20200714182353.2164930-39-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200714182353.2164930-1-alexander.deucher@amd.com>
References: <20200714182353.2164930-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Jiansong Chen <Jiansong.Chen@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jiansong Chen <Jiansong.Chen@amd.com>

navy_flounder has one VCN instance, and the work around
is to avoid smu reponse error when setting VCN1 pg for
the chip. It is preferred VCN0 and VCN1 are separated
for the pg setting so better power efficiency can be
achieved.

Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../drm/amd/powerplay/sienna_cichlid_ppt.c    | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
index 79d7159a871e..c74c4e866859 100644
--- a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
@@ -644,6 +644,8 @@ static int sienna_cichlid_dpm_set_vcn_enable(struct smu_context *smu, bool enabl
 {
 	struct smu_power_context *smu_power = &smu->smu_power;
 	struct smu_power_gate *power_gate = &smu_power->power_gate;
+	struct amdgpu_device *adev = smu->adev;
+
 	int ret = 0;
 
 	if (enable) {
@@ -652,9 +654,12 @@ static int sienna_cichlid_dpm_set_vcn_enable(struct smu_context *smu, bool enabl
 			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_PowerUpVcn, 0, NULL);
 			if (ret)
 				return ret;
-			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_PowerUpVcn, 0x10000, NULL);
-			if (ret)
-				return ret;
+			if (adev->asic_type == CHIP_SIENNA_CICHLID) {
+				ret = smu_send_smc_msg_with_param(smu, SMU_MSG_PowerUpVcn,
+								  0x10000, NULL);
+				if (ret)
+					return ret;
+			}
 		}
 		power_gate->vcn_gated = false;
 	} else {
@@ -662,9 +667,12 @@ static int sienna_cichlid_dpm_set_vcn_enable(struct smu_context *smu, bool enabl
 			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_PowerDownVcn, 0, NULL);
 			if (ret)
 				return ret;
-			ret = smu_send_smc_msg_with_param(smu, SMU_MSG_PowerDownVcn, 0x10000, NULL);
-			if (ret)
-				return ret;
+			if (adev->asic_type == CHIP_SIENNA_CICHLID) {
+				ret = smu_send_smc_msg_with_param(smu, SMU_MSG_PowerDownVcn,
+								  0x10000, NULL);
+				if (ret)
+					return ret;
+			}
 		}
 		power_gate->vcn_gated = true;
 	}
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
