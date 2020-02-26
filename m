Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D519170C3C
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Feb 2020 00:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE7D6EBE0;
	Wed, 26 Feb 2020 23:05:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52CE6EBDE
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Feb 2020 23:05:49 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id m25so1041110ioo.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Feb 2020 15:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MfsJNtnWeOn5arE0Ak3PdCulrzVrEA7hKn/buCmUqQk=;
 b=l3ghPXleFfnbv3nN60AWdFp7SA3jYOpKyCy97MYzwbBJzjzCafxuYGtU6liMUaI7Gn
 7z82ycmdKjtd1bT2oVc4NoXq1KGDSAfu8OJQJYfnL8XPILGczcvRvIWquEbVPeGia4Q9
 C3KEtYa5sJefc4N/9IpvioFk5+kXv+aLALiGACKaLHicFmh9hAT3Bw42B7ZZSXC5+teH
 JHh3QAKre7BVQfv5iRmyrdAQh2EKeYf2l/13bzkiHHH46+HbhWSG7EOEigkhm3BoeA4g
 wpJh7il5glE0easUHYHsSRFZZZmq3QHFczYKlXNmnZ9UHND72cyoWZCXDnS1cNGUd1jy
 74tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MfsJNtnWeOn5arE0Ak3PdCulrzVrEA7hKn/buCmUqQk=;
 b=HO+uVHdH4cCgHWZswjnB+Em7gX4U+xhUwx4qEPp2lc2l6SshU5WVeBmfv/bjmRqWNR
 WrwfhX9Lt2dre/TliwmqYpNCF1SMB4zrhfxburmYdvyOoDvPWiLi5LVABEIjheaZc/rL
 KBvCOt2hX9y/T9srry2LbD6Ic5CWwTxsq2DIQeUhYIBQO++Q1gb/fzKMrIJOCcwJkui7
 rpxMDLBWpczuCkgO9OQ4s+HWlDABWqTCOwYxxYLEOqMeY7Ip6LmefzVoMGMHnZ6+FzOW
 tVerjgBYK7Behtr+KyjFCUJFpmV23e8+axQWit7nOmufPEGkX4zAp9S0kimhFbQSOIsc
 YZWQ==
X-Gm-Message-State: APjAAAUhKoM+W1jucJDfmf1CytF+R5L+xH3S95Fmzr6brIUp52PI1suU
 kirZxfOqYzTKtUPdZEnuZKK8rNQZpTs=
X-Google-Smtp-Source: APXvYqwa4sWSf+FmvPnTphskqVbZ5ovQUifZtG6djFlmZpqxjFElWsNYjZmeGjAi6KL0m8f6j6EX1Q==
X-Received: by 2002:a6b:5a06:: with SMTP id o6mr1008688iob.54.1582758348907;
 Wed, 26 Feb 2020 15:05:48 -0800 (PST)
Received: from mcoffin-dev-tower.ec2.internal
 ([2602:ae:10d1:b00:6d4:c4ff:fe4a:ea6b])
 by smtp.gmail.com with ESMTPSA id r14sm1191177ilg.59.2020.02.26.15.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 15:05:48 -0800 (PST)
From: Matt Coffin <mcoffin13@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/amdgpu/powerplay: Remove deprecated smc_read_arg
Date: Wed, 26 Feb 2020 16:05:24 -0700
Message-Id: <bff9812633c013f22418ec54a711bfe0fc05138f.1582756642.git.mcoffin13@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1582756642.git.mcoffin13@gmail.com>
References: <CADnq5_NTd_dZAtN4yVyeM+Fp2w0Toy=tkvz00OwiYyC908W1Xg@mail.gmail.com>
 <cover.1582756642.git.mcoffin13@gmail.com>
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
Cc: Matt Coffin <mcoffin13@gmail.com>, Nirmoy Das <nirmoy.das@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The new interface reads the argument in the call to send the message, so
this is no longer needed, and shouldn't be used for concurrency safety
reasons.

Signed-off-by: Matt Coffin <mcoffin13@gmail.com>
---
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c   | 1 -
 drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h | 1 -
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h  | 2 --
 drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h  | 2 --
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c     | 1 -
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c     | 1 -
 drivers/gpu/drm/amd/powerplay/smu_internal.h   | 2 --
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c      | 2 +-
 drivers/gpu/drm/amd/powerplay/smu_v12_0.c      | 2 +-
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c     | 1 -
 10 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
