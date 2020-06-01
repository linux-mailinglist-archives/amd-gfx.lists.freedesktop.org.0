Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BE71EABAA
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1662B6E31A;
	Mon,  1 Jun 2020 18:21:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C476E328
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:21:49 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s1so9988310qkf.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tA6qKoU+00bHqEZDt9YU8Qz9XbrfhbhCgwV88fuXgeY=;
 b=UMAOf7YYSfwbX2svQ6zoB6XQQia3TVeomsH2alr3tsZZMlu9ye3v/2tG3yKTH1fa/W
 W+W09b86MhDXfeLFFkbMpmgUuGL32mxHF2DkyPid8SlUzWsougkX/iM5P/Ocpmcq+6Zm
 GsKsUuOq6pGC87y1AyRn0KsCFzRezpL3PCu9IqG8EZpr469yvzeob+GksXxYpf5T+LYT
 nZj3ZHFQkpetOr7Pf4qmgkb6vuP7Ud0rbsNZczrhJlhacf0iIJtVnTJwmbzUHDMwvrnc
 E6ZxK5JxKhYxmix/bNgcE1ZV9QK8KOY2j6F2I2dmqcpnJlcPWLigKj8yK0NKYV9/HZnx
 NFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tA6qKoU+00bHqEZDt9YU8Qz9XbrfhbhCgwV88fuXgeY=;
 b=nJpBndcp9RVJ3opVanN8AXNd9yx7DcabTt2qAEEoUHBFMu1u8fPMuR94BmCZ0ASIH9
 CkwI/l+VypcPxPRvBFxmQfYCmPy1oLQDHeONMk0w9ZWtw9k4JSpdSZ/WM0kF+ALbWIVc
 iHSxQfK+hVvUjDSyASTdIqJBRqlSez5Hj2br5UgWh5lOnRV0zmZDGW5mjryaHpWP03EM
 +ORkXRkGlwb8RDGhhrwryM/pfBQewy9a8KDVhZklkhxmj98PNyLonme+bTY03uKi9qAd
 BKgkSKXqgaYMaYseMj5BMD0TIku1+ovjNNoJUaoqE6wVp8GrHF0Ij46hzdx6N2lBmLUs
 LYLQ==
X-Gm-Message-State: AOAM530ZIkhTwf7W+NHX18XaKlBqKG9SIgdNDUg/zoSOogETzTZt062K
 O1ahgSqzx8m2paXIqpOi62aS3Zm2
X-Google-Smtp-Source: ABdhPJyGAtiMHP9gPmiLbWK37MyFF9tpDY0UADisdDMvWXODxJ+37f5BzTzuASn24gq6cga1F2XBdQ==
X-Received: by 2002:a37:8807:: with SMTP id k7mr20937565qkd.226.1591035708762; 
 Mon, 01 Jun 2020 11:21:48 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:21:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 123/207] drm/amdgpu: fix typo for vcn3/jpeg3 idle check
Date: Mon,  1 Jun 2020 14:19:30 -0400
Message-Id: <20200601182054.1267858-34-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601182054.1267858-1-alexander.deucher@amd.com>
References: <20200601182054.1267858-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: James Zhu <James.Zhu@amd.com>

fix typo for vcn3/jpeg3 idle check

Signed-off-by: James Zhu <James.Zhu@amd.com>
Reviewed-by: Leo Liu <leo.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
index 2fc778cad91a..9dbc616b38cb 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
@@ -479,7 +479,7 @@ static int jpeg_v3_0_set_clockgating_state(void *handle,
 	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
 
 	if (enable) {
-		if (jpeg_v3_0_is_idle(handle))
+		if (!jpeg_v3_0_is_idle(handle))
 			return -EBUSY;
 		jpeg_v3_0_enable_clock_gating(adev);
 	} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 517484292303..340cb344a35d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -1174,7 +1174,7 @@ static int vcn_v3_0_set_clockgating_state(void *handle,
 			continue;
 
 		if (enable) {
-			if (RREG32_SOC15(VCN, i, mmUVD_STATUS) == UVD_STATUS__IDLE)
+			if (RREG32_SOC15(VCN, i, mmUVD_STATUS) != UVD_STATUS__IDLE)
 				return -EBUSY;
 			vcn_v3_0_enable_clock_gating(adev, i);
 		} else {
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
