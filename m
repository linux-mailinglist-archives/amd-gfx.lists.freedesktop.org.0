Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A3365FCB4
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Jan 2023 09:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5679610E83D;
	Fri,  6 Jan 2023 08:27:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Fri, 06 Jan 2023 01:37:47 UTC
Received: from out199-9.us.a.mail.aliyun.com (out199-9.us.a.mail.aliyun.com
 [47.90.199.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5718C10E2A5;
 Fri,  6 Jan 2023 01:37:46 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R551e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VYxT.Sg_1672968758; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VYxT.Sg_1672968758) by smtp.aliyun-inc.com;
 Fri, 06 Jan 2023 09:32:39 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH -next] drm/amdgpu: clean up some inconsistent indentings
Date: Fri,  6 Jan 2023 09:32:32 +0800
Message-Id: <20230106013232.25947-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Jan 2023 08:27:47 +0000
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:65 amdgpu_gem_fault() warn: inconsistent indenting

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3639
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 00edc7002ee8..ed1164a87fce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -62,10 +62,10 @@ static vm_fault_t amdgpu_gem_fault(struct vm_fault *vmf)
 			goto unlock;
 		}
 
-		 ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-						TTM_BO_VM_NUM_PREFAULT);
+		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
+					       TTM_BO_VM_NUM_PREFAULT);
 
-		 drm_dev_exit(idx);
+		drm_dev_exit(idx);
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
 	}
-- 
2.20.1.7.g153144c

