Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6EB5AD297
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Sep 2022 14:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BC610E365;
	Mon,  5 Sep 2022 12:32:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CFE10E365
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Sep 2022 12:32:36 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id nc14so16805347ejc.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 05 Sep 2022 05:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=kBJ8MKPMTc/ljm1Je/dqVW7iOpGuBGK18C7LP1VWBRU=;
 b=SCCqjllNF84WnEvFepSLKsg1f527LFfzvIVpOxAZVs0cKKtI3rMnaBgYpf37UuxHPH
 jyMygbfjKQquiVC2ESRn88V+q28/uPzKfo9OE+XcTbUhXaOnYOkmZ3906qBB8tBngJe0
 TbdMPkEyTR0MKVYvmmwJ1tp24BywZuNrZBKjim+6RcC3lWHi9TAULzVdl5DKiolhaLgX
 WQgErA6yCD2k4+yYUqJVnN1Ps2tBo9XS0MfsMjdjPG9hbnTGL4cvX1z/3mN9293pu1vc
 ZMTGsv4K2zLo+5B35FFpbNnFk540eiexIQtoZ7QRKnMOhYA8gubsX7AZ/AM4YeXNwDJH
 lTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=kBJ8MKPMTc/ljm1Je/dqVW7iOpGuBGK18C7LP1VWBRU=;
 b=juUGJIZx+H5YiWBt6boKtfAJ+rJGiLY5FpAXSAWQCjIhU0bF8LOO9e7WBNLXEXbMo7
 1Hn+b1Put205gd5jaLR7hirhvU47LDB3Mecu5IkRlmIw2EJ/wkIXLmG5WeTgNwgIdhga
 SpYW3toebVWbswsXotoaabyzacw7ZiZCU1AurlLZjIytuEW5NBNqAuZ+zhDIPqzFGFrU
 7khOe4wb8aibNPiOeOt46QBq+KA/ghClbfJyDzJQrmAQi/ThChdXFuVXtPiIAYhT6WCV
 TGyOcNLSnoKGYNnNal36sgyBsseOkaDIbjcbdCIzEAWJ1HUi4e7YmDZD4CNlvBppEoTO
 mLkA==
X-Gm-Message-State: ACgBeo0Uo75S3l72bdVnNNYwBdV6tcjRHrlXb0GPjHV0WFvYL3npcl0X
 cmoEdZoxcnkcD6yuANBixJgUKjQOn+I=
X-Google-Smtp-Source: AA6agR4ZLuch2T8gp+IH9r1N43NiG0wGQtoG4w9Hng/iqoOpRuHeaObauwoKWzYLzPO9kWNP9Q4pnw==
X-Received: by 2002:a17:907:86aa:b0:741:a0d5:43bc with SMTP id
 qa42-20020a17090786aa00b00741a0d543bcmr24739854ejc.100.1662381154633; 
 Mon, 05 Sep 2022 05:32:34 -0700 (PDT)
Received: from able.fritz.box (p4fc20f4e.dip0.t-ipconnect.de. [79.194.15.78])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a17090632c600b0073c0b87ba34sm4970341ejk.198.2022.09.05.05.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 05:32:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	Ruijing.Dong@amd.com
Subject: [PATCH 01/12] drm/sched: move calling drm_sched_entity_select_rq
Date: Mon,  5 Sep 2022 14:32:21 +0200
Message-Id: <20220905123232.2809-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

We already discussed that the call to drm_sched_entity_select_rq() needs
to move to drm_sched_job_arm() to be able to set a new scheduler list
between _init() and _arm(). This was just not applied for some reason.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 68317d3a7a27..e0ab14e0fb6b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -592,7 +592,6 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner)
 {
-	drm_sched_entity_select_rq(entity);
 	if (!entity->rq)
 		return -ENOENT;
 
@@ -628,7 +627,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 	struct drm_sched_entity *entity = job->entity;
 
 	BUG_ON(!entity);
-
+	drm_sched_entity_select_rq(entity);
 	sched = entity->rq->sched;
 
 	job->sched = sched;
-- 
2.25.1

