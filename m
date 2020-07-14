Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7E921F934
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 20:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36ED26E5B6;
	Tue, 14 Jul 2020 18:24:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EB46E82C
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 18:24:21 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 80so16515418qko.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 11:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OigQcrO4iZ1j741x+xJOnOPa23Zvdm3URkG4X6/8vfE=;
 b=TliQys16PFWmEVyiaiAYMJbX5l16EyDUb7YHgs29HHkVlp3QDTJJdSfc6HoEAaRQm6
 huDELL2Ny8axhJ738WosdjQRZ/6OPeyfb8Avh2dvXSJ16iWyF/BdwV/O/ivTcuv4AfAo
 AClaCiSUGaoMdoqmHaCXKR7fOAlKpI89guUn0NJkFfz17K0ycsO60CHyWpYsdVJUBdBL
 eBPuv929+6ubJGB19sdW391X940SZpap7x0LDy6jjaTncst8+hOdZmzaupLZ/Vvs89W0
 zvKFR4gZ5KYhVyQwXcg+kPc6AvOwyTFMdIGtME39oCv+PZGX+4KftfAwLOxxFHuh9RPP
 gAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OigQcrO4iZ1j741x+xJOnOPa23Zvdm3URkG4X6/8vfE=;
 b=sl6XY0b0swCR/UBlhUDl3+JsN0edEJlO3/B8xPbme8QjESl+r4MtMKjpBl/7M+de/m
 DdgFxpK+qGLQPJ72foSmbK2QR8Tlg5ytdwGKDk5fMd9Na7QZ8AX7SoQaTOgX7nMXXr9+
 wDvsM3QMmafGDhmGp8OIIHrHaxKIfNJJwEfLFE6n9QWmPAYdfVDSO4cegZEsym6sLS0A
 /EeDs1cXsz3WAsTQ6iOmswL+KELd8t4PrGmVY0s77hVIfhKZHk0siNlwjpNhhsKFw34l
 9AaYlcRwTZT7TMiHswXM7hLQdw/OhwzWw66cGydPXoODj5eue7OK1awBbJw4Iid0iO51
 rWQg==
X-Gm-Message-State: AOAM531n6BZiDJdKzOnxSDfjrM0Y3HD9hhhVHM4hmIEJ/mYsvm79B0Q6
 8IM4jWSVI1p20SdYmT+NMbSqijT5
X-Google-Smtp-Source: ABdhPJxuuWKj1K7FqpN6ecuxSWJsdq8ZB90idxu+VshQRy+/YMOUBxsQ0Zdb5lPMCRwVf2tyKxZFHA==
X-Received: by 2002:a37:d91:: with SMTP id 139mr5540999qkn.291.1594751060449; 
 Tue, 14 Jul 2020 11:24:20 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id d53sm26046456qtc.47.2020.07.14.11.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:24:19 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/42] drm/amdgpu/soc15: add support for navy_flounder
Date: Tue, 14 Jul 2020 14:23:20 -0400
Message-Id: <20200714182353.2164930-10-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <Tao.Zhou1@amd.com>,
 Jiansong Chen <Jiansong.Chen@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jiansong Chen <Jiansong.Chen@amd.com>

Add soc support.

Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
Reviewed-by: Tao Zhou <Tao.Zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 356849136d1d..7c551dc2ccdc 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -734,6 +734,12 @@ static int nv_common_early_init(void *handle)
 			AMD_PG_SUPPORT_MMHUB;
 		adev->external_rev_id = adev->rev_id + 0x28;
 		break;
+	case CHIP_NAVY_FLOUNDER:
+		adev->cg_flags = 0;
+		adev->pg_flags = 0;
+		adev->external_rev_id = adev->rev_id + 0x32;
+		break;
+
 	default:
 		/* FIXME: not supported yet */
 		return -EINVAL;
@@ -960,6 +966,7 @@ static int nv_common_set_clockgating_state(void *handle,
 	case CHIP_NAVI14:
 	case CHIP_NAVI12:
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 		adev->nbio.funcs->update_medium_grain_clock_gating(adev,
 				state == AMD_CG_STATE_GATE);
 		adev->nbio.funcs->update_medium_grain_light_sleep(adev,
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
