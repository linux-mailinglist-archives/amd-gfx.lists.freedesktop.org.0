Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC20297222
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Oct 2020 17:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60286F8A5;
	Fri, 23 Oct 2020 15:20:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64056F89F
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Oct 2020 15:20:48 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id e6so1181637qtw.10
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Oct 2020 08:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CjJnjHeqKs/c0DiTqbizNFbPNmuReNHAXMEU9PdrjYA=;
 b=RwSJV+Sul2ZU4J6ntAYvh6a3jRK6VH6lEh2YVuA6hVC26m33gf3MpnKbr5JdhEY1sg
 mG7c2CoHmg2vcWJEV2eeHvz5oZFoG2aZvVzvvBkucd4GAtJqSSbskRGGimrZJ9P6k1w9
 Nj5x9PTbtnhzxUEqj9mJDSLclPz2IRb8z+h/DQfjkrvrCrDt4QLp1QIF4npF93bLIPB4
 Ap6iMZaqiUsniHH1j3sgg0lTeWD3owDDPa5O8tho076HXLv3bCN7pycd3LPBAlSJK6vw
 oORJm5r3mJXbhm9HUyJ9PPUw7RNmeOg3LTy8glXjtxL4uxyJJhV10Nsqy2t9+38yOMnj
 RBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CjJnjHeqKs/c0DiTqbizNFbPNmuReNHAXMEU9PdrjYA=;
 b=JAMw3PW3LDui2ZNVN0tQZb3dfGSaNRrWjroLtQAN4m7lH6PjLYhKg361b2fc0MTCkA
 U49JGnZozRhRPDvIJA2RmB9jcc/tgQDL3W6D5pO2s8cNgY2gyI+erM9Zqz/qNH3zJufy
 ryMa9PqpU82uiJgNsVhjvkxsMnkbHFhvov6PZwWYCSqf3boYGqPsXIaM7xdQfHjtyGMs
 zEWSdtYnZpg/+ZxBmQIMewshvG6mVJbJuk9Pncx1ood42rBoTHsU6A7Kynyuo+5MoFGp
 4Qk2ehvosNdqMXVfSYFAS88BlVTVFp+AMZlG3V8OT3lu+Ipq90ysYDDgqhqKrP0XAJgw
 kBOw==
X-Gm-Message-State: AOAM533C3PE8OOwo5L8NFLWvB70WXk36ca12fLde9uCwr/sYL/CTcV9D
 WC952OmvI5UjcU1tGeegKKuZmXLzxR8=
X-Google-Smtp-Source: ABdhPJzvh2OYzkn9H9haiCWyW2CUCCK6qCXiou6pJEFiYuJmPYAdF/YAbypC+jNQ7dmw/E+YIYha0A==
X-Received: by 2002:ac8:584f:: with SMTP id h15mr2702238qth.159.1603466447779; 
 Fri, 23 Oct 2020 08:20:47 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id i20sm905824qkl.65.2020.10.23.08.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 08:20:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu/nv: add mode2 reset handling
Date: Fri, 23 Oct 2020 11:20:32 -0400
Message-Id: <20201023152033.373128-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201023152033.373128-1-alexander.deucher@amd.com>
References: <20201023152033.373128-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Vangogh will use mode2 reset, so plumb it through the nv
soc driver.

Acked-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 72435e0eb8b9..bf363841d0c8 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -352,6 +352,7 @@ nv_asic_reset_method(struct amdgpu_device *adev)
 	struct smu_context *smu = &adev->smu;
 
 	if (amdgpu_reset_method == AMD_RESET_METHOD_MODE1 ||
+	    amdgpu_reset_method == AMD_RESET_METHOD_MODE2 ||
 	    amdgpu_reset_method == AMD_RESET_METHOD_BACO)
 		return amdgpu_reset_method;
 
@@ -360,6 +361,8 @@ nv_asic_reset_method(struct amdgpu_device *adev)
 				  amdgpu_reset_method);
 
 	switch (adev->asic_type) {
+	case CHIP_VANGOGH:
+		return AMD_RESET_METHOD_MODE2;
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
 		return AMD_RESET_METHOD_MODE1;
@@ -376,7 +379,8 @@ static int nv_asic_reset(struct amdgpu_device *adev)
 	int ret = 0;
 	struct smu_context *smu = &adev->smu;
 
-	if (nv_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) {
+	switch (nv_asic_reset_method(adev)) {
+	case AMD_RESET_METHOD_BACO:
 		dev_info(adev->dev, "BACO reset\n");
 
 		ret = smu_baco_enter(smu);
@@ -385,9 +389,15 @@ static int nv_asic_reset(struct amdgpu_device *adev)
 		ret = smu_baco_exit(smu);
 		if (ret)
 			return ret;
-	} else {
+		break;
+	case AMD_RESET_METHOD_MODE2:
+		dev_info(adev->dev, "MODE2 reset\n");
+		ret = amdgpu_dpm_mode2_reset(adev);
+		break;
+	default:
 		dev_info(adev->dev, "MODE1 reset\n");
 		ret = nv_asic_mode1_reset(adev);
+		break;
 	}
 
 	return ret;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
