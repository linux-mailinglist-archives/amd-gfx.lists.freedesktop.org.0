Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EE13DF99B
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Aug 2021 04:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664476E9A7;
	Wed,  4 Aug 2021 02:16:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747FF6E9A7
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Aug 2021 02:15:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N42WCmSk0NfuA7tzTf44aUrLpRFAjIur7S3Gt7PIF2gfB5cQDX7sqJkLIpmtI0eHc/HxuDjd5IANIIE+r4hre52S1bPAvUO8f13hjAjSPhbP6CFCeh0PF5k4bnwZ2Q0Fqq6nqcAaKAn/rAMKWOTYbFWQsdb1WlbuTWgZPmiPCnfF1gkZSGdU9CZIMYnPsAMe8h56zl0jyf2oOKMEZ+oWoBWr44UDOvmF4ZcPIi+JFeqJWj/XAgV0gykmB4HLN/OlQ0i8x+y0n6kN5AaRnloVmkWaVElKyVoVYzkmqubbOCH9tZ8o5YYcwmYl23Ys4qVWFCVr9lECFFszQ26aRSunwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPXlSP45iF9k1Q/dvgf/8FYfTpn4anQJUXwkhrFTC08=;
 b=J87y6quchJMX5rzKM3Bu6vEuQEyU78apwBaCXcHBRQ2p4qeNfOUbeI4CZ2DEFkHsmzzNxoVVBEYN9NpVc3eFe/tXT7JEugusg4k2go3SrQTukjyEZLeXyMPiWSthUO9wzhbiP32QBKEnx5QgHbsLiWQuAC+8mIlPRgt/7P2SDwMxCug5pFkxpa2e7MLQhNnGpI8kXx3rWXMUkiqpkahAShztNpJczu7u1o8D+2WHHRh6lZ56hOZcEIr66gRl8KfK/RhCz05PlpH1/0rIYsjFQZmO6UgMc9Yurfq+mwN6zrPv6oenFbNXi9PbMULx2Rj89POPMyySzx92/RlxTY4b5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPXlSP45iF9k1Q/dvgf/8FYfTpn4anQJUXwkhrFTC08=;
 b=ORhu/Hp8mnQWzbx8luTvrUUQkCO0dssBMvG4KtSfahII7VQj5hCXzONdkjz4RD3tLaiWJSn74dYx2A6HJNvk16itqzIxnByGdj4EBUQAVyqbwcGAbbUMr/cI5a5XzOa5Uh98wgr5h9l91SfCRH7yEGsOFLlxknEGXC8UToG+ots=
