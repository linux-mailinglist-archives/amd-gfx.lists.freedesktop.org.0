Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E87174544BE
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Nov 2021 11:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103816E425;
	Wed, 17 Nov 2021 10:11:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DBB6E425
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Nov 2021 10:11:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3jvFu+HRa/PumZvEAMjdC3m4icvhNXyaL40tuigxjHyepb6WawEXHka/h1bjCWbEhCgrQRHsU5CCKrW9+ufV61DCtKcRJMS/DKGjog6xZN5tV9a2GhQg2KdEjG6DxC9kg/1fL3P3SxVzcal5918R+06q9Tmfs1DSSMwOVWQ02hfKLCkic2wMzedeg0Ifx4b6TXb3h22t7/w752BdtgV7tBxm1TDatRt1ywqRRjG8jOiAsXerHeuJ+KNEoCUb7i4wF22W7WDT0RcQefjCx41ix0TXASAVkzCQb8xodo2lwMwlEYIfZmkrwwa6PvNrCIvrXD/Kr52g9QuELitymA+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoVHBVTPhsypvq8iXfVog7kro81q1xs0jOJurQkBBjA=;
 b=HceIp9lmBGB6Dwmf+zKxwYvjFfS8a5hj/ODHXz1AgZl0LUonsZV6d9jSpgbxPN9BaSsIN+o5fKJLmMlc8GWwS2iI6Kj6w7tTGxhQ+xXW4bTUVlfiPMqtNCzNqAKLRtTUe6JV1gpve1tmFo/sEbR7o/B1ufAfFxxrPCMpPfuZVZOAL10lgH7dqS8nbVidmUthTp6qUhDNn/iBsIsgnQnli7YY4PdjYiW93tdLNpAwgemc0mPXW8AfAc1n3q+Ru3IOLMigcMZFaum/zYOdbzKf91RNjB4MCnI/ewoEN9pLTrRGaJxZM2TOrMSBIkhYoYMhSAAGiekH5X5m+x8KQgsoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoVHBVTPhsypvq8iXfVog7kro81q1xs0jOJurQkBBjA=;
 b=wV0hSbWGZvXRSPA1Jl+1uCXBaDN56NjUABuDgrLrOOkk19+BxfFRL7UbwzkBYgjli/dRAEPDwNKwdLjoDQJyyWZd4whQlLJcxbJ5yjCJ1JnmXupvcDMBBNhTsdFtQNV3P2kwbtPA4kau7WuwaK74ob8QgNaniRVzCOzUMSB5jCg=
