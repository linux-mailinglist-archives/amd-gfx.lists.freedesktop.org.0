Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E303584588
	for <lists+amd-gfx@lfdr.de>; Thu, 28 Jul 2022 20:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E763910E049;
	Thu, 28 Jul 2022 18:23:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A877410E71A
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 Jul 2022 18:23:09 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4LtzXs1WM6zDs0w;
 Thu, 28 Jul 2022 18:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1659032589; bh=iaOHYVyM4X5RdBouq2ppOPj7dngg396FejPsdt4W6p8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kFn3YO7ajpcW7WVzmdRRZT0sm9E6vs/T/vdqBJxE1ArCrcvU5Pd07RzvN8BScha23
 a5iIulXfYOOXajapFZs06XmudcVhU063haMH3z13dv0jbi+SgUBWFva+gRfcBUKlIS
 43wAMC3umwO78/jlbHadTH5+sXk1x6r1Mzw42IVU=
X-Riseup-User-ID: FEFF0A5E1F2EA0E00D88335364463F13AD1802053B13777E155B7D8668B66B03
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4LtzXm0MM2z5vMX;
 Thu, 28 Jul 2022 18:23:03 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 13/16] drm/amd/display: Remove TFinalxFill VBA variable
Date: Thu, 28 Jul 2022 15:20:45 -0300
Message-Id: <20220728182047.264825-14-mairacanal@riseup.net>
In-Reply-To: <20220728182047.264825-1-mairacanal@riseup.net>
References: <20220728182047.264825-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: magalilemes00@gmail.com, tales.aparecida@gmail.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The TFinalxFill variable from the struct vba_vars_st is only used
on assignments, so its value is not used on code. So,
remove the TFinalxFill entry from the struct vba_vars_st.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c | 3 ---
 .../gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c   | 3 ---
 drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c | 3 ---
 drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h          | 1 -
 4 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
index 7effe4be61b2..91e74c0f3c3c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
@@ -2618,9 +2618,6 @@ static void dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer
 			mode_lib->vba.RemainingFillLevel = dml_max(
 					0.0,
 					mode_lib->vba.FinalFillLevel - mode_lib->vba.InitFillLevel);
-			mode_lib->vba.TFinalxFill = mode_lib->vba.RemainingFillLevel
-					/ (mode_lib->vba.SrcActiveDrainRate
-							* mode_lib->vba.XFCFillBWOverhead / 100);
 		}
 	}
 	{
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
index a23b400f615b..9b52f9f3e4a0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
@@ -2691,9 +2691,6 @@ static void dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndP
 			mode_lib->vba.RemainingFillLevel = dml_max(
 					0.0,
 					mode_lib->vba.FinalFillLevel - mode_lib->vba.InitFillLevel);
-			mode_lib->vba.TFinalxFill = mode_lib->vba.RemainingFillLevel
-					/ (mode_lib->vba.SrcActiveDrainRate
-							* mode_lib->vba.XFCFillBWOverhead / 100);
 		}
 	}
 	{
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
index 4ba9fa17ea39..bc8cc21cf3f6 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -2627,9 +2627,6 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 			mode_lib->vba.RemainingFillLevel = dml_max(
 					0.0,
 					mode_lib->vba.FinalFillLevel - mode_lib->vba.InitFillLevel);
-			mode_lib->vba.TFinalxFill = mode_lib->vba.RemainingFillLevel
-					/ (mode_lib->vba.SrcActiveDrainRate
-							* mode_lib->vba.XFCFillBWOverhead / 100);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
index f973d0ee82f9..46e69f941bff 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
@@ -421,7 +421,6 @@ struct vba_vars_st {
 	double FinalFillMargin;
 	double FinalFillLevel;
 	double RemainingFillLevel;
-	double TFinalxFill;
 
 	//
 	// SOC Bounding Box Parameters
-- 
2.37.1

