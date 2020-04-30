Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F39331C04F3
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Apr 2020 20:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730956E940;
	Thu, 30 Apr 2020 18:37:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8CB6E940
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Apr 2020 18:37:37 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id i136so2696795qke.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Apr 2020 11:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wCDyRgt4jv5sRD31obJ9wZfzelCmEj/Vuajmlx4+Z68=;
 b=JgvOkT9VUp6qzBF0nK4xuEvboDlLF6B0qqnwJoE0q/91AyiVhqTGoxsDKWMQmJBJ9P
 k9+p7cMkvAM7ak1uEGLpqcq7kPLgcAQE6bovc6b+BXdXLebeMwCVJLawbfNHBS8ysuGt
 N6ebW2ZWtOyc7p5WQuxyxl8s8NF1Re7X44vhWlann0JBV9wUVHwmGR2Q/SrMBAqKdkwR
 uGHE3OtRZhA7pmKAwVbxN3WRcxjO+4N3HyqTAbp821ojSRwE33WrLkZ/1YxQkNkk8NDj
 GY4rvkP9U3EFNOC2jYgBF+MkdQIC8kWrTH8rqtDlxoU+9wdfYHzlAAfevTHblqk4ELhD
 iQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wCDyRgt4jv5sRD31obJ9wZfzelCmEj/Vuajmlx4+Z68=;
 b=DvdXUHRnOEQ4HKx+ieH9evwQraJEzG/DVStxSxM77VMR1tC0S6RBhx0Ff+rLB0e0vS
 axRb3chop3CF3NfxE/2QLui6nEnw7pl9ouTQuFJYPHYxza8oAbyXK4+EZ0EhV2eOliin
 59QI6XpAj+UA2rZ0tCdTB64z/oudn2De6Mgy//3tH8/vP88iAnIfZHKtnpmjTiQXBTAg
 q9NbcA01DzE4N5EVqxj8LqxyQR9NjO9kXHynSCvotFKbeh4+ZyNfWiBxm1kZN8m27HeR
 +pLcJVJMSB+deW7zBfjM2yoVyxVhMbphD0D8GN0jbJ/JqUFAMDzdENf7h4qzOb9NJjTs
 xQLw==
X-Gm-Message-State: AGi0PuZeukX+LMAyL3wnpmKvyoqRo6c5HwQoRgffhMyfZeSfMCGSqr+C
 IZ7rth5JV6/N8XrGSauq+i/MyPgS
X-Google-Smtp-Source: APiQypLx8HiNAt+qWO8tTAhbIbt/JbG0MyrJ492dPOsOVnqBqHC7unxdnT6FsUBasUFylXt5IMfS0w==
X-Received: by 2002:a05:620a:1305:: with SMTP id
 o5mr5088751qkj.222.1588271856924; 
 Thu, 30 Apr 2020 11:37:36 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id c139sm693510qkg.8.2020.04.30.11.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:37:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/8] drm/amdgpu: skip reservation of discovery tmr region in
 pre-Navi
Date: Thu, 30 Apr 2020 14:37:16 -0400
Message-Id: <20200430183719.419549-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200430183719.419549-1-alexander.deucher@amd.com>
References: <20200430183719.419549-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Hawking Zhang <Hawking.Zhang@amd.com>

IP discovery is only supported in Navi series and onwards.
There is no need to reserve a portion of vram as discovery
tmr region for pre-Navi adapters.

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Likun Gao <Likun.Gao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 085d7c238163..93d057f92dcd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1961,14 +1961,16 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	 * reserve TMR memory at the top of VRAM which holds
 	 * IP Discovery data and is protected by PSP.
 	 */
-	r = amdgpu_bo_create_kernel_at(adev,
+	if (adev->discovery_tmr_size > 0) {
+		r = amdgpu_bo_create_kernel_at(adev,
 			adev->gmc.real_vram_size - adev->discovery_tmr_size,
 			adev->discovery_tmr_size,
 			AMDGPU_GEM_DOMAIN_VRAM,
 			&adev->discovery_memory,
 			NULL);
-	if (r)
-		return r;
+		if (r)
+			return r;
+	}
 
 	DRM_INFO("amdgpu: %uM of VRAM memory ready\n",
 		 (unsigned) (adev->gmc.real_vram_size / (1024 * 1024)));
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
