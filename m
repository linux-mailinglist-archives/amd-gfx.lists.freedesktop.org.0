Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729EF1EABCE
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC516E359;
	Mon,  1 Jun 2020 18:22:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978006E359
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:22:33 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id e16so8523773qtg.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/QCteXn5FdAWX4SKYfDYey9Zjo2l8UcoogA1E/jpLPk=;
 b=W193x2txUQP+Sp5wGA/OzCiGdK7akYUOhXnE2qd4eMwSUYtfMUFKt3x0PJPdDTO9Tp
 ARl7COeXUm2MCclb3/P9y0QyGSTuMehixXm3KDMGh/JVF4pinsWQ7F7MyTjiHglk+CGb
 zzBMZRvDr1O7Yz07JnKjqqc6GzUj4WRtJmFkGrkKzZNAISo+yf4hfqhYRx/8WkJAfNdo
 4fv4Quo7hclxzpYm1Jb0KKxCnci+FN6xr5gIA0xza9ChU/xH+Ax29q4aCCEZ+hUQ6kOw
 01FF+fLgSVk4RwIT8OBfsG63YNfJXbE/yW3iQHNETtnYhZdS5ub9uT4jvx/fRLsNsbkD
 Zrvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/QCteXn5FdAWX4SKYfDYey9Zjo2l8UcoogA1E/jpLPk=;
 b=fpk1rFfE6sHPvCjHIJU18xWYCJbS8obveQ4asTnnQlhmLhejagEHFzVJ7Og6cNu3/2
 SZKb22R0KDxtcOJOg1q/fac+XS22DvhjzGt6/hiSyDpsy0x1ZeBOXYxaHgcIM18xFuRR
 IK9lYIaPV1DC3L5+rK9TCbpd+obtBWztc1xm8pQUCPdi9iADJAZy0AEtl6VNGU5cfpFu
 dWSVwjQeDQfbaaMfhafRrW7xxYKAkZwrtIXBqSIc5q5eunnvgN6hEoX0TJ+4Dsqhx6qr
 h/sE4IbIF9BSsPy5ZUoEj9ZwrPB9zbZzCJfC8mVZo7G49n8DUs+SKNmVNOjXi5wbILxX
 E9cg==
X-Gm-Message-State: AOAM532C3RaUI7hb8L3iywyAMagyp9GAiCtzl2gn3LHVc00VNnw3Q3gS
 H3utVJGQHBtd9bq878+AcJA9+1Ao
X-Google-Smtp-Source: ABdhPJyFigmX1C1Nx6atHtB3TbZdfprxYC6PCMlt86KrQ6n/ja474RYMGQJhsCD3Uq07KsgPOUMoZg==
X-Received: by 2002:ac8:3779:: with SMTP id p54mr23779236qtb.156.1591035752619; 
 Mon, 01 Jun 2020 11:22:32 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:22:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 158/207] drm/amdgpu: skip GPU scheduler setup for KIQ and MES
 ring
Date: Mon,  1 Jun 2020 14:20:05 -0400
Message-Id: <20200601182054.1267858-69-alexander.deucher@amd.com>
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

Fix the coding error to skip GPU scheduler setup for KIQ and MES ring.

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 8712a2e1b869..0ce82686c983 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -470,7 +470,7 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
 		return -ENOMEM;
 
 	/* No need to setup the GPU scheduler for KIQ and MES ring */
-	if (ring->funcs->type != AMDGPU_RING_TYPE_KIQ ||
+	if (ring->funcs->type != AMDGPU_RING_TYPE_KIQ &&
 	    ring->funcs->type != AMDGPU_RING_TYPE_MES) {
 		switch (ring->funcs->type) {
 		case AMDGPU_RING_TYPE_GFX:
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
