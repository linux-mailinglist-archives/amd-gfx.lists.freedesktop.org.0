Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0428B3F69B7
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Aug 2021 21:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520496E0CA;
	Tue, 24 Aug 2021 19:22:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 896 seconds by postgrey-1.36 at gabe;
 Tue, 24 Aug 2021 19:22:39 UTC
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (unknown
 [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1206E0C2
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Aug 2021 19:22:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKPB2lefyhlXom2VehXYsWT8NbgoxxQrxFj/2uP0Qh0rb890248D5Yccc9s8KUFB/oapVmYQ9sYC9D4qObyKEoVZCvYPdujiMbUnYQvDEniJ4JPFDpyHR3zM5nX73IfQ3WWFcAHxBY58e2b7722GFkbKBbuJQEQM9j4ORmu0/9Zqma/+39fN4RQ/V1cLA0jvqNmySjugt3o8xoXmTKMuUyEdTPDpEPEAcv/7j0xNKrE2/wICqYRAdf91B7lm68VqPdArPq/TIbb+n7DEqafZPQ2/6xDbozQ4ox77L2xO3fml2JyT9NVkeVxQJXTzIRI7sUQJF6n9Gp7fGyqiEsTtAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDzXDXrmFey3s+m+0vfWgGIQXFkOrWXOHG5jgjYCXpw=;
 b=OWWFeLoYJPcSRPDtwe3X+fB+RgKoS8+Y6A6n504Y7JMK9ILoG1IRcObWXOIdHhpt8G561e4IJ0eZCcNzVGhIuASI5XXOPvsUY2n9CF4BsKKu/DlRRuwPamDz6bArfXEmshH8M9d28RDkTN4S9ZQMxDg9/bVx7b70oqQNjt9yKZ9X7A1SRd903CZSr2LET1+3c9nKXOq+Kml7dU4G43zNguG6vhRv7GrM/8qxioRIHFKi21lUm/Af2I15U1b2LeIahrLM+NatYdR+eO5ZoJUCFugt2zK4Vbb72jwW4PHejuJE2qibwvPIsVjmuyOS6ctgCZfKgQY2iPFoBVZqMzfUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDzXDXrmFey3s+m+0vfWgGIQXFkOrWXOHG5jgjYCXpw=;
 b=YbA9dnU0qbFagA06JRgugI2uuZvfuoX22l8C/Cih0HEu2kmGHIX8l5arfU8gLZW+FtTDWiWsgwrEBySCzGw4WWUKoTWcTFSVZ6tX8fMaC+TRWVtIUEdeILk+ovUPZt1BLvy4KtQTIf3jF4NPvkFJtOzrmSObzQkXMWgt50yAvCs=
Received: from DM6PR13CA0033.namprd13.prod.outlook.com (2603:10b6:5:bc::46) by
 BN9PR12MB5355.namprd12.prod.outlook.com (2603:10b6:408:104::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Tue, 24 Aug
 2021 19:07:40 +0000
Received: from DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::6e) by DM6PR13CA0033.outlook.office365.com
 (2603:10b6:5:bc::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.9 via Frontend
 Transport; Tue, 24 Aug 2021 19:07:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT011.mail.protection.outlook.com (10.13.172.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 19:07:40 +0000
Received: from dayatsin-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 24 Aug
 2021 14:07:36 -0500
From: David Yat Sin <david.yatsin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <felix.kuehling@amd.com>, <rajneesh.bhardwaj@amd.com>, David Yat Sin
 <david.yatsin@amd.com>
Subject: [PATCH v2 14/18] drm/amdkfd: CRIU dump/restore queue control stack
Date: Tue, 24 Aug 2021 15:06:35 -0400
Message-ID: <20210824190639.6288-15-david.yatsin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824190639.6288-1-david.yatsin@amd.com>
References: <20210824190639.6288-1-david.yatsin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4955d0af-7071-4efb-24d0-08d9673271d8
X-MS-TrafficTypeDiagnostic: BN9PR12MB5355:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5355515B114464A97D412DDD95C59@BN9PR12MB5355.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:80;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7PnODk9NH45VcqCd7yK3nw5mDdKCZPVTLfZlDMMxkxZXARIaHNj9TcmNMAAXhK3dt7CDG2juiNWq3Zqa65wFPXgt6JnLOWK0quCA24FWUcB0z3iaFv0Nslk9G8Wa/nMvEvC7mpBHCVvglQJBeB3udlieYNiMo0UuQvdvrpsjQPP+EMX75/TD22TkfUgRUz9v/wDMLndiO8E9KU1coH40KraitFuKOO0WhdYX7xuUzPxdt82SXn5/FYfo3WhRhyCQtRAgRpVM+ojhfidQ9ulHeT6/d5Sfe47OGqX2cS9+LtC/6/L6Bmj6hlUzUm0U88VGhDvpVf3bF0+au28nWh3ZZQ40ICnHThG9+N3+oT9w1VNAUGWuN6fIAG6vk30uHP1yCr8LytvA42+uXRcf1AFSOvMqwlqsVyjiESOkhZFeh33rgqDOQKwfqPBxNapcKrSMS96/GVflf0dt/zg5tazJgNIaNceZmsPwp/7qKi8JRaiFnDW/KuRdptxUozRAK7W4YanjKafNYfvZSnm9v6hSApWfoP15BkNzR42VOBiJWItiPOGYrMAHH+baCYmxokGxgU/uhpfodrZGkpsAlp9sObRzvauBwjzFDcpaz1vbwdoBdX2vSam3++uhUrizyIPxxxsT0VMLUaxF8FpP3CIy0Kfxlg0qyzBPKBaANGH5yqtIwTbQham9q0kITM+LKAFqAjzUUGYheXnLK6CD/vbsFQ3qAdkfULqBONoqEOa3YH1r3xYzvRsqz8jNOxi13SX8LVwkygHkZKqdBpLxgYI9fQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(36840700001)(8676002)(36756003)(70206006)(7696005)(2616005)(6916009)(26005)(81166007)(5660300002)(47076005)(30864003)(83380400001)(8936002)(336012)(426003)(1076003)(36860700001)(478600001)(70586007)(82310400003)(82740400003)(4326008)(186003)(2906002)(16526019)(86362001)(54906003)(356005)(316002)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 19:07:40.4582 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4955d0af-7071-4efb-24d0-08d9673271d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5355
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

Dump contents of queue control stacks on CRIU dump and restore them
during CRIU restore.

(rajneesh: rebased to 5.11 and fixed merge conflict)
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       |  2 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 30 +++++++----
 .../drm/amd/amdkfd/kfd_device_queue_manager.h | 10 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h  |  8 ++-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  | 17 ++++--
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  | 18 +++++--
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   | 27 ++++++++--
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   | 17 ++++--
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  8 +--
 .../amd/amdkfd/kfd_process_queue_manager.c    | 52 ++++++++++++-------
 11 files changed, 136 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index fad17f9b13f6..dd0ecfe76c2b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -313,7 +313,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 			dev->id);
 
 	err = pqm_create_queue(&p->pqm, dev, filep, &q_properties, &queue_id, NULL,
-			       NULL, &doorbell_offset_in_process);
+			NULL, NULL, &doorbell_offset_in_process);
 	if (err != 0)
 		goto err_create_queue;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
index c6c0cd47e7f7..3c29e60b967f 100644
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
index 14199e467e96..5943dcf1720f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -319,7 +319,8 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
 				struct queue *q,
 				struct qcm_process_device *qpd,
 				const struct kfd_criu_queue_priv_data *qd,
-				const void *restore_mqd)
+				const void *restore_mqd,
+				const void *restore_ctl_stack)
 {
 	struct mqd_manager *mqd_mgr;
 	int retval;
@@ -380,8 +381,9 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
 	}
 
 	if (qd)
