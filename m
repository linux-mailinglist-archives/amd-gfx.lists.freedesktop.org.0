Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BADB81FF05
	for <lists+amd-gfx@lfdr.de>; Fri, 29 Dec 2023 12:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410E910E068;
	Fri, 29 Dec 2023 11:03:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B7D10E068
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 Dec 2023 11:03:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzU3BoCUqUomKj7tL/A+i82LUeigyUBypuXMfW/UUYwB31eg45GvteI7N0gq5CqakF+mSO+nv0i/Q0cnlLSM6eFQmhUfugavsonpDlQR5GZpyPUAn2bf8I9M+8tTI6WDrkhovzihjCPJrWG1GA5b3nzPGhCTbfvxLc8WfK53poUI2VM+xVOf1AGS2IkRmViATEZyO8qYEtKeWeh3JTfByIp6kOzgCRVawyFWIaWpJ1nUyUnmEGVU6R8uhz5A89MQtPQ27FtAUjLpsMisF/HuCyPhk1dXo22rSds3gr2gACZZLOibGzMtYmpbjGOl8FCiQjZ3FAbzVh3qGOZzcpYlRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aC+V/LRMMUn88BBYJv4d0qjCO2Xcz06GN4FU6IV+Olc=;
 b=h4/SnsKz8BoEpjK12OllinZ0ZRhWtZl8JE5hftTCekCwYfx2wyIEEY5L3Iu4WWqYMeGKJC0oZtV5JV0yk33z4Nhu1CZdgCZ7P2J0L75G1/Pn2Qm+qPmGlDNkLdQQ0GrQV17Hbvvq/9aMB/T7l7OEPdQGJR2zUy4IyXbMbIJtpB90Uy1kcuOYBknuOq6X3Dx4xf2hmB47vyT/g+memFLL3V2iUeP82mfeISt3lunnJLUNU+1zky/i6nmIRSMs8Sg/C1ZXcXze/7lPrbSYpUMF2assN8ncNKSkatZuCFLeVTQmiIE3tGin81d5U/dEMayu+a+iH0zP/rTF9HHE/kHi/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aC+V/LRMMUn88BBYJv4d0qjCO2Xcz06GN4FU6IV+Olc=;
 b=xrjprjxxq7UpY5/a6xhPMKIyWOvojhOWSDNUlWHv3wKCaB2P6Wm+3uuMhe0zSfM5etK30Fe2rZQJF/bcPfGgGSN9VVO7AnWsfhFjpRIp1LhgmPthxZUvszDJO9d7JgD77LP05Dd5+Nkik5Fa+6BQHYHZRoySggdblEhkWWQz5IY=
Received: from BL1PR13CA0344.namprd13.prod.outlook.com (2603:10b6:208:2c6::19)
 by PH0PR12MB8128.namprd12.prod.outlook.com (2603:10b6:510:294::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20; Fri, 29 Dec
 2023 11:03:47 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:2c6:cafe::bf) by BL1PR13CA0344.outlook.office365.com
 (2603:10b6:208:2c6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.7 via Frontend
 Transport; Fri, 29 Dec 2023 11:03:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 29 Dec 2023 11:03:46 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 29 Dec 2023 05:03:43 -0600
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>
Subject: [PATCH v3] drm/amdkfd: Prefer kernel data types u8, u16, u32,
 u64 in amdkfd/kfd_priv.h
Date: Fri, 29 Dec 2023 16:33:25 +0530
Message-ID: <20231229110325.81696-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|PH0PR12MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ece022f-83bb-4b3d-a2ef-08dc085dd3f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qHYNmDeb2xOABUIs0bd4WleK9+CUu+kyvbRsgVlV7q9mk3y1AA0Kdm8bhFE0PuMxrWvVuIGKeM/TxVI0s5VdgsYaFWU8sYrWMx0WsVzqK+MjD6jdtgeOfajsQrGUx7Wnk9JndaXlkCnOWc1z5FhEuAgzRxjfdwUHY3813n0pR5hSNOEtDmIc74zT0cKIi+pUcdGH/Kh8DDM5ko+oD8rNDPhQrx5JO0BwiWbMwBcI6KunJu6E9QlYcKmZh7UcRWtvDv7OYD89iQkerQUTMgFl5USA+7r1Z5YjX299Ec3LUISTMwCTjQrwHQJDrsLTdNLfnUgMzZo4RPmo/iSlJuqNdSvbSmMUocC/MLLuz01mnd0/KV62glq1I7O8gNRllDL6vmhU6VpAQuesSSf1Qzl3IdLiej8xSvufY1OQWDoDgq5R13Xj2nZLASB31JRRmNNGaDAhOKQEQud3/xWtzTGbFiazT32kiFoibP4Gs0kdjldqYrSe5gUIDJJ71PpMFG0tFwfUG451KfOmSLi0rzwzY+z1URFgmtOGso3nKuIGZA1tGJ1mmQl/O4/4Br/faAZxXEzVwvTTx4KIPv8Fgrzc7KK6bSxuf+u2Rl+yO7cbcCbbgrDhw7/hgivoDBXsYlxbwYnOKcHsZD1gl970ylF+8TX+Sn4jq6D7R9O3l6FOzUt3ce/xLOu8ugpGaQsy3PNhr7VJIjUU1H3pY4C4RyOBl8vF5VGHAlapgcm6RMzE+Bs/U7yiCuxaS1I2hOUtJrf2PnsXhdMOaWJrGeK8EWHMHg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(64100799003)(1800799012)(82310400011)(451199024)(186009)(40470700004)(46966006)(36840700001)(82740400003)(356005)(81166007)(40480700001)(40460700003)(86362001)(7696005)(6666004)(426003)(336012)(47076005)(83380400001)(478600001)(8676002)(6636002)(44832011)(36860700001)(4326008)(70586007)(70206006)(2616005)(54906003)(316002)(16526019)(26005)(66574015)(1076003)(110136005)(36756003)(8936002)(41300700001)(5660300002)(2906002)(30864003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2023 11:03:46.0173 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ece022f-83bb-4b3d-a2ef-08dc085dd3f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8128
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
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix the following checks reported by checkpatch:

CHECK: Prefer kernel type 'u8' over 'uint8_t'
CHECK: Prefer kernel type 'u16' over 'uint16_t'
CHECK: Prefer kernel type 'u64' over 'uint64_t'
CHECK: Prefer kernel type 'u32' over 'uint32_t'

Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
v3:
  - updated u32, u16, u64 for missed variables in v2

 drivers/gpu/drm/amd/amdkfd/kfd_priv.h | 448 +++++++++++++-------------
 1 file changed, 226 insertions(+), 222 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 45366b4ca976..c161b5220fd7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -74,7 +74,7 @@
 #define KFD_MMAP_GPU_ID_SHIFT 46
 #define KFD_MMAP_GPU_ID_MASK (((1ULL << KFD_GPU_ID_HASH_WIDTH) - 1) \
 				<< KFD_MMAP_GPU_ID_SHIFT)
-#define KFD_MMAP_GPU_ID(gpu_id) ((((uint64_t)gpu_id) << KFD_MMAP_GPU_ID_SHIFT)\
+#define KFD_MMAP_GPU_ID(gpu_id) ((((u64)gpu_id) << KFD_MMAP_GPU_ID_SHIFT)\
 				& KFD_MMAP_GPU_ID_MASK)
 #define KFD_MMAP_GET_GPU_ID(offset)    ((offset & KFD_MMAP_GPU_ID_MASK) \
 				>> KFD_MMAP_GPU_ID_SHIFT)
