Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0oY7IIf+KGpfOgMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jun 2026 08:04:55 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E357666116
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jun 2026 08:04:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=oI0cGL6m;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF1D10E71F;
	Wed, 10 Jun 2026 06:04:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010022.outbound.protection.outlook.com [52.101.56.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B58D10E71F
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jun 2026 06:04:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGWLYY+C3Ts8E28xLqsNZC2Fb+kwQdvN7LSOgxQ78OZrJnTSC2O6BQ8bTwj1wvsIueSdJwMx9Rb7s36E+2Y5zJJUUhzGJBysNJJuy/T7hzgLNhOIqDzN5LF9SCIwjrfHvinSZRIQ3Aww3uwe12IQvWiFGJhSmX5OKuT+Els6rp+JH+QvEPgW3b0e5eY63NFO4HqH4sjdNTa150uyoemsUgh6Ek1uBE2X3T0sllBAVrhwDfkywhrsW2marMdeXNjSFbNVaxIwC3Cl6y8iTEjneox5aGDuCS8DzTZjFPASoQeD5Qlox43deQ4U62d+5JTxxsL42pqjRxNHGs5gm4cWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiFFK1nJ/zffdbibl/dMzopWmIy6k4equJKChLMGCjw=;
 b=T76jPhfGXPzAgWvhAuxYQnOEBdHLFXPfmfx9o1pPYBcgN4lgCRDw4vvjouKTDIni+64sBz44/ZsgCMMPrl/hS7htO5w/PXDBXvdFaZ7dJy/YeKgJfeiwEqNbnGiGXodGSVNWfMKMZueFJWoMA7u5sO4J1Bq/U1u6cf8l/rKfpYfWzOgUU6uvqbbsGKh3gCgBn+S5OxxxXsZqnuwUM9YeuHj9f8OXF2ZYxjIX75FAaMmEz1xlKE4UcL6UdLxDy19ET5LHTYfsGmETP1Cjv6gTwkadJ9Jfp7+NmqwrMrf6jWxz9EWDuFsrPd3Af0423i2y7jPVd2vOfRBpJm5lgKo/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiFFK1nJ/zffdbibl/dMzopWmIy6k4equJKChLMGCjw=;
 b=oI0cGL6mBTHVJPHbuYefTr/lwpG6eVfTTfXMeNWSZnESfnBeP+6JjDiDGEa0ZMHiEr+sD8wqTmG5LXNUPKafyMNGizgPNaAwO+kzZDS3rfJv8ZaFE5aFKu3foprdwobZcVAoQzN1Lbav0xWAyhZxyUUH11lel7LZZFH6kgidZX8=
Received: from BL1PR13CA0089.namprd13.prod.outlook.com (2603:10b6:208:2b8::34)
 by PH0PR12MB5608.namprd12.prod.outlook.com (2603:10b6:510:143::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Wed, 10 Jun
 2026 06:04:44 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:2b8:cafe::7a) by BL1PR13CA0089.outlook.office365.com
 (2603:10b6:208:2b8::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Wed,
 10 Jun 2026 06:04:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 06:04:43 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Wed, 10 Jun 2026 01:04:42 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v10 7/9] drm/amdgpu: Signal QUEUE_RESET eventfds
Date: Wed, 10 Jun 2026 11:34:00 +0530
Message-ID: <20260610060402.2769642-8-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610060402.2769642-1-srinivasan.shanmugam@amd.com>
References: <20260610060402.2769642-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|PH0PR12MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: ceee6249-d604-4cec-c75f-08dec6b62aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: bgrW353SEjQgjilvHXSJBpQzQN7hh6lHxE04RQuwqH26R3Hchac7le4nLixKwNKgZNO3KVZcegD/UATQ7hQ0UuL4lPXQ5dRtwicTzWP0YSmtMxTZf+2S5sd4lDxAjmwXCHlZOInuUUJ0euC2bSalEyhFbYwKI6pfg4ud8HK5FwZNop2ybQLhQy7+w3vdirTb/qZs8WKLbK+JKlbsm+BckI/9YO9X+qGEDNulSTdhoLEWD7kbWzyAaMeu1q7+mTI1v9twr5DcJiSlW/uj6zcG5gN/WHdJ3BwkYIaMMycQ6jAeuqsQGqmUFSdth4pWS/iRKbBSolWJ1rrc1oTtXFcJp1qPSZz32qObYxcFrZuQ7KSqMuWFv+NFSlruANZD0dVozGNn4zttdL3lTItF6CFsnwwoI4WLvy50CLSDoWkuyBlznnuM/c+/oy1HnL15GvRPQhOjVsZKDzywjcKadSdPE34cA+sMfHYxO7bK0i0olGcOnd7a8cZhBgqEJRBO9w2G/TOVRkp1qJ1lJ0pAs7c7CSxkw8yTrUQdCiHg0IEnMW2xvWFHtr2A71eFQA/CKZqSMTsU32f5gI7vHOCYGhbKtSzsnBbBfqmAy+aWBEbd8328o/fBV04s3tgenef+VCe2JSpTbU/pXpT7zmiGZgkRLs8AHaY+R3u3II3g3c+DCtX8Tk9Bewwmg+p63urUJM2BeDUULKkd+1CD7jlBzEvAROs8D4986KLJ3SHi1YlvSY4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rzsfh9vF4T8s4ENU61l29/2ISlUKZXVadFnmdUxJYLc87cv51BPmbduFEZv5RC/tjm3wf9fYCU/Ujp+Q4q8kQ0ufB4P1tQFda+29CNEnnyxWdWUEej4opnkhGE5ZMzXybAAAnQHJ81DZMN/z8uebyNOSVHftBrvzOQ/gZXsJL5idJrSHxIDUfaSNk6lxPuDSVYaDw9YmTTnf95vmyCYWdXWqDx3AzzJPyHhP59j60SwHUOBIKt5TSaogoYg4KOh4AOI646kpSgO+wTAHcnUQ10JUOGX62NyerAzYhIl13362LrDcLxNB/ZDk23ccP9YfuUYOZ4E29bxeoAigTJHfY3/nQpwdg8VvnRE9jVmqUIskHQt3ZZGAY6GizhKH8uLllJYR+4iuCr+Zjf+FVC+TDHxMpSbE8CUQJpFxQ1tsOFIlD/IhXRjeZWH+JqA7SQXI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 06:04:43.9334 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceee6249-d604-4cec-c75f-08dec6b62aec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5608
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:srinivasan.shanmugam@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E357666116

Signal queue reset EVENTFD subscriptions when hung user queues are
detected.

The user queue reset path already identifies the affected queues and
marks them as AMDGPU_USERQ_STATE_HUNG.

Reuse this point to signal queue-scoped QUEUE_RESET EVENTFD
subscriptions using the corresponding queue objects.

EVENTFD remains notification-only.

Changes in v10:
- Signal QUEUE_RESET eventfds using the actual queue object to avoid
  queue_id reuse issues.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
index e9189f07c6dc..0b86e236da3a 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
@@ -238,11 +238,23 @@ static int mes_userq_detect_and_reset(struct amdgpu_device *adev,
 			if (queue->queue_type == queue_type) {
 				for (i = 0; i < hung_db_num; i++) {
 					if (queue->doorbell_index == db_array[i]) {
+						struct amdgpu_eventfd_mgr *eventfd_mgr;
+
 						queue->state = AMDGPU_USERQ_STATE_HUNG;
+
+						eventfd_mgr =
+							amdgpu_userq_eventfd_mgr(queue->userq_mgr);
+						if (eventfd_mgr)
+							amdgpu_eventfd_signal(eventfd_mgr,
+									      DRM_AMDGPU_EVENT_TYPE_QUEUE_RESET,
+									      queue);
+
 						found_hung_queue = true;
 						atomic_inc(&adev->gpu_reset_counter);
 						amdgpu_userq_fence_driver_force_completion(queue);
-						drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
+						drm_dev_wedged_event(adev_to_drm(adev),
+								     DRM_WEDGE_RECOVERY_NONE,
+								     NULL);
 					}
 				}
 			}
-- 
2.34.1

