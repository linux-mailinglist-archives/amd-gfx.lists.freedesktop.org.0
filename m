Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RaQLAOAZQmri0AkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 09:08:16 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C288F6D6C2D
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 09:08:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yeah.net header.s=s110527 header.b=AH7r4MkT;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=yeah.net
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E13810E717;
	Mon, 29 Jun 2026 07:08:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 623 seconds by postgrey-1.36 at gabe;
 Sat, 27 Jun 2026 09:40:51 UTC
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690D210E489;
 Sat, 27 Jun 2026 09:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=C8
 lZKwGDt2f7adfxqjwjv6Pu205yOu85uuRaLpr0plU=; b=AH7r4MkTjx9B/YfpkH
 IaFn+WBB2AP4ofOm9ApJtcBXwAw8ccoKBgyuyoSsgqRthrwOUkTXu/qIVJdNmQtt
 WtXcZdPbP3y+SQiPpE11ddRuAswagu5PTFqFjXBjd4YA3F/BRvmjBNQ6LGFUkndm
 INgvyNOsbBpaiByRlRCM9ux2o=
Received: from zhang.. (unknown [])
 by gzsmtp2 (Coremail) with UTF8SMTPSA id Ms8vCgD3v1GMlz9qZpppAA--.53477S4;
 Sat, 27 Jun 2026 17:27:42 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Rodrigo Siqueira <siqueira@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ziran Zhang <zhangcoder@yeah.net>
Subject: [PATCH] drm/amd/display: Remove redundant NULL check before kfree in
 mod_power_create()
Date: Sat, 27 Jun 2026 17:26:12 +0800
Message-ID: <20260627092612.5282-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Ms8vCgD3v1GMlz9qZpppAA--.53477S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF13Ww1rZw1rWFyDZryfXrb_yoW8Zry7pF
 4DKw15tw48G3W8KFnFg3W8XFy8Wa1kAFW3ur4UC3Wa9343Zr9YkF18A34YgFWDWFy7tF17
 tF1UKF4UXFyakw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-Originating-IP: [116.149.202.60]
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiNg9zNGo-l4-U3wAA34
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
	DATE_IN_PAST(1.00)[45];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[yeah.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[yeah.net:s=s110527];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_XOIP(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_FROM(0.00)[yeah.net];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[igalia.com,lists.freedesktop.org,vger.kernel.org,yeah.net];
	FROM_NEQ_ENVFROM(0.00)[zhangcoder@yeah.net,amd-gfx-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[yeah.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,yeah.net:dkim,yeah.net:email,yeah.net:mid,yeah.net:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C288F6D6C2D

kfree() safely handles NULL pointers, so there is no need to check for
NULL before calling kfree().

Remove redundant NULL check.

Found by Coccinelle ifnullfree script.

Signed-off-by: Ziran Zhang <zhangcoder@yeah.net>
---
 drivers/gpu/drm/amd/display/modules/power/power.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/power/power.c b/drivers/gpu/drm/amd/display/modules/power/power.c
index 5659a38b3..74d5530de 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power.c
@@ -270,12 +270,10 @@ struct mod_power *mod_power_create(struct dc *dc,
 fail_bad_brightness_range:
 fail_alloc_backlight_array:
 	for (inst = 0; inst < edp_num; inst++)
-		if (core_power->bl_prop[inst].backlight_lut)
-			kfree(core_power->bl_prop[inst].backlight_lut);
+		kfree(core_power->bl_prop[inst].backlight_lut);
 fail_construct:
 	for (i = 0; i < MOD_POWER_MAX_CONCURRENT_STREAMS; i++) {
-		if (core_power->map[i].psr_context)
-			kfree(core_power->map[i].psr_context);
+		kfree(core_power->map[i].psr_context);
 	}
 	kfree(core_power->map);
 
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

