Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A076173B76
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Feb 2020 16:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412316E062;
	Fri, 28 Feb 2020 15:33:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B541E6E062
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Feb 2020 15:33:56 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v4so3395815wrs.8
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Feb 2020 07:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l6TVBawHJgOYJ4qWLYR5BxnF65qUEdirsfdOJKMig60=;
 b=dZIYHKq0/abQfYHGBhicuk5uomCoSOOnQAR/0NX7oyjZ/hRbA6ZPnc3byqoZlRc6hS
 Nky7wvLBJ18Tz0xeLryJ9DM+ad5iXFksZGUiVkYZNo6rWrlICg6eYWaKxnbclmoJ100Q
 Qztxi7xT9YtImY5Y340x2mKalwnA1PB5LdzfssDcoPcZrP0JKLFTsfWq/OUM9RLNd54w
 uqu2m8ir+gOyLU1rJhtIYbBG/uEBEvlcEK6JUJnt+hFXHXxXAemyBU+NVnhKh23bc73K
 by6/ndHxdv4TFzURauE+ZwNXneeVUzYZ69HZf+cDzUCWgIBhJ7q0Nmnf23hlnzRgPqnq
 3/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l6TVBawHJgOYJ4qWLYR5BxnF65qUEdirsfdOJKMig60=;
 b=VrpvUqq7QCk1S3U4V5ASMjn4zOjgtprmCrSQn1Rioafc0FxFBVsxPigMuMd8lQEZod
 O96a08bJZ6EpMVO2n1nuMOpG8qXmmH0TWDTGQELG1agJmZsrghMkMGX6cl6TNe3elku9
 6GeIojUrta80SAtrLIJgWF4u7QfDZAGfdWHpjig/V7DYTXGMnxGIobmw59j4DxHs0oqb
 WdsGbY+4C/pYz7EPBnJDCdMzI4OiGrdZHQMhFn0gvSE2Ad8T7iwL7QdUqLb6VwK2Vk7c
 U+WLL0BU9Z0SMS41qBdrcjzQvetPolKJXhpgG/4RQilQZpVMg1gR+O5sjqcGWd1FW1SF
 fhOQ==
X-Gm-Message-State: APjAAAV9N4IHd6hujbn5Rr1JdhJ3o2aiyIKI5bPBsmYURqE0HvkpMFF5
 Naej7ZbaznWq5cRjF92j3PEKhM3n273dhg==
X-Google-Smtp-Source: APXvYqyfVtp+2gdqijspubbP50GQ0TcqP99TYlu30e0kIHyv8kRo/IBqHPXvl2RK0+W0Tx/d/IJRnw==
X-Received: by 2002:adf:ec52:: with SMTP id w18mr2564057wrn.26.1582904035116; 
 Fri, 28 Feb 2020 07:33:55 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F28EF00805E149DBFE09C45.dip0.t-ipconnect.de.
 [2003:c5:8f28:ef00:805e:149d:bfe0:9c45])
 by smtp.gmail.com with ESMTPSA id y10sm2517439wma.26.2020.02.28.07.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 07:33:54 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/scheduler: implement a function to modify sched
 list
Date: Fri, 28 Feb 2020 16:36:54 +0100
Message-Id: <20200228153656.16628-2-nirmoy.das@amd.com>
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
