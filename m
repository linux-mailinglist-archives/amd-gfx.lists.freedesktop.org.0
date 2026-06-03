Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cdr8KZlXIGox1gAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 18:34:33 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55824639C7B
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 18:34:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=z9U2CWEi;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07B61120CD;
	Wed,  3 Jun 2026 16:34:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3A71120CE
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jun 2026 16:34:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpwS7pu4zoWakWBJyXLlGYARx3R1FXJBS4PHjBq6cm8mwyOJhd7U+ChqKiEeKm5G2ayFEKxnQi3QPzZYBesD5Fgv99XmJCbiBpAsrPg2QC5t1WSH8mF2pIwJKLXVhd4ZOQuSYWXurCp2LrIhIFaa2k1DETgHOTxhhnQnvjkmuPvAAsB4Gwv8nVjMI8oDRC36xdecqk/l2xd+5wsGsmDEDjywNdB/62O3kyhnbo2YTqhK/UXogwHDv56Qd1KW/cD+Cd7pr/KS6p4pGwrXF3X6cim+7RpK4Pm1jn8AoaBib4pJnoNT13h0WjonfcSLP3C9d3vrbHVmAaErkhgUrDnlGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvNMaeoPIGk688/wrQTD0R4ufoot8i5gyv6CD6qxvyQ=;
 b=uJGe+rTE4fbDMvBhO0i1cS0a+LuyqV7z/yw5fOC9oOjs9lgopnKQ5WdcehPNBNQJCSgsEY/QnwLNNy0+UpxbT/pi36p9qA3+pzWAd87pZ9L3crI32AQ4rJKdZTaEYsRcEsBeNvIYdoGdSFb9hQWExQSoc4iKsniZwxScqwtjDgRzHgR0nRNkFtlCc8KMXdBnok7LwomHF4GDAET8y/9z6F2xOD8YS9hrgWcLjOq5uC0QV4p9pFzkoUo7K464sD+Q5nisaLlQJppFzfgl3vh3OVh455Um6sBjXPL7Dfv8RCrprH04YZNwbnKdAiLejClG8poYgklVhoICZyIVTEFoVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvNMaeoPIGk688/wrQTD0R4ufoot8i5gyv6CD6qxvyQ=;
 b=z9U2CWEiCJNu+IoxEKvivuokggcISLtevzW51IUG9aTLjH/xx2J47IFdKSdk6shLzLW+NgQe+uoqU34NPbqPimSwAr4ou1gP5YJdq56hSxKFJti7WoZeCDOx1qVbFmOQVInI2ygKL+nWPaL02LgRkBHHORbMvsVBEP1qYtaP77I=
Received: from BL1PR13CA0359.namprd13.prod.outlook.com (2603:10b6:208:2c6::34)
 by PH7PR12MB6562.namprd12.prod.outlook.com (2603:10b6:510:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 16:34:23 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:2c6:cafe::8) by BL1PR13CA0359.outlook.office365.com
 (2603:10b6:208:2c6::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 16:34:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 16:34:22 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Wed, 3 Jun 2026 11:34:20 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v9 08/11] drm/amdgpu/gfx11: Signal USERQ EOP eventfds via
 userq manager
