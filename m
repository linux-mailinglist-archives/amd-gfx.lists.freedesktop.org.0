Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805C715E2CD
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Feb 2020 17:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190956FB4D;
	Fri, 14 Feb 2020 16:25:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F382C6FB41;
 Fri, 14 Feb 2020 16:25:07 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9ED9C2479D;
 Fri, 14 Feb 2020 16:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697507;
 bh=Lhe26MhIkbib9XC4bkspCVFr9AvJN+p0oE/YNus0YLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VeKdXfH7YHHQdltIq8oXpsjPJ+95+o1esH01sZ/Aa0fDLsPzVivxe8FGbS4kC7/mc
 SHB5MmThfUc51BRYfw5S6c1Zv5nqXf9cifSum3Ae1JSmEgeoGuB03BS+VcwPClxSDu
 NDxiAmr5FSNakK/x5clBxLHttOdzTfF+0Rqq150k=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 034/100] drm/radeon: remove set but not used
 variable 'blocks'
Date: Fri, 14 Feb 2020 11:23:18 -0500
Message-Id: <20200214162425.21071-34-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214162425.21071-1-sashal@kernel.org>
References: <20200214162425.21071-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 zhengbin <zhengbin13@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: zhengbin <zhengbin13@huawei.com>

[ Upstream commit 77441f77949807fda4a0aec0bdf3e86ae863fd56 ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/radeon/radeon_combios.c: In function radeon_combios_get_power_modes:
drivers/gpu/drm/radeon/radeon_combios.c:2638:10: warning: variable blocks set but not used [-Wunused-but-set-variable]

It is introduced by commit 56278a8edace ("drm/radeon/kms:
pull power mode info from bios tables (v3)"), but never used,
so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_combios.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index fcecaf5b55267..7a3e996fe9f6a 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -2636,7 +2636,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
 {
 	struct drm_device *dev = rdev->ddev;
 	u16 offset, misc, misc2 = 0;
-	u8 rev, blocks, tmp;
+	u8 rev, tmp;
 	int state_index = 0;
 	struct radeon_i2c_bus_rec i2c_bus;
 
@@ -2726,7 +2726,6 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
 		offset = combios_get_table_offset(dev, COMBIOS_POWERPLAY_INFO_TABLE);
 		if (offset) {
 			rev = RBIOS8(offset);
-			blocks = RBIOS8(offset + 0x2);
 			/* power mode 0 tends to be the only valid one */
 			rdev->pm.power_state[state_index].num_clock_modes = 1;
 			rdev->pm.power_state[state_index].clock_info[0].mclk = RBIOS32(offset + 0x5 + 0x2);
-- 
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
