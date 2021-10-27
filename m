Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE92D43C199
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Oct 2021 06:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E1F89101;
	Wed, 27 Oct 2021 04:37:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74546E520;
 Wed, 27 Oct 2021 04:37:18 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id j10so1641837ilu.2;
 Tue, 26 Oct 2021 21:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o+whlX412ns7Y6ku6OCfF8ilTGQnTI3FHyyW4SpYgR0=;
 b=AxPoMl2gtzmhRnBl9k5THYtOV3nvDL4/dLq23yhgBKycu8ETCiI+/H9/ALQnsfSXaR
 rDiMaCRJR7i4aH2eKlgdOv5mRbkHoXps2XLeZdNwSo8B9Al5A3gFP5KfRKNmlf8n/RJ7
 /TChanG/0PZJv4XScjk4Ed+G72VcHTOwOO+57IQDIWUYX3NjoEkQW7rWIL3cqBBzTGFH
 d8+T40KsCinqKkQKpGYlADqXubBsph+wxdWZpjlRUIlxHU1EkAnjcm9pSH9IxSJNI9it
 BM7YXRqG3a03xvJZAPhUpp8eki0UM3iDZaN50GLgiUMcdlhHEntkaTEojACs2G7ZN6wa
 UkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o+whlX412ns7Y6ku6OCfF8ilTGQnTI3FHyyW4SpYgR0=;
 b=FL1R3XZ1dDBTqQ0T8BB2NYdGOKC65j/bHslR0I+PnzbHiZN/SN81nVlOV4KCt5GP9R
 OsNFa9NlrX5beaarBmGR77KK0Z0EPhK2KzXakR/ZmyFek+U9w53eQHa2FuIleuV1awiv
 thKZBdtNPgJ+yusuTYq7zSKzQKTlD6X3EzJ6vXQfK6gbMDGQ+z16sz8JxdIP8lRkfqwr
 Dn2tfKla7bp52GC5dxsygkxSmFO3zy98WTqNdH0ZpD6BcVvRRP/tMF3hBj1sxxGJeEzk
 rhrq7C0wyCUsv8/gtjFZxBbenZxEZub527Di8IiAs9l5RN4qSOWeGGPmWIZ1WfZ/TNOV
 4Maw==
X-Gm-Message-State: AOAM532fvgKnUX3TvYX6Ro1c69c8Rt+Eq+c0smcAeH9aB1hvo0GbO1Dp
 2vELe/Vw68Rby3viD83dt2Q=
X-Google-Smtp-Source: ABdhPJy7rC/9+8A/ODpxwktWX/Zo3dG1FP7VMw+H/WEGlKBV2sTrmacm45zUy0uBWydHCHtXJJ8Pgw==
X-Received: by 2002:a92:cd8d:: with SMTP id r13mr12255334ilb.5.1635309438010; 
 Tue, 26 Oct 2021 21:37:18 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a15sm2030404ilj.81.2021.10.26.21.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:37:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 01/10] dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES macro
 and callbacks
Date: Tue, 26 Oct 2021 22:36:36 -0600
Message-Id: <20211027043645.153133-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027043645.153133-1-jim.cromie@gmail.com>
References: <20211027043645.153133-1-jim.cromie@gmail.com>
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

DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, var, bitmap_desc, @bit_descs)
allows users to create a drm.debug style (bitmap) sysfs interface,
mapping each bit to a pr_debug "category".

Unlike drm, dyndbg has no coding of "category", but it can select a
set of pr_debugs with a substr match on their formats.  Since many
pr_debug users have systematized format prefixes, dyndbg can
en/disable those existing groupings as sets/categories.

Those categories can (already) be manipulated like so:

    echo "format $category +p" >control

This macro merely maps the categories to bits of a sysfs interface, by
wiring the callbacks to it.

DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
	"i915/gvt bitmap desc",
	/* map each bit to a format match string */
	[0] = { "gvt:cmd:" },
	[1] = { "gvt:core:" },
	[2] = { "gvt:dpy:" },
	[3] = { "gvt:el:" },
	[4] = { "gvt:irq:" },
	[5] = { "gvt:mm:" },
	[6] = { "gvt:mmio:" },
	[7] = { "gvt:render:" },
	[8] = { "gvt:sched:" });

 - int param_set_dyndbg()
 - int param_get_dyndbg()
 - struct kernel_param_ops param_ops_dyndbg

Following the model of kernel/params.c STANDARD_PARAM_DEFS, these are
non-static and exported.

get/set use an augmented kernel_param; the arg refs a new struct
dyndbg_bitmap_param containing:

A- the map of "categories", an array of struct dyndbg_bitdescs,
   indexed by bitpos, defining the match against pr_debug formats.

B- a pointer to the user module's ulong holding the bits/state.
   By sharing state, we coordinate with code that still uses it
   directly.  This allows drm-debug api to be converted incrementally,
   while still using __drm_debug & drm_debug_enabled() in other parts.

param_set_dyndbg() compares new vs old bits, and only updates prdbgs
on changes.  This maximally preserves the underlying state, which may
have been customized via later `echo $cmd >control`.  So if a user
really wants to know that all prdbgs are set precisely, they must
pre-clear then set.

dynamic_debug.h:

Add DEFINE_DYNAMIC_DEBUG_CATEGORIES() described above, and a stub
throwing a BUILD_BUG (RFC) when used without DYNAMIC_DEBUG support.

Add structs dyndbg_bitdesc, dyndbg_bitmap_param to support the main
macro, and several helper macros wrapping the given categories with
^prefix and ' ' suffix.  This way the callback can be more broadly
used, by using the right helper macro.

Also externs the struct kernel_param param_ops_dyndbg symbol, as is
done in moduleparams.h for all the STANDARD params.

USAGE NOTES:

Using dyndbg to query on "format $str" requires that $str must be
present in the compiled-in format string.  Searching on "%s" does not
define a useful set of callsites.

Using DEFINE_DYNAMIC_DEBUG_CATEGORIES wo support gets a BUILD_BUG.
ISTM there is already action at a declarative distance, nobody needs
mystery as to why the /sysfs thingy didn't appear.

Dyndbg is agnostic wrt the categorization scheme used, in order to
play well with any prefix convention already in use in the codebase.
In fact, "prefix" is not strictly accurate without ^ anchor.

Ad-hoc categories and sub-categories are implicitly allowed, author
discipline and review is expected.

Hierarchical classes/categories are natural:

"^drm:<CAT>:"		is used in a later commit
"^drm:<CAT>:<SUB>:"	is a natural extension.
"^drm:atomic:fail:"	has been proposed, sounds directly useful

RFC: in a real sense we abandon enum strictures here, and lose some
compiler help, on spelling errs for example.  Obviously "drm:" != "DRM:".

Some properties of a hierarchical category deserve explication:

Trailing spaces matter !

With 1..3-space ("drm: ", "drm:atomic: ", "drm:atomic:fail: "), the
":" doesn't terminate the search-space, the trailing space does.  So a
"drm:" search spec will match all DRM categories & subcategories, and
will not be useful in an interface where all categories are already
controlled together.  That said, "drm:atomic:" & "drm:atomic: " are
different, and both are useful in cases.

Ad-Hoc categories & sub-categories:

Ad-hoc categories are those format-prefixes already in use; both
amdgpu and i915 have numerous (120,~1800) pr_debugs, most of these use
a system, a small set (9,13) of prefixes, to categorize the output.
Dyndbg already works on these, this patch just allows adding a new
bitmap knob to control them.

Ad-hoc sub-categories are slightly trickier.
  since drm_dbg_atomic("fail: ...") is a macro:
    pr_debug("drm:atomic:" " " format,...) // cpp-paste in a trailing space

We get "drm:atomic: fail:", with that undesirable embedded space;
obviously not ideal wrt clear and simple prefixes.

a possible fix: drm_dbg_atomic_("fail: ..."); // trailing _ for ad-hoc subcat

