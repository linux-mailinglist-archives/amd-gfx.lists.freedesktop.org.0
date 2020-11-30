Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 711772C92CE
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Dec 2020 00:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68F689C82;
	Mon, 30 Nov 2020 23:37:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D862289C82
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 23:37:58 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id u4so12679653qkk.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 15:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/YktHTu66i1Go+x3sdLHYJY9LalYke+JQpvNtmH9eT8=;
 b=HvhkIE0qrR/kU1q9SCyUeIMHYD2/8TyOZudUUh6UGPGv3EVZmd8RrWFH6kjkUMTuAZ
 Q2TCZRVO54tg99kDkLkjGs2go60SbD0vs8rpsZ5tjvG2UxeazNgr1UT78DQbaW+vRCzJ
 QDKXgPN5zsfP9b2AhYwsO7K63L3HLZCHe69v/0BJh1kUUxwrDscZA0DmxP2ZsLg6K04L
 XY542XBh8Bv0C83fsZVfHDFCTsuc9K9TVK/UCVbQ7Tg4x2zaUXYV5becrFNGaaXTQsDQ
 wjvUpWgcXWGLuG4Dcsn3UxxsbKxG82BvWQ7e6GtYHCsAnjyzqE8NSxAFwh9JYVWCgTUj
 k5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/YktHTu66i1Go+x3sdLHYJY9LalYke+JQpvNtmH9eT8=;
 b=ZTkbsqFWZRHCD5S04ig5i39LB0oY8xztHIkp6BuX+XGkjU4R9rBDkvO+wA7MbFM5h9
 tTVubQsaPTemlfh38cRP8mbPCob8kOrRIq0ctIQ1fVyaj0HRuXS8o9WJ8i1Sm8up2FT3
 VsZqaYgU7zZ23z+n9vZq5eX1JCwUwURdQ38Qh+1V+VV96Ozh5TvdRgrWh4lDaNsysOvM
 xlPTkFsKXNg05tNeBOPMA7E+/Sr8NJ5CFq2o2ljEBUBRT0905gtPVTaQTBRiobrGNeRO
 TBTwxtmJ+0o1xNrjyfOHASddkMaMMHraFl5ccNrsX590p4WQOeD/fnR/lWq3DzVtPpUN
 EKfA==
X-Gm-Message-State: AOAM531T3DPi1qZbGDoQWaUJ75aOmBnUMeoaVxNLeYRCjsxR1W62yI2k
 ydtdfJR9ad8Q9IZE8oCppuiMAQP9nxw=
X-Google-Smtp-Source: ABdhPJxgf3KmKX4AHJ+750n8zKJ2LnpKeYN+Y/gqrN8ozYf9sl3GErrqMNqOhpJyfKPeEPKgMKf+HA==
X-Received: by 2002:a05:620a:806:: with SMTP id s6mr38770qks.193.1606779477976; 
 Mon, 30 Nov 2020 15:37:57 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.5])
 by smtp.gmail.com with ESMTPSA id q31sm27880qtd.23.2020.11.30.15.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 15:37:57 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/powerplay/iceland: return an error if copying to
 smc fails
Date: Mon, 30 Nov 2020 18:37:49 -0500
Message-Id: <20201130233749.387023-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rather than just silently dropping it.  Also fixes a set but
unused variable warning.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
index 6a0f581de999..03df35dee8ba 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
@@ -2156,7 +2156,7 @@ static int iceland_thermal_setup_fan_table(struct pp_hwmgr *hwmgr)
 
 	res = smu7_copy_bytes_to_smc(hwmgr, smu7_data->fan_table_start, (uint8_t *)&fan_table, (uint32_t)sizeof(fan_table), SMC_RAM_END);
 
-	return 0;
+	return res;
 }
 
 
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
