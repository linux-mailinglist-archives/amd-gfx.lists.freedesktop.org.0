Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vdK8Ih/yMmrS7wUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 21:14:39 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3342E69C19E
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 21:14:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LWjnd7H2;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCC310F0CD;
	Wed, 17 Jun 2026 19:14:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC5310F0C4
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 19:14:35 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-492329c5514so391575e9.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 12:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781723674; x=1782328474; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JEq+hWt7lUQbvkRF5WPwITM6SWFAE/5wKzokDDkry8=;
 b=LWjnd7H2Vv1/eCtsYSY3YLyY/smdyzX/MKPymRfw/xZ0JW3qvfZCGwKj0KzBxRmVoS
 4GBASig4vrQBZVGfc0tNKqKHVjLS5EK2GciOBmaXIv6YhUcpIgLoHRx/U22W4kDgNoSM
 ssVz1hUZjpk9deufyc2QoNgMt6dulhadYtGxA1d/HYVJdXr3NC9Qj3IX+J9cmiqXYnGO
 BIiVMlq3dAyR6sxhA/bD0ROKCi+/GeeVAEDVVUNwEoT1uZd0F6uXgIsgFff+YXOcgvb3
 kOLOjoR9Z4ZuH5O1M2M39442SOB/Ka3RD6jsudM/hFW6dlFrmcU9kHkw6vLIFkgdC1BI
 vYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781723674; x=1782328474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6JEq+hWt7lUQbvkRF5WPwITM6SWFAE/5wKzokDDkry8=;
 b=GONrzhi2JgvGwloaB+iYO6/VHovrWaJy+ctjor9p1ASW3P7DFr99UeGkWX2Dp1c8ri
 3ZrvzXKdJPLLf+7E9CQskDt3+pYPvM6wp/TnIpiWd8/QAu4CLsxqc+0zrGbZ+pDp76Kf
 MEZS8IfCOu7HpNGeTOrOJ+QdDta5QWsYNwm2EbX/nqDgjALq7xfLenq68dlOmvZa5g+M
 02ARqsv+9vRJcbrPFfr/8Srp1o6knHefSsb8iO7bzIB1XdACFgXgg7rBf30iolUmIHTl
 l1fqTeMbKo8kNE9fkXaLR1k4/ahndXGN8wRIWEm/1fB6ackdTlOFpq2QsBPT82yl8WAC
 5H4A==
X-Gm-Message-State: AOJu0Yzmhfo1UxH3ReQyljO/O4RlbE/FZI0suJ0qv5o5bljIM8tlhVsF
 NkUpRcECubU5te76RJP9fadaYlTrZoqhx/Ruveq8kAFZ7F8X/F2PS+bULTQB2A==
X-Gm-Gg: AfdE7cm3ijzmx7uikFvAV0TGZdHpjRd4wdDyhMEKJGqpk9bNUAbZaCLc3iBIAr4imlP
 2Ff9SaQLTaWKUNRehHBD7tpEf/XXnCV5Z6x62OEwjYNea++SRUFmxSBdu4a9Q4pqR4qwOJTlT/8
 FNlbhAs0ccyizhpnNwKiLCf36M+5CxTah5fPypdUZpdE3sCOx4owhMbkCJQZFhlmndCynTiEGla
 wgKbilqH2Zv9iU5VX2iBQhCOB99qzCNRMEc4zVXJKL9JnL/f7i5Ro66Tq20OchA/PaH2rdzZA+h
 mIYWXfFlPtLkM5pKfxyBMOJbcoAsTLcUsInSKXVPTZIh8UYaxhSlrVQI2GyeHHAbyM0RbmHRrw0
 9uhvhN/cabp6TnB9yWZ94me2fmY84NLdzDZjTs54Dxb5gvSbLmsBWF7JoKOcjPNAG0HDIHVqoqT
 TGmUX7RdeEvaNxeBIxBXMTs9qdJD97+zy/sSctlS6ctVtHuYXmhVNdjw==
