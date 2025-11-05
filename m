Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDFEC3B4DE
	for <lists+amd-gfx@lfdr.de>; Thu, 06 Nov 2025 14:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A123D10E8CC;
	Thu,  6 Nov 2025 13:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="RO/jxi87";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E7F10E7C6
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Nov 2025 23:21:43 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b95cdcacd95so207232a12.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 05 Nov 2025 15:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kerneltoast.com; s=google; t=1762384903; x=1762989703;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bJiprROu63G1frHmGSO+l8oyb9oBLslAg4j/kLd4BHY=;
 b=RO/jxi87hjsaAOqxznd952V2wz2b8axlLYZVuI87NuYDWdvXXu7Rn5Fa3zYrLGh5jE
 Zh9bt5zDq6Ov+dWx5Xt7UFcKGAXw1nAGeIbR3ufXvaxV9y5qrEbh3KZsHZZWlTnwRPBk
 Zhg0s5fNzgxnUC1X33cPQoljBxqiwmtJlcTmZfpBRAavv89CH9IEQCPLiAFpqGQbWAz/
 8JI3zaPYB9E4Avn/701wxm6gJjZ8KdFMSiEdS0gwuy1cK9uXNEumBX3husqWuQbxV+46
 OKInFPH7K1AiICa3IjzVIqWP2AekHpGX/d1fP4q0QKFXrhbxS89OV8LjFEN/AwP09Cxn
 9LrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762384903; x=1762989703;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bJiprROu63G1frHmGSO+l8oyb9oBLslAg4j/kLd4BHY=;
 b=X6J+S6JkpJ4rrXHvOn5WCBAJWXi/168Cdet/udMTvofVFPLaEVmgiBjAKyWlz2yyDR
 jO6uF2Jbl+tMewaE2lOVv2MXsDY8L3YZIbERYx5z+9H+oSvAa25wae+M+UpG6/LDFNps
 /P479gfj8Opd6t5fSGGTXbqkVuiyICViRf4Oz01ehaH2+zxyWaI6WEi6t7rwqgofUG9H
 RoP8KqOvfv07XJ8uS0WAi5PKs7nck6d2MMcigWGSty+6NC0JuPFSDNe7d3SLFnLgoc01
 P24ua5vWBBdOKoqXwfGVQtKZg7YFCADqYR1z64vWAdqhoeUuWcn3GtFMwilQfjbgOKuZ
 ipcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd3gpgNa2603jQXSaLimVBY8fiAKGwfTA7XVvQGxSlxeBty9uccDgSVTM/MdLt0PxGNgDOQLhx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCyhp33lL5U2kFtoT4rmkaAIF7KQEvhu5yCdVmlnR8TRDtjoc2
 wRS5eK+YHtxp5N7ZXbQjYPo0mEGQs5JfxmkIf+JeaiEMXxjnE3rlebBDAtXz4LG36zlV
X-Gm-Gg: ASbGncuih48qqQowIYfE13YRkBa/HaTSQ770Sm/l/75U2tlFwmBhouQ0VfL29wx+GHd
 QkZFt5uKz0UZ71FLNSXM5aDMwyonIKTspL35hQMXexBfcuJskr+HIz1QVtKS2Cpozi7gNVhRrfT
 4TypMhQSta0ATaNlej9fZq9A4vlDfrd0DLwCXajRvhbydU7d45CFxRPYRN8ybdH/V/16eCWbeVb
 QO+/+mBWvcnE55cSIOCpPmQaF4+2O0/iSr7siPJ50RLKUU4KdzUlGP+KkVKArR+ykbpTxobM1U4
 qkTI76XRUHuTjRFa//rOynvDHiD5JU4vq7Vge7d5pd+fISBhPg09G/YE29Dqbigv/rcoQHeW8eZ
 k7HJiw7Xb11wE4LEBrUD6Al9CwUbcU7vqR8CyYStDjjcjHcG4FQ==
X-Google-Smtp-Source: AGHT+IE091+lzdrv+Nj+YfcdrpAjegKIiESDWT7sHR4JWv61MvJE6IaL9ddG35gHuIh3zRLs14+FRg==
X-Received: by 2002:a17:902:d2c6:b0:295:7453:b58b with SMTP id
 d9443c01a7336-2962adb29cdmr52328925ad.4.1762384902532; 
 Wed, 05 Nov 2025 15:21:42 -0800 (PST)
Received: from sultan-box ([142.147.89.233]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29650968298sm6719765ad.6.2025.11.05.15.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 15:21:42 -0800 (PST)
From: Sultan Alsawaf <sultan@kerneltoast.com>
X-Google-Original-From: Sultan Alsawaf
To: bin.du@amd.com, pratap.nirujogi@amd.com, mario.limonciello@amd.com,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: alexander.deucher@amd.com, benjamin.chan@amd.com, christian.koenig@amd.com,
 dantony@amd.com, gjorgji.rosikopulos@amd.com, king.li@amd.com,
 phil.jawich@amd.com
Subject: [PATCH] drm/amd/amdgpu: Ensure isp_kernel_buffer_alloc() creates a
 new BO
Date: Wed,  5 Nov 2025 15:21:08 -0800
Message-ID: <20251105232108.107765-1-sultan@kerneltoast.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 06 Nov 2025 13:41:01 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Sultan Alsawaf <sultan@kerneltoast.com>

When the BO pointer provided to amdgpu_bo_create_kernel() points to
non-NULL, amdgpu_bo_create_kernel() takes it as a hint to pin that address
rather than allocate a new BO.

This functionality is never desired for allocating ISP buffers. A new BO
should always be created when isp_kernel_buffer_alloc() is called, per the
description for isp_kernel_buffer_alloc().

Ensure this by zeroing *bo right before the amdgpu_bo_create_kernel() call.

Fixes: 55d42f616976 ("drm/amd/amdgpu: Add helper functions for isp buffers")
Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
index 9cddbf50442a..37270c4dab8d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
@@ -280,6 +280,8 @@ int isp_kernel_buffer_alloc(struct device *dev, u64 size,
 	if (ret)
 		return ret;
 
+	/* Ensure *bo is NULL so a new BO will be created */
+	*bo = NULL;
 	ret = amdgpu_bo_create_kernel(adev,
 				      size,
 				      ISP_MC_ADDR_ALIGN,
-- 
2.51.2

