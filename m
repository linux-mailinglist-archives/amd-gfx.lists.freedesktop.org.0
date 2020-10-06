Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF1A284C84
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Oct 2020 15:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1D96E04E;
	Tue,  6 Oct 2020 13:27:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7951B6E04E
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Oct 2020 13:27:17 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id j3so7938971qvi.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 06 Oct 2020 06:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l4LjyN2cIgnf2fEEb+E1n83Huq6JkiGtxzKiPL+ncKc=;
 b=LwRt16v6ejJnN31lCnLrWHItmcjX7QwcMdxNDcVy3e12uXf+AW+jqiwEh8Sm8e41u8
 vRHPK7H1bcmP5rOW97lwsxhT7whaGhf0p2GWtLpXNR+VaUGF43Gr6qiZrM+darf+mFFE
 g6kSPt8v+dtFG0pbDKyPVKu33fy8mZRHlESioRg+mavZdhKAPG5MK1x1G0S9jpMGA4gF
 Of5Y+5equuSwyebCqTHE8cHFDNGhL3Q3MgzW1HJwlRc3AOLBPNi9Q1kUL9n82DFIENOy
 ft3UqG+2nkc1EUdi/B2gOvh+JpfDkh/2BFRo7gKz3MDYQX8aWbJyI7dzgVsqE6/oyRds
 /n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l4LjyN2cIgnf2fEEb+E1n83Huq6JkiGtxzKiPL+ncKc=;
 b=YmwZ15ZkVy2V6FBq7Cw8MiLAlXjbah1gY8dnNsa/xN9HMAHuLADwWGFYblMSIW3Q6A
 ByK1Nzf6ObLQrmavYuKqwKPBdmmEGLqel1UGyWLtEXzDcX1SASQN6Lai0HjWSSJhGlRW
 7Fdzg9cyG/s//krxYmVyWMpYz8oa/coEh0kCzCceEWKfH/A2Kg5cJmLBPHGw5pq2yJ/x
 hPvcLRuCQm+atbDZDcBXe94ifCrW66PStb7GRuqz2RoPfCbRP7YBxZTO2h2IE1yz37O6
 m68aqychs1TmRCD89ypHqfJFCCJw6QzjSXNol+vzQ6b+dIGxn5q44psBPE//BmyRQDY6
 nZdQ==
X-Gm-Message-State: AOAM5321HfDPzoGPpodwMOfY8XqSXyKenVHVDnCD7wQFrv66CYKkht9i
 umQqqPtmfaPQhV6PJzWVG5BU8+lXOn4=
X-Google-Smtp-Source: ABdhPJzzGuk+QYBUf2awRNgmEyN/0UrFXCT1ZwGdStlZWwoJnjMtq+Iec7kdEOsLbEtJWYx0aAWm0w==
X-Received: by 2002:a0c:fa11:: with SMTP id q17mr4639941qvn.6.1601990836403;
 Tue, 06 Oct 2020 06:27:16 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id b9sm1621812qka.86.2020.10.06.06.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 06:27:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/swsmu: fix ARC build errors
Date: Tue,  6 Oct 2020 09:26:59 -0400
Message-Id: <20201006132659.1486610-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201006132659.1486610-1-alexander.deucher@amd.com>
References: <20201006132659.1486610-1-alexander.deucher@amd.com>
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
Cc: Evan Quan <evan.quan@amd.com>, kernel test robot <lkp@intel.com>,
 Vineet Gupta <vgupta@synopsys.com>, Randy Dunlap <rdunlap@infradead.org>,
 Alex Deucher <alexander.deucher@amd.com>, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

We want to use the dev_* functions here rather than the pr_* variants.
Switch to using dev_warn() which mirrors what we do on other asics.

Fixes the following build errors on ARC:

../drivers/gpu/drm/amd/amdgpu/../powerplay/navi10_ppt.c: In function 'navi10_fill_i2c_req':
../arch/arc/include/asm/bug.h:24:2: error: implicit declaration of function 'pr_warn'; did you mean 'drm_warn'? [-Werror=implicit-function-declaration]