Received: from BN6PR14CA0025.namprd14.prod.outlook.com (2603:10b6:404:13f::11)
 by BN8PR12MB2979.namprd12.prod.outlook.com (2603:10b6:408:66::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 17 Nov
 2021 10:11:43 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:13f:cafe::b0) by BN6PR14CA0025.outlook.office365.com
 (2603:10b6:404:13f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 10:11:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Wed, 17 Nov 2021 10:11:43 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 17 Nov
 2021 04:11:42 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 17 Nov
 2021 02:11:42 -0800
Received: from stanley-test.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 17 Nov 2021 04:11:40 -0600
From: Stanley.Yang <Stanley.Yang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Hawking.Zhang@amd.com>,
 <John.Clements@amd.com>, <Evan.Quan@amd.com>, <Lijo.Lazar@amd.com>,
 <KevinYang.Wang@amd.com>
Subject: [PATCH Review 2/4] drm/amdgpu: add new query interface for umc block
Date: Wed, 17 Nov 2021 18:11:30 +0800
Message-ID: <20211117101132.6568-2-Stanley.Yang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117101132.6568-1-Stanley.Yang@amd.com>
References: <20211117101132.6568-1-Stanley.Yang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6e7173f-5a7e-48e5-62e8-08d9a9b2a7d7
X-MS-TrafficTypeDiagnostic: BN8PR12MB2979:
X-Microsoft-Antispam-PRVS: <BN8PR12MB29793C4A4A17B6CE7D76103D9A9A9@BN8PR12MB2979.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fj+z/LjcPUDk6zNsC2WAoKlhqarOH/tOLcjRt9pm75uaarJ49Wf6evRI9GpmfaExVl9x2Uz7fq7KMJ2u4TW7Dkq1MBIDaXsJW0krE7YeD9AB2EHS25M3TAQr839wAYEZiFx9+tY6iNM8KTDbm9ZXce/IVVQrVjmmc/IxwYgKtpJz2WRAc9q8209b2L24ICDQAxpbYiz0J0Kc8evj/0M7UFBc6MxFxciQaD1a3jjj6QE1nqwIaKk3KCDzwJkawa71PLJ3R8OiABLjz3QTNm9uk/1fL7vFosut0492f15Dlyd3bDa00beKCO8X1Ns5QHwFwzXBrXjiefpBws8F83OAvV1qQrdFylcZ0Mjk+OY/Zx7nmiOanICmMghwyAD+wI7dC0lCnVkehxO5jmeT+CcrDjIS5IOPdbDUqHw5ifBAVdLecR6+PZymcUiGp5NSRTQVpLNjOHX3Vh90+1Jmhbl4pjpR10onLfhgnNGlmG6wRRXa05v8D3NcvM+jgOZHhWRAT6KvF1ATeECA26Q9LA+6hA25vV4RqUa/PzaK/2wk7GFDF2pocnMdu23xES2QSgerNRup1Jp8D50TA20byftK84bz8ZxbnI8Vjh9gYy8PhKBGktlP2mBCiK3YHzIZ3xy+h/pqeghD7Q9ETRRHuqjJ9TYiugvvodjuLvuJH/xxS7BdCL/uNUlSJ4c9yjzc7D82MPHeWfEfBd9ZLrPcIMSy9BW0e2TIFBMh+wBn5rzW+Ts=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36860700001)(2906002)(86362001)(356005)(82310400003)(81166007)(2616005)(508600001)(426003)(110136005)(7696005)(36756003)(4326008)(6666004)(336012)(8676002)(186003)(47076005)(83380400001)(316002)(70586007)(70206006)(8936002)(26005)(6636002)(1076003)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 10:11:43.4349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e7173f-5a7e-48e5-62e8-08d9a9b2a7d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2979
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
Cc: "Stanley.Yang" <Stanley.Yang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

add message smu to query error information

Signed-off-by: Stanley.Yang <Stanley.Yang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h |  16 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h |   4 +
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c   | 161 ++++++++++++++++++++++++
 3 files changed, 181 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
index cdd0010a5389..bcbf3264d92f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
@@ -320,6 +320,19 @@ struct ras_common_if {
 	char name[32];
 };
 
