Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAVNFHlB32kxRAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Apr 2026 09:42:49 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CEF40179F
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Apr 2026 09:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7078610E691;
	Wed, 15 Apr 2026 07:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hZeu28rb";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010002.outbound.protection.outlook.com [52.101.56.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F24610E692
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Apr 2026 07:42:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erNCsqcvHyeufjmIxpcpjkbPSGbajEciVyTlMEQMO4LRk3WdsnULbxpYpXkgTr/IbVsrH4I+1KwiBda5T/P93WMwBwd540nCTCGHatxs6rVjagmXVFUBrZ0OAVGzt0l/fi+dv42HmUAANYUBKuRxlAKBmSbET444QmRmrmXzhrBAogUga1lcFqG7X3gGr+Y7QSFvq3cbS2nGM2U51iOPYEwN4HuRMDmwV0BQiDfFJkUqSWlF1aeDEc6ANA4Bd+uS6fpLvUDKWyFBMUec9AnOQTeJ0OTbxO17rgUMZPknDNak76ufVGl1+lUzGTE64xOjx9kmdFDYkjPv9yGOdjPn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UL4bxaJREpyACFZAgANo9t3hHUkvUgqU0WFV/tDCw2I=;
 b=PKGyLvY/bbKdwCKA9GxYCfnceb/UCUldFFtYKLkg3fgc+FKsBgKiy8O/YwwtxC4iaoEYFV/5C+CFAJYuxLsRr6dXRZV+7ObritoubH4Gx9ZiulZCqx+vIOH9VYCV3+cZZWDUtyual4mqjdPXDhTJUbtnGRxT839aeN8TFSibsYNmoNL8iOi4OzJa++lm1Uk/2CcKG6Np06v+WvmvOX3lpl7xZJFkO5frDR45VFyeN7CPeJ0LosjhxykQDIWsEGBTZq2uofwshI7vnDUuVory0N143O+4uv4uUQuN+dzv2q7tNNn+Sy0Vub43paBqJv1D6T5MrskW4X+HHlFngBIZtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UL4bxaJREpyACFZAgANo9t3hHUkvUgqU0WFV/tDCw2I=;
 b=hZeu28rbipu2bdA5y+Ru/NvNZiOAxv4Y6hpraON6mxCXTwzPZHcXURFsV47wc95RESYCYCmhS8FcWCJpNwZ9epBvBfjZEgLktmQJ+KX92kB3ED30Lhmi+zI2rpxfSS089qB+v9NNAGLY01KCnr3IsPA9FogX8OW8WOsAf+rGK8I=
