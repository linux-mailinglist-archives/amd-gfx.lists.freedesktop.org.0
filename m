Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADA98240F6
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jan 2024 12:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24AE10E467;
	Thu,  4 Jan 2024 11:49:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E988F10E464
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jan 2024 11:49:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ar8iUR7ex8HB+NPR9yrIGFMbshBteDoqibc17X++Dwe452ryWrMVZiHuWhuRJ7MdWaDEVglZIC20Wd/KLI7sUQY3Tn0XFHAHpDvaDd3wEmCH6N0MfJvffTCdMMkLaj/Mv4LFyK7dDEDOQGBRrwWfyOPLB8Tjj8s+hnQicxWc/kNP2tlaDS6FThSGfO2gWE3qrZpA1SXju7axlVy0ssjngA03W86uZ1HolkPsc9UkPRhkSUTfzEKn3zSwaDaQo1Q1Fsl0kGEdQQgDoqtQnTJkrsEgm+jM9gUgQcNWqa+ihqtHR2njWLJidUSMCOuveSktqtYVFCiJU4Ly0tuzuB0dUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEJpS1KE6cPc6i+zL4aISrJhDFHkG+PZmPZSS0jHafo=;
 b=EPnN8lVxKYB1uenDMcAIyopEip3qIdB/UBmXlj2chtHcLvqt+ZmGvaquBe0uErjtZR7mgWLCk8G5USlY2RvesG2htMgfRvNBvnoUV/Naecn8iORbhSOpgmvjntTJ5rp6wfGOC9Vws0YM5gyW9NoW3N4TDlVYIuAQ9Eu5G09Xb21iJdKr2kVJnGWjIDa5338tb8THZq4BjXxQzcL+C2zSa7PV003tVp6J//gFHX01EOtzc/CJzMFmcmvD1WQQVdTV2upjidXUnPTXoPh8tGD8Zq5Z1IxQpqXV0U1+o07W45NH6nQ+LFdj90G85PWwZLG6fnlKQ6MO3uc7Zus6NGkJqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEJpS1KE6cPc6i+zL4aISrJhDFHkG+PZmPZSS0jHafo=;
 b=YuZhvhrWyWvo3j69/xpwoHfFJS3hqKSSHo0tWA//4dIFKapoKX/1LdxzzkTAMBq3KzPFWq6guMnPRdqtW5sNob4+peGBcUl4lwM6bMHwO314vV1UXKYSP4MIUOHMW3Ho8CqIoo757g6dYZHfcr4Y8QuJsnssIDTWR3H/02kHl+g=
Received: from SJ0PR05CA0201.namprd05.prod.outlook.com (2603:10b6:a03:330::26)
 by DM6PR12MB5024.namprd12.prod.outlook.com (2603:10b6:5:20a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Thu, 4 Jan
 2024 11:49:43 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::c0) by SJ0PR05CA0201.outlook.office365.com
 (2603:10b6:a03:330::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15 via Frontend
 Transport; Thu, 4 Jan 2024 11:49:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Thu, 4 Jan 2024 11:49:43 +0000
Received: from kevin-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 4 Jan
 2024 05:49:41 -0600
From: Yang Wang <kevinyang.wang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 12/12] drm/amdgpu: replace MCA macro with ACA for XGMI
Date: Thu, 4 Jan 2024 19:48:58 +0800
Message-ID: <20240104114858.3475783-13-kevinyang.wang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240104114858.3475783-1-kevinyang.wang@amd.com>
References: <20240104114858.3475783-1-kevinyang.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|DM6PR12MB5024:EE_
X-MS-Office365-Filtering-Correlation-Id: 3082a506-3aa3-4a7b-1fd7-08dc0d1b3e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: svhPII9h+7c+/oTtAk262DxaN6NMHl+2CAgiKhbpc+82JmhBKaVnQlHEBJDQHQtQ8gyCf/Z0WK7AncaYIHgtpa2DhWPXeXFUK1Ezcal5bfbo1e83I/m/mUAXt7YuJKih7QYHUUiT0N6+EjRQ0Z5rXKO9pbklgkw/JICk2shtGtqTCtPqY4SFBKJrD++DqNedv5j0WNmM/y/HG12H6ejb0kStSghY0BJ7WY4url1ECXxM6Fi+5CCXnHwSNfQxbrkHQTvf46HXGWpqsgH0GVVtxhPUI2rIspv4XoZQNunBS+6wkthbTUPHzTkJq9qhVA+v5LNz4niDgUfqtBRIzpiDf3uIJaK3gdXyTJJ0W/QP4CaWr3tSs0vIw5eX/TWisjqbjJlZjXrL8Yr2FOI1rFqibB+gJGgDd7+XvGeE7mzHORIMB6/a0PFmaXxjzro8H6G6imayqE0vTcU4YA5h0vAH3ibGp4e+93JfQuBNmerQziLWclRniVb5g8dBDJIreRI6/M1M5a6BGbeljFeAI+Pu133bfYMG0j+IKe5fqBqT60LUrOz8Pf75khxvhWq4QgSLdCQMrh3JM7meCCnio0pnet8gee/K0q2OZmQJU3OHgdgJ/BnnS50plaRfHicINOlkU6O94vRm6FCS/rfZ7T+MuwyoSDHjUkq6QXNr4yffP2/xQv2kqJCXbO6Okk0VqJNta6eiJG+XL47sQzdDPyel3WqK+4eyue0e3mLgN94a+C8XVZydYM8cjd076t3M5i4YEZ6c2FUe+I84A5pB+NxZcg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(1800799012)(64100799003)(82310400011)(451199024)(186009)(36840700001)(40470700004)(46966006)(7696005)(426003)(26005)(336012)(6666004)(478600001)(1076003)(83380400001)(47076005)(16526019)(2906002)(5660300002)(41300700001)(54906003)(70206006)(70586007)(316002)(6916009)(8936002)(8676002)(4326008)(82740400003)(36860700001)(2616005)(36756003)(86362001)(356005)(81166007)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 11:49:43.4031 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3082a506-3aa3-4a7b-1fd7-08dc0d1b3e03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5024
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
Cc: yipeng.chai@amd.com, tao.zhou1@amd.com, Yang
 Wang <kevinyang.wang@amd.com>, hawking.zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

