Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2EF47DC3E
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Dec 2021 01:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B1010E1C5;
	Thu, 23 Dec 2021 00:38:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A80D10E187;
 Thu, 23 Dec 2021 00:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jB6zzDPJFwhWBzGJte6GwZdLBlzJgekXKXpUVAlI35Qp6V3GDNGx0JJLC3EMiG8Sn4leHKzusx7yY4lhwUc4pC6VcPQywHPUgYRkce1hFbiYGll/WJDrRsqJY00A3TRk1kn4sItJk9qRyKkqOsqmPkOYS9E7DSCw/qMkFna7wdSFT+T/U++P2EFN7S+Y868sCKRK6CFQEC5SdxcqumzNhLqEKg8HETDm+uSB1qVbBKBU73aS4ojwZkyXbS9qxK5j6/ddVhy/5BEQpzB9f+lTq8QJzse3iNz4HdsOsBSr1m73OsY5he8igfhRNL4RMy14EuxICkdHwvIT4Eg/1814jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3/ElQB1MkzNaHKq1lNfHuwCiWaU9hhcthvmFBEQX1A=;
 b=SDzTM2GYI0t4c2Bvspn+J4FpyOAsHVxb5HiI4kTnycKRPIx+eVZ9bFgn/lMSMTpN9Prq/ALC99URBGD5uvGP357Dl4YHbnLlRdRgKH5f5CiSz5aB1LRn3KZ1GGp75nDx4e630PJIrJqNSZ8n4WQu4MVNJ3i/gy73Ho0tejJ3/gtdLla+pqtOOkReVn2t62ehrTJ47AJ0AXeV4zOB1I65MRfh92XfFH2Qya/Onm+2Nrvtb/zfXcgN15G7N0wm/8nFN/wxDBzsyKhEBKHSHXZhIrLu6OjoVtHCnV3zF1pzLq/emPr1u463VX5lGp7j5vv4lewPgl5XUUmYoTGB1CneNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3/ElQB1MkzNaHKq1lNfHuwCiWaU9hhcthvmFBEQX1A=;
 b=Ba9pL+e/y3BFhEgyARbdGmjnADHxLqn6iQToeHZw+NJi0KPfOOJsd1qCVpYtnywbU1CivYt+hCdsN2ndHAtlwYH4oErRUNVtkg/QaXRCPiHsJ3xnYbUBpQ8OOrOB0nPuOA7K/TluqQKP4wRz0dmJ+yda6WtEi1Ob92p8fHMLxo0=
Received: from BN0PR04CA0049.namprd04.prod.outlook.com (2603:10b6:408:e8::24)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Thu, 23 Dec
 2021 00:37:33 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::c2) by BN0PR04CA0049.outlook.office365.com
 (2603:10b6:408:e8::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:33 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:32 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 14/24] drm/amdkfd: CRIU checkpoint and restore queue
 control stack
