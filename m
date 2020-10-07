Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F22E28644C
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Oct 2020 18:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2586E96D;
	Wed,  7 Oct 2020 16:32:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8006E967
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Oct 2020 16:32:17 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h12so854906qtu.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Oct 2020 09:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kaGRnl7rpBWgnCg/9fiZ6BDb7yFlhICoAClQ5IzMzlk=;
 b=qMwj21QPGsavF7Yletwun+9nvmNBeVSythbiTYkUvkdGecIG7v5kp+a/19v+hg6/4i
 Gu3ETFCosWafiky+THxKv05GMo53MRBA9GD9FOaZH5citeme3/20CUmnY6dcGLEciEVz
 UQr5DbUMoUV7u4UIlEawtKN9SCU+LZ++RBtXPKJLKX8rnIHCBT+QFyztfF60z6MlP3J0
 7nOu0uQIWwxdjzHGEcYfQk5QOjCP52zvw7JN9Q8ReSl/cKZVLkritw0SODMK/YeeMavA
 QTHMdvXF5lpz5kFWETUJnzCjEeU7/5nthS9BNmj6zeFXdqiCAt6qKgNrnxF2bOq21dts
 69Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kaGRnl7rpBWgnCg/9fiZ6BDb7yFlhICoAClQ5IzMzlk=;
 b=iyIsW0Pt+JhnSDnTDFSkpLbuY7vv16HYW6PERaKtb61zWpS2B/fJyglc+hbNcb/W+S
 bd3kzDy1WeD/XVOcpxw9TU77+yD/60JhJ4bc77t2xJh9V4bOgpGiFPDApNco7sB3gK/T
 JDP6gxPFRCuBAQtZBPNFkcfLxP4Qm/+m9DOuuC0B/pHmLmfUY4WfmjMgZQ8/3lx2GpxJ
 uWJkPvYx96jGTSUoTMRifoS81YDSg08JcmOVObxuKOwhi3Y5YpcJfDaKOhbr08EFghsW
 TyxZ55IuFp6kJiQXvSwkw3M2Mq4qoJR0CmFCpwjTg/I1kQ49jlSDe46QE2Y+kD8Dy7mE
 RrMg==
X-Gm-Message-State: AOAM533qPD/JRFff59QM/jq91WkBbpblL3Zq+cChl0NyoCgxeB35X1h/
 3bSyQjFVSpOVmoNkJwsED/1PK11r8AE=
X-Google-Smtp-Source: ABdhPJxJFkq2w73r/oKceYJ7+W1zm6762mZB+5BzssgLVwyULdoOQy3j8FV0TsoWBMxKwpyJ9QoLhQ==
X-Received: by 2002:ac8:6945:: with SMTP id n5mr4001288qtr.202.1602088336687; 
 Wed, 07 Oct 2020 09:32:16 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l19sm1725576qkk.99.2020.10.07.09.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:32:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 19/50] drm/amdgpu/vcn: add firmware support for
 dimgrey_cavefish
Date: Wed,  7 Oct 2020 12:31:04 -0400
Message-Id: <20201007163135.1944186-20-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201007163135.1944186-1-alexander.deucher@amd.com>
References: <20201007163135.1944186-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: James Zhu <James.Zhu@amd.com>

Add firmware support for dimgrey_cavefish.

Signed-off-by: James Zhu <James.Zhu@amd.com>
Reviewed-by: Leo Liu <leo.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index 81102598cde7..dc4053a034c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -45,6 +45,7 @@
 #define FIRMWARE_SIENNA_CICHLID 	"amdgpu/sienna_cichlid_vcn.bin"
 #define FIRMWARE_NAVY_FLOUNDER 	"amdgpu/navy_flounder_vcn.bin"
 #define FIRMWARE_VANGOGH	"amdgpu/vangogh_vcn.bin"
+#define FIRMWARE_DIMGREY_CAVEFISH 	"amdgpu/dimgrey_cavefish_vcn.bin"
 
 MODULE_FIRMWARE(FIRMWARE_RAVEN);
 MODULE_FIRMWARE(FIRMWARE_PICASSO);
@@ -57,6 +58,7 @@ MODULE_FIRMWARE(FIRMWARE_NAVI12);
 MODULE_FIRMWARE(FIRMWARE_SIENNA_CICHLID);
 MODULE_FIRMWARE(FIRMWARE_NAVY_FLOUNDER);
 MODULE_FIRMWARE(FIRMWARE_VANGOGH);
+MODULE_FIRMWARE(FIRMWARE_DIMGREY_CAVEFISH);
 
 static void amdgpu_vcn_idle_work_handler(struct work_struct *work);
 
@@ -127,6 +129,9 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 		break;
 	case CHIP_VANGOGH:
 		fw_name = FIRMWARE_VANGOGH;
+		break;
+	case CHIP_DIMGREY_CAVEFISH:
+		fw_name = FIRMWARE_DIMGREY_CAVEFISH;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
