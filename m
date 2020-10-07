Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB9C28644F
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Oct 2020 18:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AD06E96C;
	Wed,  7 Oct 2020 16:32:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281236E968
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Oct 2020 16:32:22 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id q63so3487381qkf.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Oct 2020 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QcjqpDA/ApfiCazF+mzC46e1sNpmAMvMyMTkm9ZMY6w=;
 b=ogunqQSp8yFDRq72iG6sYEHAK4xYw1fKniizMTcaPXOha/S1c1LHtIomnVlqqXmMk1
 ZiSPzKXv3qgzd9QWD1Ijs4kG415LpnIL1r6uLoGHIRFSxhMs0EIs9VILq76iDc9Mhg6e
 5v7H7gBPXHNqY6IJdVHvG8oX5DSNn6MZuv5zlkLhgNGJoOk/aW89+pxOf1n3lPnM2GHz
 YbPbTjkvNoGJDD33ZbVT6ujcumACr4sFzBtaQpv9YHZb6gYHB8ds2ZzTE315KVKgYLmq
 Woydn0ljg05uUwJpdH5TOAQ8DZuYn++nZm8x865vPEmaNkDpns9qlJTMJj9+ajzPgWTg
 WXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QcjqpDA/ApfiCazF+mzC46e1sNpmAMvMyMTkm9ZMY6w=;
 b=osj7kojKb+VWqAvsz2kONC1Qa0TTreZqR7UHoRErNen8tod+iYnAPmjdCHQXE79Zn6
 wxHBHlPbSGZLMTak3dKjztFhCoshOd8I/C84wCi8tyIi0rdsavTrv63VOlLM4nOnIbuJ
 Lng32vYN+u4JjaZ1zycl1eapYzLcZOjSiRwWVAnoDW7V5n3kK7ad3k/ssgyw2JlSgFGS
 YIo7ZnuqkwDMbM1zVnVNadpVTmtx99HWuWXaJFBsmCNtm3PDg1+uy1NEi+ol/gylKB5J
 eR7P+3CbZ3zuCLWU6NCk8iGHiH+9InSkLdyft6F1H/aAfUtFdiZhkv7U3Uv1L5SsHQZo
 BF3Q==
X-Gm-Message-State: AOAM530kTopjti9sfW5h/vy0jHNXq417+hFMDngqKLyHl4cc2z/gJEsq
 krMLiB1gyfOSQ+9uZZe+KuPjTXJSnAc=
X-Google-Smtp-Source: ABdhPJzqK4PaloKPrSWyWtjQSrKVNtBoMfSHwxEzp9hkLxbsyjwMlg+UEKPbtfR8vXNK8lAk3mXpJA==
X-Received: by 2002:a05:620a:15e4:: with SMTP id
 p4mr3623834qkm.457.1602088341113; 
 Wed, 07 Oct 2020 09:32:21 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l19sm1725576qkk.99.2020.10.07.09.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:32:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 22/50] drm/amdgpu/swsmu: increase size for smu fw_name string
Date: Wed,  7 Oct 2020 12:31:07 -0400
Message-Id: <20201007163135.1944186-23-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Tao Zhou <tao.zhou1@amd.com>

A longer chip name needs more space.

v2: define macro for the length of smu fw name

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h        | 1 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
index 44fd0cd069de..bda1acb62090 100644
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
@@ -31,6 +31,7 @@
 #define SMU_THERMAL_MINIMUM_ALERT_TEMP		0
 #define SMU_THERMAL_MAXIMUM_ALERT_TEMP		255
 #define SMU_TEMPERATURE_UNITS_PER_CENTIGRADES	1000
+#define SMU_FW_NAME_LEN			0x24
 
 struct smu_hw_power_state {
 	unsigned int magic;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index 3e949e53cdc3..8248e557cd1a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -84,7 +84,7 @@ int smu_v11_0_init_microcode(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
 	const char *chip_name;
-	char fw_name[30];
+	char fw_name[SMU_FW_NAME_LEN];
 	int err = 0;
 	const struct smc_firmware_header_v1_0 *hdr;
 	const struct common_firmware_header *header;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