Date: Wed, 22 Dec 2021 19:37:01 -0500
Message-ID: <20211223003711.13064-15-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed91deaa-2bcc-4616-ec63-08d9c5ac68f9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4207:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB420747D7F0A0B8F0696BF331FE7E9@MN2PR12MB4207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9cgWatWxd0bfNQg26US0xc7ISsaz7iOX2UgUf7GK719KSU0oN/tvDLwfH7+2pi/7lefnAy+wlYwS6sbyOy0TdV4mqmxSkFoablOSHb1Daw+4V3aWbkYiBIg6fZJqvFUTUFx4hcLRmV7VHmRTM4Skx4YBeSwOZzjpOkUtvPud+12XbRFuug7yJAFNFy6JzBS02IZeFpY7J0ZWt5xQUnsD3EkBahovu5poW+PPtGQT7d0YzRO5TpSs344HYDIo/OjWyzhhHT7CYcrqOvW9XHAKLsrD6Ps3NiwjkvHucDr048+R3shAL2iUub7pPGSBi3me6nN9AuR0hmquXIVcOLskaM/pApkYoN+r41SLLn3S0oLty//zqFlhoYQ7g79s/x0hUXjKvtqxvlgSMlsZb0hyi5CguPGZVMq9z4ipKuyFY++XKs6/RciK9qGnndSIi9AKl/BMwjwBi9e2PTCT1+M7T4MvSZ3bUhfofKGE4HQQki45MGja2hzWEzQSxDmRY3lvGbBtCDN3I3fasH5JZHaDpkgkpeFCw63SlYdt3On+7tPTDKT114fL/G+HG3OOr2zVE3U3hc4ogo4G1Z2B3BJ6YzT6hOMaDvqYd4onRo62nVHa3vJoQBSISsdStHX1vrbUSXubyfGuxWVT0UWR8rwmwIUrl40BStZ8cDS21uwEWFk79UwgjIwfh2PsV3rGroJ/O6TZCfaTZLbp24naXDbtK2HXAjerP7DTv231bNvZ6ewVzLqsf9ueTAWZxWsDQN8FUrfmRwbP9UtkQ9AZPahWEskvHH7qmmsCHAaF80eYxAlJjBFwAXcModYlgVE2fZOK8zIlQHQ9nIQLxmTHy9VHdw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(40470700002)(36840700001)(186003)(70586007)(4326008)(508600001)(54906003)(426003)(82310400004)(8676002)(336012)(16526019)(70206006)(316002)(40460700001)(8936002)(26005)(5660300002)(110136005)(36756003)(2616005)(47076005)(1076003)(2906002)(81166007)(36860700001)(6666004)(86362001)(83380400001)(30864003)(44832011)(356005)(7696005)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:33.5579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed91deaa-2bcc-4616-ec63-08d9c5ac68f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
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
Cc: daniel.vetter@ffwll.ch, felix.kuehling@amd.com,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 David Yat Sin <david.yatsin@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: David Yat Sin <david.yatsin@amd.com>

Checkpoint contents of queue control stacks on CRIU dump and restore them
during CRIU restore.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       |  2 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 23 ++++---
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  9 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h  | 11 +++-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  | 13 ++--
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  | 14 +++--
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   | 29 +++++++--
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   | 22 +++++--
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  5 +-
 .../amd/amdkfd/kfd_process_queue_manager.c    | 62 +++++++++++++------
 11 files changed, 139 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 146879cd3f2b..582b4a393f95 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -312,7 +312,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 			p->pasid,
 			dev->id);
 
-	err = pqm_create_queue(&p->pqm, dev, filep, &q_properties, &queue_id, NULL, NULL,
+	err = pqm_create_queue(&p->pqm, dev, filep, &q_properties, &queue_id, NULL, NULL, NULL,
 			&doorbell_offset_in_process);
 	if (err != 0)
 		goto err_create_queue;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
index 3a5303ebcabf..8eca9ed3ab36 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
@@ -185,7 +185,7 @@ static int dbgdev_register_diq(struct kfd_dbgdev *dbgdev)
 	properties.type = KFD_QUEUE_TYPE_DIQ;
 
 	status = pqm_create_queue(dbgdev->pqm, dbgdev->dev, NULL,
-				&properties, &qid, NULL, NULL, NULL);
+				&properties, &qid, NULL, NULL, NULL, NULL);
 
 	if (status) {
 		pr_err("Failed to create DIQ\n");
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index a92274f9f1f7..248e69c7960b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -332,7 +332,7 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
 				struct queue *q,
 				struct qcm_process_device *qpd,
 				const struct kfd_criu_queue_priv_data *qd,
-				const void *restore_mqd)
+				const void *restore_mqd, const void *restore_ctl_stack)
 {
 	struct mqd_manager *mqd_mgr;
 	int retval;
@@ -394,7 +394,8 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
 
 	if (qd)
 		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj, &q->gart_mqd_addr,
-				     &q->properties, restore_mqd);
+				     &q->properties, restore_mqd, restore_ctl_stack,
+				     qd->ctl_stack_size);
 	else
 		mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
 					&q->gart_mqd_addr, &q->properties);
