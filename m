Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C750792379
	for <lists+amd-gfx@lfdr.de>; Tue,  5 Sep 2023 16:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC0910E537;
	Tue,  5 Sep 2023 14:25:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFC910E532;
 Tue,  5 Sep 2023 14:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p9OfF2MVQ9DZR1h3haug88cOWQWikhxyyGGdZ2csv3U=; b=O9feE3RM638qCXzY0uj4c8DK2c
 WsejQEnp++vMZK07mN/VT9dX8gCxPbTZoAk26WV0I1/d2OWzvsgpJB7UL4QBGQ35Xq+Qw6Bxiz2ia
 C2xfYuHTrQ/WLYJ+6GmC2K8Du/3htJ68HCgQQmQ0EvaXwHMeg9ZY9DJTa3/1/HVa/tKvOxQ6V+ILJ
 OuMFWCnYlNmKi2nCKTb6cS1S0gNPodseH1ffAcKKz7RZ20ep49uvWleXOBx5kxpMsJmBoSGZRAi26
 JuXr3Wx5Y29nzJ1kHLJateSjNbqqG8tDbEaBKWYJj+7kgucqxvPnu0LdODWamt0TovxUooBhYN+UM
 eGC49oOA==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qdX02-002cXU-Pf; Tue, 05 Sep 2023 16:25:50 +0200
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH 2/5] drm/amd/display: fill up DCN3 DPP color state
Date: Tue,  5 Sep 2023 13:25:42 -0100
Message-Id: <20230905142545.451153-3-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230905142545.451153-1-mwen@igalia.com>
References: <20230905142545.451153-1-mwen@igalia.com>
MIME-Version: 1.0
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, sungjoon.kim@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DCN3 DPP color state was uncollected and some state elements from DCN1
doesn't fit DCN3. Create new elements according to DCN3 color caps and
fill them up for DTN log output.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  | 28 +++++++++++++++++--
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  8 ++++++
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
index 50dc83404644..a91d72f44bbd 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
@@ -46,9 +46,31 @@ void dpp30_read_state(struct dpp *dpp_base, struct dcn_dpp_state *s)
 	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
 
 	REG_GET(DPP_CONTROL,
-			DPP_CLOCK_ENABLE, &s->is_enabled);
-
-	// TODO: Implement for DCN3
+		DPP_CLOCK_ENABLE, &s->is_enabled);
+	REG_GET_2(PRE_DEGAM,
+		  PRE_DEGAM_MODE, &s->pre_dgam_mode,
+		  PRE_DEGAM_SELECT, &s->pre_dgam_select);
+	REG_GET(CM_SHAPER_CONTROL,
+		CM_SHAPER_LUT_MODE, &s->shaper_lut_mode);
+	REG_GET(CM_3DLUT_MODE,
+		CM_3DLUT_MODE_CURRENT, &s->lut3d_mode);
+	REG_GET(CM_3DLUT_READ_WRITE_CONTROL,
+		CM_3DLUT_30BIT_EN, &s->lut3d_bit_depth);
+	REG_GET(CM_3DLUT_MODE,
+		CM_3DLUT_SIZE, &s->lut3d_size);
+	// BGAM has no ROM, and definition is different, can't reuse same dump
+        REG_GET(CM_BLNDGAM_CONTROL,
+		CM_BLNDGAM_LUT_MODE, &s->rgam_lut_mode);
+	REG_GET(CM_GAMUT_REMAP_CONTROL,
+		CM_GAMUT_REMAP_MODE, &s->gamut_remap_mode);
+	if (s->gamut_remap_mode) {
+		s->gamut_remap_c11_c12 = REG_READ(CM_GAMUT_REMAP_C11_C12);
+		s->gamut_remap_c13_c14 = REG_READ(CM_GAMUT_REMAP_C13_C14);
+		s->gamut_remap_c21_c22 = REG_READ(CM_GAMUT_REMAP_C21_C22);
+		s->gamut_remap_c23_c24 = REG_READ(CM_GAMUT_REMAP_C23_C24);
+		s->gamut_remap_c31_c32 = REG_READ(CM_GAMUT_REMAP_C31_C32);
+		s->gamut_remap_c33_c34 = REG_READ(CM_GAMUT_REMAP_C33_C34);
+	}
 }
 /*program post scaler scs block in dpp CM*/
 void dpp3_program_post_csc(
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
index f4aa76e02518..7e69d9e28f5b 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
@@ -148,6 +148,14 @@ struct dcn_dpp_state {
 	uint32_t gamut_remap_c23_c24;
 	uint32_t gamut_remap_c31_c32;
 	uint32_t gamut_remap_c33_c34;
+	uint32_t shaper_lut_mode;
+	uint32_t lut3d_mode;
+	uint32_t lut3d_bit_depth;
+	uint32_t lut3d_size;
+	uint32_t blnd_lut_mode;
+	uint32_t pre_dgam_mode;
+	uint32_t pre_dgam_select;
+	uint32_t gamcor_lut_mode;
 };
 
 struct CM_bias_params {
-- 
2.40.1

