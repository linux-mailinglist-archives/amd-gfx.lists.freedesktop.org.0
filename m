Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oHxeFlzRU2oZfQMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 12 Jul 2026 19:39:40 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05630745822
	for <lists+amd-gfx@lfdr.de>; Sun, 12 Jul 2026 19:39:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="H8D/Nsla";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811B010E49D;
	Sun, 12 Jul 2026 17:39:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACE210E49F
 for <amd-gfx@lists.freedesktop.org>; Sun, 12 Jul 2026 17:39:36 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-493e4ccccc2so15569315e9.2
 for <amd-gfx@lists.freedesktop.org>; Sun, 12 Jul 2026 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783877975; x=1784482775; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WOobe09MyrxwBug2a6cZBTDTEVHgzQPghee9LDuzqUc=;
 b=H8D/NslakbBlamn7Yy3bDhVgdz4w3wBJ5dU1VjgNOZz/a4lhJMrmbzKtvXCjtdnC2q
 nKXrhRgGR/zoqmMynyqdIwxrjqHp815HejxAgEnz9GkGW7kY4//PFvlp+R4/49YF207V
 FMX2slmz7XaOJ8JdcgE93V4EIQ3b0+b4HiOCRnSNytHC3I0E4av5faMiFOhrjVR7gr6K
 axxGuRuFsKfDrzjoLkIbloXir0gQ3EoiBzQ/fDvhAm3+bO4ppR9qKeOgIBZFAxlfvBdN
 DizYSeNhb3hmjEEGeYGABSPDcJto9OeaPc9D0G8trvOE5hmfATvfH4c2XwluQo+jF7oD
 herA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783877975; x=1784482775;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WOobe09MyrxwBug2a6cZBTDTEVHgzQPghee9LDuzqUc=;
 b=fzCRc/RqAxbTLqNGMhD3yxYdysyWKUc9mu3dsPklNDcrHFIJQcmwInBwe7YwRYy99Z
 Oct10cvZzPlUgizmChfFCEFvpw/TXuQCIfrSixS9kQygjvDsCOwraUkADECwvOns2IbM
 XVDbXSU4OluGGAj/mbqyI6w9Q/yUOQfeXCdQ4oFwnFak468fAsSKnp+7SfReGK7ukfqV
 5f3xTXL5KmJ/O2KNn5VFVSkhySZ2J5Ky0knOZM0KixiNZ051QhqGCnDbBq+/YW6JDmGH
 lUcN3LskZJq5qYMgkdYZCueEWgaylKSXhdJRv+7KZkJ4ZLtClTgZrbOObtWxp/LOV/vO
 6Vjw==
X-Gm-Message-State: AOJu0YwuU3o7X+oMekqJmEFRUDZnPGamVOA6Hw2dYvGjFUscwsyGr3E0
 NWcLDQ4oU6aDtEHPGPkmAeR7Fjfi2lYUYMebhNRphyexqlh5EtzFXQbYwb6lFQ==
X-Gm-Gg: AfdE7cnPohSWX+dAndlXWFxbKMjumTVKF7oUF5Og3K+xhF91pDZK+ZCnlABhk2PAVlW
 b7znHgd9wgvX0lVMUdBRfRchZvfDjJb8FU/4y6kNW5EIrLmvbyIQnumvEHk6EZnTcfP55WbITTf
 Xo/bEFWiyFX7yhgh8CoAUU0nLjDSs8J/gxU3vYD25X0pq3oh9WAA2XmNzAkSc898e8jRLGUKRX4
 +/ScQheWGX63r/+lbX3b1UBwVX8se5ouqtsV8HikoHmT70wbvvv+v+dEE32AL5r8v8wrsmJV19P
 hGr4ocXNmO4rkQUI9Dram/mO8by0BkB9qaBxxXW1X+tjHHbFce5rIWRu+LEKwEOzV8eb5tD/AY7
 58rUVmMI08i9J16CAaVm+YyTT49UP4Rt4kx0llzz/fOfTME77BBEwHvN2Gx8+4DAbAsC8bQU4QW
 r8ik2sFyUfH+9HKkQbc59jkdV5qU4uf65obeMaLtIwM52yK50fvxl9Ptj7fjLV+kLFajNgLkU1A
 uW+QlaUK64=
X-Received: by 2002:a05:600c:1386:b0:492:4911:8a with SMTP id
 5b1f17b1804b1-493f87e5a46mr62020545e9.12.1783877975002; 
 Sun, 12 Jul 2026 10:39:35 -0700 (PDT)
Received: from Timur-Max.home
 (20014C4E24E4950000951480CE1AD54B.dsl.pool.telekom.hu.
 [2001:4c4e:24e4:9500:95:1480:ce1a:d54b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493fbae1cdbsm119128965e9.10.2026.07.12.10.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2026 10:39:34 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com,
 Natalie Vock <natalie.vock@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 3/3] drm/amd/pm/smu7: Fix AC/DC switch notification
Date: Sun, 12 Jul 2026 19:39:28 +0200
Message-ID: <20260712173928.259701-3-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712173928.259701-1-timur.kristof@gmail.com>
References: <20260712173928.259701-1-timur.kristof@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,gmx.de,ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05630745822

There were two mistakes in the previous implementation:

The check for AutomaticDCTransition should be inverted.
We recently learned that the kernel should send
PPSMC_MSG_RunningOnAC when the flag is set, and not the
other way around.

The clocks also need to be recomputed, because the code in
the smu7_apply_state_adjust_rules() function selects
different limits on AC and DC.

Fixes: 96da0d86614e ("drm/amd/pm/smu7: Notify SMU7 of DC->AC switch")
Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
index be824e3d276b..17ac4c0eb8e2 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
@@ -5887,15 +5887,19 @@ static int smu7_power_off_asic(struct pp_hwmgr *hwmgr)
 static void smu7_notify_ac_dc(struct pp_hwmgr *hwmgr)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)(hwmgr->adev);
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
 
-	/* Check if the platform already manages the AC/DC switch via dedicated GPIO. */
-	if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps,
+	/*
+	 * Check if the platform already manages the AC/DC switch via dedicated GPIO.
+	 * Otherwise SMU automatically notices DC, but needs to be notified of AC.
+	 */
+	if (adev->pm.ac_power &&
+	    phm_cap_enabled(hwmgr->platform_descriptor.platformCaps,
 			    PHM_PlatformCaps_AutomaticDCTransition))
-		return;
-
-	/* The SMU automatically notices DC, but needs to be notified when switching to AC. */
-	if (adev->pm.ac_power)
 		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_RunningOnAC, NULL);
+
+	/* Recompute clocks with updated max_limits. */
+	pp_funcs->pm_compute_clocks(adev->powerplay.pp_handle);
 }
 
 static const struct pp_hwmgr_func smu7_hwmgr_funcs = {
-- 
2.54.0

