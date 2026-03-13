Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIyMF6JAtGlljgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:46 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE51B287845
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8691A10ECB1;
	Fri, 13 Mar 2026 16:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k7w0e5ZL";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E43610EC23
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:56 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-4670676ba03so829990b6e.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408295; x=1774013095; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Zu2rs9LQXViGSxr3LJ2mebc7/BIvYzUYAAic1plGvM=;
 b=k7w0e5ZLr9fovWLe3iaT9eUbo/ALTH6NtnDM55Nc8RVm6sI/5GuCZlNsbCItF5HP0C
 yRUGbKbYqFwDibqk5Rd42ERkiFwSxjpO+s776p4PS1Y7ng7oAF23hJO3fVrBYuxvr53O
 2e56zJgMBCg5pnHVQnjMOWyTlTM3auser6dOT0cyTSey4xIcgYn+a9Q2kBcjNBjirWUd
 Kk2d7iGg6A7/F3I+C8ltJeANnhqosSkPBPCAIrOevH5G4xc8Rhsc9LwNc0k90mw4vfNE
 pEpCoKF+YA3R+ZHZIBujoaW06DKnrZQukikGba5JpFIUl7hmDZihsX6/8Iwgzwr+vzxH
 A7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408295; x=1774013095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+Zu2rs9LQXViGSxr3LJ2mebc7/BIvYzUYAAic1plGvM=;
 b=lnPWBPoqd8m5329XBJz5/VH0Fmcb6vi4yQ//dtWPpDqvPrENQwjVP/Pm9uU4mzUHJA
 pPLvDUaz8WyIQd1J6XFTae3FNmKvwt0qs6g744nmoVD4fw38n+JgueGDdLV0+IUWxrPC
 4PTvcYGKDkTMLKuFrYXu4Bli7HDHbgaG7DI5RqZYTbBxkqX0BB5+VtN5CGEa1xRQJ19n
 c5MNxo5bObKWBszMNHcGZdeoXU13b9yNRq6JGic0MUg2lSG8N/w9TWiPIew9tHhy7o1n
 Qt78wsZjjTijE/4ZhsyLncgESmZhPfj6qFr58rAS4HgqD0XSuvgdmDv4HIOUs5zNAZXY
 gl+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa0b/7rfPe8cyTpOS8Oj4V9J2P5rZQHttnFANmZEms/KtNHVyVwuSGoaRZnKkY9hQdLNE2EjIJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxg+AjXaY0QgFpr9K3KEWGhPZx9KmB/o5OzaRFANIgU3IT+y390
 mLP8dj4bM59BHn0Gz8jLx9n+G0i9vB9s9lzl6uXevgCXLAqwqtDTG03g
X-Gm-Gg: ATEYQzw9pjy0kUCgcepTTrbt4ax9+zVKo5qPGexMJnvAocPcAbruUak0DPA5Jiu6r5h
 9dPI5je9Lg4P1NYqpqQI/S0WqlWdPDIP58CWnex/SrdcdF9m6YEI58vc0BpnSSoenDIQ9U9FKAB
 PheAPOCf5n6OCSCoVl0fiPRIjWf3gUwIgqqPbfMLkVbNOW6/OmxYSxwJ76tb7fVaAeG+ckJ0CTs
 Ag04FDQw43Hr546cRJEvj+qpXO/WQpyxaqqb8iJQI5UHArZ5KPLRF1DMQmFEeV44Xw6Q8NwxJWb
 Of0wCXBGxU3TSQM91fipShnTPDQo3x6b7FAVPvIEWJkwLtTmfd7Z+HPX0j6mmjXxtfhrf8m9g7u
 U0hIKvQlgFI61xNMSBH/1kn18GAkz4RrhlEny+XpoB2ZBMeIuLpCacM2LiOLX7keDCrbW49ijDL
 qx6ozVw7WVEhBmeEawM8oqtVEJ56dv/xDt24+XuMAqif/Z/krj
X-Received: by 2002:a05:6808:2385:b0:467:1cf5:7684 with SMTP id
 5614622812f47-467570a44f8mr1658295b6e.6.1773408295128; 
 Fri, 13 Mar 2026 06:24:55 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:54 -0700 (PDT)
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
Subject: [PATCH v11 57/65] drm-dyndbg: add DRM_CLASSMAP_USE to the
 drm_gem_shmem_helper driver
Date: Fri, 13 Mar 2026 07:20:22 -0600
Message-ID: <20260313132103.2529746-58-jim.cromie@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EE51B287845
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The drm_gem_shmem_helper driver has a number of DRM_UT_* debugs, make
them controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling
dyndbg that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 4500deef4127..a0bb6110ad83 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -26,6 +26,7 @@
 #include <drm/drm_print.h>
 
 MODULE_IMPORT_NS("DMA_BUF");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 /**
  * DOC: overview
-- 
2.53.0