../drivers/gpu/drm/amd/amdgpu/../powerplay/sienna_cichlid_ppt.c: In function 'sienna_cichlid_fill_i2c_req':
../arch/arc/include/asm/bug.h:24:2: error: implicit declaration of function 'pr_warn'; did you mean 'drm_warn'? [-Werror=implicit-function-declaration]

Reported-by: kernel test robot <lkp@intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Evan Quan <evan.quan@amd.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    | 14 ++++++++++++--
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 14 ++++++++++++--
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index 3f1377f28493..8d8081c6bd38 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -2336,8 +2336,6 @@ static void navi10_fill_i2c_req(SwI2cRequest_t  *req, bool write,
 {
 	int i;
 
-	BUG_ON(numbytes > MAX_SW_I2C_COMMANDS);
-
 	req->I2CcontrollerPort = 0;
 	req->I2CSpeed = 2;
 	req->SlaveAddress = address;
@@ -2375,6 +2373,12 @@ static int navi10_i2c_read_data(struct i2c_adapter *control,
 	struct smu_table_context *smu_table = &adev->smu.smu_table;
 	struct smu_table *table = &smu_table->driver_table;
 
+	if (numbytes > MAX_SW_I2C_COMMANDS) {
+		dev_err(adev->dev, "numbytes requested %d is over max allowed %d\n",
+			numbytes, MAX_SW_I2C_COMMANDS);
+		return -EINVAL;
+	}
+
 	memset(&req, 0, sizeof(req));
 	navi10_fill_i2c_req(&req, false, address, numbytes, data);
 
@@ -2411,6 +2415,12 @@ static int navi10_i2c_write_data(struct i2c_adapter *control,
 	SwI2cRequest_t req;
 	struct amdgpu_device *adev = to_amdgpu_device(control);
 
+	if (numbytes > MAX_SW_I2C_COMMANDS) {
+		dev_err(adev->dev, "numbytes requested %d is over max allowed %d\n",
+			numbytes, MAX_SW_I2C_COMMANDS);
+		return -EINVAL;
+	}
+
 	memset(&req, 0, sizeof(req));
 	navi10_fill_i2c_req(&req, true, address, numbytes, data);
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 3c8732f34b1f..c27806fd07e0 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -2422,8 +2422,6 @@ static void sienna_cichlid_fill_i2c_req(SwI2cRequest_t  *req, bool write,
 {
 	int i;
 
-	BUG_ON(numbytes > MAX_SW_I2C_COMMANDS);
-
 	req->I2CcontrollerPort = 0;
 	req->I2CSpeed = 2;
 	req->SlaveAddress = address;
@@ -2461,6 +2459,12 @@ static int sienna_cichlid_i2c_read_data(struct i2c_adapter *control,
 	struct smu_table_context *smu_table = &adev->smu.smu_table;
 	struct smu_table *table = &smu_table->driver_table;
 
+	if (numbytes > MAX_SW_I2C_COMMANDS) {
+		dev_err(adev->dev, "numbytes requested %d is over max allowed %d\n",
+			numbytes, MAX_SW_I2C_COMMANDS);
+		return -EINVAL;
+	}
+
 	memset(&req, 0, sizeof(req));
 	sienna_cichlid_fill_i2c_req(&req, false, address, numbytes, data);
 
@@ -2497,6 +2501,12 @@ static int sienna_cichlid_i2c_write_data(struct i2c_adapter *control,
 	SwI2cRequest_t req;
 	struct amdgpu_device *adev = to_amdgpu_device(control);
 
+	if (numbytes > MAX_SW_I2C_COMMANDS) {
+		dev_err(adev->dev, "numbytes requested %d is over max allowed %d\n",
+			numbytes, MAX_SW_I2C_COMMANDS);
+		return -EINVAL;
+	}
+
 	memset(&req, 0, sizeof(req));
 	sienna_cichlid_fill_i2c_req(&req, true, address, numbytes, data);
 
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
