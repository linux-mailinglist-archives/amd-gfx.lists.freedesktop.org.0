Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFC61FF2C8
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2020 15:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4046E42B;
	Thu, 18 Jun 2020 13:16:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21DE6E42C
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jun 2020 13:16:14 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id w90so4318949qtd.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jun 2020 06:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pbSqhp9aaUk6CbzxNvFqbB806E1jiEuziztabJVdkbg=;
 b=dYSrM7/BJ7UZQyQoNbvmzAowVikD2NXFVdWuQn3iLm+ppD3yb1rhafGdYtenjU6SdJ
 mfqPAMo1ya4yuJ2iqacV04VHUXF9vIP/UkUFOEe6GpGoUmmwooLR3u/S1F9kAo5uGPY3
 D+eu7hVvPlZiyL+y/B0l+ms0/KOWwWMiekUoSDO1ey2/9SIh/inCv2uOGuAKhk7+2Jml
 wwiOzUgAi72mFnnzVQPS6V5/Z76JhnsqSaoF/kbhEvDLeTP4SnI/s90/DwxyXWm8kB8s
 A48KjydbHd55gf9pcAgph7aJssO/0Xc/mAoRMvgjMHkIKrt9BldcAJpn8QGGRjU8dePm
 urTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pbSqhp9aaUk6CbzxNvFqbB806E1jiEuziztabJVdkbg=;
 b=iMANbHugf/7HmFXCK2Dz4Xak7f+sg+62DoJi7dlns+wqwbwgOGt+f9wx7xt3DJEWm0
 h05DnOOCLRx6r+eHg+MF1bobb+zvgsT9QhkpE2+gZTFQKw0AEoF5deJtZV0M7z/VYntB
 wcashUhndwTJiJ0OkpBQFNsuRktzfOBpcyVSAlvoVCW09F59R6D6NTrvzxUERDxtBkp6
 pmTzZBkKjUpXf0sPeBZQEvt+uJW9uNVY2xuCJ/V2XfCNsvadLmK4OTK8VzO411P3SJbV
 tK0y7V0Y32jhCYM8O2zECVVlz1mm5i6K0LNJsF14xbwLzwVJ6cmorJeqatUPAlR7nuu3
 aumQ==
X-Gm-Message-State: AOAM53202u6Uz6XlVVoYOFySDXns+yJG5XP8LRMO0Ec71cN54LRRSOum
 TRAff7qj0w+CIsSc1MaUHJBd9HrRhoM=
X-Google-Smtp-Source: ABdhPJwsJ+8zR1pNv91/pbdKhglufjJ8Ng4Usf+ZntUTQ/octyUU7HrXkdBlrlIbOHEX7CUS+tQSMA==
X-Received: by 2002:ac8:734c:: with SMTP id q12mr4369825qtp.178.1592486173792; 
 Thu, 18 Jun 2020 06:16:13 -0700 (PDT)
Received: from brihaspati.amd.com
 (p200300c58f2304001ed633024609edb3.dip0.t-ipconnect.de.
 [2003:c5:8f23:400:1ed6:3302:4609:edb3])
 by smtp.gmail.com with ESMTPSA id v189sm3021933qkb.64.2020.06.18.06.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 06:16:13 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/amdkfd: label internally used symbols as static
Date: Thu, 18 Jun 2020 15:17:10 +0200
Message-Id: <20200618131712.90389-2-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200618131712.90389-1-nirmoy.das@amd.com>
References: <20200618131712.90389-1-nirmoy.das@amd.com>
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
Cc: nirmoy.das@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Used sparse(make C=1) to find these loose ends.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 6 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index fcc927c2f887..c051c145489f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -137,7 +137,7 @@ void program_sh_mem_settings(struct device_queue_manager *dqm,
 						qpd->sh_mem_bases);
 }
 
-void increment_queue_count(struct device_queue_manager *dqm,
+static void increment_queue_count(struct device_queue_manager *dqm,
 			enum kfd_queue_type type)
 {
 	dqm->active_queue_count++;
@@ -145,7 +145,7 @@ void increment_queue_count(struct device_queue_manager *dqm,
 		dqm->active_cp_queue_count++;
 }
 
-void decrement_queue_count(struct device_queue_manager *dqm,
+static void decrement_queue_count(struct device_queue_manager *dqm,
 			enum kfd_queue_type type)
 {
 	dqm->active_queue_count--;
@@ -1027,7 +1027,7 @@ static int start_nocpsch(struct device_queue_manager *dqm)
 {
 	pr_info("SW scheduler is used");
 	init_interrupts(dqm);
-	
+
 	if (dqm->dev->device_info->asic_family == CHIP_HAWAII)
 		return pm_init(&dqm->packets, dqm);
 	dqm->sched_running = true;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 0b4f40905f55..8616a204e4c3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -313,7 +313,7 @@ static int kfd_sysfs_create_file(struct kfd_process *p, struct attribute *attr,
 	return ret;
 }
 
-int kfd_procfs_add_sysfs_files(struct kfd_process *p)
+static int kfd_procfs_add_sysfs_files(struct kfd_process *p)
 {
 	int ret = 0;
 	struct kfd_process_device *pdd;
-- 
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
