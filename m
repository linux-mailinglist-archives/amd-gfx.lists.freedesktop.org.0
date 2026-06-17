Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vcNeASzyMmri7wUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 21:14:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEA769C1C2
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 21:14:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DuWVIxwF;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCEE10F0D9;
	Wed, 17 Jun 2026 19:14:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDBE10F0DC
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 19:14:45 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so605425e9.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 12:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781723684; x=1782328484; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jhgpt8N5zFZb3GQ20qQ1DxqvrwbamqM+SpsaLYi4jZI=;
 b=DuWVIxwFMjGZ587sNknN2tJw0jW8aDzqwAOGiwSpZN4jNCpR5YEzrsLZCaAdV8zp/W
 6wF0X6njnsTA29G/eq2V+OxIHAl75ajKH2t0GkCYgwAOSHYjq3cjbA3amPagd+35QwVI
 4u0J5o1RQ8UjbYyFzYGNQC2jsQYgsAE/CRv++vSqFI108ijMiEUProvCtB88VJ7O8IXw
 SSTjJQxVUYjAWB4u3UQaATUB/hXgZbymJlDEC09BtOVY5+McStGOAQHQflig7yo7WWsD
 pcQFnQkze+FVb84sokgATxdZC5LAM9xHwr3Ntwe/T8vWpzCdYTSDsErJLrS3P640HXCA
 BIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781723684; x=1782328484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jhgpt8N5zFZb3GQ20qQ1DxqvrwbamqM+SpsaLYi4jZI=;
 b=B4D7Tou6ry8EL76tbLwyUwCFX/pDQWqamIQ3dny4eXfjugQIwGmakK/jHaI+UgolqZ
 1vWJXDPcZH1jHioZI8zp/RDsRYhV3xriRJcGHhPb5nx7uOHT+wNmmsisbe1m8Y3YT3pK
 i2wve4rzDT0Fg80oKnT20CjCX3QbfqjLZ5JBI3a75H+wDah2YcIOEbWAMD5QtgDP/DKV
 Ce5ptBJemxKWPqb9ZQFN3C2TMelh8TBn12dNvnvLlVcoXYRk2CQV1RvUGAtxxA7cNlTC
 g/QxskFkPyXWy35KrCm7E6Ir2kQkdpQt0RqsMjsyUXpD7Vpd/a7R1V+QyYMnNMfKSX/y
 Ab2w==
X-Gm-Message-State: AOJu0YwcGZ+EtAxWMkHU2WVZ/JjmbCkHctpQvVH1rrYXj+rV8+O3dZCu
 Gi1ke4zfYtCBUb4Ys2G708OUT+e9VsiR1jJMxm05vMeqjCUPdy16g0Nn++fN+Q==
X-Gm-Gg: Acq92OHRVhOKU4CXLAHihXq4QHGhMgnnz+utTCk3LSxh25mz1J8bPVcZ5ZdAdPHHO4x
 WM6aAsxuw5M6sLmqOShePG0q0AecpLWlQu1vHaZO9mKt65v4GsicxjZ7IXoSoB71IVLnxf1W+F3
 FI9gLvxjPayiX9DGHlnUdV652cew6PPNcpoGtqzmmezazZp99HUq5TDU1kl0vgi6XDSm/50VF90
 WNedapjBnP4OgzpeYzhfi82xBxpGkIaHw+DfdIR4eDDkL/jtgfgEOm+W9WluOg5KiNyCslNdn5F
 LYTvbgvKmuz3KvYbGWKI67FtyUuKcAwOUSC81Auq3fqG1XdRXoS37sBuaj+C3nVf2iicPZ2KkG8
 9Kl4bxbXK41X4TJC1Sch/7/XXWCkiVrXcynfzno2kWnsrdEUdbixMe7P336ELGtCHc/SFpynL8b
 8CSEs+Q0paJ9702esOqRUGbxjoJpWAshSk8xxQ28Y5VrNMY4UrkZILTQ==
X-Received: by 2002:a05:600d:117:b0:490:a646:9d77 with SMTP id
 5b1f17b1804b1-492333a1c30mr73575595e9.6.1781723683670; 
 Wed, 17 Jun 2026 12:14:43 -0700 (PDT)
Received: from Timur-Hyperion.home (54001290.dsl.pool.telekom.hu.
 [84.0.18.144]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa96f0esm204686325e9.12.2026.06.17.12.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 12:14:43 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lazar Lijo <lijo.lazar@amd.com>, Martin Roukala <martin.roukala@mupuf.org>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 10/17] drm/amdgpu: amdgpu_ring_set_fence_errors_and_reemit()
 handle NULL fence
Date: Wed, 17 Jun 2026 21:14:21 +0200
Message-ID: <20260617191428.1784083-11-timur.kristof@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9EEA769C1C2

From: Alex Deucher <alexander.deucher@amd.com>

All the guilty fence parameter to be NULL.  Will be needed for
future functionality.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index ecf7991b2a54..05f60c2d6a6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -751,7 +751,8 @@ void amdgpu_ring_set_fence_errors_and_reemit(struct amdgpu_ring *ring,
 		if (unprocessed && !dma_fence_is_signaled_locked(unprocessed)) {
 			fence = container_of(unprocessed, struct amdgpu_fence, base);
 			is_guilty_fence = fence == guilty_fence;
-			is_guilty_context = fence->context == guilty_fence->context;
+			is_guilty_context = guilty_fence ?
+				(fence->context == guilty_fence->context) : false;
 
 			/* mark all fences from the guilty context with an error */
 			if (is_guilty_fence)
-- 
2.54.0

