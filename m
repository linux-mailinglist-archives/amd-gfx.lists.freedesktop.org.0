Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B9F8C2DC5
	for <lists+amd-gfx@lfdr.de>; Sat, 11 May 2024 02:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A512010E040;
	Sat, 11 May 2024 00:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H6pZd7OW";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E4710E040;
 Sat, 11 May 2024 00:02:15 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-5b2735f217aso1254580eaf.2; 
 Fri, 10 May 2024 17:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715385734; x=1715990534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6+FoKAVeV49C3d+lzTBF5gbN6+gbGxYKcKh2tpj3LNU=;
 b=H6pZd7OW+9M+1G8kIG2xU19Ugsmyt55YkEiCM71ehPiJx0ILaFZ0fCM6rv1378olFD
 0jTXSS/0Jhn5kocDDSI42/kojF7w757Qd6kOQxET/PTkqY/AYq+5w0l2jfMlaMpWP/Ze
 lXTjemV3xTIjDCik8tOAcnbGmxmRCeGNT5uLV+0D+2o3Xqy1n5k2fLZ8F3Vu63R8f3Ol
 WGG8ltRwUC9Vta1bUKPfE2avuptg1rxAirfRRY1XFKbBlN8RIrWs79c8ib2vWJKh3WqL
 yeML8TppRnqzydzzrWCsUm6XoiCmmOVRz7Ea7h9u4O/vEXUXKLqpCwDQEKgKV8QOut2x
 IZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715385734; x=1715990534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6+FoKAVeV49C3d+lzTBF5gbN6+gbGxYKcKh2tpj3LNU=;
 b=BTey/nDV3aLuibc/Tynu4aTZ+qF3BAGXPAvfgoLnXGMg73SglXdXPJ9BF03cWWzBqL
 6VozwVO5zIM7F4TyDLrdchypmlTBKGREdCKjfXRIGtT3RZkzes18JRBGIX0uIu2fs4Di
 ywDdmWuFLqeItBoAZQxEjveUcCeEe3RtLSEILTzJPZmE/TASL7B6jv1wb+8H37yldMim
 9J4kXEWnWu99ml6iXZhkr05JwgRvdimq3UtuNKQ99/mFP4QoQD4h8ml3sVei3/8jzkAr
 BUz5dA+/AWF5nDGEhBdR2CRCrPvfOh2Q699DTuscboRjDidUvTbwD4F5Z+oBiy50txP7
 a9JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3a+vpBXcPvksSICkEt4ffHYEQifT2MFNWeTLu7Wi3LTWajNkMqxbaVHwPf+wZ+CnWHw9u/C8PPLgAQbAFmXtz29TO791Ufmc34xq8LBefzF9ErGHGEBX0OByJVYrVfV3dg8TWqAGmzO0ts8SYIw==
X-Gm-Message-State: AOJu0Yw86uwaWRtCPjTuNylLXRuOtzqmOYKaaST5vWlBYPzt/2Fj8gVB
 opXU46nHPw+/tIue8vUjS+DFY49W31ErgFSAsooVSRupnS9/2B08
X-Google-Smtp-Source: AGHT+IFmt1mR0GVX6HytJXSpYSFJDvybWwQqJhZtHE4qTOEoJzu4+YXsr4sa5kZN+uWTOc9mluvEsA==
X-Received: by 2002:a05:6870:8dc9:b0:23b:ed9:1f53 with SMTP id
 586e51a60fabf-24172fd265fmr5138016fac.53.1715385733361; 
 Fri, 10 May 2024 17:02:13 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f0:7580:e32:4cfd:93f8:bdfd:52e8])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a81478sm3477423b3a.59.2024.05.10.17.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 17:02:12 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
To: sfr@canb.auug.org.au, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/amd/display: fix documentation warnings for mpc.h
Date: Fri, 10 May 2024 21:02:02 -0300
Message-ID: <20240511000203.28505-1-marcelomspessoto@gmail.com>
X-Mailer: git-send-email 2.45.0
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix most of the display documentation compile warnings by
documenting struct mpc_funcs functions in dc/inc/hw/mpc.h file.

