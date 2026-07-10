Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CuHlG/KcUGqv2QIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 09:19:14 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E108A737FC8
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 09:19:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=bn0Ti9II;
	dmarc=pass (policy=quarantine) header.from=qq.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FAE10E12A;
	Fri, 10 Jul 2026 07:19:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1447 seconds by postgrey-1.36 at gabe;
 Fri, 10 Jul 2026 01:55:58 UTC
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9445E10E10D
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 01:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1783648556; bh=5EOkqBZUqrb39d1Nm8dwkAhCq6ui/t2PEv4lF3ANjGY=;
 h=From:To:Cc:Subject:Date;
 b=bn0Ti9IItIKsHNd6yXuJUHYATo54raOXAM4pMwHWsrJYaAjn1x4LPw5+rWuZ6Za4h
 7El4lypqjUr89H4yhgV2hGiqRAq1GmbIstfjpxAS181aCJ94oROdwFbr1tQyC5SF+F
 pHxoAlrvdS0mokTXrO0/gb9jtbnkbx3Dz+3R22cU=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
 id 62218093; Fri, 10 Jul 2026 09:24:34 +0800
X-QQ-mid: xmsmtpt1783646674thp1vxobr
Message-ID: <tencent_C3A258C2204BBB82CD35C736076BFC07F806@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25Ge55ZC1eeD+B1t0ILvuY8k7EVBFtToFrl+v2/ZCUVMrc6eb8+Vc
 gUUkoOtn827NNxUw7XsviOjuB+bcARXGcZDzS/2YJ4jvg7jUk5W8vcyPJbtRav2AFfQvxdIQXVfQ
 yOwuM0rU2hhQpa8yzDJYvmcfezUynrSrKRrn3SdWi9DIKv9V4vn517tDEv1bgFM+gCGeByGwDcPN
 SqV4pQKa75bapLIo7Kviz5PpD7Roaz+UnxPjxXPUVj05vGYza7e2CxvVQ3z6e9AiDFGSZ2gE+IYZ
 M1eQwsDT+F6W3Eaxkbler3UA/h1DWP4h4EAT7N4Gjc/5Es3NLpqkY87cMfJ/xJLps0W+cZ0SC2R1
 Xn3EG42HXksQxttkOP2M4dDAhP5MwTQOI/qzb0zoy+SbVhO5mKgnSazEoHouEizGk2luuy7gs9QL
 ESQtGi1fgoZ0kX1wj67MUjDT4Vy1nzM4QJHU4eYmyFXe5NJzBObWb7/cqdutVBHDBmK86pk+vWgW
 MTZCgZdL9bqwwwnjz9iuy2L1oppkkDbLUIWoYcHw2/KT7UyefpnH66aUCBR8FLEMUlAstK00Nl0i
 9V5a3kDQ3jj5dEDC2ymVOoTICJ5EZcZlV/l7Em85OzfMSZzqerklY3Q7s313/1Gu3lM4axOTSxEs
 XBpjHcroXv4uRUNxKWo4QyXMA5U3kEzS7p/eB5/CkzXgi4q8O/vHYWViDtiq0HG1/tTAtRdBiUQ2
 RX46BJA+lA4SQd+TDQXBsdecj9ZY/9MmbKCQc4BIv3Dfy52P2NnLUUfjb+DKt65JYgY85jyuMzEs
 1I5YpMIh6XiybzdqBZ+BOAV8V+QmAk0UpFPU1zB6E2PR12sTApO17iOnRdCia9s3wrDI675Jnwqf
 qMrCkZeeyZ1tESYM6wbLM9459UN4Qv/1oOz8RDg4yyxy0YX/F5HrCeGpToYteb+7nB3EBleBhq3D
 1ePCc+uN4iOErhY5/ipnf+SWHJPB9vGe7txQbxpaPWu2YUp+LC6vFD37JE35c0SxPJy3f5ABHfma
 GfyZAcjDbXXtsF3wvcYjfiES7+542VzLK7E5egxGR1RaiNxD9LyT6L1xsaIRs=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: 2681643870@qq.com
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, oushixiong@kylinos.cn,
 yanglinlin <yanglinlin@kylinos.cn>
Subject: [PATCH] drm/amd/display: fix __udivdi3 link error
Date: Fri, 10 Jul 2026 09:24:23 +0800
X-OQ-MSGID: <20260710012423.61550-1-2681643870@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 10 Jul 2026 07:19:09 +0000
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:oushixiong@kylinos.cn,m:yanglinlin@kylinos.cn,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[2681643870@qq.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2681643870@qq.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qq.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,kylinos.cn:email,lists.freedesktop.org:from_smtp,qq.com:from_mime,qq.com:dkim,qq.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E108A737FC8

From: yanglinlin <yanglinlin@kylinos.cn>

When compiling the AMDGPU display driver for 32-bit architectures,
the linker reports undefined reference to `__udivdi3` in functions
get_dp_dto_frequency_100hz() and dcn401_get_dp_dto_frequency_100hz().

This is because the code uses 64-bit division (/) on 32-bit systems,
which GCC cannot handle directly and instead tries to call the missing
__udivdi3 helper function.

Replace the raw division with div_u64(), the kernel's standard 64-bit
division helper, to avoid the link error.

Signed-off-by: yanglinlin <yanglinlin@kylinos.cn>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
index 7c293917e6fd..9dfb6f132136 100644
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
@@ -1285,13 +1285,12 @@ static bool dcn401_get_dp_dto_frequency_100hz(const struct clock_source *clock_s
 		 *     - target pix_clk_hz = (DPDTO INTEGER * DPDTO MODULO + DPDTO PHASE)
 		 */
 		temp = (unsigned long long)dp_dto_integer * modulo_hz + phase_hz;
-
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
2.25.1

