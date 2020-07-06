Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B172E215F37
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Jul 2020 21:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC5489F6B;
	Mon,  6 Jul 2020 19:16:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED4189F6B
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jul 2020 19:16:38 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id b185so25319232qkg.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 Jul 2020 12:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VEUItEve36dhgtq7bXMXN0aPsQUBXdASBow9WzHZWhc=;
 b=cK4UXW8rteRwi0TnhX5n7ODJV+Hk7TcjUtUjC3OF9b2luqFkRTrGCeNz9auNUd0hiR
 3Nf8x4Ze2szlNWOXGba0te6tBdINRf2I/iOyj9DtrkRlyKr8fCNfiEzhryGpXvrdMAD1
 z8nZIqmFokKztu9kueL4pCB4DcMfHeItVmhI3tvNXBHGvSVGCsC+VIWLYKkpg3uquazp
 oH5A1k2yNEakbyAzbvOidwaltRGS0oKWKD24820pVr/jM1pf21LD7q+fAOsycItYALVX
 dw30bXDrwSKA/KWZv+Qld/+U4IZjszJhzZ5tRy75EEnNHsoR7N+5rEzpLQfJYQoMI6gM
 bhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VEUItEve36dhgtq7bXMXN0aPsQUBXdASBow9WzHZWhc=;
 b=XWkdLruRK8Lp+tFx23iuON3hwBcPxYdtapYV4Ti01ZvpFuZufHSX+6JK4ap5y+P/h5
 A7AvLAHbXtZpEm9cA9y5BnJ3No5u2G6o22HuqhekMSc3pOw2MOEGq/p7SH24xCkl62j1
 dyyMgo1fYNhi4WMlLT38zgogOU6svljaOWtjjPbr01KWyd+OaPcbtfyRykk2bDBerNke
 fN3jQcsRuBlaSkJpqSvFJx+eJWn9l8PWuopjQe0cwcec/e7DYB47nlTtWrLhwS+bV2oD
 S+aV0SpTqFb9C5MXZrAGRChob9z3nL3WYTNbuW5dNCZdOQFXqvc+l+ISVTK/fXuA6iPH
 celQ==
X-Gm-Message-State: AOAM533HuWnmErD0xmfbIBrX/sEiTK0jUXUr7gNqFKhERNLaJ/Tq7bo/
 AQnYMpgG8xEkTttPo9l+q4n5AKSd
X-Google-Smtp-Source: ABdhPJyw4Z/NyGkLkY5FI7vABSwhq+k598lM2GwduM6WudXaq1jyqJg1TegGHewsazzSFsnsXYRdkw==
X-Received: by 2002:a37:855:: with SMTP id 82mr45915202qki.441.1594062997121; 
 Mon, 06 Jul 2020 12:16:37 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id u20sm24059318qtj.39.2020.07.06.12.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 12:16:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/swSMU: drop pm_enabled check in set mp1 state
Date: Mon,  6 Jul 2020 15:16:29 -0400
Message-Id: <20200706191629.564683-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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

We need to set the mp1 state in PCI shutdown and certain
reset cases which happens after we've already suspended
the SMU.  SMU suspend sets pm_enabled to false which
prevents this code from being run.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index fe4948aa662f..0ed75a9897eb 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -1924,9 +1924,6 @@ int smu_set_mp1_state(struct smu_context *smu,
 	uint16_t msg;
 	int ret;
 
-	if (!smu->pm_enabled)
-		return -EOPNOTSUPP;
-
 	mutex_lock(&smu->mutex);
 
 	switch (mp1_state) {
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
