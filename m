Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xRTYBORyKmoApgMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 10:33:40 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8EF66FE55
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 10:33:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="g/PjW23W";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AAD10ED88;
	Thu, 11 Jun 2026 08:33:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013051.outbound.protection.outlook.com
 [40.93.196.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D5110ED8B
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 08:33:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xaKIIC+pqfSwJMhuwTzvp5CljGJzgUGksOKdy6WO8h5HrBTIJZJRii2GWoJdnV6cOuVte3pEsGQFLUsjZz6IopY/Gdwhyc+KKXbw5oHzDY1cnqyDNq6cSc98PlCqpBbSzxvpw+lA2veO2a1/cNiT80xJyHC7sZSr0tKtSK3As2sYlSK2FcRNgweV9eidEELnKSpddYwV9+rPdkjjSyEsnJPQeQkipeRkzirWSJbn9VzC5/1D0NP8GK94NRId6jM1gc37up4e/wbRyam6pPZleAs2XvO5T7KibExX5HHEjqGTxBr/lcjQ1nZ2YVT6jqJwjjAE4UlXFLYHDFgNxvJM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shnoHxSwRvvHQczZGtTCKhjnnHnB0EApB5rfQQJuapc=;
 b=hm1ZYQiCbwCTiBHOFhXCeQx9cRyRd8m2CY1IX2XBVDTpAN81RVmQ8BPmBl1qCcDLgJ1sI1ugeCEEFowVSwAJw5czRxFQHUG7IQAnchuJN1x4hKcbK41FVstsGGbwi/48y5QbtTCbFpIlWboCfV5FKOVomXSEUJDphBXiKqshHs7W70W2EjYthofFPf2jmS/UX8k3b1kLQmPA4O3JKJbMX7rcOVY/5r3l/bbMbW0oO/JYa7mt0QbvdXyvaXBbv/myx/qYV22bOg5czpLA7EqkKMy9xwOmCLYrO53HbG2EFP8p5NTbVPB6oexe/ECpzvOzG2VG/ulWXC8WbM4iAMI2IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shnoHxSwRvvHQczZGtTCKhjnnHnB0EApB5rfQQJuapc=;
 b=g/PjW23WLRQ9FFfbDmoW5jT5sK++axfFNbRCkmoq0kPRlA7UfAscwrgtv8Vij5C0KvVo+YFzpuEDbxT6Pmf7nlV/3ue88vmSdN6hyqyQfQs8llVePf4B7KRCuPKPd9jLtp1Z1v2s7cENe8p5kEVB39a29QRRg09iVLU3p0yzJ5I=
Received: from MN2PR18CA0028.namprd18.prod.outlook.com (2603:10b6:208:23c::33)
 by PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 08:33:25 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::25) by MN2PR18CA0028.outlook.office365.com
 (2603:10b6:208:23c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Thu,
 11 Jun 2026 08:33:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 08:33:25 +0000
Received: from prike-code-pc.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 03:33:23 -0500
From: Prike Liang <Prike.Liang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, <Christian.Koenig@amd.com>,
 <Pierre-eric.Pelloux-prayer@amd.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, Prike Liang <Prike.Liang@amd.com>
Subject: [PATCH v2 3/3] drm/amdgpu: add userq job and state transition trace
 events
Date: Thu, 11 Jun 2026 16:33:11 +0800
Message-ID: <20260611083311.191012-3-Prike.Liang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611083311.191012-1-Prike.Liang@amd.com>
References: <20260611083311.191012-1-Prike.Liang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 31c96f25-b229-4491-4c40-08dec7941ad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|18002099003|22082099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: O0vvSvk/tqFZ5p6wh4KkUV2enYj0IdodvpUlrYaTi0zt/fY7u8iEJDyLchDOTaMTPZMKZ2wayPLwM++GN0gDQYuVee6uWNpdYx2cAQEfwiCUUC2dW+Vaq06fNZlDJCWb3rOuYn/PujbMTZJlO6Y3REtrFx1U0ECHsGd5UAmb+KAaHMEB9zAQq97bUV5RnJB9lROSGlx4qOPiv76AJBpq12ihudnRKjHn219Yt9SEjPBr1uLhIZtsyi3c9tMC3MkGCll+zblZmaMDRq+cbospciY66wO0UduFlt5uaFQUN4gTWL0E1NHtFH06s5C4EjLThbGXIYj9ODAhYUj55S7h9t2+a86eLdFI5UQajnhPus3uOvTaeSe4u/LKbq729yQXP5BDGpLnb8JVisQcfj+Q4PaAbH7pjlaS9Qji7oM+YAS3Ul7SDNLqBL7LeNpoRRcLzzyanMTc7dkCXynXIDy3EvCQ2k6V7NJwEsXPKHDwt2Y6zymwQNU2bHgN0yJ/F6W9DjVJkp7bB1uB1J/0lQbP3I30psKC8oIK+Wo/vpwyNQMmEGopMo7KIIyt0TI5oEpcFX+8GmvKHK4xdouw0bbUZHMncx1qsV8QBOcpNn/nz+jw1beCjYriKnLfgbY7XUQ0X9CeOASqlYhJH0X2EFa6cR07PSCdR25UjggkKC42Oo5nSiEd8o3Te7wDCZVs60AUX3nTEwkL2CWploS0+h+zp9hFVWx44Cbv2xsrtvHpcbs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xBJr04+JVkGBnyeE2eDlO6fN4ZqYtM7I4XA1asmRdEe+/Z0/vYWwtZc8+NzK4f0KEE+C2M6rbPGPUjKLyzJiJZaBwohXtEJFot+X4lvdH0P99azAshKyQVaCKvCt9bm93MKF5grTRB1OLVnQU0YqvXbAZdHruFL+kWwGYx5eCmfgp7kqQqZXZQyZae+k3d7phu1HEoPXEaJMOlSFok97M04bhVez/B6a6SilkrpQdOkKe9Gy8qTHdWFzAFC0ZTF64s4FqRkTS7aatF48p+xyvPNocibOQVAujWTBkf9S2JAZ0YIjob9Lc5kwEUr0vTceSAW04EYbyulcdEk7DzubizKKYbuKwOqajfABDQfSEbBwFTXOZ/BdryFa41m8zOHYu1HpQu3CCcE/B2GRVIET7M6oW8znp0zLvL3xCsBr+JYgnf3paaW2AVH+K/PB5mBP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:33:25.2032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c96f25-b229-4491-4c40-08dec7941ad5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Prike.Liang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF8EF66FE55

From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Add ftrace events for tracking the userq fence emit, signal
and queue state transition.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Co-developed-by: Prike Liang <Prike.Liang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     | 113 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     |  21 ++++
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   |  12 +-
 3 files changed, 143 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index df98be22f1f5..9f8506f04e9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -28,6 +28,8 @@
 #include <linux/types.h>
 #include <linux/tracepoint.h>
 
+#include "amdgpu_userq_fence.h"
+
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM amdgpu
 #define TRACE_INCLUDE_FILE amdgpu_trace
@@ -636,6 +638,117 @@ DEFINE_EVENT(amdgpu_userq_queue_result, amdgpu_userq_destroy_end,
 	     TP_PROTO(struct amdgpu_usermode_queue *queue, int result),
 	     TP_ARGS(queue, result));
 
+TRACE_EVENT(amdgpu_userq_emit_fence,
+	    TP_PROTO(struct device *device, struct amdgpu_usermode_queue *queue, struct amdgpu_userq_fence *fence),
+	    TP_ARGS(device, queue, fence),
+	    TP_STRUCT__entry(
+			     __field(u64, fence_context)
+			     __field(u64, fence_seqno)
+			     __string(dev, dev_name(device))
+			     __field(u64, doorbell_index)
+			     __field(u64, client_id)
+			     __field(u32, queue_type)
+			     ),
+	    TP_fast_assign(
+			   __entry->fence_context = fence->base.context;
+			   __entry->fence_seqno = fence->base.seqno;
+			   __assign_str(dev);
+			   __entry->doorbell_index = queue->doorbell_index;
+			   __entry->client_id = queue->userq_mgr->file->client_id;
+			   __entry->queue_type = queue->queue_type;
+			   ),
+	    TP_printk("dev=%s, client_id=%llu, type=%u, doorbell=%llu, fence=%llu:%llu",
+		      __get_str(dev), __entry->client_id, __entry->queue_type, __entry->doorbell_index,
+		      __entry->fence_context,
+		      __entry->fence_seqno)
+);
+
+TRACE_EVENT(amdgpu_userq_run_queue,
+	    TP_PROTO(struct device *device,
+		     struct amdgpu_usermode_queue *queue),
+	    TP_ARGS(device, queue),
+	    TP_STRUCT__entry(__field(u64, context)
+			     __string(dev, dev_name(device))
+			     __field(u64, doorbell_index)
+			     __field(u64, client_id)
+			     __field(u32, queue_type)
+			     ),
+	    TP_fast_assign(__assign_str(dev);
+			   __entry->doorbell_index = queue->doorbell_index;
+			   __entry->queue_type = queue->queue_type;
+			   __entry->client_id = queue->userq_mgr->file->client_id;
+			   __entry->context = queue->fence_drv->context;
+			  ),
+	    TP_printk("dev=%s, client_id=%llu, type=%u, doorbell=%llu, context=%llu",
+		      __get_str(dev), __entry->client_id, __entry->queue_type,
+		      __entry->doorbell_index, __entry->context)
+);
+
+TRACE_EVENT(amdgpu_userq_wait_deps,
+	    TP_PROTO(struct device *device, struct amdgpu_usermode_queue *queue, struct amdgpu_userq_fence *dep),
+	    TP_ARGS(device, queue, dep),
+	    TP_STRUCT__entry(
+			     __field(u64, context)
+			     __field(u64, dep_context)
+			     __field(u64, dep_seqno)
+			     __string(dev, dev_name(device))
+			     __field(u64, doorbell_index)
+			     __field(u64, client_id)
+			     __field(u32, queue_type)
+			     ),
+	    TP_fast_assign(
+			   __assign_str(dev);
+			   __entry->doorbell_index = queue->doorbell_index;
+			   __entry->queue_type = queue->queue_type;
+			   __entry->client_id = queue->userq_mgr->file->client_id;
+			   __entry->context = queue->fence_drv->context;
+			   __entry->dep_context = dep->base.context;
+			   __entry->dep_seqno = dep->base.seqno;
+			   ),
+	    TP_printk("dev=%s, client_id=%llu, type=%u, doorbell=%llu, context=%llu depends on fence=%llu:%llu",
+		      __get_str(dev), __entry->client_id, __entry->queue_type, __entry->doorbell_index, __entry->context,
+		      __entry->dep_context,
+		      __entry->dep_seqno)
+);
+
+TRACE_EVENT(amdgpu_userq_state_start,
+	    TP_PROTO(struct amdgpu_usermode_queue *queue),
+	    TP_ARGS(queue),
+	    TP_STRUCT__entry(
+			     __field(u64, doorbell_index)
+			     __field(u64, client_id)
+			     __field(u32, queue_type)
+			     __field(u32, from)
+			     ),
+	    TP_fast_assign(
+			   __entry->doorbell_index = queue->doorbell_index;
+			   __entry->queue_type = queue->queue_type;
+			   __entry->client_id = queue->userq_mgr->file->client_id;
+			   __entry->from = queue->state;
+			   ),
+	    TP_printk("client_id=%llu, type=%u, doorbell=%llu, from=%d",
+		      __entry->client_id, __entry->queue_type, __entry->doorbell_index, __entry->from)
+);
+
+TRACE_EVENT(amdgpu_userq_state_changed,
+	    TP_PROTO(struct amdgpu_usermode_queue *queue, enum amdgpu_userq_state new_state),
+	    TP_ARGS(queue, new_state),
+	    TP_STRUCT__entry(
+			     __field(u64, doorbell_index)
+			     __field(u64, client_id)
+			     __field(u32, queue_type)
+			     __field(u32, to)
+			     ),
+	    TP_fast_assign(
+			   __entry->doorbell_index = queue->doorbell_index;
+			   __entry->queue_type = queue->queue_type;
+			   __entry->client_id = queue->userq_mgr->file->client_id;
+			   __entry->to = new_state;
+			   ),
+	    TP_printk("client_id=%llu, type=%u, doorbell=%llu, to=%d",
+		      __entry->client_id, __entry->queue_type, __entry->doorbell_index, __entry->to)
+);
+
 #undef AMDGPU_JOB_GET_TIMELINE_NAME
 #endif
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 64b9127ef931..ede2263d8458 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -294,11 +294,15 @@ static int amdgpu_userq_preempt_helper(struct amdgpu_usermode_queue *queue)
 	int r;
 
 	if (queue->state == AMDGPU_USERQ_STATE_MAPPED) {
+		trace_amdgpu_userq_state_start(queue);
+
 		r = userq_funcs->preempt(queue);
 		if (r) {
+			trace_amdgpu_userq_state_changed(queue, AMDGPU_USERQ_STATE_HUNG);
 			queue->state = AMDGPU_USERQ_STATE_HUNG;
 			return r;
 		} else {
+			trace_amdgpu_userq_state_changed(queue, AMDGPU_USERQ_STATE_PREEMPTED);
 			queue->state = AMDGPU_USERQ_STATE_PREEMPTED;
 		}
 	}
@@ -314,10 +318,14 @@ static int amdgpu_userq_restore_helper(struct amdgpu_usermode_queue *queue)
 	int r = 0;
 
 	if (queue->state == AMDGPU_USERQ_STATE_PREEMPTED) {
+		trace_amdgpu_userq_state_start(queue);
+
 		r = userq_funcs->restore(queue);
 		if (r) {
+			trace_amdgpu_userq_state_changed(queue, AMDGPU_USERQ_STATE_HUNG);
 			queue->state = AMDGPU_USERQ_STATE_HUNG;
 		} else {
+			trace_amdgpu_userq_state_changed(queue, AMDGPU_USERQ_STATE_MAPPED);
 			queue->state = AMDGPU_USERQ_STATE_MAPPED;
 		}
 	}
@@ -335,12 +343,15 @@ static int amdgpu_userq_unmap_helper(struct amdgpu_usermode_queue *queue)
 
 	if ((queue->state == AMDGPU_USERQ_STATE_MAPPED) ||
 	    (queue->state == AMDGPU_USERQ_STATE_PREEMPTED)) {
+		trace_amdgpu_userq_state_start(queue);
 
 		r = userq_funcs->unmap(queue);
 		if (r) {
+			trace_amdgpu_userq_state_changed(queue, AMDGPU_USERQ_STATE_HUNG);
 			queue->state = AMDGPU_USERQ_STATE_HUNG;
 			return r;
 		} else {
+			trace_amdgpu_userq_state_changed(queue, AMDGPU_USERQ_STATE_UNMAPPED);
 			queue->state = AMDGPU_USERQ_STATE_UNMAPPED;
 		}
 	}
@@ -357,11 +368,15 @@ static int amdgpu_userq_map_helper(struct amdgpu_usermode_queue *queue)
 	int r;
 
 	if (queue->state == AMDGPU_USERQ_STATE_UNMAPPED) {
+		trace_amdgpu_userq_state_start(queue);
+
 		r = userq_funcs->map(queue);
 		if (r) {
+			trace_amdgpu_userq_state_changed(queue, AMDGPU_USERQ_STATE_HUNG);
 			queue->state = AMDGPU_USERQ_STATE_HUNG;
 			return r;
 		} else {
+			trace_amdgpu_userq_state_changed(queue, AMDGPU_USERQ_STATE_MAPPED);
 			queue->state = AMDGPU_USERQ_STATE_MAPPED;
 		}
 	}
@@ -900,6 +915,7 @@ amdgpu_userq_restore_all(struct amdgpu_userq_mgr *uq_mgr)
 		if (!amdgpu_userq_buffer_vas_mapped(queue)) {
 			drm_file_err(uq_mgr->file,
 				     "trying restore queue without va mapping\n");
+			trace_amdgpu_userq_state_changed(queue, AMDGPU_USERQ_STATE_INVALID_VA);
 			queue->state = AMDGPU_USERQ_STATE_INVALID_VA;
 			continue;
 		}
@@ -1392,12 +1408,14 @@ void amdgpu_userq_pre_reset(struct amdgpu_device *adev)
 		if (queue->state != AMDGPU_USERQ_STATE_MAPPED)
 			continue;
 
+		trace_amdgpu_userq_state_start(queue);
 		userq_funcs = adev->userq_funcs[queue->queue_type];
 		userq_funcs->unmap(queue);
 		/* just mark all queues as hung at this point.
 		 * if unmap succeeds, we could map again
 		 * in amdgpu_userq_post_reset() if vram is not lost
 		 */
+		trace_amdgpu_userq_state_changed(queue, AMDGPU_USERQ_STATE_HUNG);
 		queue->state = AMDGPU_USERQ_STATE_HUNG;
 		amdgpu_userq_fence_driver_force_completion(queue);
 	}
