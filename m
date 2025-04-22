Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095D4A95921
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Apr 2025 00:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0E510E4B0;
	Mon, 21 Apr 2025 22:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qusPzcwO";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF3F10E059
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Apr 2025 22:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/K+a/Lgob9LWkyrnWcDgyLt0KHAqAEgQPfw/PNzNhdw=; b=qusPzcwODs+ezUhcSchfMWlYR4
 i/WBHdmMQ9/hfjwWq4RR8tsQ8YVrzJeV71LlpYxVRP5bZ/vyDLaqQrbbh1ju6BQ+FyT3CSVNueBsT
 Z1mMxIDT/7c8Vmo2bcrjD7oJaFzBofd4uSymPx8Vu6HPXqW6RX45OIlcFKV8ZXfnx549xqQrenHhv
 96fO8an8Y9I6L26VKYvhU5OFg+bBYsNzOEP1g8C2GcXz33JLgnVA2Qr+sZHM05ySjn1TINg+nSKj1
 Y280BDkDvzad+JxIAQBOJlQ9r9WjRGwo55DGNXY214lF96yaIiUPs55AJQUs9Rwl7vjAjg6SR++vd
 fxoMgc0w==;
Received: from d162-157-58-14.abhsia.telus.net ([162.157.58.14]
 helo=maloca.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u6zTI-006CMY-IZ; Tue, 22 Apr 2025 00:18:36 +0200
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH v3 3/9] drm/amdgpu/gfx: Use CSB helpers in
 gfx_v10_0_get_csb_buffer
Date: Mon, 21 Apr 2025 16:12:20 -0600
Message-ID: <20250421221616.387927-4-siqueira@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421221616.387927-1-siqueira@igalia.com>
References: <20250421221616.387927-1-siqueira@igalia.com>
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

Remove duplicate code by using CSB helpers.

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 34 ++++----------------------
 1 file changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index e140f673d25a..75ea071744eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -4325,9 +4325,7 @@ static u32 gfx_v10_0_get_csb_size(struct amdgpu_device *adev)
 static void gfx_v10_0_get_csb_buffer(struct amdgpu_device *adev,
 				    volatile u32 *buffer)
 {
-	u32 count = 0, i;
-	const struct cs_section_def *sect = NULL;
-	const struct cs_extent_def *ext = NULL;
+	u32 count = 0;
 	int ctx_reg_offset;
 
 	if (adev->gfx.rlc.cs_data == NULL)
@@ -4335,37 +4333,15 @@ static void gfx_v10_0_get_csb_buffer(struct amdgpu_device *adev,
 	if (buffer == NULL)
 		return;
 
-	buffer[count++] = cpu_to_le32(PACKET3(PACKET3_PREAMBLE_CNTL, 0));
-	buffer[count++] = cpu_to_le32(PACKET3_PREAMBLE_BEGIN_CLEAR_STATE);
-
-	buffer[count++] = cpu_to_le32(PACKET3(PACKET3_CONTEXT_CONTROL, 1));
-	buffer[count++] = cpu_to_le32(0x80000000);
-	buffer[count++] = cpu_to_le32(0x80000000);
-
-	for (sect = adev->gfx.rlc.cs_data; sect->section != NULL; ++sect) {
-		for (ext = sect->section; ext->extent != NULL; ++ext) {
-			if (sect->id == SECT_CONTEXT) {
-				buffer[count++] =
-					cpu_to_le32(PACKET3(PACKET3_SET_CONTEXT_REG, ext->reg_count));
-				buffer[count++] = cpu_to_le32(ext->reg_index -
-						PACKET3_SET_CONTEXT_REG_START);
-				for (i = 0; i < ext->reg_count; i++)
-					buffer[count++] = cpu_to_le32(ext->extent[i]);
-			}
-		}
-	}
+	count = amdgpu_gfx_csb_preamble_start(buffer);
+	count = amdgpu_gfx_csb_data_parser(adev, buffer, count);
 
-	ctx_reg_offset =
-		SOC15_REG_OFFSET(GC, 0, mmPA_SC_TILE_STEERING_OVERRIDE) - PACKET3_SET_CONTEXT_REG_START;
+	ctx_reg_offset = SOC15_REG_OFFSET(GC, 0, mmPA_SC_TILE_STEERING_OVERRIDE) - PACKET3_SET_CONTEXT_REG_START;
 	buffer[count++] = cpu_to_le32(PACKET3(PACKET3_SET_CONTEXT_REG, 1));
 	buffer[count++] = cpu_to_le32(ctx_reg_offset);
 	buffer[count++] = cpu_to_le32(adev->gfx.config.pa_sc_tile_steering_override);
 
-	buffer[count++] = cpu_to_le32(PACKET3(PACKET3_PREAMBLE_CNTL, 0));
-	buffer[count++] = cpu_to_le32(PACKET3_PREAMBLE_END_CLEAR_STATE);
-
-	buffer[count++] = cpu_to_le32(PACKET3(PACKET3_CLEAR_STATE, 0));
-	buffer[count++] = cpu_to_le32(0);
+	amdgpu_gfx_csb_preamble_end(buffer, count);
 }
 
 static void gfx_v10_0_rlc_fini(struct amdgpu_device *adev)
-- 
2.49.0

