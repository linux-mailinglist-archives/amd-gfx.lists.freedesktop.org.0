Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA5D54209B
	for <lists+amd-gfx@lfdr.de>; Wed,  8 Jun 2022 03:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B782610E7EE;
	Wed,  8 Jun 2022 01:09:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1FB10E98A
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Jun 2022 01:09:21 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 t22-20020a0568301e3600b0060b333f7a1eso14132301otr.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 Jun 2022 18:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TH0uwVgHZAwq0jKJ2rY7rr0n6nybjWr8m8j939NAcUE=;
 b=qqCZGsFj3WTgMs3F8eplwxhY8tlcCpyszawL420QxCE1KGOlb2XREx+0YHhA/DXDht
 y6FTG7VikxjZzWmeWN6N7dhQM6c04xnY1Y9LYsQa0IHup3PFgpYPGjBz949gatfecqpi
 UTKgVldl/uVChP2nADj5fLDq6mcJx1CAkykZRO+OF6G0E/S+cXNXjIZRZYjb71pMMMQu
 BR4xCLhM2SA+nS2/WaI7iPZmaNvV1DOWF24hrKmioPRzxxEm7vDUUV1peqgLyn8ZlhgR
 Hn5h/IxgLHkgxbj9VkurqF+8cQfRShUn2s3hqev+lUZXCEtavv3dWnsflftx7KmbvLnC
 k0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TH0uwVgHZAwq0jKJ2rY7rr0n6nybjWr8m8j939NAcUE=;
 b=PAHz5PClaCmlhjnnciy5EsgbmLDwwGRuWb68WHtmWn6QoHPxIeU9chUTPwNT30TzUK
 i6TVRtnbd+pIZnSuevhdFUkmzRelQLXQE/Y5ys82qLKfInAlestwsqy4Qli9RJe3SuZv
 ZiB4v1q+3Fz+eL8J9tHVaA6dcN+46MzYpkVTYzwQ5ylXTmXH2POEob54Kc988BeYZRjn
 yhFeaL2p7Mu5FJWPhca64076H2tcD9BSOx9Tkt1PPHBltvHNleFn7c6mWN9f31eHuu03
 +5Wn2Ecvw19xFQj4fQWnOFGN9KE4G+P/5Tm6PYL/X9qu3o2dHnppwllwxJ0bwsZpWYN4
 DRAQ==
X-Gm-Message-State: AOAM5330DnLcZaI2WYUImfKGGUrDTOjCd/rgKduUmj5M2ONilzAvklDX
 4QVXy04+mEsOZZGxOxsDIjpPDw==
X-Google-Smtp-Source: ABdhPJzuiHfBdj/hVttQ2zZajzaYxynowqNPbS/D5BqnB7NeOLdkb2qK7wfnz1fb68HTl5Wobxs8vA==
X-Received: by 2002:a05:6830:1456:b0:60b:f7b9:fc49 with SMTP id
 w22-20020a056830145600b0060bf7b9fc49mr6437094otp.260.1654650560284; 
 Tue, 07 Jun 2022 18:09:20 -0700 (PDT)
Received: from fedora.. ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a544e90000000b0032b1b84f4e3sm10343057oiy.22.2022.06.07.18.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 18:09:19 -0700 (PDT)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Jun Lei <jun.lei@amd.com>,
 Nicholas Choi <Nicholas.Choi@amd.com>,
 Harrison Chiu <harrison.chiu@amd.com>,
 Mark Yacoub <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
Subject: [RFC 2/3] drm/amd/display: Move bw_fixed macros to header file
Date: Tue,  7 Jun 2022 22:07:10 -0300
Message-Id: <20220608010709.272962-3-maira.canal@usp.br>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220608010709.272962-1-maira.canal@usp.br>
References: <20220608010709.272962-1-maira.canal@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The macros defined at bw_fixed are important mathematical definitions,
specifying masks to get the fractional part and the maximum and minimum
values of I64. In order to enable unit tests for bw_fixed, it is
relevant to have access to those macros. This commit moves the macros to
the header file, making it accessible to future unit tests.

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 .../gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c    | 14 +-------------
 drivers/gpu/drm/amd/display/dc/inc/bw_fixed.h      | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c b/drivers/gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c
index 6ca288fb5fb9..d944570e5695 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/bw_fixed.c
@@ -26,19 +26,7 @@
 #include "bw_fixed.h"
 
 
-#define MIN_I64 \
-	(int64_t)(-(1LL << 63))
-
-#define MAX_I64 \
-	(int64_t)((1ULL << 63) - 1)
-
-#define FRACTIONAL_PART_MASK \
-	((1ULL << BW_FIXED_BITS_PER_FRACTIONAL_PART) - 1)
-
-#define GET_FRACTIONAL_PART(x) \
-	(FRACTIONAL_PART_MASK & (x))
-
-static uint64_t abs_i64(int64_t arg)
+uint64_t abs_i64(int64_t arg)
 {
 	if (arg >= 0)
 		return (uint64_t)(arg);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/bw_fixed.h b/drivers/gpu/drm/amd/display/dc/inc/bw_fixed.h
index d1656c9d50df..064839425b96 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/bw_fixed.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/bw_fixed.h
@@ -33,12 +33,26 @@ struct bw_fixed {
 	int64_t value;
 };
 
+#define MIN_I64 \
+	(int64_t)(-(1ULL << 63))
+
+#define MAX_I64 \
+	(int64_t)((1ULL << 63) - 1)
+
+#define FRACTIONAL_PART_MASK \
+	((1ULL << BW_FIXED_BITS_PER_FRACTIONAL_PART) - 1)
+
+#define GET_FRACTIONAL_PART(x) \
+	(FRACTIONAL_PART_MASK & (x))
+
 #define BW_FIXED_MIN_I32 \
 	(int64_t)(-(1LL << (63 - BW_FIXED_BITS_PER_FRACTIONAL_PART)))
 
 #define BW_FIXED_MAX_I32 \
 	(int64_t)((1ULL << (63 - BW_FIXED_BITS_PER_FRACTIONAL_PART)) - 1)
 
+uint64_t abs_i64(int64_t arg);
+
 static inline struct bw_fixed bw_min2(const struct bw_fixed arg1,
 				      const struct bw_fixed arg2)
 {
-- 
2.36.1

