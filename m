Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900411757A4
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Mar 2020 10:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E9D6E228;
	Mon,  2 Mar 2020 09:49:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120C56E207
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Mar 2020 09:49:23 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e10so10223980wrr.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 02 Mar 2020 01:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l6TVBawHJgOYJ4qWLYR5BxnF65qUEdirsfdOJKMig60=;
 b=Hm6Lu4/lo0aTHPZN4m4MOq0SfMCybQh9PjvyZk3mlMe3bIXNeOdwKmpEYZ/M/Kilpk
 EM52mCVoCxDCsi0W6ZtMzVtSkYDpclLwi48gPKFEsmUjKnJotqsZn6qX1gkSA9s71OlW
 iObYmmM3kbA7MRekLEa7D0t39yCFgL1J+f5KgUUH0YT3Y6gYBMI0vBRiseHPABLAZBjG
 TE/AW5rTyF3hW9kjrGvG0MJCPggfTEVTaV/BulZ5f0fjtHs2mGqA5XI1CFnIxO/mzDGe
 gvUSHc3AuZL6sxFD+QrtZ7n3NFqSx9HGysGlz98VLLebfKSMJRF3tuA9krhCC8Gx3C/i
 XjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l6TVBawHJgOYJ4qWLYR5BxnF65qUEdirsfdOJKMig60=;
 b=UQDpmTNRPpL7QVgioRtA4AiyiblUXDx55Ht/QnmHSTs/JQin/uhUroB9AfnzuYG3eP
 vWQe2in08F2lvI/8ZV1/AEDpvmNXwvrwco7euVPPUcvZLD3iQucaskoUT5/ST0xeou2a
 cckN4Q3UYPX4+OFours7eijscs8MRGj9Wg2YrfhcaYz+JRjYUD99XL1+K/DkyaH7RiG+
 5Ge0w4OJiDdddHwwDFy8LM+hEWIDIOF33wVFEvqPX5AgVgYpSdGx0k/j1i8iGu0PSIbC
 ShlNj+wuc0NReI+7z02hSni81OZaUXQzv5TFRu6GMeaBFfzJlH23W8msb957LIiDXrqM
 TO/Q==
X-Gm-Message-State: APjAAAVgZDWOxzZJvx0rnifGd+TtpEGOI1Pgv8hxr3TN3IiCP7E109px
 ucItOYt7bCYFzaHJBwiIEC4HuTxxQ8I=
X-Google-Smtp-Source: APXvYqw6Sbn9pWrjCwnF6eE7SzthDxFPzzliCDH/oBCFFp1hVzLp6W1KPlz4s33R9uQynJ97dDU04g==
X-Received: by 2002:adf:fd92:: with SMTP id d18mr17836771wrr.16.1583142561375; 
 Mon, 02 Mar 2020 01:49:21 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F21FC009E54A4A7C1B66128.dip0.t-ipconnect.de.
 [2003:c5:8f21:fc00:9e54:a4a7:c1b6:6128])
 by smtp.gmail.com with ESMTPSA id b13sm511230wme.2.2020.03.02.01.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 01:49:20 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/scheduler: implement a function to modify sched
 list
Date: Mon,  2 Mar 2020 10:52:32 +0100
Message-Id: <20200302095234.3638-2-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200302095234.3638-1-nirmoy.das@amd.com>
References: <20200302095234.3638-1-nirmoy.das@amd.com>
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

implement drm_sched_entity_modify_sched() which can modify existing
sched_list with a different one. This is going to be helpful when
userspace changes priority of a ctx/entity then driver can switch to
corresponding hw shced list for that priority

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 19 +++++++++++++++++++
 include/drm/gpu_scheduler.h              |  4 ++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 63bccd201b97..b94312154e56 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -83,6 +83,25 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 }
 EXPORT_SYMBOL(drm_sched_entity_init);

+/**
+ * drm_sched_entity_modify_sched - Modify sched of an entity
+ *
+ * @entity: scheduler entity to init
+ * @sched_list: the list of new drm scheds which will replace
+ *		existing entity->sched_list
+ * @num_sched_list: number of drm sched in sched_list
+ */
+void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
+				  struct drm_gpu_scheduler **sched_list,
+				  unsigned int num_sched_list)
+{
+	WARN_ON(!num_sched_list || !sched_list);
+
+	entity->sched_list = sched_list;
+	entity->num_sched_list = num_sched_list;
+}
+EXPORT_SYMBOL(drm_sched_entity_modify_sched);
+
 /**
  * drm_sched_entity_is_idle - Check if entity is idle
  *
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 589be851f8a1..f70a84aaaf7a 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -297,6 +297,10 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner);
+void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
+				  struct drm_gpu_scheduler **sched_list,
+                                  unsigned int num_sched_list);
+
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
--
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
