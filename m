Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE849B166B0
	for <lists+amd-gfx@lfdr.de>; Wed, 30 Jul 2025 21:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FB910E45E;
	Wed, 30 Jul 2025 19:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ylIZ0iBN";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA2510E45D
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Jul 2025 19:00:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5NNvYtQ769rhAQEbNQS90qXsiuVECrWoeTFC82xmEm+NWlvc5V24Inw1y7Ne8j7QzGCPVERyldNgCkLR0l7DMdliIKLX1oKqPHe37bEeebqj8RvbJAbbSMAyKtpycqT66mL/GJiXdasN6OOpIgHVHfh7/ogs4e7GTTMu7GpLsVE29DwiImWGKWRsoXI9u/XNTeoMlQ2lrj+NPXJv53Quy7o8mLj8lU2ph+JSpShAiyO5NLP6v9qykAusXyYQ0hRWpTTJIPWDFsQnsYLp4HKEGi07Iqr0y+Q/LT75X03PIW7svkTgl6AjMvq7b9bxtD4R7F85poXtdh9Q0c+SwfrSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDJ7oUSjNOBiHdtyykm6ASUMb4a5VIWgUwvbWaFmRSo=;
 b=LOTe0F/gVlAcbestdTdf95GRfceBOtmj9nAXcXcn3v0k4SPeZxV1yfgUaEjiUuI2UbwDzIInfAPftlrVdAxrPvlCtbHpAaS/QzcC5rbY0nvbh7NfhOMTFzmus56xItKF3TrLc9VgUdHyEjlX+CA8nkLR0z08dwtqPk5CysNQGhA6L2+i7WAtn4/ZPBslmd33dJixqwaFyIPBRyfqPoSUhySSIff9sHnNq1R6RWXlINeYlqdH5oofMQXLI172ltjzalC5ieWg9sHU1yac0SiF6DuN7Xc+ne/BJZsdl0W55IAiRFr+8J96a1iVa3XV2c4rTpOT/Psp9a1o7mHxCLQ+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDJ7oUSjNOBiHdtyykm6ASUMb4a5VIWgUwvbWaFmRSo=;
 b=ylIZ0iBN8ZAwd7pfLe7hyINoabgtsvYrXThNgyrH25Z2vPZmzbd/ZHuOy8K1Hl88MNbdVNpl3KdeDvR4ZL6PORZEy8olH/Vdk1SI1fGqc5Qxm/9v1RcgMJBD0SDqqE8j6Mfkb2a+MpzptpplAM3q3z5+2q27w4z21NX6HzX6Z0Q=
