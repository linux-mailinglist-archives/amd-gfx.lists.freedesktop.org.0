Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE4C21F92D
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 20:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AA96E5A4;
	Tue, 14 Jul 2020 18:24:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EA76E5A4
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 18:24:12 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id w34so13623646qte.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 11:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WyHiqHoWDu1D4A83ChYTcK7DpQNQgox+9m8Rmse3m+o=;
 b=vDYpmWa9AToWbXgbhG9HxKfFpBwR9baqxL0hEjY1jyrSfT+AUIcqeygDgR35JDsmIx
 0RU7kC7/nVpKzQljOsd9E5s5qfFM+aq31CWz0cSXXVj5wcO5M2RAWObvUhaEVVRSsUDo
 t3RKWVHuDFhbE8XBDfk+g8ISKIei7m7LE9ccv/VQBarokYz7L22wL8//puzoPWG4Tits
 ftIbfM9yJKaiOrQSyorQkiRpE8tykzDUoosSMEg4wyJWndZQfq9LPK/kd6yPWJ0fJUMa
 t/dzOhdixkXK767V0gNAZBpDg0JdbHZej19AshF0TNW35JVizRKhiMx8zzbyad5ns6t2
 f3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WyHiqHoWDu1D4A83ChYTcK7DpQNQgox+9m8Rmse3m+o=;
 b=R7pmpC2uzrR5hah7XoRMDKF4/Ff5nJKN5AlA8xq+CEcZfm8lfT5IoZHnipT27B6Z1b
 tm0DJoLNComkiKtjssu9jHsWUIpwFv3LmuUwVbBzy17g2LS8oD8NohIecWis6zs0Y+8u
 jLrj614O0Cb6Dk1l4HKJhQBahC8+FfWFc09ucHzG8SvbXXViPueQ8KLMO9l24l1U/cgO
 WBDtauPPMys5pTZiOxLukN/YG2e36bUUUF+JCl/D5ESw2JmVZWHKnM4efZOfHygCUGRx
 al7P9+qnyctAUmeyJHITvjJ+42YDNH9ybmvJXbrbDS32hRmWGlxhcRa0FIXEIIS6a8D5
 qZFg==
X-Gm-Message-State: AOAM531ptUncFybFL7jiDRrLiOGy9gQmhyQ7qBVwsKflz8FNwwshtncG
 xmlnmvcaWhiVH2IwRm4D60K3kxbq
X-Google-Smtp-Source: ABdhPJzaAxjUWQt9tTAH0P8yDm/NOZ/qWVq/AIUZeXLy+OFYVBV22huBXEorYRC/LO4e3SfDSVLJPw==
X-Received: by 2002:ac8:3563:: with SMTP id z32mr6124187qtb.244.1594751051752; 
 Tue, 14 Jul 2020 11:24:11 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id d53sm26046456qtc.47.2020.07.14.11.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:24:11 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/42] drm/amdgpu: add navy_flounder asic type
Date: Tue, 14 Jul 2020 14:23:13 -0400
Message-Id: <20200714182353.2164930-3-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Jiansong Chen <Jiansong.Chen@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jiansong Chen <Jiansong.Chen@amd.com>

Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
 include/drm/amd_asic_type.h                | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 81ca92127c00..724886afb980 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -114,6 +114,7 @@ const char *amdgpu_asic_name[] = {
 	"NAVI14",
 	"NAVI12",
 	"SIENNA_CICHLID",
+	"NAVY_FLOUNDER",
 	"LAST",
 };
 
diff --git a/include/drm/amd_asic_type.h b/include/drm/amd_asic_type.h
index 0c5bd1134460..8712e14991ed 100644
--- a/include/drm/amd_asic_type.h
+++ b/include/drm/amd_asic_type.h
@@ -55,6 +55,7 @@ enum amd_asic_type {
 	CHIP_NAVI14,	/* 26 */
 	CHIP_NAVI12,	/* 27 */
 	CHIP_SIENNA_CICHLID,	/* 28 */
+	CHIP_NAVY_FLOUNDER,	/* 29 */
 	CHIP_LAST,
 };
 
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
