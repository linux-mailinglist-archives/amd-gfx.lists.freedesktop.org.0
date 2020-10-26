Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C532998E0
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Oct 2020 22:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700846EA75;
	Mon, 26 Oct 2020 21:33:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F686EA75
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Oct 2020 21:33:57 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id c15so7903431qtc.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Oct 2020 14:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MQQDppazKabfn3rbLWJ5cU6IfHLk4C0bHHLSz5CxkdE=;
 b=CTTLam30TxWVFBgIbGOs5w8LSGWu5AftiizIucoQPbp82+rvtTnq0d3eEa+0xpd43M
 766GkJi3dKFSzs32VJHLTzKsArlEOwtgMK7Jl5YkkkE1AdoMTWX62jVivtDk0vaG4pQj
 zk/2CnmGEuu3mFY2N0jpw7zsY3FAD7S1v277k273GjyERZ75yi6Rn5u3uRaS7UEm8g0t
 EEWu+3Ikj481dhv2ZLMCQg2FCl0LPmKzV/7MPHi+XXJVFEukIH21XOOkTWRxxsBwpGSL
 IrHC/Tl0psvsrIq8E+2l8XT9BqjOK63J8l9vZYThHdkuu4Z0V8ZV2m1VWOiQXJdXRtrB
 4txA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MQQDppazKabfn3rbLWJ5cU6IfHLk4C0bHHLSz5CxkdE=;
 b=luASl3i/Onv1+iQ9x40y6d5vCP0qmuZkrmQfRX/rNOiKEWf1NlBJTl61slJhzryBGn
 0OwQdLqXiSyHthu6ZxXIz7ocMHhjVHZFIJdIXPg81f0CwG6BU77KJFdUGgmIJS6orzBo
 R0bzkoIFyzyg4/7D/jN811EXfrgGh1kptzfBFxX49fltfAcI11v45iyhNla5gGlyoxg0
 ebtDMmnF4pGR/SRsuSuJeex0WjckpojMtxE/ztZhPgyrA8VaQhFmxS7GF8bNN3ikrKre
 /BDptw36HWtLNa6dC3m6K2PN3xZzLuNtTSDXSSIzHB5h2bCfRErftIltDYcT6JLh4wQ5
 kvQQ==
X-Gm-Message-State: AOAM533LZPesDHZGO7QTcYSMlBbTNB56ez2G2oGaYh3UJ7Slyb9bXrVs
 2cGwEu20wVKf7ZPt4k213wxCifcsxx4=
X-Google-Smtp-Source: ABdhPJyWFX/3P/GbNG/jL+CrHwZPr4kVE5gHR2YNtavNMLpSLmUADlyzii7PCTh4+f06h3HbgE4aUg==
X-Received: by 2002:ac8:76d9:: with SMTP id q25mr19419865qtr.125.1603748036142; 
 Mon, 26 Oct 2020 14:33:56 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id n199sm7448742qkn.77.2020.10.26.14.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 14:33:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/swsmu: drop smu i2c bus on navi1x
Date: Mon, 26 Oct 2020 17:33:47 -0400
Message-Id: <20201026213347.1680226-1-alexander.deucher@amd.com>
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

Stop registering the SMU i2c bus on navi1x.  This leads to instability
issues when userspace processes mess with the bus and also seems to
cause display stability issues in some cases.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1314
Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1341
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   | 25 -------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index 8d8081c6bd38..9cf97744b67e 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -2534,29 +2534,6 @@ static const struct i2c_algorithm navi10_i2c_algo = {
 	.functionality = navi10_i2c_func,
 };
 
-static int navi10_i2c_control_init(struct smu_context *smu, struct i2c_adapter *control)
-{
-	struct amdgpu_device *adev = to_amdgpu_device(control);
-	int res;
-
-	control->owner = THIS_MODULE;
-	control->class = I2C_CLASS_SPD;
-	control->dev.parent = &adev->pdev->dev;
-	control->algo = &navi10_i2c_algo;
-	snprintf(control->name, sizeof(control->name), "AMDGPU SMU");
-
-	res = i2c_add_adapter(control);
-	if (res)
-		DRM_ERROR("Failed to register hw i2c, err: %d\n", res);
-
-	return res;
-}
-
-static void navi10_i2c_control_fini(struct smu_context *smu, struct i2c_adapter *control)
-{
-	i2c_del_adapter(control);
-}
-
 static ssize_t navi10_get_gpu_metrics(struct smu_context *smu,
 				      void **table)
 {
@@ -2687,8 +2664,6 @@ static const struct pptable_funcs navi10_ppt_funcs = {
 	.set_default_dpm_table = navi10_set_default_dpm_table,
 	.dpm_set_vcn_enable = navi10_dpm_set_vcn_enable,
 	.dpm_set_jpeg_enable = navi10_dpm_set_jpeg_enable,
-	.i2c_init = navi10_i2c_control_init,
-	.i2c_fini = navi10_i2c_control_fini,
 	.print_clk_levels = navi10_print_clk_levels,
 	.force_clk_levels = navi10_force_clk_levels,
 	.populate_umd_state_clk = navi10_populate_umd_state_clk,
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
