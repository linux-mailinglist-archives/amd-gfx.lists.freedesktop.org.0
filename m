Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9BB21F932
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 20:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38836E82B;
	Tue, 14 Jul 2020 18:24:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208226E82B
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 18:24:19 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id q198so16529496qka.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 11:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=63GckWYRfqN7TFWA2BiZDjURb3Th2s7M7n1aeIImYAo=;
 b=WE+wi8IsY54dTz+m94Xw1Iv60QXVH9vZc/brsOE3OykQaKjnIBg7kcmQmuQvSHsbwn
 PTcnwB1HUWjRT1Rzn/ZC0pepnvv5RyQ9bKw8kEiLIfV0s7964+mdDeRvrGTSXgkvIAnD
 8N+ZrDAcXOIdLW5W51YfwxAi+9CYeGpT6C0KNW3DDjlMe9r6TIssIq8v29w+crDsOSoj
 j8/OiMtXs4B994Bs5BzxtBYA2jfQ6NghCVVa+ieDCaeBLjxibIO96+BThiNr3SOlDver
 z9xPc/03dmKtw4erFa5RT5d161XsH8wmoM9jQPn6+p1s31vKuixS+dK+o+cWSe43/Dox
 gfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=63GckWYRfqN7TFWA2BiZDjURb3Th2s7M7n1aeIImYAo=;
 b=YddCf8s70AlcuCVaIfrCrroaewB0AEfHr2woZTxaeChUbGYMxTp6yxB3wTlEvbWXOe
 fLL7HHbBNloOlJ3GoX/SAHEQMFQ9XOZo+M4ZvvoRaJnpnWx6njfWPBty+Vh7lY19XcZH
 18t1AvXSTKk+zCzRlYkc1v13HFI1nwWQp9sStupK0IxdnWXG0fzIBlUCmluJS2tf7izQ
 rXlFy1bq+pAYQZ4UMgOCvwrThOEY8pPuJmgDifTTOb/yLV6OvkgQSiJwMV9DjRguuTYW
 zuFVXw15PlWq+edQoM57oDzgw5NEj6VsTwJClVHq0WSuEhajpU+RK6dv5Jfx8DcHmQm3
 nArA==
X-Gm-Message-State: AOAM531E3nITraXXp4Bs9hJwiWyCP46IUDnAxDikVg4TXIIo4EGB1RCL
 /BA5joz0IjD5Da9nX6/XqJBpCPEB
X-Google-Smtp-Source: ABdhPJz+OZx4CS73QM/HBDCN/HBYZLMcxN+nylxvIlFXiHxSS2Vfjt/NHFtZBu34NPKxhs96jGVnGA==
X-Received: by 2002:a05:620a:2eb:: with SMTP id
 a11mr5524941qko.383.1594751057963; 
 Tue, 14 Jul 2020 11:24:17 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id d53sm26046456qtc.47.2020.07.14.11.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:24:17 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/42] drm/amdgpu/gmc10: add navy_flounder support
Date: Tue, 14 Jul 2020 14:23:18 -0400
Message-Id: <20200714182353.2164930-8-alexander.deucher@amd.com>
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

Same as navi10.

Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 8f29f79f820d..2bf112fc8185 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -753,6 +753,7 @@ static int gmc_v10_0_mc_init(struct amdgpu_device *adev)
 		case CHIP_NAVI14:
 		case CHIP_NAVI12:
 		case CHIP_SIENNA_CICHLID:
+		case CHIP_NAVY_FLOUNDER:
 		default:
 			adev->gmc.gart_size = 512ULL << 20;
 			break;
@@ -847,6 +848,7 @@ static int gmc_v10_0_sw_init(void *handle)
 	case CHIP_NAVI14:
 	case CHIP_NAVI12:
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 		adev->num_vmhubs = 2;
 		/*
 		 * To fulfill 4-level page support,
@@ -951,6 +953,7 @@ static void gmc_v10_0_init_golden_registers(struct amdgpu_device *adev)
 	case CHIP_NAVI14:
 	case CHIP_NAVI12:
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 		break;
 	default:
 		break;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
