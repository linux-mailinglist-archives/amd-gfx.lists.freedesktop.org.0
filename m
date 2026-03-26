Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJyFKNZ6xmnwKgUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:40:54 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AE63446A0
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3148310EDFD;
	Fri, 27 Mar 2026 12:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jH8JNCjP";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77CE10EBF0
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:55:53 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-40438e0cba6so843024fac.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551353; x=1775156153; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v7n8LRPhTnKwHNdLKddxIC02c+MckVOPZFH0J7I21NQ=;
 b=jH8JNCjPnhoEXU8PXBKagfcumi83KxobSi9w6zSWsuLksp4W8J2B1gRcw772lV+oWG
 Z0pvsdQs15w1LZhq4r0oPX2zvEGnTctTZPFjg3TDovnf00IspfboybiKY3V++3SDFV3b
 7TRfM6q5V2mv+FEgitJ0HADKEBszbxqcT4EvNqpURVvc0y2ZRdI+/Ti8dtyChAMjUX4C
 NTVpOOGBQDiz7VoQXwM4oKRsWgdA6Oge8C7pJDih8T4/rG0rGS/bhNP9ZV0BiV8U4wjY
 kbrBXkImgcBLHCwTQzZH+AJkg2SNnVAc4AOynGxJTaJ0k7nNkiQKglLDd5k8bgWY/zD8
 OYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551353; x=1775156153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v7n8LRPhTnKwHNdLKddxIC02c+MckVOPZFH0J7I21NQ=;
 b=b44H3ZgQCbEDwGi7jfITe8bUkt+hqUsYMCZJwJzSlLZAns4lveu+RSrLbIac2ohNqC
 rxGB+yW6dpT0Kv0F2W/0yJLVFNaQUqIhDqVeQIJC4gtPQ+Dnndx08uxuTtgxtpmgnTX1
 2VedrDR4JsuOgzaFzfY8KxySCHJ+9e034xDPHbHLTObORMgY2poJuvR+PQq4G0mzd1s6
 AdY7G9CdzN/N/PrmInyECCUTK/rYbUVnBseaK7+3YXl+Z1OjEUah4xMsK18KenAeCeC+
 DgWyLmmnbrmxS4AOanHXsxNbkBKiHUGWgAJ70d9i1wd2kFC65n9LA7VF8Pc5NPeOgLFp
 Z79A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXen2Aha9J9F8i1KnMAgqs1P/MVpMFzJJa3EC7oUVwN8DI+JMyXTxtOfdnWxgrp+vcfQ5kUsICE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwuhN8l7KBLUm5K2BtR/Ss9m5DKPY3SINh++Qfw8G6DW/2B83/
 x0MtubwYigG66QfQexqvnFTolsg4A8DjySQhareyDlVJQoyk9l0NSzH4
X-Gm-Gg: ATEYQzxbBzW8UZy3sIqdl1rkz7dcvVmxdTxgBaGQ59A1IjruUdP++N/VUaF5J0TXxgc
 Ouh4ju8F803gaaXSrpMydvpM3yY1dQHbrTsgJnk6HUuuT62hAKXLZnni2hHjd6yKDwkjlGbDBJV
 kTxtEwE8Gzp0CbBSqqHweGd1jjqFuMVgTwXscjOIjKxH0h1phZn3uxb8pBnogufxmK8e5e3Gyuc
 +8gVx4KBnhoOyt0rfS7LXjcGzLPtbGcgvDYEuV2aqh1E4usAGj0Qp0c6fnEW385Yts5lIWUoNob
 89dl70tl/wlkq094RiUHcivRxfYL6fkWlph/J0yGscFXoiEiYxzwWqLkdkNpjkTihSwFfGChUAk
 bwBcsPPIsjMW0GNFUD/PuACizxm/917nQCpOVHLflUAMO3pf62EderHfGVWrg2sCk55+4AcLn3c
 5yAo7spdvDRGgnPdTd8f0qTeUZaKkK5Sw550GZUZVS9/V/pEBV
X-Received: by 2002:a05:6871:608:b0:41c:305b:14d0 with SMTP id
 586e51a60fabf-41ca7049e58mr4680983fac.35.1774551352968; 
 Thu, 26 Mar 2026 11:55:52 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:55:52 -0700 (PDT)
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
Subject: [PATCH v12 53/69] drm-dyndbg: add DRM_CLASSMAP_USE to bochs
Date: Thu, 26 Mar 2026 12:53:57 -0600
Message-ID: <20260326185413.1205870-54-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 54AE63446A0
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

