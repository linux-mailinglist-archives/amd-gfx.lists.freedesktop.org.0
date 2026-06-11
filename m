Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kF1xG9pyKmr8pQMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 10:33:30 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BA366FE4D
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 10:33:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=UjWcaEjs;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F22F10ED83;
	Thu, 11 Jun 2026 08:33:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012056.outbound.protection.outlook.com [52.101.48.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CB210ED83
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 08:33:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GECozz1yDHtaiQCcZf1grUh+K8voXpZJzfGMGST/ZCcWxK5cGqpWJ95XFlvWSXv8EYunFqkt29wSXUtxxXbuA/H78+JiFkbVhcWPUlhc8+bU001NxWOaIRb1DuJOSi6RZgOSfi6sI0cfxjLqlq1koMr05AXHS5wCq+UfE2KH1FWqF3K/pv+tb+/uWznNqFXVtF7alEcJRBbVVIB6e9yXqFKL7b9ScXWzE8emV5l0Uz85VZ3plb096HvpfZGcLYtqeCTAS9ior0O74PxEw5y6GfvlweLf/DGYX1F+zGQZYkPJMdJ/OqRMg14yesiMA5tXCObxkb1/QBjYp/AMHbzM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2w+UopjVQxYGu5ArGlcCG5ivNFbPSwR4ukHDjNhD7s=;
 b=xBnhAylKyKLp3oY1vtXAfNJoIlF54S1/x1ErEbAMbK+YD8ivoBhN4P7tf8tlHwiIH0BGUugkv3CSSvRQJT+eyg29ZJ+8f82H/yf2IGb96q9kZGZ7QSjT+kWkWyPSJeXSMtAv5ClPN+zH1RvUO+nbuCClRvnf8M7hNkv5OVi0UFeyPEv/WI8EuGg61BH16o1UxePUDjxL9c8IM9M1C6l0fePJDsCIo1Ul21vNQuGXeZ6FFVQSd7BLLqrkyz69vl6zVfFDpliNS5VQZjoiL56A8s1be+FDy8OA52Oumyq/b3KuU1ymtTQp9/+VgpJ3ZQmm2zCFb7v7L86vp+DX2Ppzpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2w+UopjVQxYGu5ArGlcCG5ivNFbPSwR4ukHDjNhD7s=;
 b=UjWcaEjshrOvx6/nwSxgNPpip8b+KA7SJHXtZR4rz3D3TVsixG7cdk57b/M5FhEYXzR8vgx26ouCab/I3I2jeVPE6bu4/1X3DHP71NeAehixxz1ZJFJ7ju4cwKfBovzzX6bwIlIQAAjP66Ak5JH6yXXARKfMoGEN/r8jKEyl0+E=
Received: from MN2PR18CA0001.namprd18.prod.outlook.com (2603:10b6:208:23c::6)
 by SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 08:33:23 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::4c) by MN2PR18CA0001.outlook.office365.com
 (2603:10b6:208:23c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 08:33:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 08:33:23 +0000
Received: from prike-code-pc.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 03:33:21 -0500
From: Prike Liang <Prike.Liang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, <Christian.Koenig@amd.com>,
 <Pierre-eric.Pelloux-prayer@amd.com>, Prike Liang <Prike.Liang@amd.com>
Subject: [PATCH v2 2/3] drm/amdgpu: add userq create and destroy tracepoints
Date: Thu, 11 Jun 2026 16:33:10 +0800
Message-ID: <20260611083311.191012-2-Prike.Liang@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea6b80d-9afd-4879-6dd8-08dec79419a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: w2OwaJzWT8NXBNcnuz9l/ADLHmPGm/2FOpWazfnPd7pgpZrtQ7bReThYqnrYIAizj45cERKJVi7vXnlba2UPUoZxwRNByoqjxHPteaxU/b6gP03n+KF5PQyqfECC0JmMLbUOA/xz7qsdffTpJwtqr27tFMlqVG+ehc31RDMXMb2esuJAcu4rYcEmMshtR0B5TNC5GF9t8CncfyxSW226VJ2NueUmhIsuUeOH36HstRigKzBiKV+M+G6e9UiqkuKdeHv+uNwU7EKVE/9RqktcESeKookZAVKQcbsg8p6YE5vC0tDv9o4YgjD7Hz6iQ+xjUBujnr1wj9aVlPvJ/bLgScXaHLbkwvZU2xhRiH/ekTpILqHMgO6/lYyiy+aYpF4pjcKUym8WdXFgYnuEOIllhX3HuGoE29u2bMWrYBc9BfzfraKsWxcyhzVNeX1tIqse3wVpF2B2cuXcbGLxHSO7TBRB8lKss31M1n43O+uzvW0nBXI4tta3o2E5RapP0Ujw3mJy5l5xqejrYOek7cTkYLEzRq2Nzh4ch0+agf7GDDV68CgD1ai0WkoaklmpH8SnPJES5qpLIvmkblPYsppgbhHzjxYMzSCtaNe38+Z1rAEizAscMxo9+UQ8H1K491g1eXrzKnioboLlUV98CQlf7cEyganb4oNZqZMLrjjNAcRpF0y6u92c98imcC3UXAzIOuL8EFC4ZhaexwmqvXwsOkt5uxeWcrnS3gmbkKHM1y4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sHfbfpI2+O2Sgam6aIXbBSXSB9b1A6zzdMW1kQ4L9LNVl/MZkW9tXcpwRdYuLsw2/OWbP1UcCQJ+JtxDK1y2/cJ8laprHCmEeVYTb5vUL3Gx0T0JLlD3broiRhCUa9L0SIamwQ+9p1AaCUyLgHVryNBLK6DBStpkwDtM+IxQKXG3Wg9YwXIO2AkSxVxZaylww9TI0rsP9kiDPqvJgGaM2ugFx6RSrqEfsNwhy0+11fcSh25+CMchU6Q0cYYYIyGV17Rp1Ny3VZvU32utWASesJLpmwqq0gFML27/imfZfmfEBNkN1CIdGUvsPWV/EcdvW++sWOuMB9B3wT+UQMz/FIRAM6py6mxebBN8omP9YEjyADop5D6zk7ThLxCm8H+UWGwrHW8mZeRo1HoV1vSl2di5wQNfQfO0ILFJdFnDJmEGsMDHqZzQlV8OgUK60+4S
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:33:23.1915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea6b80d-9afd-4879-6dd8-08dec79419a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885
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
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Prike.Liang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3BA366FE4D

Add ftrace events around user queue creation and destruction to profile
queue setup and teardown latency.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 58 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c |  9 ++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index d13e64a69e25..df98be22f1f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -578,6 +578,64 @@ TRACE_EVENT(amdgpu_reset_reg_dumps,
 		      __entry->value)
 );
 
