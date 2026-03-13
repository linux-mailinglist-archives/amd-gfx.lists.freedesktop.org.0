Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG9jELpAtGnCjwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:52:10 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D470C287916
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4967710ECDE;
	Fri, 13 Mar 2026 16:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WZh2DwTQ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06D810EC20
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:25:01 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-466ec4c6846so754504b6e.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408301; x=1774013101; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3MLouRi7A/376XLBTN4RuLKPG3wKNeKXtfBxDJ5SI9M=;
 b=WZh2DwTQLnsjy6w8U9A6g55Is5qIJWaC1xY3vUjBUtpfyhW9RQdxqpFjk7YyBMs6KO
 e4GF3bVHyUp9RJTeTME74KVVZu6rg5oNE7b4poJ/nES+42epIH8kPEWaEYeCB17VCJdt
 TAZqODAjWMBDVr0drPZEnLtDnYnxF34pAViYUZn8A3Aex0P71aiNi4KqlizhyMEwtsAV
 UqJBVvZqr4X4dboNBNVRBxnNZNBdkTY/NW4lJE2X4l8Xy7p42e31/JujRvEQhm/pj1FI
 S7pc2H+3Xrn9Y4n9hcgyaKB7zh0t0n0dn6pjfadpte8hu80e4aOPIo7SlkjAN69kZU0u
 sidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408301; x=1774013101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3MLouRi7A/376XLBTN4RuLKPG3wKNeKXtfBxDJ5SI9M=;
 b=o3e+hZVsw5CZ8M+W3VPmZoxJcnEYhZIHPTBJUdCNDee68IRH9TZcepQSBgAbZBgJ1i
 0+F+Gcv0U9R+KRL6rIcqa8uxsBTc1PNNH/37npznFdThuACILLPTv1jiam7kzOfvYKv1
 JTqmX0sAlMiwYqrbQxNN3zlDG84aAKkUj8NJoBxMR+CxdB29noTdWTaL9kZYzs/rSbXb
 pCAIMlg2N4gE4pyLyiOL1FmlwayxgiJ1KDkzFhxJu/FK2PFw7OUqvHiYLDczWeAnvdAy
 IzguwLum2r6oVTibLaBPrhr1AWsV6DSQmfAUYlLGUfNmY94U1n7QAI2ii67f/+0GsJNG
 wRnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURRtRoT5qLByrcER9mwn41iplWduAT/LRyHZ2SCx+Lo7TqGpxzoZ3cPWqCoFDuc4TUJY1GMRYS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZknC0YVWDC7kjlOVLOfSmCyj8o6EXh1l65iq23ItvPDBrt355
 cpShru+rDFfXn7p/DG+vjbzl7DWLk6tazRWmFUW+7orsuJk257L/0etR
X-Gm-Gg: ATEYQzyAGPNnYVfsmcv69ePd8vCdbUNe8vlYbDdHv2tVLSfhf/eao5Khn/gDcE6Zoui
 QCRyHcXvHExn8mamZeIDHJqSMjXG8ofDYb1nAD9bKINPTElw1Y/L06yAS8A5calw28+khn/6YaZ
 mFpKbaNN5bTxtE49N2+K0eChvHpF/Wp0Q6dZJp+C5IX7bAMKksO2G27I3caf6lkGzZRQ3BSetJL
 XJiQghmieQreM4eu4FrbBCQVtgRx4dNaZXtjrJuUNZkovJQhNwsVnwUM+8LyVxYPX9VFRDbqOUj
 eBm2F72OKm/gG39z6bMU+CCSCjXmb+XYC5ELN5c/Pg9abRAVXrEjQqupMWRTWuB85pPswPf1uFL
 5sjWNGocAsLEoFXpL+jneQRdvyieYckI4qX4zk+2gu+H2BMIl9IUgya9gFztKxcC9DK6l3Fa0kL
 EfZc07xA2BeZE0er+AVhQKWSytdg2MhAOEInCd6IY1/H12xeXt
X-Received: by 2002:a05:6808:8947:b0:467:1cf5:768b with SMTP id
 5614622812f47-46757053acamr1500831b6e.10.1773408301182; 
 Fri, 13 Mar 2026 06:25:01 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:25:00 -0700 (PDT)
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
Subject: [PATCH v11 60/65] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Fri, 13 Mar 2026 07:20:25 -0600
Message-ID: <20260313132103.2529746-61-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: D470C287916
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Time for some thorough CI.

Also, the previous 18 patches could perhaps be replaced by a single
invocation of DYNDBG_CLASSMAP_USE, from a C-file linked into all drm
drivers & helpers.  I didn't find such a file, nor a drm-client
linkage item in the Makefile.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig.debug | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index 3b7886865335..48674fae5958 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -1,7 +1,6 @@
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
 	default n
-	depends on BROKEN
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.53.0

