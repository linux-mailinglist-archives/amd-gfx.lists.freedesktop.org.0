Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6208967BB74
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Jan 2023 20:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772D010E851;
	Wed, 25 Jan 2023 19:55:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E7E10E391;
 Wed, 25 Jan 2023 19:54:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFmQ9r8m79eaVkU51X0ABJGfWnbRVGiz2vel1TcUfu/ilrKHkztsh9gKWmifHUVbOXoNiFkaDumhPzjpzTGVtqxOEFdxAxMa/2n8+pEg5RrwzY9EzRvVPUSJlgdpl01KHPI7GkpznOd7O29oe6NHZVcGFtkM4mlkresEMGAdHpmFZEpXl84olMUIX/wccmYJBSoGUZYIlPARu3Y7B5Ec1x6p12JZeFl/uq0B5ALOw9VqGgj/XQpZ5azw3MFKV2O1qIwP7UKipePxWibwGjdP1EiO3fH0MXOdZfEZzoOnCwHpYTtN3npYlP3QzzD/DprGb6O85ixn3FKBv9Hp12/0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fotD7R6tUFik5QjxeQO/q/TjE08bGJ/A5pAFiwEglVY=;
 b=kvH0y/FsaGYAi/RC4SVo7I5IrAfYXmMmPG4vjj0t8/89np0PjcDgbmT8Bdk3LWkKWC4ZfwE/72/6aBiFZsHnlwTrsVGvHIYMxJ4X/5Lzw85/luGOCYKQOls/UdU/KPO2ruPLMAuSs4QsIeJp/8cJSzg5eXn/GP2akCFhkXO32HhhDvxrVocwRnXX3zXmzY3+8jimZGPppty0I3iTTbfSB9hu3G8AT1hppVwkYksk7+2y5C9yqwlFZ2VvItN3hLS/l7Yj+AR6U+CiSU8yoofxhlIGLSZlPdVRxUfalIx39SLBF+27HQvRRA4CDjhMK1ZtWcDx9iN8rh76wtErT+cwWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fotD7R6tUFik5QjxeQO/q/TjE08bGJ/A5pAFiwEglVY=;
 b=Oy8DPWRP+iiCgVbh2rBgduk/7Yq1OTqYV0bXKYiqnHTQtsbJRgkIxnLvFo+h6IQRsrL4CEmFYboFjR82t8ZajrPvrxiiV9C4z31bcC88QoyHDB5rTIyqEpiBH1MwpbSZG0MfCsd0J89m2jHdAdbg6ZTpUuhJ/h4nX6sS4l01/f8=
Received: from BN8PR15CA0010.namprd15.prod.outlook.com (2603:10b6:408:c0::23)
 by CH2PR12MB4953.namprd12.prod.outlook.com (2603:10b6:610:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 19:54:25 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::2a) by BN8PR15CA0010.outlook.office365.com
 (2603:10b6:408:c0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 19:54:25 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:24 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 25/32] drm/amdkfd: add debug suspend and resume process queues
 operation
