Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5516FB110
	for <lists+amd-gfx@lfdr.de>; Mon,  8 May 2023 15:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CADC10E2B9;
	Mon,  8 May 2023 13:14:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F1A10E1D8;
 Mon,  8 May 2023 09:58:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 32EDA62289;
 Mon,  8 May 2023 09:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184E3C433D2;
 Mon,  8 May 2023 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1683539930;
 bh=U3AASTqeuFKaMjf51fir0o9dcPQyM3LFthotgOzvu8Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lN1Ut02THPBG6IPl0ysFWUgC1TNdhSrgGwXlVSgOqlHHUSOasTZlrzkkEg7r5JpnR
 nVY7+LRV94FRZ178GVj23six586HzCPepdNWFlcO5+uMy34KpC0AV03HU97u48DIx9
 auYtomh19tsiRW6z00lAsgOcfGR84Xufy7PWp4Fk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.1 184/611] drm/amd/display/dc/dce60/Makefile: Fix previous
 attempt to silence known override-init warnings
Date: Mon,  8 May 2023 11:40:26 +0200
Message-Id: <20230508094428.352057176@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230508094421.513073170@linuxfoundation.org>
References: <20230508094421.513073170@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 May 2023 13:14:32 +0000
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
Cc: Sasha Levin <sashal@kernel.org>, Lee Jones <lee@kernel.org>,
 Leo Li <sunpeng.li@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Rossi <issor.oruam@gmail.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, patches@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Lee Jones <lee@kernel.org>

[ Upstream commit 4082b9f5ead4966797dddcfef0905d59e5a83873 ]

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:157:21: note: in expansion of macro ‘mmCRTC1_DCFE_MEM_LIGHT_SLEEP_CNTL’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.h:170:9: note: in expansion of macro ‘SRI’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:183:17: note: in expansion of macro ‘XFM_COMMON_REG_LIST_DCE60’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:188:17: note: in expansion of macro ‘transform_regs’
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:722:43: warning: initialized field overwritten [-Woverride-init]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:157:21: note: in expansion of macro ‘mmCRTC2_DCFE_MEM_LIGHT_SLEEP_CNTL’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.h:170:9: note: in expansion of macro ‘SRI’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:183:17: note: in expansion of macro ‘XFM_COMMON_REG_LIST_DCE60’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:189:17: note: in expansion of macro ‘transform_regs’
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:722:43: note: (near initialization for ‘xfm_regs[2].DCFE_MEM_LIGHT_SLEEP_CN

[100 lines snipped for brevity]

Fixes: ceb3cf476a441 ("drm/amd/display/dc/dce60/Makefile: Ignore -Woverride-init warning")
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Mauro Rossi <issor.oruam@gmail.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dce60/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce60/Makefile b/drivers/gpu/drm/amd/display/dc/dce60/Makefile
index dda596fa1cd76..fee331accc0e7 100644
--- a/drivers/gpu/drm/amd/display/dc/dce60/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dce60/Makefile
@@ -23,7 +23,7 @@
 # Makefile for the 'controller' sub-component of DAL.
 # It provides the control and status of HW CRTC block.
 
-CFLAGS_AMDDALPATH)/dc/dce60/dce60_resource.o = $(call cc-disable-warning, override-init)
+CFLAGS_$(AMDDALPATH)/dc/dce60/dce60_resource.o = $(call cc-disable-warning, override-init)
 
 DCE60 = dce60_timing_generator.o dce60_hw_sequencer.o \
 	dce60_resource.o
-- 
2.39.2



