Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E959466C54F
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Jan 2023 17:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704AC10E010;
	Mon, 16 Jan 2023 16:04:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FA510E2B7
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Jan 2023 16:01:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4437FB81060;
 Mon, 16 Jan 2023 16:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CB8C433D2;
 Mon, 16 Jan 2023 16:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1673884858;
 bh=CAENawXkmGIikTgQaoNQNaa2aMRkxqXC9VP92b9laqY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FyBTBwADKLm0ZLxzI8mza8t/ChFA4RmBCirPUy3V6uvd0t4a4IGm7sO9sFTC7KQBa
 wYA3cHHzS+t6AF/7uz3Ej930SV71TAb5atshJ5zKZlJzFeBbPw+jL8YEyE9e6UQMVI
 4blYPzlQxt9eMoQ9k9jGxx58s1LPwDu4cY6etyZk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.1 138/183] drm/amdgpu: Fix potential NULL dereference
Date: Mon, 16 Jan 2023 16:51:01 +0100
Message-Id: <20230116154809.201264284@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116154803.321528435@linuxfoundation.org>
References: <20230116154803.321528435@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Jan 2023 16:04:40 +0000
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
Cc: Sasha Levin <sashal@kernel.org>, Dan Carpenter <error27@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel test robot <lkp@intel.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Luben Tuikov <luben.tuikov@amd.com>

[ Upstream commit 0be7ed8e7eb15282b5d0f6fdfea884db594ea9bf ]

Fix potential NULL dereference, in the case when "man", the resource manager
might be NULL, when/if we print debug information.

Cc: Alex Deucher <Alexander.Deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: AMD Graphics <amd-gfx@lists.freedesktop.org>
Cc: Dan Carpenter <error27@gmail.com>
Cc: kernel test robot <lkp@intel.com>
Fixes: 7554886daa31ea ("drm/amdgpu: Fix size validation for non-exclusive domains (v4)")
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 3be3cba3a16d..cfd78c4a45ba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -468,8 +468,9 @@ static bool amdgpu_bo_validate_size(struct amdgpu_device *adev,
 	return true;
 
 fail:
-	DRM_DEBUG("BO size %lu > total memory in domain: %llu\n", size,
-		  man->size);
+	if (man)
+		DRM_DEBUG("BO size %lu > total memory in domain: %llu\n", size,
+			  man->size);
 	return false;
 }
 
-- 
2.35.1



