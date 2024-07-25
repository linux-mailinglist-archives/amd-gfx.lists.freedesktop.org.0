Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C374093BCA8
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2024 08:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40F210E7B5;
	Thu, 25 Jul 2024 06:41:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3034710E7B5
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2024 06:41:14 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 46P6f9uV2921465; Thu, 25 Jul 2024 12:11:09 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 46P6f9jN2921464;
 Thu, 25 Jul 2024 12:11:09 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, Liu Leo <Leo.Liu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 2/4] drm/amdgpu: add macro to calculate offset with instance
Date: Thu, 25 Jul 2024 12:11:05 +0530
Message-Id: <20240725064107.2921431-2-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725064107.2921431-1-sunil.khatri@amd.com>
References: <20240725064107.2921431-1-sunil.khatri@amd.com>
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

Add macro definition which calculate offset of the
register with index override.

This is useful in case when there is an array of
registers which is common for all instances.
To read registers in that case it is easy to define
registers once and the index value is manually passed
to calculate proper offset of register for each instance.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/soc15.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.h b/drivers/gpu/drm/amd/amdgpu/soc15.h
index 282584a48be0..ef7c603b50ae 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.h
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.h
@@ -93,6 +93,10 @@ struct soc15_ras_field_entry {
 
 #define SOC15_REG_ENTRY_OFFSET(entry)	(adev->reg_offset[entry.hwip][entry.inst][entry.seg] + entry.reg_offset)
 
+/* Over ride the instance id */
+#define SOC15_REG_ENTRY_OFFSET_INST(entry, inst) \
+	(adev->reg_offset[entry.hwip][inst][entry.seg] + entry.reg_offset)
+
 #define SOC15_REG_GOLDEN_VALUE(ip, inst, reg, and_mask, or_mask) \
 	{ ip##_HWIP, inst, reg##_BASE_IDX, reg, and_mask, or_mask }
 
-- 
2.34.1