Summarizing:

 - "drm:kms: " & "drm:kms:" are different
 - "drm:kms"		also different - includes drm:kms2:
 - "drm:kms:\t"		also different - could be troublesome
 - "drm:kms:*"		doesn't work, no wildcard on format atm.

Order matters in DEFINE_DYNAMIC_DEBUG_CATEGORIES(... @bit_descs)

Since bits are/will-stay applied 0-N, the later bits can countermand
the earlier ones, but it is tricky - consider;

    DD_CATs(... "drm:atomic:", "drm:atomic:fail:" ) // misleading

The 1st search-term is misleading, because it includes (modifies)
subcategories, but then 2nd overrides it.  So don't do that.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5:
. rename to DEFINE_DYNAMIC_DEBUG_CATEGORIES from DEFINE_DYNDBG_BITMAP
. in set_dyndbg, replace hardcoded "i915" w kp->mod->name
. static inline the stubs
. const *str in structs, const array. - Emil
. dyndbg: add do-nothing DEFINE_DYNAMIC_DEBUG_CATEGORIES if !DD_CORE
. call MOD_PARM_DESC(name, "$desc") for users
. simplify callback, remove bit-change detection
. config errs reported by <lkp@intel.com>

v6:
. return rc, bitmap->, snprintf, ws - Andy Shevchenko
. s/chgct/matches/ - old varname is misleading
. move code off file bottom to a "better" place
. change ##fsname to ##var for less generic varname (ie: not "debug")
. add KP_MOD_NAME workaround for !CONFIG_MODULES
. move forward decl down to where its needed

v7:
. use kp->arg, dont need kp->data or previous patch-1 - jbaron
. use client's ulong for bits, share state
. throw BUILD_BUG if DEFINE_DYNAMIC_DEBUG_CATEGORIES used wo support

v8:
. drop help field from dyndbg_bitdesc
. move ^ constraint from callback to helper macro: _DD_cat_
. add other helper macros

v10:
. drop all helper macros, [N] = { "foo" } is clear.
---
 include/linux/dynamic_debug.h | 52 ++++++++++++++++++++++++
 lib/dynamic_debug.c           | 76 +++++++++++++++++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dce631e678dd..a9787544aef0 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -181,6 +181,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				   KERN_DEBUG, prefix_str, prefix_type,	\
 				   rowsize, groupsize, buf, len, ascii)
 
+struct kernel_param;
+int param_set_dyndbg(const char *instr, const struct kernel_param *kp);
+int param_get_dyndbg(char *buffer, const struct kernel_param *kp);
+
 #else /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 #include <linux/string.h>
@@ -227,6 +231,54 @@ static inline int dynamic_debug_exec_queries(const char *query, const char *modn
 	return 0;
 }
 
+struct kernel_param;
+static inline int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
+{ return 0; }
+static inline int param_get_dyndbg(char *buffer, const struct kernel_param *kp)
+{ return 0; }
+
 #endif /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