X-Received: by 2002:a05:600c:4ec6:b0:490:3cf0:8d81 with SMTP id
 5b1f17b1804b1-492381864b5mr11228065e9.13.1781723673935; 
 Wed, 17 Jun 2026 12:14:33 -0700 (PDT)
Received: from Timur-Hyperion.home (54001290.dsl.pool.telekom.hu.
 [84.0.18.144]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa96f0esm204686325e9.12.2026.06.17.12.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 12:14:33 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lazar Lijo <lijo.lazar@amd.com>, Martin Roukala <martin.roukala@mupuf.org>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 01/17] drm/amdgpu: Clarify name of soft recovery to avoid
 confusion
Date: Wed, 17 Jun 2026 21:14:12 +0200
Message-ID: <20260617191428.1784083-2-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617191428.1784083-1-timur.kristof@gmail.com>
References: <20260617191428.1784083-1-timur.kristof@gmail.com>
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
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,gmx.de,gmail.com,igalia.com,mupuf.org];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3342E69C19E

Soft recovery is not the same as soft reset:

* Soft recovery attempts to resolve a GPU hang by sending a
  command to terminate shaders.
* Soft reset completely re-initializes an entire device IP block,
  which may affect multiple rings and jobs at the same time.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 5d7bfa59424a..cb4fa9c111eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -304,7 +304,7 @@ extern uint amdgpu_hdmi_hpd_debounce_delay_ms;
 
 /* reset mask */
 #define AMDGPU_RESET_TYPE_FULL (1 << 0) /* full adapter reset, mode1/mode2/BACO/etc. */
-#define AMDGPU_RESET_TYPE_SOFT_RESET (1 << 1) /* IP level soft reset */
+#define AMDGPU_RESET_TYPE_SOFT_RECOVERY (1 << 1) /* soft recovery, eg. kill shaders */
 #define AMDGPU_RESET_TYPE_PER_QUEUE (1 << 2) /* per queue */
 #define AMDGPU_RESET_TYPE_PER_PIPE (1 << 3) /* per pipe */
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 5ccbe6c885cf..71a6b18ccf23 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -6884,7 +6884,7 @@ ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring)
 
 	if (unlikely(!ring->adev->debug_disable_soft_recovery) &&
 	    !amdgpu_sriov_vf(ring->adev) && ring->funcs->soft_recovery)
-		size |= AMDGPU_RESET_TYPE_SOFT_RESET;
+		size |= AMDGPU_RESET_TYPE_SOFT_RECOVERY;
 
 	return size;
 }
@@ -6900,8 +6900,8 @@ ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset)
 
 	}
 
-	if (supported_reset & AMDGPU_RESET_TYPE_SOFT_RESET)
-		size += sysfs_emit_at(buf, size, "soft ");
+	if (supported_reset & AMDGPU_RESET_TYPE_SOFT_RECOVERY)
+		size += sysfs_emit_at(buf, size, "soft_recovery ");
 
 	if (supported_reset & AMDGPU_RESET_TYPE_PER_QUEUE)
 		size += sysfs_emit_at(buf, size, "queue ");
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 1781c0c3d010..53aa2d438da5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2250,7 +2250,7 @@ static void amdgpu_init_debug_options(struct amdgpu_device *adev)
 	}
 
 	if (amdgpu_debug_mask & AMDGPU_DEBUG_DISABLE_GPU_SOFT_RECOVERY) {
-		pr_info("debug: soft reset for GPU recovery disabled\n");
+		pr_info("debug: soft recovery disabled\n");
 		adev->debug_disable_soft_recovery = true;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 55172c2dcc35..ce3c209a6ba7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -112,7 +112,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		amdgpu_job_core_dump(adev, job);
 
 	if (amdgpu_gpu_recovery &&
-	    amdgpu_ring_is_reset_type_supported(ring, AMDGPU_RESET_TYPE_SOFT_RESET) &&
+	    amdgpu_ring_is_reset_type_supported(ring, AMDGPU_RESET_TYPE_SOFT_RECOVERY) &&
 	    amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
 		dev_err(adev->dev, "ring %s timeout, but soft recovered\n",
 			s_job->sched->name);
-- 
2.54.0

