Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E724A1EAB9B
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3AC6E30C;
	Mon,  1 Jun 2020 18:21:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF336E312
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:21:28 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id f18so10052816qkh.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2MD4A1BsmN0jUO0TQfqHruKLzIUemgnzMr0UrOZO+P4=;
 b=cIhik/FauyFVPc6lzkmRLeajuVnj+IVoqGNb6Kd5PQCMlY+zJqmxBRC+MTAValzvBl
 LsbrZt+2VtQbXXfSmnmRjK1cGcngAGqKw89hc8m8qJQXU/R/yZiyoYW3joGnPjdpcNA6
 OmX96wLNJSZ/xDmZTg3nTJsJV/KkwmWYhhLIPs4eqFy/RyyXi2gs05BEhOuxH7L1KilJ
 8xDJKJBvNRCdTWoWBPCRQcQ5N3dUMHUOttAbBstf7BIlljP2UCxaY6zEDQ2czlbnsUo7
 dzMqtk55/sOcn7duKi3Cz4Ikrw5Zldx5wEvwbFkSEQN2+mWTVsXuZw8wmmFtMiJKPWK6
 oxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2MD4A1BsmN0jUO0TQfqHruKLzIUemgnzMr0UrOZO+P4=;
 b=AZYq21Ged+m7BNug2ov8dBEzTWjrERAiZW24yIHHa1Tav4kYprKJSfC5QLCvRq0VHX
 aXgmbb3ARPNLNlVoFzsUQkNYxRdkEBBmWaoFM7PCZ+d+5LniwfEbilfoLI37+kaf5xBf
 Fd+B7iDRetcV1frL5EyHJoWKuLAArcfgBrKpwE6fFG5jtD+zh8RxctV8MDmZYt7IxyZJ
 WFq3HghajW/51OFZ5FarW0dbqmJjSG4+5SV+oIyIB6sUK+XimbnNCkXgsaGZoMEdqCeD
 tEivr9sH8sbFFofzC1K9lo4kMfIAjT2MW1W1vakjW0IIFQG0axiQNWyTT7cdxw8kmE1p
 4tFw==
X-Gm-Message-State: AOAM5330yNeJd3YOM8XbQuZ6ndATb8T/WWJWRvew9oQ5U97SRTbzTFeR
 KtJs4qRAwXHwZE5ziyY7tJZ8chCB
X-Google-Smtp-Source: ABdhPJxAsGjNNMVagYXnbpqPZyJlWt9Gp9ndtwKlbbwSlX+N7AlvtifonTCCIuNLN8t5lmyRA6GEFw==
X-Received: by 2002:a37:e06:: with SMTP id 6mr21087806qko.125.1591035687860;
 Mon, 01 Jun 2020 11:21:27 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:21:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 108/207] drm/amd/amdgpu: add HDP mgcg and ls support
Date: Mon,  1 Jun 2020 14:19:15 -0400
Message-Id: <20200601182054.1267858-19-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Kenneth Feng <kenneth.feng@amd.com>

add HDP mgcg and ls support and verified

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
Reviewed-by: Likun Gao <Likun.Gao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 081fde347dd4..f497fbcc6f5c 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -718,7 +718,9 @@ static int nv_common_early_init(void *handle)
 			AMD_CG_SUPPORT_GFX_CGCG |
 			AMD_CG_SUPPORT_GFX_3D_CGCG |
 			AMD_CG_SUPPORT_VCN_MGCG |
-			AMD_CG_SUPPORT_JPEG_MGCG;
+			AMD_CG_SUPPORT_JPEG_MGCG |
+			AMD_CG_SUPPORT_HDP_MGCG |
+			AMD_CG_SUPPORT_HDP_LS;
 		adev->pg_flags = AMD_PG_SUPPORT_VCN |
 			AMD_PG_SUPPORT_JPEG;
 		adev->external_rev_id = adev->rev_id + 0x28;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
