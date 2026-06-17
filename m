Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J2W9HiXyMmrZ7wUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 21:14:45 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0443169C1AE
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 21:14:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LDPPoowY;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D19510F0CF;
	Wed, 17 Jun 2026 19:14:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AEE10F0CF
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 19:14:42 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490bc6a7958so10609985e9.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 12:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781723681; x=1782328481; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xrjWSQamwCQFsHAtj9XkdXlBmt9aoutREnvr4yTtJlQ=;
 b=LDPPoowY9gP1KotOEYn+geDvexTyWpgRNatoHHrZFBxJ0sYSfy1wCrtTv81AHAFcb5
 zAgjOQVfuCaJvr/G8i2H1wnJqohetoXK9ySr8rrEZAojyFaoLgAuGLXW8yMPMX0daRG6
 b5gtaqF6VCLc8rmgeapyUh4i020apThiTvKIVDWRz7xxoe0JlvFCZ8MO5a4FjtrOTdP7
 9yP5BzKNjtkQ3y2x3hM4Tq0mmPjlp7xZGSa+1I6FY1p4YBJThrPEr6TlWtD0bwN5Sf/O
 6cYJu57/+Re8sL+oU4PeWOcS34dZcI+RA5CaF+b+jkP1SjfysQwY67i5rAY3nPdXDZG1
 GeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781723681; x=1782328481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xrjWSQamwCQFsHAtj9XkdXlBmt9aoutREnvr4yTtJlQ=;
 b=M6KJaEqfxYoWMHkKyMdNtISenVIdxRNIDHE2DuK/CNiQSENH5OVVkg2uFugJfqwAUY
 d1UOa4zmnJqPRZfKaQA0jSYapu1SYgmRn4fkq7Ray6icUFVTb9P0NmbFUZ9oXDCtiL4C
 UpNyGvGoaProt5oErVTLbtYv+UeP+qkxXI6dIcR7SdwCuuUE5LU/7BDnkHbBxYRziv5E
 Hc9k9uBDzJrLTU+pcCRlAmJ8Slv0lsbuzlmjkFwXiWPHSDPW1dDkfoysojxlTGb47dOj
 lEip1vB9JjPkj9ux+wU1py7mcifkp6P3S8vOSVivy9HZJl6gfREtaxprGufMhmAYv+uk
 F0uQ==
X-Gm-Message-State: AOJu0Yy24BI3oFehRWaRDxFMnfqa73QTZsfPyzqR3xDk30cwVYJ7ROAt
 ctfUXOfoXIvBoyu4MBh7OO0cXOs55G/Z06ud02ThMqbTUCEWgMNby7xYgjofAw==
X-Gm-Gg: Acq92OHtclkZv+WIykRbP1NsAc06i4GHyfgGaht+INmpudjoA0MHpFros1u32Qnv92R
 YtXcThm4eLDZ4gBC4GdiUpNnmgwRZjI4LVOMDEcRT7K+R5RhE+ugW+NKwBtbcSB0O4fXpBcOavC
 lpHslfBLuwrZzE299Ga+ym7e+Wn/rL40At6hVn5dr3YRZObGat+xBz2fX/KBpduOsVIyGCsvn/h
 WzUVJH9tvF0vGT6AjIA55ft3IFt9xtg5TvhZU89RY3dj/AH41O7zBqS2ZX1xG4ue9yzonvC61nG
 jih4Ig7Xl8dWs1w0qnxgLbb4cZaQjaMZ6sI5org3JVaFmiDQGpSEbYcQYuWBcE8NhvWtfNoEr0m
 nQ6ujl00MMod0/oG4FAXFT62N4UyFe00pyzcRrj0uP+tXDwtwwhXIOMeXivu7JLSoO43nc9HQgl
 l1YtGh/mhwGAPC6mI4lDnaAerTM8Ohwwqkc2erKLrAHgICgQ8ACZls+A==
X-Received: by 2002:a7b:c8d3:0:b0:492:1e36:9a90 with SMTP id
 5b1f17b1804b1-492381a2e79mr8743245e9.18.1781723680875; 
 Wed, 17 Jun 2026 12:14:40 -0700 (PDT)
Received: from Timur-Hyperion.home (54001290.dsl.pool.telekom.hu.
 [84.0.18.144]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa96f0esm204686325e9.12.2026.06.17.12.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 12:14:40 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lazar Lijo <lijo.lazar@amd.com>, Martin Roukala <martin.roukala@mupuf.org>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 08/17] drm/amdgpu: track guilty fence for queue reset
Date: Wed, 17 Jun 2026 21:14:19 +0200
Message-ID: <20260617191428.1784083-9-timur.kristof@gmail.com>
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
X-Rspamd-Queue-Id: 0443169C1AE

From: Alex Deucher <alexander.deucher@amd.com>

If we've already seen a fence, don't backup the
ring contents since presumably either the previous reset
was not successful or there was something wrong with the
data.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 11 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h  |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 01333b56f24d..8a54da1267b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -804,6 +804,17 @@ void amdgpu_ring_backup_unprocessed_commands(struct amdgpu_ring *ring,
 	seq = ring->fence_drv.sync_seq & ring->fence_drv.num_fences_mask;
 	ring->ring_backup_entries_to_copy = 0;
 
+	/* if we've already seen this fence, return early.
+	 * ring->ring_backup_entries_to_copy is set to 0 so
+	 * the reemit helper will return early as well to
+	 * avoid getting stuck in a reemit loop.
+	 */
+	if (ring->guilty_fence == guilty_fence) {
+		ring->guilty_fence = NULL;
+		return;
+	}
+	ring->guilty_fence = guilty_fence;
+
 	do {
 		last_seq++;
 		last_seq &= ring->fence_drv.num_fences_mask;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 8f28b3bd7010..9276a3bb69de 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -314,6 +314,7 @@ struct amdgpu_ring {
 	uint32_t		*ring_backup;
 	unsigned int		ring_backup_entries_to_copy;
 	bool			reemit;
+	struct amdgpu_fence	*guilty_fence;
 	unsigned		rptr_offs;
 	u64			rptr_gpu_addr;
 	u32			*rptr_cpu_addr;
-- 
2.54.0

