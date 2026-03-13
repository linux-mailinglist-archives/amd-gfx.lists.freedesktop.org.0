Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOI6DotAtGlljgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:23 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2A428775A
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0734510EC9C;
	Fri, 13 Mar 2026 16:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="czQYIsQL";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A9210EC15
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:35 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-4671cbce465so1104406b6e.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408275; x=1774013075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Ts/LFRGubV+qE5nUbczy5fsPH9e9tt1w1L0GvmpB2A=;
 b=czQYIsQLuF0FbFYZUigIVCp87VtIq/aJP+Cs1Map0OEeb/Aqe+jrbZX5uynErI8zUn
 K4VVtESQDcdG4chFk7XYBSSeXrj/iO2vD6wMH4p2gC5K2+7dWLz7J/zMRIlR6L4VZGvf
 TEH5s9TlcbUDuzJxqMW+9vwV+USKQ85tOcE5BtehWHd4y71D19xRJFjrCL87wZBasuGL
 BDsJNo+p5PnOQJ4egT4dc1+rF15alaL/i3j4D7W82DuWlbN0ctsJOcYCrsX/wYGs6tGZ
 pNUapJoxm0chOOsjA87x4eEEHadfupZ9z6lao3aRu+doWBB4s9LwU04mTC8zac9if+Hv
 YKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408275; x=1774013075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4Ts/LFRGubV+qE5nUbczy5fsPH9e9tt1w1L0GvmpB2A=;
 b=JJWplKhIPcLD6zfsz/u9eY+CbHTylENMz3jfTR/pT61mz/VnCG7ipueMRK3aZqYQQ+
 +HlGnqPiLoUWUboV0gcYnDKrbG7hrasSdPcFbjY0zbHxtFPcYqAl2Z5OVwrcM8N4ymRP
 Thg4L4fv/hxMaa++KnkJRAlCMeas7zZ9G5L618hvxq0haNENR/Kc72in4kvA/cPcWi8Z
 qXuB69lvXPeSDUZKiZ7x8XcwqX2CAEL22nPre35KLYMJZcWV5BOLshACjWBo+9sOsBaS
 EOKli82GZrn7tQfeoR+1GFvTy3a/dxn4MPhlCsQIK/RMcIAgHplXqt1TMfkId+7FOQht
 ilCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVss/uyiZvd9rmCR/rv3KLCpKA3XHLv7fEcUCfpKS34c3Fvn8ULJ/J92XmZgLkCPra43p499e9h@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8CYyb7TMoxCwX6ldVJS9qSzScPFQeEWf+7Cbx2lLMH0xbFmyN
 0B51COd7kqFBKY6WN2phovV9G9EUtzw0M/b18IxEuoOgjeaBvN9gztyF
X-Gm-Gg: ATEYQzxVUQgiiBQEjQE8W4EutwrQ8FXwyVtsAJiUZUSFiU3cNrY+zNqd2OwPzdGR8so
 Z+j2c35wKawl1uga+oWzruwTGk4+gqjrl/9BW91uTwI8CbrkvvTRLRSju2DUDPGdl4GZk524Zio
 kyasdtKc6MInHRw9f1+NyNua2Bj8mqwJJPbbPG+aliyM1nF5svY1hUGlqpT+xXkmpyEfzfRQ66x
 TT2nidqAjgdPn5zDUnpISmrllS5LRI6ZBUmYx5pCYMo4GTjMgJXOGVzfB5Cp59IAsfnc2p8Z9+n
 ZuVCbGJSFxB0+djC1+u6jGkQoFk+bA2aXApSQDepuoP5Ri+yi4I73XGFQr1WNC7rvbufse0OYv8
 /071pQC8eNj4OBkhPLeUYEyd43Hf4idW/N1qK/r1djes+PBzhgRoD5HXl61CQbhFodCE/QyF8JR
 sFqIWUivR+E5mgkIBguVjdVBETb2ujFdMtgOlTxqYyYiPPqrvN
X-Received: by 2002:a05:6808:c162:b0:463:ab56:9ed1 with SMTP id
 5614622812f47-467570952f1mr1501954b6e.6.1773408274705; 
 Fri, 13 Mar 2026 06:24:34 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 46/65] drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
Date: Fri, 13 Mar 2026 07:20:11 -0600
Message-ID: <20260313132103.2529746-47-jim.cromie@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:tzimmermann@suse.de,m:javierm@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jim.cromie@gmail.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:louis.chauvet@bootlin.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:intel-gfx@lists.freedesktop.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,akamai.com,linuxfoundation.org,suse.de,redhat.com,linux.intel.com,kernel.org,lists.freedesktop.org,vger.kernel.org];
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
X-Rspamd-Queue-Id: DC2A428775A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tiny/simpledrm has 3 DRM_UT_DRIVER debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 7a95d2dacd9d..8958e115abc1 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -35,6 +35,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * Helpers for simplefb
  */
-- 
2.53.0