@@ -91,7 +91,7 @@
 
 /* Macro for allocating structures */
 #define kfd_alloc_struct(ptr_to_struct)	\
-	((typeof(ptr_to_struct)) kzalloc(sizeof(*ptr_to_struct), GFP_KERNEL))
+	((typeof(ptr_to_struct))kzalloc(sizeof(*ptr_to_struct), GFP_KERNEL))
 
 #define KFD_MAX_NUM_OF_PROCESSES 512
 #define KFD_MAX_NUM_OF_QUEUES_PER_PROCESS 1024
@@ -145,13 +145,13 @@ enum kfd_ioctl_flags {
 	 */
 	KFD_IOC_FLAG_CHECKPOINT_RESTORE = BIT(0),
 };
+
 /*
  * Kernel module parameter to specify maximum number of supported queues per
  * device
  */
 extern int max_num_of_queues_per_device;
 
-
 /* Kernel module parameter to specify the scheduling policy */
 extern int sched_policy;
 
@@ -212,24 +212,24 @@ struct kfd_node;
 
 struct kfd_event_interrupt_class {
 	bool (*interrupt_isr)(struct kfd_node *dev,
-			const uint32_t *ih_ring_entry, uint32_t *patched_ihre,
+			      const u32 *ih_ring_entry, u32 *patched_ihre,
 			bool *patched_flag);
 	void (*interrupt_wq)(struct kfd_node *dev,
-			const uint32_t *ih_ring_entry);
+			     const u32 *ih_ring_entry);
 };
 
 struct kfd_device_info {
-	uint32_t gfx_target_version;
+	u32 gfx_target_version;
 	const struct kfd_event_interrupt_class *event_interrupt_class;
 	unsigned int max_pasid_bits;
 	unsigned int max_no_of_hqd;
 	unsigned int doorbell_size;
 	size_t ih_ring_entry_size;
-	uint8_t num_of_watch_points;
-	uint16_t mqd_size_aligned;
+	u8 num_of_watch_points;
+	u16 mqd_size_aligned;
 	bool supports_cwsr;
 	bool needs_pci_atomics;
-	uint32_t no_atomic_fw_version;
+	u32 no_atomic_fw_version;
 	unsigned int num_sdma_queues_per_engine;
 	unsigned int num_reserved_sdma_queues_per_engine;
 	DECLARE_BITMAP(reserved_sdma_queues_bitmap, KFD_MAX_SDMA_QUEUES);
@@ -239,17 +239,17 @@ unsigned int kfd_get_num_sdma_engines(struct kfd_node *kdev);
 unsigned int kfd_get_num_xgmi_sdma_engines(struct kfd_node *kdev);
 
 struct kfd_mem_obj {
-	uint32_t range_start;
-	uint32_t range_end;
-	uint64_t gpu_addr;
-	uint32_t *cpu_ptr;
+	u32 range_start;
+	u32 range_end;
+	u64 gpu_addr;
+	u32 *cpu_ptr;
 	void *gtt_mem;
 };
 
 struct kfd_vmid_info {
-	uint32_t first_vmid_kfd;
-	uint32_t last_vmid_kfd;
-	uint32_t vmid_num_kfd;
+	u32 first_vmid_kfd;
+	u32 last_vmid_kfd;
+	u32 vmid_num_kfd;
 };
 
 #define MAX_KFD_NODES	8
@@ -267,7 +267,7 @@ struct kfd_node {
 					      */
 	struct kfd_vmid_info vm_info;
 	unsigned int id;                /* topology stub index */
-	uint32_t xcc_mask; /* Instance mask of XCCs present */
+	u32 xcc_mask; /* Instance mask of XCCs present */
 	struct amdgpu_xcp *xcp;
 
 	/* Interrupts */
@@ -281,7 +281,7 @@ struct kfd_node {
 	 * from the HW ring into a SW ring.
 	 */
 	bool interrupts_active;
-	uint32_t interrupt_bitmap; /* Only used for GFX 9.4.3 */
+	u32 interrupt_bitmap; /* Only used for GFX 9.4.3 */
 
 	/* QCM Device instance */
 	struct device_queue_manager *dqm;
@@ -293,7 +293,7 @@ struct kfd_node {
 	/* Clients watching SMI events */
 	struct list_head smi_clients;
 	spinlock_t smi_lock;
-	uint32_t reset_seq_num;
+	u32 reset_seq_num;
 
 	/* SRAM ECC flag */
 	atomic_t sram_ecc_flag;
@@ -326,7 +326,7 @@ struct kfd_dev {
 	struct mutex doorbell_mutex;
 
 	void *gtt_mem;
-	uint64_t gtt_start_gpu_addr;
+	u64 gtt_start_gpu_addr;
 	void *gtt_start_cpu_ptr;
 	void *gtt_sa_bitmap;
 	struct mutex gtt_sa_lock;
@@ -336,9 +336,9 @@ struct kfd_dev {
 	bool init_complete;
 
 	/* Firmware versions */
-	uint16_t mec_fw_version;
-	uint16_t mec2_fw_version;
-	uint16_t sdma_fw_version;
+	u16 mec_fw_version;
+	u16 mec2_fw_version;
+	u16 sdma_fw_version;
 
 	/* CWSR */
 	bool cwsr_enabled;
@@ -346,7 +346,7 @@ struct kfd_dev {
 	unsigned int cwsr_isa_size;
 
 	/* xGMI */
-	uint64_t hive_id;
+	u64 hive_id;
 
 	bool pci_atomic_requested;
 
@@ -362,7 +362,7 @@ struct kfd_dev {
 	unsigned int num_nodes;
 
 	/* Track per device allocated watch points */
-	uint32_t alloc_watch_ids;
+	u32 alloc_watch_ids;
 	spinlock_t watch_points_lock;
 
 	/* Kernel doorbells for KFD device */
@@ -489,38 +489,38 @@ struct queue_properties {
 	enum kfd_queue_type type;
 	enum kfd_queue_format format;
 	unsigned int queue_id;
-	uint64_t queue_address;
-	uint64_t  queue_size;
-	uint32_t priority;
-	uint32_t queue_percent;
-	uint32_t *read_ptr;
-	uint32_t *write_ptr;
+	u64 queue_address;
+	u64  queue_size;
+	u32 priority;
+	u32 queue_percent;
+	u32 *read_ptr;
+	u32 *write_ptr;
 	void __iomem *doorbell_ptr;
-	uint32_t doorbell_off;
+	u32 doorbell_off;
 	bool is_interop;
 	bool is_evicted;
 	bool is_suspended;
 	bool is_being_destroyed;
 	bool is_active;
 	bool is_gws;
-	uint32_t pm4_target_xcc;
+	u32 pm4_target_xcc;
 	bool is_dbg_wa;
 	bool is_user_cu_masked;
 	/* Not relevant for user mode queues in cp scheduling */
 	unsigned int vmid;
 	/* Relevant only for sdma queues*/
-	uint32_t sdma_engine_id;
-	uint32_t sdma_queue_id;
-	uint32_t sdma_vm_addr;
+	u32 sdma_engine_id;
+	u32 sdma_queue_id;
+	u32 sdma_vm_addr;
 	/* Relevant only for VI */
-	uint64_t eop_ring_buffer_address;
-	uint32_t eop_ring_buffer_size;
-	uint64_t ctx_save_restore_area_address;
-	uint32_t ctx_save_restore_area_size;
-	uint32_t ctl_stack_size;
-	uint64_t tba_addr;
-	uint64_t tma_addr;
-	uint64_t exception_status;
+	u64 eop_ring_buffer_address;
+	u32 eop_ring_buffer_size;
+	u64 ctx_save_restore_area_address;
+	u32 ctx_save_restore_area_size;
+	u32 ctl_stack_size;
+	u64 tba_addr;
+	u64 tma_addr;
+	u64 exception_status;
 };
 
 #define QUEUE_IS_ACTIVE(q) ((q).queue_size > 0 &&	\
@@ -537,8 +537,8 @@ enum mqd_update_flag {
 struct mqd_update_info {
 	union {
 		struct {
-			uint32_t count; /* Must be a multiple of 32 */
-			uint32_t *ptr;
+			u32 count; /* Must be a multiple of 32 */
+			u32 *ptr;
 		} cu_mask;
 	};
 	enum mqd_update_flag update_flag;
@@ -581,12 +581,12 @@ struct queue {
 	struct list_head list;
 	void *mqd;
 	struct kfd_mem_obj *mqd_mem_obj;
-	uint64_t gart_mqd_addr;
+	u64 gart_mqd_addr;
 	struct queue_properties properties;
 
-	uint32_t mec;
-	uint32_t pipe;
-	uint32_t queue;
+	u32 mec;
+	u32 pipe;
+	u32 queue;
 
 	unsigned int sdma_id;
 	unsigned int doorbell_id;
@@ -599,7 +599,7 @@ struct queue {
 	struct kobject kobj;
 
 	void *gang_ctx_bo;
-	uint64_t gang_ctx_gpu_addr;
+	u64 gang_ctx_gpu_addr;
 	void *gang_ctx_cpu_ptr;
 
 	struct amdgpu_bo *wptr_bo;
@@ -622,11 +622,11 @@ enum KFD_PIPE_PRIORITY {
 struct scheduling_resources {
 	unsigned int vmid_mask;
 	enum kfd_queue_type type;
-	uint64_t queue_mask;
-	uint64_t gws_mask;
-	uint32_t oac_mask;
-	uint32_t gds_heap_base;
-	uint32_t gds_heap_size;
+	u64 queue_mask;
+	u64 gws_mask;
+	u32 oac_mask;
+	u32 gds_heap_base;
+	u32 gds_heap_size;
 };
 
 struct process_queue_manager {
@@ -663,28 +663,28 @@ struct qcm_process_device {
 	bool mapped_gws_queue;
 
 	/* All the memory management data should be here too */
-	uint64_t gds_context_area;
+	u64 gds_context_area;
 	/* Contains page table flags such as AMDGPU_PTE_VALID since gfx9 */
-	uint64_t page_table_base;
-	uint32_t sh_mem_config;
-	uint32_t sh_mem_bases;
-	uint32_t sh_mem_ape1_base;
-	uint32_t sh_mem_ape1_limit;
-	uint32_t gds_size;
-	uint32_t num_gws;
-	uint32_t num_oac;
-	uint32_t sh_hidden_private_base;
+	u64 page_table_base;
+	u32 sh_mem_config;
+	u32 sh_mem_bases;
+	u32 sh_mem_ape1_base;
+	u32 sh_mem_ape1_limit;
+	u32 gds_size;
+	u32 num_gws;
+	u32 num_oac;
+	u32 sh_hidden_private_base;
 
 	/* CWSR memory */
 	struct kgd_mem *cwsr_mem;
 	void *cwsr_kaddr;
-	uint64_t cwsr_base;
-	uint64_t tba_addr;
-	uint64_t tma_addr;
+	u64 cwsr_base;
+	u64 tba_addr;
+	u64 tma_addr;
 
 	/* IB memory */
 	struct kgd_mem *ib_mem;
-	uint64_t ib_base;
+	u64 ib_base;
 	void *ib_kaddr;
 
 	/* doorbells for kfd process */
@@ -707,7 +707,7 @@ struct qcm_process_device {
  * idr_handle in the least significant 4 bytes
  */
 #define MAKE_HANDLE(gpu_id, idr_handle) \
-	(((uint64_t)(gpu_id) << 32) + idr_handle)
+	(((u64)(gpu_id) << 32) + idr_handle)
 #define GET_GPU_ID(handle) (handle >> 32)
 #define GET_IDR_HANDLE(handle) (handle & 0xFFFFFFFF)
 
@@ -738,12 +738,12 @@ struct kfd_process_device {
 	struct qcm_process_device qpd;
 
 	/*Apertures*/
-	uint64_t lds_base;
-	uint64_t lds_limit;
-	uint64_t gpuvm_base;
-	uint64_t gpuvm_limit;
-	uint64_t scratch_base;
-	uint64_t scratch_limit;
+	u64 lds_base;
+	u64 lds_limit;
+	u64 gpuvm_base;
+	u64 gpuvm_limit;
+	u64 scratch_base;
+	u64 scratch_limit;
 
 	/* VM context for GPUVM allocations */
 	struct file *drm_file;
@@ -764,17 +764,17 @@ struct kfd_process_device {
 	enum kfd_pdd_bound bound;
 
 	/* VRAM usage */
-	uint64_t vram_usage;
+	u64 vram_usage;
 	struct attribute attr_vram;
 	char vram_filename[MAX_SYSFS_FILENAME_LEN];
 
 	/* SDMA activity tracking */
-	uint64_t sdma_past_activity_counter;
+	u64 sdma_past_activity_counter;
 	struct attribute attr_sdma;
 	char sdma_filename[MAX_SYSFS_FILENAME_LEN];
 
 	/* Eviction activity tracking */
-	uint64_t last_evict_timestamp;
+	u64 last_evict_timestamp;
 	atomic64_t evict_duration_counter;
 	struct attribute attr_evict;
 
@@ -810,30 +810,30 @@ struct kfd_process_device {
 	struct attribute attr_faults;
 	struct attribute attr_page_in;
 	struct attribute attr_page_out;
-	uint64_t faults;
-	uint64_t page_in;
-	uint64_t page_out;
+	u64 faults;
+	u64 page_in;
+	u64 page_out;
 
 	/* Exception code status*/
-	uint64_t exception_status;
+	u64 exception_status;
 	void *vm_fault_exc_data;
 	size_t vm_fault_exc_data_size;
 
 	/* Tracks debug per-vmid request settings */
-	uint32_t spi_dbg_override;
-	uint32_t spi_dbg_launch_mode;
-	uint32_t watch_points[4];
-	uint32_t alloc_watch_ids;
+	u32 spi_dbg_override;
+	u32 spi_dbg_launch_mode;
+	u32 watch_points[4];
+	u32 alloc_watch_ids;
 
 	/*
 	 * If this process has been checkpointed before, then the user
 	 * application will use the original gpu_id on the
 	 * checkpointed node to refer to this device.
 	 */
-	uint32_t user_gpu_id;
+	u32 user_gpu_id;
 
 	void *proc_ctx_bo;
-	uint64_t proc_ctx_gpu_addr;
+	u64 proc_ctx_gpu_addr;
 	void *proc_ctx_cpu_ptr;
 };
 
@@ -893,7 +893,7 @@ struct kfd_process {
 	 * one for each device the process is using.
 	 */
 	struct kfd_process_device *pdds[MAX_GPU_INSTANCE];
-	uint32_t n_pdds;
+	u32 n_pdds;
 
 	struct process_queue_manager pqm;
 
@@ -954,8 +954,8 @@ struct kfd_process {
 	bool has_cwsr;
 
 	/* Exception code enable mask and status */
-	uint64_t exception_enable_mask;
-	uint64_t exception_status;
+	u64 exception_enable_mask;
+	u64 exception_status;
 
 	/* Used to drain stale interrupts */
 	wait_queue_head_t wait_irq_drain;
@@ -1005,6 +1005,7 @@ struct amdkfd_ioctl_desc {
 	unsigned int cmd_drv;
 	const char *name;
 };
+
 bool kfd_dev_is_large_bar(struct kfd_node *dev);
 
 int kfd_process_create_wq(void);
@@ -1015,37 +1016,38 @@ struct kfd_process *kfd_get_process(const struct task_struct *task);
 struct kfd_process *kfd_lookup_process_by_pasid(u32 pasid);
 struct kfd_process *kfd_lookup_process_by_mm(const struct mm_struct *mm);
 
-int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id);
+int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, u32 gpu_id);
 int kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
-				uint32_t *gpuid, uint32_t *gpuidx);
+				u32 *gpuid, u32 *gpuidx);
 static inline int kfd_process_gpuid_from_gpuidx(struct kfd_process *p,
-				uint32_t gpuidx, uint32_t *gpuid) {
+						u32 gpuidx, u32 *gpuid) {
 	return gpuidx < p->n_pdds ? p->pdds[gpuidx]->dev->id : -EINVAL;
 }
+
 static inline struct kfd_process_device *kfd_process_device_from_gpuidx(
-				struct kfd_process *p, uint32_t gpuidx) {
+				struct kfd_process *p, u32 gpuidx) {
 	return gpuidx < p->n_pdds ? p->pdds[gpuidx] : NULL;
 }
 
 void kfd_unref_process(struct kfd_process *p);
-int kfd_process_evict_queues(struct kfd_process *p, uint32_t trigger);
+int kfd_process_evict_queues(struct kfd_process *p, u32 trigger);
 int kfd_process_restore_queues(struct kfd_process *p);
 void kfd_suspend_all_processes(void);
 int kfd_resume_all_processes(void);
 
 struct kfd_process_device *kfd_process_device_data_by_id(struct kfd_process *process,
-							 uint32_t gpu_id);
+							 u32 gpu_id);
 
-int kfd_process_get_user_gpu_id(struct kfd_process *p, uint32_t actual_gpu_id);
+int kfd_process_get_user_gpu_id(struct kfd_process *p, u32 actual_gpu_id);
 
 int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 			       struct file *drm_file);
 struct kfd_process_device *kfd_bind_process_to_device(struct kfd_node *dev,
-						struct kfd_process *p);
+						      struct kfd_process *p);
 struct kfd_process_device *kfd_get_process_device_data(struct kfd_node *dev,
-							struct kfd_process *p);
+						       struct kfd_process *p);
 struct kfd_process_device *kfd_create_process_device_data(struct kfd_node *dev,
-							struct kfd_process *p);
+							  struct kfd_process *p);
 
 bool kfd_process_xnack_mode(struct kfd_process *p, bool supported);
 
@@ -1054,11 +1056,11 @@ int kfd_reserved_mem_mmap(struct kfd_node *dev, struct kfd_process *process,
 
 /* KFD process API for creating and translating handles */
 int kfd_process_device_create_obj_handle(struct kfd_process_device *pdd,
-					void *mem);
+					 void *mem);
 void *kfd_process_device_translate_handle(struct kfd_process_device *p,
-					int handle);
+					  int handle);
 void kfd_process_device_remove_obj_handle(struct kfd_process_device *pdd,
-					int handle);
+					  int handle);
 struct kfd_process *kfd_lookup_process_by_pid(struct pid *pid);
 
 /* PASIDs */
@@ -1076,13 +1078,13 @@ void kfd_doorbell_fini(struct kfd_dev *kfd);
 int kfd_doorbell_mmap(struct kfd_node *dev, struct kfd_process *process,
 		      struct vm_area_struct *vma);
 void __iomem *kfd_get_kernel_doorbell(struct kfd_dev *kfd,
-					unsigned int *doorbell_off);
+				      unsigned int *doorbell_off);
 void kfd_release_kernel_doorbell(struct kfd_dev *kfd, u32 __iomem *db_addr);
 u32 read_kernel_doorbell(u32 __iomem *db);
 void write_kernel_doorbell(void __iomem *db, u32 value);
 void write_kernel_doorbell64(void __iomem *db, u64 value);
 unsigned int kfd_get_doorbell_dw_offset_in_bar(struct kfd_dev *kfd,
-					struct kfd_process_device *pdd,
+					       struct kfd_process_device *pdd,
 					unsigned int doorbell_id);
 phys_addr_t kfd_get_process_doorbells(struct kfd_process_device *pdd);
 int kfd_alloc_process_doorbells(struct kfd_dev *kfd,
@@ -1110,22 +1112,23 @@ void kfd_topology_shutdown(void);
 int kfd_topology_add_device(struct kfd_node *gpu);
 int kfd_topology_remove_device(struct kfd_node *gpu);
 struct kfd_topology_device *kfd_topology_device_by_proximity_domain(
-						uint32_t proximity_domain);
+						u32 proximity_domain);
 struct kfd_topology_device *kfd_topology_device_by_proximity_domain_no_lock(
-						uint32_t proximity_domain);
-struct kfd_topology_device *kfd_topology_device_by_id(uint32_t gpu_id);
-struct kfd_node *kfd_device_by_id(uint32_t gpu_id);
+						u32 proximity_domain);
+struct kfd_topology_device *kfd_topology_device_by_id(u32 gpu_id);
+struct kfd_node *kfd_device_by_id(u32 gpu_id);
 struct kfd_node *kfd_device_by_pci_dev(const struct pci_dev *pdev);
-static inline bool kfd_irq_is_from_node(struct kfd_node *node, uint32_t node_id,
-					uint32_t vmid)
+static inline bool kfd_irq_is_from_node(struct kfd_node *node, u32 node_id,
+					u32 vmid)
 {
 	return (node->interrupt_bitmap & (1 << node_id)) != 0 &&
 	       (node->compute_vmid_bitmap & (1 << vmid)) != 0;
 }
+
 static inline struct kfd_node *kfd_node_by_irq_ids(struct amdgpu_device *adev,
-					uint32_t node_id, uint32_t vmid) {
+						   u32 node_id, u32 vmid) {
 	struct kfd_dev *dev = adev->kfd.dev;
-	uint32_t i;
+	u32 i;
 
 	if (KFD_GC_VERSION(dev) != IP_VERSION(9, 4, 3))
 		return dev->nodes[0];
@@ -1136,7 +1139,8 @@ static inline struct kfd_node *kfd_node_by_irq_ids(struct amdgpu_device *adev,
 
 	return NULL;
 }
-int kfd_topology_enum_kfd_devices(uint8_t idx, struct kfd_node **kdev);
+
+int kfd_topology_enum_kfd_devices(u8 idx, struct kfd_node **kdev);
 int kfd_numa_node_to_apic_id(int numa_node_id);
 
 /* Interrupts */
@@ -1149,8 +1153,8 @@ int kfd_interrupt_init(struct kfd_node *dev);
 void kfd_interrupt_exit(struct kfd_node *dev);
 bool enqueue_ih_ring_entry(struct kfd_node *kfd, const void *ih_ring_entry);
 bool interrupt_is_wanted(struct kfd_node *dev,
-				const uint32_t *ih_ring_entry,
-				uint32_t *patched_ihre, bool *flag);
+			 const u32 *ih_ring_entry,
+				u32 *patched_ihre, bool *flag);
 int kfd_process_drain_interrupts(struct kfd_process_device *pdd);
 void kfd_process_close_interrupt_drain(unsigned int pasid);
 
@@ -1158,8 +1162,8 @@ void kfd_process_close_interrupt_drain(unsigned int pasid);
 int kfd_init_apertures(struct kfd_process *process);
 
 void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
-				  uint64_t tba_addr,
-				  uint64_t tma_addr);
+				  u64 tba_addr,
+				  u64 tma_addr);
 void kfd_process_set_trap_debug_flag(struct qcm_process_device *qpd,
 				     bool enabled);
 
@@ -1181,19 +1185,19 @@ int kfd_process_init_cwsr_apu(struct kfd_process *process, struct file *filep);
 #define KFD_CRIU_PRIV_VERSION 1
 
 struct kfd_criu_process_priv_data {
-	uint32_t version;
-	uint32_t xnack_mode;
+	u32 version;
+	u32 xnack_mode;
 };
 
 struct kfd_criu_device_priv_data {
 	/* For future use */
-	uint64_t reserved;
+	u64 reserved;
 };
 
 struct kfd_criu_bo_priv_data {
-	uint64_t user_addr;
-	uint32_t idr_handle;
-	uint32_t mapped_gpuids[MAX_GPU_INSTANCE];
+	u64 user_addr;
+	u32 idr_handle;
+	u32 mapped_gpuids[MAX_GPU_INSTANCE];
 };
 
 /*
@@ -1207,44 +1211,44 @@ enum kfd_criu_object_type {
 };
 
 struct kfd_criu_svm_range_priv_data {
-	uint32_t object_type;
-	uint64_t start_addr;
-	uint64_t size;
+	u32 object_type;
+	u64 start_addr;
+	u64 size;
 	/* Variable length array of attributes */
 	struct kfd_ioctl_svm_attribute attrs[];
 };
 
 struct kfd_criu_queue_priv_data {
-	uint32_t object_type;
-	uint64_t q_address;
-	uint64_t q_size;
-	uint64_t read_ptr_addr;
-	uint64_t write_ptr_addr;
-	uint64_t doorbell_off;
-	uint64_t eop_ring_buffer_address;
-	uint64_t ctx_save_restore_area_address;
-	uint32_t gpu_id;
-	uint32_t type;
-	uint32_t format;
-	uint32_t q_id;
-	uint32_t priority;
-	uint32_t q_percent;
-	uint32_t doorbell_id;
-	uint32_t gws;
-	uint32_t sdma_id;
-	uint32_t eop_ring_buffer_size;
-	uint32_t ctx_save_restore_area_size;
-	uint32_t ctl_stack_size;
-	uint32_t mqd_size;
+	u32 object_type;
+	u64 q_address;
+	u64 q_size;
+	u64 read_ptr_addr;
+	u64 write_ptr_addr;
+	u64 doorbell_off;
+	u64 eop_ring_buffer_address;
+	u64 ctx_save_restore_area_address;
+	u32 gpu_id;
+	u32 type;
+	u32 format;
+	u32 q_id;
+	u32 priority;
+	u32 q_percent;
+	u32 doorbell_id;
+	u32 gws;
+	u32 sdma_id;
+	u32 eop_ring_buffer_size;
+	u32 ctx_save_restore_area_size;
+	u32 ctl_stack_size;
+	u32 mqd_size;
 };
 
 struct kfd_criu_event_priv_data {
-	uint32_t object_type;
-	uint64_t user_handle;
-	uint32_t event_id;
-	uint32_t auto_reset;
-	uint32_t type;
-	uint32_t signaled;
+	u32 object_type;
+	u64 user_handle;
+	u32 event_id;
+	u32 auto_reset;
+	u32 type;
+	u32 signaled;
 
 	union {
 		struct kfd_hsa_memory_exception_data memory_exception_data;
@@ -1253,27 +1257,27 @@ struct kfd_criu_event_priv_data {
 };
 
 int kfd_process_get_queue_info(struct kfd_process *p,
-			       uint32_t *num_queues,
-			       uint64_t *priv_data_sizes);
+			       u32 *num_queues,
+			       u64 *priv_data_sizes);
 
 int kfd_criu_checkpoint_queues(struct kfd_process *p,
-			 uint8_t __user *user_priv_data,
-			 uint64_t *priv_data_offset);
+			       u8 __user *user_priv_data,
+			 u64 *priv_data_offset);
 
 int kfd_criu_restore_queue(struct kfd_process *p,
-			   uint8_t __user *user_priv_data,
-			   uint64_t *priv_data_offset,
-			   uint64_t max_priv_data_size);
+			   u8 __user *user_priv_data,
+			   u64 *priv_data_offset,
+			   u64 max_priv_data_size);
 
 int kfd_criu_checkpoint_events(struct kfd_process *p,
-			 uint8_t __user *user_priv_data,
-			 uint64_t *priv_data_offset);
+			       u8 __user *user_priv_data,
+			 u64 *priv_data_offset);
 
 int kfd_criu_restore_event(struct file *devkfd,
 			   struct kfd_process *p,
-			   uint8_t __user *user_priv_data,
-			   uint64_t *priv_data_offset,
-			   uint64_t max_priv_data_size);
+			   u8 __user *user_priv_data,
+			   u64 *priv_data_offset,
+			   u64 max_priv_data_size);
 /* CRIU - End */
 
 /* Queue Context Management */
@@ -1283,19 +1287,19 @@ void print_queue_properties(struct queue_properties *q);
 void print_queue(struct queue *q);
 
 struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
-		struct kfd_node *dev);
+					 struct kfd_node *dev);
 struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
