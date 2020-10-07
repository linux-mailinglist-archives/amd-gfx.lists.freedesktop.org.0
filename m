Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8959E28644D
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Oct 2020 18:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C37F6E970;
	Wed,  7 Oct 2020 16:32:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9326E965
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Oct 2020 16:32:19 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d20so3472885qka.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Oct 2020 09:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4E8JhSqvuNQ+AiT66KsJriAt0LjwhCPPP6Mccx6POpY=;
 b=nh5XfWrFBrVvuJKyl8dPvG2jJIVbYTry5FusEcCkqvMraSBLPzljWE7sjO27oHvjkW
 btGLUgov/qWZ3/tYRnESzHGabfHDUq1K1UhoR4nbWnwlTslAvZhKw+oZJpejc3xb4jcM
 vXluwrLrcAPWTe3xXsRwuzSCDi7ng9/i9sb9OjZ9wCilNqHoIulx+qMg+0O5mjVlXZxK
 O1A+RxYFDQ3qXlG+stUnTRHDOhCjgE9xWe9WgOX0DiI2KeDUAZL1qR6hig9O8KwClVz8
 t1K4Wp3Jnr2/4iieO5QOEZYfZhsIFAAI+QvaN+CRGmsFDSL/HhxwPELajq8/QAA7+PlB
 XYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4E8JhSqvuNQ+AiT66KsJriAt0LjwhCPPP6Mccx6POpY=;
 b=BZSckl3fTxKfBlxZnjq6pxcoRJg9T9l3EZPqlGRoKxPLbGrA7yp+HDYQ1iwiIt5nhi
 lmLOHMtiXp3M9cOxEMriYP4dprk8gqFe3cgTqiQWbCEk8ubFBUz0o5Tvw+77/IzD6z7k
 heLWtJGo5gsYYEzrlTITSFSibsj2VaVFRbS4tZyCk0QVifMQuWniyZfXUk9X0bb9vqHg
 sf+qFlNZvelPAJy0hSqOqsC6lBCvEQ4H5TKNxdOLlErcSC+LGta3sBCAZ7hKRs0GUP2G
 DeJ6VOua2Ylv9YpjaugHmAsqHCWAV5aowdjbT+/fuvZ4RIwhgEXFM91A75xwd7it2sRd
 4Ubw==
X-Gm-Message-State: AOAM530h0nrlcifc2jntj7e1UKIhssuzOw7Yr6+tl7+qZch6XrYbdzmC
 ibL0KztrwQOVIdMWwPwPzvpVJbLhmfY=
X-Google-Smtp-Source: ABdhPJylkZCt3rtt2dPLo5cOO3jEtsXFNp8/UaxJ8B5rYZQ47yaOhy0ZLFEVixIiIdjATrYP5VC/4g==
X-Received: by 2002:ae9:ed13:: with SMTP id c19mr3656916qkg.196.1602088338381; 
 Wed, 07 Oct 2020 09:32:18 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l19sm1725576qkk.99.2020.10.07.09.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:32:17 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 20/50] drm/amdgpu/vcn: enable VCN DPG mode for dimgrey_cavefish
Date: Wed,  7 Oct 2020 12:31:05 -0400
Message-Id: <20201007163135.1944186-21-alexander.deucher@amd.com>
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

Enable VCN DPG mode for dimgrey_cavefish.

Signed-off-by: James Zhu <James.Zhu@amd.com>
Reviewed-by: Leo Liu <leo.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 90ff9cdcb924..94ccacd786ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -905,7 +905,7 @@ static int nv_common_early_init(void *handle)
 		break;
 	case CHIP_DIMGREY_CAVEFISH:
 		adev->cg_flags = 0;
-		adev->pg_flags = 0;
+		adev->pg_flags = AMD_PG_SUPPORT_VCN_DPG;
 		adev->external_rev_id = adev->rev_id + 0x3c;
 		break;
 	default:
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
