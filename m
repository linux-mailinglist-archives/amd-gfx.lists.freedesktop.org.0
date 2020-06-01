Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFB51EABB0
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9332F6E32C;
	Mon,  1 Jun 2020 18:21:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7CF6E32A
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:21:55 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c185so10007507qke.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9LenHr1EEyClSG0wC+NheSFLifzr4evt6wYA8DPnX84=;
 b=C6CCQesIgGuphP6rzkOSbERsw7esGwvz5ZgKRLvX2wd979qGkAMsOPFhuiZOT8H5Kn
 C8MOW3mUPtHSHIKEw5z+Tt6Fa3mtabqOA6LSP+X//jb//+tO5r0BtpX1wgUZgqwm8OJV
 CFN2xaa91wzGkC7W2Ht2Lk6HxgzRQXrUclw+E16QIe6daVHkeaIYMLwQk5ozWui6447Q
 xgBt7x08KMY660VZ51ZH/XKzoezqHP2s0UHDCxqNvts3wQWAj17RSAjoCZvBhXdCtrqj
 S5qIG3GbSmh4mo6YTwMLRaEURRl4PL/JnX5whQV+xuiQpE0QcIcEQeMbvpH2i1mPYmpz
 mnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9LenHr1EEyClSG0wC+NheSFLifzr4evt6wYA8DPnX84=;
 b=DNE/3Yb0ZG/ch3RE+VqOIFWrLNztrIePB7ruGjfmyDJwn5cQeMUT2MIXCY5pk6FPx6
 o+UC25msDzPcXSZPFMT4dSgm+8jz/CxWgy+36UUVvg0nkPFAEeCIiGRbBYuSQmMWg2Z9
 6vza8YD+i/OspbwIzomodYYcPahf1qu+Sb+gRnZZdCCp1+0zqap7sqf4LHQehmuUlfm9
 /sQqOx2m1spsiYG+z/8EGaVx/SFHTmQ5xYGiawGKK8JqUthbKZUx7pcjDXX0az7pqmS0
 CoEH0yX5MsSJKIHRBJXTHtcy7Bbxlc8gAt4KdcihtLfbH1L/FVRV2CMaiXiznYUdJck4
 1DVQ==
X-Gm-Message-State: AOAM531dccYw8iJVls1e8UrYAkcX+/ETBeG4EQWnvmrXXqS2D5ThsgFI
 7Wo2D2GG2TIpgEi1/8mUiYZzijIY
X-Google-Smtp-Source: ABdhPJw5GY/sYTI+7I3QecTSgEOLYG4RPMWBZb/lZkqIz2O+QSSeql90rDmmpO1sn+1tsjXwgFJu6Q==
X-Received: by 2002:a37:670c:: with SMTP id b12mr13601304qkc.195.1591035714602; 
 Mon, 01 Jun 2020 11:21:54 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:21:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 128/207] drm/amd/powerplay: add function to get power limit
 for sienna_cichlid
Date: Mon,  1 Jun 2020 14:19:35 -0400
Message-Id: <20200601182054.1267858-39-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601182054.1267858-1-alexander.deucher@amd.com>
References: <20200601182054.1267858-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Likun Gao <Likun.Gao@amd.com>

Add function to get pptable power limit for sienna_cichlid.

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
index 2db4b3fb0cf9..2843e1be4289 100644
--- a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
@@ -1501,6 +1501,12 @@ static int sienna_cichlid_display_disable_memory_clock_switch(struct smu_context
 	return ret;
 }
 
+static uint32_t sienna_cichlid_get_pptable_power_limit(struct smu_context *smu)
+{
+	PPTable_t *pptable = smu->smu_table.driver_pptable;
+	return pptable->SocketPowerLimitAc[PPT_THROTTLER_PPT0];
+}
+
 static int sienna_cichlid_get_power_limit(struct smu_context *smu,
 				     uint32_t *limit,
 				     bool cap)
@@ -2335,6 +2341,7 @@ static const struct pptable_funcs sienna_cichlid_ppt_funcs = {
 	.get_dpm_ultimate_freq = smu_v11_0_get_dpm_ultimate_freq,
 	.set_soft_freq_limited_range = smu_v11_0_set_soft_freq_limited_range,
 	.override_pcie_parameters = smu_v11_0_override_pcie_parameters,
+	.get_pptable_power_limit = sienna_cichlid_get_pptable_power_limit,
 };
 
 void sienna_cichlid_set_ppt_funcs(struct smu_context *smu)
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
