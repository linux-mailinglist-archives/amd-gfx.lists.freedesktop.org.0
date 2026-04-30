Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF0QLCVS9GmKAgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 01 May 2026 09:11:33 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286054AACF5
	for <lists+amd-gfx@lfdr.de>; Fri, 01 May 2026 09:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC71510E4FB;
	Fri,  1 May 2026 07:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex.ru header.i=@yandex.ru header.b="SyR31FxA";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from forward103b.mail.yandex.net (forward103b.mail.yandex.net
 [178.154.239.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B1A10E131;
 Thu, 30 Apr 2026 10:47:08 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c23:1ba8:0:640:1638:0])
 by forward103b.mail.yandex.net (Yandex) with ESMTPS id 3A5B4C00A6;
 Thu, 30 Apr 2026 13:47:06 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net (smtp)
 with ESMTPSA id jkYvs17QISw0-3jKAYhKh; 
 Thu, 30 Apr 2026 13:47:05 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1777546025; bh=XK8fhHHhN8C7AZWTsdc+3Jx084S2B5DKpyixkH26TpE=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=SyR31FxAyv/4EHWsum+z02yw7yCr13aMdUa9TPXrbuHbygNGTdp6QrzMqTd8we5Mu
 SUe4CaILLmNu7I6IUPW0A27wzCxLK6xVASWklcIoiZOOk0HbER7JBLO/Nbmiw2isFI
 RKWYA3FObdjqE/vUnnJIo+edKMFKc72ATemCjjeE=
Authentication-Results: mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net;
 dkim=pass header.i=@yandex.ru
From: Evgenii Burenchev <evg28bur@yandex.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Evgenii Burenchev <evg28bur@yandex.ru>, kernel test robot <lkp@intel.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon/rs780: prevent division by zero in refresh rate
 calculation
Date: Thu, 30 Apr 2026 13:46:25 +0300
Message-ID: <20260430104626.16230-1-evg28bur@yandex.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 01 May 2026 07:11:26 +0000
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
X-Rspamd-Queue-Id: 286054AACF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[yandex.ru,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[yandex.ru:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[yandex.ru,intel.com,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FREEMAIL_FROM(0.00)[yandex.ru];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[yandex.ru:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[evg28bur@yandex.ru,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]

drm_mode_vrefresh() may return zero when mode clock is zero even if
htotal and vtotal are non-zero. Current code checks only htotal and
vtotal, allowing refresh_rate to become zero and subsequently causing
division by zero in rs780_program_at().

Fix by adding mode clock validation and fallback to default 60Hz in
rs780_get_pm_mode_parameters(). Add WARN_ON in rs780_program_at() to
catch such cases during development, ensuring safe fallback in all
scenarios.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604300508.yXci8rey-lkp@intel.com/

Signed-off-by: Evgenii Burenchev <evg28bur@yandex.ru>
---
 drivers/gpu/drm/radeon/rs780_dpm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/rs780_dpm.c b/drivers/gpu/drm/radeon/rs780_dpm.c
index 64bb4cafb8b5..8713f3fd6268 100644
--- a/drivers/gpu/drm/radeon/rs780_dpm.c
+++ b/drivers/gpu/drm/radeon/rs780_dpm.c
@@ -63,8 +63,11 @@ static void rs780_get_pm_mode_parameters(struct radeon_device *rdev)
 		if (crtc && crtc->enabled) {
 			radeon_crtc = to_radeon_crtc(crtc);
 			pi->crtc_id = radeon_crtc->crtc_id;
-			if (crtc->mode.htotal && crtc->mode.vtotal)
+			if (crtc->mode.htotal && crtc->mode.vtotal) {
 				pi->refresh_rate = drm_mode_vrefresh(&crtc->mode);
+				if (pi->refresh_rate == 0)
+					pi->refresh_rate = 60;
+			}
 			break;
 		}
 	}
@@ -363,6 +366,8 @@ static void rs780_program_at(struct radeon_device *rdev)
 {
 	struct igp_power_info *pi = rs780_get_pi(rdev);
 
+	WARN_ON(pi->refresh_rate == 0);
+
 	WREG32(FVTHROT_TARGET_REG, 30000000 / pi->refresh_rate);
 	WREG32(FVTHROT_CB1, 1000000 * 5 / pi->refresh_rate);
 	WREG32(FVTHROT_CB2, 1000000 * 10 / pi->refresh_rate);

base-commit: a5640267d6d35b89ebe6418da90a952a247215a5
-- 
2.43.0