@@ -1416,6 +1434,8 @@ int amdgpu_userq_post_reset(struct amdgpu_device *adev, bool vram_lost)
 
 	xa_for_each(&adev->userq_doorbell_xa, queue_id, queue) {
 		if (queue->state == AMDGPU_USERQ_STATE_HUNG && !vram_lost) {
+			trace_amdgpu_userq_state_start(queue);
+
 			userq_funcs = adev->userq_funcs[queue->queue_type];
 			/* Re-map queue */
 			r = userq_funcs->map(queue);
@@ -1423,6 +1443,7 @@ int amdgpu_userq_post_reset(struct amdgpu_device *adev, bool vram_lost)
 				dev_err(adev->dev, "Failed to remap queue %ld\n", queue_id);
 				continue;
 			}
+			trace_amdgpu_userq_state_changed(queue, AMDGPU_USERQ_STATE_MAPPED);
 			queue->state = AMDGPU_USERQ_STATE_MAPPED;
 		}
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index c0d68863fa17..95ee133f749e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -30,7 +30,7 @@
 #include <drm/drm_syncobj.h>
 
 #include "amdgpu.h"
-#include "amdgpu_userq_fence.h"
+#include "amdgpu_trace.h"
 
 #define AMDGPU_USERQ_MAX_HANDLES	(1U << 16)
 