Date: Wed, 3 Jun 2026 22:03:47 +0530
Message-ID: <20260603163350.2678309-9-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260603163350.2678309-1-srinivasan.shanmugam@amd.com>
References: <20260603163350.2678309-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|PH7PR12MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: bb0a3caa-84b5-4c7c-4669-08dec18df79e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700016|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: cTpi4jJX7kIiXN/aKh2s0XIrpb51eDbhOHVM//RoodK25f/MySDzuV4nA1xwTV1EFCtqXaSWReWZoVZ+/6SYG5VHEX3Cw6CUBqcLHiW4XlBMfRq/jhiw/7fMW7X9c7lL6AI9Wo/h4aMf9Z9oKSeNj/4CTbI/No361VWuWUUv/7sLh9yqodgTzoVr76QvpY+UrMQUx1YLmq4tsYmCztElVVbn1+tYbauQYHh3vHrgTZ0eZ1HTqg9VmHmuOQvH6Q9++QKmd3MylsYVMJbF8LClXZVaTGJUW/dmKwPQU5GT84RcwRHbVZzt2QEuu31df1kLV5hZB78iJ17Y502AzGalcbMRXoEYKB9MYcK2gb5Jt2sBMKrk7Cy+6y7zcUWsKK/d2E/rO7uwpPkW3cr7uvTNVEHpy/qbI8zDTgsj1oBwNgc4M5MKic/gLqFFbrMkSgQrSdIq+opTqveh6ssZeRf9KOUF5K8NsaXsNBrcOtU9Z32GBHbM/vpAn1iWqpxYs1rP9THTJQM3CyDupa9/pT2nz/TXSs1j84ySIKHher/21mOhhPRThTqT0XCJR9/3XQuWnviF8Xtop9vGr3cJ2DEhJtw0nS3CuRJMOj6oAsy+IzegeSpEWUdmsAigmSYt5m+GGCMHBdX90wFwhBjkys4iBNhFnxZWCFV9Oz3iEg2i+GJPIVDDy8X7Zre8lLpgSKzyVCR+ja0yuU42wPaslrYK4/9yyENsxONfAUlJGaG4dzE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KAQC+eVWF48kFxlHWnjzOoxaYqB4ssQuzk5/lR05O51QBffP1OR+GNa4Vpy55KYpa9ngsHwaTi7+fRBDdB8JJOpbTad7bEKrNS2Rssj2kXPf7iH+DICRlaVDk19gl0CaDvPdJnQHhYErMLpYPCfEEt6ZdMsqzV9clMq10fN7kycazQ9rukQJhHxZ12BZuqjqet11bqXQQpxFcCdTW6IAOn7zGFf+t5ouEKjz+8lWgbDcMQ0k+nhhG52d2c+d/ulC9G+p6yfwLrimFwCDDNILePNxyvrPGbli5oTvi6w1UgxwsQluQ6D74FIKG6vqBQnPLXrdm8hWBk8zDuo7HI4CVC9HvrzOUE+JXWU2C+aCAZvs0ekIVTiZEedvXdttYY0iwLWhKlzi78FfcVGITLlfTB1O37Il3dvVi49o24Y13cXDpLXgSJoJZREfqD/ASTUV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 16:34:22.1637 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0a3caa-84b5-4c7c-4669-08dec18df79e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6562
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55824639C7B

Signal USERQ EOP subscriptions through the userq manager associated with
the queue, using the shared AMDGPU EVENTFD event type and a queue-scoped
routing key.

In the current USERQ IRQ path, the queue object does not store an
explicit logical queue_id. However, it already carries a doorbell_index,
which is queue-specific and naturally available in the IRQ flow.

Use the queue's doorbell_index as the queue-scoped routing key for USERQ
EOP signaling.

This folds the earlier intermediate gfx11 eventfd hookup into the final
queue-aware signaling path, so the series only introduces the IRQ-side
signaling once.

For USERQ EOP, queue-scoped subscriptions are matched using the queue's
doorbell_index as the queue-specific routing key. Userspace passes the
same value through the current queue_id field when binding or unbinding
EVENTFD subscriptions.

Signaling remains notification-only and uses plain eventfd_signal(ctx)
once per matched occurrence.

Changes in v8:
- Use queue->qid instead of doorbell_index for queue-scoped event
  handling (Alex)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Change-Id: Ia225d0927e977c7c7546cd479a0a40be6ca89467
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 1941bfbcbfbf..ae0e9f9b9611 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -26,6 +26,8 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include "amdgpu.h"
+#include "amdgpu_userq.h"
+#include "amdgpu_eventfd.h"
 #include "amdgpu_gfx.h"
 #include "amdgpu_psp.h"
 #include "amdgpu_smu.h"
@@ -6488,7 +6490,26 @@ static int gfx_v11_0_eop_irq(struct amdgpu_device *adev,
 	DRM_DEBUG("IH: CP EOP\n");
 
 	if (adev->enable_mes && doorbell_offset) {
+		struct amdgpu_usermode_queue *queue = NULL;
+		struct amdgpu_userq_mgr *mgr = NULL;
+		struct xarray *xa = &adev->userq_doorbell_xa;
+		u32 queue_key = 0;
+		unsigned long flags;
+
 		amdgpu_userq_process_fence_irq(adev, doorbell_offset);
+
+		xa_lock_irqsave(xa, flags);
+		queue = xa_load(xa, doorbell_offset);
+		if (queue) {
+			mgr = queue->userq_mgr;
+			queue_key = queue->qid;
+		}
+
+		if (mgr && mgr->eventfd_mgr)
+			amdgpu_eventfd_signal(mgr->eventfd_mgr,
+					      DRM_AMDGPU_EVENT_TYPE_USERQ_EOP,
+					      queue_key);
+		xa_unlock_irqrestore(xa, flags);
 	} else {
 		me_id = (entry->ring_id & 0x0c) >> 2;
 		pipe_id = (entry->ring_id & 0x03) >> 0;
-- 
2.34.1

