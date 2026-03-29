Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFT5F0hNyWmGxQUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 29 Mar 2026 18:03:20 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1101B352C09
	for <lists+amd-gfx@lfdr.de>; Sun, 29 Mar 2026 18:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BED10E13D;
	Sun, 29 Mar 2026 16:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DR1dDZTU";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A761910E136
 for <amd-gfx@lists.freedesktop.org>; Sun, 29 Mar 2026 16:03:16 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so30874005e9.0
 for <amd-gfx@lists.freedesktop.org>; Sun, 29 Mar 2026 09:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774800195; x=1775404995; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Gj79ArkLI9mxLT8jcM2hEyHsBO309y10zs+8EiYIMo=;
 b=DR1dDZTUYUOGoSK6iGG6G8fwNmXION4WqY7JnlvEENy8mb16DuP7exuaIpdKWQ8hse
 8Oc5xDr9jBsP5VV2HRtHolKJysSm7KJhL2EBu3dXhX7jZ57hO7wB30YG6PpmwelOgmR8
 tHSpaLqwf2/Ac8Jn46ymAam8t7LwP8NRkGCoTE7Q4kgyStanf7+VVDLaL9oUukDwZ3kY
 p3gu+Z95tGtvFx2R4BzMp5uvGRZH8hZ0ExwAcEsr8gC/fiUGRQ1S1cpVglJ8G60Y96vD
 ilOlkzzAcp3byIOkAaSAhUTf9T6Nu/r7bvXhp59JjjOawiQqD2JfhhZ4YhAAzE/ZLv9m
 sG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774800195; x=1775404995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3Gj79ArkLI9mxLT8jcM2hEyHsBO309y10zs+8EiYIMo=;
 b=iR5A5ebucKK6B8hBpoP5nTa/avFcvWOhYccme8mO8W1Kbke2uTy0oA93JQjAYzeiA/
 0/Sf1ToVCTPfZPoCK+In5ilqSRfad5NsRPY5R7rfbn0HjlUXWMjD32gBxx60SbjZZjW5
 S349+/tDtET7HhKorSnmyWe5hJLRM2npm3irdF7SD6uQsZGJUHINGS2wBTFX+YcQbmfO
 pBJ+FYe0MwUdzksjyFaMKQJKivGqwhYwPZIXTcesy901iPHrV7DHq+jbOyLzh8E9AQPJ
 xwHWnjHuIYBJjZ8y8VnjQv4W+h1EshRQwkFaveuXV88i1eEfZEY9Lz8v2NUIIbT1oG1T
 NjRQ==
X-Gm-Message-State: AOJu0YyB1/IilMyAyCMEnHQBQhyj4dBOj8ifL62NWMDda4Up3ft6TuSZ
 Hxx+NwXRCncaWBCGzL7JRMJq+i+jyVkcmVdlDZRbIIL65u+o9ceLDeX2u+aX0w==
X-Gm-Gg: ATEYQzytwyqU5QP7U8SzXlPFJPldj+GlYspwl1XQstBpMSQQAv/u1a1T87XJUvo5NiD
 lOZamevcZKHTxcMxD2Jx7eqAfVwPiGtujp4jbM6EjfkIUGUKKyA7GMCfbZDoV4ws5NFv3cWS9cK
 4QX/9VEVhGW6Wnq4c4oUE2T3Q5Rac9a/q1Fq4y8RwkDLL0KsDUARWG9+z2IY3E1GkWyiM1+GhRS
 ltgW544oJRQEUYPfvZ8nznXnZFnzJQit0hkqVaq6pvFGc5v34DU4aPC1+nhovadie6gaoXeeWan
 2MWFmVbpUetv0ENP0ZvacvVDPtaAUdHDUnev4Pv57ZdlmBKeaOJ9+OuRLFYJtO+/UgInL+0dK5C
 wAHIniFixZD+Nrp93cu68KHSjHfXm8zfV/aTzI2R/fUF6LhmDIpcuCsx5PMtenvjW7IfaRehaE1
 7BFT7U92e6D9O/SS5Se3sgC5lZRafXnKvoYbNi7QwKxY5ifn8A7YlxVZGoMN5DUhVvV8U=
X-Received: by 2002:a05:600c:8489:b0:486:fbdb:b718 with SMTP id
 5b1f17b1804b1-4872807483cmr161655205e9.25.1774800194936; 
 Sun, 29 Mar 2026 09:03:14 -0700 (PDT)
Received: from Timur-Hyperion.home (5E1BC26F.dsl.pool.telekom.hu.
 [94.27.194.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722d38a5fsm217428915e9.12.2026.03.29.09.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2026 09:03:14 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, harry.wentland@amd.com
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 6/9] drm/amd/pm/ci: Clear EnabledForActivity field for memory
 levels
Date: Sun, 29 Mar 2026 18:03:03 +0200
Message-ID: <20260329160306.3417458-7-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329160306.3417458-1-timur.kristof@gmail.com>
References: <20260329160306.3417458-1-timur.kristof@gmail.com>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 1101B352C09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Follow what radeon did and what amdgpu does for other GPUs with SMU7.

Fixes: 9f4b35411cfe ("drm/amd/powerplay: add CI asics support to smumgr (v3)")
Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
index 6382dee5a2ba3..90cb75ae02ff4 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
@@ -1217,7 +1217,7 @@ static int ci_populate_single_memory_level(
 	}
 
 	memory_level->EnabledForThrottle = 1;
-	memory_level->EnabledForActivity = 1;
+	memory_level->EnabledForActivity = 0;
 	memory_level->UpH = data->current_profile_setting.mclk_up_hyst;
 	memory_level->DownH = data->current_profile_setting.mclk_down_hyst;
 	memory_level->VoltageDownH = 0;
-- 
2.53.0

