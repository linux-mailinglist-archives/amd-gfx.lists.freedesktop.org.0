Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BC113CB0C
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jan 2020 18:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493FA6EA5B;
	Wed, 15 Jan 2020 17:31:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36466EA5B
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jan 2020 17:31:47 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id r14so16371087qke.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jan 2020 09:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MyicgG5o9wgKbVrlzwPSu8gP9oSj27YmNPnB8pr6338=;
 b=tWA47MpK0+6zlHe9m1CCH0UF2xF2O5G1lTdB4kOJL7JnohkcTMluC4k0/ANBm4tkOh
 MWVSmFpgNoTX9qy1Cm2MsqT4Qf8obnOMWHwL8RFsyJspwXPSlF4bZ5tx6RHdMy7AkOrS
 3SDiGbvgZp4xBiy60YDQ8XXGMtfdHwo8E778Vrh9RwU5D/jDhTW4HE8Y1tgda6RAmIh+
 /rpf2sltbvRcktVRlQiQCfFSZ8zVUofV3hN/Jari0hoFEWD9xiIqj3UJQJnusbY5qQoi
 ++qtNSTPl7cEP4ABJr24yfWQI4AUkHRBEqwuKUX4ORN941Km3aI4fNWpQGuNO8KP5BIb
 zzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MyicgG5o9wgKbVrlzwPSu8gP9oSj27YmNPnB8pr6338=;
 b=lj2axuynW70K/4sWWyq4KhZoffsOgsGV8idhbIrfdiQA66Lu/bmF1efEqpnNVPq/Tq
 jFOwwJXpaBzHDa14nJiIq87zUqzdN0Tudw8Rr0rD/V6xOBSOoBEh+aXIV0aWa6zyvKZZ
 tTJ1m8bO3CvB9PIUvcfuFWpLkIYQ3kglZcHVEMaGhVkJxXBje5ShoLRFVdQHYEvoBDCy
 kPq+7IHJIE59zGjXlpawvGfNoKuUqyCdAyBsa1Y1PhDFuyEwVuLuRxl6GzLSyM/eLrb+
 Vr2M84ATo+3GO62WNrUrw1MOElgycZ9d80IGM9wFo/kxEh8SxZEZvg53cZokSmXNKPHy
 Nw1A==
X-Gm-Message-State: APjAAAXvLNLfCJshGzLbbiN4aEZNdT+HB+pDXAkJIIFTvWIskHq+zANd
 HLGH7KMFKB5sCrrcHrtKuKgFkS/J
X-Google-Smtp-Source: APXvYqz2W/ySqiiii6/9zLl8RDR7FML8lLZ1n6+F8i3+mTBcpZwVzrX6ns2ZEK4HEgJ1JsEnzcL+oA==
X-Received: by 2002:a05:620a:1108:: with SMTP id
 o8mr26883938qkk.118.1579109506615; 
 Wed, 15 Jan 2020 09:31:46 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id 21sm8771609qky.41.2020.01.15.09.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 09:31:46 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: attempt to enable gfxoff on more raven1 boards
Date: Wed, 15 Jan 2020 12:31:39 -0500
Message-Id: <20200115173139.1392429-1-alexander.deucher@amd.com>
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

Switch to a blacklist so we can disable specific boards
that are problematic.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 42 ++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index e3d466bd5c4e..b48b07bcd0fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1031,6 +1031,37 @@ static void gfx_v9_0_check_fw_write_wait(struct amdgpu_device *adev)
 	}
 }
 
+struct amdgpu_gfxoff_quirk {
+	u16 chip_vendor;
+	u16 chip_device;
+	u16 subsys_vendor;
+	u16 subsys_device;
+	u8 revision;
+};
+
+static const struct amdgpu_gfxoff_quirk amdgpu_gfxoff_quirk_list[] = {
+	/* https://bugzilla.kernel.org/show_bug.cgi?id=204689 */
+	{ 0x1002, 0x15dd, 0x1002, 0x15dd, 0xc8 },
+	{ 0, 0, 0, 0, 0 },
+};
+
+static bool gfx_v9_0_raven_check_disable_gfxoff(struct pci_dev *pdev)
+{
+	const struct amdgpu_gfxoff_quirk *p = amdgpu_gfxoff_quirk_list;
+
+	while (p && p->chip_device != 0) {
+		if (pdev->vendor == p->chip_vendor &&
+		    pdev->device == p->chip_device &&
+		    pdev->subsystem_vendor == p->subsys_vendor &&
+		    pdev->subsystem_device == p->subsys_device &&
+		    pdev->revision == p->revision) {
+			return true;
+		}
+		++p;
+	}
+	return false;
+}
+
 static void gfx_v9_0_check_if_need_gfxoff(struct amdgpu_device *adev)
 {
 	switch (adev->asic_type) {
@@ -1039,10 +1070,13 @@ static void gfx_v9_0_check_if_need_gfxoff(struct amdgpu_device *adev)
 	case CHIP_VEGA20:
 		break;
 	case CHIP_RAVEN:
-		if (!(adev->rev_id >= 0x8 ||
-		      adev->pdev->device == 0x15d8) &&
-		    (adev->pm.fw_version < 0x41e2b || /* not raven1 fresh */
-		     !adev->gfx.rlc.is_rlc_v2_1)) /* without rlc save restore ucodes */
+		if (!(adev->rev_id >= 0x8 || adev->pdev->device == 0x15d8) &&
+		    ((adev->gfx.rlc_fw_version != 106 &&
+		      adev->gfx.rlc_fw_version < 531) ||
+		     (adev->gfx.rlc_fw_version == 53815) ||
+		     (adev->gfx.rlc_feature_version < 1) ||
+		     !adev->gfx.rlc.is_rlc_v2_1) &&
+		    !gfx_v9_0_raven_check_disable_gfxoff(adev->pdev))
 			adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
 
 		if (adev->pm.pp_feature & PP_GFXOFF_MASK)
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
