Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25124537B8B
	for <lists+amd-gfx@lfdr.de>; Mon, 30 May 2022 15:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AA810E87E;
	Mon, 30 May 2022 13:27:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E92910E87E;
 Mon, 30 May 2022 13:27:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C138E60EC3;
 Mon, 30 May 2022 13:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7A4C36AE7;
 Mon, 30 May 2022 13:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917234;
 bh=YKSYJ8feQQUks/Q0dsbpP6LiQTbUiyPC+M1UieNFIdw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KS1ttxmC6czp85AOWoZ7Vv0Ap5uvxz1bElrXXodsDJ4Ff3wTaOB8ieMGuzgidUgWt
 hsDpmIFe3r7e+Cj1TXlnCMSieQUMuLdT0KVA3HthkKQ82okiYv8zlaCIkqdc6FAtKy
 bl3S0Cd3iBaOP3LO3K4N6pATPQrm1rPnGQ84aCacd7XPqseZCkHL4G+AeU76UPmGTh
 skGsJsM7LJMoQjLsUhoUE1V+HDyNz3wFKV8yJNoEUeMcKAXm4pnMADwYvaAvniQwhT
 Hzs+i2CS7BensVhiOlbvBOjA8OzFH3mg18nwkkKFIfeM7Q5/dLZ18WG4PKSRCsnmrC
 wCHfLMFfYkIsw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 066/159] drm/amdkfd: Fix circular lock dependency
 warning
Date: Mon, 30 May 2022 09:22:51 -0400
Message-Id: <20220530132425.1929512-66-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Mukul Joshi <mukul.joshi@amd.com>,
 airlied@linux.ie, Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Mukul Joshi <mukul.joshi@amd.com>

[ Upstream commit b179fc28d521379ba7e0a38eec1a4c722e7ea634 ]

[  168.544078] ======================================================
[  168.550309] WARNING: possible circular locking dependency detected
[  168.556523] 5.16.0-kfd-fkuehlin #148 Tainted: G            E
[  168.562558] ------------------------------------------------------
[  168.568764] kfdtest/3479 is trying to acquire lock:
[  168.573672] ffffffffc0927a70 (&topology_lock){++++}-{3:3}, at:
		kfd_topology_device_by_id+0x16/0x60 [amdgpu] [  168.583663]
                but task is already holding lock:
