Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EF31EABDA
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7970898E4;
	Mon,  1 Jun 2020 18:22:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C730F6E379
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:22:50 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id y1so8456175qtv.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7eKKPcPVLGe8zDix5H8qxchTFgnAnzLMQqbtHU+hBx4=;
 b=sl+QwF6DZTU6DeJYkgZm5fSuKtMx0Jzrf15zualal14ZTnKOP3kTiF8udD2ihhU020
 NJ0ElK3ZXDAhop74YK1TzYctmy2rnTHvk7QP1PBF5tfz1cirh85cOKINMlM+fSnxiqUP
 2KLpd/XIurlqwupVtkgPls0labaiIzOxDud3NbWPdM88GtfYcHI/lciMooPUrh42qBrL
 mackaZE0dVdinKjIouhcZuFu5U3+rvAYXGUA55cq/bvL9RIP/GhqE7RyPv9X3+j58lyC
 wsnqZ6mHklO4KMLSmMQawLa8NnZXu9y/oC379j2BWwyHZlmebi+FjmhKtRWO3fcvEyVq
 CUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7eKKPcPVLGe8zDix5H8qxchTFgnAnzLMQqbtHU+hBx4=;
 b=MB+/8hm1YPGiqUZU4GacW9xjne33WMyDedA68nw75bFYsjtb3gFebnr411hmsieZDZ
 YPNV+VcL462kWg4h9MqsGlu25fx9VCyh0w4Pf54ZIs3dreDthA0To+S7JLSbyykCKAyl
 Fbvyww+oy2GCdMlWACz3F5oAntURSQiG4LiHfAPJuW2tbf+RCZn1Q1ukSRO5MX8aK38i
 ejwxjL0UkXjnWgmFoKBeADaNnfiRW41AQEDx1c53K946mgngHhyyB6GQP9FPRvdhEsZS
 fzv0W0B995tXrOry7cwlNg8bZwlRCecP1JdHGgpWJO8M2oNmGQTyx98S6AzcxY2aSNfr
 8OgA==
X-Gm-Message-State: AOAM530CzxZs7OBXK/eQbbSVIF0HMpInSkW21gWxbIQjVzAEgp5lmrEq
 YYi94RlcoA+EFNIt8v+w9MbP04Nx
X-Google-Smtp-Source: ABdhPJyL2rl38P4IfVmUsQjao2WWtWi6XuE0mMvoH8c7EDSgNkzndrYWJy9NKoKcmnJa+bLCSR06kg==
X-Received: by 2002:aed:35af:: with SMTP id c44mr23532228qte.349.1591035769716; 
 Mon, 01 Jun 2020 11:22:49 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:22:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 169/207] drm/amdgpu/psp: initialization PSP SPL fw
Date: Mon,  1 Jun 2020 14:20:16 -0400
Message-Id: <20200601182054.1267858-80-alexander.deucher@amd.com>
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Likun Gao <Likun.Gao@amd.com>

Support for psp firmware header version v1_3 initialization and
information print.

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c   | 13 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 24 +++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 2fd40d0d7a0e..cd52b6e05793 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2108,6 +2108,7 @@ int psp_init_sos_microcode(struct psp_context *psp,
 	const struct psp_firmware_header_v1_0 *sos_hdr;
 	const struct psp_firmware_header_v1_1 *sos_hdr_v1_1;
 	const struct psp_firmware_header_v1_2 *sos_hdr_v1_2;
+	const struct psp_firmware_header_v1_3 *sos_hdr_v1_3;
 	int err = 0;
 
 	if (!chip_name) {
@@ -2152,6 +2153,18 @@ int psp_init_sos_microcode(struct psp_context *psp,
 			adev->psp.kdb_start_addr = (uint8_t *)adev->psp.sys_start_addr +
 						    le32_to_cpu(sos_hdr_v1_2->kdb_offset_bytes);
 		}
+		if (sos_hdr->header.header_version_minor == 3) {
+			sos_hdr_v1_3 = (const struct psp_firmware_header_v1_3 *)adev->psp.sos_fw->data;
+			adev->psp.toc_bin_size = le32_to_cpu(sos_hdr_v1_3->v1_1.toc_size_bytes);
+			adev->psp.toc_start_addr = (uint8_t *)adev->psp.sys_start_addr +
+				le32_to_cpu(sos_hdr_v1_3->v1_1.toc_offset_bytes);
+			adev->psp.kdb_bin_size = le32_to_cpu(sos_hdr_v1_3->v1_1.kdb_size_bytes);
+			adev->psp.kdb_start_addr = (uint8_t *)adev->psp.sys_start_addr +
+				le32_to_cpu(sos_hdr_v1_3->v1_1.kdb_offset_bytes);
+			adev->psp.spl_bin_size = le32_to_cpu(sos_hdr_v1_3->spl_size_bytes);
+			adev->psp.spl_start_addr = (uint8_t *)adev->psp.sys_start_addr +
+				le32_to_cpu(sos_hdr_v1_3->spl_offset_bytes);
+		}
 		break;
 	default:
 		dev_err(adev->dev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index cf3438696fce..744404a05fee 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -279,6 +279,30 @@ void amdgpu_ucode_print_psp_hdr(const struct common_firmware_header *hdr)
 			DRM_DEBUG("kdb_size_bytes: %u\n",
 				  le32_to_cpu(psp_hdr_v1_2->kdb_size_bytes));
 		}
+		if (version_minor == 3) {
+			const struct psp_firmware_header_v1_1 *psp_hdr_v1_1 =
+				container_of(psp_hdr, struct psp_firmware_header_v1_1, v1_0);
+			const struct psp_firmware_header_v1_3 *psp_hdr_v1_3 =
+				container_of(psp_hdr_v1_1, struct psp_firmware_header_v1_3, v1_1);
+			DRM_DEBUG("toc_header_version: %u\n",
+				  le32_to_cpu(psp_hdr_v1_3->v1_1.toc_header_version));
+			DRM_DEBUG("toc_offset_bytes: %u\n",
+				  le32_to_cpu(psp_hdr_v1_3->v1_1.toc_offset_bytes));
+			DRM_DEBUG("toc_size_bytes: %u\n",
+				  le32_to_cpu(psp_hdr_v1_3->v1_1.toc_size_bytes));
+			DRM_DEBUG("kdb_header_version: %u\n",
+				  le32_to_cpu(psp_hdr_v1_3->v1_1.kdb_header_version));
+			DRM_DEBUG("kdb_offset_bytes: %u\n",
+				  le32_to_cpu(psp_hdr_v1_3->v1_1.kdb_offset_bytes));
+			DRM_DEBUG("kdb_size_bytes: %u\n",
+				  le32_to_cpu(psp_hdr_v1_3->v1_1.kdb_size_bytes));
+			DRM_DEBUG("spl_header_version: %u\n",
+				  le32_to_cpu(psp_hdr_v1_3->spl_header_version));
+			DRM_DEBUG("spl_offset_bytes: %u\n",
+				  le32_to_cpu(psp_hdr_v1_3->spl_offset_bytes));
+			DRM_DEBUG("spl_size_bytes: %u\n",
+				  le32_to_cpu(psp_hdr_v1_3->spl_size_bytes));
+		}
 	} else {
 		DRM_ERROR("Unknown PSP ucode version: %u.%u\n",
 			  version_major, version_minor);
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
