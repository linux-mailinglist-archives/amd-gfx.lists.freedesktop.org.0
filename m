Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONf1Ma05DGp8aQUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 12:21:33 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714E057C1D3
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 12:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD2010EBFB;
	Tue, 19 May 2026 10:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="rv1BEuHd";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F20B10EBFB
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2026 10:21:31 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-44c350a5b87so1989019f8f.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2026 03:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779186090; x=1779790890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YAoMNWS200z6XBGC8Yb0H0qoAX1NlIZAlj8acUvZrbM=;
 b=rv1BEuHd+S1oUQLv+SOfmql2I1nqpniZ+ZnfF4mKo2mcqTryzOXsxMnZ4Nr2b8CY56
 zkkZ7cjo2HkXhCkX6A6EqW9oHkJNJQhytljqRvvgV+ZLLBXkmtbOEQ8uqHBc8ihn35fb
 X6Rd5kVoc4sSm7z/+4TlpVqV6PAmxxCC+LBgIF7dmOpOY+RNA0MA+qFt+VQcVML+CddC
 Hr4DOSYgXqAsW7smn1KWXOxzV18DlShk1OvwSJ/BQIIeB7AyP3gccS0E8sBODHDyMDkO
 aLDAICVy2aJ9QkGlUAjjn0bjEbDBgiZkzprRf3jMlJcbkv2yAUbxLRfKpZxG2WwsHHa7
 Zc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779186090; x=1779790890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YAoMNWS200z6XBGC8Yb0H0qoAX1NlIZAlj8acUvZrbM=;
 b=e2CV1rgLZvt6Zh6bj65YDVh+atvMfD7VH4vptn8/ZAGXVVU9JcIpDpnA18o9dmlOxj
 mux5nt2VvsP4nJYMB9pY+X3jcrKHGs+Rvn/+Bz2KCpo0QgwZz28ZNim3eRLvtH3xTB3S
 qzOEMVdQXos8ar/65YUq3NUEEdlWotiQCM6mleOSQ9MDesO0KdVg6mpZcDylFYng9YiH
 UQ08g2zZbBT3pfkcKNVq1bLNagCcYvYrlklvcSxhTZcFmO7Lqm6Jr/628dcLtO66Nw84
 eBxOcFgKz0ykoh81SydFjvalaFZUaH8RoaEhaG+cetWLxdGv2lJAEctruXPlcjneZxQ9
 B8nQ==
X-Gm-Message-State: AOJu0YzoVmOMB9Mdfejn/FcmaKS6a9WL0aO5dmFttTPgiMT4jLCDGCAk
 x90qk7X2GYpeFLQwrkm5mmF436f2lCGkVNKTL+l5v4dInVBEkoRk+Nu6k3R7T8jK
X-Gm-Gg: Acq92OHoD30ofLWwRTwNJIzpOyYpFVeAZ8GlkjDY2QLZ0BACzykUPPLYp8JlfD650gi
 9ZmuNSCT3cTxHMUere986p3rCOH+b9Xb02OCGIwqRPGB6GZYcPtaGd49oTwVhHoKc48yBflhNm6
 eVkVnIwLNIBoZnpfodc9lSDQkFCppWjlLCSmS5Ep5ARLrDTGQs79UDkLFTRIdkBsGQ3vnDknnE/
 bIU2e4y+7Oen/TXY0gMgbT/KmT1tg3EJtO64c//EX1qEBOE6Dly6Hi9lKt9OIQK/b0f6qGAjMV+
 wdnAu6Be095o1blg4v92kHzcmjbUVrNfUMo02/MZIGWeZyZdK+k9SXjbVBHbUu0sukpkGQ/7wCv
 PbNOhThHGNrdwvx+Aod8V2WXHYKG+b60uIOskaCWbd3KbF4XJothGq/KHWyaroP9LtS5iIRGwf8
 WIsiurwVVDKowYLc4wSprwZKT7FYyXgRjggxF+uAsLHXh+IaYnfok8T21kVpt5Gasm
X-Received: by 2002:a05:600c:1512:b0:48f:e26a:1744 with SMTP id
 5b1f17b1804b1-48fe60ecd67mr175187155e9.9.1779186089738; 
 Tue, 19 May 2026 03:21:29 -0700 (PDT)
Received: from Timur-Hyperion.home (54001290.dsl.pool.telekom.hu.
 [84.0.18.144]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe0fecsm41028224f8f.26.2026.05.19.03.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 03:21:29 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>,
 Melissa Wen <mwen@igalia.com>, Harry Wentland <Harry.Wentland@amd.com>,
 Alex Hung <alex.hung@amd.com>, Roman Li <Roman.Li@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 08/14] drm/amd/display: Delete dm_pp_clocks_state
Date: Tue, 19 May 2026 12:21:12 +0200
Message-ID: <20260519102118.246466-9-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519102118.246466-1-timur.kristof@gmail.com>
References: <20260519102118.246466-1-timur.kristof@gmail.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,gmx.de,igalia.com];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 714E057C1D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It isn't used by anything anymore.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/dc/dm_services_types.h    | 23 -------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dm_services_types.h b/drivers/gpu/drm/amd/display/dc/dm_services_types.h
index f114ab819afd..b3505d93503f 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_services_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_services_types.h
@@ -36,30 +36,7 @@ struct dm_pp_clock_range {
 	int max_khz;
 };
 
-enum dm_pp_clocks_state {
-	DM_PP_CLOCKS_STATE_INVALID,
-	DM_PP_CLOCKS_STATE_ULTRA_LOW,
-	DM_PP_CLOCKS_STATE_LOW,
-	DM_PP_CLOCKS_STATE_NOMINAL,
-	DM_PP_CLOCKS_STATE_PERFORMANCE,
-
-	/* Starting from DCE11, Max 8 levels of DPM state supported. */
-	DM_PP_CLOCKS_DPM_STATE_LEVEL_INVALID = DM_PP_CLOCKS_STATE_INVALID,
-	DM_PP_CLOCKS_DPM_STATE_LEVEL_0,
-	DM_PP_CLOCKS_DPM_STATE_LEVEL_1,
-	DM_PP_CLOCKS_DPM_STATE_LEVEL_2,
-	/* to be backward compatible */
-	DM_PP_CLOCKS_DPM_STATE_LEVEL_3,
-	DM_PP_CLOCKS_DPM_STATE_LEVEL_4,
-	DM_PP_CLOCKS_DPM_STATE_LEVEL_5,
-	DM_PP_CLOCKS_DPM_STATE_LEVEL_6,
-	DM_PP_CLOCKS_DPM_STATE_LEVEL_7,
-
-	DM_PP_CLOCKS_MAX_STATES
-};
-
 struct dm_pp_gpu_clock_range {
-	enum dm_pp_clocks_state clock_state;
 	struct dm_pp_clock_range sclk;
 	struct dm_pp_clock_range mclk;
 	struct dm_pp_clock_range eclk;
-- 
2.54.0