Received: from MN0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:208:52f::29)
 by DM4PR12MB8450.namprd12.prod.outlook.com (2603:10b6:8:188::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 07:42:42 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::bf) by MN0PR03CA0019.outlook.office365.com
 (2603:10b6:208:52f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Wed,
 15 Apr 2026 07:42:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 07:42:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 15 Apr
 2026 02:42:41 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Apr
 2026 02:42:41 -0500
Received: from chenyu-station.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Apr 2026 02:42:33 -0500
From: Chenyu Chen <chen-yu.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, Chuanyu Tseng <Chuanyu.Tseng@amd.com>, Roman Li
 <Roman.Li@amd.com>, Chenyu Chen <chen-yu.chen@amd.com>
Subject: [PATCH 01/19] drm/amd/display: Add allow_clock_gating to dcn42 dccg
Date: Wed, 15 Apr 2026 15:39:40 +0800
Message-ID: <20260415074223.34848-2-chen-yu.chen@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415074223.34848-1-chen-yu.chen@amd.com>
References: <20260415074223.34848-1-chen-yu.chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: chen-yu.chen@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|DM4PR12MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: f17186d2-3799-47ce-01a7-08de9ac2937d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8OZmSwqnVaYFKi7ML4Lyxk0sNuXAKuu6Y4s7vHOUdyJcaMgdVeMf0DqmVnYOOkKFBY4f4KoUNH8+ZOuAjaA29Ojozhj+vQC0Z9Af2Q3CXrFiNrhSpMttToXcGcLuiTPpnOpC1seFqMJlbExy6w7ulo8h+842L4qUgv1LhP9tPqqTvVvSpDTpxNwDRTC5yMk+zIIkjNmJZawFzsGmYSdMrfW05S9ICGgRoVXxjpNZIUpGETAX0AuI7vjTw1untDwRxWJeoNENfU2U+M1uF8TVF9DTx6rED+Movbk030ErTYkVU0gUQKIzOQHe1B7k/Wc7fL6lEykJvjOBOBCPAsuDhMFck1l6nfMxao5X24eY7naNKA9FYZWFlW+SuMg266J5S8Xprb136pg8DrStVej6S2LVUnF658rWxkr9pYbdqLO945kX9i3jEdL1XSxvxf7toGAhawirAinB+xeoYTeG0HmNFySDPAbBg7NZ2Gifet4oK+oRsF/Lh43KW9bl+J0gJ9wpnpWLicubYofQDdWmMwzYS1yol5Pc3kbln//fjTslPQmlcISl14mExTtZvA+w+48WYTNIXWuWCxazwo5TLbyxNI8kcOV9QwYGteOxZkKK0z+LAxTcL30COoezAfOw/RKSI3qFTW6sV9j0ug6Uv1P3q1xA5OIKsk3ks1D5b9DhV75W6SNe4o5jAAnpN3tDrMJ9rgKCj0BVWmWo2yNT9/wkfL0ar+dT4e78Kj6riWPOwLyUJGhK0laKssxSaxLew3hoFFG9j2M9/RV6NXrdaw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: D/v//zZxBFv8eMTlOUynaKWDuC967Z8lWCt94mRObUjH/9aprm3tGSkSloNUOsaBClN19u7TW39+AKSQpfv0DwOZ/GQIUw9k/vFM6foqVQRwhLMINESQ1RTdYsHNgiZUrBxDeQXMGt06HKFLJPrQ/gzhm82PCioQ9V5xj0dYbGZH8iwyh7h1xRUwHR2pzib42nvzoqUNz8ocglwdu0sRgvcvlfam898VCDMT9NqcDm+bId/GKEapHyN0ttMTTf4qLdOY5oFSVM28mr/PHTnpl8g3lRbL+M72gTIklc0j0q3+7Qr1Ep1O6vtjVK8rSNXwwGbBxg9O6NXSO2W8cYSpDSLZ6Ub6BEPAvgKru3IA+mdlSbPoWPdrZ0phnLKcj6h5nw4zo00hzeKfN8JiTW2A3TX1L2PSIzVK0XBDgrfUQRoKhb03fQqL0JZfgllMgH5A
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 07:42:42.1518 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f17186d2-3799-47ce-01a7-08de9ac2937d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8450
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chen-yu.chen@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	NEURAL_HAM(-0.00)[-0.998];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D4CEF40179F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Roman Li <Roman.Li@amd.com>

[Why]
The allow_clock_gating function is present in all other DCN versions
and is required to properly migrate DCCG registers access from hwseq
to the dccg component, resolving register conflicts.

[How]
Add the missing .allow_clock_gating function pointer to the
dccg42_funcs struct.

Signed-off-by: Roman Li <roman.li@amd.com>
Acked-by: Chenyu Chen <chen-yu.chen@amd.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dccg/dcn42/dcn42_dccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dccg/dcn42/dcn42_dccg.c b/drivers/gpu/drm/amd/display/dc/dccg/dcn42/dcn42_dccg.c
index b813310763e5..9612f4498ef6 100644
--- a/drivers/gpu/drm/amd/display/dc/dccg/dcn42/dcn42_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dccg/dcn42/dcn42_dccg.c
@@ -6,6 +6,7 @@
 #include "core_types.h"
 #include "dcn35/dcn35_dccg.h"
 #include "dcn42_dccg.h"
+#include "dcn20/dcn20_dccg.h"
 
 #define TO_DCN_DCCG(dccg)\
 	container_of(dccg, struct dcn_dccg, base)
@@ -306,6 +307,7 @@ static const struct dccg_funcs dccg42_funcs = {
 	.dccg_root_gate_disable_control = dccg35_root_gate_disable_control,
 	.dccg_read_reg_state = dccg31_read_reg_state,
 	.dccg_enable_global_fgcg = dccg42_enable_global_fgcg,
+	.allow_clock_gating = dccg2_allow_clock_gating
 };
 
 struct dccg *dccg42_create(
-- 
2.43.0

