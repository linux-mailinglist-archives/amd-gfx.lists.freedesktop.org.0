Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF553F7B89
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Aug 2021 19:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C766E3E5;
	Wed, 25 Aug 2021 17:27:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73ADF6E3E5
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Aug 2021 17:27:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cqb/3ivVkiseJZLoCRnFjajpczosEENQJavjalwC/sABRWGF6YolqxsVrKzRA6u28wtyUFMqi5JLLVWXD6+otKtpAEPFj6LaB3It/AccVXM+UsfZtDsRJDiDfO3vPY3Z2Q4fZKeFlwHkNdE83lCgyc1qarfJRwSeKoAnkS0K95vlBTqSSfVryALX2zMXRnYJxp3OXbU+GNKAlC07+TNtEkwlwwVRzir27wPDhtwWPMHTRHvHEia5t2EcntNGRmp/v5UKb1pRLcyvldEug9bvcYE7n79MDIAetpvdkzedTQIhtN2EvfWBkSBVWkXlEOi7TcC4e+BssMpvC5gZWlYong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/hxaLfbM7TcWOjc33v4C82DMHIj4Jxo40iV0r57nJs=;
 b=Z+j0rdZYPKGdXNP5x23lB+2yADykEBYPiHVMZ9MTEICWQA+srh/cjWEXi1SxzSZ5j2ojh5XbWXoII+/Yx8JK1MNlmYmVcnGru+DZv7Tg0a+/KH7yJdYbsvEYEIKIeGwVtAQFopwR2yuTaY16kqEo+RhGEKsU2gAWPSwYXxbgImHtDfKHZLhIL84L7i/tMGCHk/uW2lOBfc2S1SIGuXvTPoiskuaBMEPZh0AlRqvvZSU6iZRHAGudCjxzuHWGWd86osiwhNQxyvPq6XZrjBo//p7nRxD+L9KamWEJbmwZhFNKh1A3R9e3niHo4JX5rC9gwJFbXr6npuB/Ee8bvzF25w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/hxaLfbM7TcWOjc33v4C82DMHIj4Jxo40iV0r57nJs=;
 b=Rm9hkKiwrfQtGuXPrdc+02Ed+8ZeUfFKGCQ0hXigqn9Q8uXNEJ25i8TdPcujS+haEay/ivlgZE7VBOh+aD1TLo99CN1vFuJO4rJCXu5QqGWso8viJhSIiJ+RKIryZVsxkDaAm7sl6bcbbo69mQCSeu7G9t+LOhaZKitfUplwcf8=