Remove the following warnings:
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'read_mpcc_state' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'mpc_init_single_inst' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'get_mpcc_for_dpp_from_secondary' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'get_mpcc_for_dpp' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'wait_for_idle' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'assert_mpcc_idle_before_connect' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'init_mpcc_list_from_hw' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'set_denorm' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'set_denorm_clamp' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'set_output_csc' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'set_ocsc_default' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'set_output_gamma' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'power_on_mpc_mem_pwr' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'set_dwb_mux' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'disable_dwb_mux' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'is_dwb_idle' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'set_out_rate_control' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'set_gamut_remap' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'program_1dlut' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'program_shaper' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'acquire_rmu' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'program_3dlut' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'release_rmu' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'get_mpc_out_mux' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'set_bg_color' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'set_mpc_mem_lp_mode' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'set_movable_cm_location' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'update_3dlut_fast_load_select' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'get_3dlut_fast_load_status' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'populate_lut' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'program_lut_read_write_control' not described in 'mpc_funcs'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:579: warning: Function parameter or struct member 'program_lut_mode' not described in 'mpc_funcs'

Fixes:
b8c1c3a82e75 ("Documentation/gpu: Add kernel doc entry for MPC")

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 689 ++++++++++++++++----
 1 file changed, 576 insertions(+), 113 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index dd786600668f..14813891baa4 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -1,4 +1,5 @@
