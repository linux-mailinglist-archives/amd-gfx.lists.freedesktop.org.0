Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCDDAC5FC8
	for <lists+amd-gfx@lfdr.de>; Wed, 28 May 2025 04:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BAF10E568;
	Wed, 28 May 2025 02:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mNjyim9U";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2040.outbound.protection.outlook.com [40.107.95.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D3410E55F
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 May 2025 02:54:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvhFdkSjNb106viNjcS8fYOJ5H4cMMfa/Cuq0vE1Puh6t3Tb8cKOiYlrN3T1rzSMywGBpsoF73apYq07rxtSVNuv8uGV8SYrytab8ZtXpvkhjJ3cKmBY1+ttw4ggt6BdLFdoZUgrVSvn+2RjMez8Re7OfIA8mbAOX1lbFhtYzphdYcJRXkh+AinDCffz9seAgZey9bge2qOaCjCiS4LfAs77489OYL1JhuTtOumIO3XHorv1f7rqkzBXjLwX2zUOnCU0cN9rNl4EdjfOZWaPYh45waF2ZWOCZea3N2LuQJzlnk0o0aE8nyl6OkBbAM37LeFwzVaxwN2t4ff7dw/Jjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+8PShOqY4irCnDYrmqi/TKR68jNUnEMcxqZPy/pOwo=;
 b=IvebmUKjqgTzD2rYkrL/2ndWweCiOtT5S/k466fsLYQNazwCFid+z53ofm39RcHX2hlgj2ZK56D0cP/SW9WEOZuvUzRrhFBcRcBIxA95eJGLCgHxPYyQk91qJs/GiyVth7QMA7MvCz3NxM9jlXjh4vFBpGHzDBwz4L5jwIcKdsR7YLzzIwWsSX0HbZqNEL2KWqqQlAXKjsf++KCA0IBkg9LexzDB2iD5Z69syvkWkbtUPIAiK1O1c/d6hduhkKcPKyFK6NtjzgfbERpJKCfq6hbAmzwAWIBNH7qbWkILynoS5cGmT7+2QFMU92Zm8tO5L6PBnSvX1EDwl8ThQJCSpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+8PShOqY4irCnDYrmqi/TKR68jNUnEMcxqZPy/pOwo=;
 b=mNjyim9UVsj8X6l16+3qDvrTyEg/MRN6q5ICFKLsUUtxfM4SpFyfH/TfNu/hVFHfJcHE8uETP8uw5wIjjO8hJpIIYCutOFNUHhJ4Ev/j+m58bt2WMNPL3HzeaT/xwU5OB8vApcKOGkoTrqN01q9ZDZueb8XXkNtaixygRy6Th+A=
Received: from CH0PR03CA0272.namprd03.prod.outlook.com (2603:10b6:610:e6::7)
 by SJ0PR12MB6734.namprd12.prod.outlook.com (2603:10b6:a03:478::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Wed, 28 May
 2025 02:54:02 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::44) by CH0PR03CA0272.outlook.office365.com
 (2603:10b6:610:e6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 28 May 2025 02:54:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 02:54:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 21:54:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 21:53:59 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 27 May 2025 21:53:55 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Alex Hung <alex.hung@amd.com>, Yan Li <yan.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: [PATCH 19/24] drm/amd/display: replace fast_validate with enum
 dc_validate_mode
Date: Wed, 28 May 2025 10:49:14 +0800
Message-ID: <20250528025204.79578-20-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528025204.79578-1-Wayne.Lin@amd.com>
References: <20250528025204.79578-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|SJ0PR12MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: 642a54c3-8fad-47f3-8dec-08dd9d92e709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ai8Uoy2rLqDBbzMAl2vypfnZ3uwExapz3KpdmqQWuBNV0MtoT6n3maFYediC?=
 =?us-ascii?Q?4Gg7eVHnf3s6tn+RLvORCR5ZqYUlhqSPI+blB+AIKmqGdBjFDDkhXvz+nlpc?=
 =?us-ascii?Q?AAEOEh4RggSXhP4T5nFzO2Hn4clxn7JkbXcsy4Jq3PAxieLKrG8uAgjoLMTU?=
 =?us-ascii?Q?By67S74UJ1y4Czxm5V5nP0rHhMP5CitCFdLIgz9ozpYOcK3n19zrhSLh0V9E?=
 =?us-ascii?Q?Iv6/kFINbPb5hFJhwG3c/j1Pp8FL5XpGDTZN2hRMZTIpA+KKDG6qV+0pjBFN?=
 =?us-ascii?Q?OMiqppmlS7qI9oSCe3qgJVjSg02WyrTWZ5FERWahQuZ2uvJ6DY5WSVFdrwt3?=
 =?us-ascii?Q?+drwKCKalFxQTM5yZQdUzKTO/5KuUx0IV6fHpVxrZ5LN+QY1dRFjuOxxU94Q?=
 =?us-ascii?Q?FX9C6XEweO7q5ww+F/UXKpQsT8CYcQ8g0Q33i+5QmKFjT1Fd6HP/AT228E2/?=
 =?us-ascii?Q?7nku6fDIjP2A7ALzz36AWM57aOnMsBABWKNbhNEJqriDjlRTFwACUqzGNstv?=
 =?us-ascii?Q?M97Bu1cLWL0TDXDWnbNg0FnOMG5n7ob+BFuID4jVtkNXQ8+xTb9WuVwHIoC4?=
 =?us-ascii?Q?xy4jhxT25VbWs0SWRw5/goht6o2KZUca+KjJ6cuCbAOYjfFI1QdVfbgkCwQk?=
 =?us-ascii?Q?OYWX+7rP6Xy96ne/mv4ItSJlNJU1b4ABbIwVBAwZ3HNQbQoJYhA9viBmZEF+?=
 =?us-ascii?Q?rOGbiUXgHtf7fM0GI8uDV9sn3z5vrtavm2cbwaZ/zgWfeodQmJ64Oa7SSdil?=
 =?us-ascii?Q?cc8m/PqYxPDebBNW66LBXPY7giw0+PnHp9ZiHIRbXdjaPYPeIbrtaiAlv8yZ?=
 =?us-ascii?Q?JOHFodtbEue0C6cth98HpFBOoA+czGCYZe6PGS1ygNZ+y7uaRJiOYAnt/+Ol?=
 =?us-ascii?Q?7v92CkIWNpzV9+wrpjQy6WzigOJE30v7O2d9r0SuzvbRJcgish8gCd9uV0H4?=
 =?us-ascii?Q?icUUv1TkXTR+0DTv1E0ZLimkNLu1JqWAj9gtFilHyo1VlyH3gvXHBz437Esa?=
 =?us-ascii?Q?3SZ8X04dYumskH1uywLQIfuVndwiaYH1M9RTF7XM2npjYptMTKRAoOdwPF4v?=
 =?us-ascii?Q?1ssFOGtqF4qDpTEKWIsmUwd1xYvu1POp1K1SlxUSuZNHQ5x2ablamH/+X6dx?=
 =?us-ascii?Q?4K4EEo89b7Ibsikqtm0K3tiLQHD/2ct2OXxE7aGJZpGP5IKKG6OshOuX+KP3?=
 =?us-ascii?Q?+OrWSLe/kY0M3V9juzIWp+kF09je3m+Rp9h1vdui6wu7QOzIZ9X+aT6TiWOR?=
 =?us-ascii?Q?NTI/4maQr2Hjniq9IRs2f15Ewm+44T/WvF0BrNW6BMmuuvCgxKVkTQFYm8Ae?=
 =?us-ascii?Q?m8uWDTWC1kVH0OWh4eJWtBZYX+2xE68iwNj4AmwWrDG6YatnrAH0P2BHkpSy?=
 =?us-ascii?Q?UCilboV7E8OMlrtZrFawKBB857BN86Rtmgc9Wq/8EWVgLlKEJM0vnFqYOFwN?=
 =?us-ascii?Q?GRWQE4Bf/6ewq7pzrY5ijd30Yqt9lBOcYn52gjXioosBSPSuXflBZ6cYQEhp?=
 =?us-ascii?Q?qPUdts4a71XzyTL2SQIIo2JkfoblVoyKj3dV?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 02:54:02.2856 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 642a54c3-8fad-47f3-8dec-08dd9d92e709
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6734
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

From: Yan Li <yan.li@amd.com>

[Why]
The boolean fast_validate is used as an
input parameter in multiple functions. To
support more scenarios, we are
replacing it with enum dc_validate_mode.

[How]
The enum dc_validate_mode introduces three
possible values:
1) DC_VALIDATE_MODE_AND_PROGRAMMING:
   Apply the mode to hardware
2) DC_VALIDATE_MODE_ONLY:
   Check whether the mode can be supported
