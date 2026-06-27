Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dkvmLtAZQmrP0AkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 09:08:00 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9686D6BE4
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 09:08:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yeah.net header.s=s110527 header.b=Epgq3UxM;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=yeah.net
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9748510E6F9;
	Mon, 29 Jun 2026 07:07:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A8110E4D3;
 Sat, 27 Jun 2026 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=rS
 cztThxqMJbnsrmUCiqJo7gdmh7LmFjJRjuznF/ZKU=; b=Epgq3UxMFPfUkowsbX
 A9p9PBTPo9kX1vMzfnmJ1ZC9TQs3USqKlroecITzE3N4MIXhUJgFYhMHoVrj8NTc
 PAuTCYJhN49160VDBs747R2aBEYcYb2uefP7wdIKiN91LnZ0ScAk9WbGoNyS7Ql/
 3BJOa+ocI8BXSrS898pJ/veAc=
Received: from zhang.. (unknown [])
 by gzsmtp3 (Coremail) with UTF8SMTPSA id M88vCgD3nzkfzT9qCdkOAw--.16958S4;
 Sat, 27 Jun 2026 21:16:17 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Markus Elfring <Markus.Elfring@web.de>
Cc: Rodrigo Siqueira <siqueira@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ziran Zhang <zhangcoder@yeah.net>
Subject: [PATCH v3] drm/amd/display: Remove redundant NULL check before
 kfree() in mod_power_create()
Date: Sat, 27 Jun 2026 21:13:54 +0800
Message-ID: <20260627131354.5811-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260627100945.5826-1-zhangcoder@yeah.net>
References: <20260627100945.5826-1-zhangcoder@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgD3nzkfzT9qCdkOAw--.16958S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF17KFy8AF47Cr4DXFy8uFg_yoW8uF4xpF
 4DKw15tw48G3W8KFnFg3W8XFy8Wa1kAFW3Wr47C3Wa9a45Zr9YkF18A34YgFWDWFy7tF18
 tF1UKF4UXFy3Cw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-Originating-IP: [116.149.202.60]
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiIQLlpmo-zSI18AAA3f
X-Mailman-Approved-At: Mon, 29 Jun 2026 07:07:55 +0000
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
X-Spamd-Result: default: False [1.19 / 15.00];
	DATE_IN_PAST(1.00)[41];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[yeah.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[yeah.net:s=s110527];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[yeah.net];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,web.de];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[igalia.com,lists.freedesktop.org,vger.kernel.org,yeah.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[yeah.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhangcoder@yeah.net,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F9686D6BE4

kfree() safely handles NULL pointers, so there is no need to check for
NULL before calling kfree().

Remove redundant NULL check.

Found by Coccinelle ifnullfree script.

Signed-off-by: Ziran Zhang <zhangcoder@yeah.net>
---

Changes in v3:
- Add parentheses to "kfree" in subject line for consistency.

 .../gpu/drm/amd/display/modules/power/power.c    | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/power/power.c b/drivers/gpu/drm/amd/display/modules/power/power.c
index 5659a38b3..97889867a 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power.c
@@ -270,13 +270,11 @@ struct mod_power *mod_power_create(struct dc *dc,
 fail_bad_brightness_range:
 fail_alloc_backlight_array:
 	for (inst = 0; inst < edp_num; inst++)
-		if (core_power->bl_prop[inst].backlight_lut)
-			kfree(core_power->bl_prop[inst].backlight_lut);
+		kfree(core_power->bl_prop[inst].backlight_lut);
 fail_construct:
-	for (i = 0; i < MOD_POWER_MAX_CONCURRENT_STREAMS; i++) {
-		if (core_power->map[i].psr_context)
-			kfree(core_power->map[i].psr_context);
-	}
+	for (i = 0; i < MOD_POWER_MAX_CONCURRENT_STREAMS; i++)
+		kfree(core_power->map[i].psr_context);
+
 	kfree(core_power->map);
 
 fail_alloc_map:
@@ -295,8 +293,7 @@ void mod_power_destroy(struct mod_power *mod_power)
 				MOD_POWER_TO_CORE(mod_power);
 
 		for (i = 0; i < MOD_POWER_MAX_CONCURRENT_STREAMS; i++)
-			if (core_power->map[i].psr_context)
-				kfree(core_power->map[i].psr_context);
+			kfree(core_power->map[i].psr_context);
 
 		for (i = 0; i < core_power->num_entities; i++)
 			if (core_power->map[i].stream)
@@ -305,8 +302,7 @@ void mod_power_destroy(struct mod_power *mod_power)
 		kfree(core_power->map);
 
 		for (i = 0; i < MAX_NUM_EDP; i++)
-			if (core_power->bl_prop[i].backlight_lut)
-				kfree(core_power->bl_prop[i].backlight_lut);
+			kfree(core_power->bl_prop[i].backlight_lut);
 
 		kfree(core_power);
 	}
-- 
2.43.0

