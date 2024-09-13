Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C39978565
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Sep 2024 18:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAC510E0FE;
	Fri, 13 Sep 2024 16:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PidF2KrO";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEE910E0EA;
 Fri, 13 Sep 2024 16:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iYsSJ1HHAE3Fj4Am0ez1vcEwOxbX77dAWdsv/zbiW6Y=; b=PidF2KrOVJYSY8E2E8Qp5u6Dzo
 wGSxb5qDQ9H4Pi0729iEDwIg3RNoQlFKjcXukhT+aXxd7RxuhYeRFNWmaidiHUbIXsgNDc7LRffLk
 +/8D2vJxiTlHUR4WowSSnU41kMWW9aROqSHEmm1E9t9T83CvJESFLfNgZg0Q2R4TXb2Q1dwpDubf2
 ZaCJCdACtAyeGX2fOQNd6ZVE1dDWUmUZ+aGWD2YzKBUXwfDBWDBWMdWWTRVvlE0hOJh4tF1PVciQZ
 h4/0JMGTKnEWcRhCOFbIm6afUSXUXS6g1NNsUEIniQr+zgW1TCHy7NQ+/K6xZmD69HlZ2bEtINY85
 oeVLoZhQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sp8o9-00DOek-5S; Fri, 13 Sep 2024 18:06:05 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 5/8] drm/sched: Stop setting current entity in FIFO mode
Date: Fri, 13 Sep 2024 17:05:56 +0100
Message-ID: <20240913160559.49054-6-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913160559.49054-1-tursulin@igalia.com>
References: <20240913160559.49054-1-tursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

It does not seem there is a need to set the current entity in FIFO mode
since ot only serves as being a "cursor" in round-robin mode. Even if
scheduling mode is changed at runtime the change in behaviour is simply
to restart from the first entity, instead of continuing in RR mode from
where FIFO left it, and that sounds completely fine.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index d0ee0ba75a86..74eaa3b23821 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -349,7 +349,6 @@ drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
 				return ERR_PTR(-ENOSPC);
 			}
 
-			rq->current_entity = entity;
 			reinit_completion(&entity->entity_idle);
 			break;
 		}
-- 
2.46.0

