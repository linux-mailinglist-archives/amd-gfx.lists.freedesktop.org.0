Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J+1KpNAtGnCjwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:31 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F11428780F
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA5510ECB6;
	Fri, 13 Mar 2026 16:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HCmzpJZm";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FBE10EC1B
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:54 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-4671119c1c0so1596110b6e.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408293; x=1774013093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ves6/eFJLAs0HG68Znj+VH4wZtUdDvx4ZnDak47UPW8=;
 b=HCmzpJZmxi9a7DnbKerMWSIhWQF7UXL8eGUb0SvcU8745rmGSlCC+CebuJCvRAqoE0
 FGclb8dhe87X6biLkNTv9cM7kjRRuO3t6Yki9GIOdu+K5yWdNbSjFUloo5LjgUuaz43T
 I8ps2fvs5GlWL9VKA7/9LdrrJjLKZo4Ixje+TC7PfDx43yHVcAiVwfyI0L/Ytjm/6ZZv
 SrszsoFVXunk2Hoisx1ShBrMJVoIr7PG33/wgllyV9CTjhc9vwOIzExeHFsYKYaT82fL
 /6Lq2PyMIs6hsTcyrUVJxK7+BDDLHAf1Zc1qGaDDrRY4nmpBfn24R4f18jcmnyii09D5
 V8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408293; x=1774013093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ves6/eFJLAs0HG68Znj+VH4wZtUdDvx4ZnDak47UPW8=;
 b=tAo1hRXIHxMku5CUZgNv1WwzxwqnU07j2W5Jg9BtXLPUxO7z/sSx7MOMwE4jYK4+24
 iggJ+0OBwtGdfMfdFVbRn391FSfXtg+SNE4KdEWt7ejq0BI4u5sxQvWI2tYq6yIDJQXE
 WeDwjsi6rycb6lpz0Dngw1hoDfOsbLIIR3v0IjVjtX+6W5QhjKxCBc9ahdrADh6OWmAm
 Ma2FpXlFL/0ALje676IjusJtAf8lXpJFMsL0MZzBqgpS+WsRDasRQR7mFsK6d31Jcx2E
 PsPUyEFw12VpJdxliLWjDkxWDeSgfjFn6VdYx9J+t+afb5uglNfZOXeB3sY5H+epu1RV
 eb/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvV+m9KkeyU93cxO8nHTuozTXF5rNmX4OPNWr2kbFsKKeeUWtYw18s9wogw1armFFuCrD351Ty@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjX7XkvhuIBcs9xKKE8SMJx/nrCuVlgvxWbquYF9sQG2HCT+QP
 hSTJV5ea1lemxfV0Z2kbLPswdwZ5TyTBjiq21/S1JuYS3i8O39R7Bwqd
X-Gm-Gg: ATEYQzyqxb5fJM4rEt+z+pUQBF3y5uActqw5tT9OIHeGK5Id+5f0ApBNfN0Rb+dqgso
 VHFsYFmmPH1bpkAYjiaL2Gjq3bxkVsACreuoTboo2B96xsaPFsTHYFIUHCJqdQuP2OqxdlezL8r
 mpGFg31zwmSzbqDQsKmaUiY9j0cMtBgjcpnHaDKKI5HzpPRat4i79PJmTAkaBz9YZJdxZ9b7m4F
 /u461bsM02APbRHRMbPYzfmXFakR60+9ipb/+6g6uoqTpAtHnqo/rzVD0DjHNafc450wT2I68fs
 1KvIY2GKrjFahVT0sA5ViWTArKtyvMFWivr4yQvQrE5xmMPFe9sZWZMV0vMhKbbRgWP6GL94gSu
 fUsYTO6gNMs7EX1OpBfL3hfFp8qI5QkpemwgpUNEZOrP1tF4XZqZonWJWUOxftcSoHNe8kyXAUB
 JKDvuu+mBE/0BfZghWzFw1wWoaxD/rNRCRnovvPgSSQKDBtdtF
X-Received: by 2002:a05:6808:1b10:b0:467:254:b90 with SMTP id
 5614622812f47-4675704a335mr1612471b6e.10.1773408293451; 
 Fri, 13 Mar 2026 06:24:53 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 56/65] drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
Date: Fri, 13 Mar 2026 07:20:21 -0600
Message-ID: <20260313132103.2529746-57-jim.cromie@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:airlied@redhat.com,m:kraxel@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:virtualization@lists.linux.dev,m:spice-devel@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jim.cromie@gmail.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:louis.chauvet@bootlin.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:intel-gfx@lists.freedesktop.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,akamai.com,linuxfoundation.org,redhat.com,linux.intel.com,kernel.org,suse.de,lists.linux.dev,lists.freedesktop.org,vger.kernel.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
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
X-Rspamd-Queue-Id: 1F11428780F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The qxl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 2bbb1168a3ff..73998bb331d9 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -67,6 +67,8 @@ module_param_named(modeset, qxl_modeset, int, 0400);
 MODULE_PARM_DESC(num_heads, "Number of virtual crtcs to expose (default 4)");
 module_param_named(num_heads, qxl_num_crtc, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct drm_driver qxl_driver;
 static struct pci_driver qxl_pci_driver;
 
-- 
2.53.0

