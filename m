Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B991E28CE
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2020 19:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DFA89D2F;
	Tue, 26 May 2020 17:27:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680055.outbound.protection.outlook.com [40.107.68.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB3789B8F
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 May 2020 17:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKw12xvWSwjsl8R24IEehrHl6OY86Yqr4DoQzaXVsEWxvfhEKbbw3wgZy4hNa/pZp39zXiCwRky5v6oeUgtCOj0NesmNtzLUQfZgG4LQLYoNrvcIiMottGGYtFDS4AlqjZB07MarI8xk9L6czrp5/zXP8umlNULIEgRk/OYYugjY7wTAJsIXOKmaVt9Ej8YnY/tirI3+dqpdVNUyS2+685zOhAeevQWXFC8GexdFdkQvGPItz942VaJAhwAcffcRFD4BLyRiEDltRymk7DESGZ/3RmNypEad+8vR49Vuh3rSr6OvmeUkrmAB/57u0Bsne5oBX+IKWiFfgdXs+1j6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3jhoAu9KkA9xfJoMxtPRcJjUenw6OeBgX6M8H74x4E=;
 b=HY/tEc8X0dt0eBYyxye/Xt7j0AQSy5gwlYbGCOpOP+ivQ+FCmap5DCoBrwy0yVAu/jK6eTTMCStwzjaYHo6yifLi4uaqAZDKPpaEmhl0Xs9Tu+zqfaDo5oAv54d/sgv8/Qg0GxbCeV2WbXBewYV7ERJE1GpTAuviS2jRiyq6EvpnQNUAjWobh8yDRKxh4NPmgjdDqTfnLrtQnpKA4tbvH5PgUqc2eZxiR1A22zJ8n4oGs4aZCfTMPejxq0Ayrp6Vjc9WP4hQoaQcvSD/qtLOKYzwr1c1ZyJgyWMRwvBqpA6Hnc9tEyLBNDCy/1W8ar77/FtxwpXm0acHzwwxQC0vKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3jhoAu9KkA9xfJoMxtPRcJjUenw6OeBgX6M8H74x4E=;
 b=azcfTJowgXF60WXBmkwk4X8xTirStmB8duNlLUAc3l0IL5Hnjom+bPikGlYYCKjblefGV85l9nyCZ2pZy3USDEB5nyFMtM8xiyWuT1PjPvq7FdG4iVbJgwNow9rJSADxNbeDlCP5jf6BLwgGP96Y/PrlKZeDuaBidYOe9G4JI4g=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BN7PR12MB2836.namprd12.prod.outlook.com (2603:10b6:408:32::33)
 by BN7PR12MB2690.namprd12.prod.outlook.com (2603:10b6:408:32::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.26; Tue, 26 May
 2020 17:27:15 +0000
Received: from BN7PR12MB2836.namprd12.prod.outlook.com
 ([fe80::14f2:9ef9:beed:ad1]) by BN7PR12MB2836.namprd12.prod.outlook.com
 ([fe80::14f2:9ef9:beed:ad1%7]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 17:27:15 +0000
From: Mukul Joshi <mukul.joshi@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/amdkfd: Track SDMA utilization per process
Date: Tue, 26 May 2020 13:26:59 -0400
Message-Id: <20200526172659.8537-1-mukul.joshi@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: YTBPR01CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::35) To BN7PR12MB2836.namprd12.prod.outlook.com
 (2603:10b6:408:32::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Ryzen-3700X.amd.com (165.204.55.251) by
 YTBPR01CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.24 via Frontend Transport; Tue, 26 May 2020 17:27:15 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b4e0563c-9330-49b3-e06a-08d8019a08a1
X-MS-TrafficTypeDiagnostic: BN7PR12MB2690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR12MB26900CB70C6F0CDA8836AF14EEB00@BN7PR12MB2690.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-Forefront-PRVS: 041517DFAB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UrBzI5ORGu41N9A5hmfreZFgoc25rQU1rBm+Ry3KILadJcyTanHdOB8HFLEnv/H9CWZufZL6DsZiSheGlu/gSsFjsf/FKXWUh99W0IKhipBVE2dJ/G2Cx+BoeQLAxvGS1sMEsoHwMBF57mWIGjayrkYMbpQ6WKhPhgDjPjK++WBxBJTnoFLZA3EpGdQpplIqN/WobeeSkkBGWBXKTxM63kjyOaurwc/YSYpn7Jva3JZ7/Pttz3aTVHKfnkVZKn86l9mhfyaaz1666kRHFdA3pEJtK9UGeiWVPPUMeWKXYDnPXPnprRXyhfynw4S1qcFX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR12MB2836.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(6486002)(316002)(5660300002)(8676002)(4326008)(8936002)(6666004)(86362001)(36756003)(1076003)(2616005)(2906002)(44832011)(186003)(16526019)(26005)(7696005)(66556008)(30864003)(956004)(478600001)(52116002)(66946007)(6916009)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: xvCheJEDQjJJ6WDEDfb1XUajlSgBA65HILc49wE4mxt+se9o9Wio9221Kh1jE6XylIAqc7XCDL9/RXGu6FnAQvwx/55OS+6zqVxoGRZk6BDbQYqx4mljWHLMtUTIYm0SbZGDJzojSTm3W0mzuDjERADzYzcf4vY8W9lqEJokvMj3MGqE7/747eGdedBYDGwufy5u2ICS/AYHXxPTgEEQDZZjCe4xXGHDQiosak4PHVwg1o7bDmeU4GytrQjlCQYxOFqKj5zYyJtXQ2CcVbiGMxOFZNTJM5LX+sRJfCLKR7wUxbp19Ii5ub/2ke9f4qxObtFs8IhFdaDiF+asFhPBtEK78Parif8FqwM8sg7Sva3020hRgdACMnukhR2O4vRgwKo6YbzRc0vPGoBSgzOd3Vw6OxeNE4DI4T5P3i7FfjWF7Ed5qyZshgsynuZ9abYrsV/wvQVYwZuhCBnaS/kQZnmK2YoXwHURC6p4skrm3GT0phTjJMOl+2Wyo9kJdj1u
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e0563c-9330-49b3-e06a-08d8019a08a1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2020 17:27:15.5782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwzVrHRgA91a+Jsajs+Zfxz+mpCr2NejhTmimCZ2X6rbzCrey37AvwN6ai8H5VVWYIrTszwSjQ42NRidPssgNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2690
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
Cc: Mukul Joshi <mukul.joshi@amd.com>, Felix.Kuehling@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Track SDMA usage on a per process basis and report it through sysfs.
The value in the sysfs file indicates the amount of time SDMA has
been in-use by this process since the creation of the process.
This value is in microsecond granularity.

v2:
- Remove unnecessary checks for pdd is kfd_procfs_show().
- Make counter part of the kfd_sdma_activity_handler_workarea
  structure.

v3:
- Remove READ_ONCE/WRITE_ONCE while updating acitivty
  counter.
- Add updation of past acitivt counter under dqm_lock.

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
---
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |  57 ++++++++
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  16 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 137 ++++++++++++++++--
 4 files changed, 198 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index e9c4867abeff..6293017bd5bf 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -153,6 +153,52 @@ void decrement_queue_count(struct device_queue_manager *dqm,
 		dqm->active_cp_queue_count--;
 }
 
+int read_sdma_queue_counter(struct queue *q, uint64_t *val)
+{
+	int ret;
+	uint64_t tmp = 0;
+
+	if (!q || !val)
+		return -EINVAL;
+	/*
+	 * SDMA activity counter is stored at queue's RPTR + 0x8 location.
+	 */
+	if (!access_ok((const void __user *)((uint64_t)q->properties.read_ptr +
+					sizeof(uint64_t)), sizeof(uint64_t))) {
+		pr_err("Can't access sdma queue activity counter\n");
+		return -EFAULT;
+	}
+
+	ret = get_user(tmp, (uint64_t *)((uint64_t)(q->properties.read_ptr) +
+						    sizeof(uint64_t)));
+	if (!ret) {
+		*val = tmp;
+	}
+
+	return ret;
+}
+
+static int update_sdma_queue_past_activity_stats(struct kfd_process_device *pdd,
+						 struct queue *q)
+{
+	int ret;
+	uint64_t val = 0;
+
+	if (!pdd)
+		return -ENODEV;
+
+	ret = read_sdma_queue_counter(q, &val);
+	if (ret) {
+		pr_err("Failed to read SDMA queue counter for queue: %d\n",
+				q->properties.queue_id);
+		return ret;
+	}
+
+	pdd->sdma_past_activity_counter += val;
+
+	return ret;
+}
+
 static int allocate_doorbell(struct qcm_process_device *qpd, struct queue *q)
 {
 	struct kfd_dev *dev = qpd->dqm->dev;
@@ -487,6 +533,12 @@ static int destroy_queue_nocpsch_locked(struct device_queue_manager *dqm,
 	if (retval == -ETIME)
 		qpd->reset_wavefronts = true;
 
+	/* Get the SDMA queue stats */
+        if ((q->properties.type == KFD_QUEUE_TYPE_SDMA) ||
+            (q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI)) {
+                update_sdma_queue_past_activity_stats(qpd_to_pdd(qpd), q);
+        }
+
 	mqd_mgr->free_mqd(mqd_mgr, q->mqd, q->mqd_mem_obj);
 
 	list_del(&q->list);
@@ -1468,6 +1520,11 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
 		}
 	}
 
+	/* Get the SDMA queue stats */
+	if ((q->properties.type == KFD_QUEUE_TYPE_SDMA) ||
+	    (q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI)) {
+		update_sdma_queue_past_activity_stats(qpd_to_pdd(qpd), q);
+	}
 	/*
 	 * Unconditionally decrement this counter, regardless of the queue's
 	 * type
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index 4afa015c69b1..894bcf877f9e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -251,4 +251,6 @@ static inline void dqm_unlock(struct device_queue_manager *dqm)
 	mutex_unlock(&dqm->lock_hidden);
 }
 
+int read_sdma_queue_counter(struct queue *q, uint64_t *val);
+
 #endif /* KFD_DEVICE_QUEUE_MANAGER_H_ */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index f70f789c3cb3..fae139b77c0a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -633,7 +633,14 @@ enum kfd_pdd_bound {
 	PDD_BOUND_SUSPENDED,
 };
 
-#define MAX_VRAM_FILENAME_LEN 11
+#define MAX_SYSFS_FILENAME_LEN 11
+
+/*
+ * SDMA counter runs at 100MHz frequency.
+ * We display SDMA activity in microsecond granularity in sysfs.
+ * As a result, the divisor is 100.
+ */
+#define SDMA_ACTIVITY_DIVISOR  100
 
 /* Data that is per-process-per device. */
 struct kfd_process_device {
@@ -681,7 +688,12 @@ struct kfd_process_device {
 	/* VRAM usage */
 	uint64_t vram_usage;
 	struct attribute attr_vram;
-	char vram_filename[MAX_VRAM_FILENAME_LEN];
+	char vram_filename[MAX_SYSFS_FILENAME_LEN];
+
+	/* SDMA activity tracking */
+	uint64_t sdma_past_activity_counter;
+	struct attribute attr_sdma;
+	char sdma_filename[MAX_SYSFS_FILENAME_LEN];
 };
 
 #define qpd_to_pdd(x) container_of(x, struct kfd_process_device, qpd)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d27221ddcdeb..db010c5da144 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -25,6 +25,7 @@
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/task.h>
+#include <linux/mmu_context.h>
 #include <linux/slab.h>
 #include <linux/amd-iommu.h>
 #include <linux/notifier.h>
@@ -76,6 +77,74 @@ struct kfd_procfs_tree {
 
 static struct kfd_procfs_tree procfs;
 
+/*
+ * Structure for SDMA activity tracking
+ */
+struct kfd_sdma_activity_handler_workarea {
+	struct work_struct sdma_activity_work;
+	struct kfd_process_device *pdd;
+	uint64_t sdma_activity_counter;
+};
+
+static void kfd_sdma_activity_worker(struct work_struct *work)
+{
+	struct kfd_sdma_activity_handler_workarea *workarea;
+	struct kfd_process_device *pdd;
+	uint64_t val;
+	struct mm_struct *mm;
+	struct queue *q;
+	struct qcm_process_device *qpd;
+	struct device_queue_manager *dqm;
+	int ret = 0;
+
+	workarea = container_of(work, struct kfd_sdma_activity_handler_workarea,
+				sdma_activity_work);
+	if (!workarea)
+		return;
+
+	pdd = workarea->pdd;
+	dqm = pdd->dev->dqm;
+	qpd = &pdd->qpd;
+
+	if (!pdd || !dqm || !qpd)
+		return;
+
+	mm = get_task_mm(pdd->process->lead_thread);
+	if (!mm) {
+		return;
+	}
+
+	use_mm(mm);
+
+	dqm_lock(dqm);
+
+	/*
+	 * Total SDMA activity is current SDMA activity + past SDMA activity
+	 */
+	workarea->sdma_activity_counter = pdd->sdma_past_activity_counter;
+
+	/*
+	 * Get the current activity counters for all active SDMA queues
+	 */
+	list_for_each_entry(q, &qpd->queues_list, list) {
+		if ((q->properties.type == KFD_QUEUE_TYPE_SDMA) ||
+		    (q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI)) {
+			val = 0;
+			ret = read_sdma_queue_counter(q, &val);
+			if (ret)
+				pr_debug("Failed to read SDMA queue active "
+					 "counter for queue id: %d",
+					 q->properties.queue_id);
+			else
+				workarea->sdma_activity_counter += val;
+		}
+	}
+
+	dqm_unlock(dqm);
+	unuse_mm(mm);
+	mmput(mm);
+}
+
 static ssize_t kfd_procfs_show(struct kobject *kobj, struct attribute *attr,
 			       char *buffer)
 {
@@ -87,8 +156,24 @@ static ssize_t kfd_procfs_show(struct kobject *kobj, struct attribute *attr,
 	} else if (strncmp(attr->name, "vram_", 5) == 0) {
 		struct kfd_process_device *pdd = container_of(attr, struct kfd_process_device,
 							      attr_vram);
-		if (pdd)
-			return snprintf(buffer, PAGE_SIZE, "%llu\n", READ_ONCE(pdd->vram_usage));
+		return snprintf(buffer, PAGE_SIZE, "%llu\n", READ_ONCE(pdd->vram_usage));
+	} else if (strncmp(attr->name, "sdma_", 5) == 0) {
+		struct kfd_process_device *pdd = container_of(attr, struct kfd_process_device,
+							      attr_sdma);
+		struct kfd_sdma_activity_handler_workarea sdma_activity_work_handler;
+
+		INIT_WORK(&sdma_activity_work_handler.sdma_activity_work,
+					kfd_sdma_activity_worker);
+
+		sdma_activity_work_handler.pdd = pdd;
+
+		schedule_work(&sdma_activity_work_handler.sdma_activity_work);
+
+		flush_work(&sdma_activity_work_handler.sdma_activity_work);
+
+		return snprintf(buffer, PAGE_SIZE, "%llu\n",
+				(sdma_activity_work_handler.sdma_activity_counter)/
+				 SDMA_ACTIVITY_DIVISOR);
 	} else {
 		pr_err("Invalid attribute");
 		return -EINVAL;
@@ -210,7 +295,24 @@ int kfd_procfs_add_queue(struct queue *q)
 	return 0;
 }
 
-int kfd_procfs_add_vram_usage(struct kfd_process *p)
+static int kfd_sysfs_create_file(struct kfd_process *p, struct attribute *attr,
+				 char *name)
+{
+	int ret = 0;
+
+	if (!p || !attr || !name)
+		return -EINVAL;
+
+	attr->name = name;
+	attr->mode = KFD_SYSFS_FILE_MODE;
+	sysfs_attr_init(attr);
+
+	ret = sysfs_create_file(p->kobj, attr);
+
+	return ret;
+}
+
+int kfd_procfs_add_sysfs_files(struct kfd_process *p)
 {
 	int ret = 0;
 	struct kfd_process_device *pdd;
@@ -221,17 +323,25 @@ int kfd_procfs_add_vram_usage(struct kfd_process *p)
 	if (!p->kobj)
 		return -EFAULT;
 
-	/* Create proc/<pid>/vram_<gpuid> file for each GPU */
+	/*
+	 * Create sysfs files for each GPU:
+	 * - proc/<pid>/vram_<gpuid>
+	 * - proc/<pid>/sdma_<gpuid>
+	 */
 	list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
-		snprintf(pdd->vram_filename, MAX_VRAM_FILENAME_LEN, "vram_%u",
+		snprintf(pdd->vram_filename, MAX_SYSFS_FILENAME_LEN, "vram_%u",
 			 pdd->dev->id);
-		pdd->attr_vram.name = pdd->vram_filename;
-		pdd->attr_vram.mode = KFD_SYSFS_FILE_MODE;
-		sysfs_attr_init(&pdd->attr_vram);
-		ret = sysfs_create_file(p->kobj, &pdd->attr_vram);
+		ret = kfd_sysfs_create_file(p, &pdd->attr_vram, pdd->vram_filename);
 		if (ret)
 			pr_warn("Creating vram usage for gpu id %d failed",
 				(int)pdd->dev->id);
+
+		snprintf(pdd->sdma_filename, MAX_SYSFS_FILENAME_LEN, "sdma_%u",
+			 pdd->dev->id);
+		ret = kfd_sysfs_create_file(p, &pdd->attr_sdma, pdd->sdma_filename);
+		if (ret)
+			pr_warn("Creating sdma usage for gpu id %d failed",
+				(int)pdd->dev->id);
 	}
 
 	return ret;
@@ -444,9 +554,9 @@ struct kfd_process *kfd_create_process(struct file *filep)
 		if (!process->kobj_queues)
 			pr_warn("Creating KFD proc/queues folder failed");
 
-		ret = kfd_procfs_add_vram_usage(process);
+		ret = kfd_procfs_add_sysfs_files(process);
 		if (ret)
-			pr_warn("Creating vram usage file for pid %d failed",
+			pr_warn("Creating sysfs usage file for pid %d failed",
 				(int)process->lead_thread->pid);
 	}
 out:
@@ -597,8 +707,10 @@ static void kfd_process_wq_release(struct work_struct *work)
 		kobject_put(p->kobj_queues);
 		p->kobj_queues = NULL;
 
-		list_for_each_entry(pdd, &p->per_device_data, per_device_list)
+		list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
 			sysfs_remove_file(p->kobj, &pdd->attr_vram);
+			sysfs_remove_file(p->kobj, &pdd->attr_sdma);
+		}
 
 		kobject_del(p->kobj);
 		kobject_put(p->kobj);
@@ -906,6 +1018,7 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 	pdd->already_dequeued = false;
 	pdd->runtime_inuse = false;
 	pdd->vram_usage = 0;
+	pdd->sdma_past_activity_counter = 0;
 	list_add(&pdd->per_device_list, &p->per_device_data);
 
 	/* Init idr used for memory handle translation */
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
