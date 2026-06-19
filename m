Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tNJSFOxENWrlqgYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 15:32:28 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E216A616F
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 15:32:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=w9etvZVa;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478C310F5CD;
	Fri, 19 Jun 2026 13:32:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013032.outbound.protection.outlook.com
 [40.93.196.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB6210F5CD
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jun 2026 13:32:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMCz8NNpGY5TUbeqPVppzrL3cz8KhjcKQIsbMmy8PcQAyTnfUsDzewQvoa2isD1v0nVFTnXrNHgGyXHrOAtEkkijE2o+PefcUSzuLua1hLyqwGHC0USpS9v+Sl9usnoohCaPU7VPNlLzfINicqXbHuVCdbyYAqBtUIOyiwxhUYVwZzkIQND4dVLo5w65xMw0HP4U0cSOFq4f2KjlK+z9waXaY14O07EiK0AESBSNMU1BUbfGSnIVxr2An3444iVeeXtCCdHATEW8yyZa+dvuUAxQtXqtDMxyYBvonkZDfoY4ROH+WkYZjiPvW1h71xzLHrPQuorbycCuQTYj+lVpZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cwkar9X9OMXBMjAR0Ltycl+eVDnmjRMVOD5CV1+TbhE=;
 b=SR++9fK9PJ9ehzRJ+PqhqP8r1OV2IO2CaZZYx1tqYTadosJAh87pSq7kh5Ad9E6G9BDu3vYCEU3XPCr/KfNIznMUYpZUnpm/QJ5GNiJVTf/qG6gwv7lCK1bsek+zrYzSA2GHtNfOgUtaK+mUcVW4AXVRZqWmXt/HnLyuGKloXeBcshJkR/CzBLUmfedTdQ8bQj+8uBnyrNMhX4gtnA14WSIUKSeNEuwc/NUyn8KrNIDQBkPeT8+kYOza1UgyDWm/esWTdguaSe+fcGVBtpLsGmymbjWlyFiHlwmcRYebj0CKHTZS3IojA37A2zeZORTjwHEqnDspOTaF8PtXH5HHbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cwkar9X9OMXBMjAR0Ltycl+eVDnmjRMVOD5CV1+TbhE=;
 b=w9etvZVaVCgeXV4OkbuFzO6SdQmUQ1z9JnwTjZCQdabvkPIG3RLz+kE5IUUtqKp90vw/chVElkIWxhmh7B1uM9PqBbGWaCCp66JKik1eOukci4my/gluiKHWVCBLOpRH6fGLl/MqO1D5lOrQKzj8bOSef6Nxj4FHIdRekG+NKpo=
Received: from BLAPR03CA0095.namprd03.prod.outlook.com (2603:10b6:208:32a::10)
 by SN7PR12MB6909.namprd12.prod.outlook.com (2603:10b6:806:263::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 13:32:21 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::95) by BLAPR03CA0095.outlook.office365.com
 (2603:10b6:208:32a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Fri,
 19 Jun 2026 13:32:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Fri, 19 Jun 2026 13:32:21 +0000
Received: from georzhanmkm (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 19 Jun
 2026 08:32:20 -0500
From: George Zhang <george.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, James Lin <PingLei.Lin@amd.com>, Chenyu Chen
 <Chen-Yu.Chen@amd.com>, Piotr Maziarz <piotr.maziarz@amd.com>, Dillon Varone
 <dillon.varone@amd.com>, George Zhang <george.zhang@amd.com>
Subject: [PATCH 03/24] drm/amd/display: Explicitly declare unsigned ints
Date: Fri, 19 Jun 2026 09:21:18 -0400
Message-ID: <20260619133154.116746-4-george.zhang@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619133154.116746-1-george.zhang@amd.com>
References: <20260619133154.116746-1-george.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|SN7PR12MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: dd9481e2-e545-47f4-9fef-08dece07310d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|56012099006|22082099003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 6TFNmZWVqP8WdZ3LgZc+/uHZhAzhZmv8Qism7y+Tyc6+9Jz0J4llDOb0qbuJu2bRxkhe3gy/7eV1w6vdguvKr39lkw4YGwFF4pAblM1xZPilPJ1K8EVHIw0fjrx2x+4Dsrdv9I/IzuWlrCfuXNXKo9yDI1+ZQ38MwMtm9vkB4e3R7wKuu6sM2Zt2W+2p/TYdc5j9TcCuVG91uBdYlplnEarP6zZy5aramOUbffb56MJKZNQReRbVuLPIOAlOFVJuPu5NnAXOulorDxGWBMF5rma1Qdkl2D9w5bMGTK3ybDCDou49KU/5Ibdf/K/WRlx+8srmD97pFCtiI6vDLifqFh43NXSBGJsfN7YfOyLg0BVcSi4QKbhRDw6WxMZ1QDk8ogwUKG9m1lCzGfR5ODVidkmTNJ7apZKtbg6st6hkIybW4o4XpYcNNeohJgMIwfIcdY2a2G0jK+Ejx1/hlq8pLk2toLoGJokbPHlTNE+dCEZ742PbWDlJ6ThQp2Ko24ekqI/m+BsmI7BOYMPak/OnZN4dHFvkVEnMpu/0vdk3Vwqc3v/EOkn+vLOjh3cITVwRQ8UNzsGw8RX5CHP7rktCdaRAGLzeEuVIaIPeWPevxUIx/2fjzmMVmAJqKzLufyrgWe2xZOZU95gzfjnXOZPqBR4WVSHbLHFoFjKjahiTMhk0WPVaDKgzTo7I+bEUJ0GW8vO9AAVz2dX7/Us7PSBosw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(56012099006)(22082099003)(18002099003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Hy4RRGk51014PQAzKXxbYfL10+QDHb0geqiwNKZUpfHiPjWaip42hfqkU3m4FlbE/pEEsjwiFJsxJ3H8+pLUaQby5BU8oB2N5aA1jo1qLQ4RF/IZT16ukljGxouD1s038/bjgD1S3B825qwoU5ZUAyrcEctI+vofDxeJ0FQvXayFxffFwvA5o77roOEL6EukAZvd9SJm/8OgyGXqw6KPqhBmQZbXx+LWDcUDHSqy4zQjPq7iTjM/m5XodrYBxZI24jrdeW5l4NoCUk+2WZiWWZvcLgK3mWhjtvfqn0qr6KmaCkefo1ww51OLT32HDkUylkYfqn1W1HrWr/uqshDe+PoYVfbjGkfCu2g35lIeBUYGGtmRMsRnaD2W1vfdj0jPodSocUNTPkql0/zz5x4FAw7ifMCoizsgBuBkhugF6O41bZb/yUiK+fAUmZBGyKVk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 13:32:21.5835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9481e2-e545-47f4-9fef-08dece07310d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6909
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
X-Rspamd-Queue-Id: B5E216A616F

From: Piotr Maziarz <piotr.maziarz@amd.com>

[Why]
Some variables are expected to be, and used as unsigned.

[How]
Explicitly declare them as unsigned

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Piotr Maziarz <piotr.maziarz@amd.com>
Signed-off-by: George Zhang <george.zhang@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c     | 11 +++++------
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c    |  2 +-
 .../amd/display/dc/dml/dcn314/display_mode_vba_314.c  |  2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 5f6cc1b1f788..b21d41df0fab 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -4412,14 +4412,13 @@ enum dc_status dc_validate_with_context(struct dc *dc,
 	struct dc_stream_state *unchanged_streams[MAX_PIPES] = { 0 };
 	struct dc_stream_state *del_streams[MAX_PIPES] = { 0 };
 	struct dc_stream_state *add_streams[MAX_PIPES] = { 0 };
-	int old_stream_count = context->stream_count;
+	unsigned int old_stream_count = context->stream_count;
 	enum dc_status res = DC_ERROR_UNEXPECTED;
-	int unchanged_streams_count = 0;
-	int del_streams_count = 0;
-	int add_streams_count = 0;
+	unsigned int unchanged_streams_count = 0;
+	unsigned int del_streams_count = 0;
+	unsigned int add_streams_count = 0;
 	bool found = false;
-	int i, j;
-	unsigned int k;
+	unsigned int i, j, k;

 	DC_LOGGER_INIT(dc->ctx->logger);

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index bd14ebea1111..8064c4b3fd25 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -5337,7 +5337,7 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 		for (j = 0; j <= 1; ++j) {
 			double VMDataOnlyReturnBWPerState;
 			double HostVMInefficiencyFactor = 1;
-			int NextPrefetchModeState = MinPrefetchMode;
+			unsigned int NextPrefetchModeState = MinPrefetchMode;
 			bool UnboundedRequestEnabledThisState = false;
 			unsigned int CompressedBufferSizeInkByteThisState = 0;
 			double dummy;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index 2ea5cf37f273..bf2dde26b98b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -5421,7 +5421,7 @@ void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_
 		for (j = 0; j <= 1; ++j) {
 			double VMDataOnlyReturnBWPerState;
 			double HostVMInefficiencyFactor = 1;
-			int NextPrefetchModeState = MinPrefetchMode;
+			unsigned int NextPrefetchModeState = MinPrefetchMode;
 			bool UnboundedRequestEnabledThisState = false;
 			unsigned int CompressedBufferSizeInkByteThisState = 0;
 			double dummy;
--
2.54.0