+struct dyndbg_bitdesc {
+	const char *match;	/* search format for this substr */
+};
+
+struct dyndbg_bitmap_param {
+	unsigned long *bits;		/* ref to shared state */
+	struct dyndbg_bitdesc map[];	/* indexed by bitpos */
+};
+
+#if defined(CONFIG_DYNAMIC_DEBUG) || \
+	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
+/**
+ * DEFINE_DYNAMIC_DEBUG_CATEGORIES() - bitmap control of categorized pr_debugs
+ * @fsname: parameter basename under /sys
+ * @_var:    C-identifier holding bitmap
+ * @desc:  string summarizing the controls provided
+ * @...:    list of struct dyndbg_bitdesc initializations
+ *
+ * Intended for modules with a systematic use of "categorized"
+ * pr_debug's (a set of prefixes in the format strings), this allows
+ * modules calling pr_debugs to control them in groups according to
+ * those prefixes, and map them to bits 0-N of a sysfs control point.
+ */
+#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, _var, desc, ...)	\
+	MODULE_PARM_DESC(fsname, desc);					\
+	static struct dyndbg_bitmap_param ddcats_##_var =		\
+	{ .bits = &(_var), .map = { __VA_ARGS__, { .match = NULL }}};	\
+	module_param_cb(fsname, &param_ops_dyndbg, &ddcats_##_var, 0644)
+
+extern const struct kernel_param_ops param_ops_dyndbg;
+
+#else /* no dyndbg configured, throw error on macro use */
+
+#if (defined(CONFIG_DYNAMIC_DEBUG_CORE) && !defined(DYNAMIC_DEBUG_MODULE))
+#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, var, bitmap_desc, ...)	\
+	BUILD_BUG_ON_MSG(1, "you need -DDYNAMIC_DEBUG_MODULE in compile")
+#else
+#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, var, bitmap_desc, ...)	\
+	BUILD_BUG_ON_MSG(1, "CONFIG_DYNAMIC_DEBUG needed to use this macro: " #var)
+#endif
+#endif
+
 #endif
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index cb5abb42c16a..54a6a872106d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -577,6 +577,82 @@ int dynamic_debug_exec_queries(const char *query, const char *modname)
 }
 EXPORT_SYMBOL_GPL(dynamic_debug_exec_queries);
 
+#ifdef CONFIG_MODULES
+#define KP_MOD_NAME kp->mod->name
+#else
+#define KP_MOD_NAME NULL /* wildcard */
+#endif
+#define FMT_QUERY_SIZE 128 /* typically need <40 */
+/**
+ * param_set_dyndbg - bits => categories >control setter
+ * @instr: string echo>d to sysfs
+ * @kp:    kp->arg has state: bits, map
+ *
+ * Enable/disable prdbgs by their "category", as specified in
+ * DEFINE_DYNAMIC_DEBUG_CATEGORIES arguments.
+ *
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
+{
+	unsigned long inbits;
+	int rc, i, matches = 0, totct = 0;
+	char query[FMT_QUERY_SIZE];
+	const struct dyndbg_bitmap_param *p = kp->arg;
+	const struct dyndbg_bitdesc *map = p->map;
+
+	if (!map) {
+		pr_err("set_dyndbg: no bits=>queries map\n");
+		return -EINVAL;
+	}
+	rc = kstrtoul(instr, 0, &inbits);
+	if (rc) {
+		pr_err("set_dyndbg: expecting unsigned int\n");
+		return rc;
+	}
+	vpr_info("set_dyndbg: new 0x%lx old 0x%lx\n", inbits, *p->bits);
+
+	for (i = 0; map->match && i < BITS_PER_LONG; map++, i++) {
+		if (test_bit(i, &inbits) == test_bit(i, p->bits))
+			continue;
+		snprintf(query, FMT_QUERY_SIZE, "format '%s' %cp", map->match,
+			 test_bit(i, &inbits) ? '+' : '-');
+
+		matches = ddebug_exec_queries(query, KP_MOD_NAME);
+
+		v2pr_info("bit-%d: %d matches on format <%s>\n", i,
+			  matches, map->match);
+		totct += matches;
+	}
+	*p->bits = inbits;
+	vpr_info("total matches: %d\n", totct);
+	return 0;
+}
+EXPORT_SYMBOL(param_set_dyndbg);
+
+/**
+ * param_get_dyndbg - bitmap reader
+ * @buffer: receives string rep of bitmap
+ * @kp:    kp->arg has state: bits, map
+ *
+ * Reads last written bits, underlying prdbg state may have changed since.
+ * Returns: #chars written
+ */
+int param_get_dyndbg(char *buffer, const struct kernel_param *kp)
+{
+	const struct dyndbg_bitmap_param *p = kp->arg;
+	unsigned long val = *p->bits;
+
+	return scnprintf(buffer, PAGE_SIZE, "0x%lx\n", val);
+}
+EXPORT_SYMBOL(param_get_dyndbg);
+
+const struct kernel_param_ops param_ops_dyndbg = {
+	.set = param_set_dyndbg,
+	.get = param_get_dyndbg,
+};
+EXPORT_SYMBOL(param_ops_dyndbg);
+
 #define PREFIX_SIZE 64
 
 static int remaining(int wrote)
-- 
2.31.1

