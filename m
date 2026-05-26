Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KArFDahIFWq+UAcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 09:15:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31CB5D197E
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 09:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA5510E4CF;
	Tue, 26 May 2026 07:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mlmRmFiQ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011009.outbound.protection.outlook.com [52.101.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B819610E4CF
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 May 2026 07:15:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fif1HCVSJNd8EP/w2nG3fuK7e+/vv98lIi3jjWeRLErSmqCZB/8aHxjH3aYrCrqDwUFTpcZ9i7rRb69NyapeOLNdAVK7+oanBmZmUsC55D3zCUpdmftVAZEF/E+4eX3ZApVyyOCWRtkg/wyh5MjriXcMWE5NZEmOkdL8vuB/DxtbkFaUfVOlpG3gV9bnaCbL7QIbQpLqoekwE8IKK3CQWIvHNatXjpgDz4UhTmWVWYP5f+VuXk8zXGAzPbGtCP2XpMmMNPC1fdq33dPTAgH8G8lVVOwi4cS2QVlrrc7vTdZFUEJn74+o6gOo/ZdV0BG5Ir0itac6FOTyM19TpbGQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2G84vB222IN5XxB5hQftvvLn0w0b2Y4tmdm8WSDfug=;
 b=dD3vesxGHsk30zaoJ0+jV9BQRCM6/cVtoPfwXzWdkFQDJIm58apReNNIpSLMf/Php9Qld0o8swzaN6cSFfmS3x2hz1AegfZtQ+9Fk3iSzWQFCnDRc+d5edjVz4ItzftbNCSSVeLONew2SlchGT2THLjOlCss+3CKjrOWV9aNmmBsXGHJ85xticsA7GaLkoI2b5Gzk81+taKCXkAoSLP2QYuK5AlyTfd1OLI5TiFrS31cgo6vtv9++EGGHD9Y0vYyLDhmLpkwmRYeMWXuBjWfjet0Pem1WEdsd0SOCeNVrYqzdeVIkntLi6PYTlzpcp3DC54IRQwIxwqMedpnWnvtnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2G84vB222IN5XxB5hQftvvLn0w0b2Y4tmdm8WSDfug=;
 b=mlmRmFiQQACGnT4/lkJCg5icyOIQ5FI1ZVy8OFEo/gX5P/rfxdblbKmywmaPACSR/wjxrEtiq5XPHtGT6egDbL1AIzw0H6N+PdNhKZdlOeyCztyeUcIcjCCHIejpnXjmGnQfVOiPj66UJDx3NjnqlIVXbCmS9D2DaGm9jMHFoS0=
Received: from PH8P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::16)
 by DS7PR12MB8201.namprd12.prod.outlook.com (2603:10b6:8:ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 07:15:39 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:510:2db:cafe::44) by PH8P223CA0026.outlook.office365.com
 (2603:10b6:510:2db::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 07:15:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 07:15:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Tue, 26 May
 2026 02:15:28 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 May
 2026 02:15:28 -0500
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 26 May 2026 02:15:19 -0500
From: Ray Wu <ray.wu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, James Lin <PingLei.Lin@amd.com>, Chenyu Chen
 <Chen-Yu.Chen@amd.com>, Samson Tam <Samson.Tam@amd.com>, Charlene Liu
 <charlene.liu@amd.com>, Ray Wu <ray.wu@amd.com>
Subject: [PATCH 08/41] drm/amd/display: Check for sharpening case when
 calculating max vtaps for scaler
Date: Tue, 26 May 2026 15:01:31 +0800
Message-ID: <20260526071413.2181251-9-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526071413.2181251-1-ray.wu@amd.com>
References: <20260526071413.2181251-1-ray.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ray.wu@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|DS7PR12MB8201:EE_
X-MS-Office365-Filtering-Correlation-Id: 88933287-de9d-49e9-ffd4-08debaf696fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info: 2IpfCWuwm2jR1XoIbj0x+HPdLVUucGt7rXl7ifEs5pUkUgJsw6kmxQfQt7od38dTCOJoTvld3Q8X4enzuViyq4IHg5MnGWYvuyqgmYQ5iGE1Bg3RDPzesCOIuOn22kGR1dDma6PUXsp2nLseN4hgofgU8kyM4Q8eO6cSw2XOXSvV9XLZKOFsNNNHtdMesZT+De/HeW7A/Kb6TFt19T/5GHWf754m+iTkBBN5fbJYztgPIRvD4FSNwyimugHAR4BrcJkhoMMXzrp2ucjsyLFhsnl6+dsNusp02gkszsv+ICj94L+qGkuw7s44f3NnyE/V2e4vm+NrYZCsQcD/30gcK1xxXxU/GIlqjVbBmWeSbh7oJGxmJ2yXIs/cdx6/TVlpNdVUkcmK/OWZBWWi3W/ZvcORPBpYzcIl3Hzixlbsb5y9CYBANk7ubBWTbgpRbxzAhKz+04Jb/33hXwemIDY19yCIfbm6E8uzySO+9+wYrve8Szxmh/ALe+CqdRmDk5IvRu9tBEKaQ5PL/zMP+ko4dgg7gewMQZzwS6dEfVONYPSQ/dlwSlqy9fkmRC2FlKVtDqECxyODVid/ayZ1zrixPrA+dWnCMQL3GDuYLIxAZf5lPlR8exc02xTawBfXhc8tX4WFgVzK2uCv2+bS6FRj4I/Cfu1eay4R+3zrRw+dlQGV/kOIbZobIvqhDPmoCeZobKcLmI0c032xbHkipYmuIuPYE6LwMzhBJ/dTcT+CdGI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: P2OR9jtwCCAQ95R+VmIxVNpiSUH7vjYm05xczjCrnE2Mqj74MwkJ4Lwflzm4XINLHj03wb/THTLeR+fcdv7BQCMexNjBjG+HQSZV+75UWd0FkzU3YUTeiEuPkU/hpEciP3QOoHUwFmIYME0KNUUzfAK6+asHL92aZ5NMnhs0K6EcerRWqXoMVOq6jfUx37R/GNoP0e5v+I5ixS3KxMJsz3gawlzj7wCHVufkfoe/O92milwxIgmLs06vrfXNLnut6MY+Ycc2nZGyBBWTXkEWrv8tpuma5LaKhfuTqMbtngt2XIuOVVAsXv03lJOLmXj4+tz/sbo3iy3NtmF3KLxmlzGJ9meULOgQeG0PYxHEMO7WljLsQzh3Qgiufpd0KIxQqLGaTWk/F184xkFYuimhUoeyozd0IsSOJemoILoLkZw9QvSba+wreqVTc4Z1byCO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 07:15:39.0079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88933287-de9d-49e9-ffd4-08debaf696fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8201
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email,amd.com:mid,amd.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[ray.wu@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B31CB5D197E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Samson Tam <Samson.Tam@amd.com>

[Why & How]
- calc_lb_num_partitions has check when scaler is not enabled to use
 larger LB in calculations for max vtaps based on viewport being 1:1
- however, scaler is forced on when sharpening is enabled, so need
 to consider this in check
- taps is predetermined in spl_get_optimal_number_of_taps prior to
 calc_lb_num_partitions.  Add check for taps not 1 to handle
 sharpening case

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Signed-off-by: Samson Tam <Samson.Tam@amd.com>
Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c
index 2d6a646462e2..8e0fa7be34ee 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c
@@ -390,9 +390,11 @@ void dscl401_spl_calc_lb_num_partitions(
 		lb_memory_size_a = 1290;
 	} else if (lb_config == LB_MEMORY_CONFIG_3) {
 		if (scl_data->viewport.width  == scl_data->h_active &&
-			scl_data->viewport.height == scl_data->v_active) {
+			scl_data->viewport.height == scl_data->v_active &&
+			scl_data->taps.h_taps == 1 && scl_data->taps.v_taps == 1) {
 			/* 420 mode: luma using all 3 mem from Y, plus 3rd mem from Cr and Cb */
 			/* use increased LB size for calculation only if Scaler not enabled */
+			/* Scaler is forced on when sharpening is on. Add check for taps = 1 */
 			lb_memory_size = 970 + 1290 + 1170 + 1170 + 1170;
 			lb_memory_size_c = 970 + 1290;
 			lb_memory_size_a = 970 + 1290 + 1170;
@@ -404,8 +406,10 @@ void dscl401_spl_calc_lb_num_partitions(
 		}
 	} else {
 		if (scl_data->viewport.width  == scl_data->h_active &&
-			scl_data->viewport.height == scl_data->v_active) {
+			scl_data->viewport.height == scl_data->v_active &&
+			scl_data->taps.h_taps == 1 && scl_data->taps.v_taps == 1) {
 			/* use increased LB size for calculation only if Scaler not enabled */
+			/* Scaler is forced on when sharpening is on. Add check for taps = 1 */
 			lb_memory_size = 970 + 1290 + 1170;
 			lb_memory_size_c = 970 + 1290 + 1170;
 			lb_memory_size_a = 970 + 1290 + 1170;
-- 
2.43.0

