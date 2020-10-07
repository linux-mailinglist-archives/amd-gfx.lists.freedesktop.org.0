Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6234C286446
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Oct 2020 18:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43A66E93C;
	Wed,  7 Oct 2020 16:32:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C486E958
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Oct 2020 16:32:10 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id c5so2405796qtw.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Oct 2020 09:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nGytUH9+uICWrcyp4z/OOj+WijbuYThyLG7pCg3JgJI=;
 b=CS8hm2x41i9PPq6AZPMc9M5qruVg731WLIc2gkztM38ryjQvhQN97cmS+3vP2+eDMM
 e4jkqK3vfq0ROYU462iYaqm3xjSA6jrWhuFMxPKZjLhcMl79hc35kFv69GVupwqs0+hR
 pVFTFM8oWfALwVkxCPlB7BwF58JTmcAD4G+VxyNPNYlIk6WEWOyRd7JvXFtodo8wpnPT
 DJ+J8ETjh8I2YSyPsG7XstUFUn26RyKUW3PbgzFwv6l86KSLeYmi/F9c2HYmNQhj/KX2
 qwyK5dbce6FlycGDPsx71PgcqDeav3WoNAQg6yglRFRK5NbhCwZVJm0ctRysin0jB5fq
 HM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nGytUH9+uICWrcyp4z/OOj+WijbuYThyLG7pCg3JgJI=;
 b=DoHGciKKYbQ24d9HvgosZTNoTeHG3i+Snn8nBozN+KbB0gibK6pEGPaW+hdkrlh2R2
 aWU0lcP3UfGTnWVOMxdyELzgw3tZqUJ8gRlytd0vvTqBI7hukzLLDB8VJMkMc77auEOm
 fUIV8/JBKPDukdUrfR/ku6vQf4sC1qjIUYxQ4oXuA97pbz33At2YEx4/yHUV3mZ/sgxq
 duW5wC5n4HspTTSNlsFvpkzubm72MxSTgPFaiWMrHn7ibPxFdRPA9Azi+32jo6r1uw16
 dUnxxj+1EjVUdEIWEBcuu86TZ9iD14M3hvxdrroWhqJXgZA64o+jTJ597Ky2VEBQF0yH
 po1g==
X-Gm-Message-State: AOAM531lGM1qq6wc9qVvozfl6zsYPSe4c6td+K+keLO+lcpWqwZR1ZUk
 KxvzsKrLXEuIpc1xgFFYGbji2EUtd7E=
X-Google-Smtp-Source: ABdhPJyN8Vtn4OBFPjQGtY7T2hyiR/CeJEgM/zCWSdGsXmgcOG1j+loUq37je8jyq4pogk2Q3Z+nyg==
X-Received: by 2002:ac8:2f91:: with SMTP id l17mr4014960qta.252.1602088329293; 
 Wed, 07 Oct 2020 09:32:09 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l19sm1725576qkk.99.2020.10.07.09.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:32:08 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 13/50] drm/amdgpu: add ih ip block for dimgrey_cavefish
Date: Wed,  7 Oct 2020 12:30:58 -0400
Message-Id: <20201007163135.1944186-14-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Jiansong Chen <Jiansong.Chen@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Tao Zhou <tao.zhou1@amd.com>

Enable ih block for dimgrey_cavefish, same as navy_flounder.

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Jiansong Chen <Jiansong.Chen@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c | 1 +
 drivers/gpu/drm/amd/amdgpu/nv.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 53ea83c08e8e..837769fcb35b 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -315,6 +315,7 @@ static int navi10_ih_irq_init(struct amdgpu_device *adev)
 			case CHIP_SIENNA_CICHLID:
 			case CHIP_NAVY_FLOUNDER:
 			case CHIP_VANGOGH:
+			case CHIP_DIMGREY_CAVEFISH:
 				ih_chicken = RREG32_SOC15(OSSSYS, 0, mmIH_CHICKEN_Sienna_Cichlid);
 				ih_chicken = REG_SET_FIELD(ih_chicken,
 						IH_CHICKEN, MC_SPACE_GPA_ENABLE, 1);
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 6c06756a216a..7b261dc44786 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -629,6 +629,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 	case CHIP_DIMGREY_CAVEFISH:
 		amdgpu_device_ip_block_add(adev, &nv_common_ip_block);
 		amdgpu_device_ip_block_add(adev, &gmc_v10_0_ip_block);
+		amdgpu_device_ip_block_add(adev, &navi10_ih_ip_block);
 		break;
 	default:
 		return -EINVAL;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
