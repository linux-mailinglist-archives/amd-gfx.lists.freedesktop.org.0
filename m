Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8F1FE079
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2020 03:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FAE6EA50;
	Thu, 18 Jun 2020 01:48:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412F56EA50
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jun 2020 01:48:53 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z2so1184203qts.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2020 18:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eznk364WTeVuO/KdGInkjNvyQXyMDBHlJsoIoglL+yQ=;
 b=kL7kw7ZraetBWdvYaEf+IuBQE2q7oC/jfp72IUHAnAo19rW1jGbqo0wEEHaN2VdeEW
 dbFBiZzw5I62ZHsRTXGQE7eQ0oPHRweapQ/3wXamz6fgDePZpBaXTibMPBkgsp+eR2hf
 iWTkolApUL2mZSXN/MG7rZV5fouvzNankHREM4HErNDJphH2+dfTSeJA9Q2KHhnjrDyq
 cUhR5XwdHTTbVIkBXXWH7ii1SG/tKy5xEdHo9ErGAgu3q92BdZPtVjECn+ZyLNV8D/0w
 61o973YAjeq1IBwbH5vPXvsVFlNCf1ej4SA4KNAcp4jXEQHWz9PsJI8oIyZM5xt8kFOA
 3pWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eznk364WTeVuO/KdGInkjNvyQXyMDBHlJsoIoglL+yQ=;
 b=iAqvazR1SIB0P7UN3q2xXEL0d46MP9IiucCPSTAUlrqwuNG5aIdG53+t2WU3J2ue5c
 /pTS43wPYZM0lLue+T+tRQMwJsRsV2jU46GjRZK2RYubBu7sHG3gVWo3ZpFMX3/ftK6z
 9jG2iyK7RhHyAZDC4WO2MS49mz8NyXmQ0esxU3g4tFkN9yt1ThvF9c8CDdIwl3+HSN0c
 6UbS2R1UGI+Xn3llo0TmJRxY7/rLGa7XnIPa3mEffsmxotFGYuEzoolYqIHt285M0PS+
 QZkYNlG6sGvFfZn+ODU0xbW6REqsR3xLHc/nJecHV4D+NE/ADMJ/5zRhqjwoGD1zuNsD
 aOpg==
X-Gm-Message-State: AOAM530t9K/sqTiT4+TWWOwJS65iQ5qNvCi1/jq/2ufWCS1fIIKftP8w
 LSykhN/zvggJk6p2WjWnyBzkYXlm
X-Google-Smtp-Source: ABdhPJyPpJ3SibLT7JBhlBvz3rGqmVB6KJVzPclnXmxGDihrkzrBGx6pqMsgb/RBZtbjTHzz4bkpfg==
X-Received: by 2002:aed:2a67:: with SMTP id k36mr2208554qtf.359.1592444932167; 
 Wed, 17 Jun 2020 18:48:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.51.205])
 by smtp.gmail.com with ESMTPSA id c4sm1684705qko.118.2020.06.17.18.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 18:48:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu/display bail early in dm_pp_get_static_clocks
Date: Wed, 17 Jun 2020 21:48:34 -0400
Message-Id: <20200618014835.3775523-1-alexander.deucher@amd.com>
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

If there are no supported callbacks.  We'll fall back to the
nominal clocks.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1170
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
index a2e1a73f66b8..7cee8070cb11 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
@@ -530,6 +530,8 @@ bool dm_pp_get_static_clocks(
 			&pp_clk_info);
 	else if (adev->smu.ppt_funcs)
 		ret = smu_get_current_clocks(&adev->smu, &pp_clk_info);
+	else
+		return false;
 	if (ret)
 		return false;
 
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
