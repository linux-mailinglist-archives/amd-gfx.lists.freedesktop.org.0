Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLQlHNN6xmmxKwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:40:51 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20938344653
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6003510EE21;
	Fri, 27 Mar 2026 12:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZGFHpC5P";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F312410EBF1
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:55:50 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-40974bf7781so1893824fac.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551350; x=1775156150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCYC336WoUNdVp8/EmNZcTjPfopk7zVSApVc86osLdY=;
 b=ZGFHpC5P6ieMf35qmrOTX2d4Nikb0EE9UecxqPPXXJY/vptIUmW5/83/STpdTi1g1q
 /LJIuVinTZfoFUg0uQXFxeAKAy9Iz2hKKO3B8uDuNzDymDWkD9vL1aJdKg88aJbOkjlx
 bB6wb/BWCl/UCTqNAhAkDeS4XoBCf9MZcwvfUsv6gmktzqXm+l2vy+TIaA7/wCN5lTwE
 DD+6LpdaPJtgEfxXE2AUVYnbN7wuAH5GzcsMv6s34z7Te5j1l7S72SeseM5rGGEy6VJq
 gZsJSffqmsW37knv5mjGktREoSaMMbihA0MXTk9evsjjDtvYPvtLmbrW+3SG3zSlQt7I
 FUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551350; x=1775156150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RCYC336WoUNdVp8/EmNZcTjPfopk7zVSApVc86osLdY=;
 b=qcEpJQoMkap3QQoSWbt7XfJ1Qbpv2G1HmT7VHZjxe6h+9PiSgtxfcT3vOmy3ir9gdX
 m3+yzEBMuK3dDIHJ3FfhSHyx8WMK/eN7+vZFBI1lxYpj2tdDHRYhhlPV1CqUrmoqm3m2
 bvW0vgh/fRd3khyUsSVaa9A5+Llem5dJc4+ck73f31c1LF7Q9FauG5J7konKXov6GqNd
 HwNlYE+a18EhcZv6iCIHMbF6rBeO0Q+QEiFv6lU+i7rarBDBjhlSg1xlnRgOUqBObdc/
 X3d3TQjUr2Rd+0JTvGmzPb3yPUAoODJfJ7+OuFyabxaabs88zucvFuxqxj7YJ3pgKEwL
 QNpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU6JeKzJ7gomlU81nlOC1y160WSQCEDdUqYOiiXLLQKnStviMaSUFm8gN6yUQPxGHuIwiZUea2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydJMwtebmI8Z/ZrQvTn33j1+yLv5Kz2nnA/yeSEE4raijd4IEs
 D9Zm0hvYrYfRxOPTEzsMdaeMrCnYo0aWbeH6nDJTfMjnnEk0FDJ83MgP
X-Gm-Gg: ATEYQzzao7RP35xD0ihGzg5xybObJW1LjETwwL6a6u0kLjOBP8YSXqopVAgjJw3v+vm
 YhFPfTc9FbayH6kRxoFOLqd1u0l5a74B+OUq8QeQY3SjTr6EjGbjNMlL8/nln4cX37fdDu6v8TC
 M0de3/axl9GFW4dVe3k5e2GJ/OeQtPsm2+eUclachPame95vMRETpi+/OPmhPyZCFVukWU3srSX
 7Sml4F4hu+RYrlIvf6UeGcNOro+WAGkzqvY68vShRa/y0bgjCHO7ZSCIb3tnNKeO3dD/V7Kx++3
 AxR9vlU63JrsQacJmCt4NSYtDbPM27baMkaCcioo/+0f2lkBzFQDWzpRjDdyewp/WXpTXcOtVux
 LQnyu4QlFwMGF8RwPbelDsqLtHhLkyUo35xofYiYxUREXc0E0khW/rnxQr5ypz3fJ9HfucoXa/O
 mp9tVu7MZuN/e4qTN4K2ChRbNmaR+luWLeOznLrns9hlMFrki+
X-Received: by 2002:a05:6870:8992:b0:417:43c8:a58e with SMTP id
 586e51a60fabf-41cd7a6c632mr1282299fac.3.1774551350152; 
 Thu, 26 Mar 2026 11:55:50 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:55:49 -0700 (PDT)
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
Subject: [PATCH v12 51/69] drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
Date: Thu, 26 Mar 2026 12:53:55 -0600
Message-ID: <20260326185413.1205870-52-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 20938344653
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

virtio_gpu has 10 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index a5ce96fb8a1d..aea4c117b006 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -49,6 +49,8 @@ static const struct drm_driver driver;
 
 static int virtio_gpu_modeset = -1;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, virtio_gpu_modeset, int, 0400);
 
-- 
2.53.0

