Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHFWG7S2zmmApgYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 02 Apr 2026 20:34:28 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D542338D339
	for <lists+amd-gfx@lfdr.de>; Thu, 02 Apr 2026 20:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3929310F288;
	Thu,  2 Apr 2026 18:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JZ0jcIyf";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011068.outbound.protection.outlook.com [52.101.52.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34EB10F283
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 Apr 2026 18:34:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1yKaMQLwqUjkdmHb2XgcMwx5SIiDB4s9cMo3G7snVPhJHQLXBm85ZHCmeOwWi0KqX8xarG6xQHRFC46j4zyQP84jU5+ipg2neHwOrKJ6uSLw2s1UaAjoONos4TolFc7i7E06bMEnUyKDZeQ5LsHuVvKAfi0nxkTPCfwjIqHTwQ/wHGb0xWCt4tXRVL+RlUsqu/55gBt+Kum8fbzcJOXhV7MibuHmx58rEykojepWXXA5J6FpSSqAp4PjLnWYUaHDnbC7Qf5zbxTSoKaeG3ZwzF740E4GyhSpZIf1R0Mu6rZOwBGnN7WIyRnYuYgLuaazYuQbpi/Ph3uoxxLCAGzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUbF8teiQIYmz2NMApuxlOCKcNPy8uwiF3t30zbGWeo=;
 b=rxciu3CzE1Ui8GyIXjeH8doghdT/4NukRw61isueXwy0yJAtL0lDo9rUu5hObGnz3eNOdgXpAioqfUDINBUKqKqAzuG8tdWR0kvmezQnzCdQe2Dr8WDYPmwpw3VGoNipMAwoy87a3cLfK2U/UDGBN6H+zYL6BOz3w+rIQ6a7n/l0NdZ7NRhNeBsySTN1oEZeS6Ikil8xtydgrLjbCI0DqrjSpGGyoeNvMDZi1vM3eh2LI4+nsShJOQisE+4ASAq2QlEB+jo2LbDeq+HyEqEmv/QiAkFroJY+Z3V9Qs029hnPOnnEH758QOM0xmMI9GzDmaUch5DkVwyzA7FDVrPVdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUbF8teiQIYmz2NMApuxlOCKcNPy8uwiF3t30zbGWeo=;
 b=JZ0jcIyfdgdaBOHZMXTIH1UqtV2xaQNTKeiHt+qbsNzUamZADSmzJJztiIX9rjMOe58Rol4oKPiI1S66ISkUmJ+2QSW8pMuGPulHzwySEJ3r5xf4GCXY10pfEPTJcHyRbl61zG+GjY++Y1VrAG82BuNR3F1fut4hEtVQoEfUDUY=