Received: from MN2PR22CA0004.namprd22.prod.outlook.com (2603:10b6:208:238::9)
 by MN0PR12MB6002.namprd12.prod.outlook.com (2603:10b6:208:37e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 19:00:46 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:208:238:cafe::5e) by MN2PR22CA0004.outlook.office365.com
 (2603:10b6:208:238::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.12 via Frontend Transport; Wed,
 30 Jul 2025 19:00:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 19:00:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 14:00:43 -0500
Received: from roman-vdev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Jul 2025 14:00:42 -0500
From: <Roman.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: [PATCH 03/12] drm/amd/display: fix dmub access race condition
Date: Wed, 30 Jul 2025 14:58:54 -0400
Message-ID: <20250730185903.1023256-4-Roman.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730185903.1023256-1-Roman.Li@amd.com>
References: <20250730185903.1023256-1-Roman.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Roman.Li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|MN0PR12MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b00454-8ed2-499a-d03a-08ddcf9b6458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kb2dIGjEsjzOkPk5Bf74A8ZjWzO+vkVzZ/QCVRwVG8CZxeYKsEWPDq0CLTRW?=
 =?us-ascii?Q?cjqfqCiY/8xeqRsqavLJDqoLXycZux6CMLyOAC3kHQ+JNk5DBX9QHv7Z0vce?=
 =?us-ascii?Q?cDkuvsVqWiOq6QRMv1GPAq+AQ9qHYNhzzSiySnhaCl9FUyZkZgHQzvubRR2P?=
 =?us-ascii?Q?7RFQDZT3q0c+DQ8QlX/0mW4QLtRMDbQa8caM0d/0B0+hl4VuiVw7qEunDw2W?=
 =?us-ascii?Q?NpPsQY8JPGb+4KJdfl1ylLFrwZ9x9tnN1opz/zPQHwvJG4yffQdqlSMv5qHk?=
 =?us-ascii?Q?jmCDec/4EISf1ebSqKnC0FchaXtRa8ITTGI1ECAZQuHCGSJB6tXjGynVRE97?=
 =?us-ascii?Q?9harkaqzs9KDoP1DPxr7GMXXJ0rYjB4ZABjN9Yy+rkOE2OS9TRSAh/WuKPjv?=
 =?us-ascii?Q?ZZM3CZ6L0u3vhGco0/OMZlsDkBhDCYtFlaOF7iTnjrLPLuEmZRZszSjaMIM0?=
 =?us-ascii?Q?7opvI0kRsjkYrIF7nGl8NXcMgVBGSRW4tr9vec4GsZe6Em1TgDfEWrnJT4nu?=
 =?us-ascii?Q?0KRYCxrAW0e5o+UvZVpSWxxlxU6qaBlT1Qo8ST8cpeYQ2s/QdCvItUeEAJg0?=
 =?us-ascii?Q?Zbbp0Nyk7I12Yvg6ok1wdb/nAko54sNs7M/g5nawUhMLk4bH0dPJEwmWLQ6F?=
 =?us-ascii?Q?qZT4SQqO4+CqF+kFTDiLkRGW+f5ECWnT+FARQSjEQ6VKycAtdfNkwqnYQ/jv?=
 =?us-ascii?Q?8YLhK7EqMMQ/SA5YwV85I3k7czzlTWQhS608CAWNp1g8p6j93c9TmnVrxxxi?=
 =?us-ascii?Q?YvtEzGOr9IDfEzY0mzQAn19Wb8WD7URDmJykrGvawh+wZFw3NCayF29BTHE/?=
 =?us-ascii?Q?Pcm1/HjJRhDJEykWQC2m8TvtauODGoYsFw9TwH2CSlFElV53YQCSSj5p+4/x?=
 =?us-ascii?Q?03ucSf0Qm3x+Rv8cWWu3pZTEq+MLU88BSBo96wty2QDWO006/LaoW8YKmcnr?=
 =?us-ascii?Q?6v401FGvT6yu9p4EOLUVjf6LA3PRtTuC8SihM8pPFsPqc2yzogHAziNj80dt?=
 =?us-ascii?Q?npbERLgitckBGeP+F5qpeSrgrOox0L47Qt0iUpqr90vcPV1NZWk75/0UmuWe?=
 =?us-ascii?Q?faLLBBDm7Io7nZAf52gSYZGhZvKqlYRSS6WtUm8bwyNbX8kVDxxOlN/FtUu8?=
 =?us-ascii?Q?+BVuGdcVJf4+1MFmrmj2UbFyEWQYFf+sK/CyQF+P/z9WAoxg0vkRjmEN1qlY?=
 =?us-ascii?Q?+LIdhyw2ELRAJLJaHgTnBEeT9WXn8Okr3PceLvAWGaSDMAoCmrQi7hZh7h/l?=
 =?us-ascii?Q?DHRCNfrGqsqdyQE8QhA/j8dYf5KD8P0Rv0Snr+y/hMJUk+lIX/WHiervBmoa?=
 =?us-ascii?Q?Og+efzY7sPdBJlM3Yj+bbJUJsWrmpD2FNKwlH/JIEWHSZ0bkzvWjLR7nBAcz?=
 =?us-ascii?Q?UKzvbiORCOqZ7GH+aecjQJqw4pZ6QJ8Kc99m7/UUxswdAzlizpZ5QGKeyCNa?=
 =?us-ascii?Q?pFjvhtvFDzhQTUfOso7ZppNjhitslAAjE7hfIp+zp8rWpx18W2519BKqUsFd?=
 =?us-ascii?Q?1TKOz64J2fD0Rv7tse19Q9nY9A0n1a43ev3n?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 19:00:46.6482 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b00454-8ed2-499a-d03a-08ddcf9b6458
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6002
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

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

Accessing DC from amdgpu_dm is usually preceded by acquisition of
dc_lock mutex. Most of the DC API that DM calls are under a DC lock.
However, there are a few that are not. Some DC API called from interrupt
context end up sending DMUB commands via a DC API, while other threads were
using DMUB. This was apparent from a race between calls for setting idle
optimization enable/disable and the DC API to set vmin/vmax.

Offload the call to dc_stream_adjust_vmin_vmax() to a thread instead
of directly calling them from the interrupt handler such that it waits
for dc_lock.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 55 +++++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 14 +++++
 2 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c71167ffdb76..6762fc7de769 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -530,6 +530,50 @@ static void dm_pflip_high_irq(void *interrupt_params)
 		      amdgpu_crtc->crtc_id, amdgpu_crtc, vrr_active, (int)!e);
 }
 
