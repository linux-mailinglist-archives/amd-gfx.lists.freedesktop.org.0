Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A90890038
	for <lists+amd-gfx@lfdr.de>; Thu, 28 Mar 2024 14:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EC3112423;
	Thu, 28 Mar 2024 13:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.b="eXuoNT6y";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C411610FFA7
 for <amd-gfx@lists.freedesktop.org>; Wed, 27 Mar 2024 20:02:15 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1e0edd0340fso2282845ad.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 27 Mar 2024 13:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1711569735; x=1712174535; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bM3Hi+5Alr7tzqsz3KXbQamZzAJvK/Ux1AY7aws8WNM=;
 b=eXuoNT6y+rsiuIucA7rgxAEsu6Rt21cOjQEL5laS3Kh5lEcXhyeKHkOyBpBH2ZuTxy
 oIc7TtnWs+SNY4DWS1doVvAXKz5hyp8Lt5TFxwSP4mBiyZRmmakYuO1wJJB7HroKLz/I
 5CHY+iE3cJCGOaeejRIG53hoxAm6jTna2qQwn0I3jsA2STb8YzdOBdP/5Upk++X8HKvH
 0dBjhualCEvnJkibbcZhaCCFd7/Ygud1mPaWBeTSao2eYojEIbijZ5ZbQoBB95xAKb8g
 3rTIi2uwvrStKH23yWu1RJZWMv8Rbn63XSnWcyN3ePTCva65f2OrCskt3Nd5T2JkQYom
 olvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711569735; x=1712174535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bM3Hi+5Alr7tzqsz3KXbQamZzAJvK/Ux1AY7aws8WNM=;
 b=B0zuPtBXYhyzRKzFYgxYzFpXn7pEeajTsB8/ke5iZPd2Jb9MrC9Wkx2F1Go8hOFxae
 BH1CazezKAUfKu01H0K6t9nso5SMUtYegqlqvn8ip95VbtxUFEHEpUWkw7igqJeiZ4gk
 WS1UNixrsNyjcqVkgH57AS1d2G/GvIwWwnELJrDIhE9hE5lR3Yx4k3O5efk1MkjJwTSA
 AC0Rk5LG0F5x48UBopuE3KZ2BSfnYtgw7xKBgOxWeFObJyOqOhveHbkqeQHPEfJuNoVM
 UFQQ8/0eI9eGh0n92jkxa+og/NliQl5d7wrCYEvB6VqEFvMUGt70/rLdeI3CjNzQ0D4v
 7ztA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO/CUxyP4W5nu484iLWIEKYqCUGT1XIQs5ObPqL69HPavPu+bVwL4NXTUiSl688qMYPfQEpzWpWisb9LQ6sv8VizOOw84MksNP0AjQ2w==
X-Gm-Message-State: AOJu0YyXwa+Vibyb9PVQPI1cT9MJTp4sp5t06rs7GMYY8FuQRE9cg7qm
 aY2q+ub6nsbhOStEmxr/RglflnoWiJBllpq+VZMMgT136i1gGKUBrlNxaTwiC+E=
X-Google-Smtp-Source: AGHT+IFj0bwxlMv24MtX2R4pKVUBPTEZabeDrpj2jWHiUrD8cnm8OWyltVVZB2eEjF0aA2RcWrF1Pw==
X-Received: by 2002:a17:902:e5c1:b0:1e0:c91d:4487 with SMTP id
 u1-20020a170902e5c100b001e0c91d4487mr958029plf.43.1711569735358; 
 Wed, 27 Mar 2024 13:02:15 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 13:02:14 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v3 12/14] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Mar 2024 13:00:43 -0700
Message-ID: <20240327200157.1097089-13-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 Mar 2024 13:32:06 +0000
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

