Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A941EABBF
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88956E33D;
	Mon,  1 Jun 2020 18:22:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121156E33D
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:22:14 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s1so9989529qkf.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lV/VH8Kjd6lnW2QwPUeXj0OkWHxDK+5PYuX8LMOv6fM=;
 b=VFC4AJncL6tbmkPRcoB/Fr2qMuLoDQZkpdCt+IliZNTX9ruuxExzfJTQElNf4jaCSx
 G7+ELsJucJ/+fCiwf1mXVs0D3YITBvezx4oejiEoh/b1TzdXauJUdkofHjM66h1gU9j9
 GFC8G459cBisEVxJAScgQ8RyRkmItPUdfg8V9bdJes9J4HyuRq23qAbbNdejuYl3FLWM
 BkgftbVRVVeoQQcRTZ+cF3dcLhESE+X5OTtxwoBpp3SP7JrgF9n+X1ztjStH3NSeVN3w
 PDstNlZ7yKqEKEFOV0CzOGpMGHZ9P5KQSdTtKqFGonLwrMymlg3Qyj09osBf11ca4jRX
 o0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lV/VH8Kjd6lnW2QwPUeXj0OkWHxDK+5PYuX8LMOv6fM=;
 b=YlV26F4WDSsxqn31A5ZwlfSPrET9aF3fqyYcHTkFyjAtl64uaFM3uWt+HCITD2vRYd
 wLMCc30LWAvmjqd1a+r2mcXXZ3Rk6krGsi5f8kswaC3tuw8YtzkehSS07TT3wOKSUS2r
 oIHu3O5yW2YxiM0F1Hla7bgwh1xI6RVJNVN1R3kHYPZT9mKgbfEfPBlaWBKS4T37nqzG
 fMNokBeUvKVM6wjh15h/hFv5yJmasNrQjeyL0s3gjXyzdlLjyLhtWklx0hRh6UAifFXs
 o4sCCobkA6gmaJ3UQXyWPiDIDUxoUqndTwc/JDTs/eAcOzhR/gTjLEUc+ZKdNcJzssEF
 cbfw==
X-Gm-Message-State: AOAM530jtFaXGkWpspm6bBbdTSf2ylB80jjq9SMzkwZ4pZJ+bX6jCToq
 Af6uU6ioCH5WqKmpvUxslI1BCKy/
X-Google-Smtp-Source: ABdhPJwj+QKO4IvWmXmKrC3abWSkCZXlWsVHyWBc6Tr15ARI26z/Z9qA4Bmlluj6hi1Vdcp1Gp/gWg==
X-Received: by 2002:a37:a511:: with SMTP id o17mr21649399qke.141.1591035733043; 
 Mon, 01 Jun 2020 11:22:13 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:22:12 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 143/207] drm/amdgpu: add stop DPG mode for VCN3.0
Date: Mon,  1 Jun 2020 14:19:50 -0400
Message-Id: <20200601182054.1267858-54-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>, James Zhu <james.zhu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Boyuan Zhang <boyuan.zhang@amd.com>

Add vcn_v3_0_stop_dpg_mode to power off in DPG mode for VCN3.0

V2: update description.

Signed-off-by: Boyuan Zhang <boyuan.zhang@amd.com>
Reviewed-by: James Zhu <james.zhu@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c | 34 +++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 5578af5cb399..c1aaa9423f5d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -1128,6 +1128,35 @@ static int vcn_v3_0_start(struct amdgpu_device *adev)
 	return 0;
 }
 
+static int vcn_v3_0_stop_dpg_mode(struct amdgpu_device *adev, int inst_idx)
+{
+	int ret_code = 0;
+	uint32_t tmp;
+
+	/* Wait for power status to be 1 */
+	SOC15_WAIT_ON_RREG(VCN, inst_idx, mmUVD_POWER_STATUS, 1,
+		UVD_POWER_STATUS__UVD_POWER_STATUS_MASK, ret_code);
+
+	/* wait for read ptr to be equal to write ptr */
+	tmp = RREG32_SOC15(VCN, inst_idx, mmUVD_RB_WPTR);
+	SOC15_WAIT_ON_RREG(VCN, inst_idx, mmUVD_RB_RPTR, tmp, 0xFFFFFFFF, ret_code);
+
+	tmp = RREG32_SOC15(VCN, inst_idx, mmUVD_RB_WPTR2);
+	SOC15_WAIT_ON_RREG(VCN, inst_idx, mmUVD_RB_RPTR2, tmp, 0xFFFFFFFF, ret_code);
+
+	tmp = RREG32_SOC15(VCN, inst_idx, mmUVD_RBC_RB_WPTR) & 0x7FFFFFFF;
+	SOC15_WAIT_ON_RREG(VCN, inst_idx, mmUVD_RBC_RB_RPTR, tmp, 0xFFFFFFFF, ret_code);
+
+	SOC15_WAIT_ON_RREG(VCN, inst_idx, mmUVD_POWER_STATUS, 1,
+		UVD_POWER_STATUS__UVD_POWER_STATUS_MASK, ret_code);
+
+	/* disable dynamic power gating mode */
+	WREG32_P(SOC15_REG_OFFSET(VCN, inst_idx, mmUVD_POWER_STATUS), 0,
+		~UVD_POWER_STATUS__UVD_PG_MODE_MASK);
+
+	return 0;
+}
+
 static int vcn_v3_0_stop(struct amdgpu_device *adev)
 {
 	uint32_t tmp;
@@ -1137,6 +1166,11 @@ static int vcn_v3_0_stop(struct amdgpu_device *adev)
 		if (adev->vcn.harvest_config & (1 << i))
 			continue;
 
+		if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
+			r = vcn_v3_0_stop_dpg_mode(adev, i);
+			continue;
+		}
+
 		/* wait for vcn idle */
 		SOC15_WAIT_ON_RREG(VCN, i, mmUVD_STATUS, UVD_STATUS__IDLE, 0x7, r);
 		if (r)
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
