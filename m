Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB84D8B6B70
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2024 09:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043B810F418;
	Tue, 30 Apr 2024 07:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ggHRAh8A";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8853010FF76;
 Mon, 29 Apr 2024 19:32:19 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7deb424da41so138367839f.1; 
 Mon, 29 Apr 2024 12:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419138; x=1715023938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Joa2204E/UxJqisgLdnZkw4M+LvVemhw6NjXgwCAr8=;
 b=ggHRAh8AskgudezjDN33A2jshqAnyXEgXhX99fNCnYtuVbq6I66rWqxzpuoLMHa56w
 S+dwQer+10I0la+DdwVR4auMKkJS3VjdMBqgHuM8j2v1cNNRie5/TgT8SDBNNE6QCVFj
 zy4S6Zb3/x9AK4aqR6feahgnmElvB2W2fQiDetUhsAIFj1nuEpyz1D6eVgJdLumB8xpT
 LSSF4E2INV8dFIUVe6kdfTnGTLS4xI7M5vF+Lcc5HAl31XDUXdCKncZLlAP/MfvxXzKP
 5XrsETOwLyb5gb+A431eJBx7iFZCtZPcNnv1x7yAzE6uKFD/S3XXeEaDfrchPQmbhLAL
 knBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419138; x=1715023938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Joa2204E/UxJqisgLdnZkw4M+LvVemhw6NjXgwCAr8=;
 b=nDsPufRgSg62U2Gn5iDLaSt9iTXkuFFcbwUaqRrT/WzUojSUkdkJUL2dfAeFMWBJJa
 vuY0pl/XMoHpOht+94AdvRXRuPfnt0fbGBggrGX/CFGXIQNRr1GjeOOnT+X859ZqoRt3
 H/oJw13Ocvh8Hy3aGInPWHKVpPBi2gLv5cdQkczmAHOAyJMA5n5H1dNaVADUk+oofDPD
 9y0ivBRqeO6FyINlrFIRpc7nTBaPNmdgvyL5CsIZV8pqRvrK07ZqxpRTlK+ylBybeSP8
 5oWe480q3gQhaifgPVACfQ75lUAgFp3SjljFio5s2VqOf3oe+XXbxoOA5NMDgU4y7T0x
 1K/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXalsWsSMYN2eSQbprfDcGWn0oshinwgcI8xm8x+tLnn6eBvxEQjLrE6u/IpagxknQO74L7FY6AWDm+LhYMtEGcc7BkPSbZ8sQFp5eElHGlyKoUQU8Yy0PINvuqjlSEC14264xWyPdfMrrr79MHI0WRSlzpwNzh7ddsZu4AeoIMi2F/vOJc72FrbiS0fjxaaIQ1k9MbUo3Ka5vjJF/qOTnllQY1pec+zO33EOlSe5XCbdg32fE=
X-Gm-Message-State: AOJu0YzRAEYnHoePay9mOmyY/s83n/J5CogFxkZUyZuonQnQseKTliDm
 pM8kXu4BUsBDltetHsDZ5Hjk3prgu86LUZU9RyYJ+hjwh+iM6YEpGRDB/n5r
X-Google-Smtp-Source: AGHT+IGTiODmp9/Hpma4qTIBG+7epNiV11HavVT2L36uk4LXH9pCF0sExJNXdX3JVHjQXaLaCttUUg==
X-Received: by 2002:a5e:8704:0:b0:7de:d55f:c1d3 with SMTP id
 y4-20020a5e8704000000b007ded55fc1d3mr2588947ioj.17.1714419137797; 
 Mon, 29 Apr 2024 12:32:17 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:32:17 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ukaszb@chromium.org, linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 05/35] dyndbg: make ddebug_class_param union members same
 size
Date: Mon, 29 Apr 2024 13:31:15 -0600
Message-ID: <20240429193145.66543-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193145.66543-1-jim.cromie@gmail.com>
References: <20240429193145.66543-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 Apr 2024 07:26:58 +0000
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

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.
ISTM this is simpler and safer.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4fcbf4d4fd0a..5231aaf361c4 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -124,7 +124,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 73ccf947d4aa..152b04c05981 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -799,7 +799,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.44.0

