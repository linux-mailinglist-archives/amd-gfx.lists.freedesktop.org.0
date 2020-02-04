Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB33D151C8B
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Feb 2020 15:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777B26F37F;
	Tue,  4 Feb 2020 14:49:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60746F37F
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Feb 2020 14:49:12 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m10so2377957wmc.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Feb 2020 06:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o2sIbs4RPv8xOmjAuGyAr0aW6i2Ja7EVj6mrWbwNXG0=;
 b=NBQ9j4p9J8mTJfBYmgYe5u03kTzdo0xqzQp8Gjkt6c9udJhCUfqIPq3reasdhzuJcK
 QCYDbIDHUSBSjB+gMW9LjkNn+LfkmNbjnR3id3HPcetLzbuGPKblg/OcuY9i+RghHFgX
 hCUGpGYR7kpwcbVelLeqVITG7bT0HIDajuMRtgyoaVOAOYnEdi3YqM64qnUQDitKCMRg
 tUL9PBp0/ag7Z6pi4YXi6yqn+8Q5jb/TRDaSlNGxNJVduJUYsmuQw3VTxl8bQ4O73879
 3lTy+Q5yJsunUeQOwaH5cmYEQ4Dzyzs+Q0VUsD2+P2hO876cR7O+lvaGXgtiUwNnv9ew
 +YKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o2sIbs4RPv8xOmjAuGyAr0aW6i2Ja7EVj6mrWbwNXG0=;
 b=osmxOSNu+3wuwA0dYXUKaSaGJ91VRy8lOpexo/77WxDyb1sjQUG7/E2t/bCX1CnHCm
 mDFVh4kw+yDQHo0e6NDGmMOgrgbGYPsM88XwSKtt+RdKGMAakpFHaBN9OD5GtTFXd4EL
 d8OStDAgjHg4hhPx7NrBR5+Ec+0b9B5dRD6JwRhoikHYYGHogAB8chFKrTdbjmX8y7Kc
 CmZ/w/kl9oiUeDoWV3viezGhOz4Ev0+0gZx/fBr5naMft4095FP0b/ue2MQB+vXGv2o4
 aikePrjyuvhmbemmeSg9sUV4MkrgAZe1GHkWPBxrbbT+DGZ3SZUpPoS7t5BC0nLwkpcx
 sRbA==
X-Gm-Message-State: APjAAAXRE/ZGVMANhavZpoS1/KGTrcjXC54z72K6vLMaNxrmxY2I3ID3
 bKRHTVM84tc4ZbTwuf49jOqzPdAeIBhTGk34
X-Google-Smtp-Source: APXvYqwZKr80yUaefpZy9IzqOIkuGOzyC7Ra2lwepZKMHyXKfWFMXVKq/XpmRSDcekACmcFDXo45Sw==
X-Received: by 2002:a1c:df09:: with SMTP id w9mr5821090wmg.143.1580827750994; 
 Tue, 04 Feb 2020 06:49:10 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F31B30001132E829789D1A4.dip0.t-ipconnect.de.
 [2003:c5:8f31:b300:113:2e82:9789:d1a4])
 by smtp.gmail.com with ESMTPSA id c4sm4068213wml.7.2020.02.04.06.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 06:49:10 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix empty return on non-void function
Date: Tue,  4 Feb 2020 15:51:22 +0100
Message-Id: <20200204145122.46353-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
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
Cc: alexander.deucher@amd.com, nirmoy.das@amd.com, Frank.Min@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This fixes empty return on non-void function, amdgpu_xgmi_remove_device

Fixes: b80574252499e (drm/amdgpu: move xgmi init/fini to xgmi_add/remove_device call)

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 78989e9560d1..490f57d6704c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -463,11 +463,11 @@ int amdgpu_xgmi_remove_device(struct amdgpu_device *adev)
 	struct amdgpu_hive_info *hive;
 
 	if (!adev->gmc.xgmi.supported)
-		return;
+		return -EINVAL;
 
 	hive = amdgpu_get_xgmi_hive(adev, 1);
 	if (!hive)
-		return;
+		return -EINVAL;
 
 	if (!(hive->number_devices--)) {
 		amdgpu_xgmi_sysfs_destroy(adev, hive);
-- 
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
