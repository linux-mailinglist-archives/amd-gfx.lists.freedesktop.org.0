Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2235F6CB285
	for <lists+amd-gfx@lfdr.de>; Tue, 28 Mar 2023 01:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655C210E7CC;
	Mon, 27 Mar 2023 23:35:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93B810E7CB
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Mar 2023 23:35:40 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id s8so7716577ois.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Mar 2023 16:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1679960140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1A2mIjPdUqhr5Ice4vp7gIRuK6chByRV3cyN7aavT0E=;
 b=hBEZEu/Fg8Z7uqZ/Ekz1hHMkGIiWSFF5sR50cANSTAnWulG9QmfK+wwFoes5VSYTRh
 htMmf303bnpibjbmVMsR9SPCc51HKUstFFhpmUbInbdSvxo7XOCdedKUFZ8ZtXeJ7/FA
 238eQJQE4A1BarBX9h8IbgyVHKEJmOM2bfBO2yN40h1Yw8KQ3rxQ/tQW4pQ1x4wP5cwj
 x4RDRYoVZB/R5SC67RF1rxAyAA1Nu27ewQa8soq4BzP4HWRC7hBCY2FiqLFMYboWuy++
 x2mBeYBSEDmh/XqmaVCK4Cp6GkEDyA9YmnvG/o4ecItjja9Cz2eSbfxPBnJSBpJvtT0J
 pvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679960140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1A2mIjPdUqhr5Ice4vp7gIRuK6chByRV3cyN7aavT0E=;
 b=5YIX7I11ZhZR5zNvBpnoTCmH8T8FO2YOwOFuwb+wIXYwlrSMz31PLaP22AKU5PL7qz
 j17Mj8cSNVFZVWY76hZ1jCaI+MqFjSm4v0pXHyt1WYeVaOWCot140i3AMYq1wnpnGjU+
 tr9Ttf6YHQQbnrq11LDLUYbGQftOf8nssQJh4tzVyE5AHbv9tDCLuo5MlS8w/GudzVma
 BItu2/bLALnXV/XncEiGP7wyTbL/fcDy7+jG12X9Xfx3eh2fjjhvwCIM00VmcqOspVcw
 npkNg8/G/koekxHUpR9ACtkRvVzDDY062sy40Gg0teppRTqQT5hyqrtLoj4I2vv/VXlB
 7G8A==
X-Gm-Message-State: AO0yUKXvyw4uB5TuyukN6icwsAY/rlGyOw91XO8QKIYvPwiuJOBFw+Fl
 w25pR8pVfWbAnWb8U5QfGiiTzzdYBsb0uCe7d3vq0w==
X-Google-Smtp-Source: AK7set/XpIaBnrd0Il1RA6TJi7frFciWmH9SabrmY2R33L9ZbylSXEKtU1Nfc4VXuM45NiWKMhJC9Q==
X-Received: by 2002:a05:6808:58:b0:386:f58a:2262 with SMTP id
 v24-20020a056808005800b00386f58a2262mr5575924oic.57.1679960139887; 
 Mon, 27 Mar 2023 16:35:39 -0700 (PDT)
Received: from ARCHaio.localdomain ([2804:1b3:a2c0:c911:919f:bd20:4f2a:8383])
 by smtp.gmail.com with ESMTPSA id
 b186-20020aca34c3000000b00389295e8424sm1643409oia.45.2023.03.27.16.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 16:35:39 -0700 (PDT)
From: Caio Novais <caionovais@usp.br>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] drm/amd/display: Remove two unused variables
 'is_pipe_split_expected' and 'state'
Date: Mon, 27 Mar 2023 20:33:50 -0300
Message-Id: <20230327233353.64081-10-caionovais@usp.br>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327233353.64081-1-caionovais@usp.br>
References: <20230327233353.64081-1-caionovais@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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
Cc: Felipe Clark <felipe.clark@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Mario Limonciello <mario.limonciello@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 David Airlie <airlied@gmail.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Gabe Teeger <gabe.teeger@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Taimur Hassan <Syed.Hassan@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 George Shen <George.Shen@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Alan Liu <HaoPing.Liu@amd.com>,
 Mukul Joshi <mukul.joshi@amd.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Jingwen Zhu <Jingwen.Zhu@amd.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 Leo Li <sunpeng.li@amd.com>, Melissa Wen <mwen@igalia.com>,
 Le Ma <le.ma@amd.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Caio Novais <caionovais@usp.br>, Martin Leung <Martin.Leung@amd.com>,
 Ryan Lin <tsung-hua.lin@amd.com>, Brian Chang <Brian.Chang@amd.com>,
 Sung Joon Kim <sungjoon.kim@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Dillon Varone <Dillon.Varone@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Wesley Chalmers <Wesley.Chalmers@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Zhan Liu <zhan.liu@amd.com>, Roman Li <Roman.Li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Ethan Wellenreiter <Ethan.Wellenreiter@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Compiling AMD GPU drivers displays two warnings:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource.c: In function ‘dcn32_acquire_post_bldn_3dlut’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource.c:1614:31: warning: variable ‘state’ set but not used [-Wunused-but-set-variable]
and
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource.c: In function ‘dcn32_populate_dml_pipes_from_context’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource.c:1916:17: warning: variable ‘is_pipe_split_expected’ set but not used [-Wunused-but-set-variable]

Get rid of them by removing the variables.

Signed-off-by: Caio Novais <caionovais@usp.br>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
index 74e50c09bb62..3435d3294e0b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
@@ -1611,7 +1611,6 @@ bool dcn32_acquire_post_bldn_3dlut(
 		struct dc_transfer_func **shaper)
 {
 	bool ret = false;
-	union dc_3dlut_state *state;
 
 	ASSERT(*lut == NULL && *shaper == NULL);
 	*lut = NULL;
@@ -1620,7 +1619,6 @@ bool dcn32_acquire_post_bldn_3dlut(
 	if (!res_ctx->is_mpc_3dlut_acquired[mpcc_id]) {
 		*lut = pool->mpc_lut[mpcc_id];
 		*shaper = pool->mpc_shaper[mpcc_id];
-		state = &pool->mpc_lut[mpcc_id]->state;
 		res_ctx->is_mpc_3dlut_acquired[mpcc_id] = true;
 		ret = true;
 	}
@@ -1913,7 +1911,6 @@ int dcn32_populate_dml_pipes_from_context(
 	struct resource_context *res_ctx = &context->res_ctx;
 	struct pipe_ctx *pipe;
 	bool subvp_in_use = false;
-	uint8_t is_pipe_split_expected[MAX_PIPES] = {0};
 	struct dc_crtc_timing *timing;
 
 	dcn20_populate_dml_pipes_from_context(dc, context, pipes, fast_validate);
@@ -2002,7 +1999,6 @@ int dcn32_populate_dml_pipes_from_context(
 		}
 
 		DC_FP_START();
-		is_pipe_split_expected[i] = dcn32_predict_pipe_split(context, &pipes[pipe_cnt]);
 		DC_FP_END();
 
 		pipe_cnt++;
-- 
2.40.0