Date: Wed, 25 Jan 2023 14:53:54 -0500
Message-ID: <20230125195401.4183544-26-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125195401.4183544-1-jonathan.kim@amd.com>
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|CH2PR12MB4953:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f0917e-c42c-4242-4f6d-08daff0df62a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9DyW5tka4SUsRJtP/VitZ8PW35qFIOR3j0WPqiYxZ/egRNEDDXLebbkbWo/hxVr0+0nblzwDdP5AuzDhpGYULqLstTYFdK8Z3uSrqlgGe5nCp0qHpM1TG8c9zKGw1TpNsXwHwfs1rTjmGBcETkVn6gYxLFxr6j6BN5ycAktJAhc5Lr+r2fNpXdCt8zoaqgUmVKRN01sa809game7bgIKu4hDwGYw3KqNzDTs2qNKunvd854Ysi+AwEA1OoSeWRmU70N/pWGQaNhhqgSxrSiwpjSLW66vF4SpOgb5oYo95YQnO5hGRYeK02sGOv4m3iLIqI4tmHsA1t4aw1DnGatPgMvdtGyUC0FXI/pe5X5xyrgfyeJHPSxWcDxDmt6hRrqXNeFuHJ7Rfn0Z7hf7Pyh3105bUEupGdJqZPqrY26gIiCoAngKK137KkqI7LpPweY0CChww+AL/WRYr7a90VGC9ykO0oUWnvwW1SfoQp2jc4ALOiohgx4pyukHhLs6matJaS+dVcSBrJhf6pL55sbMzUqlS9XUBXnk8SwR1oOh0ilwKevoQH/PMphmKf86OMUoDvFXxFXepen/PY49tvah25Hx9ixo/S13lXCV8tMy2VSvvagunT83PWmKOphUyw/TRh8Bak6b68+xDsSpw1vDTcela8YTo05f8JKrzbBBPNPY5L3A0USGdehRVTBSfKRbpV7uGThm3Ygph/spirbRWrVKb21xNhx+1k1Kf5PUMeo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(36756003)(426003)(2616005)(41300700001)(8936002)(47076005)(336012)(356005)(81166007)(15650500001)(82740400003)(2906002)(30864003)(5660300002)(44832011)(83380400001)(1076003)(86362001)(82310400005)(186003)(26005)(478600001)(6666004)(7696005)(450100002)(70206006)(70586007)(4326008)(8676002)(16526019)(54906003)(316002)(36860700001)(110136005)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:25.5503 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f0917e-c42c-4242-4f6d-08daff0df62a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4953
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
Cc: Felix.Kuehling@amd.com, Jonathan.Kim@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

In order to inspect waves from the saved context at any point during a
debug session, the debugger must be able to preempt queues to trigger
context save by suspending them.

On queue suspend, the KFD will copy the context save header information
so that the debugger can correctly crawl the appropriate size of the saved
context. The debugger must then also be allowed to resume suspended queues.

A queue that is newly created cannot be suspended because queue ids are
recycled after destruction so the debugger needs to know that this has
occurred.  Query functions will be later added that will clear a given
queue of its new queue status.

A queue cannot be destroyed while it is suspended to preserve its saved
context during debugger inspection.  Have queue destruction block while
a queue is suspended and unblocked when it is resumed.  Likewise, if a
queue is about to be destroyed, it cannot be suspended.

Return the number of queues successfully suspended or resumed along with
a per queue status array where the upper bits per queue status show that
the request was invalid (new/destroyed queue suspend request, missing
queue) or an error occurred (HWS in a fatal state so it can't suspend or
resume queues).

v2: add gfx11/mes support.
prevent header copy on suspend from overwriting user fields.
simplify resume_queues function.
address other nit-picks

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  11 +
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c        |   7 +
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 446 +++++++++++++++++-
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  10 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  14 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c  |  11 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   5 +-
 10 files changed, 518 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 60c3b0449d86..d50415fe0475 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -758,6 +758,11 @@ bool amdgpu_amdkfd_have_atomics_support(struct amdgpu_device *adev)
 	return adev->have_atomics_support;
 }
 
+void amdgpu_amdkfd_debug_mem_fence(struct amdgpu_device *adev)
+{
+	amdgpu_device_flush_hdp(adev, NULL);
+}
+
 void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev, bool reset)
 {
 	amdgpu_umc_poison_handler(adev, reset);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index df782274a4c8..9d1c6ab14331 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -310,6 +310,7 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 				      uint64_t va, void *drm_priv,
 				      struct kgd_mem **mem, uint64_t *size,
 				      uint64_t *mmap_offset);
