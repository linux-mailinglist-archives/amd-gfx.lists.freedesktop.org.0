Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCF03CB9F8
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Jul 2021 17:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB486E9B7;
	Fri, 16 Jul 2021 15:37:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAAB6E9B7
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Jul 2021 15:37:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4KLmCca4e03PXll8NJUy+HZXgFPvjjIebWuZt7EvH8OQsuol6oJjaf63se4NPSVVObwl/TTVl5tuKDsIFWZsr+OGmvMxVmJCAc6niRlgwZCO3a9zgk5zHkFbrtIioY3izxc+mE0K4TtKu3rUMQ2I1sE5yRUNLDmvafeVDH95856JrfBbMumMAEnCKHSoZXX4x+UCbJCjMWpKpW3pfwuhQDc5gUK+OAp74aWvP8rbmZ7RhVFs7L78JS10bkYLqRvvPXJRdSlLqSTtT9PaHHnf5VJ+u9r9UUP33RtzFlABKMx+efTniOgHa9tVoM8zH8U6qaX3atQS17W0TNJANMepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpUr/01xTtxWCzzR7m92m7qoYg31Cnj2o8JhcjCNf+M=;
 b=gKLSUPkSzV6GhTVz2B0u6Sx6A744iiEGu5hd8CwSLbuDoQIwpS3B3awJOp4tj0ipi4hjNPtUaa3ubNM5rQGnhNzH+aGvkozb/DeK3oT0AHVZmRu82SQ8uLKrghd+QsHxu8GSZTFWnPrp5yeZ0SFHJg/ABxsfdHiy6uGZDH3/xbSwWpJefxAzqZZUtkMwhsUrClIpa5GKo34cM4usADMqRpI2gMpM2j54tsVV2e1rdifPBRFmSYpscs4cNuui9gra30hhTCBNGSPGH0zFmYP8F0MmonWhnXdTNBA3SGw4oYyLbW3VjLXKj39auCLDaqzUo2sPbeypIFiivZrjMVx3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpUr/01xTtxWCzzR7m92m7qoYg31Cnj2o8JhcjCNf+M=;
 b=CgnH5Ca149hDujxbAWzzfbLPZaHeVLBg0FLv2of43GtcO1/X4xliANKYtPRY0vQ9gv9GkXueINz8+U1S15Xas0k/irJA6RLnPgEPKRS0gU5Tk69mFBx1C4aGCDZFm0MrhIObgBorCDsxIqdAqGsh5zHurcPirgRC+zGZAZmEWWk=
