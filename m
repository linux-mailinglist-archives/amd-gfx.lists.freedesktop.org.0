Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFC91EAB87
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF986E2E3;
	Mon,  1 Jun 2020 18:21:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDD76E2E3
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:21:04 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i68so8489113qtb.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/B3UOWavwYtbNJMu3JQnAY93+ArohQ60QoSF7+18jWo=;
 b=l95QLNiMw4f50hCwAEp8YQ4aUfYjDH+4kS8r2aKN7Is4gMQziC5Z3S0U0Z6+im5g/l
 UZI2gIezm6+NvBY1dSNpqzq8B6dpcbxljvGiSjjDhCJBpHROedFfOLR6E6Frm4Hvh01S
 1UZCX42A3Tblxo95a9weg2rFWGnMSnz5Wu5SMZIHm89SWvn+VdV9EQLnAKBllwEDU7ar
 WzL0ScXhd+XGWuh+KrUGF3Onp9UHMTUwEyrjwS8iX7B4p7D/Zu2wQ4XWF3CXcSGJDgxk
 hOV5PNEQdoYALmmDxLtFcNaY/R7pF+7rM7OHUw+VGBT0Qvt7OXoVRqboYiVmM21dXz0C
 yN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/B3UOWavwYtbNJMu3JQnAY93+ArohQ60QoSF7+18jWo=;
 b=gkyTioqxLECp9T3ldKCyv1z/UnaSUX96Gj1EgejAB9d5A56tsyKCVuSpnB50aoFudx
 nkfOB48AOoA/rAwJmkvcx91OFKk5Dbq1ereUygtRP8nHAP+v5UN1Gz7cZTP194PwmkXs
 Q0KXarDlGblWvJ9SBT4bDMXXz6OgINMSh9UsI06DGJFqMZZ0I4AtPw0Ff6U1wQ6rJU3C
 Lq117jggKdcGt/oFTd3i5WdKtM2VjND98u2s2X3fIAyararBMaeX+fzgrALDGjh/3Ep8
 1eUSexbJaHWaGo2AkB4c5OTpPx0OAZzdQA+Y2Lcl0piVl5N/mXTOHezy8utPu6q6wVp8
 l6Lw==
X-Gm-Message-State: AOAM533pYaHxxhf/w7VXpBMgxdagz7Gy9h8l3YrSB29KOHPuaJq7TktZ
 AZeMKX68PLZOaEuViYe2sa3kE8lz
X-Google-Smtp-Source: ABdhPJx8W67/QBSH1leUfsnSf9xctAbTT8KjOdiZO8xF0TxUv59PqgdVeujN8W/vjezDbIVMi3KRsQ==
X-Received: by 2002:ac8:2a3a:: with SMTP id k55mr23039145qtk.294.1591035663407; 
 Mon, 01 Jun 2020 11:21:03 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:21:02 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 090/207] drm/amdgpu: enable JPEG3.0 for Sienna_Cichlid
Date: Mon,  1 Jun 2020 14:18:57 -0400
Message-Id: <20200601182054.1267858-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Leo Liu <leo.liu@amd.com>

By adding JPEG HW block to Sienna_Cichlid

Signed-off-by: Leo Liu <leo.liu@amd.com>
Reviewed-by: James Zhu <James.Zhu@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 81032b0d8512..320d4db471cb 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -57,6 +57,7 @@
 #include "vcn_v2_0.h"
 #include "jpeg_v2_0.h"
 #include "vcn_v3_0.h"
+#include "jpeg_v3_0.h"
 #include "dce_virtual.h"
 #include "mes_v10_1.h"
 #include "mxgpu_nv.h"
@@ -499,6 +500,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &gfx_v10_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &sdma_v5_2_ip_block);
 		amdgpu_device_ip_block_add(adev, &vcn_v3_0_ip_block);
+		amdgpu_device_ip_block_add(adev, &jpeg_v3_0_ip_block);
 		if (adev->enable_mes)
 			amdgpu_device_ip_block_add(adev, &mes_v10_1_ip_block);
 		break;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
