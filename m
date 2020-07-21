Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF3228679
	for <lists+amd-gfx@lfdr.de>; Tue, 21 Jul 2020 18:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7DF89CF5;
	Tue, 21 Jul 2020 16:52:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF6189CF5
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Jul 2020 16:52:49 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id u64so6800449qka.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Jul 2020 09:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z1/OG6+pQXKhBsZ8gbWcuISHl5dAB1SyZQQRrAOww0w=;
 b=qpP64xzK3/elNHwobwVkZVM8HRirDdknHB7SAuc4zUK0TY1fwauJ/JVS9UCBdBgVCy
 7eyIllojMSFEaGv9XhMDJNuMvY4tRFn/ZNAx0pamWAqfPcN4MUuyU4HVJQYZ/t6lX6HT
 eFlLmywpm1mUfkM50ZsTgVKxeTpciThWwHE/vPY/GINvXBUGCrUA5i8hxG+xlVadIHvP
 ls8ntP0O/+RDunYJOm0FdpurEVnfqqM1WWMLlbjOPsqjgFohRfCxmsXjDy5rEzZ0K/Vc
 Js/7qOeGzAlnMGxzfDD/tCS3bLIFvFAmGxMG+ypoOeFsx/ptmkGJRys4gddDJDsdIjj4
 mKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z1/OG6+pQXKhBsZ8gbWcuISHl5dAB1SyZQQRrAOww0w=;
 b=oiH1WSHATUatix/cYpvh54dVGnwxTLbkW2Dfq5L0dKUmvi0JhWXQs4y8B8Y+zetC5i
 lMs3CRNOIeehmc827ilfjQqwfEl7HlYmgtudzFzcEsC8JWhVN1eYUeQcAxamJU8xwPRl
 RnP9mHg0+I/VU4q4j+7mfLyt5np69NPhI7focAnk+gJHp6I2jduHLllFm+Eok0corWvn
 6OhUuXRI100WqAey6g1te0382IxhcwTyzBikT9RUIsupplnpQsRfIAo6G5UF/QNyhEOb
 GOt52fqPB95oequq31U6wWWOXzzayhKbqnZQRaaASjaBoytuQyb0xikeuXqh6NjG+9dq
 Fg8A==
X-Gm-Message-State: AOAM530dgGd8Sxpp1c9QkhLTmbTvebtiE/PFvaG6wz5FTMRjPLefs+q1
 QKSrIn0aG2konxSeR1wJO7+RVe2v
X-Google-Smtp-Source: ABdhPJygR0sutNPoHJRD6IDbvjPVBUsJLKzQnj9l2wfYAWKAIhhS5TohEc5eEjY7GhTEkBArPfZCIA==
X-Received: by 2002:ae9:c20c:: with SMTP id j12mr29017074qkg.369.1595350368268; 
 Tue, 21 Jul 2020 09:52:48 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id d16sm2709212qkk.106.2020.07.21.09.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:52:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] drm/amdgpu: move i2c bus lock out of ras structure
Date: Tue, 21 Jul 2020 12:52:35 -0400
Message-Id: <20200721165240.296265-1-alexander.deucher@amd.com>
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

It's not really ras related.  It's just a lock for the
bus in general.  This removes the ras dependency from
the smu i2c bus.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.h        |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h |  1 -
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c     | 10 +++-------
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.h
index 7f3cd7185650..aa27fe65cdfa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.h
@@ -425,6 +425,7 @@ struct amdgpu_pm {
 	u32                     default_sclk;
 	u32                     default_mclk;
 	struct amdgpu_i2c_chan *i2c_bus;
+	bool                    bus_locked;
 	/* internal thermal controller on rv6xx+ */
 	enum amdgpu_int_thermal_type int_thermal_type;
 	struct device	        *int_hwmon_dev;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h
index 7e8647a05df7..9e7d640920fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h
@@ -47,7 +47,6 @@ struct amdgpu_ras_eeprom_control {
 	uint32_t next_addr;
 	unsigned int num_recs;
 	struct mutex tbl_mutex;
-	bool bus_locked;
 	uint32_t tbl_byte_sum;
 	uint16_t i2c_address; // 8-bit represented address
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c b/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
index 9bffbab35041..f3d0324c4a7f 100644
--- a/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
@@ -32,7 +32,6 @@
 #include "amdgpu_amdkfd.h"
 #include <linux/i2c.h>
 #include <linux/pci.h>
-#include "amdgpu_ras.h"
 
 /* error codes */
 #define I2C_OK                0
@@ -592,14 +591,13 @@ static uint32_t smu_v11_0_i2c_eeprom_write_data(struct i2c_adapter *control,
 static void lock_bus(struct i2c_adapter *i2c, unsigned int flags)
 {
 	struct amdgpu_device *adev = to_amdgpu_device(i2c);
-	struct amdgpu_ras_eeprom_control *control = &adev->psp.ras.ras->eeprom_control;
 
 	if (!smu_v11_0_i2c_bus_lock(i2c)) {
 		DRM_ERROR("Failed to lock the bus from SMU");
 		return;
 	}
 
-	control->bus_locked = true;
+	adev->pm.bus_locked = true;
 }
 
 static int trylock_bus(struct i2c_adapter *i2c, unsigned int flags)
@@ -611,14 +609,13 @@ static int trylock_bus(struct i2c_adapter *i2c, unsigned int flags)
 static void unlock_bus(struct i2c_adapter *i2c, unsigned int flags)
 {
 	struct amdgpu_device *adev = to_amdgpu_device(i2c);
-	struct amdgpu_ras_eeprom_control *control = &adev->psp.ras.ras->eeprom_control;
 
 	if (!smu_v11_0_i2c_bus_unlock(i2c)) {
 		DRM_ERROR("Failed to unlock the bus from SMU");
 		return;
 	}
 
-	control->bus_locked = false;
+	adev->pm.bus_locked = false;
 }
 
 static const struct i2c_lock_operations smu_v11_0_i2c_i2c_lock_ops = {
@@ -632,9 +629,8 @@ static int smu_v11_0_i2c_eeprom_i2c_xfer(struct i2c_adapter *i2c_adap,
 {
 	int i, ret;
 	struct amdgpu_device *adev = to_amdgpu_device(i2c_adap);
-	struct amdgpu_ras_eeprom_control *control = &adev->psp.ras.ras->eeprom_control;
 
-	if (!control->bus_locked) {
+	if (!adev->pm.bus_locked) {
 		DRM_ERROR("I2C bus unlocked, stopping transaction!");
 		return -EIO;
 	}
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
