Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597648A7400
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Apr 2024 20:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C34D112DDD;
	Tue, 16 Apr 2024 18:59:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E329D112DD5
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Apr 2024 18:59:36 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 43GIxWwo230823; Wed, 17 Apr 2024 00:29:32 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 43GIxWdP230822;
 Wed, 17 Apr 2024 00:29:32 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 6/6] drm/amdgpu: add ip dump for each ip in devcoredump
Date: Wed, 17 Apr 2024 00:29:23 +0530
Message-Id: <20240416185923.230700-7-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416185923.230700-1-sunil.khatri@amd.com>
References: <20240416185923.230700-1-sunil.khatri@amd.com>
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

Add ip dump for each ip of the asic in the
devcoredump for all the ips where a callback
is registered for register dump.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 64fe564b8036..c1cb62683695 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -262,6 +262,20 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 	drm_printf(&p, "Faulty page starting at address: 0x%016llx\n", fault_info->addr);
 	drm_printf(&p, "Protection fault status register: 0x%x\n\n", fault_info->status);
 
+	/* dump the ip state for each ip */
+	drm_printf(&p, "IP Dump\n");
+	for (int i = 0; i < coredump->adev->num_ip_blocks; i++) {
+		if (coredump->adev->ip_blocks[i].version->funcs->print_ip_state) {
+			drm_printf(&p, "IP: %s\n",
+				   coredump->adev->ip_blocks[i]
+					   .version->funcs->name);
+			coredump->adev->ip_blocks[i]
+				.version->funcs->print_ip_state(
+					(void *)coredump->adev, &p);
+			drm_printf(&p, "\n");
+		}
+	}
+
 	/* Add ring buffer information */
 	drm_printf(&p, "Ring buffer information\n");
 	for (int i = 0; i < coredump->adev->num_rings; i++) {
-- 
2.34.1