-/* Copyright 2012-15 Advanced Micro Devices, Inc.
+/*
+ * Copyright 2012-15 Advanced Micro Devices, Inc.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -306,33 +307,48 @@ struct mpcc_state {
  * struct mpc_funcs - funcs
  */
 struct mpc_funcs {
+	/**
+	* @read_mpcc_state:
+	*
+	* Read register content from given MPCC physical instance.
+	*
+	* Parameters:
+	*
+	* - [in/out] mpc - MPC context
+	* - [in] mpcc_instance - MPC context instance
+	* - [in] mpcc_state - MPC context state
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*read_mpcc_state)(
 			struct mpc *mpc,
 			int mpcc_inst,
 			struct mpcc_state *s);
 
 	/**
-	 * @insert_plane:
-	 *
-	 * Insert DPP into MPC tree based on specified blending position.
-	 * Only used for planes that are part of blending chain for OPP output
-	 *
-	 * Parameters:
-	 *
-	 * - [in/out] mpc  - MPC context.
-	 * - [in/out] tree - MPC tree structure that plane will be added to.
-	 * - [in] blnd_cfg - MPCC blending configuration for the new blending layer.
-	 * - [in] sm_cfg   - MPCC stereo mix configuration for the new blending layer.
-	 *                   stereo mix must disable for the very bottom layer of the tree config.
-	 * - [in] insert_above_mpcc - Insert new plane above this MPCC.
-	 *                          If NULL, insert as bottom plane.
-	 * - [in] dpp_id  - DPP instance for the plane to be added.
-	 * - [in] mpcc_id - The MPCC physical instance to use for blending.
-	 *
-	 * Return:
-	 *
-	 * struct mpcc* - MPCC that was added.
-	 */
+	* @insert_plane:
+	*
+	* Insert DPP into MPC tree based on specified blending position.
+	* Only used for planes that are part of blending chain for OPP output
+	*
+	* Parameters:
+	*
+	* - [in/out] mpc  - MPC context.
+	* - [in/out] tree - MPC tree structure that plane will be added to.
+	* - [in] blnd_cfg - MPCC blending configuration for the new blending layer.
+	* - [in] sm_cfg   - MPCC stereo mix configuration for the new blending layer.
+	*                   stereo mix must disable for the very bottom layer of the tree config.
+	* - [in] insert_above_mpcc - Insert new plane above this MPCC.
+	*                          If NULL, insert as bottom plane.
+	* - [in] dpp_id  - DPP instance for the plane to be added.
+	* - [in] mpcc_id - The MPCC physical instance to use for blending.
+	*
+	* Return:
+	*
+	* struct mpcc* - MPCC that was added.
+	*/
 	struct mpcc* (*insert_plane)(
 			struct mpc *mpc,
 			struct mpc_tree *tree,
@@ -343,107 +359,117 @@ struct mpc_funcs {
 			int mpcc_id);
 
 	/**
-	 * @remove_mpcc:
-	 *
-	 * Remove a specified MPCC from the MPC tree.
-	 *
-	 * Parameters:
-	 *
-	 * - [in/out] mpc   - MPC context.
-	 * - [in/out] tree  - MPC tree structure that plane will be removed from.
-	 * - [in/out] mpcc  - MPCC to be removed from tree.
-	 *
-	 * Return:
-	 *
-	 * void
-	 */
+	* @remove_mpcc:
+	*
+	* Remove a specified MPCC from the MPC tree.
+	*
+	* Parameters:
+	*
+	* - [in/out] mpc   - MPC context.
+	* - [in/out] tree  - MPC tree structure that plane will be removed from.
+	* - [in/out] mpcc  - MPCC to be removed from tree.
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*remove_mpcc)(
 			struct mpc *mpc,
 			struct mpc_tree *tree,
 			struct mpcc *mpcc);
 
 	/**
-	 * @mpc_init:
-	 *
-	 * Reset the MPCC HW status by disconnecting all muxes.
-	 *
-	 * Parameters:
-	 *
-	 * - [in/out] mpc - MPC context.
-	 *
-	 * Return:
-	 *
-	 * void
-	 */
+	* @mpc_init:
+	*
+	* Reset the MPCC HW status by disconnecting all muxes.
+	*
+	* Parameters:
+	*
+	* - [in/out] mpc - MPC context.
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*mpc_init)(struct mpc *mpc);
+
+	/**
+	* @mpc_init_single_inst:
+	*
+	* Initialize given MPCC physical instance.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] mpcc_id - The MPCC physical instance to be initialized.
+	*/
 	void (*mpc_init_single_inst)(
 			struct mpc *mpc,
 			unsigned int mpcc_id);
 
 	/**
-	 * @update_blending:
-	 *
-	 * Update the blending configuration for a specified MPCC.
-	 *
-	 * Parameters:
-	 *
-	 * - [in/out] mpc - MPC context.
-	 * - [in] blnd_cfg - MPCC blending configuration.
-	 * - [in] mpcc_id  - The MPCC physical instance.
-	 *
-	 * Return:
-	 *
-	 * void
-	 */
+	* @update_blending:
+	*
+	* Update the blending configuration for a specified MPCC.
+	*
+	* Parameters:
+	*
+	* - [in/out] mpc - MPC context.
+	* - [in] blnd_cfg - MPCC blending configuration.
+	* - [in] mpcc_id  - The MPCC physical instance.
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*update_blending)(
 		struct mpc *mpc,
 		struct mpcc_blnd_cfg *blnd_cfg,
 		int mpcc_id);
 
 	/**
-	 * @cursor_lock:
-	 *
-	 * Lock cursor updates for the specified OPP. OPP defines the set of
-	 * MPCC that are locked together for cursor.
-	 *
-	 * Parameters:
-	 *
-	 * - [in] mpc - MPC context.
-	 * - [in] opp_id  - The OPP to lock cursor updates on
-	 * - [in] lock - lock/unlock the OPP
-	 *
-	 * Return:
-	 *
-	 * void
-	 */
+	* @cursor_lock:
+	*
+	* Lock cursor updates for the specified OPP. OPP defines the set of
+	* MPCC that are locked together for cursor.
+	*
+	* Parameters:
+	*
+	* - [in] mpc - MPC context.
+	* - [in] opp_id  - The OPP to lock cursor updates on
+	* - [in] lock - lock/unlock the OPP
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*cursor_lock)(
 			struct mpc *mpc,
 			int opp_id,
 			bool lock);
 
 	/**
-	 * @insert_plane_to_secondary:
-	 *
-	 * Add DPP into secondary MPC tree based on specified blending
-	 * position.  Only used for planes that are part of blending chain for
-	 * DWB output
-	 *
-	 * Parameters:
-	 *
-	 * - [in/out] mpc  - MPC context.
-	 * - [in/out] tree - MPC tree structure that plane will be added to.
-	 * - [in] blnd_cfg - MPCC blending configuration for the new blending layer.
-	 * - [in] sm_cfg   - MPCC stereo mix configuration for the new blending layer.
-	 *	    stereo mix must disable for the very bottom layer of the tree config.
-	 * - [in] insert_above_mpcc - Insert new plane above this MPCC.  If
-	 *          NULL, insert as bottom plane.
-	 * - [in] dpp_id - DPP instance for the plane to be added.
-	 * - [in] mpcc_id - The MPCC physical instance to use for blending.
-	 *
-	 * Return:
-	 *
-	 * struct mpcc* - MPCC that was added.
-	 */
+	* @insert_plane_to_secondary:
+	*
+	* Add DPP into secondary MPC tree based on specified blending
+	* position.  Only used for planes that are part of blending chain for
+	* DWB output
+	*
+	* Parameters:
+	*
+	* - [in/out] mpc  - MPC context.
+	* - [in/out] tree - MPC tree structure that plane will be added to.
+	* - [in] blnd_cfg - MPCC blending configuration for the new blending layer.
+	* - [in] sm_cfg   - MPCC stereo mix configuration for the new blending layer.
+	*	    stereo mix must disable for the very bottom layer of the tree config.
+	* - [in] insert_above_mpcc - Insert new plane above this MPCC.  If
+	*          NULL, insert as bottom plane.
+	* - [in] dpp_id - DPP instance for the plane to be added.
+	* - [in] mpcc_id - The MPCC physical instance to use for blending.
+	*
+	* Return:
+	*
+	* struct mpcc* - MPCC that was added.
+	*/
 	struct mpcc* (*insert_plane_to_secondary)(
 			struct mpc *mpc,
 			struct mpc_tree *tree,
@@ -454,81 +480,301 @@ struct mpc_funcs {
 			int mpcc_id);
 
 	/**
-	 * @remove_mpcc_from_secondary:
-	 *
-	 * Remove a specified DPP from the 'secondary' MPC tree.
-	 *
-	 * Parameters:
-	 *
-	 * - [in/out] mpc  - MPC context.
-	 * - [in/out] tree - MPC tree structure that plane will be removed from.
-	 * - [in]     mpcc - MPCC to be removed from tree.
-	 *
-	 * Return:
-	 *
-	 * void
-	 */
+	* @remove_mpcc_from_secondary:
+	*
+	* Remove a specified DPP from the 'secondary' MPC tree.
+	*
+	* Parameters:
+	*
+	* - [in/out] mpc  - MPC context.
+	* - [in/out] tree - MPC tree structure that plane will be removed from.
+	* - [in]     mpcc - MPCC to be removed from tree.
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*remove_mpcc_from_secondary)(
 			struct mpc *mpc,
 			struct mpc_tree *tree,
 			struct mpcc *mpcc);
 
