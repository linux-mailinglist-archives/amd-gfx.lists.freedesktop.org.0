Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +petLWcdPGptkAgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 20:09:43 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628F56C0A7E
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 20:09:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=gE7ZYNR0;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0BF10F0A6;
	Wed, 24 Jun 2026 18:09:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012026.outbound.protection.outlook.com [52.101.43.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDD910F0A9
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 18:09:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5CiMalEh2Grfi7e7V9Y8Hk2BiQs7IByfvnlSropeQo5ztgNglckQyvwBiha0Dmdc8IwRWjHnReD0dG42P2G2ZXfuMw23AcTloza+pijxkLY2+un/M9RoSHHNHK+JN5Qz3WrGFWcn9CJO8Y1oz5YqZOmRcz3BJwBn8R03biDa0IidHdV+i1uhnYfQKEtXQFQS4i5VYRSY7TvuHQI2X+y+BS3zTPOBPzeYfP822hPLrcWntX+VETWZj3Z3pkr7kJZCiwXzRXAD8hNaYEkhjdr0MS/A7so7Xxok+FbBLo0iJCv5hoxx68QE+iSgbgpbhUL/sIC74qFX9RWZTJ8PeBmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1WmmNSGK6ZdknSeWKX0mkFGW/GXpJihNc6nOeR1mMY=;
 b=Qd3MQ/HoJbvzPvsF55E8vpNZ6wFFEv0Wfb/XxmmOxw0VRZBaZoEZYA0mXz+bHrTcyEUrmx5XSg9jn7XAC3sMc1osvSoWsCHf0ZSuGpXTt/dDtgvj/Jqs5FgzTc/t1H8iHakeYOnlzAiCrLLK87282QTqu+DxhGvigiKZrpmWq3vduNrweBpIf9VE1pI8CTlUT0jnkQS+S5XGtsiUYFBlQhoxRQXjvQEdcc1y2KcWp3bReDGu8wKHDw6oFbe2NgTZQnz2Sm0NvTaW9K0vLDB6A7jCYhUd7f0lo9nBBXj/ZedeO+DIGili0k4rDRlXZGTQXz1uq0FBu0oE5+Wn38H+Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1WmmNSGK6ZdknSeWKX0mkFGW/GXpJihNc6nOeR1mMY=;
 b=gE7ZYNR0vHaexJQCaAhkDgoFLRMR/jaWdJJtKuqn6/qTh1hS9uHtfFoRUZfZA120txTD4JRHUJcPyXCWcZKH8b3wI8iglm/tqmfz6E0DfL3VZMWL9y/y35qTbv4dzq19qMjtwB08W5AWCelkrcJL4qhB6OfoBTS5xw+T1c9C5Lc=
Received: from SJ0PR03CA0037.namprd03.prod.outlook.com (2603:10b6:a03:33e::12)
 by SN7PR12MB7956.namprd12.prod.outlook.com (2603:10b6:806:328::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 18:09:36 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::66) by SJ0PR03CA0037.outlook.office365.com
 (2603:10b6:a03:33e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 18:09:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 18:09:32 +0000
Received: from MKMGEORZHAN02.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 13:09:26 -0500
From: George Zhang <george.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, James Lin <PingLei.Lin@amd.com>, Chenyu Chen
 <Chen-Yu.Chen@amd.com>, Austin Zheng <Austin.Zheng@amd.com>, Martin Leung
 <martin.leung@amd.com>, George Zhang <george.zhang@amd.com>
Subject: [PATCH 16/28] drm/amd/display: Revert "Add Debug Option To Enable
 Per-DPM De-rate Usage"
Date: Wed, 24 Jun 2026 14:03:14 -0400
Message-ID: <20260624180829.4775-17-george.zhang@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624180829.4775-1-george.zhang@amd.com>
References: <20260624180829.4775-1-george.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|SN7PR12MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: cc17cb61-c6af-46c5-1571-08ded21bbe3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|18002099003|22082099003|11063799006|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 8/m+D3o/0PlRHGc98In9dF0tGGNhV5atxlWT5opjN2nLhITNh4ORZxq1SMfRRS0aeCM8Ci+0dEtpuvrC1eaLOpNljDU0XObcqEg9Ew3An7lIusDz+1/CIVRFaU2mCVi4cCwfQsYI6ueQnRYabYWxOCC3QEl6emP3IFWqKKIUDrn9OzpngQyo+odl7mNvf6ymAFPF++WsILW3Syc40WpypxCjKT/yseFvN3M4E1Jj5aFHWIbGGvLTo7BD8IEE2YjH/6WFJAzOR3z4V+XkfTNQOY9DghQhyIEUtExXcagDYGxgKfMRkoV4HpGDm9s4EEIS2uaNK0NSvJelF4ojtirnUX2G3aLnXUmCA/eObbBzrHO5oMP7SIYmBF8mvERgvbm/KHVnYc8jLSCWnEDe0X1s7jd/P7etWonu8j+wCZ/lhDIvQjnEQqRmgxSDL3GfgJaTE11lt+AVpMk0KR7X4D8OimJkeBQY6EGkSRmc9NN4vhV0cre2vv0FDa5g62doojAACLrM502p23iYGK30DDKaKZton5BMj7LsIFo7p6Q7gUm9x/nrrUW0mZTsPmltkP3q7LHzc3UQTjF+BDTYfvHL+fESECw2VqXBtIbRcM3V0TCNE88bG0+xPwokZC0DbGAKdjWQzYHeSB6Mr9pWvyTvHTjLXND442+gN++5OAwhbq/b/pjR0P683yg66DXql3PHy0rDBdvjkMuF67R8TY4bpA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Kuy4hk7eMQ+Uv8KS9repqGR9RHqHj+g6P9qr+bXtuB3VenRDFyd67zEXk2pavu9jFcBEva/MkZkKtnbVKWHWMcSMiGb09Y/dI0KL16b8+hWvytamuBDhCOB2/bZ+k495Az0IacoQ/NBhG5CfAR7NWit6fxHwyZ6xRrKClnYT/f8jawYNeyY23xF3i9RUkOOfZxUPM73Q7Xc6Xa6oIJn7yLH0MaP3TyjrlVBjJI0+zSobJfkyfJZEPYVSZ/bLskcCyluEnE9A23xxxKuarJeh1rfnZikEAJxzuQdWboBM/uBcmLugyiz7B3ePcPD5nyzN5yI+5HT/J3ek6XaYVq/rlV+EgDNXWSsolGC6l5Xfko2hTcoHJffvWg4LhV2Bxd+fTCojrDrL6qJM5LvnpJ3vmTqwiumlwrKKP6KB3+oVXc2CsfA1Xm0DR6SPPuMCl8kw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 18:09:32.9830 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc17cb61-c6af-46c5-1571-08ded21bbe3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7956
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
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[george.zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 628F56C0A7E

From: Austin Zheng <Austin.Zheng@amd.com>

Revert due to regression.
This reverts commit ba88111b133979f079c44e6273e2eacceb91e3a5.

Reviewed-by: Martin Leung <martin.leung@amd.com>
Signed-off-by: Austin Zheng <Austin.Zheng@amd.com>
Signed-off-by: George Zhang <george.zhang@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h              |  2 --
 .../dcn401/dcn401_soc_and_ip_translator.c        | 16 ----------------
 2 files changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index b323f7826451..92f84277c522 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1289,8 +1289,6 @@ struct dc_debug_options {
 	bool enable_replay_esd_recovery;
 	uint8_t iommu_mismatch_temp_wka;
 	bool disable_dynamic_expansion_for_test_pattern;
-	uint32_t dml21_custom_derate_num_dpms;
-	uint32_t dml21_custom_derate_at_dpm[DML2_MAX_NUM_DPM_LVL];
 };
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/dcn401/dcn401_soc_and_ip_translator.c b/drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/dcn401/dcn401_soc_and_ip_translator.c
index 0c8e652c3532..89f7ccd7f81f 100644
--- a/drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/dcn401/dcn401_soc_and_ip_translator.c
+++ b/drivers/gpu/drm/amd/display/dc/soc_and_ip_translator/dcn401/dcn401_soc_and_ip_translator.c
@@ -269,22 +269,6 @@ void dcn401_update_soc_bb_with_values_from_software_policy(struct dml2_soc_bb *s
 	if (dc->bb_overrides.sr_enter_plus_exit_z8_time_ns)
 		soc_bb->power_management_parameters.z8_stutter_enter_plus_exit_latency_us =
 				dc->bb_overrides.sr_enter_plus_exit_z8_time_ns / 1000.0;
-
-	/* Override per-dpm derates based on a custom derate table.
-	 * Global derate value will be used for derates that aren't populated
-	 * 3 derates for a single DPM level:
-	 *  bits 0-7: dram_derate_percent_pixel
-	 *  bits 8-15: fclk_derate_percent
-	 *  bits 16-23: dcfclk_derate_percent
-	 */
-	for (unsigned int i = 0; i < dc->debug.dml21_custom_derate_num_dpms; i++) {
-		soc_bb->qos_parameters.derate_table_per_dpm.system_active_derates_per_dpm.dram_derate_percent_pixel[i]
-			= dc->debug.dml21_custom_derate_at_dpm[i] & 0xFF;
-		soc_bb->qos_parameters.derate_table_per_dpm.system_active_derates_per_dpm.fclk_derate_percent[i]
-			= (dc->debug.dml21_custom_derate_at_dpm[i] >> 8) & 0xFF;
-		soc_bb->qos_parameters.derate_table_per_dpm.system_active_derates_per_dpm.dcfclk_derate_percent[i]
-			= (dc->debug.dml21_custom_derate_at_dpm[i] >> 16) & 0xFF;
-	}
 }
 
 static void apply_soc_bb_updates(struct dml2_soc_bb *soc_bb, const struct dc *dc, const struct dml2_configuration_options *config)
-- 
2.53.0

