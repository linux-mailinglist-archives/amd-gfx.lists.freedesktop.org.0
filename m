Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A23421EA9A7
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB876E2A9;
	Mon,  1 Jun 2020 18:04:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A366E2A0
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:04:10 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id c14so8917598qka.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DLOGkylRwc4BrJZBPQ+qOyjmosZECaEs+D6SW5yg9BU=;
 b=rZffitjL3ms0irgjFLdGhloCGV5q2ItmYVW6uFxWvH/FZKGg2mtNNDfwJDpjUNiKzn
 7Tue9B/3lH/b45C45KbIXSYhnK/hdA3k6ufFDVd0cRNeL5WuSzX+rU1viu0JOtpMRjWB
 uQfcUU9fTJ2FWSCVEf74QRpx0jPFsAE0g6qocE1LNAFDaypl3uY63E3JoRXp2ymhDGvx
 GBGMSrTK8mjzdQvAYQZ4i5qoA1fOAnxQRX5dPyGumtoIImxOZ1C7Ni4Bw8+V5iKz/L/8
 LODwqUybGaDYnm8Cwl6SysDTLHOUA7t9V7qGAu5WONfY8Y2ZNU6mXmzcL/y1JKOlZ8rW
 eY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DLOGkylRwc4BrJZBPQ+qOyjmosZECaEs+D6SW5yg9BU=;
 b=WHmCV/pAXMTE7sSONvU+9D2mCCmdC5MKlBCEOidJp267oN2qKKXTKNXjweOQG10A5Z
 BCzNAOCUTuEllVALh3UIYlraACxoWmNLr9xEjnaI0FloNmcWBJK3nRn6PeHM1tfBOUEp
 HcWCT2PlpLdcJqFNM0cCjkKXE0M+xXzwTwrfgwMpJegDSNXvuxRFyJaxlLXyUyct4DfY
 Q+SdGP+1GtfWD7sh1NfWr93KLk5SnFyEaXFZhGFgSB4B/m6D0W/dwHz7t8A4b0VxDk0L
 6PU0SXtXWHRunjCPu0TNZKmEU9wEdI2QDWss9VFYZiHuMAga1TiakTjlMXZkrWOtLgbW
 Rffg==
X-Gm-Message-State: AOAM530RgSVZaYK8lADxaLgYm/ji1pwILSPyZFOSSUKXNWt0wuXkw7Jw
 16p/YO4v9Lc+DUXsnWWyBJFg8vdi
X-Google-Smtp-Source: ABdhPJwn3zGkyIE79Y2Z9RBqwWIsHIyotjTyGgy2Bqqng2ZCUS7RwdD1IbAH0MCBOZ7P0PqFegly4Q==
X-Received: by 2002:a37:4f55:: with SMTP id d82mr20393368qkb.219.1591034649689; 
 Mon, 01 Jun 2020 11:04:09 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id h16sm42164qtp.1.2020.06.01.11.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:04:09 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 058/207] drm/amdgpu/mes: update some mes definitions
Date: Mon,  1 Jun 2020 14:00:10 -0400
Message-Id: <20200601180239.1267430-55-alexander.deucher@amd.com>
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

Update some mes definitions.

Signed-off-by: Jack Xiao <Jack.Xiao@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h | 42 +++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
index 78fe49033543..4da9d8f50578 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
@@ -24,10 +24,32 @@
 #ifndef __AMDGPU_MES_H__
 #define __AMDGPU_MES_H__
 
+#define AMDGPU_MES_MAX_COMPUTE_PIPES        8
+#define AMDGPU_MES_MAX_GFX_PIPES            2
+#define AMDGPU_MES_MAX_SDMA_PIPES           2
+
+enum amdgpu_mes_priority_level {
+	AMDGPU_MES_PRIORITY_LEVEL_LOW       = 0,
+	AMDGPU_MES_PRIORITY_LEVEL_NORMAL    = 1,
+	AMDGPU_MES_PRIORITY_LEVEL_MEDIUM    = 2,
+	AMDGPU_MES_PRIORITY_LEVEL_HIGH      = 3,
+	AMDGPU_MES_PRIORITY_LEVEL_REALTIME  = 4,
+	AMDGPU_MES_PRIORITY_NUM_LEVELS
+};
+
 struct amdgpu_mes_funcs;
 
 struct amdgpu_mes {
-	struct amdgpu_adev *adev;
+	struct amdgpu_device            *adev;
+
+	uint32_t                        total_max_queue;
+	uint32_t                        doorbell_id_offset;
+	uint32_t                        max_doorbell_slices;
+
+	uint64_t                        default_process_quantum;
+	uint64_t                        default_gang_quantum;
+
+	struct amdgpu_ring              ring;
 
 	const struct firmware           *fw;
 
@@ -45,8 +67,24 @@ struct amdgpu_mes {
 	uint32_t                        data_fw_version;
 	uint64_t                        data_start_addr;
 
+	/* eop gpu obj */
+	struct amdgpu_bo		*eop_gpu_obj;
+	uint64_t                        eop_gpu_addr;
+
+	void                            *mqd_backup;
+
+	uint32_t                        vmid_mask_gfxhub;
+	uint32_t                        vmid_mask_mmhub;
+	uint32_t                        compute_hqd_mask[AMDGPU_MES_MAX_COMPUTE_PIPES];
+	uint32_t                        gfx_hqd_mask[AMDGPU_MES_MAX_GFX_PIPES];
+	uint32_t                        sdma_hqd_mask[AMDGPU_MES_MAX_SDMA_PIPES];
+	uint32_t                        agreegated_doorbells[AMDGPU_MES_PRIORITY_NUM_LEVELS];
+	uint32_t                        sch_ctx_offs;
+	uint64_t			sch_ctx_gpu_addr;
+	uint64_t			*sch_ctx_ptr;
+
 	/* ip specific functions */
-	struct amdgpu_mes_funcs *funcs;
+	const struct amdgpu_mes_funcs   *funcs;
 };
 
 struct mes_add_queue_input {
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