-		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
-				&q->gart_mqd_addr, &q->properties, restore_mqd);
+		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj, &q->gart_mqd_addr,
+				     &q->properties, restore_mqd,
+				     restore_ctl_stack, qd->ctl_stack_size);
 	else
 		mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
 					&q->gart_mqd_addr, &q->properties);
@@ -1322,7 +1324,7 @@ static void destroy_kernel_queue_cpsch(struct device_queue_manager *dqm,
 static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 			struct qcm_process_device *qpd,
 			const struct kfd_criu_queue_priv_data *qd,
-			const void *restore_mqd)
+			const void *restore_mqd, const void *restore_ctl_stack)
 {
 	int retval;
 	struct mqd_manager *mqd_mgr;
@@ -1370,8 +1372,9 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 	q->properties.is_evicted = !!qpd->evicted;
 
 	if (qd)
-		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
-				&q->gart_mqd_addr, &q->properties, restore_mqd);
+		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj, &q->gart_mqd_addr,
+				     &q->properties, restore_mqd, restore_ctl_stack,
+				     qd->ctl_stack_size);
 	else
 		mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
 					&q->gart_mqd_addr, &q->properties);
@@ -1759,19 +1762,28 @@ static int get_wave_state(struct device_queue_manager *dqm,
 
 static void get_queue_dump_info(struct device_queue_manager *dqm,
 			const struct queue *q,
-			u32 *mqd_size)
+			u32 *mqd_size,
+			u32 *ctl_stack_size)
 {
 	struct mqd_manager *mqd_mgr;
 	enum KFD_MQD_TYPE mqd_type =
 			get_mqd_type_from_queue_type(q->properties.type);
 
+	dqm_lock(dqm);
 	mqd_mgr = dqm->mqd_mgrs[mqd_type];
 	*mqd_size = mqd_mgr->mqd_size;
+	*ctl_stack_size = 0;
+
+	if (q->properties.type == KFD_QUEUE_TYPE_COMPUTE && mqd_mgr->get_dump_info)
+		mqd_mgr->get_dump_info(mqd_mgr, q->mqd, ctl_stack_size);
+
+	dqm_unlock(dqm);
 }
 
 static int dump_mqd(struct device_queue_manager *dqm,
 			  const struct queue *q,
-			  void *mqd)
+			  void *mqd,
+			  void *ctl_stack)
 {
 	struct mqd_manager *mqd_mgr;
 	int r = 0;
@@ -1791,7 +1803,7 @@ static int dump_mqd(struct device_queue_manager *dqm,
 		goto dqm_unlock;
 	}
 
-	mqd_mgr->dump_mqd(mqd_mgr, q->mqd, mqd);
+	mqd_mgr->dump_mqd(mqd_mgr, q->mqd, mqd, ctl_stack);
 
 dqm_unlock:
 	dqm_unlock(dqm);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index ae4170aece6d..9d7d1308df71 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -88,7 +88,8 @@ struct device_queue_manager_ops {
 				struct queue *q,
 				struct qcm_process_device *qpd,
 				const struct kfd_criu_queue_priv_data *qd,
-				const void *restore_mqd);
+				const void *restore_mqd,
+				const void *restore_ctl_stack);
 
 	int	(*destroy_queue)(struct device_queue_manager *dqm,
 				struct qcm_process_device *qpd,
@@ -138,12 +139,13 @@ struct device_queue_manager_ops {
 				  u32 *save_area_used_size);
 
 	void	(*get_queue_dump_info)(struct device_queue_manager *dqm,
-				  const struct queue *q,
-				  u32 *mqd_size);
+				  const struct queue *q, u32 *mqd_size,
+				  u32 *ctl_stack_size);
 
 	int	(*dump_mqd)(struct device_queue_manager *dqm,
 				  const struct queue *q,
-				  void *mqd);
+				  void *mqd,
+				  void *ctl_stack);
 };
 
 struct device_queue_manager_asic_ops {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
index 497e6f874352..bb91b95b4970 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
@@ -98,12 +98,16 @@ struct mqd_manager {
 				  u32 *ctl_stack_used_size,
 				  u32 *save_area_used_size);
 
-	void	(*dump_mqd)(struct mqd_manager *mm, void *mqd, void *mqd_dst);
+	void	(*get_dump_info)(struct mqd_manager *mm, void *mqd, uint32_t *ctl_stack_size);
+
+	void	(*dump_mqd)(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst);
 
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
index 1d000252080c..bf32c67b723a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
@@ -275,7 +275,13 @@ static int destroy_mqd(struct mqd_manager *mm, void *mqd,
 					pipe_id, queue_id);
 }
 
