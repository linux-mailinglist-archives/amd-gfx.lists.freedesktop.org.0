Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDE75870D8
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Aug 2022 21:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8621812BE8E;
	Mon,  1 Aug 2022 19:03:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A2810FDB0;
 Mon,  1 Aug 2022 19:02:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BAA32B81615;
 Mon,  1 Aug 2022 19:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B557C433C1;
 Mon,  1 Aug 2022 19:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659380566;
 bh=YtcresAn+qp2Ji3gQYzaNCoxUrbqceUer7l0kgvznWs=;
 h=From:To:Cc:Subject:Date:From;
 b=GDz8wNFEqovaEkVRPCQ7i/w9iEBZqF94YYvvGV1LlrtzW/XoHM1B02n8jkiXTl77r
 dgrb3LQiw9zvE/XjtQe3Ro/lcjJa+QHkm1+79Uiv/0Kup3yL+aBhRqHThj6l2CikfW
 pdB8F22ComXe1Ryzv4BHS055BMwdgbK1hk+zUog2AMhW+7RRXGYXMY2wvvGCco/7bU
 hzBR1TE0Im5mkOvfmRhr9Ogh8VRONC19kuMR4CNdqjiwyBrr6f+pgmY1ukqg7hTvK4
 vFTNS4iy//zCA5lI+FUumkKKoAPWPTgVcJBvxsgo126y3w67U71V43Weg1drHIVDyp
 iy/on6VdauDzw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 1/8] drm/amdgpu: Remove one duplicated ef removal
Date: Mon,  1 Aug 2022 15:02:36 -0400
Message-Id: <20220801190243.3818811-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: xinhui pan <xinhui.pan@amd.com>

[ Upstream commit e1aadbab445b06e072013a1365fd0cf2aa25e843 ]

That has been done in BO release notify.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2074
Signed-off-by: xinhui pan <xinhui.pan@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 21c02f817a84..c904269b3e14 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1318,16 +1318,10 @@ void amdgpu_amdkfd_gpuvm_destroy_cb(struct amdgpu_device *adev,
 				    struct amdgpu_vm *vm)
 {
 	struct amdkfd_process_info *process_info = vm->process_info;
-	struct amdgpu_bo *pd = vm->root.bo;
 
 	if (!process_info)
 		return;
 
-	/* Release eviction fence from PD */
-	amdgpu_bo_reserve(pd, false);
-	amdgpu_bo_fence(pd, NULL, false);
-	amdgpu_bo_unreserve(pd);
-
 	/* Update process info */
 	mutex_lock(&process_info->lock);
 	process_info->n_vms--;
-- 
2.35.1

