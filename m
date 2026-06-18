Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GqrYFkqGM2qUDAYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2026 07:46:50 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054D469DBBD
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2026 07:46:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=ZGPxG+yh;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C1610EC57;
	Thu, 18 Jun 2026 05:46:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013067.outbound.protection.outlook.com
 [40.93.196.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B76610EC57
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jun 2026 05:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOXpWkqbfqygTk7+60YVO81IgA/I/XVfRoPt/fYLkIIJsD2HJ/F9t0xZKke56Dt/fh/xnRR/cL8p0XmQ8HLx8yAjET8wqnbIfJXky4Kp/LuCJdo66MLYF5ozAcCfTIAsh8SdBIm+Z7FUT1NGfMJA5ByT+JnVUJ9toa4b7C/40npa3PiUNTBJrjtYGKDN21hFlEvNQPbSPeR3xmeirssxR9brdioPRkc1Qtt8PKAVK+V1Te4FasNcj1/eIUh/MONaM00heOSaQ20YU2q8vfmT8ORSlMWW/83w2hCo0pFlmQRooakFu1AXtGyvSgcUyz0DM025TbslcHKkVFYjMq4HGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MQrd4MLzp7i+n10vTfsB8463Xgr8ZDdyVB+0teRzmM=;
 b=kDfMkHqAUMYjiToYtAqisGeibBVTjATMcz3n5z+Je5qPBZvYACOqQrK3k3AcRxspFSs+IcKXa86vD9oxvNslcP4/n7WI3h5fJvxZdAVJrEWw4FguZOXNhY/ihrQRsYlIwWYanKs2ya3tzKGfaBRt0bR3e/lDeWusVa9VvDt+KIsRD/DTNnkspELX9pYX9im+oHRWZao7Hg6yZu7wlBoAX5+/zGXRXaxW+7sh2FUs1JPUdZ9lrQTvuTwzd3/ppm6U0hlzzUFIPhMwNP2WC6a4LYONIVpXgKsTwLYkYvkIsx48oMrGFBbCFtSk3okMAr0l/VCyoXgieMg7Zl1H/k/t5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MQrd4MLzp7i+n10vTfsB8463Xgr8ZDdyVB+0teRzmM=;
 b=ZGPxG+yhLtPF3Z6Q3Zorv5VqtWH+NwxhgAAWWYm2F3BKQH2dq0HLPF2QddxCBIKcHBRYmSOBYgOdBKy6lpJwjAlHSTvu/HrxtgbylVpWoIGHtiq3qbalajzyNiyj4xaSP11ehPPvlEAM2++cd07y/CYUWvZB4MZPfhqhhpVVYOU=
Received: from MW4PR04CA0078.namprd04.prod.outlook.com (2603:10b6:303:6b::23)
 by PH7PR12MB6610.namprd12.prod.outlook.com (2603:10b6:510:212::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 05:46:41 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::ab) by MW4PR04CA0078.outlook.office365.com
 (2603:10b6:303:6b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.12 via Frontend Transport; Thu,
 18 Jun 2026 05:46:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 18 Jun 2026 05:46:40 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Thu, 18 Jun 2026 00:46:39 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v2 2/3] drm/amdgpu: Signal QUEUE_RESET EVENTFD notifications
Date: Thu, 18 Jun 2026 11:16:17 +0530
Message-ID: <20260618054618.2956952-3-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618054618.2956952-1-srinivasan.shanmugam@amd.com>
References: <20260618054618.2956952-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|PH7PR12MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: 5789d668-31cb-4103-fd36-08deccfcf8ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: lz4A7ZBw9OeIMESAI6GXnuieXZvL+pU5epdbYsndzgXLdIDeopkstGRbmRpXR6gey22ID5vdaSlyXbs3OFL3zK6lrGF+WOwtFcjcVQlKZarNJpvJZi5MdFOwMk2B235sWs7EqqJ63b5VBVZmgUHLt3IBLbmdJr6mN609TlmC5fSVpGWuLkw+eIT7Y4p0T7NchxLNwhRo2wXCheTH77aoynJ95rxl7v2qVEzwvz4IGCTAlDq1auIODZFOBzkEUFKT+AkJOnSg8nat45LW5zRLEEjBgZS81KrIUcLnk79RganmH+VvK8x0Xai2uDi2+zo9MXTzHabylL1M41TRhy1Gw4WBz2DMYUDXveK6ISlTYxldc+ORs9seR517IQy62kVcepbYM3Y/kEXb3LZBX8+5dyYSw3FADMka/fDB51Ld0W0i8xzZEJeS6AA08YnbNZo6oCzsWEYffGK7C3GzrTnHy6hFSc2WM2iFRaZCGBeSJXuuVbbrpZ/VQkYgY4yhmy+ayuGrkqu/8CZZbd8nPTyduMjltPstHQcdZ9cDsQZuhaheTOtIFRKjxUrw34QSmf8Mx2IPuw4dJQZ8lRjUelql3yTXO+HtQ+D1/pUmiz9Bg2jQCj7baPOUxpCrx1U4v4dMIs4OtFE8XDIjIEZfslqCVAHO10E+GhQSiHpw25aA9MNwGbmkI60ufXjG1c2MD20lvVLh2dPqd90UU6ZFEy5xr18jbuZxzq+oJv8VcBq0/M4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CQ+BBGnwAcak1YCgM7XOtKXPhhoYHool0ot06LA9zKwxbJ0otfY4poFT8XQgdXMjz0FUpMOUk0GwXeFjxRWOb64I1ZosRjzT2H4UUBvP+fP7wlQr6KXK3Q4q17ZJPLf3oYtDNWXZI+n09/twehiP5HyjN/Pz1gB8mYgsib1tF2E7YZwvN0MgqwDtt930I/oHq7bqdKwgEJfStxATCjz0Pv/1SWDkNNu4CoYhVdtML9HG9zfvNz6v4djAFLOgEmuCviPB85EgExZLYJJH0srNWxbGbcrb8yHZn9mR6s2y502DC7ymorjEW1TObxXVnfZO/SvUUHdQ3k8IloLOZRIrRnngK8N9MtOuoJ/enFtk51b4Wu6B5cRvetaRiHTy4+vzPdecKtGSjzM6lt7BZ1OTnFGG1VLAxfJN3YSbpZe9evBegPMQtbM8PRXPNMeDrRWS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 05:46:40.9721 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5789d668-31cb-4103-fd36-08deccfcf8ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6610
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 054D469DBBD

Signal QUEUE_RESET EVENTFD subscriptions when hung user queues are
detected.

MES reports the doorbell indices of hung queues. Use the existing
doorbell-to-queue mapping to find the affected queue and notify matching
EVENTFD subscribers.

Move the queue reset handling into amdgpu_userq.c so the queue lookup
and queue handling are performed in one place. This avoids scanning all
queues to find a matching doorbell.

EVENTFD remains notification-only.

v2: (per Christian)
 - Use the doorbell xarray to look up affected queues instead of scanning
   all queues.
 - Move queue reset handling into amdgpu_userq.c.
 - Consolidate queue state updates, EVENTFD signaling, and fence
   completion in a single helper.

Cc: Alex Deucher <alexander.deucher@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c  | 39 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h  |  2 ++
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c | 21 ++++--------
 3 files changed, 48 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index ab3f6509a5bc..3ccaa571d90b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -241,7 +241,46 @@ void amdgpu_userq_process_fence_irq(struct amdgpu_device *adev, u32 doorbell)
 	xa_unlock_irqrestore(xa, flags);
 }
 