Received: from BN9PR03CA0771.namprd03.prod.outlook.com (2603:10b6:408:13a::26)
 by BN8PR12MB3122.namprd12.prod.outlook.com (2603:10b6:408:44::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Fri, 16 Jul
 2021 15:37:00 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::8f) by BN9PR03CA0771.outlook.office365.com
 (2603:10b6:408:13a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Fri, 16 Jul 2021 15:37:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 15:37:00 +0000
Received: from ozeng-develop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 10:36:59 -0500
From: Oak Zeng <Oak.Zeng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/5] drm/amdkfd: Renaming dqm->packets to dqm->packet_mgr
Date: Fri, 16 Jul 2021 10:36:48 -0500
Message-ID: <1626449810-18044-4-git-send-email-Oak.Zeng@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626449810-18044-1-git-send-email-Oak.Zeng@amd.com>
References: <1626449810-18044-1-git-send-email-Oak.Zeng@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b11b3da-c81e-477a-ef7a-08d9486f8da9
X-MS-TrafficTypeDiagnostic: BN8PR12MB3122:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3122F5BE533341C84207B5AF80119@BN8PR12MB3122.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:275;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vm5i/42Q6L+ArdYOu6glRE6rVNvUumSVa0QX33dWUScEeEgHuDUCcj19GuMMZxcI6PqmeKvajkJd8saOnBFs6pcjYmH1nPf19vLJMNTNdqBgfHz1kQGHoc6cnMB65Z2cm0I4RrU1OsU0c7ODVJUs246mW2W31ZjBVjCgyBAKcfiYgsdEP2EnYdPChG46dEHeyor2IbgSBhaahaqiJCc4ZP9OF45T1J/UYRXH3h3dkux7OEMiJWjkMO1Rf2XVOEREwyds8h6Lgr5gqoMXE7ETC+ocoGMsinFgv9OEF4bXfQl+DWh67L7aVkukicrS2F9uFpHneEp0WwSoLp2NBXpk15Do3wc1LwqrKXgYQSXn0WTe6OzuGPrE4Z263ooT22pfXE4Lj1I915BX21Lev5aVI1bCY7+3M6ii3Zf2FhJnr8I+5jBpZlJukIn0lhu2RBdUFt1CuU4AV7FlSvvkx1qUyfkfdxCoxiNbC1UyE+oROoBuy8RpTFlW4x76Vzrw7QvPlRu+Uz/vje9UTayE5+38IKKkElt/+v+wEpiiPt9UT25bs+uLhol4ZVh23sIG4Id8JlfpcfZVx+H/LldRkSSiCko9afihED3OhVOqx8sHcFNwIJB3px3hDL6WYTKwpEcUmeEMhNOsNPwtChX8XJifp9ETKtG2OOOrIDk9YyIOjPUke8Q9WS3Sv3+JrkbOesuDvMhw9fg3dCM6B1/+n27QuYLPh4SjYYxR6JlibDleJP0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(36840700001)(46966006)(2616005)(86362001)(7696005)(5660300002)(478600001)(16526019)(2906002)(83380400001)(70206006)(26005)(426003)(70586007)(8676002)(186003)(36756003)(4326008)(36860700001)(6916009)(81166007)(54906003)(8936002)(336012)(47076005)(82740400003)(316002)(6666004)(356005)(82310400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 15:37:00.4410 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b11b3da-c81e-477a-ef7a-08d9486f8da9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3122
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
Cc: feifei.xu@amd.com, Felix.Kuehling@amd.com, leo.liu@amd.com,
 Oak Zeng <Oak.Zeng@amd.com>, hawking.zhang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Renaming packets to packet_mgr to reflect the real meaning
of this variable.

Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
Acked-by: Christian Konig <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  2 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  | 26 +++++++++++-----------
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  2 +-
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 9e4a05e..03875d2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -1390,7 +1390,7 @@ int kfd_debugfs_hang_hws(struct kfd_dev *dev)
 		return -EINVAL;
 	}
 
-	r = pm_debugfs_hang_hws(&dev->dqm->packets);
+	r = pm_debugfs_hang_hws(&dev->dqm->packet_mgr);
 	if (!r)
 		r = dqm_debugfs_execute_queues(dev->dqm);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 16a1713..6b2f594 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -260,7 +260,7 @@ static int allocate_vmid(struct device_queue_manager *dqm,
 static int flush_texture_cache_nocpsch(struct kfd_dev *kdev,
 				struct qcm_process_device *qpd)
 {
-	const struct packet_manager_funcs *pmf = qpd->dqm->packets.pmf;
+	const struct packet_manager_funcs *pmf = qpd->dqm->packet_mgr.pmf;
 	int ret;
 
 	if (!qpd->ib_kaddr)
@@ -1000,7 +1000,7 @@ static int start_nocpsch(struct device_queue_manager *dqm)
 	init_interrupts(dqm);
 	
 	if (dqm->dev->device_info->asic_family == CHIP_HAWAII)
-		return pm_init(&dqm->packets, dqm);
+		return pm_init(&dqm->packet_mgr, dqm);
 	dqm->sched_running = true;
 
 	return 0;
@@ -1009,7 +1009,7 @@ static int start_nocpsch(struct device_queue_manager *dqm)
 static int stop_nocpsch(struct device_queue_manager *dqm)
 {
 	if (dqm->dev->device_info->asic_family == CHIP_HAWAII)
-		pm_uninit(&dqm->packets, false);
+		pm_uninit(&dqm->packet_mgr, false);
 	dqm->sched_running = false;
 
 	return 0;
@@ -1124,7 +1124,7 @@ static int set_sched_resources(struct device_queue_manager *dqm)
 			"queue mask: 0x%8llX\n",
 			res.vmid_mask, res.queue_mask);
 
-	return pm_send_set_resources(&dqm->packets, &res);
+	return pm_send_set_resources(&dqm->packet_mgr, &res);
 }
 
 static int initialize_cpsch(struct device_queue_manager *dqm)
@@ -1164,7 +1164,7 @@ static int start_cpsch(struct device_queue_manager *dqm)
 
 	retval = 0;
 
-	retval = pm_init(&dqm->packets, dqm);
+	retval = pm_init(&dqm->packet_mgr, dqm);
 	if (retval)
 		goto fail_packet_manager_init;
 
@@ -1197,7 +1197,7 @@ static int start_cpsch(struct device_queue_manager *dqm)
 	return 0;
 fail_allocate_vidmem:
 fail_set_sched_resources:
-	pm_uninit(&dqm->packets, false);
+	pm_uninit(&dqm->packet_mgr, false);
 fail_packet_manager_init:
 	return retval;
 }
