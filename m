Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E81A175AF4
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Mar 2020 13:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899DC6E27A;
	Mon,  2 Mar 2020 12:55:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D70D6E279
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Mar 2020 12:55:25 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z11so3689738wro.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 02 Mar 2020 04:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4nmJJCE99t6es50j+fmSEPecEnsldOOshCaiigefW3w=;
 b=LsKs6kFo13xiBwEFafS1cYlp18F3a5wz/ndyvQ6SRbi6Xnf1aeo5r2zcJAVRdkP5vh
 d8KJAM21fVTSRbNiSl4YwVOpbcpbIs4Vpp0baPB64IaYrrjvEIyv4M3MCA3M4gK7/tlD
 9RNub4iODs3zcq6k9mcazCcYl1wj4F3mtupHKTrYxzZejSCbJD24lYn/6db7gUktGwUa
 9jxmPTzBVgXawHMk51c9+umFP63LhA/rTPJqNKubywWhikSpT+1p6KnRDLmglIWDnHGo
 +rIi/1zV6YBN8j+PBjhpv+mN8NOO117W5IOerOAqdhVw45lu32qgT17HqXAzm0qQZTtX
 ylnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4nmJJCE99t6es50j+fmSEPecEnsldOOshCaiigefW3w=;
 b=coRgHaBjxF72Ue6YhByRqAIpJjzLoN0AfB2jPduylxqEsCWe74L5BKAdUL4D3RapOM
 xuLwtIiU5xF+26sZ8jjnRWhzGVszN7th26yoJWekSROcJgd7oycKsnojI4ZcKcr8pOBh
 WPCXwST8upVGEsR+Dq5S/YrmP6IGZbvh1yCcEDGDgG6oqqXygyc3E0kzHQSs7zdlISiy
 GNteDyn6yhs1X4bFCTJdM5i6AGwJscw6ZSU/sYR9kmibKDAr0FZNsfr0fKG2yDHhWMZH
 jVy91oILt+K1H0bYYnLBq/V+uOkZoMVw+wjBkHALPhjEOxHkf+KyhcuoIH5lv9CKxyNS
 +FyA==
X-Gm-Message-State: APjAAAXalksaLwyFtmGcJdSq1uB3SJREDJ3D7Jz+iq8LmyC2FVgMcr4t
 Lw5ssh3oRkrwMBq6vxN1jCRoUkNG7Dk=
X-Google-Smtp-Source: APXvYqwt/VnArMovzRaD0kDfXyUf7kZ8Pe6/q9dTN52/OcAJyqEwAtCEY+iuaMGR3em8r/B3WTT53w==
X-Received: by 2002:adf:cd03:: with SMTP id w3mr22717225wrm.191.1583153723565; 
 Mon, 02 Mar 2020 04:55:23 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F21FC009E54A4A7C1B66128.dip0.t-ipconnect.de.
 [2003:c5:8f21:fc00:9e54:a4a7:c1b6:6128])
 by smtp.gmail.com with ESMTPSA id f17sm7492733wrm.3.2020.03.02.04.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 04:55:22 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v4 3/4] drm/amdgpu: change hw sched list on ctx priority
 override
Date: Mon,  2 Mar 2020 13:58:35 +0100
Message-Id: <20200302125836.56915-3-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200302125836.56915-1-nirmoy.das@amd.com>
References: <20200302125836.56915-1-nirmoy.das@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 32 +++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 8c52152e3a6e..a0bf14ab9d33 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -522,6 +522,32 @@ struct dma_fence *amdgpu_ctx_get_fence(struct amdgpu_ctx *ctx,
 	return fence;
 }

+static void amdgpu_ctx_set_entity_priority(struct amdgpu_ctx *ctx,
+				   struct amdgpu_ctx_entity *aentity,
+				   int hw_ip, enum drm_sched_priority priority)
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
+	switch (hw_ip) {
+	case AMDGPU_HW_IP_COMPUTE:
+		hw_prio = amdgpu_ctx_sched_prio_to_compute_prio(priority);
+		scheds = adev->gfx.compute_prio_sched[hw_prio];
+		num_scheds = adev->gfx.num_compute_sched[hw_prio];
+		break;
+	default:
+		return;
+	}
+
+	drm_sched_entity_modify_sched(&aentity->entity, scheds, num_scheds);
+}
+
 void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx,
 				  enum drm_sched_priority priority)
 {
@@ -534,13 +560,11 @@ void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx,
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
