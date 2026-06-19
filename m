Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ePujI378NGrhlgYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 10:23:26 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550346A4946
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 10:23:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gtGQWgwZ;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB3F10E070;
	Fri, 19 Jun 2026 08:23:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4B910E066;
 Fri, 19 Jun 2026 08:23:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A87CD601E1;
 Fri, 19 Jun 2026 08:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986E11F000E9;
 Fri, 19 Jun 2026 08:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781857399;
 bh=L+9P1pLYmNIkJ1qDNJR3+PK+oN8UiZ+jU581/+pOwrM=;
 h=From:To:Cc:Subject:Date;
 b=gtGQWgwZQiXovLYg9u1Ev+CvpykmnKbyZqUL8wZXYW0d+IbRw6y5K29cYb7XBKlDm
 ztdBiDLc7gOj7EaQhGfQ9Wf4cduVHRVZpQJUKERRgi+hvN0fWR3i7UWemXKwTA3eF7
 kw5E68WpJ0PUAR1s1UaY3UNRDpae4mNiG8dOqv6CJHdClXl7BbhrJc9f7aVAknVe4e
 +VItHqBDNvSlGp1gYy6byvXtd64D18q5vS+TG1qDzTH1RVLqfJH7sMsqSEHnsnsH1T
 dH+exfg/CqpLr8Y+1IOjY/QD9vbaVt10Qc/D4OSS31oFr6/HbImOaRuUFgqp+CIdfg
 gIkf0LFJIjGUw==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ovidiu Bunea <ovidiu.bunea@amd.com>, Ray Wu <ray.wu@amd.com>,
 Leo Chen <leo.chen@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rodrigo Siqueira <siqueira@igalia.com>,
 Gaghik Khachatrian <gaghik.khachatrian@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 Chuanyu Tseng <chuanyu.tseng@amd.com>,
 Linus Probert <linus.probert@gmail.com>, Kees Cook <kees@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: avoid 64-bit division
Date: Fri, 19 Jun 2026 10:23:00 +0200
Message-Id: <20260619082313.3583603-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,igalia.com,amd.com,gmail.com,kernel.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 550346A4946

From: Arnd Bergmann <arnd@arndb.de>

64-bit division is costly on 32-bit targets and should be avoided:

x86_64-linux-ld: drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.o: in function `get_dp_dto_frequency_100hz':
dce_clock_source.c:(.text+0x407): undefined reference to `__udivdi3'
x86_64-linux-ld: drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.o: in function `dcn401_get_dp_dto_frequency_100hz':
dce_clock_source.c:(.text+0x8b8): undefined reference to `__udivdi3'

Replace the open-coded division with a div_u64() call where necessary.
This could be done in a more clever way using mul_u64_u32_shr()
or similar, but since this is called rarely, use the most readable
variant that works.

Fixes: 6f6483dbfacd ("drm/amd/display: Update get_pixel_clk_frequency() for DCN4x DCCG DP DTO")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
index 7c293917e6fd..501ab1a3bac2 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
@@ -1229,9 +1229,9 @@ static bool get_dp_dto_frequency_100hz(
 			 */
 			modulo_hz = REG_READ(MODULO[inst]);
 			if (modulo_hz) {
-				temp = div_u64((uint64_t)clock_hz * dp_dto_ref_khz * 10, modulo_hz);
-				ASSERT(temp / 100 <= 0xFFFFFFFFUL);
-				*pixel_clk_100hz = (unsigned int)(temp / 100);
+				temp = clock_hz * dp_dto_ref_khz * 10;
+				ASSERT(temp <= INT_MAX * modulo_hz * 100);
+				*pixel_clk_100hz = div_u64(temp, modulo_hz * 100);
 			} else
 				*pixel_clk_100hz = 0;
 		} else {
@@ -1286,12 +1286,12 @@ static bool dcn401_get_dp_dto_frequency_100hz(const struct clock_source *clock_s
 		 */
 		temp = (unsigned long long)dp_dto_integer * modulo_hz + phase_hz;
 
-		if (temp / 100 > 0xFFFFFFFFUL) {
+		if (temp > (UINT_MAX * 100ULL)) {
 			/* pixel rate 100hz should never be this high, if it is, throw an assert and return 0  */
 			BREAK_TO_DEBUGGER();
 			*pixel_clk_100hz = 0;
 		} else {
-			*pixel_clk_100hz = (unsigned int)(temp / 100);
+			*pixel_clk_100hz = div_u64(temp, 100);
 		}
 
 		return true;
-- 
2.39.5