index be61451535c2..cc4427ebf169 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -2302,7 +2302,6 @@ static const struct pptable_funcs arcturus_ppt_funcs = {
 	.notify_memory_pool_location = smu_v11_0_notify_memory_pool_location,
 	.system_features_control = smu_v11_0_system_features_control,
 	.send_smc_msg_with_param = smu_v11_0_send_msg_with_param,
-	.read_smc_arg = smu_v11_0_read_arg,
 	.init_display_count = smu_v11_0_init_display_count,
 	.set_allowed_mask = smu_v11_0_set_allowed_mask,
 	.get_enabled_mask = smu_v11_0_get_enabled_mask,
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
index 52b892ae90ad..573929114617 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
@@ -515,7 +515,6 @@ struct pptable_funcs {
 	int (*system_features_control)(struct smu_context *smu, bool en);
 	int (*send_smc_msg_with_param)(struct smu_context *smu,
 				       enum smu_message_type msg, uint32_t param, uint32_t *read_arg);
-	int (*read_smc_arg)(struct smu_context *smu, uint32_t *arg);
 	int (*init_display_count)(struct smu_context *smu, uint32_t count);
 	int (*set_allowed_mask)(struct smu_context *smu);
 	int (*get_enabled_mask)(struct smu_context *smu, uint32_t *feature_mask, uint32_t num);
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
index 0b789386b5a6..3dc25a14ccc3 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
@@ -138,8 +138,6 @@ enum smu_v11_0_baco_seq {
 	BACO_SEQ_COUNT,
 };
 
-int smu_v11_0_read_arg(struct smu_context *smu, uint32_t *arg);
-
 int smu_v11_0_init_microcode(struct smu_context *smu);
 
 int smu_v11_0_load_microcode(struct smu_context *smu);
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h b/drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h
index bb17730d1707..7fbebc1979cf 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h
@@ -40,8 +40,6 @@ struct smu_12_0_cmn2aisc_mapping {
 int smu_v12_0_send_msg_without_waiting(struct smu_context *smu,
 					      uint16_t msg);
 
-int smu_v12_0_read_arg(struct smu_context *smu, uint32_t *arg);
-
 int smu_v12_0_wait_for_response(struct smu_context *smu);
 
 int
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index 9f7c7427f7e0..dc39066921e1 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -2334,7 +2334,6 @@ static const struct pptable_funcs navi10_ppt_funcs = {
 	.notify_memory_pool_location = smu_v11_0_notify_memory_pool_location,
 	.system_features_control = smu_v11_0_system_features_control,
 	.send_smc_msg_with_param = smu_v11_0_send_msg_with_param,
-	.read_smc_arg = smu_v11_0_read_arg,
 	.init_display_count = smu_v11_0_init_display_count,
 	.set_allowed_mask = smu_v11_0_set_allowed_mask,
 	.get_enabled_mask = smu_v11_0_get_enabled_mask,
diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
index 974d2bd60928..be2bd19b755e 100644
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
@@ -916,7 +916,6 @@ static const struct pptable_funcs renoir_ppt_funcs = {
 	.powergate_vcn = smu_v12_0_powergate_vcn,
 	.powergate_jpeg = smu_v12_0_powergate_jpeg,
 	.send_smc_msg_with_param = smu_v12_0_send_msg_with_param,
-	.read_smc_arg = smu_v12_0_read_arg,
 	.set_gfx_cgpg = smu_v12_0_set_gfx_cgpg,
 	.gfx_off_control = smu_v12_0_gfx_off_control,
 	.init_smc_tables = smu_v12_0_init_smc_tables,
diff --git a/drivers/gpu/drm/amd/powerplay/smu_internal.h b/drivers/gpu/drm/amd/powerplay/smu_internal.h
index 6b2ba0170d8a..6900877de845 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_internal.h
+++ b/drivers/gpu/drm/amd/powerplay/smu_internal.h
@@ -86,8 +86,6 @@ static inline int smu_send_smc_msg(struct smu_context *smu, enum smu_message_typ
 	return smu_send_smc_msg_with_param(smu, msg, 0, read_arg);
 }
 
-#define smu_read_smc_arg(smu, arg) \
-	((smu)->ppt_funcs->read_smc_arg? (smu)->ppt_funcs->read_smc_arg((smu), (arg)) : 0)
 #define smu_alloc_dpm_context(smu) \
 	((smu)->ppt_funcs->alloc_dpm_context ? (smu)->ppt_funcs->alloc_dpm_context((smu)) : 0)
 #define smu_init_display_count(smu, count) \
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
index 9865a71abf29..805735242273 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -64,7 +64,7 @@ static int smu_v11_0_send_msg_without_waiting(struct smu_context *smu,
 	return 0;
 }
 
-int smu_v11_0_read_arg(struct smu_context *smu, uint32_t *arg)
+static int smu_v11_0_read_arg(struct smu_context *smu, uint32_t *arg)
 {
 	struct amdgpu_device *adev = smu->adev;
 
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v12_0.c b/drivers/gpu/drm/amd/powerplay/smu_v12_0.c
index 2e4bb77a67be..c18b08c8cb9a 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v12_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v12_0.c
@@ -50,7 +50,7 @@ int smu_v12_0_send_msg_without_waiting(struct smu_context *smu,
 	return 0;
 }
 
-int smu_v12_0_read_arg(struct smu_context *smu, uint32_t *arg)
+static int smu_v12_0_read_arg(struct smu_context *smu, uint32_t *arg)
 {
 	struct amdgpu_device *adev = smu->adev;
 
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
index fb3f3ce6a113..d7fa8c02c166 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -3243,7 +3243,6 @@ static const struct pptable_funcs vega20_ppt_funcs = {
 	.notify_memory_pool_location = smu_v11_0_notify_memory_pool_location,
 	.system_features_control = smu_v11_0_system_features_control,
 	.send_smc_msg_with_param = smu_v11_0_send_msg_with_param,
-	.read_smc_arg = smu_v11_0_read_arg,
 	.init_display_count = smu_v11_0_init_display_count,
 	.set_allowed_mask = smu_v11_0_set_allowed_mask,
 	.get_enabled_mask = smu_v11_0_get_enabled_mask,
-- 
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
