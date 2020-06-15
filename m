Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A70D1FA167
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2020 22:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796496E2E0;
	Mon, 15 Jun 2020 20:25:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C794D6E2E0
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2020 20:25:47 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id g11so8416693qvs.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2020 13:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=piYtr9E5f0THyRMh9c9PlLwClvv8fCa1u2SzxiaIILU=;
 b=mZp8W3EGF3PPFcr9/ezj8t3BhFNjw33fqP9iwQPTyCzY/3E+UmvpkQeyb4PPOU3NtZ
 JbiZtUzVKPd3FDCzfXWgQMFxnDBIJ105rHnxdFLyeFdrt1eHu5MKAAp7OSAe98RtKBZO
 6m4Hd+zSjqR2yT2clmKTy3zeOjy9sBddjsdjfyXmx6I4W+Lu4hDCsm9bhVKKsod9Z/Nj
 q0HPlyrnGJKLUYpkaISt/DDfjopyrG+N6ctLC2OHKkIdhG1yce1yQqE+EzLLrYP6W9sK
 8oGfTFvrBGbkKhBq9SwdS0zPTs4JJVpUo/LMJXkbzzI6eJk9nRu/YC1GTOCumiedgjx3
 H79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=piYtr9E5f0THyRMh9c9PlLwClvv8fCa1u2SzxiaIILU=;
 b=TjNN3pWW49VD9os0WZaloEq5EVqQ3VbzLCZDZ7aRd0irQtwilScu2OrghCNfyx8bUo
 55b2FBvst0s7cVjO6U5QThQzqWTOFh4cMm6M9MEKyrVOQ8EeITP7eTznyUecSb6ida7j
 6aFWqBvWkmXjvj29wFe4G8+Lbgf7B+ARbeK5hSevSXHEm5ta7CYpt1gOuoLSEPhyt/vC
 W9wiitm9thsmNDuCVQ9dU9kfIZGPUt2wtlVGg7Gc8A/iND569SDuEnxSXt9h8qYaVnmD
 FQ2xcgqmyAsXclC2B3Vi3Z9ddNLnQ59NkQh9c61rLca19mqLRuajjYyYdbzvZQD2al3D
 ZkQQ==
X-Gm-Message-State: AOAM533vYc+ECRHy+2kmu8hn14RUaK3C/4v9Q5u6gssnLvnQriVMjn+b
 8Oz6EWg29ewPMQQslti1eNnxfp/B
X-Google-Smtp-Source: ABdhPJwfIl4iossVJ5NoPh743PzslfBF2GVddmYjt1vOvlZmTQItQYWKXTmvKovpFJ5vsift6d8GyA==
X-Received: by 2002:ad4:5492:: with SMTP id q18mr26388807qvy.166.1592252746668; 
 Mon, 15 Jun 2020 13:25:46 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id o21sm866129qkk.4.2020.06.15.13.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 13:25:45 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/pm: update comment to clarify Overdrive interfaces
Date: Mon, 15 Jun 2020 16:25:35 -0400
Message-Id: <20200615202535.2455665-1-alexander.deucher@amd.com>
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

Vega10 and previous asics use one interface, vega20 and newer
use another.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
index 395ddbe2461c..5a8e177e4f56 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
@@ -696,7 +696,7 @@ static ssize_t amdgpu_set_pp_table(struct device *dev,
  * default power levels, write "r" (reset) to the file to reset them.
  *
  *
- * < For Vega20 >
+ * < For Vega20 and newer ASICs >
  *
  * Reading the file will display:
  *
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
