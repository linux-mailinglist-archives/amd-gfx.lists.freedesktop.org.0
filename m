Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CA49A3747
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2024 09:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6251710E8B2;
	Fri, 18 Oct 2024 07:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ibqZp+e7";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A8D10E223
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2024 19:40:37 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a99cc265e0aso175949266b.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2024 12:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729194036; x=1729798836; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4OVlCn0UaUWh7bWeiu1Ka2GuXCsdMF034zBPeBiB8O4=;
 b=ibqZp+e7tl5lLD9bisXJgejxTa9Ii1FGopN78ZS40MSupY9GSfB3Dm/jS2ZyfxwkTL
 0u9NiheolvtvqYqCb4ufVVRTck6P2YdA5FedDpCQ4sfpdQj0Zu8Ir2oCOHvMX0k7i2s3
 qtPA2F1+j3IaEm4ZYSRSqqDvQ9Yhk0MD58b61RZCCq4GnjeqZlIH+fmq3NEe/heh7YeX
 2QASdYmNFonVXwLbhUFVCf1/IUKdjtJuEs6m4HQLwMyZEMSztK1qEcfB23Y39U27+yed
 VJ/sZKsBLPITARMcQfbHMT3Awg1tR+2iuq49LsvWA8gC6GnUsY97ZX2RoRWRpoNluy30
 zZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729194036; x=1729798836;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4OVlCn0UaUWh7bWeiu1Ka2GuXCsdMF034zBPeBiB8O4=;
 b=NPe1Jhv17UByAYzdItTTfurn2iyJeS+tMilt6PxN8LQLs6tatovJJ44lx/Ip47ArEr
 /Cn69Skh40FpD6yz9/e0iWWR34dcbTIMrrCqiL7Kf0WRUZOuF78aCdQFVCfbdN3q5qOg
 6jueZBxtGSXSeJdTRG7UYXbc9OUcoembQCa3nmzYkwren1K64OSrRD5wVuuI2mQ9Gwtk
 EyEcsxy/2SuNZcPoIoGaVT1z+1qTqTQMcHIhLsELDTxDtI3uwcch1QksT+wfhHfGsg9T
 aSCNmazfdZkkwN8XcuO6DDWJD4ptGpVth0vPjz9bqqCk7uEaFDWVxKPjs5UoTLQKFXL5
 t9Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE9FsJCEs9ob4ybU3ZXGdZRO65aOWsqv/6ScBJppH6PZ/fJ01a1iRvcTNA8g5fOrjEoPkOpFh/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEZxlObiw6BooP5Jt1UketC70r1LpYZW7xYJcCRPRSQU/dWqis
 SWbY76klua5m63NWxMwMCwdY9+QvUNTHx5kgkt271Jxgf1REDLkXebN1uF/IxC4=
X-Google-Smtp-Source: AGHT+IGB8YRLVexFRV2mAH/o1FOXGUr7in+Kju2Iz89bABqeFQYgpmZ27BOoxu2BX9pjvnrZofmNYw==
X-Received: by 2002:a17:907:f14d:b0:a9a:1792:f24 with SMTP id
 a640c23a62f3a-a9a34cbece0mr715958666b.24.1729194036034; 
 Thu, 17 Oct 2024 12:40:36 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a68c27212sm2902966b.201.2024.10.17.12.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 12:40:35 -0700 (PDT)
Date: Thu, 17 Oct 2024 22:40:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Vignesh Chander <Vignesh.Chander@amd.com>,
 Shiwu Zhang <shiwu.zhang@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: Fix a double lock bug
Message-ID: <2e19e095-c022-45a3-8bb3-9a9321bc1905@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Mailman-Approved-At: Fri, 18 Oct 2024 07:35:01 +0000
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

This was supposed to be an unlock instead of a lock.  The original
code will lead to a deadlock.

Fixes: ee52489d1210 ("drm/amdgpu: Place NPS mode request on unload")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis, not testing.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index fcdbcff57632..3be07bcfd117 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -1605,7 +1605,7 @@ int amdgpu_xgmi_request_nps_change(struct amdgpu_device *adev,
 					     gmc.xgmi.head)
 		adev->gmc.gmc_funcs->request_mem_partition_mode(tmp_adev,
 								cur_nps_mode);
-	mutex_lock(&hive->hive_lock);
+	mutex_unlock(&hive->hive_lock);
 
 	return r;
 }
-- 
2.45.2

