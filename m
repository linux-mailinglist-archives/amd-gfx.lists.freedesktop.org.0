Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A451485D24B
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Feb 2024 09:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8436210E637;
	Wed, 21 Feb 2024 08:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="IgAC8GwE";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5EB10E53A
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Feb 2024 19:47:46 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6e435542d41so1584491b3a.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Feb 2024 11:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1708458466; x=1709063266; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WEwAJnG85LZhHLPhtupVWGgKznsoezSxNC+Z5m8WKxs=;
 b=IgAC8GwEV0bBgxF8H8j1+nyMc37PXwT6TSw7dbJoKK2kO/U1BZR0FLEiyQDwWUuj/L
 VkLsqg/WNPlhgwLF/PTBLQK3X2VmZsyEZqR9vT1lHaWMP1MFtqxTCQKnD6vY7wm2xa6G
 875E4/+DJKAve+JGSFaGrZL/cWWpL7SJ/+fgLDpHj1CDNBSEKd8Z3vR6jc8uv8CIUN0J
 S/PkeuTP0KkZ9Gcl3+HjweANW1zQw0hYlqj5wF/b1r7fvV5V21UzCGVKEqwrjpUbLHaM
 vGwVmwz2XJi81F/Z8lU+9axCTE9yyXgZThfY7YlWkrOMKA31MFqj/jZX0cpedVIF6Z/W
 OqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708458466; x=1709063266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WEwAJnG85LZhHLPhtupVWGgKznsoezSxNC+Z5m8WKxs=;
 b=GQ8Vjz8It36OtENYGrHz6XSew55MrUmdM+6eX2+xZiB0okMUqgsTFhDQHuQrFWliaj
 v/b2/SHI+Vp9k6IxDHtMksFRTI7FlFPDy50e+bckRLGtL7NEk3+nD9rc/msTOvbPIdK6
 admUBEtN9mn2DG3IokihWMgD78iCxIUFR1VURJIvIqDw26DZ74Jsd9rMHYO3E3q96GhT
 hhNfJ7likfOV5Q27G+hTUmvgF6LWfQTJOawvJMB4bIpTeYwjFMmIkRxTxDuEp9/wcd6b
 1WixkjwIlvuTtnHJ4v6DhrCpQf3wSmAllfpn71WuWc4HbOCoyzQXSgSJ805xM0i0BU+q
 i64A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV37ix4wwaXqGLg4rr0/vwRQQh+DyS1wgPBsBNmKL82U0CFGklp+/tAmkk7EVZR2L4tR/NTjT7lyI0suHTs979NT9c7m+cFLwfQuG0kSw==
X-Gm-Message-State: AOJu0YwKklQOJi3Fts3f1hbM9iZl+QjsgC1U24doFovofJs7FW8Q0TfX
 7koz/1YW/F2r4RAFoN2+EntT/9GYLG6D5fex5HUc56AxpjbKuCLuTonuKqnQUAg=
X-Google-Smtp-Source: AGHT+IHT/6ByV3nCKHTDzWjbdXhJg67w1/vgAwad3K/qgGS5NL2u7SrgCHlhoCDACT7hRksY4kRgGA==
X-Received: by 2002:a05:6a21:3982:b0:19e:a1a3:b14 with SMTP id
 ad2-20020a056a21398200b0019ea1a30b14mr19115226pzc.1.1708458465992; 
 Tue, 20 Feb 2024 11:47:45 -0800 (PST)
Received: from localhost.localdomain ([185.153.176.89])
 by smtp.gmail.com with ESMTPSA id
 u21-20020aa78395000000b006e0ad616be3sm7293482pfm.110.2024.02.20.11.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 11:47:45 -0800 (PST)
From: David Tadokoro <davidbtadokoro@usp.br>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: David Tadokoro <davidbtadokoro@usp.br>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amd/display: add prefix to rv1_clk_mgr.c functions
Date: Tue, 20 Feb 2024 16:46:56 -0300
Message-Id: <20240220194657.243378-3-davidbtadokoro@usp.br>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220194657.243378-1-davidbtadokoro@usp.br>
References: <20240220194657.243378-1-davidbtadokoro@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 21 Feb 2024 08:14:29 +0000
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

The functions defined in dc/clk_mgr/dcn10/rv1_clk_mgr.c don't have
names that indicates where they were declared.

To better filter results in debug tools like ftrace, prefix these
functions with 'rv1_clk_mgr_'.

Signed-off-by: David Tadokoro <davidbtadokoro@usp.br>
---
 .../display/dc/clk_mgr/dcn10/rv1_clk_mgr.c    | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c
