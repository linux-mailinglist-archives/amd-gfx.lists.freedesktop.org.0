Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F2CA8A229
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Apr 2025 16:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5809A10E7BA;
	Tue, 15 Apr 2025 14:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2kUshUQE";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA25910E7BF
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Apr 2025 14:59:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sb+t9QC5xqxRputwkegaPIa+L/bXTgdt2nsE0IABZKgArSdhQ2Erdmvs1hqwvbs2ik7kqbi7NgRLC2NGyYGTHNDAiAU+TwgfDPi3/MKZsIaIozQ4FODHsnVe2ISgWr3gwKiY/GUOkNZWzriV07OL5jBejzg4O/YqclaKksx/aBngBnafUXMFob23F6MLQDYikoj2AASXg+JTfYeyMiOk02GjptS0YlY4jEB27puAnPB4G9LhJ3aIxYxnbe9UaN236pZzxPGLvLlAqX5Z+Wb0onFCJAa9UDEhkTJA4ENjn4qKcWIJoL+Spji3Pln9mu43X8OcYXvGjh+4kmqQnqkrFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJKIL9MCpnyUaIPf7NiTjjRFmjzWzVmloHm2kti3CWM=;
 b=RbPH4OatYlFZB3s586TpsQD8YYg6ZWDXpi0LCFctyP2E6jy3NrxfDMfSLT1uW9r4bHFXjeLT92Q78OHEqz6vJDNaw91e3chfS2+notGstaBYlHV7cj1+fvGUJw5zYxEsO+RCma7voywpV3ErIqIokpCY9R8I0kTJBnCkgosjBXy8yhU/hSXSPKzDev1tVYswD2lViJfCgVOP1V7lZ4Sr1fwNvGwLuHcboAawcNvun0suCHIu2pmavxKAG1APzqbXeDULfeWA2WVRchguOURNteSQjXA7pkgjfqWgShkHpF01PgWILs6SI5Z4QRjWqZPmpkOSJslAvlZaAFqXBiCLpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJKIL9MCpnyUaIPf7NiTjjRFmjzWzVmloHm2kti3CWM=;
 b=2kUshUQE5QF4/72f0TyRrNG4AhQtt/mAw9W+JvleQnD2aVY8O2DlkrVvhXCMBfN0YWq62gjY7ouNOOuG0KpZDTGLho+iPfY0Uk13PLLQTsIeMiUKWtqDV0sHqA1PHy3vFRxySv9B0bSQSCiDKmtA+Sdx7hiwRZeQp40ja0a1nZU=
Received: from SA0PR11CA0176.namprd11.prod.outlook.com (2603:10b6:806:1bb::31)
 by LV8PR12MB9206.namprd12.prod.outlook.com (2603:10b6:408:186::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Tue, 15 Apr
 2025 14:59:42 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:806:1bb:cafe::3c) by SA0PR11CA0176.outlook.office365.com
 (2603:10b6:806:1bb::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Tue,
 15 Apr 2025 14:59:41 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 14:59:41 +0000
Received: from mkmmarleung05.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 09:59:39 -0500
From: Zaeem Mohamed <zaeem.mohamed@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Zaeem Mohamed <zaeem.mohamed@amd.com>, "Daniel
 Wheeler" <daniel.wheeler@amd.com>, Alex Hung <alex.hung@amd.com>, Roman Li
 <Roman.Li@amd.com>, <stable@vger.kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH 06/22] drm/amd/display: Fix gpu reset in multidisplay config
