Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 179FF28643B
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Oct 2020 18:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5823F6E0F7;
	Wed,  7 Oct 2020 16:31:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F326E0F7
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Oct 2020 16:31:48 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id z6so3492135qkz.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Oct 2020 09:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Cb2Qt1vBhgvAi1mOceNsxaMp+HGen1B+k55CW3qZvI=;
 b=F6QOAdAKATsiwFCKLihlZcMJKAndNa5nTEXyxKaoWRIzmebheKwS4YE5njI6ovzG/a
 IQ/RayAFTSg4BakUSbrk5WLA799C2BtHlupNqDgGpA1YNTb4zLDRHo/ZdgOa4muT33Oh
 DrCCoswnmgPRrabmdFpv2zVG1e1HILDnsZSSOMZiKGMpuD7cfjOQ6GEgzgpGd2/YqWX9
 2KWHsSBM9AVxXQtNY+dKp+kUPLIs1QWrGI04uuvkaXe9/YV+Ie3xDRXsC9Bs+gWFbDK0
 u/7HZk9TjF+LDG+1DF5qD+9NEMpQ+NREob9bw1zPIs2zEJjfKMxPgt4Q8JpxpWs6ERnp
 pxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Cb2Qt1vBhgvAi1mOceNsxaMp+HGen1B+k55CW3qZvI=;
 b=qk8FUp5i7lZql+DPUiTh2WC4riWVykRUz7pgnGAZ6wuwmiYzko4U4sCzA7m5FM4jlW
 HaImieuN+W8AGp3sUH8maZC0njjkjTdE1/pzRNLE+r36CXADEgGFNbcgOGU/w/E3SYV9
 CP8k0MCl1tOWQnrDE35nEz71Rt/iwrAbKKIQVGjIBmRbWPB9cm6Nik2PPmA69vyqMw6E
 ZOeEWtxOSqUwejR44HSd2HBozbXa/lbyF71foZeKnpNbOLv/NY329cyyEll0h+NPeRWX
 nsT20URlJnNnn2ZKQPHgC10VNBpT3AoLoLMwchPvmwc9QuKreDGHp/XroU/1CVV22Scr
 2sbQ==
X-Gm-Message-State: AOAM53016Y9l+3hiFdauWvoWTRbixNNg2Kh5TPveX/ra0JJjqokXad6m
 zbRnG5I6d3hed+/Tg/6v/6aOOSb23s0=
X-Google-Smtp-Source: ABdhPJxEfwDpsHJQRpC5cjzXkDvZkaXwyNMWdnkoA0D345B0KnojdUH3w0sZfodXGkmZaIQcmRxnIQ==
X-Received: by 2002:a05:620a:66d:: with SMTP id
 a13mr675317qkh.301.1602088307097; 
 Wed, 07 Oct 2020 09:31:47 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l19sm1725576qkk.99.2020.10.07.09.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:31:46 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/50] drm/amdgpu: add dimgrey_cavefish gpu info firmware
Date: Wed,  7 Oct 2020 12:30:47 -0400
Message-Id: <20201007163135.1944186-3-alexander.deucher@amd.com>
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

Load gpu info firmware for dimgrey_cavefish.

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Jiansong Chen <Jiansong.Chen@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 0aef7ec21f01..cea6cbbfc259 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -81,6 +81,7 @@ MODULE_FIRMWARE("amdgpu/navi10_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/navi14_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/navi12_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/vangogh_gpu_info.bin");
+MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_gpu_info.bin");
 
 #define AMDGPU_RESUME_MS		2000
 
@@ -1818,6 +1819,9 @@ static int amdgpu_device_parse_gpu_info_fw(struct amdgpu_device *adev)
 	case CHIP_VANGOGH:
 		chip_name = "vangogh";
 		break;
+	case CHIP_DIMGREY_CAVEFISH:
+		chip_name = "dimgrey_cavefish";
+		break;
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_gpu_info.bin", chip_name);
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
