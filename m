Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6E753ED8D
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Jun 2022 20:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4110710EF92;
	Mon,  6 Jun 2022 18:08:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C44510EF92
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jun 2022 18:08:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIKNpty8v/Z7G2NdG/xoV/GrTovOKYdBqsjlULTU8GBGz2++N2hadlJ0qzvc8LUbIanTNkx0VACqL35DcB0JltPi8EDOx2ewUYabD8wt6udqU5oXWzJt9hwPImG0Tn3sgWufB9brt1L4WOWJXHTS5AzeSC9Kd2jmruBB3Hft58oo/vPbyhible8uVVOYN/mG4WXBrdrOMwKA06xLsAjzF5mU6Hzzw6OHsXOxS6BE5oOpUefekCwwz3b3Sw7VJpgcDMcQQrxHbpSeahr/gy9mFLGU/EZNUI9K89pYnHNFEjZOhR4Ll4za/HcIve+WABw92/pNl5A4E4HKuVU36b4Wog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CFhhKLIM5aTNy9lUykBIZJ7gGYIhbFRr4dsA2IoEUc=;
 b=Pb1qV3kiy3iNhdGPQ97d8xWwl2tJpHSORU3smNA5TXNDVVN10yYfeel8RfKO335eoVmf9kfbs2fxYF2VyVoIMGRrkmeZT8+ppJmbg0lTchATye1mQ/loWXuEgj77fS550bno0Kan/IC9b9nMCPYgCTZg95a7ZTTNlc3gdMxKXDesZDhwZ9XGSCXVFRu0GJAkWWN8xdU8KPAMAH6095JuntnY8i3oVxh+AHvx8NPyNeYrPkUS0jy0xlkwolpdVL+HVI/SkFQJ97NAPfEnAHI6naC33Xm/+Bn9lNIZeKfVZEjL5o/EZXkjA9b/HdUcUuWDnfNtK0iWU4wh6lRI46nt7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CFhhKLIM5aTNy9lUykBIZJ7gGYIhbFRr4dsA2IoEUc=;
 b=s0NTIy+h2MHU6QfA/xve9TD1hp2XxUG1kEgcp8WmK3LeWeB3MCdVv9Ru1/fSsDGS3qYQK4jjJtEaGsLdTalG70ui1tzUxaYgew2/RJ82rcNOdXnj/HJrV3iVWqmN3gGW0mQyehwxZ5YmBxbPNl26zwufqA/nBFAQKkd16i7nc2o=
Received: from MWH0EPF00056D02.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:f) by DM6PR12MB4732.namprd12.prod.outlook.com
 (2603:10b6:5:32::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 18:08:18 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::208) by MWH0EPF00056D02.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.1 via Frontend
 Transport; Mon, 6 Jun 2022 18:08:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 18:08:17 +0000
Received: from RErrabolDevMach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 6 Jun
 2022 13:08:14 -0500
From: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdkfd: Extend KFD device topology to surface
 peer-to-peer links