-static void dump_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void get_dump_info(struct mqd_manager *mm, void *mqd, u32 *ctl_stack_size)
+{
+	/* Control stack is stored in user mode */
+	*ctl_stack_size = 0;
+}
+
+static void dump_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct cik_mqd *m;
 
@@ -287,7 +293,8 @@ static void dump_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
 static void restore_mqd(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *qp,
-			const void *mqd_src)
+			const void *mqd_src,
+			const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct cik_mqd *m;
@@ -309,7 +316,7 @@ static void restore_mqd(struct mqd_manager *mm, void **mqd,
 	qp->is_active = 0;
 }
 
-static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct cik_sdma_rlc_registers *m;
 
@@ -321,7 +328,8 @@ static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
 static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
 				struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 				struct queue_properties *qp,
-				const void *mqd_src)
+				const void *mqd_src,
+				const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct cik_sdma_rlc_registers *m;
@@ -451,6 +459,7 @@ struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd;
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
+		mqd->get_dump_info = get_dump_info;
 		mqd->dump_mqd = dump_mqd;
 		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct cik_mqd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
index 0066a2cf5672..6dd06ee98b60 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
@@ -283,7 +283,13 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
-static void dump_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void get_dump_info(struct mqd_manager *mm, void *mqd, u32 *ctl_stack_size)
+{
+	/* Control stack is stored in user mode */
+	*ctl_stack_size = 0;
+}
+
+static void dump_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct v10_compute_mqd *m;
 