@@ -1347,7 +1348,7 @@ static void destroy_kernel_queue_cpsch(struct device_queue_manager *dqm,
 static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 			struct qcm_process_device *qpd,
 			const struct kfd_criu_queue_priv_data *qd,
-			const void *restore_mqd)
+			const void *restore_mqd, const void *restore_ctl_stack)
 {
 	int retval;
 	struct mqd_manager *mqd_mgr;
@@ -1393,9 +1394,11 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 	 * updates the is_evicted flag but is a no-op otherwise.
 	 */
 	q->properties.is_evicted = !!qpd->evicted;
+
 	if (qd)
 		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj, &q->gart_mqd_addr,
-				     &q->properties, restore_mqd);
+				     &q->properties, restore_mqd, restore_ctl_stack,
+				     qd->ctl_stack_size);
 	else
 		mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
 					&q->gart_mqd_addr, &q->properties);
@@ -1788,7 +1791,8 @@ static int get_wave_state(struct device_queue_manager *dqm,
 
 static void get_queue_checkpoint_info(struct device_queue_manager *dqm,
 			const struct queue *q,
-			u32 *mqd_size)
+			u32 *mqd_size,
+			u32 *ctl_stack_size)
 {
 	struct mqd_manager *mqd_mgr;
 	enum KFD_MQD_TYPE mqd_type =
@@ -1797,13 +1801,18 @@ static void get_queue_checkpoint_info(struct device_queue_manager *dqm,
 	dqm_lock(dqm);
 	mqd_mgr = dqm->mqd_mgrs[mqd_type];
 	*mqd_size = mqd_mgr->mqd_size;
+	*ctl_stack_size = 0;
+
+	if (q->properties.type == KFD_QUEUE_TYPE_COMPUTE && mqd_mgr->get_checkpoint_info)
+		mqd_mgr->get_checkpoint_info(mqd_mgr, q->mqd, ctl_stack_size);
 
 	dqm_unlock(dqm);
 }
 
 static int checkpoint_mqd(struct device_queue_manager *dqm,
 			  const struct queue *q,
-			  void *mqd)
+			  void *mqd,
+			  void *ctl_stack)
 {
 	struct mqd_manager *mqd_mgr;
 	int r = 0;
@@ -1823,7 +1832,7 @@ static int checkpoint_mqd(struct device_queue_manager *dqm,
 		goto dqm_unlock;
 	}
 
-	mqd_mgr->checkpoint_mqd(mqd_mgr, q->mqd, mqd);
+	mqd_mgr->checkpoint_mqd(mqd_mgr, q->mqd, mqd, ctl_stack);
 
 dqm_unlock:
 	dqm_unlock(dqm);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index ebd7d4d3772b..7f419a360304 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -92,7 +92,8 @@ struct device_queue_manager_ops {
 				struct queue *q,
 				struct qcm_process_device *qpd,
 				const struct kfd_criu_queue_priv_data *qd,
-				const void *restore_mqd);
+				const void *restore_mqd,
+				const void *restore_ctl_stack);
 
 	int	(*destroy_queue)(struct device_queue_manager *dqm,
 				struct qcm_process_device *qpd,
@@ -142,11 +143,13 @@ struct device_queue_manager_ops {
 				  u32 *save_area_used_size);
 
 	void	(*get_queue_checkpoint_info)(struct device_queue_manager *dqm,
-				  const struct queue *q, u32 *mqd_size);
+				  const struct queue *q, u32 *mqd_size,
+				  u32 *ctl_stack_size);
 
 	int	(*checkpoint_mqd)(struct device_queue_manager *dqm,
 				  const struct queue *q,
-				  void *mqd);
+				  void *mqd,
+				  void *ctl_stack);
 };
 
 struct device_queue_manager_asic_ops {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
index cebb2877a505..23486a23df84 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
@@ -100,12 +100,19 @@ struct mqd_manager {
 				  u32 *ctl_stack_used_size,
 				  u32 *save_area_used_size);
 
-	void	(*checkpoint_mqd)(struct mqd_manager *mm, void *mqd, void *mqd_dst);
+	void	(*get_checkpoint_info)(struct mqd_manager *mm, void *mqd, uint32_t *ctl_stack_size);
+
+	void	(*checkpoint_mqd)(struct mqd_manager *mm,
+				  void *mqd,
+				  void *mqd_dst,
+				  void *ctl_stack_dst);
 
 	void	(*restore_mqd)(struct mqd_manager *mm, void **mqd,
 				struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 				struct queue_properties *p,
-				const void *mqd_src);
+				const void *mqd_src,
+				const void *ctl_stack_src,
+				const u32 ctl_stack_size);
 
 #if defined(CONFIG_DEBUG_FS)
 	int	(*debugfs_show_mqd)(struct seq_file *m, void *data);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
