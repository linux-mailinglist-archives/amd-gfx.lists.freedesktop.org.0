Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gkzDDYIcJ2o+sAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 08 Jun 2026 21:48:18 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D528665A27A
	for <lists+amd-gfx@lfdr.de>; Mon, 08 Jun 2026 21:48:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=bANNkk2N;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB4F10F955;
	Mon,  8 Jun 2026 19:48:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BEC10F953
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jun 2026 19:48:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZhkGuqPRAl1mo6LFrn/AI2U1AK4kSjGVrPvjfrtcrF37p7ljgy0xsg2rg8rh15QvTBTs53PWCt9LMDSDM42fxBMI2SWuFZWQtjDRF2vxISO3a5hlpDSe+S1do5E7LKOco4MVA+QRHnd3fKSMOKTjrA2+91bl3jBd3sef2QkY7nRrB4wQBoRlMi47pJJ/md/LRKrb9smG2D1zdUlo3Fr2vw34B1MLuA6hJNDchSVfw6qQ8dBHEwCMUbrVupgl4fEezQcGQvVWoGEMeR92VjBO2jh+ZXnJHNyb9MTxve5z8ez+LMJVQ5SZJSZOV8JVSXcyHZ2thflwNLRf9Dq8yWzrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkF3ZwD2rx5Cu7VSTHinRdbgFzXzaFGmFvWcHMW8OwU=;
 b=jO4eO4Tr+Lzho0cIo99YHliCLeW7EJ6d3gIkbsNFVdgNmZ9AcvItL5+ZXcxvZ6x+pTWj4GNYpZf3x86WAXc2NrSXRsd034jzlAMt/pjr/8XX1fbLDpB4lKzjTTIEpxiVCcscrK8WNgDPuf/m+eIGnSZk/QnClTG18qri6fzd06ve0p49pxG7zl2cxW8DbjSIkIik8HY5hnPPkzU7qJGyKeiTbZi927mxMPFm4VDv3s1vcc1Cb1s4rLCTgP6jXPtzAjYIEeBVTp4cvbihlfRSL4J0ESn9UDx6DMgOqNv0ovtsNF3VEVkzhj5g3TmZ2SrZzKu2lch0v90msOeNqcnFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkF3ZwD2rx5Cu7VSTHinRdbgFzXzaFGmFvWcHMW8OwU=;
 b=bANNkk2N21komdyXPa06gcna8ZNlFyrbKpvjhwC88+Mo7/vIjN48sU2mnxhvS/hhp8tFUa2y6wQJkUTjLs+ho9MH/N35Xf0jlaTFOV8vxqndzh7OWjyRDkRPMOIMONYdZZjl7yAgxajc1kQ8S74mG8I61FEHc8mLQ44m0pyJhOw=