@@ -295,7 +301,8 @@ static void dump_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
 static void restore_mqd(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *qp,
-			const void *mqd_src)
+			const void *mqd_src,
+			const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct v10_compute_mqd *m;
@@ -405,7 +412,7 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
 	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->kgd, mqd);
 }
 
-static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct v10_sdma_mqd *m;
 
@@ -417,7 +424,9 @@ static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
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
@@ -478,6 +487,7 @@ struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
 		mqd->is_occupied = is_occupied;
 		mqd->mqd_size = sizeof(struct v10_compute_mqd);
 		mqd->get_wave_state = get_wave_state;
+		mqd->get_dump_info = get_dump_info;
 		mqd->dump_mqd = dump_mqd;
 		mqd->restore_mqd = restore_mqd;
 #if defined(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index 5b6beb69dfc2..db9f138e1135 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -338,21 +338,34 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
-static void dump_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void get_dump_info(struct mqd_manager *mm, void *mqd, u32 *ctl_stack_size)
+{
+	struct v9_mqd *m = get_mqd(mqd);
+
+	*ctl_stack_size = m->cp_hqd_cntl_stack_size;
+}
+
+static void dump_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
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
-			struct queue_properties *qp, const void *mqd_src)
+			struct queue_properties *qp,
+			const void *mqd_src,
+			const void *ctl_stack_src, u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct v9_mqd *m;
+	void *ctl_stack;
 
 	m = (struct v9_mqd *) mqd_mem_obj->cpu_ptr;
 	addr = mqd_mem_obj->gpu_addr;
@@ -364,6 +377,9 @@ static void restore_mqd(struct mqd_manager *mm, void **mqd,
 		*gart_addr = addr;
 
 	/* Control stack is located one page after MQD. */
+	ctl_stack = (void *)((uintptr_t)*mqd + PAGE_SIZE);
+	memcpy(ctl_stack, ctl_stack_src, ctl_stack_size);
+
 	m->cp_hqd_pq_doorbell_control =
 		qp->doorbell_off <<
 			CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_OFFSET__SHIFT;
@@ -460,7 +476,7 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
 	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->kgd, mqd);
 }
 
