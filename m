Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1dAzBMhhKmoDogMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 09:20:40 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0409166F557
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 09:20:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=5mdryB4M;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D2110ED10;
	Thu, 11 Jun 2026 07:20:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013007.outbound.protection.outlook.com
 [40.107.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C2610ED10
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 07:20:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0fc6MyDHDlSsr2VfckZv7MmwnJRbILZNLvVlDYxJOjdHpw+O7FQERZmRRdYWzo/eLJU0UQ5ikaOc8+pMTARCSAYY+IaxLqWnDzB9ILpqlgSCZ0p2a58RfG7qlzSPndWjsScem2zUPFa8brDaRO14dp5ScsKuP09e8repmnRI5CHAKCGKdvHEwOfMqVeCf2oICIFkQIUMMGQWne0lZMtCI9EIrwtzMRJsPMVf4cq5fS2QL9RRS7+ekMvJ8TU/GQwMZeSiKkBKE0j01b8hKlFcbyV7TljzwgZDYlIYmbUDNrXBB+mli8R3IvYWYulti+c/ot5sKIEnRbv2aCvUFz8Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41Lfg11zTk7a0Jiy4BcfCvUjrxEdTKtMs1USWiTb9DA=;
 b=unwX5wGAtFrBYERhHbW22ZKM9CWY11JwETjJZZZi63Pi0bRpjeIWFAfc+OPxUS8RzazNAcNfrEjj3RVEx5SFDa1eqnScd1Qzn20J8tgs65WNdhcAvWtJkEG+tgBUKmZAw97C6oY2b13wjGQXEDxLnTdEp+VqOuoF1d6PFUMBbfkwuzDuYgPTV4GdOhD0s4Taakp2m+AKH+dbLXHHIdRKy2hzcnVFHuDilLhxmAwktPw3fr8JNctffyEPsI4nH85aoq4Ofb6F9rtGpbhCAAeCfxqpF37UKxzxjEA14GUH6nmZnFkKlkeeX96y+1f/LuloNBdhkAJrCOt03YwQb4epwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41Lfg11zTk7a0Jiy4BcfCvUjrxEdTKtMs1USWiTb9DA=;
 b=5mdryB4M1shll/2mpnGfN8saW0ablwZ64p3GU53o5xgo7svmW6zbppHT0eQqFcu91953UVLjrmMC39GNhXKWcgpNXN/PDwWHnnt3WUNf4WHyjZ+8Za9LfzrjwOaJjvw3byUQQRswAUGpzsxuP8GRyFhfK30zGI9LiiFBmuI3MMI=
Received: from BN9PR03CA0339.namprd03.prod.outlook.com (2603:10b6:408:f6::14)
 by IA1PR12MB6554.namprd12.prod.outlook.com (2603:10b6:208:3a2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Thu, 11 Jun
 2026 07:20:31 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:f6:cafe::7e) by BN9PR03CA0339.outlook.office365.com
 (2603:10b6:408:f6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Thu,
 11 Jun 2026 07:20:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 07:20:31 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 02:20:29 -0500
Received: from neptune-v2-01-host.tail61db7.ts.net (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41
 via Frontend Transport; Thu, 11 Jun 2026 02:20:28 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <mario.limonciello@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>
CC: <victor.zhao@amd.com>, <amd-gfx@lists.freedesktop.org>, Samuel Zhang
 <guoqing.zhang@amd.com>
Subject: [PATCH v2] drm/amd: add AMDGPU_DEBUG_HIBERNATION_THAW_RESUME_GPU
 debug mask
Date: Thu, 11 Jun 2026 15:19:07 +0800
Message-ID: <20260611071907.1906171-1-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|IA1PR12MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ebda5a-0863-43d8-2adc-08dec789ebcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: hsYLkMtEBc7yGaL8gT4Om30vDC0wjsoNur035MYLR91k8DcMXveG6MJ74MTvgTEbcbCPxiWJADBbC0DBOnkNNRC+DCL32eBv85UvgOmqyx7i8vPiyw/dxq0yrnL2Es3ytKXwCQxBuZ/6N8tp8EX84oFOWP6OXmOURIzht6K7+sRJLMQikK/izs4S4MFyFv3HwtCWHvBY/cs13tkO3tyqER2k5kRg8dAM82Sh0hs7ZazKWY5mZ0W2943m45MJWGFzROIKqobDjkrbrwyKKVH2oNzld5upbnP48yUzmFHehQxrhwN2xw83HfutMBq8YZeXNWCTg6R9PZm24hjBVtjEg8K5vkV89PAyN23u2xCgG33aROXdQlDzOJeiyxXB+b6b4YVRL4LHRaSIjT0qb7MbhTsrMedxiidZVz+N2Gsp1aRqYJad36ZR/c2LGVDLEmGVOppdyVUXYK9tAB3/OENzyU860Ezl+pucpXu9lmEZCBfympUpho7vyE7pD7OJw810IhBsucnJ77nd5YR4YB7rNhfKw/gHjIO91guk5XJcd7rszkzBRsadRu6MU8vYhZDo0HDDv4K4kBiGrO/38ZG7OYSB8ZHJEJbgh22+HW+1TWh/Uv56Etzu/7KLeG+rr/KjV02Xc88hoaefx/smrXEwVBeiek76CbzRS79AcPiaYvbTFqzSWdDazgHu6DD/pGr7zj0Vxo6NGhgZSfCyLZ55+JrF63HkE3i6lhpq0g+SCmA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7c32gJxHqqr0dFspqk15EeOM912VaBjvyioj9mfGLm/WWIFka11BP2qjXoDGVR3A2ANDRKn9eJuzH8EL5uUlEAlY25nrw7aZ2DKYJfx6UsLeLUraYz5yl8QG13lXUlXi7pakkA/+aGiU2ZMXCgTFKjAavvo2vd3Wtq9qWEO+FvWvloxgQZN+Q7QSbzu5FvbBtYsQc3SjSD3G9qmjsa14Jay0yBSEU7GknVOTBZu/mQBCE+QCpce/Cee6WCKJWpdOaOr1wFYl+HMxiWGMLseSVHRq6uka652AL9RMTnZUgl5sTeIthNY1So6bkdlDmgAS7c0wczfqLPr98iWaB8mc1pe0SonzClaNKngTkyWQOiI/kB+34ESU6pRCwIrkvLLYZhvaLH+qfm/let0vWbt03+PbVRq86y0xj21rDYeKM+Jf2poHxfr7JIl1e1Zvk0B5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 07:20:31.3303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ebda5a-0863-43d8-2adc-08dec789ebcd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6554
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:victor.zhao@amd.com,m:guoqing.zhang@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[guoqing.zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime];
	FROM_NEQ_ENVFROM(0.00)[guoqing.zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0409166F557

Kernel parameter `no_console_suspend` is required to capture all
hibernation kernel log via serial console. But when the parameter
is set, GPU will be resumed in thaw stage. This causes many issues
on alinux3 kernel.

Fix: add new debug mask `AMDGPU_DEBUG_HIBERNATION_THAW_RESUME_GPU` to
replace the check of `console_suspend_enabled` in thaw() callback.
User can enable it using `amdgpu.debug_mask=0x800`.

Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 +++++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 5f775c6e9240..45bf05306c90 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1136,6 +1136,7 @@ struct amdgpu_device {
 	bool                            debug_vm_userptr;
 	bool                            debug_disable_ce_logs;
 	bool                            debug_enable_ce_cs;
+	bool                            debug_hibernation_thaw_resume_gpu;
 
 	/* Protection for the following isolation structure */
 	struct mutex                    enforce_isolation_mutex;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 503bb64c1e55..b4120207bfa0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -33,7 +33,6 @@
 #include <drm/drm_vblank.h>
 
 #include <linux/cc_platform.h>
-#include <linux/console.h>
 #include <linux/dynamic_debug.h>
 #include <linux/module.h>
 #include <linux/mmu_notifier.h>
@@ -146,7 +145,8 @@ enum AMDGPU_DEBUG_MASK {
 	AMDGPU_DEBUG_SMU_POOL = BIT(7),
 	AMDGPU_DEBUG_VM_USERPTR = BIT(8),
 	AMDGPU_DEBUG_DISABLE_RAS_CE_LOG = BIT(9),
-	AMDGPU_DEBUG_ENABLE_CE_CS = BIT(10)
+	AMDGPU_DEBUG_ENABLE_CE_CS = BIT(10),
+	AMDGPU_DEBUG_HIBERNATION_THAW_RESUME_GPU = BIT(11),
 };
 
 unsigned int amdgpu_vram_limit = UINT_MAX;
@@ -2291,6 +2291,11 @@ static void amdgpu_init_debug_options(struct amdgpu_device *adev)
 		pr_info("debug: allowing command submission to CE engine\n");
 		adev->debug_enable_ce_cs = true;
 	}
+
+	if (amdgpu_debug_mask & AMDGPU_DEBUG_HIBERNATION_THAW_RESUME_GPU) {
+		pr_info("debug: resume gpu in thaw() of hibernation\n");
+		adev->debug_hibernation_thaw_resume_gpu = true;
+	}
 }
 
 static unsigned long amdgpu_fix_asic_type(struct pci_dev *pdev, unsigned long flags)
@@ -2705,9 +2710,10 @@ static int amdgpu_pmops_freeze(struct device *dev)
 static int amdgpu_pmops_thaw(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(drm_dev);
 
 	/* do not resume device if it's normal hibernation */
-	if (console_suspend_enabled &&
+	if (!adev->debug_hibernation_thaw_resume_gpu &&
 	    !pm_hibernate_is_recovering() &&
 	    !pm_hibernation_mode_is_suspend())
 		return 0;
-- 
2.43.0

