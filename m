Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957875622CA
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Jun 2022 21:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE76510F8C6;
	Thu, 30 Jun 2022 19:14:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A4812A6D1
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Jun 2022 19:14:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOVEBBeLmQslvDxgTgH/XKBYlB5BvS9Sknw4BBqPGM0kxhVDKaDznV/dmuDmMxAo9U+yzkORWmFFi05I6CNGofGosKSuAXECw+M0gsUxp13CpAetBy5v4goU30voB7N1NomiOXldaEiWGafbPCqt06WL0Q13wXXN+96ZJOnjTUc+dLVIbsHJkC4fQ9MHiwSi/G5q4JQ2Tci3zsJYj5bYZSUlesVhKkre1JfB3UAau2K1QtmrkSn3bWtTVuPnW5JTTSqFxeLZnsKq/xk6edY9wBpBAda+DAldF8G396MkfqIir5n1stSwkq8kzXGJ+bR4x9wpq4aLzVnRL5RrqedMUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXOfINAyGe3NLTTLY3FPB0neXmWZoqtTbVCEPvxyDbc=;
 b=c+jQo+ndHGbblIAcw1pjvt3qTUi3J+IV2ShizlOzk+AG6ApTwCNUO4+wxG9+XQKutiXu+USsVwN11bzmTcLwBcKPhoCw1QcEJjG6UUSrpdwtG8hkut/tKb0gkfT1OKODMMUb/uAVsM8TY0qCEtwM+l6bxzx2LbvKUEQwb5ihjY0dNtdJHaA8vyphAihies7UI5l6/I+3QCQUbUE9qJWIfwmLEift2QVUfTcSvdgKJdvO4j4TxjMSZykqNJV+3MNy84CMy9iW14WfmgVwDYDqnNQMGZG2cl/poJ0eVJ+iujMlkSfJyOvTmOc8rAxPRkwR6o+xMusUSWYKrqB88iFrJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXOfINAyGe3NLTTLY3FPB0neXmWZoqtTbVCEPvxyDbc=;
 b=cTQv0k2o+xZYKaW7IbB1qPI/z13z/UD7di50zB1CP48Oasfv+QS3pDLZnwy+ngAh927paxTnLiielEy8+29MgP9I7wAPJWi9Hyf6zd/X3b4rJixSoi6PqiB0ZM0DrRuwlXTChadpuBEl9Ds1VSTc5l1gre7YZw1MbVHvI4uUGWc=
Received: from BN9PR03CA0127.namprd03.prod.outlook.com (2603:10b6:408:fe::12)
 by DM6PR12MB2682.namprd12.prod.outlook.com (2603:10b6:5:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 19:14:07 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::4e) by BN9PR03CA0127.outlook.office365.com
 (2603:10b6:408:fe::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 30 Jun 2022 19:14:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 19:14:07 +0000
Received: from atma2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 30 Jun
 2022 14:14:05 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 18/40] drm/amd/display: Extend soc BB capabilitiy
Date: Thu, 30 Jun 2022 15:13:00 -0400
Message-ID: <20220630191322.909650-19-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630191322.909650-1-Rodrigo.Siqueira@amd.com>
References: <20220630191322.909650-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64677cb1-38d2-4ee9-ddc8-08da5accb483
X-MS-TrafficTypeDiagnostic: DM6PR12MB2682:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pPPLoYMz5uk8Jon94360yzD34cYRDlhK8JaX/9JVCkJ/Y02FJ0bANWEl1NOj4uu6zIMA8Heme7WMmEkZz79KmUoM+iH8LhohfG1RNEsyaO1Vc/ES1wfEGOcyr9Gcetcy4DOn8lR1RONfMePPkaVChRCVv+egObSN3LIn5SN0iRNpFgOeGO7DWoro3ak4il15jPHD4Sai+/60BohjHpdWPYIpISDdiKQpIx0wJGb2FatO0P4NieSBuXXj/7VPTYQYMkzMg+NLA52Isu1kEKkxFt1eA3GlrXLcWmyjHcfVie/rAYGRVU/PtBIld4eCWEcc8oxXJ2Ax9GeXmhhmOT9MbbjxuoryyAh9tE5JC8lTH5daJ7N0Kd6iFB/77qdC/kyp0kmrt4fdoJaJywlh+voenAOYhrYlMyrATtzmNLHgXUnYR08izLiu7ER1n+rNVDXzPDyHKtrYTaeoM6+l/47xV9aINHbq20Asra0pZgrv8Bhf3Si8ea/r96LOBVYvfAYbSHfKBE4T+ve38JS9mJ+ECfAWODVcqcAyx865xXikSPINh8huId6KlFoz9sN6lNwaOZVdAmqCQZiDTktQpEQsdmPofZrKSfbIhXa6yLqXOny4jL3dcEEzP+bDVCSu0EoicVcaSdOKOkq3ZZA84D4hH0y2zDXtNfY8g96N4ql4RHYIkDRHZZ4LdO3VvOkhec1/Ae6UAuBfXvPvrfC42X9c1t30LTvXwc/2bn4MTsiYfDIcvCVD4VEi835NPo1S0duxqib/lfffH2q7X6ImBGCwnxCLW8GZCuL5N0UeZ6izqkZEz6eqnnhHvscRw6fBsRJB9kSTSnfnNaOnBQl+08OOLfMCvFYqJg2YVbv+vknpiRg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(396003)(346002)(36840700001)(40470700004)(46966006)(86362001)(82310400005)(2906002)(6666004)(41300700001)(7696005)(36860700001)(82740400003)(6916009)(54906003)(316002)(47076005)(426003)(336012)(1076003)(16526019)(36756003)(2616005)(186003)(5660300002)(83380400001)(26005)(70206006)(40480700001)(8676002)(70586007)(4326008)(8936002)(356005)(478600001)(40460700003)(81166007)(30864003)(40140700001)(36900700001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 19:14:07.4090 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64677cb1-38d2-4ee9-ddc8-08da5accb483
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2682
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
Cc: stylon.wang@amd.com, Sunpeng.Li@amd.com, Harry.Wentland@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 solomon.chiu@amd.com, jerry.zuo@amd.com, Aurabindo.Pillai@amd.com,
 hamza.mahfooz@amd.com, wayne.lin@amd.com, Jun Lei <jun.lei@amd.com>,
 Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jun Lei <jun.lei@amd.com>

[why]
Some parts are consuming dangerously close to maximum number of states
supported when updating the BB (i.e. 8).

[how]
Change maximum stages from 9 to 20.

Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Jun Lei <jun.lei@amd.com>
---
 .../drm/amd/display/dc/dcn32/dcn32_resource.c | 508 ++++++++++++++----
 .../amd/display/dc/dcn321/dcn321_resource.c   | 503 +++++++++++++----
 2 files changed, 784 insertions(+), 227 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
index 1f2af676191b..e9ecc27a51de 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
@@ -3410,6 +3410,277 @@ void dcn32_calculate_dlg_params(struct dc *dc, struct dc_state *context, display
 	}
 }
 