-static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct v9_sdma_mqd *m;
 
@@ -471,7 +487,9 @@ static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
 
 static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
 			     struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
-			     struct queue_properties *qp, const void *mqd_src)
+			     struct queue_properties *qp,
+			     const void *mqd_src,
+			     const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct v9_sdma_mqd *m;
@@ -530,6 +548,7 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
 		mqd->get_wave_state = get_wave_state;
+		mqd->get_dump_info = get_dump_info;
 		mqd->dump_mqd = dump_mqd;
 		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct v9_mqd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
index ae5e3edec92e..88f320abe850 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
@@ -303,7 +303,13 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
-static void dump_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void get_dump_info(struct mqd_manager *mm, void *mqd, u32 *ctl_stack_size)
+{
+	/* Control stack is stored in user mode */
+	*ctl_stack_size = 0;
+}
+
+static void dump_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct vi_mqd *m;
 
@@ -315,7 +321,8 @@ static void dump_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
 static void restore_mqd(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *qp,
-			const void *mqd_src)
+			const void *mqd_src,
+			const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct vi_mqd *m;
@@ -429,7 +436,7 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
 	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->kgd, mqd);
 }
 
-static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct vi_sdma_mqd *m;
 
@@ -441,7 +448,8 @@ static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
 static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
 			     struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			     struct queue_properties *qp,
-			     const void *mqd_src)
+			     const void *mqd_src,
+			     const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct vi_sdma_mqd *m;
@@ -500,6 +508,7 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
 		mqd->get_wave_state = get_wave_state;
+		mqd->get_dump_info = get_dump_info;
 		mqd->dump_mqd = dump_mqd;
 		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct vi_mqd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 45be2daf49b3..b282aa9f9235 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1120,6 +1120,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			    unsigned int *qid,
 			    const struct kfd_criu_queue_priv_data *q_data,
 			    const void *restore_mqd,
+			    const void *restore_ctl_stack,
 			    uint32_t *p_doorbell_offset_in_process);
 int pqm_destroy_queue(struct process_queue_manager *pqm, unsigned int qid);
 int pqm_update_queue(struct process_queue_manager *pqm, unsigned int qid,
@@ -1142,11 +1143,12 @@ int amdkfd_fence_wait_timeout(uint64_t *fence_addr,
 			      uint64_t fence_value,
 			      unsigned int timeout_ms);
 int pqm_get_queue_dump_info(struct process_queue_manager *pqm,
-			unsigned int qid,
-			u32 *mqd_size);
+			    unsigned int qid,
+			    u32 *mqd_size, u32 *ctl_stack_size);
 int pqm_dump_mqd(struct process_queue_manager *pqm,
 		       unsigned int qid,
-		       void *dst_mqd);
+		       void *dst_mqd,
+		       void *dst_ctl_stack);
 
 /* Packet Manager */
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index b67d5dd3dda9..3b7747b7f388 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -209,6 +209,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			    unsigned int *qid,
 			    const struct kfd_criu_queue_priv_data *q_data,
 			    const void *restore_mqd,
+			    const void *restore_ctl_stack,
 			    uint32_t *p_doorbell_offset_in_process)
 {
 	int retval;
@@ -273,7 +274,8 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			goto err_create_queue;
 		pqn->q = q;
 		pqn->kq = NULL;
-		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data, restore_mqd);
+		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data,
+						    restore_mqd, restore_ctl_stack);
 		print_queue(q);
 		break;
 
@@ -293,7 +295,8 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			goto err_create_queue;
 		pqn->q = q;
 		pqn->kq = NULL;
-		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data, restore_mqd);
+		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data,
+						    restore_mqd, restore_ctl_stack);
 		print_queue(q);
 		break;
 	case KFD_QUEUE_TYPE_DIQ:
