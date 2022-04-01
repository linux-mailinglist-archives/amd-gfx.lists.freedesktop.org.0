Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B624EF1DC
	for <lists+amd-gfx@lfdr.de>; Fri,  1 Apr 2022 16:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315E010F48D;
	Fri,  1 Apr 2022 14:42:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D0D10F48D;
 Fri,  1 Apr 2022 14:42:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 966AAB82502;
 Fri,  1 Apr 2022 14:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879A1C2BBE4;
 Fri,  1 Apr 2022 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648824142;
 bh=Or5Rp8UJEUhpq/Xbmlxww9VvoFfOSM1I4I49HSOWxqQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=repogBi7rgH2A7uS9h+a6waMvqOGbpNvTrq4Khxkwv9XXhCTdHktwX+HckiWMiBCN
 LSt+3WgozYH7W1SamdHROE3Q8njZteBBYItsjZMfOpsa9IKP7ydBa46gMiYxbnuFWv
 Ms/hyqJmxjr2cQDmK29PpQD3ree9Fn32TAG3Cr3csyVrsIa4MoJBmRZoeV0CcBa1ZO
 g/XE2wTodRGr8zpQPppTLIDTPSNCTokEQ1mEY9+nc1Nviug1lCl7SyGXdP7PG+5nk1
 4AcvWfzkqWTKQ8e5UNIvRkqcQ6aBbbc0m+5I7m8DaBNgzAMthXXRIgnLC29oTL30bq
 6F1AmoXaZ5jnQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 04/65] drm/amd/amdgpu/amdgpu_cs: fix refcount
 leak of a dma_fence obj
Date: Fri,  1 Apr 2022 10:41:05 -0400
Message-Id: <20220401144206.1953700-4-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401144206.1953700-1-sashal@kernel.org>
References: <20220401144206.1953700-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Xin Tan <tanxin.ctf@gmail.com>,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 Xin Xiong <xiongx18@fudan.edu.cn>, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, JinhuiEric.Huang@amd.com, nirmoy.das@amd.com,
 amd-gfx@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, Lang.Yu@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Ken.Xue@amd.com,
 linux-media@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Xin Xiong <xiongx18@fudan.edu.cn>

[ Upstream commit dfced44f122c500004a48ecc8db516bb6a295a1b ]

This issue takes place in an error path in
amdgpu_cs_fence_to_handle_ioctl(). When `info->in.what` falls into
default case, the function simply returns -EINVAL, forgetting to
decrement the reference count of a dma_fence obj, which is bumped
earlier by amdgpu_cs_get_fence(). This may result in reference count
leaks.

Fix it by decreasing the refcount of specific object before returning
the error code.

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Xin Xiong <xiongx18@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 12598a4b5c78..867fcee6b0d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1484,6 +1484,7 @@ int amdgpu_cs_fence_to_handle_ioctl(struct drm_device *dev, void *data,
 		return 0;
 
 	default:
+		dma_fence_put(fence);
 		return -EINVAL;
 	}
 }
-- 
2.34.1