index dee90e72f672..8c28456adad5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
@@ -280,7 +280,7 @@ static int destroy_mqd(struct mqd_manager *mm, void *mqd,
 					pipe_id, queue_id);
 }
 
-static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct cik_mqd *m;
 
@@ -292,7 +292,8 @@ static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
 static void restore_mqd(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *qp,
-			const void *mqd_src)
+			const void *mqd_src,
+			const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct cik_mqd *m;
@@ -314,7 +315,10 @@ static void restore_mqd(struct mqd_manager *mm, void **mqd,
 	qp->is_active = 0;
 }
 
-static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void checkpoint_mqd_sdma(struct mqd_manager *mm,
+				void *mqd,
+				void *mqd_dst,
+				void *ctl_stack_dst)
 {
 	struct cik_sdma_rlc_registers *m;
 
@@ -326,7 +330,8 @@ static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst
 static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
 				struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 				struct queue_properties *qp,
-				const void *mqd_src)
+				const void *mqd_src,
+				const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct cik_sdma_rlc_registers *m;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
index 36109547494e..14cd3818f7ce 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
@@ -285,7 +285,7 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
-static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct v10_compute_mqd *m;
 
@@ -297,7 +297,8 @@ static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
 static void restore_mqd(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *qp,
-			const void *mqd_src)
+			const void *mqd_src,
+			const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct v10_compute_mqd *m;
@@ -408,7 +409,10 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
 	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
 }
 
-static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void checkpoint_mqd_sdma(struct mqd_manager *mm,
+				void *mqd,
+				void *mqd_dst,
+				void *ctl_stack_dst)
 {
 	struct v10_sdma_mqd *m;
 
@@ -420,7 +424,9 @@ static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst
 static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
 			     struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			     struct queue_properties *qp,
-			     const void *mqd_src)
+			     const void *mqd_src,
+			     const void *ctl_stack_src,
+			     const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct v10_sdma_mqd *m;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index 86ded61fbdeb..c79784be1b88 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -340,22 +340,34 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
-static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void get_checkpoint_info(struct mqd_manager *mm, void *mqd, u32 *ctl_stack_size)
+{
+	struct v9_mqd *m = get_mqd(mqd);
+
+	*ctl_stack_size = m->cp_hqd_cntl_stack_size;
+}
+
+static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct v9_mqd *m;
+	/* Control stack is located one page after MQD. */
+	void *ctl_stack = (void *)((uintptr_t)mqd + PAGE_SIZE);
 
 	m = get_mqd(mqd);
 
 	memcpy(mqd_dst, m, sizeof(struct v9_mqd));
+	memcpy(ctl_stack_dst, ctl_stack, m->cp_hqd_cntl_stack_size);
 }
 
 static void restore_mqd(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *qp,
-			const void *mqd_src)
+			const void *mqd_src,
+			const void *ctl_stack_src, u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct v9_mqd *m;
+	void *ctl_stack;
 
 	m = (struct v9_mqd *) mqd_mem_obj->cpu_ptr;
 	addr = mqd_mem_obj->gpu_addr;
@@ -366,6 +378,10 @@ static void restore_mqd(struct mqd_manager *mm, void **mqd,
 	if (gart_addr)
 		*gart_addr = addr;
 
+	/* Control stack is located one page after MQD. */
+	ctl_stack = (void *)((uintptr_t)*mqd + PAGE_SIZE);
+	memcpy(ctl_stack, ctl_stack_src, ctl_stack_size);
+
 	m->cp_hqd_pq_doorbell_control =
 		qp->doorbell_off <<
 			CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_OFFSET__SHIFT;
@@ -463,7 +479,10 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
 	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
 }
 
