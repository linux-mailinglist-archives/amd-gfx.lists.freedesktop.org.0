Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 380E61EAC19
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918DB6E9F6;
	Mon,  1 Jun 2020 18:30:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5776A6E9F1
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:30:23 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id b27so10035601qka.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/lOcy89ZPw6vNAxegDuxWVGJbEBYOyaga2oNNzY4DpY=;
 b=XyACr3g69wLkdQ+SXfl/8H4Y/kHY1ycoNe/rAbsdBVRAsoKJugH+JVSyt60slzP/Om
 XxLt5A7ALb22t6mkr1u9r3V/ZdF1ibXMB1C85WPNpMIvQ4VkdfxJNuGQL4pjkaQnsQSq
 x98Grm+YZwCkspeMtBXmhtgg9Z6Cl7IC6uC1y+szyeSlx8/xYke6mS9eQXZfq+KrhbkT
 PTTdBfaKCowuHRUwNO64oWXU/GzRfRZW3pIbzgVWu3Ykj5UxGtciHGP5MoJcpDMOdrDI
 vRSc77JtjCnlqVVal8EKxUQEPqwBzsjBDRY7STDqqp73qe+geJMazdp2gRa7mKuCNb0I
 zO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/lOcy89ZPw6vNAxegDuxWVGJbEBYOyaga2oNNzY4DpY=;
 b=jK7mE3z7wa4I2/S1qFZn9GV7CB9YsJTicC6a/4Svv8N7KFYZqDvlsJaBH12t540W2q
 zR/nbZu4N/bRm3gZudp9SMObAnobYfmLZoNLciV5SCsFaXnMNva6AGZeen515kzMbF58
 MM7lxL63mRf6iMdl8rietPaRPVYcp3nWGDmjXibM3Op0BTDbCkf4YuUQ7VX6SLXaWWcv
 aNZt/cjg1+qggoI+1Ow4eka4ChnJB3ORC1miKZbFdS/zQTa5sTJdyaYqSaVpovaat/EU
 18h2g+3f0iflOIdIYkPu5+xDCyFq0ZC7SiWz/Ep6kTlPSoRpdjX01ctWZo/Sj+LyXJ3/
 FkxQ==
X-Gm-Message-State: AOAM5316/Em0KxRYMm//vV/E+LcSrS4l7CW5KARIXVM6X3yHQ3VGY14W
 uXpERrDyJkD/h9PycMMMi/xCJxa0
X-Google-Smtp-Source: ABdhPJzNWDPFvh7lqfURYUbTl0cyuPR8wfzJRFEObGs70/kXAa220YP9qidgxKxM8k50E4YbH/jiSw==
X-Received: by 2002:a37:be05:: with SMTP id o5mr6490187qkf.309.1591036222218; 
 Mon, 01 Jun 2020 11:30:22 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id z194sm8592qkb.73.2020.06.01.11.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:30:21 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 207/207] drm/amd/display: Add DCN3 to Kconfig
Date: Mon,  1 Jun 2020 14:29:26 -0400
Message-Id: <20200601182926.1267958-29-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601182926.1267958-1-alexander.deucher@amd.com>
References: <20200601182926.1267958-1-alexander.deucher@amd.com>
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 drivers/gpu/drm/amd/display/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 1911a34cc060..34ae4f3a32f4 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -17,6 +17,14 @@ config DRM_AMD_DC_DCN
 	help
 	  Raven, Navi and Renoir family support for display engine
 
+config DRM_AMD_DC_DCN3_0
+        bool "DCN 3.0 family"
+        depends on DRM_AMD_DC && X86
+        depends on DRM_AMD_DC_DCN
+        help
+            Choose this option if you want to have
+            sienna_cichlid support for display engine
+
 config DRM_AMD_DC_HDCP
 	bool "Enable HDCP support in DC"
 	depends on DRM_AMD_DC
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
