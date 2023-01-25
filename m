Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2126A67BCBC
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Jan 2023 21:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7618210E162;
	Wed, 25 Jan 2023 20:37:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFA310E13B;
 Wed, 25 Jan 2023 20:37:53 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id i17so3781ila.9;
 Wed, 25 Jan 2023 12:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EdA5N9O88azw6KSZzcLHvp1KXfVV+O4YGK6Kf3ryNjQ=;
 b=eWr9Vnp1+TrIoDGMaE2O9wuMFg5AYKoezP9q+vbYB4d57F7KXB+syVX40kW/8TZwTd
 Rde29PkHcq9bnLyJEk496ReeconavD9eWjB5cMI2GrShu2CiVBSS2XRDeG5OWZcK/Yc2
 3HYIsT92B+4WmbYRJorIrShHbI/GYycQozfXncPNbT0PlReegakxI9iZaWShkQa8iv0J
 w8gQrNl/FWKM12zKxCKEmQFcL+h4purdLYw4vqPlkjvszKA77diAxdkwHSrQg7UN9un9
 KLFl1zMdDrIFrNTl6o6uoBdO2ixbTUktmoBSSkhEMSwzu8RD9Bu5guAV4KfoV41hwKpF
 RBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EdA5N9O88azw6KSZzcLHvp1KXfVV+O4YGK6Kf3ryNjQ=;
 b=54j6kHgfykq/HJVkVSwbtD/6O6IlMaA7gSoj0FTqkcZQMZHB/tUyOcqh9Si1vYIpvs
 chFD0IS3QOmdJ/k6t2kfXfdqzNRjayz9nmfQKkUWVTxZOG9npnvmCzpuh26RpA9aNeo+
 F5x38Ot5N8E268w0sP+ttNDkd8nCqruqQw1zk99yYtRul5n/9Y7vYKGYXPjNE7DWGc9k
 7oGtsNIAEPbgieF9SG7T1T5rXuoSaJ2Tdtq+2HhnaKJ+mjcFdqpQBbO/eb7kH3aRXnk2
 ohcJYFKpLlSEJzFm62Wuciud96LWGoomD9qtHNZbCJTym7glgLynOiqIsRVcjiI5yjy/
 XWlw==
X-Gm-Message-State: AFqh2kp9jSymBk4UBAzOL8cQop8V2xcJ2rBRESJqsWbHTsnOfT6VIamJ
 mo4E2KkkzDDbR4ythKeE6yw=
X-Google-Smtp-Source: AMrXdXtECMt3WOqQfbkmXVAsKNWzr5+QibSjG0wEYpIeQ2O0A8wTCh+BdCPfnEZboLgNa3QJmsDODg==
X-Received: by 2002:a92:ccc4:0:b0:30d:8d09:2545 with SMTP id
 u4-20020a92ccc4000000b0030d8d092545mr24461474ilq.8.1674679073036; 
 Wed, 25 Jan 2023 12:37:53 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a056e02128b00b00310a599fd43sm665104ilq.46.2023.01.25.12.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:37:52 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 01/19] test-dyndbg: fixup CLASSMAP usage error
Date: Wed, 25 Jan 2023 13:37:25 -0700
Message-Id: <20230125203743.564009-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125203743.564009-1-jim.cromie@gmail.com>
References: <20230125203743.564009-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch,
 Jim Cromie <jim.cromie@gmail.com>, robdclark@gmail.com, seanpaul@chromium.org,
 ville.syrjala@linux.intel.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

more careful reading of test output reveals:

lib/test_dynamic_debug.c:103 [test_dynamic_debug]do_cats =pmf "doing categories\n"
lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

That last line is wrong, the HI class is declared.

But the enum's 1st val (explicitly initialized) was wrong; it must be
_base, not _base+1 (a DECLARE_DYNDBG_CLASSMAP param).  So the last
enumeration exceeded the range of mapped class-id's, which triggered
the "class unknown" report.  Basically, I coded in an error, and
forgot to verify it and remove it.

RFC:

This patch fixes a bad usage of DECLARE_DYNDBG_CLASSMAP([1]), showing that
it is too error-prone.  As noted in test-dynamic-debug.c comments:

 * Using the CLASSMAP api:
 * - classmaps must have corresponding enum
 * - enum symbols must match/correlate with class-name strings in the map.
 * - base must equal enum's 1st value
 * - multiple maps must set their base to share the 0-62 class_id space !!
 *   (build-bug-on tips welcome)

Those shortcomings could largely be fixed with a __stringify_list
(which doesn't exist) used in DEFINE_DYNAMIC_DEBUG_CLASSMAP(), on
__VA_ARGS__ a 2nd time.  Then, DRM would pass DRM_UT_* ; all the
categories, in order, and not their stringifications, which created
all the usage complications above.

[1] name changed later to DYNDBG_CLASSMAP_DEFINE

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 8dd250ad022b..a01f0193a419 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.39.1

