Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B271C853F33
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Feb 2024 23:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AACE10E966;
	Tue, 13 Feb 2024 22:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="M0DnMt+1";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3983910E964
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Feb 2024 22:52:43 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6e08dd0fa0bso172798b3a.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Feb 2024 14:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1707864763; x=1708469563; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=II0qcipH8FDwYomAwZzNUJrgYDrUsj8b4nlVmRCI77Y=;
 b=M0DnMt+1768Ad2KXM/f6arQDD54y80lcGwk+1OiA3oB68dhT5qH1Snek7qIYVCfDgI
 MiNk/nmcQDhYjMatn0vPycqLhyrL171HH4Ou67Xd8E8VwOSpswNdeEpuO38YLXidQwyK
 50sRFb8rADIF1qEA7TGvet3s6fyrevQOLqD29coByYA6SPLWB5f0TgbTdAdH6T4ZggND
 v9QeilVPxOIhoUZdawsLVzuw/GkHZJe4nDOBwnlAujQ/FmnRYjdKBPJTj0X41fF+tzVp
 cLiIeCjJii63/ckgvyH1Q2tLf7RAzdvWmq74yPhP27oSJBjcoHVeVWZfuoh/gDw2HiA5
 viYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707864763; x=1708469563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=II0qcipH8FDwYomAwZzNUJrgYDrUsj8b4nlVmRCI77Y=;
 b=mO+9RiPihQUaDzuQxKuL5OpCU9dg6YQrqSNXI+n67VCRr9r177tk4y6FU651q0jCfd
 4WV7cQV3o9lWxrk/jwRgSe1W6A0f//5cw1cAXdRNWIBS16y3ZJkR5F8IjeB6bQyyIt9V
 6YjnSY9rOdBf2L+h3hQ9tUNB+XrryPFDBd/e5i3EdubmX5L2iZt6xGH3TWTs3dRbSPUI
 TBXvJzv6DADbZylKABpzEk8gDHziVS3CHWkkeT/dfBjL+Gvvu/0ukaNLjzjyMfHr39Qd
 Rq4LxdvO9L5KtOoUiR8beUvHFgcPmPO1xuua+mR+481HS5tW2nYHjYVBvv/YMdQXAsl4
 hEXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3usHqnYb6achY9KZTXR36MdMiVt6um62zzg1DIAHhUM3vwEPChuVIfeM0NaBhaQ+mTCJPhsMetv7E5ntQIsHTvFNyWSMxFbAhn7wRpg==
X-Gm-Message-State: AOJu0YwNTleDslFoNGMC1fg2V6kzox01tzc+5bsHU4yp94c29GzkcujL
 86TDEMuE3dLw6iEsIhHnLoio34Z+Uv9TZR2Er5tJXrip8egVIjY/XmGA1Zhmgw==
X-Google-Smtp-Source: AGHT+IHV1rZ9AginRj1M6zPLfVAjhYAaBL91nVv6u5bokOZC61RgSbHL7osZskL3VIW6mOJNAbdLrw==
X-Received: by 2002:a05:6a00:21d1:b0:6e0:891f:9c00 with SMTP id
 t17-20020a056a0021d100b006e0891f9c00mr348714pfj.1.1707864762964; 
 Tue, 13 Feb 2024 14:52:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX5ZrOXunoOuaL7qA8FLg1pTR967Owm/e59kaAVe+EQsovfcronQ2yD7g+I7PvNvIiTZ+ig45gSyJ7ejSjFg6AB170GuUiRALHd6/LDLifA8kAATFB5mKh4FGkJ+XY5fH+VPlstvdPipHY0Cdh0T5EcYNCVE358tGqog0epA4jpR8DLoUYN3/F/gyjmB8GLdFGbU8Gwc15x6cLzU35DEIZE0jPmWEjFPwl2VJU5XGtBCOdvrJRp7npCrVwP2El61dIySb/N91Jeiy6z8YgcGDotGvwgJ9e8KABn0aYvTB6Zc3QjCZlHwogkHV+DsBXi7ZyhwPMKquCrgkhI7Ac2mL7yO1znMGTwzW1siLat3NbMd8ntd7MNjO4nmUfr
Received: from fedora.. ([2804:7f4:8280:6434:9a20:a151:2d8b:d5a0])
 by smtp.gmail.com with ESMTPSA id
 r25-20020a639b19000000b005dc89142b99sm1528379pgd.84.2024.02.13.14.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 14:52:42 -0800 (PST)
From: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: jppaulo <jppaulo11@hotmail.com>,
 Joao Paulo Pereira da Silva <jppaulo11@usp.br>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amd/display: clean else not following close brace
Date: Tue, 13 Feb 2024 19:43:10 -0300
Message-ID: <20240213224339.379599-3-jppaulo11@usp.br>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213224339.379599-1-jppaulo11@usp.br>
References: <20240213224339.379599-1-jppaulo11@usp.br>
MIME-Version: 1.0
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: jppaulo <jppaulo11@hotmail.com>

Put else statement in the same line and after the close brace.

Signed-off-by: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
index be5a6d008b29..e750c853890e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
@@ -396,8 +396,7 @@ void link_enc_cfg_link_encs_assign(
 				eng_id_req = stream->link->dpia_preferred_eng_id;
 
 			eng_id = find_first_avail_link_enc(stream->ctx, state, eng_id_req);
-		}
-		else
+		} else
 			eng_id =  link_enc->preferred_engine;
 
 		add_link_enc_assignment(state, stream, eng_id);
-- 
2.43.0

