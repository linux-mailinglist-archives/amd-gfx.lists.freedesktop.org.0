Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E361579DD8
	for <lists+amd-gfx@lfdr.de>; Tue, 19 Jul 2022 14:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0647C14A88B;
	Tue, 19 Jul 2022 12:55:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 82869 seconds by postgrey-1.36 at gabe;
 Tue, 19 Jul 2022 12:30:52 UTC
Received: from smtpbg.qq.com (unknown [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADD41132D5;
 Tue, 19 Jul 2022 12:30:52 +0000 (UTC)
X-QQ-mid: bizesmtp90t1658233841t731ph7i
Received: from localhost.localdomain ( [171.223.96.21])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 19 Jul 2022 20:30:38 +0800 (CST)
X-QQ-SSF: 01000000002000F0U000C00A0000000
X-QQ-FEAT: Hom130/y8pliHFW6ARnu1U0PvZa/t/jTN7WyuojEkuSKiy17//NNpqs05KuKe
 61w1S3S30z1NYxkQlKS8UtwL2DCJsO1rT08BRgTmbJbrD7tt9++ce1rszrNze5E4s8aDdLq
 1LQTE4X7rZBXFEA+kBLs33pnYCRiA5kf3KvhmOLW9SdsqSyH1YGMMuI81NPbMS681p197Vm
 i2y4Y0JmaGgCddTQBtYLksm3E8Vs55Lp/nqNhWNg13lRJdKKg/EbCCpj0C49LzL29e9L1u3
 M8DZbCXq7fwBzdsXzve2A0RX9lsfJZzmsv919jMazws3P1FEASUejN+fkhgGdNH2xe6MrJT
 q1ELOdsFWQRGLO61NXPyt+cVdhWaMukABQHIaRyYJqkg+1nq9FmE5AX31u3+I/Hlmboywlx
 Sto3KYdwP98=
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: Fix comment typo
Date: Sat, 16 Jul 2022 12:28:41 +0800
Message-Id: <20220716042841.40555-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Tue, 19 Jul 2022 12:55:20 +0000
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
Cc: andrey.grodzovsky@amd.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 solomon.chiu@amd.com, kai.heng.feng@canonical.com, mario.limonciello@amd.com,
 Jason Wang <wangborong@cdjrlc.com>, alexander.deucher@amd.com,
 evan.quan@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The double `to' is duplicated in the comment, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index e3d139708160..b45cd7cbbea8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -80,7 +80,7 @@
  * - 3.24.0 - Add high priority compute support for gfx9
  * - 3.25.0 - Add support for sensor query info (stable pstate sclk/mclk).
  * - 3.26.0 - GFX9: Process AMDGPU_IB_FLAG_TC_WB_NOT_INVALIDATE.
- * - 3.27.0 - Add new chunk to to AMDGPU_CS to enable BO_LIST creation.
+ * - 3.27.0 - Add new chunk to AMDGPU_CS to enable BO_LIST creation.
  * - 3.28.0 - Add AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES
  * - 3.29.0 - Add AMDGPU_IB_FLAG_RESET_GDS_MAX_WAVE_ID
  * - 3.30.0 - Add AMDGPU_SCHED_OP_CONTEXT_PRIORITY_OVERRIDE.
-- 
2.35.1

