Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D48AD131991
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Jan 2020 21:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E916E516;
	Mon,  6 Jan 2020 20:46:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921496E516
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jan 2020 20:46:04 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id a2so22655702ybr.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 Jan 2020 12:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rO6LWZLbXCax8J94KGcwjnAThH7Xgwa/26G3zZzg3Iw=;
 b=VllUTQSjMc2GUBtNFkdNmoyISznsn7VU8aYOt1DwpwVD6QHJkVecKCiIyS9EBBnM15
 QBvzvsYuvPOskYOAR1Jkipl7+o6uG+a7k8OjbKJ4IX8yR1pIcrZHScF0cAl3FBaYyXR0
 t56IQlt1O4ZugKDLbT/gfM2G+yMeAEPLfvcQPW0Anegq41D/l/9cMIHy00EtR4Tgif3v
 nP6PPIcLJMEgc66FmBa8p5R48SxVD8bjODuYXGWvqZwBW1IL+00pI6OH96WStZGQ2u/W
 mc/+OLA4KMAIIHL3W3VRwuBRAorVbh1sVywBqSKVZMV9VhNIU6HgoWYM3ImkFcydovRC
 Kxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rO6LWZLbXCax8J94KGcwjnAThH7Xgwa/26G3zZzg3Iw=;
 b=jYulI6Np6+ENFmGaChF/X5x/6T20+mEAEVsVnNxlGV+Ju/xS5eMgPrOCm7FKCoZJQY
 vaogJom6IlrelXBsB27qKZre2PctXVaqSuki7IJKC0xMnju8Svz2rAT8aheZHR0YUM3k
 pC0OSqgCZVpGlTN3tCj9XvIpO2EXZ6Sveb8pDl6OIF248p2dR2s0ba6WnMxAy+uXju7N
 +Wv5vnc1zbCmiC/3YzTuOII17cZk8UIfmboV3Fnp4+BTDAoWzdlMhVlMBJVHFRGKy2kI
 OlnUgT57v8FNSl6lyq2oIGayW+NbfNVjU7+wRB5u/nJ7zKy+CvQb+cWVIBVnioxrj9Dx
 utnQ==
X-Gm-Message-State: APjAAAXIEfp9i9NabyknEQa1P0pE8b8c1EnQPWCwYC5+2JM+ZfXgX8jx
 LzTyJh7cnCsU99lq0ZIYg49eO+Vt
X-Google-Smtp-Source: APXvYqwrHJdQ+NmktVBj6E5svdH/3fcIxBeJSCok5ArVXmIbDkvjQy2uXl9EfMEzTAkts8Oe46nUTg==
X-Received: by 2002:a25:c9c2:: with SMTP id z185mr53556442ybf.64.1578343563581; 
 Mon, 06 Jan 2020 12:46:03 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id m30sm28625382ywh.12.2020.01.06.12.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 12:46:02 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] Revert "drm/amdgpu: Set no-retry as default."
Date: Mon,  6 Jan 2020 15:45:53 -0500
Message-Id: <20200106204553.917237-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This reverts commit 51bfac71cade386966791a8db87a5912781d249f.

This causes stability issues on some raven boards.  Revert
for now until a proper fix is completed.

Bug: https://gitlab.freedesktop.org/drm/amd/issues/934
Bug: https://bugzilla.kernel.org/show_bug.cgi?id=206017
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 0ffc9447b573..3036ec883fb4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -142,7 +142,7 @@ int amdgpu_async_gfx_ring = 1;
 int amdgpu_mcbp = 0;
 int amdgpu_discovery = -1;
 int amdgpu_mes = 0;
-int amdgpu_noretry = 1;
+int amdgpu_noretry;
 int amdgpu_force_asic_type = -1;
 
 struct amdgpu_mgpu_info mgpu_info = {
@@ -588,7 +588,7 @@ MODULE_PARM_DESC(mes,
 module_param_named(mes, amdgpu_mes, int, 0444);
 
 MODULE_PARM_DESC(noretry,
-	"Disable retry faults (0 = retry enabled, 1 = retry disabled (default))");
+	"Disable retry faults (0 = retry enabled (default), 1 = retry disabled)");
 module_param_named(noretry, amdgpu_noretry, int, 0644);
 
 /**
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
