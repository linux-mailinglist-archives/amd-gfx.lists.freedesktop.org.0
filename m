Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622BD3DC975
	for <lists+amd-gfx@lfdr.de>; Sun,  1 Aug 2021 05:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E646EA34;
	Sun,  1 Aug 2021 03:35:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575E96EA34;
 Sun,  1 Aug 2021 03:35:52 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id z3so13415240ile.12;
 Sat, 31 Jul 2021 20:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TuTXg0e3clW+MMWqMjMwfJqjaNCb4Ct1FoSRnnKkgJ8=;
 b=sPXROjnFoYm7RXY4aLJrzMtImBPW6ZMyQ9sMkh+rGUD+b1Ey12aNke2Qd6Pzph6XEI
 Lgp5RMrZvUCaLTK5MeOUgUT9BSGuJ6tIK6comnx9GtBRJHAKfvezatG28fZUfj1bGtiA
 iJEDqF4CW763DOKd+OL6ZgHVB93Kzyf3N4G/APGVLhypjn/sSvGpV2Rr6UFaSA/wUTVE
 vz8RGP2PpPFVVVmZ+QnavW2WWLvl8cCfRCyxghePFgFEPpnQs+j4curKCG7YDZ+XQBZz
 Bp326VQpi7fxQKRUBF0DsUi70FCesUvuCy2nIMEyFmBKbTVJSoPbc7uwF7eKWrtMyRwL
 4avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TuTXg0e3clW+MMWqMjMwfJqjaNCb4Ct1FoSRnnKkgJ8=;
 b=FS2giTdQYgMpEIqqTiSZivdCfFZncBRlBoQE3XUsbY3eQWgR5tGiOdR9JjyyiWrGvh
 rEiWNm6SAfVW7JRNxuI9lX0pwtih9V8WJNErYYWb8LxbbEmQaQaoQ5suBCPspkHBlSJx
 Zf9HPM1M6WTSuYidUSVZ9lU7dxdNrS3hlG6WiPnjzGT4AFXfWW3Cl96b3HSBanWH/Efq
 SI5nvUfbDg5ZZQXVjw7W9/2gaUg1L6oq3cyt7RUV+qIkcbLUMLTCrRKsGiozI7gL+Gxc
 fpAQmhD+FKGv+ZjXhgY7id1MKBKA14wR88YAciAEar9L/B3OlybUNv7H8dQO2/ea2Zqj
 FzNw==
X-Gm-Message-State: AOAM531ZSRKV97amym8kSv4YMIRyBCjkqAaLOeGVuF/1My6eYZU1mPMD
 hMG5QpR/vts/L1LQ2AO6EgP0Oep2farGEf2j
X-Google-Smtp-Source: ABdhPJzhYDwh4Y5EpOWBn5vN+Ipha5HDFJAJOT1R4CjiWkZ1a+41Eg4cL2jSZjy+79qvwEQ52aHSvQ==
X-Received: by 2002:a92:6d07:: with SMTP id i7mr3565334ilc.104.1627788951500; 
 Sat, 31 Jul 2021 20:35:51 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id h24sm4395848ioj.32.2021.07.31.20.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 20:35:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, seanpaul@chromium.org, jbaron@akamai.com
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH] dyndbg: add special aux_print framework
Date: Sat, 31 Jul 2021 21:35:48 -0600
Message-Id: <20210801033548.832022-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Sean Paul seanpaul@chromium.org proposed, in
https://patchwork.freedesktop.org/series/78133/
drm/trace: Mirror DRM debug logs to tracefs

The problem with the approach is that its built upon splitting
drm_debug_enabled() into syslog & trace flavors, which clashes rather
profoundly with the strategy of obsoleting it using dyndbg.

Instead, this puts the print-to-trace decision after the is-it-enabled
test (which is a noop), so it has near zero additional cost.

This is preliminary, Proof-of-Concept, and about 2 hrs old.
But its surprisingly simple:

 - add a new struct _ddebug member: (*aux_print)(char *format, ...)
 - add a new S/special flag to check !!aux_print
 - if S, invoke the function to handle the prepared vaf

It intrinsically allows any number of alternate printf-ish consumers,
but only 1 active per callsite.  I have another patchset that
eliminates some of the data redundancies like this, it can be
extended.