+static void dm_handle_vmin_vmax_update(struct work_struct *offload_work)
+{
+	struct vupdate_offload_work *work = container_of(offload_work, struct vupdate_offload_work, work);
+	struct amdgpu_device *adev = work->adev;
+	struct dc_stream_state *stream = work->stream;
+	struct dc_crtc_timing_adjust *adjust = work->adjust;
+
+	mutex_lock(&adev->dm.dc_lock);
+	dc_stream_adjust_vmin_vmax(adev->dm.dc, stream, adjust);
+	mutex_unlock(&adev->dm.dc_lock);
+
+	dc_stream_release(stream);
+	kfree(work->adjust);
+	kfree(work);
+}
+
+static void schedule_dc_vmin_vmax(struct amdgpu_device *adev,
+	struct dc_stream_state *stream,
+	struct dc_crtc_timing_adjust *adjust)
+{
+	struct vupdate_offload_work *offload_work = kzalloc(sizeof(*offload_work), GFP_KERNEL);
+	if (!offload_work) {
+		drm_dbg_driver(adev_to_drm(adev), "Failed to allocate vupdate_offload_work\n");
+		return;
+	}
+
+	struct dc_crtc_timing_adjust *adjust_copy = kzalloc(sizeof(*adjust_copy), GFP_KERNEL);
+	if (!adjust_copy) {
+		drm_dbg_driver(adev_to_drm(adev), "Failed to allocate adjust_copy\n");
+		kfree(offload_work);
+		return;
+	}
+
+	dc_stream_retain(stream);
+	memcpy(adjust_copy, adjust, sizeof(*adjust_copy));
+
+	INIT_WORK(&offload_work->work, dm_handle_vmin_vmax_update);
+	offload_work->adev = adev;
+	offload_work->stream = stream;
+	offload_work->adjust = adjust_copy;
+
+	queue_work(system_wq, &offload_work->work);
+}
+
 static void dm_vupdate_high_irq(void *interrupt_params)
 {
 	struct common_irq_params *irq_params = interrupt_params;
@@ -579,10 +623,9 @@ static void dm_vupdate_high_irq(void *interrupt_params)
 				    acrtc->dm_irq_params.stream,
 				    &acrtc->dm_irq_params.vrr_params);
 
-				dc_stream_adjust_vmin_vmax(
-				    adev->dm.dc,
-				    acrtc->dm_irq_params.stream,
-				    &acrtc->dm_irq_params.vrr_params.adjust);
+				schedule_dc_vmin_vmax(adev,
+					acrtc->dm_irq_params.stream,
+					&acrtc->dm_irq_params.vrr_params.adjust);
 				spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 			}
 		}
@@ -672,8 +715,8 @@ static void dm_crtc_high_irq(void *interrupt_params)
 					     acrtc->dm_irq_params.stream,
 					     &acrtc->dm_irq_params.vrr_params);
 
-		dc_stream_adjust_vmin_vmax(adev->dm.dc, acrtc->dm_irq_params.stream,
-					   &acrtc->dm_irq_params.vrr_params.adjust);
+		schedule_dc_vmin_vmax(adev, acrtc->dm_irq_params.stream,
+				&acrtc->dm_irq_params.vrr_params.adjust);
 	}
 
 	/*
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 67c3a7a967f2..94f312bae9ac 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -153,6 +153,20 @@ struct idle_workqueue {
 	bool running;
 };
 
+/**
+ * struct dm_vupdate_work - Work data for periodic action in idle
+ * @work: Kernel work data for the work event
+ * @adev: amdgpu_device back pointer
+ * @stream: DC stream associated with the crtc
+ * @adjust: DC CRTC timing adjust to be applied to the crtc
+ */
+struct vupdate_offload_work {
+	struct work_struct work;
+	struct amdgpu_device *adev;
+	struct dc_stream_state *stream;
+	struct dc_crtc_timing_adjust *adjust;
+};
+
 #define MAX_LUMINANCE_DATA_POINTS 99
 
 /**
-- 
2.34.1

