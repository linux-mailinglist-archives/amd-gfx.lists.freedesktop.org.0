Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE9A122F6F
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Dec 2019 15:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FA489CB2;
	Tue, 17 Dec 2019 14:55:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc35.google.com (mail-yw1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A03489CB2
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Dec 2019 14:55:16 +0000 (UTC)
Received: by mail-yw1-xc35.google.com with SMTP id x138so2007674ywd.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Dec 2019 06:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zRrcnal8rQxmImeFPJm6dtYOA+2bWu6sr+MhRd6WWxU=;
 b=D+SOgv1QzFDJCjmhqLwcaz3VdVYlgpdw6EBZ+qogOGooMnugIJrhh2fYERqX4ourNv
 6VuUlmLf7mSF+IYelsBzBeDWfWHrpjqGbvXiGfZwYYI/cM8B9LeV7AvpS1X1ASGNLVdH
 6pRhbZD4KtMQmNOVGdKSLR8wp8XYrFptgtI6+BWcwHB5BIV6Y/eeyJT3sVopaNsOfsYP
 35bM59OgGG2m9qpahEDQmgcce1rbXwpz6DgQ8LP+Vj8cdDzIpq7w9CrKsyZx68PY55+i
 5SNtrT71ku6LauBnEF2Q09I3A64LHhwOpYHQ9Bw8ZNOu+dW7nlfTbDlhff3MFSDXIgUV
 dbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zRrcnal8rQxmImeFPJm6dtYOA+2bWu6sr+MhRd6WWxU=;
 b=haOKZhWiO+oJJhOAA7JjEZ5Y/QIDStkIftZAW0LZo+OjJiMleCmVbmtd+Hzi+v+4Du
 xRqM2eR4BKb+1GWc2xxndTqr2nDpKwcCIr1nsd/q4cfnukZ7DT8rBc9RhGR5/njDFKmE
 aSaZMg4l/di8IyE5lJJmd8Bmm7BKnihYDWhGvEnReupbDIqdHYvWf7UorQItlhVsjajF
 ZA1i0RelxpTwkldkhi1s/JZqJ/oCndx+dFh4Hlf9PVRKGffYj1QHonSkt1l26YIDcx6i
 lJ8pIURUgz45qP29F8GaRRAMNPU50iMWQLzvyK586AYzHlMTBImn36In7o8cr83EoV14
 Nhbw==
X-Gm-Message-State: APjAAAXhVA3zlOLpIzrF4aBrIOR4DopmHAQ76IDO7Dyu0+dNPK6fQCLC
 Ep7gP20l9QiKS6LWuGJAp6CL/s6e
X-Google-Smtp-Source: APXvYqxdSRIR1jEpkocy5ciC9ERCRdonli18An7FyAY7Tm70PRAp1WQR9tGoCQPJmLT2qNTIiE+b1g==
X-Received: by 2002:a81:a456:: with SMTP id b83mr17149220ywh.219.1576594515032; 
 Tue, 17 Dec 2019 06:55:15 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id j11sm9978146ywg.37.2019.12.17.06.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 06:55:14 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/5] drm/amdgpu/smu: add metrics table lock
Date: Tue, 17 Dec 2019 09:55:01 -0500
Message-Id: <20191217145505.1319348-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This table is used for lots of things, add it's own lock.

Bug: https://gitlab.freedesktop.org/drm/amd/issues/900
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c     | 1 +
 drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index 6dddd7818558..6177a6664737 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -872,6 +872,7 @@ static int smu_sw_init(void *handle)
 	smu->smu_baco.platform_support = false;
 
 	mutex_init(&smu->sensor_lock);
+	mutex_init(&smu->metrics_lock);
 
 	smu->watermarks_bitmap = 0;
 	smu->power_profile_mode = PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
index ca3fdc6777cf..503099f254c1 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
@@ -350,6 +350,7 @@ struct smu_context
 	const struct pptable_funcs	*ppt_funcs;
 	struct mutex			mutex;
 	struct mutex			sensor_lock;
+	struct mutex			metrics_lock;
 	uint64_t pool_size;
 
 	struct smu_table_context	smu_table;
-- 
2.23.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
