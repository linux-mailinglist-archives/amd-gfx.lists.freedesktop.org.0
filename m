Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19EA21F92C
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 20:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422AF6E5A3;
	Tue, 14 Jul 2020 18:24:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236526E5A3
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 18:24:11 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id i3so13554695qtq.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 11:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vhI+0gyVpJ3RT57gU8RhoKIITKZXU1jpKSIovE18erc=;
 b=YL5+6LWciunHPZEEQk5/oYvOiokiv+okRmGuCziJV5X75Dxqdja/XkkwOdYmw7h/c2
 +0Ucsu1IdjnY21NvoAEFjoAldqllVI0wyp3MlgxNh1azOtM/CR64o4ANz+oUQBAWZcSp
 cq6rj4QQ5XEGpyOV/GkZEA1AbL2miomVQU5pRMwx+Qvp1qOQ8DvS4N8uCOrQPfwcBh+F
 2M6JllxKsGRPX59WpUDGp4bRRJ44iLUV3z93eFGIQDT0YNLhTzRnFd84DLfhiWAwEuZf
 8SU1LrjooO3DoWLcV557fypUPKa8Y1XGV+Bsj7UpFxWrITyY4hQpSSlhE4O7ZbDHFe6j
 TyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vhI+0gyVpJ3RT57gU8RhoKIITKZXU1jpKSIovE18erc=;
 b=VRFVVriVSXJwElI/bbc32x4+FWr/6ZPVnjANR4h0ix5WBg9d3Bc6SjSA5Rje0rCMLF
 rUpM1ihRkuXE4Umy9tn84uyPBmRbTUUo3mOEA/WHfEzcKPGfdA6vrWJjkbFx0Ik5Nvj0
 BpgjR7Takl+3XUyqKTOn99nuMELeNBk4Lz0zYNv7k8W/QTEno55tgxe1G7t7Tph4EAn7
 hLP5gNQUzDixbJ++QRQgADW0laSjsqQRcCcC/kfO7+mIivGhVIC4aL/5wAXAdlauKM9f
 fr2Q8kkPP0yXwLLT7YYpBZR28q9wQUi3+DAcJ0Cotb5p5B2W2rpTbakAnnsBpvY7pCTo
 p+Sg==
X-Gm-Message-State: AOAM531bWrxPY9XxhBRa62hAx02T6DZ8IYD9yri8fYvhoX6bjbXqIPQA
 D0NOkgJgKYVgEMFjURe2+Y65tNLW
X-Google-Smtp-Source: ABdhPJyq7fh0dqy9byiPS1/NzfRqJPHMNaBaAfEbBvKhf4k8/3eK+Oe4YI/sGJEYrVVee5AAsaRLFA==
X-Received: by 2002:ac8:2783:: with SMTP id w3mr6318539qtw.66.1594751050087;
 Tue, 14 Jul 2020 11:24:10 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id d53sm26046456qtc.47.2020.07.14.11.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:24:09 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 01/42] drm/amdgpu: expand to add multiple trap event irq id
Date: Tue, 14 Jul 2020 14:23:12 -0400
Message-Id: <20200714182353.2164930-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200714182353.2164930-1-alexander.deucher@amd.com>
References: <20200714182353.2164930-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Huang Rui <ray.huang@amd.com>

Sienna_cichlid has four sdma instances, but other chips don't.
So we need expand to add multiple trap event irq id in sdma
v5.2.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 67 ++++++++++++++++----------
 1 file changed, 41 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 824f3e23c3d9..de8342283fdb 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -1165,6 +1165,40 @@ static int sdma_v5_2_early_init(void *handle)
 	return 0;
 }
 
+static unsigned sdma_v5_2_seq_to_irq_id(int seq_num)
+{
+	switch (seq_num) {
+	case 0:
+		return SOC15_IH_CLIENTID_SDMA0;
+	case 1:
+		return SOC15_IH_CLIENTID_SDMA1;
+	case 2:
+		return SOC15_IH_CLIENTID_SDMA2;
+	case 3:
+		return SOC15_IH_CLIENTID_SDMA3_Sienna_Cichlid;
+	default:
+		break;
+	}
+	return -EINVAL;
+}
+
+static unsigned sdma_v5_2_seq_to_trap_id(int seq_num)
+{
+	switch (seq_num) {
+	case 0:
+		return SDMA0_5_0__SRCID__SDMA_TRAP;
+	case 1:
+		return SDMA1_5_0__SRCID__SDMA_TRAP;
+	case 2:
+		return SDMA2_5_0__SRCID__SDMA_TRAP;
+	case 3:
+		return SDMA3_5_0__SRCID__SDMA_TRAP;
+	default:
+		break;
+	}
+	return -EINVAL;
+}
+
 static int sdma_v5_2_sw_init(void *handle)
 {
 	struct amdgpu_ring *ring;
@@ -1172,32 +1206,13 @@ static int sdma_v5_2_sw_init(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	/* SDMA trap event */
-	r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_SDMA0,
-			      SDMA0_5_0__SRCID__SDMA_TRAP,
-			      &adev->sdma.trap_irq);
-	if (r)
-		return r;
-
-	/* SDMA trap event */
-	r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_SDMA1,
-			      SDMA1_5_0__SRCID__SDMA_TRAP,
-			      &adev->sdma.trap_irq);
-	if (r)
-		return r;
-
-	/* SDMA trap event */
-	r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_SDMA2,
-			      SDMA2_5_0__SRCID__SDMA_TRAP,
-			      &adev->sdma.trap_irq);
-	if (r)
-		return r;
-
-	/* SDMA trap event */
-	r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_SDMA3_Sienna_Cichlid,
-			      SDMA3_5_0__SRCID__SDMA_TRAP,
-			      &adev->sdma.trap_irq);
-	if (r)
-		return r;
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		r = amdgpu_irq_add_id(adev, sdma_v5_2_seq_to_irq_id(i),
+				      sdma_v5_2_seq_to_trap_id(i),
+				      &adev->sdma.trap_irq);
+		if (r)
+			return r;
+	}
 
 	r = sdma_v5_2_init_microcode(adev);
 	if (r) {
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
