Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI+jBIxAtGlljgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:24 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C50287771
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3939C10EC9F;
	Fri, 13 Mar 2026 16:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ewo/WpHF";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1557110EC1D
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:47 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-4670676ba03so829941b6e.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408286; x=1774013086; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z5CIU7Xv1sd29xtDEeVm5EwbYfV92LBvg9qr7+GGg2w=;
 b=Ewo/WpHFfm09kx5VmoNF8fezqzX7lZXSL9w261wvhsvP/Vmj0XQqLxSDCJMb3crqcS
 ciOSFuGZZBwRsTScKZ3f4h9qqUeM2/pyxok7xJO1x/A0HOuWMXPPBWCqysO8qXVm8qVW
 BOoMV0KqYp94hvNyx5RUqjwTjVyc6pC27hMUaB0Va99EIjpVDlw0GNN1CpF05TDfnKvC
 aIrlEsuLB7mNcgWWzOv1aNVgdzoo+30kwkSa7S8n+U5ZkUWyCpCi54cWaOvc9MzfmVS7
 2M22QOwxQh7bEApSPzIYqYrBKOQrJnKk8tm4or5jlHaizuefCY0m4rn0SE+8FsQqhhnu
 8Q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408286; x=1774013086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=z5CIU7Xv1sd29xtDEeVm5EwbYfV92LBvg9qr7+GGg2w=;
 b=Z33LbFNf4x6uski9+ByQRlbIeagVPp2qisyl/oJKf+ja0h/sb7ud1S1vLqTzuitmdQ
 pwu0mgFaVQ7aWzXs9Yorf+3GopG0F0mOHsHziIxKAPPdNcY7vD9+B/Do3gsxfiLtexrr
 i/g3/JZlILSNUd7PkmMQ7h08UWDvRFAdDCWRjFtrJqF9IJDBq95QcNNE6lePlrr5rIvr
 GtaTB38V/ZVycAQIm01dTmYhy4dRq7FL3xa5bCe5xODPnZHlyQGk+MdcfZGK6A+G979i
 iqgAFxD/6YnX8xmGAOtYBf5Wqh9I0/kTMzcsVuaT41SrXbOXcb+x+REe+MUfRAuTgFRb
 RpHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU8WxIihXdqNovCu0W1LijMKEysFw8LTpwZvaSAFENZBsLAT5ognwrColPFYzy+0fToTpQgBtS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHTluaXJHawmS1v9ofryJAuns/HIX0EZvwI+TAhZhqRfpr9h4V
 5/caGJ5j0Iegxhckl7UHW65KrKnmSgFEPkvxfeKy3h8G7DYfz6k6hpYl
X-Gm-Gg: ATEYQzzw6IxHmXYusALTnhqHGsAHLHZE1i1eUx+ZSZMxcM5qpJWzq3yOkhvrHf2OFjP
 7T10pscbTy8BxYz4FpsCd+wzhDWG4mmVsPZyBTSr0l1Rj4OhGtygL+EhH2BjpuUTDRMflWDguEl
 ljxrac7SxBkcTkabaoqjDdSlWB3XpxDX73GJUpe2fHlQYSaXKc1mAGSc5/jo6Fog6irW1tgJVDH
 ZvuqT3R+YpDMMmm/FVEf6ne0LxPreq1R7hciUoC7XUjUoouSINGDD1DIMoIJ4RFF4aLXS+akLZT
 kxW1DtCW0dBCSDQOlHbnmGDiMs6IK/Qz0OaElMLhLfC3CMoBbhOWuttnmf+oWp7htCtp9J7mFvB
 foP3fH7WGDHJbT7cuZwf7gG7qlDX0pzzh5T8drUdhkTIvyvpiZIrxacBmouR/elmZBdH0q9AlHC
 xYov4FSulcqiVox5FFQJBR8POnnO5MbDzKBtYL+PjULQVlMlYo
X-Received: by 2002:a05:6808:1302:b0:467:e7b:6fc4 with SMTP id
 5614622812f47-467575dca9dmr1665945b6e.45.1773408286169; 
 Fri, 13 Mar 2026 06:24:46 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 skhan@linuxfoundation.org, pmladek@suse.com, ukaszb@chromium.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 52/65] drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
Date: Fri, 13 Mar 2026 07:20:17 -0600
Message-ID: <20260313132103.2529746-53-jim.cromie@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jim.cromie@gmail.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:intel-gfx@lists.freedesktop.org,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,m:jimcromie@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,akamai.com,linuxfoundation.org,bootlin.com,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
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
	FREEMAIL_CC(0.00)[gmail.com,intel.com,linux.intel.com,amd.com,linuxfoundation.org,suse.com,chromium.org,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B3C50287771
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
index 95020765c4c2..e22c15f045d1 100644
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