+DECLARE_EVENT_CLASS(amdgpu_userq_queue,
+	    TP_PROTO(struct amdgpu_usermode_queue *queue),
+	    TP_ARGS(queue),
+	    TP_STRUCT__entry(
+			     __field(void *, queue)
+			     __field(u64, doorbell_index)
+			     __field(int, queue_type)
+			     __field(int, state)
+			     __field(u32, xcp_id)
+			     ),
+	    TP_fast_assign(
+			   __entry->queue = queue;
+			   __entry->doorbell_index = queue->doorbell_index;
+			   __entry->queue_type = queue->queue_type;
+			   __entry->state = queue->state;
+			   __entry->xcp_id = queue->xcp_id;
+			   ),
+	    TP_printk("queue=%p, doorbell=%llu, type=%d, state=%d, xcp_id=%u",
+		      __entry->queue, __entry->doorbell_index,
+		      __entry->queue_type, __entry->state, __entry->xcp_id)
+);
+DEFINE_EVENT(amdgpu_userq_queue, amdgpu_userq_create_start,
+	     TP_PROTO(struct amdgpu_usermode_queue *queue),
+	     TP_ARGS(queue));
+DEFINE_EVENT(amdgpu_userq_queue, amdgpu_userq_destroy_start,
+	     TP_PROTO(struct amdgpu_usermode_queue *queue),
+	     TP_ARGS(queue));
+DECLARE_EVENT_CLASS(amdgpu_userq_queue_result,
+	    TP_PROTO(struct amdgpu_usermode_queue *queue, int result),
+	    TP_ARGS(queue, result),
+	    TP_STRUCT__entry(
+			     __field(void *, queue)
+			     __field(u64, doorbell_index)
+			     __field(int, queue_type)
+			     __field(int, state)
+			     __field(u32, xcp_id)
+			     __field(int, result)
+			     ),
+	    TP_fast_assign(
+			   __entry->queue = queue;
+			   __entry->doorbell_index = queue->doorbell_index;
+			   __entry->queue_type = queue->queue_type;
+			   __entry->state = queue->state;
+			   __entry->xcp_id = queue->xcp_id;
+			   __entry->result = result;
+			   ),
+	    TP_printk("queue=%p, doorbell=%llu, type=%d, state=%d, xcp_id=%u, result=%d",
+		      __entry->queue, __entry->doorbell_index,
+		      __entry->queue_type, __entry->state,
+		      __entry->xcp_id, __entry->result)
+);
+DEFINE_EVENT(amdgpu_userq_queue_result, amdgpu_userq_create_end,
+	     TP_PROTO(struct amdgpu_usermode_queue *queue, int result),
+	     TP_ARGS(queue, result));
+DEFINE_EVENT(amdgpu_userq_queue_result, amdgpu_userq_destroy_end,
+	     TP_PROTO(struct amdgpu_usermode_queue *queue, int result),
+	     TP_ARGS(queue, result));
+
 #undef AMDGPU_JOB_GET_TIMELINE_NAME
 #endif
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index c1175cb6d242..64b9127ef931 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -33,6 +33,7 @@
 #include "amdgpu_userq.h"
 #include "amdgpu_hmm.h"
 #include "amdgpu_userq_fence.h"
