Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM/YIQ17xmmjKwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:41:49 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C753446E1
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD6210EE1F;
	Fri, 27 Mar 2026 12:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kL9ayPrG";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2235010EBF1
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:56:15 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-4043b27ddeaso853310fac.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551374; x=1775156174; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmHuo2gpKk+a4rM0v+S94FJooBnanLI4bt90pYFjtcE=;
 b=kL9ayPrGAGqh+ywZ8LRrvxK+1hYDBHrCaEKVqh/vkdUtKPmuXX/Us/C1JKkIefzAPB
 mGdoJ1pY4RyThNvw8ZVyZgv6l1MUbWu+gjpGuzZRRpEWxk8ssRaGQRpoYE9AHt94ATgZ
 TYOrpVatRgnIT5mrgMq0WsNvx9d+09NlRVCEnobOm4TmsMQF90/HzWTjGfyV6TFl5ukV
 gz8EChw8AHVmuyTUKCMxiG05Ne3fgJYDNZCFx77R4C/4OsDL40njq3bDKpH7U5AINZaz
 5Dh6hwzSnF+T6iKbSv6xEzgL9j3R/PmvjwOpfoK7g506/HUaH2bRi2m3owC51cGcDri7
 O5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551374; x=1775156174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZmHuo2gpKk+a4rM0v+S94FJooBnanLI4bt90pYFjtcE=;
 b=oxxnTqDjWLTDKiQIib4Ap9rU0mgZInMEELgQNLlOCSoxX+uKVuaYDF5el0h4K0ZLRG
 E/KczNBmtMLD0aGnDeFuo/z9VwVvlPTw+3iytUMqz/0SDjwOfJ93hP4AHW6gKf0++qNh
 NR80KC9D2YMwrs2H9H40e5vbSKzbmW3anRmcZhYSSsC7nI/ZTVwKC6wDprWH1IhLrwzp
 +l4ws0dpQBRaz1JtIwYjCxAY9pVAcrYI6KeQrLmzFWf54afntS/66nNjv1Br6xRVoltL
 y0Qfw7uaKLlUxyJYQ7A2NubttrrpE5JAHQy0shxdpS30ovSvDz2jzPcJZQQyHb06Rb9z
 5o7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBn3hiuUnHlUr/5YuqUyz9FoAItiB98hyFaLA8Zhem2YJ/fTvdxeghBtXHiMxlt174IsCpeC6S@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTtWdK9CdLMbEHIb0gEpc2c1tRu1JT9BJjfk0GP9GFAd6qUPc7
 lYFoIOum6nIt+9ZqTja3f61ioI7D2mLtWIfeAwCg3Wknkr52EOTq5H8g
X-Gm-Gg: ATEYQzx+TOeqmQbZbtoHkFf1dhQey0EibB8a4gHqUhtQG/M7i5nTeBRRumkM33Pu6vk
 9QMMw00e9BUgaf52zAGwSDURAW9S6k9IUEYF6odIU9hnPUF9XMiHCkGnF5rjWqKobUpF/xHRzKO
 Eeeno1MWIyZsy5fW4Jv7wAtiRAsyK8hhXQhcrEZYT2ZG28GtzFjm2c0Lue+eTttBM10sYrYIkqD
 gfMFSZvdj4iVVgUjWuxhiQW8XevhMj0Ow7tvGgU7/h8GSuoRYYfyhuuSg0mpfiO/sZNsbgh1cnv
 66qHWM3Axldt2WnGcT57s7F95gFrrHNfmgs9c9qCae2rsLMtdoVSJU5PTDlpHUaqEAVRL5AHrtd
 KPanBa3HJ4++NNBacbDKYD//3IlW1KHvMdbY763gD5YMeiYa5J6ceXREFWmCo0+dVEvhe0BvYb9
 zDYO/IqgsZvaMxp0ePbly3FAbrpuhwuB7D3cpaA3p/bjfGZUpr
X-Received: by 2002:a05:6870:d60c:b0:41c:5a3b:1afd with SMTP id
 586e51a60fabf-41ca6ddce00mr5003080fac.13.1774551374333; 
 Thu, 26 Mar 2026 11:56:14 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:56:13 -0700 (PDT)
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
Subject: [PATCH v12 68/69] accel/ethosu: call DRM_CLASSMAP_USE
Date: Thu, 26 Mar 2026 12:54:12 -0600
Message-ID: <20260326185413.1205870-69-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 36C753446E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ethosu.ko has several drm*dbg() calls, it must call DRM_CLASSMAP_USE
to tell dynamic-debug what classmap enables them.
Also include drm/drm_print.h explicitly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/accel/ethosu/ethosu_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
index 9992193d7338..a0b8cb81a359 100644
--- a/drivers/accel/ethosu/ethosu_drv.c
+++ b/drivers/accel/ethosu/ethosu_drv.c
@@ -17,12 +17,15 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_accel.h>
 #include <drm/ethosu_accel.h>
+#include <drm/drm_print.h>
 
 #include "ethosu_drv.h"
 #include "ethosu_device.h"
 #include "ethosu_gem.h"
 #include "ethosu_job.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static int ethosu_ioctl_dev_query(struct drm_device *ddev, void *data,
 				  struct drm_file *file)
 {
-- 
2.53.0

