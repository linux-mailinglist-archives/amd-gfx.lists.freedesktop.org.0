Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOphDjKqFWqJXAcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 16:12:02 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA065D72DB
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 16:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5B810E66D;
	Tue, 26 May 2026 14:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4DSOcp9x";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010062.outbound.protection.outlook.com
 [40.93.198.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FC110E66D
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 May 2026 14:11:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGi9dhRyX/mLlqZDjV1EHsiX2Nb4fGKkdFlcI7yDU3rrYvNxXibF/Z4dBOS1KIzi0P3oqfVpF9Fz1q8vPaWORdNXe8nIuHKdmcPKenRZHcxcKz2Mja3JBfZfuS00k4xUYJ1mNrEtF7xxsR8+zMMl0BBul1izzwGjQvslkaxD9dqMJ1rb+SFqwEPdz7IaP4ogJ/03wKyGnjvw+xmhVKDVWkhuW3x/MBWqv1JpIAf3jK5PqOeJuN6ybmB5AIVnHQfkSg7KBLDru2pu4bw2TgYFlqHydLt5W7P89o9VzvcSexB5cmG7k27zIOTUh+aOqV/F+GlkTmJuqhC2DOGLs0NX/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lThJDVAijv362mJDP7XbTSCU4tsr3uzarSFtJusWTwA=;
 b=WoVtX9Cjk2aP4kqw4sc/dWsp3jB8+c++0avVfPcjLcB2pWrXbnFyNwT2nuehtnABeAb37YX8s+aK91W0nAg9LvCmXYQw3Ft7n0H7Mu4F2qET77oHgwql5SAO1chp5dX0FSl9Ap82WMHA9Aui6tvm+rYohIawI3nmxRnrMqdYB6fBFC4scT2Fu7wjadW18r8uw6Ud7OoXXaaCzVw2awsyWjpD1j4pJcuYCOEzO1QFlQTI3ttDZiiN0aUPE6lp9g3zQAU5nl+dRiRdHdpYj1cEpYzqwrqR/FXTftcbdemWcclJU41JMBFlz4YhQy+01fGJnoa/uaeCu8NM6olgfp1Z5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lThJDVAijv362mJDP7XbTSCU4tsr3uzarSFtJusWTwA=;
 b=4DSOcp9xM2nR26YRXgh999aaD36ccTFf1w2J4OQcuQHnlpkck6jSAF+JPVmgmUQuJ9+c4xXmm/k1DQAOaMoFUF/y1Mi8e1719hPIlKxeAMQpedyBacz6snZyKMI6ySbXuql37RvdypAmIstDxnpxjKUuMMdF3VUztirB6PbQof4=
Received: from BN9PR03CA0678.namprd03.prod.outlook.com (2603:10b6:408:10e::23)
 by CH3PR12MB7593.namprd12.prod.outlook.com (2603:10b6:610:141::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 14:11:54 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::98) by BN9PR03CA0678.outlook.office365.com
 (2603:10b6:408:10e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 14:11:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 14:11:54 +0000
Received: from work-495456.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 26 May
 2026 09:11:50 -0500
From: James Zhu <James.Zhu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <Bing.Ma@amd.com>, <jamesz@amd.com>
Subject: [PATCH v4 03/17] drm/amdgpu: implement profiler ioctl
Date: Tue, 26 May 2026 10:11:15 -0400
Message-ID: <20260526141129.592886-3-James.Zhu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526141129.592886-1-James.Zhu@amd.com>
References: <20260526141129.592886-1-James.Zhu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|CH3PR12MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: 512428bb-4e8a-4db8-7705-08debb30bd66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|82310400026|376014|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info: u2+3yrHjyp+BLNu+6PRdsfVsTtF//8WQUjL6e/YZZGNmnqI6z20RSRYEFCYO/ROGl2PY5VWdyc0usYuvXfrZoDTeTyFn06zrH/4ELD3pGP/10rcDernC1S0TkwO3g8dox6jGFclj/DF6MGG7RL7F034YzDBiEqjIOk2iByDlk+RiNqHFI8cEF0IEY/AV/orLUWf4ApOHUMinZEn0Qdgea+eTgEqHEZ9PAbQzvTg6+D4fN37zFHpbCyUu2EumSp4YcUXSUXk1LWXQlgy1zYabI7uvF1O+5ktxYUVUXZQsryxvNA7oCBq5CMHGFiG8h9jfQMwi60zabJmW/DAUmRaav26ps0QG97VyJCdbS1BqI+2u+TZBeo3PWUbYvU50u0RAshpL9KF+FlCNMGs0kROKFjbHbMmwDhZZm5g2hNv4neKe19K5YwARP+Y5sRj221CgPc1+7q2wMnmF6LPy9pmzucH9Q3vD7KtnV0Vqnp47o9OTSy+S1kCVoAZc3XhYUhwz+zhXRMMo0IgO6c/l/RV7U+2G8rA75Wttb0m/mx33rTXUN9x/HaSlxScOrZatmOb36pbUG8d0xzLJvdq8xKDt2S0V78RY+VucrLBYZ5Vb5hNmFhrFpnZ1TWRHj3clWvoLM/vJ4H76KubJSpAF8IVYFHf1eavXZD1W1du5hEE7a571bvmKV5NqF5kW+/LDgZdI5t9Y/g8O2YrGC+/Zl8T/IaGs7hqXBReADv9hdYs2btU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(22082099003)(56012099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9GVKBop8Khhe2IqLvcjOJHBEHgiQrO5JV9m+FeKXLSY9+irxX05J1Y+yAMKCEaLxJ/k/sRztq+kdKN+V7RG4QW0UkDFy5Xzt/1kG18EWngla7Op5doz9wSpd9/hrlCLf3EsmV6xKJQ2YTKCj+O1o9v6gTu7ogKNbxrFxki0q3TC8k5PLCf0nzitAP2QY7LfRB2+C+dqVvJ9c0Qy7haGTOSU4z5CZ2HekEZdykq5+bSX/mcZ2Tj+l2quw3oeLrUSBe5TuG6o55QwrGxiRH5yBCpk+qcXRcHbykTvlSEq3fudELP2Vo3yZjUeyKPlKLcfSTtaXAS5LQR+QyVMwUCzcSDyWbkdq2AEEFDJAWwsuY9sWfK3hagmWXVwtySzWdIz1cMXJWA0ZiJUO57GgtijG2tOwmjOTm9QvMRRSR0cz829NUEVjUwSvd0rpHDycpuAW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 14:11:54.3210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 512428bb-4e8a-4db8-7705-08debb30bd66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7593
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
X-Spamd-Result: default: False [1.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[James.Zhu@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_NONE(0.00)[];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: DCA065D72DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

with wire up the DRM_AMDGPU_PROFILER ioctl introduced in the
UAPI patch by registering amdgpu_profiler_ioctl() as its
handler with DRM_AUTH|DRM_RENDER_ALLOW permissions.

Implement the first operation AMDGPU_PROFILER_VERSION, which
returns the profiler UAPI version to user space by packing
the major version into bits 31:16 and the minor version into
bits 15:0 of the args->version field. Unknown operations
return -EINVAL.

A helper macro AMDGPU_XCP_ID() is added to normalize the XCP
partition ID for display purposes: AMDGPU_XCP_NO_PARTITION
(device not yet initialized) is mapped to 0, while valid
partition IDs are passed through unchanged.

Signed-off-by: James Zhu <James.Zhu@amd.com>
Reviewed-by: Bing Ma <Bing.Ma@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c      |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_profiler.c | 25 ++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_profiler.h |  3 +++
 3 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 476d40dde319..6af189fe93b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -3080,6 +3080,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_SIGNAL, amdgpu_userq_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_LIST_HANDLES, amdgpu_gem_list_handles_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_PROFILER, amdgpu_profiler_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 };
 
 static const struct drm_driver amdgpu_kms_driver = {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_profiler.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_profiler.c
index ffe65664e1d4..f40d8de6771d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_profiler.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_profiler.c
@@ -32,6 +32,31 @@
 #define AMDGPU_PROFILER_VERSION_MAJOR 1
 #define AMDGPU_PROFILER_VERSION_MINOR 1
 
+int amdgpu_profiler_ioctl(
+		struct drm_device *dev,
+		void *data,
+		struct drm_file *filp)
+{
+	struct amdgpu_fpriv *fpriv = filp->driver_priv;
+	struct amdgpu_device *adev = fpriv_to_adev(fpriv);
+	struct drm_amdgpu_profiler_args *args = data;
+
+	dev_dbg(adev->dev, "Profiler IOCTL op %d on render node %d xcp %d",
+		args->op, adev->ddev.render->index, AMDGPU_XCP_ID(fpriv->xcp_id));
+
+	switch (args->op) {
+	case AMDGPU_PROFILER_VERSION:
+		args->version = AMDGPU_PROFILER_VERSION_MAJOR << 16 |
+					AMDGPU_PROFILER_VERSION_MINOR;
+		return 0;
+
+	default:
+		dev_dbg(adev->dev, "Invalid option: %i", args->op);
+	}
+
+	return -EINVAL;
+}
+
 int amdgpu_profiler_mgr_init(
 		struct amdgpu_profiler_mgr *prof_mgr,
 		struct amdgpu_fpriv *fpriv)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_profiler.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_profiler.h
index c33018f01d0c..e73a49c9a41f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_profiler.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_profiler.h
@@ -25,6 +25,7 @@
 #ifndef AMDGPU_PROFILER_H_
 #define AMDGPU_PROFILER_H_
 
+#define AMDGPU_XCP_ID(x) (x == AMDGPU_XCP_NO_PARTITION ? 0 : x)
 #define fpriv_to_prof_mgr(fpriv) (&(fpriv)->userq_mgr.adev->prof_mgr)
 #define fpriv_to_adev(fpriv) ((fpriv)->userq_mgr.adev)
 
@@ -40,6 +41,8 @@ struct amdgpu_profiler_mgr {
 	struct amdgpu_profiler_xcp_mgr prof_xcp_mgr[MAX_XCP];
 };
 
+int amdgpu_profiler_ioctl(struct drm_device *dev, void *data,
+					struct drm_file *filp);
 int amdgpu_profiler_mgr_init(struct amdgpu_profiler_mgr *prof_mgr,
 					struct amdgpu_fpriv *fpriv);
 void amdgpu_profiler_mgr_fini(struct amdgpu_profiler_mgr *prof_mgr,
-- 
2.34.1

