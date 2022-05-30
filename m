Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96598537E05
	for <lists+amd-gfx@lfdr.de>; Mon, 30 May 2022 15:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC0E10EAD8;
	Mon, 30 May 2022 13:48:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (unknown [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17D310EAA7;
 Mon, 30 May 2022 13:48:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B96460FCC;
 Mon, 30 May 2022 13:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74601C385B8;
 Mon, 30 May 2022 13:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918483;
 bh=meTKEfhwvJQNPNSEHlua5iCIaCbkJ5tZEhnI42ZDXNY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h1jmeTdQpECdIaNrOGNAdeCjdcaD5jYnQDnJ4p0ezWbaY36V0DHI7EMtpa0fl0s6b
 6IMQDXy+nMSx1ztbukR+z7kDaVTYFHfS1tTel4eGo66cqyRZBULJBxFwWkWwF4oHj+
 xNFuLXU8gMMJ4ao8xV/5o+LSfPdg+qYpCx79FrtE7ufymQeHQa1IaCHAV2cFR2dKQ8
 hE8y2W6BptlRGfWbD7C/HgruDhCe/H0f3ymwgyPjX01ppuZ8acy9+1WZpzFWXY3Qli
 32GBCr+m4lywKUmPHxwVr5VBB1u9sM3mCa3wAfwE8D0DhOU29q3bzMqBNyr1Fni+KK
 4IkACCTs0+5Bg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 24/55] drm/amd/pm: fix the compile warning
Date: Mon, 30 May 2022 09:46:30 -0400
Message-Id: <20220530134701.1935933-24-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530134701.1935933-1-sashal@kernel.org>
References: <20220530134701.1935933-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, kernel test robot <lkp@intel.com>,
 airlied@linux.ie, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Evan Quan <evan.quan@amd.com>

[ Upstream commit 555238d92ac32dbad2d77ad2bafc48d17391990c ]

Fix the compile warning below:
drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1641
kv_get_acp_boot_level() warn: always true condition '(table->entries[i]->clk >= 0) => (0-u32max >= 0)'

Reported-by: kernel test robot <lkp@intel.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/kv_dpm.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/kv_dpm.c b/drivers/gpu/drm/amd/amdgpu/kv_dpm.c
index 4b3faaccecb9..c8a5a5698edd 100644
--- a/drivers/gpu/drm/amd/amdgpu/kv_dpm.c
+++ b/drivers/gpu/drm/amd/amdgpu/kv_dpm.c
@@ -1609,19 +1609,7 @@ static int kv_update_samu_dpm(struct amdgpu_device *adev, bool gate)
 
 static u8 kv_get_acp_boot_level(struct amdgpu_device *adev)
 {
-	u8 i;
-	struct amdgpu_clock_voltage_dependency_table *table =
-		&adev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table;
-
-	for (i = 0; i < table->count; i++) {
-		if (table->entries[i].clk >= 0) /* XXX */
-			break;
-	}
-
-	if (i >= table->count)
-		i = table->count - 1;
-
-	return i;
+	return 0;
 }
 
 static void kv_update_acp_boot_level(struct amdgpu_device *adev)
-- 
2.35.1