@@ -528,6 +528,8 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 	/* Create the new fence */
 	amdgpu_userq_fence_init(queue, fence, wptr);
 
+	trace_amdgpu_userq_emit_fence(dev->dev, queue, fence);
+
 	mutex_unlock(&userq_mgr->userq_mutex);
 
 	/*
@@ -701,7 +703,7 @@ amdgpu_userq_wait_add_fence(struct drm_amdgpu_userq_wait *wait_info,
 }
 
 static int
-amdgpu_userq_wait_return_fence_info(struct drm_file *filp,
+amdgpu_userq_wait_return_fence_info(struct drm_device *dev, struct drm_file *filp,
 				    struct drm_amdgpu_userq_wait *wait_info,
 				    u32 *syncobj_handles, u64 *timeline_points,
 				    u32 *timeline_handles,
@@ -835,6 +837,8 @@ amdgpu_userq_wait_return_fence_info(struct drm_file *filp,
 		goto free_fences;
 	}
 
+	trace_amdgpu_userq_run_queue(dev->dev, waitq);
+
 	for (i = 0, cnt = 0; i < num_fences; i++) {
 		struct amdgpu_userq_fence_driver *fence_drv;
 		struct amdgpu_userq_fence *userq_fence;
@@ -869,6 +873,8 @@ amdgpu_userq_wait_return_fence_info(struct drm_file *filp,
 
 		amdgpu_userq_fence_driver_get(fence_drv);
 
+		trace_amdgpu_userq_wait_deps(dev->dev, waitq, userq_fence);
+
 		/* Store drm syncobj's gpu va address and value */
 		fence_info[cnt].va = fence_drv->va;
 		fence_info[cnt].value = fences[i]->seqno;
@@ -969,7 +975,7 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 						   gobj_write,
 						   gobj_read);
 	} else {
-		r = amdgpu_userq_wait_return_fence_info(filp, wait_info,
+		r = amdgpu_userq_wait_return_fence_info(dev, filp, wait_info,
 							syncobj_handles,
 							timeline_points,
 							timeline_handles,
-- 
2.34.1

