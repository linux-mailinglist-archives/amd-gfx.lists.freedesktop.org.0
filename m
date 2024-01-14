Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FC482D587
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jan 2024 10:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420C210E224;
	Mon, 15 Jan 2024 09:07:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr
 [80.12.242.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E1310E055
 for <amd-gfx@lists.freedesktop.org>; Sun, 14 Jan 2024 15:14:39 +0000 (UTC)
Received: from fedora.home ([92.140.202.140]) by smtp.orange.fr with ESMTPA
 id P2ByrR95z2jhsP2ByrsvDy; Sun, 14 Jan 2024 16:14:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1705245277;
 bh=DyxncyBb2TGhjTPDIO5OZaofh3nX75GnWep1Sd7CadU=;
 h=From:To:Cc:Subject:Date;
 b=eFh0JmdMRV7qpGMY7yfPjvMU1f7MZ9qtKW1SDUmqvVE6fliw9diJPe3raZn5FO+GP
 SxeXoutXn9VX3VWk0Ej/CDg2zfoeuRmWlPljl4hsmridG6GvNs0vKJaXeMksK0YAoa
 qdD4qEMba+hVinVJGZwhvbL5faxuDs/mUdPojSqZfGOnlMjMVdOkQyqygAGM+iK5wY
 oOau+vxJtzypBmGxtbHo6Ico3qjfbysbGw8VViCiGzNL/1LWH8ifZB3FgqI0tlzqJ7
 jg84JR8MdXYdt0QOHCrEF2YZoNN+wMEGxepcuIzhKI96dPlNAV2NW4qVdD86Y7myvM
 BXpw7e72l5a3Q==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Jan 2024 16:14:37 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amdgpu: Remove usage of the deprecated ida_simple_xx() API
Date: Sun, 14 Jan 2024 16:14:27 +0100
Message-ID: <c3b8e4bfb819d901e532e90a2ae0efa9eb661c55.1705245232.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Jan 2024 09:07:13 +0000
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

Note that the upper limit of ida_simple_get() is exclusive, but the one of
ida_alloc_range() is inclusive. So a -1 has been added when needed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index ddd0891da116..3d7fcdeaf8cf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -62,9 +62,8 @@ int amdgpu_pasid_alloc(unsigned int bits)
 	int pasid = -EINVAL;
 
 	for (bits = min(bits, 31U); bits > 0; bits--) {
-		pasid = ida_simple_get(&amdgpu_pasid_ida,
-				       1U << (bits - 1), 1U << bits,
-				       GFP_KERNEL);
+		pasid = ida_alloc_range(&amdgpu_pasid_ida, 1U << (bits - 1),
+					(1U << bits) - 1, GFP_KERNEL);
 		if (pasid != -ENOSPC)
 			break;
 	}
@@ -82,7 +81,7 @@ int amdgpu_pasid_alloc(unsigned int bits)
 void amdgpu_pasid_free(u32 pasid)
 {
 	trace_amdgpu_pasid_freed(pasid);
-	ida_simple_remove(&amdgpu_pasid_ida, pasid);
+	ida_free(&amdgpu_pasid_ida, pasid);
 }
 
 static void amdgpu_pasid_free_cb(struct dma_fence *fence,
-- 
2.43.0

