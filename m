Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7EF17F74F
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Mar 2020 13:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE5089E5B;
	Tue, 10 Mar 2020 12:21:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FB289E5B
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Mar 2020 12:21:22 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a141so1116276wme.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Mar 2020 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XaTAu9Rbw8cbZ3eH4AvoWuAFSYiglI4EjVAj8kZM92s=;
 b=haCeh8l4pVqJB2euGuX7FLUL7JKQPUhjT5bly4y1OwCUYx5tUFaiXbDmBpVpoq3spI
 GPJQgivWoriqReQuPZvuRJS7NPHHm+Uj0ziN8CQwAU4u2t8mPZHFqnVXkAv5l4sS1k8E
 1M9VhZHzZ7MB89UdU3ifrBbpw0E3I7RLUzF4RLGm3165CDzSQK9078ZmWuZHE3Oxo4mp
 Hic41eYcz6xZMWgMscBS0ff2tOVbHecxSAWNj6fLuJqC66tIGkmdl9i7iBXtUofFqN71
 rCdD2IMFPJZu67LM2IwWwe/tyFwOW6QRZ8WWDicV2SPQyF+5Y0zPF7EXALCjy7avHdQW
 mjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XaTAu9Rbw8cbZ3eH4AvoWuAFSYiglI4EjVAj8kZM92s=;
 b=sA/ttyl1+WJTrgkWwUKNVoghVTmN0uDjwEi4xEeieXzwEq+Z79aN9vNJZ7dVuNMaQe
 SNtiePwiLDpfCgsUb0gKysMgPUlCbNQiPs1/bcy9UCF0XRQnsRiwN8T4gUVv+SG5EW4a
 OpB5aOEvBtSryHqexe7As1jtaR3pdXCvQandVJ/wRdTKsTycyWMDZiKaK4srnqq2Jcqa
 0g1A7fWr0YEALFNEinNP7qEsNKOa5Ydw+g3gTdcpKlm68f1Xn/fhBOkNJG96JovMl+Xq
 x0vQMvWQbM4dVwRaUYQzl41GF6nOmvV9I+x/hbTfA/daxOHMvNrzOrJg3FZt1iebRsaH
 iLwg==
X-Gm-Message-State: ANhLgQ2OwUiK9FrIkmfPvag76Bz8aVkvpWrNqj0EVnXG9zNSy/ljgDl7
 k7qgY0foeMAlsdSPHGvozsttfFMQPrWfUA==
X-Google-Smtp-Source: ADFU+vtmJwKhWktDUzXWoHefZMjBa7ZuEozW9pD0MPj8lW+gbcGxOeSyd4UDMrtp4p3wU6l5vTArXw==
X-Received: by 2002:a05:600c:2942:: with SMTP id
 n2mr1869688wmd.87.1583842880573; 
 Tue, 10 Mar 2020 05:21:20 -0700 (PDT)
Received: from brihaspati.fritz.box
 (p200300C58F32A80070E0F409F1853DFD.dip0.t-ipconnect.de.
 [2003:c5:8f32:a800:70e0:f409:f185:3dfd])
 by smtp.gmail.com with ESMTPSA id z19sm3970972wma.41.2020.03.10.05.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 05:21:19 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: do not set nil entry in compute_prio_sched
Date: Tue, 10 Mar 2020 13:24:55 +0100
Message-Id: <20200310122456.3240-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
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
Cc: alexander.deucher@amd.com, Ray.Huang@amd.com, nirmoy.das@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

If there are no high priority compute queues available then set normal
priority sched array to compute_prio_sched[AMDGPU_GFX_PIPE_PRIO_HIGH]

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 3b2370ad1e47..fa575bdc03c8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -686,10 +686,17 @@ static void amdgpu_ctx_init_compute_sched(struct amdgpu_device *adev)
 	adev->gfx.num_compute_sched[i] = num_compute_sched_normal;
 
 	i = AMDGPU_GFX_PIPE_PRIO_HIGH;
-	adev->gfx.compute_prio_sched[i] =
-		&adev->gfx.compute_sched[num_compute_sched_high - 1];
-	adev->gfx.num_compute_sched[i] =
-		adev->gfx.num_compute_rings - num_compute_sched_normal;
+	if (num_compute_sched_high == (AMDGPU_MAX_COMPUTE_RINGS - 1)) {
+		/* When compute has no high priority rings then use */
+		/* normal priority sched array */
+		adev->gfx.compute_prio_sched[i] = &adev->gfx.compute_sched[0];
+		adev->gfx.num_compute_sched[i] = num_compute_sched_normal;
+	} else {
+		adev->gfx.compute_prio_sched[i] =
+			&adev->gfx.compute_sched[num_compute_sched_high - 1];
+		adev->gfx.num_compute_sched[i] =
+			adev->gfx.num_compute_rings - num_compute_sched_normal;
+	}
 }
 
 void amdgpu_ctx_init_sched(struct amdgpu_device *adev)
-- 
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