Now that all previously-supported architectures select
ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
of the existing list of architectures. It can also take advantage of the
common kernel-mode FPU API and method of adjusting CFLAGS.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Split altivec removal to a separate patch
 - Use linux/fpu.h instead of asm/fpu.h in consumers

 drivers/gpu/drm/amd/display/Kconfig           |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 27 ++------------
 drivers/gpu/drm/amd/display/dc/dml/Makefile   | 36 ++-----------------
 drivers/gpu/drm/amd/display/dc/dml2/Makefile  | 36 ++-----------------
 4 files changed, 7 insertions(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 901d1961b739..5fcd4f778dc3 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -8,7 +8,7 @@ config DRM_AMD_DC
 	depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 || X86_64
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
-	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
+	select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && (!ARM64 || !CC_IS_CLANG)
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index 0de16796466b..e46f8ce41d87 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -26,16 +26,7 @@
 
 #include "dc_trace.h"
 
-#if defined(CONFIG_X86)
-#include <asm/fpu/api.h>
-#elif defined(CONFIG_PPC64)
-#include <asm/switch_to.h>
-#include <asm/cputable.h>
-#elif defined(CONFIG_ARM64)
-#include <asm/neon.h>
-#elif defined(CONFIG_LOONGARCH)
-#include <asm/fpu.h>
-#endif
+#include <linux/fpu.h>
 
 /**
  * DOC: DC FPU manipulation overview
@@ -87,16 +78,9 @@ void dc_fpu_begin(const char *function_name, const int line)
 	WARN_ON_ONCE(!in_task());
 	preempt_disable();
 	depth = __this_cpu_inc_return(fpu_recursion_depth);
-
 	if (depth == 1) {
-#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
+		BUG_ON(!kernel_fpu_available());
 		kernel_fpu_begin();
-#elif defined(CONFIG_PPC64)
-		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
-			enable_kernel_fp();
-#elif defined(CONFIG_ARM64)
-		kernel_neon_begin();
-#endif
 	}
 
 	TRACE_DCN_FPU(true, function_name, line, depth);
@@ -118,14 +102,7 @@ void dc_fpu_end(const char *function_name, const int line)
 
 	depth = __this_cpu_dec_return(fpu_recursion_depth);
 	if (depth == 0) {
-#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
 		kernel_fpu_end();
-#elif defined(CONFIG_PPC64)
-		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
-			disable_kernel_fp();
-#elif defined(CONFIG_ARM64)
-		kernel_neon_end();
-#endif
 	} else {
 		WARN_ON_ONCE(depth < 0);
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 59d3972341d2..a94b6d546cd1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -25,40 +25,8 @@
 # It provides the general basic services required by other DAL
 # subcomponents.
 
-ifdef CONFIG_X86
-dml_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
-dml_ccflags := $(dml_ccflags-y) -msse
-endif
-
-ifdef CONFIG_PPC64
-dml_ccflags := -mhard-float
-endif
-
-ifdef CONFIG_ARM64
-dml_rcflags := -mgeneral-regs-only
-endif
-
-ifdef CONFIG_LOONGARCH
-dml_ccflags := -mfpu=64
-dml_rcflags := -msoft-float
-endif
-
-ifdef CONFIG_CC_IS_GCC
-ifneq ($(call gcc-min-version, 70100),y)
-IS_OLD_GCC = 1
-endif
-endif
-
-ifdef CONFIG_X86
-ifdef IS_OLD_GCC
-# Stack alignment mismatch, proceed with caution.
-# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
-# (8B stack alignment).
-dml_ccflags += -mpreferred-stack-boundary=4
-else
-dml_ccflags += -msse2
-endif
-endif
+dml_ccflags := $(CC_FLAGS_FPU)
+dml_rcflags := $(CC_FLAGS_NO_FPU)
 
 ifneq ($(CONFIG_FRAME_WARN),0)
 ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index 7b51364084b5..4f6c804a26ad 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -24,40 +24,8 @@
 #
 # Makefile for dml2.
 
-ifdef CONFIG_X86
-dml2_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
-dml2_ccflags := $(dml2_ccflags-y) -msse
-endif
-
-ifdef CONFIG_PPC64
-dml2_ccflags := -mhard-float
-endif
-
-ifdef CONFIG_ARM64
-dml2_rcflags := -mgeneral-regs-only
-endif
-
-ifdef CONFIG_LOONGARCH
-dml2_ccflags := -mfpu=64
-dml2_rcflags := -msoft-float
-endif
-
-ifdef CONFIG_CC_IS_GCC
-ifeq ($(call cc-ifversion, -lt, 0701, y), y)
-IS_OLD_GCC = 1
-endif
-endif
-
-ifdef CONFIG_X86
-ifdef IS_OLD_GCC
-# Stack alignment mismatch, proceed with caution.
-# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
-# (8B stack alignment).
-dml2_ccflags += -mpreferred-stack-boundary=4
-else
-dml2_ccflags += -msse2
-endif
-endif
+dml2_ccflags := $(CC_FLAGS_FPU)
+dml2_rcflags := $(CC_FLAGS_NO_FPU)
 
 ifneq ($(CONFIG_FRAME_WARN),0)
 ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
-- 
2.43.1

