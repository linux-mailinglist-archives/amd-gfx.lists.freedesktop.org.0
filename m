Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DOhiBOEyKWoASQMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jun 2026 11:48:17 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA25667FAF
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jun 2026 11:48:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=FXNsaVqG;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4532B10E4FF;
	Wed, 10 Jun 2026 09:48:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013062.outbound.protection.outlook.com
 [40.93.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3896F10E4FF
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jun 2026 09:48:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=he3NdGHM/okBzMlULUCmPBaUyefKrs69K0bEngMxkSOLejwdzvdSVtVZpPE0qTKk6dCt8FTSD1gebiXNNQ3CvvG3F0mHDZgOBKts125vPLVGCezqnkEWwe03w9YaNjmuob14CQEJnm250XmSXa1Y49Xup17SkgcVaDyJHd4Ggo1p/nxU1Ydda59nJfMNSz8MPdht+yP8AotVsmgA2KK2uuaW6E3wVz1Wf23UqcIQwL6nHaCRaDbIxB8vdnC1f5PzwuYYorn5t3vdiBQOxIa0ti/zHCOFMdX6DP3IofMeQ0T5veIlC48NN2l2F8Q3Gg7XiaOwpBzgweeHXyBs9sYhkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nQE2zEp7IQMCEP1TLpSuN2LICXjt+KNRagbLnLl4wY=;
 b=rPtkdEZ6Fee4Pw/+XIjfX9TVvJk59zGpt/dwVgJb7YTwubyW1hPfceOvPBU3qVJPeC32DrUVmLCjo039lixH4SRJefrWhhJTsUbtqOZPMNsg+R8aOIUIK83QOGynxIxkkYl+ayKAbYmczHZxCXntRdMyd5d0EMasLW++PA5BiH/j5XsVQLwqlzfyB+PhSr+3TpoCG5hngjxosZTPdB0pW3gF0uEP2zeUCaFSjXPHAbVzMKlWwOla8snkS40GIviwZ9fLGPM3t4PRyH21J7N/E8yiLwa3wV7KyDW5I/8xQEtVIG31bDWlZJtMyUKs4XYS4WOYCg2VnKM3fAJosS8sug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nQE2zEp7IQMCEP1TLpSuN2LICXjt+KNRagbLnLl4wY=;
 b=FXNsaVqGa9scTjQOsAFmn+9LyK7GJ/vK4hqfiTssAbF0regirP5ushJKP7R1eFCaTrrMZFakfiGqZ2KaT5HzN19m2WX08PziUVYMo9CFveKpFZaTln3jvlovugrmO6jbV1imHK5MjCcicYlAjlCNZ5+tQQk7aR0YXOMn+PrLrmQ=
Received: from SJ0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:33a::20)
 by SA1PR12MB7295.namprd12.prod.outlook.com (2603:10b6:806:2b6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 09:48:07 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::58) by SJ0PR03CA0015.outlook.office365.com
 (2603:10b6:a03:33a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 09:48:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 09:48:06 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 04:48:06 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 02:48:05 -0700
Received: from chenyu-station.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 10 Jun 2026 04:47:57 -0500
From: Chenyu Chen <chen-yu.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, James Lin <PingLei.Lin@amd.com>, Chenyu Chen
 <Chen-Yu.Chen@amd.com>, Gabe Teeger <gabe.teeger@amd.com>, Dillon Varone
 <dillon.varone@amd.com>, Chenyu Chen <chen-yu.chen@amd.com>
Subject: [PATCH 01/32] drm/amd/display: Increase dcn42b uclk value
Date: Wed, 10 Jun 2026 17:44:45 +0800
Message-ID: <20260610094639.1965367-2-chen-yu.chen@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610094639.1965367-1-chen-yu.chen@amd.com>
References: <20260610094639.1965367-1-chen-yu.chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|SA1PR12MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e4d545-7ae9-49db-a7ef-08dec6d55f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lUSNppcvbJfYjdPHRUk43juk0UeTlWBzRYxVwcOQmqII5qUr3BdAlFCOpefYPH6c5tCjGhLIVcVj7xSrtZOrumMMVQUH9JNfDEEABTdB79JP2/rxH/SBKfihCueAZk3S7335s9ZzksBnHaIoecRRC1RyxkgyPEwcOgW33sEYkMDc2h2QGIwc3IUVh1UqcAwC/VIzfbqTPEd+36OQBvLkFqc0O1cQKlrxs9UDZ+pGlWII0KdPVKP/ANPvKyKjwFNt7C4y3huM9yoNEes3QUCGfm00AUuyodA73OlLrkkYAnVlnzbS6vwRXnU4VS5Jmkx37qRzHwMAI5wgTZlgCluOvxpnkvZk09JSX+kBGo7ojDfJjMOl4SFLrpB/1cPsVpGh0xz3FD1rUB6x6Qej4gt7zaSeDmgfyZ14bnlLXcs1/J9ILHmOlPeK7FPQyhyv7OZw7UprJHTkeB2f3RgYLGDl7jQPKPkFvmHyFix83807D3u76s3/uqK9MQLHs/3L5tunif8j2bEevwJUsdwW/RGsHOruHdWiWuHX/2L270w2458acQKQJTpq5UsRrIsPvbSOwI3j9JSqFYoeh6RufpSleuI5n72ScJeD7h1Oj2Y9Tuf2C+Zm+Y1kdSQvtlmo+BfXX3Qk/GM7qRv99ZPDqIUB/ds2CenpbG1EMJqA15c1FgsDE9V5MePeO4fUyw7sRwbtPxK0M1u7H9kLFhOSS0VjaUbZjz4lIubQKyKCIL1fKno=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1FQLWTERfhfYxiItb9Dq2jFG2kGuuEnBntUNmbshmBYYsbfO2iSnhrTn80DEZAXxB8VVwg8rhNaDgYfPIHF6KxkawtSUL0ynb4kHcKMet5j/YTTWahkVH2cqWfveyH2u6/WPo+AChyJIYlTme+Mk/yKWM8BlhYoqoWgyJXeht2CMSRGygmZSz1Mdet3tjmHTYosr0KvhfbNL+3mTyhfySF81ByK9ip+JmBL/NKPxCU6uis+rd6ciAvzv0GYBl8pDhDZj9w2HIXz0HlM09YW+ACcbG18bM4BMTarECUwdshJPzZ+LFX0iFmeHhtYVEBysZKwGzsopOA16DDn/RzRaD585RiB3pmfrFh2KwB9P7I2stNDVEhEUlFdCo1d/NzXAdFes9l0QcZi6IZjtUNy62shLr4dK+jcinkTjH+N4NCJc1GUE8oLcYCoQw8BpdOxi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:48:06.3236 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e4d545-7ae9-49db-a7ef-08dec6d55f68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7295
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chen-yu.chen@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ABA25667FAF

From: Gabe Teeger <gabe.teeger@amd.com>

Increase uclk value in order to enable UHBR20.

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Gabe Teeger <gabe.teeger@amd.com>
Signed-off-by: Chenyu Chen <chen-yu.chen@amd.com>
---
 .../display/dc/dml2_0/dml21/inc/bounding_boxes/dcn42b_soc_bb.h  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/inc/bounding_boxes/dcn42b_soc_bb.h b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/inc/bounding_boxes/dcn42b_soc_bb.h
index ce4025591b87..eae4a37b0984 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/inc/bounding_boxes/dcn42b_soc_bb.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/inc/bounding_boxes/dcn42b_soc_bb.h
@@ -75,7 +75,7 @@ static const struct dml2_soc_bb dml2_socbb_dcn42b = {
 				.clk_values_khz = {2},
 		},
 		.uclk = {
-				.clk_values_khz = {400000},
+				.clk_values_khz = {2400000},
 				.num_clk_values = 1,
 		},
 		.fclk = {
-- 
2.43.0

