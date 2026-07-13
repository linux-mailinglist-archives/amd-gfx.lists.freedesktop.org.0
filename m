Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NO1uCuxMVWpFmgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 22:39:08 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBEE74F179
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 22:39:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=eTxn911L;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C67A10EAF5;
	Mon, 13 Jul 2026 20:39:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012012.outbound.protection.outlook.com
 [40.107.200.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A1A10EAF5
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 20:39:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjcUueSiifhdofu0M5sBiJsMbaPWGdeGPfBzwJs6zBsHJOBs1OzfWkzwcRKSAau9Yfla4//J53xo/676W6BPWlK1MBQAGFuGxys7BKkdn6xwhxj19ZWLOljfuyqYjsdLLxJ64hv3wAlKlqxIqF2oSTlcD0ow4qrWUJpicIf1uUXlYGC2vIK0O+DYEAqfcGyvF49sYPkAF2cNTHl1dtGjgjeC86KUDbYC3dJKf+z5dlkJ1aXKIBZWoyrf6kWpYztp5I3AUlg395rkWi1/s5YTUkIbmeqV1JjicvqoC24TO4aBkLtit3EYnHnA/WwJ+FWeEdrAjrGZ5vgEMUHo20SP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2lsgzcGMPM1SagF4AP9PNYW6skycc4i4KgsfBp2V/o=;
 b=JFDe4Um+anmOwh1XEtwqDVlmqM2fz7/3ZnrHnGQXsmdqDOk7e5bPKjbAMu9Di4Lm52kZMT382EpVOy9t+EK36RBT17r0zWqYGge2e3Larysgog2nk0QV8ISlNclvpSzQobYJubifQwDSzrWqa35vO7NcId7rhPXPW/pSeQotRLTZDkQTqDpQXD3rNrTR6gomJcT1NaHlD/3FhN9RT2+u0NLPB54VKwxXVTpU04EXR/Iu6Em8yevbT0jcUt4kIT/ydqh3a9lHuI1PMwNrkr2DVz2w36iaIPO8MxBHzoopi5wZcPJvGwVD4h0kBxLOhNq0Hw4LtswxbFN1eptZK/cBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2lsgzcGMPM1SagF4AP9PNYW6skycc4i4KgsfBp2V/o=;
 b=eTxn911L8YwpbfX/TRX4+mqiOAZ88fldktAqUfNpqmcpCUB498icbeG3RhKW0cBg7pGNr5i+LY85mbS3AwJEl9Y3wp3SVdqJP8X6ZXExMjPxQuGbfnaDItiz87oGr0flvMQdwonx6WPzKE9fWK0qZL8lrK6DsyQSev91IEQ2gYI=
Received: from MW4PR03CA0161.namprd03.prod.outlook.com (2603:10b6:303:8d::16)
 by CY5PR12MB6573.namprd12.prod.outlook.com (2603:10b6:930:43::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 20:38:59 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:303:8d:cafe::1a) by MW4PR03CA0161.outlook.office365.com
 (2603:10b6:303:8d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 20:38:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 20:38:58 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 15:38:57 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 13 Jul 2026 15:38:57 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, Prike Liang <Prike.Liang@amd.com>, "Sunil
 Khatri" <sunil.khatri@amd.com>
Subject: [PATCH] drm/amdgpu/userq: properly account for resets
Date: Mon, 13 Jul 2026 16:38:50 -0400
Message-ID: <20260713203850.650426-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|CY5PR12MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: a5193200-2d21-4adc-68ce-08dee11ec402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: jcENUb/unBSyLk/IYR2AtPv9G1bKdPqaWnQibsTJACQga0qaCmsZ/5Z232L00C6qVMxMvcG3Waqpc5BVyc8DPGWQRAJAK+x8vOeVEYl9bLQCkXgmf9te1tM3gApqKKjCJ3sWwGpgyiBUVFRi92yzeAwTQbEbtDuF7pmvHggXBpGmV+bDhk3HmAYE1HID3+Mp+tU8/EZ4ibhSPrgs+PjaGj4LenwxTUUMX3ExazdGQcc5fiSVGuccMosYk8IhYJfA30jbJB49evckzJ6afU7etIfLETMn2HbWsEsPTzO8W7L4nAQTzupJrOtA4bT53ZUV9VYxirU5lFTmMzjV2VoEKrZkCEstRrU/RKX+9+mwfZ4xIcNkxufwbMJ7RmDSkaPr9cHWq7SXhKjGvbcoijUzB7DoEITzBAn4tB80dU/G5u28cZhaxns7Z65gNQbeTa8p2FT0Dhjbif0cHSY5BkbDlFfeuU9xpxBczTdNtGUXxWzVXec6NsWwFroV++n4p+3ljnK//Ti2GGJdK3aR270Adn0HeO3VE99pg3V8MFKhHLgnLSvHLNIhZans20FfOSYcYGOHvjXb7JbDkIZpE0YeYH6UZygWEepHSPJknEik1lphYsMDLZvNhbiC0Co07CA5DO0KpX3TAM+PBGiEusAfwjOCGFJR8N2NGuFu9vCRhqn5J1kHxeTRvdj1qkpT/BhJNs2NANqigdcuYNbdiNppEQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IjMbchyIQWxybUcOoa5fy9cfFwdJ3vT1loOf5/OrCDC2ukpPMbnMvgahol15ijH4sf2r7Hzpi9lBICm2ROARrHTpuevFE9lqUa8ZV//1Ko7itYOh2diz3h8cPb40bK2s1yi2tA1rMJPAKzH11i9pGWXJgI30ZKfgLIAWa8LJoph134xjfnLcec87wc/Xwrel1uq9BQ2+D+KJCUe3aBGup8K0j6U+IuIrV2bsWUjao/yG5lhGC00sJsy6yke7y0tOR9IWLLOpw5zl+1gml/lCcjhUrNKCb/JPoEK6VgtFnQmV/+dhj2udIVz2sZHVVtcvfmT9ZoFcFW5XRol2uzDElByJzxVaB9ymXNBOwlfbGjABdOhNrTs353Shm5FPYzRId8tAL4ROCHPZrIfQxJgMDOFgk2i5RZcOpva54dlFwwj9TvL3jZTet3RdRRpgYAVh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 20:38:58.6144 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5193200-2d21-4adc-68ce-08dee11ec402
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6573
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
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,amd.com:from_mime,amd.com:mid,amd.com:email,amd.com:dkim];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DBEE74F179

We need to increment the reset counter, force fence completion,
and set the wedged event when a user queue is reset.

mes_userq_reset_queue() handles this for collateral damage, but the
caller needs to handle this directly for the original guilty queue.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: Prike Liang <Prike.Liang@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 6aa75da27f912..5e1262636e1e9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -146,8 +146,13 @@ static void amdgpu_userq_hang_detect_work(struct work_struct *work)
 							 queue, NULL, NULL);
 		else
 			r = userq_funcs->reset(queue);
-		if (r)
+		if (r) {
 			gpu_reset = true;
+		} else {
+			atomic_inc(&adev->gpu_reset_counter);
+			amdgpu_userq_fence_driver_force_completion(queue);
+			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
+		}
 	} else {
 		gpu_reset = true;
 	}
-- 
2.55.0