Received: from CY5PR22CA0063.namprd22.prod.outlook.com (2603:10b6:930:80::9)
 by IA0PPF80FB91A80.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 19:48:10 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:930:80:cafe::4f) by CY5PR22CA0063.outlook.office365.com
 (2603:10b6:930:80::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 19:48:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 19:48:10 +0000
Received: from amd-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 8 Jun
 2026 14:48:04 -0500
From: Shahyan Soltani <shahyan.soltani@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alexander Deucher <alexander.deucher@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Shahyan Soltani <shahyan.soltani@amd.com>
Subject: [PATCH v2 09/11] drm/amdgpu: include amdgpu_uid.h only where needed
Date: Mon, 8 Jun 2026 15:47:39 -0400
Message-ID: <20260608194741.1590055-10-shahyan.soltani@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608194741.1590055-1-shahyan.soltani@amd.com>
References: <20260608194741.1590055-1-shahyan.soltani@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|IA0PPF80FB91A80:EE_
X-MS-Office365-Filtering-Correlation-Id: 092f1d2f-b9fc-4ceb-5e94-08dec596deaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|1800799024|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mQCrflxkVz8LmXAJnmJzesgrSsqOcGhYpwsRTUfi3ZrN2yY1cTZeE/jBN6s4wQmMixfiYmSx/TCpvMzwR0qsPwhgNOXZ54zOc+e0pFn3FhKz3AzydLh1NdTB3gvDuLjjFBhlR07Bx0oxkBwei7Zt1n6chmNbrJvlyjiu6CVQcTd9zgz1SQfIf2NCTfBqZKDxjdGQcra3pCwP+nqiw1NdApPhCIWhhTyPf82Hg7RmTtH1UuLKeZfZIgF3GMLnoMvd/yJLyuoMyaBrqT+DriPyUyzmXdHXyQN5KmFLRF7ikOp25MqXx7paW3orlR/7a8lOYwT8Jv3JAu8WlXTMkMX3BHteMvjKMxFBUNmLrBw5gdG/wXBVa4Fl/8WaTJImWJTEt3N5H6oi2KH/if4fNgDtkLFfjsn38Lvlw9t4TNUomMMJ5+fagFf6QTvmz+KgCkFFrzZjKKqX3HlOhJuSPvtZ+ty2yDnd26Xv7JElytj9t8OYHArjie0Ey/GvBsH0yWukbZpekAve/FSc9LCGAxneC18bPuEbPiQ9VyxYnfET8Ge3MmAGowhHuGc4WH8S7ArdTYh8xdYhylnOixfV92TnqgrjfelcBd3J6xV5hO9QlcIQcb80PNoPB6rPSN13O4pYurM0v0Kvm/TPOaPFE0Rcqgy9NNrlsq8GYBAmN6CDY4LIKwfejsT0RAFPSRqR5BFcIx08ZAM5U2jnpt45nivWb+LogtlaMdu6Xp/1RNGTE+s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4aqOKL1Xu0bP/wW+luWK3HbJ7u9ajK3JwzIBgogPHh5h9nTpYku9zrjGRK1Z3Gmv9lq0sB4hrif3h5pCa9TvKL1guhdmdvqBQfEQ4x4DFt/f8yJ9dsJX3Wbj4B8zwN69XZsLFllgZ/S4JFr3YHh4GaEljzqsaF8FZleJ9maZ664thUtM/iSoYbj/xTFSrT6eKEiONR1U6jdfbM797eAY6g7dfTvHwqcQUfCw+0soU3HrPwGwzYX3AXJdVeYgSdYKg56teQxVyNHFu8KhHrSuyzmDGgF/rQ/56HD0yMwldd4S44zvkArhFPdfi2E+Hd3qIVkjJiRH5KRHXPze/n17QRW9wx51WzT5LWKppmdJp4UYMHRwVQiWMabyMTRggmllIFHoaL/FlXNaWCr266qiCgNIIDfY2Lt2vTNHL+zijUSfMR452HOwwt186xWlESGR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 19:48:10.3791 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 092f1d2f-b9fc-4ceb-5e94-08dec596deaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF80FB91A80
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
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[shahyan.soltani@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D528665A27A

Remove #include "amdgpu_uid.h" from amdgpu.h and add a foward declaration
of struct amdgpu_uid.

Add #include "amdgpu_uid.h" into files amdgpu_device.c, amdgpu_xcp.c,
smu_v13_0_12_ppt.c, smu_v13_0_6_ppt.c, and smu_v15_0_8_ppt.c.

Signed-off-by: Shahyan Soltani <shahyan.soltani@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                   | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c            | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c               | 1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c | 1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c  | 1 +
 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c  | 1 +
 6 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index a29987567a0b..06e61d66dcf3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -117,7 +117,6 @@
 #include "amdgpu_acpi.h"
 #include "amdgpu_mqd.h"
 #include "amdgpu_init_level.h"
-#include "amdgpu_uid.h"
 #include "amdgpu_video_codecs.h"
 #if defined(CONFIG_DRM_AMD_ISP)
 #include "amdgpu_isp.h"
@@ -329,6 +328,7 @@ struct amdgpu_hive_info;
 struct amdgpu_reset_context;
 struct amdgpu_reset_control;
 struct amdgpu_coredump_info;
+struct amdgpu_uid;
 
 enum amdgpu_cp_irq {
 	AMDGPU_CP_IRQ_GFX_ME0_PIPE0_EOP = 0,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 602e7eb1cc5c..20b67897d7ff 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -78,6 +78,7 @@
 #include "amdgpu_reset.h"
 #include "amdgpu_virt.h"
 #include "amdgpu_dev_coredump.h"
+#include "amdgpu_uid.h"
 
 #include <linux/suspend.h>
 #include <drm/task_barrier.h>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
index 389f69c7d5c3..2c990a1800d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
@@ -23,6 +23,7 @@
 #include "amdgpu.h"
 #include "amdgpu_xcp.h"
 #include "amdgpu_drv.h"
+#include "amdgpu_uid.h"
 
 #include <drm/drm_drv.h>
 #include "../amdxcp/amdgpu_xcp_drv.h"
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c
index 7193e3e4946a..edb0a23fb77a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c
@@ -35,6 +35,7 @@
 #include <linux/pci.h>
 #include "smu_cmn.h"
 #include "amdgpu_ras.h"
+#include "amdgpu_uid.h"
 
 #undef MP1_Public
 #undef smnMP1_FIRMWARE_FLAGS
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index ce520f43ab94..799ef8dbe66c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -50,6 +50,7 @@
 #include "mp/mp_13_0_6_offset.h"
 #include "mp/mp_13_0_6_sh_mask.h"
 #include "umc_v12_0.h"
+#include "amdgpu_uid.h"
 
 #undef MP1_Public
 #undef smnMP1_FIRMWARE_FLAGS
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c
index 2105a1d7bb34..c241fe5f2e09 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c
@@ -36,6 +36,7 @@
 #include "mp/mp_15_0_8_sh_mask.h"
 #include "smu_v15_0.h"
 #include "amdgpu_fru_eeprom.h"
+#include "amdgpu_uid.h"
 
 #undef MP1_Public
 
-- 
2.54.0

