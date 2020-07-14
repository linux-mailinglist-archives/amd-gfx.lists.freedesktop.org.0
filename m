Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0256621F933
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 20:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F1D6E82F;
	Tue, 14 Jul 2020 18:24:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608326E82C
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 18:24:20 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id e13so16532599qkg.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 11:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gSfH/+zWwJqeeAp/9m4MbsvFvmHbUNhJd2hFx3ik6Ss=;
 b=Zsr94m0JinAOR6i4pVPtDWtS2WVjWPJP/nTy7DSPZ6T+yUDaaDDZ0rJYGnBSv0ffl8
 5LgdrlU6EwKP1BVf/3miZ+0M7FJ1E8hVVhK4mg/uk+ZFOKDeEmmEgkjbUSbibPN9t7Mi
 Ve0cYUorpkX5XYqGjrCLBoLYMy7PJU6YmPKFsDsWbOJnxdvxExF4/9weRoO6SmrkFI28
 jxhD8R280rNdZgirVSkWQHV+40rR/F1ujqMP2jQf6exUvy6b7yRlBcEB6tLPwt2YaYXc
 66Fd/RkqgGkvk5UZlR453trisX0qX2AHEDz/LbYhpP6RiYuW67GYhYnilG7qd2A97y22
 xO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gSfH/+zWwJqeeAp/9m4MbsvFvmHbUNhJd2hFx3ik6Ss=;
 b=W9DPgt7Dm0N5fxCyhkpvnIj5CZMh/GgjqzFXpiSpx+arUiLEgN3DONRS1wResZpjmg
 3wK3bbRUalZ6TIpDL8UObmd9O22+3pJPOoJBgzSQ55Y+9vbDtKvDmAL5R0anaUkFBqsp
 MnKEZez2CvBEzUf1Ha7mpHQ0CUE0yocZ7z9zM6fcXpepshCqpMG8XhaQlh4tncpg6FId
 wrnG4G2PqrdsMeYUZFLUWLEVLzTm/+QQUUBISKKnljTAy7uOb30Y6rCqCMp4fZ4FJTt/
 DTGRLKsc4/ehVNXqfeTZWlvPYaM6J2qyXEh+HqX0+ICKeUkvgPn7zGDh+SJ9wqu1Xgsq
 jh9A==
X-Gm-Message-State: AOAM531/k1okIp5yOW9YbEJ3JcSbwRDbChQXlM6Unont84tQObhDgY8K
 ZmS8QuCEEVyTyAaa0HY7IbNu1wEn
X-Google-Smtp-Source: ABdhPJzPPf4dgllQt7qBtWjTsBUKk/JexB9QJ1Hat/2AqAyjyPoQDHwPvcknEa99AyuonaK/S6M8fg==
X-Received: by 2002:a37:45cb:: with SMTP id s194mr5981913qka.74.1594751059315; 
 Tue, 14 Jul 2020 11:24:19 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id d53sm26046456qtc.47.2020.07.14.11.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:24:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/42] drm/amdgpu/gfx10: add clockgating support for
 navy_flounder
Date: Tue, 14 Jul 2020 14:23:19 -0400
Message-Id: <20200714182353.2164930-9-alexander.deucher@amd.com>
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

Same as navi10.

Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 60b8da3e7321..401e9607becc 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -7476,6 +7476,7 @@ static int gfx_v10_0_set_clockgating_state(void *handle,
 	case CHIP_NAVI14:
 	case CHIP_NAVI12:
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 		gfx_v10_0_update_gfx_clock_gating(adev,
 						 state == AMD_CG_STATE_GATE);
 		break;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