+#include "amdgpu_trace.h"
 
 u32 amdgpu_userq_get_supported_ip_mask(struct amdgpu_device *adev)
 {
@@ -507,6 +508,8 @@ amdgpu_userq_destroy(struct amdgpu_userq_mgr *uq_mgr, struct amdgpu_usermode_que
 	const struct amdgpu_userq_funcs *uq_funcs = adev->userq_funcs[queue->queue_type];
 	int r = 0;
 
+	trace_amdgpu_userq_destroy_start(queue);
+
 	cancel_delayed_work_sync(&uq_mgr->resume_work);
 
 	/* Cancel any pending hang detection work and cleanup */
@@ -532,6 +535,7 @@ amdgpu_userq_destroy(struct amdgpu_userq_mgr *uq_mgr, struct amdgpu_usermode_que
 	amdgpu_bo_unreserve(queue->db_obj.obj);
 	amdgpu_bo_unref(&queue->db_obj.obj);
 
+	trace_amdgpu_userq_destroy_end(queue, r);
 	kfree(queue);
 
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
@@ -683,6 +687,7 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	}
 
 	queue->doorbell_index = index;
+	trace_amdgpu_userq_create_start(queue);
 	r = uq_funcs->mqd_create(queue, &args->in);
 	if (r) {
 		drm_file_err(uq_mgr->file, "Failed to create Queue\n");
@@ -706,6 +711,7 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 		r = amdgpu_userq_map_helper(queue);
 		if (r) {
 			drm_file_err(uq_mgr->file, "Failed to map Queue\n");
+			trace_amdgpu_userq_create_end(queue, r);
 			mutex_unlock(&uq_mgr->userq_mutex);
 			goto erase_doorbell;
 		}
@@ -722,11 +728,13 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 		 * This drops the last reference which should take care of
 		 * all cleanup.
 		 */
+		trace_amdgpu_userq_create_end(queue, r);
 		amdgpu_userq_put(queue);
 		return r;
 	}
 
 	amdgpu_debugfs_userq_init(filp, queue, qid);
+	trace_amdgpu_userq_create_end(queue, 0);
 	args->out.queue_id = qid;
 	return 0;
 
@@ -742,6 +750,7 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 free_fence_drv:
 	amdgpu_userq_fence_driver_free(queue);
 free_queue:
+	trace_amdgpu_userq_create_end(queue, r);
 	kfree(queue);
 err_pm_runtime:
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
-- 
2.34.1

