Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25CA286466
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Oct 2020 18:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FA16E97A;
	Wed,  7 Oct 2020 16:32:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DB66E979
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Oct 2020 16:32:46 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id ev17so1490180qvb.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Oct 2020 09:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u7IHYab9ep7roSNhJS1if/uNNO/4p7w+yoNsf+2F4Ew=;
 b=hV2PVKAowCugy3LdfzCPtg2aubDkuolpB8ln3At+PvqDujIyfhohR0HHRKPHA7KcJY
 YXUsxCjRXxrpglIu/R6O6/fvVYulZBDxm7RpYyg8RflGwKOqncOS6toX+b8zazxqIIBT
 U6+o+0jwEbPpQrbji9cMOtR5SZsKz9eCsNcplfjSKhgh7RwE7PMDNRGmJ+ugc8tgnlsf
 M2s5XMR87DDt9rtEdHiYBnjGoByREK5mwHdjAi3seRSP+S306GxWANAFLdIipCnZk+nJ
 p8VGGmT87dW0vFy6sBBfAvMCgiPINpimMj1gN83NyQqA7iJanWk2gqpHIrE0HpcagxwM
 Ce7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u7IHYab9ep7roSNhJS1if/uNNO/4p7w+yoNsf+2F4Ew=;
 b=WzhrizJ2I0k/2MSyKpwgEWIRCcaH5Sgb/9h3O3ZYGJlQM3+sYrkS8dLs/pa8hOq5ZX
 mcBrq1oUquAl/BXhXkJ8pVva/kJ+5Qu3TFOQr+JEsNkdHZQC14lsCJUpgl/VQi4FB8hx
 MpdwRhbokCfsiMMlFQqlY5QzIVrhBlaaJJKJfLckyxraOwI5kg9D9SWTIXgZUpuFz9VE
 JuzLEv+BpUZ/RYYBVqBs9z6PigY4MAfe2PK+hi7YNEnKyTlXaOdQ0LwW3UVptTYvayn6
 NR6hNp3jM6HyzV8aAectMf/CusRInJ6UIrp2HgNQq7R4rsxRajF1SKNj0KvHzduTVfXV
 sgUg==
X-Gm-Message-State: AOAM532m85YnnVNdvHq3UrJMR3zzhtXbpBuseGIWdLuxYMg75C743jnf
 qw1mfhOdlm8UKqzsyQb8aRm3LiaFxE4=
X-Google-Smtp-Source: ABdhPJwH+85vRtuI0utsq0cIMvT610UsKvuYQTokfymPA6+tff5J62y5GM/wkdUhdmMc3sNWlO6PUA==
X-Received: by 2002:a0c:b343:: with SMTP id a3mr3798561qvf.41.1602088365544;
 Wed, 07 Oct 2020 09:32:45 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l19sm1725576qkk.99.2020.10.07.09.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:32:44 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 41/50] drm/amdgpu: enable jpeg3.0 for dimgrey_cavefish
Date: Wed,  7 Oct 2020 12:31:26 -0400
Message-Id: <20201007163135.1944186-42-alexander.deucher@amd.com>
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

Enable jpeg3.0 ip block for dimgrey_cavefish.

Signed-off-by: James Zhu <James.Zhu@amd.com>
Reviewed-by: Leo Liu <leo.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index b96b42e4264c..9e567a34b94b 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -635,6 +635,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &gfx_v10_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &sdma_v5_2_ip_block);
 		amdgpu_device_ip_block_add(adev, &vcn_v3_0_ip_block);
+		amdgpu_device_ip_block_add(adev, &jpeg_v3_0_ip_block);
 		break;
 	default:
 		return -EINVAL;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
