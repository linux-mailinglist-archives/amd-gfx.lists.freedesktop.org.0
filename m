Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yz+XJSjtVWq3wAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 10:02:48 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21B2752266
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 10:02:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=wezlBHA1;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2C110EC3E;
	Tue, 14 Jul 2026 08:02:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010057.outbound.protection.outlook.com [52.101.56.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C754710EC3E
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2026 08:02:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAcRYpdKP3JS12pmqD/kdNXCsNKcqZMU9L9CLT/9mr7V3RYav5RHqHXAwyzRfxVayUuTtaayzOcgnXwuJX4oFR8coh8j+T3DCA/uBNaf0yyBC0LmenaItZ1zWhGz0lVhhnUp6k6nrFUIzyFoVmAEHbACrU8BGUPDYhkvK380ppNAvbIXIWPy8fm7YOQGXaw0g8IlvZgeWCh3nJupWtbchX2ksICTIUAHeM0u+1xc4XliTxXCZtQkQHd0mCEVWSETXbxwps44ci2SepMnmOeF96wTIB0PwFMIJ4GICOijG+OVeHlW52JV3TcV+RBJFHAfKLJPWBwijD4TKhECJr5QwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3b1KRBZtCJni4woTBLBcgosUeO28BtfuqKreoMVw8x0=;
 b=wTWfyb2AjZmDJshDwPJoLxHRrNG9+NLbhNEz9Z3wsOqVl8RylmdUBQl6pEv8OK4gVfgKidC7aw7Ux9sX9pHMU+MsfDDk8zrv6iwpH+h57jxAeGkH2LIzhCdF2N58BrLzVjHZR/vA5sHh6Hk6nVoI7A7D69Lv3NpWCT1GLi2x58JtSR4Dc6VieV+jVhxIr2xJ1n8JUk5Wh7dilujqFAT2kXZCzMQoqBlvYuyc2h+Lhc9dEvgUAwyQFI60Jp8qUlCiy418ojSl+i5ZF8XBAC7Fei0FnS7hCBZrYTpd7CAgl1bPuUwAV6jvMSmNNBGZgPXrRg0nppJNlBGcxXKlkpdKkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3b1KRBZtCJni4woTBLBcgosUeO28BtfuqKreoMVw8x0=;
 b=wezlBHA1PbL/m/nGiDTyjyQvF7oqEeKfrUx23vQhAOzC27KapUd8+5dG/Qwy5lbhrv+sV6ofC8D4w8BiKdeYtSu48Zh8+a3BCnhDZqaGc5RfKz4EX/4qymDrNjgYH+BDgSxkBki9lQxB5xQNWnThlmUQq4Vft4iQlwRFtvOxAwI=
Received: from SJ0PR03CA0367.namprd03.prod.outlook.com (2603:10b6:a03:3a1::12)
 by CY5PR12MB6323.namprd12.prod.outlook.com (2603:10b6:930:20::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Tue, 14 Jul
 2026 08:02:37 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::29) by SJ0PR03CA0367.outlook.office365.com
 (2603:10b6:a03:3a1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 08:02:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 08:02:36 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Tue, 14 Jul 2026 03:02:34 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v4 1/4] drm/amdgpu: Signal USERQ_EOP EVENTFD notifications
Date: Tue, 14 Jul 2026 13:32:17 +0530
Message-ID: <20260714080220.3395155-2-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714080220.3395155-1-srinivasan.shanmugam@amd.com>
References: <20260714080220.3395155-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|CY5PR12MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e2b046-2514-4e69-895c-08dee17e449b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: /eF4Df8LO8Dr2h6AJBEOXF/2YPUy2udEfEZqEjbHFh58gnDlXO1SVbbK8I923BioksKcYBhIAYCBhf0chdf2jYy1DyXgBc8VRwGBO6do88S9NBqCuwqL1oCbMlUrQXtkQ9WAxlrYWcwLS9DVBpl9o66wozUWxl92ZnckpnhywaY8ysqn8nioMTPB0SsYE8Lj3NWidBFzZsr4LiqhZ+7LFW9LcL4vOIZN6hjlYeMi4ViMenXh90/ZVBJglN6aMeu8oOCiee1hxt81poWa7WxhoHupWXjPWw2USXiyfJeUCf/CEpPDM+BTVOJ652BSrMTrwxDknJIk5R/KM/BAPZe5n+SG318cnqwFk4/f7NVsWDU9lsmyugdQGuzyfcKfgEy4tJunmzTei1O154x6QGHZ5GgsbSVlJW2MuGsBpVJzO/LgiPwcvBnZez9OdTN7SbEzVRS4iC+oGP67cEVF/e3ybIaU8Rg0ay/RGxM2st6aNjgJZGlifhevZcLL8Jf/rtH5io+hDgDaOy9rZez8Ban9MpF5T6ET2MC3zpT3u+5e0FwD7f/6+zJ9jS/tFHMRWN9fQX4TMKV15rG+K4nZ1WCkPqNfeM9nRZS4tGFq3jOJltusyIZQSbAgU+8ZeLqGIDKynxcPsVt7/SQ5GlyiRC61ltwLh72dCHud5REkN3M2aQehYV6OAHvlalAFAHQuRUMsnfWFBF2cavqCaA4tGRDfwQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ciCiFpyWgRTVbcwPgBAdNKtj7r4XxX0qmrWkGkUI+z/REWwjhWwwBDatkKeRiMomTeKWhpuraQQvBzzjOuzEQxh51D7f1TsSS0v3/EBLuWsL3BIanJjcAIpJluViJ3teHN7/c/1IN2fCiRZPkV38+md5N6orV8v9HWZNK9VH9ohXS6jEUDezrxcLj2TOlpX9zBBTTxpfMXz1CSSuVpSEVAlqnU1f6lVRC7M0SdGfFhwcoCemqCmRxw8O4DhQ3rIdQCdXdBW+krFGwBbpy2A5LOmBMP56r6y/ymloLek4keV+/cIvTdz66hkApRZcwdtXA3tYQMeb0ndBsJ27kA52ocF1C/JA6/QYTSqENjbHwyObmtK11yjkZvfgCE/QDMVOcSlIUItyixEBe9o4rPeFLzWV0pIKmdEyPbv5J6KxJUV0oMl70IlpHVB7wk/7WOG6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 08:02:36.5321 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e2b046-2514-4e69-895c-08dee17e449b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6323
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A21B2752266

Signal USERQ_EOP EVENTFD subscriptions from the USERQ interrupt path.

The EOP interrupt already identifies the queue that completed. Use the
queue object directly to notify matching EVENTFD subscribers.

Routing notifications through the queue object keeps delivery tied to
the queue instance that generated the completion event, avoiding
ambiguities from reused queue identifiers or doorbell indices.

EVENTFD remains notification-only and carries no event payload.

v2: (per Christian)
- Move USERQ_EOP EVENTFD signaling into amdgpu_userq_process_fence_irq().
- Reuse the existing doorbell-to-queue lookup instead of duplicating it
  in the interrupt handler.
- Keep fence processing and EVENTFD notification handling together in a
  single helper.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index fbf783946f6d..ab3ef3a9f655 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -215,6 +215,7 @@ void amdgpu_userq_process_fence_irq(struct amdgpu_device *adev, u32 doorbell)
 {
 	struct xarray *xa = &adev->userq_doorbell_xa;
 	struct amdgpu_usermode_queue *queue;
+	struct amdgpu_eventfd_mgr *eventfd_mgr;
 	unsigned long flags;
 	int r;
 
@@ -232,6 +233,11 @@ void amdgpu_userq_process_fence_irq(struct amdgpu_device *adev, u32 doorbell)
 		/* Restart the timer when there are still fences pending */
 		if (r == 1)
 			amdgpu_userq_start_hang_detect_work(queue);
+
+		eventfd_mgr = amdgpu_userq_eventfd_mgr(queue->userq_mgr);
+		amdgpu_eventfd_signal(eventfd_mgr,
+				      DRM_AMDGPU_EVENT_TYPE_USERQ_EOP,
+				      queue);
 	}
 	xa_unlock_irqrestore(xa, flags);
 }
-- 
2.34.1

