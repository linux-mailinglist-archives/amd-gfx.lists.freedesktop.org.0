Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5436C4139B7
	for <lists+amd-gfx@lfdr.de>; Tue, 21 Sep 2021 20:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8A76EAAE;
	Tue, 21 Sep 2021 18:08:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2052.outbound.protection.outlook.com [40.107.95.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559B66EA7F
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Sep 2021 18:08:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZlPwuK7DB6VG7RK/etq/1prbF3gWoiA+Kz0r4WzaZv5hmUFqDCoakSchZTEY+1FNT2JZMFPxH+KEcs1YZjpdKBkpjOmbIUQBXGkuYJpYHBXyUlRedDXYarY86FxurLP4U06rTU6iogreZFWUSC06/OLm2scXfqgLSD2cTqQfDbdwWvPMyBvnwM4X+TiPtiU930a3sswyQCeS0DlGdxxPMrd8zkkS04MkW5Bp9zmjoiCvdX4qLau8K8yRBqZUQlZ4dcrca60Rrr49+X4E+BJfM9kAZTcDpcYi0ga5IoOeEt3TEXaJ6eGd4JhFkkVvBmmoG3NvQNUa13+bY1Csac9Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=NYAF6l3TzVx2XDhqLBgjfgHfD+9LPS2GIS5Codivq7o=;
 b=Khg4zhkVPxYmSAqpzTZW76jPSxCfB/YfNRnNagoO2olxOUcEwBL9cnMZvD49hfKQ/xUWvf1Cthw1KqFiidWMfQkjRBputx8n/uKhbpY3Ia+pPG6v/4T7KyQMU8+seMmJqihj1/kdS8P4WGt/W8/+jofAYNgLuZtXzs3+sd7EfYUTun1ZDJNtE17UJj7cM9nPCZVNwBuCLlaJm4Yu/ZOZZD4CfOAO5XVucJLLSj/Vot+eVLoUhrK/thhYT1Zzfa7aYfBapAKEsWJ4OchzD3HXtCBdnGaF0eZ8SThuCgA/a6McaUlNrL77TcuP2dfKy/HCotellZFPhlNIpYN1kFkJcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYAF6l3TzVx2XDhqLBgjfgHfD+9LPS2GIS5Codivq7o=;
 b=sYyLxyYi8mzll4JcjEPjKZo8bFvpflKv2UAyCHe5IBH3Kjvqm/9gS35xXKECZuvqZ0iyxXSDafpCwHVWMdSJb6dR+KsdpiXNxQMUNNfvVz509XMllE8QarhnnUkVb5OaK++OTjIU7DEhUf6s0aQvDdAaK7X4iSMNZb790CkJTvk=
Received: from DM3PR12CA0066.namprd12.prod.outlook.com (2603:10b6:0:56::34) by
 BYAPR12MB2775.namprd12.prod.outlook.com (2603:10b6:a03:6b::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.18; Tue, 21 Sep 2021 18:08:04 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:56:cafe::84) by DM3PR12CA0066.outlook.office365.com
 (2603:10b6:0:56::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 21 Sep 2021 18:08:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Tue, 21 Sep 2021 18:08:04 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 21 Sep
 2021 13:08:02 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 49/66] drm/amdgpu/soc15: convert to IP version checking
Date: Tue, 21 Sep 2021 14:07:08 -0400
Message-ID: <20210921180725.1985552-50-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921180725.1985552-1-alexander.deucher@amd.com>
References: <20210921180725.1985552-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab0ff69d-b2fc-4977-67f5-08d97d2ac1cf
X-MS-TrafficTypeDiagnostic: BYAPR12MB2775:
X-Microsoft-Antispam-PRVS: <BYAPR12MB27758C0FFC8A3C7E8930A8DFF7A19@BYAPR12MB2775.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7DyGwyddZ6SYYGzsEfg0EkcfaQcFNOfBox5CeFheI8VzGYdWnSvlZjiv0Y57Gn/zX5MAlie9XuBalMhGey/2D4BKw7hwsMogffXwKDUZQvS23dV5hzDTsFiXfB/G5X2Q3UTb+po04cOm/3gYpm8AcFvIphr/VA2Ob85sSKPdQb+y4ldJFPXBEDnnJ3qg55MrcffX8BwV/ya0HHtQRABng8f1z1sPbyNvDgJq3/C0xvDHO3gjsEL8jHAfnc7Z1PLQK6k7aTzl6FGf5EIdwSCfuHWhPTAEJwoxcnk2q1oZp2yX5LcaA49x4U+LXzkFuD6SBTpuzwhyvgtVaY/lvg9Wlvo01C2XuTJtx6intQjfhJNwuJ9eUwMX+4k8AYHIarrloYOO3cesQN1PFHJuNf4Q5qca9DPkz4uhaj02CKCApa126MI2BSmAJtjt4mqXX1+8iR3ddrUnG2WMD0vqCwjhRz/UYE9yX8E1dxvBYsuQcggdTn4Ge7AtglHgbJwxL7clycgqv9oRRFdXQqtLM5WnHJ+hUzlGauAlXWWL9J1wali/mHocawFOXsWlR+ZfMBwvUYX8MjMV6R4ICQaQtBCoLmq1YIL26ZCUtfvdPOZFuMznYq3pBqeM/nNqzWBfPdvU/0o+Nu40ZdgDO1zOqzquDkHCg/MZUoFj5bauDYVAup0sxnJiko1ApBf4ZqaweZBgdUAGDyEk6bJ0hSwLmLmEbWw4D6vCUuAnGZx/Fdp06Lg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36756003)(356005)(508600001)(426003)(336012)(2616005)(6916009)(36860700001)(316002)(83380400001)(70586007)(70206006)(82310400003)(4326008)(5660300002)(26005)(7696005)(86362001)(1076003)(8676002)(47076005)(8936002)(81166007)(186003)(16526019)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 18:08:04.2450 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0ff69d-b2fc-4977-67f5-08d97d2ac1cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2775
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Use IP versions rather than asic_type to differentiate
IP version specific features.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/soc15.c | 159 ++++++++++++++++-------------
 1 file changed, 88 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index f26d33faa0cb..7f4cd1a4f6cb 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -156,31 +156,38 @@ static const struct amdgpu_video_codecs rn_video_codecs_decode =
 static int soc15_query_video_codecs(struct amdgpu_device *adev, bool encode,
 				    const struct amdgpu_video_codecs **codecs)
 {
-	switch (adev->asic_type) {
-	case CHIP_VEGA20:
-	case CHIP_VEGA10:
-	case CHIP_VEGA12:
-		if (encode)
-			*codecs = &vega_video_codecs_encode;
-		else
-			*codecs = &vega_video_codecs_decode;
-		return 0;
-	case CHIP_RAVEN:
-		if (encode)
-			*codecs = &vega_video_codecs_encode;
-		else
-			*codecs = &rv_video_codecs_decode;
-		return 0;
-	case CHIP_ARCTURUS:
-	case CHIP_ALDEBARAN:
-	case CHIP_RENOIR:
-		if (encode)
-			*codecs = &vega_video_codecs_encode;
-		else
-			*codecs = &rn_video_codecs_decode;
-		return 0;
-	default:
-		return -EINVAL;
+	if (adev->ip_versions[VCE_HWIP]) {
+		switch (adev->ip_versions[VCE_HWIP]) {
+		case IP_VERSION(4, 0, 0):
+		case IP_VERSION(4, 1, 0):
+			if (encode)
+				*codecs = &vega_video_codecs_encode;
+			else
+				*codecs = &vega_video_codecs_decode;
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	} else {
+		switch (adev->ip_versions[UVD_HWIP]) {
+		case IP_VERSION(1, 0, 0):
+		case IP_VERSION(1, 0, 1):
+			if (encode)
+				*codecs = &vega_video_codecs_encode;
+			else
+				*codecs = &rv_video_codecs_decode;
+			return 0;
+		case IP_VERSION(2, 5, 0):
+		case IP_VERSION(2, 6, 0):
+		case IP_VERSION(2, 2, 0):
+			if (encode)
+				*codecs = &vega_video_codecs_encode;
+			else
+				*codecs = &rn_video_codecs_decode;
+			return 0;
+		default:
+			return -EINVAL;
+		}
 	}
 }
 
@@ -334,9 +341,11 @@ static u32 soc15_get_xclk(struct amdgpu_device *adev)
 {
 	u32 reference_clock = adev->clock.spll.reference_freq;
 
-	if (adev->asic_type == CHIP_RENOIR)
+	if (adev->ip_versions[MP1_HWIP] == IP_VERSION(12, 0, 0) ||
+	    adev->ip_versions[MP1_HWIP] == IP_VERSION(12, 0, 1))
 		return 10000;
-	if (adev->asic_type == CHIP_RAVEN)
+	if (adev->ip_versions[MP1_HWIP] == IP_VERSION(10, 0, 0) ||
+	    adev->ip_versions[MP1_HWIP] == IP_VERSION(10, 0, 1))
 		return reference_clock / 4;
 
 	return reference_clock;
@@ -567,28 +576,29 @@ soc15_asic_reset_method(struct amdgpu_device *adev)
 		dev_warn(adev->dev, "Specified reset method:%d isn't supported, using AUTO instead.\n",
 				  amdgpu_reset_method);
 
-	switch (adev->asic_type) {
-	case CHIP_RAVEN:
-	case CHIP_RENOIR:
+	switch (adev->ip_versions[MP1_HWIP]) {
+	case IP_VERSION(10, 0, 0):
+	case IP_VERSION(10, 0, 1):
+	case IP_VERSION(12, 0, 0):
+	case IP_VERSION(12, 0, 1):
 		return AMD_RESET_METHOD_MODE2;
-	case CHIP_VEGA10:
-	case CHIP_VEGA12:
-	case CHIP_ARCTURUS:
-		baco_reset = amdgpu_dpm_is_baco_supported(adev);
-		break;
-	case CHIP_VEGA20:
-		if (adev->psp.sos.fw_version >= 0x80067)
+	case IP_VERSION(9, 0, 0):
+	case IP_VERSION(11, 0, 2):
+		if (adev->asic_type == CHIP_VEGA20) {
+			if (adev->psp.sos.fw_version >= 0x80067)
+				baco_reset = amdgpu_dpm_is_baco_supported(adev);
+			/*
+			 * 1. PMFW version > 0x284300: all cases use baco
+			 * 2. PMFW version <= 0x284300: only sGPU w/o RAS use baco
+			 */
+			if (ras && adev->ras_enabled &&
+			    adev->pm.fw_version <= 0x283400)
+				baco_reset = false;
+		} else {
 			baco_reset = amdgpu_dpm_is_baco_supported(adev);
-
-		/*
-		 * 1. PMFW version > 0x284300: all cases use baco
-		 * 2. PMFW version <= 0x284300: only sGPU w/o RAS use baco
-		 */
-		if (ras && adev->ras_enabled &&
-		    adev->pm.fw_version <= 0x283400)
-			baco_reset = false;
+		}
 		break;
-	case CHIP_ALDEBARAN:
+	case IP_VERSION(13, 0, 2):
 		 /*
 		 * 1.connected to cpu: driver issue mode2 reset
 		 * 2.discret gpu: driver issue mode1 reset
@@ -631,15 +641,17 @@ static int soc15_asic_reset(struct amdgpu_device *adev)
 
 static bool soc15_supports_baco(struct amdgpu_device *adev)
 {
-	switch (adev->asic_type) {
-	case CHIP_VEGA10:
-	case CHIP_VEGA12:
-	case CHIP_ARCTURUS:
-		return amdgpu_dpm_is_baco_supported(adev);
-	case CHIP_VEGA20:
-		if (adev->psp.sos.fw_version >= 0x80067)
+	switch (adev->ip_versions[MP1_HWIP]) {
+	case IP_VERSION(9, 0, 0):
+	case IP_VERSION(11, 0, 2):
+		if (adev->asic_type == CHIP_VEGA20) {
+			if (adev->psp.sos.fw_version >= 0x80067)
+				return amdgpu_dpm_is_baco_supported(adev);
+			return false;
+		} else {
 			return amdgpu_dpm_is_baco_supported(adev);
-		return false;
+		}
+		break;
 	default:
 		return false;
 	}
@@ -1157,8 +1169,11 @@ static int soc15_common_early_init(void *handle)
 
 	adev->rev_id = soc15_get_rev_id(adev);
 	adev->external_rev_id = 0xFF;
-	switch (adev->asic_type) {
-	case CHIP_VEGA10:
+	/* TODO: split the GC and PG flags based on the relevant IP version for which
+	 * they are relevant.
+	 */
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(9, 0, 1):
 		adev->asic_funcs = &soc15_asic_funcs;
 		adev->cg_flags = AMD_CG_SUPPORT_GFX_MGCG |
 			AMD_CG_SUPPORT_GFX_MGLS |
@@ -1182,7 +1197,7 @@ static int soc15_common_early_init(void *handle)
 		adev->pg_flags = 0;
 		adev->external_rev_id = 0x1;
 		break;
-	case CHIP_VEGA12:
+	case IP_VERSION(9, 2, 1):
 		adev->asic_funcs = &soc15_asic_funcs;
 		adev->cg_flags = AMD_CG_SUPPORT_GFX_MGCG |
 			AMD_CG_SUPPORT_GFX_MGLS |
@@ -1205,7 +1220,7 @@ static int soc15_common_early_init(void *handle)
 		adev->pg_flags = 0;
 		adev->external_rev_id = adev->rev_id + 0x14;
 		break;
-	case CHIP_VEGA20:
+	case IP_VERSION(9, 4, 0):
 		adev->asic_funcs = &vega20_asic_funcs;
 		adev->cg_flags = AMD_CG_SUPPORT_GFX_MGCG |
 			AMD_CG_SUPPORT_GFX_MGLS |
@@ -1228,7 +1243,8 @@ static int soc15_common_early_init(void *handle)
 		adev->pg_flags = 0;
 		adev->external_rev_id = adev->rev_id + 0x28;
 		break;
-	case CHIP_RAVEN:
+	case IP_VERSION(9, 1, 0):
+	case IP_VERSION(9, 2, 2):
 		adev->asic_funcs = &soc15_asic_funcs;
 
 		if (adev->rev_id >= 0x8)
@@ -1302,7 +1318,7 @@ static int soc15_common_early_init(void *handle)
 			adev->pg_flags = AMD_PG_SUPPORT_SDMA | AMD_PG_SUPPORT_VCN;
 		}
 		break;
-	case CHIP_ARCTURUS:
+	case IP_VERSION(9, 4, 1):
 		adev->asic_funcs = &vega20_asic_funcs;
 		adev->cg_flags = AMD_CG_SUPPORT_GFX_MGCG |
 			AMD_CG_SUPPORT_GFX_MGLS |
@@ -1321,7 +1337,7 @@ static int soc15_common_early_init(void *handle)
 		adev->pg_flags = AMD_PG_SUPPORT_VCN | AMD_PG_SUPPORT_VCN_DPG;
 		adev->external_rev_id = adev->rev_id + 0x32;
 		break;
-	case CHIP_RENOIR:
+	case IP_VERSION(9, 3, 0):
 		adev->asic_funcs = &soc15_asic_funcs;
 
 		if (adev->apu_flags & AMD_APU_IS_RENOIR)
@@ -1352,7 +1368,7 @@ static int soc15_common_early_init(void *handle)
 				 AMD_PG_SUPPORT_JPEG |
 				 AMD_PG_SUPPORT_VCN_DPG;
 		break;
-	case CHIP_ALDEBARAN:
+	case IP_VERSION(9, 4, 2):
 		adev->asic_funcs = &vega20_asic_funcs;
 		adev->cg_flags = AMD_CG_SUPPORT_GFX_MGCG |
 			AMD_CG_SUPPORT_GFX_MGLS |
@@ -1567,10 +1583,10 @@ static int soc15_common_set_clockgating_state(void *handle,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->asic_type) {
-	case CHIP_VEGA10:
-	case CHIP_VEGA12:
-	case CHIP_VEGA20:
+	switch (adev->ip_versions[NBIO_HWIP]) {
+	case IP_VERSION(6, 1, 0):
+	case IP_VERSION(6, 2, 0):
+	case IP_VERSION(7, 4, 0):
 		adev->nbio.funcs->update_medium_grain_clock_gating(adev,
 				state == AMD_CG_STATE_GATE);
 		adev->nbio.funcs->update_medium_grain_light_sleep(adev,
@@ -1586,8 +1602,9 @@ static int soc15_common_set_clockgating_state(void *handle,
 		adev->df.funcs->update_medium_grain_clock_gating(adev,
 				state == AMD_CG_STATE_GATE);
 		break;
-	case CHIP_RAVEN:
-	case CHIP_RENOIR:
+	case IP_VERSION(7, 0, 0):
+	case IP_VERSION(7, 0, 1):
+	case IP_VERSION(2, 5, 0):
 		adev->nbio.funcs->update_medium_grain_clock_gating(adev,
 				state == AMD_CG_STATE_GATE);
 		adev->nbio.funcs->update_medium_grain_light_sleep(adev,
@@ -1599,8 +1616,8 @@ static int soc15_common_set_clockgating_state(void *handle,
 		soc15_update_drm_light_sleep(adev,
 				state == AMD_CG_STATE_GATE);
 		break;
-	case CHIP_ARCTURUS:
-	case CHIP_ALDEBARAN:
+	case IP_VERSION(7, 4, 1):
+	case IP_VERSION(7, 4, 4):
 		adev->hdp.funcs->update_clock_gating(adev,
 				state == AMD_CG_STATE_GATE);
 		break;
@@ -1622,7 +1639,7 @@ static void soc15_common_get_clockgating_state(void *handle, u32 *flags)
 
 	adev->hdp.funcs->get_clock_gating_state(adev, flags);
 
-	if (adev->asic_type != CHIP_ALDEBARAN) {
+	if (adev->ip_versions[MP0_HWIP] != IP_VERSION(13, 0, 2)) {
 
 		/* AMD_CG_SUPPORT_DRM_MGCG */
 		data = RREG32(SOC15_REG_OFFSET(MP0, 0, mmMP0_MISC_CGTT_CTRL0));
-- 
2.31.1

