Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBhgBsXd6WmNlwIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Apr 2026 10:52:21 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD16944ECBB
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Apr 2026 10:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1379310EFF4;
	Thu, 23 Apr 2026 08:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PGx1MrPg";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com
 [74.125.224.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84CB10E11A
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 Apr 2026 07:09:27 +0000 (UTC)
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-65492d097acso207379d50.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 Apr 2026 00:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776928167; x=1777532967; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+G5xDeM2eEmKTciid+jelsafennvBZ1THzAZAjB59Gk=;
 b=PGx1MrPgdVRDIecpo16TdPSHyFVo/7Zobq2bipHeGPIeweC26NfHoGKDt5twpviXrY
 h2TiUhca/z8Bm6CcUALCDXznxdYGfcCveY89/4P0pmu9rb3Y1y7FQETgzH+LKYc2pKUN
 okvdwEcAAMNLOqGzFHuj5ygH3XJGmekpBl3xK/+YM2D7ZVCXr4hNKsZFk+LCrjFVN993
 +8MR+kJdiuamWTTzSW8k6UJJqlirnYUTzRplo0uJut9STpxujL75Ua7t9A8fVOoR15Sv
 XyoiyhrcOsh5Q1u52Pk6HRD+Pv5fjM8rkB4jK1aW9Sr4kGHtC6baliwM6qo2y4A9lM/6
 wlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776928167; x=1777532967;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+G5xDeM2eEmKTciid+jelsafennvBZ1THzAZAjB59Gk=;
 b=tGsKNs8EsrT+ve/l9Evd6/biGmwuIjIi/wy4KkfN66BVpfs3zMmXYIuhqZjX8uiG2a
 c//fXo1n+yw8gant2zKIRHHgSVfMqLbPhQ/yAL4MhKaxdHn9tSo3Z0yI4YUTHEQpBWnK
 2Op5q8acj+2ty0E3ZTJywQquKjk69VzL5WqMrszFFk7niwCEsQbDozWxsJNGVPh5qXRh
 qPKWnpcUEfdtmGp8TDBBFtPfkLSdsvKCKywGGLM1h/6+jB3Qkdgtf9yxAwviyALQeoPq
 M1coensBlL6boigleZMDmrDtrTvtNOD3h24E+o8/jAZHjqdiP5xSicNoKwIT2zpqCT5L
 OZPA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8JTwjW70pYntoP7QEMXGEKfkxOCzlO7oVas/FxFgXqEO9xVjTGZ/yipDsBGVl/orufyBci+l6/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzThLJfwelDacIetIYP8oiiVeYuTGfY2xpXGNdIDpuS/ByjFJre
 MEy4cC/OcomNLUKFEi5t+aZvIB4PHIfAQv5fLubS7QjEvGmuVgzdvGEq
X-Gm-Gg: AeBDieumb5w0FnJ2BcKDUXgsD8ueiEsqGqHIKbGJJkzR8E1SFm6ktuJd0M09Rf3hlD/
 Pv0sk64gFg+IPmh6NXYTqxzAG4/NK9nhwllVBAMLrWtK501dkPdnGay95KnQyClRwPm4ARMZOGV
 H8K3bMGm6Apyyc64COpV9n90iKk9SkknVEo2F7K3YfFqOad6ExhtFfTwSvEGjDoQ3t2dS/LTXr6
 JhSI5bE2r/Yoo4Hi64asTTCPghEl+GDL3F9LEdQvdlXavqta0IKXucZpQRcNGFP+sXitTUAzlcF
 kjzHHZQa6nuGh2sW/wf29U5LqLO0zo3KjjbcavukdPviY/he5BwsK48zBjoQyvEZmbITSFaZUSq
 bwMb84CTwBS/aqym4OSt2Cd8x9xfaf+SBFmktsEAnATaWRn6GmYpwVvXI7Nymfmh+1gN8tIMLlm
 mlMjLlZx9/Q3U4HJsugCr8act0vgtr
X-Received: by 2002:a05:690e:4850:b0:649:e871:3eb7 with SMTP id
 956f58d0204a3-65310b03ee5mr15847316d50.57.1776928166757; 
 Thu, 23 Apr 2026 00:09:26 -0700 (PDT)
Received: from localhost ([172.216.252.33]) by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-65314e328d6sm8799738d50.11.2026.04.23.00.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 00:09:26 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:09:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chenyu Chen <chen-yu.chen@amd.com>, Ray Wu <ray.wu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: Clean up allocation in
 initialize_backlight_caps()
Message-ID: <aenFoICS1syeOPEm@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Mailman-Approved-At: Thu, 23 Apr 2026 08:52:16 +0000
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
X-Spamd-Result: default: False [-1.30 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:chen-yu.chen@amd.com,m:ray.wu@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[error27@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: BD16944ECBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Just a small cleanup:
1) Remove unnecessary initialization.
2) Use the new kzalloc_obj() macro.
3) Reformat the NULL check to make checkpatch happy.
4) Remove the unnecessary NULL check before kfree() since the pointer
   is not NULL and anyway kfree() accepts NULL pointers.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/amd/display/modules/power/power.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/power/power.c b/drivers/gpu/drm/amd/display/modules/power/power.c
index 6c73fecf57d5..68b5b3b967be 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power.c
@@ -470,7 +470,7 @@ static bool validate_ext_backlight_caps(
 static void initialize_backlight_caps(struct core_power *core_power, unsigned int inst)
 {
 	unsigned int i;
-	struct dm_acpi_atif_backlight_caps *ext_backlight_caps = NULL;
+	struct dm_acpi_atif_backlight_caps *ext_backlight_caps;
 	bool custom_curve_present = false;
 	unsigned int num_levels = 0;
 	struct dc *dc = NULL;
@@ -486,11 +486,8 @@ static void initialize_backlight_caps(struct core_power *core_power, unsigned in
 	/* Allocate memory for ATIF output
 	 * (do not want to use 256 bytes on the stack)
 	 */
-	ext_backlight_caps = (struct dm_acpi_atif_backlight_caps *)
-		(kzalloc(sizeof(struct dm_acpi_atif_backlight_caps),
-				GFP_KERNEL));
-
-	if (ext_backlight_caps == NULL)
+	ext_backlight_caps = kzalloc_obj(*ext_backlight_caps);
+	if (!ext_backlight_caps)
 		return;
 
 	/* Retrieve ACPI extended brightness caps */
@@ -611,8 +608,7 @@ static void initialize_backlight_caps(struct core_power *core_power, unsigned in
 		}
 	}
 
-	if (ext_backlight_caps != NULL)
-		kfree(ext_backlight_caps);
+	kfree(ext_backlight_caps);
 
 	/* Successfully initialized */
 	core_power->bl_prop[inst].backlight_caps_valid = true;
-- 
2.53.0

