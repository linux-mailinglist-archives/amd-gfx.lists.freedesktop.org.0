Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3286C88CAF0
	for <lists+amd-gfx@lfdr.de>; Tue, 26 Mar 2024 18:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEB610F172;
	Tue, 26 Mar 2024 17:31:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CD310F17C;
 Tue, 26 Mar 2024 17:31:50 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 42QHVjVC2324656; Tue, 26 Mar 2024 23:01:45 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 42QHVj7W2324649;
 Tue, 26 Mar 2024 23:01:45 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH] drm/amdgpu: add IP's FW information to devcoredump
Date: Tue, 26 Mar 2024 23:01:42 +0530
Message-Id: <20240326173142.2324624-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Add FW information of all the IP's in the devcoredump.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 44c5da8aa9ce..d598b6520ec9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -69,6 +69,124 @@ const char *hw_ip_names[MAX_HWIP] = {
 	[PCIE_HWIP]		= "PCIE",
 };
 
+static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
+				       struct drm_printer *p)
+{
+	uint32_t version;
+	uint32_t feature;
+	uint8_t smu_program, smu_major, smu_minor, smu_debug;
+
+	drm_printf(p, "VCE feature version: %u, fw version: 0x%08x\n",
+		   adev->vce.fb_version, adev->vce.fw_version);
+	drm_printf(p, "UVD feature version: %u, fw version: 0x%08x\n", 0,
+		   adev->uvd.fw_version);
+	drm_printf(p, "GMC feature version: %u, fw version: 0x%08x\n", 0,
+		   adev->gmc.fw_version);
+	drm_printf(p, "ME feature version: %u, fw version: 0x%08x\n",
+		   adev->gfx.me_feature_version, adev->gfx.me_fw_version);
+	drm_printf(p, "PFP feature version: %u, fw version: 0x%08x\n",
+		   adev->gfx.pfp_feature_version, adev->gfx.pfp_fw_version);
+	drm_printf(p, "CE feature version: %u, fw version: 0x%08x\n",
+		   adev->gfx.ce_feature_version, adev->gfx.ce_fw_version);
+	drm_printf(p, "RLC feature version: %u, fw version: 0x%08x\n",
+		   adev->gfx.rlc_feature_version, adev->gfx.rlc_fw_version);
+
+	drm_printf(p, "RLC SRLC feature version: %u, fw version: 0x%08x\n",
+		   adev->gfx.rlc_srlc_feature_version,
+		   adev->gfx.rlc_srlc_fw_version);
+	drm_printf(p, "RLC SRLG feature version: %u, fw version: 0x%08x\n",
+		   adev->gfx.rlc_srlg_feature_version,
+		   adev->gfx.rlc_srlg_fw_version);
+	drm_printf(p, "RLC SRLS feature version: %u, fw version: 0x%08x\n",
+		   adev->gfx.rlc_srls_feature_version,
+		   adev->gfx.rlc_srls_fw_version);
+	drm_printf(p, "RLCP feature version: %u, fw version: 0x%08x\n",
+		   adev->gfx.rlcp_ucode_feature_version,
+		   adev->gfx.rlcp_ucode_version);
+	drm_printf(p, "RLCV feature version: %u, fw version: 0x%08x\n",
+		   adev->gfx.rlcv_ucode_feature_version,
+		   adev->gfx.rlcv_ucode_version);
+	drm_printf(p, "MEC feature version: %u, fw version: 0x%08x\n",
+		   adev->gfx.mec_feature_version, adev->gfx.mec_fw_version);
+
+	if (adev->gfx.mec2_fw)
+		drm_printf(p, "MEC2 feature version: %u, fw version: 0x%08x\n",
+			   adev->gfx.mec2_feature_version,
+			   adev->gfx.mec2_fw_version);
+
+	drm_printf(p, "IMU feature version: %u, fw version: 0x%08x\n", 0,
+		   adev->gfx.imu_fw_version);
+	drm_printf(p, "PSP SOS feature version: %u, fw version: 0x%08x\n",
+		   adev->psp.sos.feature_version, adev->psp.sos.fw_version);
+	drm_printf(p, "PSP ASD feature version: %u, fw version: 0x%08x\n",
+		   adev->psp.asd_context.bin_desc.feature_version,
+		   adev->psp.asd_context.bin_desc.fw_version);
+
+	drm_printf(p, "TA XGMI feature version: 0x%08x, fw version: 0x%08x\n",
+		   adev->psp.xgmi_context.context.bin_desc.feature_version,
+		   adev->psp.xgmi_context.context.bin_desc.fw_version);
+	drm_printf(p, "TA RAS feature version: 0x%08x, fw version: 0x%08x\n",
+		   adev->psp.ras_context.context.bin_desc.feature_version,
+		   adev->psp.ras_context.context.bin_desc.fw_version);
+	drm_printf(p, "TA HDCP feature version: 0x%08x, fw version: 0x%08x\n",
+		   adev->psp.hdcp_context.context.bin_desc.feature_version,
+		   adev->psp.hdcp_context.context.bin_desc.fw_version);
+	drm_printf(p, "TA DTM feature version: 0x%08x, fw version: 0x%08x\n",
+		   adev->psp.dtm_context.context.bin_desc.feature_version,
+		   adev->psp.dtm_context.context.bin_desc.fw_version);
+	drm_printf(p, "TA RAP feature version: 0x%08x, fw version: 0x%08x\n",
+		   adev->psp.rap_context.context.bin_desc.feature_version,
+		   adev->psp.rap_context.context.bin_desc.fw_version);
+	drm_printf(
+		p,
+		"TA SECURE DISPLAY feature version: 0x%08x, fw version: 0x%08x\n",
+		adev->psp.securedisplay_context.context.bin_desc.feature_version,
+		adev->psp.securedisplay_context.context.bin_desc.fw_version);
+
+	/* SMC firmware */
+	version = adev->pm.fw_version;
+
+	smu_program = (version >> 24) & 0xff;
+	smu_major = (version >> 16) & 0xff;
+	smu_minor = (version >> 8) & 0xff;
+	smu_debug = (version >> 0) & 0xff;
+	drm_printf(p,
+		   "SMC feature version: %u, program: %d, fw version: 0x%08x (%d.%d.%d)\n",
+		   0, smu_program, version, smu_major, smu_minor, smu_debug);
+
+	/* SDMA firmware */
+	for (int i = 0; i < adev->sdma.num_instances; i++) {
+		drm_printf(p,
+			   "SDMA%d feature version: %u, firmware version: 0x%08x\n",
+			   i, adev->sdma.instance[i].feature_version,
+			   adev->sdma.instance[i].fw_version);
+	}
+
+	drm_printf(p, "VCN feature version: %u, fw version: 0x%08x\n", 0,
+		   adev->vcn.fw_version);
+	drm_printf(p, "DMCU feature version: %u, fw version: 0x%08x\n", 0,
+		   adev->dm.dmcu_fw_version);
+	drm_printf(p, "DMCUB feature version: %u, fw version: 0x%08x\n", 0,
+		   adev->dm.dmcub_fw_version);
+	drm_printf(p, "PSP TOC feature version: %u, fw version: 0x%08x\n",
+		   adev->psp.toc.feature_version, adev->psp.toc.fw_version);
+
+	version = adev->mes.kiq_version & AMDGPU_MES_VERSION_MASK;
+	feature = (adev->mes.kiq_version & AMDGPU_MES_FEAT_VERSION_MASK) >>
+		  AMDGPU_MES_FEAT_VERSION_SHIFT;
+	drm_printf(p, "MES_KIQ feature version: %u, fw version: 0x%08x\n",
+		   feature, version);
+
+	version = adev->mes.sched_version & AMDGPU_MES_VERSION_MASK;
+	feature = (adev->mes.sched_version & AMDGPU_MES_FEAT_VERSION_MASK) >>
+		  AMDGPU_MES_FEAT_VERSION_SHIFT;
+	drm_printf(p, "MES feature version: %u, fw version: 0x%08x\n", feature,
+		   version);
+
+	drm_printf(p, "VPE feature version: %u, fw version: 0x%08x\n",
+		   adev->vpe.feature_version, adev->vpe.fw_version);
+}
+
 static ssize_t
 amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 			void *data, size_t datalen)
@@ -118,6 +236,10 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 		}
 	}
 
+	/* IP firmware information */
+	drm_printf(&p, "\nIP Firmwares\n");
+	amdgpu_devcoredump_fw_info(coredump->adev, &p);
+
 	if (coredump->ring) {
 		drm_printf(&p, "\nRing timed out details\n");
 		drm_printf(&p, "IP Type: %d Ring Name: %s\n",
-- 
2.34.1

