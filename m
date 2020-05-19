Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D198F1D9B89
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2020 17:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E08F6E34E;
	Tue, 19 May 2020 15:44:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541276E34E
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2020 15:44:41 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id er16so6194357qvb.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2020 08:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PwO1mv00Ulgp2QC2JKYYYsU7lwBcN+oiOImn7xVs+34=;
 b=Pfyyrb8Gbb6+Bt4FkZpm2F0Si6NMkJpHbwQPJODMU4ysQ5sX7MKql+DrZpjpfGXE32
 UMwF1eRixPp6dBNOFuvfFRiiI+LtYTD3GsAc+C3yfYGvobSB9OhK/G+XyjqNV4noSreu
 Ys9be/7/v+zQRAiyT4g05INwc+nflc443JL9avjp84A/YZELn203eHBYwks3kc5xU6Or
 tahWIJSRhGeUOBCWsg8gjV9BCw3lXBAlQzcCa2SMonR4TsgJz2OPyl0pP49L9o6Hr88c
 e6iIyQtYPBZ9DtnVQdGkHwzy2HRy792RRr+hTU0Yya+eDz2QwqjLVD9F3P+T7jQRSZ/D
 ycwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PwO1mv00Ulgp2QC2JKYYYsU7lwBcN+oiOImn7xVs+34=;
 b=NTAcYryv5mbgyQv68ATp7yN+lCibn3DBOH8mfhv9/vj1WRwHmdAldIS1p+tYGVstQ1
 yi6nbNn6ijYJ0ZfyivF9Cr6TuZ3fqCYbx4Irj35YLdtlk1IeYY/vvtNr4MqDUZGHhwd7
 +agL+50OPobrd7wAdh1oTcwZqYWtWfmWkI3ANG+bxkN7MT0VPCYIidzfgP2ULPAV3p7Z
 /h2fSLsbUxzK6YJxO5SelRRQFLkwD4a26qotOnxmOikk5nSSKha9A1xTOHRsleYNzCXG
 UPg1SZ15CkZVP9DDrdj1lJqe0Y3gG/4VQJHnsUIAGpI6oJlRRignhmsNsH5TwStSMkZE
 Fsqw==
X-Gm-Message-State: AOAM531LCUChrNKBCgVar61HHgAx2MqMqC1ebkFQMtjouog3YAn4ExCO
 X6Brw1wqakTDhjR3k1MWdylS2Eyo
X-Google-Smtp-Source: ABdhPJyYB09PSexXMrV7eVR34wMCMnV0l2ZoE2KDqsakZG1lJChrtINyiAYXn2T8PlwBp0bIJFlXmw==
X-Received: by 2002:a0c:ec4c:: with SMTP id n12mr182879qvq.190.1589903080193; 
 Tue, 19 May 2020 08:44:40 -0700 (PDT)
Received: from localhost.localdomain ([71.51.180.250])
 by smtp.gmail.com with ESMTPSA id l133sm10819975qke.105.2020.05.19.08.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 08:44:39 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] drm/amdgpu/sdma4: add renoir to powergating setup
Date: Tue, 19 May 2020 11:44:20 -0400
Message-Id: <20200519154426.1752937-1-alexander.deucher@amd.com>
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

Looks like renoir should be handled here as well.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---

Can someone test this on renoir?

 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 9077507b425a..a8cad03b1c42 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -2203,6 +2203,7 @@ static int sdma_v4_0_set_powergating_state(void *handle,
 
 	switch (adev->asic_type) {
 	case CHIP_RAVEN:
+	case CHIP_RENOIR:
 		sdma_v4_1_update_power_gating(adev,
 				state == AMD_PG_STATE_GATE ? true : false);
 		break;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
