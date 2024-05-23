Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABBD8CD820
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2024 18:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D431F10EE7A;
	Thu, 23 May 2024 16:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8IimlC5";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6CE10E6FC;
 Thu, 23 May 2024 13:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716471453; x=1748007453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eARXuw8obD/PHu+EJxVRcE7RxEtyJJUx+yk0jOQ9UfY=;
 b=h8IimlC57iHlqZhY0hlRsQnOOLQ6sta0Gf9VXQh0w39rGutTWyjEryry
 MmgHT8MCxiguLA/RVXoaNIgT+/P5CQWC+tJhT0kxCXDFDXD8exR34kOQ6
 mXT8Wzse6s06CAc8eOXbgWu23YX3pjVjw4rvoi1vHcwkDeecTCDUoViWe
 eiMYVNSeVrP88dmaFXLDTekqUFbmFVUDYk6kFK/bFyJTxpVyYhBNKta0V
 rS+dDeuo6YOZRlaJ6f1cF9tpwNCjm2HcF5oOAb0liWzkYerD7ze68FqJ3
 KQIqaYlIsbHXBmu6Geg6dwdCkSc7E+HNL5e5ggox3LIg5U6fjX2YJ4WHL w==;
X-CSE-ConnectionGUID: dRJWfHjkRr6/yULC/ZbfuQ==
X-CSE-MsgGUID: x0dsv5aISCONAY0jpU07mA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12662745"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="12662745"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:37:32 -0700
X-CSE-ConnectionGUID: 1oIFpOEJRtqG+HNOhnr7iA==
X-CSE-MsgGUID: D6sW7p0ESLG5PHLT2BZe8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="34210056"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:37:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, jani.nikula@intel.com
Subject: [PATCH 2/3] drm/xe: drop redundant W=1 warnings from Makefile
Date: Thu, 23 May 2024 16:37:06 +0300
Message-Id: <958a67adcbb64d3a387d2a07d83b05d71176e938.1716471145.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716471145.git.jani.nikula@intel.com>
References: <cover.1716471145.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 23 May 2024 16:10:45 +0000
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

Since commit a61ddb4393ad ("drm: enable (most) W=1 warnings by default
across the subsystem"), most of the extra warnings in the driver
Makefile are redundant. Remove them.

Note that -Wmissing-declarations and -Wmissing-prototypes are always
enabled by default in scripts/Makefile.extrawarn.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c9f067b8f54d..f4366cb958be 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -3,31 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-# Unconditionally enable W=1 warnings locally
-# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
-subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
-subdir-ccflags-y += -Wmissing-declarations
-subdir-ccflags-y += $(call cc-option, -Wrestrict)
-subdir-ccflags-y += -Wmissing-format-attribute
-subdir-ccflags-y += -Wmissing-prototypes
-subdir-ccflags-y += -Wold-style-definition
-subdir-ccflags-y += -Wmissing-include-dirs
-subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
-subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
-subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
-subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
+# Enable W=1 warnings not enabled in drm subsystem Makefile
 subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
-subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
-# The following turn off the warnings enabled by -Wextra
-ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
-subdir-ccflags-y += -Wno-missing-field-initializers
-subdir-ccflags-y += -Wno-type-limits
-subdir-ccflags-y += -Wno-shift-negative-value
-endif
-ifeq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
-subdir-ccflags-y += -Wno-sign-compare
-endif
-# --- end copy-paste
 
 # Enable -Werror in CI and development
 subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
-- 
2.39.2