+bool amdgpu_userq_handle_hung_doorbell(struct amdgpu_device *adev,
+				       int queue_type, u32 doorbell)
+{
+	struct xarray *xa = &adev->userq_doorbell_xa;
+	struct amdgpu_usermode_queue *queue;
+	struct amdgpu_eventfd_mgr *eventfd_mgr;
+	unsigned long flags;
+	bool handled = false;
+
+	xa_lock_irqsave(xa, flags);
+	queue = xa_load(xa, doorbell);
+	if (queue)
+		kref_get(&queue->refcount);
+	xa_unlock_irqrestore(xa, flags);
 
+	if (!queue)
+		return false;
+
+	if (queue->queue_type != queue_type)
+		goto out;
+
+	queue->state = AMDGPU_USERQ_STATE_HUNG;
+
+	eventfd_mgr = amdgpu_userq_eventfd_mgr(queue->userq_mgr);
+	amdgpu_eventfd_signal(eventfd_mgr,
+			      DRM_AMDGPU_EVENT_TYPE_QUEUE_RESET,
+			      queue);
+
+	amdgpu_userq_fence_driver_force_completion(queue);
+
+	drm_dev_wedged_event(adev_to_drm(adev),
+			     DRM_WEDGE_RECOVERY_NONE, NULL);
+
+	handled = true;
+
+out:
+	amdgpu_userq_put(queue);
+
+	return handled;
+}
 
 int amdgpu_userq_input_va_validate(struct amdgpu_device *adev,
 				   struct amdgpu_usermode_queue *queue,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
index e1a7d0dbc436..73fec6b623e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
@@ -173,6 +173,8 @@ void amdgpu_userq_pre_reset(struct amdgpu_device *adev);
 int amdgpu_userq_post_reset(struct amdgpu_device *adev, bool vram_lost);
 void amdgpu_userq_start_hang_detect_work(struct amdgpu_usermode_queue *queue);
 void amdgpu_userq_process_fence_irq(struct amdgpu_device *adev, u32 doorbell);
+bool amdgpu_userq_handle_hung_doorbell(struct amdgpu_device *adev,
+				       int queue_type, u32 doorbell);
 
 int amdgpu_userq_input_va_validate(struct amdgpu_device *adev,
 				   struct amdgpu_usermode_queue *queue,
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
index e9189f07c6dc..befe83a5b8eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
@@ -210,9 +210,7 @@ static int mes_userq_detect_and_reset(struct amdgpu_device *adev,
 {
 	int db_array_size = amdgpu_mes_get_hung_queue_db_array_size(adev);
 	struct mes_detect_and_reset_queue_input input;
-	struct amdgpu_usermode_queue *queue;
 	unsigned int hung_db_num = 0;
-	unsigned long queue_id;
 	u32 db_array[8];
 	bool found_hung_queue = false;
 	int r, i;
@@ -232,19 +230,14 @@ static int mes_userq_detect_and_reset(struct amdgpu_device *adev,
 						    &hung_db_num, db_array, 0);
 	amdgpu_mes_unlock(&adev->mes);
 	if (r) {
-		dev_err(adev->dev, "Failed to detect and reset queues, err (%d)\n", r);
+		dev_err(adev->dev,
+			"Failed to detect and reset queues, err (%d)\n", r);
 	} else if (hung_db_num) {
-		xa_for_each(&adev->userq_doorbell_xa, queue_id, queue) {
-			if (queue->queue_type == queue_type) {
-				for (i = 0; i < hung_db_num; i++) {
-					if (queue->doorbell_index == db_array[i]) {
-						queue->state = AMDGPU_USERQ_STATE_HUNG;
-						found_hung_queue = true;
-						atomic_inc(&adev->gpu_reset_counter);
-						amdgpu_userq_fence_driver_force_completion(queue);
-						drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
-					}
-				}
+		for (i = 0; i < hung_db_num; i++) {
+			if (amdgpu_userq_handle_hung_doorbell(adev, queue_type,
+							      db_array[i])) {
+				found_hung_queue = true;
+				atomic_inc(&adev->gpu_reset_counter);
 			}
 		}
 	}
-- 
2.34.1

