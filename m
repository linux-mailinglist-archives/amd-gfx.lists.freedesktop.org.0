Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC5E21F956
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 20:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31A96E871;
	Tue, 14 Jul 2020 18:25:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B8B6E867
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 18:25:03 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id b185so16551446qkg.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IFl3vOiFn5NKmwo+r0PCKGeFw7DQZO5BNmrJnNX9ELk=;
 b=XPSbxPIfTVsTkxXmGe5Y/+dmzGwge4QGF33v9V7Zuo/oMQTb5Ir/FPKTrDqVEF8P76
 +uHHrXXfiFceVsktJvgjuuX92vgMdYFr1GbeU4/qo+vgMu+/kMuCyF04yJaVVd3HBd0c
 jl3dLuMlfeNtIkF5qPDn64ynUQEQoDkOi3HyaWM7pHwJlAuKR5bVIznz8ufExIVJwd4a
 WQQ8/lS6+Cq8oy2+e6RYqwGgrhynKO6P+lESvXafTeWxy/8E0yXnaMMmb3ASKctouEh+
 shCd4DtYI5PwYLgCvAxJQF9amJbLKdO/zRFDbnjBiDTYbuY8ijC+WR5CtNspeiQwGydW
 SwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IFl3vOiFn5NKmwo+r0PCKGeFw7DQZO5BNmrJnNX9ELk=;
 b=h06SM46+dGmb9SwwPDeXy40lQHRegyPcJ28PF8cmGvX67dPO5JFxVsM+7neyWX/AL/
 gzV95xmOrX6WdjMPAOq1RE/tUofjqdk9fJlDkGFU41PZfDd3qMKBqkl2sszbCJLxH7jT
 RWq71BFK883PCpwRgsbgmq1o0P2NK4btiOVkwFNmYl77TNwJujiF8v9NCMMxcFbifFL6
 IDamH0zuz9PK9pqdbQ+N/oXe0T9dVN+LcTCk1ss3re8hjJrdtmWXrJP4lNZLTjXxpI0G
 IQJljT46Ps1Gzz9lm30pFkOJns8lE5YgQI1Lwb37XUNxlQGtS75OlD3kU/agU+Kx1IE1
 leog==
X-Gm-Message-State: AOAM530Fb/ZT5YsvyR0vBaKubj5yFMTzUVCkvPvePgltUBrhK55skrE2
 dQIXiOCvJhWi5uKjhuz3p6RyqoEV
X-Google-Smtp-Source: ABdhPJx5jv+AmMEW3Zb+UgqJCPsHfeZuddkawnrSV/vJiEFLBYQ+6EdLqQr2A8AD7kZfH7zQQn+1FA==
X-Received: by 2002:a05:620a:1235:: with SMTP id
 v21mr6079476qkj.454.1594751102779; 
 Tue, 14 Jul 2020 11:25:02 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id d53sm26046456qtc.47.2020.07.14.11.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:25:02 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 41/42] drm/amdgpu: enable hdp CG and LS for navy_flounder
Date: Tue, 14 Jul 2020 14:23:52 -0400
Message-Id: <20200714182353.2164930-42-alexander.deucher@amd.com>
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

Enable hdp CG and LS by setting the corresponding flags.

Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index add0698df3fe..dedc13b74b1a 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -765,7 +765,9 @@ static int nv_common_early_init(void *handle)
 			AMD_CG_SUPPORT_VCN_MGCG |
 			AMD_CG_SUPPORT_JPEG_MGCG |
 			AMD_CG_SUPPORT_MC_MGCG |
-			AMD_CG_SUPPORT_MC_LS;
+			AMD_CG_SUPPORT_MC_LS |
+			AMD_CG_SUPPORT_HDP_MGCG |
+			AMD_CG_SUPPORT_HDP_LS;
 		adev->pg_flags = AMD_PG_SUPPORT_VCN |
 			AMD_PG_SUPPORT_VCN_DPG |
 			AMD_PG_SUPPORT_JPEG |
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
