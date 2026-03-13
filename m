Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Jq4LYtAtGlljgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:23 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B464287768
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384AB10EC9E;
	Fri, 13 Mar 2026 16:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iOkiVIqp";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0054D10EC11
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:37 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-4671119c1c0so1595947b6e.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408277; x=1774013077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v7n8LRPhTnKwHNdLKddxIC02c+MckVOPZFH0J7I21NQ=;
 b=iOkiVIqpkXY/meEVzhZwTzhrgpRJkQLK/j5beIO+UhaeXOCSacAZBFMGEJHF+49383
 RPv0mbNokAh00AcSFB0XFzxhrgUrtSv6eOYyTlGqQIPles/LiyoE0kNvK648BGL1iqOk
 jBIXOojVyQGiofh+0pRn9MKgBRv5cUSHZ4vGhLZ96CCl+oVGItxUPUz00EUcnKzH9VfH
 0dzgx9Ut22b49GKLWASfHEni4iEKTAaDG7JPpgQ7RVXHUcxWWYP/Yjh60og4BLgF8XuZ
 tKkauTGE2Cd3Gz6uzBLU4dpp/8iQ8lXzjLIxwPA8M4faLTNMNMaxB8Xg9yoL38v4y0eZ
 Oa0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408277; x=1774013077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v7n8LRPhTnKwHNdLKddxIC02c+MckVOPZFH0J7I21NQ=;
 b=k4BkIy9Ftlfs2t73ojRp1vHzEOQrhLBlC3v4nqe2eUbfVmKR8Qb058D4er4HGhffRF
 +oPsw4Mvh6DXzqXUcDqqaPc9CzVo/gydJPPPo34ay7d5BjWqs/LjLofYMTEmnUzMzXIU
 yQO8luXTTu4hrGo+z+/86jy5+NO5JVsvXqN6suuTGEPq20r+BU4Dp+jxej5jj0MEbjW/
 Ud9lKnY5ZpapyhGudDHnPNEss7mdqsAyZklRnmD6GJEBlZfCG2t+lSUd+JOvzJY3xhss
 cimK5hjNPrLJdmjtKNU+G6GuLTJA6zE52ygEYsFjmZnzCNgPTrcG7Jj3N1J/jPHKty6B
 0kig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyrZKYHckekbg0PEVClvevs1mrJX07kR1SI8ylHJfxpEcS2FKRviMleL7lPeoyM58cghSsQExM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeZLTyH+0+Cg1x5Yh+hLxbfOq1aOdg7ESo4/mcObhIFuQbAVT7
 XRUtTn9nx47+GoD3tiSARhBrHjVirPWWvOoCT40jTdcgIwF1JMORQHR3
X-Gm-Gg: ATEYQzyHlr2oWgt52rY7ff2g9exgZVuRVLel41sXMjhj/knWnaDDJ3ISBFHtLLAeufz
 S614QaEv3akse4nbbANahJDGPGt/On9VVKf25v2EALuwYCOOtyszMFInje7P+1BI4wCYRouKfTK
 5RKGXwxzGW8YL7JX8BVWrnjlIaD1mcdA7B5BWPdZcMeJJCOfXJo0CjHTNfFZaSGT6hPQlLpZasc
 0Ba2+00/zwPmFOHbKVOZhGRTH5cnDY3XYFDuo7hAt1QjyBPyKbp6os816vDYae39a+idARHcbvu
 HS2GD6AaHKI1KWnnPriEU5xzLCg75d+pS9xgJEc2zS37eXGs1JrhAaQRO4+W4ZpmhGFlwoqLWCj
 Hsl79J1lkQf7cwa+djHKtkF8KBLzDAU0pZgAmu7oqS/ceF/pgFvPdwNM1aCPPOnf0ehVBn+AygK
 SePGipals954M1IJAmvGiXFLbWMUORZwmM8wYabFQn+TqL3DDH
X-Received: by 2002:a05:6808:c2ba:b0:467:100d:22ba with SMTP id
 5614622812f47-467570a534fmr1774878b6e.18.1773408277147; 
 Fri, 13 Mar 2026 06:24:37 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:36 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, virtualization@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 47/65] drm-dyndbg: add DRM_CLASSMAP_USE to bochs
Date: Fri, 13 Mar 2026 07:20:12 -0600
Message-ID: <20260313132103.2529746-48-jim.cromie@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:kraxel@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:virtualization@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jim.cromie@gmail.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:louis.chauvet@bootlin.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:intel-gfx@lists.freedesktop.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,akamai.com,linuxfoundation.org,redhat.com,linux.intel.com,kernel.org,suse.de,lists.linux.dev,lists.freedesktop.org,vger.kernel.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
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
X-Rspamd-Queue-Id: 6B464287768
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tiny/bochs has 5 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/bochs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 222e4ae1abbd..8f04666e7def 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -63,6 +63,8 @@ static int bochs_modeset = -1;
 static int defx = 1024;
 static int defy = 768;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 module_param_named(modeset, bochs_modeset, int, 0444);
 MODULE_PARM_DESC(modeset, "enable/disable kernel modesetting");
 
-- 
2.53.0

