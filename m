Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Cae2A1rRU2oXfQMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 12 Jul 2026 19:39:38 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EE874581A
	for <lists+amd-gfx@lfdr.de>; Sun, 12 Jul 2026 19:39:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=p1R092zw;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1B510E4CD;
	Sun, 12 Jul 2026 17:39:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBE510E49F
 for <amd-gfx@lists.freedesktop.org>; Sun, 12 Jul 2026 17:39:33 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-493f45e206dso10665635e9.1
 for <amd-gfx@lists.freedesktop.org>; Sun, 12 Jul 2026 10:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783877972; x=1784482772; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Phq0P0Bl4raEjuM9bthxJSkhMvlaTT5a2ePjPoRYxnU=;
 b=p1R092zweLIMtvM/C61UmTfUuBkPOJeh1nr58jZQ/d3dhfF8v0DqELxYSd1aOcJY6Z
 +3L+Uvvujbv2swRC4meatGjxoC390Q9s5i94CNQbO45+/5wYEjQBVIS3mvckssqCD2/H
 D8Ibl3A25P9QeLKmz6+EkyqTI+jNeUU/Dx27XFhjvhambv3L4xJ4vklcf7l6bHlX9oP2
 HLqGJYPTefmoiBX5NnFeuhv/Qm5mlfPbAJkNbFeL+fR7ZBbyTz76RyrVGtzfyyluE0+5
 Yafi5L6kWw/Zi5b5E5VctXR0cRpsldrbMzdVZxn/ddaVzMMgbpGqRlXWCaAvmdXbVp2p
 YRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783877972; x=1784482772;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Phq0P0Bl4raEjuM9bthxJSkhMvlaTT5a2ePjPoRYxnU=;
 b=aLA9NdnEZTECpTV5AK03E2N3jdv1gsbnCzLM/NWWOqarPLoEhUahzrFoQel776+PhW
 U8TFah+necrKdKhg72kjc2Zd9IBUeoTBlXBCiW+VZdYc9qw+m6cC6+RMCno92KB+leos
 sUOGlJvnQ4fjob4f+pdWYHLDc9IgSa1Plo71srPaL3BGAVb5xqYpD90o4NMJKtm/j1g1
 TqLphiyuRkEM7EoiPMUhv2vex7jnMlCCbq4MdzCEhLuC2yfBF3C3s9bmjdwaoDlpRZY2
 U0Gfk5I8WmGXYNtbchgwlnRk8tDBk0f14Ibud+fCyIz/N+Lv0T7ncFcT2ZmQpLjqjnLA
 9Z5A==
X-Gm-Message-State: AOJu0YyaoSxCJQxOR/EhQ50Zww53uTIgqlLzuXwd3+AEBwRMWcdMJeZJ
 +A9iGXl9cyNhWKe9JLGCk1xmUiX7jY9Pc6OhteAjD9PAgPg+0G1tvESSaPxiSw==
X-Gm-Gg: AfdE7cmKlL9m7quuvfT6BhmiVNcfjltEDQSWeNJivo9WCYcRmnTGqtHihfrJ6fsmPmq
 /TRO+PTjH6I6btJZZMtfGpRGuYFwlzw3GBOTqZWLb3Wjvcj1TtOINclENmE+WUAqlkC4uUXn+I3
 ETNQb32q/TeT8BXab3tUDT8SX9o5R0LUdJU5m0mNhNCYlA7RSHDTL/Sa3pk7JOu0xtX6p1I12wS
 oGvCFvFSCBiNWVi2R/6KPo3QvMjucdcRlqNSmCDTm5UVF97In34cr6gGd6+EUPygp6nSdlLa3oa
 hpSsX+IEf2tgkRb9BrYn9DlLLz3+HR8j0S7DsSmBwjvc4fHAQ07pH4m+fLS0KFyhNaqa+2XPmob
 pS1ec7Q9q9h250nViXalVJw6WpCiBD6uskORjuMIC5C9QQxP43tTGnSlNY7jUvXFjIMH+d1jSUH
 GIla7/V7F8VoWxLyAm02B8T9jzy/fk6Rh+YZ9a7z3xUC9ECfvLZ7Lk81R+Ev1e7YiAfgKanrenR
 p1qdwkhxTw=
X-Received: by 2002:a05:600c:37cc:b0:493:e542:ffd5 with SMTP id
 5b1f17b1804b1-493f8884bb7mr61094745e9.5.1783877972079; 
 Sun, 12 Jul 2026 10:39:32 -0700 (PDT)
Received: from Timur-Max.home
 (20014C4E24E4950000951480CE1AD54B.dsl.pool.telekom.hu.
 [2001:4c4e:24e4:9500:95:1480:ce1a:d54b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493fbae1cdbsm119128965e9.10.2026.07.12.10.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2026 10:39:31 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com,
 Natalie Vock <natalie.vock@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 1/3] drm/amd/pm/si: Don't schedule thermal work when queue
 isn't initialized
Date: Sun, 12 Jul 2026 19:39:26 +0200
Message-ID: <20260712173928.259701-1-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.54.0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67EE874581A

When DPM is turned off with the amdgpu.dpm=0 module parameter,
the thermal work queue isn't initialized so we shouldn't
schedule any work on it.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index 832953941266..6a54566d1a68 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -7692,7 +7692,7 @@ static int si_dpm_process_interrupt(struct amdgpu_device *adev,
 		break;
 	}
 
-	if (queue_thermal)
+	if (queue_thermal && amdgpu_dpm)
 		schedule_work(&adev->pm.dpm.thermal.work);
 
 	return 0;
-- 
2.54.0

