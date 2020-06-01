Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA0F1EAB89
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1206E2DC;
	Mon,  1 Jun 2020 18:21:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2ED6E2DC
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:21:06 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j32so8456444qte.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+vSjHtwUVJmAZos8Z1ABXmKcZOiXHfXsgSIQAEabChs=;
 b=tkhrT8ZvqP7cMEJrGgPb5rMzPIzA50IpoN/TdPTcb3OCBoEcbssO0BOclC5xa/KdXH
 2NCYpdR5vv5NqhfFGer6hFVbAiZ11xYwXC13zUIH4M8/r9x3UWh1HAXsv8U8wFGbMERc
 cyPsV4fiNyTF5MXTx3xO1YZg6IECTSuXQq1wDXPd13pf48nZUdJ+5rtW/qq/vftXEaxu
 pT27QOgrN9MN1AJRHTAfX84kd3LH7pc5u0Eu5EDlpiIFw94l5ruXpj+bvoz7v3rQZI+X
 AimCw0+u3SR1qCaHTmxfLbUkTIF5pljuqf92uz9PQqeYDQyFp2fFQdNP18dFQM04Oa7k
 ie8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+vSjHtwUVJmAZos8Z1ABXmKcZOiXHfXsgSIQAEabChs=;
 b=c0g2+zgXbh+eBRI9ObccsDLxNB/DELGj0oMW9T7nxmF+a3BjFhgEqPykJwlYu61a1w
 Rm2BjbvYYn1hZh2TV2bjmPy4MyrnO5KB1cCC4WBsqQYN8OTZcjF5eU3+lOyxRpOhgr2e
 YqNb6+gJMMNGwxkb7m6UaDiGfnbPnCVgB80+5LnHl51db8c5S7wi7v00kNlFVIxZPwfi
 GRfNB+PHSMLdmMKSF/Lodkzc0TkdK+uM4MvI75q7aHz2SRRajvmM0i1GhZyJaLFImS1v
 96whkaFqH1Ce3eIj1wCIfXAjNXrH4dzaDQMlyRmQC5C/awo+RcPnuZ/8HqtbdDd+qbZi
 9Z6w==
X-Gm-Message-State: AOAM530/aKfxrTxMg2MP9PYixv6P0f1WJVbOzxLAIUhNsyeWAvAFTy7Z
 Qdz68nVxyfwm4YpwaAH+KQwDeIlO
X-Google-Smtp-Source: ABdhPJywMZGVrZy5bkeJO/CYrzlQ4UfuCYWpriaLMPIm58REb5Nez/CzaT6E8EHtES7pzLKbjeyoEg==
X-Received: by 2002:ac8:6643:: with SMTP id j3mr10467889qtp.17.1591035665079; 
 Mon, 01 Jun 2020 11:21:05 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:21:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 091/207] drm/amdgpu/gfx10: add gc golden setting for
 sienna_cichlid
Date: Mon,  1 Jun 2020 14:18:58 -0400
Message-Id: <20200601182054.1267858-2-alexander.deucher@amd.com>
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

Add gc golden setting for sienna_cichlid.

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 69458d5ccb09..750f2ff9ed9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -62,6 +62,10 @@
 
 #define mmCGTT_GS_NGG_CLK_CTRL	0x5087
 #define mmCGTT_GS_NGG_CLK_CTRL_BASE_IDX	1
+#define mmCGTT_SPI_RA0_CLK_CTRL 0x507a
+#define mmCGTT_SPI_RA0_CLK_CTRL_BASE_IDX 1
+#define mmCGTT_SPI_RA1_CLK_CTRL 0x507b
+#define mmCGTT_SPI_RA1_CLK_CTRL_BASE_IDX 1
 
 #define GB_ADDR_CONFIG__NUM_PKRS__SHIFT                                                                       0x8
 #define GB_ADDR_CONFIG__NUM_PKRS_MASK                                                                         0x00000700L
