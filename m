Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 912EA118C18
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Dec 2019 16:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE06A89CA8;
	Tue, 10 Dec 2019 15:10:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5B06E8DF
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Dec 2019 12:53:04 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p9so3076559wmc.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Dec 2019 04:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bY1WC1Ap+RU1tAgITP3/KP7SqhN1U6Otqj4eWIMWLi4=;
 b=tjOZf+HZbTFkKR3ASlYu3ZpVOPaIPu1A7p26pFdI4aKEPQM7zS3CD7dqNs/OR0wkjq
 YqC7EtqONRa0L5V+QbiIdcDKvty1zhvxtbOp2UbTy4IeFQ6wfjKlaKn6TXqi34aj9H4D
 oZPKbzt/C4z7m1vX4BJIyrhsz3YNKDxmci8Yq0WDzLhMKMkzjgopb/uVTCKHMRdcbjy+
 0sORDfPee2+c7EDrqPuxNKRJQGsLUSRnocUqOa0AfXMRZo7z6zOGg72+mqYrcbRn9W6u
 Y3f+JXlU4sPD59A43AcrTG7yP0ye8vjEKZ6Qx1s1pNX77epGt7ve4gd6Yav9AebpK2kJ
 pu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bY1WC1Ap+RU1tAgITP3/KP7SqhN1U6Otqj4eWIMWLi4=;
 b=tdn1fwek/ChQ1YQz1K4YcmPycgcPUl1OmeXKJ2zjNGqfnAx4KF2MiXaI+WFCIgPFHG
 5+j2GV8ubRYK3+B+K/VOju/QYc8WKdUxBxVer49E/sWy4W8EsvIVjGZcQ0uAAAC08FQV
 PKDEsnMpaG7wrvlFVEoAxZYsqbmTv5MtQHR2iIomSaMbmCI4NXzS1hTPSfUv8g8mbk+p
 hWqC+N5BVcdne2zXx9r+IwimF7DowrpYRf5I3otxjNdsTwTUQ5pv3tNghFzNjrTh96PA
 /po/Jy0MX9lqmV0MTq9oe/1+qmIOsKb7UeZuiI7uU+jFt8VlEOvyZR6v8+P5Hybnw497
 dCIw==
X-Gm-Message-State: APjAAAVPw6zWuRVCOcMQP2osdH/B5agkNUme5x0kBalgrOodv+TRdYx2
 STHNV7JwqxUlLhTnp/VjHwwJnx9qF/0=
X-Google-Smtp-Source: APXvYqy1mmQPmpshfT2b92pRVrz81tL6o/JMSKAXcjOjtBy5ROb055mjLh83+SgLfhHaBsg19u90wQ==
X-Received: by 2002:a7b:c5d9:: with SMTP id n25mr5300324wmk.8.1575982383005;
 Tue, 10 Dec 2019 04:53:03 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2CCF00F7EF6DD58F2D73FD.dip0.t-ipconnect.de.
 [2003:c5:8f2c:cf00:f7ef:6dd5:8f2d:73fd])
 by smtp.gmail.com with ESMTPSA id a16sm3178589wrt.37.2019.12.10.04.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 04:53:02 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: alexander.deucher@amd.com,
	kenny.ho@amd.com,
	christian.koenig@amd.com
Subject: [PATCH 4/4] drm/scheduler: do not keep a copy of sched list
Date: Tue, 10 Dec 2019 13:53:00 +0100
Message-Id: <20191210125300.3800-4-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210125300.3800-1-nirmoy.das@amd.com>
References: <20191210125300.3800-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Dec 2019 15:10:18 +0000
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
Cc: nirmoy.das@amd.com, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

entity should not keep copy and maintain sched list for
itself.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index f9b6ce29c58f..a5f729f421f8 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -67,17 +67,10 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->guilty = guilty;
 	entity->num_sched_list = num_sched_list;
 	entity->priority = priority;
-	entity->sched_list =  kcalloc(num_sched_list,
-				      sizeof(struct drm_gpu_scheduler *), GFP_KERNEL);
+	entity->sched_list =  sched_list;
 
-	if(!entity->sched_list)
-		return -ENOMEM;
 
 	init_completion(&entity->entity_idle);
-
-	for (i = 0; i < num_sched_list; i++)
-		entity->sched_list[i] = sched_list[i];
-
 	if (num_sched_list)
 		entity->rq = &entity->sched_list[0]->sched_rq[entity->priority];
 
@@ -312,7 +305,6 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
 
 	dma_fence_put(entity->last_scheduled);
 	entity->last_scheduled = NULL;
-	kfree(entity->sched_list);
 }
 EXPORT_SYMBOL(drm_sched_entity_fini);
 
-- 
2.24.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
