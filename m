Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE6130FBD4
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Feb 2021 19:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F0A6EE1E;
	Thu,  4 Feb 2021 18:47:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696816EE1E
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Feb 2021 18:47:20 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id j4so2217553qvk.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 04 Feb 2021 10:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lvu6pI0oVGAWMyVcRTO16TPbi/GSGcaM3u4eg+9Swxs=;
 b=Tt4vBcCNq56UJwe1BufD6yvMlQV9xp1539NjMq1mv+fK4tHOe8qh60ELrF1ELhqsM4
 9/zBn1Lc5Jb8GmulNN2/zxwFXDhBGKgLSyGDyt8I0Qu3RWOtKvbhY5YyiJM3IhjdrPoV
 mvjeVshsH4HvKveoIzhtDHoWZHY94Y8EWYuLQuO5X82CYmRBz0lhVw3yECxShJKebQl/
 nqqjflJeI3Pn81BVM1sy3i4nPqjpf4U1PyeYhfneiLAjCdvkpLqn3/hV0YfI3OizPVHu
 WMk+UhvkZnfCsASLNEGKi11MpUyjwS/XZSdyFxZGlcifEjkYP2IdSrSbaAtHcNYStIfd
 azQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lvu6pI0oVGAWMyVcRTO16TPbi/GSGcaM3u4eg+9Swxs=;
 b=keHzwgzsbAhsZZ1zFnZfBjvtwDy+p9pE4BtILKwE/nGjPy85VkuLj9i2Mi8KSN/HIV
 0Do3q5jQVG/5ca9OXW/OwWhSyJygvBtWcDju7fyVt3AQglogpqHsgcLS6UsNTq41tvLl
 UoAcKDOanRweQ0VE9HG5oqzOk71552lXAcgAM2u+AysT1fW/v5+ZJkqzIrKmX+VDMLn8
 rBbjilvXcSPW6aANSrAg3zbIaWTMMHgfxHaUd5MRyZOP1yotRym9pQ2BjWtDRSnbnhqA
 /U/SsI2aZ8JeHqH0CgVwnhH4cDL8/EM+9WIXWiasVCgsV0yvahFIlExBa3rMjnzg2Yz2
 2xFg==
X-Gm-Message-State: AOAM5339+ni0SEAlCWU1MFg++jxthgsipTYKUeqI2bvF5aCh09QLezRu
 yzmpzSTcapfFK2hXdRBcvC34CnsPJzE=
X-Google-Smtp-Source: ABdhPJw43nOsPi5tiLWv/XgKEwj+YRv9HaV7DjdTcGExLQnjZnlF6xS1GyXLFuyyZNXN/8msUhNB4A==
X-Received: by 2002:a0c:80cc:: with SMTP id 70mr816680qvb.29.1612464439525;
 Thu, 04 Feb 2021 10:47:19 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.237])
 by smtp.gmail.com with ESMTPSA id j188sm5833644qke.67.2021.02.04.10.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 10:47:19 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 7/7] drm/amdgpu/nv: add PCI reset support
Date: Thu,  4 Feb 2021 13:47:06 -0500
Message-Id: <20210204184706.168934-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204184706.168934-1-alexander.deucher@amd.com>
References: <20210204184706.168934-1-alexander.deucher@amd.com>
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

Use generic PCI reset for GPU reset if the user specifies
PCI reset as the reset mechanism.  This should in general
only be used for validation.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index e6878645df93..227e4a5db10e 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -564,7 +564,8 @@ nv_asic_reset_method(struct amdgpu_device *adev)
 
 	if (amdgpu_reset_method == AMD_RESET_METHOD_MODE1 ||
 	    amdgpu_reset_method == AMD_RESET_METHOD_MODE2 ||
-	    amdgpu_reset_method == AMD_RESET_METHOD_BACO)
+	    amdgpu_reset_method == AMD_RESET_METHOD_BACO ||
+	    amdgpu_reset_method == AMD_RESET_METHOD_PCI)
 		return amdgpu_reset_method;
 
 	if (amdgpu_reset_method != -1)
@@ -596,6 +597,10 @@ static int nv_asic_reset(struct amdgpu_device *adev)
 		return 0;
 
 	switch (nv_asic_reset_method(adev)) {
+	case AMD_RESET_METHOD_PCI:
+		dev_info(adev->dev, "PCI reset\n");
+		ret = amdgpu_device_pci_reset(adev);
+		break;
 	case AMD_RESET_METHOD_BACO:
 		dev_info(adev->dev, "BACO reset\n");
 
-- 
2.29.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