-static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void checkpoint_mqd_sdma(struct mqd_manager *mm,
+				void *mqd,
+				void *mqd_dst,
+				void *ctl_stack_dst)
 {
 	struct v9_sdma_mqd *m;
 
@@ -475,7 +494,8 @@ static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst
 static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
 			     struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			     struct queue_properties *qp,
-			     const void *mqd_src)
+			     const void *mqd_src,
+			     const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct v9_sdma_mqd *m;
@@ -534,6 +554,7 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
 		mqd->get_wave_state = get_wave_state;
+		mqd->get_checkpoint_info = get_checkpoint_info;
 		mqd->checkpoint_mqd = checkpoint_mqd;
 		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct v9_mqd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
index e0204392c6dc..897d089b1ee3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
@@ -306,7 +306,13 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
-static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void get_checkpoint_info(struct mqd_manager *mm, void *mqd, u32 *ctl_stack_size)
+{
+	/* Control stack is stored in user mode */
+	*ctl_stack_size = 0;
+}
+
+static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct vi_mqd *m;
 
@@ -318,7 +324,8 @@ static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
 static void restore_mqd(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *qp,
-			const void *mqd_src)
+			const void *mqd_src,
+			const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct vi_mqd *m;
@@ -341,7 +348,6 @@ static void restore_mqd(struct mqd_manager *mm, void **mqd,
 	qp->is_active = 0;
 }
 
-
 static void init_mqd_hiq(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *q)
@@ -435,7 +441,10 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
 	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
 }
 
-static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void checkpoint_mqd_sdma(struct mqd_manager *mm,
+				void *mqd,
+				void *mqd_dst,
+				void *ctl_stack_dst)
 {
 	struct vi_sdma_mqd *m;
 
@@ -447,7 +456,8 @@ static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst
 static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
 			     struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			     struct queue_properties *qp,
-			     const void *mqd_src)
+			     const void *mqd_src,
+			     const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct vi_sdma_mqd *m;
@@ -466,6 +476,7 @@ static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
 
 #if defined(CONFIG_DEBUG_FS)
 
+
 static int debugfs_show_mqd(struct seq_file *m, void *data)
 {
 	seq_hex_dump(m, "    ", DUMP_PREFIX_OFFSET, 32, 4,
@@ -506,6 +517,7 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
 		mqd->get_wave_state = get_wave_state;
+		mqd->get_checkpoint_info = get_checkpoint_info;
 		mqd->checkpoint_mqd = checkpoint_mqd;
 		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct vi_mqd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 9a381494eb67..34e0cafc3870 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1159,6 +1159,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			    unsigned int *qid,
 			    const struct kfd_criu_queue_priv_data *q_data,
 			    const void *restore_mqd,
+			    const void *restore_ctl_stack,
 			    uint32_t *p_doorbell_offset_in_process);
 int pqm_destroy_queue(struct process_queue_manager *pqm, unsigned int qid);
 int pqm_update_queue_properties(struct process_queue_manager *pqm, unsigned int qid,
@@ -1183,8 +1184,8 @@ int amdkfd_fence_wait_timeout(uint64_t *fence_addr,
 
 int pqm_get_queue_checkpoint_info(struct process_queue_manager *pqm,
 				  unsigned int qid,
-				  u32 *mqd_size);
-
+				  u32 *mqd_size,
+				  u32 *ctl_stack_size);
 /* Packet Manager */
 
 #define KFD_FENCE_COMPLETED (100)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 97e794d6bb76..4d8facfa6b03 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -210,6 +210,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			    unsigned int *qid,
 			    const struct kfd_criu_queue_priv_data *q_data,
 			    const void *restore_mqd,
+			    const void *restore_ctl_stack,
 			    uint32_t *p_doorbell_offset_in_process)
 {
 	int retval;
@@ -274,7 +275,8 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			goto err_create_queue;
 		pqn->q = q;
 		pqn->kq = NULL;
-		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data, restore_mqd);
+		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data,
+						    restore_mqd, restore_ctl_stack);
 		print_queue(q);
 		break;
 
