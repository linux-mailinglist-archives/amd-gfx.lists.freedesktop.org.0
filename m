Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0A650FEC7
	for <lists+amd-gfx@lfdr.de>; Tue, 26 Apr 2022 15:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B6E10F188;
	Tue, 26 Apr 2022 13:22:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EC810F12F;
 Tue, 26 Apr 2022 13:22:20 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id dk23so12731244ejb.8;
 Tue, 26 Apr 2022 06:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E8Wag8mDZiGLpawz9aj7bJEn2udoJx894u4z01hsvFY=;
 b=p8rawiD8nhhWApnBuPlzWAqIQf385zy+EAfKm/g6LXfz+KuUlVSO4BiPDGbp7eTnEJ
 xZoG4I/1LgZowaBQSMKf0bmT0uyiHf831wBhMiC7dkX6z6XcyNlAfNJhgHbxU+6K1iKa
 CEOojIz836r8SBy3/FM1BhVPSAvWl0cHXJXSrtB0ti0iTJfn86AwvCVbEG5vHd0PLbk8
 J5OQHtTxPp9h48n4esNxB5GR1DKxWGUZg3WULdAqbhQpBUXR8LOlFQ3DfLcSdXpwgp/t
 ec1yG/vxfHRr3KX/YAGe2ZrHwED8wTP6xUrA1fJVnAboMreANWBAmrzaVVJ1F4+wLXOv
 KSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E8Wag8mDZiGLpawz9aj7bJEn2udoJx894u4z01hsvFY=;
 b=AO6g/UYkCrGm3miONPQOK7zdJgBclKEHlYn2lr6klkMYPuPWzcqUnRW7i+cGEOjyLE
 NtJMbhUmmYfxGKc2KwI6AyC672ufdHWLbTHB8u13pp+Yjqx3qqd1VINDACi3nMnUKuvV
 aRYaXR6xXKviJCwvcjyuIWc50qsWD5lSpZ5i19L6/WCwJyjb/pVVzDz3j9h4l9sDFRzv
 5lh/wGA63bXV9xF1LCoJ/jOHoFMNfeYvsdrDrBgPJmQ8V/oaTZZy5hKTezByp/LdDlR6
 4dBkR27Bn36+UNFiMxn7OkJT+hcyQK2dB771e9s4TzpppNqrTXx3Nni8LqBoZTeXPhtf
 R87w==
X-Gm-Message-State: AOAM532H1GwIiBtC5fkqphSYxvyZb9DIPoK2+cd8X6OOfCbB5Nhh9WqH
 Txe1HXwXD16yEnzSvYX6OX1OAMSRcyU=
X-Google-Smtp-Source: ABdhPJx63kFhy88Hp9zOuHyVMHK9t2G/fB5eAuEgxChavL8apcAsHhRQY40n65BJHuKPIStauNVIkA==
X-Received: by 2002:a17:907:16a6:b0:6f3:ad45:c778 with SMTP id
 hc38-20020a17090716a600b006f3ad45c778mr4029517ejc.152.1650979338694; 
 Tue, 26 Apr 2022 06:22:18 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a1709060ee100b006e8a49f215dsm4889914eji.73.2022.04.26.06.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:22:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm: add drm_exec selftests
Date: Tue, 26 Apr 2022 15:22:05 +0200
Message-Id: <20220426132208.20801-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426132208.20801-1-christian.koenig@amd.com>
References: <20220426132208.20801-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 daniel@ffwll.ch
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Largely just the initial skeleton.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/selftests/Makefile            |  2 +-
 .../gpu/drm/selftests/drm_exec_selftests.h    | 10 +++
 drivers/gpu/drm/selftests/test-drm_exec.c     | 74 +++++++++++++++++++
 3 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/selftests/drm_exec_selftests.h
 create mode 100644 drivers/gpu/drm/selftests/test-drm_exec.c

diff --git a/drivers/gpu/drm/selftests/Makefile b/drivers/gpu/drm/selftests/Makefile
index 5ba5f9138c95..0ab4b0f0642f 100644
--- a/drivers/gpu/drm/selftests/Makefile
+++ b/drivers/gpu/drm/selftests/Makefile
@@ -5,4 +5,4 @@ test-drm_modeset-y := test-drm_modeset_common.o test-drm_plane_helper.o \
 		      test-drm_rect.o
 
 obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o test-drm_modeset.o test-drm_cmdline_parser.o \
-				    test-drm_buddy.o
+				    test-drm_buddy.o test-drm_exec.o
diff --git a/drivers/gpu/drm/selftests/drm_exec_selftests.h b/drivers/gpu/drm/selftests/drm_exec_selftests.h
new file mode 100644
index 000000000000..d88ec9c85fe6
--- /dev/null
+++ b/drivers/gpu/drm/selftests/drm_exec_selftests.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* List each unit test as selftest(name, function)
+ *
+ * The name is used as both an enum and expanded as igt__name to create
+ * a module parameter. It must be unique and legal for a C identifier.
+ *
+ * Tests are executed in order by igt/drm_exec
+ */
+selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
+selftest(exec_lock1, igt_exec_lock1)
diff --git a/drivers/gpu/drm/selftests/test-drm_exec.c b/drivers/gpu/drm/selftests/test-drm_exec.c
new file mode 100644
index 000000000000..de2c3d986828
--- /dev/null
+++ b/drivers/gpu/drm/selftests/test-drm_exec.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#define pr_fmt(fmt) "drm_exec: " fmt
+
+#include <linux/module.h>
+#include <linux/prime_numbers.h>
+
+#include <drm/drm_exec.h>
+#include <drm/drm_device.h>
+#include <drm/drm_gem.h>
+
+#include "../lib/drm_random.h"
+
+#define TESTS "drm_exec_selftests.h"
+#include "drm_selftest.h"
+
+static	struct drm_device dev;
+
+static int igt_sanitycheck(void *ignored)
+{
+	struct drm_exec exec;
+
+	drm_exec_init(&exec, true);
+	drm_exec_fini(&exec);
+	pr_info("%s - ok!\n", __func__);
+	return 0;
+}
+
+static int igt_exec_lock1(void *ignored)
+{
+	struct drm_gem_object gobj = { };
+	struct drm_exec exec;
+	int ret;
+
+	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+
+	drm_exec_init(&exec, true);
+	drm_exec_while_not_all_locked(&exec) {
+		ret = drm_exec_prepare_obj(&exec, &gobj, 1);
+		drm_exec_continue_on_contention(&exec);
+		if (ret) {
+			drm_exec_fini(&exec);
+			pr_err("%s - err %d!\n", __func__, ret);
+			return ret;
+		}
+	}
+	drm_exec_fini(&exec);
+	pr_info("%s - ok!\n", __func__);
+	return 0;
+}
+
+#include "drm_selftest.c"
+
+static int __init test_drm_exec_init(void)
+{
+	int err;
+
+	err = run_selftests(selftests, ARRAY_SIZE(selftests), NULL);
+
+	return err > 0 ? 0 : err;
+}
+
+static void __exit test_drm_exec_exit(void)
+{
+}
+
+module_init(test_drm_exec_init);
+module_exit(test_drm_exec_exit);
+
+MODULE_AUTHOR("AMD");
+MODULE_LICENSE("GPL and additional rights");
-- 
2.25.1