+#define MAX_UMC_CHANNEL_NUM 32
+
+struct ecc_info_per_ch {
+	uint16_t ce_count_lo_chip;
+	uint16_t ce_count_hi_chip;
+	uint64_t mca_umc_status;
+	uint64_t mca_umc_addr;
+};
+
+struct umc_ecc_info {
+	struct ecc_info_per_ch ecc[MAX_UMC_CHANNEL_NUM];
+};
+
 struct amdgpu_ras {
 	/* ras infrastructure */
 	/* for ras itself. */
@@ -359,6 +372,9 @@ struct amdgpu_ras {
 	struct delayed_work ras_counte_delay_work;
 	atomic_t ras_ue_count;
 	atomic_t ras_ce_count;
+
+	/* record umc error info queried from smu */
+	struct umc_ecc_info umc_ecc;
 };
 
 struct ras_fs_data {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h
index 1f5fe2315236..7aa9b21eb906 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h
@@ -49,6 +49,10 @@ struct amdgpu_umc_ras_funcs {
 	void (*query_ras_error_address)(struct amdgpu_device *adev,
 					void *ras_error_status);
 	bool (*query_ras_poison_mode)(struct amdgpu_device *adev);
+	void (*message_smu_query_ras_error_count)(struct amdgpu_device *adev,
+				      void *ras_error_status);
+	void (*message_smu_query_ras_error_address)(struct amdgpu_device *adev,
+					void *ras_error_status);
 };
 
 struct amdgpu_umc_funcs {
diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v6_7.c b/drivers/gpu/drm/amd/amdgpu/umc_v6_7.c
index f7ec3fe134e5..cd96e8b734cb 100644
--- a/drivers/gpu/drm/amd/amdgpu/umc_v6_7.c
+++ b/drivers/gpu/drm/amd/amdgpu/umc_v6_7.c
@@ -50,6 +50,165 @@ static inline uint32_t get_umc_v6_7_reg_offset(struct amdgpu_device *adev,
 	return adev->umc.channel_offs * ch_inst + UMC_V6_7_INST_DIST * umc_inst;
 }
 
+static inline uint32_t get_umc_v6_7_channel_index(struct amdgpu_device *adev,
+					      uint32_t umc_inst,
+					      uint32_t ch_inst)
+{
+	return adev->umc.channel_idx_tbl[umc_inst * adev->umc.channel_inst_num + ch_inst];
+}
+
+static void umc_v6_7_message_smu_query_correctable_error_count(struct amdgpu_device *adev,
+						   uint32_t channel_index,
+						   unsigned long *error_count)
+{
+	uint32_t ecc_err_cnt;
+	uint64_t mc_umc_status;
+	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
+
+	/*
+	 * select the lower chip and check the error count
+	 * skip add error count, calc error counter only from mca_umc_status
+	 */
+	ecc_err_cnt = ras->umc_ecc.ecc[channel_index].ce_count_lo_chip;
+
+	/*
+	 * select the higher chip and check the err counter
+	 * skip add error count, calc error counter only from mca_umc_status
+	 */
+	ecc_err_cnt = ras->umc_ecc.ecc[channel_index].ce_count_hi_chip;
+
+	/* check for SRAM correctable error
+	  MCUMC_STATUS is a 64 bit register */
+	mc_umc_status = ras->umc_ecc.ecc[channel_index].mca_umc_status;
+	if (REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, Val) == 1 &&
+	    REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, CECC) == 1)
+		*error_count += 1;
+}
+
+static void umc_v6_7_message_smu_querry_uncorrectable_error_count(struct amdgpu_device *adev,
+						      uint32_t channel_index,
+						      unsigned long *error_count)
+{
+	uint64_t mc_umc_status;
+	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
+
+	/* check the MCUMC_STATUS */
+	mc_umc_status = ras->umc_ecc.ecc[channel_index].mca_umc_status;
+	if ((REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, Val) == 1) &&
+	    (REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, Deferred) == 1 ||
+	    REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, UECC) == 1 ||
+	    REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, PCC) == 1 ||
+	    REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, UC) == 1 ||
+	    REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, TCC) == 1))
+		*error_count += 1;
+}
+
+static void umc_v6_7_message_smu_query_ras_error_count(struct amdgpu_device *adev,
+					   void *ras_error_status)
+{
+	struct ras_err_data *err_data = (struct ras_err_data *)ras_error_status;
+
+	uint32_t umc_inst        = 0;
+	uint32_t ch_inst         = 0;
+	uint32_t umc_reg_offset  = 0;
+	uint32_t channel_index	 = 0;
+
+	/*TODO: driver needs to toggle DF Cstate to ensure
+	 * safe access of UMC registers. Will add the protection */
+	LOOP_UMC_INST_AND_CH(umc_inst, ch_inst) {
+		umc_reg_offset = get_umc_v6_7_reg_offset(adev,
+							 umc_inst,
+							 ch_inst);
+		channel_index = get_umc_v6_7_channel_index(adev,
+							 umc_inst,
+							 ch_inst);
+		umc_v6_7_message_smu_query_correctable_error_count(adev,
+						      channel_index,
+						      &(err_data->ce_count));
+		umc_v6_7_message_smu_querry_uncorrectable_error_count(adev,
+							  channel_index,
+							  &(err_data->ue_count));
+	}
+}
+
+static void umc_v6_7_message_smu_query_error_address(struct amdgpu_device *adev,
+					 struct ras_err_data *err_data,
+					 uint32_t umc_reg_offset,
+					 uint32_t ch_inst,
+					 uint32_t umc_inst)
+{
+	uint64_t mc_umc_status, err_addr, retired_page;
+	struct eeprom_table_record *err_rec;
+	uint32_t channel_index;
+	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
+
+	channel_index =
+		adev->umc.channel_idx_tbl[umc_inst * adev->umc.channel_inst_num + ch_inst];
+
+	mc_umc_status = ras->umc_ecc.ecc[channel_index].mca_umc_status;
+
+	if (mc_umc_status == 0)
+		return;
+
+	if (!err_data->err_addr)
+		return;
+
+	err_rec = &err_data->err_addr[err_data->err_addr_cnt];
+
+	/* calculate error address if ue/ce error is detected */
+	if (REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, Val) == 1 &&
+	    (REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, UECC) == 1 ||
+	    REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, CECC) == 1)) {
+
+		err_addr = ras->umc_ecc.ecc[channel_index].mca_umc_addr;
+		err_addr = REG_GET_FIELD(err_addr, MCA_UMC_UMC0_MCUMC_ADDRT0, ErrorAddr);
+
+		/* translate umc channel address to soc pa, 3 parts are included */
+		retired_page = ADDR_OF_8KB_BLOCK(err_addr) |
+				ADDR_OF_256B_BLOCK(channel_index) |
+				OFFSET_IN_256B_BLOCK(err_addr);
+
+		/* we only save ue error information currently, ce is skipped */
+		if (REG_GET_FIELD(mc_umc_status, MCA_UMC_UMC0_MCUMC_STATUST0, UECC)
+				== 1) {
+			err_rec->address = err_addr;
+			/* page frame address is saved */
+			err_rec->retired_page = retired_page >> AMDGPU_GPU_PAGE_SHIFT;
+			err_rec->ts = (uint64_t)ktime_get_real_seconds();
+			err_rec->err_type = AMDGPU_RAS_EEPROM_ERR_NON_RECOVERABLE;
+			err_rec->cu = 0;
+			err_rec->mem_channel = channel_index;
+			err_rec->mcumc_id = umc_inst;
+
+			err_data->err_addr_cnt++;
+		}
+	}
+}
+
+static void umc_v6_7_message_smu_query_ras_error_address(struct amdgpu_device *adev,
+					     void *ras_error_status)
+{
+	struct ras_err_data *err_data = (struct ras_err_data *)ras_error_status;
+
+	uint32_t umc_inst        = 0;
+	uint32_t ch_inst         = 0;
+	uint32_t umc_reg_offset  = 0;
+
+	/*TODO: driver needs to toggle DF Cstate to ensure
+	 * safe access of UMC resgisters. Will add the protection
+	 * when firmware interface is ready */
+	LOOP_UMC_INST_AND_CH(umc_inst, ch_inst) {
+		umc_reg_offset = get_umc_v6_7_reg_offset(adev,
+							 umc_inst,
+							 ch_inst);
+		umc_v6_7_message_smu_query_error_address(adev,
+					     err_data,
+					     umc_reg_offset,
+					     ch_inst,
+					     umc_inst);
+	}
+}
+
 static void umc_v6_7_query_correctable_error_count(struct amdgpu_device *adev,
 						   uint32_t umc_reg_offset,
 						   unsigned long *error_count)
@@ -327,4 +486,6 @@ const struct amdgpu_umc_ras_funcs umc_v6_7_ras_funcs = {
 	.query_ras_error_count = umc_v6_7_query_ras_error_count,
 	.query_ras_error_address = umc_v6_7_query_ras_error_address,
 	.query_ras_poison_mode = umc_v6_7_query_ras_poison_mode,
+	.message_smu_query_ras_error_count = umc_v6_7_message_smu_query_ras_error_count,
+	.message_smu_query_ras_error_address = umc_v6_7_message_smu_query_ras_error_address,
 };
-- 
2.17.1

