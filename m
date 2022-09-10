Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D775B4955
	for <lists+amd-gfx@lfdr.de>; Sat, 10 Sep 2022 23:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0823D10E2DD;
	Sat, 10 Sep 2022 21:19:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1043910E2D8;
 Sat, 10 Sep 2022 21:18:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 853AF60E86;
 Sat, 10 Sep 2022 21:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A335C43140;
 Sat, 10 Sep 2022 21:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662844736;
 bh=c15g6TlQSNLnuj/POUbCskQOM/kc1isI+563BYNg+DY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hr9pSG1uBqaKJ/Z7aMf3yCSrp8xUA6yWmOA1Hju/ghcbv4xBpChDgSLauqsvKmNCr
 Yz5z6HQk/VS4YLARQD7yYQ7+xpQqD1rx+G+aPgFq9vVkgCt3XGUh312UANEcXy9vk6
 12n3qb3qq/CpLkZtQB04xoed4g4ehI5PO1gaHFGf8phGC4EeOO3VvZM4oK4A48wDY+
 le+uMIvUZNKs/BmNmnMCh6x2cVsmn/JMxhN5PZ3y0MRHvoDxEFpCtKFHYnnkjh7g/t
 deS8jNACv4EJRCJukZG75qNbgW6yESYdAmF/MHIzX+LeEW0nF0KrDItyNGRIu+wZja
 LTsXf+a2u4y/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 11/14] drm/amd/amdgpu: skip ucode loading if
 ucode_size == 0
Date: Sat, 10 Sep 2022 17:18:29 -0400
Message-Id: <20220910211832.70579-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220910211832.70579-1-sashal@kernel.org>
References: <20220910211832.70579-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tao.zhou1@amd.com,
 Chengming Gui <Jack.Gui@amd.com>, guchun.chen@amd.com, airlied@linux.ie,
 Bokun.Zhang@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, Likun.Gao@amd.com,
 candice.li@amd.com, john.clements@amd.com, christian.koenig@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Chengming Gui <Jack.Gui@amd.com>

[ Upstream commit 39c84b8e929dbd4f63be7e04bf1a2bcd92b44177 ]

Restrict the ucode loading check to avoid frontdoor loading error.

Signed-off-by: Chengming Gui <Jack.Gui@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 2f47f81a74a57..f3a806df7648d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -1921,7 +1921,7 @@ static int psp_load_smu_fw(struct psp_context *psp)
 static bool fw_load_skip_check(struct psp_context *psp,
 			       struct amdgpu_firmware_info *ucode)
 {
-	if (!ucode->fw)
+	if (!ucode->fw || !ucode->ucode_size)
 		return true;
 
 	if (ucode->ucode_id == AMDGPU_UCODE_ID_SMC &&
-- 
2.35.1

