Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oHFKELdSVmqD3QAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 17:16:07 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FB37564E9
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 17:16:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="160Ed/3k";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F25089E69;
	Tue, 14 Jul 2026 15:16:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012049.outbound.protection.outlook.com
 [40.93.195.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F1989E69
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2026 15:16:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQGZXoK+c1V0K4LOqSGfqiU9a4EMNBH+DfN502Hy4h9XmN62gFJW1RoSVsX1B32oOfalldXO7e0I8pbTrB6qqweedrU7KEsgY/ifinXn4UL4zBR2WtNmk/0CQcziKOKWfnM7JTRc6kShwhDIIqrU7FFK5twyMTdgaeLThcS30mvPxEjxVg+7gG5WFbc9PrwZHUMaq/uyronWbb9tjQjAuWEbkuC8ogTY/ghG7N77C1XXicOZha+EJvjygwgMnCcHOp/6LU7Ayi1/uTaeKn7/YUq1D+CXcSNxIRf2ZKx5gzwvudQwm1kg2Uz63bIquX6Ow5NxDA3ECZlZrYR2DK+ZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IF8aHLUwm/8lOo0HwYwfjKBu0ib66adFBBFQerwfHI=;
 b=FN6DrAwXfZ9/t0MwHfnfHL7NDUHT7KNqefitXJ5ndLZq+DfuSAEAV1hrGWf5EWcS4tx82VhvB2EeGlHlrlAHMRQo8SO9fG+sArPshi87/jML/To+2B7ckfDRbzBY1QB/b2RbouV6PjdAyzpVdxPK7AEuzo04/QT8qm5rJEbC53+pktK+WtidD0/AnlRY9iO2RylOwn1ECtT/sabdEy2A1N7SYyUORBXoAVGA8StAX5aCkLaO3kheVo8utbONzlRmAbRrZ2JeHckv6z2cVfven8YGBBJCZG5u1hLhBZfD2l3v5SWTXVbTM4YGp9K7VOe5AJP/pqPr2zKcmrseTUeuog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IF8aHLUwm/8lOo0HwYwfjKBu0ib66adFBBFQerwfHI=;
 b=160Ed/3kzTr88syDL1v/cBxi1ufv5PyLN4kGk05IL1gQexGl9Si8qjrKtFQx7gPMmdsXoRZ1aseLzv6V1Y3MQqm2j9XNhFlEXPogoEYFKo+E0dHXiezcqezFsR+im1LsoBEw7NxOBFym992S1/BF0Az9xKp52+/T6WIMuAtVua4=
Received: from SJ0PR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:33f::12)
 by BL3PR12MB6523.namprd12.prod.outlook.com (2603:10b6:208:3bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 15:15:58 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::68) by SJ0PR05CA0037.outlook.office365.com
 (2603:10b6:a03:33f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.4 via Frontend Transport; Tue, 14
 Jul 2026 15:15:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 15:15:57 +0000
Received: from suresh-X570-AORUS-ELITE-WIFI.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Tue, 14 Jul 2026 10:15:56 -0500
From: Suresh Guttula <suresh.guttula@amd.com>
To: <Alexander.Deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: <suresh.guttula@amd.com>
Subject: [PATCH] drm/amdgpu : update mmhub eco sec lvl for vcn5_3
Date: Tue, 14 Jul 2026 20:45:36 +0530
Message-ID: <20260714151536.3315492-1-suresh.guttula@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|BL3PR12MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 3509030b-dad5-459e-c804-08dee1bace92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 3JadrajDFqOSiNfp17/uKB72qbJCRUeDq19JCiihd5NsUoBfhHpMSkO6E8zCiVtfodGr1+Sodh8NYFps+Ee/yq/ZCOyKdaXha8xI3l8aekHlYl5He0UYjbPpaCoaddDldx7srT64t91EMxV8CWAL+FYzR0eDSyDSVcPNX5Jn3d7EmLmMu7nzEeyKyQjx20TMDXHBf2o/lJhkI57MdXdmcBy2E7TzrMxihfNMecVd6ujGWmKaPCR6fvz2dQ9HHbGFNaG/Oi14QhPjtbsj8dq4z/H8oaRcvM9ZsKtTumIc3rShW45xPm+CkYrsdS564iKsjF0MU8QIqqlMoD+YsliYDX38+aE8Q5WlNrUl2dKMbsWaKydb+VL9sYMgvMROQYMkcjt4+rkAizAxITi4kAwjznX872Kq0Dp22M3SrDwTGcjrevdITjfL6A8q+SuDATsiFD+LeUQdzvuH+7SLlT/LiqtbrecbOHuQ77O20Jq+yABCHJKmkDPabH/ifv60sRdACAf/ZF00ucJa1uKpDY/njYyJCpFy0+svJ8YcEbjVpcZtO5DH0XnQKHVUHShi+wvUrKbsJXpL1Fn5fbcxj4Xj0d1979iI/WT5tixrV2PdbGI4+qNLziQ55BCw3gGkAoa0x1ONhTERBWiNpyEGAgBiflXf3pxmjmi+jHkw8s6KEFfPaW9bAYU27Gt2g8IXGQVu82TrcRlASLh8Tu8J3bZX6g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(18002099003)(3023799007)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rE0df/fo7uk354j5BF2okxbV2nbTTVYzsKAs7KuTHlkkS0QKSGCfxhkiRaatsvyz+VOGxpPugXIOOYWyaDA9HQBL2+sSaShguD4XlSwgo1gEZRIfrm7+7k7MAexGGoPACntm8+TU+I+sSZd7KP68TlSrWdl8b7c/p3/ch5+UA3xh65Rla+l2qmlSG4oN9/vnSAB6yM4DECvt400G6xQzBv8xp4kQRO2Z+aILyfZFiOYPVNIgJ4XsqkXXXsDjWYvRi12uR4BbfS/JAwaiROCaYs97AUuNY+u4dZ1/+hgwQjT4n79SFFWdEvogAFRCBgdgZg0GX6cNhUGv3O8ucIVFalb6VUn8R3waKpxUDP3PGMzdks8BdEtQRQbk2iyPoYWl9Z853r1O3DPx1SccigcKEyDCRSc0+q3NWg3yE5xWPWwjBtZjD/51K2UynkdPPZ7y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 15:15:57.8223 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3509030b-dad5-459e-c804-08dee1bace92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6523
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Alexander.Deucher@amd.com,m:suresh.guttula@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[suresh.guttula@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[suresh.guttula@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:from_mime,amd.com:mid,amd.com:email,amd.com:dkim,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77FB37564E9

This patch requests PSP to set the sec lvl for
vcn and jpeg.

Signed-off-by: Suresh Guttula <suresh.guttula@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c  | 27 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h  |  1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.c | 24 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h  |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c  | 26 +++++++++++++++++++++++
 5 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index a36cbfc1f6f1..64281553c6d7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -1222,6 +1222,33 @@ int psp_memory_partition(struct psp_context *psp, int mode)
 	return ret;
 }
 
+int psp_set_mmhub_eco_sec_level(struct amdgpu_device *adev)
+{
+	int ret;
+	struct psp_context *psp = &adev->psp;
+	struct psp_gfx_cmd_resp *cmd = acquire_psp_cmd_buf(psp);
+
+	cmd->cmd_id = GFX_CMD_ID_SET_MMHUB_ECO_SEC_LEVEL;
+
+	ret = psp_cmd_submit_buf(psp, NULL, cmd, psp->fence_buf_mc_addr);
+	if (ret) {
+		dev_err(psp->adev->dev,
+			"PSP request failed to set mmuhub eco sec level with ret=%d\n", ret);
+		release_psp_cmd_buf(psp);
+		return ret;
+	}
+
+	if (cmd->resp.status) {
+		dev_err(psp->adev->dev,
+			"MMHUB ECO SEC LEVEL command 0x%x failed, PSP response status: 0x%X\n",
+				cmd->cmd_id, cmd->resp.status);
+		ret = -EIO;
+	}
+	release_psp_cmd_buf(psp);
+
+	return ret;
+}
+
 static int psp_ptl_fmt_verify(struct psp_context *psp, enum amdgpu_ptl_fmt fmt,
 						 uint32_t *ptl_fmt)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
index 2d838b1b2b11..3d7744d60fac 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
@@ -656,5 +656,6 @@ int amdgpu_psp_reg_program_no_ring(struct psp_context *psp, uint32_t val,
 void amdgpu_psp_debugfs_init(struct amdgpu_device *adev);
 int amdgpu_psp_get_fw_type(struct amdgpu_firmware_info *ucode,
 			   enum psp_gfx_fw_type *type);
+int psp_set_mmhub_eco_sec_level(struct amdgpu_device *adev);
 
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.c
index 66d4c487eee5..4dcdbf84745e 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.c
@@ -399,6 +399,25 @@ static void jpeg_v5_3_0_stop_dpg_mode(struct amdgpu_device *adev, int inst_idx)
 	WREG32_SOC15(JPEG, inst_idx, regUVD_JPEG_POWER_STATUS, reg_data);
 }
 
+/**
+ * jpeg_v5_3_0_set_mmhub_eco_sec_level - set jpeg sec lvl reg
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * request psp to set secure lvl
+ */
+static int jpeg_v5_3_0_set_mmhub_eco_sec_level(struct amdgpu_device *adev)
+{
+	int r = 0;
+
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
+		//Request to PSP to program JPEG secure lvl
+		r = psp_set_mmhub_eco_sec_level(adev);
+	}
+
+	return r;
+}
+
 /**
  * jpeg_v5_3_0_start - start JPEG block
  *
@@ -424,6 +443,11 @@ static int jpeg_v5_3_0_start(struct amdgpu_device *adev)
 	if (r)
 		return r;
 
+	/* program JPEG secure lvl register */
+	r = jpeg_v5_3_0_set_mmhub_eco_sec_level(adev);
+	if (r)
+		return r;
+
 	/* JPEG disable CGC */
 	jpeg_v5_3_0_disable_clock_gating(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h b/drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h
index ac34bac3c839..ad618b78685f 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h
+++ b/drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h
@@ -110,6 +110,7 @@ enum psp_gfx_cmd_id
     GFX_CMD_ID_PERF_HW            = 0x0000004C,   /* performance monitor */
     GFX_CMD_ID_FB_FW_RESERV_ADDR  = 0x00000050,  /* Query FW reservation addr */
     GFX_CMD_ID_FB_FW_RESERV_EXT_ADDR = 0x00000051,  /* Query FW reservation extended addr */
+    GFX_CMD_ID_SET_MMHUB_ECO_SEC_LEVEL = 0x0000005D,  /* Set MMHUB ECO sec lvls on VCN block */
 };
 
 /* PSP boot config sub-commands */
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index 45580e9c4e0c..0ca87ab2bfc2 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -795,6 +795,27 @@ static int vcn_v5_0_0_start_dpg_mode(struct amdgpu_vcn_inst *vinst,
 	return 0;
 }
 
+/**
+ * vcn_v5_0_0_set_mmhub_eco_sec_level - set vcn sec lvl reg
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * request psp to set sec lvl
+ */
+static int vcn_v5_0_0_set_mmhub_eco_sec_level(struct amdgpu_device *adev)
+{
+	int r = 0;
+
+	if (amdgpu_ip_version(adev, VCN_HWIP, 0) == IP_VERSION(5, 3, 0)) {
+		if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
+			//Request to PSP to program VCN secure lvl
+			r = psp_set_mmhub_eco_sec_level(adev);
+		}
+	}
+
+	return r;
+}
+
 /**
  * vcn_v5_0_0_start - VCN start
  *
@@ -819,6 +840,11 @@ static int vcn_v5_0_0_start(struct amdgpu_vcn_inst *vinst)
 
 	fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
 
+	/* program VCN secure lvl register */
+	r = vcn_v5_0_0_set_mmhub_eco_sec_level(adev);
+	if (r)
+		return r;
+
 	if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
 		return vcn_v5_0_0_start_dpg_mode(vinst, adev->vcn.inst[i].indirect_sram);
 
-- 
2.43.0

