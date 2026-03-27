Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPzJI8Ndxmm+JAUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 11:36:51 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC081342A9C
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 11:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A97510ECC8;
	Fri, 27 Mar 2026 10:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ld9Cezn7";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010060.outbound.protection.outlook.com
 [40.93.198.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FED10ECC8
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Mar 2026 10:36:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcdGjy1D5v+FZnTs/A9OJXgOYcTMj3659GyDBiOWm0p85z/2HyRELWK+0PXaRDdG8zRQZMDfLmVgsB3RaeY/pKHd1YJ3h+ma0ydi42nkx7iDLx8zhssMGvFRVjXCCcDogTYZntK8H04Z62WBC77gnNWJDeHKBmqwIAfZAhM1aN4OrjSfZxXtKdxeGY1uDkmRIuLnM7FTGqyTkAJAFcNxMA/82NZ/csJZ93jB3bJDpiYjH7U0PJ5oPrLz0hmeh+4yjgG6Jd1/h4lsF5zU+DqB+yQPfQOcV24XZcZ5dH9XH1fIvePX4GXri22EtaxJq6mDb8QgC4oPiSKGvTaRATHBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvnJR0AWcXOavA7Oh9PYZYRvPhiqFFCRzT5F6wbu6yw=;
 b=b6vM9YcM9n8Mv31xLzFfDYW7+ygNjSxMHu6RhbNlECyyXsSeVWVLjiIzr4zYluQVev50VGC+ba4mSTQ4+LH9Row8U4N16awYeRv+iAhZzq7Qn32XzHib7gPO95YtGPJ2SWz/wO6QVOZJp8CA3HrW2l2BvBTKX3drR8xa2Pl344WO/6N73gzfSsGZw6zmBs5fiNxz5dXiX0jLEKUlGFMRJOpmH7zH2EJ13cB7SSXZpPifbm1sJoii3d8Tr58Bx0ldHsa4hStkUwcHHO+SQuqAG3XO2NBCCucLAt25yW/MEVynt3ZwaMXGAM/P4qykuGVXdiIue8Mpqlu71wqNAZN6MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvnJR0AWcXOavA7Oh9PYZYRvPhiqFFCRzT5F6wbu6yw=;
 b=Ld9Cezn7wriNmOe96B6+5Ue3uIa9zNQNv+Ywh5gTiSDOvqoykWtJPGXBWHEubDOxQvcFNxeHngaz5omgQrlPiqteoalJun/VYw0ncZ8b0BeGHNJP1F/in8616Znz6I8/eTVSDNHRLm+vx6XA1cENe+lCEk0MjnAZ/BOm9Ww87qA=
Received: from DSSP220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3d3::10) by
 PH7PR12MB6657.namprd12.prod.outlook.com (2603:10b6:510:1fe::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.11; Fri, 27 Mar 2026 10:36:41 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:8:3d3:cafe::c) by DSSP220CA0007.outlook.office365.com
 (2603:10b6:8:3d3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.24 via Frontend Transport; Fri,
 27 Mar 2026 10:36:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 10:36:40 +0000
Received: from prike-code-pc.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Mar
 2026 05:36:38 -0500
From: Prike Liang <Prike.Liang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, <Christian.Koenig@amd.com>, Prike Liang
 <Prike.Liang@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: rework userq fence driver alloc/destroy
Date: Fri, 27 Mar 2026 18:36:20 +0800
Message-ID: <20260327103621.3374979-1-Prike.Liang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|PH7PR12MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 0704da1e-57f0-4cd6-2a97-08de8becbb70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 1Gk4dVZcMbJORt7Yk2NE8jG3PPQqxbVUlY4sgqGjR6eR62VRI3Jgn/D07+L8GkBpsAcq8ypvy8xFbHcbLe4zGOTdbqNpVALAUrPD/HRQrJlQDfNGGHH8WepwdyJTDqO+QtYm+UbHDgyh2wq+9fZwxVvY7UVP6NIYAKUo9+EPHv8CR4GXOvOG4LyXMjXolfMPlZ/eg5Gksw9mpAc5rvQ9WB5GPVjna7FSWnZM7K7I59hkZ0tVk8uXlQccA8AO44KSM9x2D5XWNjOK/mbXeV1FrXlsnfUPjPsF25iKiik+3HZyDdTMDn3JDCgzKhgZaMTc88hEHIvgjfIUDrSAtoEQcsnsbxsHXUFAxdbG8cXyuOIHpjIlIOiCA+xtRQXwOYQE5Ae1KYqprWVKkeIe6E5UlBkD/7Z6t1UMX2i/7uEz58hin7b7AMlnpEpUpG7zj0z+1QubBRq6hHLP6XqzuvHQqO78IpBOoS27KvmgXL9WxrYHhMNaR+TGqGs3zayB+VJV8JwYwYi3vYs4r+AM8TZEqq5cD5RjWcXGr17gIPEs+b5+o12F1bAARFvwdLFj/wVnSI5URMwnlAHfQsY3/dAX7zsBfCUwE5IkT8b1nGLlQHO98NS5PyVCUH5r27y6pozJ62QUKEnATNrkzG0wA4FtccGavHds8oosugDFcjhxD7QSs7JMlzwE6xMXVum3jwgc3dSAXXJL4d1ocMPRLPsGkneUem4UqdsugGGClx4m+Oe1lmc+XeX4IoDwxPKj2xrurttaEbvghffMEzrQiweL7Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CB7F3XdgN21+c///keHH0ApRTCtOnECzQpQqR7l2n3j+iyT/0pU143vhBdLFTPGwLN9ii1sB8e7EjmXD7yxg+i+IiBt8J9TzWZJ0uvaVy5ZkjCivTxo6nFC6Desat9loadJMJ4OInrLw9Ll89uVQvA9TAFU/Tne5ZjDmHhYlDRw+XPQgi0BJRFWRMU204KBc+Ou82hMon8tfBnWpc5WxxHtoR0Z1YCdcAhkMx1lN3AshtsA5AsTl3oVSGeSVqUhRG0ikB5MPT+nhVBuKnV4Sr6ZgSmzH3Mh8Pq/yuOh+C9DKehiSjS7RpgBuLdPI4fj6eeab9Lb8e/7vPdNuUfPjOFubgCu1zQusbzGaPwy0xKBqqaA/sYxit2SbKF7Zkk3tfEoq/aHJFa6IG4aCFQoZpdkKbGc23h8EInOY5fqWSzmoHaWtQ88n9WPTZ9KowAWR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 10:36:40.5664 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0704da1e-57f0-4cd6-2a97-08de8becbb70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6657
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Prike.Liang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EC081342A9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The correct fix is to tie the global xa entry lifetime to the
queue lifetime: insert in amdgpu_userq_create() and erase in
amdgpu_userq_cleanup(), both at the well-defined doorbell_index key,
making the operation O(1) and resolve the fence driver UAF problem
by binding the userq driver fence to per queue.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  5 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  4 +---
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 20 +------------------
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        | 10 +++++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c        | 10 +++++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c        | 11 +++++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        | 10 +++++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        | 10 +++++-----
 8 files changed, 28 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 49e7881750fa..8bc591deb546 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1045,11 +1045,6 @@ struct amdgpu_device {
 	struct amdgpu_mqd               mqds[AMDGPU_HW_IP_NUM];
 	const struct amdgpu_userq_funcs *userq_funcs[AMDGPU_HW_IP_NUM];
 
-	/* xarray used to retrieve the user queue fence driver reference
-	 * in the EOP interrupt handler to signal the particular user
-	 * queue fence.
-	 */
-	struct xarray			userq_xa;
 	/**
 	 * @userq_doorbell_xa: Global user queue map (doorbell index → queue)
 	 * Key: doorbell_index (unique global identifier for the queue)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 0c0489395edf..a7b519f670a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3757,15 +3757,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	spin_lock_init(&adev->virt.rlcg_reg_lock);
 	spin_lock_init(&adev->wb.lock);
 
-	xa_init_flags(&adev->userq_xa, XA_FLAGS_LOCK_IRQ);
-
 	INIT_LIST_HEAD(&adev->reset_list);
 
 	INIT_LIST_HEAD(&adev->ras_list);
 
 	INIT_LIST_HEAD(&adev->pm.od_kobj_list);
 
-	xa_init(&adev->userq_doorbell_xa);
+	xa_init_flags(&adev->userq_doorbell_xa, XA_FLAGS_LOCK_IRQ);
 
 	INIT_DELAYED_WORK(&adev->delayed_init_work,
 			  amdgpu_device_delayed_init_work_handler);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 6b33c2428b2d..87560c1251d8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -81,7 +81,6 @@ int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
 				    struct amdgpu_usermode_queue *userq)
 {
 	struct amdgpu_userq_fence_driver *fence_drv;
-	unsigned long flags;
 	int r;
 
 	fence_drv = kzalloc(sizeof(*fence_drv), GFP_KERNEL);
@@ -104,19 +103,10 @@ int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
 	fence_drv->context = dma_fence_context_alloc(1);
 	get_task_comm(fence_drv->timeline_name, current);
 
-	xa_lock_irqsave(&adev->userq_xa, flags);
-	r = xa_err(__xa_store(&adev->userq_xa, userq->doorbell_index,
-			      fence_drv, GFP_KERNEL));
-	xa_unlock_irqrestore(&adev->userq_xa, flags);
-	if (r)
-		goto free_seq64;
-
 	userq->fence_drv = fence_drv;
 
 	return 0;
 
-free_seq64:
-	amdgpu_seq64_free(adev, fence_drv->va);
 free_fence_drv:
 	kfree(fence_drv);
 
@@ -187,11 +177,9 @@ void amdgpu_userq_fence_driver_destroy(struct kref *ref)
 	struct amdgpu_userq_fence_driver *fence_drv = container_of(ref,
 					 struct amdgpu_userq_fence_driver,
 					 refcount);
-	struct amdgpu_userq_fence_driver *xa_fence_drv;
 	struct amdgpu_device *adev = fence_drv->adev;
 	struct amdgpu_userq_fence *fence, *tmp;
-	struct xarray *xa = &adev->userq_xa;
-	unsigned long index, flags;
+	unsigned long flags;
 	struct dma_fence *f;
 
 	spin_lock_irqsave(&fence_drv->fence_list_lock, flags);
@@ -208,12 +196,6 @@ void amdgpu_userq_fence_driver_destroy(struct kref *ref)
 	}
 	spin_unlock_irqrestore(&fence_drv->fence_list_lock, flags);
 
-	xa_lock_irqsave(xa, flags);
-	xa_for_each(xa, index, xa_fence_drv)
-		if (xa_fence_drv == fence_drv)
-			__xa_erase(xa, index);
-	xa_unlock_irqrestore(xa, flags);
-
 	/* Free seq64 memory */
 	amdgpu_seq64_free(adev, fence_drv->va);
 	kfree(fence_drv);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 78d1f3eb522e..c0921977b853 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -6488,14 +6488,14 @@ static int gfx_v11_0_eop_irq(struct amdgpu_device *adev,
 	DRM_DEBUG("IH: CP EOP\n");
 
 	if (adev->enable_mes && doorbell_offset) {
-		struct amdgpu_userq_fence_driver *fence_drv = NULL;
-		struct xarray *xa = &adev->userq_xa;
+		struct amdgpu_usermode_queue *queue = NULL;
+		struct xarray *xa = &adev->userq_doorbell_xa;
 		unsigned long flags;
 
 		xa_lock_irqsave(xa, flags);
-		fence_drv = xa_load(xa, doorbell_offset);
-		if (fence_drv)
-			amdgpu_userq_fence_driver_process(fence_drv);
+		queue = xa_load(xa, doorbell_offset);
+		if (queue)
+			amdgpu_userq_fence_driver_process(queue->fence_drv);
 		xa_unlock_irqrestore(xa, flags);
 	} else {
 		me_id = (entry->ring_id & 0x0c) >> 2;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index a418ae609c36..d4faceab8f88 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@ -4854,14 +4854,14 @@ static int gfx_v12_0_eop_irq(struct amdgpu_device *adev,
 	DRM_DEBUG("IH: CP EOP\n");
 
 	if (adev->enable_mes && doorbell_offset) {
-		struct amdgpu_userq_fence_driver *fence_drv = NULL;
-		struct xarray *xa = &adev->userq_xa;
+		struct xarray *xa = &adev->userq_doorbell_xa;
+		struct amdgpu_usermode_queue *queue = NULL;
 		unsigned long flags;
 
 		xa_lock_irqsave(xa, flags);
-		fence_drv = xa_load(xa, doorbell_offset);
-		if (fence_drv)
-			amdgpu_userq_fence_driver_process(fence_drv);
+		queue = xa_load(xa, doorbell_offset);
+		if (queue)
+			amdgpu_userq_fence_driver_process(queue->fence_drv);
 		xa_unlock_irqrestore(xa, flags);
 	} else {
 		me_id = (entry->ring_id & 0x0c) >> 2;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c b/drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c
index db49582a211f..642ddd9473cb 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c
@@ -3643,14 +3643,15 @@ static int gfx_v12_1_eop_irq(struct amdgpu_device *adev,
 	DRM_DEBUG("IH: CP EOP\n");
 
 	if (adev->enable_mes && doorbell_offset) {
-		struct amdgpu_userq_fence_driver *fence_drv = NULL;
-		struct xarray *xa = &adev->userq_xa;
+		struct xarray *xa = &adev->userq_doorbell_xa;
+		struct amdgpu_usermode_queue *queue = NULL;
 		unsigned long flags;
 
 		xa_lock_irqsave(xa, flags);
-		fence_drv = xa_load(xa, doorbell_offset);
-		if (fence_drv)
-			amdgpu_userq_fence_driver_process(fence_drv);
+		queue = xa_load(xa, doorbell_offset);
+		if (queue)
+			amdgpu_userq_fence_driver_process(queue->fence_drv);
+
 		xa_unlock_irqrestore(xa, flags);
 	} else {
 		me_id = (entry->ring_id & 0x0c) >> 2;
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index b005672f2f96..301e9364aff1 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1662,16 +1662,16 @@ static int sdma_v6_0_process_fence_irq(struct amdgpu_device *adev,
 	u32 doorbell_offset = entry->src_data[0];
 
 	if (adev->enable_mes && doorbell_offset) {
-		struct amdgpu_userq_fence_driver *fence_drv = NULL;
-		struct xarray *xa = &adev->userq_xa;
+		struct amdgpu_usermode_queue *queue = NULL;
+		struct xarray *xa = &adev->userq_doorbell_xa;
 		unsigned long flags;
 
 		doorbell_offset >>= SDMA0_QUEUE0_DOORBELL_OFFSET__OFFSET__SHIFT;
 
 		xa_lock_irqsave(xa, flags);
-		fence_drv = xa_load(xa, doorbell_offset);
-		if (fence_drv)
-			amdgpu_userq_fence_driver_process(fence_drv);
+		queue = xa_load(xa, doorbell_offset);
+		if (queue)
+			amdgpu_userq_fence_driver_process(queue->fence_drv);
 		xa_unlock_irqrestore(xa, flags);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 5679a94d0815..2660e8f08daa 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -1594,16 +1594,16 @@ static int sdma_v7_0_process_fence_irq(struct amdgpu_device *adev,
 	u32 doorbell_offset = entry->src_data[0];
 
 	if (adev->enable_mes && doorbell_offset) {
-		struct amdgpu_userq_fence_driver *fence_drv = NULL;
-		struct xarray *xa = &adev->userq_xa;
+		struct xarray *xa = &adev->userq_doorbell_xa;
+		struct amdgpu_usermode_queue *queue = NULL;
 		unsigned long flags;
 
 		doorbell_offset >>= SDMA0_QUEUE0_DOORBELL_OFFSET__OFFSET__SHIFT;
 
 		xa_lock_irqsave(xa, flags);
-		fence_drv = xa_load(xa, doorbell_offset);
-		if (fence_drv)
-			amdgpu_userq_fence_driver_process(fence_drv);
+		queue = xa_load(xa, doorbell_offset);
+		if (queue)
+			amdgpu_userq_fence_driver_process(queue->fence_drv);
 		xa_unlock_irqrestore(xa, flags);
 	}
 
-- 
2.34.1

