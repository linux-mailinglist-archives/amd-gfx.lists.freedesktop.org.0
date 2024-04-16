Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3738A6C86
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Apr 2024 15:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAED10F0A1;
	Tue, 16 Apr 2024 13:34:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471C210F091
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Apr 2024 13:34:33 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 43GDYS1q003416; Tue, 16 Apr 2024 19:04:28 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 43GDYSRA003415;
 Tue, 16 Apr 2024 19:04:28 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 4/5] drm/amdgpu: enable redirection of irq's for IH V6.0
Date: Tue, 16 Apr 2024 19:04:22 +0530
Message-Id: <20240416133423.3346-4-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416133423.3346-1-sunil.khatri@amd.com>
References: <20240416133423.3346-1-sunil.khatri@amd.com>
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

Enable redirection of irq for pagefaults for specific
clients to avoid overflow without dropping interrupts.

So here we redirect the interrupts to another IH ring
i.e ring1 where only these interrupts are processed.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
index 26dc99232eb6..8869aac03b82 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
@@ -346,6 +346,21 @@ static int ih_v6_0_irq_init(struct amdgpu_device *adev)
 			    DELAY, 3);
 	WREG32_SOC15(OSSSYS, 0, regIH_MSI_STORM_CTRL, tmp);
 
+	/* Redirect the interrupts to IH RB1 fpr dGPU */
+	if (adev->irq.ih1.ring_size) {
+		tmp = RREG32_SOC15(OSSSYS, 0, regIH_RING1_CLIENT_CFG_INDEX);
+		tmp = REG_SET_FIELD(tmp, IH_RING1_CLIENT_CFG_INDEX, INDEX, 0);
+		WREG32_SOC15(OSSSYS, 0, regIH_RING1_CLIENT_CFG_INDEX, tmp);
+
+		tmp = RREG32_SOC15(OSSSYS, 0, regIH_RING1_CLIENT_CFG_DATA);
+		tmp = REG_SET_FIELD(tmp, IH_RING1_CLIENT_CFG_DATA, CLIENT_ID, 0xa);
+		tmp = REG_SET_FIELD(tmp, IH_RING1_CLIENT_CFG_DATA, SOURCE_ID, 0x0);
+		tmp = REG_SET_FIELD(tmp, IH_RING1_CLIENT_CFG_DATA,
+				    SOURCE_ID_MATCH_ENABLE, 0x1);
+
+		WREG32_SOC15(OSSSYS, 0, regIH_RING1_CLIENT_CFG_DATA, tmp);
+	}
+
 	pci_set_master(adev->pdev);
 
 	/* enable interrupts */
-- 
2.34.1

