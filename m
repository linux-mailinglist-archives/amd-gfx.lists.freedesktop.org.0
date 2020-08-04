Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E44AE23C17F
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Aug 2020 23:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1CE6E067;
	Tue,  4 Aug 2020 21:32:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5B76E03E
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Aug 2020 21:32:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f12so2884591wru.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Aug 2020 14:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hm6vvQCNB8lhjjgdZDH+zk/Q4v5q4HRwVjHg5LGRZhM=;
 b=0ckm9rENEFCcymU6hW9vxnXVYLiWhXEw5apwIFjKkObWFHrbJ2W02ff5gHaGHeBQnm
 TJpIU8wADhQj+Wiv1yUvycI0lLa9tzoZ13Knshda0VAXianJGjPp7cXaS4G/Qo2jQIHC
 1ZqqYfw5O0cGLGTnIP+COKU1JX5fHPEglwjCarOS3efgBRElL7J4MXKl+AujHoFejUPK
 7/A8lCWP8l2cQsvLF83Q3HpD0tM6nPbQrFv/Sadq+hOQc8mgSssZfDNg0wCiqO2bcngh
 L5qWwfqiOyu3XKvqs6zb1nLpVDB3QfybdgmyGktiBPDdMbptqVQXLbVJ/vo33zBD9C7E
 mg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hm6vvQCNB8lhjjgdZDH+zk/Q4v5q4HRwVjHg5LGRZhM=;
 b=YInJt23DUaC8J4Rw1FVvcXJFHVHPSmCFIDbs2S5MjpY/m6mt25FJaYSM1q9zJZUsWD
 yYj7fnB1Yevt9EG+NkNSI2B2FLVnRI4Rw8oiS/tVyK2Qe20HgSyUPv2CBx4oMy6dzac1
 7DUnmxV4McH+2xQsTCoDNJEnzm36JuTECC+B5lsa7VIsv3zOE6pJnVtLm5zBRcXxMVLe
 /e4fz/NMNt6w4aAkpP1B5qKGS8XUI4XdBSGsUe/3tzsD9orQKYUE6ep9uKsuZVZEvGMj
 TrdKFCkmGeBpSZglL7wyD7hgYyZai9vxaBdIIeZv33wCDNjw9y1eEFahp6caSdUwFldb
 lvyA==
X-Gm-Message-State: AOAM531/vToq5qIHHvNSDlaWJOfgF3zuaRu2surv2npRfPMQNwl667OE
 a+7NkQNYDMzD1p+tU6cDDM2JbRmNW5cPAw==
X-Google-Smtp-Source: ABdhPJwEZeJQb5h9FLNAtMw1J6L5MpeSuzX2gu6UNJc3EQQy6O1r3apIOmmtYIsnyn/BIDE6zZEQCg==
X-Received: by 2002:adf:ea4f:: with SMTP id j15mr20857075wrn.253.1596576729235; 
 Tue, 04 Aug 2020 14:32:09 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:ce92:471f:873f:fc56])
 by smtp.gmail.com with ESMTPSA id x11sm97612wmc.33.2020.08.04.14.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 14:32:08 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/8] drm/amd/display: Do not silently accept DCC for
 multiplane formats.
Date: Tue,  4 Aug 2020 23:31:12 +0200
Message-Id: <20200804213119.25091-2-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
References: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
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
Cc: maraeo@gmail.com, daniel@fooishbar.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Silently accepting it could result in corruption.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f348693217d8..005331c772b7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3637,7 +3637,7 @@ fill_plane_dcc_attributes(struct amdgpu_device *adev,
 		return 0;
 
 	if (format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN)
-		return 0;
+		return -EINVAL;
 
 	if (!dc->cap_funcs.get_dcc_compression_cap)
 		return -EINVAL;
-- 
2.28.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