-		struct kfd_node *dev);
+					struct kfd_node *dev);
 struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
-		struct kfd_node *dev);
+					struct kfd_node *dev);
 struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
-		struct kfd_node *dev);
+					 struct kfd_node *dev);
 struct mqd_manager *mqd_manager_init_v11(enum KFD_MQD_TYPE type,
-		struct kfd_node *dev);
+					 struct kfd_node *dev);
 struct device_queue_manager *device_queue_manager_init(struct kfd_node *dev);
 void device_queue_manager_uninit(struct device_queue_manager *dqm);
 struct kernel_queue *kernel_queue_init(struct kfd_node *dev,
-					enum kfd_queue_type type);
+				       enum kfd_queue_type type);
 void kernel_queue_uninit(struct kernel_queue *kq, bool hanging);
 int kfd_dqm_evict_pasid(struct device_queue_manager *dqm, u32 pasid);
 
@@ -1311,7 +1315,7 @@ void kfd_process_dequeue_from_all_devices(struct kfd_process *p);
 int pqm_init(struct process_queue_manager *pqm, struct kfd_process *p);
 void pqm_uninit(struct process_queue_manager *pqm);
 int pqm_create_queue(struct process_queue_manager *pqm,
-			    struct kfd_node *dev,
+		     struct kfd_node *dev,
 			    struct file *f,
 			    struct queue_properties *properties,
 			    unsigned int *qid,
@@ -1319,31 +1323,31 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			    const struct kfd_criu_queue_priv_data *q_data,
 			    const void *restore_mqd,
 			    const void *restore_ctl_stack,
-			    uint32_t *p_doorbell_offset_in_process);
+			    u32 *p_doorbell_offset_in_process);
 int pqm_destroy_queue(struct process_queue_manager *pqm, unsigned int qid);
 int pqm_update_queue_properties(struct process_queue_manager *pqm, unsigned int qid,
-			struct queue_properties *p);
+				struct queue_properties *p);
 int pqm_update_mqd(struct process_queue_manager *pqm, unsigned int qid,
-			struct mqd_update_info *minfo);
+		   struct mqd_update_info *minfo);
 int pqm_set_gws(struct process_queue_manager *pqm, unsigned int qid,
-			void *gws);
+		void *gws);
 struct kernel_queue *pqm_get_kernel_queue(struct process_queue_manager *pqm,
-						unsigned int qid);
+					  unsigned int qid);
 struct queue *pqm_get_user_queue(struct process_queue_manager *pqm,
-						unsigned int qid);
+				 unsigned int qid);
 int pqm_get_wave_state(struct process_queue_manager *pqm,
 		       unsigned int qid,
 		       void __user *ctl_stack,
 		       u32 *ctl_stack_used_size,
 		       u32 *save_area_used_size);
 int pqm_get_queue_snapshot(struct process_queue_manager *pqm,
-			   uint64_t exception_clear_mask,
+			   u64 exception_clear_mask,
 			   void __user *buf,
 			   int *num_qss_entries,
-			   uint32_t *entry_size);
+			   u32 *entry_size);
 
 int amdkfd_fence_wait_timeout(struct device_queue_manager *dqm,
-			      uint64_t fence_value,
+			      u64 fence_value,
 			      unsigned int timeout_ms);
 
 int pqm_get_queue_checkpoint_info(struct process_queue_manager *pqm,
@@ -1369,22 +1373,22 @@ struct packet_manager {
 
 struct packet_manager_funcs {
 	/* Support ASIC-specific packet formats for PM4 packets */
-	int (*map_process)(struct packet_manager *pm, uint32_t *buffer,
-			struct qcm_process_device *qpd);
-	int (*runlist)(struct packet_manager *pm, uint32_t *buffer,
-			uint64_t ib, size_t ib_size_in_dwords, bool chain);
-	int (*set_resources)(struct packet_manager *pm, uint32_t *buffer,
-			struct scheduling_resources *res);
-	int (*map_queues)(struct packet_manager *pm, uint32_t *buffer,
-			struct queue *q, bool is_static);
-	int (*unmap_queues)(struct packet_manager *pm, uint32_t *buffer,
-			enum kfd_unmap_queues_filter mode,
-			uint32_t filter_param, bool reset);
-	int (*set_grace_period)(struct packet_manager *pm, uint32_t *buffer,
-			uint32_t grace_period);
-	int (*query_status)(struct packet_manager *pm, uint32_t *buffer,
-			uint64_t fence_address,	uint64_t fence_value);
-	int (*release_mem)(uint64_t gpu_addr, uint32_t *buffer);
+	int (*map_process)(struct packet_manager *pm, u32 *buffer,
+			   struct qcm_process_device *qpd);
+	int (*runlist)(struct packet_manager *pm, u32 *buffer,
+		       u64 ib, size_t ib_size_in_dwords, bool chain);
+	int (*set_resources)(struct packet_manager *pm, u32 *buffer,
+			     struct scheduling_resources *res);
+	int (*map_queues)(struct packet_manager *pm, u32 *buffer,
+			  struct queue *q, bool is_static);
+	int (*unmap_queues)(struct packet_manager *pm, u32 *buffer,
+			    enum kfd_unmap_queues_filter mode,
+			u32 filter_param, bool reset);
+	int (*set_grace_period)(struct packet_manager *pm, u32 *buffer,
+				u32 grace_period);
+	int (*query_status)(struct packet_manager *pm, u32 *buffer,
+			    u64 fence_address,	u64 fence_value);
+	int (*release_mem)(u64 gpu_addr, u32 *buffer);
 
 	/* Packet sizes */
 	int map_process_size;
@@ -1404,23 +1408,23 @@ extern const struct packet_manager_funcs kfd_aldebaran_pm_funcs;
 int pm_init(struct packet_manager *pm, struct device_queue_manager *dqm);
 void pm_uninit(struct packet_manager *pm, bool hanging);
 int pm_send_set_resources(struct packet_manager *pm,
-				struct scheduling_resources *res);
+			  struct scheduling_resources *res);
 int pm_send_runlist(struct packet_manager *pm, struct list_head *dqm_queues);
-int pm_send_query_status(struct packet_manager *pm, uint64_t fence_address,
-				uint64_t fence_value);
+int pm_send_query_status(struct packet_manager *pm, u64 fence_address,
+			 u64 fence_value);
 
 int pm_send_unmap_queue(struct packet_manager *pm,
 			enum kfd_unmap_queues_filter mode,
-			uint32_t filter_param, bool reset);
+			u32 filter_param, bool reset);
 
 void pm_release_ib(struct packet_manager *pm);
 
-int pm_update_grace_period(struct packet_manager *pm, uint32_t grace_period);
+int pm_update_grace_period(struct packet_manager *pm, u32 grace_period);
 
 /* Following PM funcs can be shared among VI and AI */
 unsigned int pm_build_pm4_header(unsigned int opcode, size_t packet_size);
 
-uint64_t kfd_get_number_elems(struct kfd_dev *kfd);
+u64 kfd_get_number_elems(struct kfd_dev *kfd);
 
 /* Events */
 extern const struct kfd_event_interrupt_class event_interrupt_class_cik;
@@ -1435,26 +1439,26 @@ int kfd_event_init_process(struct kfd_process *p);
 void kfd_event_free_process(struct kfd_process *p);
 int kfd_event_mmap(struct kfd_process *process, struct vm_area_struct *vma);
 int kfd_wait_on_events(struct kfd_process *p,
-		       uint32_t num_events, void __user *data,
-		       bool all, uint32_t *user_timeout_ms,
-		       uint32_t *wait_result);
-void kfd_signal_event_interrupt(u32 pasid, uint32_t partial_id,
-				uint32_t valid_id_bits);
+		       u32 num_events, void __user *data,
+		       bool all, u32 *user_timeout_ms,
+		       u32 *wait_result);
+void kfd_signal_event_interrupt(u32 pasid, u32 partial_id,
+				u32 valid_id_bits);
 void kfd_signal_hw_exception_event(u32 pasid);
