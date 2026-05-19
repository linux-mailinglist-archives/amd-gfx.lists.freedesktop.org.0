Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB5eIF4iDGrjWwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 10:42:06 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBA857A541
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 10:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406CC10EB62;
	Tue, 19 May 2026 08:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I9RJzHHz";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAA610E393
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2026 08:42:03 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so38654895e9.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2026 01:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779180122; x=1779784922; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2fw6TIXThyXb+AsmhdfNo5fn73O96mr7VQ8c3z3lnkE=;
 b=I9RJzHHzbN43B1j7Ub9IQ59KhZWXbrw0sLQOXuYGEm8p3pFFQAMFoDo3sLxVhQi9v3
 uwRFsm0A+tkGIE5suJ0dT7lgD6n8d5D7uaSkoVgmr3a8xxvW/vOLtbvd296u2iHwJ8AH
 k1SYTF8+ocNIcfISEJ2BeErbVE0hO1VGs+YXEmipoI+j9gM66vj25mzJINltfPs5qynm
 3pxOAiG/7Wir1Ea4xIQB7uDj8geWmnOblexgygl6jMQtkHGow/w0seKpTR63NHY/WiF8
 J5FvGev0GdzsIMcjGMofQDvt34MuJOvNS8xpV5s9stDWYt5jHBNSTVD8EVNU/7fFGQFl
 aJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779180122; x=1779784922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2fw6TIXThyXb+AsmhdfNo5fn73O96mr7VQ8c3z3lnkE=;
 b=Gjt4NKtAXYilDQxBUSbdiHse6gXCMSpCxAyI0x1mZQZu5z7jmC3b5pI3vmkTbBf7FP
 10z8Qyo5EIwtT/gPvMGxCSbo+e+PbrTSEGWsyYNFHgYNf/xdLNyZYyQwjNqrkCVEf+T0
 urW+l3sZJjcDNkrNE8vedwXo+JOlUb3pl8a8Y4akpNhzx3GruBLF6Uss24AVBmxEC9FU
 3S+3rH+3x9tFtPpw4MBPVOsYzbfKq9eGhPQ9vgoxISXLrAHcpe68V7WZQW2P//QZp38c
 2wMrJE2HxuAdImXpH6MDrosXuA8lM16NyIGCqKBtKFDw+B7vGIL/sMSeLGpszckcONbG
 CYQA==
X-Gm-Message-State: AOJu0Yyao6KGb8YFbonCp68ICTx8u8JS5KtBG38LhlVexTwn+1q8Pm9e
 qUvh4jDNQQpMZu4cVyHu++g/iViYea9SpbdKCKs4fFz3uEjh3ItkMPg3UHZZ6g==
X-Gm-Gg: Acq92OE52EZxmyMk3dlnTJjf+FojyQEMX6XgnKdIBtlw0Ogj21gPsvyp12SaZpNkdms
 xy0VFHIQTAuv4EBK8BVl62lpzbsszIkebCn0dI1/q2rIimdiayusmE/96SMzpbQLVWFnQPiWXNV
 9Je0vDb3KARxJMmk6DP8ibD979jLViShh9d+6/PMZgZ22fdBcmIy3iGtPvGS8qW2F8Pylfb/2NP
 6mPJBZk/8LZJ7JXkidLybUjvUMtY38IR5YiFRmjahFsyDnfPMkaj3sTY3WnI0AmISNEJyGOE9KK
 gP5MutHkkevgyUyTLl1Ev9/Ke130Xvp7WHaQRm+Wa1RbfwgfzqKajL0oSz+R60VtvrOggVGBdRP
 Hrjufxq56WTXThT0F+Ly5eYeAbmw0htltHpLEO44yduotSOvS32pF0e4LkzxGuKFjZl8Mx5/fyQ
 DMCG2aNQwrVA1icaZ0yYdAPybk0i/drMzqJIpc8AV6CPXhXAojEeNXObg26WkCp/B2
X-Received: by 2002:a05:600c:3492:b0:48a:52ee:5776 with SMTP id
 5b1f17b1804b1-48fe60e79eemr297112825e9.11.1779180122197; 
 Tue, 19 May 2026 01:42:02 -0700 (PDT)
Received: from Timur-Hyperion.home (54001290.dsl.pool.telekom.hu.
 [84.0.18.144]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48ff2cb4ae0sm141935945e9.0.2026.05.19.01.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 01:42:01 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>,
 Jeremy Klarenbeek <jeremy.klarenbeek99@gmail.com>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 1/5] drm/amd/pm/si: Disregard vblank time when no displays are
 connected
Date: Tue, 19 May 2026 10:41:54 +0200
Message-ID: <20260519084158.72960-2-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519084158.72960-1-timur.kristof@gmail.com>
References: <20260519084158.72960-1-timur.kristof@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,gmx.de,gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: EEBA857A541
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When no displays are connected, there is no vblank
happening so the power management code shouldn't
worry about it.

This fixes a regression that caused the memory clock
to be stuck at maximum when there were no displays
connected to a SI GPU.

Fixes: 9003a0746864 ("drm/amd/pm: Treat zero vblank time as too short in si_dpm (v3)")
Fixes: 9d73b107a61b ("drm/amd/pm: Use pm_display_cfg in legacy DPM (v2)")
Tested-by: Jeremy Klarenbeek <jeremy.klarenbeek99@gmail.com>
Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index b75a6031c68a..5afe42918497 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -3076,6 +3076,10 @@ static bool si_dpm_vblank_too_short(void *handle)
 	/* we never hit the non-gddr5 limit so disable it */
 	u32 switch_limit = adev->gmc.vram_type == AMDGPU_VRAM_TYPE_GDDR5 ? 450 : 0;
 
+	/* Disregard vblank time when there are no displays connected */
+	if (!adev->pm.pm_display_cfg.num_display)
+		return false;
+
 	/* Consider zero vblank time too short and disable MCLK switching.
 	 * Note that the vblank time is set to maximum when no displays are attached,
 	 * so we'll still enable MCLK switching in that case.
-- 
2.54.0