Received: from MWHPR17CA0091.namprd17.prod.outlook.com (2603:10b6:300:c2::29)
 by MW3PR12MB4361.namprd12.prod.outlook.com (2603:10b6:303:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Wed, 4 Aug
 2021 02:15:47 +0000
Received: from CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c2:cafe::8b) by MWHPR17CA0091.outlook.office365.com
 (2603:10b6:300:c2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Wed, 4 Aug 2021 02:15:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT014.mail.protection.outlook.com (10.13.175.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Wed, 4 Aug 2021 02:15:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 3 Aug
 2021 21:15:42 -0500
Received: from z-bu18.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12 via Frontend
 Transport; Tue, 3 Aug 2021 21:15:40 -0500
From: Peng Ju Zhou <PengJu.Zhou@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: David M Nieto <david.nieto@amd.com>, Peng Ju Zhou <PengJu.Zhou@amd.com>
Subject: [PATCH] drm/amdgpu: Add driver version
Date: Wed, 4 Aug 2021 10:15:28 +0800
Message-ID: <20210804021528.25421-2-PengJu.Zhou@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210804021528.25421-1-PengJu.Zhou@amd.com>
References: <20210804021528.25421-1-PengJu.Zhou@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e69c9403-c1d6-42a3-5095-08d956edc5c9
X-MS-TrafficTypeDiagnostic: MW3PR12MB4361:
X-Microsoft-Antispam-PRVS: <MW3PR12MB43617B6D6132FBD80C2EEFCFF8F19@MW3PR12MB4361.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: heuHaolUHBL9sYo7Or+H+wDr/H/shJxzVOQemvm1MCQpD3G4LUD/RCFrk9dlftXNdJd2vSxHEZtv5FVUezG8umlBVlSODIenHuYUsJ5fHB9OD/NdX9VgNkj4T57NRU7czKrU1LOwqT4UhwSo+iGc9PbjPpqsDhHk6rSiS7kqWFun5gP7KqKjz8sh6/KL1jq72b1ClR0ogvUHel220+38mdApnIyYi2Wt39QOXbue809lcX/JVBBF8f4SW6F4PvNBBNiolv5YojAGMmsmaGMFV147/3A8i1jrHbY1Oq2A7CJJfS1ll/AQG8IVBfv9gqbEZYnWfTEB9mBkVqOHw/bmcy3X5dMOLMX7HCAIUzyw5mjC83KvkwLHzNDuHVQVyi5C8c4DO3BT4YweaoxR8vPzP0kgVPNxJjPyEayUWtkw79EjZYRXTIs9pfS6a+sQFzN3i4wIgYOTm6nFCfTKC3sdlRry7qIDQWjx4uf8oGkQRj+kRW9+5hwDDyKtWOsXJ8VdFIJh7tFn8xV+5GYZjKHe7jBUJmunu74KGnBC06b68C44Tk7VadPq+qKMNHcHXi0PR1GQtxvcXKxcRSffytVKsTM8VwRcnWepK59fPTAxUwXKjk3YErqoWdldotTajOMuHjy7SO2jcK1xdanORZsmFhGFYBpBtPaYL3UGUaBeu1mKeYeaqQItgMmzQ+H94xw2eo3dIaBohvDFdxDh7Kdfw3IiJEwkuTdk5tid6eV/XHjgqmoBOx9x59SM937pxjR+DBN/b3HOmQtNwxvrbCxM0YPr/BGYCSVg9NelNaBqXDw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966006)(36840700001)(36756003)(4326008)(83380400001)(8676002)(36860700001)(47076005)(26005)(6916009)(186003)(8936002)(1076003)(6666004)(70586007)(70206006)(5660300002)(30864003)(86362001)(356005)(336012)(478600001)(82740400003)(81166007)(54906003)(2906002)(426003)(2616005)(82310400003)(7696005)(316002)(21314003)(36900700001)(559001)(579004)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 02:15:47.3579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e69c9403-c1d6-42a3-5095-08d956edc5c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361
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

From: David M Nieto <david.nieto@amd.com>

This sysfs is only defined in DKMS drivers
it exposes the internal AMDGPU version

Signed-off-by: David M Nieto <david.nieto@amd.com>
Signed-off-by: Peng Ju Zhou <PengJu.Zhou@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2659 +++++++-------------
 1 file changed, 941 insertions(+), 1718 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 9e53ff851496..d93d1c966bad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -29,6 +29,7 @@
 #include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/console.h>
+#include <linux/reboot.h>
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -65,13 +66,9 @@
 #include "amdgpu_ras.h"
 #include "amdgpu_pmu.h"
 #include "amdgpu_fru_eeprom.h"
-#include "amdgpu_reset.h"
 
 #include <linux/suspend.h>
 #include <drm/task_barrier.h>
-#include <linux/pm_runtime.h>
-
-#include <drm/drm_drv.h>
 
 MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
@@ -83,8 +80,6 @@ MODULE_FIRMWARE("amdgpu/renoir_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/navi10_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/navi14_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/navi12_gpu_info.bin");
-MODULE_FIRMWARE("amdgpu/vangogh_gpu_info.bin");
-MODULE_FIRMWARE("amdgpu/yellow_carp_gpu_info.bin");
 
 #define AMDGPU_RESUME_MS		2000
 
@@ -114,17 +109,9 @@ const char *amdgpu_asic_name[] = {
 	"RAVEN",
 	"ARCTURUS",
 	"RENOIR",
-	"ALDEBARAN",
 	"NAVI10",
-	"CYAN_SKILLFISH",
 	"NAVI14",
 	"NAVI12",
-	"SIENNA_CICHLID",
-	"NAVY_FLOUNDER",
-	"VANGOGH",
-	"DIMGREY_CAVEFISH",
-	"BEIGE_GOBY",
-	"YELLOW_CARP",
 	"LAST",
 };
 
@@ -141,10 +128,10 @@ static ssize_t amdgpu_device_get_pcie_replay_count(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = drm_to_adev(ddev);
+	struct amdgpu_device *adev = ddev->dev_private;
 	uint64_t cnt = amdgpu_asic_get_pcie_replay_count(adev);
 
-	return sysfs_emit(buf, "%llu\n", cnt);
+	return snprintf(buf, PAGE_SIZE, "%llu\n", cnt);
 }
 
 static DEVICE_ATTR(pcie_replay_count, S_IRUGO,
@@ -166,9 +153,9 @@ static ssize_t amdgpu_device_get_product_name(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = drm_to_adev(ddev);
+	struct amdgpu_device *adev = ddev->dev_private;
 
-	return sysfs_emit(buf, "%s\n", adev->product_name);
+	return snprintf(buf, PAGE_SIZE, "%s\n", adev->product_name);
 }
 
 static DEVICE_ATTR(product_name, S_IRUGO,
@@ -188,9 +175,9 @@ static ssize_t amdgpu_device_get_product_number(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = drm_to_adev(ddev);
+	struct amdgpu_device *adev = ddev->dev_private;
 
-	return sysfs_emit(buf, "%s\n", adev->product_number);
+	return snprintf(buf, PAGE_SIZE, "%s\n", adev->product_number);
 }
 
 static DEVICE_ATTR(product_number, S_IRUGO,
@@ -210,45 +197,27 @@ static ssize_t amdgpu_device_get_serial_number(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct amdgpu_device *adev = drm_to_adev(ddev);
+	struct amdgpu_device *adev = ddev->dev_private;
 
-	return sysfs_emit(buf, "%s\n", adev->serial);
+	return snprintf(buf, PAGE_SIZE, "%s\n", adev->serial);
 }
 
 static DEVICE_ATTR(serial_number, S_IRUGO,
 		amdgpu_device_get_serial_number, NULL);
 
 /**
- * amdgpu_device_supports_px - Is the device a dGPU with ATPX power control
- *
- * @dev: drm_device pointer
- *
- * Returns true if the device is a dGPU with ATPX power control,
- * otherwise return false.
- */
-bool amdgpu_device_supports_px(struct drm_device *dev)
-{
-	struct amdgpu_device *adev = drm_to_adev(dev);
-
-	if ((adev->flags & AMD_IS_PX) && !amdgpu_is_atpx_hybrid())
-		return true;
-	return false;
-}
-
-/**
- * amdgpu_device_supports_boco - Is the device a dGPU with ACPI power resources
+ * amdgpu_device_supports_boco - Is the device a dGPU with HG/PX power control
  *
  * @dev: drm_device pointer
  *
- * Returns true if the device is a dGPU with ACPI power control,
+ * Returns true if the device is a dGPU with HG/PX power control,
  * otherwise return false.
  */
 bool amdgpu_device_supports_boco(struct drm_device *dev)
 {
-	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct amdgpu_device *adev = dev->dev_private;
 
-	if (adev->has_pr3 ||
-	    ((adev->flags & AMD_IS_PX) && amdgpu_is_atpx_hybrid()))
+	if (adev->flags & AMD_IS_PX)
 		return true;
 	return false;
 }
@@ -263,32 +232,15 @@ bool amdgpu_device_supports_boco(struct drm_device *dev)
  */
 bool amdgpu_device_supports_baco(struct drm_device *dev)
 {
-	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct amdgpu_device *adev = dev->dev_private;
 
 	return amdgpu_asic_supports_baco(adev);
 }
 
 /**
- * amdgpu_device_supports_smart_shift - Is the device dGPU with
- * smart shift support
- *
- * @dev: drm_device pointer
+ * VRAM access helper functions.
  *
- * Returns true if the device is a dGPU with Smart Shift support,
- * otherwise returns false.
- */
-bool amdgpu_device_supports_smart_shift(struct drm_device *dev)
-{
-	return (amdgpu_device_supports_boco(dev) &&
-		amdgpu_acpi_is_power_shift_control_supported());
-}
-
-/*
- * VRAM access helper functions
- */
-
-/**
- * amdgpu_device_mm_access - access vram by MM_INDEX/MM_DATA
+ * amdgpu_device_vram_access - read/write a buffer in vram
  *
  * @adev: amdgpu_device pointer
  * @pos: offset of the buffer in vram
@@ -296,143 +248,61 @@ bool amdgpu_device_supports_smart_shift(struct drm_device *dev)
  * @size: read/write size, sizeof(@buf) must > @size
  * @write: true - write to vram, otherwise - read from vram
  */
-void amdgpu_device_mm_access(struct amdgpu_device *adev, loff_t pos,
-			     void *buf, size_t size, bool write)
+void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
+			       uint32_t *buf, size_t size, bool write)
 {
 	unsigned long flags;
-	uint32_t hi = ~0, tmp = 0;
-	uint32_t *data = buf;
+	uint32_t hi = ~0;
 	uint64_t last;
-	int idx;
-
-	if (!drm_dev_enter(&adev->ddev, &idx))
-		return;
-
-	BUG_ON(!IS_ALIGNED(pos, 4) || !IS_ALIGNED(size, 4));
-
-	spin_lock_irqsave(&adev->mmio_idx_lock, flags);
-	for (last = pos + size; pos < last; pos += 4) {
-		tmp = pos >> 31;
-
-		WREG32_NO_KIQ(mmMM_INDEX, ((uint32_t)pos) | 0x80000000);
-		if (tmp != hi) {
-			WREG32_NO_KIQ(mmMM_INDEX_HI, tmp);
-			hi = tmp;
-		}
-		if (write)
-			WREG32_NO_KIQ(mmMM_DATA, *data++);
-		else
-			*data++ = RREG32_NO_KIQ(mmMM_DATA);
-	}
 
-	spin_unlock_irqrestore(&adev->mmio_idx_lock, flags);
-	drm_dev_exit(idx);
-}
 
-/**
- * amdgpu_device_vram_access - access vram by vram aperature
- *
- * @adev: amdgpu_device pointer
- * @pos: offset of the buffer in vram
- * @buf: virtual address of the buffer in system memory
- * @size: read/write size, sizeof(@buf) must > @size
- * @write: true - write to vram, otherwise - read from vram
- *
- * The return value means how many bytes have been transferred.
- */
-size_t amdgpu_device_aper_access(struct amdgpu_device *adev, loff_t pos,
-				 void *buf, size_t size, bool write)
-{
 #ifdef CONFIG_64BIT
-	void __iomem *addr;
-	size_t count = 0;
-	uint64_t last;
-
-	if (!adev->mman.aper_base_kaddr)
-		return 0;
-
 	last = min(pos + size, adev->gmc.visible_vram_size);
 	if (last > pos) {
-		addr = adev->mman.aper_base_kaddr + pos;
-		count = last - pos;
+		void __iomem *addr = adev->mman.aper_base_kaddr + pos;
+		size_t count = last - pos;
 
 		if (write) {
 			memcpy_toio(addr, buf, count);
 			mb();
-			amdgpu_device_flush_hdp(adev, NULL);
+			amdgpu_asic_flush_hdp(adev, NULL);
 		} else {
-			amdgpu_device_invalidate_hdp(adev, NULL);
+			amdgpu_asic_invalidate_hdp(adev, NULL);
 			mb();
 			memcpy_fromio(buf, addr, count);
 		}
 
-	}
-
-	return count;
-#else
-	return 0;
-#endif
-}
-
-/**
- * amdgpu_device_vram_access - read/write a buffer in vram
- *
- * @adev: amdgpu_device pointer
- * @pos: offset of the buffer in vram
- * @buf: virtual address of the buffer in system memory
- * @size: read/write size, sizeof(@buf) must > @size
- * @write: true - write to vram, otherwise - read from vram
- */
-void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
-			       void *buf, size_t size, bool write)
-{
-	size_t count;
+		if (count == size)
+			return;
 
-	/* try to using vram apreature to access vram first */
-	count = amdgpu_device_aper_access(adev, pos, buf, size, write);
-	size -= count;
-	if (size) {
-		/* using MM to access rest vram */
 		pos += count;
-		buf += count;
-		amdgpu_device_mm_access(adev, pos, buf, size, write);
+		buf += count / 4;
+		size -= count;
 	}
-}
-
-/*
- * register access helper functions.
- */
+#endif
 
-/* Check if hw access should be skipped because of hotplug or device error */
-bool amdgpu_device_skip_hw_access(struct amdgpu_device *adev)
-{
-	if (adev->no_hw_access)
-		return true;
+	spin_lock_irqsave(&adev->mmio_idx_lock, flags);
+	for (last = pos + size; pos < last; pos += 4) {
+		uint32_t tmp = pos >> 31;
 
-#ifdef CONFIG_LOCKDEP
-	/*
-	 * This is a bit complicated to understand, so worth a comment. What we assert
-	 * here is that the GPU reset is not running on another thread in parallel.
-	 *
-	 * For this we trylock the read side of the reset semaphore, if that succeeds
-	 * we know that the reset is not running in paralell.
-	 *
-	 * If the trylock fails we assert that we are either already holding the read
-	 * side of the lock or are the reset thread itself and hold the write side of
-	 * the lock.
-	 */
-	if (in_task()) {
-		if (down_read_trylock(&adev->reset_sem))
-			up_read(&adev->reset_sem);
+		WREG32_NO_KIQ(mmMM_INDEX, ((uint32_t)pos) | 0x80000000);
+		if (tmp != hi) {
+			WREG32_NO_KIQ(mmMM_INDEX_HI, tmp);
+			hi = tmp;
+		}
+		if (write)
+			WREG32_NO_KIQ(mmMM_DATA, *buf++);
 		else
-			lockdep_assert_held(&adev->reset_sem);
+			*buf++ = RREG32_NO_KIQ(mmMM_DATA);
 	}
-#endif
-	return false;
+	spin_unlock_irqrestore(&adev->mmio_idx_lock, flags);
 }
 
+/*
+ * MMIO register access helper functions.
+ */
 /**
- * amdgpu_device_rreg - read a memory mapped IO or indirect register
+ * amdgpu_mm_rreg - read a memory mapped IO register
  *
  * @adev: amdgpu_device pointer
  * @reg: dword aligned register offset
@@ -440,29 +310,25 @@ bool amdgpu_device_skip_hw_access(struct amdgpu_device *adev)
  *
  * Returns the 32 bit value from the offset specified.
  */
-uint32_t amdgpu_device_rreg(struct amdgpu_device *adev,
-			    uint32_t reg, uint32_t acc_flags)
+uint32_t amdgpu_mm_rreg(struct amdgpu_device *adev, uint32_t reg,
+			uint32_t acc_flags)
 {
 	uint32_t ret;
 
-	if (amdgpu_device_skip_hw_access(adev))
-		return 0;
-
-	if ((reg * 4) < adev->rmmio_size) {
-		if (!(acc_flags & AMDGPU_REGS_NO_KIQ) &&
-		    amdgpu_sriov_runtime(adev) &&
-		    down_read_trylock(&adev->reset_sem)) {
-			ret = amdgpu_kiq_rreg(adev, reg);
-			up_read(&adev->reset_sem);
-		} else {
-			ret = readl(((void __iomem *)adev->rmmio) + (reg * 4));
-		}
-	} else {
-		ret = adev->pcie_rreg(adev, reg * 4);
-	}
+	if ((acc_flags & AMDGPU_REGS_KIQ) || (!(acc_flags & AMDGPU_REGS_NO_KIQ) && amdgpu_sriov_runtime(adev)))
+		return amdgpu_kiq_rreg(adev, reg);
 
-	trace_amdgpu_device_rreg(adev->pdev->device, reg, ret);
+	if ((reg * 4) < adev->rmmio_size && !(acc_flags & AMDGPU_REGS_IDX))
+		ret = readl(((void __iomem *)adev->rmmio) + (reg * 4));
+	else {
+		unsigned long flags;
 
+		spin_lock_irqsave(&adev->mmio_idx_lock, flags);
+		writel((reg * 4), ((void __iomem *)adev->rmmio) + (mmMM_INDEX * 4));
+		ret = readl(((void __iomem *)adev->rmmio) + (mmMM_DATA * 4));
+		spin_unlock_irqrestore(&adev->mmio_idx_lock, flags);
+	}
+	trace_amdgpu_mm_rreg(adev->pdev->device, reg, ret);
 	return ret;
 }
 
@@ -482,9 +348,6 @@ uint32_t amdgpu_device_rreg(struct amdgpu_device *adev,
  */
 uint8_t amdgpu_mm_rreg8(struct amdgpu_device *adev, uint32_t offset)
 {
-	if (amdgpu_device_skip_hw_access(adev))
-		return 0;
-
 	if (offset < adev->rmmio_size)
 		return (readb(adev->rmmio + offset));
 	BUG();
@@ -507,17 +370,34 @@ uint8_t amdgpu_mm_rreg8(struct amdgpu_device *adev, uint32_t offset)
  */
 void amdgpu_mm_wreg8(struct amdgpu_device *adev, uint32_t offset, uint8_t value)
 {
-	if (amdgpu_device_skip_hw_access(adev))
-		return;
-
 	if (offset < adev->rmmio_size)
 		writeb(value, adev->rmmio + offset);
 	else
 		BUG();
 }
 
+void static inline amdgpu_mm_wreg_mmio(struct amdgpu_device *adev, uint32_t reg, uint32_t v, uint32_t acc_flags)
+{
+	trace_amdgpu_mm_wreg(adev->pdev->device, reg, v);
+
+	if ((reg * 4) < adev->rmmio_size && !(acc_flags & AMDGPU_REGS_IDX))
+		writel(v, ((void __iomem *)adev->rmmio) + (reg * 4));
+	else {
+		unsigned long flags;
+
+		spin_lock_irqsave(&adev->mmio_idx_lock, flags);
+		writel((reg * 4), ((void __iomem *)adev->rmmio) + (mmMM_INDEX * 4));
+		writel(v, ((void __iomem *)adev->rmmio) + (mmMM_DATA * 4));
+		spin_unlock_irqrestore(&adev->mmio_idx_lock, flags);
+	}
+
+	if (adev->asic_type >= CHIP_VEGA10 && reg == 1 && adev->last_mm_index == 0x5702C) {
+		udelay(500);
+	}
+}
+
 /**
- * amdgpu_device_wreg - write to a memory mapped IO or indirect register
+ * amdgpu_mm_wreg - write to a memory mapped IO register
  *
  * @adev: amdgpu_device pointer
  * @reg: dword aligned register offset
@@ -526,27 +406,17 @@ void amdgpu_mm_wreg8(struct amdgpu_device *adev, uint32_t offset, uint8_t value)
  *
  * Writes the value specified to the offset specified.
  */
-void amdgpu_device_wreg(struct amdgpu_device *adev,
-			uint32_t reg, uint32_t v,
-			uint32_t acc_flags)
+void amdgpu_mm_wreg(struct amdgpu_device *adev, uint32_t reg, uint32_t v,
+		    uint32_t acc_flags)
 {
-	if (amdgpu_device_skip_hw_access(adev))
-		return;
-
-	if ((reg * 4) < adev->rmmio_size) {
-		if (!(acc_flags & AMDGPU_REGS_NO_KIQ) &&
-		    amdgpu_sriov_runtime(adev) &&
-		    down_read_trylock(&adev->reset_sem)) {
-			amdgpu_kiq_wreg(adev, reg, v);
-			up_read(&adev->reset_sem);
-		} else {
-			writel(v, ((void __iomem *)adev->rmmio) + (reg * 4));
-		}
-	} else {
-		adev->pcie_wreg(adev, reg * 4, v);
+	if (adev->asic_type >= CHIP_VEGA10 && reg == 0) {
+		adev->last_mm_index = v;
 	}
 
-	trace_amdgpu_device_wreg(adev->pdev->device, reg, v);
+	if ((acc_flags & AMDGPU_REGS_KIQ) || (!(acc_flags & AMDGPU_REGS_NO_KIQ) && amdgpu_sriov_runtime(adev)))
+		return amdgpu_kiq_wreg(adev, reg, v);
+
+	amdgpu_mm_wreg_mmio(adev, reg, v, acc_flags);
 }
 
 /*
@@ -554,19 +424,62 @@ void amdgpu_device_wreg(struct amdgpu_device *adev,
  *
  * this function is invoked only the debugfs register access
  * */
-void amdgpu_mm_wreg_mmio_rlc(struct amdgpu_device *adev,
-			     uint32_t reg, uint32_t v)
+void amdgpu_mm_wreg_mmio_rlc(struct amdgpu_device *adev, uint32_t reg, uint32_t v,
+		    uint32_t acc_flags)
 {
-	if (amdgpu_device_skip_hw_access(adev))
-		return;
-
 	if (amdgpu_sriov_fullaccess(adev) &&
-	    adev->gfx.rlc.funcs &&
-	    adev->gfx.rlc.funcs->is_rlcg_access_range) {
+		adev->gfx.rlc.funcs &&
+		adev->gfx.rlc.funcs->is_rlcg_access_range) {
+
 		if (adev->gfx.rlc.funcs->is_rlcg_access_range(adev, reg))
-			return adev->gfx.rlc.funcs->sriov_wreg(adev, reg, v, 0, 0);
-	} else {
-		writel(v, ((void __iomem *)adev->rmmio) + (reg * 4));
+			return adev->gfx.rlc.funcs->rlcg_wreg(adev, reg, v, 0);
+	}
+
+	amdgpu_mm_wreg_mmio(adev, reg, v, acc_flags);
+}
+
+/**
+ * amdgpu_io_rreg - read an IO register
+ *
+ * @adev: amdgpu_device pointer
+ * @reg: dword aligned register offset
+ *
+ * Returns the 32 bit value from the offset specified.
+ */
+u32 amdgpu_io_rreg(struct amdgpu_device *adev, u32 reg)
+{
+	if ((reg * 4) < adev->rio_mem_size)
+		return ioread32(adev->rio_mem + (reg * 4));
+	else {
+		iowrite32((reg * 4), adev->rio_mem + (mmMM_INDEX * 4));
+		return ioread32(adev->rio_mem + (mmMM_DATA * 4));
+	}
+}
+
+/**
+ * amdgpu_io_wreg - write to an IO register
+ *
+ * @adev: amdgpu_device pointer
+ * @reg: dword aligned register offset
+ * @v: 32 bit value to write to the register
+ *
+ * Writes the value specified to the offset specified.
+ */
+void amdgpu_io_wreg(struct amdgpu_device *adev, u32 reg, u32 v)
+{
+	if (adev->asic_type >= CHIP_VEGA10 && reg == 0) {
+		adev->last_mm_index = v;
+	}
+
+	if ((reg * 4) < adev->rio_mem_size)
+		iowrite32(v, adev->rio_mem + (reg * 4));
+	else {
+		iowrite32((reg * 4), adev->rio_mem + (mmMM_INDEX * 4));
+		iowrite32(v, adev->rio_mem + (mmMM_DATA * 4));
+	}
+
+	if (adev->asic_type >= CHIP_VEGA10 && reg == 1 && adev->last_mm_index == 0x5702C) {
+		udelay(500);
 	}
 }
 
@@ -581,9 +494,6 @@ void amdgpu_mm_wreg_mmio_rlc(struct amdgpu_device *adev,
  */
 u32 amdgpu_mm_rdoorbell(struct amdgpu_device *adev, u32 index)
 {
-	if (amdgpu_device_skip_hw_access(adev))
-		return 0;
-
 	if (index < adev->doorbell.num_doorbells) {
 		return readl(adev->doorbell.ptr + index);
 	} else {
@@ -604,9 +514,6 @@ u32 amdgpu_mm_rdoorbell(struct amdgpu_device *adev, u32 index)
  */
 void amdgpu_mm_wdoorbell(struct amdgpu_device *adev, u32 index, u32 v)
 {
-	if (amdgpu_device_skip_hw_access(adev))
-		return;
-
 	if (index < adev->doorbell.num_doorbells) {
 		writel(v, adev->doorbell.ptr + index);
 	} else {
@@ -625,9 +532,6 @@ void amdgpu_mm_wdoorbell(struct amdgpu_device *adev, u32 index, u32 v)
  */
 u64 amdgpu_mm_rdoorbell64(struct amdgpu_device *adev, u32 index)
 {
-	if (amdgpu_device_skip_hw_access(adev))
-		return 0;
-
 	if (index < adev->doorbell.num_doorbells) {
 		return atomic64_read((atomic64_t *)(adev->doorbell.ptr + index));
 	} else {
@@ -648,9 +552,6 @@ u64 amdgpu_mm_rdoorbell64(struct amdgpu_device *adev, u32 index)
  */
 void amdgpu_mm_wdoorbell64(struct amdgpu_device *adev, u32 index, u64 v)
 {
-	if (amdgpu_device_skip_hw_access(adev))
-		return;
-
 	if (index < adev->doorbell.num_doorbells) {
 		atomic64_set((atomic64_t *)(adev->doorbell.ptr + index), v);
 	} else {
@@ -658,141 +559,10 @@ void amdgpu_mm_wdoorbell64(struct amdgpu_device *adev, u32 index, u64 v)
 	}
 }
 
-/**
- * amdgpu_device_indirect_rreg - read an indirect register
- *
- * @adev: amdgpu_device pointer
- * @pcie_index: mmio register offset
- * @pcie_data: mmio register offset
- * @reg_addr: indirect register address to read from
- *
- * Returns the value of indirect register @reg_addr
- */
-u32 amdgpu_device_indirect_rreg(struct amdgpu_device *adev,
-				u32 pcie_index, u32 pcie_data,
-				u32 reg_addr)
-{
-	unsigned long flags;
-	u32 r;
-	void __iomem *pcie_index_offset;
-	void __iomem *pcie_data_offset;
-
-	spin_lock_irqsave(&adev->pcie_idx_lock, flags);
-	pcie_index_offset = (void __iomem *)adev->rmmio + pcie_index * 4;
-	pcie_data_offset = (void __iomem *)adev->rmmio + pcie_data * 4;
-
-	writel(reg_addr, pcie_index_offset);
-	readl(pcie_index_offset);
-	r = readl(pcie_data_offset);
-	spin_unlock_irqrestore(&adev->pcie_idx_lock, flags);
-
-	return r;
-}
-
-/**
- * amdgpu_device_indirect_rreg64 - read a 64bits indirect register
- *
- * @adev: amdgpu_device pointer
- * @pcie_index: mmio register offset
- * @pcie_data: mmio register offset
- * @reg_addr: indirect register address to read from
- *
- * Returns the value of indirect register @reg_addr
- */
-u64 amdgpu_device_indirect_rreg64(struct amdgpu_device *adev,
-				  u32 pcie_index, u32 pcie_data,
-				  u32 reg_addr)
-{
-	unsigned long flags;
-	u64 r;
-	void __iomem *pcie_index_offset;
-	void __iomem *pcie_data_offset;
-
-	spin_lock_irqsave(&adev->pcie_idx_lock, flags);
-	pcie_index_offset = (void __iomem *)adev->rmmio + pcie_index * 4;
-	pcie_data_offset = (void __iomem *)adev->rmmio + pcie_data * 4;
-
-	/* read low 32 bits */
-	writel(reg_addr, pcie_index_offset);
-	readl(pcie_index_offset);
-	r = readl(pcie_data_offset);
-	/* read high 32 bits */
-	writel(reg_addr + 4, pcie_index_offset);
-	readl(pcie_index_offset);
-	r |= ((u64)readl(pcie_data_offset) << 32);
-	spin_unlock_irqrestore(&adev->pcie_idx_lock, flags);
-
-	return r;
-}
-
-/**
- * amdgpu_device_indirect_wreg - write an indirect register address
- *
- * @adev: amdgpu_device pointer
- * @pcie_index: mmio register offset
- * @pcie_data: mmio register offset
- * @reg_addr: indirect register offset
- * @reg_data: indirect register data
- *
- */
-void amdgpu_device_indirect_wreg(struct amdgpu_device *adev,
-				 u32 pcie_index, u32 pcie_data,
-				 u32 reg_addr, u32 reg_data)
-{
-	unsigned long flags;
-	void __iomem *pcie_index_offset;
-	void __iomem *pcie_data_offset;
-
-	spin_lock_irqsave(&adev->pcie_idx_lock, flags);
-	pcie_index_offset = (void __iomem *)adev->rmmio + pcie_index * 4;
-	pcie_data_offset = (void __iomem *)adev->rmmio + pcie_data * 4;
-
-	writel(reg_addr, pcie_index_offset);
-	readl(pcie_index_offset);
-	writel(reg_data, pcie_data_offset);
-	readl(pcie_data_offset);
-	spin_unlock_irqrestore(&adev->pcie_idx_lock, flags);
-}
-
-/**
- * amdgpu_device_indirect_wreg64 - write a 64bits indirect register address
- *
- * @adev: amdgpu_device pointer
- * @pcie_index: mmio register offset
- * @pcie_data: mmio register offset
- * @reg_addr: indirect register offset
- * @reg_data: indirect register data
- *
- */
-void amdgpu_device_indirect_wreg64(struct amdgpu_device *adev,
-				   u32 pcie_index, u32 pcie_data,
-				   u32 reg_addr, u64 reg_data)
-{
-	unsigned long flags;
-	void __iomem *pcie_index_offset;
-	void __iomem *pcie_data_offset;
-
-	spin_lock_irqsave(&adev->pcie_idx_lock, flags);
-	pcie_index_offset = (void __iomem *)adev->rmmio + pcie_index * 4;
-	pcie_data_offset = (void __iomem *)adev->rmmio + pcie_data * 4;
-
-	/* write low 32 bits */
-	writel(reg_addr, pcie_index_offset);
-	readl(pcie_index_offset);
-	writel((u32)(reg_data & 0xffffffffULL), pcie_data_offset);
-	readl(pcie_data_offset);
-	/* write high 32 bits */
-	writel(reg_addr + 4, pcie_index_offset);
-	readl(pcie_index_offset);
-	writel((u32)(reg_data >> 32), pcie_data_offset);
-	readl(pcie_data_offset);
-	spin_unlock_irqrestore(&adev->pcie_idx_lock, flags);
-}
-
 /**
  * amdgpu_invalid_rreg - dummy reg read function
  *
- * @adev: amdgpu_device pointer
+ * @adev: amdgpu device pointer
  * @reg: offset of register
  *
  * Dummy register read function.  Used for register blocks
@@ -809,7 +579,7 @@ static uint32_t amdgpu_invalid_rreg(struct amdgpu_device *adev, uint32_t reg)
 /**
  * amdgpu_invalid_wreg - dummy reg write function
  *
- * @adev: amdgpu_device pointer
+ * @adev: amdgpu device pointer
  * @reg: offset of register
  * @v: value to write to the register
  *
@@ -826,7 +596,7 @@ static void amdgpu_invalid_wreg(struct amdgpu_device *adev, uint32_t reg, uint32
 /**
  * amdgpu_invalid_rreg64 - dummy 64 bit reg read function
  *
- * @adev: amdgpu_device pointer
+ * @adev: amdgpu device pointer
  * @reg: offset of register
  *
  * Dummy register read function.  Used for register blocks
@@ -843,7 +613,7 @@ static uint64_t amdgpu_invalid_rreg64(struct amdgpu_device *adev, uint32_t reg)
 /**
  * amdgpu_invalid_wreg64 - dummy reg write function
  *
- * @adev: amdgpu_device pointer
+ * @adev: amdgpu device pointer
  * @reg: offset of register
  * @v: value to write to the register
  *
@@ -860,7 +630,7 @@ static void amdgpu_invalid_wreg64(struct amdgpu_device *adev, uint32_t reg, uint
 /**
  * amdgpu_block_invalid_rreg - dummy reg read function
  *
- * @adev: amdgpu_device pointer
+ * @adev: amdgpu device pointer
  * @block: offset of instance
  * @reg: offset of register
  *
@@ -880,7 +650,7 @@ static uint32_t amdgpu_block_invalid_rreg(struct amdgpu_device *adev,
 /**
  * amdgpu_block_invalid_wreg - dummy reg write function
  *
- * @adev: amdgpu_device pointer
+ * @adev: amdgpu device pointer
  * @block: offset of instance
  * @reg: offset of register
  * @v: value to write to the register
@@ -897,24 +667,10 @@ static void amdgpu_block_invalid_wreg(struct amdgpu_device *adev,
 	BUG();
 }
 
-/**
- * amdgpu_device_asic_init - Wrapper for atom asic_init
- *
- * @adev: amdgpu_device pointer
- *
- * Does any asic specific work and then calls atom asic init.
- */
-static int amdgpu_device_asic_init(struct amdgpu_device *adev)
-{
-	amdgpu_asic_pre_asic_init(adev);
-
-	return amdgpu_atom_asic_init(adev->mode_info.atom_context);
-}
-
 /**
  * amdgpu_device_vram_scratch_init - allocate the VRAM scratch page
  *
- * @adev: amdgpu_device pointer
+ * @adev: amdgpu device pointer
  *
  * Allocates a scratch page of VRAM for use by various things in the
  * driver.
@@ -931,7 +687,7 @@ static int amdgpu_device_vram_scratch_init(struct amdgpu_device *adev)
 /**
  * amdgpu_device_vram_scratch_fini - Free the VRAM scratch page
  *
- * @adev: amdgpu_device pointer
+ * @adev: amdgpu device pointer
  *
  * Frees the VRAM scratch page.
  */
@@ -992,18 +748,6 @@ void amdgpu_device_pci_config_reset(struct amdgpu_device *adev)
 	pci_write_config_dword(adev->pdev, 0x7c, AMDGPU_ASIC_RESET_DATA);
 }
 
-/**
- * amdgpu_device_pci_reset - reset the GPU using generic PCI means
- *
- * @adev: amdgpu_device pointer
- *
- * Resets the GPU using generic pci reset interfaces (FLR, SBR, etc.).
- */
-int amdgpu_device_pci_reset(struct amdgpu_device *adev)
-{
-	return pci_reset_function(adev->pdev);
-}
-
 /*
  * GPU doorbell aperture helpers function.
  */
@@ -1169,6 +913,7 @@ void amdgpu_device_wb_free(struct amdgpu_device *adev, u32 wb)
 		__clear_bit(wb, adev->wb.used);
 }
 
+#ifdef AMDKCL_ENABLE_RESIZE_FB_BAR
 /**
  * amdgpu_device_resize_fb_bar - try to resize FB BAR
  *
@@ -1180,7 +925,8 @@ void amdgpu_device_wb_free(struct amdgpu_device *adev, u32 wb)
  */
 int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 {
-	int rbar_size = pci_rebar_bytes_to_size(adev->gmc.real_vram_size);
+	u64 space_needed = roundup_pow_of_two(adev->gmc.real_vram_size);
+	u32 rbar_size = order_base_2(((space_needed >> 20) | 1)) - 1;
 	struct pci_bus *root;
 	struct resource *res;
 	unsigned i;
@@ -1191,11 +937,6 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	/* skip if the bios has already enabled large BAR */
-	if (adev->gmc.real_vram_size &&
-	    (pci_resource_len(adev->pdev, 0) >= adev->gmc.real_vram_size))
-		return 0;
-
 	/* Check if the root BUS has 64bit memory resources */
 	root = adev->pdev->bus;
 	while (root->parent)
@@ -1211,10 +952,6 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 	if (!res)
 		return 0;
 
-	/* Limit the BAR size to what is available */
-	rbar_size = min(fls(pci_rebar_get_possible_sizes(adev->pdev, 0)) - 1,
-			rbar_size);
-
 	/* Disable memory decoding while we change the BAR addresses and size */
 	pci_read_config_word(adev->pdev, PCI_COMMAND, &cmd);
 	pci_write_config_word(adev->pdev, PCI_COMMAND,
@@ -1246,6 +983,7 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 
 	return 0;
 }
+#endif
 
 /*
  * GPU helpers function.
@@ -1286,10 +1024,6 @@ bool amdgpu_device_need_post(struct amdgpu_device *adev)
 		}
 	}
 
-	/* Don't post if we need to reset whole hive on init */
-	if (adev->gmc.xgmi.pending_reset)
-		return false;
-
 	if (adev->has_hw_reset) {
 		adev->has_hw_reset = false;
 		return true;
@@ -1415,40 +1149,33 @@ static void amdgpu_device_check_smu_prv_buffer_size(struct amdgpu_device *adev)
 	adev->pm.smu_prv_buffer_size = 0;
 }
 
-static int amdgpu_device_init_apu_flags(struct amdgpu_device *adev)
+/**
+ * amdgpu_device_enable_extra_fw_load - parse firmware which needs explicit loading
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Enable specific firmware loading if the user has enabled it via
+ * the module parameter load_extra_fw. This feature allows the driver
+ * to load specific firmware, which should be skipped under some circumstances
+ * like virtualized environments by default.
+ */
+static void amdgpu_device_enable_extra_fw_load(struct amdgpu_device *adev)
 {
-	if (!(adev->flags & AMD_IS_APU) ||
-	    adev->asic_type < CHIP_RAVEN)
-		return 0;
+	adev->virt.extra_fw = 0;
 
-	switch (adev->asic_type) {
-	case CHIP_RAVEN:
-		if (adev->pdev->device == 0x15dd)
-			adev->apu_flags |= AMD_APU_IS_RAVEN;
-		if (adev->pdev->device == 0x15d8)
-			adev->apu_flags |= AMD_APU_IS_PICASSO;
-		break;
-	case CHIP_RENOIR:
-		if ((adev->pdev->device == 0x1636) ||
-		    (adev->pdev->device == 0x164c))
-			adev->apu_flags |= AMD_APU_IS_RENOIR;
-		else
-			adev->apu_flags |= AMD_APU_IS_GREEN_SARDINE;
-		break;
-	case CHIP_VANGOGH:
-		adev->apu_flags |= AMD_APU_IS_VANGOGH;
-		break;
-	case CHIP_YELLOW_CARP:
-		break;
-	case CHIP_CYAN_SKILLFISH:
-		if (adev->pdev->device == 0x13FE)
-			adev->apu_flags |= AMD_APU_IS_CYAN_SKILLFISH2;
-		break;
-	default:
-		return -EINVAL;
-	}
+	if (amdgpu_load_extra_fw) {
+		char *fwstr, *fwstr_tmp, *fwname_tmp;
 
-	return 0;
+		fwstr = kstrdup(amdgpu_load_extra_fw, GFP_KERNEL);
+		fwstr_tmp = fwstr;
+		while (fwname_tmp = strsep(&fwstr_tmp, ",")) {
+			if (!strcmp("ta", fwname_tmp))
+				adev->virt.extra_fw |= AMDGPU_SRIOV_EXTRA_FW_PSP_TA;
+			else
+				DRM_WARN("Skip loading unknown FW type: %s\n", fwname_tmp);
+		}
+		kfree(fwstr);
+	}
 }
 
 /**
@@ -1492,16 +1219,6 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
 		amdgpu_vm_fragment_size = -1;
 	}
 
-	if (amdgpu_sched_hw_submission < 2) {
-		dev_warn(adev->dev, "sched hw submission jobs (%d) must be at least 2\n",
-			 amdgpu_sched_hw_submission);
-		amdgpu_sched_hw_submission = 2;
-	} else if (!is_power_of_2(amdgpu_sched_hw_submission)) {
-		dev_warn(adev->dev, "sched hw submission jobs (%d) must be a power of 2\n",
-			 amdgpu_sched_hw_submission);
-		amdgpu_sched_hw_submission = roundup_pow_of_two(amdgpu_sched_hw_submission);
-	}
-
 	amdgpu_device_check_smu_prv_buffer_size(adev);
 
 	amdgpu_device_check_vm_size(adev);
@@ -1510,9 +1227,11 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
 
 	adev->firmware.load_type = amdgpu_ucode_get_load_type(adev, amdgpu_fw_load_type);
 
-	amdgpu_gmc_tmz_set(adev);
+	amdgpu_device_enable_extra_fw_load(adev);
+
+	amdgpu_direct_gma_size = min(amdgpu_direct_gma_size, 96);
 
-	amdgpu_gmc_noretry_set(adev);
+	amdgpu_gmc_tmz_set(adev);
 
 	return 0;
 }
@@ -1526,36 +1245,37 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
  * Callback for the switcheroo driver.  Suspends or resumes the
  * the asics before or after it is powered up using ACPI methods.
  */
-static void amdgpu_switcheroo_set_state(struct pci_dev *pdev,
-					enum vga_switcheroo_state state)
+static void amdgpu_switcheroo_set_state(struct pci_dev *pdev, enum vga_switcheroo_state state)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 	int r;
 
-	if (amdgpu_device_supports_px(dev) && state == VGA_SWITCHEROO_OFF)
+	if (amdgpu_device_supports_boco(dev) && state == VGA_SWITCHEROO_OFF)
 		return;
 
 	if (state == VGA_SWITCHEROO_ON) {
-		pr_info("switched on\n");
+		pr_info("amdgpu: switched on\n");
 		/* don't suspend or resume card normally */
 		dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
 
-		pci_set_power_state(pdev, PCI_D0);
-		amdgpu_device_load_pci_state(pdev);
-		r = pci_enable_device(pdev);
+		pci_set_power_state(dev->pdev, PCI_D0);
+		pci_restore_state(dev->pdev);
+		r = pci_enable_device(dev->pdev);
 		if (r)
 			DRM_WARN("pci_enable_device failed (%d)\n", r);
 		amdgpu_device_resume(dev, true);
 
 		dev->switch_power_state = DRM_SWITCH_POWER_ON;
+		drm_kms_helper_poll_enable(dev);
 	} else {
-		pr_info("switched off\n");
+		pr_info("amdgpu: switched off\n");
+		drm_kms_helper_poll_disable(dev);
 		dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
 		amdgpu_device_suspend(dev, true);
-		amdgpu_device_cache_pci_state(pdev);
+		pci_save_state(dev->pdev);
 		/* Shut down the device */
-		pci_disable_device(pdev);
-		pci_set_power_state(pdev, PCI_D3cold);
+		pci_disable_device(dev->pdev);
+		pci_set_power_state(dev->pdev, PCI_D3cold);
 		dev->switch_power_state = DRM_SWITCH_POWER_OFF;
 	}
 }
@@ -1578,7 +1298,7 @@ static bool amdgpu_switcheroo_can_switch(struct pci_dev *pdev)
 	* locking inversion with the driver load path. And the access here is
 	* completely racy anyway. So don't bother with locking for now.
 	*/
-	return atomic_read(&dev->open_count) == 0;
+	return dev->open_count == 0;
 }
 
 static const struct vga_switcheroo_client_ops amdgpu_switcheroo_ops = {
@@ -1793,19 +1513,6 @@ int amdgpu_device_ip_block_add(struct amdgpu_device *adev,
 	if (!ip_block_version)
 		return -EINVAL;
 
-	switch (ip_block_version->type) {
-	case AMD_IP_BLOCK_TYPE_VCN:
-		if (adev->harvest_ip_mask & AMD_HARVEST_IP_VCN_MASK)
-			return 0;
-		break;
-	case AMD_IP_BLOCK_TYPE_JPEG:
-		if (adev->harvest_ip_mask & AMD_HARVEST_IP_JPEG_MASK)
-			return 0;
-		break;
-	default:
-		break;
-	}
-
 	DRM_INFO("add ip block number %d <%s>\n", adev->num_ip_blocks,
 		  ip_block_version->funcs->name);
 
@@ -1831,7 +1538,8 @@ static void amdgpu_device_enable_virtual_display(struct amdgpu_device *adev)
 	adev->enable_virtual_display = false;
 
 	if (amdgpu_virtual_display) {
-		const char *pci_address_name = pci_name(adev->pdev);
+		struct drm_device *ddev = adev->ddev;
+		const char *pci_address_name = pci_name(ddev->pdev);
 		char *pciaddstr, *pciaddstr_tmp, *pciaddname_tmp, *pciaddname;
 
 		pciaddstr = kstrdup(amdgpu_virtual_display, GFP_KERNEL);
@@ -1883,25 +1591,22 @@ static void amdgpu_device_enable_virtual_display(struct amdgpu_device *adev)
 static int amdgpu_device_parse_gpu_info_fw(struct amdgpu_device *adev)
 {
 	const char *chip_name;
-	char fw_name[40];
+	char fw_name[30];
 	int err;
 	const struct gpu_info_firmware_header_v1_0 *hdr;
 
 	adev->firmware.gpu_info_fw = NULL;
 
-	if (adev->mman.discovery_bin) {
-		amdgpu_discovery_get_gfx_info(adev);
-
-		/*
-		 * FIXME: The bounding box is still needed by Navi12, so
-		 * temporarily read it from gpu_info firmware. Should be droped
-		 * when DAL no longer needs it.
-		 */
-		if (adev->asic_type != CHIP_NAVI12)
-			return 0;
-	}
-
 	switch (adev->asic_type) {
+	case CHIP_TOPAZ:
+	case CHIP_TONGA:
+	case CHIP_FIJI:
+	case CHIP_POLARIS10:
+	case CHIP_POLARIS11:
+	case CHIP_POLARIS12:
+	case CHIP_VEGAM:
+	case CHIP_CARRIZO:
+	case CHIP_STONEY:
 #ifdef CONFIG_DRM_AMDGPU_SI
 	case CHIP_VERDE:
 	case CHIP_TAHITI:
@@ -1916,21 +1621,7 @@ static int amdgpu_device_parse_gpu_info_fw(struct amdgpu_device *adev)
 	case CHIP_KABINI:
 	case CHIP_MULLINS:
 #endif
-	case CHIP_TOPAZ:
-	case CHIP_TONGA:
-	case CHIP_FIJI:
-	case CHIP_POLARIS10:
-	case CHIP_POLARIS11:
-	case CHIP_POLARIS12:
-	case CHIP_VEGAM:
-	case CHIP_CARRIZO:
-	case CHIP_STONEY:
 	case CHIP_VEGA20:
-	case CHIP_ALDEBARAN:
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
 	default:
 		return 0;
 	case CHIP_VEGA10:
@@ -1940,9 +1631,9 @@ static int amdgpu_device_parse_gpu_info_fw(struct amdgpu_device *adev)
 		chip_name = "vega12";
 		break;
 	case CHIP_RAVEN:
-		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
+		if (adev->rev_id >= 8)
 			chip_name = "raven2";
-		else if (adev->apu_flags & AMD_APU_IS_PICASSO)
+		else if (adev->pdev->device == 0x15d8)
 			chip_name = "picasso";
 		else
 			chip_name = "raven";
@@ -1951,10 +1642,7 @@ static int amdgpu_device_parse_gpu_info_fw(struct amdgpu_device *adev)
 		chip_name = "arcturus";
 		break;
 	case CHIP_RENOIR:
-		if (adev->apu_flags & AMD_APU_IS_RENOIR)
-			chip_name = "renoir";
-		else
-			chip_name = "green_sardine";
+		chip_name = "renoir";
 		break;
 	case CHIP_NAVI10:
 		chip_name = "navi10";
@@ -1965,12 +1653,6 @@ static int amdgpu_device_parse_gpu_info_fw(struct amdgpu_device *adev)
 	case CHIP_NAVI12:
 		chip_name = "navi12";
 		break;
-	case CHIP_VANGOGH:
-		chip_name = "vangogh";
-		break;
-	case CHIP_YELLOW_CARP:
-		chip_name = "yellow_carp";
-		break;
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_gpu_info.bin", chip_name);
@@ -1999,10 +1681,7 @@ static int amdgpu_device_parse_gpu_info_fw(struct amdgpu_device *adev)
 			(const struct gpu_info_firmware_v1_0 *)(adev->firmware.gpu_info_fw->data +
 								le32_to_cpu(hdr->header.ucode_array_offset_bytes));
 
-		/*
-		 * Should be droped when DAL no longer needs it.
-		 */
-		if (adev->asic_type == CHIP_NAVI12)
+		if (amdgpu_discovery && adev->asic_type >= CHIP_NAVI10)
 			goto parse_soc_bounding_box;
 
 		adev->gfx.config.max_shader_engines = le32_to_cpu(gpu_info_fw->gc_num_se);
@@ -2034,9 +1713,10 @@ static int amdgpu_device_parse_gpu_info_fw(struct amdgpu_device *adev)
 		}
 
 parse_soc_bounding_box:
+#ifdef CONFIG_DRM_AMD_DC_DCN2_0
 		/*
 		 * soc bounding box info is not integrated in disocovery table,
-		 * we always need to parse it from gpu info firmware if needed.
+		 * we always need to parse it from gpu info firmware.
 		 */
 		if (hdr->version_minor == 2) {
 			const struct gpu_info_firmware_v1_2 *gpu_info_fw =
@@ -2044,6 +1724,7 @@ static int amdgpu_device_parse_gpu_info_fw(struct amdgpu_device *adev)
 									le32_to_cpu(hdr->header.ucode_array_offset_bytes));
 			adev->dm.soc_bounding_box = &gpu_info_fw->soc_bounding_box;
 		}
+#endif
 		break;
 	}
 	default:
@@ -2072,13 +1753,25 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 
 	amdgpu_device_enable_virtual_display(adev);
 
-	if (amdgpu_sriov_vf(adev)) {
-		r = amdgpu_virt_request_full_gpu(adev, true);
+	switch (adev->asic_type) {
+	case CHIP_TOPAZ:
+	case CHIP_TONGA:
+	case CHIP_FIJI:
+	case CHIP_POLARIS10:
+	case CHIP_POLARIS11:
+	case CHIP_POLARIS12:
+	case CHIP_VEGAM:
+	case CHIP_CARRIZO:
+	case CHIP_STONEY:
+		if (adev->asic_type == CHIP_CARRIZO || adev->asic_type == CHIP_STONEY)
+			adev->family = AMDGPU_FAMILY_CZ;
+		else
+			adev->family = AMDGPU_FAMILY_VI;
+
+		r = vi_set_ip_blocks(adev);
 		if (r)
 			return r;
-	}
-
-	switch (adev->asic_type) {
+		break;
 #ifdef CONFIG_DRM_AMDGPU_SI
 	case CHIP_VERDE:
 	case CHIP_TAHITI:
@@ -2097,42 +1790,24 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 	case CHIP_KAVERI:
 	case CHIP_KABINI:
 	case CHIP_MULLINS:
-		if (adev->flags & AMD_IS_APU)
-			adev->family = AMDGPU_FAMILY_KV;
-		else
+		if ((adev->asic_type == CHIP_BONAIRE) || (adev->asic_type == CHIP_HAWAII))
 			adev->family = AMDGPU_FAMILY_CI;
+		else
+			adev->family = AMDGPU_FAMILY_KV;
 
 		r = cik_set_ip_blocks(adev);
 		if (r)
 			return r;
 		break;
 #endif
-	case CHIP_TOPAZ:
-	case CHIP_TONGA:
-	case CHIP_FIJI:
-	case CHIP_POLARIS10:
-	case CHIP_POLARIS11:
-	case CHIP_POLARIS12:
-	case CHIP_VEGAM:
-	case CHIP_CARRIZO:
-	case CHIP_STONEY:
-		if (adev->flags & AMD_IS_APU)
-			adev->family = AMDGPU_FAMILY_CZ;
-		else
-			adev->family = AMDGPU_FAMILY_VI;
-
-		r = vi_set_ip_blocks(adev);
-		if (r)
-			return r;
-		break;
 	case CHIP_VEGA10:
 	case CHIP_VEGA12:
 	case CHIP_VEGA20:
 	case CHIP_RAVEN:
 	case CHIP_ARCTURUS:
 	case CHIP_RENOIR:
-	case CHIP_ALDEBARAN:
-		if (adev->flags & AMD_IS_APU)
+		if (adev->asic_type == CHIP_RAVEN ||
+		    adev->asic_type == CHIP_RENOIR)
 			adev->family = AMDGPU_FAMILY_RV;
 		else
 			adev->family = AMDGPU_FAMILY_AI;
@@ -2144,19 +1819,7 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 	case  CHIP_NAVI10:
 	case  CHIP_NAVI14:
 	case  CHIP_NAVI12:
-	case  CHIP_SIENNA_CICHLID:
-	case  CHIP_NAVY_FLOUNDER:
-	case  CHIP_DIMGREY_CAVEFISH:
-	case  CHIP_BEIGE_GOBY:
-	case CHIP_VANGOGH:
-	case CHIP_YELLOW_CARP:
-	case CHIP_CYAN_SKILLFISH:
-		if (adev->asic_type == CHIP_VANGOGH)
-			adev->family = AMDGPU_FAMILY_VGH;
-		else if (adev->asic_type == CHIP_YELLOW_CARP)
-			adev->family = AMDGPU_FAMILY_YC;
-		else
-			adev->family = AMDGPU_FAMILY_NV;
+		adev->family = AMDGPU_FAMILY_NV;
 
 		r = nv_set_ip_blocks(adev);
 		if (r)
@@ -2167,13 +1830,47 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
+	r = amdgpu_device_parse_gpu_info_fw(adev);
+	if (r)
+		return r;
+
+	if (amdgpu_discovery && adev->asic_type >= CHIP_NAVI10)
+		amdgpu_discovery_get_gfx_info(adev);
+
 	amdgpu_amdkfd_device_probe(adev);
 
+	if (amdgpu_sriov_vf(adev)) {
+		/* handle vbios stuff prior full access mode for new handshake */
+		if (adev->virt.req_init_data_ver == 1) {
+			if (!amdgpu_get_bios(adev)) {
+				DRM_ERROR("failed to get vbios\n");
+				return -EINVAL;
+			}
+
+			r = amdgpu_atombios_init(adev);
+			if (r) {
+				dev_err(adev->dev, "amdgpu_atombios_init failed\n");
+				amdgpu_vf_error_put(adev, AMDGIM_ERROR_VF_ATOMBIOS_INIT_FAIL, 0, 0);
+				return r;
+			}
+		}
+	}
+
+	/*get pf2vf msg info at it's earliest time*/
+	if (amdgpu_sriov_vf(adev))
+		amdgpu_virt_init_data_exchange(adev);
+
+	/* we need to send REQ_GPU here for legacy handshaker otherwise the vbios
+	 * will not be prepared by host for this VF */
+	if (amdgpu_sriov_vf(adev) && adev->virt.req_init_data_ver < 1) {
+		r = amdgpu_virt_request_full_gpu(adev, true);
+		if (r)
+			return r;
+	}
+
 	adev->pm.pp_feature = amdgpu_pp_feature_mask;
 	if (amdgpu_sriov_vf(adev) || sched_policy == KFD_SCHED_POLICY_NO_HWS)
 		adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
-	if (amdgpu_sriov_vf(adev) && adev->asic_type == CHIP_SIENNA_CICHLID)
-		adev->pm.pp_feature &= ~PP_OVERDRIVE_MASK;
 
 	for (i = 0; i < adev->num_ip_blocks; i++) {
 		if ((amdgpu_ip_block_mask & (1 << i)) == 0) {
@@ -2198,9 +1895,9 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 		}
 		/* get the vbios after the asic_funcs are set up */
 		if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_COMMON) {
-			r = amdgpu_device_parse_gpu_info_fw(adev);
-			if (r)
-				return r;
+			/* skip vbios handling for new handshake */
+			if (amdgpu_sriov_vf(adev) && adev->virt.req_init_data_ver == 1)
+				continue;
 
 			/* Read BIOS */
 			if (!amdgpu_get_bios(adev))
@@ -2212,16 +1909,16 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 				amdgpu_vf_error_put(adev, AMDGIM_ERROR_VF_ATOMBIOS_INIT_FAIL, 0, 0);
 				return r;
 			}
-
-			/*get pf2vf msg info at it's earliest time*/
-			if (amdgpu_sriov_vf(adev))
-				amdgpu_virt_init_data_exchange(adev);
-
 		}
 	}
 
-	adev->cg_flags &= amdgpu_cg_mask;
-	adev->pg_flags &= amdgpu_pg_mask;
+	if (amdgpu_sriov_vf(adev)) {
+		adev->cg_flags &= amdgpu_cg_mask;
+		adev->pg_flags &= amdgpu_pg_mask;
+	} else {
+		adev->cg_flags &= 0xffffffff;
+		adev->pg_flags &= 0xffffffff;
+	}
 
 	return 0;
 }
@@ -2283,14 +1980,11 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
 			if (adev->ip_blocks[i].version->type != AMD_IP_BLOCK_TYPE_PSP)
 				continue;
 
-			if (!adev->ip_blocks[i].status.sw)
-				continue;
-
 			/* no need to do the fw loading again if already done*/
 			if (adev->ip_blocks[i].status.hw == true)
 				break;
 
-			if (amdgpu_in_reset(adev) || adev->in_suspend) {
+			if (adev->in_gpu_reset || adev->in_suspend) {
 				r = adev->ip_blocks[i].version->funcs->resume(adev);
 				if (r) {
 					DRM_ERROR("resume of IP block <%s> failed %d\n",
@@ -2336,6 +2030,12 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	if (r)
 		return r;
 
+	if (amdgpu_sriov_vf(adev) && adev->virt.req_init_data_ver > 0) {
+		r = amdgpu_virt_request_full_gpu(adev, true);
+		if (r)
+			return -EAGAIN;
+	}
+
 	for (i = 0; i < adev->num_ip_blocks; i++) {
 		if (!adev->ip_blocks[i].status.valid)
 			continue;
@@ -2410,26 +2110,17 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	 * it should be called after amdgpu_device_ip_hw_init_phase2  since
 	 * for some ASICs the RAS EEPROM code relies on SMU fully functioning
 	 * for I2C communication which only true at this point.
-	 *
-	 * amdgpu_ras_recovery_init may fail, but the upper only cares the
-	 * failure from bad gpu situation and stop amdgpu init process
-	 * accordingly. For other failed cases, it will still release all
-	 * the resource and print error message, rather than returning one
-	 * negative value to upper level.
+	 * recovery_init may fail, but it can free all resources allocated by
+	 * itself and its failure should not stop amdgpu init process.
 	 *
 	 * Note: theoretically, this should be called before all vram allocations
 	 * to protect retired page from abusing
 	 */
-	r = amdgpu_ras_recovery_init(adev);
-	if (r)
-		goto init_failed;
+	amdgpu_ras_recovery_init(adev);
 
 	if (adev->gmc.xgmi.num_physical_nodes > 1)
 		amdgpu_xgmi_add_device(adev);
-
-	/* Don't init kfd if whole hive need to be reset during init */
-	if (!adev->gmc.xgmi.pending_reset)
-		amdgpu_amdkfd_device_init(adev);
+	amdgpu_amdkfd_device_init(adev);
 
 	amdgpu_fru_get_product_info(adev);
 
@@ -2466,24 +2157,8 @@ static void amdgpu_device_fill_reset_magic(struct amdgpu_device *adev)
  */
 static bool amdgpu_device_check_vram_lost(struct amdgpu_device *adev)
 {
-	if (memcmp(adev->gart.ptr, adev->reset_magic,
-			AMDGPU_RESET_MAGIC_NUM))
-		return true;
-
-	if (!amdgpu_in_reset(adev))
-		return false;
-
-	/*
-	 * For all ASICs with baco/mode1 reset, the VRAM is
-	 * always assumed to be lost.
-	 */
-	switch (amdgpu_asic_reset_method(adev)) {
-	case AMD_RESET_METHOD_BACO:
-	case AMD_RESET_METHOD_MODE1:
-		return true;
-	default:
-		return false;
-	}
+	return !!memcmp(adev->gart.ptr, adev->reset_magic,
+			AMDGPU_RESET_MAGIC_NUM);
 }
 
 /**
@@ -2499,8 +2174,8 @@ static bool amdgpu_device_check_vram_lost(struct amdgpu_device *adev)
  * Returns 0 on success, negative error code on failure.
  */
 
-int amdgpu_device_set_cg_state(struct amdgpu_device *adev,
-			       enum amd_clockgating_state state)
+static int amdgpu_device_set_cg_state(struct amdgpu_device *adev,
+						enum amd_clockgating_state state)
 {
 	int i, j, r;
 
@@ -2511,10 +2186,6 @@ int amdgpu_device_set_cg_state(struct amdgpu_device *adev,
 		i = state == AMD_CG_STATE_GATE ? j : adev->num_ip_blocks - j - 1;
 		if (!adev->ip_blocks[i].status.late_initialized)
 			continue;
-		/* skip CG for GFX on S0ix */
-		if (adev->in_s0ix &&
-		    adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GFX)
-			continue;
 		/* skip CG for VCE/UVD, it's handled specially */
 		if (adev->ip_blocks[i].version->type != AMD_IP_BLOCK_TYPE_UVD &&
 		    adev->ip_blocks[i].version->type != AMD_IP_BLOCK_TYPE_VCE &&
@@ -2535,8 +2206,7 @@ int amdgpu_device_set_cg_state(struct amdgpu_device *adev,
 	return 0;
 }
 
-int amdgpu_device_set_pg_state(struct amdgpu_device *adev,
-			       enum amd_powergating_state state)
+static int amdgpu_device_set_pg_state(struct amdgpu_device *adev, enum amd_powergating_state state)
 {
 	int i, j, r;
 
@@ -2547,10 +2217,6 @@ int amdgpu_device_set_pg_state(struct amdgpu_device *adev,
 		i = state == AMD_PG_STATE_GATE ? j : adev->num_ip_blocks - j - 1;
 		if (!adev->ip_blocks[i].status.late_initialized)
 			continue;
-		/* skip PG for GFX on S0ix */
-		if (adev->in_s0ix &&
-		    adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GFX)
-			continue;
 		/* skip CG for VCE/UVD, it's handled specially */
 		if (adev->ip_blocks[i].version->type != AMD_IP_BLOCK_TYPE_UVD &&
 		    adev->ip_blocks[i].version->type != AMD_IP_BLOCK_TYPE_VCE &&
@@ -2590,7 +2256,9 @@ static int amdgpu_device_enable_mgpu_fan_boost(void)
 		gpu_ins = &(mgpu_info.gpu_ins[i]);
 		adev = gpu_ins->adev;
 		if (!(adev->flags & AMD_IS_APU) &&
-		    !gpu_ins->mgpu_fan_enabled) {
+		    !gpu_ins->mgpu_fan_enabled &&
+		    adev->powerplay.pp_funcs &&
+		    adev->powerplay.pp_funcs->enable_mgpu_fan_boost) {
 			ret = amdgpu_dpm_enable_mgpu_fan_boost(adev);
 			if (ret)
 				break;
@@ -2636,8 +2304,6 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
 		adev->ip_blocks[i].status.late_initialized = true;
 	}
 
-	amdgpu_ras_set_error_query_ready(adev, true);
-
 	amdgpu_device_set_cg_state(adev, AMD_CG_STATE_GATE);
 	amdgpu_device_set_pg_state(adev, AMD_PG_STATE_GATE);
 
@@ -2647,11 +2313,6 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
 	if (r)
 		DRM_ERROR("enable mgpu fan boost failed (%d).\n", r);
 
-	/* For XGMI + passthrough configuration on arcturus, enable light SBR */
-	if (adev->asic_type == CHIP_ARCTURUS &&
-	    amdgpu_passthrough(adev) &&
-	    adev->gmc.xgmi.num_physical_nodes > 1)
-		smu_set_light_sbr(&adev->smu, true);
 
 	if (adev->gmc.xgmi.num_physical_nodes > 1) {
 		mutex_lock(&mgpu_info.mutex);
@@ -2675,8 +2336,7 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
 				if (gpu_instance->adev->flags & AMD_IS_APU)
 					continue;
 
-				r = amdgpu_xgmi_set_pstate(gpu_instance->adev,
-						AMDGPU_XGMI_PSTATE_MIN);
+				r = amdgpu_xgmi_set_pstate(gpu_instance->adev, 0);
 				if (r) {
 					DRM_ERROR("pstate setting failed (%d).\n", r);
 					break;
@@ -2690,59 +2350,6 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
 	return 0;
 }
 
-static int amdgpu_device_ip_fini_early(struct amdgpu_device *adev)
-{
-	int i, r;
-
-	for (i = 0; i < adev->num_ip_blocks; i++) {
-		if (!adev->ip_blocks[i].version->funcs->early_fini)
-			continue;
-
-		r = adev->ip_blocks[i].version->funcs->early_fini((void *)adev);
-		if (r) {
-			DRM_DEBUG("early_fini of IP block <%s> failed %d\n",
-				  adev->ip_blocks[i].version->funcs->name, r);
-		}
-	}
-
-	amdgpu_amdkfd_suspend(adev, false);
-
-	amdgpu_device_set_pg_state(adev, AMD_PG_STATE_UNGATE);
-	amdgpu_device_set_cg_state(adev, AMD_CG_STATE_UNGATE);
-
-	/* need to disable SMC first */
-	for (i = 0; i < adev->num_ip_blocks; i++) {
-		if (!adev->ip_blocks[i].status.hw)
-			continue;
-		if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_SMC) {
-			r = adev->ip_blocks[i].version->funcs->hw_fini((void *)adev);
-			/* XXX handle errors */
-			if (r) {
-				DRM_DEBUG("hw_fini of IP block <%s> failed %d\n",
-					  adev->ip_blocks[i].version->funcs->name, r);
-			}
-			adev->ip_blocks[i].status.hw = false;
-			break;
-		}
-	}
-
-	for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
-		if (!adev->ip_blocks[i].status.hw)
-			continue;
-
-		r = adev->ip_blocks[i].version->funcs->hw_fini((void *)adev);
-		/* XXX handle errors */
-		if (r) {
-			DRM_DEBUG("hw_fini of IP block <%s> failed %d\n",
-				  adev->ip_blocks[i].version->funcs->name, r);
-		}
-
-		adev->ip_blocks[i].status.hw = false;
-	}
-
-	return 0;
-}
-
 /**
  * amdgpu_device_ip_fini - run fini for hardware IPs
  *
@@ -2754,7 +2361,7 @@ static int amdgpu_device_ip_fini_early(struct amdgpu_device *adev)
  * and sw_fini tears down any software state associated with each IP.
  * Returns 0 on success, negative error code on failure.
  */
-static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
+static int amdgpu_device_ip_fini(struct amdgpu_device *adev, int skip_hw)
 {
 	int i, r;
 
@@ -2766,7 +2373,43 @@ static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
 	if (adev->gmc.xgmi.num_physical_nodes > 1)
 		amdgpu_xgmi_remove_device(adev);
 
-	amdgpu_amdkfd_device_fini_sw(adev);
+	if (!skip_hw)
+		amdgpu_amdkfd_device_fini(adev);
+
+	amdgpu_device_set_pg_state(adev, AMD_PG_STATE_UNGATE);
+	amdgpu_device_set_cg_state(adev, AMD_CG_STATE_UNGATE);
+
+	if (!skip_hw) {
+		/* need to disable SMC first */
+		for (i = 0; i < adev->num_ip_blocks; i++) {
+			if (!adev->ip_blocks[i].status.hw)
+				continue;
+			if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_SMC) {
+				r = adev->ip_blocks[i].version->funcs->hw_fini((void *)adev);
+				/* XXX handle errors */
+				if (r) {
+					DRM_DEBUG("hw_fini of IP block <%s> failed %d\n",
+							adev->ip_blocks[i].version->funcs->name, r);
+				}
+				adev->ip_blocks[i].status.hw = false;
+				break;
+			}
+		}
+
+		for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
+			if (!adev->ip_blocks[i].status.hw)
+				continue;
+
+			r = adev->ip_blocks[i].version->funcs->hw_fini((void *)adev);
+			/* XXX handle errors */
+			if (r) {
+				DRM_DEBUG("hw_fini of IP block <%s> failed %d\n",
+						adev->ip_blocks[i].version->funcs->name, r);
+			}
+
+			adev->ip_blocks[i].status.hw = false;
+		}
+	}
 
 	for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
 		if (!adev->ip_blocks[i].status.sw)
@@ -2857,21 +2500,18 @@ static int amdgpu_device_ip_suspend_phase1(struct amdgpu_device *adev)
 	for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
 		if (!adev->ip_blocks[i].status.valid)
 			continue;
-
 		/* displays are handled separately */
-		if (adev->ip_blocks[i].version->type != AMD_IP_BLOCK_TYPE_DCE)
-			continue;
-
-		/* XXX handle errors */
-		r = adev->ip_blocks[i].version->funcs->suspend(adev);
-		/* XXX handle errors */
-		if (r) {
-			DRM_ERROR("suspend of IP block <%s> failed %d\n",
-				  adev->ip_blocks[i].version->funcs->name, r);
-			return r;
+		if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_DCE) {
+			/* XXX handle errors */
+			r = adev->ip_blocks[i].version->funcs->suspend(adev);
+			/* XXX handle errors */
+			if (r) {
+				DRM_ERROR("suspend of IP block <%s> failed %d\n",
+					  adev->ip_blocks[i].version->funcs->name, r);
+				return r;
+			}
+			adev->ip_blocks[i].status.hw = false;
 		}
-
-		adev->ip_blocks[i].status.hw = false;
 	}
 
 	return 0;
@@ -2892,9 +2532,6 @@ static int amdgpu_device_ip_suspend_phase2(struct amdgpu_device *adev)
 {
 	int i, r;
 
-	if (adev->in_s0ix)
-		amdgpu_gfx_state_change_set(adev, sGpuChangeState_D3Entry);
-
 	for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
 		if (!adev->ip_blocks[i].status.valid)
 			continue;
@@ -2907,27 +2544,6 @@ static int amdgpu_device_ip_suspend_phase2(struct amdgpu_device *adev)
 			adev->ip_blocks[i].status.hw = false;
 			continue;
 		}
-
-		/* skip unnecessary suspend if we do not initialize them yet */
-		if (adev->gmc.xgmi.pending_reset &&
-		    !(adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GMC ||
-		      adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_SMC ||
-		      adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_COMMON ||
-		      adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_IH)) {
-			adev->ip_blocks[i].status.hw = false;
-			continue;
-		}
-
-		/* skip suspend of gfx and psp for S0ix
-		 * gfx is in gfxoff state, so on resume it will exit gfxoff just
-		 * like at runtime. PSP is also part of the always on hardware
-		 * so no need to suspend it.
-		 */
-		if (adev->in_s0ix &&
-		    (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_PSP ||
-		     adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GFX))
-			continue;
-
 		/* XXX handle errors */
 		r = adev->ip_blocks[i].version->funcs->suspend(adev);
 		/* XXX handle errors */
@@ -2947,6 +2563,7 @@ static int amdgpu_device_ip_suspend_phase2(struct amdgpu_device *adev)
 				}
 			}
 		}
+		adev->ip_blocks[i].status.hw = false;
 	}
 
 	return 0;
@@ -2965,17 +2582,22 @@ static int amdgpu_device_ip_suspend_phase2(struct amdgpu_device *adev)
  */
 int amdgpu_device_ip_suspend(struct amdgpu_device *adev)
 {
-	int r;
+	int r = 0;
+	int skip_hw = 0;
 
-	if (amdgpu_sriov_vf(adev)) {
-		amdgpu_virt_fini_data_exchange(adev);
-		amdgpu_virt_request_full_gpu(adev, false);
-	}
+	if (amdgpu_sriov_vf(adev))
+		skip_hw = amdgpu_virt_request_full_gpu(adev, false);
 
-	r = amdgpu_device_ip_suspend_phase1(adev);
-	if (r)
-		return r;
-	r = amdgpu_device_ip_suspend_phase2(adev);
+	/* In case amdgpu_virt_request_full_gpu failed and vm cannot get
+	 * full access, we should skip touching hw and let poweroff continue
+	 */
+
+	if (!skip_hw) {
+		r = amdgpu_device_ip_suspend_phase1(adev);
+		if (r)
+			return r;
+		r = amdgpu_device_ip_suspend_phase2(adev);
+	}
 
 	if (amdgpu_sriov_vf(adev))
 		amdgpu_virt_release_full_gpu(adev, false);
@@ -2997,7 +2619,6 @@ static int amdgpu_device_ip_reinit_early_sriov(struct amdgpu_device *adev)
 	for (i = 0; i < adev->num_ip_blocks; i++) {
 		int j;
 		struct amdgpu_ip_block *block;
-
 		block = &adev->ip_blocks[i];
 		block->status.hw = false;
 
@@ -3172,7 +2793,7 @@ static void amdgpu_device_detect_sriov_bios(struct amdgpu_device *adev)
 {
 	if (amdgpu_sriov_vf(adev)) {
 		if (adev->is_atom_fw) {
-			if (amdgpu_atomfirmware_gpu_virtualization_supported(adev))
+			if (amdgpu_atomfirmware_gpu_supports_virtualization(adev))
 				adev->virt.caps |= AMDGPU_SRIOV_CAPS_SRIOV_VBIOS;
 		} else {
 			if (amdgpu_atombios_has_gpu_virtualization_table(adev))
@@ -3196,12 +2817,6 @@ bool amdgpu_device_asic_has_dc_support(enum amd_asic_type asic_type)
 {
 	switch (asic_type) {
 #if defined(CONFIG_DRM_AMD_DC)
-#if defined(CONFIG_DRM_AMD_DC_SI)
-	case CHIP_TAHITI:
-	case CHIP_PITCAIRN:
-	case CHIP_VERDE:
-	case CHIP_OLAND:
-#endif
 	case CHIP_BONAIRE:
 	case CHIP_KAVERI:
 	case CHIP_KABINI:
@@ -3226,24 +2841,22 @@ bool amdgpu_device_asic_has_dc_support(enum amd_asic_type asic_type)
 	case CHIP_VEGA10:
 	case CHIP_VEGA12:
 	case CHIP_VEGA20:
-#if defined(CONFIG_DRM_AMD_DC_DCN)
+#if defined(CONFIG_DRM_AMD_DC_DCN1_0)
 	case CHIP_RAVEN:
+#endif
+#if defined(CONFIG_DRM_AMD_DC_DCN2_0)
 	case CHIP_NAVI10:
 	case CHIP_NAVI14:
 	case CHIP_NAVI12:
+#endif
+#if defined(CONFIG_DRM_AMD_DC_DCN2_1)
 	case CHIP_RENOIR:
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
-	case CHIP_VANGOGH:
-	case CHIP_YELLOW_CARP:
 #endif
 		return amdgpu_dc != 0;
 #endif
 	default:
 		if (amdgpu_dc > 0)
-			DRM_INFO_ONCE("Display Core has been requested via kernel parameter "
+			DRM_INFO("Display Core has been requested via kernel parameter "
 					 "but isn't supported by ASIC, ignoring\n");
 		return false;
 	}
@@ -3252,25 +2865,24 @@ bool amdgpu_device_asic_has_dc_support(enum amd_asic_type asic_type)
 /**
  * amdgpu_device_has_dc_support - check if dc is supported
  *
- * @adev: amdgpu_device pointer
+ * @adev: amdgpu_device_pointer
  *
  * Returns true for supported, false for not supported
  */
 bool amdgpu_device_has_dc_support(struct amdgpu_device *adev)
 {
-	if (amdgpu_sriov_vf(adev) || 
-	    adev->enable_virtual_display ||
-	    (adev->harvest_ip_mask & AMD_HARVEST_IP_DMU_MASK))
+	if (adev->enable_virtual_display)
 		return false;
 
 	return amdgpu_device_asic_has_dc_support(adev->asic_type);
 }
 
+
 static void amdgpu_device_xgmi_reset_func(struct work_struct *__work)
 {
 	struct amdgpu_device *adev =
 		container_of(__work, struct amdgpu_device, xgmi_reset_work);
-	struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev);
+	struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev, 0);
 
 	/* It's a bug to not have a hive within this function */
 	if (WARN_ON(!hive))
@@ -3285,20 +2897,19 @@ static void amdgpu_device_xgmi_reset_func(struct work_struct *__work)
 	if (amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) {
 
 		task_barrier_enter(&hive->tb);
-		adev->asic_reset_res = amdgpu_device_baco_enter(adev_to_drm(adev));
+		adev->asic_reset_res = amdgpu_device_baco_enter(adev->ddev);
 
 		if (adev->asic_reset_res)
 			goto fail;
 
 		task_barrier_exit(&hive->tb);
-		adev->asic_reset_res = amdgpu_device_baco_exit(adev_to_drm(adev));
+		adev->asic_reset_res = amdgpu_device_baco_exit(adev->ddev);
 
 		if (adev->asic_reset_res)
 			goto fail;
 
-		if (adev->mmhub.ras_funcs &&
-		    adev->mmhub.ras_funcs->reset_ras_error_count)
-			adev->mmhub.ras_funcs->reset_ras_error_count(adev);
+		if (adev->mmhub.funcs && adev->mmhub.funcs->reset_ras_error_count)
+			adev->mmhub.funcs->reset_ras_error_count(adev);
 	} else {
 
 		task_barrier_full(&hive->tb);
@@ -3308,8 +2919,7 @@ static void amdgpu_device_xgmi_reset_func(struct work_struct *__work)
 fail:
 	if (adev->asic_reset_res)
 		DRM_WARN("ASIC reset failed with error, %d for drm dev, %s",
-			 adev->asic_reset_res, adev_to_drm(adev)->unique);
-	amdgpu_put_xgmi_hive(hive);
+			 adev->asic_reset_res, adev->ddev->unique);
 }
 
 static int amdgpu_device_get_job_timeout_settings(struct amdgpu_device *adev)
@@ -3321,8 +2931,8 @@ static int amdgpu_device_get_job_timeout_settings(struct amdgpu_device *adev)
 	int ret = 0;
 
 	/*
-	 * By default timeout for non compute jobs is 10000
-	 * and 60000 for compute jobs.
+	 * By default timeout for non compute jobs is 10000.
+	 * And there is no timeout enforced on compute jobs.
 	 * In SR-IOV or passthrough mode, timeout for compute
 	 * jobs are 60000 by default.
 	 */
@@ -3331,8 +2941,10 @@ static int amdgpu_device_get_job_timeout_settings(struct amdgpu_device *adev)
 	if (amdgpu_sriov_vf(adev))
 		adev->compute_timeout = amdgpu_sriov_is_pp_one_vf(adev) ?
 					msecs_to_jiffies(60000) : msecs_to_jiffies(10000);
-	else
+	else if (amdgpu_passthrough(adev))
 		adev->compute_timeout =  msecs_to_jiffies(60000);
+	else
+		adev->compute_timeout = MAX_SCHEDULE_TIMEOUT;
 
 	if (strnlen(input, AMDGPU_MAX_TIMEOUT_PARAM_LENGTH)) {
 		while ((timeout_setting = strsep(&input, ",")) &&
@@ -3381,18 +2993,47 @@ static int amdgpu_device_get_job_timeout_settings(struct amdgpu_device *adev)
 	return ret;
 }
 
-static const struct attribute *amdgpu_dev_attributes[] = {
-	&dev_attr_product_name.attr,
-	&dev_attr_product_number.attr,
-	&dev_attr_serial_number.attr,
-	&dev_attr_pcie_replay_count.attr,
-	NULL
-};
+/**
+ *
+ * The amdgpu driver provides a sysfs API for providing driver version data.
+ */
+static ssize_t amdgpu_get_driver_version(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	return snprintf(buf, PAGE_SIZE, "%s\n",
+#ifdef BUILD_NUM
+		__stringify(INTERNAL_VER)"."__stringify(BUILD_NUM));
+#else
+		__stringify(INTERNAL_VER));
+#endif
+}
+
+static DEVICE_ATTR(version, S_IRUGO, amdgpu_get_driver_version, NULL);
+
+static int amdgpu_version_sysfs_init(struct amdgpu_device *adev)
+{
+	int ret;
+
+	ret = device_create_file(adev->dev, &dev_attr_version);
+	if (ret) {
+		DRM_ERROR("failed to create device file for version\n");
+		return ret;
+	}
+	return 0;
+}
+
+static void amdgpu_version_sysfs_fini(struct amdgpu_device *adev)
+{
+	device_remove_file(adev->dev, &dev_attr_version);
+}
 
 /**
  * amdgpu_device_init - initialize the driver
  *
  * @adev: amdgpu_device pointer
+ * @ddev: drm dev pointer
+ * @pdev: pci dev pointer
  * @flags: driver flags
  *
  * Initializes the driver info and hw (all asics).
@@ -3400,15 +3041,18 @@ static const struct attribute *amdgpu_dev_attributes[] = {
  * Called at driver startup.
  */
 int amdgpu_device_init(struct amdgpu_device *adev,
+		       struct drm_device *ddev,
+		       struct pci_dev *pdev,
 		       uint32_t flags)
 {
-	struct drm_device *ddev = adev_to_drm(adev);
-	struct pci_dev *pdev = adev->pdev;
 	int r, i;
-	bool px = false;
+	bool boco = false;
 	u32 max_MBps;
 
 	adev->shutdown = false;
+	adev->dev = &pdev->dev;
+	adev->ddev = ddev;
+	adev->pdev = pdev;
 	adev->flags = flags;
 
 	if (amdgpu_force_asic_type >= 0 && amdgpu_force_asic_type < CHIP_LAST)
@@ -3427,7 +3071,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	adev->vm_manager.vm_pte_funcs = NULL;
 	adev->vm_manager.vm_pte_num_scheds = 0;
 	adev->gmc.gmc_funcs = NULL;
-	adev->harvest_ip_mask = 0x0;
 	adev->fence_context = dma_fence_context_alloc(AMDGPU_MAX_RINGS);
 	bitmap_zero(adev->gfx.pipe_reserve_bitmap, AMDGPU_MAX_COMPUTE_QUEUES);
 
@@ -3454,6 +3097,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 	/* mutex initialization are all done here so we
 	 * can recall function without having locking issues */
+	atomic_set(&adev->irq.ih.lock, 0);
 	mutex_init(&adev->firmware.mutex);
 	mutex_init(&adev->pm.mutex);
 	mutex_init(&adev->gfx.gpu_clock_mutex);
@@ -3464,14 +3108,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	mutex_init(&adev->mn_lock);
 	mutex_init(&adev->virt.vf_errors.lock);
 	hash_init(adev->mn_hash);
-	atomic_set(&adev->in_gpu_reset, 0);
-	init_rwsem(&adev->reset_sem);
+	mutex_init(&adev->lock_reset);
 	mutex_init(&adev->psp.mutex);
-	mutex_init(&adev->notifier_lock);
-
-	r = amdgpu_device_init_apu_flags(adev);
-	if (r)
-		return r;
+	mutex_init(&adev->virt.dump_mutex);
 
 	r = amdgpu_device_check_arguments(adev);
 	if (r)
@@ -3490,7 +3129,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	INIT_LIST_HEAD(&adev->shadow_list);
 	mutex_init(&adev->shadow_list_lock);
 
-	INIT_LIST_HEAD(&adev->reset_list);
+	INIT_LIST_HEAD(&adev->ring_lru_list);
+	spin_lock_init(&adev->ring_lru_list_lock);
 
 	INIT_DELAYED_WORK(&adev->delayed_init_work,
 			  amdgpu_device_delayed_init_work_handler);
@@ -3500,18 +3140,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
 
 	adev->gfx.gfx_off_req_count = 1;
-	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
-
-	atomic_set(&adev->throttling_logging_enabled, 1);
-	/*
-	 * If throttling continues, logging will be performed every minute
-	 * to avoid log flooding. "-1" is subtracted since the thermal
-	 * throttling interrupt comes every second. Thus, the total logging
-	 * interval is 59 seconds(retelimited printk interval) + 1(waiting
-	 * for throttling interrupt) = 60 seconds.
-	 */
-	ratelimit_state_init(&adev->throttling_logging_rs, (60 - 1) * HZ, 1);
-	ratelimit_set_flags(&adev->throttling_logging_rs, RATELIMIT_MSG_ON_RELEASE);
+	adev->pm.ac_power = power_supply_is_system_supplied() > 0 ? true : false;
 
 	/* Registers mapping */
 	/* TODO: block userspace mapping of io register */
@@ -3530,6 +3159,17 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	DRM_INFO("register mmio base: 0x%08X\n", (uint32_t)adev->rmmio_base);
 	DRM_INFO("register mmio size: %u\n", (unsigned)adev->rmmio_size);
 
+	/* io port mapping */
+	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
+		if (pci_resource_flags(adev->pdev, i) & IORESOURCE_IO) {
+			adev->rio_mem_size = pci_resource_len(adev->pdev, i);
+			adev->rio_mem = pci_iomap(adev->pdev, i, adev->rio_mem_size);
+			break;
+		}
+	}
+	if (adev->rio_mem == NULL)
+		DRM_INFO("PCI I/O BAR is not found.\n");
+
 	/* enable PCIE atomic ops */
 	r = pci_enable_atomic_ops_to_root(adev->pdev,
 					  PCI_EXP_DEVCAP2_ATOMIC_COMP32 |
@@ -3566,14 +3206,28 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	/* doorbell bar mapping and doorbell index init*/
 	amdgpu_device_doorbell_init(adev);
 
+	/* if we have > 1 VGA cards, then disable the amdgpu VGA resources */
+	/* this will fail for cards that aren't VGA class devices, just
+	 * ignore it */
+	vga_client_register(adev->pdev, adev, NULL, amdgpu_device_vga_set_decode);
+
+	if (amdgpu_device_supports_boco(ddev))
+		boco = true;
+	if (amdgpu_has_atpx() &&
+	    (amdgpu_is_atpx_hybrid() ||
+	     amdgpu_has_atpx_dgpu_power_cntl()) &&
+	    !pci_is_thunderbolt_attached(adev->pdev))
+		vga_switcheroo_register_client(adev->pdev,
+					       &amdgpu_switcheroo_ops, boco);
+	if (boco)
+		vga_switcheroo_init_domain_pm_ops(adev->dev, &adev->vga_pm_domain);
+
 	if (amdgpu_emu_mode == 1) {
 		/* post the asic on emulation mode */
 		emu_soc_asic_init(adev);
 		goto fence_driver_init;
 	}
 
-	amdgpu_reset_init(adev);
-
 	/* detect if we are with an SRIOV vbios */
 	amdgpu_device_detect_sriov_bios(adev);
 
@@ -3581,33 +3235,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	 *  E.g., driver was not cleanly unloaded previously, etc.
 	 */
 	if (!amdgpu_sriov_vf(adev) && amdgpu_asic_need_reset_on_init(adev)) {
-		if (adev->gmc.xgmi.num_physical_nodes) {
-			dev_info(adev->dev, "Pending hive reset.\n");
-			adev->gmc.xgmi.pending_reset = true;
-			/* Only need to init necessary block for SMU to handle the reset */
-			for (i = 0; i < adev->num_ip_blocks; i++) {
-				if (!adev->ip_blocks[i].status.valid)
-					continue;
-				if (!(adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GMC ||
-				      adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_COMMON ||
-				      adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_IH ||
-				      adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_SMC)) {
-					DRM_DEBUG("IP %s disabled for hw_init.\n",
-						adev->ip_blocks[i].version->funcs->name);
-					adev->ip_blocks[i].status.hw = true;
-				}
-			}
-		} else {
-			r = amdgpu_asic_reset(adev);
-			if (r) {
-				dev_err(adev->dev, "asic reset on init failed\n");
-				goto failed;
-			}
+		r = amdgpu_asic_reset(adev);
+		if (r) {
+			dev_err(adev->dev, "asic reset on init failed\n");
+			goto failed;
 		}
 	}
 
-	pci_enable_pcie_error_reporting(adev->pdev);
-
 	/* Post card if necessary */
 	if (amdgpu_device_need_post(adev)) {
 		if (!adev->bios) {
@@ -3616,7 +3250,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 			goto failed;
 		}
 		DRM_INFO("GPU posting now...\n");
-		r = amdgpu_device_asic_init(adev);
+		r = amdgpu_atom_asic_init(adev->mode_info.atom_context);
 		if (r) {
 			dev_err(adev->dev, "gpu post error!\n");
 			goto failed;
@@ -3646,15 +3280,15 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 fence_driver_init:
 	/* Fence driver */
-	r = amdgpu_fence_driver_sw_init(adev);
+	r = amdgpu_fence_driver_init(adev);
 	if (r) {
-		dev_err(adev->dev, "amdgpu_fence_driver_sw_init failed\n");
+		dev_err(adev->dev, "amdgpu_fence_driver_init failed\n");
 		amdgpu_vf_error_put(adev, AMDGIM_ERROR_VF_FENCE_INIT_FAIL, 0, 0);
 		goto failed;
 	}
 
 	/* init the mode config */
-	drm_mode_config_init(adev_to_drm(adev));
+	drm_mode_config_init(adev->ddev);
 
 	r = amdgpu_device_ip_init(adev);
 	if (r) {
@@ -3668,22 +3302,21 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 			adev->virt.caps &= ~AMDGPU_SRIOV_CAPS_RUNTIME;
 			adev->virt.ops = NULL;
 			r = -EAGAIN;
-			goto release_ras_con;
+			goto failed;
 		}
 		dev_err(adev->dev, "amdgpu_device_ip_init failed\n");
 		amdgpu_vf_error_put(adev, AMDGIM_ERROR_VF_AMDGPU_INIT_FAIL, 0, 0);
-		goto release_ras_con;
+		goto failed;
 	}
 
-	amdgpu_fence_driver_hw_init(adev);
-
-	dev_info(adev->dev,
-		"SE %d, SH per SE %d, CU per SH %d, active_cu_number %d\n",
+	DRM_DEBUG("SE %d, SH per SE %d, CU per SH %d, active_cu_number %d\n",
 			adev->gfx.config.max_shader_engines,
 			adev->gfx.config.max_sh_per_se,
 			adev->gfx.config.max_cu_per_sh,
 			adev->gfx.cu_info.number);
 
+	amdgpu_ctx_init_sched(adev);
+
 	adev->accel_working = true;
 
 	amdgpu_vm_check_compute_bug(adev);
@@ -3705,6 +3338,14 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	} else
 		adev->pm_sysfs_en = true;
 
+	r = amdgpu_pm_uuid_sysfs_init(adev);
+	if (r)
+		DRM_ERROR("Creating uuid sysfs failed (%d).\n", r);
+
+	r = amdgpu_version_sysfs_init(adev);
+	if (r)
+		DRM_ERROR("Creating version sysfs failed (%d).\n", r);
+
 	r = amdgpu_ucode_sysfs_init(adev);
 	if (r) {
 		adev->ucode_sysfs_en = false;
@@ -3735,84 +3376,66 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	/* enable clockgating, etc. after ib tests, etc. since some blocks require
 	 * explicit gating rather than handling it automatically.
 	 */
-	if (!adev->gmc.xgmi.pending_reset) {
-		r = amdgpu_device_ip_late_init(adev);
+	r = amdgpu_device_ip_late_init(adev);
+	if (r) {
+		dev_err(adev->dev, "amdgpu_device_ip_late_init failed\n");
+		amdgpu_vf_error_put(adev, AMDGIM_ERROR_VF_AMDGPU_LATE_INIT_FAIL, 0, r);
+		goto failed;
+	}
+
+	/* must succeed. */
+	amdgpu_ras_resume(adev);
+
+	if (amdgpu_sriov_vf(adev)) {
+		r = amdgpu_ib_ring_tests(adev);
 		if (r) {
-			dev_err(adev->dev, "amdgpu_device_ip_late_init failed\n");
-			amdgpu_vf_error_put(adev, AMDGIM_ERROR_VF_AMDGPU_LATE_INIT_FAIL, 0, r);
-			goto release_ras_con;
+			DRM_ERROR("ib ring test failed (%d).\n", r);
+			return r;
 		}
-		/* must succeed. */
-		amdgpu_ras_resume(adev);
+	} else {
 		queue_delayed_work(system_wq, &adev->delayed_init_work,
-				   msecs_to_jiffies(AMDGPU_RESUME_MS));
+			   msecs_to_jiffies(AMDGPU_RESUME_MS));
 	}
 
-	if (amdgpu_sriov_vf(adev))
-		flush_delayed_work(&adev->delayed_init_work);
+	r = device_create_file(adev->dev, &dev_attr_pcie_replay_count);
+	if (r) {
+		dev_err(adev->dev, "Could not create pcie_replay_count");
+		return r;
+	}
 
-	r = sysfs_create_files(&adev->dev->kobj, amdgpu_dev_attributes);
-	if (r)
-		dev_err(adev->dev, "Could not create amdgpu device attr\n");
+	r = device_create_file(adev->dev, &dev_attr_product_name);
+	if (r) {
+		dev_err(adev->dev, "Could not create product_name");
+		return r;
+	}
+
+	r = device_create_file(adev->dev, &dev_attr_product_number);
+	if (r) {
+		dev_err(adev->dev, "Could not create product_number");
+		return r;
+	}
+
+	r = device_create_file(adev->dev, &dev_attr_serial_number);
+	if (r) {
+		dev_err(adev->dev, "Could not create serial_number");
+		return r;
+	}
 
 	if (IS_ENABLED(CONFIG_PERF_EVENTS))
 		r = amdgpu_pmu_init(adev);
 	if (r)
 		dev_err(adev->dev, "amdgpu_pmu_init failed\n");
 
-	/* Have stored pci confspace at hand for restore in sudden PCI error */
-	if (amdgpu_device_cache_pci_state(adev->pdev))
-		pci_restore_state(pdev);
-
-	/* if we have > 1 VGA cards, then disable the amdgpu VGA resources */
-	/* this will fail for cards that aren't VGA class devices, just
-	 * ignore it */
-	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
-		vga_client_register(adev->pdev, adev, NULL, amdgpu_device_vga_set_decode);
-
-	if (amdgpu_device_supports_px(ddev)) {
-		px = true;
-		vga_switcheroo_register_client(adev->pdev,
-					       &amdgpu_switcheroo_ops, px);
-		vga_switcheroo_init_domain_pm_ops(adev->dev, &adev->vga_pm_domain);
-	}
-
-	if (adev->gmc.xgmi.pending_reset)
-		queue_delayed_work(system_wq, &mgpu_info.delayed_reset_work,
-				   msecs_to_jiffies(AMDGPU_RESUME_MS));
-
 	return 0;
 
-release_ras_con:
-	amdgpu_release_ras_context(adev);
-
 failed:
 	amdgpu_vf_error_trans_all(adev);
+	if (boco)
+		vga_switcheroo_fini_domain_pm_ops(adev->dev);
 
 	return r;
 }
 
-static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
-{
-	/* Clear all CPU mappings pointing to this device */
-	unmap_mapping_range(adev->ddev.anon_inode->i_mapping, 0, 0, 1);
-
-	/* Unmap all mapped bars - Doorbell, registers and VRAM */
-	amdgpu_device_doorbell_fini(adev);
-
-	iounmap(adev->rmmio);
-	adev->rmmio = NULL;
-	if (adev->mman.aper_base_kaddr)
-		iounmap(adev->mman.aper_base_kaddr);
-	adev->mman.aper_base_kaddr = NULL;
-
-	/* Memory manager related */
-	if (!adev->gmc.xgmi.connected_to_cpu) {
-		arch_phys_wc_del(adev->gmc.vram_mtrr);
-		arch_io_free_memtype_wc(adev->gmc.aper_base, adev->gmc.aper_size);
-	}
-}
-
 /**
  * amdgpu_device_fini - tear down the driver
  *
@@ -3821,58 +3444,49 @@ static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
  * Tear down the driver info (all asics).
  * Called at driver shutdown.
  */
-void amdgpu_device_fini_hw(struct amdgpu_device *adev)
+void amdgpu_device_fini(struct amdgpu_device *adev)
 {
-	dev_info(adev->dev, "amdgpu: finishing device.\n");
-	flush_delayed_work(&adev->delayed_init_work);
+	int r = 0;
+	/* In case amdgpu_virt_request_full_gpu failed and vm cannot get
+	* full access, we should skip touching hw and let unload continue
+	*/
+	int skip_hw = 0;
+
+	DRM_INFO("amdgpu: finishing device.\n");
+	if (!amdgpu_sriov_vf(adev))
+		flush_delayed_work(&adev->delayed_init_work);
 	ttm_bo_lock_delayed_workqueue(&adev->mman.bdev);
 	adev->shutdown = true;
 
 	/* make sure IB test finished before entering exclusive mode
 	 * to avoid preemption on IB test
 	 * */
-	if (amdgpu_sriov_vf(adev)) {
-		amdgpu_virt_request_full_gpu(adev, false);
-		amdgpu_virt_fini_data_exchange(adev);
-	}
+	if (amdgpu_sriov_vf(adev))
+		skip_hw = amdgpu_virt_request_full_gpu(adev, false);
 
 	/* disable all interrupts */
-	amdgpu_irq_disable_all(adev);
+	if (!skip_hw)
+		amdgpu_irq_disable_all(adev);
 	if (adev->mode_info.mode_config_initialized){
 		if (!amdgpu_device_has_dc_support(adev))
-			drm_helper_force_disable_all(adev_to_drm(adev));
+			drm_helper_force_disable_all(adev->ddev);
+#ifdef HAVE_DRM_ATOMIC_HELPER_SHUTDOWN
 		else
-			drm_atomic_helper_shutdown(adev_to_drm(adev));
+			drm_atomic_helper_shutdown(adev->ddev);
+#endif
 	}
-	amdgpu_fence_driver_hw_fini(adev);
-
+	amdgpu_fence_driver_fini(adev, skip_hw);
+	amdgpu_pm_uuid_sysfs_fini(adev);
 	if (adev->pm_sysfs_en)
 		amdgpu_pm_sysfs_fini(adev);
-	if (adev->ucode_sysfs_en)
-		amdgpu_ucode_sysfs_fini(adev);
-	sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
-
+	amdgpu_version_sysfs_fini(adev);
 	amdgpu_fbdev_fini(adev);
-
-	amdgpu_irq_fini_hw(adev);
-
-	amdgpu_device_ip_fini_early(adev);
-
-	amdgpu_gart_dummy_page_fini(adev);
-
-	amdgpu_device_unmap_mmio(adev);
-}
-
-void amdgpu_device_fini_sw(struct amdgpu_device *adev)
-{
-	amdgpu_device_ip_fini(adev);
-	amdgpu_fence_driver_sw_fini(adev);
-	release_firmware(adev->firmware.gpu_info_fw);
-	adev->firmware.gpu_info_fw = NULL;
+	r = amdgpu_device_ip_fini(adev, skip_hw);
+	if (adev->firmware.gpu_info_fw) {
+		release_firmware(adev->firmware.gpu_info_fw);
+		adev->firmware.gpu_info_fw = NULL;
+	}
 	adev->accel_working = false;
-
-	amdgpu_reset_fini(adev);
-
 	/* free i2c buses */
 	if (!amdgpu_device_has_dc_support(adev))
 		amdgpu_i2c_fini(adev);
@@ -3882,20 +3496,31 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 
 	kfree(adev->bios);
 	adev->bios = NULL;
-	if (amdgpu_device_supports_px(adev_to_drm(adev))) {
+	if (amdgpu_has_atpx() &&
+	    (amdgpu_is_atpx_hybrid() ||
+	     amdgpu_has_atpx_dgpu_power_cntl()) &&
+	    !pci_is_thunderbolt_attached(adev->pdev))
 		vga_switcheroo_unregister_client(adev->pdev);
+	if (amdgpu_device_supports_boco(adev->ddev))
 		vga_switcheroo_fini_domain_pm_ops(adev->dev);
-	}
-	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
-		vga_client_register(adev->pdev, NULL, NULL, NULL);
+	vga_client_register(adev->pdev, NULL, NULL, NULL);
+	if (adev->rio_mem)
+		pci_iounmap(adev->pdev, adev->rio_mem);
+	adev->rio_mem = NULL;
+	iounmap(adev->rmmio);
+	adev->rmmio = NULL;
+	amdgpu_device_doorbell_fini(adev);
 
+	device_remove_file(adev->dev, &dev_attr_pcie_replay_count);
+	if (adev->ucode_sysfs_en)
+		amdgpu_ucode_sysfs_fini(adev);
+	device_remove_file(adev->dev, &dev_attr_product_name);
+	device_remove_file(adev->dev, &dev_attr_product_number);
+	device_remove_file(adev->dev, &dev_attr_serial_number);
 	if (IS_ENABLED(CONFIG_PERF_EVENTS))
 		amdgpu_pmu_fini(adev);
-	if (adev->mman.discovery_bin)
+	if (amdgpu_discovery && adev->asic_type >= CHIP_NAVI10)
 		amdgpu_discovery_fini(adev);
-
-	kfree(adev->pci_state);
-
 }
 
 
@@ -3906,6 +3531,7 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
  * amdgpu_device_suspend - initiate device suspend
  *
  * @dev: drm dev pointer
+ * @suspend: suspend state
  * @fbcon : notify the fbdev of suspend
  *
  * Puts the hw in the suspend state (all asics).
@@ -3914,36 +3540,90 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
  */
 int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
 {
-	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct amdgpu_device *adev;
+	struct drm_crtc *crtc;
+	struct drm_connector *connector;
+#ifdef HAVE_DRM_CONNECTOR_LIST_ITER_BEGIN
+	struct drm_connector_list_iter iter;
+#endif
+	int r;
+
+	if (dev == NULL || dev->dev_private == NULL) {
+		return -ENODEV;
+	}
+
+	adev = dev->dev_private;
 
 	if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
 		return 0;
 
 	adev->in_suspend = true;
-
-	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D3))
-		DRM_WARN("smart shift update failed\n");
-
 	drm_kms_helper_poll_disable(dev);
 
 	if (fbcon)
 		amdgpu_fbdev_set_suspend(adev, 1);
 
-	cancel_delayed_work_sync(&adev->delayed_init_work);
+	if (!amdgpu_sriov_vf(adev))
+		cancel_delayed_work_sync(&adev->delayed_init_work);
 
-	amdgpu_ras_suspend(adev);
+	if (!amdgpu_device_has_dc_support(adev)) {
+		/* turn off display hw */
+		drm_modeset_lock_all(dev);
+#ifdef HAVE_DRM_CONNECTOR_LIST_ITER_BEGIN
+		drm_connector_list_iter_begin(dev, &iter);
+		drm_for_each_connector_iter(connector, &iter)
+#else
+		drm_for_each_connector(connector, dev)
+#endif
+			drm_helper_connector_dpms(connector,
+						  DRM_MODE_DPMS_OFF);
+#ifdef HAVE_DRM_CONNECTOR_LIST_ITER_BEGIN
+		drm_connector_list_iter_end(&iter);
+#endif
+		drm_modeset_unlock_all(dev);
+			/* unpin the front buffers and cursors */
+		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
+			struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
+			struct drm_framebuffer *fb = crtc->primary->fb;
+			struct amdgpu_bo *robj;
+
+			if (amdgpu_crtc->cursor_bo && !adev->enable_virtual_display) {
+				struct amdgpu_bo *aobj = gem_to_amdgpu_bo(amdgpu_crtc->cursor_bo);
+				r = amdgpu_bo_reserve(aobj, true);
+				if (r == 0) {
+					amdgpu_bo_unpin(aobj);
+					amdgpu_bo_unreserve(aobj);
+				}
+			}
+
+			if (fb == NULL || kcl_drm_fb_get_gem_obj(fb, 0) == NULL) {
+				continue;
+			}
+			robj = gem_to_amdgpu_bo(kcl_drm_fb_get_gem_obj(fb, 0));
+			/* don't unpin kernel fb objects */
+			if (!amdgpu_fbdev_robj_is_fb(adev, robj)) {
+				r = amdgpu_bo_reserve(robj, true);
+				if (r == 0) {
+					amdgpu_bo_unpin(robj);
+					amdgpu_bo_unreserve(robj);
+				}
+			}
+		}
+	}
+
+	amdgpu_amdkfd_suspend(adev, !fbcon);
 
-	amdgpu_device_ip_suspend_phase1(adev);
+	amdgpu_ras_suspend(adev);
 
-	if (!adev->in_s0ix)
-		amdgpu_amdkfd_suspend(adev, adev->in_runpm);
+	r = amdgpu_device_ip_suspend_phase1(adev);
 
 	/* evict vram memory */
 	amdgpu_bo_evict_vram(adev);
 
-	amdgpu_fence_driver_hw_fini(adev);
+	amdgpu_fence_driver_suspend(adev);
+
+	r = amdgpu_device_ip_suspend_phase2(adev);
 
-	amdgpu_device_ip_suspend_phase2(adev);
 	/* evict remaining vram memory
 	 * This second call to evict vram is to evict the gart page table
 	 * using the CPU.
@@ -3957,6 +3637,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
  * amdgpu_device_resume - initiate device resume
  *
  * @dev: drm dev pointer
+ * @resume: resume state
  * @fbcon : notify the fbdev of resume
  *
  * Bring the hw back to operating state (all asics).
@@ -3965,47 +3646,98 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
  */
 int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
 {
-	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct drm_connector *connector;
+#ifdef HAVE_DRM_CONNECTOR_LIST_ITER_BEGIN
+	struct drm_connector_list_iter iter;
+#endif
+	struct amdgpu_device *adev = dev->dev_private;
+	struct drm_crtc *crtc;
 	int r = 0;
 
 	if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
 		return 0;
 
-	if (adev->in_s0ix)
-		amdgpu_gfx_state_change_set(adev, sGpuChangeState_D0Entry);
-
 	/* post card */
 	if (amdgpu_device_need_post(adev)) {
-		r = amdgpu_device_asic_init(adev);
+		r = amdgpu_atom_asic_init(adev->mode_info.atom_context);
 		if (r)
-			dev_err(adev->dev, "amdgpu asic init failed\n");
+			DRM_ERROR("amdgpu asic init failed\n");
 	}
 
 	r = amdgpu_device_ip_resume(adev);
 	if (r) {
-		dev_err(adev->dev, "amdgpu_device_ip_resume failed (%d).\n", r);
+		DRM_ERROR("amdgpu_device_ip_resume failed (%d).\n", r);
 		return r;
 	}
-	amdgpu_fence_driver_hw_init(adev);
+	amdgpu_fence_driver_resume(adev);
+
 
 	r = amdgpu_device_ip_late_init(adev);
 	if (r)
 		return r;
 
-	queue_delayed_work(system_wq, &adev->delayed_init_work,
+	if (amdgpu_sriov_vf(adev)) {
+		r = amdgpu_ib_ring_tests(adev);
+		if (r) {
+			DRM_ERROR("ib ring test failed (%d).\n", r);
+			return r;
+		}
+	} else {
+		queue_delayed_work(system_wq, &adev->delayed_init_work,
 			   msecs_to_jiffies(AMDGPU_RESUME_MS));
+	}
 
-	if (!adev->in_s0ix) {
-		r = amdgpu_amdkfd_resume(adev, adev->in_runpm);
-		if (r)
-			return r;
+	if (!amdgpu_device_has_dc_support(adev)) {
+		/* pin cursors */
+		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
+			struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
+
+			if (amdgpu_crtc->cursor_bo && !adev->enable_virtual_display) {
+				struct amdgpu_bo *aobj = gem_to_amdgpu_bo(amdgpu_crtc->cursor_bo);
+				r = amdgpu_bo_reserve(aobj, true);
+				if (r == 0) {
+					r = amdgpu_bo_pin(aobj, AMDGPU_GEM_DOMAIN_VRAM);
+					if (r != 0)
+						DRM_ERROR("Failed to pin cursor BO (%d)\n", r);
+					amdgpu_crtc->cursor_addr = amdgpu_bo_gpu_offset(aobj);
+					amdgpu_bo_unreserve(aobj);
+				}
+			}
+		}
 	}
+	r = amdgpu_amdkfd_resume(adev, !fbcon);
+	if (r)
+		return r;
 
 	/* Make sure IB tests flushed */
-	flush_delayed_work(&adev->delayed_init_work);
+	if (!amdgpu_sriov_vf(adev))
+		flush_delayed_work(&adev->delayed_init_work);
 
-	if (fbcon)
+	/* blat the mode back in */
+	if (fbcon) {
+		if (!amdgpu_device_has_dc_support(adev)) {
+			/* pre DCE11 */
+			drm_helper_resume_force_mode(dev);
+
+			/* turn on display hw */
+			drm_modeset_lock_all(dev);
+
+#ifdef HAVE_DRM_CONNECTOR_LIST_ITER_BEGIN
+			drm_connector_list_iter_begin(dev, &iter);
+			drm_for_each_connector_iter(connector, &iter)
+#else
+			drm_for_each_connector(connector, dev)
+#endif
+				drm_helper_connector_dpms(connector,
+							  DRM_MODE_DPMS_ON);
+#ifdef HAVE_DRM_CONNECTOR_LIST_ITER_BEGIN
+			drm_connector_list_iter_end(&iter);
+#endif
+
+			drm_modeset_unlock_all(dev);
+		}
 		amdgpu_fbdev_set_suspend(adev, 0);
+	}
 
 	drm_kms_helper_poll_enable(dev);
 
@@ -4032,9 +3764,6 @@ int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
 #endif
 	adev->in_suspend = false;
 
-	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
-		DRM_WARN("smart shift update failed\n");
-
 	return 0;
 }
 
@@ -4066,7 +3795,7 @@ static bool amdgpu_device_ip_check_soft_reset(struct amdgpu_device *adev)
 			adev->ip_blocks[i].status.hang =
 				adev->ip_blocks[i].version->funcs->check_soft_reset(adev);
 		if (adev->ip_blocks[i].status.hang) {
-			dev_info(adev->dev, "IP block:%s is hung!\n", adev->ip_blocks[i].version->funcs->name);
+			DRM_INFO("IP block:%s is hung!\n", adev->ip_blocks[i].version->funcs->name);
 			asic_hang = true;
 		}
 	}
@@ -4127,7 +3856,7 @@ static bool amdgpu_device_ip_need_full_reset(struct amdgpu_device *adev)
 		    (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_DCE) ||
 		     adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_PSP) {
 			if (adev->ip_blocks[i].status.hang) {
-				dev_info(adev->dev, "Some block need full reset!\n");
+				DRM_INFO("Some block need full reset!\n");
 				return true;
 			}
 		}
@@ -4208,7 +3937,6 @@ static int amdgpu_device_recover_vram(struct amdgpu_device *adev)
 {
 	struct dma_fence *fence = NULL, *next = NULL;
 	struct amdgpu_bo *shadow;
-	struct amdgpu_bo_vm *vmbo;
 	long r = 1, tmo;
 
 	if (amdgpu_sriov_runtime(adev))
@@ -4216,14 +3944,14 @@ static int amdgpu_device_recover_vram(struct amdgpu_device *adev)
 	else
 		tmo = msecs_to_jiffies(100);
 
-	dev_info(adev->dev, "recover vram bo from shadow start\n");
+	DRM_INFO("recover vram bo from shadow start\n");
 	mutex_lock(&adev->shadow_list_lock);
-	list_for_each_entry(vmbo, &adev->shadow_list, shadow_list) {
-		shadow = &vmbo->bo;
+	list_for_each_entry(shadow, &adev->shadow_list, shadow_list) {
+
 		/* No need to recover an evicted BO */
-		if (shadow->tbo.resource->mem_type != TTM_PL_TT ||
-		    shadow->tbo.resource->start == AMDGPU_BO_INVALID_OFFSET ||
-		    shadow->parent->tbo.resource->mem_type != TTM_PL_VRAM)
+		if (shadow->tbo.mem.mem_type != TTM_PL_TT ||
+		    shadow->tbo.mem.start == AMDGPU_BO_INVALID_OFFSET ||
+		    shadow->parent->tbo.mem.mem_type != TTM_PL_VRAM)
 			continue;
 
 		r = amdgpu_bo_restore_shadow(shadow, &next);
@@ -4252,11 +3980,11 @@ static int amdgpu_device_recover_vram(struct amdgpu_device *adev)
 	dma_fence_put(fence);
 
 	if (r < 0 || tmo <= 0) {
-		dev_err(adev->dev, "recover vram bo from shadow failed, r is %ld, tmo is %ld\n", r, tmo);
+		DRM_ERROR("recover vram bo from shadow failed, r is %ld, tmo is %ld\n", r, tmo);
 		return -EIO;
 	}
 
-	dev_info(adev->dev, "recover vram bo from shadow done\n");
+	DRM_INFO("recover vram bo from shadow done\n");
 	return 0;
 }
 
@@ -4264,7 +3992,7 @@ static int amdgpu_device_recover_vram(struct amdgpu_device *adev)
 /**
  * amdgpu_device_reset_sriov - reset ASIC for SR-IOV vf
  *
- * @adev: amdgpu_device pointer
+ * @adev: amdgpu device pointer
  * @from_hypervisor: request from hypervisor
  *
  * do VF FLR and reinitialize Asic
@@ -4291,7 +4019,7 @@ static int amdgpu_device_reset_sriov(struct amdgpu_device *adev,
 
 	amdgpu_virt_init_data_exchange(adev);
 	/* we need recover gart prior to run SMC/CP/SDMA resume */
-	amdgpu_gtt_mgr_recover(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT));
+	amdgpu_gtt_mgr_recover(&adev->mman.bdev.man[TTM_PL_TT]);
 
 	r = amdgpu_device_fw_loading(adev);
 	if (r)
@@ -4307,47 +4035,19 @@ static int amdgpu_device_reset_sriov(struct amdgpu_device *adev,
 	amdgpu_amdkfd_post_reset(adev);
 
 error:
+	amdgpu_virt_release_full_gpu(adev, true);
 	if (!r && adev->virt.gim_feature & AMDGIM_FEATURE_GIM_FLR_VRAMLOST) {
 		amdgpu_inc_vram_lost(adev);
 		r = amdgpu_device_recover_vram(adev);
 	}
-	amdgpu_virt_release_full_gpu(adev, true);
 
 	return r;
 }
 
-/**
- * amdgpu_device_has_job_running - check if there is any job in mirror list
- *
- * @adev: amdgpu_device pointer
- *
- * check if there is any job in mirror list
- */
-bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
-{
-	int i;
-	struct drm_sched_job *job;
-
-	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
-		struct amdgpu_ring *ring = adev->rings[i];
-
-		if (!ring || !ring->sched.thread)
-			continue;
-
-		spin_lock(&ring->sched.job_list_lock);
-		job = list_first_entry_or_null(&ring->sched.pending_list,
-					       struct drm_sched_job, list);
-		spin_unlock(&ring->sched.job_list_lock);
-		if (job)
-			return true;
-	}
-	return false;
-}
-
 /**
  * amdgpu_device_should_recover_gpu - check if we should try GPU recovery
  *
- * @adev: amdgpu_device pointer
+ * @adev: amdgpu device pointer
  *
  * Check amdgpu_gpu_recovery and SRIOV status to see if we should try to recover
  * a hung GPU.
@@ -4355,7 +4055,7 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
 bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev)
 {
 	if (!amdgpu_device_ip_check_soft_reset(adev)) {
-		dev_info(adev->dev, "Timeout, but no hardware hang detected.\n");
+		DRM_INFO("Timeout, but no hardware hang detected.\n");
 		return false;
 	}
 
@@ -4385,12 +4085,6 @@ bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev)
 		case CHIP_NAVI10:
 		case CHIP_NAVI14:
 		case CHIP_NAVI12:
-		case CHIP_SIENNA_CICHLID:
-		case CHIP_NAVY_FLOUNDER:
-		case CHIP_DIMGREY_CAVEFISH:
-		case CHIP_BEIGE_GOBY:
-		case CHIP_VANGOGH:
-		case CHIP_ALDEBARAN:
 			break;
 		default:
 			goto disabled;
@@ -4400,69 +4094,21 @@ bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev)
 	return true;
 
 disabled:
-		dev_info(adev->dev, "GPU recovery disabled.\n");
+		DRM_INFO("GPU recovery disabled.\n");
 		return false;
 }
 
-int amdgpu_device_mode1_reset(struct amdgpu_device *adev)
-{
-        u32 i;
-        int ret = 0;
-
-        amdgpu_atombios_scratch_regs_engine_hung(adev, true);
-
-        dev_info(adev->dev, "GPU mode1 reset\n");
-
-        /* disable BM */
-        pci_clear_master(adev->pdev);
-
-        amdgpu_device_cache_pci_state(adev->pdev);
-
-        if (amdgpu_dpm_is_mode1_reset_supported(adev)) {
-                dev_info(adev->dev, "GPU smu mode1 reset\n");
-                ret = amdgpu_dpm_mode1_reset(adev);
-        } else {
-                dev_info(adev->dev, "GPU psp mode1 reset\n");
-                ret = psp_gpu_reset(adev);
-        }
-
-        if (ret)
-                dev_err(adev->dev, "GPU mode1 reset failed\n");
-
-        amdgpu_device_load_pci_state(adev->pdev);
-
-        /* wait for asic to come out of reset */
-        for (i = 0; i < adev->usec_timeout; i++) {
-                u32 memsize = adev->nbio.funcs->get_memsize(adev);
-
-                if (memsize != 0xffffffff)
-                        break;
-                udelay(1);
-        }
-
-        amdgpu_atombios_scratch_regs_engine_hung(adev, false);
-        return ret;
-}
 
-int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
-				 struct amdgpu_reset_context *reset_context)
+static int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
+					struct amdgpu_job *job,
+					bool *need_full_reset_arg)
 {
 	int i, r = 0;
-	struct amdgpu_job *job = NULL;
-	bool need_full_reset =
-		test_bit(AMDGPU_NEED_FULL_RESET, &reset_context->flags);
-
-	if (reset_context->reset_req_dev == adev)
-		job = reset_context->job;
+	bool need_full_reset  = *need_full_reset_arg;
 
-	/* no need to dump if device is not in good state during probe period */
-	if (!adev->gmc.xgmi.pending_reset)
-		amdgpu_debugfs_wait_dump(adev);
-
-	if (amdgpu_sriov_vf(adev)) {
-		/* stop the data exchange thread */
-		amdgpu_virt_fini_data_exchange(adev);
-	}
+	if (amdgpu_sriov_vf(adev))
+		if (!amdgpu_virt_notify_booked(adev, job))
+			amdgpu_virt_wait_dump(adev, MAX_SCHEDULE_TIMEOUT);
 
 	/* block all schedulers and reset given job's ring */
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
@@ -4475,16 +4121,9 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 		amdgpu_fence_driver_force_completion(ring);
 	}
 
-	if (job && job->vm)
+	if (job)
 		drm_sched_increase_karma(&job->base);
 
-	r = amdgpu_reset_prepare_hwcontext(adev, reset_context);
-	/* If reset handler not implemented, continue; otherwise return */
-	if (r == -ENOSYS)
-		r = 0;
-	else
-		return r;
-
 	/* Don't suspend on bare metal if we are not going to HW reset the ASIC */
 	if (!amdgpu_sriov_vf(adev)) {
 
@@ -4496,69 +4135,52 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 			r = amdgpu_device_ip_soft_reset(adev);
 			amdgpu_device_ip_post_soft_reset(adev);
 			if (r || amdgpu_device_ip_check_soft_reset(adev)) {
-				dev_info(adev->dev, "soft reset failed, will fallback to full reset!\n");
+				DRM_INFO("soft reset failed, will fallback to full reset!\n");
 				need_full_reset = true;
 			}
 		}
 
 		if (need_full_reset)
 			r = amdgpu_device_ip_suspend(adev);
-		if (need_full_reset)
-			set_bit(AMDGPU_NEED_FULL_RESET, &reset_context->flags);
-		else
-			clear_bit(AMDGPU_NEED_FULL_RESET,
-				  &reset_context->flags);
+
+		*need_full_reset_arg = need_full_reset;
 	}
 
 	return r;
 }
 
-int amdgpu_do_asic_reset(struct list_head *device_list_handle,
-			 struct amdgpu_reset_context *reset_context)
+static int amdgpu_do_asic_reset(struct amdgpu_hive_info *hive,
+			       struct list_head *device_list_handle,
+			       bool *need_full_reset_arg)
 {
 	struct amdgpu_device *tmp_adev = NULL;
-	bool need_full_reset, skip_hw_reset, vram_lost = false;
+	bool need_full_reset = *need_full_reset_arg, vram_lost = false;
 	int r = 0;
 
-	/* Try reset handler method first */
-	tmp_adev = list_first_entry(device_list_handle, struct amdgpu_device,
-				    reset_list);
-	r = amdgpu_reset_perform_reset(tmp_adev, reset_context);
-	/* If reset handler not implemented, continue; otherwise return */
-	if (r == -ENOSYS)
-		r = 0;
-	else
-		return r;
-
-	/* Reset handler not implemented, use the default method */
-	need_full_reset =
-		test_bit(AMDGPU_NEED_FULL_RESET, &reset_context->flags);
-	skip_hw_reset = test_bit(AMDGPU_SKIP_HW_RESET, &reset_context->flags);
-
 	/*
-	 * ASIC reset has to be done on all XGMI hive nodes ASAP
+	 * ASIC reset has to be done on all HGMI hive nodes ASAP
 	 * to allow proper links negotiation in FW (within 1 sec)
 	 */
-	if (!skip_hw_reset && need_full_reset) {
-		list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
+	if (need_full_reset) {
+		list_for_each_entry(tmp_adev, device_list_handle, gmc.xgmi.head) {
 			/* For XGMI run all resets in parallel to speed up the process */
 			if (tmp_adev->gmc.xgmi.num_physical_nodes > 1) {
-				tmp_adev->gmc.xgmi.pending_reset = false;
 				if (!queue_work(system_unbound_wq, &tmp_adev->xgmi_reset_work))
 					r = -EALREADY;
 			} else
 				r = amdgpu_asic_reset(tmp_adev);
 
 			if (r) {
-				dev_err(tmp_adev->dev, "ASIC reset failed with error, %d for drm dev, %s",
-					 r, adev_to_drm(tmp_adev)->unique);
+				DRM_ERROR("ASIC reset failed with error, %d for drm dev, %s",
+					 r, tmp_adev->ddev->unique);
 				break;
 			}
 		}
 
 		/* For XGMI wait for all resets to complete before proceed */
 		if (!r) {
-			list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
+			list_for_each_entry(tmp_adev, device_list_handle,
+					    gmc.xgmi.head) {
 				if (tmp_adev->gmc.xgmi.num_physical_nodes > 1) {
 					flush_work(&tmp_adev->xgmi_reset_work);
 					r = tmp_adev->asic_reset_res;
@@ -4570,22 +4192,22 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 	}
 
 	if (!r && amdgpu_ras_intr_triggered()) {
-		list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
-			if (tmp_adev->mmhub.ras_funcs &&
-			    tmp_adev->mmhub.ras_funcs->reset_ras_error_count)
-				tmp_adev->mmhub.ras_funcs->reset_ras_error_count(tmp_adev);
+		list_for_each_entry(tmp_adev, device_list_handle, gmc.xgmi.head) {
+			if (tmp_adev->mmhub.funcs &&
+			    tmp_adev->mmhub.funcs->reset_ras_error_count)
+				tmp_adev->mmhub.funcs->reset_ras_error_count(tmp_adev);
 		}
 
 		amdgpu_ras_intr_cleared();
 	}
 
-	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
+	list_for_each_entry(tmp_adev, device_list_handle, gmc.xgmi.head) {
 		if (need_full_reset) {
 			/* post card */
-			r = amdgpu_device_asic_init(tmp_adev);
-			if (r) {
-				dev_warn(tmp_adev->dev, "asic atom init failed!");
-			} else {
+			if (amdgpu_atom_asic_init(tmp_adev->mode_info.atom_context))
+				DRM_WARN("asic atom init failed!");
+
+			if (!r) {
 				dev_info(tmp_adev->dev, "GPU reset succeeded, trying to resume\n");
 				r = amdgpu_device_ip_resume_phase1(tmp_adev);
 				if (r)
@@ -4597,7 +4219,8 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 					amdgpu_inc_vram_lost(tmp_adev);
 				}
 
-				r = amdgpu_gtt_mgr_recover(ttm_manager_type(&tmp_adev->mman.bdev, TTM_PL_TT));
+				r = amdgpu_gtt_mgr_recover(
+					&tmp_adev->mman.bdev.man[TTM_PL_TT]);
 				if (r)
 					goto out;
 
@@ -4618,48 +4241,29 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 				 */
 				amdgpu_register_gpu_instance(tmp_adev);
 
-				if (!reset_context->hive &&
-				    tmp_adev->gmc.xgmi.num_physical_nodes > 1)
-					amdgpu_xgmi_add_device(tmp_adev);
-
 				r = amdgpu_device_ip_late_init(tmp_adev);
 				if (r)
 					goto out;
 
 				amdgpu_fbdev_set_suspend(tmp_adev, 0);
 
-				/*
-				 * The GPU enters bad state once faulty pages
-				 * by ECC has reached the threshold, and ras
-				 * recovery is scheduled next. So add one check
-				 * here to break recovery if it indeed exceeds
-				 * bad page threshold, and remind user to
-				 * retire this GPU or setting one bigger
-				 * bad_page_threshold value to fix this once
-				 * probing driver again.
-				 */
-				if (!amdgpu_ras_eeprom_check_err_threshold(tmp_adev)) {
-					/* must succeed. */
-					amdgpu_ras_resume(tmp_adev);
-				} else {
-					r = -EINVAL;
-					goto out;
-				}
+				/* must succeed. */
+				amdgpu_ras_resume(tmp_adev);
 
 				/* Update PSP FW topology after reset */
-				if (reset_context->hive &&
-				    tmp_adev->gmc.xgmi.num_physical_nodes > 1)
-					r = amdgpu_xgmi_update_topology(
-						reset_context->hive, tmp_adev);
+				if (hive && tmp_adev->gmc.xgmi.num_physical_nodes > 1)
+					r = amdgpu_xgmi_update_topology(hive, tmp_adev);
 			}
 		}
 
+
 out:
 		if (!r) {
 			amdgpu_irq_gpu_reset_resume_helper(tmp_adev);
 			r = amdgpu_ib_ring_tests(tmp_adev);
 			if (r) {
 				dev_err(tmp_adev->dev, "ib ring test failed (%d).\n", r);
+				r = amdgpu_device_ip_suspend(tmp_adev);
 				need_full_reset = true;
 				r = -EAGAIN;
 				goto end;
@@ -4673,25 +4277,19 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 	}
 
 end:
-	if (need_full_reset)
-		set_bit(AMDGPU_NEED_FULL_RESET, &reset_context->flags);
-	else
-		clear_bit(AMDGPU_NEED_FULL_RESET, &reset_context->flags);
+	*need_full_reset_arg = need_full_reset;
 	return r;
 }
 
-static bool amdgpu_device_lock_adev(struct amdgpu_device *adev,
-				struct amdgpu_hive_info *hive)
+static bool amdgpu_device_lock_adev(struct amdgpu_device *adev, bool trylock)
 {
-	if (atomic_cmpxchg(&adev->in_gpu_reset, 0, 1) != 0)
-		return false;
-
-	if (hive) {
-		down_write_nest_lock(&adev->reset_sem, &hive->hive_lock);
-	} else {
-		down_write(&adev->reset_sem);
-	}
+	if (trylock) {
+		if (!mutex_trylock(&adev->lock_reset))
+			return false;
+	} else
+		mutex_lock(&adev->lock_reset);
 
+	adev->in_gpu_reset = true;
 	switch (amdgpu_asic_reset_method(adev)) {
 	case AMD_RESET_METHOD_MODE1:
 		adev->mp1_state = PP_MP1_STATE_SHUTDOWN;
@@ -4711,180 +4309,72 @@ static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
 {
 	amdgpu_vf_error_trans_all(adev);
 	adev->mp1_state = PP_MP1_STATE_NONE;
-	atomic_set(&adev->in_gpu_reset, 0);
-	up_write(&adev->reset_sem);
-}
-
-/*
- * to lockup a list of amdgpu devices in a hive safely, if not a hive
- * with multiple nodes, it will be similar as amdgpu_device_lock_adev.
- *
- * unlock won't require roll back.
- */
-static int amdgpu_device_lock_hive_adev(struct amdgpu_device *adev, struct amdgpu_hive_info *hive)
-{
-	struct amdgpu_device *tmp_adev = NULL;
-
-	if (adev->gmc.xgmi.num_physical_nodes > 1) {
-		if (!hive) {
-			dev_err(adev->dev, "Hive is NULL while device has multiple xgmi nodes");
-			return -ENODEV;
-		}
-		list_for_each_entry(tmp_adev, &hive->device_list, gmc.xgmi.head) {
-			if (!amdgpu_device_lock_adev(tmp_adev, hive))
-				goto roll_back;
-		}
-	} else if (!amdgpu_device_lock_adev(adev, hive))
-		return -EAGAIN;
-
-	return 0;
-roll_back:
-	if (!list_is_first(&tmp_adev->gmc.xgmi.head, &hive->device_list)) {
-		/*
-		 * if the lockup iteration break in the middle of a hive,
-		 * it may means there may has a race issue,
-		 * or a hive device locked up independently.
-		 * we may be in trouble and may not, so will try to roll back
-		 * the lock and give out a warnning.
-		 */
-		dev_warn(tmp_adev->dev, "Hive lock iteration broke in the middle. Rolling back to unlock");
-		list_for_each_entry_continue_reverse(tmp_adev, &hive->device_list, gmc.xgmi.head) {
-			amdgpu_device_unlock_adev(tmp_adev);
-		}
-	}
-	return -EAGAIN;
-}
-
-static void amdgpu_device_resume_display_audio(struct amdgpu_device *adev)
-{
-	struct pci_dev *p = NULL;
-
-	p = pci_get_domain_bus_and_slot(pci_domain_nr(adev->pdev->bus),
-			adev->pdev->bus->number, 1);
-	if (p) {
-		pm_runtime_enable(&(p->dev));
-		pm_runtime_resume(&(p->dev));
-	}
+	adev->in_gpu_reset = false;
+	mutex_unlock(&adev->lock_reset);
 }
 
-static int amdgpu_device_suspend_display_audio(struct amdgpu_device *adev)
-{
-	enum amd_reset_method reset_method;
-	struct pci_dev *p = NULL;
-	u64 expires;
-
-	/*
-	 * For now, only BACO and mode1 reset are confirmed
-	 * to suffer the audio issue without proper suspended.
-	 */
-	reset_method = amdgpu_asic_reset_method(adev);
-	if ((reset_method != AMD_RESET_METHOD_BACO) &&
-	     (reset_method != AMD_RESET_METHOD_MODE1))
-		return -EINVAL;
-
-	p = pci_get_domain_bus_and_slot(pci_domain_nr(adev->pdev->bus),
-			adev->pdev->bus->number, 1);
-	if (!p)
-		return -ENODEV;
-
-	expires = pm_runtime_autosuspend_expiration(&(p->dev));
-	if (!expires)
-		/*
-		 * If we cannot get the audio device autosuspend delay,
-		 * a fixed 4S interval will be used. Considering 3S is
-		 * the audio controller default autosuspend delay setting.
-		 * 4S used here is guaranteed to cover that.
-		 */
-		expires = ktime_get_mono_fast_ns() + NSEC_PER_SEC * 4ULL;
-
-	while (!pm_runtime_status_suspended(&(p->dev))) {
-		if (!pm_runtime_suspend(&(p->dev)))
-			break;
-
-		if (expires < ktime_get_mono_fast_ns()) {
-			dev_warn(adev->dev, "failed to suspend display audio\n");
-			/* TODO: abort the succeeding gpu reset? */
-			return -ETIMEDOUT;
-		}
-	}
-
-	pm_runtime_disable(&(p->dev));
-
-	return 0;
-}
-
-static void amdgpu_device_recheck_guilty_jobs(
-	struct amdgpu_device *adev, struct list_head *device_list_handle,
-	struct amdgpu_reset_context *reset_context)
+static void amdgpu_device_correct_karma(struct amdgpu_device *adev,
+			       struct amdgpu_hive_info *hive,
+			       struct list_head *device_list_handle,
+			       bool *need_full_reset)
 {
 	int i, r = 0;
 
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 		int ret = 0;
-		struct drm_sched_job *s_job;
+		struct drm_sched_job *s_job = NULL;
+		uint32_t original_hw_submission_limit;
+		struct amdgpu_job *job;
+		struct amdgpu_task_info ti;
 
 		if (!ring || !ring->sched.thread)
 			continue;
 
-		s_job = list_first_entry_or_null(&ring->sched.pending_list,
-				struct drm_sched_job, list);
-		if (s_job == NULL)
+		s_job = list_first_entry_or_null(&ring->sched.ring_mirror_list, struct drm_sched_job, node);
+		if (!s_job)
 			continue;
-
-		/* clear job's guilty and depend the folowing step to decide the real one */
 		drm_sched_reset_karma(s_job);
-		drm_sched_resubmit_jobs_ext(&ring->sched, 1);
+		original_hw_submission_limit = ring->sched.hw_submission_limit;
+		ring->sched.hw_submission_limit = 1;
+
+		drm_sched_resubmit_jobs(&ring->sched);
 
 		ret = dma_fence_wait_timeout(s_job->s_fence->parent, false, ring->sched.timeout);
 		if (ret == 0) { /* timeout */
-			DRM_ERROR("Found the real bad job! ring:%s, job_id:%llx\n",
-						ring->sched.name, s_job->id);
-
-			/* set guilty */
+			job = to_amdgpu_job(s_job);
+			memset(&ti, 0, sizeof(struct amdgpu_task_info));
+			amdgpu_vm_get_task_info(adev, job->pasid, &ti);
+			DRM_ERROR("ring %s timeout, signaled seq=%u, emitted seq=%u\n",
+				  s_job->sched->name, atomic_read(&ring->fence_drv.last_seq),
+				  ring->fence_drv.sync_seq);
+			DRM_ERROR("Process information: process %s pid %d thread %s pid %d\n",
+				  ti.process_name, ti.tgid, ti.task_name, ti.pid);
 			drm_sched_increase_karma(s_job);
 retry:
 			/* do hw reset */
 			if (amdgpu_sriov_vf(adev)) {
-				amdgpu_virt_fini_data_exchange(adev);
 				r = amdgpu_device_reset_sriov(adev, false);
 				if (r)
 					adev->asic_reset_res = r;
 			} else {
-				clear_bit(AMDGPU_SKIP_HW_RESET,
-					  &reset_context->flags);
-				r = amdgpu_do_asic_reset(device_list_handle,
-							 reset_context);
-				if (r && r == -EAGAIN)
-					goto retry;
+				r  = amdgpu_do_asic_reset(hive, device_list_handle, need_full_reset);
 			}
-
-			/*
-			 * add reset counter so that the following
-			 * resubmitted job could flush vmid
-			 */
+			if (r)
+				goto retry;
+			/* add reset counter so that the following resubmitted job could flush vmid */
 			atomic_inc(&adev->gpu_reset_counter);
-			continue;
+			drm_sched_resubmit_jobs(&ring->sched);
 		}
-
-		/* got the hw fence, signal finished fence */
-		atomic_dec(ring->sched.score);
-		dma_fence_get(&s_job->s_fence->finished);
-		dma_fence_signal(&s_job->s_fence->finished);
-		dma_fence_put(&s_job->s_fence->finished);
-
-		/* remove node from list and free the job */
-		spin_lock(&ring->sched.job_list_lock);
-		list_del_init(&s_job->list);
-		spin_unlock(&ring->sched.job_list_lock);
-		ring->sched.ops->free_job(s_job);
+		ring->sched.hw_submission_limit = original_hw_submission_limit;
+		ring->sched.skip_first_job = true;
 	}
 }
 
 /**
  * amdgpu_device_gpu_recover - reset the asic and recover scheduler
  *
- * @adev: amdgpu_device pointer
+ * @adev: amdgpu device pointer
  * @job: which job trigger hang
  *
  * Attempt to reset the GPU if it has hung (all asics).
@@ -4896,35 +4386,40 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 			      struct amdgpu_job *job)
 {
 	struct list_head device_list, *device_list_handle =  NULL;
-	bool job_signaled = false;
+	bool need_full_reset, job_signaled;
 	struct amdgpu_hive_info *hive = NULL;
 	struct amdgpu_device *tmp_adev = NULL;
 	int i, r = 0;
-	bool need_emergency_restart = false;
-	bool audio_suspended = false;
+	bool in_ras_intr = amdgpu_ras_intr_triggered();
+	bool use_baco =
+		(amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) ?
+		true : false;
 	int tmp_vram_lost_counter;
-	struct amdgpu_reset_context reset_context;
-
-	memset(&reset_context, 0, sizeof(reset_context));
-
-	/*
-	 * Special case: RAS triggered and full reset isn't supported
-	 */
-	need_emergency_restart = amdgpu_ras_need_emergency_restart(adev);
 
 	/*
 	 * Flush RAM to disk so that after reboot
 	 * the user can read log and see why the system rebooted.
 	 */
-	if (need_emergency_restart && amdgpu_ras_get_context(adev)->reboot) {
+	if (in_ras_intr && !use_baco && amdgpu_ras_get_context(adev)->reboot) {
+
 		DRM_WARN("Emergency reboot.");
 
 		ksys_sync_helper();
 		emergency_restart();
 	}
 
+	need_full_reset = job_signaled = false;
+	INIT_LIST_HEAD(&device_list);
+
+	amdgpu_ras_set_error_query_ready(adev, false);
+
 	dev_info(adev->dev, "GPU %s begin!\n",
-		need_emergency_restart ? "jobs stop":"reset");
+		(in_ras_intr && !use_baco) ? "jobs stop":"reset");
+
+	if (!amdgpu_sriov_vf(adev))
+		cancel_delayed_work_sync(&adev->delayed_init_work);
+
+	hive = amdgpu_get_xgmi_hive(adev, false);
 
 	/*
 	 * Here we trylock to avoid chain of resets executing from
@@ -4933,79 +4428,71 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	 * We always reset all schedulers for device and all devices for XGMI
 	 * hive so that should take care of them too.
 	 */
-	hive = amdgpu_get_xgmi_hive(adev);
-	if (hive) {
-		if (atomic_cmpxchg(&hive->in_reset, 0, 1) != 0) {
-			DRM_INFO("Bailing on TDR for s_job:%llx, hive: %llx as another already in progress",
-				job ? job->base.id : -1, hive->hive_id);
-			amdgpu_put_xgmi_hive(hive);
-			if (job && job->vm)
-				drm_sched_increase_karma(&job->base);
-			return 0;
+
+	if (hive && !mutex_trylock(&hive->reset_lock)) {
+		DRM_INFO("Bailing on TDR for s_job:%llx, hive: %llx as another already in progress",
+			  job ? job->base.id : -1, hive->hive_id);
+		if (job) {
+			if (&job->base) {
+				spin_lock(&job->base.sched->job_list_lock);
+				list_add(&job->base.node, &job->base.sched->ring_mirror_list);
+				spin_unlock(&job->base.sched->job_list_lock);
+			}
+			drm_sched_increase_karma(&job->base);
 		}
-		mutex_lock(&hive->hive_lock);
+		return 0;
 	}
 
-	reset_context.method = AMD_RESET_METHOD_NONE;
-	reset_context.reset_req_dev = adev;
-	reset_context.job = job;
-	reset_context.hive = hive;
-	clear_bit(AMDGPU_NEED_FULL_RESET, &reset_context.flags);
-
-	/*
-	 * lock the device before we try to operate the linked list
-	 * if didn't get the device lock, don't touch the linked list since
-	 * others may iterating it.
-	 */
-	r = amdgpu_device_lock_hive_adev(adev, hive);
-	if (r) {
-		dev_info(adev->dev, "Bailing on TDR for s_job:%llx, as another already in progress",
-					job ? job->base.id : -1);
-
-		/* even we skipped this reset, still need to set the job to guilty */
-		if (job && job->vm)
+	/* Start with adev pre asic reset first for soft reset check.*/
+	if (!amdgpu_device_lock_adev(adev, !hive)) {
+		DRM_INFO("Bailing on TDR for s_job:%llx, as another already in progress",
+			  job ? job->base.id : -1);
+		if (job) {
+			if (&job->base) {
+				spin_lock(&job->base.sched->job_list_lock);
+				list_add(&job->base.node, &job->base.sched->ring_mirror_list);
+				spin_unlock(&job->base.sched->job_list_lock);
+			}
 			drm_sched_increase_karma(&job->base);
-		goto skip_recovery;
+		}
+		return 0;
 	}
 
-	/*
-	 * Build list of devices to reset.
-	 * In case we are in XGMI hive mode, resort the device list
-	 * to put adev in the 1st position.
-	 */
-	INIT_LIST_HEAD(&device_list);
-	if (adev->gmc.xgmi.num_physical_nodes > 1) {
-		list_for_each_entry(tmp_adev, &hive->device_list, gmc.xgmi.head)
-			list_add_tail(&tmp_adev->reset_list, &device_list);
-		if (!list_is_first(&adev->reset_list, &device_list))
-			list_rotate_to_front(&adev->reset_list, &device_list);
-		device_list_handle = &device_list;
+	tmp_vram_lost_counter = atomic_read(&((adev)->vram_lost_counter));
+
+	/* Block kfd: SRIOV would do it separately */
+	if (!amdgpu_sriov_vf(adev))
+		amdgpu_amdkfd_pre_reset(adev);
+
+	/* Build list of devices to reset */
+	if  (adev->gmc.xgmi.num_physical_nodes > 1) {
+		if (!hive) {
+			/*unlock kfd: SRIOV would do it separately */
+			if (!amdgpu_sriov_vf(adev))
+				amdgpu_amdkfd_post_reset(adev);
+			amdgpu_device_unlock_adev(adev);
+			return -ENODEV;
+		}
+
+		/*
+		 * In case we are in XGMI hive mode device reset is done for all the
+		 * nodes in the hive to retrain all XGMI links and hence the reset
+		 * sequence is executed in loop on all nodes.
+		 */
+		device_list_handle = &hive->device_list;
 	} else {
-		list_add_tail(&adev->reset_list, &device_list);
+		list_add_tail(&adev->gmc.xgmi.head, &device_list);
 		device_list_handle = &device_list;
 	}
 
 	/* block all schedulers and reset given job's ring */
-	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
-		/*
-		 * Try to put the audio codec into suspend state
-		 * before gpu reset started.
-		 *
-		 * Due to the power domain of the graphics device
-		 * is shared with AZ power domain. Without this,
-		 * we may change the audio hardware from behind
-		 * the audio driver's back. That will trigger
-		 * some audio codec errors.
-		 */
-		if (!amdgpu_device_suspend_display_audio(tmp_adev))
-			audio_suspended = true;
-
-		amdgpu_ras_set_error_query_ready(tmp_adev, false);
-
-		cancel_delayed_work_sync(&tmp_adev->delayed_init_work);
-
-		if (!amdgpu_sriov_vf(tmp_adev))
-			amdgpu_amdkfd_pre_reset(tmp_adev);
+	list_for_each_entry(tmp_adev, device_list_handle, gmc.xgmi.head) {
+		if (tmp_adev != adev) {
+			amdgpu_ras_set_error_query_ready(tmp_adev, false);
+			amdgpu_device_lock_adev(tmp_adev, false);
+			if (!amdgpu_sriov_vf(tmp_adev))
+				amdgpu_amdkfd_pre_reset(tmp_adev);
+		}
 
 		/*
 		 * Mark these ASICs to be reseted as untracked first
@@ -5013,10 +4500,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		 */
 		amdgpu_unregister_gpu_instance(tmp_adev);
 
-		amdgpu_fbdev_set_suspend(tmp_adev, 1);
+		amdgpu_fbdev_set_suspend(adev, 1);
 
 		/* disable ras on ALL IPs */
-		if (!need_emergency_restart &&
+		if (!(in_ras_intr && !use_baco) &&
 		      amdgpu_device_ip_need_full_reset(tmp_adev))
 			amdgpu_ras_suspend(tmp_adev);
 
@@ -5028,13 +4515,14 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 
 			drm_sched_stop(&ring->sched, job ? &job->base : NULL);
 
-			if (need_emergency_restart)
+			if (in_ras_intr && !use_baco)
 				amdgpu_job_stop_all_jobs_on_sched(&ring->sched);
 		}
 		atomic_inc(&tmp_adev->gpu_reset_counter);
 	}
 
-	if (need_emergency_restart)
+
+	if (in_ras_intr && !use_baco)
 		goto skip_sched_resume;
 
 	/*
@@ -5044,24 +4532,41 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	 * job->base holds a reference to parent fence
 	 */
 	if (job && job->base.s_fence->parent &&
-	    dma_fence_is_signaled(job->base.s_fence->parent)) {
+	    dma_fence_is_signaled(job->base.s_fence->parent))
 		job_signaled = true;
+
+	if (job_signaled) {
 		dev_info(adev->dev, "Guilty job already signaled, skipping HW reset");
 		goto skip_hw_reset;
 	}
 
+
+	/* Guilty job will be freed after this*/
+	r = amdgpu_device_pre_asic_reset(adev, job, &need_full_reset);
+	if (r) {
+		/*TODO Should we stop ?*/
+		DRM_ERROR("GPU pre asic reset failed with err, %d for drm dev, %s ",
+			  r, adev->ddev->unique);
+		adev->asic_reset_res = r;
+	}
+
 retry:	/* Rest of adevs pre asic reset from XGMI hive. */
-	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
-		r = amdgpu_device_pre_asic_reset(tmp_adev, &reset_context);
+	list_for_each_entry(tmp_adev, device_list_handle, gmc.xgmi.head) {
+
+		if (tmp_adev == adev)
+			continue;
+
+		r = amdgpu_device_pre_asic_reset(tmp_adev,
+						 NULL,
+						 &need_full_reset);
 		/*TODO Should we stop ?*/
 		if (r) {
-			dev_err(tmp_adev->dev, "GPU pre asic reset failed with err, %d for drm dev, %s ",
-				  r, adev_to_drm(tmp_adev)->unique);
+			DRM_ERROR("GPU pre asic reset failed with err, %d for drm dev, %s ",
+				  r, tmp_adev->ddev->unique);
 			tmp_adev->asic_reset_res = r;
 		}
 	}
 
-	tmp_vram_lost_counter = atomic_read(&((adev)->vram_lost_counter));
 	/* Actual ASIC resets if needed.*/
 	/* TODO Implement XGMI hive reset logic for SRIOV */
 	if (amdgpu_sriov_vf(adev)) {
@@ -5069,7 +4574,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		if (r)
 			adev->asic_reset_res = r;
 	} else {
-		r = amdgpu_do_asic_reset(device_list_handle, &reset_context);
+		r  = amdgpu_do_asic_reset(hive, device_list_handle, &need_full_reset);
 		if (r && r == -EAGAIN)
 			goto retry;
 	}
@@ -5077,19 +4582,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 skip_hw_reset:
 
 	/* Post ASIC reset for all devs .*/
-	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
-
-		/*
-		 * Sometimes a later bad compute job can block a good gfx job as gfx
-		 * and compute ring share internal GC HW mutually. We add an additional
-		 * guilty jobs recheck step to find the real guilty job, it synchronously
-		 * submits and pends for the first job being signaled. If it gets timeout,
-		 * we identify it as a real guilty job.
-		 */
-		if (amdgpu_gpu_recovery == 2 &&
-			!(tmp_vram_lost_counter < atomic_read(&adev->vram_lost_counter)))
-			amdgpu_device_recheck_guilty_jobs(
-				tmp_adev, device_list_handle, &reset_context);
+	list_for_each_entry(tmp_adev, device_list_handle, gmc.xgmi.head) {
+		if ((tmp_vram_lost_counter == atomic_read(&adev->vram_lost_counter)) &&
+			(!tmp_adev->asic_reset_res && !job_signaled))
+			amdgpu_device_correct_karma(tmp_adev, hive, device_list_handle, &need_full_reset);
 
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = tmp_adev->rings[i];
@@ -5102,10 +4598,12 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 				drm_sched_resubmit_jobs(&ring->sched);
 
 			drm_sched_start(&ring->sched, !tmp_adev->asic_reset_res);
+			if (tmp_vram_lost_counter == atomic_read(&adev->vram_lost_counter))
+				ring->sched.skip_first_job = false;
 		}
 
 		if (!amdgpu_device_has_dc_support(tmp_adev) && !job_signaled) {
-			drm_helper_resume_force_mode(adev_to_drm(tmp_adev));
+			drm_helper_resume_force_mode(tmp_adev->ddev);
 		}
 
 		tmp_adev->asic_reset_res = 0;
@@ -5116,36 +4614,21 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 			amdgpu_vf_error_put(tmp_adev, AMDGIM_ERROR_VF_GPU_RESET_FAIL, 0, r);
 		} else {
 			dev_info(tmp_adev->dev, "GPU reset(%d) succeeded!\n", atomic_read(&tmp_adev->gpu_reset_counter));
-			if (amdgpu_acpi_smart_shift_update(adev_to_drm(tmp_adev), AMDGPU_SS_DEV_D0))
-				DRM_WARN("smart shift update failed\n");
 		}
 	}
 
 skip_sched_resume:
-	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
-		/* unlock kfd: SRIOV would do it separately */
-		if (!need_emergency_restart && !amdgpu_sriov_vf(tmp_adev))
+	list_for_each_entry(tmp_adev, device_list_handle, gmc.xgmi.head) {
+		/*unlock kfd: SRIOV would do it separately */
+		if (!(in_ras_intr && !use_baco) && !amdgpu_sriov_vf(tmp_adev))
 	                amdgpu_amdkfd_post_reset(tmp_adev);
-
-		/* kfd_post_reset will do nothing if kfd device is not initialized,
-		 * need to bring up kfd here if it's not be initialized before
-		 */
-		if (!adev->kfd.init_complete)
-			amdgpu_amdkfd_device_init(adev);
-
-		if (audio_suspended)
-			amdgpu_device_resume_display_audio(tmp_adev);
 		amdgpu_device_unlock_adev(tmp_adev);
 	}
 
-skip_recovery:
-	if (hive) {
-		atomic_set(&hive->in_reset, 0);
-		mutex_unlock(&hive->hive_lock);
-		amdgpu_put_xgmi_hive(hive);
-	}
+	if (hive)
+		mutex_unlock(&hive->reset_lock);
 
-	if (r && r != -EAGAIN)
+	if (r)
 		dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
 	return r;
 }
@@ -5195,13 +4678,7 @@ static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev)
 						  CAIL_ASIC_PCIE_LINK_SPEED_SUPPORT_GEN2 |
 						  CAIL_ASIC_PCIE_LINK_SPEED_SUPPORT_GEN3);
 		} else {
-			if (speed_cap == PCIE_SPEED_32_0GT)
-				adev->pm.pcie_gen_mask |= (CAIL_ASIC_PCIE_LINK_SPEED_SUPPORT_GEN1 |
-							  CAIL_ASIC_PCIE_LINK_SPEED_SUPPORT_GEN2 |
-							  CAIL_ASIC_PCIE_LINK_SPEED_SUPPORT_GEN3 |
-							  CAIL_ASIC_PCIE_LINK_SPEED_SUPPORT_GEN4 |
-							  CAIL_ASIC_PCIE_LINK_SPEED_SUPPORT_GEN5);
-			else if (speed_cap == PCIE_SPEED_16_0GT)
+			if (speed_cap == PCIE_SPEED_16_0GT)
 				adev->pm.pcie_gen_mask |= (CAIL_ASIC_PCIE_LINK_SPEED_SUPPORT_GEN1 |
 							  CAIL_ASIC_PCIE_LINK_SPEED_SUPPORT_GEN2 |
 							  CAIL_ASIC_PCIE_LINK_SPEED_SUPPORT_GEN3 |
@@ -5221,13 +4698,7 @@ static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev)
 			adev->pm.pcie_gen_mask |= (CAIL_PCIE_LINK_SPEED_SUPPORT_GEN1 |
 						   CAIL_PCIE_LINK_SPEED_SUPPORT_GEN2);
 		} else {
-			if (platform_speed_cap == PCIE_SPEED_32_0GT)
-				adev->pm.pcie_gen_mask |= (CAIL_PCIE_LINK_SPEED_SUPPORT_GEN1 |
-							   CAIL_PCIE_LINK_SPEED_SUPPORT_GEN2 |
-							   CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3 |
-							   CAIL_PCIE_LINK_SPEED_SUPPORT_GEN4 |
-							   CAIL_PCIE_LINK_SPEED_SUPPORT_GEN5);
-			else if (platform_speed_cap == PCIE_SPEED_16_0GT)
+			if (platform_speed_cap == PCIE_SPEED_16_0GT)
 				adev->pm.pcie_gen_mask |= (CAIL_PCIE_LINK_SPEED_SUPPORT_GEN1 |
 							   CAIL_PCIE_LINK_SPEED_SUPPORT_GEN2 |
 							   CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3 |
@@ -5298,16 +4769,39 @@ static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev)
 	}
 }
 
+/**
+ * amdgpu_device_is_peer_accessible - Check peer access through PCIe BAR
+ *
+ * @adev: amdgpu_device pointer
+ * @peer_adev: amdgpu_device pointer for peer device trying to access @adev
+ *
+ * Return true if @peer_adev can access (DMA) @adev through the PCIe
+ * BAR, i.e. @adev is "large BAR" and the BAR matches the DMA mask of
+ * @peer_adev.
+ */
+bool amdgpu_device_is_peer_accessible(struct amdgpu_device *adev,
+				      struct amdgpu_device *peer_adev)
+{
+	uint64_t address_mask = peer_adev->dev->dma_mask ?
+		~*peer_adev->dev->dma_mask : ~((1ULL << 32) - 1);
+	resource_size_t aper_limit =
+		adev->gmc.aper_base + adev->gmc.aper_size - 1;
+
+	return adev->gmc.visible_vram_size &&
+		adev->gmc.real_vram_size == adev->gmc.visible_vram_size &&
+		!(adev->gmc.aper_base & address_mask ||
+		  aper_limit & address_mask);
+}
+
 int amdgpu_device_baco_enter(struct drm_device *dev)
 {
-	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct amdgpu_device *adev = dev->dev_private;
 	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
 
-	if (!amdgpu_device_supports_baco(adev_to_drm(adev)))
+	if (!amdgpu_device_supports_baco(adev->ddev))
 		return -ENOTSUPP;
 
-	if (ras && adev->ras_enabled &&
-	    adev->nbio.funcs->enable_doorbell_interrupt)
+	if (ras && ras->supported)
 		adev->nbio.funcs->enable_doorbell_interrupt(adev, false);
 
 	return amdgpu_dpm_baco_enter(adev);
@@ -5315,290 +4809,19 @@ int amdgpu_device_baco_enter(struct drm_device *dev)
 
 int amdgpu_device_baco_exit(struct drm_device *dev)
 {
-	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct amdgpu_device *adev = dev->dev_private;
 	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
 	int ret = 0;
 
-	if (!amdgpu_device_supports_baco(adev_to_drm(adev)))
+	if (!amdgpu_device_supports_baco(adev->ddev))
 		return -ENOTSUPP;
 
 	ret = amdgpu_dpm_baco_exit(adev);
 	if (ret)
 		return ret;
 
-	if (ras && adev->ras_enabled &&
-	    adev->nbio.funcs->enable_doorbell_interrupt)
+	if (ras && ras->supported)
 		adev->nbio.funcs->enable_doorbell_interrupt(adev, true);
 
-	if (amdgpu_passthrough(adev) &&
-	    adev->nbio.funcs->clear_doorbell_interrupt)
-		adev->nbio.funcs->clear_doorbell_interrupt(adev);
-
 	return 0;
 }
-
-static void amdgpu_cancel_all_tdr(struct amdgpu_device *adev)
-{
-	int i;
-
-	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
-		struct amdgpu_ring *ring = adev->rings[i];
-
-		if (!ring || !ring->sched.thread)
-			continue;
-
-		cancel_delayed_work_sync(&ring->sched.work_tdr);
-	}
-}
-
-/**
- * amdgpu_pci_error_detected - Called when a PCI error is detected.
- * @pdev: PCI device struct
- * @state: PCI channel state
- *
- * Description: Called when a PCI error is detected.
- *
- * Return: PCI_ERS_RESULT_NEED_RESET or PCI_ERS_RESULT_DISCONNECT.
- */
-pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
-{
-	struct drm_device *dev = pci_get_drvdata(pdev);
-	struct amdgpu_device *adev = drm_to_adev(dev);
-	int i;
-
-	DRM_INFO("PCI error: detected callback, state(%d)!!\n", state);
-
-	if (adev->gmc.xgmi.num_physical_nodes > 1) {
-		DRM_WARN("No support for XGMI hive yet...");
-		return PCI_ERS_RESULT_DISCONNECT;
-	}
-
-	switch (state) {
-	case pci_channel_io_normal:
-		return PCI_ERS_RESULT_CAN_RECOVER;
-	/* Fatal error, prepare for slot reset */
-	case pci_channel_io_frozen:
-		/*
-		 * Cancel and wait for all TDRs in progress if failing to
-		 * set  adev->in_gpu_reset in amdgpu_device_lock_adev
-		 *
-		 * Locking adev->reset_sem will prevent any external access
-		 * to GPU during PCI error recovery
-		 */
-		while (!amdgpu_device_lock_adev(adev, NULL))
-			amdgpu_cancel_all_tdr(adev);
-
-		/*
-		 * Block any work scheduling as we do for regular GPU reset
-		 * for the duration of the recovery
-		 */
-		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
-			struct amdgpu_ring *ring = adev->rings[i];
-
-			if (!ring || !ring->sched.thread)
-				continue;
-
-			drm_sched_stop(&ring->sched, NULL);
-		}
-		atomic_inc(&adev->gpu_reset_counter);
-		return PCI_ERS_RESULT_NEED_RESET;
-	case pci_channel_io_perm_failure:
-		/* Permanent error, prepare for device removal */
-		return PCI_ERS_RESULT_DISCONNECT;
-	}
-
-	return PCI_ERS_RESULT_NEED_RESET;
-}
-
-/**
- * amdgpu_pci_mmio_enabled - Enable MMIO and dump debug registers
- * @pdev: pointer to PCI device
- */
-pci_ers_result_t amdgpu_pci_mmio_enabled(struct pci_dev *pdev)
-{
-
-	DRM_INFO("PCI error: mmio enabled callback!!\n");
-
-	/* TODO - dump whatever for debugging purposes */
-
-	/* This called only if amdgpu_pci_error_detected returns
-	 * PCI_ERS_RESULT_CAN_RECOVER. Read/write to the device still
-	 * works, no need to reset slot.
-	 */
-
-	return PCI_ERS_RESULT_RECOVERED;
-}
-
-/**
- * amdgpu_pci_slot_reset - Called when PCI slot has been reset.
- * @pdev: PCI device struct
- *
- * Description: This routine is called by the pci error recovery
- * code after the PCI slot has been reset, just before we
- * should resume normal operations.
- */
-pci_ers_result_t amdgpu_pci_slot_reset(struct pci_dev *pdev)
-{
-	struct drm_device *dev = pci_get_drvdata(pdev);
-	struct amdgpu_device *adev = drm_to_adev(dev);
-	int r, i;
-	struct amdgpu_reset_context reset_context;
-	u32 memsize;
-	struct list_head device_list;
-
-	DRM_INFO("PCI error: slot reset callback!!\n");
-
-	memset(&reset_context, 0, sizeof(reset_context));
-
-	INIT_LIST_HEAD(&device_list);
-	list_add_tail(&adev->reset_list, &device_list);
-
-	/* wait for asic to come out of reset */
-	msleep(500);
-
-	/* Restore PCI confspace */
-	amdgpu_device_load_pci_state(pdev);
-
-	/* confirm  ASIC came out of reset */
-	for (i = 0; i < adev->usec_timeout; i++) {
-		memsize = amdgpu_asic_get_config_memsize(adev);
-
-		if (memsize != 0xffffffff)
-			break;
-		udelay(1);
-	}
-	if (memsize == 0xffffffff) {
-		r = -ETIME;
-		goto out;
-	}
-
-	reset_context.method = AMD_RESET_METHOD_NONE;
-	reset_context.reset_req_dev = adev;
-	set_bit(AMDGPU_NEED_FULL_RESET, &reset_context.flags);
-	set_bit(AMDGPU_SKIP_HW_RESET, &reset_context.flags);
-
-	adev->no_hw_access = true;
-	r = amdgpu_device_pre_asic_reset(adev, &reset_context);
-	adev->no_hw_access = false;
-	if (r)
-		goto out;
-
-	r = amdgpu_do_asic_reset(&device_list, &reset_context);
-
-out:
-	if (!r) {
-		if (amdgpu_device_cache_pci_state(adev->pdev))
-			pci_restore_state(adev->pdev);
-
-		DRM_INFO("PCIe error recovery succeeded\n");
-	} else {
-		DRM_ERROR("PCIe error recovery failed, err:%d", r);
-		amdgpu_device_unlock_adev(adev);
-	}
-
-	return r ? PCI_ERS_RESULT_DISCONNECT : PCI_ERS_RESULT_RECOVERED;
-}
-
-/**
- * amdgpu_pci_resume() - resume normal ops after PCI reset
- * @pdev: pointer to PCI device
- *
- * Called when the error recovery driver tells us that its
- * OK to resume normal operation.
- */
-void amdgpu_pci_resume(struct pci_dev *pdev)
-{
-	struct drm_device *dev = pci_get_drvdata(pdev);
-	struct amdgpu_device *adev = drm_to_adev(dev);
-	int i;
-
-
-	DRM_INFO("PCI error: resume callback!!\n");
-
-	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
-		struct amdgpu_ring *ring = adev->rings[i];
-
-		if (!ring || !ring->sched.thread)
-			continue;
-
-
-		drm_sched_resubmit_jobs(&ring->sched);
-		drm_sched_start(&ring->sched, true);
-	}
-
-	amdgpu_device_unlock_adev(adev);
-}
-
-bool amdgpu_device_cache_pci_state(struct pci_dev *pdev)
-{
-	struct drm_device *dev = pci_get_drvdata(pdev);
-	struct amdgpu_device *adev = drm_to_adev(dev);
-	int r;
-
-	r = pci_save_state(pdev);
-	if (!r) {
-		kfree(adev->pci_state);
-
-		adev->pci_state = pci_store_saved_state(pdev);
-
-		if (!adev->pci_state) {
-			DRM_ERROR("Failed to store PCI saved state");
-			return false;
-		}
-	} else {
-		DRM_WARN("Failed to save PCI state, err:%d\n", r);
-		return false;
-	}
-
-	return true;
-}
-
-bool amdgpu_device_load_pci_state(struct pci_dev *pdev)
-{
-	struct drm_device *dev = pci_get_drvdata(pdev);
-	struct amdgpu_device *adev = drm_to_adev(dev);
-	int r;
-
-	if (!adev->pci_state)
-		return false;
-
-	r = pci_load_saved_state(pdev, adev->pci_state);
-
-	if (!r) {
-		pci_restore_state(pdev);
-	} else {
-		DRM_WARN("Failed to load PCI state, err:%d\n", r);
-		return false;
-	}
-
-	return true;
-}
-
-void amdgpu_device_flush_hdp(struct amdgpu_device *adev,
-		struct amdgpu_ring *ring)
-{
-#ifdef CONFIG_X86_64
-	if (adev->flags & AMD_IS_APU)
-		return;
-#endif
-	if (adev->gmc.xgmi.connected_to_cpu)
-		return;
-
-	if (ring && ring->funcs->emit_hdp_flush)
-		amdgpu_ring_emit_hdp_flush(ring);
-	else
-		amdgpu_asic_flush_hdp(adev, ring);
-}
-
-void amdgpu_device_invalidate_hdp(struct amdgpu_device *adev,
-		struct amdgpu_ring *ring)
-{
-#ifdef CONFIG_X86_64
-	if (adev->flags & AMD_IS_APU)
-		return;
-#endif
-	if (adev->gmc.xgmi.connected_to_cpu)
-		return;
-
-	amdgpu_asic_invalidate_hdp(adev, ring);
-}
-- 
2.17.1