3) DC_VALIDATE_MODE_AND_STATE_INDEX:
   Check if the mode can be supported, and
   determine the optimal voltage level
   needed to support it.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Yan Li <yan.li@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 12 ++---
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 12 ++---
 drivers/gpu/drm/amd/display/dc/dc.h           |  8 +---
 drivers/gpu/drm/amd/display/dc/dc_types.h     |  8 ++++
 .../drm/amd/display/dc/dml/calcs/dcn_calcs.c  |  6 +--
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  | 45 +++++++++----------
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.h  | 12 ++---
 .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.c  |  6 ++-
 .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.h  |  2 +-
 .../amd/display/dc/dml/dcn314/dcn314_fpu.c    |  4 +-
 .../amd/display/dc/dml/dcn314/dcn314_fpu.h    |  2 +-
 .../drm/amd/display/dc/dml/dcn32/dcn32_fpu.c  | 30 +++++++------
 .../drm/amd/display/dc/dml/dcn32/dcn32_fpu.h  |  2 +-
 .../drm/amd/display/dc/dml/dcn35/dcn35_fpu.c  |  4 +-
 .../drm/amd/display/dc/dml/dcn35/dcn35_fpu.h  |  2 +-
 .../amd/display/dc/dml/dcn351/dcn351_fpu.c    |  4 +-
 .../amd/display/dc/dml/dcn351/dcn351_fpu.h    |  2 +-
 .../amd/display/dc/dml2/dml21/dml21_wrapper.c |  7 +--
 .../amd/display/dc/dml2/dml21/dml21_wrapper.h | 11 +++--
 .../amd/display/dc/dml2/dml2_mall_phantom.c   |  2 +-
 .../drm/amd/display/dc/dml2/dml2_wrapper.c    |  9 ++--
 .../drm/amd/display/dc/dml2/dml2_wrapper.h    |  4 +-
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  2 +-
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c |  2 +-
 .../gpu/drm/amd/display/dc/inc/core_types.h   |  4 +-
 .../gpu/drm/amd/display/dc/inc/dcn_calcs.h    |  2 +-
 .../dc/resource/dce100/dce100_resource.c      |  2 +-
 .../dc/resource/dce110/dce110_resource.c      |  2 +-
 .../dc/resource/dce112/dce112_resource.c      |  2 +-
 .../dc/resource/dce112/dce112_resource.h      |  2 +-
 .../dc/resource/dce60/dce60_resource.c        |  2 +-
 .../dc/resource/dce80/dce80_resource.c        |  2 +-
 .../dc/resource/dcn10/dcn10_resource.c        |  4 +-
 .../dc/resource/dcn20/dcn20_resource.c        |  8 ++--
 .../dc/resource/dcn20/dcn20_resource.h        |  4 +-
 .../dc/resource/dcn21/dcn21_resource.c        |  8 ++--
 .../dc/resource/dcn21/dcn21_resource.h        |  2 +-
 .../dc/resource/dcn30/dcn30_resource.c        | 22 ++++-----
 .../dc/resource/dcn30/dcn30_resource.h        |  6 +--
 .../dc/resource/dcn31/dcn31_resource.c        | 18 ++++----
 .../dc/resource/dcn31/dcn31_resource.h        |  4 +-
 .../dc/resource/dcn314/dcn314_resource.c      | 14 +++---
 .../dc/resource/dcn314/dcn314_resource.h      |  2 +-
 .../dc/resource/dcn315/dcn315_resource.c      |  4 +-
 .../dc/resource/dcn316/dcn316_resource.c      |  4 +-
 .../dc/resource/dcn32/dcn32_resource.c        | 26 +++++------
 .../dc/resource/dcn32/dcn32_resource.h        |  4 +-
 .../dc/resource/dcn35/dcn35_resource.c        |  6 +--
 .../dc/resource/dcn351/dcn351_resource.c      |  6 +--
 .../dc/resource/dcn36/dcn36_resource.c        |  6 +--
 .../dc/resource/dcn401/dcn401_resource.c      | 10 ++---
 .../dc/resource/dcn401/dcn401_resource.h      |  2 +-
 53 files changed, 198 insertions(+), 182 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index afaa98e8ca15..0ac42ebbd405 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7515,7 +7515,7 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
 		dc_result = DC_FAIL_ATTACH_SURFACES;
 
 	if (dc_result == DC_OK)
-		dc_result = dc_validate_global_state(dc, dc_state, true);
+		dc_result = dc_validate_global_state(dc, dc_state, DC_VALIDATE_MODE_ONLY);
 
 cleanup:
 	if (dc_state)
@@ -12137,7 +12137,7 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			drm_dbg_atomic(dev, "MST drm_dp_mst_atomic_check() failed\n");
 			goto fail;
 		}
