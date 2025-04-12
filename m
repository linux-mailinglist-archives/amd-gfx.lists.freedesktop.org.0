Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2AEA86F4E
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Apr 2025 22:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2F910E3F2;
	Sat, 12 Apr 2025 20:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WpGcjbUN";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C90710E3F2
 for <amd-gfx@lists.freedesktop.org>; Sat, 12 Apr 2025 20:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YMsEYhKZb3c6wP5Uif3JKB9iubme0eHsYvGIJ931pqQ=; b=WpGcjbUNXyOhzXmVJbfBpdWJMj
 931qzcMkSoJC1VlM0/6NOnw2deZZaizE7tUDYqAUuspAUdt2LUpiTMVvxGxhmKZD8G9bbXtveo+YC
 WPgBrEknyC8UWcha7N5p2YdC9Hx4dchD/XfSsoQbkA7atRLMhltX60vR7UdAGsLRvwSTiVe4KNT+X
 vZg6HeOlf/JiMFWtOIoU4PyL+WWQIq8g44Vu5rdBirhbEhNVbs7g1uc/JTTyEzKbqx0zd7dUWZx8o
 vB4vQLh5x78OA47R2EblTe0w7WkMMmi4cyfUcyNxuDmNetPn9MVVXHM99FHizXsTXGZ1bifF0d7EN
 zq/Hnfow==;
Received: from d162-157-58-14.abhsia.telus.net ([162.157.58.14]
 helo=maloca.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u3hMS-00Fepq-6A; Sat, 12 Apr 2025 22:21:56 +0200
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH v2 6/9] drm/amdgpu/gfx: Use CSB helpers in
 gfx_v7_0_get_csb_buffer
Date: Sat, 12 Apr 2025 14:21:11 -0600
Message-ID: <20250412202134.3025051-7-siqueira@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412202134.3025051-1-siqueira@igalia.com>
References: <20250412202134.3025051-1-siqueira@igalia.com>
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

Use CSB helpers to remove code duplication from gfx_v7_0_get_csb_buffer.

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 30 ++++-----------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 0fdc4362bbc0..16b94ff5a959 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -3885,33 +3885,15 @@ static u32 gfx_v7_0_get_csb_size(struct amdgpu_device *adev)
 static void gfx_v7_0_get_csb_buffer(struct amdgpu_device *adev,
 				    volatile u32 *buffer)
 {
-	u32 count = 0, i;
-	const struct cs_section_def *sect = NULL;
-	const struct cs_extent_def *ext = NULL;
+	u32 count = 0;
 
 	if (adev->gfx.rlc.cs_data == NULL)
 		return;
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
-				buffer[count++] = cpu_to_le32(ext->reg_index - PACKET3_SET_CONTEXT_REG_START);
-				for (i = 0; i < ext->reg_count; i++)
-					buffer[count++] = cpu_to_le32(ext->extent[i]);
-			}
-		}
-	}
+	count = amdgpu_gfx_csb_preamble_start(buffer);
+	count = amdgpu_gfx_csb_data_parser(adev, buffer, count);
 
 	buffer[count++] = cpu_to_le32(PACKET3(PACKET3_SET_CONTEXT_REG, 2));
 	buffer[count++] = cpu_to_le32(mmPA_SC_RASTER_CONFIG - PACKET3_SET_CONTEXT_REG_START);
@@ -3939,11 +3921,7 @@ static void gfx_v7_0_get_csb_buffer(struct amdgpu_device *adev,
 		break;
 	}
 
-	buffer[count++] = cpu_to_le32(PACKET3(PACKET3_PREAMBLE_CNTL, 0));
-	buffer[count++] = cpu_to_le32(PACKET3_PREAMBLE_END_CLEAR_STATE);
-
-	buffer[count++] = cpu_to_le32(PACKET3(PACKET3_CLEAR_STATE, 0));
-	buffer[count++] = cpu_to_le32(0);
+	amdgpu_gfx_csb_preamble_end(buffer, count);
 }
 
 static void gfx_v7_0_init_pg(struct amdgpu_device *adev)
-- 
2.49.0