Received: from BN6PR21CA0002.namprd21.prod.outlook.com (2603:10b6:404:8e::12)
 by DM4PR12MB5310.namprd12.prod.outlook.com (2603:10b6:5:39e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Wed, 25 Aug
 2021 17:27:07 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:8e:cafe::56) by BN6PR21CA0002.outlook.office365.com
 (2603:10b6:404:8e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.1 via Frontend
 Transport; Wed, 25 Aug 2021 17:27:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 17:27:06 +0000
Received: from ws.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 25 Aug
 2021 12:27:05 -0500
From: Tom St Denis <tom.stdenis@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Tom St Denis <tom.stdenis@amd.com>
Subject: [PATCH] drm/amd/amdgpu: New debugfs interface for MMIO registers (v5)
Date: Wed, 25 Aug 2021 13:26:59 -0400
Message-ID: <20210825172659.247530-1-tom.stdenis@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04a672e3-44ae-44aa-5829-08d967ed8fe4
X-MS-TrafficTypeDiagnostic: DM4PR12MB5310:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5310ECF6FA11305C4FA5E1B9F7C69@DM4PR12MB5310.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WluxtYXEP4EVFFnbhdX3EpVexPmdh3eX/bbFH7+a7v6utzfyGnMs6zHPVCPOKj+whoOr96iO5t8Yj0hIkBHGVqdMb10smd1cFx8Evk6iI2sBIagBgQqiHmPM0dtZqq/vMWHEQHEKZAqMl7z2xR7UBG0ldp5jyRQhgBEsqm6ltgF0n/E+1L7K2bO6CwuhreF6zbLVQr9de74TNvfh/4UMHCvLRQ05v7GH1moCDfZmhMa9NXjlPrL4YI6WxvC1Gko6J/5lM6g99uGyd4U+NaVI2EEg5CmpDXTyS5/8Y+RMXfBOOYYxyF+3OJofjB1oKNXb7PAG1nfbhh4JowKtl9PLJ1I2ek9PuNEVyq4IuTV3lUPcz66bdnfdTlZWN8+3MoWkTQATX8iFx/PFQ64fd+b/B1818wH2lmH13tcOoAtgjPDkXWwTV6t6ojj8B2FyqeiU+qANL/wkNaebqX0k0xOtUGdeClUYtQgDP0C2Czs/zvzrKYT+yoBRZpufXRhqPih7rEyrbdSf234+9FsxUFauyqYjvFsInCQ4Zi2iZ29wR6h8bSDDKq04qLjFoTP465uvEhM9s6Xu+NTFMoUUWdptR4tZ18tjfa+nzIe2qw6l1FaIPyFnHtWhXKgojR0rHAuvtTBwQU7IrSduLJ4p1zcOL86kd52G+qKQecd/1lhT/9V4ybu7jpKdKxsf+B5ANbUQOwivd0OF52KWTZoBg8XSOJ3GvxJtiV3NsVzLoHv9WFw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(36840700001)(46966006)(1076003)(82740400003)(426003)(8676002)(6666004)(70206006)(16526019)(336012)(26005)(356005)(186003)(70586007)(4326008)(7696005)(82310400003)(2906002)(86362001)(2616005)(478600001)(83380400001)(6916009)(316002)(36860700001)(8936002)(47076005)(36756003)(81166007)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 17:27:06.8222 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a672e3-44ae-44aa-5829-08d967ed8fe4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5310
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

This new debugfs interface uses an IOCTL interface in order to pass
along state information like SRBM and GRBM bank switching.  This
new interface also allows a full 32-bit MMIO address range which
the previous didn't.  With this new design we have room to grow
the flexibility of the file as need be.

(v2): Move read/write to .read/.write, fix style, add comment
      for IOCTL data structure

(v3): C style comments

(v4): use u32 in struct and remove offset variable

(v5): Drop flag clearing in op function, use 0xFFFFFFFF for broadcast
      instead of 0x3FF, use mutex for op/ioctl.

Signed-off-by: Tom St Denis <tom.stdenis@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 150 ++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h     |  51 +++++++
 3 files changed, 201 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 277128846dd1..87766fef0b1c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -36,6 +36,7 @@
 #include "amdgpu_rap.h"
 #include "amdgpu_securedisplay.h"
 #include "amdgpu_fw_attestation.h"
+#include "amdgpu_umr.h"
 
 int amdgpu_debugfs_wait_dump(struct amdgpu_device *adev)
 {
@@ -279,6 +280,143 @@ static ssize_t amdgpu_debugfs_regs_write(struct file *f, const char __user *buf,
 	return amdgpu_debugfs_process_reg_op(false, f, (char __user *)buf, size, pos);
 }
 
+static int amdgpu_debugfs_regs2_open(struct inode *inode, struct file *file)
+{
+	struct amdgpu_debugfs_regs2_data *rd;
+
+	rd = kzalloc(sizeof *rd, GFP_KERNEL);
+	if (!rd)
+		return -ENOMEM;
+	rd->adev = file_inode(file)->i_private;
+	file->private_data = rd;
+	mutex_init(&rd->lock);
+
+	return 0;
+}
+
+static int amdgpu_debugfs_regs2_release(struct inode *inode, struct file *file)
+{
+	kfree(file->private_data);
+	return 0;
+}
+
+static ssize_t amdgpu_debugfs_regs2_op(struct file *f, char __user *buf, u32 offset, size_t size, int write_en)
+{
+	struct amdgpu_debugfs_regs2_data *rd = f->private_data;
+	struct amdgpu_device *adev = rd->adev;
+	ssize_t result = 0;
+	int r;
+	uint32_t value;
+
+	if (size & 0x3 || offset & 0x3)
+		return -EINVAL;
+
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
+	if (r < 0) {
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		return r;
+	}
+
+	r = amdgpu_virt_enable_access_debugfs(adev);
+	if (r < 0) {
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+		return r;
+	}
+
+	mutex_lock(&rd->lock);
+
+	if (rd->id.use_grbm) {
+		if ((rd->id.grbm.sh != 0xFFFFFFFF && rd->id.grbm.sh >= adev->gfx.config.max_sh_per_se) ||
+		    (rd->id.grbm.se != 0xFFFFFFFF && rd->id.grbm.se >= adev->gfx.config.max_shader_engines)) {
+			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+			amdgpu_virt_disable_access_debugfs(adev);
+			mutex_unlock(&rd->lock);
+			return -EINVAL;
+		}
+		mutex_lock(&adev->grbm_idx_mutex);
+		amdgpu_gfx_select_se_sh(adev, rd->id.grbm.se,
+								rd->id.grbm.sh,
+								rd->id.grbm.instance);
+	}
+
+	if (rd->id.use_srbm) {
+		mutex_lock(&adev->srbm_mutex);
+		amdgpu_gfx_select_me_pipe_q(adev, rd->id.srbm.me, rd->id.srbm.pipe,
+									rd->id.srbm.queue, rd->id.srbm.vmid);
+	}
+
+	if (rd->id.pg_lock)
+		mutex_lock(&adev->pm.mutex);
+
+	while (size) {
+		if (!write_en) {
+			value = RREG32(offset >> 2);
+			r = put_user(value, (uint32_t *)buf);
+		} else {
+			r = get_user(value, (uint32_t *)buf);
+			if (!r)
+				amdgpu_mm_wreg_mmio_rlc(adev, offset >> 2, value);
+		}
+		if (r) {
+			result = r;
+			goto end;
+		}
+		offset += 4;
+		size -= 4;
+		result += 4;
+		buf += 4;
+	}
+end:
+	if (rd->id.use_grbm) {
+		amdgpu_gfx_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
+		mutex_unlock(&adev->grbm_idx_mutex);
+	}
+
+	if (rd->id.use_srbm) {
+		amdgpu_gfx_select_me_pipe_q(adev, 0, 0, 0, 0);
+		mutex_unlock(&adev->srbm_mutex);
+	}
+
+	if (rd->id.pg_lock)
+		mutex_unlock(&adev->pm.mutex);
+
+	mutex_unlock(&rd->lock);
+
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
+
+	amdgpu_virt_disable_access_debugfs(adev);
+	return result;
+}
+
+static long amdgpu_debugfs_regs2_ioctl(struct file *f, unsigned int cmd, unsigned long data)
+{
+	struct amdgpu_debugfs_regs2_data *rd = f->private_data;
+	int r;
+
+	switch (cmd) {
+	case AMDGPU_DEBUGFS_REGS2_IOC_SET_STATE:
+		mutex_lock(&rd->lock);
+		r = copy_from_user(&rd->id, (struct amdgpu_debugfs_regs2_iocdata *)data, sizeof rd->id);
+		mutex_unlock(&rd->lock);
+		return r ? -EINVAL : 0;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static ssize_t amdgpu_debugfs_regs2_read(struct file *f, char __user *buf, size_t size, loff_t *pos)
+{
+	return amdgpu_debugfs_regs2_op(f, buf, *pos, size, 0);
+}
+
+static ssize_t amdgpu_debugfs_regs2_write(struct file *f, const char __user *buf, size_t size, loff_t *pos)
+{
+	return amdgpu_debugfs_regs2_op(f, (char __user *)buf, *pos, size, 1);
+}
+
 
 /**
  * amdgpu_debugfs_regs_pcie_read - Read from a PCIE register
@@ -1091,6 +1229,16 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct file *f, char __user *buf,
 	return result;
 }
 
+static const struct file_operations amdgpu_debugfs_regs2_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = amdgpu_debugfs_regs2_ioctl,
+	.read = amdgpu_debugfs_regs2_read,
+	.write = amdgpu_debugfs_regs2_write,
+	.open = amdgpu_debugfs_regs2_open,
+	.release = amdgpu_debugfs_regs2_release,
+	.llseek = default_llseek
+};
+
 static const struct file_operations amdgpu_debugfs_regs_fops = {
 	.owner = THIS_MODULE,
 	.read = amdgpu_debugfs_regs_read,
@@ -1148,6 +1296,7 @@ static const struct file_operations amdgpu_debugfs_gfxoff_fops = {
 
 static const struct file_operations *debugfs_regs[] = {
 	&amdgpu_debugfs_regs_fops,
+	&amdgpu_debugfs_regs2_fops,
 	&amdgpu_debugfs_regs_didt_fops,
 	&amdgpu_debugfs_regs_pcie_fops,
 	&amdgpu_debugfs_regs_smc_fops,
@@ -1160,6 +1309,7 @@ static const struct file_operations *debugfs_regs[] = {
 
 static const char *debugfs_regs_names[] = {
 	"amdgpu_regs",
+	"amdgpu_regs2",
 	"amdgpu_regs_didt",
 	"amdgpu_regs_pcie",
 	"amdgpu_regs_smc",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
index 141a8474e24f..6d4965b2d01e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
@@ -22,7 +22,6 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  *
  */
-
 /*
  * Debugfs
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h
new file mode 100644
index 000000000000..919d9d401750
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h
@@ -0,0 +1,51 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+#include <linux/ioctl.h>
+
+/*
+ * MMIO debugfs IOCTL structure
+ */
+struct amdgpu_debugfs_regs2_iocdata {
+	__u32 use_srbm, use_grbm, pg_lock;
+	struct {
+		__u32 se, sh, instance;
+	} grbm;
+	struct {
+		__u32 me, pipe, queue, vmid;
+	} srbm;
+};
+
+/*
+ * MMIO debugfs state data (per file* handle)
+ */
+struct amdgpu_debugfs_regs2_data {
+	struct amdgpu_device *adev;
+	struct mutex lock;
+	struct amdgpu_debugfs_regs2_iocdata id;
+};
+
+enum AMDGPU_DEBUGFS_REGS2_CMDS {
+	AMDGPU_DEBUGFS_REGS2_CMD_SET_STATE=0,
+};
+
+#define AMDGPU_DEBUGFS_REGS2_IOC_SET_STATE _IOWR(0x20, AMDGPU_DEBUGFS_REGS2_CMD_SET_STATE, struct amdgpu_debugfs_regs2_iocdata)
-- 
2.31.1