-int kfd_set_event(struct kfd_process *p, uint32_t event_id);
-int kfd_reset_event(struct kfd_process *p, uint32_t event_id);
-int kfd_kmap_event_page(struct kfd_process *p, uint64_t event_page_offset);
+int kfd_set_event(struct kfd_process *p, u32 event_id);
+int kfd_reset_event(struct kfd_process *p, u32 event_id);
+int kfd_kmap_event_page(struct kfd_process *p, u64 event_page_offset);
 
 int kfd_event_create(struct file *devkfd, struct kfd_process *p,
-		     uint32_t event_type, bool auto_reset, uint32_t node_id,
-		     uint32_t *event_id, uint32_t *event_trigger_data,
-		     uint64_t *event_page_offset, uint32_t *event_slot_index);
+		     u32 event_type, bool auto_reset, u32 node_id,
+		     u32 *event_id, u32 *event_trigger_data,
+		     u64 *event_page_offset, u32 *event_slot_index);
 
 int kfd_get_num_events(struct kfd_process *p);
-int kfd_event_destroy(struct kfd_process *p, uint32_t event_id);
+int kfd_event_destroy(struct kfd_process *p, u32 event_id);
 
 void kfd_signal_vm_fault_event(struct kfd_node *dev, u32 pasid,
-				struct kfd_vm_fault_info *info,
+			       struct kfd_vm_fault_info *info,
 				struct kfd_hsa_memory_exception_data *data);
 
 void kfd_signal_reset_event(struct kfd_node *dev);
@@ -1478,8 +1482,8 @@ static inline bool kfd_flush_tlb_after_unmap(struct kfd_dev *dev)
 }
 
 int kfd_send_exception_to_runtime(struct kfd_process *p,
-				unsigned int queue_id,
-				uint64_t error_reason);
+				  unsigned int queue_id,
+				u64 error_reason);
 bool kfd_is_locked(void);
 
 /* Compute profile */
-- 
2.34.1

