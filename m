Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B208BA926
	for <lists+amd-gfx@lfdr.de>; Fri,  3 May 2024 10:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CA610EDE1;
	Fri,  3 May 2024 08:45:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB4E10EDE1
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 May 2024 08:45:05 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 4438j1a52451662; Fri, 3 May 2024 14:15:01 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 4438j1i32451661;
 Fri, 3 May 2024 14:15:01 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 2/4] drm/amdgpu: add se registers to ip dump for gfx10
Date: Fri,  3 May 2024 14:14:45 +0530
Message-Id: <20240503084447.2451529-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240503084447.2451529-1-sunil.khatri@amd.com>
References: <20240503084447.2451529-1-sunil.khatri@amd.com>
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

add the registers of SE block of gfx for ip dump
for gfx10 IP.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 61c1e997f794..953df202953a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -373,7 +373,12 @@ static const struct amdgpu_hwip_reg_entry gc_reg_list_10_1[] = {
 	SOC15_REG_ENTRY_STR(GC, 0, mmCP_MEC_ME2_HEADER_DUMP),
 	SOC15_REG_ENTRY_STR(GC, 0, mmCP_PFP_HEADER_DUMP),
 	SOC15_REG_ENTRY_STR(GC, 0, mmCP_ME_HEADER_DUMP),
-	SOC15_REG_ENTRY_STR(GC, 0, mmCP_MES_HEADER_DUMP)
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_MES_HEADER_DUMP),
+	/* SE status registers */
+	SOC15_REG_ENTRY_STR(GC, 0, mmGRBM_STATUS_SE0),
+	SOC15_REG_ENTRY_STR(GC, 0, mmGRBM_STATUS_SE1),
+	SOC15_REG_ENTRY_STR(GC, 0, mmGRBM_STATUS_SE2),
+	SOC15_REG_ENTRY_STR(GC, 0, mmGRBM_STATUS_SE3)
 };
 
 static const struct soc15_reg_golden golden_settings_gc_10_1[] = {
-- 
2.34.1

