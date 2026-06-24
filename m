Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X5CLJoAdPGp7kAgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 20:10:08 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464F26C0AB4
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 20:10:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=WHUj6VdQ;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D062F10F09C;
	Wed, 24 Jun 2026 18:10:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012039.outbound.protection.outlook.com [52.101.48.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F45810F0A1
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 18:10:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTHTV70I4KVNFjRtElhIGR0HSt20Sp3rXckJgIqlWFqPvZK6M5GpuVDhI3G05GMIen1mvqjM7U1Qr7IwV7Pm6bCvfYzvrY0myEjsfvWltyXqYPrNJeMtgQQ/597PX9PKUcKE3TFywKHPEj4pyQkiK5WjRdmyaAM2eYvjhnH7Pdf4DZWuLjTH48pjdnCyB1IQ3D/Ed92TLB/gnUTKxzITutvvXj+w+aPKYJQtqK4Uv8/s4kHLQw/1V1v4dM8O3xjy1HhCXAmJ6/FNeGgM1yNxGOW/yn3NygT6S4z+vDn1p0I2IrFCDCrShTpxyoun88CSusLJd4bLfVxG3uedBdmEfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjzd+2lDGiRDrKSCqH5Aq0I2QBAqMt2q4cWn0tONutA=;
 b=iM6nU5n4/wKM0hbWHB2GxO785bKaEfIyGVaN1WZQhiJ1LfYkN8Q3WICP2mLHpLQQiPRhxZNqGr7VcItU0qpVXp5KrA+TePhzubWhp/sRT//dy5zeolqJ3xPfdQpcrZGwo1pts12FsuVQU5fAGixYicOw70usj3b3fr6SlHASD6qGxGPLSE/Lk596R3k4+wQpvHJKX6+Ugrp6lKQ0W8tgJLLMi1aqKp5+Q81n8hJntcC2O1lfU1Dv8wLnVSBI+7Ug1z3yVKwCauk/qs5zomGNa6FdpFBOaGuXEn4FeLzhUTCdd65r+c0GQSKa56xW3z12j55rVHyjujy/zLKGvNJwgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjzd+2lDGiRDrKSCqH5Aq0I2QBAqMt2q4cWn0tONutA=;
 b=WHUj6VdQV+bqvCqnho7qz8EbqAdkI2epJStG6u8UumyjD6tyJWEkpdhte+ZceyiB9sDXCisJsOwEBQnBJoVf5C1QPsynWz/gPrrOpXSdVb7oOalFBKWWMR3AlrqLxcRiTS5vdjXC9aB1p77XqVTbivGa/qZFLoz+mMlsCJG9x/8=
Received: from MW4PR03CA0240.namprd03.prod.outlook.com (2603:10b6:303:b9::35)
 by MN0PR12MB6197.namprd12.prod.outlook.com (2603:10b6:208:3c6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 18:09:50 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::40) by MW4PR03CA0240.outlook.office365.com
 (2603:10b6:303:b9::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 18:09:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 18:09:50 +0000
Received: from MKMGEORZHAN02.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 13:09:43 -0500
From: George Zhang <george.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, James Lin <PingLei.Lin@amd.com>, Chenyu Chen
 <Chen-Yu.Chen@amd.com>, Taimur Hassan <Syed.Hassan@amd.com>, George Zhang
 <george.zhang@amd.com>
Subject: [PATCH 28/28] drm/amd/display: Promote DC to 3.2.388
Date: Wed, 24 Jun 2026 14:03:26 -0400
Message-ID: <20260624180829.4775-29-george.zhang@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|MN0PR12MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a6bb6fe-ab72-46c2-5e68-08ded21bc89d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|11063799006|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: noONE7T5MK1dVAI3PELJImpGpebjV/Vq3q+LcdIy7quLF0k5HlHshBMygtVK7mRHBVi8sLiiyjqFcqK2FYn3/Qj13i/wT5jEjIayNiNHSIV0cQ3EUBRFZSc4Op2u8ohBNOps1JwDRyBQmQ0DAO4oMAIgmBGTsrzq/moMHK7wCwsqdqU2mYsQDTIyJGJkl2Jng2cnw47RWHVpOfoGLTxvla5y5qdKfQLcj4D/dNsMrWldUSeJvgmjVmEhKL6ifTf8mZTxRDZcZZALHQr2VOrSR0SnMF8eEaVBmX2m9lesxFI1/h9AkRpKGg7nTdaJYCLctv34lJaC9z7LQE+o1tpNIxThzO3EnRsWUhu/56/ZP92VRD6LRHF7RzMy4Gn/0/sB/4k6plMqS/oinc6n133qlxTsDCPEI1HnMy7pr8nrt/i5IpRvtnv9uDzvFVgkuvxWBJyJ8LDaE9JKOGnIVimCfYHNlX8Jr2dRyzBNBmdhi6gEXvxO/icVRlgXBp34Z3BSj3TpVb0HqYqCuOt6MC7863h4O1d8dvxaWTPQmDJJSsGRcmbCJQM3/avbGyA+Vn8TvSUmyfpIomaapWM3Kv33YkTHVKgt9yoReo/WET1ep1Ozbz/OQgrFB3gMZmDQZ13oTvIf9/ZHpmRrikzxyWYiNO+q4M/ZfLpnTYC67gsNQNJ7/jf5TSUbn+Aj9d8O7CUdx/UTJvhfHi0j7NDMNXPTRQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3fJSR6xhFW3mPpGbgcldOa9GvQH6OZFspzzz7iRe/LUMoPcTP3JJB508/AT5f6bae8d4Y3WN2W3di0w9faez8tCVO2O9eFcF8RntIxIDcmf0b/QzSpyDULeOyzFWo3CTyPa4KVF73uk04e3RWnH842D+Cfl5GivkDUII2GayUX93eG0liUz+mnN9/7xlSyYV4oIBir0bMYW8hoI3jg5c0U2RTExiognf05Y1fVwjkULX67LfSkcC6DziGFJ0aBW89edEAzlP8O0nq6JOj4jLNFB0cmSlfq0UiH09Noao18C/eQnYCLKWwxCaID2Wm/icNTt3U+FQMFoFGACHSE5Sp5wxRpKNrXvnbc4ZgaF9ClC1ZX9BC7q8nFQfoZLhYlXv9PX75tjurK4p4ab6p0YqjaRkuZ7YpFcrujXPO0LQbjc0STj9JvR+rZMx++2FLBPe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 18:09:50.3776 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6bb6fe-ab72-46c2-5e68-08ded21bc89d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6197
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
	RCPT_COUNT_TWELVE(0.00)[16];
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
X-Rspamd-Queue-Id: 464F26C0AB4

From: Taimur Hassan <Syed.Hassan@amd.com>

This DC patchset brings improvements in multiple areas. In summary, we have:

* Fixes on DCN4, encoder, debugfs output, and others
* Enhanced KUnit coverage
* Code cleanup

Signed-off-by: Taimur Hassan <Syed.Hassan@amd.com>
Signed-off-by: George Zhang <george.zhang@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 04d4eaa784ef..13c1f7cd9d7d 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -65,7 +65,7 @@ struct dcn_dsc_reg_state;
 struct dcn_optc_reg_state;
 struct dcn_dccg_reg_state;
 
-#define DC_VER "3.2.387"
+#define DC_VER "3.2.388"
 
 /**
  * MAX_SURFACES - representative of the upper bound of surfaces that can be piped to a single CRTC
-- 
2.53.0