Received: from PH8P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::19)
 by DS0PR12MB8479.namprd12.prod.outlook.com (2603:10b6:8:155::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 18:34:20 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:2db:cafe::c1) by PH8P223CA0005.outlook.office365.com
 (2603:10b6:510:2db::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Thu,
 2 Apr 2026 18:34:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 2 Apr 2026 18:34:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 2 Apr
 2026 13:34:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Apr
 2026 13:34:10 -0500
Received: from roman-vdev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Apr 2026 13:34:10 -0500
From: <Roman.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, Chuanyu Tseng <Chuanyu.Tseng@amd.com>, "Nicholas
 Kazlauskas" <nicholas.kazlauskas@amd.com>
Subject: [PATCH 14/22] drm/amd/display: Fix DCN42 gpuvm_min_page_size_kbytes
 in SOC BB
Date: Thu, 2 Apr 2026 14:33:06 -0400
Message-ID: <20260402183314.1388755-15-Roman.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402183314.1388755-1-Roman.Li@amd.com>
References: <20260402183314.1388755-1-Roman.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Roman.Li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|DS0PR12MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: de81991a-3a6f-46f6-22c4-08de90e67419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: yck19fK9zERbhnqNar22p8/x2wpEz1rNiR5g6L+fjBuYIXIRc9+tAqI67pa+Agv6TDd54agT20qKCASzwVZ0gMCvGkISbfzUe4TGrfN0+AgZjdLgsEoqIlFeDWZXmnGuwmIddhE/LO5dcb+SR1aDSvEsseQTjx2LtYH4yE24owwwdSYkFHPU1D348+etRVaBOgqh3swyliPjWnALqHi581R6yLmedNoO4AHWCQyrrSL/8JjaUpFazaGj+BFBFU4bPlcAXge1a4DnhT8PR0j9k1HHqJOKJMsZ0bGXVuVODfyYyJZnvmEGM7LC1dFY6EnIcaEpZ0pusWUpalEBVLaphJbZx3tGmsL/m8dlPTWJebdp66urUHaBKUse4C1WUHw1qoypBjNrgFSChBGW72e2Qx2dD6RJRrIgrFjaRCGfLGPi15SPbh4hyzZUWFKRBEYBxio7iYsIwXruiLkYdxd65HSkFmW/tNqWN4YnG1lkKgt5JruPjGplllVhUgUJ2pZRihzDz+wqNmaePddHWqBOMfaHkdxc6eVlxw1BFWVh6dd5BdYKCJ04tG6HOnMsTTipgx3Qh5Tgvpid8T7vOllMFC67MIWREsW0X4At5aUGsaIoGTbBfPqQCmc1wqkJIaF0rPZq9a+qSE5DIQyHHBVanOMHPFmVaopcUurjnAL4/J+dMANOPr6NKHdRo/jWFUpeWrLDfBfstVltqbp/3IPnjpyGOr7QeHtgO82zQ08RyelUzBH5WHMfeBW1sjv4lKuJa1LqrMMx30ju0aDY+8kqGA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4s4eb4mBRNWtxLTcdTyGCK1qGaAQDKLc1B+WXw3Bft+BI3lrVyBT11BpnOd2Ulr7SoZ0lqNxYuiqLFTm+AoBMRVGOeOaCeTwUOPcUTvGHK/AOJhsa35BRd1U9kRXGsWKGO1wssxAA4HFJVAC5OPUkJlXmRUxQco/J8MA3M71gpK3JvRXFH02v0R/1jNuVYq1z7JFtxbK2z8MRBE+zI8ScWswb7q5+L2P0jR2M1NQ6yRi3UChKuQJgA6hQmhvAiAUd3ZQD01CQg4GRsYpfW18FIP4LA7Vy2jta6+scHLDEE3B2zbqxUYAlG0iIqmKpmYyOHCYjvmXPgmtNXCPO3W0whsjhQPouOZjsXGonUm/h/EhSGcRPKJ5lH9Rm8YnxzfaYA2893OlZOVIMNQIuXABAER4nCooffg4bTY4WfP5DwU9BFt68hAN7zzPZVsAaYi/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 18:34:19.7221 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de81991a-3a6f-46f6-22c4-08de90e67419
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8479
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[Roman.Li@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D542338D339
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[Why & How]
To match the HW specification this should be 4, not 256.

Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../display/dc/dml2_0/dml21/inc/bounding_boxes/dcn42_soc_bb.h   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/inc/bounding_boxes/dcn42_soc_bb.h b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/inc/bounding_boxes/dcn42_soc_bb.h
index ccdd9fd1e1bd..9ee092556233 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/inc/bounding_boxes/dcn42_soc_bb.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/inc/bounding_boxes/dcn42_soc_bb.h
@@ -208,7 +208,7 @@ static const struct dml2_soc_bb dml2_socbb_dcn42 = {
 	.fabric_datapath_to_dcn_data_return_bytes = 32,
 	.return_bus_width_bytes = 64,
 	.hostvm_min_page_size_kbytes = 4,
-	.gpuvm_min_page_size_kbytes = 256,
+	.gpuvm_min_page_size_kbytes = 4,
 	.gpuvm_max_page_table_levels = 1,
 	.hostvm_max_non_cached_page_table_levels = 2,
 	.phy_downspread_percent = 0.38,
-- 
2.34.1

