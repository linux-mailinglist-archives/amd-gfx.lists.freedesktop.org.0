Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E15821F931
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 20:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED786E82A;
	Tue, 14 Jul 2020 18:24:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5EA6E82A
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 18:24:17 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id w34so13623846qte.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 11:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BefmLb8TFj6FvcfiI3OFh0tHmgRhc8OovpKlmxlrxbk=;
 b=RWdEjR5Gfg9zTNkZQa/J1PBKUs1EueeHanGR3jg6ALAJlbVOKu5NTE6+CPd/vVdtoO
 OezPWnXSaiXBh+du/XKuE335mUI0nOixM3qL8zvJX6FqFDsL8vSc9KiZcdpzrRDEBKZq
 qsP4KOUGTvle+7OekRzageO0syWb4drlCH/+9qUj43G7AmyiUM4Hxo54c3XRT3kadePl
 RzuEG2IZH+3s23f7JS39YVaDgNzM+o0WUJPbQJ2gPTz6mlZJU64R8AhGtctDWZFLAyOx
 u//vJaIEq73AmmvbcTFOUg3MWy5xPxSOjkYtuECLvBKLR67FrcvX0EgWKgsAy4oNAwNN
 TYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BefmLb8TFj6FvcfiI3OFh0tHmgRhc8OovpKlmxlrxbk=;
 b=DC0JI21xbE9vEdtCAaP4SdjE2lK1rxM71U/u9f2YBN6psFw5vDjIaPq/t+//PvGRhn
 HURG5KpQah77Kf7ef5zoX95LhQmWDg+eXdXyidj4CXeGb4GiEafDkfn6XYkfW6Mp7yKx
 HkH1V4h8h/YDbPD9Thu5SE1WeWWot8I+6snf7HGHFDYX0fgtaW7ZZ+curd1N43uWsDgF
 CmSYYsp9jRkJJlNNLplaeq3u3xv8M0RgmYoHdvcaddFyVtMhcYgoNlyojd19V4UyCVZS
 4DoWCr306Z5T6BplsJW57wnW1y5jJphSFp2PB2MNEZNojhNX1mEyCUoU1FH2fkYaQuqv
 XF9g==
X-Gm-Message-State: AOAM5323tdVZSdz9SkRgTmG1RiLweU0qRoacXgacD8I853adtxxpk/bP
 NOW8QR90zfxfLRCnUiJbeWUXLG70
X-Google-Smtp-Source: ABdhPJwiwj7JeYmW7Dl7ynz6YWj7a/KefU78I4pDuVaadIS1whyJzL1Nf/MGC4ATTJZM/jrazct+jQ==
X-Received: by 2002:ac8:2fa9:: with SMTP id l38mr6192527qta.40.1594751056763; 
 Tue, 14 Jul 2020 11:24:16 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id d53sm26046456qtc.47.2020.07.14.11.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:24:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 06/42] drm/amdgpu/gfx10: add support for navy_flounder firmware
Date: Tue, 14 Jul 2020 14:23:17 -0400
Message-Id: <20200714182353.2164930-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200714182353.2164930-1-alexander.deucher@amd.com>
References: <20200714182353.2164930-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Jiansong Chen <Jiansong.Chen@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jiansong Chen <Jiansong.Chen@amd.com>

Declare the gfx/compute firmwares.

Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index ddf6d8128753..60b8da3e7321 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -145,6 +145,13 @@ MODULE_FIRMWARE("amdgpu/sienna_cichlid_mec.bin");
 MODULE_FIRMWARE("amdgpu/sienna_cichlid_mec2.bin");
 MODULE_FIRMWARE("amdgpu/sienna_cichlid_rlc.bin");
 
+MODULE_FIRMWARE("amdgpu/navy_flounder_ce.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_pfp.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_me.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_mec.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_mec2.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_rlc.bin");
+
 static const struct soc15_reg_golden golden_settings_gc_10_1[] =
 {
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmCB_HW_CONTROL_4, 0xffffffff, 0x00400014),
@@ -3578,6 +3585,9 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 	case CHIP_SIENNA_CICHLID:
 		chip_name = "sienna_cichlid";
 		break;
+	case CHIP_NAVY_FLOUNDER:
+		chip_name = "navy_flounder";
+		break;
 	default:
 		BUG();
 	}
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
