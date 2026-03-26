Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCNrDKt6xmnwKgUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:40:11 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08DC344509
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBC410EDC0;
	Fri, 27 Mar 2026 12:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZMkGPyal";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDDA10EBF0
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:55:49 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-40ee9b945d5so940657fac.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551349; x=1775156149; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6v3HiIDRukL8wqePVR5l3Bo2Gj7Iv9DgR3CyiTeT7DE=;
 b=ZMkGPyalke32jfwoc3i7uNz2Gb4x03y5A0A/4NUvd4qEd/w+Xcs/lw2QiPsBaHEZRU
 PiMFJ757QHujz2cHiVEf0fi2GwZ0pb4DgULx2fG8snpGk62w1R+GLy6oWm2yPiWgy4b7
 eyM3H8fND1ubd9uZmjDiwGEHpR4WdhPXQzJp7X4oAkV2Kyh2J4LfuE4eCcOALxh42Lcd
 6IBQj90k0/TObRrz/b22rs4xTHG+9NUb8tM7s0XI0vOqurdaBrxY9+Zj0Rm5s+RG6Ldq
 OQewAhcQgPYSpvjo1xc2NPtqL3/u+k07pKLWN3Dq19qm21kbpbeRulikonSVppnA4Ug6
 5IZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551349; x=1775156149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6v3HiIDRukL8wqePVR5l3Bo2Gj7Iv9DgR3CyiTeT7DE=;
 b=TMsWoxvLsCwhzHurwpNuDRo9dvVIiDENrT5SOxg+dso6utNecp8mDGXdhakbSwYFfP
 t4zS+nwgw2X6XN11dvMEPxK3lGVK1+4EqZC9Fk58xvHHtz+1i079MW/TTORRDsG1/qUj
 6v2r8Kk+jp6wGwGr8StyZVLMBx0VVQrXVDNvrw2bJdEvEJInsPmXqcnn3eRyyOHHIH2x
 VSdQ+KLGcz51A2IxfvauSISoZ0oApWDmcqGVuSKvKBFHhQlviQ0HJLjNhXk2FzcJNeSS
 sB1CrX6odUabT7fRgpflnIPqotR5j769osf2y2vtbR8bhAaRPNNRoMBjqOFlvh6lagJQ
 ujYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlatm5AAE837x+GmpFSNqzxaJ3Rwx3tpK6dl1d2D5+Jyas6eRzW+gDyT4+LdXGMdsY98I//GP6@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw73f4OQWAB/9NIKQRkIBAUKWWrIUj/pUtzEsGtRC0Nm/Rc+AV
 o6QavfXz00dcV5g/LbfK7WXDbcVHeGoHJTvz3+zHSaB7xB1bJTNbDpreqGm2MA==
X-Gm-Gg: ATEYQzxP8vN7j+2koSHEsaSJ8prX4l9bOy5iQgYxvlcPsRanwONWRM5JJXE+NvLe8Ax
 XwwoMkEZGhpeboTW/dE6uMRaaYCNw8Kln1uV7cqZaTo84GA7QqqRTYuK9KZminWDtNMnEEaW6Xk
 XYq2Zxo59QW7HG2NQ3q0DoRrfSrh89P8igUSXwRkWZ1l8/z+kyS+qwvRNeMplf/qznThXY90LdW
 8nkRdFLu7Hqn7DssbZKRwafkyr7Ol1x9z/sYkEL6UThbQI1cAp2rX02mCF5xSReNlUH49owOcpA
 ktnzhWk3VUMLaCKCDzhH5GIRnf6dBnqre9guGDQDkYhOKbFnCRIYgAisw4eekCie0rTaFRmDXrS
 da2/H8kOYYNwC+yjvBoxp48Jm5wm/TKTYb9QtvJB+6A6aUt/UsZW063GCvDStMm50IUhzzlUVlo
 kw8EDYiTK3XuAU2pzF/e0W8K0HfdSI31D1Sv4Bo2e/pUxE7F/HQlKppLOIpLY=
X-Received: by 2002:a05:6870:2f12:b0:417:a36a:6074 with SMTP id
 586e51a60fabf-41ca71894d8mr4456214fac.51.1774551348686; 
 Thu, 26 Mar 2026 11:55:48 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:55:48 -0700 (PDT)
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
Subject: [PATCH v12 50/69] drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
Date: Thu, 26 Mar 2026 12:53:54 -0600
Message-ID: <20260326185413.1205870-51-jim.cromie@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D08DC344509
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Invoke DRM_CLASSMAP_USE from xe_drm_client.c.  When built with
CONFIG_DRM_USE_DYNAMIC_DEBUG=y, this tells dydnbg that Xe has
drm.debug callsites.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 84b66147bf49..3af476f0449f 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -21,6 +21,8 @@
 #include "xe_pm.h"
 #include "xe_trace.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /**
  * DOC: DRM Client usage stats
  *
-- 
2.53.0

