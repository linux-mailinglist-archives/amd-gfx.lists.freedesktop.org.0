Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KMjHTHjBmrVogIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 15 May 2026 11:11:13 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4812154C1BE
	for <lists+amd-gfx@lfdr.de>; Fri, 15 May 2026 11:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC58D10F4AA;
	Fri, 15 May 2026 09:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V+arvoFP";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6028C10F4AA;
 Fri, 15 May 2026 09:11:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 24DDB419F0;
 Fri, 15 May 2026 09:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86632C2BCB0;
 Fri, 15 May 2026 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778836270;
 bh=h6wPzr4wnwGKqTUyJYMkReLJPI/jZqHAvOssNtJ63fo=;
 h=From:To:Cc:Subject:Date:From;
 b=V+arvoFPmuYK8J3wE/whgApnk2q9+ZDDsT3v0oI9YkJKHTR7Vrvfj1SWcXcqkknDB
 S/imkJHjbOM8J/VP/bJ04sB8lTiUB4baBXrObxhnGWZEz0MyG+Dqo5Zwul0/k1lQDs
 FoNYTS6MMb8Cvtk/XXob+Okd7wEiydcsJ0JpsTmTIstQxEzozyFR5/lmuX4khFGgko
 TwTLAK0IJf4zAGunY6JlSOUvgPYHa51/xXXXbk1yzKfHT3Cw46qDAdvm7up9YRupx1
 e7O7FSkmLFodObDDjOvT5SZ08iQeVP6xcmJH5H4XgMm3P+sH7EPmweLDAhc0Po3nZT
 ODk56nN9ngjcA==
From: Arnd Bergmann <arnd@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Jerome Glisse <jglisse@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chris Down <chris@chrisdown.name>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon: avoid printing NULL strings
Date: Fri, 15 May 2026 11:10:26 +0200
Message-Id: <20260515091054.529610-1-arnd@kernel.org>
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
X-Rspamd-Queue-Id: 4812154C1BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,redhat.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

gcc-10 warns about some printf format strings that are used to
unconditionally print a NULL string pointer from some call
sites:

In function 'evergreen_surface_check',
    inlined from 'evergreen_cs_track_validate_stencil' at drivers/gpu/drm/radeon/evergreen_cs.c:592:6,
    inlined from 'evergreen_cs_track_check' at drivers/gpu/drm/radeon/evergreen_cs.c:995:8:
include/linux/dev_printk.h:156:24: error: '%s' directive argument is null [-Werror=format-overflow=]
  156 |  dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)

This is harmless here because the kernel prints them as "(null)", but
still breaks the build when compiling with -Werror.

Pass empty strings instead to avoid these warnings.

Fixes: 285484e2d55e ("drm/radeon: add support for evergreen/ni tiling informations v11")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/radeon/evergreen_cs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/radeon/evergreen_cs.c
index daaeae6ba141..550e8f35c7d2 100644
--- a/drivers/gpu/drm/radeon/evergreen_cs.c
+++ b/drivers/gpu/drm/radeon/evergreen_cs.c
@@ -589,7 +589,7 @@ static int evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
 		return r;
 	}
 
-	r = evergreen_surface_check(p, &surf, NULL);
+	r = evergreen_surface_check(p, &surf, "");
 	if (r) {
 		/* old userspace doesn't compute proper depth/stencil alignment
 		 * check that alignment against a bigger byte per elements and
@@ -818,7 +818,7 @@ static int evergreen_cs_track_validate_texture(struct radeon_cs_parser *p,
 	}
 
 	/* align height */
-	evergreen_surface_check(p, &surf, NULL);
+	evergreen_surface_check(p, &surf, "");
 	surf.nby = ALIGN(surf.nby, surf.halign);
 
 	r = evergreen_surface_check(p, &surf, "texture");
@@ -881,7 +881,7 @@ static int evergreen_cs_track_validate_texture(struct radeon_cs_parser *p,
 				surf.mode = ARRAY_1D_TILED_THIN1;
 			}
 			/* recompute alignment */
-			evergreen_surface_check(p, &surf, NULL);
+			evergreen_surface_check(p, &surf, "");
 			break;
 		case ARRAY_LINEAR_GENERAL:
 		case ARRAY_LINEAR_ALIGNED:
-- 
2.39.5

