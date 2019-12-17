Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 065AB122F72
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Dec 2019 15:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C5989CD7;
	Tue, 17 Dec 2019 14:55:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88E389CD3
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Dec 2019 14:55:17 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id n66so1566412ybg.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Dec 2019 06:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ou6cO1EnPl7NJ7BuKaXrQRakZbhcnd/tFmvK0wcieM=;
 b=BzC4f9ue6zNMQ3g776muYALV0bTRCVf5cAc0xjMUgZFdhzO6mEdRgjWcRXe8ZBQe3g
 iTm77tUIfUyEuI673zuxjTPZQu6d3e2DE6/3zNo2XL0ZF1KDFjyLl5ZB3tiDZEC1yTIm
 lbM1JQi3TzzNpSKVSOQwyK85zQILmgTRFo+0dU1hEZNQvU4vCHhT7V/nOM/Fgwy4jj7P
 cCLd6U91jNk7g5hAiNcS3zT+1Nkxq/MDR3gBvZNnVkzV/iK7sQ6fJiynYQIn5JNysrSn
 VkeDSM0cCW64LVvg6Winf8wbj2RXBk5WXlkFBelMuPNWIFFhizJGCblLcDlisAJDJhO/
 Ahrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ou6cO1EnPl7NJ7BuKaXrQRakZbhcnd/tFmvK0wcieM=;
 b=EtVzxruC4rOU+fSKLEFIxbTuGAabfb9+0jNeNX3eRtficG5k0hTTt9PpZdy1fWCHgo
 798n+lWI0RrJcIEVnjOYtVC2f5c7QtSK/EUXScKUBEzY0O948JC8wbRaDuNuWvGb5LF2
 h+dpoWgfnpRvwKxLapNPKNfOtGbaOUtrp3Z1AvXPoEx/1Wk1+lUCeIkaWjLH0XvFSJLZ
 nWP8bfsRn8UEGxZ2PRLuYq/GB28DreIjIvSzsNnHe8MHwb9vUn4l1JJyvG6j5Sf7DiP9
 jbP/MJOw6kouZvd7IXzKVxZDDofdGvczM9k0aRxJnlJuqrndmFH0xFRxHXUHvPnCy6gE
 g/Gw==
X-Gm-Message-State: APjAAAX0x6ux0MRqbaCKweU5GAs17/xStTm8aXiuNr4dfxQHu3ziewUG
 x7NTSyTOdIQIoW6dMWMd4Eeoj8I/
X-Google-Smtp-Source: APXvYqwt+Srn2YJs0duhgeCI7BnjnM5PgTQ/f2zxe8MwJkcura1Kiqdeptg41VD/v1Cn86ohESX7Ig==
X-Received: by 2002:a25:4d87:: with SMTP id
 a129mr24061892ybb.254.1576594516809; 
 Tue, 17 Dec 2019 06:55:16 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id j11sm9978146ywg.37.2019.12.17.06.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 06:55:16 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/amdgpu/smu: add metrics table lock for navi
Date: Tue, 17 Dec 2019 09:55:03 -0500
Message-Id: <20191217145505.1319348-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191217145505.1319348-1-alexander.deucher@amd.com>
References: <20191217145505.1319348-1-alexander.deucher@amd.com>
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

To protect access to the metrics table.

Bug: https://gitlab.freedesktop.org/drm/amd/issues/900
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index 15403b7979d6..102fddda925b 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -564,6 +564,7 @@ static int navi10_get_metrics_table(struct smu_context *smu,
 	struct smu_table_context *smu_table= &smu->smu_table;
 	int ret = 0;
 
+	mutex_lock(&smu->metrics_lock);
 	if (!smu_table->metrics_time || time_after(jiffies, smu_table->metrics_time + msecs_to_jiffies(100))) {
 		ret = smu_update_table(smu, SMU_TABLE_SMU_METRICS, 0,
 				(void *)smu_table->metrics_table, false);
@@ -575,6 +576,7 @@ static int navi10_get_metrics_table(struct smu_context *smu,
 	}
 
 	memcpy(metrics_table, smu_table->metrics_table, sizeof(SmuMetrics_t));
+	mutex_unlock(&smu->metrics_lock);
 
 	return ret;
 }
-- 
2.23.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
