Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOS2AFseHWoeVwkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 07:53:31 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605E5619DA0
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 07:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE422112DCC;
	Mon,  1 Jun 2026 05:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EgNZtjVe";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013027.outbound.protection.outlook.com
 [40.107.201.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895D2112DCC
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2026 05:53:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRydYEYYoFtw3M/NXJvU5DPAX8o3A85logVzj9vxH7kCmCMe4pgFp15urXt9K6bTtT82qCodR2fkbCsudrCZBqDSYINaEuiha6w30aC5FlmysfJYEbsczvvakzL4AkidItiRGHgc1aYrkTpLAsR6dTAKK5/rbdNfCeG+XaqrwnElimpT0TeNS4E9LPmWwqKWJ5ROhupwb94FvYJg+vbnTg/uCQ1fB6unwn2Gjc+3Wau72ub56qFkVPbYrPRK7yb9ZYpMwJRcjXbSPYvnuE7dk8xLdbY0Z46Z1wQJmxrkgMqCnt482+YOEfLJPwTCa/9vyGvr2cGBzUQChRfeG6f9pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOvLU8/+kHL3nwO8HVR/SgrBiRLiB3SWJcZ9HKtKk7E=;
 b=lS/4fwezpC8fd6aT4mZqdgnXV4Mwb5AsL2BbEz3gzOqu+U3BPuiJbPqXH9nQbWKJqi9NJMSir11PuP82W+/fEeVy4nfTnSQEU2HG51zmpRGKiRIDLY1JpgfiLdh5NcPIU/V8VWnxHJPIveV3isatzVS+l09GwnUoD3V0n8jpsSvTrVRRfUdEu9SSVn9Zj45kmRDv2kfNp5YsIc0VDazxk4mORyFQQsIRfxw2V+K2vnCNOX6NvHGdhoL1qvr4VLvIipBolClO2zZTh27QyJ8UrBUwxrrimj1yBJgo3XFjdy6b06etn1OPJEmz0AzBjSpeRm/RBpCIuVr3o/HG8yORWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOvLU8/+kHL3nwO8HVR/SgrBiRLiB3SWJcZ9HKtKk7E=;
 b=EgNZtjVegXv4+AnfScGvheanHIdM6v0qGbr5rS77EevgH4meV+7nqdo7PF79jzGrTsegMOiqMu2cFV968UQTCnIcqD7EVBhal1wV646SjT+kCWcD+0yIsDDuiwXjbYf6443ooNa6REzNkveJbXroHKmoxfqfqfMTps55dI+IWic=
Received: from DM6PR02CA0152.namprd02.prod.outlook.com (2603:10b6:5:332::19)
 by DM4PR12MB5961.namprd12.prod.outlook.com (2603:10b6:8:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 05:53:22 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::a4) by DM6PR02CA0152.outlook.office365.com
 (2603:10b6:5:332::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 05:53:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 05:53:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 00:53:05 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 31 May
 2026 22:53:05 -0700
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 1 Jun 2026 00:52:58 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH v2 19/42] drm/amdgpu/userq: split the queue reset from adapter
 reset
Date: Mon, 1 Jun 2026 13:49:05 +0800
Message-ID: <20260601055034.3700921-19-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260601055034.3700921-1-Jesse.Zhang@amd.com>
References: <20260601055034.3700921-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|DM4PR12MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: f155b07c-dfc0-4542-2c7f-08debfa20d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700016|6133799003|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: xEVWbCvn5pr13jwU9cB2yGf2LL4wLOty5Og8X6DXaceiV/AloK5JxbDmLQTBzadmpIbVrz+YocpARTLGzPlF0gWjkTA5cPUzhB5KlFiMjR3m04Z4gZMqE2+EVRkMhhFCPH/DsPID7hGxR32tg3c40o5AwJVC+BnMyKO9+WxdL7yayaeghSCN2lGYPzvWPZkRIzRwu/fOUmx8nskj+yhBmaRvuKUN6m0yS5f6cQuDD5/HlcAb508MEoVpIw4X4joZyZyjy55JkxE82IhpLjPll5MioL/I71fvKwlYybHi0yTeoA8kM5FOvrbwE5dSZQhvhzTc9OUB2HQEy+GZ9woxdOfWIrqOLvqByyg1e3l4igXPwHhoVCL+1/ZBPNp/qiP6Xsm1aKjWcCpdJL0Sv0Y6A6/KQ0rie+eVuGsjxQhDGqXD5MLUYToKiQ8AAUz5fmOeEJ3h1piNNKglOnPeevjkKN86AY761zya5adgmBd1+KD1ziNdPj+2QMWIDPqqVw1p+NGhEnchiKsjFPZjU0R0VDBB0e3RZZZhwZasLfH71kW39yxf2NGTuoqlPFwnsOOoJ1LxSvk3At3tT6j+buu/edDq40BWxj0wMK8k7XPSCXAXluVO1XtEU9ZYkFJFt0nUyBorJk/Y2axkmxVe2horuHp+EAZ+SGA660sshjaRbY6DYN3EJ5/wPvIGRPFXtlb1zOrZGOQSjNl6E8IHj5RUOfJ+eMHhPYdIdpCICe/iXmE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(6133799003)(18002099003)(56012099006)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jhjWVwwEIrNZRw1oXUSwNgmwz6IeVXIAry0HfQc9bzMKTbLOGGggwLjRH4tIDN0XnsUVMQG3wEDJxlDNjdYeIou1RKL4YKHnFWqtzmLPVhO5E55kgMgCrlBRDjo5M8Agj1g4DpVUHHyfBh5eQvDKg+PqxewebDoyByeYKr81O0FLRT7K+ZygazxnBjLwqEkTK/nPArfSbxD6pVuDWv7qV58KauYcJTdElu3KJbBIJWtoPmjjdfB6i1yJ/UqzcZBvZOwesEDbRwhS+fMAjQbgiK0n/GLmFhb9AR0tU1gyouYCrn5IrlznB1+IqBQZSeuQHzNCqg4oVJdSO7rh855VhW+IHQ+wLoJwOa4mCTPnqMRfTg4As96v6t5BB5Tktv2S2JUUKpjOB/TnYauvvSbn4DZWa0acD1ps2Z2qHU8GDoOYIneNYLyv18Q/VXTfVP5D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 05:53:05.9242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f155b07c-dfc0-4542-2c7f-08debfa20d2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5961
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
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[Jesse.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,hang_detect_work.work:url];
	NEURAL_HAM(-0.00)[-0.805];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 605E5619DA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alex Deucher <alexander.deucher@amd.com>

No functional change intended.  Separate the per queue
reset handling from the adapter reset handling.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 57 ++++++++++++++---------
 1 file changed, 34 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 154742bdd5a6..7a09e3091232 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -88,6 +88,38 @@ static void amdgpu_userq_mgr_reset_work(struct work_struct *work)
 		container_of(work, struct amdgpu_userq_mgr,
 			     reset_work);
 	struct amdgpu_device *adev = uq_mgr->adev;
+	struct amdgpu_reset_context reset_context;
+
+	if (unlikely(adev->debug_disable_gpu_ring_reset)) {
+		dev_err(adev->dev, "userq reset disabled by debug mask\n");
+		return;
+	}
+
+	/*
+	 * If GPU recovery feature is disabled system-wide,
+	 * skip all reset detection logic
+	 */
+	if (!amdgpu_gpu_recovery)
+		return;
+
+	memset(&reset_context, 0, sizeof(reset_context));
+
+	reset_context.method = AMD_RESET_METHOD_NONE;
+	reset_context.reset_req_dev = adev;
+	reset_context.src = AMDGPU_RESET_SRC_USERQ;
+	set_bit(AMDGPU_NEED_FULL_RESET, &reset_context.flags);
+	/*set_bit(AMDGPU_SKIP_COREDUMP, &reset_context.flags);*/
+
+	amdgpu_device_gpu_recover(adev, NULL, &reset_context);
+}
+
+static void amdgpu_userq_hang_detect_work(struct work_struct *work)
+{
+	struct amdgpu_usermode_queue *queue =
+		container_of(work, struct amdgpu_usermode_queue,
+			     hang_detect_work.work);
+	struct amdgpu_userq_mgr *uq_mgr =queue->userq_mgr;
+	struct amdgpu_device *adev = uq_mgr->adev;
 	const int queue_types[] = {
 		AMDGPU_RING_TYPE_COMPUTE,
 		AMDGPU_RING_TYPE_GFX,
@@ -131,33 +163,12 @@ static void amdgpu_userq_mgr_reset_work(struct work_struct *work)
 			}
 		}
 	}
