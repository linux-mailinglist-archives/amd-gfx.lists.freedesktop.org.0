Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40EA18495B
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2020 15:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313A889F6E;
	Fri, 13 Mar 2020 14:31:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA61D6EBDD
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2020 14:31:04 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z12so1336235wmf.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2020 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kFOE9GinU/AN3ncueKNq6tlXozxe9FXyrIJXlQmbI48=;
 b=f33/lSBNyl72m+wkmiG8JlGgZpWsiumqS8qpD+jlozWMlkyrM2XRCLq6zw9UJTM9YN
 OERQZZSw1xzDnkQyfwej1JtQ+/7CU74seVL8TQ8FdzG3uRi+jipo5RC3YtaSKr+vMqYv
 ovEPrmFtH4XyfGN0jV+mC1ipdLQPdAG5nQ2Gl1Xwf67URFks18eVgBwTZuWSCi5h8mSd
 msFDvCnTgujtoOYtAgJyqXXe8IcFfo1JJlvgKmdtc6L7VU+qb/nq2Sk6oKe9SEgyK+Kr
 m5ie9/klzVXQGbOJEAeYsQMLO6h05WQgktfqdNO+Ga5u7i6MbvPCrBtf2B1ZHdvsuuWB
 gjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFOE9GinU/AN3ncueKNq6tlXozxe9FXyrIJXlQmbI48=;
 b=r/gBiG3tmxk5XSiNxDuvLgF6uMcpvDotI1P/cypTpR8GEyDvfEO8cz11d+FMw19xLq
 9Zl5dXZUVhNUdNd7xCBnt3+4pAJsaOrEVusPiPfCr/8ydvBoN96SiWBfrR5/Boo7sEpj
 j8gLRntijh9bNnGhQoPg84HUTMhHpVloY5RmV6EAe35VdX659dgENRyHjppFR8La4ZTa
 J5MGIEqpcLu0DMbtW1nS4uQ/klCcyQB1tN8QYEuYaCIGg7jvsrrWz2eILiE19Ru/RKTD
 11ibQEHbHrgjp0GZveBd/JaDuT1FpSEaEg8erKa5Bi4C4nQD978S6gMVkFKVQqT5KrBn
 Tp5w==
X-Gm-Message-State: ANhLgQ137uLb806R99ol+SIF8+zu/QlZMqd+aVKPFe+Q0I8BWSs4q3YH
 R8ofVLF42T5eQrzyTD1IW71rzj92FqZzooI0
X-Google-Smtp-Source: ADFU+vsmNQzXdxtpzqAw5MSdq9F6/ZBUQJBIj7Q1uNeiE60S0PmyGUZRZPQO7M1YRwXc9Chf3MP2vA==
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr11710476wmc.49.1584109862438; 
 Fri, 13 Mar 2020 07:31:02 -0700 (PDT)
Received: from brihaspati.fritz.box
 (p200300C58F29A900DB158106D933A960.dip0.t-ipconnect.de.
 [2003:c5:8f29:a900:db15:8106:d933:a960])
 by smtp.gmail.com with ESMTPSA id x17sm41638298wrt.31.2020.03.13.07.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 07:31:01 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/amdgpu: disable gpu_sched load balancer for vcn
 jobs
Date: Fri, 13 Mar 2020 15:34:33 +0100
Message-Id: <20200313143433.114437-3-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200313143433.114437-1-nirmoy.das@amd.com>
References: <20200313143433.114437-1-nirmoy.das@amd.com>
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
Cc: Boyuan.Zhang@amd.com, nirmoy.das@amd.com, alexander.deucher@amd.com,
 James.Zhu@amd.com, Leo.Liu@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VCN HW doesn't support dynamic load balance on multiple instances
for a context. This patch initializes VNC entities with only one
drm_gpu_scheduler picked by drm_sched_pick_best(). Picking a
drm_gpu_scheduler using drm_sched_pick_best() ensures that we
do load balance among multiple contexts but not among multiple
jobs in a context.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 74c795a5e187..6ed36a2c5f73 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -121,12 +121,16 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, const u32 hw_ip, const
 		num_scheds = 1;
 		break;
 	case AMDGPU_HW_IP_VCN_DEC:
-		scheds = adev->vcn.vcn_dec_sched;
-		num_scheds =  adev->vcn.num_vcn_dec_sched;
+		sched = drm_sched_pick_best(adev->vcn.vcn_dec_sched,
+					    adev->vcn.num_vcn_dec_sched);
+		scheds = &sched;
+		num_scheds = 1;
 		break;
 	case AMDGPU_HW_IP_VCN_ENC:
-		scheds = adev->vcn.vcn_enc_sched;
-		num_scheds =  adev->vcn.num_vcn_enc_sched;
+		sched = drm_sched_pick_best(adev->vcn.vcn_enc_sched,
+					    adev->vcn.num_vcn_enc_sched);
+		scheds = &sched;
+		num_scheds = 1;
 		break;
 	case AMDGPU_HW_IP_VCN_JPEG:
 		scheds = adev->jpeg.jpeg_sched;
--
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