+void amdgpu_amdkfd_debug_mem_fence(struct amdgpu_device *adev);
 int amdgpu_amdkfd_get_tile_config(struct amdgpu_device *adev,
 				struct tile_config *config);
 void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 205a487d91d2..b62e93b35a44 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -410,6 +410,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 	pr_debug("Write ptr address   == 0x%016llX\n",
 			args->write_pointer_address);
 
+	kfd_dbg_ev_raise(KFD_EC_MASK(EC_QUEUE_NEW), p, dev, queue_id, false, NULL, 0);
 	return 0;
 
 err_create_queue:
@@ -2908,7 +2909,17 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 				args->launch_mode.launch_mode);
 		break;
 	case KFD_IOC_DBG_TRAP_SUSPEND_QUEUES:
+		r = suspend_queues(target,
+				args->suspend_queues.num_queues,
+				args->suspend_queues.grace_period,
+				args->suspend_queues.exception_mask,
+				(uint32_t *)args->suspend_queues.queue_array_ptr);
+
+		break;
 	case KFD_IOC_DBG_TRAP_RESUME_QUEUES:
+		r = resume_queues(target, args->resume_queues.num_queues,
+				(uint32_t *)args->resume_queues.queue_array_ptr);
+		break;
 	case KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH:
 	case KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH:
 	case KFD_IOC_DBG_TRAP_SET_FLAGS:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index b630633609b0..730e53584113 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -344,6 +344,13 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
 	}
 
 	kfd_dbg_set_workaround(target, false);
+
+	if (!unwind) {
+		int resume_count = resume_queues(target, 0, NULL);
+
+		if (resume_count)
+			pr_debug("Resumed %d queues\n", resume_count);
+	}
 }
 
 static void kfd_dbg_clean_exception_status(struct kfd_process *target)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 3b747e51684e..7792fe9491c5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -925,6 +925,92 @@ static int update_queue(struct device_queue_manager *dqm, struct queue *q,
 	return retval;
 }
 
