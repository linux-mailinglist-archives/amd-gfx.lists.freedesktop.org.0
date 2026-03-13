Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGu4LqFAtGlljgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:45 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BC028783D
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789E710ECB0;
	Fri, 13 Mar 2026 16:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="miC9CbxZ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6345F10EC1B
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:52 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-4671cbce465so1104548b6e.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408291; x=1774013091; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTjuYz8WFf0eQNRg6nVDQpGTB8XKqFnwBf6Q0eE+UZs=;
 b=miC9CbxZA3Q2OVb7/3qLrlGvVdfoLr0E9PEeQcJfx5QYJTRR3/RQNUCoKee6T3a0qZ
 qAmjKIMk6XVo264IMUjBdn1NDFI1DlyUMK9fgPQCW3YlS0md4ZQIo+DqiQBowZL9CVKc
 jxopzN9BGdKhGevF5YZ0jOaXbfo90qQqGm1VpaxpsSR6IpCGiG/84PJt7vwlZaqHX8yZ
 KMpLU5hPOSaj13+1sk+9Tq6pZhGIU9vV52Tndh7oUL2/lWTdpNe5C/GsO1YPlmCA6dpD
 ZUnyGLyYJN7rop6lgwdg9K7qzGvdLs6zrEpd78WEndLO2dEDtzw5OIgJFSAI23XxnHKu
 QkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408291; x=1774013091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hTjuYz8WFf0eQNRg6nVDQpGTB8XKqFnwBf6Q0eE+UZs=;
 b=BTyj2y+LQyUZMX61hZpP4kPR8B1xKtpPkwHOpGp9hiJVnFO+QqmBGCFnjgB9yE6nX8
 YhW36K+lhhX1IT1O60Z4NzfGToddgnuBS1exeNuY9GLaqhz7VEQ0+t4jS1gTAV0R/Kdg
 pImU+cDcqlbS/S3ysGeU0ilzgS/MRnF9FRjOSQUe1w9WOd5GeKJDvR86b/9M8GgXGo2P
 eJ5cd5eNAKJsFM8R4IZNroytebkCd/sKh+Fsbd4eitzaJokWcTIYY5vmbvAhMOJsF9j/
 eNjZ1P6I1iFHVC5RkDPvw2kYZx9rbkDYS19/5isSKOFt/AC3MxgT0lc1tRS46kg+S828
 dbGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3CjfhFeFj/YTl17n2ZS6kDPlApCw+VGRjEFYDiaebAYuCC3F9sdkphac8RIB42BRy9hYEC2MM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyH2owo5ZZZjet8PgiQZfcTrcaGgYD4Aj9Vpdh5kwHoRJtv2pLW
 N/VpB2a0g7GGiuFr67p861atIDHD5ZdBkPKXHANUhgGPjZhTRLpigmpi
X-Gm-Gg: ATEYQzwUpRFVz/mw96+IL6LPMB+05/xWy8Us4W533nzVuZt5+/2AntjBzrbBagHqKXU
 FddSFeaOTstZXeYCB9ezmb7SCaygt2XPg+oFIcfkCk80ss6i9sHRjR2Tyhc0StWhpWcyTj7+cb9
 jiTo4MfRljXB4SHZOisJMHHPtrLX/2YeXNEremj29zxId1RAScFtuyEcAh+uJyk6rSHavqdeQNH
 M/wMNi5n6BoRYCHgssy1KoHuGlwkXsUpVO48guEwMZpuNT39ZQRKz/wb5KcjeFlhGueRDjM85Co
 9h4lfex0hR4hmOhRIR4pfQUvEut2wBO6xl1bnc36jAeJ0D1UkzCHL1P7pv7q6j0yqhoY+hUHBWe
 O6gTcxQuD1a/80Q25HEs3J3Y3vm+PKm/XVYjih9/TMg5+QdpMTLft/X0uxpchnsUy75z+kC5hfi
 nYBaDxD0tVFprOBqNyhEGJy68z3qefuv8QpW+fEvWtr/3IAk6XwWcS0IeoEJA=
X-Received: by 2002:a05:6808:3447:b0:466:f6ee:5bce with SMTP id
 5614622812f47-4675763031bmr1507247b6e.56.1773408291458; 
 Fri, 13 Mar 2026 06:24:51 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 55/65] drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
Date: Fri, 13 Mar 2026 07:20:20 -0600
Message-ID: <20260313132103.2529746-56-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313132103.2529746-1-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Mar 2026 16:51:10 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:rubenru09@aol.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jim.cromie@gmail.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:louis.chauvet@bootlin.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:intel-gfx@lists.freedesktop.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,akamai.com,linuxfoundation.org,aol.com,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,linux.intel.com,amd.com,bootlin.com,linuxfoundation.org,suse.com,chromium.org,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 40BC028783D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The gud driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index d0122d477610..cf2692d89bc5 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -32,6 +32,8 @@
 
 #include "gud_internal.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /* Only used internally */
 static const struct drm_format_info gud_drm_format_r1 = {
 	.format = GUD_DRM_FORMAT_R1,
-- 
2.53.0

