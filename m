Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE052E11D5
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Dec 2020 03:18:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622B26E8AB;
	Wed, 23 Dec 2020 02:18:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780406E8AA;
 Wed, 23 Dec 2020 02:18:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 838A322D57;
 Wed, 23 Dec 2020 02:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689885;
 bh=bpHtdsOzKW65yAy0EHgm4OLJ9hbWFt7/1XVpTSoGBCM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WLziWSav5fp5ol7IdtZcKiotVWYZhyDIWVeY8XZsZ/qmut0dT+CHsLp++aMFchLkY
 ikDLR7N++Lw2RrpP9HGBUWzQ4nrr1rxK2PXP9X8kt/Uk6lvYRTK0IEw1De1y/V48Nh
 vHn/Rau25pn71Lk19mV+oEmRRgT2lYOh4HTW7zw75Pqtma7L+ATT2ODDqNgITv+EAv
 hPAaln/VjRbVZ1UIvPclZojdSA8kXO5aEf0meBZjFzjsXQdO/u4Dq2ZA+uk/FJGmw2
 2GqqCDsrcD0CtmZEZB+lAgDHuQ+ap6pw8PMQBNUo74gn/pRwvsRV8l+6Egu8FtSi4A
 mr5Bh0Kvak+Bw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 074/217] drm/amd/amdgpu: Update VCN
 initizalization behvaior
Date: Tue, 22 Dec 2020 21:14:03 -0500
Message-Id: <20201223021626.2790791-74-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Bokun Zhang <Bokun.Zhang@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Monk Liu <monk.liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Bokun Zhang <Bokun.Zhang@amd.com>

[ Upstream commit 3617e579eba427ed1f6b86050fe678623184db74 ]

- Issue:
  In the original vcn3.0 code, it assumes that the VCN's
  init_status is always 1, even after the MMSCH
  updates the header.

  This is incorrect since by default, it should be set to 0,
  and MMSCH will update it to 1 if VCN is ready.

- Fix:
  We need to read back the table header after send it to MMSCH.
  After that, if a VCN instance is not ready (host disabled it),
  we needs to disable the ring buffer as well.

Signed-off-by: Bokun Zhang <Bokun.Zhang@amd.com>
Reviewed-by: Monk Liu <monk.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c | 46 +++++++++++++++++++++------
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 8ecdddf33e18e..7ca21c4af167b 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -294,17 +294,19 @@ static int vcn_v3_0_hw_init(void *handle)
 				continue;
 
 			ring = &adev->vcn.inst[i].ring_dec;
-			ring->wptr = 0;
-			ring->wptr_old = 0;
-			vcn_v3_0_dec_ring_set_wptr(ring);
-			ring->sched.ready = true;
+			if (ring->sched.ready) {
+				ring->wptr = 0;
+				ring->wptr_old = 0;
+				vcn_v3_0_dec_ring_set_wptr(ring);
+			}
 
 			for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
 				ring = &adev->vcn.inst[i].ring_enc[j];
-				ring->wptr = 0;
-				ring->wptr_old = 0;
-				vcn_v3_0_enc_ring_set_wptr(ring);
-				ring->sched.ready = true;
+				if (ring->sched.ready) {
+					ring->wptr = 0;
+					ring->wptr_old = 0;
+					vcn_v3_0_enc_ring_set_wptr(ring);
+				}
 			}
 		}
 	} else {
@@ -1239,6 +1241,8 @@ static int vcn_v3_0_start_sriov(struct amdgpu_device *adev)
 	uint32_t table_size;
 	uint32_t size, size_dw;
 
+	bool is_vcn_ready;
+
 	struct mmsch_v3_0_cmd_direct_write
 		direct_wt = { {0} };
 	struct mmsch_v3_0_cmd_direct_read_modify_write
@@ -1376,7 +1380,7 @@ static int vcn_v3_0_start_sriov(struct amdgpu_device *adev)
 		MMSCH_V3_0_INSERT_END();
 
 		/* refine header */
-		header.inst[i].init_status = 1;
+		header.inst[i].init_status = 0;
 		header.inst[i].table_offset = header.total_size;
 		header.inst[i].table_size = table_size;
 		header.total_size += table_size;
@@ -1434,6 +1438,30 @@ static int vcn_v3_0_start_sriov(struct amdgpu_device *adev)
 		}
 	}
 
+	/* 6, check each VCN's init_status
+	 * if it remains as 0, then this VCN is not assigned to current VF
+	 * do not start ring for this VCN
+	 */
+	size = sizeof(struct mmsch_v3_0_init_header);
+	table_loc = (uint32_t *)table->cpu_addr;
+	memcpy(&header, (void *)table_loc, size);
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+
+		is_vcn_ready = (header.inst[i].init_status == 1);
+		if (!is_vcn_ready)
+			DRM_INFO("VCN(%d) engine is disabled by hypervisor\n", i);
+
+		ring = &adev->vcn.inst[i].ring_dec;
+		ring->sched.ready = is_vcn_ready;
+		for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
+			ring = &adev->vcn.inst[i].ring_enc[j];
+			ring->sched.ready = is_vcn_ready;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
