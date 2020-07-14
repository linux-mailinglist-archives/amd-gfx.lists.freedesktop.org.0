Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E7821F94F
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 20:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A9D6E862;
	Tue, 14 Jul 2020 18:24:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A736E862
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 18:24:56 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 80so16517011qko.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 11:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fnBdLHPuRXHFStiHjvk2Ku9uecP5ZkuITWCOVC7SkcQ=;
 b=f5iwo+zHNEX94Vc/DGCrCwTVuzE/ZD6s+dDva/2ZSlKg3fv+N5yHgDb2Yl1ZWe9ygh
 VR7+tdCOfuBzeffVXlfKOHzCocLKXxtyd/hnZJ4sG9/J/Z2vPhSn4/Gwy2lolNpckOQ7
 ylzyXMU/FpQ51zIsoDGWMOZzadO8IjUssscrFJ9q1qm0r3GQm4TVawIHJoUMPhBzH0PF
 Ok40anI6EnspU1qdondjURXDSQSrpJdB4h7cAQqs8BHOopJBoJ7SOKryRLPimwL9WuZn
 PAgblZYh27CPYfPH9A2qIwKEuRFWvKprlpVfRfvufvjCN+NWOFZKDjrjeCwO+xtMb0Md
 vV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fnBdLHPuRXHFStiHjvk2Ku9uecP5ZkuITWCOVC7SkcQ=;
 b=cBT2FvxBf16aJLmCVvd00vSPZ2x4KS6M2T3xZSUNh6cOwZv5byQFrozxAVne1BojgZ
 vSP+guZtVVcsHTYtUFHRwoP4y07RERSzcjebXGH67aF2FlXwqInaHED0O9CpGtfoZW9e
 YixYX2f5An9DxyFAbn6+GNKAz2OE36MtDOH5jc68VNw4MKpL9nvtIVGb/FlATySf5v8A
 NTw3qI0R5uOZKZDlfsMwjyQY0Mo8W0i3UQho/6kWdAF7p2CnTpf9KA+7YKNbZog9/FV1
 UqpstNFgehdWPLCyneU2UfQbzKqypiRw1I8O3Vl/8ZXTzASgZ4eF56FAF8ANQLRyR77M
 SqGA==
X-Gm-Message-State: AOAM531d7b4DSCjKN7y3tswXTYXeXqGOXO3SjGPIM/2nCfL8g3QnSRh9
 1MjUx+2ITwQoA7XREj32Jnmp5fZO
X-Google-Smtp-Source: ABdhPJwwhqWuW0zrh5xIZQq0058VUz6OAQFAMIN4UMUtDkz7dta5ZWrwUwNWWkeF+S+xCfptIrxYjg==
X-Received: by 2002:a37:45cb:: with SMTP id s194mr5984540qka.74.1594751094977; 
 Tue, 14 Jul 2020 11:24:54 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id d53sm26046456qtc.47.2020.07.14.11.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:24:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 35/42] drm/amdgpu: enable GFX clock gating for navy_flounder
Date: Tue, 14 Jul 2020 14:23:46 -0400
Message-Id: <20200714182353.2164930-36-alexander.deucher@amd.com>
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

Enable GFX MGCG, CGCG and 3DCG for navy_flounder.

Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 34f4e636b30d..0fa1e561c2cc 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -755,7 +755,10 @@ static int nv_common_early_init(void *handle)
 		adev->external_rev_id = adev->rev_id + 0x28;
 		break;
 	case CHIP_NAVY_FLOUNDER:
-		adev->cg_flags = AMD_CG_SUPPORT_VCN_MGCG |
+		adev->cg_flags = AMD_CG_SUPPORT_GFX_MGCG |
+			AMD_CG_SUPPORT_GFX_CGCG |
+			AMD_CG_SUPPORT_GFX_3D_CGCG |
+			AMD_CG_SUPPORT_VCN_MGCG |
 			AMD_CG_SUPPORT_JPEG_MGCG;
 		adev->pg_flags = AMD_PG_SUPPORT_VCN |
 			AMD_PG_SUPPORT_VCN_DPG |
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
