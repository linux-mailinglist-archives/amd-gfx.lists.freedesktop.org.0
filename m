Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2134FCA43
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Apr 2022 02:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0721E10FB14;
	Tue, 12 Apr 2022 00:51:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D117410FB14;
 Tue, 12 Apr 2022 00:51:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E35C60B2E;
 Tue, 12 Apr 2022 00:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED33EC385A3;
 Tue, 12 Apr 2022 00:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724659;
 bh=nKmMu+KnxSgHmcBz+S9jEpKqr6ERgs4IgBTbiWUWDSE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IzFYhUUiIZ0+K9pBMrlzBPQlTv0YijQY+wXsenwFY30MR7uCX0NlMF6RCQIjkb/gq
 qS8HI8BKLYbG2lFBj2HuYGnKwr6z97Zdf/q8L54mlqSqV5n9UfHYoYBL9FvOxrMUIs
 i1+iMDehOUbiovWMk56nf8sGtSUpdn6FBNpqw82BSZcM15tWTwxS+vBLfWI3ncX8lU
 jzdd9AeMFkTSZkhC88LceexHT9pa7wFK1I0G5yb9ITME+1dE740Qzoy/so/lD8xfna
 26DGZcKs5k2RkAMCmAMeFcqvn1OnqPxAp0/BY2lJ+uWcUDdMcs4a5Bls0f7U0jY6R7
 JgklxQhN7yQQw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 03/21] drm/amd/display: Update VTEM Infopacket
 definition
Date: Mon, 11 Apr 2022 20:50:22 -0400
Message-Id: <20220412005042.351105-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412005042.351105-1-sashal@kernel.org>
References: <20220412005042.351105-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Krunoslav.Kovac@amd.com,
 Chris Park <Chris.Park@amd.com>, Alex Hung <alex.hung@amd.com>,
 airlied@linux.ie, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, Reza.Amini@amd.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>, harry.wentland@amd.com,
 christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: "Leo (Hanghong) Ma" <hanghong.ma@amd.com>

[ Upstream commit c9fbf6435162ed5fb7201d1d4adf6585c6a8c327 ]

[Why & How]
The latest HDMI SPEC has updated the VTEM packet structure,
so change the VTEM Infopacket defined in the driver side to align
with the SPEC.

Reviewed-by: Chris Park <Chris.Park@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Leo (Hanghong) Ma <hanghong.ma@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/modules/info_packet/info_packet.c    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index d885d642ed7f..537736713598 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -85,7 +85,8 @@
 //PB7 = MD0
 #define MASK_VTEM_MD0__VRR_EN         0x01
 #define MASK_VTEM_MD0__M_CONST        0x02
-#define MASK_VTEM_MD0__RESERVED2      0x0C
+#define MASK_VTEM_MD0__QMS_EN         0x04
+#define MASK_VTEM_MD0__RESERVED2      0x08
 #define MASK_VTEM_MD0__FVA_FACTOR_M1  0xF0
 
 //MD1
@@ -94,7 +95,7 @@
 //MD2
 #define MASK_VTEM_MD2__BASE_REFRESH_RATE_98  0x03
 #define MASK_VTEM_MD2__RB                    0x04
-#define MASK_VTEM_MD2__RESERVED3             0xF8
+#define MASK_VTEM_MD2__NEXT_TFR              0xF8
 
 //MD3
 #define MASK_VTEM_MD3__BASE_REFRESH_RATE_07  0xFF
-- 
2.35.1

