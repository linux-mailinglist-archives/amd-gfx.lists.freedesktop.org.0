Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7978435FF85
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Apr 2021 03:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3526E9BD;
	Thu, 15 Apr 2021 01:24:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680047.outbound.protection.outlook.com [40.107.68.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB806E9D3;
 Thu, 15 Apr 2021 01:24:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a12VmspkEZfwgt8DuC2M/f5rCTdDD6jSZUM3boGCN14QYLHSdEIU7vRfdv5hIpEX/foc0IfnLpcEAFEnq8BJCemD0Md9w956ug3BiCu5MetZldiW8saEIGzm/J/dHJ5W5NGIaJ6mQd44fqayF3dvTF3lxapKQUPhK1/WLU+W72I9jzJkVcIcG8O9g64/B3j8CKKPMEnyVzQMQHeu0iCPDdc3cRngvRGCBXv/zhw6qCwSm+n1H+DZkCoKZ30dRBZTGTHQIBs3ZMzwcc5W+rZIC3bqVO4I6mrEBTx7Tn9SZBUKyXeVsWcl+a1yE2rktO1yXj0nbLmVSZPc7ZtckwqB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5BdumDXHUKo3s2wmlNF46JJVcV91tcJyGPiCuGr9TA=;
 b=eDrqjtRZ2XDrjIHIrJw86VXFUNeRg7NrUtTV5lB5dyi/S1/1C6gAEKj/yH1yWBQ2vCikI6LufXClr5pPJvl1kxCr9JuatqdS28JUyrTJ2AXnhwPaFyAR0Fo5VEDyS02xrTQJB0Pz9dR/0R9jMAadGJi7+iLYM5n6Dp3DYYwLpemkVd0EoJ0cFvcV3uvoQqS1454DHnosacJajl//VzWjvvuQU6Yl8UFiB39QJ4g94VKqi5bygwwZVJhOq2t90Y98JXpkIggdJDJtzyhZk7L5NPKzmzwSS6zYR/3y6QFbOvvBkZWWUV1XSbozbfY/5FonkXh/NXSC0z4bdCx0kwvmJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5BdumDXHUKo3s2wmlNF46JJVcV91tcJyGPiCuGr9TA=;
 b=rQ/bzJP19x4v2oCL1BSY19TI0Yw9jBFf2tJJpBwyZkFAL5968t6RAw8Bmbc6ybStNFU+wF0lgrDf/7G8X/naEPCQmMYft7YbrPsU2kD/LgaRYbP+bzOwQ0ioId2JVnO9kuybs7cN1i7qJCQA0NwJsA0PGH1CjccRGps5h+fVvzE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4797.namprd12.prod.outlook.com (2603:10b6:208:a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 01:24:41 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:41 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 34/34] drm/amdkfd: Add CONFIG_HSA_AMD_SVM
Date: Wed, 14 Apr 2021 21:23:37 -0400
Message-Id: <20210415012337.1755-35-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a887928-a1bc-46ac-3c7c-08d8ffad2c25
X-MS-TrafficTypeDiagnostic: MN2PR12MB4797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4797B412E70EA8C0A9F5DE1A924D9@MN2PR12MB4797.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4gn5XtkXjT/Ba4y4kE4inAi9tcF1qLtwj8uu4TnGoaY+rjf5/WI5LMV02yHbQNaSxeJhtdR+SbTwTLrMJTJ/wN9hUtC4sWneMxQ7+sNPd9glLkgPw8xjlhhmmRUhqtREn/ioinC/fD+EW26ds7lf5C6OQJ6xzLZP8yOVJll1BkCQRQ/Fswt5l6XphW1jdrksfyphlCeSTqyqy5Zj3XSioU8cksulQAlGDAp7yOyjGa5km+J1oorYCQnXltnbyxXdmFMiQ+oX6IV+3Vame4FLm8IJzEIHXIVE91vFJQiy+9o5CgBGZXMe9xkcoX4S1CseNlLUkCrmVbLJE8Yl5YtT36bUJOJj+/4WB40FZkokHf+6WoxeptHWyS/ad5f5ZgXyUKnc51OSq/GdslagmVkmX5+lLeO2Keu5hxYKfHpyuE0e4dUxGxQNaQpf8e4867HPno2CU8OXgYQdx7mIVFls5KYDXTu+0bQtNweyg1MtKEg8rkCsYFgtnpq+JkiAMn7S5Mdkk6oswlpRY16hJB4ML6+8dtoYfL7VEllKqSN/D1EQZd7RfXYAubEAD4g81PxGYc0G43z8qX/B5yMuwxXEHU6elO04Xsf5y9CZX3cxWk+YP9JheiOhhxwQeHPCLFEPWHCXcPXqBtoGc1vsyjMFzsRT1xW5ZY6/qKD0AlXpvJs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(86362001)(66476007)(66946007)(2906002)(38350700002)(186003)(36756003)(16526019)(450100002)(38100700002)(5660300002)(83380400001)(66556008)(4326008)(52116002)(7696005)(478600001)(6486002)(8936002)(2616005)(8676002)(1076003)(6666004)(956004)(26005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0OSLf7+JmJxDInx6+43YMl35/Q7K3SdO3/b13kXvbLUFpRv0KHfjvSAHTGEc?=
 =?us-ascii?Q?0ocyOMgQzo6DHMZ8bPtVV/tLHEuLkict6CUNZZYUVML/uip5cVdypby8MCby?=
 =?us-ascii?Q?rx7B5rVxmtDAnyCnPcieARV3ylDC/rbBTtT4xqQKO6/126iGR6szCnJCi+7Z?=
 =?us-ascii?Q?FpREpOGh7VFKMKsKjMjJXqyIUPP+NsxJfMnDliD56M7fWi+B3IRmysOV8CMW?=
 =?us-ascii?Q?HH7e/Af0mM3jAeznRanmRy10kbY57wRWDQ1V/8aF/NItz+3nik7LRUzdwvpy?=
 =?us-ascii?Q?tUD0w62thPsd8UGRd45fpup7e7uDLiLn60VwsQPNMtMBSAPJQ5VD6BSU4W+c?=
 =?us-ascii?Q?7tfgS2Z640nI+oHJByf5WFDUxz1FVfRyd8Sll7YW7AkquM9ltV5T7NazTwss?=
 =?us-ascii?Q?i9uckXrypGPzUo9Zl01Jk+TxD51JsmHL/euz2lXap+llzvC0Tu4a/4xc6AMF?=
 =?us-ascii?Q?kAKgndAkaNR8XwP+12yIY9TCgxLNuWpjJyqRozm3ILGiadU5ZBuiOBmy3qMA?=
 =?us-ascii?Q?QKqs4Fe1xnmuszcN990vcWI0/Zs6F1hSueqV9KNzFUPwZSelBXeZcsDcZJVc?=
 =?us-ascii?Q?2CY+6gZ3B7f2tHurS8ri9nIgNLuAYC7wOS4LzhKh1Uwqo16/gj9Yl5dTYHH9?=
 =?us-ascii?Q?mEi921JOeeyA29j8/GwDl4zMyqGHwuIvMnJvtrPMAvwlMwxDOkGJIvaF4lo/?=
 =?us-ascii?Q?pOjF3LIelxul/qiArGBsMbd6eeVvnDylEN78jh1IzsFy0ZtBmaScLyp+ie91?=
 =?us-ascii?Q?Cai0a1XLGHadmYgZZb2wcyRNf7jJTiQu/AAlDAbIDw4FW9k49rvt0xg7DUZl?=
 =?us-ascii?Q?jswrbaryO1hVF1t4qq3RVV+RimWZRYL2LyuwmL2Kj83Vlblwrvg2D5xNKiRW?=
 =?us-ascii?Q?JesW2lJMFPQXDk5Yt9UhjN+m0MpzkERbLOJppZGUemvUlYRtShKR3WC9ep1s?=
 =?us-ascii?Q?jI+4St6xioqAr6hy1Ey6AgA0pLPMhJS+z3MvRWaOjGvCeEZAJReOoxVujTtb?=
 =?us-ascii?Q?S35+r7cY1ilEtiGmGvjbHr06hnKi/TTHffvORMkOS/z9GUIRiqyV6NzHoHFF?=
 =?us-ascii?Q?EJGV0Ivqb7+I7NMFBCqrZjEbunzRit+U2WEp/8xzPmOdb7MRxDoBkmFu1THA?=
 =?us-ascii?Q?Re2kstDuNjzHgXMXpFY+tvbypn66B0A77SNjJWfSqHUpVlcRkwYi+v6hJX+2?=
 =?us-ascii?Q?mbh6ro/rlucQ43dD1qJe5PxAL7JB/EWvFFghH2HHf31f85uQxe1OkO4U8aOP?=
 =?us-ascii?Q?DoS4eLjE1xH6MdDZzICkRRhAxdqOj74T3XCHZTn/miEmOZLrs+SOTpeh/X4U?=
 =?us-ascii?Q?FKcqso4+ax95AUif26LPc+FQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a887928-a1bc-46ac-3c7c-08d8ffad2c25
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:10.9501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ynt2AhPc3zO4BJxzbJD5K4ZuX8lvASNzCiFgCcD5Utw+i9KywtZp4d9rOZXxKVVRdb7o1ljcv8MtaR3y8y3TSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4797
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Control whether to build SVM support into amdgpu with a Kconfig option.
This makes it easier to disable it in production kernels if this new
feature causes problems in production environments.

Use "depends on" instead of "select" for DEVICE_PRIVATE, as is
recommended for visible options.

Reviewed-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig       | 15 ++++++++++--
 drivers/gpu/drm/amd/amdkfd/Makefile      |  9 ++++---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  7 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h | 17 +++++++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 30 ++++++++++++++++++++++++
 5 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index fb8d85716599..8cc0a76ddf9f 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -8,9 +8,20 @@ config HSA_AMD
 	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
 	imply AMD_IOMMU_V2 if X86_64
 	select HMM_MIRROR
-	select ZONE_DEVICE
-	select DEVICE_PRIVATE
 	select MMU_NOTIFIER
 	select DRM_AMDGPU_USERPTR
 	help
 	  Enable this if you want to use HSA features on AMD GPU devices.
+
+config HSA_AMD_SVM
+	bool "Enable HMM-based shared virtual memory manager"
+	depends on HSA_AMD && DEVICE_PRIVATE
+	default y
+	select HMM_MIRROR
+	select MMU_NOTIFIER
+	help
+	  Enable this to use unified memory and managed memory in HIP. This
+	  memory manager supports two modes of operation. One based on
+	  preemptions and one based on page faults. To enable page fault
+	  based memory management on most GFXv9 GPUs, set the module
+	  parameter amdgpu.noretry=0.
diff --git a/drivers/gpu/drm/amd/amdkfd/Makefile b/drivers/gpu/drm/amd/amdkfd/Makefile
index a93301dbc464..c4f3aff11072 100644
--- a/drivers/gpu/drm/amd/amdkfd/Makefile
+++ b/drivers/gpu/drm/amd/amdkfd/Makefile
@@ -54,9 +54,7 @@ AMDKFD_FILES	:= $(AMDKFD_PATH)/kfd_module.o \
 		$(AMDKFD_PATH)/kfd_dbgdev.o \
 		$(AMDKFD_PATH)/kfd_dbgmgr.o \
 		$(AMDKFD_PATH)/kfd_smi_events.o \
-		$(AMDKFD_PATH)/kfd_crat.o \
-		$(AMDKFD_PATH)/kfd_svm.o \
-		$(AMDKFD_PATH)/kfd_migrate.o
+		$(AMDKFD_PATH)/kfd_crat.o
 
 ifneq ($(CONFIG_AMD_IOMMU_V2),)
 AMDKFD_FILES += $(AMDKFD_PATH)/kfd_iommu.o
@@ -65,3 +63,8 @@ endif
 ifneq ($(CONFIG_DEBUG_FS),)
 AMDKFD_FILES += $(AMDKFD_PATH)/kfd_debugfs.o
 endif
+
+ifneq ($(CONFIG_HSA_AMD_SVM),)
+AMDKFD_FILES += $(AMDKFD_PATH)/kfd_svm.o \
+		$(AMDKFD_PATH)/kfd_migrate.o
+endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 9838d0cd1f51..f60c44dbae3e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1768,6 +1768,7 @@ static int kfd_ioctl_set_xnack_mode(struct file *filep,
 	return r;
 }
 
+#if IS_ENABLED(CONFIG_HSA_AMD_SVM)
 static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_svm_args *args = data;
@@ -1793,6 +1794,12 @@ static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 
 	return r;
 }
+#else
+static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
+{
+	return -EPERM;
+}
+#endif
 
 #define AMDKFD_IOCTL_DEF(ioctl, _func, _flags) \
 	[_IOC_NR(ioctl)] = {.cmd = ioctl, .func = _func, .flags = _flags, \
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 37ad99cb073d..0de76b5d4973 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -25,6 +25,8 @@
 #ifndef KFD_MIGRATE_H_
 #define KFD_MIGRATE_H_
 
+#if IS_ENABLED(CONFIG_HSA_AMD_SVM)
+
 #include <linux/rwsem.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -44,17 +46,20 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm);
 unsigned long
 svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
 
-#if defined(CONFIG_DEVICE_PRIVATE)
 int svm_migrate_init(struct amdgpu_device *adev);
 void svm_migrate_fini(struct amdgpu_device *adev);
 
 #else
+
 static inline int svm_migrate_init(struct amdgpu_device *adev)
 {
-	DRM_WARN_ONCE("DEVICE_PRIVATE kernel config option is not enabled, "
-		      "add CONFIG_DEVICE_PRIVATE=y in config file to fix\n");
-	return -ENODEV;
+	return 0;
+}
+static inline void svm_migrate_fini(struct amdgpu_device *adev)
+{
+	/* empty */
 }
-static inline void svm_migrate_fini(struct amdgpu_device *adev) {}
-#endif
+
+#endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
+
 #endif /* KFD_MIGRATE_H_ */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index aa829b3c992d..573f984b81fe 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -25,6 +25,8 @@
 #ifndef KFD_SVM_H_
 #define KFD_SVM_H_
 
+#if IS_ENABLED(CONFIG_HSA_AMD_SVM)
+
 #include <linux/rwsem.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -173,4 +175,32 @@ void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 void svm_range_free_dma_mappings(struct svm_range *prange);
 void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm);
 
+#else
+
+struct kfd_process;
+
+static inline int svm_range_list_init(struct kfd_process *p)
+{
+	return 0;
+}
+static inline void svm_range_list_fini(struct kfd_process *p)
+{
+	/* empty */
+}
+
+static inline int svm_range_restore_pages(struct amdgpu_device *adev,
+					  unsigned int pasid, uint64_t addr)
+{
+	return -EFAULT;
+}
+
+static inline int svm_range_schedule_evict_svm_bo(
+		struct amdgpu_amdkfd_fence *fence)
+{
+	WARN_ONCE(1, "SVM eviction fence triggered, but SVM is disabled");
+	return -EINVAL;
+}
+
+#endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
+
 #endif /* KFD_SVM_H_ */
-- 
2.31.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