Date: Mon, 6 Jun 2022 13:08:06 -0500
Message-ID: <20220606180806.3322667-1-Ramesh.Errabolu@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0949007-63c8-4835-6df5-08da47e78882
X-MS-TrafficTypeDiagnostic: DM6PR12MB4732:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4732B6F2E4B174E132112750E3A29@DM6PR12MB4732.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ci7MDos+KCnO7x8tP/ZovocVKqbe93/8sRoKo06QD/Auncr2j0UTSC9TxvHnhCFl/MSY0JrkDPjVDpISsGLL6R+fknoigXH3QEzm3syrZGiYBjggdB09R1x8mtcWCGvY4Q6wuR6BF2ka2yQzIQBPGT12N/F+SY9dJV2L/IpqFsGymp0mUoAtCLwePsdRnaEFTSe4Z3h6vlaGASNZg60vhIA3DxxkvYtVEtYBNSBLkn5eG9G9ajjXAJ+5tajNf5NIhJ9sJaid1jibbQqfpOsWQ3FjrF7Y8QOWXkt+dyJRzkHGPXz6imUBGDmFoOsg7xNRKrJ/iuzPDa8DXC7b2bc3Vx474kAdpehhtyyhC/gjGPoVRSiXSpfiEDlpPPHBk+bx3MidglK0XbtcVuZIDp4XISUT17ieDSPM728gBDzHflq/VGZPszXTqCdeHNSu/zytS27Moy3VNTrqEJM6N0RQz41qllZXFg2+/BAcy13SBqjYTuLZHkQ2PgbXQD27Vs7a5rr29zvCbjG/Y0kZDWHSClRH5/b6Brbl+JWlTswIp2+UH3mlzRbrQ8cYKyG9J/UCRbwToV2MApTuCGO1vYijvuHXrsV9dXVnl3bFR6Rg7OSUGcUVIIVPkN6pLkbB19UUm8a4qDYfw6Lsp45Jci/MPDQ4BslDoPUMPRUtqUgT9jCKMdITMUBXMqx3KbUhqYlBK3GUabVGSD6Tkc/6puS++A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6666004)(7696005)(47076005)(4326008)(86362001)(36860700001)(508600001)(8676002)(186003)(2616005)(8936002)(82310400005)(70206006)(5660300002)(36756003)(2906002)(40460700003)(16526019)(1076003)(83380400001)(426003)(356005)(6916009)(26005)(81166007)(316002)(336012)(30864003)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 18:08:17.7738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0949007-63c8-4835-6df5-08da47e78882
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4732
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
Cc: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Extend KFD device topology to surface peer-to-peer links among
GPU devices connected over PCIe or xGMI. Enabling HSA_AMD_P2P is
REQUIRED to surface peer-to-peer links.

Prior to this KFD did not expose to user mode any P2P links or
indirect links that go over two or more direct hops. Old versions
of the Thunk used to make up their own P2P and indirect links without
the information about peer-accessibility and chipset support available
to the kernel mode driver. In this patch we expose P2P links in a new
sysfs directory to provide more reliable P2P link information to user
mode.

Old versions of the Thunk will continue to work as before and ignore
the new directory. This avoids conflicts between P2P links exposed by
KFD and P2P links created by the Thunk itself. New versions of the Thunk
will use only the P2P links provided in the new p2p_links directory, if
it exists, or fall back to the old code path on older KFDs that don't
expose p2p_links.

Signed-off-by: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 319 +++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h |   3 +
 2 files changed, 320 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 8d50d207cf66..3e240b22ec91 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -40,6 +40,7 @@
 #include "kfd_svm.h"
 #include "amdgpu_amdkfd.h"
 #include "amdgpu_ras.h"
+#include "amdgpu.h"
 
 /* topology_device_list - Master list of all topology devices */
 static struct list_head topology_device_list;
@@ -148,6 +149,7 @@ static void kfd_release_topology_device(struct kfd_topology_device *dev)
 	struct kfd_mem_properties *mem;
 	struct kfd_cache_properties *cache;
 	struct kfd_iolink_properties *iolink;
+	struct kfd_iolink_properties *p2plink;
 	struct kfd_perf_properties *perf;
 
 	list_del(&dev->list);
@@ -173,6 +175,13 @@ static void kfd_release_topology_device(struct kfd_topology_device *dev)
 		kfree(iolink);
 	}
 
