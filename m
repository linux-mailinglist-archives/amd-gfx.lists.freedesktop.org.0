Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 104331C728A
	for <lists+amd-gfx@lfdr.de>; Wed,  6 May 2020 16:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD8F6E2BC;
	Wed,  6 May 2020 14:14:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5006E2BC
 for <amd-gfx@lists.freedesktop.org>; Wed,  6 May 2020 14:14:23 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id b6so2007577qkh.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 06 May 2020 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5YUO/fQLOs/m7uPnYJhjoo1mOMaOGo5ixuzCpKHc6U=;
 b=bjS81BC29FLVgeMBriGW72XLnCZGb4BrLU5xVAdPF6SDMHqfdnn9XuLUNKMma5GJ0Q
 KQ00f0y1lAchb2scq2/LP5bELRE409rYl+dq6T7uO8mXzzbF0h5jMaaE2RVWkTVKO7kw
 1R/saE4mPll2k45jdkLsYhQzkPKwW3jaTkFcGknlYN9n9rOfIWUyhCZ+QyJTdV3ZuPmD
 eEZPYY2nWqfOcBQmokWOtJ/VKHWbypHZhzhqRUByWfT/v2kfCvJJ987HGdSN0xCdp+z4
 Gbnvyze7nrSmAzvlkJZGy94ivIjvo/w3/IiIe1USAXqabTPj8q/KPzwEo/0gpbmyinMf
 OWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5YUO/fQLOs/m7uPnYJhjoo1mOMaOGo5ixuzCpKHc6U=;
 b=uIcRailMvGXKvPW6xJEnc1mcds0/TXpx155nQT57EqoFlCZVxWNRVUBfmSfi5Om072
 10c25C+JntHeE9+5QjPCZhwcjC+wa9QQ1VOsNnkzVFAy/hc6EUBWBshudJlgpROnU/UA
 h0RXlLR9j1zcGCqIgcpGcmPnA0m8jy7CPCqoVSmTOYvcVh1QIbm3r3Y03TD0JchmxyQv
 fCCG+YDZFvRobSW53HePX1gAyGEyRq8Nelqyf0GxC9rBQx5JGu8flAUyIEwRqAXpBKjF
 iSIjA/He9AnbxRqVG571JG0VuWW1PQ/zZr0dqrEtpwKQhATjRnJAWbm0FbXoqu4kd+k2
 vq6A==
X-Gm-Message-State: AGi0PuatDZB4ke64+i59WGljHF741QuciUEPpyREuCD2SztzSrJv747q
 GFzU9g8BbZVfN5JPx1mnoXmNvcHw
X-Google-Smtp-Source: APiQypJMvx/V6+jbkWlLxRXzlBkbRF4f+FIgb16tvCzqYLQyaV3REdD1uhD1PDXB6b8dNClDlBatVw==
X-Received: by 2002:a37:82c1:: with SMTP id e184mr9315239qkd.186.1588774461809; 
 Wed, 06 May 2020 07:14:21 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id q57sm1608944qtj.55.2020.05.06.07.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 07:14:21 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: force fbdev into vram
Date: Wed,  6 May 2020 10:14:11 -0400
Message-Id: <20200506141411.860444-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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

We set the fb smem pointer to the offset into the BAR, so keep
the fbdev bo in vram.

Bug: https://bugzilla.kernel.org/show_bug.cgi?id=207581
Fixes: 6c8d74caa2fa33 ("drm/amdgpu: Enable scatter gather display support")
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
index 9ae7b61f696a..25ddb482466a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
@@ -133,8 +133,7 @@ static int amdgpufb_create_pinned_object(struct amdgpu_fbdev *rfbdev,
 	u32 cpp;
 	u64 flags = AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED |
 			       AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS     |
-			       AMDGPU_GEM_CREATE_VRAM_CLEARED 	     |
-			       AMDGPU_GEM_CREATE_CPU_GTT_USWC;
+			       AMDGPU_GEM_CREATE_VRAM_CLEARED;
 
 	info = drm_get_format_info(adev->ddev, mode_cmd);
 	cpp = info->cpp[0];
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
