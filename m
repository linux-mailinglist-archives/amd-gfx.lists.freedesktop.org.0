Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F35164DF8
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Feb 2020 19:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C556EC75;
	Wed, 19 Feb 2020 18:51:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4796EC73
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Feb 2020 18:51:38 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id ek2so679460qvb.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Feb 2020 10:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e6Q5RA80kK/A7Gzc5Dvn33cJRhp44sF6XZz2dBkxNwc=;
 b=BFcLseyzMSY0ukwhKxfD0oy5bmbmPPUq2S4lMHAdx8ANZ9t/dgoBo0gXAVbyec0C/x
 DL3FNacab5chnWZ8ylGdm+GWaq6u6e2FY8NNzkxiMf99uyUrNO0N6fpqQbCrrnQTSIsJ
 km2wDAT1a1cz0TdLaflVQ+XIFZALdcruF2w2e1Wcb1Ae8YVptSnmSCTMBCLZCjW0c88j
 0Evee7fHOg8DIH30bBbyTknMLN+HqtN5AV20mvO1+oNuutD+BADBfECb9w3mjTaZUtkT
 gYCR2pA6wwbwiuqyLY9lV6BDOwNqBBIQtjFHkKShkH/MdpC5s0mH0gCGK7+4zisqq1Mz
 k19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e6Q5RA80kK/A7Gzc5Dvn33cJRhp44sF6XZz2dBkxNwc=;
 b=ib1s5ZzH5gS/fGgN+/t9DYgJ5N8zzzNSsxxEvhuI4YLi7fvkUoYWV+NhWue40PMzWb
 XnLNqgDTngyXaFV1Hhv2r8Kl+32my57ChUrkppatIXYjpd9D76gTswYkzKpVECYH57S5
 0S6hbHTykl4nrx09yl/HW7/uTJZFtxe1iKHpYcFAHWUN2zjVNsRUw285vNkNKXmXH3uA
 XBksdmorkpwTrg09zM6FAh3oCA5xcR8GSUgslP9O/oeCgKkanSgrbOAEfxoY8lb7epya
 kvCzIMVPGiCN5eO98JFXpgH7aKDzY73ZlTQRnvWt4tWfbiNDHUK5tCd/5myMO0NuJyXW
 SdRQ==
X-Gm-Message-State: APjAAAXZRK/KxLR0Yt4flJFuzJmPyET0Y2K/cGd2gD0t8dNMQfqoMnrP
 p/wypcT7SXIsgOsNSg7lNCTtx40/
X-Google-Smtp-Source: APXvYqxl4BG0sqUSFeTqYLD+fviqB1z3ssEiPy+VEW4pR05Fv3rNiL4Y4c46C32UQcvKWJPAw1OCPA==
X-Received: by 2002:a05:6214:209:: with SMTP id
 i9mr22113999qvt.54.1582138297666; 
 Wed, 19 Feb 2020 10:51:37 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id 128sm304960qkk.78.2020.02.19.10.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 10:51:37 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/discovery: make the discovery code less chatty
Date: Wed, 19 Feb 2020 13:51:30 -0500
Message-Id: <20200219185130.222028-1-alexander.deucher@amd.com>
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

Make the IP block base output debug only.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index f95092741c38..27d8ae19a7a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -307,7 +307,7 @@ int amdgpu_discovery_reg_base_init(struct amdgpu_device *adev)
 
 			for (hw_ip = 0; hw_ip < MAX_HWIP; hw_ip++) {
 				if (hw_id_map[hw_ip] == le16_to_cpu(ip->hw_id)) {
-					DRM_INFO("set register base offset for %s\n",
+					DRM_DEBUG("set register base offset for %s\n",
 							hw_id_names[le16_to_cpu(ip->hw_id)]);
 					adev->reg_offset[hw_ip][ip->number_instance] =
 						ip->base_address;
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
