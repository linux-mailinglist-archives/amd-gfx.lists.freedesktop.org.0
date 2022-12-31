Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484CD65A698
	for <lists+amd-gfx@lfdr.de>; Sat, 31 Dec 2022 21:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1936710E12E;
	Sat, 31 Dec 2022 20:05:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E9910E0F1;
 Sat, 31 Dec 2022 20:05:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F39460C39;
 Sat, 31 Dec 2022 20:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A748CC433EF;
 Sat, 31 Dec 2022 20:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672517099;
 bh=2au/8bzdU54fuOLPavMaj3vnB5+dwzQQIVuc7L2p3uk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pDo1oCeaNcl2NM5ByF245qZ/9pm94NXGH4eH0Y8hDOMQqQXdXv33nHmZxG+QUhDM8
 20ul14F1onfDx0g/LvH0BONk/JePHcmqfFA6LyXqwZMqVED57fQ87VIuj5UD5/BF3f
 2fIUVl/6lVmcJ8uZ31t9PcM74sAkZAS2V2nfz5kF6O1hhDYv3IorKoYsPEd5GGvs5+
 SM/Sc8WeHUpG5rMBvDEp6Dn6vrj3xhcDrb09YxOBEWgkizTxGy2sZQRELuWXyHBMhW
 3XRlCgjjljhvFgqphI9O0GJNfk0rQnZPmH/oorUVUl5pl98DQw9EA/nXWGbD0P7auB
 MXT+lcDsytyxg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 6/7] drm/amdkfd: Fix kfd_process_device_init_vm
 error handling
Date: Sat, 31 Dec 2022 15:04:38 -0500
Message-Id: <20221231200439.1748686-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221231200439.1748686-1-sashal@kernel.org>
References: <20221231200439.1748686-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit 29d48b87db64b6697ddad007548e51d032081c59 ]

Should only destroy the ib_mem and let process cleanup worker to free
the outstanding BOs. Reset the pointer in pdd->qpd structure, to avoid
NULL pointer access in process destroy worker.

 BUG: kernel NULL pointer dereference, address: 0000000000000010
 Call Trace:
  amdgpu_amdkfd_gpuvm_unmap_gtt_bo_from_kernel+0x46/0xb0 [amdgpu]
  kfd_process_device_destroy_cwsr_dgpu+0x40/0x70 [amdgpu]
  kfd_process_destroy_pdds+0x71/0x190 [amdgpu]
  kfd_process_wq_release+0x2a2/0x3b0 [amdgpu]
  process_one_work+0x2a1/0x600
  worker_thread+0x39/0x3d0

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 951b63677248..9821fa9268d3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -689,13 +689,13 @@ void kfd_process_destroy_wq(void)
 }
 
 static void kfd_process_free_gpuvm(struct kgd_mem *mem,
-			struct kfd_process_device *pdd, void *kptr)
+			struct kfd_process_device *pdd, void **kptr)
 {
 	struct kfd_dev *dev = pdd->dev;
 
-	if (kptr) {
+	if (kptr && *kptr) {
 		amdgpu_amdkfd_gpuvm_unmap_gtt_bo_from_kernel(mem);
-		kptr = NULL;
+		*kptr = NULL;
 	}
 
 	amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(dev->adev, mem, pdd->drm_priv);
@@ -795,7 +795,7 @@ static void kfd_process_device_destroy_ib_mem(struct kfd_process_device *pdd)
 	if (!qpd->ib_kaddr || !qpd->ib_base)
 		return;
 
-	kfd_process_free_gpuvm(qpd->ib_mem, pdd, qpd->ib_kaddr);
+	kfd_process_free_gpuvm(qpd->ib_mem, pdd, &qpd->ib_kaddr);
 }
 
 struct kfd_process *kfd_create_process(struct file *filep)
@@ -1277,7 +1277,7 @@ static void kfd_process_device_destroy_cwsr_dgpu(struct kfd_process_device *pdd)
 	if (!dev->cwsr_enabled || !qpd->cwsr_kaddr || !qpd->cwsr_base)
 		return;
 
-	kfd_process_free_gpuvm(qpd->cwsr_mem, pdd, qpd->cwsr_kaddr);
+	kfd_process_free_gpuvm(qpd->cwsr_mem, pdd, &qpd->cwsr_kaddr);
 }
 
 void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
@@ -1598,8 +1598,8 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 	return 0;
 
 err_init_cwsr:
+	kfd_process_device_destroy_ib_mem(pdd);
 err_reserve_ib_mem:
-	kfd_process_device_free_bos(pdd);
 	pdd->drm_priv = NULL;
 
 	return ret;
-- 
2.35.1