+	while (dev->p2p_link_props.next != &dev->p2p_link_props) {
+		p2plink = container_of(dev->p2p_link_props.next,
+				struct kfd_iolink_properties, list);
+		list_del(&p2plink->list);
+		kfree(p2plink);
+	}
+
 	while (dev->perf_props.next != &dev->perf_props) {
 		perf = container_of(dev->perf_props.next,
 				struct kfd_perf_properties, list);
@@ -214,6 +223,7 @@ struct kfd_topology_device *kfd_create_topology_device(
 	INIT_LIST_HEAD(&dev->mem_props);
 	INIT_LIST_HEAD(&dev->cache_props);
 	INIT_LIST_HEAD(&dev->io_link_props);
+	INIT_LIST_HEAD(&dev->p2p_link_props);
 	INIT_LIST_HEAD(&dev->perf_props);
 
 	list_add_tail(&dev->list, device_list);
@@ -465,6 +475,8 @@ static ssize_t node_show(struct kobject *kobj, struct attribute *attr,
 			      dev->node_props.caches_count);
 	sysfs_show_32bit_prop(buffer, offs, "io_links_count",
 			      dev->node_props.io_links_count);
+	sysfs_show_32bit_prop(buffer, offs, "p2p_links_count",
+			      dev->node_props.p2p_links_count);
 	sysfs_show_32bit_prop(buffer, offs, "cpu_core_id_base",
 			      dev->node_props.cpu_core_id_base);
 	sysfs_show_32bit_prop(buffer, offs, "simd_id_base",
@@ -568,6 +580,7 @@ static void kfd_remove_sysfs_file(struct kobject *kobj, struct attribute *attr)
 
 static void kfd_remove_sysfs_node_entry(struct kfd_topology_device *dev)
 {
+	struct kfd_iolink_properties *p2plink;
 	struct kfd_iolink_properties *iolink;
 	struct kfd_cache_properties *cache;
 	struct kfd_mem_properties *mem;
@@ -585,6 +598,18 @@ static void kfd_remove_sysfs_node_entry(struct kfd_topology_device *dev)
 		dev->kobj_iolink = NULL;
 	}
 
+	if (dev->kobj_p2plink) {
+		list_for_each_entry(p2plink, &dev->p2p_link_props, list)
+			if (p2plink->kobj) {
+				kfd_remove_sysfs_file(p2plink->kobj,
+							&p2plink->attr);
+				p2plink->kobj = NULL;
+			}
+		kobject_del(dev->kobj_p2plink);
+		kobject_put(dev->kobj_p2plink);
+		dev->kobj_p2plink = NULL;
+	}
+
 	if (dev->kobj_cache) {
 		list_for_each_entry(cache, &dev->cache_props, list)
 			if (cache->kobj) {
@@ -631,6 +656,7 @@ static void kfd_remove_sysfs_node_entry(struct kfd_topology_device *dev)
 static int kfd_build_sysfs_node_entry(struct kfd_topology_device *dev,
 		uint32_t id)
 {
+	struct kfd_iolink_properties *p2plink;
 	struct kfd_iolink_properties *iolink;
 	struct kfd_cache_properties *cache;
 	struct kfd_mem_properties *mem;
@@ -668,6 +694,10 @@ static int kfd_build_sysfs_node_entry(struct kfd_topology_device *dev,
 	if (!dev->kobj_iolink)
 		return -ENOMEM;
 
+	dev->kobj_p2plink = kobject_create_and_add("p2p_links", dev->kobj_node);
+	if (!dev->kobj_p2plink)
+		return -ENOMEM;
+
 	dev->kobj_perf = kobject_create_and_add("perf", dev->kobj_node);
 	if (!dev->kobj_perf)
 		return -ENOMEM;
@@ -757,6 +787,27 @@ static int kfd_build_sysfs_node_entry(struct kfd_topology_device *dev,
 		i++;
 	}
 
+	i = 0;
+	list_for_each_entry(p2plink, &dev->p2p_link_props, list) {
+		p2plink->kobj = kzalloc(sizeof(struct kobject), GFP_KERNEL);
+		if (!p2plink->kobj)
+			return -ENOMEM;
+		ret = kobject_init_and_add(p2plink->kobj, &iolink_type,
+				dev->kobj_p2plink, "%d", i);
+		if (ret < 0) {
+			kobject_put(p2plink->kobj);
+			return ret;
+		}
+
+		p2plink->attr.name = "properties";
+		p2plink->attr.mode = KFD_SYSFS_FILE_MODE;
+		sysfs_attr_init(&iolink->attr);
+		ret = sysfs_create_file(p2plink->kobj, &p2plink->attr);
+		if (ret < 0)
+			return ret;
+		i++;
+	}
+
 	/* All hardware blocks have the same number of attributes. */
 	num_attrs = ARRAY_SIZE(perf_attr_iommu);
 	list_for_each_entry(perf, &dev->perf_props, list) {
@@ -1145,6 +1196,7 @@ static struct kfd_topology_device *kfd_assign_gpu(struct kfd_dev *gpu)
 	struct kfd_mem_properties *mem;
 	struct kfd_cache_properties *cache;
 	struct kfd_iolink_properties *iolink;
+	struct kfd_iolink_properties *p2plink;
 
 	down_write(&topology_lock);
 	list_for_each_entry(dev, &topology_device_list, list) {
@@ -1165,6 +1217,8 @@ static struct kfd_topology_device *kfd_assign_gpu(struct kfd_dev *gpu)
 				cache->gpu = dev->gpu;
 			list_for_each_entry(iolink, &dev->io_link_props, list)
 				iolink->gpu = dev->gpu;
+			list_for_each_entry(p2plink, &dev->p2p_link_props, list)
+				p2plink->gpu = dev->gpu;
 			break;
 		}
 	}
@@ -1287,6 +1341,250 @@ static void kfd_fill_iolink_non_crat_info(struct kfd_topology_device *dev)
 			kfd_set_iolink_non_coherent(peer_dev, link, inbound_link);
 		}
 	}
+
+	/* Create indirect links so apply flags setting to all */
+	list_for_each_entry(link, &dev->p2p_link_props, list) {
+		link->flags = CRAT_IOLINK_FLAGS_ENABLED;
+		kfd_set_iolink_no_atomics(dev, NULL, link);
+		peer_dev = kfd_topology_device_by_proximity_domain(
+				link->node_to);
+
+		if (!peer_dev)
+			continue;
+
+		list_for_each_entry(inbound_link, &peer_dev->p2p_link_props,
+									list) {
+			if (inbound_link->node_to != link->node_from)
+				continue;
+
+			inbound_link->flags = CRAT_IOLINK_FLAGS_ENABLED;
+			kfd_set_iolink_no_atomics(peer_dev, dev, inbound_link);
+			kfd_set_iolink_non_coherent(peer_dev, link, inbound_link);
+		}
+	}
+}
+
+static int kfd_build_p2p_node_entry(struct kfd_topology_device *dev,
+				struct kfd_iolink_properties *p2plink)
+{
+	int ret;
+
+	p2plink->kobj = kzalloc(sizeof(struct kobject), GFP_KERNEL);
+	if (!p2plink->kobj)
+		return -ENOMEM;
+
+	ret = kobject_init_and_add(p2plink->kobj, &iolink_type,
+			dev->kobj_p2plink, "%d", dev->node_props.p2p_links_count - 1);
+	if (ret < 0) {
+		kobject_put(p2plink->kobj);
+		return ret;
+	}
+
+	p2plink->attr.name = "properties";
+	p2plink->attr.mode = KFD_SYSFS_FILE_MODE;
+	sysfs_attr_init(&p2plink->attr);
+	ret = sysfs_create_file(p2plink->kobj, &p2plink->attr);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int kfd_create_indirect_link_prop(struct kfd_topology_device *kdev, int gpu_node)
+{
+	struct kfd_iolink_properties *props = NULL, *props2 = NULL;
+	struct kfd_iolink_properties *gpu_link, *cpu_link;
+	struct kfd_topology_device *cpu_dev;
+	int ret = 0;
+	int i, num_cpu;
+
+	num_cpu = 0;
+	list_for_each_entry(cpu_dev, &topology_device_list, list) {
+		if (cpu_dev->gpu)
+			break;
+		num_cpu++;
+	}
+
+	gpu_link = list_first_entry(&kdev->io_link_props,
+					struct kfd_iolink_properties, list);
+	if (!gpu_link)
+		return -ENOMEM;
+
+	for (i = 0; i < num_cpu; i++) {
+		/* CPU <--> GPU */
+		if (gpu_link->node_to == i)
+			continue;
+
+		/* find CPU <-->  CPU links */
+		cpu_dev = kfd_topology_device_by_proximity_domain(i);
+		if (cpu_dev) {
+			list_for_each_entry(cpu_link,
+					&cpu_dev->io_link_props, list) {
+				if (cpu_link->node_to == gpu_link->node_to)
+					break;
+			}
+		}
+
+		if (cpu_link->node_to != gpu_link->node_to)
+			return -ENOMEM;
+
+		/* CPU <--> CPU <--> GPU, GPU node*/
+		props = kfd_alloc_struct(props);
+		if (!props)
+			return -ENOMEM;
+
+		memcpy(props, gpu_link, sizeof(struct kfd_iolink_properties));
+		props->weight = gpu_link->weight + cpu_link->weight;
+		props->min_latency = gpu_link->min_latency + cpu_link->min_latency;
+		props->max_latency = gpu_link->max_latency + cpu_link->max_latency;
+		props->min_bandwidth = min(gpu_link->min_bandwidth, cpu_link->min_bandwidth);
+		props->max_bandwidth = min(gpu_link->max_bandwidth, cpu_link->max_bandwidth);
+
+		props->node_from = gpu_node;
+		props->node_to = i;
+		kdev->node_props.p2p_links_count++;
+		list_add_tail(&props->list, &kdev->p2p_link_props);
+		ret = kfd_build_p2p_node_entry(kdev, props);
+		if (ret < 0)
+			return ret;
+
+		/* for small Bar, no CPU --> GPU in-direct links */
+		if (kfd_dev_is_large_bar(kdev->gpu)) {
+			/* CPU <--> CPU <--> GPU, CPU node*/
+			props2 = kfd_alloc_struct(props2);
+			if (!props2)
+				return -ENOMEM;
+
+			memcpy(props2, props, sizeof(struct kfd_iolink_properties));
+			props2->node_from = i;
+			props2->node_to = gpu_node;
+			props2->kobj = NULL;
+			cpu_dev->node_props.p2p_links_count++;
+			list_add_tail(&props2->list, &cpu_dev->p2p_link_props);
+			ret = kfd_build_p2p_node_entry(cpu_dev, props2);
+			if (ret < 0)
+				return ret;
+		}
+	}
+	return ret;
+}
+
+#if defined(CONFIG_HSA_AMD_P2P)
+static int kfd_add_peer_prop(struct kfd_topology_device *kdev,
+		struct kfd_topology_device *peer, int from, int to)
+{
+	struct kfd_iolink_properties *props = NULL;
+	struct kfd_iolink_properties *iolink1, *iolink2, *iolink3;
+	struct kfd_topology_device *cpu_dev;
+	int ret = 0;
+
+	if (!amdgpu_device_is_peer_accessible(
+				kdev->gpu->adev,
+				peer->gpu->adev))
+		return ret;
+
+	iolink1 = list_first_entry(&kdev->io_link_props,
+							struct kfd_iolink_properties, list);
+	if (!iolink1)
+		return -ENOMEM;
+
+	iolink2 = list_first_entry(&peer->io_link_props,
+							struct kfd_iolink_properties, list);
+	if (!iolink2)
+		return -ENOMEM;
+
+	props = kfd_alloc_struct(props);
+	if (!props)
+		return -ENOMEM;
+
+	memcpy(props, iolink1, sizeof(struct kfd_iolink_properties));
+
+	props->weight = iolink1->weight + iolink2->weight;
+	props->min_latency = iolink1->min_latency + iolink2->min_latency;
+	props->max_latency = iolink1->max_latency + iolink2->max_latency;
+	props->min_bandwidth = min(iolink1->min_bandwidth, iolink2->min_bandwidth);
+	props->max_bandwidth = min(iolink2->max_bandwidth, iolink2->max_bandwidth);
+
+	if (iolink1->node_to != iolink2->node_to) {
+		/* CPU->CPU  link*/
+		cpu_dev = kfd_topology_device_by_proximity_domain(iolink1->node_to);
+		if (cpu_dev) {
+			list_for_each_entry(iolink3, &cpu_dev->io_link_props, list)
+				if (iolink3->node_to == iolink2->node_to)
+					break;
+
+			props->weight += iolink3->weight;
+			props->min_latency += iolink3->min_latency;
+			props->max_latency += iolink3->max_latency;
+			props->min_bandwidth = min(props->min_bandwidth,
+							iolink3->min_bandwidth);
+			props->max_bandwidth = min(props->max_bandwidth,
+							iolink3->max_bandwidth);
+		} else {
+			WARN(1, "CPU node not found");
+		}
+	}
+
+	props->node_from = from;
+	props->node_to = to;
+	peer->node_props.p2p_links_count++;
+	list_add_tail(&props->list, &peer->p2p_link_props);
+	ret = kfd_build_p2p_node_entry(peer, props);
+
+	return ret;
+}
+#endif
+
+static int kfd_dev_create_p2p_links(void)
+{
+	struct kfd_topology_device *dev;
+	struct kfd_topology_device *new_dev;
+	uint32_t i, k;
+	int ret = 0;
+
+	k = 0;
+	list_for_each_entry(dev, &topology_device_list, list)
+		k++;
+	if (k < 2)
+		return 0;
+
+	new_dev = list_last_entry(&topology_device_list, struct kfd_topology_device, list);
+	if (WARN_ON(!new_dev->gpu))
+		return 0;
+
+	k--;
+	i = 0;
+
+	/* create in-direct links */
+	ret = kfd_create_indirect_link_prop(new_dev, k);
+	if (ret < 0)
+		goto out;
+
+	/* create p2p links */
+#if defined(CONFIG_HSA_AMD_P2P)
+	list_for_each_entry(dev, &topology_device_list, list) {
+		if (dev == new_dev)
+			break;
+		if (!dev->gpu || !dev->gpu->adev ||
+		    (dev->gpu->hive_id &&
+		     dev->gpu->hive_id == new_dev->gpu->hive_id))
+			goto next;
+
+		/* check if node(s) is/are peer accessible in one direction or bi-direction */
+		ret = kfd_add_peer_prop(new_dev, dev, i, k);
+		if (ret < 0)
+			goto out;
+
+		ret = kfd_add_peer_prop(dev, new_dev, k, i);
+		if (ret < 0)
+			goto out;
+next:
+		i++;
+	}
+#endif
+
+out:
+	return ret;
 }
 
 int kfd_topology_add_device(struct kfd_dev *gpu)
@@ -1305,7 +1603,6 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
 	INIT_LIST_HEAD(&temp_topology_device_list);
 
 	gpu_id = kfd_generate_gpu_id(gpu);
-
 	pr_debug("Adding new GPU (ID: 0x%x) to topology\n", gpu_id);
 
 	/* Check to see if this gpu device exists in the topology_device_list.
@@ -1362,6 +1659,8 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
 	dev->gpu_id = gpu_id;
 	gpu->id = gpu_id;
 
+	kfd_dev_create_p2p_links();
+
 	/* TODO: Move the following lines to function
 	 *	kfd_add_non_crat_information
 	 */
@@ -1507,7 +1806,7 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
 static void kfd_topology_update_io_links(int proximity_domain)
 {
 	struct kfd_topology_device *dev;
-	struct kfd_iolink_properties *iolink, *tmp;
+	struct kfd_iolink_properties *iolink, *p2plink, *tmp;
 
 	list_for_each_entry(dev, &topology_device_list, list) {
 		if (dev->proximity_domain > proximity_domain)
@@ -1529,6 +1828,22 @@ static void kfd_topology_update_io_links(int proximity_domain)
 					iolink->node_to--;
 			}
 		}
+
+		list_for_each_entry_safe(p2plink, tmp, &dev->p2p_link_props, list) {
+			/*
+			 * If there is a p2p link to the dev being deleted
+			 * then remove that p2p link also.
+			 */
+			if (p2plink->node_to == proximity_domain) {
+				list_del(&p2plink->list);
+				dev->node_props.p2p_links_count--;
+			} else {
+				if (p2plink->node_from > proximity_domain)
+					p2plink->node_from--;
+				if (p2plink->node_to > proximity_domain)
+					p2plink->node_to--;
+			}
+		}
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
index 4f80d2ea1000..2fb5664e1041 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
@@ -38,6 +38,7 @@ struct kfd_node_properties {
 	uint32_t mem_banks_count;
 	uint32_t caches_count;
 	uint32_t io_links_count;
+	uint32_t p2p_links_count;
 	uint32_t cpu_core_id_base;
 	uint32_t simd_id_base;
 	uint32_t capability;
@@ -131,12 +132,14 @@ struct kfd_topology_device {
 	struct list_head		cache_props;
 	uint32_t			io_link_count;
 	struct list_head		io_link_props;
+	struct list_head		p2p_link_props;
 	struct list_head		perf_props;
 	struct kfd_dev			*gpu;
 	struct kobject			*kobj_node;
 	struct kobject			*kobj_mem;
 	struct kobject			*kobj_cache;
 	struct kobject			*kobj_iolink;
+	struct kobject			*kobj_p2plink;
 	struct kobject			*kobj_perf;
 	struct attribute		attr_gpuid;
 	struct attribute		attr_name;
-- 
2.35.1