It may also prove to be a generic way to implement the netdev & ibdev
variants of __dynamic_pr_debug.

It just needs a mechanism to set the per-callsite pointer to a
printf-ish function to consume the pr_debug output, a tighter/better
function prototype, and a wrapper on drm_trace_printf to bundle up the
args and comport with the prototype, which can evolve to suit this 1st
client.

it is on top of:
https://patchwork.freedesktop.org/series/92544/
(v4 on lkml, v2 in patchwork)

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  7 ++++++-
 lib/dynamic_debug.c           | 22 +++++++++++++++++++---
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 677ad176b167..0d068e8ed7aa 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -22,6 +22,7 @@ struct _ddebug {
 	const char *function;
 	const char *filename;
 	const char *format;
+	int (*aux_print)(char *, void *, void *);
 	unsigned int lineno:18;
 	/*
 	 * The flags field controls the behaviour at the callsite.
@@ -29,7 +30,11 @@ struct _ddebug {
 	 * writes commands to <debugfs>/dynamic_debug/control
 	 */
 #define _DPRINTK_FLAGS_NONE	0
-#define _DPRINTK_FLAGS_PRINT	(1<<0) /* printk() a message using the format */
+#define _DPRINTK_FLAGS_PRINT		(1<<0) /* printk() a message */
+#define _DPRINTK_FLAGS_PRINT_AUX	(1<<5) /* call (*aux_print) */
+
+#define _DPRINTK_ENABLED (_DPRINTK_FLAGS_PRINT | _DPRINTK_FLAGS_PRINT_AUX)
+
 #define _DPRINTK_FLAGS_INCL_MODNAME	(1<<1)
 #define _DPRINTK_FLAGS_INCL_FUNCNAME	(1<<2)
 #define _DPRINTK_FLAGS_INCL_LINENO	(1<<3)
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 045e1cf92c44..7bbdedabe6f1 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -85,6 +85,7 @@ static inline const char *trim_prefix(const char *path)
 
 static struct { unsigned flag:8; char opt_char; } opt_array[] = {
 	{ _DPRINTK_FLAGS_PRINT, 'p' },
+	{ _DPRINTK_FLAGS_PRINT_AUX, 'S' },
 	{ _DPRINTK_FLAGS_INCL_MODNAME, 'm' },
 	{ _DPRINTK_FLAGS_INCL_FUNCNAME, 'f' },
 	{ _DPRINTK_FLAGS_INCL_LINENO, 'l' },
@@ -206,10 +207,10 @@ static int ddebug_change(const struct ddebug_query *query,
 			if (newflags == dp->flags)
 				continue;
 #ifdef CONFIG_JUMP_LABEL
-			if (dp->flags & _DPRINTK_FLAGS_PRINT) {
-				if (!(modifiers->flags & _DPRINTK_FLAGS_PRINT))
+			if (dp->flags & _DPRINTK_ENABLED) {
+				if (!(modifiers->flags & _DPRINTK_ENABLED))
 					static_branch_disable(&dp->key.dd_key_true);
-			} else if (modifiers->flags & _DPRINTK_FLAGS_PRINT)
+			} else if (modifiers->flags & _DPRINTK_ENABLED)
 				static_branch_enable(&dp->key.dd_key_true);
 #endif
 			dp->flags = newflags;
@@ -639,6 +640,21 @@ void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 
 	printk(KERN_DEBUG "%s%pV", dynamic_emit_prefix(descriptor, buf), &vaf);
 
+	if (descriptor->flags & _DPRINTK_FLAGS_PRINT_AUX) {
+		/* our model:
+		drm_trace_printf("%s%s[" DRM_NAME ":%ps] %pV",
+				 dev ? dev_name(dev) : "", dev ? " " : "",
+				 __builtin_return_address(0), &vaf);
+		*/
+		pr_info("reached check aux\n");
+
+		if (descriptor->aux_channel) {
+			pr_info("calling aux\n");
+			(*descriptor->aux_channel)
+				("%s[DRM_mumble :%ps] %pV", buf,
+				 __builtin_return_address(0), &vaf);
+		}
+	}
 	va_end(args);
 }
 EXPORT_SYMBOL(__dynamic_pr_debug);
-- 
2.31.1

