Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABF0C23B50
	for <lists+amd-gfx@lfdr.de>; Fri, 31 Oct 2025 09:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D06B10EACA;
	Fri, 31 Oct 2025 08:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="CJNl/UMG";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F6E10E9FE
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Oct 2025 16:10:24 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-475d9de970eso8922015e9.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Oct 2025 09:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761840623; x=1762445423; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2i47abyZfZz1bsH2DYwFEj9nyP4hs0s7U+jv9iT3E+I=;
 b=CJNl/UMGB5y2+Ss/y75JKzzg87mvX33hhA07WRoFBrCY5WVOC+THTqdKQMIQVwp7jT
 GoZcZZvPtP1B+Pp3lBwLxA5Y5OlotYZwffU4lLWViyt5oHpulR0InN4dfuNoRNjCmfF2
 nxDc2n1FAZ0Tb/eTYMINhIQ1dRGHj/uj+/+MwLJ72+LzAfm+MFUER3SlcG8H52gUFETe
 easj8+72hnaFKA6PwMMh380+KQ4Gyf32+XU/w9EMxTj9WZ6ZdASizWhf+Cke9Ni7NHVa
 WNjyg9x/0Ty9rP92coH8urcVf8J+RjNN3Z9l8N8xDFV2iN4A9g5IxHH3+Y3eEIaqBeVw
 Lc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761840623; x=1762445423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2i47abyZfZz1bsH2DYwFEj9nyP4hs0s7U+jv9iT3E+I=;
 b=hlFvZpzgMLQiZ8R5sBLLpZgf1S35CVJrNFuGK+mzKkmruHmI8qPDlcE6fYbYkHlzYg
 jc9aElmgYxYqmoPP7CCsUhSiTP53TnTxnkCkeHQXnhTorMjySXVvKKZFf6HozHsz/BMS
 1l7dsd1OrhEVtpnclUeeJh4QovlAiQ33g5MSgaUKOsFxJj9Iy6Mx1f6ESfSjTeBFVKW1
 oZxIcv7rbJIvhRtdlKzDFfAO20e7J7TUM4c1mjqugiDUDr0KnCSbvX93XnNxaNkmi8PT
 BNb+h5qot6sk+IqImx/K/cmUxjRLl1hqNGGDNthpN/fKJh9fU1+lUW6jVknF0HSyW+E/
 7Ysg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE40ENP5YAnCDcbJGEHJjs9y6YfJ97YlNrRPP+b0nrNzKS/8j16+RwIdqpRO1PaqDStOmUTY4D@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeQg8uEt8wIykTbSBjIKX/L+kTneIgc7DN7p+RLzoFuBP7H+mL
 FVYE8J0pyY5u+VYt9b3+67qOf8cWikWUF376NbrYJCwOquqLf5zZ/qO8lqM0AMPfS+M=
X-Gm-Gg: ASbGnctgVFBcxJiV9IDGRf4391jSlaX5WbVI3waHoHz5ZZ3dIFfE6U0jdebGF4odi95
 +h2tV6g9doTgtlDoO+g87uSbij3eMvvkmEEXhQ6rnSiEIBdp6WhmnPwnmiha43Cc105AWO2sc5l
 cvnFDWJr3Uky0afD3ROQemWuGH7tTnH/x1HFzSgLsMobP/jKmR9SFfMxr6dYmVAJ4HGkd07oyHl
 PKmceOCKnOr60WOpXfbTmhAuwbnT8v16Thj2YCgkY7oevLWPdkxVRn2sllMZNcBUbvRaI2cX+lg
 YlOTdb1oXeipz5Xg6AJy9XErE/uhKts1jP4J7OEGVWec8a1p9+O17d+G6ChtTFKMcZHiiDw5EEO
 a6Lrq/O9bLXsSpVj4hQdIXFVKP3Gd2lOXADVfIJu6TS0fzCVnWO3edMwoUPu1Rutv3b+kranJ44
 2jp90nrMJeSb/x7Og=
X-Google-Smtp-Source: AGHT+IGAga75c6sY1Q+McZyix+GUEVEkjmtz7d93ls2cdpw2dE67igG9rZbHtTGqPlGirMSJ37N0Bg==
X-Received: by 2002:a05:600c:8b30:b0:471:15df:9fc7 with SMTP id
 5b1f17b1804b1-4773086d57cmr2259475e9.26.1761840622930; 
 Thu, 30 Oct 2025 09:10:22 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7a7csm33124857f8f.8.2025.10.30.09.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 09:10:22 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 2/4] drm/amdgpu: replace use of system_wq with system_percpu_wq
Date: Thu, 30 Oct 2025 17:10:09 +0100
Message-ID: <20251030161011.282924-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030161011.282924-1-marco.crivellari@suse.com>
References: <20251030161011.282924-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 31 Oct 2025 08:12:39 +0000
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 8c4d79f6c14f..2f8160702f9a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4798,7 +4798,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 		}
 		/* must succeed. */
 		amdgpu_ras_resume(adev);
-		queue_delayed_work(system_wq, &adev->delayed_init_work,
+		queue_delayed_work(system_percpu_wq, &adev->delayed_init_work,
 				   msecs_to_jiffies(AMDGPU_RESUME_MS));
 	}
 
@@ -5328,7 +5328,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 	if (r)
 		goto exit;
 
-	queue_delayed_work(system_wq, &adev->delayed_init_work,
+	queue_delayed_work(system_percpu_wq, &adev->delayed_init_work,
 			   msecs_to_jiffies(AMDGPU_RESUME_MS));
 exit:
 	if (amdgpu_sriov_vf(adev)) {
-- 
2.51.0

