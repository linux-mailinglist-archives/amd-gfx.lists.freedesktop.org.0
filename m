Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KCBA0lNyWmGxQUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 29 Mar 2026 18:03:21 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA10352C16
	for <lists+amd-gfx@lfdr.de>; Sun, 29 Mar 2026 18:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C1210E13F;
	Sun, 29 Mar 2026 16:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jT/fRYat";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B32010E136
 for <amd-gfx@lists.freedesktop.org>; Sun, 29 Mar 2026 16:03:17 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-486fd27754bso35972715e9.3
 for <amd-gfx@lists.freedesktop.org>; Sun, 29 Mar 2026 09:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774800196; x=1775404996; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ON8UJ4ofF6rTG/JNWgorIlYsCBvjVuUsuIlnEiS+p+s=;
 b=jT/fRYatyusDGDkrSwAg0bzvKDkCAoFKJV+zBZXpti/tnm7i+MuffGrzvVkOO+1kEf
 6r+eKxz/WSGXeXNGuZ77dQ/r4lx/+lheQKy2aSjbcAayQAoaO6srO1XZROrBmuFmpei3
 JCqG3QQBVXa+WHv8Hl3vMkryeHWSMcxSQwLf7olNqlxrsY248X0XeGU9j8N6C1+mfOrl
 sFtmAlLCF81UR4Tbb1alkyI0FxEzm58sxrrc54J5NfZ9Oo+KbIr07bSoeFB6cVraD91Y
 1G/5LlylwKNY9/ebwbDOaaDsfNVz0eAO2ExU9ufUQ4yk3/0UkGZaaBzmFsE3CR8sn6eR
 sV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774800196; x=1775404996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ON8UJ4ofF6rTG/JNWgorIlYsCBvjVuUsuIlnEiS+p+s=;
 b=H9hCpBGBno63mUyeZheDUKI8hg8OmKbd38N/1iyyF4PNte7v/DinLu4iZyUW4591EF
 Vc0sZlt4DrSa8oYLR9t7Vazl0ImxAW1m8hIuV6KVMXn6kL+9G8w9h40X+ss9ET2ADmLE
 GyTnqpmgbt0aqr6XRuKF48YUDZJToSmPMSreWusp63IfxXb70Z8bdc/Kd3ETgv6J1P2L
 kaKKDAYUm4pKeH/uhV50y99O0BYyo7KVlNx3nvnHYrfcxpi/AnmE7QX0nPcC/T1mvQJn
 IR16eFly8029IN+lMjskMhD3PS/1JidDDWcnyU5T3O6Pt2hJpjW2S2mwnaf/6bCRZPXl
 WILQ==
X-Gm-Message-State: AOJu0YwQV4jq1OBuRMK5c3EOtAUVuETmK0oHwqx2tQveKofV2bEY5m7w
 qA3a5WlvcS9PDNtIYOxiPEKYwu2LvFkIeiz54kbe9rCsmPrg+uHbMCAHTmm9PA==
X-Gm-Gg: ATEYQzzG0brTw1tpxd0o594mSUsxjzUox7MgsrtMHA20kruypcjrqNiq7pDcw7LsKzw
 UlaGC0aGbSPL6ouVuNRqlSqTlX4moCfEsMVwxtruLFwXWcJQIPoO6+dGv4CbIED0l0gzW/r7snu
 4Jfl4G5FxOaHqbKPYHt2yQPFHxyTSZADZJ2iWmyrxKawB7cpD8YAROMoRTyk32qJXV3WvAJtSVB
 NWfj9jti16RZav5EGY43/1Yf9NR3cyCbrcaTG0cKvNiwk73Z/pxg/7NnJtpPbC1R/c038Yz7lFQ
 LS3pk71gLCuGT42zd5HFZ05qaJxz4QjacB9NkkIZWn7J9NVIMfiNRYEYiMPUEQraror8BpwCxEM
 fBqD5SkhFhnu5bHBDKKj9RiATFsNdZIY1Ix8mIyFahZZ0UneWMjz+fhha7ta4zntO7T77qKrjTO
 oxfZC2Z7aQBPO0xkWJ5TVcL8oNmnj2GeR0LqDIemqN22SuDvpsaV3/GiXH0SNuvVe6wrI=
X-Received: by 2002:a05:600c:a06:b0:487:1108:48af with SMTP id
 5b1f17b1804b1-48727d59ce3mr172702515e9.4.1774800195726; 
 Sun, 29 Mar 2026 09:03:15 -0700 (PDT)
Received: from Timur-Hyperion.home (5E1BC26F.dsl.pool.telekom.hu.
 [94.27.194.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722d38a5fsm217428915e9.12.2026.03.29.09.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2026 09:03:15 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, harry.wentland@amd.com
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 7/9] drm/amd/pm/ci: Fill DW8 fields from SMC
Date: Sun, 29 Mar 2026 18:03:04 +0200
Message-ID: <20260329160306.3417458-8-timur.kristof@gmail.com>
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
X-Rspamd-Queue-Id: ABA10352C16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In ci_populate_dw8() we currently just read a value from the SMU
and then throw it away. Instead of throwing away the value,
we should use it to fill other fields in DW8 (like radeon).

Otherwise the value of the other fiels is just cleared when
we copy this data to the SMU later.

Fixes: 9f4b35411cfe ("drm/amd/powerplay: add CI asics support to smumgr (v3)")
Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
index 90cb75ae02ff4..69d8b05ef2457 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
@@ -543,12 +543,11 @@ static int ci_populate_dw8(struct pp_hwmgr *hwmgr, uint32_t fuse_table_offset)
 {
 	struct ci_smumgr *smu_data = (struct ci_smumgr *)(hwmgr->smu_backend);
 	const struct ci_pt_defaults *defaults = smu_data->power_tune_defaults;
-	uint32_t temp;
 
 	if (ci_read_smc_sram_dword(hwmgr,
 			fuse_table_offset +
 			offsetof(SMU7_Discrete_PmFuses, TdcWaterfallCtl),
-			(uint32_t *)&temp, SMC_RAM_END))
+			(uint32_t *)&smu_data->power_tune_table.TdcWaterfallCtl, SMC_RAM_END))
 		PP_ASSERT_WITH_CODE(false,
 				"Attempt to read PmFuses.DW6 (SviLoadLineEn) from SMC Failed!",
 				return -EINVAL);
-- 
2.53.0