@@ -1213,10 +1213,10 @@ static int stop_cpsch(struct device_queue_manager *dqm)
 	dqm->sched_running = false;
 	dqm_unlock(dqm);
 
-	pm_release_ib(&dqm->packets);
+	pm_release_ib(&dqm->packet_mgr);
 
 	kfd_gtt_sa_free(dqm->dev, dqm->fence_mem);
-	pm_uninit(&dqm->packets, hanging);
+	pm_uninit(&dqm->packet_mgr, hanging);
 
 	return 0;
 }
@@ -1390,7 +1390,7 @@ static int map_queues_cpsch(struct device_queue_manager *dqm)
 	if (dqm->active_runlist)
 		return 0;
 
-	retval = pm_send_runlist(&dqm->packets, &dqm->queues);
+	retval = pm_send_runlist(&dqm->packet_mgr, &dqm->queues);
 	pr_debug("%s sent runlist\n", __func__);
 	if (retval) {
 		pr_err("failed to execute runlist\n");
@@ -1416,13 +1416,13 @@ static int unmap_queues_cpsch(struct device_queue_manager *dqm,
 	if (!dqm->active_runlist)
 		return retval;
 
-	retval = pm_send_unmap_queue(&dqm->packets, KFD_QUEUE_TYPE_COMPUTE,
+	retval = pm_send_unmap_queue(&dqm->packet_mgr, KFD_QUEUE_TYPE_COMPUTE,
 			filter, filter_param, false, 0);
 	if (retval)
 		return retval;
 
 	*dqm->fence_addr = KFD_FENCE_INIT;
-	pm_send_query_status(&dqm->packets, dqm->fence_gpu_addr,
+	pm_send_query_status(&dqm->packet_mgr, dqm->fence_gpu_addr,
 				KFD_FENCE_COMPLETED);
 	/* should be timed out */
 	retval = amdkfd_fence_wait_timeout(dqm->fence_addr, KFD_FENCE_COMPLETED,
@@ -1448,14 +1448,14 @@ static int unmap_queues_cpsch(struct device_queue_manager *dqm,
 	 * check those fields
 	 */
 	mqd_mgr = dqm->mqd_mgrs[KFD_MQD_TYPE_HIQ];
-	if (mqd_mgr->read_doorbell_id(dqm->packets.priv_queue->queue->mqd)) {
+	if (mqd_mgr->read_doorbell_id(dqm->packet_mgr.priv_queue->queue->mqd)) {
 		pr_err("HIQ MQD's queue_doorbell_id0 is not 0, Queue preemption time out\n");
 		while (halt_if_hws_hang)
 			schedule();
 		return -ETIME;
 	}
 
-	pm_release_ib(&dqm->packets);
+	pm_release_ib(&dqm->packet_mgr);
 	dqm->active_runlist = false;
 
 	return retval;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index 71e2fde..c871968 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -169,7 +169,7 @@ struct device_queue_manager {
 	struct device_queue_manager_asic_ops asic_ops;
 
 	struct mqd_manager	*mqd_mgrs[KFD_MQD_TYPE_MAX];
-	struct packet_manager	packets;
+	struct packet_manager	packet_mgr;
 	struct kfd_dev		*dev;
 	struct mutex		lock_hidden; /* use dqm_lock/unlock(dqm) */
 	struct list_head	queues;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index b1ce072..72e3cd6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1630,7 +1630,7 @@ int kfd_debugfs_rls_by_device(struct seq_file *m, void *data)
 		}
 
 		seq_printf(m, "Node %u, gpu_id %x:\n", i++, dev->gpu->id);
-		r = pm_debugfs_runlist(m, &dev->gpu->dqm->packets);
+		r = pm_debugfs_runlist(m, &dev->gpu->dqm->packet_mgr);
 		if (r)
 			break;
 	}
-- 
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
