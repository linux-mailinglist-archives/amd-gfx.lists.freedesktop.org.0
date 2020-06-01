Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A33F1EA976
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33846E0BE;
	Mon,  1 Jun 2020 18:03:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806CE89E41
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:03:00 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id c14so8913639qka.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1YZh+N490laJnpfsSjon+Qwkalmq0WmHOEmZUw48c4w=;
 b=jLi5aLUdMJtZ8sQ2OwcjcDzidPYFwAsRA5jwhK/b0I959nvKjjMrji1U/NC/hPQKiM
 mV59XY9qvt1S8T5W1P9soJ/XxrOms5v2X/YZ7VxeAuVyuANjGEYhPQcXus/QgOTZwb+m
 IHlByAyJHJC4uiFa/ACbhJ7XoGAFfcJ5FWJp5FvKoY8hNQ1X2m5XPVHkZ99qcU2Jh+zy
 O+oCMpFyEU+Ms2wnBRrqsVB/uGieNDQTaH9P3ZN/Z6+GgOxjV+XYCwcJ4U1nK3AV6WBN
 BwOaTD941Kw6eCGdYotTLAvKiIRHhwfwH2e4va0TB5YXV97op0vNz1+I4VjlReJRXcYY
 dT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1YZh+N490laJnpfsSjon+Qwkalmq0WmHOEmZUw48c4w=;
 b=IJTUmHK4P/7zeEt/MEd5rtA+SZq4U1jwCCf/jGH2AaGugsfFqxrCq0Zc5lWSRiLk0x
 Zlw18SAntr3BaGyZNPH6yP/gTv0y5XDhtu/40E9ECANW0AFEfLtm9UIcIXgFuTeJnp5l
 2iykIcm1Q//vTMjCpD/WL35+gJPMagozYJ+Scx3uXu1kWjDhL90HSUK74aMIbH5bjBgz
 c15/+RSEcU0s0BQHYduhxLYQUxV0kgAak3sA8WT/cPbuHIjRdr7sAl2v5EHUHAqZJ4yS
 bhpc2P4lptc2Dq9cFuGUdEpvxwvSWiKmQxVYWURejRvENgkimAaywXFmNtFaQedgA0Gg
 SPew==
X-Gm-Message-State: AOAM532mNmaDZqfsZvhNgKLUSspYI+MM+j7FjByXXLyU+jBOF1Yz8xCk
 ZsD0jPqNGAUzda9ADH8fEn/dFTNM
X-Google-Smtp-Source: ABdhPJxcMm98GlopxA10sxSMEtbsvtdtZbJH/rl62zDCQ9DkRAIWf5c45H2YetmjigDIrI3Dt6N9fg==
X-Received: by 2002:a37:488:: with SMTP id 130mr21796735qke.12.1591034579491; 
 Mon, 01 Jun 2020 11:02:59 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id h16sm42164qtp.1.2020.06.01.11.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:02:58 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 012/207] drm/amdgpu/soc15: add support for sienna_cichlid
Date: Mon,  1 Jun 2020 13:59:24 -0400
Message-Id: <20200601180239.1267430-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601180239.1267430-1-alexander.deucher@amd.com>
References: <20200601180239.1267430-1-alexander.deucher@amd.com>
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Likun Gao <Likun.Gao@amd.com>

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index fd3b9e21a5bd..642d18e70860 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -686,6 +686,11 @@ static int nv_common_early_init(void *handle)
 			adev->rev_id = 0;
 		adev->external_rev_id = adev->rev_id + 0xa;
 		break;
+	case CHIP_SIENNA_CICHLID:
+		adev->cg_flags = 0;
+		adev->pg_flags = 0;
+		adev->external_rev_id = adev->rev_id + 0x28;
+		break;
 	default:
 		/* FIXME: not supported yet */
 		return -EINVAL;
@@ -901,6 +906,7 @@ static int nv_common_set_clockgating_state(void *handle,
 	case CHIP_NAVI10:
 	case CHIP_NAVI14:
 	case CHIP_NAVI12:
+	case CHIP_SIENNA_CICHLID:
 		adev->nbio.funcs->update_medium_grain_clock_gating(adev,
 				state == AMD_CG_STATE_GATE);
 		adev->nbio.funcs->update_medium_grain_light_sleep(adev,
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
