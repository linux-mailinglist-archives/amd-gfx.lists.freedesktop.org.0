Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3151FE07A
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2020 03:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A9F6EA51;
	Thu, 18 Jun 2020 01:48:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAACD6EA50
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jun 2020 01:48:53 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id w1so4113697qkw.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2020 18:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T0LhxdW6DxW0kY99DwlFbozXtOoom3CrsaTV2kY2Ub4=;
 b=JMc/ijMFZb6bdhVoAQ22fE19WnggXNE4nt1pqfNVYB8OS7EO2rFhIZ9C0dWnPZoErs
 ssjDTGxI9+o3OcCwhRPM/Fg9taq2r1S11rUI5F1Rj1V23jtadc3FG83GdAoKr/FkTv+9
 pijAe8YjdwrOjHQmMD6bfNaiWRYojN8i8QMcfrDmHHeBqGoH5584hgPRVN4Y0boTm56/
 BsT3kuSK/paVXJ+YJ1LAKAEXm2+fTwSRrWZgzrkiyFOfM4L9zpP/uRIQRXrz5siztX5i
 eAgmuOo+PEb4EYdOo1MgvFC/Ics+16FU7byyxMoR6K3YSGao+RWmR8wb79WSQBnamICX
 5dfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T0LhxdW6DxW0kY99DwlFbozXtOoom3CrsaTV2kY2Ub4=;
 b=lkEwNrywrb2yxuYqVNVgweppNPJ6jj5gAoMT6VbcHhQylbPxxpC9NDunzWsInOQ86X
 BzY4xMGL6LelL81WRgX8AWQnpWNiDzS6laorOKlLWq7/xnVTdJ/0bMTKfkfmAtAYTJsB
 7EQiEtNbjA/0OGymMciBn1/P7kesaDH8UQCjsNpgGIgmOwDnHHqGQBHR7tZzINnz+Ito
 td9nx5iooYsgxk0PsQ9E5dm58L85rk45ujUl/MY9F73sQcO3pSpPTqgetAIANyxshoL2
 EBi+uwExUw2N+5t/8Z9bLhSCXx1J4ZREQqWjq+KNSLkTDyyR2Iza5U7kuZ348sGF2zcL
 JOXA==
X-Gm-Message-State: AOAM533+VGNLf6bfUhuNy5oH/Squlqzc7GAfFcL85H0cDgR8cXsV5pn1
 HC63q7a3NPLfGLpypgBsDAvLTLf5
X-Google-Smtp-Source: ABdhPJyooldz9bkjBSUZqEblLSg2vJyiKy1MEuLkcVLS6qQW2qeHhX8t0UVRpjoCdCHqnQReunrlTw==
X-Received: by 2002:a05:620a:995:: with SMTP id
 x21mr1578411qkx.418.1592444932952; 
 Wed, 17 Jun 2020 18:48:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.51.205])
 by smtp.gmail.com with ESMTPSA id c4sm1684705qko.118.2020.06.17.18.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 18:48:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu/display: properly guard the calls to swSMU
 functions
Date: Wed, 17 Jun 2020 21:48:35 -0400
Message-Id: <20200618014835.3775523-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200618014835.3775523-1-alexander.deucher@amd.com>
References: <20200618014835.3775523-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

It's only applicable on newer asics.  We could end up here when
using DC on older asics like SI or KV.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1170
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
index 7cee8070cb11..5c6a6ae48d39 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
@@ -106,7 +106,7 @@ bool dm_pp_apply_display_requirements(
 			adev->powerplay.pp_funcs->display_configuration_change(
 				adev->powerplay.pp_handle,
 				&adev->pm.pm_display_cfg);
-		else
+		else if (adev->smu.ppt_funcs)
 			smu_display_configuration_change(smu,
 							 &adev->pm.pm_display_cfg);
 
@@ -592,7 +592,7 @@ void pp_rv_set_wm_ranges(struct pp_smu *pp,
 	if (pp_funcs && pp_funcs->set_watermarks_for_clocks_ranges)
 		pp_funcs->set_watermarks_for_clocks_ranges(pp_handle,
 							   &wm_with_clock_ranges);
-	else
+	else if (adev->smu.ppt_funcs)
 		smu_set_watermarks_for_clock_ranges(&adev->smu,
 				&wm_with_clock_ranges);
 }
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
