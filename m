Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8HR6FvEtUmqqMwMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Jul 2026 13:50:09 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512897416AA
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Jul 2026 13:50:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="HJ2mjB/C";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A55A8981D;
	Sat, 11 Jul 2026 11:50:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2788981D
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Jul 2026 11:50:04 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493f75f7172so8017515e9.1
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Jul 2026 04:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783770603; x=1784375403; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=QCPAYEKl6gqLpsi13f4PwI4++nmfTJJrXzoS7SKLfxU=;
 b=HJ2mjB/CPLs0vf3s5YrHG1ObdA4UNwuz3x/Zr/3fCNFTehWwM14I6hdRtTyNzu3Ryz
 NMToERNQznfxI+eTTbRhtJvIjIJAA0AZsOz3l8u62hNwdz3A7KJonNEaYrjOHuGhNYHE
 2ofoAwm//2h8/cb87fvCUBbgbVBI66nkSGKkMumRpen7x7LPj8bLLQESo1JpiNkYtp5r
 wQzo2bbLA+fTjUjZRszI3b20SJtsNhSnFwpqdmbCrKT8kwyOLuHZ60KAcRcin81opY/s
 bHUyneyMaiVFplnuNLdXzYcZNKx3E2J8ye98tVfOMA1ZpxFxy95vVqn2FuXi4eMm19dO
 ImIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783770603; x=1784375403;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QCPAYEKl6gqLpsi13f4PwI4++nmfTJJrXzoS7SKLfxU=;
 b=iUU60QnJ0ezANyUIap23QpVahMuPBofU9SULyP5LWIrwBwPJrTqhhbDF8q89LrCFRL
 DL/i6AaspxghTbl0v8cVox+y451LmJAjl6Gn2nYM7Yp4EiMaaHJXbqyYSJVZ3Fjf3WHq
 5Gpps94a+crLM2sIyNASkOQKr8nE8OT0yqQa8a1+nsFV3PuzzTGBP8I/qyCZM7aOSreu
 C3vVQJy/mQRkozdjsFP/i8N0sSqLgTFJYI2cUB77EO/w94RDgz9+UJeVJjzuBnTaP/TN
 c9BCyyDMXwGDOAVjZUWHZzipRrXiR2aPmeD/3I7RHOwwoHAYuUWmZD7zEd2/6L60SMU4
 N7LQ==
X-Gm-Message-State: AOJu0YyhTLJobsatKfIdNKEodGhbCoTPfm8ytrnJU8HWItDy9zTQlFxj
 ocaz8KrSFbTjCuiSnP5vJMGj6p1ndJhPfJ4KhrroS08tLl9ySei+ybJ1ufhEyA==
X-Gm-Gg: AfdE7cnByuGj7aOYxpDrWqQcVQDPRANDxYapwZBk8dSap7aADVxPSAbkWE+vVZHkqGc
 2wyGIi4n/RU5FVebkBQwnRcl24VWc2Rwt3O64MBYVuHRNNhKOJm58QsUzVnggtIIwMXWBjxuDwo
 C8/5RYfvmeRF5a3Tx9AfYvzON3Ak2LLu12eWi1fTiLyxOX7YGyAzVxY4H9wo/dD61ei9lRi1Wzk
 wh/0d3zJ58J8rNMzmjIao1liWmqdcuEfTu5KAskBXhcd0IOIe25aSTX/YaUphrvnoOvM4cqgIkB
 fJurFtfcFqL9lotXlFF9zjGtY5thfng1xKHIwG5HHO3UKWtIatum0JHKG1oYXXEatTJBJOwNUri
 JX2F9RI3nmuwPQTN7LkrlwEibe8ypEU3Lac3kya2HJmLp4QIkTP3WABIYwJn27WY7OhjL7FWiPi
 QIqyW1uxWhaUmxMdJg9ZAfeSjrP1GvupI4zMxTwFWfZP98DazHg45aWA==
X-Received: by 2002:a05:600c:190f:b0:492:4e09:9fc1 with SMTP id
 5b1f17b1804b1-493f87e5b7fmr25325765e9.15.1783770602857; 
 Sat, 11 Jul 2026 04:50:02 -0700 (PDT)
Received: from Timur-Hyperion.home (54001386.dsl.pool.telekom.hu.
 [84.0.19.134]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493fbae1cdbsm16352865e9.10.2026.07.11.04.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2026 04:50:02 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 pierre-eric.pelloux-prayer@amd.com, Natalie Vock <natalie.vock@gmx.de>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 1/3] drm/amdgpu/ttm: Consider concurrent VM flushes for buffer
 entities
Date: Sat, 11 Jul 2026 13:49:58 +0200
Message-ID: <20260711115000.40655-1-timur.kristof@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 512897416AA

Allow using multiple SDMA schedulers only on GPUs where
we are allowed to do concurrent VM flushes.
This consideration is necessary because all GART windows
are mapped in VMID 0 (the kernel VMID) so each buffer
entity would flush VMID 0 concurrently.

Practically this means that we can't use multiple SDMA
engines for TTM on GFX6-8 and Navi 1x.

Fixes: 01c836788b37 ("drm/amdgpu: pass all the sdma scheds to amdgpu_mman")
Fixes: e4029f7a9474 ("drm/amdgpu: only use working sdma schedulers for ttm")
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 74ada995bd8e..9eb55df6e692 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2685,12 +2685,22 @@ void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
 		return;
 	}
 
-	/* Navi1x's workaround requires us to limit to a single SDMA sched
-	 * for ttm.
-	 */
 	hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
-	adev->mman.num_buffer_funcs_scheds = hub->sdma_invalidation_workaround ?
-		1 : n;
+
+	/*
+	 * Allow using multiple SDMA schedulers only on GPUs where
+	 * we are allowed to do concurrent VM flushes.
+	 * This consideration is necessary because all GART windows
+	 * are mapped in VMID 0 (the kernel VMID) so each buffer
+	 * entity would flush VMID 0 concurrently.
+	 *
+	 * Also consider the SDMA invalidation workaround on
+	 * Navi 1x GPUs, which also prevents us from using
+	 * multiple SDMA engines on VMID 0 at the same time.
+	 */
+	adev->mman.num_buffer_funcs_scheds =
+		(adev->vm_manager.concurrent_flush &&
+		 !hub->sdma_invalidation_workaround) ? n : 1;
 }
 
 #if defined(CONFIG_DEBUG_FS)
-- 
2.55.0

