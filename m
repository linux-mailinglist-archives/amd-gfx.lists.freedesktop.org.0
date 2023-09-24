Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFF47AC88E
	for <lists+amd-gfx@lfdr.de>; Sun, 24 Sep 2023 15:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF3510E18C;
	Sun, 24 Sep 2023 13:17:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E77510E140;
 Sun, 24 Sep 2023 13:17:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B14D860C2B;
 Sun, 24 Sep 2023 13:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15355C433C9;
 Sun, 24 Sep 2023 13:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695561438;
 bh=AkESHVaIEK/Q0N156xWN9b9wJHZIeDxy8gc9Dgudzoo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DfeKXIX/TxbigZcVVBWGNMuiOjc1bScZaEOW+u3v1vEJ+WSiJFArA7Id95QrSIeHL
 lzzNqrJNUv3eN7skJQJW657B3qcMolg8Ao4gU7mmiJMfsWHwbo7619cRPNLQQzRs68
 DROWe8PzQs9o6vbf13j396Rc8fnV/3jkYB1Vqkq8w8Yjzxm/mitX1oQyruGQzJvvcR
 GEbbS55vErLG3gz7VnzFthx0HvqIpKrb0GnkynbS3Cjy3JkuApRauLoFm7XoaJ/mK2
 iMF6s3LmKt1voHnWQ7eno6gEPXRjrpOqaYq45X7Lgn/JuAXtgzFGwPtl/mfFCSAC4D
 FBOujhyhiiA3g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 30/41] drm/amdgpu/nbio4.3: set proper
 rmmio_remap.reg_offset for SR-IOV
Date: Sun, 24 Sep 2023 09:15:18 -0400
Message-Id: <20230924131529.1275335-30-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230924131529.1275335-1-sashal@kernel.org>
References: <20230924131529.1275335-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.5
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, Hawking.Zhang@amd.com,
 Timmy Tsai <timmtsai@amd.com>, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, candice.li@amd.com,
 airlied@gmail.com, christian.koenig@amd.com, mario.limonciello@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit ab43213e7afd08ac68d4282060bacf309e70fd14 ]

Needed for HDP flush to work correctly.

Reviewed-by: Timmy Tsai <timmtsai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c b/drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c
index d5ed9e0e1a5f1..e5b5b0f4940f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c
@@ -345,6 +345,9 @@ static void nbio_v4_3_init_registers(struct amdgpu_device *adev)
 		data &= ~RCC_DEV0_EPF2_STRAP2__STRAP_NO_SOFT_RESET_DEV0_F2_MASK;
 		WREG32_SOC15(NBIO, 0, regRCC_DEV0_EPF2_STRAP2, data);
 	}
+	if (amdgpu_sriov_vf(adev))
+		adev->rmmio_remap.reg_offset = SOC15_REG_OFFSET(NBIO, 0,
+			regBIF_BX_DEV0_EPF0_VF0_HDP_MEM_COHERENCY_FLUSH_CNTL) << 2;
 }
 
 static u32 nbio_v4_3_get_rom_offset(struct amdgpu_device *adev)
-- 
2.40.1

