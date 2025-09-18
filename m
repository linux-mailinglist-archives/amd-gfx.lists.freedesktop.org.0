Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD413B51F3B
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Sep 2025 19:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5D110E99C;
	Wed, 10 Sep 2025 17:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RpX/T+MW";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641E810E99C
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Sep 2025 17:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cVJFfoTnXRklteQRLFGt9FSM2TMBq1NtMgf0+Lif01E=; b=RpX/T+MW5uNQ6MDW4RgbxlYyTG
 3y+SYvCAQ2f1QoWR/h7HOr+7GirBryF1MSUzQj2mxm3Tc2JgGmpJS7ptfSvO68SWW3oNN/vZJydvf
 8++bFHVtWkmFV+pXv/Ym0mgERuI5kWlXth/wC46mq/CrpC54YqInk3UZfaRBv/486wJUFHOd/SNI/
 M5ySh0+eEZZWqiYcuAAONXOYjFr/inQtRr+bQqLm+hY5SysvuSOU6k69kbTcT5SRMOoMKI/NHpLDO
 ikWjSK7MJwSnC1TawvuzBg9cd6YooQhVsqlQ2qnzfVKsWKCEyH2cxf8zUbJEMP78atO/nnXMkZSz8
 m1NvYaRQ==;
Received: from [104.193.135.201] (helo=debian.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uwOrv-009URG-AV; Wed, 10 Sep 2025 19:44:32 +0200
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>,
 Robert Beckett <bob.beckett@collabora.com>
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH 04/10] drm/amd/pm: Use devm_i2c_add_adapter() in the i2c init
Date: Wed, 10 Sep 2025 11:39:37 -0600
Message-ID: <20250910174350.2729341-5-siqueira@igalia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250910174350.2729341-1-siqueira@igalia.com>
References: <20250910174350.2729341-1-siqueira@igalia.com>
MIME-Version: 1.0
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Instead of using i2c_add_adapter() and i2c_del_adapter(), replace them
with devm_i2c_add_adapter() to simplify the i2c logic.

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
---
 .../gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c    | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
index b067147b7c41..18d5d0704509 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
@@ -1641,33 +1641,22 @@ static int aldebaran_i2c_control_init(struct smu_context *smu)
 	control->quirks = &aldebaran_i2c_control_quirks;
 	i2c_set_adapdata(control, smu_i2c);
 
-	res = i2c_add_adapter(control);
+	res = devm_i2c_add_adapter(adev->dev, control);
 	if (res) {
 		DRM_ERROR("Failed to register hw i2c, err: %d\n", res);
-		goto Out_err;
+		return res;
 	}
 
 	adev->pm.ras_eeprom_i2c_bus = &adev->pm.smu_i2c[0].adapter;
 	adev->pm.fru_eeprom_i2c_bus = &adev->pm.smu_i2c[0].adapter;
 
 	return 0;
-Out_err:
-	i2c_del_adapter(control);
-
-	return res;
 }
 
 static void aldebaran_i2c_control_fini(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
-	int i;
-
-	for (i = 0; i < MAX_SMU_I2C_BUSES; i++) {
-		struct amdgpu_smu_i2c_bus *smu_i2c = &adev->pm.smu_i2c[i];
-		struct i2c_adapter *control = &smu_i2c->adapter;
 
-		i2c_del_adapter(control);
-	}
 	adev->pm.ras_eeprom_i2c_bus = NULL;
 	adev->pm.fru_eeprom_i2c_bus = NULL;
 }
-- 
2.50.1

