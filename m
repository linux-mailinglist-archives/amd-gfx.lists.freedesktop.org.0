Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALUBIYxAtGlljgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:24 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A1728777F
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CAB10ECA2;
	Fri, 13 Mar 2026 16:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gaPvrfBk";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6434010EC05
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:23:47 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-46702742c7dso499728b6e.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408226; x=1774013026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=So1OTSMskFHrYYWc+bNZ+5Ly0eOy3XxdufShv2uDEDM=;
 b=gaPvrfBkXcQpC1LYAo1ReApEuCBQc3X6A6P58QI2uez9l/Boc4sAH1KdJYNkLOC2K+
 9PGE52w4yF/rwI8c9TU1DJuHg+7WHy9Yd429tM+/lNEc59ZTcWCAIfHwAQDNJK6Cn1cK
 SCfzJ7OWqUFojm1z7F8e3lA0vd/bx12QntJ0HYYtMm5rUHAe7+FUo3Yf183kSyfATuqv
 MGQnl2xil9R3i8CF4oPqoCREB+Ym0Dlxcq33M44a1szdOGpHH/tPpIr4zszn1QwMsoux
 VCZGd5LI3Cfd1bSBWFU4bt5nS/mIp29/BDku38c/y96ib3uhhi41GryLrZn5llB24uRh
 1Fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408226; x=1774013026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=So1OTSMskFHrYYWc+bNZ+5Ly0eOy3XxdufShv2uDEDM=;
 b=hL4jwlu3ALUs+o+hblZKZdOgPvzu4vLjIJaV41TBOv0ThfAlpTWoTs7o3faLhJFZmo
 Le+LDFnnPnqMQXhfNErBmUQs3EH02nAiUPI2XEA0kDc/h6X/A190AqVw/YKmXXSurVam
 N/nCBdmAc1wsYDlMhGO9V1vRLOyAnDSMR3vgk6MYKAahYr3WK1xZ4DVFfOPsJMAMPhzw
 7GdV91U7TdBAjSIlDdTOgaoCTXLlQeliTi0/iKMLw5WosXn1DD/XtN5w36E57fQwoRg2
 zaIm8rLKF0RnXFW4CpIFlsVoRU8j/4uvaWl2kR4ilX86B3y1kTH1095kkSmGmRqYxGEa
 4b0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkN/gVcadmT9UGDWrOmASEBamkv3/lW1GHsaa4E6gA3RBVFr7tItKYivEmjfuV2GgxKC46Nf0O@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKxSUjC2wX/fvzNjz9xqPTk+bBDNWAKJC95RZhF30WXNXYNlif
 2iVP6e1L6d6hNW9KXGM70VhIkMXJAZpXqU8K+w9l8S1Vi9ty0ZUogYb5
X-Gm-Gg: ATEYQzxG7cWdSz4a/BoGbiDsYff0akn9N+q6FtxqfC1X4JiWzZDkODKTIq/GfjBAZHr
 qAzqYmK/F3tMIPNruFaEHKOZi6G53tuAL8fpY1ZrBFbIMhMvjUnljPJBtLwdJT6biMeVjNoXppm
 EhbKHahwnDNenojtqNKistJ0nH+mzqycCaaup+0pT5fR9ZSD6givx4IBg2EuEJU19AqMjfMCPqi
 IrLbRLdOqVI1Rr4Avf6Xjs48JRiD9hJB+xAZkY4wm5ds0wUj+mqZby1OVvlCbeMI/oPhAsOxX0A
 dbHhjrwS4D6OA4f2EOWQBKcF76eWARnkvpYMvCMmqYUuAjy0GukDt5M90M6PwMunOSu/lpsSe4n
 QZ4gjXlY0MgLvqB+6yGBwUtDeIgndYwQA918GsbbqOUBuqm62P9sxeCNPbg1APtGr4Lyk9F5dM+
 eampHvS1fG0Rja7OvgP7oGrf6Uk5iTDURV+48mhgTr8qcGULL+
X-Received: by 2002:a05:6808:6717:b0:467:462b:ab0 with SMTP id
 5614622812f47-46757050cfbmr1535486b6e.2.1773408226613; 
 Fri, 13 Mar 2026 06:23:46 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:23:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Jim Cromie <jim.cromie@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Cc: mripard@kernel.org, tzimmermann@suse.de, maarten.lankhorst@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 christian.koenig@amd.com, matthew.auld@intel.com,
 arunpravin.paneerselvam@amd.com, louis.chauvet@bootlin.com,
 skhan@linuxfoundation.org, pmladek@suse.com, ukaszb@chromium.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 23/65] dyndbg: detect class_id reservation conflicts
Date: Fri, 13 Mar 2026 07:19:48 -0600
Message-ID: <20260313132103.2529746-24-jim.cromie@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:jim.cromie@gmail.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:mripard@kernel.org,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:louis.chauvet@bootlin.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:dri-devel@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 38A1728777F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If a module _DEFINEs 2 or more classmaps, it must devise them to share
the per-module 0..62 class-id space; ie their respective base,+length
reservations cannot overlap.

To detect conflicts at modprobe, add ddebug_class_range_overlap(),
call it from ddebug_add_module(), and WARN and return -EINVAL when
they're detected.

This insures that class_id -> classname lookup has just 1 answer, so
the 1st-found search in find-class-name works properly.

test_dynamic_debug.c:

If built with -DFORCE_CLASSID_CONFLICT, the test-modules invoke 2
conflicting DYNAMIC_DEBUG_CLASSMAP_DEFINE() declarations, into parent
and the _submod.  These conflict with one of the good ones in the
parent (D2_CORE..etc), causing the modprobe(s) to warn

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v9 - fix WARN() by adding new 1st arg 1.
---
 lib/dynamic_debug.c      | 10 ++++++++++
 lib/test_dynamic_debug.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 66f4bfe39e89..ec0d1c427d59 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1317,6 +1317,7 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
 	struct _ddebug_class_user *cli;
+	u64 reserved_ids = 0;
 	int i;
 
 	if (!di->descs.len)
@@ -1341,6 +1342,11 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	dd_mark_vector_subrange(i, cli, &dt->info, users, dt);
 	/* now di is stale */
 
+	/* insure 2+ classmaps share the per-module 0..62 class_id space */
+	for_subvec(i, cm, &dt->info, maps)
+		if (ddebug_class_range_overlap(cm, &reserved_ids))
+			goto cleanup;
+
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
@@ -1353,6 +1359,10 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	vpr_info("%3u debug prints in module %s\n",
 		 dt->info.descs.len, dt->info.mod_name);
 	return 0;
+cleanup:
+	WARN_ONCE(1, "dyndbg multi-classmap conflict in %s\n", di->mod_name);
+	kfree(dt);
+	return -EINVAL;
 }
 
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 6c4548f63512..1ba4be9a403a 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -128,6 +128,14 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 DYNAMIC_DEBUG_CLASSMAP_PARAM(disjoint_bits, p);
 DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
 
+#ifdef FORCE_CLASSID_CONFLICT
+/*
+ * Enable with -Dflag on compile to test overlapping class-id range
+ * detection.  This should warn on modprobes.
+ */
+DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
+#endif
+
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
 
 /*
-- 
2.53.0