-		status = dc_validate_global_state(dc, dm_state->context, true);
+		status = dc_validate_global_state(dc, dm_state->context, DC_VALIDATE_MODE_ONLY);
 		if (status != DC_OK) {
 			drm_dbg_atomic(dev, "DC global validation failure: %s (%d)",
 				       dc_status_to_str(status), status);
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 56d011a1323c..284261cd372f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2377,7 +2377,7 @@ enum dc_status dc_commit_streams(struct dc *dc, struct dc_commit_streams_params
 
 	context->power_source = params->power_source;
 
-	res = dc_validate_with_context(dc, set, params->stream_count, context, false);
+	res = dc_validate_with_context(dc, set, params->stream_count, context, DC_VALIDATE_MODE_AND_PROGRAMMING);
 
 	/*
 	 * Only update link encoder to stream assignment after bandwidth validation passed.
@@ -3300,7 +3300,8 @@ static void copy_stream_update_to_stream(struct dc *dc,
 		if (dsc_validate_context) {
 			stream->timing.dsc_cfg = *update->dsc_config;
 			stream->timing.flags.DSC = enable_dsc;
-			if (dc->res_pool->funcs->validate_bandwidth(dc, dsc_validate_context, true) != DC_OK) {
+			if (dc->res_pool->funcs->validate_bandwidth(dc, dsc_validate_context,
+				DC_VALIDATE_MODE_ONLY) != DC_OK) {
 				stream->timing.dsc_cfg = old_dsc_cfg;
 				stream->timing.flags.DSC = old_dsc_enabled;
 				update->dsc_config = NULL;
@@ -3522,7 +3523,7 @@ static bool update_planes_and_stream_state(struct dc *dc,
 	}
 
 	if (update_type == UPDATE_TYPE_FULL) {
-		if (dc->res_pool->funcs->validate_bandwidth(dc, context, false) != DC_OK) {
+		if (dc->res_pool->funcs->validate_bandwidth(dc, context, DC_VALIDATE_MODE_AND_PROGRAMMING) != DC_OK) {
 			BREAK_TO_DEBUGGER();
 			goto fail;
 		}
@@ -4628,7 +4629,8 @@ static struct dc_state *create_minimal_transition_state(struct dc *dc,
 
 	backup_and_set_minimal_pipe_split_policy(dc, base_context, policy);
 	/* commit minimal state */
-	if (dc->res_pool->funcs->validate_bandwidth(dc, minimal_transition_context, false) == DC_OK) {
+	if (dc->res_pool->funcs->validate_bandwidth(dc, minimal_transition_context,
+		DC_VALIDATE_MODE_AND_PROGRAMMING) == DC_OK) {
 		/* prevent underflow and corruption when reconfiguring pipes */
 		force_vsync_flip_in_minimal_transition_context(minimal_transition_context);
 	} else {
@@ -5151,7 +5153,7 @@ static bool update_planes_and_stream_v1(struct dc *dc,
 	copy_stream_update_to_stream(dc, context, stream, stream_update);
 
 	if (update_type >= UPDATE_TYPE_FULL) {
-		if (dc->res_pool->funcs->validate_bandwidth(dc, context, false) != DC_OK) {
+		if (dc->res_pool->funcs->validate_bandwidth(dc, context, DC_VALIDATE_MODE_AND_PROGRAMMING) != DC_OK) {
 			DC_ERROR("Mode validation failed for stream update!\n");
 			dc_state_release(context);
 			return false;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 3da25bd8b578..854fc51f159c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -4053,7 +4053,7 @@ static bool add_all_planes_for_stream(
  * @set: An array of dc_validation_set with all the current streams reference
  * @set_count: Total of streams
  * @context: New context
- * @fast_validate: Enable or disable fast validation
+ * @validate_mode: identify the validation mode
  *
  * This function updates the potential new stream in the context object. It
  * creates multiple lists for the add, remove, and unchanged streams. In
@@ -4068,7 +4068,7 @@ enum dc_status dc_validate_with_context(struct dc *dc,
 					const struct dc_validation_set set[],
 					int set_count,
 					struct dc_state *context,
-					bool fast_validate)
+					enum dc_validate_mode validate_mode)
 {
 	struct dc_stream_state *unchanged_streams[MAX_PIPES] = { 0 };
 	struct dc_stream_state *del_streams[MAX_PIPES] = { 0 };
@@ -4242,7 +4242,7 @@ enum dc_status dc_validate_with_context(struct dc *dc,
 		dc_state_set_stream_subvp_cursor_limit(context->streams[i], context, false);
 	}
 
-	res = dc_validate_global_state(dc, context, fast_validate);
+	res = dc_validate_global_state(dc, context, validate_mode);
 
 	/* calculate pixel rate divider after deciding pxiel clock & odm combine  */
 	if ((dc->hwss.calculate_pix_rate_divider) && (res == DC_OK)) {
@@ -4299,7 +4299,7 @@ static void decide_hblank_borrow(struct pipe_ctx *pipe_ctx)
  *
  * @dc: dc struct for this driver
  * @new_ctx: state to be validated
- * @fast_validate: set to true if only yes/no to support matters
+ * @validate_mode: identify the validation mode
  *
  * Checks hardware resource availability and bandwidth requirement.
  *
@@ -4309,7 +4309,7 @@ static void decide_hblank_borrow(struct pipe_ctx *pipe_ctx)
 enum dc_status dc_validate_global_state(
 		struct dc *dc,
 		struct dc_state *new_ctx,
-		bool fast_validate)
+		enum dc_validate_mode validate_mode)
 {
 	enum dc_status result = DC_ERROR_UNEXPECTED;
 	int i, j;
@@ -4368,7 +4368,7 @@ enum dc_status dc_validate_global_state(
 	result = resource_build_scaling_params_for_context(dc, new_ctx);
 
 	if (result == DC_OK)
-		result = dc->res_pool->funcs->validate_bandwidth(dc, new_ctx, fast_validate);
+		result = dc->res_pool->funcs->validate_bandwidth(dc, new_ctx, validate_mode);
 
 	return result;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 274288139461..9878868ff4d2 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1804,19 +1804,15 @@ enum dc_status dc_validate_with_context(struct dc *dc,
 					const struct dc_validation_set set[],
 					int set_count,
 					struct dc_state *context,
-					bool fast_validate);
+					enum dc_validate_mode validate_mode);
 
 bool dc_set_generic_gpio_for_stereo(bool enable,
 		struct gpio_service *gpio_service);
 
-/*
- * fast_validate: we return after determining if we can support the new state,
- * but before we populate the programming info
- */
 enum dc_status dc_validate_global_state(
 		struct dc *dc,
 		struct dc_state *new_ctx,
-		bool fast_validate);
+		enum dc_validate_mode validate_mode);
 
 bool dc_acquire_release_mpc_3dlut(
 		struct dc *dc, bool acquire,
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index 794b5f30d252..a8afbe5eaf1d 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -1370,4 +1370,12 @@ struct set_backlight_level_params {
 	uint8_t aux_inst;
 };
 
+enum dc_validate_mode {
+	/* validate the mode and program HW */
+	DC_VALIDATE_MODE_AND_PROGRAMMING = 0,
+	/* only validate the mode */
+	DC_VALIDATE_MODE_ONLY = 1,
+	/* validate the mode and get the max state (voltage level) */
+	DC_VALIDATE_MODE_AND_STATE_INDEX = 2,
+};
 #endif /* DC_TYPES_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
index f1235bf9a596..74962791302f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
@@ -748,7 +748,7 @@ static unsigned int get_highest_allowed_voltage_level(bool is_vmin_only_asic)
 bool dcn_validate_bandwidth(
 		struct dc *dc,
 		struct dc_state *context,
-		bool fast_validate)
+		enum dc_validate_mode validate_mode)
 {
 	/*
 	 * we want a breakdown of the various stages of validation, which the
@@ -1119,7 +1119,7 @@ bool dcn_validate_bandwidth(
 
 	BW_VAL_TRACE_END_VOLTAGE_LEVEL();
 
-	if (v->voltage_level != number_of_states_plus_one && !fast_validate) {
+	if (v->voltage_level != number_of_states_plus_one && validate_mode == DC_VALIDATE_MODE_AND_PROGRAMMING) {
 		float bw_consumed = v->total_bandwidth_consumed_gbyte_per_second;
 
 		if (bw_consumed < v->fabric_and_dram_bandwidth_vmin0p65)
@@ -1286,7 +1286,7 @@ bool dcn_validate_bandwidth(
 		}
 	} else if (v->voltage_level == number_of_states_plus_one) {
 		BW_VAL_TRACE_SKIP(fail);
-	} else if (fast_validate) {
+	} else if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING) {
 		BW_VAL_TRACE_SKIP(fast);
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index e9fea9c2162e..2a2eaf6adf26 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -1315,7 +1315,7 @@ static void swizzle_to_dml_params(
 int dcn20_populate_dml_pipes_from_context(struct dc *dc,
 					  struct dc_state *context,
 					  display_e2e_pipe_params_st *pipes,
-					  bool fast_validate)
+					  enum dc_validate_mode validate_mode)
 {
 	int pipe_cnt, i;
 	bool synchronized_vblank = true;
@@ -1733,7 +1733,7 @@ void dcn20_calculate_wm(struct dc *dc, struct dc_state *context,
 			int *out_pipe_cnt,
 			int *pipe_split_from,
 			int vlevel,
-			bool fast_validate)
+			enum dc_validate_mode validate_mode)
 {
 	int pipe_cnt, i, pipe_idx;
 
@@ -1780,10 +1780,10 @@ void dcn20_calculate_wm(struct dc *dc, struct dc_state *context,
 	if (pipe_cnt != pipe_idx) {
 		if (dc->res_pool->funcs->populate_dml_pipes)
 			pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc,
-				context, pipes, fast_validate);
+				context, pipes, validate_mode);
 		else
 			pipe_cnt = dcn20_populate_dml_pipes_from_context(dc,
-				context, pipes, fast_validate);
+				context, pipes, validate_mode);
 	}
 
 	*out_pipe_cnt = pipe_cnt;
@@ -2027,7 +2027,7 @@ void dcn20_patch_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding_box_st
 }
 
 static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc_state *context,
-		bool fast_validate, display_e2e_pipe_params_st *pipes)
+		enum dc_validate_mode validate_mode, display_e2e_pipe_params_st *pipes)
 {
 	bool out = false;
 
@@ -2040,7 +2040,7 @@ static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc_state *co
 
 	BW_VAL_TRACE_COUNT();
 
-	out = dcn20_fast_validate_bw(dc, context, pipes, &pipe_cnt, pipe_split_from, &vlevel, fast_validate);
+	out = dcn20_fast_validate_bw(dc, context, pipes, &pipe_cnt, pipe_split_from, &vlevel, validate_mode);
 
 	if (pipe_cnt == 0)
 		goto validate_out;
@@ -2050,12 +2050,12 @@ static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc_state *co
 
 	BW_VAL_TRACE_END_VOLTAGE_LEVEL();
 
-	if (fast_validate) {
+	if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING) {
 		BW_VAL_TRACE_SKIP(fast);
 		goto validate_out;
 	}
 
-	dcn20_calculate_wm(dc, context, pipes, &pipe_cnt, pipe_split_from, vlevel, fast_validate);
+	dcn20_calculate_wm(dc, context, pipes, &pipe_cnt, pipe_split_from, vlevel, validate_mode);
 	dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
 
 	BW_VAL_TRACE_END_WATERMARKS();
@@ -2077,7 +2077,7 @@ static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc_state *co
 }
 
 bool dcn20_validate_bandwidth_fp(struct dc *dc, struct dc_state *context,
-				 bool fast_validate, display_e2e_pipe_params_st *pipes)
+				 enum dc_validate_mode validate_mode, display_e2e_pipe_params_st *pipes)
 {
 	bool voltage_supported = false;
 	bool full_pstate_supported = false;
@@ -2095,12 +2095,11 @@ bool dcn20_validate_bandwidth_fp(struct dc *dc, struct dc_state *context,
 	/*Unsafe due to current pipe merge and split logic*/
 	ASSERT(context != dc->current_state);
 
-	if (fast_validate) {
-		return dcn20_validate_bandwidth_internal(dc, context, true, pipes);
-	}
+	if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING)
+		return dcn20_validate_bandwidth_internal(dc, context, validate_mode, pipes);
 
 	// Best case, we support full UCLK switch latency
-	voltage_supported = dcn20_validate_bandwidth_internal(dc, context, false, pipes);
+	voltage_supported = dcn20_validate_bandwidth_internal(dc, context, DC_VALIDATE_MODE_AND_PROGRAMMING, pipes);
 	full_pstate_supported = context->bw_ctx.bw.dcn.clk.p_state_change_support;
 
 	if (context->bw_ctx.dml.soc.dummy_pstate_latency_us == 0 ||
@@ -2113,7 +2112,7 @@ bool dcn20_validate_bandwidth_fp(struct dc *dc, struct dc_state *context,
 	context->bw_ctx.dml.soc.dram_clock_change_latency_us = context->bw_ctx.dml.soc.dummy_pstate_latency_us;
 
 	memset(pipes, 0, dc->res_pool->pipe_count * sizeof(display_e2e_pipe_params_st));
-	voltage_supported = dcn20_validate_bandwidth_internal(dc, context, false, pipes);
+	voltage_supported = dcn20_validate_bandwidth_internal(dc, context, DC_VALIDATE_MODE_AND_PROGRAMMING, pipes);
 	dummy_pstate_supported = context->bw_ctx.bw.dcn.clk.p_state_change_support;
 
 	if (voltage_supported && (dummy_pstate_supported || !(context->stream_count))) {
@@ -2156,14 +2155,14 @@ void dcn20_fpu_adjust_dppclk(struct vba_vars_st *v,
 int dcn21_populate_dml_pipes_from_context(struct dc *dc,
 					  struct dc_state *context,
 					  display_e2e_pipe_params_st *pipes,
-					  bool fast_validate)
+					  enum dc_validate_mode validate_mode)
 {
 	uint32_t pipe_cnt;
 	int i;
 
 	dc_assert_fp_enabled();
 
-	pipe_cnt = dcn20_populate_dml_pipes_from_context(dc, context, pipes, fast_validate);
+	pipe_cnt = dcn20_populate_dml_pipes_from_context(dc, context, pipes, validate_mode);
 
 	for (i = 0; i < pipe_cnt; i++) {
 
@@ -2239,7 +2238,7 @@ static void dcn21_calculate_wm(struct dc *dc, struct dc_state *context,
 			int *out_pipe_cnt,
 			int *pipe_split_from,
 			int vlevel_req,
-			bool fast_validate)
+			enum dc_validate_mode validate_mode)
 {
 	int pipe_cnt, i, pipe_idx;
 	int vlevel, vlevel_max;
@@ -2281,10 +2280,10 @@ static void dcn21_calculate_wm(struct dc *dc, struct dc_state *context,
 	if (pipe_cnt != pipe_idx) {
 		if (dc->res_pool->funcs->populate_dml_pipes)
 			pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc,
-				context, pipes, fast_validate);
+				context, pipes, validate_mode);
 		else
 			pipe_cnt = dcn21_populate_dml_pipes_from_context(dc,
-				context, pipes, fast_validate);
+				context, pipes, validate_mode);
 	}
 
 	*out_pipe_cnt = pipe_cnt;
@@ -2319,7 +2318,7 @@ static void dcn21_calculate_wm(struct dc *dc, struct dc_state *context,
 }
 
 bool dcn21_validate_bandwidth_fp(struct dc *dc, struct dc_state *context,
-				 bool fast_validate, display_e2e_pipe_params_st *pipes)
+				 enum dc_validate_mode validate_mode, display_e2e_pipe_params_st *pipes)
 {
 	bool out = false;
 
@@ -2337,7 +2336,7 @@ bool dcn21_validate_bandwidth_fp(struct dc *dc, struct dc_state *context,
 	/*Unsafe due to current pipe merge and split logic*/
 	ASSERT(context != dc->current_state);
 
-	out = dcn21_fast_validate_bw(dc, context, pipes, &pipe_cnt, pipe_split_from, &vlevel, fast_validate);
+	out = dcn21_fast_validate_bw(dc, context, pipes, &pipe_cnt, pipe_split_from, &vlevel, validate_mode);
 
 	if (pipe_cnt == 0)
 		goto validate_out;
@@ -2347,12 +2346,12 @@ bool dcn21_validate_bandwidth_fp(struct dc *dc, struct dc_state *context,
 
 	BW_VAL_TRACE_END_VOLTAGE_LEVEL();
 
-	if (fast_validate) {
+	if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING) {
 		BW_VAL_TRACE_SKIP(fast);
 		goto validate_out;
 	}
 
-	dcn21_calculate_wm(dc, context, pipes, &pipe_cnt, pipe_split_from, vlevel, fast_validate);
+	dcn21_calculate_wm(dc, context, pipes, &pipe_cnt, pipe_split_from, vlevel, validate_mode);
 	dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
 
 	BW_VAL_TRACE_END_WATERMARKS();
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
index b6c34198ddc8..aed00039ca62 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
@@ -44,14 +44,14 @@ void dcn20_calculate_dlg_params(struct dc *dc,
 int dcn20_populate_dml_pipes_from_context(struct dc *dc,
 					  struct dc_state *context,
 					  display_e2e_pipe_params_st *pipes,
-					  bool fast_validate);
+					  enum dc_validate_mode validate_mode);
 void dcn20_calculate_wm(struct dc *dc,
 			struct dc_state *context,
 			display_e2e_pipe_params_st *pipes,
 			int *out_pipe_cnt,
 			int *pipe_split_from,
 			int vlevel,
-			bool fast_validate);
+			enum dc_validate_mode validate_mode);
 void dcn20_cap_soc_clocks(struct _vcs_dpi_soc_bounding_box_st *bb,
 			  struct pp_smu_nv_clock_table max_clocks);
 void dcn20_update_bounding_box(struct dc *dc,
@@ -62,7 +62,7 @@ void dcn20_update_bounding_box(struct dc *dc,
 void dcn20_patch_bounding_box(struct dc *dc,
 			      struct _vcs_dpi_soc_bounding_box_st *bb);
 bool dcn20_validate_bandwidth_fp(struct dc *dc, struct dc_state *context,
-				 bool fast_validate, display_e2e_pipe_params_st *pipes);
+				 enum dc_validate_mode validate_mode, display_e2e_pipe_params_st *pipes);
 void dcn20_fpu_set_wm_ranges(int i,
 			     struct pp_smu_wm_range_sets *ranges,
 			     struct _vcs_dpi_soc_bounding_box_st *loaded_bb);
@@ -75,9 +75,9 @@ void dcn20_fpu_adjust_dppclk(struct vba_vars_st *v,
 int dcn21_populate_dml_pipes_from_context(struct dc *dc,
 					  struct dc_state *context,
 					  display_e2e_pipe_params_st *pipes,
-					  bool fast_validate);
-bool dcn21_validate_bandwidth_fp(struct dc *dc, struct dc_state *context, bool
-				 fast_validate, display_e2e_pipe_params_st *pipes);
+					  enum dc_validate_mode validate_mode);
+bool dcn21_validate_bandwidth_fp(struct dc *dc, struct dc_state *context, enum
+				 dc_validate_mode, display_e2e_pipe_params_st *pipes);
 void dcn21_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params);
 
 void dcn21_clk_mgr_set_bw_params_wm_table(struct clk_bw_params *bw_params);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
index 88789987bdbc..e5f5c0663750 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
@@ -339,7 +339,8 @@ void dcn30_fpu_calculate_wm_and_dlg(
 			 * newly found dummy_latency_index
 			 */
 			context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us;
-			dcn30_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, false, true);
+			dcn30_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel,
+				DC_VALIDATE_MODE_AND_PROGRAMMING, true);
 			maxMpcComb = context->bw_ctx.dml.vba.maxMpcComb;
 			dcfclk = context->bw_ctx.dml.vba.DCFCLKState[vlevel][context->bw_ctx.dml.vba.maxMpcComb];
 			pstate_en = context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][maxMpcComb] != dm_dram_clock_change_unsupported;
@@ -630,7 +631,8 @@ int dcn30_find_dummy_latency_index_for_fw_based_mclk_switch(struct dc *dc,
 	while (dummy_latency_index < max_latency_table_entries) {
 		context->bw_ctx.dml.soc.dram_clock_change_latency_us =
 				dc->clk_mgr->bw_params->dummy_pstate_table[dummy_latency_index].dummy_pstate_latency_us;
-		dcn30_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, false, true);
+		dcn30_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel,
+			DC_VALIDATE_MODE_AND_PROGRAMMING, true);
 
 		if (context->bw_ctx.dml.soc.allow_dram_self_refresh_or_dram_clock_change_in_vblank ==
 			dm_allow_self_refresh_and_mclk_switch)
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
index d2ae43a82ba5..dfcc5d50071e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
@@ -55,5 +55,5 @@ int dcn_get_approx_det_segs_required_for_pstate(
 int dcn31x_populate_dml_pipes_from_context(struct dc *dc,
 					  struct dc_state *context,
 					  display_e2e_pipe_params_st *pipes,
-					  bool fast_validate);
+					  enum dc_validate_mode validate_mode);
 #endif /* __DCN31_FPU_H__*/
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
index 5ed117e11aa2..df9d50b9b57c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
@@ -306,7 +306,7 @@ static unsigned int get_vertical_back_porch(struct dc_crtc_timing *timing)
 
 int dcn314_populate_dml_pipes_from_context_fpu(struct dc *dc, struct dc_state *context,
 					       display_e2e_pipe_params_st *pipes,
-					       bool fast_validate)
+					       enum dc_validate_mode validate_mode)
 {
 	int i, pipe_cnt;
 	struct resource_context *res_ctx = &context->res_ctx;
@@ -316,7 +316,7 @@ int dcn314_populate_dml_pipes_from_context_fpu(struct dc *dc, struct dc_state *c
 
 	dc_assert_fp_enabled();
 
-	dcn31x_populate_dml_pipes_from_context(dc, context, pipes, fast_validate);
+	dcn31x_populate_dml_pipes_from_context(dc, context, pipes, validate_mode);
 
 	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
 		struct dc_crtc_timing *timing;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.h
index d32c5bb99f4c..362ac79184ea 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.h
@@ -35,6 +35,6 @@
 void dcn314_update_bw_bounding_box_fpu(struct dc *dc, struct clk_bw_params *bw_params);
 int dcn314_populate_dml_pipes_from_context_fpu(struct dc *dc, struct dc_state *context,
 					       display_e2e_pipe_params_st *pipes,
-					       bool fast_validate);
+					       enum dc_validate_mode validate_mode);
 
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index b0fc1fd20208..6160952245b4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -290,7 +290,7 @@ int dcn32_find_dummy_latency_index_for_fw_based_mclk_switch(struct dc *dc,
 			vba->DRAMClockChangeSupport[vlevel][context->bw_ctx.dml.vba.maxMpcComb] = temp_clock_change_support;
 		context->bw_ctx.dml.soc.dram_clock_change_latency_us =
 				dc->clk_mgr->bw_params->dummy_pstate_table[dummy_latency_index].dummy_pstate_latency_us;
-		dcn32_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, false);
+		dcn32_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, DC_VALIDATE_MODE_AND_PROGRAMMING);
 
 		/* for subvp + DRR case, if subvp pipes are still present we support pstate */
 		if (vba->DRAMClockChangeSupport[vlevel][vba->maxMpcComb] == dm_dram_clock_change_unsupported &&
@@ -1479,7 +1479,7 @@ static bool dcn32_full_validate_bw_helper(struct dc *dc,
 
 	/* Conditions for setting up phantom pipes for SubVP:
 	 * 1. Not force disable SubVP
-	 * 2. Full update (i.e. !fast_validate)
+	 * 2. Full update (i.e. DC_VALIDATE_MODE_AND_PROGRAMMING)
 	 * 3. Enough pipes are available to support SubVP (TODO: Which pipes will use VACTIVE / VBLANK / SUBVP?)
 	 * 4. Display configuration passes validation
 	 * 5. (Config doesn't support MCLK in VACTIVE/VBLANK || dc->debug.force_subvp_mclk_switch)
@@ -1517,7 +1517,8 @@ static bool dcn32_full_validate_bw_helper(struct dc *dc,
 
 			dc->res_pool->funcs->add_phantom_pipes(dc, context, pipes, *pipe_cnt, dc_pipe_idx);
 
-			*pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, false);
+			*pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes,
+				DC_VALIDATE_MODE_AND_PROGRAMMING);
 			// Populate dppclk to trigger a recalculate in dml_get_voltage_level
 			// so the phantom pipe DLG params can be assigned correctly.
 			pipes[0].clks_cfg.dppclk_mhz = get_dppclk_calculated(&context->bw_ctx.dml, pipes, *pipe_cnt, 0);
@@ -1560,7 +1561,8 @@ static bool dcn32_full_validate_bw_helper(struct dc *dc,
 			dc_state_remove_phantom_streams_and_planes(dc, context);
 			dc_state_release_phantom_streams_and_planes(dc, context);
 			vba->DRAMClockChangeSupport[*vlevel][vba->maxMpcComb] = dm_dram_clock_change_unsupported;
-			*pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, false);
+			*pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes,
+				DC_VALIDATE_MODE_AND_PROGRAMMING);
 
 			*vlevel = dml_get_voltage_level(&context->bw_ctx.dml, pipes, *pipe_cnt);
 			/* This may adjust vlevel and maxMpcComb */
@@ -2138,7 +2140,7 @@ bool dcn32_internal_validate_bw(struct dc *dc,
 				display_e2e_pipe_params_st *pipes,
 				int *pipe_cnt_out,
 				int *vlevel_out,
-				bool fast_validate)
+				enum dc_validate_mode validate_mode)
 {
 	bool out = false;
 	bool repopulate_pipes = false;
@@ -2162,7 +2164,7 @@ bool dcn32_internal_validate_bw(struct dc *dc,
 
 	for (i = 0; i < context->stream_count; i++)
 		resource_update_pipes_for_stream_with_slice_count(context, dc->current_state, dc->res_pool, context->streams[i], 1);
-	pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, fast_validate);
+	pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, validate_mode);
 
 	if (!pipe_cnt) {
 		out = true;
@@ -2172,13 +2174,13 @@ bool dcn32_internal_validate_bw(struct dc *dc,
 	dml_log_pipe_params(&context->bw_ctx.dml, pipes, pipe_cnt);
 	context->bw_ctx.dml.soc.max_vratio_pre = dcn32_determine_max_vratio_prefetch(dc, context);
 
-	if (!fast_validate) {
+	if (validate_mode == DC_VALIDATE_MODE_AND_PROGRAMMING) {
 		if (!dcn32_full_validate_bw_helper(dc, context, pipes, &vlevel, split, merge,
 			&pipe_cnt, &repopulate_pipes))
 			goto validate_fail;
 	}
 
-	if (fast_validate ||
+	if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING ||
 			(dc->debug.dml_disallow_alternate_prefetch_modes &&
 			(vlevel == context->bw_ctx.dml.soc.num_states ||
 				vba->DRAMClockChangeSupport[vlevel][vba->maxMpcComb] == dm_dram_clock_change_unsupported))) {
@@ -2195,7 +2197,7 @@ bool dcn32_internal_validate_bw(struct dc *dc,
 		context->bw_ctx.dml.soc.allow_for_pstate_or_stutter_in_vblank_final =
 			dm_prefetch_support_none;
 
-		context->bw_ctx.dml.validate_max_state = fast_validate;
+		context->bw_ctx.dml.validate_max_state = (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING);
 		vlevel = dml_get_voltage_level(&context->bw_ctx.dml, pipes, pipe_cnt);
 
 		context->bw_ctx.dml.validate_max_state = false;
@@ -2247,7 +2249,7 @@ bool dcn32_internal_validate_bw(struct dc *dc,
 		int flag_vlevel = vlevel;
 		int i;
 
-		pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, fast_validate);
+		pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, validate_mode);
 		if (!dc->config.enable_windowed_mpo_odm)
 			dcn32_update_dml_pipes_odm_policy_based_on_context(dc, context, pipes);
 
@@ -2343,7 +2345,7 @@ void dcn32_calculate_wm_and_dlg_fpu(struct dc *dc, struct dc_state *context,
 		}
 		context->bw_ctx.dml.soc.dram_clock_change_latency_us =
 							dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us;
-		dcn32_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, false);
+		dcn32_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, DC_VALIDATE_MODE_AND_PROGRAMMING);
 		maxMpcComb = context->bw_ctx.dml.vba.maxMpcComb;
 		if (is_subvp_p_drr) {
 			context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][maxMpcComb] = dm_dram_clock_change_vblank_w_mall_sub_vp;
@@ -2389,7 +2391,8 @@ void dcn32_calculate_wm_and_dlg_fpu(struct dc *dc, struct dc_state *context,
 				context->bw_ctx.dml.soc.fclk_change_latency_us =
 						dc->clk_mgr->bw_params->dummy_pstate_table[dummy_latency_index].dummy_pstate_latency_us;
 			}
-			dcn32_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel_temp, false);
+			dcn32_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel_temp,
+				DC_VALIDATE_MODE_AND_PROGRAMMING);
 			if (vlevel_temp < vlevel) {
 				vlevel = vlevel_temp;
 				maxMpcComb = context->bw_ctx.dml.vba.maxMpcComb;
@@ -2410,7 +2413,8 @@ void dcn32_calculate_wm_and_dlg_fpu(struct dc *dc, struct dc_state *context,
 						stream_status->fpo_in_use = false;
 				}
 				context->bw_ctx.dml.soc.fclk_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.fclk_change_latency_us;
-				dcn32_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, false);
+				dcn32_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel,
+					DC_VALIDATE_MODE_AND_PROGRAMMING);
 			}
 		}
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h
index 276e90e4e0ce..273d2bd79d85 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h
@@ -49,7 +49,7 @@ bool dcn32_internal_validate_bw(struct dc *dc,
 				display_e2e_pipe_params_st *pipes,
 				int *pipe_cnt_out,
 				int *vlevel_out,
-				bool fast_validate);
+				enum dc_validate_mode validate_mode);
 
 void dcn32_calculate_wm_and_dlg_fpu(struct dc *dc, struct dc_state *context,
 				display_e2e_pipe_params_st *pipes,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
index 92f0a099d089..5d73efa2f0c9 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
@@ -437,7 +437,7 @@ static unsigned int get_vertical_back_porch(struct dc_crtc_timing *timing)
 int dcn35_populate_dml_pipes_from_context_fpu(struct dc *dc,
 					      struct dc_state *context,
 					      display_e2e_pipe_params_st *pipes,
-					      bool fast_validate)
+					      enum dc_validate_mode validate_mode)
 {
 	int i, pipe_cnt;
 	struct resource_context *res_ctx = &context->res_ctx;
@@ -446,7 +446,7 @@ int dcn35_populate_dml_pipes_from_context_fpu(struct dc *dc,
 	const unsigned int max_allowed_vblank_nom = 1023;
 
 	dcn31_populate_dml_pipes_from_context(dc, context, pipes,
-					      fast_validate);
+					      validate_mode);
 
 	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
 		struct dc_crtc_timing *timing;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.h
index 067480fc3691..d121c5afce71 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.h
@@ -37,7 +37,7 @@ void dcn35_update_bw_bounding_box_fpu(struct dc *dc,
 int dcn35_populate_dml_pipes_from_context_fpu(struct dc *dc,
 					      struct dc_state *context,
 					      display_e2e_pipe_params_st *pipes,
-					      bool fast_validate);
+					      enum dc_validate_mode validate_mode);
 
 void dcn35_decide_zstate_support(struct dc *dc, struct dc_state *context);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
index 17d0b4923b0c..6f516af82956 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
@@ -470,7 +470,7 @@ static unsigned int get_vertical_back_porch(struct dc_crtc_timing *timing)
 int dcn351_populate_dml_pipes_from_context_fpu(struct dc *dc,
 					      struct dc_state *context,
 					      display_e2e_pipe_params_st *pipes,
-					      bool fast_validate)
+					      enum dc_validate_mode validate_mode)
 {
 	int i, pipe_cnt;
 	struct resource_context *res_ctx = &context->res_ctx;
@@ -479,7 +479,7 @@ int dcn351_populate_dml_pipes_from_context_fpu(struct dc *dc,
 	const unsigned int max_allowed_vblank_nom = 1023;
 
 	dcn31_populate_dml_pipes_from_context(dc, context, pipes,
-					      fast_validate);
+					      validate_mode);
 
 	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
 		struct dc_crtc_timing *timing;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.h
index f93efab9a668..f71d9d8d0759 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.h
@@ -12,7 +12,7 @@ void dcn351_update_bw_bounding_box_fpu(struct dc *dc,
 int dcn351_populate_dml_pipes_from_context_fpu(struct dc *dc,
 					      struct dc_state *context,
 					      display_e2e_pipe_params_st *pipes,
-					      bool fast_validate);
+					      enum dc_validate_mode validate_mode);
 
 void dcn351_decide_zstate_support(struct dc *dc, struct dc_state *context);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
index c8e78a8d1539..2127078b73b0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
@@ -326,12 +326,13 @@ static bool dml21_check_mode_support(const struct dc *in_dc, struct dc_state *co
 	return true;
 }
 
-bool dml21_validate(const struct dc *in_dc, struct dc_state *context, struct dml2_context *dml_ctx, bool fast_validate)
+bool dml21_validate(const struct dc *in_dc, struct dc_state *context, struct dml2_context *dml_ctx,
+	enum dc_validate_mode validate_mode)
 {
 	bool out = false;
 
-	/* Use dml_validate_only for fast_validate path */
-	if (fast_validate)
+	/* Use dml21_check_mode_support for DC_VALIDATE_MODE_ONLY and DC_VALIDATE_MODE_AND_STATE_INDEX path */
+	if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING)
 		out = dml21_check_mode_support(in_dc, context, dml_ctx);
 	else
 		out = dml21_mode_check_and_programming(in_dc, context, dml_ctx);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.h
index 42e715024bc9..204ff97d50fa 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.h
@@ -14,6 +14,7 @@ struct dc;
 struct dc_state;
 struct dml2_configuration_options;
 struct dml2_context;
+enum dc_validate_mode;
 
 /**
  * dml2_create - Creates dml21_context.
@@ -39,16 +40,17 @@ void dml21_reinit(const struct dc *in_dc, struct dml2_context **dml_ctx, const s
  * dml21_validate - Determines if a display configuration is supported or not.
  * @in_dc: dc.
  * @context: dc_state to be validated.
- * @fast_validate: Fast validate will not populate context.res_ctx.
+ * @validate_mode: DC_VALIDATE_MODE_ONLY and DC_VALIDATE_MODE_AND_STATE_INDEX
+ *           will not populate context.res_ctx.
  *
  * Based on fast_validate option internally would call:
  *
- * -dml21_mode_check_and_programming - for non fast_validate option
+ * -dml21_mode_check_and_programming - for DC_VALIDATE_MODE_AND_PROGRAMMING option
  * Calculates if dc_state can be supported on the input display
  * configuration. If supported, generates the necessary HW
  * programming for the new dc_state.
  *
- * -dml21_check_mode_support - for fast_validate option
+ * -dml21_check_mode_support - for DC_VALIDATE_MODE_ONLY and DC_VALIDATE_MODE_AND_STATE_INDEX option
  * Calculates if dc_state can be supported for the input display
  * config.
 
@@ -56,7 +58,8 @@ void dml21_reinit(const struct dc *in_dc, struct dml2_context **dml_ctx, const s
  *          separate dc_states for validation.
  * Return: True if mode is supported, false otherwise.
  */
-bool dml21_validate(const struct dc *in_dc, struct dc_state *context, struct dml2_context *dml_ctx, bool fast_validate);
+bool dml21_validate(const struct dc *in_dc, struct dc_state *context, struct dml2_context *dml_ctx,
+	enum dc_validate_mode validate_mode);
 
 /* Prepare hubp mcache_regs for hubp mcache ID and split coordinate programming */
 void dml21_prepare_mcache_programming(struct dc *in_dc, struct dc_state *context, struct dml2_context *dml_ctx);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
index 6b3b8803e0ae..a56e75cdf712 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
@@ -868,7 +868,7 @@ bool dml2_svp_remove_all_phantom_pipes(struct dml2_context *ctx, struct dc_state
 
 /* Conditions for setting up phantom pipes for SubVP:
  * 1. Not force disable SubVP
- * 2. Full update (i.e. !fast_validate)
+ * 2. Full update (i.e. DC_VALIDATE_MODE_AND_PROGRAMMING)
  * 3. Enough pipes are available to support SubVP (TODO: Which pipes will use VACTIVE / VBLANK / SUBVP?)
  * 4. Display configuration passes validation
  * 5. (Config doesn't support MCLK in VACTIVE/VBLANK || dc->debug.force_subvp_mclk_switch)
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
index a90aeecd3b50..b8c0ece7bb22 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
@@ -721,7 +721,8 @@ static void dml2_apply_debug_options(const struct dc *dc, struct dml2_context *d
 	}
 }
 
-bool dml2_validate(const struct dc *in_dc, struct dc_state *context, struct dml2_context *dml2, bool fast_validate)
+bool dml2_validate(const struct dc *in_dc, struct dc_state *context, struct dml2_context *dml2,
+	enum dc_validate_mode validate_mode)
 {
 	bool out = false;
 
@@ -731,14 +732,14 @@ bool dml2_validate(const struct dc *in_dc, struct dc_state *context, struct dml2
 
 	/* DML2.1 validation path */
 	if (dml2->architecture == dml2_architecture_21) {
-		out = dml21_validate(in_dc, context, dml2, fast_validate);
+		out = dml21_validate(in_dc, context, dml2, validate_mode);
 		return out;
 	}
 
 	DC_FP_START();
 
-	/* Use dml_validate_only for fast_validate path */
-	if (fast_validate)
+	/* Use dml_validate_only for DC_VALIDATE_MODE_ONLY and DC_VALIDATE_MODE_AND_STATE_INDEX path */
+	if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING)
 		out = dml2_validate_only(context);
 	else
 		out = dml2_validate_and_build_resource(in_dc, context);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
index 5100f269368e..ff52301bcfc0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
@@ -272,7 +272,7 @@ void dml2_reinit(const struct dc *in_dc,
  * dml2_validate - Determines if a display configuration is supported or not.
  * @in_dc: dc.
  * @context: dc_state to be validated.
- * @fast_validate: Fast validate will not populate context.res_ctx.
+ * @validate_mode: DC_VALIDATE_MODE_ONLY and DC_VALIDATE_MODE_AND_STATE_INDEX will not populate context.res_ctx.
  *
  * DML1.0 compatible interface for validation.
  *
@@ -295,7 +295,7 @@ void dml2_reinit(const struct dc *in_dc,
 bool dml2_validate(const struct dc *in_dc,
 				   struct dc_state *context,
 				   struct dml2_context *dml2,
-				   bool fast_validate);
+				   enum dc_validate_mode validate_mode);
 
 /*
  * dml2_extract_dram_and_fclk_change_support - Extracts the FCLK and UCLK change support info.
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 9f082a4c2610..e7c353f839a6 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -2484,7 +2484,7 @@ bool dcn20_update_bandwidth(
 	struct dce_hwseq *hws = dc->hwseq;
 
 	/* recalculate DML parameters */
-	if (dc->res_pool->funcs->validate_bandwidth(dc, context, false) != DC_OK)
+	if (dc->res_pool->funcs->validate_bandwidth(dc, context, DC_VALIDATE_MODE_AND_PROGRAMMING) != DC_OK)
 		return false;
 
 	/* apply updated bandwidth parameters */
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index 82b13cc7a262..680a25189b8c 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -2385,7 +2385,7 @@ bool dcn401_update_bandwidth(
 	struct dce_hwseq *hws = dc->hwseq;
 
 	/* recalculate DML parameters */
-	if (dc->res_pool->funcs->validate_bandwidth(dc, context, false) != DC_OK)
+	if (dc->res_pool->funcs->validate_bandwidth(dc, context, DC_VALIDATE_MODE_AND_PROGRAMMING) != DC_OK)
 		return false;
 
 	/* apply updated bandwidth parameters */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index 56b0b3f59efc..e88a016fb7a9 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -82,7 +82,7 @@ struct resource_funcs {
 	enum dc_status (*validate_bandwidth)(
 					struct dc *dc,
 					struct dc_state *context,
-					bool fast_validate);
+					enum dc_validate_mode validate_mode);
 	void (*calculate_wm_and_dlg)(
 				struct dc *dc, struct dc_state *context,
 				display_e2e_pipe_params_st *pipes,
@@ -107,7 +107,7 @@ struct resource_funcs {
 		struct dc *dc,
 		struct dc_state *context,
 		display_e2e_pipe_params_st *pipes,
-		bool fast_validate);
+		enum dc_validate_mode validate_mode);
 
 	/*
 	 * Algorithm for assigning available link encoders to links.
diff --git a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h b/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
index d19a595c2be4..134091d5842d 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
@@ -622,7 +622,7 @@ extern const struct dcn_ip_params dcn10_ip_defaults;
 bool dcn_validate_bandwidth(
 		struct dc *dc,
 		struct dc_state *context,
-		bool fast_validate);
+		enum dc_validate_mode validate_mode);
 
 void dcn_get_soc_clks(
 		struct dc *dc,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
index 84f73fdb0f95..3a51be63f020 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
@@ -839,7 +839,7 @@ static enum dc_status build_mapped_resource(
 static enum dc_status dce100_validate_bandwidth(
 	struct dc  *dc,
 	struct dc_state *context,
-	bool fast_validate)
+	enum dc_validate_mode validate_mode)
 {
 	int i;
 	bool at_least_one_pipe = false;
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce110/dce110_resource.c
index f3d5baac11bf..cccde5a6f3cd 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce110/dce110_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce110/dce110_resource.c
@@ -963,7 +963,7 @@ static enum dc_status build_mapped_resource(
 static enum dc_status dce110_validate_bandwidth(
 	struct dc *dc,
 	struct dc_state *context,
-	bool fast_validate)
+	enum dc_validate_mode validate_mode)
 {
 	bool result = false;
 
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c
index 4225cae68c10..164ba796f64c 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c
@@ -886,7 +886,7 @@ static enum dc_status build_mapped_resource(
 enum dc_status dce112_validate_bandwidth(
 	struct dc *dc,
 	struct dc_state *context,
-	bool fast_validate)
+	enum dc_validate_mode validate_mode)
 {
 	bool result = false;
 
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.h
index 6221d749246d..3efc4c55d2d2 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.h
@@ -45,7 +45,7 @@ enum dc_status dce112_validate_with_context(
 enum dc_status dce112_validate_bandwidth(
 	struct dc *dc,
 	struct dc_state *context,
-	bool fast_validate);
+	enum dc_validate_mode validate_mode);
 
 enum dc_status dce112_add_stream_to_ctx(
 		struct dc *dc,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce60/dce60_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce60/dce60_resource.c
index d9ffdded5ce1..58b59d52dc9d 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce60/dce60_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce60/dce60_resource.c
@@ -866,7 +866,7 @@ static void dce60_resource_destruct(struct dce110_resource_pool *pool)
 static enum dc_status dce60_validate_bandwidth(
 	struct dc *dc,
 	struct dc_state *context,
-	bool fast_validate)
+	enum dc_validate_mode validate_mode)
 {
 	int i;
 	bool at_least_one_pipe = false;
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c
index bd5811f97531..3e8b0ac11d90 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c
@@ -872,7 +872,7 @@ static void dce80_resource_destruct(struct dce110_resource_pool *pool)
 static enum dc_status dce80_validate_bandwidth(
 	struct dc *dc,
 	struct dc_state *context,
-	bool fast_validate)
+	enum dc_validate_mode validate_mode)
 {
 	int i;
 	bool at_least_one_pipe = false;
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
index be4ade0853e9..652c05c35494 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
@@ -1129,12 +1129,12 @@ static void dcn10_destroy_resource_pool(struct resource_pool **pool)
 static enum dc_status dcn10_validate_bandwidth(
 		struct dc *dc,
 		struct dc_state *context,
-		bool fast_validate)
+		enum dc_validate_mode validate_mode)
 {
 	bool voltage_supported;
 
 	DC_FP_START();
-	voltage_supported = dcn_validate_bandwidth(dc, context, fast_validate);
+	voltage_supported = dcn_validate_bandwidth(dc, context, validate_mode);
 	DC_FP_END();
 
 	return voltage_supported ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
index 3405be07f5e3..067a93420a23 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
@@ -2007,7 +2007,7 @@ bool dcn20_fast_validate_bw(
 		int *pipe_cnt_out,
 		int *pipe_split_from,
 		int *vlevel_out,
-		bool fast_validate)
+		enum dc_validate_mode validate_mode)
 {
 	bool out = false;
 	int split[MAX_PIPES] = { 0 };
@@ -2021,7 +2021,7 @@ bool dcn20_fast_validate_bw(
 	dcn20_merge_pipes_for_validate(dc, context);
 
 	DC_FP_START();
-	pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, fast_validate);
+	pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, validate_mode);
 	DC_FP_END();
 
 	*pipe_cnt_out = pipe_cnt;
@@ -2125,7 +2125,7 @@ bool dcn20_fast_validate_bw(
 }
 
 enum dc_status dcn20_validate_bandwidth(struct dc *dc, struct dc_state *context,
-		bool fast_validate)
+		enum dc_validate_mode validate_mode)
 {
 	bool voltage_supported;
 	display_e2e_pipe_params_st *pipes;
@@ -2135,7 +2135,7 @@ enum dc_status dcn20_validate_bandwidth(struct dc *dc, struct dc_state *context,
 		return DC_FAIL_BANDWIDTH_VALIDATE;
 
 	DC_FP_START();
-	voltage_supported = dcn20_validate_bandwidth_fp(dc, context, fast_validate, pipes);
+	voltage_supported = dcn20_validate_bandwidth_fp(dc, context, validate_mode, pipes);
 	DC_FP_END();
 
 	kfree(pipes);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.h
index c0e062c7407d..e997d35a8b86 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.h
@@ -119,7 +119,7 @@ void dcn20_set_mcif_arb_params(
 		struct dc_state *context,
 		display_e2e_pipe_params_st *pipes,
 		int pipe_cnt);
-enum dc_status dcn20_validate_bandwidth(struct dc *dc, struct dc_state *context, bool fast_validate);
+enum dc_status dcn20_validate_bandwidth(struct dc *dc, struct dc_state *context, enum dc_validate_mode validate_mode);
 void dcn20_merge_pipes_for_validate(
 		struct dc *dc,
 		struct dc_state *context);
@@ -158,7 +158,7 @@ bool dcn20_fast_validate_bw(
 		int *pipe_cnt_out,
 		int *pipe_split_from,
 		int *vlevel_out,
-		bool fast_validate);
+		enum dc_validate_mode validate_mode);
 
 enum dc_status dcn20_build_mapped_resource(const struct dc *dc, struct dc_state *context, struct dc_stream_state *stream);
 enum dc_status dcn20_add_stream_to_ctx(struct dc *dc, struct dc_state *new_ctx, struct dc_stream_state *dc_stream);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
index 9ab01b65b177..238d7f8beb7c 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
@@ -769,7 +769,7 @@ bool dcn21_fast_validate_bw(struct dc *dc,
 			    int *pipe_cnt_out,
 			    int *pipe_split_from,
 			    int *vlevel_out,
-			    bool fast_validate)
+			    enum dc_validate_mode validate_mode)
 {
 	bool out = false;
 	int split[MAX_PIPES] = { 0 };
@@ -783,7 +783,7 @@ bool dcn21_fast_validate_bw(struct dc *dc,
 	dcn20_merge_pipes_for_validate(dc, context);
 
 	DC_FP_START();
-	pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, fast_validate);
+	pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, validate_mode);
 	DC_FP_END();
 
 	*pipe_cnt_out = pipe_cnt;
@@ -924,7 +924,7 @@ bool dcn21_fast_validate_bw(struct dc *dc,
  * dcn20_validate_bandwidth in dcn20_resource.c.
  */
 static enum dc_status dcn21_validate_bandwidth(struct dc *dc, struct dc_state *context,
-		bool fast_validate)
+		enum dc_validate_mode validate_mode)
 {
 	bool voltage_supported;
 	display_e2e_pipe_params_st *pipes;
@@ -934,7 +934,7 @@ static enum dc_status dcn21_validate_bandwidth(struct dc *dc, struct dc_state *c
 		return DC_FAIL_BANDWIDTH_VALIDATE;
 
 	DC_FP_START();
-	voltage_supported = dcn21_validate_bandwidth_fp(dc, context, fast_validate, pipes);
+	voltage_supported = dcn21_validate_bandwidth_fp(dc, context, validate_mode, pipes);
 	DC_FP_END();
 
 	kfree(pipes);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.h
index f7ecc002c2f7..a017fd9854d1 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.h
@@ -51,6 +51,6 @@ bool dcn21_fast_validate_bw(
 		int *pipe_cnt_out,
 		int *pipe_split_from,
 		int *vlevel_out,
-		bool fast_validate);
+		enum dc_validate_mode validate_mode);
 
 #endif /* _DCN21_RESOURCE_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
index f631ae34e320..4d4635e01eb6 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
@@ -1319,13 +1319,13 @@ static struct clock_source *dcn30_clock_source_create(
 int dcn30_populate_dml_pipes_from_context(
 	struct dc *dc, struct dc_state *context,
 	display_e2e_pipe_params_st *pipes,
-	bool fast_validate)
+	enum dc_validate_mode validate_mode)
 {
 	int i, pipe_cnt;
 	struct resource_context *res_ctx = &context->res_ctx;
 
 	DC_FP_START();
-	dcn20_populate_dml_pipes_from_context(dc, context, pipes, fast_validate);
+	dcn20_populate_dml_pipes_from_context(dc, context, pipes, validate_mode);
 	DC_FP_END();
 
 	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
@@ -1627,7 +1627,7 @@ noinline bool dcn30_internal_validate_bw(
 		display_e2e_pipe_params_st *pipes,
 		int *pipe_cnt_out,
 		int *vlevel_out,
-		bool fast_validate,
+		enum dc_validate_mode validate_mode,
 		bool allow_self_refresh_only)
 {
 	bool out = false;
@@ -1646,7 +1646,7 @@ noinline bool dcn30_internal_validate_bw(
 	context->bw_ctx.dml.vba.VoltageLevel = 0;
 	context->bw_ctx.dml.vba.DRAMClockChangeSupport[0][0] = dm_dram_clock_change_vactive;
 	dc->res_pool->funcs->update_soc_for_wm_a(dc, context);
-	pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, fast_validate);
+	pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, validate_mode);
 
 	if (!pipe_cnt) {
 		out = true;
@@ -1655,7 +1655,7 @@ noinline bool dcn30_internal_validate_bw(
 
 	dml_log_pipe_params(&context->bw_ctx.dml, pipes, pipe_cnt);
 
-	if (!fast_validate || !allow_self_refresh_only) {
+	if (validate_mode == DC_VALIDATE_MODE_AND_PROGRAMMING || !allow_self_refresh_only) {
 		/*
 		 * DML favors voltage over p-state, but we're more interested in
 		 * supporting p-state over voltage. We can't support p-state in
@@ -1669,7 +1669,7 @@ noinline bool dcn30_internal_validate_bw(
 			vlevel = dcn20_validate_apply_pipe_split_flags(dc, context, vlevel, split, merge);
 	}
 	if (allow_self_refresh_only &&
-	    (fast_validate || vlevel == context->bw_ctx.dml.soc.num_states ||
+	    (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING || vlevel == context->bw_ctx.dml.soc.num_states ||
 			vba->DRAMClockChangeSupport[vlevel][vba->maxMpcComb] == dm_dram_clock_change_unsupported)) {
 		/*
 		 * If mode is unsupported or there's still no p-state support
@@ -1678,7 +1678,7 @@ noinline bool dcn30_internal_validate_bw(
 		 * We don't actually support prefetch mode 2, so require that we
 		 * at least support prefetch mode 1.
 		 */
-		context->bw_ctx.dml.validate_max_state = fast_validate;
+		context->bw_ctx.dml.validate_max_state = (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING);
 		context->bw_ctx.dml.soc.allow_dram_self_refresh_or_dram_clock_change_in_vblank =
 			dm_allow_self_refresh;
 
@@ -1865,7 +1865,7 @@ noinline bool dcn30_internal_validate_bw(
 	}
 
 	if (repopulate_pipes)
-		pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, fast_validate);
+		pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, validate_mode);
 	context->bw_ctx.dml.vba.VoltageLevel = vlevel;
 	*vlevel_out = vlevel;
 	*pipe_cnt_out = pipe_cnt;
@@ -2037,7 +2037,7 @@ void dcn30_calculate_wm_and_dlg(
 
 enum dc_status dcn30_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
-		bool fast_validate)
+		enum dc_validate_mode validate_mode)
 {
 	bool out = false;
 
@@ -2055,7 +2055,7 @@ enum dc_status dcn30_validate_bandwidth(struct dc *dc,
 		goto validate_fail;
 
 	DC_FP_START();
-	out = dcn30_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, fast_validate, true);
+	out = dcn30_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, validate_mode, true);
 	DC_FP_END();
 
 	if (pipe_cnt == 0)
@@ -2066,7 +2066,7 @@ enum dc_status dcn30_validate_bandwidth(struct dc *dc,
 
 	BW_VAL_TRACE_END_VOLTAGE_LEVEL();
 
-	if (fast_validate) {
+	if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING) {
 		BW_VAL_TRACE_SKIP(fast);
 		goto validate_out;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.h
index 689d9bdace81..2c967fe55712 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.h
@@ -57,14 +57,14 @@ unsigned int dcn30_calc_max_scaled_time(
 		unsigned int urgent_watermark);
 
 enum dc_status dcn30_validate_bandwidth(struct dc *dc, struct dc_state *context,
-		bool fast_validate);
+		enum dc_validate_mode validate_mode);
 bool dcn30_internal_validate_bw(
 		struct dc *dc,
 		struct dc_state *context,
 		display_e2e_pipe_params_st *pipes,
 		int *pipe_cnt_out,
 		int *vlevel_out,
-		bool fast_validate,
+		enum dc_validate_mode validate_mode,
 		bool allow_self_refresh_only);
 void dcn30_calculate_wm_and_dlg(
 		struct dc *dc, struct dc_state *context,
@@ -78,7 +78,7 @@ void dcn30_populate_dml_writeback_from_context(
 int dcn30_populate_dml_pipes_from_context(
 	struct dc *dc, struct dc_state *context,
 	display_e2e_pipe_params_st *pipes,
-	bool fast_validate);
+	enum dc_validate_mode validate_mode);
 
 bool dcn30_acquire_post_bldn_3dlut(
 		struct resource_context *res_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
index 7e0af5297dc4..6b6efc2e75c0 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
@@ -1616,14 +1616,14 @@ static bool is_dual_plane(enum surface_pixel_format format)
 int dcn31x_populate_dml_pipes_from_context(struct dc *dc,
 					  struct dc_state *context,
 					  display_e2e_pipe_params_st *pipes,
-					  bool fast_validate)
+					  enum dc_validate_mode validate_mode)
 {
 	uint32_t pipe_cnt;
 	int i;
 
 	dc_assert_fp_enabled();
 
-	pipe_cnt = dcn20_populate_dml_pipes_from_context(dc, context, pipes, fast_validate);
+	pipe_cnt = dcn20_populate_dml_pipes_from_context(dc, context, pipes, validate_mode);
 
 	for (i = 0; i < pipe_cnt; i++) {
 		pipes[i].pipe.src.gpuvm = 1;
@@ -1641,7 +1641,7 @@ int dcn31x_populate_dml_pipes_from_context(struct dc *dc,
 int dcn31_populate_dml_pipes_from_context(
 	struct dc *dc, struct dc_state *context,
 	display_e2e_pipe_params_st *pipes,
-	bool fast_validate)
+	enum dc_validate_mode validate_mode)
 {
 	int i, pipe_cnt;
 	struct resource_context *res_ctx = &context->res_ctx;
@@ -1649,7 +1649,7 @@ int dcn31_populate_dml_pipes_from_context(
 	bool upscaled = false;
 
 	DC_FP_START();
-	dcn31x_populate_dml_pipes_from_context(dc, context, pipes, fast_validate);
+	dcn31x_populate_dml_pipes_from_context(dc, context, pipes, validate_mode);
 	DC_FP_END();
 
 	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
@@ -1760,7 +1760,7 @@ dcn31_set_mcif_arb_params(struct dc *dc,
 
 enum dc_status dcn31_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
-		bool fast_validate)
+		enum dc_validate_mode validate_mode)
 {
 	bool out = false;
 
@@ -1778,19 +1778,19 @@ enum dc_status dcn31_validate_bandwidth(struct dc *dc,
 		goto validate_fail;
 
 	DC_FP_START();
-	out = dcn30_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, fast_validate, true);
+	out = dcn30_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, validate_mode, true);
 	DC_FP_END();
 
-	// Disable fast_validate to set min dcfclk in calculate_wm_and_dlg
+	// Disable DC_VALIDATE_MODE_ONLY and DC_VALIDATE_MODE_AND_STATE_INDEX to set min dcfclk in calculate_wm_and_dlg
 	if (pipe_cnt == 0)
-		fast_validate = false;
+		validate_mode = DC_VALIDATE_MODE_AND_PROGRAMMING;
 
 	if (!out)
 		goto validate_fail;
 
 	BW_VAL_TRACE_END_VOLTAGE_LEVEL();
 
-	if (fast_validate) {
+	if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING) {
 		BW_VAL_TRACE_SKIP(fast);
 		goto validate_out;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.h
index dd82815d7efe..1456bcf01ad2 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.h
@@ -39,7 +39,7 @@ struct dcn31_resource_pool {
 
 enum dc_status dcn31_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
-		bool fast_validate);
+		enum dc_validate_mode validate_mode);
 void dcn31_calculate_wm_and_dlg(
 		struct dc *dc, struct dc_state *context,
 		display_e2e_pipe_params_st *pipes,
@@ -48,7 +48,7 @@ void dcn31_calculate_wm_and_dlg(
 int dcn31_populate_dml_pipes_from_context(
 	struct dc *dc, struct dc_state *context,
 	display_e2e_pipe_params_st *pipes,
-	bool fast_validate);
+	enum dc_validate_mode validate_mode);
 void
 dcn31_populate_dml_writeback_from_context(struct dc *dc,
 					  struct resource_context *res_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
index d96bc6cb73ad..e84526c51590 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
@@ -1667,12 +1667,12 @@ static struct clock_source *dcn31_clock_source_create(
 static int dcn314_populate_dml_pipes_from_context(
 	struct dc *dc, struct dc_state *context,
 	display_e2e_pipe_params_st *pipes,
-	bool fast_validate)
+	enum dc_validate_mode validate_mode)
 {
 	int pipe_cnt;
 
 	DC_FP_START();
-	pipe_cnt = dcn314_populate_dml_pipes_from_context_fpu(dc, context, pipes, fast_validate);
+	pipe_cnt = dcn314_populate_dml_pipes_from_context_fpu(dc, context, pipes, validate_mode);
 	DC_FP_END();
 
 	return pipe_cnt;
@@ -1696,7 +1696,7 @@ static void dcn314_get_panel_config_defaults(struct dc_panel_config *panel_confi
 
 enum dc_status dcn314_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
-		bool fast_validate)
+		enum dc_validate_mode validate_mode)
 {
 	bool out = false;
 
@@ -1715,19 +1715,19 @@ enum dc_status dcn314_validate_bandwidth(struct dc *dc,
 
 	DC_FP_START();
 	// do not support self refresh only
-	out = dcn30_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, fast_validate, false);
+	out = dcn30_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, validate_mode, false);
 	DC_FP_END();
 
-	// Disable fast_validate to set min dcfclk in calculate_wm_and_dlg
+	// Disable DC_VALIDATE_MODE_ONLY and DC_VALIDATE_MODE_AND_STATE_INDEX to set min dcfclk in calculate_wm_and_dlg
 	if (pipe_cnt == 0)
-		fast_validate = false;
+		validate_mode = DC_VALIDATE_MODE_AND_PROGRAMMING;
 
 	if (!out)
 		goto validate_fail;
 
 	BW_VAL_TRACE_END_VOLTAGE_LEVEL();
 
-	if (fast_validate) {
+	if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING) {
 		BW_VAL_TRACE_SKIP(fast);
 		goto validate_out;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.h
index f8ba531d6342..ac9bb7f097d5 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.h
@@ -41,7 +41,7 @@ struct dcn314_resource_pool {
 
 enum dc_status dcn314_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
-		bool fast_validate);
+		enum dc_validate_mode validate_mode);
 
 struct resource_pool *dcn314_create_resource_pool(
 		const struct dc_init_data *init_data,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
index 6c2bb3f63be1..ac15c7c33abf 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
@@ -1664,7 +1664,7 @@ static bool allow_pixel_rate_crb(struct dc *dc, struct dc_state *context)
 static int dcn315_populate_dml_pipes_from_context(
 	struct dc *dc, struct dc_state *context,
 	display_e2e_pipe_params_st *pipes,
-	bool fast_validate)
+	enum dc_validate_mode validate_mode)
 {
 	int i, pipe_cnt, crb_idx, crb_pipes;
 	struct resource_context *res_ctx = &context->res_ctx;
@@ -1674,7 +1674,7 @@ static int dcn315_populate_dml_pipes_from_context(
 	bool pixel_rate_crb = allow_pixel_rate_crb(dc, context);
 
 	DC_FP_START();
-	dcn31x_populate_dml_pipes_from_context(dc, context, pipes, fast_validate);
+	dcn31x_populate_dml_pipes_from_context(dc, context, pipes, validate_mode);
 	DC_FP_END();
 
 	for (i = 0, pipe_cnt = 0, crb_pipes = 0; i < dc->res_pool->pipe_count; i++) {
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
index 568094827212..2b7e61622579 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
@@ -1610,7 +1610,7 @@ static bool is_dual_plane(enum surface_pixel_format format)
 static int dcn316_populate_dml_pipes_from_context(
 	struct dc *dc, struct dc_state *context,
 	display_e2e_pipe_params_st *pipes,
-	bool fast_validate)
+	enum dc_validate_mode validate_mode)
 {
 	int i, pipe_cnt;
 	struct resource_context *res_ctx = &context->res_ctx;
@@ -1618,7 +1618,7 @@ static int dcn316_populate_dml_pipes_from_context(
 	const int max_usable_det = context->bw_ctx.dml.ip.config_return_buffer_size_in_kbytes - DCN3_16_MIN_COMPBUF_SIZE_KB;
 
 	DC_FP_START();
-	dcn31x_populate_dml_pipes_from_context(dc, context, pipes, fast_validate);
+	dcn31x_populate_dml_pipes_from_context(dc, context, pipes, validate_mode);
 	DC_FP_END();
 
 	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index bb0dae0be5b8..a7a78a2752de 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1742,7 +1742,7 @@ void dcn32_add_phantom_pipes(struct dc *dc, struct dc_state *context,
 	}
 }
 
-static bool dml1_validate(struct dc *dc, struct dc_state *context, bool fast_validate)
+static bool dml1_validate(struct dc *dc, struct dc_state *context, enum dc_validate_mode validate_mode)
 {
 	bool out = false;
 
@@ -1767,7 +1767,7 @@ static bool dml1_validate(struct dc *dc, struct dc_state *context, bool fast_val
 		goto validate_fail;
 
 	DC_FP_START();
-	out = dcn32_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, fast_validate);
+	out = dcn32_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, validate_mode);
 	DC_FP_END();
 
 	if (pipe_cnt == 0)
@@ -1778,7 +1778,7 @@ static bool dml1_validate(struct dc *dc, struct dc_state *context, bool fast_val
 
 	BW_VAL_TRACE_END_VOLTAGE_LEVEL();
 
-	if (fast_validate) {
+	if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING) {
 		BW_VAL_TRACE_SKIP(fast);
 		goto validate_out;
 	}
@@ -1809,7 +1809,7 @@ static bool dml1_validate(struct dc *dc, struct dc_state *context, bool fast_val
 
 enum dc_status dcn32_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
-		bool fast_validate)
+		enum dc_validate_mode validate_mode)
 {
 	unsigned int i;
 	enum dc_status status;
@@ -1827,11 +1827,11 @@ enum dc_status dcn32_validate_bandwidth(struct dc *dc,
 	if (dc->debug.using_dml2)
 		status = dml2_validate(dc, context,
 				context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
-				fast_validate) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+				validate_mode) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
 	else
-		status = dml1_validate(dc, context, fast_validate) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+		status = dml1_validate(dc, context, validate_mode) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
 
-	if (!fast_validate && status == DC_OK && dc_state_is_subvp_in_use(context)) {
+	if (validate_mode == DC_VALIDATE_MODE_AND_PROGRAMMING && status == DC_OK && dc_state_is_subvp_in_use(context)) {
 		/* check new stream configuration still supports cursor if subvp used */
 		for (i = 0; i < context->stream_count; i++) {
 			stream = context->streams[i];
@@ -1846,14 +1846,14 @@ enum dc_status dcn32_validate_bandwidth(struct dc *dc,
 		};
 	}
 
-	if (!fast_validate && status == DC_FAIL_HW_CURSOR_SUPPORT) {
+	if (validate_mode == DC_VALIDATE_MODE_AND_PROGRAMMING && status == DC_FAIL_HW_CURSOR_SUPPORT) {
 		/* attempt to validate again with subvp disabled due to cursor */
 		if (dc->debug.using_dml2)
 			status = dml2_validate(dc, context,
 					context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
-					fast_validate) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+					validate_mode) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
 		else
-			status = dml1_validate(dc, context, fast_validate) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+			status = dml1_validate(dc, context, validate_mode) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
 	}
 
 	return status;
@@ -1862,7 +1862,7 @@ enum dc_status dcn32_validate_bandwidth(struct dc *dc,
 int dcn32_populate_dml_pipes_from_context(
 	struct dc *dc, struct dc_state *context,
 	display_e2e_pipe_params_st *pipes,
-	bool fast_validate)
+	enum dc_validate_mode validate_mode)
 {
 	int i, pipe_cnt;
 	struct resource_context *res_ctx = &context->res_ctx;
@@ -1878,7 +1878,7 @@ int dcn32_populate_dml_pipes_from_context(
 	int num_subvp_none = 0;
 	int odm_slice_count;
 
-	dcn20_populate_dml_pipes_from_context(dc, context, pipes, fast_validate);
+	dcn20_populate_dml_pipes_from_context(dc, context, pipes, validate_mode);
 
 	/* For single display subvp, look for subvp main so if we have phantom
 	 *  pipe, we can set odm policy to match main pipe
@@ -1960,7 +1960,7 @@ int dcn32_populate_dml_pipes_from_context(
 		/* Only populate DML input with subvp info for full updates.
 		 * This is just a workaround -- needs a proper fix.
 		 */
-		if (!fast_validate) {
+		if (validate_mode == DC_VALIDATE_MODE_AND_PROGRAMMING) {
 			switch (dc_state_get_pipe_subvp_type(context, pipe)) {
 			case SUBVP_MAIN:
 				pipes[pipe_cnt].pipe.src.use_mall_for_pstate_change = dm_use_mall_pstate_change_sub_viewport;
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
index d60ed77eda80..82f966cf4ed2 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
@@ -100,12 +100,12 @@ void dcn32_add_phantom_pipes(struct dc *dc,
 
 enum dc_status dcn32_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
-		bool fast_validate);
+		enum dc_validate_mode validate_mode);
 
 int dcn32_populate_dml_pipes_from_context(
 	struct dc *dc, struct dc_state *context,
 	display_e2e_pipe_params_st *pipes,
-	bool fast_validate);
+	enum dc_validate_mode validate_mode);
 
 void dcn32_calculate_wm_and_dlg(
 		struct dc *dc, struct dc_state *context,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index 72c6cf047db0..62f6c7abb9c6 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -1734,15 +1734,15 @@ static void dcn35_get_panel_config_defaults(struct dc_panel_config *panel_config
 
 static enum dc_status dcn35_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
-		bool fast_validate)
+		enum dc_validate_mode validate_mode)
 {
 	bool out = false;
 
 	out = dml2_validate(dc, context,
 			context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
-			fast_validate);
+			validate_mode);
 
-	if (fast_validate)
+	if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING)
 		return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
 
 	DC_FP_START();
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
index 989a270f7dea..85a96258bce8 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
@@ -1714,15 +1714,15 @@ static void dcn35_get_panel_config_defaults(struct dc_panel_config *panel_config
 
 static enum dc_status dcn351_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
-		bool fast_validate)
+		enum dc_validate_mode validate_mode)
 {
 	bool out = false;
 
 	out = dml2_validate(dc, context,
 			context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
-			fast_validate);
+			validate_mode);
 
-	if (fast_validate)
+	if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING)
 		return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
 
 	DC_FP_START();
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
index 48e1f234185f..e977866802bf 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
@@ -1715,15 +1715,15 @@ static void dcn35_get_panel_config_defaults(struct dc_panel_config *panel_config
 
 static enum dc_status dcn35_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
-		bool fast_validate)
+		enum dc_validate_mode validate_mode)
 {
 	bool out = false;
 
 	out = dml2_validate(dc, context,
 			context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
-			fast_validate);
+			validate_mode);
 
-	if (fast_validate)
+	if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING)
 		return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
 
 	DC_FP_START();
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index fbb6db1baaad..1dce22b81c97 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -1644,7 +1644,7 @@ enum dc_status dcn401_patch_unknown_plane_state(struct dc_plane_state *plane_sta
 
 enum dc_status dcn401_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
-		bool fast_validate)
+		enum dc_validate_mode validate_mode)
 {
 	unsigned int i;
 	enum dc_status status = DC_OK;
@@ -1662,9 +1662,9 @@ enum dc_status dcn401_validate_bandwidth(struct dc *dc,
 	if (dc->debug.using_dml2)
 		status = dml2_validate(dc, context,
 				context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
-				fast_validate) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+				validate_mode) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
 
-	if (!fast_validate && status == DC_OK && dc_state_is_subvp_in_use(context)) {
+	if (validate_mode == DC_VALIDATE_MODE_AND_PROGRAMMING && status == DC_OK && dc_state_is_subvp_in_use(context)) {
 		/* check new stream configuration still supports cursor if subvp used */
 		for (i = 0; i < context->stream_count; i++) {
 			stream = context->streams[i];
@@ -1679,12 +1679,12 @@ enum dc_status dcn401_validate_bandwidth(struct dc *dc,
 		};
 	}
 
-	if (!fast_validate && status == DC_FAIL_HW_CURSOR_SUPPORT) {
+	if (validate_mode == DC_VALIDATE_MODE_AND_PROGRAMMING && status == DC_FAIL_HW_CURSOR_SUPPORT) {
 		/* attempt to validate again with subvp disabled due to cursor */
 		if (dc->debug.using_dml2)
 			status = dml2_validate(dc, context,
 					context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
-					fast_validate) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
+					validate_mode) ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
 	}
 
 	return status;
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h
index dc52a30991af..2ae6831c31ef 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h
@@ -24,7 +24,7 @@ enum dc_status dcn401_patch_unknown_plane_state(struct dc_plane_state *plane_sta
 
 enum dc_status dcn401_validate_bandwidth(struct dc *dc,
 		struct dc_state *context,
-		bool fast_validate);
+		enum dc_validate_mode validate_mode);
 
 void dcn401_prepare_mcache_programming(struct dc *dc, struct dc_state *context);
 
-- 
2.43.0

