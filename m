Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914F75A37A2
	for <lists+amd-gfx@lfdr.de>; Sat, 27 Aug 2022 14:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BC610E677;
	Sat, 27 Aug 2022 12:36:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0229B10E6C2;
 Fri, 26 Aug 2022 07:24:36 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso739833pjj.4; 
 Fri, 26 Aug 2022 00:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=YlkUnf3+W4a/WjCpnPyFQgyVY7X5ih8bJPCrzi0qPuo=;
 b=CIW0pGf/u/t99gjOXibOein6cCbSDOUW3AZ6CUaNlRXFkxOg/YJmkgdE6hqISHloQQ
 BAfXaQ/4GGoDH5jUlfb2pB5gCRSePQBZ4jbH4v3djEPpbcgRzwtbVXrXzs6TkKuBxWzl
 N71OqSLmZjNSjNbo+RusFj/7skLKORw8skk1kLDr850IX2oHuy3hPWmYpN5ZteSvfSFx
 +QMgWbJMM1ZFYf8I6yvmsrAjvTqpDaIFTFfHtuXMf0S7mHiWMW9+lOwIGD4f9JRZ0RyP
 +f9LjmSxQMmGKdAshFmwsq8ev5tZcXY36rr+b8f2rcqQ+KOyFatXJnwz5l+sUbKCuKYs
 0KXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=YlkUnf3+W4a/WjCpnPyFQgyVY7X5ih8bJPCrzi0qPuo=;
 b=3afdC60KfLuD8csctpRArMaQ26b6nDKHGpEH8pMusdT0ypsRcSjMA0kyg970DDKts/
 ZFqrRSOXE/uzIYcU5n95qAkeEgcXxqs54VKhxoq1phQSSLlhl6WrR+ogftlW7eiNicuD
 uWcQ3OtqmlfHg0y1h/yXsuacRZv6TG45quT9Yv5FZHrz1N1gZNgQwPAX3ztputgF7eNO
 ot569HLzy+YemK6PMO2a8N7DVlMz0RaqKGb51ARYvOoj+HZwUtMk2Pw5wSUIJKppw9Fo
 6yQwRei2RxBZrw/peNH6hm59L5CsadNTf1PuwP2ARq/Uw7AMFiQti3jHKnufFZgg5X5l
 n/eQ==
X-Gm-Message-State: ACgBeo2H/B5b0tamk9xTG0nLgWfidxXxVB2FJYGaKT9jP6qMLALmXov6
 h6AWTvLPruYLh1Wfi7qz69c=
X-Google-Smtp-Source: AA6agR5HyqBo0oZgQZZq5UC/wOzHLibv7ZVIrS6bRpCelNOCiG5Rg5WRYYINvIpRdM12ePAv0ZNXOQ==
X-Received: by 2002:a17:90a:5988:b0:1fd:6a33:abf with SMTP id
 l8-20020a17090a598800b001fd6a330abfmr715935pji.69.1661498676588; 
 Fri, 26 Aug 2022 00:24:36 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 o186-20020a62cdc3000000b005289a50e4c2sm930463pfg.23.2022.08.26.00.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 00:24:36 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: alexander.deucher@amd.com
Subject: [PATCH linux-next] drm/amdgpu: Remove the unneeded result variable
Date: Fri, 26 Aug 2022 07:23:57 +0000
Message-Id: <20220826072357.252676-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 27 Aug 2022 12:36:42 +0000
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
Cc: Jack.Xiao@amd.com, guchun.chen@amd.com, airlied@linux.ie,
 Bokun.Zhang@amd.com, Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 ricetons@gmail.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 ye xingchen <ye.xingchen@zte.com.cn>, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value sdma_v5_2_start() directly instead of storing it in
another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 83c6ccaaa9e4..95689ef4be10 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -1413,12 +1413,9 @@ static int sdma_v5_2_sw_fini(void *handle)
 
 static int sdma_v5_2_hw_init(void *handle)
 {
-	int r;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	r = sdma_v5_2_start(adev);
-
-	return r;
+	return sdma_v5_2_start(adev);
 }
 
 static int sdma_v5_2_hw_fini(void *handle)
-- 
2.25.1
