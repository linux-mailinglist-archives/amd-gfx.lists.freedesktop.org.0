Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4678C28162D
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Oct 2020 17:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0AE6E9B0;
	Fri,  2 Oct 2020 15:09:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E246E9B0
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Oct 2020 15:09:54 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id j22so1457123qtj.8
 for <amd-gfx@lists.freedesktop.org>; Fri, 02 Oct 2020 08:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KkrOQGG5uTbcrARy3BMRzg+kAws68+2C2SUHotS6/F0=;
 b=q68RzSz+xpkS8Ixhr7PM8Ofqn4+TzoVtSC6as26okXSfb5o9hqwMGvQovWAunvOTfS
 QTA1Fc9yEAneUk1dWF5HpI1X9NvC5IiaP4MAIQGY1F5dWBlK7pX4DCXv8lv0G3nlz1kz
 RjP+rti+HN0YEe9YXQg5sypQTuqNiCVqFlTkqMWPTvbRbLx/OEcvi8OE9hAwDEppYtJd
 h9GFS4rNqJ5DjmdkSslhlqXLKz6gLLjtjvnwUcwmd/qvbdtMS/dbdZfquorFyeAHBnyT
 eo2lpDHEsHPaa1BVDEAzNJHWvrtrGMuaru8wMoKTsvwjmIlvuFt7yymVBh8zDqZkuv4F
 0ZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KkrOQGG5uTbcrARy3BMRzg+kAws68+2C2SUHotS6/F0=;
 b=dUB+9oHZXU/1EMwTN4LKz55fkXxaJxAgFLwBRFh8dk0mHPkwhZVnm6S2pRHHg71vET
 RHyQ8D6hAqVsiZ0bcAwYB2EoGkVYq5zhWZNUoZGhsUfPMGheSc//LcLM8q2KVTCrEVKi
 XwIVmKKLqQ+DNk62rbVfUZ/pUWxjln9PH1xy0R9UrgHdYARLx0jX+WWjzDqfgtsQK0xm
 5IakY3HvAr66FG4jBGwj7KY4QK2v1qOf62Cj6qzvg4yLZenWQPsosoGU5/6t8CkZKaCZ
 YjGMmTqcygm3qYfTUVrTFLgT8XGVUm1/RVUG8xA4UI8Nmf9ABdry+HyZxw/Ts9o7ffs/
 WCig==
X-Gm-Message-State: AOAM5326WRKLEXJzJGSMcFpQwb40kY2+CgFOPI4OHFaoRyKV5YPKjFXJ
 986JdzkFAssu+F28vsvKlt4RbGG4T0E=
X-Google-Smtp-Source: ABdhPJxuMe+tp/a/KwS5i5sjPzMrcDBGjw85FbkWodmYz1Fnv7DTlCK2OHDQTPj94XDdcg8KVgb8tQ==
X-Received: by 2002:ac8:411c:: with SMTP id q28mr2762360qtl.254.1601651393004; 
 Fri, 02 Oct 2020 08:09:53 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id m67sm1248435qkf.98.2020.10.02.08.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 08:09:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/7] drm/amdgpu: add green_sardine support for gpu_info and ip
 block setting (v2)
Date: Fri,  2 Oct 2020 11:09:35 -0400
Message-Id: <20201002150940.1103949-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201002150940.1103949-1-alexander.deucher@amd.com>
References: <20201002150940.1103949-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>,
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Prike Liang <Prike.Liang@amd.com>

This patch adds green_sardine support for gpu_info firmware and ip block setting.

v2: use apu flag

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 1cd1b9d8bc4d..782ee1dc18be 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -81,6 +81,7 @@ MODULE_FIRMWARE("amdgpu/navi10_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/navi14_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/navi12_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/vangogh_gpu_info.bin");
+MODULE_FIRMWARE("amdgpu/green_sardine_gpu_info.bin");
 
 #define AMDGPU_RESUME_MS		2000
 
@@ -1803,7 +1804,10 @@ static int amdgpu_device_parse_gpu_info_fw(struct amdgpu_device *adev)
 		chip_name = "arcturus";
 		break;
 	case CHIP_RENOIR:
-		chip_name = "renoir";
+		if (adev->apu_flags & AMD_APU_IS_RENOIR)
+			chip_name = "renoir";
+		else
+			chip_name = "green_sardine";
 		break;
 	case CHIP_NAVI10:
 		chip_name = "navi10";
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