@@ -92,6 +96,8 @@
 #define CP_RB_DOORBELL_RANGE_LOWER__DOORBELL_RANGE_LOWER_Sienna_Cichlid__SHIFT	0x2
 #define CP_RB_DOORBELL_RANGE_UPPER__DOORBELL_RANGE_UPPER_Sienna_Cichlid_MASK	0x00000FFCL
 #define PA_SC_TILE_STEERING_OVERRIDE__NUM_PACKER_PER_SC_Sienna_Cichlid_MASK	0x00300000L
+#define mmGCR_GENERAL_CNTL_Sienna_Cichlid			0x1580
+#define mmGCR_GENERAL_CNTL_Sienna_Cichlid_BASE_IDX	0
 
 MODULE_FIRMWARE("amdgpu/navi10_ce.bin");
 MODULE_FIRMWARE("amdgpu/navi10_pfp.bin");
@@ -3050,6 +3056,47 @@ static const struct soc15_reg_golden golden_settings_gc_rlc_spm_10_1_2_nv12[] =
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGRBM_GFX_INDEX, 0xFFFFFFFF, 0xe0000000)
 };
 
+static const struct soc15_reg_golden golden_settings_gc_10_3[] =
+{
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmCGTT_SPI_PS_CLK_CTRL, 0xff7f0fff, 0x78000100),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmCGTT_SPI_RA0_CLK_CTRL, 0xff7f0fff, 0x30000100),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmCGTT_SPI_RA1_CLK_CTRL, 0xff7f0fff, 0x7e000100),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmCPF_GCR_CNTL, 0x0007ffff, 0x0000c000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmDB_DEBUG3, 0xffffffff, 0x00000200),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmDB_DEBUG4, 0xffffffff, 0x00800000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmDB_EXCEPTION_CONTROL, 0x7fff0f1f, 0x00b80000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGCR_GENERAL_CNTL_Sienna_Cichlid, 0x1ff1ffff, 0x00000500),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGL2A_ADDR_MATCH_MASK, 0xffffffff, 0xffffffcf),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGL2C_ADDR_MATCH_MASK, 0xffffffff, 0xffffffcf),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGL2C_CTRL3, 0xf7ffffff, 0x10f80988),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmPA_CL_ENHANCE, 0xf17fffff, 0x01200007),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSPI_CONFIG_CNTL_1, 0xffffffff, 0x00070104),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_CONFIG, 0xe07df47f, 0x00180070),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER0_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER1_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER10_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER11_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER12_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER13_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER14_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER15_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER2_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER3_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER4_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER5_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER6_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER7_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER8_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_PERFCOUNTER9_SELECT, 0xf0f001ff, 0x00000000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmTA_CNTL_AUX, 0xfff7ffff, 0x01030000),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmUTCL1_CTRL, 0xffbfffff, 0x00000000)
+};
+
+static const struct soc15_reg_golden golden_settings_gc_10_3_sienna_cichlid[] =
+{
+	/* Pending on emulation bring up */
+};
+
 #define DEFAULT_SH_MEM_CONFIG \
 	((SH_MEM_ADDRESS_MODE_64 << SH_MEM_CONFIG__ADDRESS_MODE__SHIFT) | \
 	 (SH_MEM_ALIGNMENT_MODE_UNALIGNED << SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT) | \
@@ -3230,6 +3277,14 @@ static void gfx_v10_0_init_golden_registers(struct amdgpu_device *adev)
 						golden_settings_gc_rlc_spm_10_1_2_nv12,
 						(const u32)ARRAY_SIZE(golden_settings_gc_rlc_spm_10_1_2_nv12));
 		break;
+	case CHIP_SIENNA_CICHLID:
+		soc15_program_register_sequence(adev,
+						golden_settings_gc_10_3,
+						(const u32)ARRAY_SIZE(golden_settings_gc_10_3));
+		soc15_program_register_sequence(adev,
+						golden_settings_gc_10_3_sienna_cichlid,
+						(const u32)ARRAY_SIZE(golden_settings_gc_10_3_sienna_cichlid));
+		break;
 	default:
 		break;
 	}
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