+	/**
+	* @get_mpcc_for_dpp_from_secondary:
+	*
+	* Find, if it exists, a MPCC from a given 'secondary' MPC tree that
+	* is associated with specified plane.
+	*
+	* Parameters:
+	* - [in/out] tree - MPC tree structure to search for plane.
+	* - [in] dpp_id - DPP to be searched.
+	*
+	* Return:
+	*
+	* struct mpcc* - pointer to plane or NULL if no plane found.
+	*/
 	struct mpcc* (*get_mpcc_for_dpp_from_secondary)(
 			struct mpc_tree *tree,
 			int dpp_id);
 
+	/**
+	* @get_mpcc_for_dpp:
+	*
+	* Find, if it exists, a MPCC from a given MPC tree that
+	* is associated with specified plane.
+	*
+	* Parameters:
+	* - [in/out] tree - MPC tree structure to search for plane.
+	* - [in] dpp_id - DPP to be searched.
+	*
+	* Return:
+	*
+	* struct mpcc* - pointer to plane or NULL if no plane found.
+	*/
 	struct mpcc* (*get_mpcc_for_dpp)(
 			struct mpc_tree *tree,
 			int dpp_id);
 
+	/**
+	* @wait_for_idle:
+	*
+	* Wait for a MPCC in MPC context to enter idle state.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC Context.
+	* - [in] id - MPCC to wait for idle state.
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*wait_for_idle)(struct mpc *mpc, int id);
 
+	/**
+	* @assert_mpcc_idle_before_connect:
+	*
+	* Assert if MPCC in MPC context is in idle state.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] id - MPCC to assert idle state.
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*assert_mpcc_idle_before_connect)(struct mpc *mpc, int mpcc_id);
 
+	/**
+	* @init_mpcc_list_from_hw:
+	*
+	* Iterate through the MPCC array from a given MPC context struct
+	* and configure each MPCC according to its registers' values.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context to initialize MPCC array.
+	* - [in/out] tree - MPC tree structure containing MPCC contexts to initialize.
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*init_mpcc_list_from_hw)(
 		struct mpc *mpc,
 		struct mpc_tree *tree);
 
+	/**
+	* @set_denorm:
+	*
+	* Set corresponding OPP DENORM_CONTROL register value to specific denorm_mode
+	* based on given color depth.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] opp_id - Corresponding OPP to update register.
+	* - [in] output_depth - Arbitrary color depth to set denorm_mode.
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*set_denorm)(struct mpc *mpc,
 			int opp_id,
 			enum dc_color_depth output_depth);
 
+	/**
+	* @set_denorm_clamp:
+	*
+	* Set denorm clamp values on corresponding OPP DENORM CONTROL register.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] opp_id - Corresponding OPP to update register.
+	* - [in] denorm_clamp - Arbitrary denorm clamp to be set.
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*set_denorm_clamp)(
 			struct mpc *mpc,
 			int opp_id,
 			struct mpc_denorm_clamp denorm_clamp);
 
+	/**
+	* @set_output_csc:
+	*
+	* Set the Output Color Space Conversion matrix
+	* with given values and mode.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] opp_id - Corresponding OPP to update register.
+	* - [in] regval - Values to set in CSC matrix.
+	* - [in] ocsc_mode - Mode to set CSC.
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*set_output_csc)(struct mpc *mpc,
 			int opp_id,
 			const uint16_t *regval,
 			enum mpc_output_csc_mode ocsc_mode);
 
+	/**
+	* @set_ocsc_default:
+	*
+	* Set the Output Color Space Conversion matrix
+	* to default values according to color space.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] opp_id - Corresponding OPP to update register.
+	* - [in] color_space - OCSC color space.
+	* - [in] ocsc_mode - Mode to set CSC.
+	*
+	* Return:
+	*
+	* void
+	*
+	*/
 	void (*set_ocsc_default)(struct mpc *mpc,
 			int opp_id,
 			enum dc_color_space color_space,
 			enum mpc_output_csc_mode ocsc_mode);
 
