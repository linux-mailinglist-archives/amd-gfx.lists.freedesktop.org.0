Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D50337120E
	for <lists+amd-gfx@lfdr.de>; Mon,  3 May 2021 09:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AAD6E072;
	Mon,  3 May 2021 07:35:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EF46E873
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 May 2021 05:06:12 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id b15so3353366pfl.4
 for <amd-gfx@lists.freedesktop.org>; Sun, 02 May 2021 22:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vkwodlzPuswZX36UULvqpGAyXMlhiyqxqgMMR+wsn/g=;
 b=eqOPXZ405QGSAfKdidGpykTin6aOgHrzeqTfYQ4nV3CJHfysaWQhp/2XJDWj+mcrCu
 3MZw3qM5sLPRMaRUEgJAwgPCFTa29MHcr0vqwAg1QcbhffE+Ejzi2bIN9hyVVY3C0YxG
 daeTW64oG6UhfoeyA4ejA/0PMIvicDM9Z4PAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vkwodlzPuswZX36UULvqpGAyXMlhiyqxqgMMR+wsn/g=;
 b=mD0pSJzQTVRkvm6hv5/iX/62xK4LjY3BULOOgJien0BEg24rb9u4BAnMr5SVBWhtZU
 cY47yw3ieO1hzmfod5k3IccECkrChUjeAjTUnwF8efibaJ3uMUwS0fAar5RRkXYguDcJ
 VA9IrLwTOFiQjfhLwiyk7ZlkwRIywY5baYu/faJue5DVJ6JmobrGoYv4OqgEd8qSsbVz
 Dps1K5ziGmOCIe/eBj8sCIjBwysQ0Xi3wHO9jMgKdxu9uJWK8CsoMkqSFUDa0ZRIno7r
 afPCHkF736f/l+TU6OuEAJkqBHsFR7ST0d8jf58jugMk/9LZgXPtfkFs8PWPnUQyb0oW
 okqg==
X-Gm-Message-State: AOAM530yAsgZYuXAg4ZqCmHxSDAcdVqW1U/ZiWT1feIAH4/eZf+dBtIM
 vuLA2LVfD8qlV4n1BS1kzByI9g==
X-Google-Smtp-Source: ABdhPJwrNT9OoQVR40I3+lYvVv4+9nyLd7c3AniqwdJ+4Wlqg7gno9fSObobRVa/3hiZPBFuzewOcA==
X-Received: by 2002:aa7:864b:0:b029:272:947e:85d7 with SMTP id
 a11-20020aa7864b0000b0290272947e85d7mr16806869pfo.45.1620018372448; 
 Sun, 02 May 2021 22:06:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l10sm7722053pjy.42.2021.05.02.22.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 22:06:11 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 2/2] drm/radeon: Avoid power table parsing memory leaks
Date: Sun,  2 May 2021 22:06:08 -0700
Message-Id: <20210503050608.2158996-3-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503050608.2158996-1-keescook@chromium.org>
References: <20210503050608.2158996-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=5587411a193bf9edeee00e4cedc613b3ef4ab595;
 i=RLpnWS4N4EAN7vS2kSGJsC2/Z1bOXLnXB/5m+ZzGvSQ=;
 m=pxFMtRfS+5OYF3CVbar6V5LSKxDznZRhhtHzAGrKHyk=;
 p=Y3P6ZdBpqNetVNCsZST5lNppgqyKAxbk7rqUPN2j2Rg=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmCPhL8ACgkQiXL039xtwCY2zRAAqlP
 BnaPQIK2UkL4N+J8Uhn6rf1DwF1TCalirs9jwqPngXwYss6neOBwTG0T//WVb9QMr3BjtjbB3El+Q
 kJLWL+uRdkGC5WGVTTxB1Rt7CBODIQeVjpm2B8sxORQusgnG88c8xZD4i3Jn90st/270iUG+TWd7o
 sclb7HBIRr8pwjmqUeWNq5RjdJ069jrLmTJsn6xJUd+q/Hb4APCe9u3NrltjK8dPgwgv2q951nhk2
 jwP+1ToRJR5x4OISD9QGGGQsZ+AeJMOlQLzW0IDfONECA2/l6oiOz5PgaGJWIwzlrrxcmBIG6GfUr
 O8WfnoP147xN3CMVemI3aSR5Xxs2umK8vElvriITY2OGGE8WQ6ar/sE56bYQISGnWDfHT3MKhLDYU
 fnZO0AaZTvkXpP/iReTJfWb9yLsIXVz1QkbxQ8QfI00RLaU3rLpSAmNxgtWZbe09+sbgsifNbzKaN
 pa2FarA6u9sKQ+PeJi9LtsbVXQarDp4C97vxj+ZFDIo9FSrjEL1pzlQSo4amuKBvKbkRBfRKXCygd
 rafoxsTZjaFTlS1PycdtphI2NGWAndJKDOIw/dS3ixkPykFEJ+3mP/3Nf/qMOXyuu0KyKxs5MnrAc
 fzYxUrpYMH74s2EiOc/0ZSZBxFewKhTTy0F04ZfI3kF4GKndUDNE19uUpYJdiz6w=
X-Mailman-Approved-At: Mon, 03 May 2021 07:35:12 +0000
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
Cc: "Erhard F." <erhard_f@mailbox.org>, Kees Cook <keescook@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Avoid leaving a hanging pre-allocated clock_info if last mode is
invalid, and avoid heap corruption if no valid modes are found.

Fixes: 6991b8f2a319 ("drm/radeon/kms: fix segfault in pm rework")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/radeon/radeon_atombios.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index f9f4efa1738c..28c4413f4dc8 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -2120,11 +2120,14 @@ static int radeon_atombios_parse_power_table_1_3(struct radeon_device *rdev)
 		return state_index;
 	/* last mode is usually default, array is low to high */
 	for (i = 0; i < num_modes; i++) {
-		rdev->pm.power_state[state_index].clock_info =
-			kcalloc(1, sizeof(struct radeon_pm_clock_info),
-				GFP_KERNEL);
+		/* avoid memory leaks from invalid modes or unknown frev. */
+		if (!rdev->pm.power_state[state_index].clock_info) {
+			rdev->pm.power_state[state_index].clock_info =
+				kzalloc(sizeof(struct radeon_pm_clock_info),
+					GFP_KERNEL);
+		}
 		if (!rdev->pm.power_state[state_index].clock_info)
-			return state_index;
+			goto out;
 		rdev->pm.power_state[state_index].num_clock_modes = 1;
 		rdev->pm.power_state[state_index].clock_info[0].voltage.type = VOLTAGE_NONE;
 		switch (frev) {
@@ -2243,8 +2246,15 @@ static int radeon_atombios_parse_power_table_1_3(struct radeon_device *rdev)
 			break;
 		}
 	}
+out:
+	/* free any unused clock_info allocation. */
+	if (state_index && state_index < num_modes) {
+		kfree(rdev->pm.power_state[state_index].clock_info);
+		rdev->pm.power_state[state_index].clock_info = NULL;
+	}
+
 	/* last mode is usually default */
-	if (rdev->pm.default_power_state_index == -1) {
+	if (state_index && rdev->pm.default_power_state_index == -1) {
 		rdev->pm.power_state[state_index - 1].type =
 			POWER_STATE_TYPE_DEFAULT;
 		rdev->pm.default_power_state_index = state_index - 1;
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
