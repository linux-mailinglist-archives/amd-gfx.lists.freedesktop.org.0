Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E49321F955
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 20:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9446E6E867;
	Tue, 14 Jul 2020 18:25:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4116E867
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 18:25:05 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id m8so7932504qvk.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 11:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cNM8ASotWi/xtT8jkJHNLgsh/wqMq73HSQXzIgOyulI=;
 b=UAy10hhUICIOPVFqk4HmH3kH8an5+qzmgk+urqgU8rH1GLxOf1WuWwJcZr6qJKikzv
 7O09L3LauCgE3GUzX3PJSPOD7MjD+oqbqK+RjIi4AZF0f1NB67m9ytyrraAlzfbrXhSC
 UsE/v0L/uQstmf1su4ZQDFxRtd7rTfGJlg0GAf80jFwUiz/mhKLhNP2FKTI1Py+rRFuM
 3NJo+P1mpBIjFgQCO6Ln9qRbHCvh+qK24CQZfF1IdVyIlyIA5yKdAaHAnbHoEN0WYWHC
 tD/KuwCFeZcpV81hChRaxwjAqbUU8ZMdR3pFyYcresYHWBO4Fjae8AQgGLKe1DmhS6AI
 +46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cNM8ASotWi/xtT8jkJHNLgsh/wqMq73HSQXzIgOyulI=;
 b=MZxNX+ePHNwLb/RHKirAuDTWKvBnC6AacXYThHLhjGOtVXURIShloBhY2REZGQPGkX
 uKFobK0k2kntiUxd+g8l5XRf67uLIPcTRoqfnEJ25qM0vbPojP+mPFve4sS1XYYnZjXI
 R6gs4Rb/pGiVqkuxiuTMooHX/Zmnum5nlimyCCVv1wJmKRv0wbG2UU8j+jxMjJBlhPB6
 LZLYp4GRobS8p5mMVhX3MeOYYCiBU9XlW3iFBThwtddhbG/JrE1ln7SDH9sm7XUL7bVi
 JVIXwBzPPmIXhqdcsiEifPu4SOpjNbyI1aEFzoSZB2ZKI6NRMZydX6NMvbBZ7IBNAOed
 x07A==
X-Gm-Message-State: AOAM530EWlnemusITmU7HCDTE2JcXpTVwM2FjNfX5fQGD9B8j5oR8EhH
 bYQQTY4PlN/2d7ubfUUD6RCIyEb2
X-Google-Smtp-Source: ABdhPJxYwfigvgxnDmKEBpNciIt4+e+mARFN7D4cEMGBtBZSg5rpuAjl+Xv/uP8mOrDaGQwv609ixQ==
X-Received: by 2002:a0c:f548:: with SMTP id p8mr5920076qvm.149.1594751104079; 
 Tue, 14 Jul 2020 11:25:04 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id d53sm26046456qtc.47.2020.07.14.11.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:25:03 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 42/42] drm/amdgpu: enable ih CG for navy_flounder
Date: Tue, 14 Jul 2020 14:23:53 -0400
Message-Id: <20200714182353.2164930-43-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Jiansong Chen <Jiansong.Chen@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jiansong Chen <Jiansong.Chen@amd.com>

Enable ih CG by setting the corresponding flag.

Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index dedc13b74b1a..3b26ddf6e7d7 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -767,7 +767,8 @@ static int nv_common_early_init(void *handle)
 			AMD_CG_SUPPORT_MC_MGCG |
 			AMD_CG_SUPPORT_MC_LS |
 			AMD_CG_SUPPORT_HDP_MGCG |
-			AMD_CG_SUPPORT_HDP_LS;
+			AMD_CG_SUPPORT_HDP_LS |
+			AMD_CG_SUPPORT_IH_CG;
 		adev->pg_flags = AMD_PG_SUPPORT_VCN |
 			AMD_PG_SUPPORT_VCN_DPG |
 			AMD_PG_SUPPORT_JPEG |
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
