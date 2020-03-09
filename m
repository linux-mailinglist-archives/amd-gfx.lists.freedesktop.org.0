Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEAD17E0AD
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Mar 2020 13:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2CA8938C;
	Mon,  9 Mar 2020 12:56:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E35D88C11
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Mar 2020 12:56:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 6so10979202wre.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 09 Mar 2020 05:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p/xGbDNg7GciAGI08f7BxH3kLvO5GdLpdNbnLb2tVnk=;
 b=KFoq04MQ/DPidWAjfirFwUMHZI+cUvlxRvq4NNZCh6Yd8lXv+fJmfbXkllppcVWhP6
 RWKa2mOt0S+tydVwtGVR/37trn9FNHRs6UZ4ZTHtwf0x9dSH63YMV/iEoXH3QdjSdDQA
 3VCZYVaXv/u9rWiuRzwvdWFz7RBA1BILlugg8pw10Pj4Jyog9u0VItPPuz2KqmA/85iN
 fyoRUQ1Je8pXoIGSQUk3bvhKa7O+cDCOiKH7pHP21reOQY3TwTEuzds1E6fEEDq0suwM
 dovTD0Bt6s9yeQ/3fkPYCnknoCtSDivVvmbI93vjs+SxewRQmYRH7+5/WS3z/sb5WhsL
 lYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p/xGbDNg7GciAGI08f7BxH3kLvO5GdLpdNbnLb2tVnk=;
 b=pKzGE9SpY5azxowwKB0gKNq7eJ9DorNr/Hnt5K9uJs3+3JR/PVl10207kD9ehFRdo5
 6sJAD8QEJM7B645wQKpQqI1HgCFteSknMMSdWVtYDB4DUNnIMssw0iiRc0NEHgPJ6XRq
 xkMTc4mBg1o8qhGox9jKWsSLAXtz8Zk1p2cikC3M/S5HZ53i/A1QbJnvqYRMdzowKKig
 ipUkTBRqghy8ZA4pSyJUXmguvhMB4w5HkMZjVmmFpSWBoGuHC7oeDijpsOWlkgSa7eW4
 EhO0FpGbGWOhmfVQNQz8/7HrYRI/1DIqIszviGpJZMBb4thNDEw1VjEu7036cQrHAgvr
 CAbg==
X-Gm-Message-State: ANhLgQ0xxxA2GBb2y1/CJutWeNF7wpdKTdoPM+nXCsxJ2nXDxYNM+5tO
 33S/cysjDjMquiqupEEL6IGO/vep5Ig=
X-Google-Smtp-Source: ADFU+vt96i/+IKryXWhjh5Kq16cHSVHqxhGBs/qKAw3SZyEafQYbVb9Nqv2pYkQbX0GxXU7YGygFLQ==
X-Received: by 2002:adf:ecca:: with SMTP id s10mr21888494wro.255.1583758558429; 
 Mon, 09 Mar 2020 05:55:58 -0700 (PDT)
Received: from brihaspati.fritz.box
 (p200300C58F2ACB00753B9E7FA9FFF13D.dip0.t-ipconnect.de.
 [2003:c5:8f2a:cb00:753b:9e7f:a9ff:f13d])
 by smtp.gmail.com with ESMTPSA id z19sm2950426wma.41.2020.03.09.05.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 05:55:57 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v5 3/4] drm/amdgpu: change hw sched list on ctx priority
 override
Date: Mon,  9 Mar 2020 13:59:19 +0100
Message-Id: <20200309125920.7437-3-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200309125920.7437-1-nirmoy.das@amd.com>
References: <20200309125920.7437-1-nirmoy.das@amd.com>
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
Cc: alexander.deucher@amd.com, Ray.Huang@amd.com, nirmoy.das@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Switch to appropriate sched list for an entity on priority override.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 29 +++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 1d05eb64b885..3b2370ad1e47 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -515,6 +515,29 @@ struct dma_fence *amdgpu_ctx_get_fence(struct amdgpu_ctx *ctx,
 	return fence;
 }

+static void amdgpu_ctx_set_entity_priority(struct amdgpu_ctx *ctx,
+					    struct amdgpu_ctx_entity *aentity,
+					    int hw_ip,
+					    enum drm_sched_priority priority)
+{
+	struct amdgpu_device *adev = ctx->adev;
+	enum gfx_pipe_priority hw_prio;
+	struct drm_gpu_scheduler **scheds = NULL;
+	unsigned num_scheds;
+
+	/* set sw priority */
+	drm_sched_entity_set_priority(&aentity->entity, priority);
+
+	/* set hw priority */
+	if (hw_ip == AMDGPU_HW_IP_COMPUTE) {
+		hw_prio = amdgpu_ctx_sched_prio_to_compute_prio(priority);
+		scheds = adev->gfx.compute_prio_sched[hw_prio];
+		num_scheds = adev->gfx.num_compute_sched[hw_prio];
+		drm_sched_entity_modify_sched(&aentity->entity, scheds,
+					      num_scheds);
+	}
+}
+
 void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx,
 				  enum drm_sched_priority priority)
 {
@@ -527,13 +550,11 @@ void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx,
 			ctx->init_priority : ctx->override_priority;
 	for (i = 0; i < AMDGPU_HW_IP_NUM; ++i) {
 		for (j = 0; j < amdgpu_ctx_num_entities[i]; ++j) {
-			struct drm_sched_entity *entity;
-
 			if (!ctx->entities[i][j])
 				continue;

-			entity = &ctx->entities[i][j]->entity;
-			drm_sched_entity_set_priority(entity, ctx_prio);
+			amdgpu_ctx_set_entity_priority(ctx, ctx->entities[i][j],
+						       i, ctx_prio);
 		}
 	}
 }
--
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