-
-	if (gpu_reset) {
-		struct amdgpu_reset_context reset_context;
-
-		memset(&reset_context, 0, sizeof(reset_context));
-
-		reset_context.method = AMD_RESET_METHOD_NONE;
-		reset_context.reset_req_dev = adev;
-		reset_context.src = AMDGPU_RESET_SRC_USERQ;
-		set_bit(AMDGPU_NEED_FULL_RESET, &reset_context.flags);
-		/*set_bit(AMDGPU_SKIP_COREDUMP, &reset_context.flags);*/
-
-		amdgpu_device_gpu_recover(adev, NULL, &reset_context);
-	}
-}
-
-static void amdgpu_userq_hang_detect_work(struct work_struct *work)
-{
-	struct amdgpu_usermode_queue *queue =
-		container_of(work, struct amdgpu_usermode_queue,
-			     hang_detect_work.work);
-
 	/*
 	 * Don't schedule the work here! Scheduling or queue work from one reset
 	 * handler to another is illegal if you don't take extra precautions!
 	 */
-	amdgpu_userq_mgr_reset_work(&queue->userq_mgr->reset_work);
+	if (gpu_reset)
+		amdgpu_userq_mgr_reset_work(&queue->userq_mgr->reset_work);
 }
 
 /*
-- 
2.49.0