index 60761ff3cbf1..093084a48daa 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c
@@ -34,12 +34,12 @@
 #include "rv1_clk_mgr_vbios_smu.h"
 #include "rv1_clk_mgr_clk.h"
 
-static void rv1_init_clocks(struct clk_mgr *clk_mgr)
+static void rv1_clk_mgr_init_clocks(struct clk_mgr *clk_mgr)
 {
 	memset(&(clk_mgr->clks), 0, sizeof(struct dc_clocks));
 }
 
-static int rv1_determine_dppclk_threshold(struct clk_mgr_internal *clk_mgr, struct dc_clocks *new_clocks)
+static int rv1_clk_mgr_determine_dppclk_threshold(struct clk_mgr_internal *clk_mgr, struct dc_clocks *new_clocks)
 {
 	bool request_dpp_div = new_clocks->dispclk_khz > new_clocks->dppclk_khz;
 	bool dispclk_increase = new_clocks->dispclk_khz > clk_mgr->base.clks.dispclk_khz;
@@ -85,18 +85,18 @@ static int rv1_determine_dppclk_threshold(struct clk_mgr_internal *clk_mgr, stru
 	return disp_clk_threshold;
 }
 
-static void ramp_up_dispclk_with_dpp(
+static void rv1_clk_mgr_ramp_up_dispclk_with_dpp(
 		struct clk_mgr_internal *clk_mgr,
 		struct dc *dc,
 		struct dc_clocks *new_clocks,
 		bool safe_to_lower)
 {
 	int i;
-	int dispclk_to_dpp_threshold = rv1_determine_dppclk_threshold(clk_mgr, new_clocks);
+	int dispclk_to_dpp_threshold = rv1_clk_mgr_determine_dppclk_threshold(clk_mgr, new_clocks);
 	bool request_dpp_div = new_clocks->dispclk_khz > new_clocks->dppclk_khz;
 
 	/* this function is to change dispclk, dppclk and dprefclk according to
-	 * bandwidth requirement. Its call stack is rv1_update_clocks -->
+	 * bandwidth requirement. Its call stack is rv1_clk_mgr_update_clocks -->
 	 * update_clocks --> dcn10_prepare_bandwidth / dcn10_optimize_bandwidth
 	 * --> prepare_bandwidth / optimize_bandwidth. before change dcn hw,
 	 * prepare_bandwidth will be called first to allow enough clock,
@@ -187,7 +187,7 @@ static void ramp_up_dispclk_with_dpp(
 	clk_mgr->base.clks.max_supported_dppclk_khz = new_clocks->max_supported_dppclk_khz;
 }
 
-static void rv1_update_clocks(struct clk_mgr *clk_mgr_base,
+static void rv1_clk_mgr_update_clocks(struct clk_mgr *clk_mgr_base,
 			struct dc_state *context,
 			bool safe_to_lower)
 {
@@ -274,7 +274,7 @@ static void rv1_update_clocks(struct clk_mgr *clk_mgr_base,
 	/* program dispclk on = as a w/a for sleep resume clock ramping issues */
 	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz)
 			|| new_clocks->dispclk_khz == clk_mgr_base->clks.dispclk_khz) {
-		ramp_up_dispclk_with_dpp(clk_mgr, dc, new_clocks, safe_to_lower);
+		rv1_clk_mgr_ramp_up_dispclk_with_dpp(clk_mgr, dc, new_clocks, safe_to_lower);
 		clk_mgr_base->clks.dispclk_khz = new_clocks->dispclk_khz;
 		send_request_to_lower = true;
 	}
@@ -291,7 +291,7 @@ static void rv1_update_clocks(struct clk_mgr *clk_mgr_base,
 	}
 }
 
-static void rv1_enable_pme_wa(struct clk_mgr *clk_mgr_base)
+static void rv1_clk_mgr_enable_pme_wa(struct clk_mgr *clk_mgr_base)
 {
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
 	struct pp_smu_funcs_rv *pp_smu = NULL;
@@ -305,10 +305,10 @@ static void rv1_enable_pme_wa(struct clk_mgr *clk_mgr_base)
 }
 
 static struct clk_mgr_funcs rv1_clk_funcs = {
-	.init_clocks = rv1_init_clocks,
+	.init_clocks = rv1_clk_mgr_init_clocks,
 	.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
-	.update_clocks = rv1_update_clocks,
-	.enable_pme_wa = rv1_enable_pme_wa,
+	.update_clocks = rv1_clk_mgr_update_clocks,
+	.enable_pme_wa = rv1_clk_mgr_enable_pme_wa,
 };
 
 static struct clk_mgr_internal_funcs rv1_clk_internal_funcs = {
-- 
2.39.2

