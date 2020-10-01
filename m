Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6695D28084C
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Oct 2020 22:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0436E069;
	Thu,  1 Oct 2020 20:17:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from services.gouders.net (services.gouders.net [141.101.32.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0936E069
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Oct 2020 19:59:57 +0000 (UTC)
Received: from lena.gouders.net (ltea-047-066-024-155.pools.arcor-ip.net
 [47.66.24.155]) (authenticated bits=0)
 by services.gouders.net (8.14.8/8.14.8) with ESMTP id 091JtVtU012416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 1 Oct 2020 21:55:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gouders.net; s=gnet;
 t=1601582134; bh=Ctcg+UIz5/6JiLTMTFXfdVAgfet3Y/GfA39of6MSzr8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WolxGcANP45H7W4siC/GpvpArvgd9LvcrFUQM0rFFYHKLTfC669JIG4M+muTbYj/n
 yrW/uwJKgJnxkRL0KlC3E/LpaHiMamj77W2BJA2iPpMbkYERvXfX2SOFmemEw0H+6C
 Sl2eY9NudUquDM1hU+JXYk+Zvvp8JVkEn82nkBz0=
From: Dirk Gouders <dirk@gouders.net>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: [PATCH 1/1] drm/amdgpu: fix NULL pointer dereference for Renoir
Date: Thu,  1 Oct 2020 21:55:25 +0200
Message-Id: <20201001195525.3477-2-dirk@gouders.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <CADnq5_OOL3UZXKXEKU8VzkZAkOnk9HM8m=nEwywoQPm4GXs0rw@mail.gmail.com>
References: <CADnq5_OOL3UZXKXEKU8VzkZAkOnk9HM8m=nEwywoQPm4GXs0rw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Oct 2020 20:17:07 +0000
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
Cc: Dirk Gouders <dirk@gouders.net>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Commit c1cf79ca5ced46 (drm/amdgpu: use IP discovery table for renoir)
introduced a NULL pointer dereference when booting with
amdgpu.discovery=0, because it removed the call of vega10_reg_base_init()
for that case.

Fix this by calling that funcion if amdgpu_discovery == 0 in addition to
the case that amdgpu_discovery_reg_base_init() failed.

Fixes: c1cf79ca5ced46 (drm/amdgpu: use IP discovery table for renoir)
Signed-off-by: Dirk Gouders <dirk@gouders.net>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/soc15.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 84d811b6e48b..f8cb62b326d6 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -694,12 +694,12 @@ static void soc15_reg_base_init(struct amdgpu_device *adev)
 		 * it doesn't support SRIOV. */
 		if (amdgpu_discovery) {
 			r = amdgpu_discovery_reg_base_init(adev);
-			if (r) {
-				DRM_WARN("failed to init reg base from ip discovery table, "
-					 "fallback to legacy init method\n");
-				vega10_reg_base_init(adev);
-			}
+			if (r == 0)
+			  break;
+			DRM_WARN("failed to init reg base from ip discovery table, "
+				 "fallback to legacy init method\n");
 		}
+		vega10_reg_base_init(adev);
 		break;
 	case CHIP_VEGA20:
 		vega20_reg_base_init(adev);
-- 
2.26.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