+	/**
+	* @set_output_gamma:
+	*
+	* Set Output Gamma with given curve parameters.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] mpcc_id - Corresponding MPC to update registers.
+	* - [in] params - Parameters.
+	*
+	* Return:
+	*
+	* void
+	*
+	*/
 	void (*set_output_gamma)(
 			struct mpc *mpc,
 			int mpcc_id,
 			const struct pwl_params *params);
+	/**
+	* @power_on_mpc_mem_pwr:
+	*
+	* Power on/off memory LUT for given MPCC.
+	* Powering on enables LUT to be updated.
+	* Powering off allows entering low power mode.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] mpcc_id - MPCC to power on.
+	* - [in] power_on
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*power_on_mpc_mem_pwr)(
 			struct mpc *mpc,
 			int mpcc_id,
 			bool power_on);
+	/**
+	* @set_dwb_mux:
+	*
+	* Set corresponding Display Writeback mux
+	* MPC register field to given MPCC id.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] dwb_id - DWB to be set.
+	* - [in] mpcc_id - MPCC id to be stored in DWB mux register.
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*set_dwb_mux)(
 			struct mpc *mpc,
 			int dwb_id,
 			int mpcc_id);
 
+	/**
+	* @disable_dwb_mux:
+	*
+	* Reset corresponding Display Writeback mux
+	* MPC register field.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] dwb_id - DWB to be set.
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*disable_dwb_mux)(
 		struct mpc *mpc,
 		int dwb_id);
 
+	/**
+	* @is_dwb_idle:
+	*
+	* Check DWB status on MPC_DWB0_MUX_STATUS register field.
+	* Return if it is null.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] dwb_id - DWB to be checked.
+	*
+	* Return:
+	*
+	* bool - wheter DWB is idle or not
+	*/
 	bool (*is_dwb_idle)(
 		struct mpc *mpc,
 		int dwb_id);
 
