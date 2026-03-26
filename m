Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Muh3Ecx6xmmxKwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:40:44 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A643445AE
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6370F10EE02;
	Fri, 27 Mar 2026 12:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fjHGcEFO";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1687E10EBED
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:55:45 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-7d750eeaec3so614881a34.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551344; x=1775156144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWuUyl3pJMGaRe5YpqoxGiWQwsY1kd47fne8B+3aeoU=;
 b=fjHGcEFOgLVsNaraPwck5y7Jp9PvsX8kFcuyCRrjSl4fGtB91AnzfOaP254y1rXMSC
 waKm6Dr+FC+G7mJwuCdo1ZwXumMDvZIxY9C4H8boWCbstVBwCoy9Klx7OmFFe7nlEDZI
 vLUCL8NpcRKQeqYaGYXN5KVFhR93M5plKF330v2fLNf1+xr708WWv1QehbIodALPCToI
 ovSdwup/S7hUKbNR6ZXXHTs+yy0JTDM2cLj5mgLOzNOk5+YV5/CjQjmvKaBksuiJ+Naw
 7rMm2zx0kQY5me8qbN/nOvqEoG4JlVnTmjS7JLSXv+8ZgA9utrzQZNXF1bRd9YscSUvi
 ezcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551344; x=1775156144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nWuUyl3pJMGaRe5YpqoxGiWQwsY1kd47fne8B+3aeoU=;
 b=KVBszyOSh+DFrjGFdPW3f72tKtf4JVVYb40aMCHUld6BzmpyZarYJ56ya9g4SJSeAh
 G51XE4TFjecPCDOgUAr+KfpDteqSO/EcZBUS0i0SZ4welXSIvCr4DkCqT+Kr2t8gnIx3
 fj2SL8mY4vEx4zCH982aq9Qe5Fz9c2H9QNd4zsi0dP+89FN/18QG4EyWR8MDXsH7L9er
 Yr4TQoVHI29S+HOezHs45q5KXDTlRrn/BfkGF78x0K510tYYQcDmJaQogDVdL7kG0wv2
 x9lYy01lsrBFbwCwwIozJtdOjLbZLj8gGkfXCueSliHvXUjIY/h9l7yYCihXChtdR5l9
 4UUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDCAzqD8HIhj3YyRW40CbnHNZ0ehXhw7Aj6uqir1NNa1Ha91N557Q+pWNxt8iThqHR0Au9vCxj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNO7BO0PcmmJzdws2MYpob5h2hLEucHekiQO3aTsCa3VRWrLj8
 dQOJ3DRhlSgf/1bEGTn3D2vC03usjN6usQNzd1rkYvD/LHE4DYp7TRR/
X-Gm-Gg: ATEYQzwUcz8R0Yd4YxM6gKmx4GiEYso9BTOHg/vj12Vb8GvJ2tf11grJFn4vyoeZRj6
 GSztBrzPpepM7PPeJGODUruPwedOJSMgwtDi6d9aty+qn0XOLBoJUbOPLzMx+SIM/3Hjp9S3yfO
 ZjqGr5tgUlPSIoXiIossdSqhLo9AvBKcHRmIr7N/tAcfbpbnNP1/kxDvkihND6luoOdJTblDpDA
 lakXksoAt+oeWc07Y1oWMKEbX83P3tMy1z3yoiAxejCyA32moTDqymg53jR1qRBmPWESiCzRKJT
 5+Y35CypZzDYyasG0XsISxTsODwy3KHATZJT5Ipv1ED1lxAzcs6UBsP3608DNvQ/7FXSGPRusoY
 80mWwo2PV8N66mSJ2BwP9EhRJwBjlAD0ja6AINaafpV/YfSMwIi5SMQCacvb6SnRWuyvVsq+eso
 bkFBT0K9APIZOMGD3VaLV/ctNECPDYX0NNeHfJRrEhiQ8rpNzH
X-Received: by 2002:a05:6820:2223:b0:67d:e140:3451 with SMTP id
 006d021491bc7-67dff3d219emr4887862eaf.11.1774551344312; 
 Thu, 26 Mar 2026 11:55:44 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:55:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, airlied@gmail.com, simona@ffwll.ch,
 jbaron@akamai.com, gregkh@linuxfoundation.org
Cc: jim.cromie@gmail.com, mripard@kernel.org, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH v12 47/69] drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
Date: Thu, 26 Mar 2026 12:53:51 -0600
Message-ID: <20260326185413.1205870-48-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326185413.1205870-1-jim.cromie@gmail.com>
References: <20260326185413.1205870-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 Mar 2026 12:40:00 +0000
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:jim.cromie@gmail.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:louis.chauvet@bootlin.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:dri-devel@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,ffwll.ch,akamai.com,linuxfoundation.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,suse.de,linux.intel.com,intel.com,amd.com,bootlin.com,linuxfoundation.org,suse.com,chromium.org,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E5A643445AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_crtc_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 5de9aaa5ba04..31c5294b252c 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -50,17 +50,7 @@
 
 #include "drm_crtc_helper_internal.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 /**
  * DOC: overview
-- 
2.53.0

