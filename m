Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E47F1EFF2D
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jun 2020 19:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42396E508;
	Fri,  5 Jun 2020 17:38:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542356E4FF
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jun 2020 17:38:00 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id a25so12752368ljp.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 05 Jun 2020 10:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v2RPwevKzEvUOUonTwAkZLpeDUxhkeZo2zDozwoA/PY=;
 b=Sc6N0LU17DcrV8g+HX23mJxI85BkHk0jM/WRaBkHuwpgf2ZhYuU4pXdm88iU35VfjU
 l1NWvDinc513RNfIKBRcWxHh8QJeXk3cEE6LVXmeyTnnHjqe8RqAQU2G7Jc32+9KxZQR
 XJB13Udk+yvfPCHFxyAWDaPFwq+BnC5B36O/1SF6JhndP8E2SfwHrkwC7DUlrPanJjL6
 ValWx91ytC+UsnCK4npGWSd0EMCniOX9Uh3zjFBXl/xwEVgmI4Pofx10Yg8Fzov8tcPS
 hgr/K06BjL+5puiFqD0tKqaRH5DxLlYLC9a2mdLZIqQrrTUqWjLjIR4+rhCTfsGoEEei
 DYrw==
X-Gm-Message-State: AOAM531fgEdnwLQfe1XJtU2L2fG45Nj7vxySjsQQiVFg3iAG6S4kSWGX
 7C7TWXo59GMYn+JsGTm9nnE=
X-Google-Smtp-Source: ABdhPJzVqqz9tR4HxPTXi4jbiMDAs25LZATZhYzfPGtAEA8nsnjJ3hMQXptQB7JWYdCX4bmoCW4atw==
X-Received: by 2002:a2e:7c03:: with SMTP id x3mr1433951ljc.227.1591378678627; 
 Fri, 05 Jun 2020 10:37:58 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.googlemail.com with ESMTPSA id w1sm1049514ljo.80.2020.06.05.10.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 10:37:57 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Leo Li <sunpeng.li@amd.com>
Subject: [PATCH 1/2] drm/amd/display: Use kvfree() to free coeff in
 build_regamma()
Date: Fri,  5 Jun 2020 20:37:43 +0300
Message-Id: <20200605173744.68500-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Jun 2020 17:38:26 +0000
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
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Denis Efremov <efremov@linux.com>, Daniel Vetter <daniel@ffwll.ch>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Use kvfree() instead of kfree() to free coeff in build_regamma()
because the memory is allocated with kvzalloc().

Fixes: e752058b8671 ("drm/amd/display: Optimize gamma calculations")
Cc: stable@vger.kernel.org
Signed-off-by: Denis Efremov <efremov@linux.com>
---
 drivers/gpu/drm/amd/display/modules/color/color_gamma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
index 9431b48aecb4..56bb1f9f77ce 100644
--- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
+++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
@@ -843,7 +843,7 @@ static bool build_regamma(struct pwl_float_data_ex *rgb_regamma,
 	pow_buffer_ptr = -1; // reset back to no optimize
 	ret = true;
 release:
-	kfree(coeff);
+	kvfree(coeff);
 	return ret;
 }
 
-- 
2.26.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
