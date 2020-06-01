Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA9B1EABD0
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CE66E35F;
	Mon,  1 Jun 2020 18:22:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129BC6E365
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:22:36 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id w3so9995588qkb.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v5ljeSu4Ac9F/RbYze6xjJr6u/ozscinQG6gO3crXy8=;
 b=CxH1dgRKpAJjUkC2k3QKUXBkJ/osf2Q7eQirI/NPWeQyWfTkwizHYIIhe/WKzRJUq6
 1lCgdVBLC0MkXSi9F3K0gLG0GXmz9O4g9FZKDvYInjlbVMIldiW+EQSBMU5VIZSidnZd
 gCnJzT+kqB26gS/Se449fviYlwbZGsVTHWvPjLvSTA4lpoE0Brk5lxi9DZiXDBAdOY8o
 wRCDXWGPIMeVp+0H4IKXwik+A/k8Fr3cdHmCkgDVg4MNzHg4OxkyfHfybI2pUPJN4oRs
 pPO6a76yjxPfgItY4u56atx2DNt6EvGokXXqcsi1/2rYplenOJ0V/xgV7tkkxFz5nfhc
 RD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v5ljeSu4Ac9F/RbYze6xjJr6u/ozscinQG6gO3crXy8=;
 b=In58iLAHv4miw5Dup6iSwm1VUFWE6uO3grrs5k3mB69Dx4xjhLEYNcdhSYNkqHd5q7
 uaevBublpfeVfi2kZMK9rf4StLQ8RF4yy9L4DLBcs+s+pS5P95Ko4GxlE5aaTzxPtYlD
 zydIs6rdZLMhda460KgLcQWmIUE1VvgQ9/Xh3OtcSKAaXIqczqKjI5kXA8R9t1hF6DlZ
 LcWvKXwguK2WTTSqEeK41TASHN5NtrybWdT0iZ6asdawiYrvgxJJDdFPhZR1tOYQYJkq
 gxr1GTtGAXabex00ENlmg0QW4GDJqTyJn643zzGFLVBEXQ4/LmyVvKjgk3jbIz6kOm1m
 1QkQ==
X-Gm-Message-State: AOAM533FnO2MiaTJx6RBZ8PJ3SjtV2VSFFYKQLwSfrxGZljkeG4A1zDr
 xe/aMGq4ZwSsYIIwy8xukHjbR6An
X-Google-Smtp-Source: ABdhPJyF2Wthb0mGeDfYFTLdx/qIIMNzqEKFo7Ho0UvdsMzXkmRmuJyACyMsRyK2WYTtEnzklVaj6w==
X-Received: by 2002:a37:7d45:: with SMTP id y66mr18322600qkc.484.1591035754981; 
 Mon, 01 Jun 2020 11:22:34 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:22:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 160/207] drm/amdgpu: disable runtime pm for sienna_cichlid
 temporarily
Date: Mon,  1 Jun 2020 14:20:07 -0400
Message-Id: <20200601182054.1267858-71-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601182054.1267858-1-alexander.deucher@amd.com>
References: <20200601182054.1267858-1-alexander.deucher@amd.com>
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

From: Likun Gao <Likun.Gao@amd.com>

Disable runtime pm for sienna_cichlid temporarily as BACO regression issue.

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 3d85fe509deb..179b75742251 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -174,6 +174,7 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
 		 (adev->asic_type >= CHIP_TOPAZ) &&
 		 (adev->asic_type != CHIP_VEGA10) &&
 		 (adev->asic_type != CHIP_VEGA20) &&
+		 (adev->asic_type != CHIP_SIENNA_CICHLID) &&
 		 (adev->asic_type != CHIP_ARCTURUS)) /* enable runpm on VI+ */
 		adev->runpm = true;
 	else if (amdgpu_device_supports_baco(dev) &&
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