@@ -532,13 +535,15 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 static int get_queue_data_sizes(struct kfd_process_device *pdd,
 				struct queue *q,
 				uint32_t *cu_mask_size,
-				uint32_t *mqd_size)
+				uint32_t *mqd_size,
+				uint32_t *ctl_stack_size)
 {
 	int ret;
 
 	*cu_mask_size = sizeof(uint32_t) * (q->properties.cu_mask_count / 32);
 
-	ret = pqm_get_queue_dump_info(&pdd->process->pqm, q->properties.queue_id, mqd_size);
+	ret = pqm_get_queue_dump_info(&pdd->process->pqm, q->properties.queue_id, mqd_size,
+				      ctl_stack_size);
 	if (ret)
 		pr_err("Failed to get queue dump info (%d)\n", ret);
 
@@ -562,13 +567,15 @@ int kfd_process_get_queue_info(struct kfd_process *p, uint32_t *num_queues, uint
 				q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI) {
 				u32 cu_mask_size;
 				u32 mqd_size;
+				u32 ctl_stack_size;
 				int ret;
 
-				ret = get_queue_data_sizes(pdd, q, &cu_mask_size, &mqd_size);
+				ret = get_queue_data_sizes(pdd, q, &cu_mask_size, &mqd_size,
+							   &ctl_stack_size);
 				if (ret)
 					return ret;
 
-				data_sizes += cu_mask_size + mqd_size;
+				data_sizes += cu_mask_size + mqd_size + ctl_stack_size;
 				q_index++;
 			} else {
 				pr_err("Unsupported queue type (%d)\n", q->properties.type);
@@ -588,11 +595,12 @@ static int criu_dump_queue(struct kfd_process_device *pdd,
 			   void *private_data)
 {
 	struct kfd_criu_queue_priv_data *q_data = (struct kfd_criu_queue_priv_data *) private_data;
-	uint8_t *cu_mask, *mqd;
+	uint8_t *cu_mask, *mqd, *ctl_stack;
 	int ret;
 
 	cu_mask = (void *)(q_data + 1);
 	mqd = cu_mask + q_data->cu_mask_size;
+	ctl_stack = mqd + q_data->mqd_size;
 
 	q_bucket->gpu_id = pdd->dev->id;
 	q_data->type = q->properties.type;
@@ -622,7 +630,7 @@ static int criu_dump_queue(struct kfd_process_device *pdd,
 	if (q_data->cu_mask_size)
 		memcpy(cu_mask, q->properties.cu_mask, q_data->cu_mask_size);
 
-	ret = pqm_dump_mqd(&pdd->process->pqm, q->properties.queue_id, mqd);
+	ret = pqm_dump_mqd(&pdd->process->pqm, q->properties.queue_id, mqd, ctl_stack);
 	if (ret) {
 		pr_err("Failed dump queue_mqd (%d)\n", ret);
 		return ret;
@@ -650,6 +658,7 @@ static int criu_dump_queues_device(struct kfd_process_device *pdd,
 		uint64_t q_data_size;
 		uint32_t cu_mask_size;
 		uint32_t mqd_size;
+		uint32_t ctl_stack_size;
 
 		if (q->properties.type != KFD_QUEUE_TYPE_COMPUTE &&
 			q->properties.type != KFD_QUEUE_TYPE_SDMA &&
@@ -661,11 +670,11 @@ static int criu_dump_queues_device(struct kfd_process_device *pdd,
 
 		memset(&q_bucket, 0, sizeof(q_bucket));
 
-		ret = get_queue_data_sizes(pdd, q, &cu_mask_size, &mqd_size);
+		ret = get_queue_data_sizes(pdd, q, &cu_mask_size, &mqd_size, &ctl_stack_size);
 		if (ret)
 			return ret;
 
-		q_data_size = sizeof(*q_data) + cu_mask_size + mqd_size;
+		q_data_size = sizeof(*q_data) + cu_mask_size + mqd_size + ctl_stack_size;
 
 		/* Increase local buffer space if needed */
 		if (q_private_data_size < q_data_size) {
@@ -681,8 +690,10 @@ static int criu_dump_queues_device(struct kfd_process_device *pdd,
 
 		q_data = (struct kfd_criu_queue_priv_data *)q_private_data;
 
+		/* data stored in this order: priv_data, cu_mask, mqd, ctl_stack */
 		q_data->cu_mask_size = cu_mask_size;
 		q_data->mqd_size = mqd_size;
+		q_data->ctl_stack_size = ctl_stack_size;
 
 		ret = criu_dump_queue(pdd, q, &q_bucket, q_data);
 		if (ret)
@@ -739,8 +750,8 @@ int kfd_criu_dump_queues(struct kfd_process *p, struct kfd_ioctl_criu_dumper_arg
 		return -EINVAL;
 	}
 
-	/* Queue private data size for each queue can vary in size as it also includes cu_mask, mqd.
-	 * First queue private data starts after all queue_buckets
+	/* Queue private data size for each queue can vary in size as it also includes cu_mask, mqd
+	 * and ctl_stack. First queue private data starts after all queue_buckets
 	 */
 
 	queue_buckets = (struct kfd_criu_queue_bucket *)args->objects;
@@ -805,16 +816,17 @@ static int criu_restore_queue(struct kfd_process *p,
 			      void *private_data)
 {
 	struct kfd_criu_queue_priv_data *q_data = (struct kfd_criu_queue_priv_data *) private_data;
-	uint8_t *cu_mask, *mqd;
+	uint8_t *cu_mask, *mqd, *ctl_stack;
 	struct queue_properties qp;
 	unsigned int queue_id;
 	int ret = 0;
 
 	pr_debug("Restoring Queue: gpu_id:%x queue_id:%u\n", q_bucket->gpu_id, q_data->q_id);
 
-	/* data stored in this order: cu_mask, mqd */
+	/* data stored in this order: cu_mask, mqd, ctl_stack */
 	cu_mask = (void *)(q_data + 1);
 	mqd = cu_mask + q_data->cu_mask_size;
+	ctl_stack = mqd + q_data->mqd_size;
 
 	memset(&qp, 0, sizeof(qp));
 	ret = set_queue_properties_from_criu(&qp, q_bucket, q_data, cu_mask);
@@ -823,7 +835,7 @@ static int criu_restore_queue(struct kfd_process *p,
 
 	print_queue_properties(&qp);
 
-	ret = pqm_create_queue(&p->pqm, dev, NULL, &qp, &queue_id, q_data, mqd, NULL);
+	ret = pqm_create_queue(&p->pqm, dev, NULL, &qp, &queue_id, q_data, mqd, ctl_stack, NULL);
 	if (ret) {
 		pr_err("Failed to create new queue err:%d\n", ret);
 		ret = -EINVAL;
@@ -922,7 +934,8 @@ int kfd_criu_restore_queues(struct kfd_process *p, struct kfd_ioctl_criu_restore
 
 int pqm_get_queue_dump_info(struct process_queue_manager *pqm,
 			unsigned int qid,
-			u32 *mqd_size)
+			u32 *mqd_size,
+			u32 *ctl_stack_size)
 {
 	struct process_queue_node *pqn;
 
@@ -938,12 +951,13 @@ int pqm_get_queue_dump_info(struct process_queue_manager *pqm,
 	}
 
 	pqn->q->device->dqm->ops.get_queue_dump_info(pqn->q->device->dqm,
-						       pqn->q, mqd_size);
+						       pqn->q, mqd_size,
+						       ctl_stack_size);
 	return 0;
 }
 
 int pqm_dump_mqd(struct process_queue_manager *pqm,
-		       unsigned int qid, void *mqd)
+		       unsigned int qid, void *mqd, void *ctl_stack)
 {
 	struct process_queue_node *pqn;
 
@@ -959,7 +973,7 @@ int pqm_dump_mqd(struct process_queue_manager *pqm,
 	}
 
 	return pqn->q->device->dqm->ops.dump_mqd(pqn->q->device->dqm,
-						       pqn->q, mqd);
+						       pqn->q, mqd, ctl_stack);
 }
 
 #if defined(CONFIG_DEBUG_FS)
-- 
2.17.1