Date: Tue, 15 Apr 2025 10:58:52 -0400
Message-ID: <20250415145908.3790253-7-zaeem.mohamed@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415145908.3790253-1-zaeem.mohamed@amd.com>
References: <20250415145908.3790253-1-zaeem.mohamed@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|LV8PR12MB9206:EE_
X-MS-Office365-Filtering-Correlation-Id: 79dfc571-9ad6-4d7a-7aff-08dd7c2e268d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9RcJARONZEu4NB6Bh7F4p3cASxUGhIRqF2VsHwZLX+M7aFJxXgFqCboNlDmb?=
 =?us-ascii?Q?+Xi0lrjDNvk0aXfcDmrUTTM8LBmLsar8T+EtBTo7ZxhW7WmR6MhHm8wcstUw?=
 =?us-ascii?Q?0IROE0pLHdeYaSsDiCcYb3TidEgbWa+z+SX8ZjZ4tIYGy03EQcJ8f2vSCrSe?=
 =?us-ascii?Q?YMfJsgzss9OWEgwK/LKJlGgvOgZjhU3pCd88cvpWxoCDXT+5gJYyo+C2TWMb?=
 =?us-ascii?Q?i82OV0Z+DgZ13iJSloIEBGfJah87ZdeYv2tfp8JRby4UL3Uag4BoG+HX8QfB?=
 =?us-ascii?Q?lOBW+G7yKRQkr72tBepHZqoyghjsXbpCu9vgj6ut8CN+3pxrTKOWsjLaeHUN?=
 =?us-ascii?Q?W26ZQ4Jx/l7sii0lwfIb9+y0VxHcR6EyVuP+wCSxwzRo7kNjQG42jvvg+UPa?=
 =?us-ascii?Q?o7jV/lIJkGY+RJSbk0qLX9eyznYx1wkMdQcrQMGH+aMJMUtZa2w8zOtHH9vt?=
 =?us-ascii?Q?kmJDOxv19VDJhu/iwD7/6iTTE8s9RJlNzvtlhKntteWul7Wz7RuzW0hTra4Q?=
 =?us-ascii?Q?pRv4qdACOkJro2W/aVvalTVjV9uEiXCQm+V6liZ0rKpyaAEQ01K28IWu8JxV?=
 =?us-ascii?Q?9x1UaeV/BM01ZV6aOT/M7wle2/9FEF+osWa8BQaz4wXiE72ZCiWsq4vWm8YI?=
 =?us-ascii?Q?jQbS3yETd0HIA3Ipr/AvwE+i952eGmmNn+8GQpgqESNFqexA97spB6QzYBY5?=
 =?us-ascii?Q?90DJq/VdF2heJ3SeexRiBckN9CILYyJWP7soQQLVdZqQ4TlnmHbaaTbi/Ifh?=
 =?us-ascii?Q?m/VJatG4Ogdlp9fFRoKhBYgqHrdtvDIVQXoNbtPVfLdXgbORnxmonwtz8don?=
 =?us-ascii?Q?hoUItxlR/197fAm4Hu1aI273aqyGTjyHGmgFQUtJR/Fz8WnYqcCwIkhdSwA7?=
 =?us-ascii?Q?BvjXTZKsE7VFi37B3kwF6mvIwS23zL5R1/hVRWYL/AEfcTL5pjRx6IAIOvj5?=
 =?us-ascii?Q?0acWWSBza8URDeorJpWUhGcFFIt1eqwh8vSeS1L6WBmFizEr4jToztpcNuZ2?=
 =?us-ascii?Q?Q7N3r+T1ROpe8ubkHjzATxzLMvZeLOPSbbQIsDxGr7itWUtn8LvKJMFFQpLR?=
 =?us-ascii?Q?98sGXFDZ68umMeW/QM3hFy29zS+wKP3aSI7nQ6aNgER0lbOXiZ4Wj1GSURhr?=
 =?us-ascii?Q?aFc9CchMKVKtLumLopQPzNYBGqLn6ldF/ydWyJYVHEoagQVxu/sNYbS+5kMM?=
 =?us-ascii?Q?S3XtwIiNTPgoemGgUceyl5aLVQW4fyhQO58d0RguAB2KmxuSgAChnK8hHv3s?=
 =?us-ascii?Q?NjvSXV1HA8a3L0mUwFv/uVH5sAzckTQ0wB6FWNL6NznSAvB9TE4wvnQixfMP?=
 =?us-ascii?Q?dXSpua/FEzCPuS0wDl46oOQIjqz6ZYCX72CxoGBd7tQOxIVsqV9LJWICpzlI?=
 =?us-ascii?Q?E1H5UdfZgGTZqHHKrlFvrGXHsglFiK/cCl/J0sy1arQU2g3NE9pm1KLxVZfd?=
 =?us-ascii?Q?jbc7/PXN3HZ+cq0wEN8jiaUVByG405gPgj1SBkMi2OkcXR2lYJuS9w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 14:59:41.2999 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79dfc571-9ad6-4d7a-7aff-08dd7c2e268d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9206
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

From: Roman Li <Roman.Li@amd.com>

[Why]
The indexing of stream_status in dm_gpureset_commit_state() is incorrect.
That leads to asserts in multi-display configuration after gpu reset.

[How]
Adjust the indexing logic to align stream_status with surface_updates.

Fixes: cdaae8371aa9 ("drm/amd/display: Handle GPU reset for DC block")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3808
Cc: <stable@vger.kernel.org>

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Roman Li <Roman.Li@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 58e758732338..dace1e42f412 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3411,16 +3411,16 @@ static void dm_gpureset_commit_state(struct dc_state *dc_state,
 	for (k = 0; k < dc_state->stream_count; k++) {
 		bundle->stream_update.stream = dc_state->streams[k];
 
-		for (m = 0; m < dc_state->stream_status->plane_count; m++) {
+		for (m = 0; m < dc_state->stream_status[k].plane_count; m++) {
 			bundle->surface_updates[m].surface =
-				dc_state->stream_status->plane_states[m];
+				dc_state->stream_status[k].plane_states[m];
 			bundle->surface_updates[m].surface->force_full_update =
 				true;
 		}
 
 		update_planes_and_stream_adapter(dm->dc,
 					 UPDATE_TYPE_FULL,
-					 dc_state->stream_status->plane_count,
+					 dc_state->stream_status[k].plane_count,
 					 dc_state->streams[k],
 					 &bundle->stream_update,
 					 bundle->surface_updates);
-- 
2.34.1