+/* suspend_single_queue does not lock the dqm like the
+ * evict_process_queues_cpsch or evict_process_queues_nocpsch. You should
+ * lock the dqm before calling, and unlock after calling.
+ *
+ * The reason we don't lock the dqm is because this function may be
+ * called on multiple queues in a loop, so rather than locking/unlocking
+ * multiple times, we will just keep the dqm locked for all of the calls.
+ */
+static int suspend_single_queue(struct device_queue_manager *dqm,
+				      struct kfd_process_device *pdd,
+				      struct queue *q)
+{
+	bool is_new;
+
+	if (q->properties.is_suspended)
+		return 0;
+
+	pr_debug("Suspending PASID %u queue [%i]\n",
+			pdd->process->pasid,
+			q->properties.queue_id);
+
+	is_new = q->properties.exception_status & KFD_EC_MASK(EC_QUEUE_NEW);
+
+	if (is_new || q->properties.is_being_destroyed) {
+		pr_debug("Suspend: skip %s queue id %i\n",
+				is_new ? "new" : "destroyed",
+				q->properties.queue_id);
+		return -EBUSY;
+	}
+
+	q->properties.is_suspended = true;
+	if (q->properties.is_active) {
+		if (dqm->dev->shared_resources.enable_mes) {
+			int r = remove_queue_mes(dqm, q, &pdd->qpd);
+
+			if (r)
+				return r;
+		}
+
+		decrement_queue_count(dqm, &pdd->qpd, q);
+		q->properties.is_active = false;
+	}
+
+	return 0;
+}
+
+/* resume_single_queue does not lock the dqm like the functions
+ * restore_process_queues_cpsch or restore_process_queues_nocpsch. You should
+ * lock the dqm before calling, and unlock after calling.
+ *
+ * The reason we don't lock the dqm is because this function may be
+ * called on multiple queues in a loop, so rather than locking/unlocking
+ * multiple times, we will just keep the dqm locked for all of the calls.
+ */
+static int resume_single_queue(struct device_queue_manager *dqm,
+				      struct qcm_process_device *qpd,
+				      struct queue *q)
+{
+	struct kfd_process_device *pdd;
+
+	if (!q->properties.is_suspended)
+		return 0;
+
+	pdd = qpd_to_pdd(qpd);
+
+	pr_debug("Restoring from suspend PASID %u queue [%i]\n",
+			    pdd->process->pasid,
+			    q->properties.queue_id);
+
+	q->properties.is_suspended = false;
+
+	if (QUEUE_IS_ACTIVE(q->properties)) {
+		if (dqm->dev->shared_resources.enable_mes) {
+			int r = add_queue_mes(dqm, q, &pdd->qpd);
+
+			if (r)
+				return r;
+		}
+
+		q->properties.is_active = true;
+		increment_queue_count(dqm, qpd, q);
+	}
+
+	return 0;
+}
+
 static int evict_process_queues_nocpsch(struct device_queue_manager *dqm,
 					struct qcm_process_device *qpd)
 {
@@ -1890,6 +1976,31 @@ static int execute_queues_cpsch(struct device_queue_manager *dqm,
 	return map_queues_cpsch(dqm);
 }
 
+static int wait_on_destroy_queue(struct device_queue_manager *dqm,
+				 struct queue *q)
+{
+	struct kfd_process_device *pdd = kfd_get_process_device_data(q->device,
+								q->process);
+	int ret = 0;
+
+	if (pdd->qpd.is_debug)
+		return ret;
+
+	q->properties.is_being_destroyed = true;
+
+	if (pdd->process->debug_trap_enabled && q->properties.is_suspended) {
+		dqm_unlock(dqm);
+		mutex_unlock(&q->process->mutex);
+		ret = wait_event_interruptible(dqm->destroy_wait,
+						!q->properties.is_suspended);
+
+		mutex_lock(&q->process->mutex);
+		dqm_lock(dqm);
+	}
+
+	return ret;
+}
+
 static int destroy_queue_cpsch(struct device_queue_manager *dqm,
 				struct qcm_process_device *qpd,
 				struct queue *q)
@@ -1909,11 +2020,16 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
 				q->properties.queue_id);
 	}
 
-	retval = 0;
-
 	/* remove queue from list to prevent rescheduling after preemption */
 	dqm_lock(dqm);
 
+	retval = wait_on_destroy_queue(dqm, q);
+
+	if (retval) {
+		dqm_unlock(dqm);
+		return retval;
+	}
+
 	if (qpd->is_debug) {
 		/*
 		 * error, currently we do not allow to destroy a queue
@@ -1959,7 +2075,14 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
 
 	dqm_unlock(dqm);
 
-	/* Do free_mqd after dqm_unlock(dqm) to avoid circular locking */
+	/*
+	 * Do free_mqd and raise delete event after dqm_unlock(dqm) to avoid
+	 * circular locking
+	 */
+	kfd_dbg_ev_raise(KFD_EC_MASK(EC_DEVICE_QUEUE_DELETE),
+				qpd->pqm->process, q->device,
+				-1, false, NULL, 0);
+
 	mqd_mgr->free_mqd(mqd_mgr, q->mqd, q->mqd_mem_obj);
 
 	return retval;
@@ -2423,8 +2546,10 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev)
 		goto out_free;
 	}
 
-	if (!dqm->ops.initialize(dqm))
+	if (!dqm->ops.initialize(dqm)) {
+		init_waitqueue_head(&dqm->destroy_wait);
 		return dqm;
+	}
 
 out_free:
 	kfree(dqm);
@@ -2562,6 +2687,319 @@ int release_debug_trap_vmid(struct device_queue_manager *dqm,
 	return r;
 }
 
