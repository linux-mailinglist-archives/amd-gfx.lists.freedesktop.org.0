Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E303397CDA4
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2024 20:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9588110E755;
	Thu, 19 Sep 2024 18:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EovuJXQs";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E3E10E755
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2024 18:34:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFlyG8SWEnJFRvrGTOsUAsRhi3E5Eax34b44YJDaEvqQ12as4uv+GFFxGtr+p0RBzeczOaizSTJTrWGIYNWVXcPa279MPjcAACUsHmTsuZ3ksMv7Iv8bZLl9T6Oh8OQHVxuIa0IoCi5QWSJBFBIDtebtzOVq1Vf6mOSQ9+Rroexo8NnKIYPpt+sTD9xtOR/ccwesBVYISIsey20XV8VbOF59yEh2zJL0q7oVBjwYJi8D3Q7Ap4lKZKbGc8tAFqe+/GemagQBQVI9mJmYr0GEovzPodz/fc64v6YIuxl3SqMsFG2V9ozSCH45Rv9ickigDgfWMofRKRoSu1mlry9Ysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbyfwQ3HKMHrQFj5/rQ8LjFtJAHTcQMkf7r6XLHZ7HM=;
 b=uVvTnri7zHiqsHPe0GHgeu1Y98lItY+p0x0PQD/frcFJ/qzjvrTzSCl2VzJNxlxr6AQL7W0XU6bs8cTWcoFpHHKGQbjR1xDmB2ZKGvi5v1d+aiZqEVbJRpx9KChFK5FQKblhn2GD3aWg/PHC7lq9JolmtPThJ94304SoZ6B2tulm61Zjtn2C0f9P7kLGP9VZLao9SwjC3FWgkscEBS5v6CVMc6worW3qbcTmJT0EPtKaXwkcxiO80fIeE1OzFOQTPSa8/nHgvYV7Z/AWVuXKzwIHCqYdFmh3iuaeOGiePCw5u6cXy7GqjdSEWl6OsZ+dtO8hBmS4Z58gpKr/KmQn+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbyfwQ3HKMHrQFj5/rQ8LjFtJAHTcQMkf7r6XLHZ7HM=;
 b=EovuJXQsgfpCYjU9DBnIYW9IMh5iIQMj5rWsasqrGzRwMxOoQqhnMw5ryMvRm15SufvDdgRmHlxOZ84WKVIUPyoVwY3NzMCBeIRrhAzejiIo20qVrD01BW0LHdorHPoz6r1f4/p1SV+C0vom15UWkW23XPQ5mTOa9YCCkhHk/y0=
