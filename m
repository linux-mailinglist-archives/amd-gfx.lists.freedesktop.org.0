Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOu7DJBAtGnCjwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:28 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66432877DB
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF0410ECB4;
	Fri, 13 Mar 2026 16:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c+wULDJl";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E67A10EC11
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:13 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-4645dde00a7so2693552b6e.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408252; x=1774013052; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ctYWbn5zpBxXKFAUFmjBfsapEiOXJnCJVZtfjZFl2eo=;
 b=c+wULDJlfHph7p2oCOqbbfRX9rrZpxRpgfnR/mFKfv86NGGscjA0sy5CI4SFN7LFPo
 Z1oG4MPg+RZafDhT3s4Bvz8GXhWEcdd2Kad/6teKHVL2XQwWo/MgEoT7ykJZHL3uxdqE
 JllTXJSudradDk+TL1cxktNZcwkOUIVc98/rWL4JfOrY1yWtU+QMT7NDENqe7TFMsqIw
 sH7ws06WF36i6zzlIa65iXnD8CYCvgYZzO+dY0OH6/m0F9BAQPKlT5/sW9+J582CO8pn
 F6nBqWUp4sLG3KWnoCDczPjKC/Dd7qf4i+K7tXSiMMO53QW0SaM4BghnVnx+CdbOg3B4
 qr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408252; x=1774013052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ctYWbn5zpBxXKFAUFmjBfsapEiOXJnCJVZtfjZFl2eo=;
 b=iE+0tTcPxuBIUrEXC77V5r0tlxtXakLQR4+BidB7717XMrCeSg0jUMPIMExhTv4WYT
 wIqJnzwkdQgod6vs8nQ2TXlfqosv2o5Seew3E9b8QVSOON5KGkg4HXLUcmc7INK5YdpD
 wBOUxj4e0DAoC4ShSCV4HSn9jHVw/hfU/47bV3tUJQhGi5GA1IvuXy2WTgtXSkf4X17x
 1k0yhU7gnEUjkfGv6uJrGrdpTlPn5VHMDGJBFbdtHISVOwH0DQCZRUsnlxstoT+Ym3IY
 KedU5/sBYXGzPIllnzxZkzZhOW/1SUbDRj0JEa9gTeIuehaSjf0wPhXDWsGpKnvhEAsT
 nbFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWBRjgSYOGz6RqHMOnGDBqwnC3WQ/HjlbGeCYwC/nnsOkbPRYDMKHdant41QR8xZStR+PEOD2R@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2IMifzpZaQls//LOD1MjwkN6A1rnRIwxlUFwRWyGpJaLMtrXL
 8VAoasCCtkcWHeGutpzLHBc4lTR/iS29J2hzncoZSJpY53GjsAFDI6OP
X-Gm-Gg: ATEYQzwz+YguRvppZRbomtR5TFqkRtKtpxc0lrSjd/jozkS5UGCA9I9FRALfQ/C/o9c
 Kfy8HDmuCyB8luNUyB/gwlDXTLEzpXvN6egVLSkvb6k0C3YWGbk+D+gpZJ0IkgupRb+SZemcqyW
 7ODoaov6vQtTzxcrBSN7KoHoxnRbYYFAOSqfJm/7dQg6jEGCh5xvUqpUPBa3iL+LjyqvTziO32Q
 14ulwCLhPQbSSe6YZpzgrrDXQl+rGPDWaz8PkshhMeq4L5FPg73yEXpS8VVdgiPdlaD2V6pWsJw
 HHkChVW9ZepZDhBcMtfzbOubZT0fzwxCsl638m0Z02Fiu7vW+GIHRqMUk+j5iWwlgvxCV7Rilb/
 crlrSq7nn1cikvEKb4CdH4mpEM7dTyjjQh+oYNXQZYLSuTcHpv90r9rq1GIjImdpLHCurl8EXi4
 pOojcfXmaeFgSykOi1uFQjl/8tYAHPi+T1RHZFVKMhcFeUnoxU
X-Received: by 2002:a05:6808:14c8:b0:467:5f1:fcac with SMTP id
 5614622812f47-4675552aa1cmr1830167b6e.5.1773408252422; 
 Fri, 13 Mar 2026 06:24:12 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org,
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
Subject: [PATCH v11 35/65] drm-dyndbg: adapt drm core to use dyndbg
 classmaps-v2
Date: Fri, 13 Mar 2026 07:20:00 -0600
Message-ID: <20260313132103.2529746-36-jim.cromie@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jim.cromie@gmail.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:louis.chauvet@bootlin.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:intel-gfx@lists.freedesktop.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,akamai.com,linuxfoundation.org,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: D66432877DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dyndbg's CLASSMAP-v1 api was broken; DECLARE_DYNDBG_CLASSMAP tried to
do too much.  Its replaced by DYNAMIC_DEBUG_CLASSMAP_DEFINE which
creates & EXPORTs a classmap, and DYNAMIC_DEBUG_CLASSMAP_USE which
refers to that exported classmap, creating a module dependency.  DRM
gets DRM_CLASSMAP_* wrappers to hide the DRM_USE_DYNAMIC_DEBUG ifdef.

The drivers still use DECLARE_DYNDBG_CLASSMAP for now, so they still
redundantly re-declare the classmap, but we can convert the drivers
later to DYNDBG_CLASSMAP_USE, at which point they'll respond to the
echo class FOO >control commands.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
this ignored a checkpatch
 WARNING: Argument 'name' is not used in function-like macro
 #70: FILE: include/drm/drm_print.h:148:
 +#define DRM_CLASSMAP_USE(name)

the macro is empty, and correct. only 1 arg is expected.

v++: fix old CLASSBITS/CLASSMAP comment
---
 drivers/gpu/drm/drm_print.c | 25 +++++++++++++------------
 include/drm/drm_print.h     | 13 ++++++++++++-
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index ded9461df5f2..d07e7953c9fc 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -56,18 +56,19 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 module_param_named(debug, __drm_debug, ulong, 0600);
 #else
-/* classnames must match vals of enum drm_debug_category */
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
+/* classnames must match value-symbols of enum drm_debug_category */
+DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
+		    DRM_UT_CORE,
+		    "DRM_UT_CORE",
+		    "DRM_UT_DRIVER",
+		    "DRM_UT_KMS",
+		    "DRM_UT_PRIME",
+		    "DRM_UT_ATOMIC",
+		    "DRM_UT_VBL",
+		    "DRM_UT_STATE",
+		    "DRM_UT_LEASE",
+		    "DRM_UT_DP",
+		    "DRM_UT_DRMRES");
 
 static struct ddebug_class_param drm_debug_bitmap = {
 	.bits = &__drm_debug,
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index ab017b05e175..b743ee3f8f5e 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -96,7 +96,10 @@ extern unsigned long __drm_debug;
  *
  */
 enum drm_debug_category {
-	/* These names must match those in DYNAMIC_DEBUG_CLASSBITS */
+	/*
+	 * These enum-names are reused in DRM_CLASSMAP_DEFINE to
+	 * expose them as classes in /proc/dynamic_debug/control
+	 */
 	/**
 	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
 	 * drm_memory.c, ...
@@ -141,6 +144,14 @@ enum drm_debug_category {
 	DRM_UT_DRMRES
 };
 
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+#define DRM_CLASSMAP_DEFINE(...)    DYNAMIC_DEBUG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)      DYNAMIC_DEBUG_CLASSMAP_USE(name)
+#else
+#define DRM_CLASSMAP_DEFINE(...)
+#define DRM_CLASSMAP_USE(name)
+#endif
+
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & BIT(category));
-- 
2.53.0

