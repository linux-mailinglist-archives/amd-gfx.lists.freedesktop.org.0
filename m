Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C088AA05ECF
	for <lists+amd-gfx@lfdr.de>; Wed,  8 Jan 2025 15:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A53C10E8C7;
	Wed,  8 Jan 2025 14:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n3Ju6dao";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38A210E82A
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Jan 2025 09:42:32 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso13806926f8f.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Jan 2025 01:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736329291; x=1736934091; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g54O8YkwZGrgLT3edof7A4TrnCHNhhKENcG6SumtW14=;
 b=n3Ju6daoDrdvLXpOp8RmSbtnPLJIjC7v7C8y+e0f/7F4kN5MrbO4XtszFMhGvBHBT1
 uCZa3zbj++jrTsPnThD5gQxQpqsH1CigKi9V5jjszNmcP4pJs1k7t7yi5I7itkIYFe/N
 lWftgl7Uz+hEgMq3hqGlgrZpnOBUfso4XVPOYpF0l6HvQ12V4sVLks+JRJWxk9Fps+d7
 anqJH3X2fyyK7+8KqTNvgErPriDFK8/qcuIPhoME/WRvRu7RxBn1bdcyq+BiesbqU9aU
 mraDTNxi/pgK9XzIY1UBNIP8ONemyjl180cd4Deg2DegHJuN4H+SRGj+++/cGzpTxW80
 HbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736329291; x=1736934091;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g54O8YkwZGrgLT3edof7A4TrnCHNhhKENcG6SumtW14=;
 b=uqrE1LFTWjGgUghHcxNxPs4Ds2sTbKTwQ5QRnaqPN+mylpITajXJvE3Q5c3WrfVMZg
 EqEKoORjPh/Uyc9Z8fsUhv3a7fbJ4LPv0aYNZw4/SbRsgXA4PG9T+LGzgko4DwX7aN6y
 DpcALCI9IKnwZFi7R6AHFgUeCktBUV74NcS6zG4fB+lTgxOpZpNcvtP6yNX3MAcHagTv
 0tPstFsILRe2zgIlvlT7GLc++il8Zrvl7ocMwkBZN6LHDkImFmqpOSXEeR4jQyxSDz5X
 Nimqf9mr8bg8qv7TUb5Z9GrXI4q6r34ztylTdwe3K4BGepqktlIKL/zZFwLN2VR4izM7
 XiMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX6rKJn3RcdBUiwHwBhv8M5D8Bepo7iNe11AZUAlF4VRZ2JhCNJfhS+QB+1fFKRZrLC4oWzdf1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbZZAhLZOkSobLLCNQv2gLh2zQZiJsgRO8o8Mlr2THspPsJCmK
 F5Ywf+XZa0z7emBiF3CeO97x1Zf1wsgqSx1Z8McfKWAKghql7JOgO1Z77qX9TeA=
X-Gm-Gg: ASbGncsQKN6azatKuOXEG0DTBpDykcF3MdHwxjaKo96mBN/rsrxOe0GU0lVAGl9HGgL
 m25nnMOazm7nMzXTgFhO6KAmpDyzJQ6kPxom0WClxVnui/Ch53B4oVpyHs3d5wyLnMTeHLMKygG
 GGocUs9Cqj2airdv3NW7l0L22E/alQHaDNvj8oLrhcPJ0E1HMX5J+IzUrgI5F8O0nEUN2ljoKhv
 Zs9HBVajwQnJeaM/CKABObBd7ao9eDAWm4fecWPhmtf7HTYA9KEUA+Koh+iFw==
X-Google-Smtp-Source: AGHT+IHkhtjxU/+Fjus/E3cnU1FkrZVIFQ90dsX1DLhvXda8HEgNw6w3TvBh5/m1vuuiaw6SkOOZIQ==
X-Received: by 2002:a05:6000:490e:b0:385:ef39:6cf7 with SMTP id
 ffacd0b85a97d-38a872ec3c7mr1392758f8f.32.1736329291503; 
 Wed, 08 Jan 2025 01:41:31 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2c27b54sm14879005e9.0.2025.01.08.01.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 01:41:31 -0800 (PST)
Date: Wed, 8 Jan 2025 12:41:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Tim Huang <tim.huang@amd.com>, "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>,
 Likun Gao <Likun.Gao@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, Le Ma <le.ma@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix shift type in
 amdgpu_debugfs_sdma_sched_mask_set()
Message-ID: <d39a9325-87a4-4543-b6ec-1c61fca3a6fc@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Mailman-Approved-At: Wed, 08 Jan 2025 14:36:21 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The "mask" and "val" variables are type u64.  The problem is that the
BIT() macros are type unsigned long which is just 32 bits on 32bit
systems.

It's unlikely that people will be using this driver on 32bit kernels
and even if they did we only use the lower AMDGPU_MAX_SDMA_INSTANCES (16)
bits.  So this bug does not affect anything in real life.

Still, for correctness sake, u64 bit masks should use BIT_ULL().

Fixes: d2e3961ae371 ("drm/amdgpu: add amdgpu_sdma_sched_mask debugfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 632295bf3875..174badca27e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -362,13 +362,13 @@ static int amdgpu_debugfs_sdma_sched_mask_set(void *data, u64 val)
 	if (!adev)
 		return -ENODEV;
 
-	mask = (1 << adev->sdma.num_instances) - 1;
+	mask = BIT_ULL(adev->sdma.num_instances) - 1;
 	if ((val & mask) == 0)
 		return -EINVAL;
 
 	for (i = 0; i < adev->sdma.num_instances; ++i) {
 		ring = &adev->sdma.instance[i].ring;
-		if (val & (1 << i))
+		if (val & BIT_ULL(i))
 			ring->sched.ready = true;
 		else
 			ring->sched.ready = false;
-- 
2.45.2