[  168.589529] ffff97d303dee668 (&mm->mmap_lock#2){++++}-{3:3}, at:
		vm_mmap_pgoff+0xa9/0x180 [  168.597755]
                which lock already depends on the new lock.

[  168.605970]
                the existing dependency chain (in reverse order) is:
[  168.613487]
                -> #3 (&mm->mmap_lock#2){++++}-{3:3}:
[  168.619700]        lock_acquire+0xca/0x2e0
[  168.623814]        down_read+0x3e/0x140
[  168.627676]        do_user_addr_fault+0x40d/0x690
[  168.632399]        exc_page_fault+0x6f/0x270
[  168.636692]        asm_exc_page_fault+0x1e/0x30
[  168.641249]        filldir64+0xc8/0x1e0
[  168.645115]        call_filldir+0x7c/0x110
[  168.649238]        ext4_readdir+0x58e/0x940
[  168.653442]        iterate_dir+0x16a/0x1b0
[  168.657558]        __x64_sys_getdents64+0x83/0x140
[  168.662375]        do_syscall_64+0x35/0x80
[  168.666492]        entry_SYSCALL_64_after_hwframe+0x44/0xae
[  168.672095]
                -> #2 (&type->i_mutex_dir_key#6){++++}-{3:3}:
[  168.679008]        lock_acquire+0xca/0x2e0
[  168.683122]        down_read+0x3e/0x140
[  168.686982]        path_openat+0x5b2/0xa50
[  168.691095]        do_file_open_root+0xfc/0x190
[  168.695652]        file_open_root+0xd8/0x1b0
[  168.702010]        kernel_read_file_from_path_initns+0xc4/0x140
[  168.709542]        _request_firmware+0x2e9/0x5e0
[  168.715741]        request_firmware+0x32/0x50
[  168.721667]        amdgpu_cgs_get_firmware_info+0x370/0xdd0 [amdgpu]
[  168.730060]        smu7_upload_smu_firmware_image+0x53/0x190 [amdgpu]
[  168.738414]        fiji_start_smu+0xcf/0x4e0 [amdgpu]
[  168.745539]        pp_dpm_load_fw+0x21/0x30 [amdgpu]
[  168.752503]        amdgpu_pm_load_smu_firmware+0x4b/0x80 [amdgpu]
[  168.760698]        amdgpu_device_fw_loading+0xb8/0x140 [amdgpu]
[  168.768412]        amdgpu_device_init.cold+0xdf6/0x1716 [amdgpu]
[  168.776285]        amdgpu_driver_load_kms+0x15/0x120 [amdgpu]
[  168.784034]        amdgpu_pci_probe+0x19b/0x3a0 [amdgpu]
[  168.791161]        local_pci_probe+0x40/0x80
[  168.797027]        work_for_cpu_fn+0x10/0x20
[  168.802839]        process_one_work+0x273/0x5b0
[  168.808903]        worker_thread+0x20f/0x3d0
[  168.814700]        kthread+0x176/0x1a0
[  168.819968]        ret_from_fork+0x1f/0x30
[  168.825563]
                -> #1 (&adev->pm.mutex){+.+.}-{3:3}:
[  168.834721]        lock_acquire+0xca/0x2e0
[  168.840364]        __mutex_lock+0xa2/0x930
[  168.846020]        amdgpu_dpm_get_mclk+0x37/0x60 [amdgpu]
[  168.853257]        amdgpu_amdkfd_get_local_mem_info+0xba/0xe0 [amdgpu]
[  168.861547]        kfd_create_vcrat_image_gpu+0x1b1/0xbb0 [amdgpu]
[  168.869478]        kfd_create_crat_image_virtual+0x447/0x510 [amdgpu]
[  168.877884]        kfd_topology_add_device+0x5c8/0x6f0 [amdgpu]
[  168.885556]        kgd2kfd_device_init.cold+0x385/0x4c5 [amdgpu]
[  168.893347]        amdgpu_amdkfd_device_init+0x138/0x180 [amdgpu]
[  168.901177]        amdgpu_device_init.cold+0x141b/0x1716 [amdgpu]
[  168.909025]        amdgpu_driver_load_kms+0x15/0x120 [amdgpu]
[  168.916458]        amdgpu_pci_probe+0x19b/0x3a0 [amdgpu]
[  168.923442]        local_pci_probe+0x40/0x80
[  168.929249]        work_for_cpu_fn+0x10/0x20
[  168.935008]        process_one_work+0x273/0x5b0
[  168.940944]        worker_thread+0x20f/0x3d0
[  168.946623]        kthread+0x176/0x1a0
[  168.951765]        ret_from_fork+0x1f/0x30
[  168.957277]
                -> #0 (&topology_lock){++++}-{3:3}:
[  168.965993]        check_prev_add+0x8f/0xbf0
[  168.971613]        __lock_acquire+0x1299/0x1ca0
[  168.977485]        lock_acquire+0xca/0x2e0
[  168.982877]        down_read+0x3e/0x140
[  168.987975]        kfd_topology_device_by_id+0x16/0x60 [amdgpu]
[  168.995583]        kfd_device_by_id+0xa/0x20 [amdgpu]
[  169.002180]        kfd_mmap+0x95/0x200 [amdgpu]
[  169.008293]        mmap_region+0x337/0x5a0
[  169.013679]        do_mmap+0x3aa/0x540
[  169.018678]        vm_mmap_pgoff+0xdc/0x180
[  169.024095]        ksys_mmap_pgoff+0x186/0x1f0
[  169.029734]        do_syscall_64+0x35/0x80
[  169.035005]        entry_SYSCALL_64_after_hwframe+0x44/0xae
[  169.041754]
                other info that might help us debug this:

[  169.053276] Chain exists of:
                  &topology_lock --> &type->i_mutex_dir_key#6 --> &mm->mmap_lock#2

[  169.068389]  Possible unsafe locking scenario:

[  169.076661]        CPU0                    CPU1
[  169.082383]        ----                    ----
[  169.088087]   lock(&mm->mmap_lock#2);
[  169.092922]                                lock(&type->i_mutex_dir_key#6);
[  169.100975]                                lock(&mm->mmap_lock#2);
[  169.108320]   lock(&topology_lock);
[  169.112957]
                 *** DEADLOCK ***

This commit fixes the deadlock warning by ensuring pm.mutex is not
held while holding the topology lock. For this, kfd_local_mem_info
is moved into the KFD dev struct and filled during device init.
This cached value can then be used instead of querying the value
again and again.

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c  | 7 ++-----
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c     | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c   | 2 ++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h     | 1 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 7 ++-----
 5 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 607f65ab39ac..10cc834a5ac3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -944,8 +944,6 @@ static int kfd_ioctl_acquire_vm(struct file *filep, struct kfd_process *p,
 
 bool kfd_dev_is_large_bar(struct kfd_dev *dev)
 {
-	struct kfd_local_mem_info mem_info;
-
 	if (debug_largebar) {
 		pr_debug("Simulate large-bar allocation on non large-bar machine\n");
 		return true;
@@ -954,9 +952,8 @@ bool kfd_dev_is_large_bar(struct kfd_dev *dev)
 	if (dev->use_iommu_v2)
 		return false;
 
-	amdgpu_amdkfd_get_local_mem_info(dev->adev, &mem_info);
-	if (mem_info.local_mem_size_private == 0 &&
-			mem_info.local_mem_size_public > 0)
+	if (dev->local_mem_info.local_mem_size_private == 0 &&
+			dev->local_mem_info.local_mem_size_public > 0)
 		return true;
 	return false;
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
index 1eaabd2cb41b..59b349a4c04a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
@@ -2152,7 +2152,7 @@ static int kfd_create_vcrat_image_gpu(void *pcrat_image,
 	 * report the total FB size (public+private) as a single
 	 * private heap.
 	 */
-	amdgpu_amdkfd_get_local_mem_info(kdev->adev, &local_mem_info);
+	local_mem_info = kdev->local_mem_info;
 	sub_type_hdr = (typeof(sub_type_hdr))((char *)sub_type_hdr +
 			sub_type_hdr->length);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 62aa6c9d5123..c96d521447fc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -575,6 +575,8 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 	if (kfd_resume(kfd))
 		goto kfd_resume_error;
 
+	amdgpu_amdkfd_get_local_mem_info(kfd->adev, &kfd->local_mem_info);
+
 	if (kfd_topology_add_device(kfd)) {
 		dev_err(kfd_device, "Error adding device to topology\n");
 		goto kfd_topology_add_device_error;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 8f58fc491b28..49a29a60b71e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -272,6 +272,7 @@ struct kfd_dev {
 
 	struct kgd2kfd_shared_resources shared_resources;
 	struct kfd_vmid_info vm_info;
+	struct kfd_local_mem_info local_mem_info;
 
 	const struct kfd2kgd_calls *kfd2kgd;
 	struct mutex doorbell_mutex;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 3bdcae239bc0..9fc24f6823df 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1102,15 +1102,12 @@ static uint32_t kfd_generate_gpu_id(struct kfd_dev *gpu)
 	uint32_t buf[7];
 	uint64_t local_mem_size;
 	int i;
-	struct kfd_local_mem_info local_mem_info;
 
 	if (!gpu)
 		return 0;
 
-	amdgpu_amdkfd_get_local_mem_info(gpu->adev, &local_mem_info);
-
-	local_mem_size = local_mem_info.local_mem_size_private +
-			local_mem_info.local_mem_size_public;
+	local_mem_size = gpu->local_mem_info.local_mem_size_private +
+			gpu->local_mem_info.local_mem_size_public;
 
 	buf[0] = gpu->pdev->devfn;
 	buf[1] = gpu->pdev->subsystem_vendor |
-- 
2.35.1

