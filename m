Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6387F4879
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Nov 2023 15:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C456F10E63F;
	Wed, 22 Nov 2023 14:05:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A166810E253
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Nov 2023 03:06:30 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6bd0e1b1890so5123668b3a.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Nov 2023 19:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1700622390; x=1701227190; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oBSDlJJdl9cJTZEKARyFff2b3kLrE8gro26mzSoUMfg=;
 b=jUwoNNTs4DrsH6MJ3HKfPD3aDjjbM/Pskf4LrOXmBP+AOdHWmXqUCOXJzxq+MYveAv
 8s6ua4Z8sqZw73POK4hun8h66LPUZD+7NpW6oNRZtYYrwqVFQAijSRxzaNURVQJZmxP7
 romItC8DXqgc/4WpUKn+f2COHotjjA3CMDFunTT9vbL1Jzb/9j3+NMNcXPWeDrcKhGcP
 XshSU0r26UTX2Bl35QYC6YMYNoG4gIWLrNhKtqnG3F3IFLLSxF5JI2YbgelGdAbhPSmW
 LImQ36HGt9NGrU1Pn3dsFOo1R3oRD+ieRmXFL/BuVXvKxR8trG9g76BC/Sz4FtoWYHX5
 ciwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700622390; x=1701227190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oBSDlJJdl9cJTZEKARyFff2b3kLrE8gro26mzSoUMfg=;
 b=Dnb/HxXPNzqM3XL921SdJ3ysxpaHzuMpJnBqwxT+lMV5gbACguYA6ZBrP5RhQtGhtK
 ccEIJxEZDSodRHMGKgntm8xAKYXbJOnqBInEBTNrPBnQIhEL8YEMC++plY2Kl6IzWV5g
 oJJtY6OUdiJrGoepxarGgZJb2mPLxHvF72Mr1KSZ7fiosU9I25zxvS03/cKVieeK6lOh
 Ps5fMaUYmfsvsiNbAONnrwfdxpOH4oBntVWZHO7TPVqs0MZdd47i67eTAYjD5TDMfXEZ
 Uvz0NiRAvh3QjDvn4qUt0uykedUN7kYVOY9+i4/yLQv3CNqR0MTa5opKPgC4Puydjt9n
 tDMw==
X-Gm-Message-State: AOJu0YyulMroqfUZRdxwc4vrtmzen303KugsB8LXvb+w2Z6Z6XLb8oYu
 c3bVKKEM4aTrs77lFknVDNcLFw==
X-Google-Smtp-Source: AGHT+IGAWRMig9MTM8HwbUunWOHJsJ/tdXoUczvav4ujcqkNnMcjGyNXeyS3D3MD4r1LtBjigmKHkw==
X-Received: by 2002:a05:6a00:98e:b0:6cb:cdd0:76f7 with SMTP id
 u14-20020a056a00098e00b006cbcdd076f7mr417804pfg.21.1700622390174; 
 Tue, 21 Nov 2023 19:06:30 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
 by smtp.gmail.com with ESMTPSA id
 s2-20020aa78282000000b006a77343b0ccsm8614917pfm.89.2023.11.21.19.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 19:06:29 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Date: Tue, 21 Nov 2023 19:05:15 -0800
Message-ID: <20231122030621.3759313-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122030621.3759313-1-samuel.holland@sifive.com>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Nov 2023 14:05:10 +0000
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
Cc: Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
architectures. Enabling hardware FP requires overriding the ISA string
for the relevant compilation units.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/gpu/drm/amd/display/Kconfig            | 5 ++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 6 ++++--
 drivers/gpu/drm/amd/display/dc/dml/Makefile    | 6 ++++++
 drivers/gpu/drm/amd/display/dc/dml2/Makefile   | 6 ++++++
 4 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 901d1961b739..49b33b2f6701 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -8,7 +8,10 @@ config DRM_AMD_DC
 	depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 || X86_64
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
-	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
+	select DRM_AMD_DC_FP if ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG
+	select DRM_AMD_DC_FP if PPC64 && ALTIVEC
+	select DRM_AMD_DC_FP if RISCV && FPU
+	select DRM_AMD_DC_FP if LOONGARCH || X86
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index 4ae4720535a5..834dca0396f1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -35,6 +35,8 @@
 #include <asm/neon.h>
 #elif defined(CONFIG_LOONGARCH)
 #include <asm/fpu.h>
+#elif defined(CONFIG_RISCV)
+#include <asm/switch_to.h>
 #endif
 
 /**
@@ -89,7 +91,7 @@ void dc_fpu_begin(const char *function_name, const int line)
 	depth = __this_cpu_inc_return(fpu_recursion_depth);
 
 	if (depth == 1) {
-#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
+#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV)
 		kernel_fpu_begin();
 #elif defined(CONFIG_PPC64)
 		if (cpu_has_feature(CPU_FTR_VSX_COMP))
@@ -122,7 +124,7 @@ void dc_fpu_end(const char *function_name, const int line)
 
 	depth = __this_cpu_dec_return(fpu_recursion_depth);
 	if (depth == 0) {
-#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
+#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV)
 		kernel_fpu_end();
 #elif defined(CONFIG_PPC64)
 		if (cpu_has_feature(CPU_FTR_VSX_COMP))
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index ea7d60f9a9b4..5c8f840ef323 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -43,6 +43,12 @@ dml_ccflags := -mfpu=64
 dml_rcflags := -msoft-float
 endif
 
+ifdef CONFIG_RISCV
+include $(srctree)/arch/riscv/Makefile.isa
+# Remove V from the ISA string, like in arch/riscv/Makefile, but keep F and D.
+dml_ccflags := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
+endif
+
 ifdef CONFIG_CC_IS_GCC
 ifneq ($(call gcc-min-version, 70100),y)
 IS_OLD_GCC = 1
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index acff3449b8d7..15ad6e3a2173 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -42,6 +42,12 @@ dml2_ccflags := -mfpu=64
 dml2_rcflags := -msoft-float
 endif
 
+ifdef CONFIG_RISCV
+include $(srctree)/arch/riscv/Makefile.isa
+# Remove V from the ISA string, like in arch/riscv/Makefile, but keep F and D.
+dml2_ccflags := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
+endif
+
 ifdef CONFIG_CC_IS_GCC
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
-- 
2.42.0