use new ACA macro to instead of MCA

Signed-off-by: Yang Wang <kevinyang.wang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 61208ca94442..dcfa02d17d3c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -1047,8 +1047,8 @@ static int xgmi_v6_4_0_aca_bank_generate_report(struct aca_handle *handle, struc
 	if (ret)
 		return ret;
 
-	status = bank->regs[MCA_REG_IDX_STATUS];
-	ext_error_code = MCA_REG__STATUS__ERRORCODEEXT(status);
+	status = bank->regs[ACA_REG_IDX_STATUS];
+	ext_error_code = ACA_REG__STATUS__ERRORCODEEXT(status);
 
 	error_str = ext_error_code < ARRAY_SIZE(xgmi_v6_4_0_ras_error_code_ext) ?
 		xgmi_v6_4_0_ras_error_code_ext[ext_error_code] : NULL;
@@ -1160,7 +1160,7 @@ static void amdgpu_xgmi_legacy_reset_ras_error_count(struct amdgpu_device *adev)
 
 static void __xgmi_v6_4_0_reset_error_count(struct amdgpu_device *adev, int xgmi_inst, u64 mca_base)
 {
-	WREG64_MCA(xgmi_inst, mca_base, MCA_REG_IDX_STATUS, 0ULL);
+	WREG64_MCA(xgmi_inst, mca_base, ACA_REG_IDX_STATUS, 0ULL);
 }
 
 static void xgmi_v6_4_0_reset_error_count(struct amdgpu_device *adev, int xgmi_inst)
@@ -1338,12 +1338,12 @@ static void amdgpu_xgmi_legacy_query_ras_error_count(struct amdgpu_device *adev,
 	err_data->ce_count += ce_cnt;
 }
 
-static enum amdgpu_mca_error_type xgmi_v6_4_0_pcs_mca_get_error_type(struct amdgpu_device *adev, u64 status)
+static enum aca_error_type xgmi_v6_4_0_pcs_mca_get_error_type(struct amdgpu_device *adev, u64 status)
 {
 	const char *error_str;
 	int ext_error_code;
 
-	ext_error_code = MCA_REG__STATUS__ERRORCODEEXT(status);
+	ext_error_code = ACA_REG__STATUS__ERRORCODEEXT(status);
 
 	error_str = ext_error_code < ARRAY_SIZE(xgmi_v6_4_0_ras_error_code_ext) ?
 		xgmi_v6_4_0_ras_error_code_ext[ext_error_code] : NULL;
@@ -1352,9 +1352,9 @@ static enum amdgpu_mca_error_type xgmi_v6_4_0_pcs_mca_get_error_type(struct amdg
 
 	switch (ext_error_code) {
 	case 0:
-		return AMDGPU_MCA_ERROR_TYPE_UE;
+		return ACA_ERROR_TYPE_UE;
 	case 6:
-		return AMDGPU_MCA_ERROR_TYPE_CE;
+		return ACA_ERROR_TYPE_CE;
 	default:
 		return -EINVAL;
 	}
@@ -1368,22 +1368,22 @@ static void __xgmi_v6_4_0_query_error_count(struct amdgpu_device *adev, struct a
 	int xgmi_inst = mcm_info->die_id;
 	u64 status = 0;
 
-	status = RREG64_MCA(xgmi_inst, mca_base, MCA_REG_IDX_STATUS);
-	if (!MCA_REG__STATUS__VAL(status))
+	status = RREG64_MCA(xgmi_inst, mca_base, ACA_REG_IDX_STATUS);
+	if (!ACA_REG__STATUS__VAL(status))
 		return;
 
 	switch (xgmi_v6_4_0_pcs_mca_get_error_type(adev, status)) {
-	case AMDGPU_MCA_ERROR_TYPE_UE:
+	case ACA_ERROR_TYPE_UE:
 		amdgpu_ras_error_statistic_ue_count(err_data, mcm_info, NULL, 1ULL);
 		break;
-	case AMDGPU_MCA_ERROR_TYPE_CE:
+	case ACA_ERROR_TYPE_CE:
 		amdgpu_ras_error_statistic_ce_count(err_data, mcm_info, NULL, 1ULL);
 		break;
 	default:
 		break;
 	}
 
-	WREG64_MCA(xgmi_inst, mca_base, MCA_REG_IDX_STATUS, 0ULL);
+	WREG64_MCA(xgmi_inst, mca_base, ACA_REG_IDX_STATUS, 0ULL);
 }
 
 static void xgmi_v6_4_0_query_error_count(struct amdgpu_device *adev, int xgmi_inst, struct ras_err_data *err_data)
-- 
2.34.1

