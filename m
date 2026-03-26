Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKJ5Awx7xmnwKgUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:41:48 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609343446C5
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA8B10EE1A;
	Fri, 27 Mar 2026 12:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RxrCJHfc";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DEC10EBF0
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:56:00 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-7d7f09aa39fso1545978a34.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551360; x=1775156160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ApYYz6FzGjXUWRVflTKhpBjuKsTkjzi7xxuPDPmj4w=;
 b=RxrCJHfcGn7BTsDUpIIySWAU9b/wzhkFqhtxEDboJ++uqFFv8WNQCwi2NOsTZYa5Uw
 3e0laRaGDl14DKPrxFmaTUTWNXV7pJOZz3OPgZ2gW2xeO7d1+Gz0Np0YtZueNim0z951
 ggFPCMhQdV3Ik2y01HPHSIIJfk4h0JdAqQGRDGZY3g0mM1UvG09g6FZPGgO7Dz3+d4sJ
 d3APVQcUTTJfszYBpSJ4/lJe1gHEd5Kc86d+hZOY8EfiRyetQDlWSSyOKKFbxdNCU5nz
 bfXdp6pqw7o7wsq0bxuZ14Df/2Gl4H1ZIEzKVxcvuryEtWLN5/DDCQ6LmvIa5OwKzUw3
 BwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551360; x=1775156160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0ApYYz6FzGjXUWRVflTKhpBjuKsTkjzi7xxuPDPmj4w=;
 b=cedtuow5iJkdZWuGfRvfykERXhvdmyzswYJiygS3E11haCH0dgzQBBY6AhCgZaf/sW
 Upd4AdsFMlylrPO3aabV7Pf7HU/S1CvZbHPE5MFijKsq7sxCcYgeQeUmI9P6HscYmtJm
 JxY4MiVZxa0LFBjRCx896Mw/5rQOMkI2k1i2k9zc2GcGd5ibLuK1qfUEdyFMNRXmfVys
 GL160O/trsbSqUG8E9APmpQCnx/wL3QulHj6wld6Vox3B5omvsOqWbGnwIjT24D0LTd0
 EkgJ/6SEiMqsepJRs5UCGmwbx3cKQ8e3lFyyU2aQWkmLZCtNaJOaVO6hYbmGkCluOSqc
 HUOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtmnMCdAjK0Jj89RWoS+jZGgR6ivtaSpsCyUkciv0g5SF1QXDpRFKj/otNOVYMvuob3B7qg63m@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxC3lbFdEPWwotniWoljQCaReXuGm1qPbYLHvdLjH1tTOKURmjN
 GQX0gI+Yzn33r3Phj1pbQZj2qVF5C/18sW2/N5lXY3/iOFI+4mBe2OG5
X-Gm-Gg: ATEYQzxAgP5drmfI6n0trha9CnJmSPefCCgkicBpiPl48wIilmQbISnyiCygsZVdVWB
 EV6YsY3ZOYiADW5FnkynUQ5OO0A7+6hV7fVQ3ZsStR//tuxxNDKxNb6oO3HZFyQZjhL41bpNorV
 3esTvFlb0POeDYgAK+QWUmWTGPTCInYlWwqDLeHHF1weoaSozbEvY4D8Jtfb0oo2FcdQE+7Sw91
 HRNDbIKPggDmQ8snzWxeukO4Esw77kSYTch5zfXYssir46yNTynkMCVcLOHhze1heaIQ8YZY03c
 2V2fPoeG0ECspN4vYprYT/zhCFgNXiW+RvQCOOtEi7t4Y2qa2QirxYPTjqYtUGQ/2GkDdvJQn1Y
 vaCMvRAfD0tO6C7gSDE8yjI1Bem6jmzwfEDKoePU2OZjFcf9v+IzACOMlLnZwt21m9X9eHeMCVS
 6sWxgitgjkGTWQTuzlFvw68fuFFjJYE3w2zuVBqUZ4tViMdYeG
X-Received: by 2002:a05:6820:4b08:b0:67d:f840:798f with SMTP id
 006d021491bc7-67dff5a3b75mr4157635eaf.69.1774551359906; 
 Thu, 26 Mar 2026 11:55:59 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:55:59 -0700 (PDT)
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
Subject: [PATCH v12 58/69] drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
Date: Thu, 26 Mar 2026 12:54:02 -0600
Message-ID: <20260326185413.1205870-59-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 609343446C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The vkms driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 434c295f44ba..02201460859f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -40,6 +40,8 @@
 
 static struct vkms_config *default_config;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
-- 
2.53.0

