Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ibnLOYjNN2rHUAcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 21 Jun 2026 13:39:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846C16AAA85
	for <lists+amd-gfx@lfdr.de>; Sun, 21 Jun 2026 13:39:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ispras.ru header.s=default header.b=ZYLfMU1y;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=ispras.ru
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F6F10E361;
	Sun, 21 Jun 2026 11:39:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 583 seconds by postgrey-1.36 at gabe;
 Sat, 20 Jun 2026 18:43:18 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD6B10E241;
 Sat, 20 Jun 2026 18:43:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [92.101.187.100])
 by mail.ispras.ru (Postfix) with ESMTPSA id 4009845F8512;
 Sat, 20 Jun 2026 18:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 4009845F8512
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1781980412;
 bh=qXy+NLcJzRFPRD8Y5EvNnkvkyS1foFBp4Z16GCRLFuA=;
 h=From:To:Cc:Subject:Date:From;
 b=ZYLfMU1yxgXtz6UdSasH6n/VwtMZ5zR7ykToYOv56mWONIWqCd4ejZH8MrgiY4fi8
 aY4rROaUx1xr44qif5pantaqAU4zuRHPOOJyVEU+fJvS5yJxPNqziR7rUyX7JhaQAr
 KgUIn93OpxUPrvePaDpVcnaXNH3fjm7VnRyX7GlA=
From: Alexey Velichayshiy <a.velichayshiy@ispras.ru>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Alexey Velichayshiy <a.velichayshiy@ispras.ru>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH] drm/radeon: Add NULL pointer check for enc_priv in
 atombios_set_encoder_crtc_source()
Date: Sat, 20 Jun 2026 21:31:45 +0300
Message-ID: <20260620183150.1248791-1-a.velichayshiy@ispras.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Jun 2026 11:39:50 +0000
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
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ispras.ru,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ispras.ru:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ispras.ru,amd.com,gmail.com,ffwll.ch,redhat.com,lists.freedesktop.org,vger.kernel.org,linuxtesting.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a.velichayshiy@ispras.ru,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ispras.ru:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,ispras.ru:dkim,ispras.ru:email,ispras.ru:mid,ispras.ru:from_mime,linuxtesting.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 846C16AAA85

The dig pointer for radeon_encoder->enc_priv is initialized in
radeon_add_atom_encoder(). An error during initialization may
leave radeon_encoder->enc_priv as NULL, leading to a NULL
pointer dereference in atombios_set_encoder_crtc_source().
Add a NULL pointer check for dig before dereferencing it,
returning early if it is NULL.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: f28cf33945cc ("drm/kms/radeon: pick digitial encoders smarter. (v3)")
Signed-off-by: Alexey Velichayshiy <a.velichayshiy@ispras.ru>
---
 drivers/gpu/drm/radeon/atombios_encoders.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index 5cfd8fcfa5e8..8b15c1e0d41f 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -1931,6 +1931,8 @@ atombios_set_encoder_crtc_source(struct drm_encoder *encoder)
 			case ENCODER_OBJECT_ID_INTERNAL_UNIPHY3:
 			case ENCODER_OBJECT_ID_INTERNAL_KLDSCP_LVTMA:
 				dig = radeon_encoder->enc_priv;
+				if (!dig)
+					return;
 				switch (dig->dig_encoder) {
 				case 0:
 					args.v2.ucEncoderID = ASIC_INT_DIG1_ENCODER_ID;
-- 
2.43.0