+static void get_optimal_ntuple(struct _vcs_dpi_voltage_scaling_st *entry)
+{
+	if (entry->dcfclk_mhz > 0) {
+		float bw_on_sdp = entry->dcfclk_mhz * dcn3_2_soc.return_bus_width_bytes * ((float)dcn3_2_soc.pct_ideal_sdp_bw_after_urgent / 100);
+
+		entry->fabricclk_mhz = bw_on_sdp / (dcn3_2_soc.return_bus_width_bytes * ((float)dcn3_2_soc.pct_ideal_fabric_bw_after_urgent / 100));
+		entry->dram_speed_mts = bw_on_sdp / (dcn3_2_soc.num_chans *
+				dcn3_2_soc.dram_channel_width_bytes * ((float)dcn3_2_soc.pct_ideal_dram_sdp_bw_after_urgent_pixel_only / 100));
+	} else if (entry->fabricclk_mhz > 0) {
+		float bw_on_fabric = entry->fabricclk_mhz * dcn3_2_soc.return_bus_width_bytes * ((float)dcn3_2_soc.pct_ideal_fabric_bw_after_urgent / 100);
+
+		entry->dcfclk_mhz = bw_on_fabric / (dcn3_2_soc.return_bus_width_bytes * ((float)dcn3_2_soc.pct_ideal_sdp_bw_after_urgent / 100));
+		entry->dram_speed_mts = bw_on_fabric / (dcn3_2_soc.num_chans *
+				dcn3_2_soc.dram_channel_width_bytes * ((float)dcn3_2_soc.pct_ideal_dram_sdp_bw_after_urgent_pixel_only / 100));
+	} else if (entry->dram_speed_mts > 0) {
+		float bw_on_dram = entry->dram_speed_mts * dcn3_2_soc.num_chans *
+				dcn3_2_soc.dram_channel_width_bytes * ((float)dcn3_2_soc.pct_ideal_dram_sdp_bw_after_urgent_pixel_only / 100);
+
+		entry->fabricclk_mhz = bw_on_dram / (dcn3_2_soc.return_bus_width_bytes * ((float)dcn3_2_soc.pct_ideal_fabric_bw_after_urgent / 100));
+		entry->dcfclk_mhz = bw_on_dram / (dcn3_2_soc.return_bus_width_bytes * ((float)dcn3_2_soc.pct_ideal_sdp_bw_after_urgent / 100));
+	}
+}
+
+static float calculate_net_bw_in_kbytes_sec(struct _vcs_dpi_voltage_scaling_st *entry)
+{
+	float memory_bw_kbytes_sec = entry->dram_speed_mts * dcn3_2_soc.num_chans *
+			dcn3_2_soc.dram_channel_width_bytes * ((float)dcn3_2_soc.pct_ideal_dram_sdp_bw_after_urgent_pixel_only / 100);
+
+	float fabric_bw_kbytes_sec = entry->fabricclk_mhz * dcn3_2_soc.return_bus_width_bytes * ((float)dcn3_2_soc.pct_ideal_fabric_bw_after_urgent / 100);
+
+	float sdp_bw_kbytes_sec = entry->dcfclk_mhz * dcn3_2_soc.return_bus_width_bytes * ((float)dcn3_2_soc.pct_ideal_sdp_bw_after_urgent / 100);
+
+	float limiting_bw_kbytes_sec = memory_bw_kbytes_sec;
+
+	if (fabric_bw_kbytes_sec < limiting_bw_kbytes_sec)
+		limiting_bw_kbytes_sec = fabric_bw_kbytes_sec;
+
+	if (sdp_bw_kbytes_sec < limiting_bw_kbytes_sec)
+		limiting_bw_kbytes_sec = sdp_bw_kbytes_sec;
+
+	return limiting_bw_kbytes_sec;
+}
+
+static void insert_entry_into_table_sorted(struct _vcs_dpi_voltage_scaling_st *table, unsigned int *num_entries,
+		struct _vcs_dpi_voltage_scaling_st *entry)
+{
+	int index = 0;
+	int i = 0;
+	float net_bw_of_new_state = 0;
+
+	if (*num_entries == 0) {
+		table[0] = *entry;
+		(*num_entries)++;
+	} else {
+		net_bw_of_new_state = calculate_net_bw_in_kbytes_sec(entry);
+		while (net_bw_of_new_state > calculate_net_bw_in_kbytes_sec(&table[index])) {
+			index++;
+			if (index >= *num_entries)
+				break;
+		}
+
+		for (i = *num_entries; i > index; i--) {
+			table[i] = table[i - 1];
+		}
+
+		table[index] = *entry;
+		(*num_entries)++;
+	}
+}
+
+static void remove_entry_from_table_at_index(struct _vcs_dpi_voltage_scaling_st *table, unsigned int *num_entries,
+		unsigned int index)
+{
+	int i;
+
+	if (*num_entries == 0)
+		return;
+
+	for (i = index; i < *num_entries - 1; i++) {
+		table[i] = table[i + 1];
+	}
+	memset(&table[--(*num_entries)], 0, sizeof(struct _vcs_dpi_voltage_scaling_st));
+}
+
+static int build_synthetic_soc_states(struct clk_bw_params *bw_params,
+		struct _vcs_dpi_voltage_scaling_st *table, unsigned int *num_entries)
+{
+	int i, j;
+	struct _vcs_dpi_voltage_scaling_st entry = {0};
+
+	unsigned int max_dcfclk_mhz = 0, max_dispclk_mhz = 0, max_dppclk_mhz = 0,
+			max_phyclk_mhz = 0, max_dtbclk_mhz = 0, max_fclk_mhz = 0, max_uclk_mhz = 0;
+
+	unsigned int min_dcfclk_mhz = 199, min_fclk_mhz = 299;
+
+	static const unsigned int num_dcfclk_stas = 5;
+	unsigned int dcfclk_sta_targets[DC__VOLTAGE_STATES] = {199, 615, 906, 1324, 1564};
+
+	unsigned int num_uclk_dpms = 0;
+	unsigned int num_fclk_dpms = 0;
+	unsigned int num_dcfclk_dpms = 0;
+
+	for (i = 0; i < MAX_NUM_DPM_LVL; i++) {
+		if (bw_params->clk_table.entries[i].dcfclk_mhz > max_dcfclk_mhz)
+			max_dcfclk_mhz = bw_params->clk_table.entries[i].dcfclk_mhz;
+		if (bw_params->clk_table.entries[i].fclk_mhz > max_fclk_mhz)
+			max_fclk_mhz = bw_params->clk_table.entries[i].fclk_mhz;
+		if (bw_params->clk_table.entries[i].memclk_mhz > max_uclk_mhz)
+			max_uclk_mhz = bw_params->clk_table.entries[i].memclk_mhz;
+		if (bw_params->clk_table.entries[i].dispclk_mhz > max_dispclk_mhz)
+			max_dispclk_mhz = bw_params->clk_table.entries[i].dispclk_mhz;
+		if (bw_params->clk_table.entries[i].dppclk_mhz > max_dppclk_mhz)
+			max_dppclk_mhz = bw_params->clk_table.entries[i].dppclk_mhz;
+		if (bw_params->clk_table.entries[i].phyclk_mhz > max_phyclk_mhz)
+			max_phyclk_mhz = bw_params->clk_table.entries[i].phyclk_mhz;
+		if (bw_params->clk_table.entries[i].dtbclk_mhz > max_dtbclk_mhz)
+			max_dtbclk_mhz = bw_params->clk_table.entries[i].dtbclk_mhz;
+
+		if (bw_params->clk_table.entries[i].memclk_mhz > 0)
+			num_uclk_dpms++;
+		if (bw_params->clk_table.entries[i].fclk_mhz > 0)
+			num_fclk_dpms++;
+		if (bw_params->clk_table.entries[i].dcfclk_mhz > 0)
+			num_dcfclk_dpms++;
+	}
+
+	if (!max_dcfclk_mhz || !max_dispclk_mhz || !max_dtbclk_mhz)
+		return -1;
+
+	if (max_dppclk_mhz == 0)
+		max_dppclk_mhz = max_dispclk_mhz;
+
+	if (max_fclk_mhz == 0)
+		max_fclk_mhz = max_dcfclk_mhz * dcn3_2_soc.pct_ideal_sdp_bw_after_urgent / dcn3_2_soc.pct_ideal_fabric_bw_after_urgent;
+
+	if (max_phyclk_mhz == 0)
+		max_phyclk_mhz = dcn3_2_soc.clock_limits[0].phyclk_mhz;
+
+	*num_entries = 0;
+	entry.dispclk_mhz = max_dispclk_mhz;
+	entry.dscclk_mhz = max_dispclk_mhz / 3;
+	entry.dppclk_mhz = max_dppclk_mhz;
+	entry.dtbclk_mhz = max_dtbclk_mhz;
+	entry.phyclk_mhz = max_phyclk_mhz;
+	entry.phyclk_d18_mhz = dcn3_2_soc.clock_limits[0].phyclk_d18_mhz;
+	entry.phyclk_d32_mhz = dcn3_2_soc.clock_limits[0].phyclk_d32_mhz;
+
+	// Insert all the DCFCLK STAs
+	for (i = 0; i < num_dcfclk_stas; i++) {
+		entry.dcfclk_mhz = dcfclk_sta_targets[i];
+		entry.fabricclk_mhz = 0;
+		entry.dram_speed_mts = 0;
+
+		get_optimal_ntuple(&entry);
+		insert_entry_into_table_sorted(table, num_entries, &entry);
+	}
+
+	// Insert the max DCFCLK
+	entry.dcfclk_mhz = max_dcfclk_mhz;
+	entry.fabricclk_mhz = 0;
+	entry.dram_speed_mts = 0;
+
+	get_optimal_ntuple(&entry);
+	insert_entry_into_table_sorted(table, num_entries, &entry);
+
+	// Insert the UCLK DPMS
+	for (i = 0; i < num_uclk_dpms; i++) {
+		entry.dcfclk_mhz = 0;
+		entry.fabricclk_mhz = 0;
+		entry.dram_speed_mts = bw_params->clk_table.entries[i].memclk_mhz * 16;
+
+		get_optimal_ntuple(&entry);
+		insert_entry_into_table_sorted(table, num_entries, &entry);
+	}
+
+	// If FCLK is coarse grained, insert individual DPMs.
+	if (num_fclk_dpms > 2) {
+		for (i = 0; i < num_fclk_dpms; i++) {
+			entry.dcfclk_mhz = 0;
+			entry.fabricclk_mhz = bw_params->clk_table.entries[i].fclk_mhz;
+			entry.dram_speed_mts = 0;
+
+			get_optimal_ntuple(&entry);
+			insert_entry_into_table_sorted(table, num_entries, &entry);
+		}
+	}
+	// If FCLK fine grained, only insert max
+	else {
+		entry.dcfclk_mhz = 0;
+		entry.fabricclk_mhz = max_fclk_mhz;
+		entry.dram_speed_mts = 0;
+
+		get_optimal_ntuple(&entry);
+		insert_entry_into_table_sorted(table, num_entries, &entry);
+	}
+
+	// At this point, the table contains all "points of interest" based on
+	// DPMs from PMFW, and STAs.  Table is sorted by BW, and all clock
+	// ratios (by derate, are exact).
+
+	// Remove states that require higher clocks than are supported
+	for (i = *num_entries - 1; i >= 0 ; i--) {
+		if (table[i].dcfclk_mhz > max_dcfclk_mhz ||
+				table[i].fabricclk_mhz > max_fclk_mhz ||
+				table[i].dram_speed_mts > max_uclk_mhz * 16)
+			remove_entry_from_table_at_index(table, num_entries, i);
+	}
+
+	// At this point, the table only contains supported points of interest
+	// it could be used as is, but some states may be redundant due to
+	// coarse grained nature of some clocks, so we want to round up to
+	// coarse grained DPMs and remove duplicates.
+
+	// Round up UCLKs
+	for (i = *num_entries - 1; i >= 0 ; i--) {
+		for (j = 0; j < num_uclk_dpms; j++) {
+			if (bw_params->clk_table.entries[j].memclk_mhz * 16 >= table[i].dram_speed_mts) {
+				table[i].dram_speed_mts = bw_params->clk_table.entries[j].memclk_mhz * 16;
+				break;
+			}
+		}
+	}
+
+	// If FCLK is coarse grained, round up to next DPMs
+	if (num_fclk_dpms > 2) {
+		for (i = *num_entries - 1; i >= 0 ; i--) {
+			for (j = 0; j < num_fclk_dpms; j++) {
+				if (bw_params->clk_table.entries[j].fclk_mhz >= table[i].fabricclk_mhz) {
+					table[i].fabricclk_mhz = bw_params->clk_table.entries[j].fclk_mhz;
+					break;
+				}
+			}
+		}
+	}
+	// Otherwise, round up to minimum.
+	else {
+		for (i = *num_entries - 1; i >= 0 ; i--) {
+			if (table[i].fabricclk_mhz < min_fclk_mhz) {
+				table[i].fabricclk_mhz = min_fclk_mhz;
+				break;
+			}
+		}
+	}
+
+	// Round DCFCLKs up to minimum
+	for (i = *num_entries - 1; i >= 0 ; i--) {
+		if (table[i].dcfclk_mhz < min_dcfclk_mhz) {
+			table[i].dcfclk_mhz = min_dcfclk_mhz;
+			break;
+		}
+	}
+
+	// Remove duplicate states, note duplicate states are always neighbouring since table is sorted.
+	i = 0;
+	while (i < *num_entries - 1) {
+		if (table[i].dcfclk_mhz == table[i + 1].dcfclk_mhz &&
+				table[i].fabricclk_mhz == table[i + 1].fabricclk_mhz &&
+				table[i].dram_speed_mts == table[i + 1].dram_speed_mts)
+			remove_entry_from_table_at_index(table, num_entries, i + 1);
+		else
+			i++;
+	}
+
+	// Fix up the state indicies
+	for (i = *num_entries - 1; i >= 0 ; i--) {
+		table[i].state = i;
+	}
+
+	return 0;
+}
+
 /* dcn32_update_bw_bounding_box
  * This would override some dcn3_2 ip_or_soc initial parameters hardcoded from spreadsheet
  * with actual values as per dGPU SKU:
@@ -3491,139 +3762,150 @@ static void dcn32_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw
 
 	/* Overrides Clock levelsfrom CLK Mgr table entries as reported by PM FW */
 	if ((!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) && (bw_params->clk_table.entries[0].memclk_mhz)) {
-		unsigned int i = 0, j = 0, num_states = 0;
-
-		unsigned int dcfclk_mhz[DC__VOLTAGE_STATES] = {0};
-		unsigned int dram_speed_mts[DC__VOLTAGE_STATES] = {0};
-		unsigned int optimal_uclk_for_dcfclk_sta_targets[DC__VOLTAGE_STATES] = {0};
-		unsigned int optimal_dcfclk_for_uclk[DC__VOLTAGE_STATES] = {0};
-
-		unsigned int dcfclk_sta_targets[DC__VOLTAGE_STATES] = {615, 906, 1324, 1564};
-		unsigned int num_dcfclk_sta_targets = 4, num_uclk_states = 0;
-		unsigned int max_dcfclk_mhz = 0, max_dispclk_mhz = 0, max_dppclk_mhz = 0, max_phyclk_mhz = 0;
-
-		for (i = 0; i < MAX_NUM_DPM_LVL; i++) {
-			if (bw_params->clk_table.entries[i].dcfclk_mhz > max_dcfclk_mhz)
-				max_dcfclk_mhz = bw_params->clk_table.entries[i].dcfclk_mhz;
-			if (bw_params->clk_table.entries[i].dispclk_mhz > max_dispclk_mhz)
-				max_dispclk_mhz = bw_params->clk_table.entries[i].dispclk_mhz;
-			if (bw_params->clk_table.entries[i].dppclk_mhz > max_dppclk_mhz)
-				max_dppclk_mhz = bw_params->clk_table.entries[i].dppclk_mhz;
-			if (bw_params->clk_table.entries[i].phyclk_mhz > max_phyclk_mhz)
-				max_phyclk_mhz = bw_params->clk_table.entries[i].phyclk_mhz;
-		}
-		if (!max_dcfclk_mhz)
-			max_dcfclk_mhz = dcn3_2_soc.clock_limits[0].dcfclk_mhz;
-		if (!max_dispclk_mhz)
-			max_dispclk_mhz = dcn3_2_soc.clock_limits[0].dispclk_mhz;
-		if (!max_dppclk_mhz)
-			max_dppclk_mhz = dcn3_2_soc.clock_limits[0].dppclk_mhz;
-		if (!max_phyclk_mhz)
-			max_phyclk_mhz = dcn3_2_soc.clock_limits[0].phyclk_mhz;
-
-		if (max_dcfclk_mhz > dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
-			// If max DCFCLK is greater than the max DCFCLK STA target, insert into the DCFCLK STA target array
-			dcfclk_sta_targets[num_dcfclk_sta_targets] = max_dcfclk_mhz;
-			num_dcfclk_sta_targets++;
-		} else if (max_dcfclk_mhz < dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
-			// If max DCFCLK is less than the max DCFCLK STA target, cap values and remove duplicates
-			for (i = 0; i < num_dcfclk_sta_targets; i++) {
-				if (dcfclk_sta_targets[i] > max_dcfclk_mhz) {
-					dcfclk_sta_targets[i] = max_dcfclk_mhz;
-					break;
+		if (dc->debug.use_legacy_soc_bb_mechanism) {
+			unsigned int i = 0, j = 0, num_states = 0;
+
+			unsigned int dcfclk_mhz[DC__VOLTAGE_STATES] = {0};
+			unsigned int dram_speed_mts[DC__VOLTAGE_STATES] = {0};
+			unsigned int optimal_uclk_for_dcfclk_sta_targets[DC__VOLTAGE_STATES] = {0};
+			unsigned int optimal_dcfclk_for_uclk[DC__VOLTAGE_STATES] = {0};
+			unsigned int min_dcfclk = UINT_MAX;
+			/* Set 199 as first value in STA target array to have a minimum DCFCLK value.
+			 * For DCN32 we set min to 199 so minimum FCLK DPM0 (300Mhz can be achieved) */
+			unsigned int dcfclk_sta_targets[DC__VOLTAGE_STATES] = {199, 615, 906, 1324, 1564};
+			unsigned int num_dcfclk_sta_targets = 4, num_uclk_states = 0;
+			unsigned int max_dcfclk_mhz = 0, max_dispclk_mhz = 0, max_dppclk_mhz = 0, max_phyclk_mhz = 0;
+
+			for (i = 0; i < MAX_NUM_DPM_LVL; i++) {
+				if (bw_params->clk_table.entries[i].dcfclk_mhz > max_dcfclk_mhz)
+					max_dcfclk_mhz = bw_params->clk_table.entries[i].dcfclk_mhz;
+				if (bw_params->clk_table.entries[i].dcfclk_mhz != 0 &&
+						bw_params->clk_table.entries[i].dcfclk_mhz < min_dcfclk)
+					min_dcfclk = bw_params->clk_table.entries[i].dcfclk_mhz;
+				if (bw_params->clk_table.entries[i].dispclk_mhz > max_dispclk_mhz)
+					max_dispclk_mhz = bw_params->clk_table.entries[i].dispclk_mhz;
+				if (bw_params->clk_table.entries[i].dppclk_mhz > max_dppclk_mhz)
+					max_dppclk_mhz = bw_params->clk_table.entries[i].dppclk_mhz;
+				if (bw_params->clk_table.entries[i].phyclk_mhz > max_phyclk_mhz)
+					max_phyclk_mhz = bw_params->clk_table.entries[i].phyclk_mhz;
+			}
+			if (min_dcfclk > dcfclk_sta_targets[0])
+				dcfclk_sta_targets[0] = min_dcfclk;
+			if (!max_dcfclk_mhz)
+				max_dcfclk_mhz = dcn3_2_soc.clock_limits[0].dcfclk_mhz;
+			if (!max_dispclk_mhz)
+				max_dispclk_mhz = dcn3_2_soc.clock_limits[0].dispclk_mhz;
+			if (!max_dppclk_mhz)
+				max_dppclk_mhz = dcn3_2_soc.clock_limits[0].dppclk_mhz;
+			if (!max_phyclk_mhz)
+				max_phyclk_mhz = dcn3_2_soc.clock_limits[0].phyclk_mhz;
+
+			if (max_dcfclk_mhz > dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
+				// If max DCFCLK is greater than the max DCFCLK STA target, insert into the DCFCLK STA target array
+				dcfclk_sta_targets[num_dcfclk_sta_targets] = max_dcfclk_mhz;
+				num_dcfclk_sta_targets++;
+			} else if (max_dcfclk_mhz < dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
+				// If max DCFCLK is less than the max DCFCLK STA target, cap values and remove duplicates
+				for (i = 0; i < num_dcfclk_sta_targets; i++) {
+					if (dcfclk_sta_targets[i] > max_dcfclk_mhz) {
+						dcfclk_sta_targets[i] = max_dcfclk_mhz;
+						break;
+					}
 				}
+				// Update size of array since we "removed" duplicates
+				num_dcfclk_sta_targets = i + 1;
 			}
-			// Update size of array since we "removed" duplicates
-			num_dcfclk_sta_targets = i + 1;
-		}
 
-		num_uclk_states = bw_params->clk_table.num_entries;
+			num_uclk_states = bw_params->clk_table.num_entries;
 
-		// Calculate optimal dcfclk for each uclk
-		for (i = 0; i < num_uclk_states; i++) {
-			dcn32_get_optimal_dcfclk_fclk_for_uclk(bw_params->clk_table.entries[i].memclk_mhz * 16,
-					&optimal_dcfclk_for_uclk[i], NULL);
-			if (optimal_dcfclk_for_uclk[i] < bw_params->clk_table.entries[0].dcfclk_mhz) {
-				optimal_dcfclk_for_uclk[i] = bw_params->clk_table.entries[0].dcfclk_mhz;
+			// Calculate optimal dcfclk for each uclk
+			for (i = 0; i < num_uclk_states; i++) {
+				dcn32_get_optimal_dcfclk_fclk_for_uclk(bw_params->clk_table.entries[i].memclk_mhz * 16,
+						&optimal_dcfclk_for_uclk[i], NULL);
+				if (optimal_dcfclk_for_uclk[i] < bw_params->clk_table.entries[0].dcfclk_mhz) {
+					optimal_dcfclk_for_uclk[i] = bw_params->clk_table.entries[0].dcfclk_mhz;
+				}
 			}
-		}
 
-		// Calculate optimal uclk for each dcfclk sta target
-		for (i = 0; i < num_dcfclk_sta_targets; i++) {
-			for (j = 0; j < num_uclk_states; j++) {
-				if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j]) {
-					optimal_uclk_for_dcfclk_sta_targets[i] =
-							bw_params->clk_table.entries[j].memclk_mhz * 16;
-					break;
+			// Calculate optimal uclk for each dcfclk sta target
+			for (i = 0; i < num_dcfclk_sta_targets; i++) {
+				for (j = 0; j < num_uclk_states; j++) {
+					if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j]) {
+						optimal_uclk_for_dcfclk_sta_targets[i] =
+								bw_params->clk_table.entries[j].memclk_mhz * 16;
+						break;
+					}
 				}
 			}
-		}
 
-		i = 0;
-		j = 0;
-		// create the final dcfclk and uclk table
-		while (i < num_dcfclk_sta_targets && j < num_uclk_states && num_states < DC__VOLTAGE_STATES) {
-			if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j] && i < num_dcfclk_sta_targets) {
-				dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
-				dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
-			} else {
-				if (j < num_uclk_states && optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
-					dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
-					dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
+			i = 0;
+			j = 0;
+			// create the final dcfclk and uclk table
+			while (i < num_dcfclk_sta_targets && j < num_uclk_states && num_states < DC__VOLTAGE_STATES) {
+				if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j] && i < num_dcfclk_sta_targets) {
+					dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
+					dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
 				} else {
-					j = num_uclk_states;
+					if (j < num_uclk_states && optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
+						dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
+						dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
+					} else {
+						j = num_uclk_states;
+					}
 				}
 			}
-		}
 
-		while (i < num_dcfclk_sta_targets && num_states < DC__VOLTAGE_STATES) {
-			dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
-			dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
-		}
-
-		while (j < num_uclk_states && num_states < DC__VOLTAGE_STATES &&
-				optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
-			dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
-			dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
-		}
-
-		dcn3_2_soc.num_states = num_states;
-		for (i = 0; i < dcn3_2_soc.num_states; i++) {
-			dcn3_2_soc.clock_limits[i].state = i;
-			dcn3_2_soc.clock_limits[i].dcfclk_mhz = dcfclk_mhz[i];
-			dcn3_2_soc.clock_limits[i].fabricclk_mhz = dcfclk_mhz[i];
+			while (i < num_dcfclk_sta_targets && num_states < DC__VOLTAGE_STATES) {
+				dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
+				dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
+			}
 
-			/* Fill all states with max values of all these clocks */
-			dcn3_2_soc.clock_limits[i].dispclk_mhz = max_dispclk_mhz;
-			dcn3_2_soc.clock_limits[i].dppclk_mhz  = max_dppclk_mhz;
-			dcn3_2_soc.clock_limits[i].phyclk_mhz  = max_phyclk_mhz;
-			dcn3_2_soc.clock_limits[i].dscclk_mhz  = max_dispclk_mhz / 3;
+			while (j < num_uclk_states && num_states < DC__VOLTAGE_STATES &&
+					optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
+				dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
+				dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
+			}
 
-			/* Populate from bw_params for DTBCLK, SOCCLK */
-			if (i > 0) {
-				if (!bw_params->clk_table.entries[i].dtbclk_mhz) {
-					dcn3_2_soc.clock_limits[i].dtbclk_mhz  = dcn3_2_soc.clock_limits[i-1].dtbclk_mhz;
-				} else {
+			dcn3_2_soc.num_states = num_states;
+			for (i = 0; i < dcn3_2_soc.num_states; i++) {
+				dcn3_2_soc.clock_limits[i].state = i;
+				dcn3_2_soc.clock_limits[i].dcfclk_mhz = dcfclk_mhz[i];
+				dcn3_2_soc.clock_limits[i].fabricclk_mhz = dcfclk_mhz[i];
+
+				/* Fill all states with max values of all these clocks */
+				dcn3_2_soc.clock_limits[i].dispclk_mhz = max_dispclk_mhz;
+				dcn3_2_soc.clock_limits[i].dppclk_mhz  = max_dppclk_mhz;
+				dcn3_2_soc.clock_limits[i].phyclk_mhz  = max_phyclk_mhz;
+				dcn3_2_soc.clock_limits[i].dscclk_mhz  = max_dispclk_mhz / 3;
+
+				/* Populate from bw_params for DTBCLK, SOCCLK */
+				if (i > 0) {
+					if (!bw_params->clk_table.entries[i].dtbclk_mhz) {
+						dcn3_2_soc.clock_limits[i].dtbclk_mhz  = dcn3_2_soc.clock_limits[i-1].dtbclk_mhz;
+					} else {
+						dcn3_2_soc.clock_limits[i].dtbclk_mhz  = bw_params->clk_table.entries[i].dtbclk_mhz;
+					}
+				} else if (bw_params->clk_table.entries[i].dtbclk_mhz) {
 					dcn3_2_soc.clock_limits[i].dtbclk_mhz  = bw_params->clk_table.entries[i].dtbclk_mhz;
 				}
-			} else if (bw_params->clk_table.entries[i].dtbclk_mhz) {
-				dcn3_2_soc.clock_limits[i].dtbclk_mhz  = bw_params->clk_table.entries[i].dtbclk_mhz;
-			}
 
-			if (!bw_params->clk_table.entries[i].socclk_mhz && i > 0)
-				dcn3_2_soc.clock_limits[i].socclk_mhz = dcn3_2_soc.clock_limits[i-1].socclk_mhz;
-			else
-				dcn3_2_soc.clock_limits[i].socclk_mhz = bw_params->clk_table.entries[i].socclk_mhz;
+				if (!bw_params->clk_table.entries[i].socclk_mhz && i > 0)
+					dcn3_2_soc.clock_limits[i].socclk_mhz = dcn3_2_soc.clock_limits[i-1].socclk_mhz;
+				else
+					dcn3_2_soc.clock_limits[i].socclk_mhz = bw_params->clk_table.entries[i].socclk_mhz;
 
-			if (!dram_speed_mts[i] && i > 0)
-				dcn3_2_soc.clock_limits[i].dram_speed_mts = dcn3_2_soc.clock_limits[i-1].dram_speed_mts;
-			else
-				dcn3_2_soc.clock_limits[i].dram_speed_mts = dram_speed_mts[i];
+				if (!dram_speed_mts[i] && i > 0)
+					dcn3_2_soc.clock_limits[i].dram_speed_mts = dcn3_2_soc.clock_limits[i-1].dram_speed_mts;
+				else
+					dcn3_2_soc.clock_limits[i].dram_speed_mts = dram_speed_mts[i];
 
-			/* These clocks cannot come from bw_params, always fill from dcn3_2_soc[0] */
-			/* PHYCLK_D18, PHYCLK_D32 */
-			dcn3_2_soc.clock_limits[i].phyclk_d18_mhz = dcn3_2_soc.clock_limits[0].phyclk_d18_mhz;
-			dcn3_2_soc.clock_limits[i].phyclk_d32_mhz = dcn3_2_soc.clock_limits[0].phyclk_d32_mhz;
+				/* These clocks cannot come from bw_params, always fill from dcn3_2_soc[0] */
+				/* PHYCLK_D18, PHYCLK_D32 */
+				dcn3_2_soc.clock_limits[i].phyclk_d18_mhz = dcn3_2_soc.clock_limits[0].phyclk_d18_mhz;
+				dcn3_2_soc.clock_limits[i].phyclk_d32_mhz = dcn3_2_soc.clock_limits[0].phyclk_d32_mhz;
+			}
+		} else {
+			build_synthetic_soc_states(bw_params, dcn3_2_soc.clock_limits, &dcn3_2_soc.num_states);
 		}
 
 		/* Re-init DML with updated bb */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
index 1a9bdfc35f2c..81027b780d15 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
@@ -1717,6 +1717,277 @@ static void dcn321_get_optimal_dcfclk_fclk_for_uclk(unsigned int uclk_mts,
 		(dcn3_21_soc.return_bus_width_bytes * (dcn3_21_soc.max_avg_sdp_bw_use_normal_percent / 100));
 }
 
+static void get_optimal_ntuple(struct _vcs_dpi_voltage_scaling_st *entry)
+{
+	if (entry->dcfclk_mhz > 0) {
+		float bw_on_sdp = entry->dcfclk_mhz * dcn3_21_soc.return_bus_width_bytes * ((float)dcn3_21_soc.pct_ideal_sdp_bw_after_urgent / 100);
+
+		entry->fabricclk_mhz = bw_on_sdp / (dcn3_21_soc.return_bus_width_bytes * ((float)dcn3_21_soc.pct_ideal_fabric_bw_after_urgent / 100));
+		entry->dram_speed_mts = bw_on_sdp / (dcn3_21_soc.num_chans *
+				dcn3_21_soc.dram_channel_width_bytes * ((float)dcn3_21_soc.pct_ideal_dram_sdp_bw_after_urgent_pixel_only / 100));
+	} else if (entry->fabricclk_mhz > 0) {
+		float bw_on_fabric = entry->fabricclk_mhz * dcn3_21_soc.return_bus_width_bytes * ((float)dcn3_21_soc.pct_ideal_fabric_bw_after_urgent / 100);
+
+		entry->dcfclk_mhz = bw_on_fabric / (dcn3_21_soc.return_bus_width_bytes * ((float)dcn3_21_soc.pct_ideal_sdp_bw_after_urgent / 100));
+		entry->dram_speed_mts = bw_on_fabric / (dcn3_21_soc.num_chans *
+				dcn3_21_soc.dram_channel_width_bytes * ((float)dcn3_21_soc.pct_ideal_dram_sdp_bw_after_urgent_pixel_only / 100));
+	} else if (entry->dram_speed_mts > 0) {
+		float bw_on_dram = entry->dram_speed_mts * dcn3_21_soc.num_chans *
+				dcn3_21_soc.dram_channel_width_bytes * ((float)dcn3_21_soc.pct_ideal_dram_sdp_bw_after_urgent_pixel_only / 100);
+
+		entry->fabricclk_mhz = bw_on_dram / (dcn3_21_soc.return_bus_width_bytes * ((float)dcn3_21_soc.pct_ideal_fabric_bw_after_urgent / 100));
+		entry->dcfclk_mhz = bw_on_dram / (dcn3_21_soc.return_bus_width_bytes * ((float)dcn3_21_soc.pct_ideal_sdp_bw_after_urgent / 100));
+	}
+}
+
+static float calculate_net_bw_in_kbytes_sec(struct _vcs_dpi_voltage_scaling_st *entry)
+{
+	float memory_bw_kbytes_sec = entry->dram_speed_mts * dcn3_21_soc.num_chans *
+			dcn3_21_soc.dram_channel_width_bytes * ((float)dcn3_21_soc.pct_ideal_dram_sdp_bw_after_urgent_pixel_only / 100);
+
+	float fabric_bw_kbytes_sec = entry->fabricclk_mhz * dcn3_21_soc.return_bus_width_bytes * ((float)dcn3_21_soc.pct_ideal_fabric_bw_after_urgent / 100);
+
+	float sdp_bw_kbytes_sec = entry->dcfclk_mhz * dcn3_21_soc.return_bus_width_bytes * ((float)dcn3_21_soc.pct_ideal_sdp_bw_after_urgent / 100);
+
+	float limiting_bw_kbytes_sec = memory_bw_kbytes_sec;
+
+	if (fabric_bw_kbytes_sec < limiting_bw_kbytes_sec)
+		limiting_bw_kbytes_sec = fabric_bw_kbytes_sec;
+
+	if (sdp_bw_kbytes_sec < limiting_bw_kbytes_sec)
+		limiting_bw_kbytes_sec = sdp_bw_kbytes_sec;
+
+	return limiting_bw_kbytes_sec;
+}
+
+static void insert_entry_into_table_sorted(struct _vcs_dpi_voltage_scaling_st *table, unsigned int *num_entries,
+		struct _vcs_dpi_voltage_scaling_st *entry)
+{
+	int index = 0;
+	int i = 0;
+	float net_bw_of_new_state = 0;
+
+	if (*num_entries == 0) {
+		table[0] = *entry;
+		(*num_entries)++;
+	} else {
+		net_bw_of_new_state = calculate_net_bw_in_kbytes_sec(entry);
+		while (net_bw_of_new_state > calculate_net_bw_in_kbytes_sec(&table[index])) {
+			index++;
+			if (index >= *num_entries)
+				break;
+		}
+
+		for (i = *num_entries; i > index; i--) {
+			table[i] = table[i - 1];
+		}
+
+		table[index] = *entry;
+		(*num_entries)++;
+	}
+}
+
+static void remove_entry_from_table_at_index(struct _vcs_dpi_voltage_scaling_st *table, unsigned int *num_entries,
+		unsigned int index)
+{
+	int i;
+
+	if (*num_entries == 0)
+		return;
+
+	for (i = index; i < *num_entries - 1; i++) {
+		table[i] = table[i + 1];
+	}
+	memset(&table[--(*num_entries)], 0, sizeof(struct _vcs_dpi_voltage_scaling_st));
+}
+
+static int build_synthetic_soc_states(struct clk_bw_params *bw_params,
+		struct _vcs_dpi_voltage_scaling_st *table, unsigned int *num_entries)
+{
+	int i, j;
+	struct _vcs_dpi_voltage_scaling_st entry = {0};
+
+	unsigned int max_dcfclk_mhz = 0, max_dispclk_mhz = 0, max_dppclk_mhz = 0,
+			max_phyclk_mhz = 0, max_dtbclk_mhz = 0, max_fclk_mhz = 0, max_uclk_mhz = 0;
+
+	unsigned int min_dcfclk_mhz = 199, min_fclk_mhz = 299;
+
+	static const unsigned int num_dcfclk_stas = 5;
+	unsigned int dcfclk_sta_targets[DC__VOLTAGE_STATES] = {199, 615, 906, 1324, 1564};
+
+	unsigned int num_uclk_dpms = 0;
+	unsigned int num_fclk_dpms = 0;
+	unsigned int num_dcfclk_dpms = 0;
+
+	for (i = 0; i < MAX_NUM_DPM_LVL; i++) {
+		if (bw_params->clk_table.entries[i].dcfclk_mhz > max_dcfclk_mhz)
+			max_dcfclk_mhz = bw_params->clk_table.entries[i].dcfclk_mhz;
+		if (bw_params->clk_table.entries[i].fclk_mhz > max_fclk_mhz)
+			max_fclk_mhz = bw_params->clk_table.entries[i].fclk_mhz;
+		if (bw_params->clk_table.entries[i].memclk_mhz > max_uclk_mhz)
+			max_uclk_mhz = bw_params->clk_table.entries[i].memclk_mhz;
+		if (bw_params->clk_table.entries[i].dispclk_mhz > max_dispclk_mhz)
+			max_dispclk_mhz = bw_params->clk_table.entries[i].dispclk_mhz;
+		if (bw_params->clk_table.entries[i].dppclk_mhz > max_dppclk_mhz)
+			max_dppclk_mhz = bw_params->clk_table.entries[i].dppclk_mhz;
+		if (bw_params->clk_table.entries[i].phyclk_mhz > max_phyclk_mhz)
+			max_phyclk_mhz = bw_params->clk_table.entries[i].phyclk_mhz;
+		if (bw_params->clk_table.entries[i].dtbclk_mhz > max_dtbclk_mhz)
+			max_dtbclk_mhz = bw_params->clk_table.entries[i].dtbclk_mhz;
+
+		if (bw_params->clk_table.entries[i].memclk_mhz > 0)
+			num_uclk_dpms++;
+		if (bw_params->clk_table.entries[i].fclk_mhz > 0)
+			num_fclk_dpms++;
+		if (bw_params->clk_table.entries[i].dcfclk_mhz > 0)
+			num_dcfclk_dpms++;
+	}
+
+	if (!max_dcfclk_mhz || !max_dispclk_mhz || !max_dtbclk_mhz)
+		return -1;
+
+	if (max_dppclk_mhz == 0)
+		max_dppclk_mhz = max_dispclk_mhz;
+
+	if (max_fclk_mhz == 0)
+		max_fclk_mhz = max_dcfclk_mhz * dcn3_21_soc.pct_ideal_sdp_bw_after_urgent / dcn3_21_soc.pct_ideal_fabric_bw_after_urgent;
+
+	if (max_phyclk_mhz == 0)
+		max_phyclk_mhz = dcn3_21_soc.clock_limits[0].phyclk_mhz;
+
+	*num_entries = 0;
+	entry.dispclk_mhz = max_dispclk_mhz;
+	entry.dscclk_mhz = max_dispclk_mhz / 3;
+	entry.dppclk_mhz = max_dppclk_mhz;
+	entry.dtbclk_mhz = max_dtbclk_mhz;
+	entry.phyclk_mhz = max_phyclk_mhz;
+	entry.phyclk_d18_mhz = dcn3_21_soc.clock_limits[0].phyclk_d18_mhz;
+	entry.phyclk_d32_mhz = dcn3_21_soc.clock_limits[0].phyclk_d32_mhz;
+
+	// Insert all the DCFCLK STAs
+	for (i = 0; i < num_dcfclk_stas; i++) {
+		entry.dcfclk_mhz = dcfclk_sta_targets[i];
+		entry.fabricclk_mhz = 0;
+		entry.dram_speed_mts = 0;
+
+		get_optimal_ntuple(&entry);
+		insert_entry_into_table_sorted(table, num_entries, &entry);
+	}
+
+	// Insert the max DCFCLK
+	entry.dcfclk_mhz = max_dcfclk_mhz;
+	entry.fabricclk_mhz = 0;
+	entry.dram_speed_mts = 0;
+
+	get_optimal_ntuple(&entry);
+	insert_entry_into_table_sorted(table, num_entries, &entry);
+
+	// Insert the UCLK DPMS
+	for (i = 0; i < num_uclk_dpms; i++) {
+		entry.dcfclk_mhz = 0;
+		entry.fabricclk_mhz = 0;
+		entry.dram_speed_mts = bw_params->clk_table.entries[i].memclk_mhz * 16;
+
+		get_optimal_ntuple(&entry);
+		insert_entry_into_table_sorted(table, num_entries, &entry);
+	}
+
+	// If FCLK is coarse grained, insert individual DPMs.
+	if (num_fclk_dpms > 2) {
+		for (i = 0; i < num_fclk_dpms; i++) {
+			entry.dcfclk_mhz = 0;
+			entry.fabricclk_mhz = bw_params->clk_table.entries[i].fclk_mhz;
+			entry.dram_speed_mts = 0;
+
+			get_optimal_ntuple(&entry);
+			insert_entry_into_table_sorted(table, num_entries, &entry);
+		}
+	}
+	// If FCLK fine grained, only insert max
+	else {
+		entry.dcfclk_mhz = 0;
+		entry.fabricclk_mhz = max_fclk_mhz;
+		entry.dram_speed_mts = 0;
+
+		get_optimal_ntuple(&entry);
+		insert_entry_into_table_sorted(table, num_entries, &entry);
+	}
+
+	// At this point, the table contains all "points of interest" based on
+	// DPMs from PMFW, and STAs.  Table is sorted by BW, and all clock
+	// ratios (by derate, are exact).
+
+	// Remove states that require higher clocks than are supported
+	for (i = *num_entries - 1; i >= 0 ; i--) {
+		if (table[i].dcfclk_mhz > max_dcfclk_mhz ||
+				table[i].fabricclk_mhz > max_fclk_mhz ||
+				table[i].dram_speed_mts > max_uclk_mhz * 16)
+			remove_entry_from_table_at_index(table, num_entries, i);
+	}
+
+	// At this point, the table only contains supported points of interest
+	// it could be used as is, but some states may be redundant due to
+	// coarse grained nature of some clocks, so we want to round up to
+	// coarse grained DPMs and remove duplicates.
+
+	// Round up UCLKs
+	for (i = *num_entries - 1; i >= 0 ; i--) {
+		for (j = 0; j < num_uclk_dpms; j++) {
+			if (bw_params->clk_table.entries[j].memclk_mhz * 16 >= table[i].dram_speed_mts) {
+				table[i].dram_speed_mts = bw_params->clk_table.entries[j].memclk_mhz * 16;
+				break;
+			}
+		}
+	}
+
+	// If FCLK is coarse grained, round up to next DPMs
+	if (num_fclk_dpms > 2) {
+		for (i = *num_entries - 1; i >= 0 ; i--) {
+			for (j = 0; j < num_fclk_dpms; j++) {
+				if (bw_params->clk_table.entries[j].fclk_mhz >= table[i].fabricclk_mhz) {
+					table[i].fabricclk_mhz = bw_params->clk_table.entries[j].fclk_mhz;
+					break;
+				}
+			}
+		}
+	}
+	// Otherwise, round up to minimum.
+	else {
+		for (i = *num_entries - 1; i >= 0 ; i--) {
+			if (table[i].fabricclk_mhz < min_fclk_mhz) {
+				table[i].fabricclk_mhz = min_fclk_mhz;
+				break;
+			}
+		}
+	}
+
+	// Round DCFCLKs up to minimum
+	for (i = *num_entries - 1; i >= 0 ; i--) {
+		if (table[i].dcfclk_mhz < min_dcfclk_mhz) {
+			table[i].dcfclk_mhz = min_dcfclk_mhz;
+			break;
+		}
+	}
+
+	// Remove duplicate states, note duplicate states are always neighbouring since table is sorted.
+	i = 0;
+	while (i < *num_entries - 1) {
+		if (table[i].dcfclk_mhz == table[i + 1].dcfclk_mhz &&
+				table[i].fabricclk_mhz == table[i + 1].fabricclk_mhz &&
+				table[i].dram_speed_mts == table[i + 1].dram_speed_mts)
+			remove_entry_from_table_at_index(table, num_entries, i + 1);
+		else
+			i++;
+	}
+
+	// Fix up the state indicies
+	for (i = *num_entries - 1; i >= 0 ; i--) {
+		table[i].state = i;
+	}
+
+	return 0;
+}
+
 /* dcn321_update_bw_bounding_box
  * This would override some dcn3_2 ip_or_soc initial parameters hardcoded from spreadsheet
  * with actual values as per dGPU SKU:
@@ -1797,139 +2068,143 @@ static void dcn321_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *b
 
 	/* Overrides Clock levelsfrom CLK Mgr table entries as reported by PM FW */
 	if ((!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) && (bw_params->clk_table.entries[0].memclk_mhz)) {
-		unsigned int i = 0, j = 0, num_states = 0;
-
-		unsigned int dcfclk_mhz[DC__VOLTAGE_STATES] = {0};
-		unsigned int dram_speed_mts[DC__VOLTAGE_STATES] = {0};
-		unsigned int optimal_uclk_for_dcfclk_sta_targets[DC__VOLTAGE_STATES] = {0};
-		unsigned int optimal_dcfclk_for_uclk[DC__VOLTAGE_STATES] = {0};
-
-		unsigned int dcfclk_sta_targets[DC__VOLTAGE_STATES] = {615, 906, 1324, 1564};
-		unsigned int num_dcfclk_sta_targets = 4, num_uclk_states = 0;
-		unsigned int max_dcfclk_mhz = 0, max_dispclk_mhz = 0, max_dppclk_mhz = 0, max_phyclk_mhz = 0;
-
-		for (i = 0; i < MAX_NUM_DPM_LVL; i++) {
-			if (bw_params->clk_table.entries[i].dcfclk_mhz > max_dcfclk_mhz)
-				max_dcfclk_mhz = bw_params->clk_table.entries[i].dcfclk_mhz;
-			if (bw_params->clk_table.entries[i].dispclk_mhz > max_dispclk_mhz)
-				max_dispclk_mhz = bw_params->clk_table.entries[i].dispclk_mhz;
-			if (bw_params->clk_table.entries[i].dppclk_mhz > max_dppclk_mhz)
-				max_dppclk_mhz = bw_params->clk_table.entries[i].dppclk_mhz;
-			if (bw_params->clk_table.entries[i].phyclk_mhz > max_phyclk_mhz)
-				max_phyclk_mhz = bw_params->clk_table.entries[i].phyclk_mhz;
-		}
-		if (!max_dcfclk_mhz)
-			max_dcfclk_mhz = dcn3_21_soc.clock_limits[0].dcfclk_mhz;
-		if (!max_dispclk_mhz)
-			max_dispclk_mhz = dcn3_21_soc.clock_limits[0].dispclk_mhz;
-		if (!max_dppclk_mhz)
-			max_dppclk_mhz = dcn3_21_soc.clock_limits[0].dppclk_mhz;
-		if (!max_phyclk_mhz)
-			max_phyclk_mhz = dcn3_21_soc.clock_limits[0].phyclk_mhz;
-
-		if (max_dcfclk_mhz > dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
-			// If max DCFCLK is greater than the max DCFCLK STA target, insert into the DCFCLK STA target array
-			dcfclk_sta_targets[num_dcfclk_sta_targets] = max_dcfclk_mhz;
-			num_dcfclk_sta_targets++;
-		} else if (max_dcfclk_mhz < dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
-			// If max DCFCLK is less than the max DCFCLK STA target, cap values and remove duplicates
-			for (i = 0; i < num_dcfclk_sta_targets; i++) {
-				if (dcfclk_sta_targets[i] > max_dcfclk_mhz) {
-					dcfclk_sta_targets[i] = max_dcfclk_mhz;
-					break;
+		if (dc->debug.use_legacy_soc_bb_mechanism) {
+			unsigned int i = 0, j = 0, num_states = 0;
+
+			unsigned int dcfclk_mhz[DC__VOLTAGE_STATES] = {0};
+			unsigned int dram_speed_mts[DC__VOLTAGE_STATES] = {0};
+			unsigned int optimal_uclk_for_dcfclk_sta_targets[DC__VOLTAGE_STATES] = {0};
+			unsigned int optimal_dcfclk_for_uclk[DC__VOLTAGE_STATES] = {0};
+
+			unsigned int dcfclk_sta_targets[DC__VOLTAGE_STATES] = {615, 906, 1324, 1564};
+			unsigned int num_dcfclk_sta_targets = 4, num_uclk_states = 0;
+			unsigned int max_dcfclk_mhz = 0, max_dispclk_mhz = 0, max_dppclk_mhz = 0, max_phyclk_mhz = 0;
+
+			for (i = 0; i < MAX_NUM_DPM_LVL; i++) {
+				if (bw_params->clk_table.entries[i].dcfclk_mhz > max_dcfclk_mhz)
+					max_dcfclk_mhz = bw_params->clk_table.entries[i].dcfclk_mhz;
+				if (bw_params->clk_table.entries[i].dispclk_mhz > max_dispclk_mhz)
+					max_dispclk_mhz = bw_params->clk_table.entries[i].dispclk_mhz;
+				if (bw_params->clk_table.entries[i].dppclk_mhz > max_dppclk_mhz)
+					max_dppclk_mhz = bw_params->clk_table.entries[i].dppclk_mhz;
+				if (bw_params->clk_table.entries[i].phyclk_mhz > max_phyclk_mhz)
+					max_phyclk_mhz = bw_params->clk_table.entries[i].phyclk_mhz;
+			}
+			if (!max_dcfclk_mhz)
+				max_dcfclk_mhz = dcn3_21_soc.clock_limits[0].dcfclk_mhz;
+			if (!max_dispclk_mhz)
+				max_dispclk_mhz = dcn3_21_soc.clock_limits[0].dispclk_mhz;
+			if (!max_dppclk_mhz)
+				max_dppclk_mhz = dcn3_21_soc.clock_limits[0].dppclk_mhz;
+			if (!max_phyclk_mhz)
+				max_phyclk_mhz = dcn3_21_soc.clock_limits[0].phyclk_mhz;
+
+			if (max_dcfclk_mhz > dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
+				// If max DCFCLK is greater than the max DCFCLK STA target, insert into the DCFCLK STA target array
+				dcfclk_sta_targets[num_dcfclk_sta_targets] = max_dcfclk_mhz;
+				num_dcfclk_sta_targets++;
+			} else if (max_dcfclk_mhz < dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
+				// If max DCFCLK is less than the max DCFCLK STA target, cap values and remove duplicates
+				for (i = 0; i < num_dcfclk_sta_targets; i++) {
+					if (dcfclk_sta_targets[i] > max_dcfclk_mhz) {
+						dcfclk_sta_targets[i] = max_dcfclk_mhz;
+						break;
+					}
 				}
+				// Update size of array since we "removed" duplicates
+				num_dcfclk_sta_targets = i + 1;
 			}
-			// Update size of array since we "removed" duplicates
-			num_dcfclk_sta_targets = i + 1;
-		}
 
-		num_uclk_states = bw_params->clk_table.num_entries;
+			num_uclk_states = bw_params->clk_table.num_entries;
 
-		// Calculate optimal dcfclk for each uclk
-		for (i = 0; i < num_uclk_states; i++) {
-			dcn321_get_optimal_dcfclk_fclk_for_uclk(bw_params->clk_table.entries[i].memclk_mhz * 16,
-					&optimal_dcfclk_for_uclk[i], NULL);
-			if (optimal_dcfclk_for_uclk[i] < bw_params->clk_table.entries[0].dcfclk_mhz) {
-				optimal_dcfclk_for_uclk[i] = bw_params->clk_table.entries[0].dcfclk_mhz;
+			// Calculate optimal dcfclk for each uclk
+			for (i = 0; i < num_uclk_states; i++) {
+				dcn321_get_optimal_dcfclk_fclk_for_uclk(bw_params->clk_table.entries[i].memclk_mhz * 16,
+						&optimal_dcfclk_for_uclk[i], NULL);
+				if (optimal_dcfclk_for_uclk[i] < bw_params->clk_table.entries[0].dcfclk_mhz) {
+					optimal_dcfclk_for_uclk[i] = bw_params->clk_table.entries[0].dcfclk_mhz;
+				}
 			}
-		}
 
-		// Calculate optimal uclk for each dcfclk sta target
-		for (i = 0; i < num_dcfclk_sta_targets; i++) {
-			for (j = 0; j < num_uclk_states; j++) {
-				if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j]) {
-					optimal_uclk_for_dcfclk_sta_targets[i] =
-							bw_params->clk_table.entries[j].memclk_mhz * 16;
-					break;
+			// Calculate optimal uclk for each dcfclk sta target
+			for (i = 0; i < num_dcfclk_sta_targets; i++) {
+				for (j = 0; j < num_uclk_states; j++) {
+					if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j]) {
+						optimal_uclk_for_dcfclk_sta_targets[i] =
+								bw_params->clk_table.entries[j].memclk_mhz * 16;
+						break;
+					}
 				}
 			}
-		}
 
-		i = 0;
-		j = 0;
-		// create the final dcfclk and uclk table
-		while (i < num_dcfclk_sta_targets && j < num_uclk_states && num_states < DC__VOLTAGE_STATES) {
-			if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j] && i < num_dcfclk_sta_targets) {
-				dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
-				dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
-			} else {
-				if (j < num_uclk_states && optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
-					dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
-					dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
+			i = 0;
+			j = 0;
+			// create the final dcfclk and uclk table
+			while (i < num_dcfclk_sta_targets && j < num_uclk_states && num_states < DC__VOLTAGE_STATES) {
+				if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j] && i < num_dcfclk_sta_targets) {
+					dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
+					dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
 				} else {
-					j = num_uclk_states;
+					if (j < num_uclk_states && optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
+						dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
+						dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
+					} else {
+						j = num_uclk_states;
+					}
 				}
 			}
-		}
 
-		while (i < num_dcfclk_sta_targets && num_states < DC__VOLTAGE_STATES) {
-			dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
-			dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
-		}
+			while (i < num_dcfclk_sta_targets && num_states < DC__VOLTAGE_STATES) {
+				dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
+				dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
+			}
 
-		while (j < num_uclk_states && num_states < DC__VOLTAGE_STATES &&
-				optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
-			dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
-			dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
-		}
+			while (j < num_uclk_states && num_states < DC__VOLTAGE_STATES &&
+					optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
+				dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
+				dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
+			}
 
-		dcn3_21_soc.num_states = num_states;
-		for (i = 0; i < dcn3_21_soc.num_states; i++) {
-			dcn3_21_soc.clock_limits[i].state = i;
-			dcn3_21_soc.clock_limits[i].dcfclk_mhz = dcfclk_mhz[i];
-			dcn3_21_soc.clock_limits[i].fabricclk_mhz = dcfclk_mhz[i];
-
-			/* Fill all states with max values of all these clocks */
-			dcn3_21_soc.clock_limits[i].dispclk_mhz = max_dispclk_mhz;
-			dcn3_21_soc.clock_limits[i].dppclk_mhz  = max_dppclk_mhz;
-			dcn3_21_soc.clock_limits[i].phyclk_mhz  = max_phyclk_mhz;
-			dcn3_21_soc.clock_limits[i].dscclk_mhz  = max_dispclk_mhz / 3;
-
-			/* Populate from bw_params for DTBCLK, SOCCLK */
-			if (i > 0) {
-				if (!bw_params->clk_table.entries[i].dtbclk_mhz) {
-					dcn3_21_soc.clock_limits[i].dtbclk_mhz = dcn3_21_soc.clock_limits[i-1].dtbclk_mhz;
-				} else {
-					dcn3_21_soc.clock_limits[i].dtbclk_mhz = bw_params->clk_table.entries[i].dtbclk_mhz;
+			dcn3_21_soc.num_states = num_states;
+			for (i = 0; i < dcn3_21_soc.num_states; i++) {
+				dcn3_21_soc.clock_limits[i].state = i;
+				dcn3_21_soc.clock_limits[i].dcfclk_mhz = dcfclk_mhz[i];
+				dcn3_21_soc.clock_limits[i].fabricclk_mhz = dcfclk_mhz[i];
+
+				/* Fill all states with max values of all these clocks */
+				dcn3_21_soc.clock_limits[i].dispclk_mhz = max_dispclk_mhz;
+				dcn3_21_soc.clock_limits[i].dppclk_mhz  = max_dppclk_mhz;
+				dcn3_21_soc.clock_limits[i].phyclk_mhz  = max_phyclk_mhz;
+				dcn3_21_soc.clock_limits[i].dscclk_mhz  = max_dispclk_mhz / 3;
+
+				/* Populate from bw_params for DTBCLK, SOCCLK */
+				if (i > 0) {
+					if (!bw_params->clk_table.entries[i].dtbclk_mhz) {
+						dcn3_21_soc.clock_limits[i].dtbclk_mhz  = dcn3_21_soc.clock_limits[i-1].dtbclk_mhz;
+					} else {
+						dcn3_21_soc.clock_limits[i].dtbclk_mhz  = bw_params->clk_table.entries[i].dtbclk_mhz;
+					}
+				} else if (bw_params->clk_table.entries[i].dtbclk_mhz) {
+					dcn3_21_soc.clock_limits[i].dtbclk_mhz  = bw_params->clk_table.entries[i].dtbclk_mhz;
 				}
-			} else if (bw_params->clk_table.entries[i].dtbclk_mhz) {
-				dcn3_21_soc.clock_limits[i].dtbclk_mhz  = bw_params->clk_table.entries[i].dtbclk_mhz;
-			}
 
-			if (!bw_params->clk_table.entries[i].socclk_mhz && i > 0)
-				dcn3_21_soc.clock_limits[i].socclk_mhz = dcn3_21_soc.clock_limits[i-1].socclk_mhz;
-			else
-				dcn3_21_soc.clock_limits[i].socclk_mhz = bw_params->clk_table.entries[i].socclk_mhz;
+				if (!bw_params->clk_table.entries[i].socclk_mhz && i > 0)
+					dcn3_21_soc.clock_limits[i].socclk_mhz = dcn3_21_soc.clock_limits[i-1].socclk_mhz;
+				else
+					dcn3_21_soc.clock_limits[i].socclk_mhz = bw_params->clk_table.entries[i].socclk_mhz;
 
-			if (!dram_speed_mts[i] && i > 0)
-				dcn3_21_soc.clock_limits[i].dram_speed_mts = dcn3_21_soc.clock_limits[i-1].dram_speed_mts;
-			else
-				dcn3_21_soc.clock_limits[i].dram_speed_mts = dram_speed_mts[i];
+				if (!dram_speed_mts[i] && i > 0)
+					dcn3_21_soc.clock_limits[i].dram_speed_mts = dcn3_21_soc.clock_limits[i-1].dram_speed_mts;
+				else
+					dcn3_21_soc.clock_limits[i].dram_speed_mts = dram_speed_mts[i];
 
-			/* These clocks cannot come from bw_params, always fill from dcn3_21_soc[0] */
-			/* PHYCLK_D18, PHYCLK_D32 */
-			dcn3_21_soc.clock_limits[i].phyclk_d18_mhz = dcn3_21_soc.clock_limits[0].phyclk_d18_mhz;
-			dcn3_21_soc.clock_limits[i].phyclk_d32_mhz = dcn3_21_soc.clock_limits[0].phyclk_d32_mhz;
+				/* These clocks cannot come from bw_params, always fill from dcn3_21_soc[0] */
+				/* PHYCLK_D18, PHYCLK_D32 */
+				dcn3_21_soc.clock_limits[i].phyclk_d18_mhz = dcn3_21_soc.clock_limits[0].phyclk_d18_mhz;
+				dcn3_21_soc.clock_limits[i].phyclk_d32_mhz = dcn3_21_soc.clock_limits[0].phyclk_d32_mhz;
+			}
+		} else {
+			build_synthetic_soc_states(bw_params, dcn3_21_soc.clock_limits, &dcn3_21_soc.num_states);
 		}
 
 		/* Re-init DML with updated bb */
-- 
2.25.1

