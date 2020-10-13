Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB21A28CDED
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Oct 2020 14:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E626E8DB;
	Tue, 13 Oct 2020 12:15:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E0E6E8DB
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Oct 2020 12:15:07 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id de3so9875663qvb.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Oct 2020 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DSPPZGYygCMQ72T9RhRk9jhuvWIODoIMpiqVXCPEckE=;
 b=Q6xTLflDVvIokypYvH2PS9Nu4Fpaxr1f3DGVB2ECNVB0jwTqIx+EZ19hRhvi9lOY5i
 XfIpMJBn6/KPyw9CU7wPYirdIxFgtn7iWatcu3RFDK+yRFs0o4UXsVebSJ0iw5GT8Das
 5EzuFvcw1lidosl3DHnA2nhrxMxw0eiXBap5YpyGLpgJa5a5ijz7GOQ5PFe9HIHiWSrL
 l6W3yX29Kj/2F0m56X7hUQeSot9FOwVX863Y04kjDjH8q+EL/tBKv0Yg3psfaOTLCbZQ
 Cu/NKytTj2SVXVH00ih/0pwJxcCMeH2gJnYSTBXQJZ+ZsAd+bzJxaRzznZg3KSb3W+x8
 pdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DSPPZGYygCMQ72T9RhRk9jhuvWIODoIMpiqVXCPEckE=;
 b=Rn4nhSNgAI8/tGZCf2tZj2c43HbtI7ic8QSAFdzgqp5lDMPHFJKgJWNbEpRC67/xTi
 nSIh938sEiQIByhyKUn2CBfwokecu/MdeSu0ooXh/wt3Rcns4c9jewqgASqrZuO1bbWY
 wIFnWuBaER1iQHpAzYhDcD6JyFDl/XDCCzhcZuhyszGjjF5p7370ipEtR2HauCG5yM/B
 d0PZMl9OomTaHgz4JQ2AGxKhXKwaUIn1Xvkormz7LfuqFAeK1Vetd0pQNrqhyQvkF1EL
 8+WOpPagAINmcowWmxwEt+7ariDMl6TzpHLGVEtSK0cjwKUrwzxE/gFDxMGHyCSsA6pP
 ShKw==
X-Gm-Message-State: AOAM532dQhWoI8bekz8uLLjRh5lwfN+Qhpuzm2yatN+DvwtTb1mWViMu
 dq///O0RZeUH93qUfIalT5xBDCVeetY=
X-Google-Smtp-Source: ABdhPJxP7/yuU/5CgILdTBWQMr7wUu0tzp5y4NjiMXLSH0mwCvYi9hlAb64iBJ666Som/zcGJFQe1w==
X-Received: by 2002:a0c:9a01:: with SMTP id p1mr28788268qvd.61.1602591306086; 
 Tue, 13 Oct 2020 05:15:06 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w45sm1222036qtw.96.2020.10.13.05.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 05:15:05 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/swsmu: init the baco mutex in early_init
Date: Tue, 13 Oct 2020 08:14:56 -0400
Message-Id: <20201013121456.574846-1-alexander.deucher@amd.com>
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

GPU reset might get called during init time, before
sw_init has been called.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index f78749bc8760..7e1b303b5a3f 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -422,6 +422,9 @@ static int smu_early_init(void *handle)
 	smu->pm_enabled = !!amdgpu_dpm;
 	smu->is_apu = false;
 	mutex_init(&smu->mutex);
+	mutex_init(&smu->smu_baco.mutex);
+	smu->smu_baco.state = SMU_BACO_STATE_EXIT;
+	smu->smu_baco.platform_support = false;
 
 	return smu_set_funcs(adev);
 }
@@ -803,10 +806,6 @@ static int smu_sw_init(void *handle)
 	bitmap_zero(smu->smu_feature.enabled, SMU_FEATURE_MAX);
 	bitmap_zero(smu->smu_feature.allowed, SMU_FEATURE_MAX);
 
-	mutex_init(&smu->smu_baco.mutex);
-	smu->smu_baco.state = SMU_BACO_STATE_EXIT;
-	smu->smu_baco.platform_support = false;
-
 	mutex_init(&smu->sensor_lock);
 	mutex_init(&smu->metrics_lock);
 	mutex_init(&smu->message_lock);
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
