Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF681D9B8C
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2020 17:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1CD6E359;
	Tue, 19 May 2020 15:44:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2ABA6E359
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2020 15:44:44 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id v15so6701207qvr.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2020 08:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F4gAJkHhAk6tySRbF+2MiJDfgMQcFfYYiH2kfejQ1s8=;
 b=MOoZs338WZOI6ZL5rQNmuHxSil6PLEsh3JcJXxQ03gawds37a05NX7uvOLFbUzXsNc
 OXB92Z6CDK0sK2h7ZVU3/Z8Geb0gG5JWOlaEhrV83jAObbvSCi6EhR4kq9xCLaJ39Ndx
 f7sFJLd1uhotqvAsfIBtMMxYLdLLVhWZ3fasQlshpDvfK02Pb68JP79qaArsBfZU6436
 E/JU7pL37OJznmvotm4xNMjTI9iFNvcpKgxmmeqFkAm0D5R+zrUM6B1MotAHHZ9v31E/
 zCViahfYmkpkVOe7UV+B3arPE4KZFuUi9pKsoy26zaMqVsQisCcKjj7zYb2MwXAdcgSU
 a5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F4gAJkHhAk6tySRbF+2MiJDfgMQcFfYYiH2kfejQ1s8=;
 b=RBdWUUaYNR9xL1xMB3R51gzS0NX+NVdiZMZVk2rKUgaU0MPW7m6Cm76w+uRDaMrGoE
 IwNn/tEGiG4Q5/j/wX1GenoEmmwKAubIxItj4NGpXx0kdpmO2XI+WGmh8cllD4Y4voCR
 9tqrWxjbz81r3dRGa9OyvQfbF7ljpaQNTdj8u9bTzgaBNuL79rAamqk3eiLgHiEjopmV
 tIYrGv5HW999Kg/o0EqZ7vXiSe2vSZI1NhKNNmvVdUyZFmN88lQ53SEpITiLDiaYxGp7
 k+zoPiKlPixHcOQq4nlmpp5ntJvSs2LO9SgOnuwW1GkCmwiKibIBSUOJjSeg10QGbNgj
 6Hfw==
X-Gm-Message-State: AOAM530sCaB6Ujt012EW84b8YIJJ8yPuhxrgDsrwBSTrkmCrJ17ia4D8
 12/H9p4nRUuOjWD0J0FeiJSYsTaj
X-Google-Smtp-Source: ABdhPJyrLnTVw4JZPmi4B9G5Eqi9WQJSJNgg5iOlQmosQyR4vxLsJ89SX8EH2zkiTB7popgIlV+PXA==
X-Received: by 2002:a05:6214:1c2:: with SMTP id
 c2mr145707qvt.185.1589903083783; 
 Tue, 19 May 2020 08:44:43 -0700 (PDT)
Received: from localhost.localdomain ([71.51.180.250])
 by smtp.gmail.com with ESMTPSA id l133sm10819975qke.105.2020.05.19.08.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 08:44:43 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/7] drm/amdgpu: simplify CZ/ST and KV/KB/ML checks
Date: Tue, 19 May 2020 11:44:23 -0400
Message-Id: <20200519154426.1752937-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200519154426.1752937-1-alexander.deucher@amd.com>
References: <20200519154426.1752937-1-alexander.deucher@amd.com>
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

Just check for APU.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++++----
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c     | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e036c868e354..80a6c3156766 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1699,7 +1699,7 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 	case CHIP_VEGAM:
 	case CHIP_CARRIZO:
 	case CHIP_STONEY:
-		if (adev->asic_type == CHIP_CARRIZO || adev->asic_type == CHIP_STONEY)
+		if (adev->flags & AMD_IS_APU)
 			adev->family = AMDGPU_FAMILY_CZ;
 		else
 			adev->family = AMDGPU_FAMILY_VI;
@@ -1726,10 +1726,10 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 	case CHIP_KAVERI:
 	case CHIP_KABINI:
 	case CHIP_MULLINS:
-		if ((adev->asic_type == CHIP_BONAIRE) || (adev->asic_type == CHIP_HAWAII))
-			adev->family = AMDGPU_FAMILY_CI;
-		else
+		if (adev->flags & AMD_IS_APU)
 			adev->family = AMDGPU_FAMILY_KV;
+		else
+			adev->family = AMDGPU_FAMILY_CI;
 
 		r = cik_set_ip_blocks(adev);
 		if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 2584ff74423b..0a6be88ebad9 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -2342,7 +2342,7 @@ static u32 dce_v11_0_pick_pll(struct drm_crtc *crtc)
 
 	/* XXX need to determine what plls are available on each DCE11 part */
 	pll_in_use = amdgpu_pll_get_use_mask(crtc);
-	if (adev->asic_type == CHIP_CARRIZO || adev->asic_type == CHIP_STONEY) {
+	if (adev->flags & AMD_IS_APU) {
 		if (!(pll_in_use & (1 << ATOM_PPLL1)))
 			return ATOM_PPLL1;
 		if (!(pll_in_use & (1 << ATOM_PPLL0)))
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
