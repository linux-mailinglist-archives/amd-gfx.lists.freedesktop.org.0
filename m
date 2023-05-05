Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E683B6F83B1
	for <lists+amd-gfx@lfdr.de>; Fri,  5 May 2023 15:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDE210E5F4;
	Fri,  5 May 2023 13:17:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB59510E5DA;
 Fri,  5 May 2023 11:33:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA6FE63C24;
 Fri,  5 May 2023 11:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5FCC433D2;
 Fri,  5 May 2023 11:33:26 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH V2] drm/amdgpu/display: Enable DC_FP for LoongArch
Date: Fri,  5 May 2023 19:32:33 +0800
Message-Id: <20230505113233.3813801-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 05 May 2023 13:17:28 +0000
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
Cc: dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 amd-gfx@lists.freedesktop.org, WANG Xuerui <kernel@xen0n.name>,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Now LoongArch provides kernel_fpu_begin() and kernel_fpu_end() in commit
2b3bd32ea3a22ea2d ("LoongArch: Provide kernel fpu functions"), so we can
enable DC_FP for DCN devices.

Signed-off-by: WANG Xuerui <kernel@xen0n.name>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
V2: Update commit message to add the commit which provides kernel fpu
    functions.

 drivers/gpu/drm/amd/display/Kconfig            | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 6 ++++--
 drivers/gpu/drm/amd/display/dc/dml/Makefile    | 5 +++++
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 2d8e55e29637..49df073962d5 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -8,7 +8,7 @@ config DRM_AMD_DC
 	depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
-	select DRM_AMD_DC_FP if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
+	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index 1743ca0a3641..86f4c0e04654 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -33,6 +33,8 @@
 #include <asm/cputable.h>
 #elif defined(CONFIG_ARM64)
 #include <asm/neon.h>
+#elif defined(CONFIG_LOONGARCH)
+#include <asm/fpu.h>
 #endif
 
 /**
@@ -88,7 +90,7 @@ void dc_fpu_begin(const char *function_name, const int line)
 	*pcpu += 1;
 
 	if (*pcpu == 1) {
-#if defined(CONFIG_X86)
+#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
 		kernel_fpu_begin();
 #elif defined(CONFIG_PPC64)
 		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
@@ -127,7 +129,7 @@ void dc_fpu_end(const char *function_name, const int line)
 	pcpu = get_cpu_ptr(&fpu_recursion_depth);
 	*pcpu -= 1;
 	if (*pcpu <= 0) {
-#if defined(CONFIG_X86)
+#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
 		kernel_fpu_end();
 #elif defined(CONFIG_PPC64)
 		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 01db035589c5..542962a93e8f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -38,6 +38,11 @@ ifdef CONFIG_ARM64
 dml_rcflags := -mgeneral-regs-only
 endif
 
+ifdef CONFIG_LOONGARCH
+dml_ccflags := -mfpu=64
+dml_rcflags := -msoft-float
+endif
+
 ifdef CONFIG_CC_IS_GCC
 ifneq ($(call gcc-min-version, 70100),y)
 IS_OLD_GCC = 1
-- 
2.39.1

