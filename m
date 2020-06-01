Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C501EA9A9
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3F76E2AF;
	Mon,  1 Jun 2020 18:04:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A0E6E2AF
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:04:12 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id k22so8419632qtm.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0FailpFV/XpEN7yAfIuPAgrJ9KkkDjXTSG7HhxA3ffw=;
 b=SXzmcvuLaugpzBpanvF2dTsyHovhUEhvrJgFokULJEnvKq2/O4dBc0qP0YxSEXXoNI
 GHhDQB9TR6m6zhtwzxDPhWSBFGrSU4CiXNHmDs9CBALQlcKPQmSsW12RWv9FJBDWC+z4
 /TTbws+mOcPwnU8NPfkUEmy3EMUotC7sUFBpXGZ8+69LCSMvH1KAWfsKI0SRR9EU4JGZ
 QUqfzvVsitqmTenTBiCUnsKHCoOh2jY7MZKnBj+CwRC0z9xBo8rhx7GLAhonIKbcP3yd
 3mGbNK4K6SdxtosNxyXJgr3kMt+4361/to1B6sZqDysqstTuuYq4p4pX66J+A2FnUnn0
 mu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0FailpFV/XpEN7yAfIuPAgrJ9KkkDjXTSG7HhxA3ffw=;
 b=JxZfM4jYIIv1y35rxJTzRDbZkqCTktld3e8GqYMaFhEJjIbrx++jzqMNPyVirflFV1
 XrK54iOT9ccYwRNgzbDg28KJfb9USJS8MdAA8/MSHiOdX5LLVycIxun2q5VG8VcGungb
 6J2p1yCl7wrekx6vHqXIbjuDtXezwuuM2YsAc/qTYASaDUzHYB7wGNaVs5HLlGGD1TxZ
 FmuN9UszjG04G+nZoqIMZMcY1Klv8Ivf4C+CXz1iqRvVL6lPTPTeRvsyZknyhbRaQl53
 OCcAuvOpAxmfrnP+Aw6H5xt3JwwcRtBLtNkeiVGEPzfys+hW/DTF08YWYBb6eUNjOwdb
 pRTw==
X-Gm-Message-State: AOAM531XB+i7d1/ieEaRrs56lHqp8WaYkHmmjQ4i7L5W1p/cxzSUbBeC
 b+XrrQuUUgAo8RnsEy0duc9AkpYd
X-Google-Smtp-Source: ABdhPJwL0GJLaa1DgHRdMA/KlV9ORVTVFp56cKvfC8qTJGZeGcd4BqMekGi5Bwji3Q5hYxX5az40Tw==
X-Received: by 2002:ac8:4d0e:: with SMTP id w14mr20707542qtv.266.1591034651988; 
 Mon, 01 Jun 2020 11:04:11 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id h16sm42164qtp.1.2020.06.01.11.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:04:11 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 060/207] drm/amdgpu/mes10.1: initialize the software part of
 mes ring
Date: Mon,  1 Jun 2020 14:00:12 -0400
Message-Id: <20200601180239.1267430-57-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601180239.1267430-1-alexander.deucher@amd.com>
References: <20200601180239.1267430-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jack Xiao <Jack.Xiao@amd.com>

Do the software initialization on the mes ring.

Signed-off-by: Jack Xiao <Jack.Xiao@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
index 7970107be532..4f7e345673ca 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
@@ -308,11 +308,37 @@ static int mes_v10_1_allocate_eop_buf(struct amdgpu_device *adev)
 	return 0;
 }
 
+static int mes_v10_1_ring_init(struct amdgpu_device *adev)
+{
+	struct amdgpu_ring *ring;
+	int r;
+
+	ring = &adev->mes.ring;
+
+	ring->me = 3;
+	ring->pipe = 0;
+	ring->queue = 0;
+
+	ring->ring_obj = NULL;
+	ring->use_doorbell = true;
+	ring->doorbell_index = adev->doorbell_index.mes_ring << 1;
+	ring->eop_gpu_addr = adev->mes.eop_gpu_addr;
+	sprintf(ring->name, "mes_%d.%d.%d", ring->me, ring->pipe, ring->queue);
+
+	r = amdgpu_ring_init(adev, ring, 1024, NULL, 0, AMDGPU_RING_PRIO_DEFAULT);
+	if (r)
+		return r;
+
+	return 0;
+}
+
 static int mes_v10_1_sw_init(void *handle)
 {
 	int r;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
+	adev->mes.adev = adev;
+
 	r = mes_v10_1_init_microcode(adev);
 	if (r)
 		return r;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