+	/**
+	* @set_out_rate_control:
+	*
+	* Set display output rate control.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] opp_id - OPP to be set.
+	* - [in] enable
+	* - [in] rate_2x_mode
+	* - [in] flow_control
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*set_out_rate_control)(
 		struct mpc *mpc,
 		int opp_id,
@@ -536,44 +782,261 @@ struct mpc_funcs {
 		bool rate_2x_mode,
 		struct mpc_dwb_flow_control *flow_control);
 
+	/**
+	* @set_gamut_remap:
+	*
+	* Set post-blending CTM for given MPCC.
+	*
+	* Parameters:
+	* - [in] mpc - MPC context.
+	* - [in] mpcc_id - MPCC to set gamut map.
+	* - [in] adjust
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*set_gamut_remap)(
 			struct mpc *mpc,
 			int mpcc_id,
 			const struct mpc_grph_gamut_adjustment *adjust);
 
+	/**
+	* @program_1dlut:
+	*
+	* Set 1 dimensional Lookup Table.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context
+	* - [in] params - curve parameters for the LUT configuration
+	* - [in] rmu_idx
+	*
+	* bool - wheter LUT was set (set with given parameters) or not (params is NULL and LUT is disabled).
+	*/
 	bool (*program_1dlut)(
 			struct mpc *mpc,
 			const struct pwl_params *params,
 			uint32_t rmu_idx);
 
+	/**
+	* @program_shaper:
+	*
+	* Set shaper.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context
+	* - [in] params - curve parameters to be set
+	* - [in] rmu_idx
+	*
+	* Return:
+	*
+	* bool - wheter shaper was set (set with given parameters) or not (params is NULL and LUT is disabled).
+	*/
 	bool (*program_shaper)(
 			struct mpc *mpc,
 			const struct pwl_params *params,
 			uint32_t rmu_idx);
 
+	/**
+	* @acquire_rmu:
+	*
+	* Set given MPCC to be multiplexed to given RMU unit.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context
+	* - [in] mpcc_id - MPCC
+	* - [in] rmu_idx - Given RMU unit to set MPCC to be multiplexed to.
+	*
+	* Return:
+	*
+	* unit32_t - rmu_idx if operation was successful, -1 else.
+	*/
 	uint32_t (*acquire_rmu)(struct mpc *mpc, int mpcc_id, int rmu_idx);
 
+	/**
+	* @program_3dlut:
+	*
+	* Set 3 dimensional Lookup Table.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context
+	* - [in] params - tetrahedral parameters for the LUT configuration
+	* - [in] rmu_idx
+	*
+	* bool - wheter LUT was set (set with given parameters) or not (params is NULL and LUT is disabled).
+	*/
 	bool (*program_3dlut)(
 			struct mpc *mpc,
 			const struct tetrahedral_params *params,
 			int rmu_idx);
 
