Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F742315BD
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Jul 2020 00:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB826E43B;
	Tue, 28 Jul 2020 22:46:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13C56E43A
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Jul 2020 22:46:45 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id b14so18725763qkn.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Jul 2020 15:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R0FBfSTL+jTP3sZFnAorgfYnQd4F+cb3L/bmR9f9Qbg=;
 b=I8SHgzwMFfKQUzk/UiXOtzvYo7Zn5NONL91YjN6FfplGp3gMVAQAoNtemMemqIDtXv
 mMov9wE2C93cw7ln2JUi/S5z8xGzj37WUiFQido++4g0rzwHZV0nSnVrP0tMpKcApkbX
 C5NpXwVNpglG5IBMcZQisHy/Mndo0j/0iy9P3cMuDiJ5qCgFxnAOQp7PB5AnoIeyLokV
 QgqMbSneTPSOoGEXjoKFA5pOAs1VHKZDk2Xj4V/yEJYkJD+barh4fC6knBUOF5FR2gfk
 zUUtdsHoHAIUETeeb5zwIRDlJxyi5mRSGTV2VumGHXuSKChttHA2gfYyKJog9lPspmV8
 esLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R0FBfSTL+jTP3sZFnAorgfYnQd4F+cb3L/bmR9f9Qbg=;
 b=nZ5BTGAGxs/BYs9A5CEkS1+Kd0mfAAr10p4ormvEo39HUo3PTZvmRDqjmyjcu565me
 OQqrpYxtFqfadadMAmWD15cN5lb6HwMYg5eKFXrXbTX36eaACkulWyJhAJjoQB3v3CVB
 7iRFUkM0328IuXcZPcYmFB9SaneqSpsQmFvclwtPOy29iyIsd3jvpNUZ7WQquqAf/9vD
 IQdpjrPq6+BbBxftlGDYDaCsuTijDtn9j8RDusImPPtAyRegwSh7xIg2DjinhFOEsVQ+
 0d7jd1951lPUnGvJoJvcfaGlkDIjhqw+pPiz/F9k8rGNKONRz8K2mOQZ50hU5MZkiCzN
 cI7A==
X-Gm-Message-State: AOAM533pJ8re7CkKk/wV+mev6G+a/vauQU2drReBBumZ0gxrzlxu7+6S
 NBy376myZbW77Weq1kF9H8N0vq2n
X-Google-Smtp-Source: ABdhPJxkIKbRpHSVmfvj+vs+UpTJIwls/CXASe7OBqzwsFTuUeLnLXPQc9S7+yB6B7fcRbayZ4d6ew==
X-Received: by 2002:a37:a187:: with SMTP id
 k129mr20367263qke.196.1595976404715; 
 Tue, 28 Jul 2020 15:46:44 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id o17sm189233qtr.13.2020.07.28.15.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 15:46:44 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 14/14] drm/amdgpu/gmc: disable keep_stolen_vga_memory on
 arcturus
Date: Tue, 28 Jul 2020 18:46:05 -0400
Message-Id: <20200728224605.3919-15-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200728224605.3919-1-alexander.deucher@amd.com>
References: <20200728224605.3919-1-alexander.deucher@amd.com>
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

I suspect the only reason this was set was to avoid touching
the display related registers on arcturus.  Someone should
double check this on arcturus with S3.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index fc9e18aaa76e..0bd7b3797534 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -448,7 +448,6 @@ void amdgpu_gmc_get_vbios_allocations(struct amdgpu_device *adev)
 	switch (adev->asic_type) {
 	case CHIP_VEGA10:
 	case CHIP_RAVEN:
-	case CHIP_ARCTURUS:
 	case CHIP_RENOIR:
 		adev->gmc.keep_stolen_vga_memory = true;
 		break;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