Received: from PH7P220CA0033.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::33)
 by SA1PR12MB5658.namprd12.prod.outlook.com (2603:10b6:806:235::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Thu, 19 Sep
 2024 18:34:45 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::61) by PH7P220CA0033.outlook.office365.com
 (2603:10b6:510:32b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Thu, 19 Sep 2024 18:34:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 18:34:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 13:34:44 -0500
Received: from aaurabin-suse.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 19 Sep 2024 13:34:38 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, "Roman
 Li" <roman.li@amd.com>, Wayne Lin <wayne.lin@amd.com>, Tom Chung
 <chiahsuan.chung@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>, Zaeem Mohamed
 <zaeem.mohamed@amd.com>, Solomon Chiu <solomon.chiu@amd.com>, Daniel Wheeler
 <daniel.wheeler@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 <stable@vger.kernel.org>
Subject: [PATCH 03/21] drm/amd/display: Restore Optimized pbn Value if Failed
 to Disable DSC
Date: Thu, 19 Sep 2024 14:33:21 -0400
Message-ID: <20240919183435.1896209-4-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919183435.1896209-1-aurabindo.pillai@amd.com>
References: <20240919183435.1896209-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: aurabindo.pillai@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|SA1PR12MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f48a42f-9271-4b5c-565a-08dcd8d9bc06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qzj1TpWQW8IisQzhmyh1YcOZWEXXmltHV8pDORSro5D2n/Aa84ibdBP84Azw?=
 =?us-ascii?Q?rbLVYxVjSpnWtl+3fCs67YOxbo8DwPt2xgAEUoArlrhRKWsGqlEvxaFBsEAQ?=
 =?us-ascii?Q?hb5tuePcA9lX383fREDtOyVEnkliqcaOLDOyAuwyUb4UMU/JlkM2aVLn5E+d?=
 =?us-ascii?Q?m4Gh6TUwb5YL1bNSjUZ8nAbaQcz/rCE0RL44+D5pKizsRsco/VivZc00BMpN?=
 =?us-ascii?Q?PeG4SPGsPUJV7jxTNS9r+pprC3HOM/3HPbp0kmEu7uQ8vIwg1BpLr2bMDR1Z?=
 =?us-ascii?Q?YTyxyAy4j+poNGh/7KPWuTdaIH0NYU1tNIOwyLqozRyyBoFF1lzSVuNLSOuL?=
 =?us-ascii?Q?8neRsjsriLibZwrEuCr3V6Q87lZgnCsEb4SglH0/S/ccrNWbAeXPOiIL/rz5?=
 =?us-ascii?Q?tDii23GKPjWQkI9DXiL+MnAV/2oMMAfguWWSJ1/OXDktqEmewNOLYZd75WvI?=
 =?us-ascii?Q?nuID51DAPvfnq+kiu8enhK4gt3iY/veEJ+b5ZPKEViMm8q/c0i7C1WbJlquE?=
 =?us-ascii?Q?S8ayBiAytgjTeN+aBDwCONqr+gwPTemq/oAm5qMn1jG+ZPI3wP/z9d0btu30?=
 =?us-ascii?Q?bOgApFD5xbPxEJyyUZfT7tjBc9635OE6KPucv/C2p3IKt2/94gFVj+cSV5yW?=
 =?us-ascii?Q?gYM9PLPWsWAm6hG8eWlitaqhGx+gKhDylfsY7Eeli8s1DaoPHhq3avRQavxT?=
 =?us-ascii?Q?ws6HOfTQWHz0wkWVwAIp6/s45Ylbb70VTCTxRt870p8t7YVLWfNASMI6Aad9?=
 =?us-ascii?Q?e8I61Wwhw0BaImcyUmzMWfysXqweZq9OHIJs5vU8Ms0Czu7yLDtfo4T2HLw+?=
 =?us-ascii?Q?+vBdeiSrcu6ISNk9HsuVyC28UxYlUpfIm6CtBmwA1cxA7brzhj90FiYqsVoZ?=
 =?us-ascii?Q?apD+lqVCIZ2Q2D9ie8ClelgYks7OLFnJhYFxER8Tewan9oCJNtaWlRPUhSPE?=
 =?us-ascii?Q?lke+w53j0JaGwLIOsM2LUhf2Ml+9ncr3mauy4+pfByV/siPj/b8L1VtVhLjW?=
 =?us-ascii?Q?UbEMIMuT+JrTewXYyB0gWxZZL8OJGJrHLBtHqlayf6I7rqKH3JynI6El25aG?=
 =?us-ascii?Q?ZuK26obkjtFTJs6KUPfH/gfLJmqiDsRYiJrlxFFNU3VecMahWmR+HgHOXWqx?=
 =?us-ascii?Q?zi6mpKKkIH2nin/Fr7lilyTTDU298sijIZuwt4XhjhRgHTuVoGdPjSsr8SxY?=
 =?us-ascii?Q?1TlHWs6/PNdruppOIBkvVg5vUpyk7XFlPZedvIUl3CioXhX23ZwJBd7eRLh9?=
 =?us-ascii?Q?ZloMDHjs6j3b/J0e11GMqqO1NewWhLo84UzZ4OElPvppeffZ7tpMZ5NelVwM?=
 =?us-ascii?Q?6tif7ghezVRU0vfHlKIQ4VbPIeGuyLma1EvTpY/sWJtIJ0zNwsUigKUxdVRQ?=
 =?us-ascii?Q?+j6h3mWZKgWt7/N/M1HZeuTuIgQbq9gc6IEWJYObihIVE/qlONm3JXhsOfFd?=
 =?us-ascii?Q?KliynBl8fFZkmZcbZwYsbr9x8DWdTjE/?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 18:34:45.2865 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f48a42f-9271-4b5c-565a-08dcd8d9bc06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5658
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

From: Fangzhi Zuo <Jerry.Zuo@amd.com>

Existing last step of dsc policy is to restore pbn value under minimum compression
when try to greedily disable dsc for a stream failed to fit in MST bw.
Optimized dsc params result from optimization step is not necessarily the minimum compression,
therefore it is not correct to restore the pbn under minimum compression rate.

Restore the pbn under minimum compression instead of the value from optimized pbn could result
in the dsc params not correct at the modeset where atomic_check failed due to not
enough bw. One or more monitors connected could not light up in such case.

Restore the optimized pbn value, instead of using the pbn value under minimum
compression.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org

Reviewed-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 358c4bff1c40..88b9f4df8fd9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1026,6 +1026,7 @@ static int try_disable_dsc(struct drm_atomic_state *state,
 	int remaining_to_try = 0;
 	int ret;
 	uint16_t fec_overhead_multiplier_x1000 = get_fec_overhead_multiplier(dc_link);
+	int var_pbn;
 
 	for (i = 0; i < count; i++) {
 		if (vars[i + k].dsc_enabled
@@ -1056,13 +1057,18 @@ static int try_disable_dsc(struct drm_atomic_state *state,
 			break;
 
 		DRM_DEBUG_DRIVER("MST_DSC index #%d, try no compression\n", next_index);
+		var_pbn = vars[next_index].pbn;
 		vars[next_index].pbn = kbps_to_peak_pbn(params[next_index].bw_range.stream_kbps, fec_overhead_multiplier_x1000);
 		ret = drm_dp_atomic_find_time_slots(state,
 						    params[next_index].port->mgr,
 						    params[next_index].port,
 						    vars[next_index].pbn);
-		if (ret < 0)
+		if (ret < 0) {
+			DRM_DEBUG_DRIVER("%s:%d MST_DSC index #%d, failed to set pbn to the state, %d\n",
+						__func__, __LINE__, next_index, ret);
+			vars[next_index].pbn = var_pbn;
 			return ret;
+		}
 
 		ret = drm_dp_mst_atomic_check(state);
 		if (ret == 0) {
@@ -1070,14 +1076,17 @@ static int try_disable_dsc(struct drm_atomic_state *state,
 			vars[next_index].dsc_enabled = false;
 			vars[next_index].bpp_x16 = 0;
 		} else {
-			DRM_DEBUG_DRIVER("MST_DSC index #%d, restore minimum compression\n", next_index);
-			vars[next_index].pbn = kbps_to_peak_pbn(params[next_index].bw_range.max_kbps, fec_overhead_multiplier_x1000);
+			DRM_DEBUG_DRIVER("MST_DSC index #%d, restore optimized pbn value\n", next_index);
+			vars[next_index].pbn = var_pbn;
 			ret = drm_dp_atomic_find_time_slots(state,
 							    params[next_index].port->mgr,
 							    params[next_index].port,
 							    vars[next_index].pbn);
-			if (ret < 0)
+			if (ret < 0) {
+				DRM_DEBUG_DRIVER("%s:%d MST_DSC index #%d, failed to set pbn to the state, %d\n",
+							__func__, __LINE__, next_index, ret);
 				return ret;
+			}
 		}
 
 		tried[next_index] = true;
-- 
2.46.0

