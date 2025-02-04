Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F41A27E3B
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Feb 2025 23:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28E010E060;
	Tue,  4 Feb 2025 22:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qJoGrVLs";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536FC10E060;
 Tue,  4 Feb 2025 22:21:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3F564A42EAA;
 Tue,  4 Feb 2025 22:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2392BC4CEDF;
 Tue,  4 Feb 2025 22:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738707715;
 bh=mj8gFVewXQahStzEsdmqJgjIqpJ4BPuc+w0ki86lYeA=;
 h=From:To:Cc:Subject:Date:From;
 b=qJoGrVLsRQjnIDE/l79reKMzAWRWAJNhqrQvfsTlkz2d/DzihHu9cUsMQxuo5Y5is
 vYdN0eQUGQR9DJnJ89OBPgFmWjsGD1XIFQ4lv9FbH6n+8IhDe1ECPmHZMYCpEsEg/s
 icOMdjwzRxJ1vho96ZbtH0kcV3+YxfPT35zJsk+3+WJ276yiyQ07hKfC+VwwPrI+HU
 e9bAIDsKVayf3YZcnZv5bglDSdfvnUxCUrmmWIthuMBvQB58jzmPidbMnHeAsnSnU9
 2OIUPm/nZ+Xmef4931kzeX96acULAb77wHV6s4rYEc7MEoT99tRxTHdmRHscc+JxmM
 uyTJ/vp03zS2Q==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd: Refactor find_system_memory()
Date: Tue,  4 Feb 2025 16:21:38 -0600
Message-ID: <20250204222140.3883013-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
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

From: Mario Limonciello <mario.limonciello@amd.com>

find_system_memory() pulls out two fields from an SMBIOS type 17
device and sets them on KFD devices. This however is pulling from
the middle of the field in the SMBIOS device and leads to an unaligned
access.

Instead use a struct representation to access the members and pull
out the two specific fields.

Link: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.8.0.pdf p99
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 27 +++++++++++------------
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h | 17 ++++++++++++++
 2 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index ceb9fb475ef13..93d3924dfcba0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -968,24 +968,23 @@ static void kfd_update_system_properties(void)
 	up_read(&topology_lock);
 }
 
-static void find_system_memory(const struct dmi_header *dm,
-	void *private)
+static void find_system_memory(const struct dmi_header *dm, void *private)
 {
+	struct dmi_mem_device *memdev = (struct dmi_mem_device *)(dm);
 	struct kfd_mem_properties *mem;
-	u16 mem_width, mem_clock;
 	struct kfd_topology_device *kdev =
 		(struct kfd_topology_device *)private;
-	const u8 *dmi_data = (const u8 *)(dm + 1);
-
-	if (dm->type == DMI_ENTRY_MEM_DEVICE && dm->length >= 0x15) {
-		mem_width = (u16)(*(const u16 *)(dmi_data + 0x6));
-		mem_clock = (u16)(*(const u16 *)(dmi_data + 0x11));
-		list_for_each_entry(mem, &kdev->mem_props, list) {
-			if (mem_width != 0xFFFF && mem_width != 0)
-				mem->width = mem_width;
-			if (mem_clock != 0)
-				mem->mem_clk_max = mem_clock;
-		}
+
+	if (memdev->header.type != DMI_ENTRY_MEM_DEVICE)
+		return;
+	if (memdev->header.length < sizeof(struct dmi_mem_device))
+		return;
+
+	list_for_each_entry(mem, &kdev->mem_props, list) {
+		if (memdev->total_width != 0xFFFF && memdev->total_width != 0)
+			mem->width = memdev->total_width;
+		if (memdev->speed != 0)
+			mem->mem_clk_max = memdev->speed;
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
index 155b5c410af16..f06c9db7ddde9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
@@ -24,6 +24,7 @@
 #ifndef __KFD_TOPOLOGY_H__
 #define __KFD_TOPOLOGY_H__
 
+#include <linux/dmi.h>
 #include <linux/types.h>
 #include <linux/list.h>
 #include <linux/kfd_sysfs.h>
@@ -179,6 +180,22 @@ struct kfd_system_properties {
 	struct attribute	attr_props;
 };
 
+struct dmi_mem_device {
+	struct dmi_header header;
+	u16 physical_handle;
+	u16 error_handle;
+	u16 total_width;
+	u16 data_width;
+	u16 size;
+	u8 form_factor;
+	u8 device_set;
+	u8 device_locator;
+	u8 bank_locator;
+	u8 memory_type;
+	u16 type_detail;
+	u16 speed;
+} __packed;
+
 struct kfd_topology_device *kfd_create_topology_device(
 		struct list_head *device_list);
 void kfd_release_topology_device_list(struct list_head *device_list);
-- 
2.43.0

