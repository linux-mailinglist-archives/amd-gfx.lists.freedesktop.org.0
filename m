Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLrUCKxAtGnCjwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:56 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1532878B0
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2349910ECC5;
	Fri, 13 Mar 2026 16:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kfHX+MkC";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B4710EBF4
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:23:16 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-466f59dbe4bso564529b6e.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408196; x=1774012996; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z18RPkW2IZoeg5aoWLW/CvDoUPtyLf/KFWO8hAB/+ds=;
 b=kfHX+MkCNEYvg9ohoNPBpKSHBEXIbF2Mtv+D28f7DNK6ABZDEXESdJsOZXBzp2ehfp
 NfOsDoCfRu20vYaWqPl/6vY1U4kCP2Wp6ItWI0Hligm88dR7bNNhgjqgNGF0d1JI4fsF
 R3Z/+GtKe4QRPQ2cTwUiYOLdQ7UnNnkN+qDwXQaHpspwbkNWeCVcRKm2RfgYZti7D99W
 SqzjrEKVagX/0z9YKczs5KlsgCibaJpfBWfYCv1HyHUbCh/uW0M20e4PT0Q1vAvy8QNK
 XQlphiq9H/nS6lUO9hSAYZFHlRA5KB042qZetN/XAURNq/haS1pBHAR3fEsVXaKjgEFh
 bVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408196; x=1774012996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=z18RPkW2IZoeg5aoWLW/CvDoUPtyLf/KFWO8hAB/+ds=;
 b=oLBKC0gUleMBvXTyyLggqr3Imt3EQIVG2fzOsqVc+UttMKXg0i9vCHgrm4dSIJWwiF
 N45hv77tfi/DF2FsU5Kql3K45U2F3mHxf5TisTDLvtn3AAIRQD410P3MJsJ10rb37DV0
 Lvjo+SNtaAHoBFqhHUfkS0/HAgBe5zwHJnQGEX1pO9GMB6AzfHNQvUBoyGIuPIUSNux9
 4xNb+Ld9Hv6ph25aZ5B8MH6gVg2SvEl9g7OOV19g08ul1kJXZDT03bhmkMXokTY5v3DZ
 NhL4QnVILZVncxpaagKsEsG7jfZb0Q9GJnk8t2VA4rhqiMoUDGLIG+uh/b5xT4kJQ+Ew
 CYTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXVZ13cnV1NKvA8hCgDHYBPgfHh/ShyXGMw+QwyiVtiGv35Zsj1jeuhBjIDxDGPC97Kjt4s8DF@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3fHorAIPIjOKKgvr4YsZjzk0mKjymVaxdVgxGMLD0LTVf8OHJ
 XHEVPpSXfeW6yUOHjV/Z+hBF+LmH9mcOMZFxbV8tlBph4wMiKdc3HgNm
X-Gm-Gg: ATEYQzyCybEZTq+sa5k5K9R78YDQBJr507N+0PzICNaUS6cqRRSGQEtU9NVqvob5cMr
 ke8B0CYvS97G6xpEEkIfLWBkh9dK6A9px4jEsYPI39S0VF/fYggJdPyJ27AdbUrH5aFawNSxeiR
 PqURxVcGJZQRM1E+5t1wGcJRUOIXhY18LT/9tQiM0n595UjAe634qC7o/z3v7EMpw1Mx59nUhvu
 JOnWspJlErC5tCObmim5/cLbBQbi/XnKmb8Ke2QWOeMHkS1Ecu6OL7Ef9BrPtpOr72bs8fTz4s2
 +c9PHv9T2fB/j14fAwkT2NNC4QDLQlS/5LqXHcDKJYcAaND2bq3+r/xWfuVBXpRNJ1wsrGwBMhS
 o+mO6TkaOIU31YdwG71Xgkiy9xQzQCNV/rtNA0lEXeXO5uBtnVZH+JkOlVE855lms6olciPaID5
 bSwFTpceppi2VAut06c8dGwnii1OZDjdQmjMXIqFp9VoZwEUjTbzOa8iNGel8=
X-Received: by 2002:a05:6808:c3ef:b0:466:fd51:6a66 with SMTP id
 5614622812f47-4675714c79fmr1554429b6e.20.1773408195957; 
 Fri, 13 Mar 2026 06:23:15 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:23:15 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Andrew Morton <akpm@linux-foundation.org>,
 Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org
Cc: mripard@kernel.org, tzimmermann@suse.de, maarten.lankhorst@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 christian.koenig@amd.com, matthew.auld@intel.com,
 arunpravin.paneerselvam@amd.com, louis.chauvet@bootlin.com,
 skhan@linuxfoundation.org, pmladek@suse.com, ukaszb@chromium.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 10/65] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Fri, 13 Mar 2026 07:19:35 -0600
Message-ID: <20260313132103.2529746-11-jim.cromie@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:akpm@linux-foundation.org,m:jim.cromie@gmail.com,m:linux-kernel@vger.kernel.org,m:mripard@kernel.org,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:louis.chauvet@bootlin.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:dri-devel@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,akamai.com,linuxfoundation.org,linux-foundation.org,vger.kernel.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: AE1532878B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Disambiguate pr_fmt(fmt) arg, by changing it to _FMT_, to avoid naming
confusion with many later macros also using that argname.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index ffa1cf7c2c72..9575b92a8deb 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -11,7 +11,7 @@
  * Copyright (C) 2013 Du, Changbin <changbin.du@gmail.com>
  */
 
-#define pr_fmt(fmt) "dyndbg: " fmt
+#define pr_fmt(_FMT_) "dyndbg: " _FMT_
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.53.0

