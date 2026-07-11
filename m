Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X2aRIy0nUmrKMgMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Jul 2026 13:21:17 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4107415DE
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Jul 2026 13:21:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ItIaErNy;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AF010E0EB;
	Sat, 11 Jul 2026 11:21:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D535710E0EB
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Jul 2026 11:21:13 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-493f0ae9572so6545625e9.3
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Jul 2026 04:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783768872; x=1784373672; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=xx9uKFjRumLcFuhjjMs2wQ2hBG9hjmIS3Qyfz8slVXM=;
 b=ItIaErNyMJfBJkzFGKdnwbINDsIqPp9GOpBlFqD88cVNIA5G0uVE+X7lZRAS/+uvye
 qd1r438zryGtfTT80eV6hdC3p9z4xAootZo/wnNP5fe/kiyoAFYFvNub4Sy+mew1J3Rt
 G7ZENsREmt30HJE7qxtc95+lJppefS6CQwoHJDeixNiWtTS3MPfSWCJ54qGrFARhhWkv
 bVZnPobc3HU2XTgo+PslglWfZVibK5cyzwD0t/ZzfZVk17P3uapbZLDiZcTi0DcQkncS
 kO4rH88DTOQ/ebuj/76YkRO6t5Sjp4TTCAWJeP36icIjsP5MMwQYx5PbHqnD9uv71efE
 5dBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783768872; x=1784373672;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xx9uKFjRumLcFuhjjMs2wQ2hBG9hjmIS3Qyfz8slVXM=;
 b=FDdhhltz9pxIRxDhtATrSEWv4f9Cy7z6wEzW0an1WJ5AlzyZqbVJUgJOqkhWJhW4kG
 VdCiATI8mtG+0uEIA3gou3r/MEwDNBoL+05bkyZehxmvxTnNlR/lp9A/VqVucZjx1B9f
 P+hylNH4oMPlFLz23uUEyTyp3ilszjaQ/dDga5EoGYPnQOe/82pw8sJiZ3kXTUAWpZex
 4CKzAglot3yI/mzzswmmfj8yH2glfPPOojA7Za0YbybHk9Wh+PVX1eUIUOP79PgTQmUV
 o7PrBQgOxWU4LNtKmFcwstPu+mbmA4B/fCQJEYsE7uREkq5kq6fAKez8MHdWuvl9ma8B
 WuAw==
X-Gm-Message-State: AOJu0YzkQA9z5UJF64O/9giB9jLRLbVg0Fh5i4wuob8mlrPnbIHNW1YS
 51Ocdv1HhvcbwW6JJeSpebMroflotM/9xifby6aaCTagGlekUq/GnbAQEjvH/g==
X-Gm-Gg: AfdE7ckqiXmpCpOFKLhDRT8Rxc7H9JdDj67HWKqiFqGdlmJa89F432QHni/RpOrsOJ0
 PlE27nYXpr0eh5kyMAFhL6uPCZgNGz409cR+ecs1ATXGJO8mj8Jd69jn/CpktsSmLacFP8jWgcg
 MIJuy+NG9RYRNbxkXHe+U+FoZzRk4v0QFPzH+kEFXoQz7+a5S9duH8jPDnMfboxu7BELYbN5+2s
 oPr/bovcDZ/ENnRq6lzcDcWA0z+jHsqfEw522JPyDCkVF54Lby+7yr18/OcCeWXu1lMOBQsEN1X
 suBlerx9Cl+urh+/7NcGWqkbeb01D3lIaLkEYSXUKD0ROfapYwsnI9KHELQOijGOz3Em6Zb8vkO
 +27rYcDoio4UH+MNX4WVPQts3yEXfimPD80BTv5mkEh5OM5+sK39uBplTtiPGCmtbwd4viv384H
 8kk2irhv52v7GMaOR6pNCqZB8QrtMEyAMLOn+M4jVV2pLq9+qgxc0eNA==
X-Received: by 2002:a7b:cd13:0:b0:493:a976:5c6e with SMTP id
 5b1f17b1804b1-493f87ebf93mr16291015e9.16.1783768871896; 
 Sat, 11 Jul 2026 04:21:11 -0700 (PDT)
Received: from Timur-Hyperion.home (54001386.dsl.pool.telekom.hu.
 [84.0.19.134]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f2465ae8bsm13228764f8f.36.2026.07.11.04.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2026 04:21:11 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 pierre-eric.pelloux-prayer@amd.com, Natalie Vock <natalie.vock@gmx.de>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 1/2] drm/amdgpu: Print vmid,
 pasid and more task info in devcoredump
Date: Sat, 11 Jul 2026 13:21:07 +0200
Message-ID: <20260711112108.8980-1-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.55.0
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,ursulin.net,gmx.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF4107415DE

These are in the dmesg logs but are missing from devcoredumps.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c | 7 ++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 4fd0df3aa70d..aaf091b7f9d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -356,10 +356,14 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 	drm_printf(&p, "kernel: %s\n", init_utsname()->release);
 	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
 	drm_printf(&p, "time: %ptSp\n", &coredump->reset_time);
+	drm_printf(&p, "pasid: %u\n", coredump->pasid);
+	drm_printf(&p, "vmid: %u\n", coredump->vmid);
 
 	if (coredump->reset_task_info.task.pid)
-		drm_printf(&p, "process_name: %s PID: %d\n",
+		drm_printf(&p, "process_name: %s TGID: %d thread: %s PID: %d\n",
 			   coredump->reset_task_info.process_name,
+			   coredump->reset_task_info.tgid,
+			   coredump->reset_task_info.task.comm,
 			   coredump->reset_task_info.task.pid);
 
 	/* SOC Information */
@@ -563,6 +567,7 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 			amdgpu_vm_put_task_info(ti);
 		}
 		coredump->pasid = job->pasid;
+		coredump->vmid = job->vmid;
 		coredump->num_ibs = job->num_ibs;
 		for (i = 0; i < job->num_ibs; ++i) {
 			coredump->ibs[i].gpu_addr = job->ibs[i].gpu_addr;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
index 2371e20fc68b..63f27337c09a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
@@ -63,6 +63,7 @@ struct amdgpu_coredump_info {
 	char				*formatted;
 
 	unsigned int			pasid;
+	unsigned int			vmid;
 	int				num_ibs;
 	struct amdgpu_coredump_ib_info	ibs[] __counted_by(num_ibs);
 };
-- 
2.55.0