@@ -294,7 +296,8 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			goto err_create_queue;
 		pqn->q = q;
 		pqn->kq = NULL;
-		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data, restore_mqd);
+		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data,
+						    restore_mqd, restore_ctl_stack);
 		print_queue(q);
 		break;
 	case KFD_QUEUE_TYPE_DIQ:
@@ -520,11 +523,17 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 }
 
 
-static int get_queue_data_sizes(struct kfd_process_device *pdd, struct queue *q, uint32_t *mqd_size)
+static int get_queue_data_sizes(struct kfd_process_device *pdd,
+				struct queue *q,
+				uint32_t *mqd_size,
+				uint32_t *ctl_stack_size)
 {
 	int ret;
 
-	ret = pqm_get_queue_checkpoint_info(&pdd->process->pqm, q->properties.queue_id, mqd_size);
+	ret = pqm_get_queue_checkpoint_info(&pdd->process->pqm,
+					    q->properties.queue_id,
+					    mqd_size,
+					    ctl_stack_size);
 	if (ret)
 		pr_err("Failed to get queue dump info (%d)\n", ret);
 
@@ -550,14 +559,15 @@ int kfd_process_get_queue_info(struct kfd_process *p,
 			if (q->properties.type == KFD_QUEUE_TYPE_COMPUTE ||
 				q->properties.type == KFD_QUEUE_TYPE_SDMA ||
 				q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI) {
-				uint32_t mqd_size;
+				uint32_t mqd_size, ctl_stack_size;
+
 				*num_queues = *num_queues + 1;
 
-				ret = get_queue_data_sizes(pdd, q, &mqd_size);
+				ret = get_queue_data_sizes(pdd, q, &mqd_size, &ctl_stack_size);
 				if (ret)
 					return ret;
 
-				extra_data_sizes += mqd_size;
+				extra_data_sizes += mqd_size + ctl_stack_size;
 			} else {
 				pr_err("Unsupported queue type (%d)\n", q->properties.type);
 				return -EOPNOTSUPP;
@@ -570,7 +580,10 @@ int kfd_process_get_queue_info(struct kfd_process *p,
 	return 0;
 }
 
-static int pqm_checkpoint_mqd(struct process_queue_manager *pqm, unsigned int qid, void *mqd)
+static int pqm_checkpoint_mqd(struct process_queue_manager *pqm,
+			      unsigned int qid,
+			      void *mqd,
+			      void *ctl_stack)
 {
 	struct process_queue_node *pqn;
 
@@ -585,17 +598,19 @@ static int pqm_checkpoint_mqd(struct process_queue_manager *pqm, unsigned int qi
 		return -EOPNOTSUPP;
 	}
 
-	return pqn->q->device->dqm->ops.checkpoint_mqd(pqn->q->device->dqm, pqn->q, mqd);
+	return pqn->q->device->dqm->ops.checkpoint_mqd(pqn->q->device->dqm,
+						       pqn->q, mqd, ctl_stack);
 }
 
 static int criu_checkpoint_queue(struct kfd_process_device *pdd,
 			   struct queue *q,
 			   struct kfd_criu_queue_priv_data *q_data)
 {
-	uint8_t *mqd;
+	uint8_t *mqd, *ctl_stack;
 	int ret;
 
 	mqd = (void *)(q_data + 1);
+	ctl_stack = mqd + q_data->mqd_size;
 
 	q_data->gpu_id = pdd->dev->id;
 	q_data->type = q->properties.type;
@@ -622,7 +637,7 @@ static int criu_checkpoint_queue(struct kfd_process_device *pdd,
 	q_data->ctx_save_restore_area_size =
 		q->properties.ctx_save_restore_area_size;
 
-	ret = pqm_checkpoint_mqd(&pdd->process->pqm, q->properties.queue_id, mqd);
+	ret = pqm_checkpoint_mqd(&pdd->process->pqm, q->properties.queue_id, mqd, ctl_stack);
 	if (ret) {
 		pr_err("Failed checkpoint queue_mqd (%d)\n", ret);
 		return ret;
@@ -646,6 +661,7 @@ static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
 		struct kfd_criu_queue_priv_data *q_data;
 		uint64_t q_data_size;
 		uint32_t mqd_size;
+		uint32_t ctl_stack_size;
 
 		if (q->properties.type != KFD_QUEUE_TYPE_COMPUTE &&
 			q->properties.type != KFD_QUEUE_TYPE_SDMA &&
@@ -655,11 +671,11 @@ static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
 			return -EOPNOTSUPP;
 		}
 
-		ret = get_queue_data_sizes(pdd, q, &mqd_size);
+		ret = get_queue_data_sizes(pdd, q, &mqd_size, &ctl_stack_size);
 		if (ret)
 			break;
 
-		q_data_size = sizeof(*q_data) + mqd_size;
+		q_data_size = sizeof(*q_data) + mqd_size + ctl_stack_size;
 
 		/* Increase local buffer space if needed */
 		if (q_private_data_size < q_data_size) {
@@ -675,8 +691,9 @@ static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
 
 		q_data = (struct kfd_criu_queue_priv_data *)q_private_data;
 
-		/* data stored in this order: priv_data, mqd */
+		/* data stored in this order: priv_data, mqd, ctl_stack */
 		q_data->mqd_size = mqd_size;
+		q_data->ctl_stack_size = ctl_stack_size;
 
 		ret = criu_checkpoint_queue(pdd, q, q_data);
 		if (ret)
@@ -750,8 +767,8 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 			   uint64_t *priv_data_offset,
 			   uint64_t max_priv_data_size)
 {
+	uint8_t *mqd, *ctl_stack, *q_extra_data = NULL;
 	struct kfd_criu_queue_priv_data *q_data;
-	uint8_t *mqd, *q_extra_data = NULL;
 	struct kfd_process_device *pdd;
 	uint64_t q_extra_data_size;
 	struct queue_properties qp;
@@ -773,7 +790,7 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 	}
 
 	*priv_data_offset += sizeof(*q_data);
-	q_extra_data_size = q_data->mqd_size;
+	q_extra_data_size = q_data->ctl_stack_size + q_data->mqd_size;
 
 	if (*priv_data_offset + q_extra_data_size > max_priv_data_size) {
 		ret = -EINVAL;
@@ -809,8 +826,9 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 		ret = -EFAULT;
 		return ret;
 	}
-	/* data stored in this order: mqd */
+	/* data stored in this order: mqd, ctl_stack */
 	mqd = q_extra_data;
+	ctl_stack = mqd + q_data->mqd_size;
 
 	memset(&qp, 0, sizeof(qp));
 	ret = set_queue_properties_from_criu(&qp, q_data);
@@ -819,7 +837,8 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 
 	print_queue_properties(&qp);
 
-	ret = pqm_create_queue(&p->pqm, pdd->dev, NULL, &qp, &queue_id, q_data, mqd, NULL);
+	ret = pqm_create_queue(&p->pqm, pdd->dev, NULL, &qp, &queue_id, q_data, mqd, ctl_stack,
+				NULL);
 	if (ret) {
 		pr_err("Failed to create new queue err:%d\n", ret);
 		ret = -EINVAL;
@@ -838,7 +857,8 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 
 int pqm_get_queue_checkpoint_info(struct process_queue_manager *pqm,
 				  unsigned int qid,
-				  uint32_t *mqd_size)
+				  uint32_t *mqd_size,
+				  uint32_t *ctl_stack_size)
 {
 	struct process_queue_node *pqn;
 
@@ -853,7 +873,9 @@ int pqm_get_queue_checkpoint_info(struct process_queue_manager *pqm,
 		return -EOPNOTSUPP;
 	}
 
-	pqn->q->device->dqm->ops.get_queue_checkpoint_info(pqn->q->device->dqm, pqn->q, mqd_size);
+	pqn->q->device->dqm->ops.get_queue_checkpoint_info(pqn->q->device->dqm,
+						       pqn->q, mqd_size,
+						       ctl_stack_size);
 	return 0;
 }
 
-- 
2.17.1

