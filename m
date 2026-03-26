Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O9cBq16xmnwKgUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:40:13 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBCC34452F
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2675B10EDCC;
	Fri, 27 Mar 2026 12:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lgm8kYVx";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB6810EBD2
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:55:26 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-40ee9b945d5so940411fac.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551326; x=1775156126; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U461BxJhRY45gNpAWL37hzV1gL48r7XKATdpr+1ais0=;
 b=Lgm8kYVxz4VV1XOLEvaGh9N7OWpoTsHXNkDRq57fTT7M2fgTTV2/r2s9c1BIhHqdsq
 pH/+bQp6EnucPLKf+9fbUcxBVHJVbX/U1hBe3+vyOt20UQdfqDroFrI+wjcXOYi+jUDq
 hDCrCWr7PkmdmjMoLI/SrjtkjF6wmFHGJjnV1tc3mMtvXzqfRxZVqzBecyQg/UXJRFg2
 09tM1XuIZXcfICaa8sfNjsuNcTg758FXNojFN+wjbnhOylgzTnx2KncCKU3upDR3HxJg
 ZW3WTX4YfCTP+ePqLe8MoTwkQQnfcR7o2ptxpA+/hVdPT2MI6qg2iiNJHCS2aiUlRXyo
 86uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551326; x=1775156126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U461BxJhRY45gNpAWL37hzV1gL48r7XKATdpr+1ais0=;
 b=d0feFA6NK+thWkrl7u835J1uZC8/jyXbhzJ6PQEM1vXWSjL1/+C5Z3iiNt+DQPe8NQ
 GB4gehkEP2Xr4pwVF3f+A+ZrvujcpR9/Otm9pcsJcvyy26+/ImAdg+Qjs7jqgl05r3M/
 Sn97BgacJEnVjXmPVEmVgZcJaO2cpwXhw/JTx5RknRXRVZ/D7iTs6CMloKFukFnlBzY2
 iLTNSDXue6PdLjYdwBodvnp49FT/ZuRXXGQ3gqiocDh/ZeCU7fmGNEc+97fVzjF6eLRn
 4guxcG3jaKW+smZat4JhYlZDEb9MQIKJgzMypsWnYor3s/n4LxU5EpL/BZ45PZmwEckf
 bjtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnUgVwIerwIHiRaJdRWBZOVfajC3qr9QNbR/UHIardmAhGDcM7672v+9f3s6Z/8TYj81FrzBfY@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2WfSvAL1NuUrtgwGQesznE0EGvkA8jlbX2KA4lurw/TAk8Eyz
 fhYMg4GKoFw6n+lFf6ZfzT3qa1RWTXHrB6niPf48FQtKAs5tcBtRgPlQ
X-Gm-Gg: ATEYQzwLpkNLgTUn/YUu++d6vuWimH5khAPJtpwpH+klNRzcNBf6Tgv6qO9HMN3l7BF
 Tw5aAtuR49oBbwzikn6uA6eOjVBE7H2EVcXSuxLT49RqSGV+YXeqAQfovkZltiHX58eb9wfuRTF
 f3Fxqsf+vBbK37u9K+XYqOtIlnAXkkreGAlQBhPKFStFWsFGkdz2oDRUkTCKq7v5CLSu9V+np3/
 JTwUgJd+zZzJqTXZChxNCFNBZY9ST9shJeNrMCCkFIuUBUhUqY5CGBMMVzyl3L5TM3l84uflGLX
 L5/JQToh5kW5zGMp2Jdh30RUGZxbEZkDzx1KC2pW1XYKhYdueAPBUW/Gouqgxf+nbmmBVzNsdmA
 PI0yj1cgKV9QJAs5dR1qneT8C5rfhaj4sj+ApDVXCO1oSocCS0HJbpaG0///LOZc9Es9HvmOb1W
 6FdO1fcorAhXUtgHEK7OCkSu8JhLcArjYTC8uQ36thlOFSoxDp
X-Received: by 2002:a05:6870:5494:b0:3e7:fa5f:7269 with SMTP id
 586e51a60fabf-41ca6d6a46dmr4909366fac.2.1774551325975; 
 Thu, 26 Mar 2026 11:55:25 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:55:25 -0700 (PDT)
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
Subject: [PATCH v12 37/69] dyndbg-test: verify DYNAMIC_DEBUG_CLASSMAP_USE_()
 compile-time CHECK
Date: Thu, 26 Mar 2026 12:53:41 -0600
Message-ID: <20260326185413.1205870-38-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: BCBCC34452F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add another failing use-case, this time to verify that _USE properly
rejects an offset > 62.  This is an incomplete test; the proper test
is: classes.length + base + offset < 63, but the macro cannot test
classes.length at compile-time.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 779309898422..72a1a1c89cb2 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -156,8 +156,9 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
 DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
 DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);
 DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_maptype, 3, 10, "no such type");
-DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_len, 0, 60, "one", "two", "three");
-DYNAMIC_DEBUG_CLASSMAP_USE_(map_level_num, 100);
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_len, 0, 60,
+			      "base", "plus", "classes", "length", "too-big");
+DYNAMIC_DEBUG_CLASSMAP_USE_(fail_offset_big, 100);
 #endif
 
 #endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
-- 
2.53.0

