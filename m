Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1426173B77
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Feb 2020 16:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732FF6E065;
	Fri, 28 Feb 2020 15:34:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68576E065
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Feb 2020 15:34:01 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id n64so2322499wme.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Feb 2020 07:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZfQJ+fPFSsAmvzPNZkjxgzYCnpFAB3BOLQW37E2Imj4=;
 b=DZVMR24HB8J0JLnTfXJkbOB1u0sD/J2rEQZGhHMhUJX4Lal/RXV7OImYgrQaN2HHK7
 aVP2H7rrxc2yPyNcDaGVr0YEg2/1o8gvr/VzqSFNxQzWBF0iTxRiYv3K6wysrH7CVXl2
 gPGveNpsUwGKzU/4VK6kQcbIUizjJajshX8AR+jBdPWb48+JkZ2Qa/WT5QwmSBX5tPYz
 R9aqiuXU9kdmxFhv3UCvcTrU/cv2vUHIOzgsvlZKwetlooPbaFcGLHqhlO8ehkYU0JZa
 3cFBAJsPMy6B1m6Sa12kb+m0Wf8JpnjFiiuqCFWQbGLetawgbcemyVBG1u9ZsLb4cZnF
 mmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZfQJ+fPFSsAmvzPNZkjxgzYCnpFAB3BOLQW37E2Imj4=;
 b=jEm4NE9DXXVzF+E1mbAvGoOk9nBcj8sTX4/9FGafGftaGLopIKVo7HcVHW2C46oyd7
 XtA8NKeiyVsOuiuVOwS7AhtrwwLQEt/Ahga+TyOB40Zb/tZrrsj7EZ1+ewNJlFBuBTj1
 TcoFKQgizPxj2AvhUJqQ3VcKrJDtpLB3N8+taJSdvzaHEgFKqhkzh/CSt5zRY3zLx8rt
 nwOqt/52A6lFKwg7j8aZjTh2tIwtR6ERBu5/8AkFpmRPU8Ujw6Pq8uYWS9y9tk+E0XU7
 R6h3WQ14JKNST6P65oB+6ZUL9SP0UlBtixwBJ8fZ0jEzWB2ICCk/IS7g5dR/+XdbyGEW
 9q3w==
X-Gm-Message-State: APjAAAXMAcKSi90O7hcVN7qM3yIgNQoCzgz1ZOnVgs+67V8b3Fb30R6p
 JjFcqeW4W25B78Drc/p9S1nA038LW5MIzg==
X-Google-Smtp-Source: APXvYqx1k6/G4z36RLaxHXH3YNbx0NvoOYMYTzpe2Xerg6otZMf7HEJQ4dkyg+RW8Xcbu7KThhkWlg==
X-Received: by 2002:a1c:9e13:: with SMTP id h19mr5518730wme.21.1582904040139; 
 Fri, 28 Feb 2020 07:34:00 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F28EF00805E149DBFE09C45.dip0.t-ipconnect.de.
 [2003:c5:8f28:ef00:805e:149d:bfe0:9c45])
 by smtp.gmail.com with ESMTPSA id y10sm2517439wma.26.2020.02.28.07.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 07:33:59 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/amdgpu: change hw sched list on ctx priority
 override
Date: Fri, 28 Feb 2020 16:36:55 +0100
Message-Id: <20200228153656.16628-3-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200228153656.16628-1-nirmoy.das@amd.com>
References: <20200228153656.16628-1-nirmoy.das@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 30 +++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 4616741e1295..bc7de30b49f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -522,6 +522,30 @@ struct dma_fence *amdgpu_ctx_get_fence(struct amdgpu_ctx *ctx,
 	return fence;
 }

+static void amdgpu_ctx_set_entity_priority(struct amdgpu_ctx *ctx,
+				   struct amdgpu_ctx_entity *aentity,
+				   int hw_ip, enum drm_sched_priority priority)
+{
+	struct amdgpu_device *adev = ctx->adev;
+	enum gfx_pipe_priority compute_priority;
+	struct drm_gpu_scheduler **scheds = NULL;
+	unsigned num_scheds = 0;
+
+	switch (hw_ip) {
+	case AMDGPU_HW_IP_COMPUTE:
+		compute_priority =
+                                amdgpu_ctx_sched_prio_to_compute_prio(priority);
+		scheds = adev->gfx.compute_prio_sched[compute_priority];
+		num_scheds = adev->gfx.num_compute_sched[compute_priority];
+		break;
+	default:
+		return;
+	}
+
+	drm_sched_entity_modify_sched(&aentity->entity, scheds, num_scheds);
+	drm_sched_entity_set_priority(&aentity->entity, priority);
+}
+
 void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx,
 				  enum drm_sched_priority priority)
 {
@@ -534,13 +558,11 @@ void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx,
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