+	/**
+	* @release_rmu:
+	*
+	* For a given MPCC, release the RMU unit it muliplexes to.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context
+	* - [in] mpcc_id - MPCC
+	*
+	* Return:
+	*
+	* int - a valid rmu_idx representing released RMU unit or -1 if there was no RMU unit to release.
+	*/
 	int (*release_rmu)(struct mpc *mpc, int mpcc_id);
 
+	/**
+	* @get_mpc_out_mux:
+	*
+	* Return MPC out mux.
+	*
+	* Parameters:
+	* - [in] mpc - MPC context.
+	* - [in] opp_id - OPP
+	*
+	* Return:
+	*
+	* unsigned int - Out Mux
+	*/
 	unsigned int (*get_mpc_out_mux)(
 				struct mpc *mpc,
 				int opp_id);
 
+	/**
+	* @set_bg_color:
+	*
+	* Find corresponding bottommost MPCC and
+	* set its bg color.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] bg_color - background color to be set.
+	* - [in] mpcc_id
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*set_bg_color)(struct mpc *mpc,
 			struct tg_color *bg_color,
 			int mpcc_id);
+
+	/**
+	* @set_mpc_mem_lp_mode:
+	*
+	* Set mpc_mem_lp_mode.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	*
+	* Return:
+	*
+	* void
+	*/
+
 	void (*set_mpc_mem_lp_mode)(struct mpc *mpc);
+	/**
+	* @set_movable_cm_location:
+	*
+	* Set Movable CM Location.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] location
+	* - [in] mpcc_id
+	*
+	* Return:
+	*
+	* void
+	*/
+
 	void (*set_movable_cm_location)(struct mpc *mpc, enum mpcc_movable_cm_location location, int mpcc_id);
+	/**
+	* @update_3dlut_fast_load_select:
+	*
+	* Update 3D LUT fast load select.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] mpcc_id
+	* - [in] hubp_idx
+	*
+	* Return:
+	*
+	* void
+	*/
+
 	void (*update_3dlut_fast_load_select)(struct mpc *mpc, int mpcc_id, int hubp_idx);
+	/**
+	* @get_3dlut_fast_load_status:
+	*
+	* Get 3D LUT fast load status and reference them with done, soft_underflow and hard_underflow pointers.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] mpcc_id
+	* - [in/out] done
+	* - [in/out] soft_underflow
+	* - [in/out] hard_underflow
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*get_3dlut_fast_load_status)(struct mpc *mpc, int mpcc_id, uint32_t *done, uint32_t *soft_underflow, uint32_t *hard_underflow);
+
+	/**
+	* @populate_lut:
+	*
+	* Populate LUT with given tetrahedral parameters.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] id
+	* - [in] params
+	* - [in] lut_bank_a
+	* - [in] mpcc_id
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*populate_lut)(struct mpc *mpc, const enum MCM_LUT_ID id, const union mcm_lut_params params,
 			bool lut_bank_a, int mpcc_id);
+
+	/**
+	* @program_lut_read_write_control:
+	*
+	* Program LUT RW control.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] id
+	* - [in] lut_bank_a
+	* - [in] mpcc_id
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*program_lut_read_write_control)(struct mpc *mpc, const enum MCM_LUT_ID id, bool lut_bank_a, int mpcc_id);
+
+	/**
+	* @program_lut_mode:
+	*
+	* Program LUT mode.
+	*
+	* Parameters:
+	* - [in/out] mpc - MPC context.
+	* - [in] id
+	* - [in] xable
+	* - [in] lut_bank_a
+	* - [in] mpcc_id
+	*
+	* Return:
+	*
+	* void
+	*/
 	void (*program_lut_mode)(struct mpc *mpc, const enum MCM_LUT_ID id, const enum MCM_LUT_XABLE xable,
 			bool lut_bank_a, int mpcc_id);
 };
-- 
2.45.0

