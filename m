Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f91WFssTV2rtFAEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 06:59:55 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FD175A960
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 06:59:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=fhsrD0QC;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD5E10E138;
	Wed, 15 Jul 2026 04:59:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010036.outbound.protection.outlook.com [52.101.61.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5212010E138
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 04:59:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtrL48AHn392oPFDkmgHphWrOca5IC9TCAXREJr0ZFwlcAvI09kTlnTLyW0uOfbInk8KgrUK2Cz2otMj8vtSKWHAPtVZ+lzHX1RE/4NW+GxhdHYzY5qn3dX3oQsM0arnYS+i7899fxqr6C7xRBsQzMg6C8eF+LEcxF1hFFQ9oHGuF5UkppC6wJG7DJHLuGlYyW3RlKx8is/3+mbSLBVQsqDGF7g79iBJbL3F2/apaxv8UsLym6Cb8M7hslmAIZhdBbQ/SmuxW6WKOQLSm2b1piDrBvd8KUFr8hZYdqCPUv/D5u+rJR+wlH3iubeb/S2pQvC/kdFBcNHqls0c45qLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eq1fo5mtuzOlP8poD8spP8nbvNS935VHGkSZKKZxIyI=;
 b=fWjiQGmmdnRcc7N4YUsNIycDLIHZuzTuL01C97/5VdFMAZpModkqs3xYa4fNo3mgIMjE2/MO2zMLaEmg70gAYSI5YVGBJkp9kbIRxlAWddcw5pOc7bbsYXhbsg2bvcAO7TeA3ih/xbbn9xmybbUwl9+PH+ZqLUL0q973TgMz09avWOcYKSO3qXGwNSkztBDFS5Rp7KoOF05PME3Aa5q/Ad8gpS+j7gl4WYAdGtISn0ciJmeQ9vAKjiBTnvc7R1xVityi7TOPHRtsSuwcvwcsTYg/bw6nNJSNsnMG7zUIgFsKX+KT2GxNmOMRAJUf2iGvP9LS1tSghZ5Vr7MIILW+kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eq1fo5mtuzOlP8poD8spP8nbvNS935VHGkSZKKZxIyI=;
 b=fhsrD0QCV8cyNxrylF+TwWcmNq5gyNSGwaPZeJM/xbKcXOnWTC4GPmBvbljwpN3/AN5FrLh+xwabkmkKYhkWREa+OY8J8ORlKDLxQCI8BW7T4hcahFHleFUI1QQpDNTeOBmafQiOI0WlXYrDM2HcCp2lSko/JSpvN3/dE6OHhdA=
Received: from MN2PR03CA0011.namprd03.prod.outlook.com (2603:10b6:208:23a::16)
 by PH7PR12MB6934.namprd12.prod.outlook.com (2603:10b6:510:1b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 04:59:43 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::aa) by MN2PR03CA0011.outlook.office365.com
 (2603:10b6:208:23a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Wed,
 15 Jul 2026 04:59:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 04:59:42 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 14 Jul
 2026 23:59:41 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] drm/amdgpu: Add bounds checking for debugfs PCIE register
 access
Date: Tue, 14 Jul 2026 23:59:32 -0500
Message-ID: <20260715045933.2671282-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|PH7PR12MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: abcdb74e-8c08-4726-90b6-08dee22de1d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|6133799003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: VSNHBuMzNaeHyydovXLow5j4XQiGbaQW3ixzL8D5H1yrKE79ZNIQahnOpepru8Y8TMLy2ZBVoFZEI+g9Fazu6Zffa/4hq72fverzmlzqKwVfv+lDEqHFJKM7jkB1ZUe5cnRbCOFEM38nkAU2ft1SBt+ZCafCm5J8nsUx8SxFwc4fmfp3FGuWDcnRupSftFIzdR2QQv5w1bmXIVl72/Vn5dTLmSVyVc8Kfh2eSuv9cxeuOmKVfX/9kQW5s+A+Xz64viVtPreCZYC5skdOSAfyHRnz6SGiYto4kXI2qbTO+5Z5+e73JKauci7LyhJT/x3AaxgothkhYf86q4hC9AlKI/Qd4QN80lyEPMxzvlu3L/vWTuiPXAsY66cHlqbUkInwuyoMRwyPhJzSbFEBPHb39h9PLiYK9qynFC3C7IREKKJcGXEuh05fVq2gMiveAU0iiGqT9BVQr4ycoxO13a4pOb/WYtocEd1z+Kjtz7zo5GnqMXBoQAOPekMXcPqyb1fkYpeKkCQafJlC/MvycYpSPId7nG07L0Udou8kaW++FcHySIf8+Wh7i/80XcGiKQnb7ErwqF1RVn/zaGFsL0aBdXHJt3LrqcnmA2PlCSdAblPlJrmf8cYQLWLA43eLRQOF9okgMWaTaEUTCYqebrPjBT3E6TduR8HSm8SoIPLGh2/hWC64dHrvCYrTqjre7IcrhV6JZfmBeHMtwjy/Hc4YMg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(6133799003)(56012099006)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oDiMC3eyHhGrqG9LonDgIUju79UVz9VBiqcpDBNeP45HHiYv8ajovdnuU0TVXmCJ77/ZvdZ/Eh4wNxK15/P6L0QC7X5c/s2PqDZU7yL4OOT7hiL3NVCyaurNpd1tGEMhG0apiy/S2CZeCTWInZXoq833BKdROtG6Po9tHPUH/MjHuNhl8KFVPcKI7fJuCB47xLpbMHcNOLYAZAzq5Lcx+3/eaz6E9R4+deNdI8v7Nc42GUWLyo7bLLuIkxbSAB2Fm41RlYwpNthHDDJjehBzwSMzX8YaZK6pQ/MsUOD89HYrQRwWsboErcELHA7s21BZ/ApYOZP1pvgObLEmpubwOcHELcOLSZBjmG+pAI6OSfJzOL++/f9rTHhxWpPb96QQjlkFsWQwjO9ZR3wBQlUSs1yXAU9s74QvYq5T8WsC8jLDP5isdc2zy7j9I+47XUdP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 04:59:42.2966 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abcdb74e-8c08-4726-90b6-08dee22de1d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6934
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:mid,amd.com:email,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6FD175A960

Add validation to reject register offsets exceeding U32_MAX in the
amdgpu_regs_pcie debugfs read and write functions. PCIE register
addresses are 32-bit values, and allowing larger offsets could lead
to undefined behavior when passed to the underlying register access
functions.

Return -EINVAL when the offset is out of range rather than attempting
to access an invalid register address.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index deab64765388c..756cd58bc8484 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -522,6 +522,9 @@ static ssize_t amdgpu_debugfs_regs_pcie_read(struct file *f, char __user *buf,
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;
 
+	if (*pos > U32_MAX)
+		return -EINVAL;
+
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
 		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
@@ -581,6 +584,9 @@ static ssize_t amdgpu_debugfs_regs_pcie_write(struct file *f, const char __user
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;
 
+	if (*pos > U32_MAX)
+		return -EINVAL;
+
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
 		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-- 
2.43.0