+#define QUEUE_NOT_FOUND		-1
+/* invalidate queue operation in array */
+static void q_array_invalidate(uint32_t num_queues, uint32_t *queue_ids)
+{
+	int i;
+
+	for (i = 0; i < num_queues; i++)
+		queue_ids[i] |= KFD_DBG_QUEUE_INVALID_MASK;
+}
+
+/* find queue index in array */
+static int q_array_get_index(unsigned int queue_id,
+		uint32_t num_queues,
+		uint32_t *queue_ids)
+{
+	int i;
+
+	for (i = 0; i < num_queues; i++)
+		if (queue_id == (queue_ids[i] & ~KFD_DBG_QUEUE_INVALID_MASK))
+			return i;
+
+	return QUEUE_NOT_FOUND;
+}
+
+struct copy_context_work_handler_workarea {
+	struct work_struct copy_context_work;
+	struct kfd_process *p;
+};
+
+static void copy_context_work_handler (struct work_struct *work)
+{
+	struct copy_context_work_handler_workarea *workarea;
+	struct mqd_manager *mqd_mgr;
+	struct queue *q;
+	struct mm_struct *mm;
+	struct kfd_process *p;
+	uint32_t tmp_ctl_stack_used_size, tmp_save_area_used_size;
+	int i;
+
+	workarea = container_of(work,
+			struct copy_context_work_handler_workarea,
+			copy_context_work);
+
+	p = workarea->p;
+	mm = get_task_mm(p->lead_thread);
+
+	if (!mm)
+		return;
+
+	kthread_use_mm(mm);
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+		struct device_queue_manager *dqm = pdd->dev->dqm;
+		struct qcm_process_device *qpd = &pdd->qpd;
+
+		list_for_each_entry(q, &qpd->queues_list, list) {
+			mqd_mgr = dqm->mqd_mgrs[KFD_MQD_TYPE_CP];
+
+			/* We ignore the return value from get_wave_state
+			 * because
+			 * i) right now, it always returns 0, and
+			 * ii) if we hit an error, we would continue to the
+			 *      next queue anyway.
+			 */
+			mqd_mgr->get_wave_state(mqd_mgr,
+					q->mqd,
+					(void __user *)	q->properties.ctx_save_restore_area_address,
+					&tmp_ctl_stack_used_size,
+					&tmp_save_area_used_size);
+		}
+	}
+	kthread_unuse_mm(mm);
+	mmput(mm);
+}
+
+static uint32_t *get_queue_ids(uint32_t num_queues, uint32_t *usr_queue_id_array)
+{
+	size_t array_size = num_queues * sizeof(uint32_t);
+	uint32_t *queue_ids = NULL;
+
+	if (!usr_queue_id_array)
+		return NULL;
+
+	queue_ids = kzalloc(array_size, GFP_KERNEL);
+	if (!queue_ids)
+		return ERR_PTR(-ENOMEM);
+
+	if (copy_from_user(queue_ids, usr_queue_id_array, array_size))
+		return ERR_PTR(-EFAULT);
+
+	return queue_ids;
+}
+
+int resume_queues(struct kfd_process *p,
+		uint32_t num_queues,
+		uint32_t *usr_queue_id_array)
+{
+	uint32_t *queue_ids = NULL;
+	int total_resumed = 0;
+	int i;
+
+	if (usr_queue_id_array) {
+		queue_ids = get_queue_ids(num_queues, usr_queue_id_array);
+
+		if (IS_ERR(queue_ids))
+			return PTR_ERR(queue_ids);
+
+		/* mask all queues as invalid.  unmask per successful request */
+		q_array_invalidate(num_queues, queue_ids);
+	}
+
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+		struct device_queue_manager *dqm = pdd->dev->dqm;
+		struct qcm_process_device *qpd = &pdd->qpd;
+		struct queue *q;
+		int r, per_device_resumed = 0;
+
+		dqm_lock(dqm);
+
+		/* unmask queues that resume or already resumed as valid */
+		list_for_each_entry(q, &qpd->queues_list, list) {
+			int q_idx = QUEUE_NOT_FOUND;
+
+			if (queue_ids)
+				q_idx = q_array_get_index(
+						q->properties.queue_id,
+						num_queues,
+						queue_ids);
+
+			if (!queue_ids || q_idx != QUEUE_NOT_FOUND) {
+				int err = resume_single_queue(dqm, &pdd->qpd, q);
+
+				if (queue_ids) {
+					if (!err) {
+						queue_ids[q_idx] &=
+							~KFD_DBG_QUEUE_INVALID_MASK;
+					} else {
+						queue_ids[q_idx] |=
+							KFD_DBG_QUEUE_ERROR_MASK;
+						break;
+					}
+				}
+
+				if (dqm->dev->shared_resources.enable_mes) {
+					wake_up_all(&dqm->destroy_wait);
+					if (!err)
+						total_resumed++;
+				} else {
+					per_device_resumed++;
+				}
+			}
+		}
+
+		if (!per_device_resumed) {
+			dqm_unlock(dqm);
+			continue;
+		}
+
+		r = execute_queues_cpsch(dqm,
+					KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES,
+					0,
+					USE_DEFAULT_GRACE_PERIOD);
+		if (r) {
+			pr_err("Failed to resume process queues\n");
+			if (queue_ids) {
+				list_for_each_entry(q, &qpd->queues_list, list) {
+					int q_idx = q_array_get_index(
+							q->properties.queue_id,
+							num_queues,
+							queue_ids);
+
+					/* mask queue as error on resume fail */
+					if (q_idx != QUEUE_NOT_FOUND)
+						queue_ids[q_idx] |=
+							KFD_DBG_QUEUE_ERROR_MASK;
+				}
+			}
+		} else {
+			wake_up_all(&dqm->destroy_wait);
+			total_resumed += per_device_resumed;
+		}
+
+		dqm_unlock(dqm);
+	}
+
+	if (queue_ids) {
+		if (copy_to_user((void __user *)usr_queue_id_array, queue_ids,
+				num_queues * sizeof(uint32_t)))
+			pr_err("copy_to_user failed on queue resume\n");
+
+		kfree(queue_ids);
+	}
+
+	return total_resumed;
+}
+
+int suspend_queues(struct kfd_process *p,
+			uint32_t num_queues,
+			uint32_t grace_period,
+			uint64_t exception_clear_mask,
+			uint32_t *usr_queue_id_array)
+{
+	uint32_t *queue_ids = get_queue_ids(num_queues, usr_queue_id_array);
+	int total_suspended = 0;
+	int i;
+
+	if (IS_ERR(queue_ids))
+		return PTR_ERR(queue_ids);
+
+	/* mask all queues as invalid.  umask on successful request */
+	q_array_invalidate(num_queues, queue_ids);
+
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+		struct device_queue_manager *dqm = pdd->dev->dqm;
+		struct qcm_process_device *qpd = &pdd->qpd;
+		struct queue *q;
+		int r, per_device_suspended = 0;
+
+		mutex_lock(&p->event_mutex);
+		dqm_lock(dqm);
+
+		/* unmask queues that suspend or already suspended */
+		list_for_each_entry(q, &qpd->queues_list, list) {
+			int q_idx = q_array_get_index(q->properties.queue_id,
+							num_queues,
+							queue_ids);
+
+			if (q_idx != QUEUE_NOT_FOUND) {
+				int err = suspend_single_queue(dqm, pdd, q);
+				bool is_mes = dqm->dev->shared_resources.enable_mes;
+
+				if (!err) {
+					queue_ids[q_idx] &= ~KFD_DBG_QUEUE_INVALID_MASK;
+					if (exception_clear_mask && is_mes)
+						q->properties.exception_status &=
+							~exception_clear_mask;
+
+					if (is_mes)
+						total_suspended++;
+					else
+						per_device_suspended++;
+				} else if (err != -EBUSY) {
+					r = err;
+					queue_ids[q_idx] |= KFD_DBG_QUEUE_ERROR_MASK;
+					break;
+				}
+			}
+		}
+
+		if (!per_device_suspended) {
+			dqm_unlock(dqm);
+			mutex_unlock(&p->event_mutex);
+			if (total_suspended)
+				amdgpu_amdkfd_debug_mem_fence(dqm->dev->adev);
+			continue;
+		}
+
+		r = execute_queues_cpsch(dqm,
+			KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
+			grace_period);
+
+		if (r)
+			pr_err("Failed to suspend process queues.\n");
+		else
+			total_suspended += per_device_suspended;
+
+		list_for_each_entry(q, &qpd->queues_list, list) {
+			int q_idx = q_array_get_index(q->properties.queue_id,
+						num_queues, queue_ids);
+
+			if (q_idx == QUEUE_NOT_FOUND)
+				continue;
+
+			/* mask queue as error on suspend fail */
+			if (r)
+				queue_ids[q_idx] |= KFD_DBG_QUEUE_ERROR_MASK;
+			else if (exception_clear_mask)
+				q->properties.exception_status &=
+							~exception_clear_mask;
+		}
+
+		dqm_unlock(dqm);
+		mutex_unlock(&p->event_mutex);
+		amdgpu_device_flush_hdp(dqm->dev->adev, NULL);
+	}
+
+	if (total_suspended) {
+		struct copy_context_work_handler_workarea copy_context_worker;
+
+		INIT_WORK_ONSTACK(
+				&copy_context_worker.copy_context_work,
+				copy_context_work_handler);
+
+		copy_context_worker.p = p;
+
+		schedule_work(&copy_context_worker.copy_context_work);
+
+
+		flush_work(&copy_context_worker.copy_context_work);
+		destroy_work_on_stack(&copy_context_worker.copy_context_work);
+	}
+
+	if (copy_to_user((void __user *)usr_queue_id_array, queue_ids,
+			num_queues * sizeof(uint32_t)))
+		pr_err("copy_to_user failed on queue suspend\n");
+
+	kfree(queue_ids);
+
+	return total_suspended;
+}
+
 int debug_lock_and_unmap(struct device_queue_manager *dqm)
 {
 	int r;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index bef3be84c5cc..7ccf8d0d1867 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -259,6 +259,8 @@ struct device_queue_manager {
 	struct kfd_mem_obj	hiq_sdma_mqd;
 	bool			sched_running;
 	uint32_t		wait_times;
+
+	wait_queue_head_t	destroy_wait;
 };
 
 void device_queue_manager_init_cik(
@@ -286,6 +288,14 @@ int reserve_debug_trap_vmid(struct device_queue_manager *dqm,
 			struct qcm_process_device *qpd);
 int release_debug_trap_vmid(struct device_queue_manager *dqm,
 			struct qcm_process_device *qpd);
+int suspend_queues(struct kfd_process *p,
+			uint32_t num_queues,
+			uint32_t grace_period,
+			uint64_t exception_clear_mask,
+			uint32_t *usr_queue_id_array);
+int resume_queues(struct kfd_process *p,
+		uint32_t num_queues,
+		uint32_t *usr_queue_id_array);
 int debug_lock_and_unmap(struct device_queue_manager *dqm);
 int debug_map_and_unlock(struct device_queue_manager *dqm);
 int debug_refresh_runlist(struct device_queue_manager *dqm);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
index 8248e77751e7..ceae8bff4906 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
@@ -236,6 +236,11 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 			  u32 *save_area_used_size)
 {
 	struct v10_compute_mqd *m;
+	struct kfd_context_save_area_header header;
+	size_t header_copy_size = sizeof(header.control_stack_size) +
+			sizeof(header.wave_state_size) +
+			sizeof(header.wave_state_offset) +
+			sizeof(header.control_stack_offset);
 
 	m = get_mqd(mqd);
 
@@ -254,6 +259,15 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	 * accessible to user mode
 	 */
 
+	header.control_stack_size = *ctl_stack_used_size;
+	header.wave_state_size = *save_area_used_size;
+
+	header.wave_state_offset = m->cp_hqd_wg_state_offset;
+	header.control_stack_offset = m->cp_hqd_cntl_stack_offset;
+
+	if (copy_to_user(ctl_stack, &header, header_copy_size))
+		return -EFAULT;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
index 18ab613e787c..266b8d9cc9b2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
@@ -283,7 +283,11 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 			  u32 *save_area_used_size)
 {
 	struct v11_compute_mqd *m;
-	/*struct mqd_user_context_save_area_header header;*/
+	struct kfd_context_save_area_header header;
+	size_t header_copy_size = sizeof(header.control_stack_size) +
+			sizeof(header.wave_state_size) +
+			sizeof(header.wave_state_offset) +
+			sizeof(header.control_stack_offset);
 
 	m = get_mqd(mqd);
 
@@ -301,16 +305,15 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	 * it's part of the context save area that is already
 	 * accessible to user mode
 	 */
-/*
 	header.control_stack_size = *ctl_stack_used_size;
 	header.wave_state_size = *save_area_used_size;
 
 	header.wave_state_offset = m->cp_hqd_wg_state_offset;
 	header.control_stack_offset = m->cp_hqd_cntl_stack_offset;
 
-	if (copy_to_user(ctl_stack, &header, sizeof(header)))
+	if (copy_to_user(ctl_stack, &header, header_copy_size))
 		return -EFAULT;
-*/
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index 50da16dd4c96..047c43418a1a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -288,6 +288,11 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 			  u32 *save_area_used_size)
 {
 	struct v9_mqd *m;
+	struct kfd_context_save_area_header header;
+	size_t header_copy_size = sizeof(header.control_stack_size) +
+		sizeof(header.wave_state_size) +
+		sizeof(header.wave_state_offset) +
+		sizeof(header.control_stack_offset);
 
 	/* Control stack is located one page after MQD. */
 	void *mqd_ctl_stack = (void *)((uintptr_t)mqd + PAGE_SIZE);
@@ -299,7 +304,18 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	*save_area_used_size = m->cp_hqd_wg_state_offset -
 		m->cp_hqd_cntl_stack_size;
 
-	if (copy_to_user(ctl_stack, mqd_ctl_stack, m->cp_hqd_cntl_stack_size))
+	header.control_stack_size = *ctl_stack_used_size;
+	header.wave_state_size = *save_area_used_size;
+
+	header.wave_state_offset = m->cp_hqd_wg_state_offset;
+	header.control_stack_offset = m->cp_hqd_cntl_stack_offset;
+
+	if (copy_to_user(ctl_stack, &header, header_copy_size))
+		return -EFAULT;
+
+	if (copy_to_user(ctl_stack + m->cp_hqd_cntl_stack_offset,
+				mqd_ctl_stack + m->cp_hqd_cntl_stack_offset,
+				*ctl_stack_used_size))
 		return -EFAULT;
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 6f7dc23af104..8dc7cc1e18a5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -477,6 +477,8 @@ struct queue_properties {
 	uint32_t doorbell_off;
 	bool is_interop;
 	bool is_evicted;
+	bool is_suspended;
+	bool is_being_destroyed;
 	bool is_active;
 	bool is_gws;
 	bool is_dbg_wa;
@@ -501,7 +503,8 @@ struct queue_properties {
 #define QUEUE_IS_ACTIVE(q) ((q).queue_size > 0 &&	\
 			    (q).queue_address != 0 &&	\
 			    (q).queue_percent > 0 &&	\
-			    !(q).is_evicted)
+			    !(q).is_evicted &&		\
+			    !(q).is_suspended)
 
 enum mqd_update_flag {
 	UPDATE_FLAG_DBG_WA_ENABLE = 1,
-- 
2.25.1

