Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P2z8GapMTmqpKQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 15:12:10 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88EE726A97
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 15:12:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=I+50Nq60;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690E310E5DF;
	Wed,  8 Jul 2026 13:12:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E757010E586
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Jul 2026 07:32:54 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2cad225673bso3264375ad.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Jul 2026 00:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783495974; x=1784100774; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Keeefd38WvRLYS9r2pdjAYV6V+Tg/ODVFYOu8UceE3I=;
 b=I+50Nq60qzntlBtWH5t/v5IZYeuNJSqu55QbT0HtFnbAhD7HsjioOf85tBnxMUMSOo
 K40zVz5qdlvvhBWnKOmh9lSqdKt04/gLSXGWgzV2fiUJtu9irzfKCfR5NmEb0meq/AMW
 Sa6tn99rR9pW/voljiRhRtHvuEAxggPNtNbRhtR4zjH5WEzj+jbkcLnpybhVggtDSj18
 ExyuCNTFWJWgPznH9/IMhjcuZn/GxntONVUHFj6b0PEKfPe20EV1n26eWcGZK9cPbsOc
 aCoN0uV7BYP16O4flUvT/9bhtTFazR0qEge7kk/5Tn3/+qsb0P9rBP3AL7118NZdp+Zm
 5qdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783495974; x=1784100774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Keeefd38WvRLYS9r2pdjAYV6V+Tg/ODVFYOu8UceE3I=;
 b=Y1VsxgvENxqtwh/rQe2xvlud/ZBsxjZLtYXnHTZAfU6Lc55zDKM4q8tdAtForlmbEN
 MrAMjSgXoL94lVJdy36wxKKC70012OtAFmJWdko6bS569l6PMEGsouiYMbD/sky0evUO
 4ONRuUPWCcGwlYXKoLGCnrkiQkdPQu5Vcu79ZSjdMF1EjEUhW80ZT2+V2+pXut0CgqRR
 RlcEZnP9XdPmLebBbZ6Rl3IDBOUgtzeVkiVLRJ5hGCkyo7TZPEyJ4n5WxU4ou7zi/SQi
 3v60kaEIrcZlafzRPASOcdkE/MWj3uzVLc/1I3h/ylvJVSpvYyAlky3N2fBAa5no0tyI
 MeJA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrTPM/KKsFcuYL2boM/eGsnQh1QY0aVck4SD5fmXu8xKkmnCAq8tEL0Uk70nK0UmIXU06lr1URi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS2qUntbp7ZbIzrEHU6TqmvNlDghUOG13dPXu0M49Be6TYQsaH
 K/3jtRngkcDFyVGN053bpW4DbNxZTgEaQNlQbYA2t9xbS+P2+Zg5OHV/
X-Gm-Gg: AfdE7cndevjL2d3waqDM076jtAVExxZRoJyx9uGiowf/QAJh/ZHUI9AKHR7Br4msWWD
 k4xlWV4Prb7x1/uFGDM6sCI5x3kmRC6Cos8zmzHFUyHL/0TgY6H4AG5/IQzJhE/p/iw04jbmIMJ
 Hsuc5SWjE/FeKyxKC51LntbeODQ/lchxA+Na7nXavUajL1NU9OkVD39kRyFEw0W+ACpQFW42juw
 Xy6G/tWePP/Z/tDHWBzdWGvWnKSI6FxhTOsM0uWIPVgs2qv4S09tLFKRO8B1i6ADwp2VQxw5BSV
 ysXZ92VVvyonM2MFgFMelUKSmdC23fhcqmdu4zYfwCNl3YLTnTH/yzrOScZt2ZncXXm9hnyo728
 evqCxagS07gKK+SXPQSR7mRNimOdf0gX/ejRKfW1gBH0yTwLAgS3cdlMocBM9ek/MfNb5KkA=
X-Received: by 2002:a17:903:b86:b0:2ca:bb6:e7c6 with SMTP id
 d9443c01a7336-2ccea36e129mr14778595ad.37.1783495974343; 
 Wed, 08 Jul 2026 00:32:54 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3d2efsm23314995ad.64.2026.07.08.00.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 00:32:53 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Ivan Lipski <ivan.lipski@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Ray Wu <ray.wu@amd.com>,
 Chenyu Chen <chen-yu.chen@amd.com>, Maxime Ripard <mripard@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] drm/amd/display: move connector state dereference after NULL
 check
Date: Wed,  8 Jul 2026 15:27:51 +0800
Message-ID: <20260708072751.724400-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 Jul 2026 13:12:03 +0000
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:mario.limonciello@amd.com,m:alex.hung@amd.com,m:superm1@kernel.org,m:timur.kristof@gmail.com,m:ivan.lipski@amd.com,m:aurabindo.pillai@amd.com,m:ray.wu@amd.com,m:chen-yu.chen@amd.com,m:mripard@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:lgs201920130244@gmail.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER(0.00)[lgs201920130244@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E88EE726A97

amdgpu_dm_connector_atomic_check() checks whether the old or new
connector state returned by the atomic helpers is NULL before using
those pointers.

However, new_con_state is already dereferenced while initializing crtc,
before the NULL check is reached. If
drm_atomic_get_new_connector_state() returns NULL, the function can
dereference the NULL pointer before the WARN_ON() check can handle it.

Declare crtc first and initialize it only after the NULL check has
succeeded.

Fixes: 1e5e8d672fec ("drm/amd/display: Avoid a NULL pointer dereference")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d3a8d681227a..7b040fd7e3fb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8640,13 +8640,14 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
 		drm_atomic_get_new_connector_state(state, conn);
 	struct drm_connector_state *old_con_state =
 		drm_atomic_get_old_connector_state(state, conn);
-	struct drm_crtc *crtc = new_con_state->crtc;
+	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
 	struct amdgpu_dm_connector *aconn = to_amdgpu_dm_connector(conn);
 	int ret;
 
 	if (WARN_ON(unlikely(!old_con_state || !new_con_state)))
 		return -EINVAL;
+	crtc = new_con_state->crtc;
 
 	trace_amdgpu_dm_connector_atomic_check(new_con_state);
 
-- 
2.43.0

