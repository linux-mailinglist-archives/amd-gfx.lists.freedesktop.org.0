Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 066B56BE322
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Mar 2023 09:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BDF10EE66;
	Fri, 17 Mar 2023 08:23:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBE710EE74;
 Fri, 17 Mar 2023 08:23:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3CBE1B824FB;
 Fri, 17 Mar 2023 08:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E07C4339C;
 Fri, 17 Mar 2023 08:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041380;
 bh=nglgtsvCUff3hoxAz81mxZbGLyBNAyLesQortl5pRh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V8QPGrUr1rKK/pkPnxyrGQHlhqrAhQAz9B8YoyGAyPlwfZjOEa/wZTrJiOl3B1f1V
 dRxVSsRurlfTpiX7NHysvBEo50rrhwV7ryieiJGGqt3l0mxDh3dkKl91U+uhHHlmDL
 0tz+cX1m9mSmXzZmkZQkmFPlZkFgsko4Mi+8B8w1UKwQWvuLXGAbXEeX6FQLNqL48l
 0FokY7w66TNZ/OEGX8XGJbVq9+UaUP9LnL/f1pCIthEt1N3HMwuu4l5CKiqHj3OZnk
 4GXEw1Z+hA0hi4+teyF1NiENjb6p+qso5uJhJG3VUvfklp9SUzJNG0Tt0fjPFtUDc8
 wi2RowAwAVwrw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 17/37] drm/amd/amdgpu/amdgpu_mes: Ensure
 amdgpu_bo_create_kernel()'s return value is checked
Date: Fri, 17 Mar 2023 08:16:58 +0000
Message-Id: <20230317081718.2650744-18-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 linux-media@vger.kernel.org, David Airlie <airlied@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c: In function ‘amdgpu_mes_ctx_alloc_meta_data’:
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1099:13: warning: variable ‘r’ set but not used [-Wunused-but-set-variable]

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Jack Xiao <Jack.Xiao@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 82e27bd4f0383..30cd72ca1eefd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1104,6 +1104,11 @@ int amdgpu_mes_ctx_alloc_meta_data(struct amdgpu_device *adev,
 			    &ctx_data->meta_data_obj,
 			    &ctx_data->meta_data_mc_addr,
 			    &ctx_data->meta_data_ptr);
+	if (r) {
+		dev_warn(adev->dev, "(%d) create CTX bo failed\n", r);
+		return r;
+	}
+
 	if (!ctx_data->meta_data_obj)
 		return -ENOMEM;
 
-- 
2.40.0.rc1.284.g88254d51c5-goog

