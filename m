Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD69533525
	for <lists+amd-gfx@lfdr.de>; Wed, 25 May 2022 04:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4592E10E167;
	Wed, 25 May 2022 02:09:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0AC10E167
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 May 2022 02:09:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaP8zgqlLR6HGiDwAEIX1RonRKQ8zZT1cE8dGIEAnVFPv7czQj173chuy8T70Q0SAP7t6NqwdN8ehAFdOmRJaSaQ2Xb244fRdHXy2O2O5wAngZ/3D97aaOy8FcXirzisMmTA0jMcwo9H29Tkx9SDRZg49paM5/D2VcZUkwiei3ku1vlC44K3s8Yx9WtLD81JnDqUAAb5h0ogO8CuUIooyufh+EJUrp8HNt0Be6jf3/l2z+hbxuBssE8Bm1Bij4jumlNmc4vQHmhXxKTzS3KexVKFzcbFHmOdJlKOIAE6afXGSGHC+6XfBrfObW8UGaa363NETg+2tsfKE2EAGGJM7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KgeHjnWHoZk1NRWYcy70nvHKb3cFbdX/xAlp1k0pN0=;
 b=j4ayW3V6RJr4D+dEx8h4XQTspqgc5iYSgpD3kwwj/lzpUjBh066alcgDyg1dFx4N7+XeTEYwZe5yoZdzBbITg/DdzFtm2IlStrYpAfZCxPZ+Gi+cuu/mIJhzJHuwNkSblieHrkvpgygaDcY5/Hx0xEbaPfSYFGVRxfzGAyvQjK6eCQyTb82xNe80RqYdLfOaRdd9FMiICM1V1vIba/kAryukoAVxH6+WFHd55HF8e27a9egbMwVWNbEn96MjQ8nJHAbiI+KD3CuXcgJeZhxuZtNJwWLj3hfj1lxO+/5nLKPrGttZVjVQpW+mnYB/jD97wmvdhYaydAs4Ko49aST+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KgeHjnWHoZk1NRWYcy70nvHKb3cFbdX/xAlp1k0pN0=;
 b=XulhkcDVBkBHurgmKwSLO+yVZJcBqbn2j3cSwQ6YD0OmDTw+nM/JHRwjfotzzifQXmFg50i8eJ9jT/TMrtJeiSNjVtk69w4YvhHj6D0yeM2Xab8eeeS30l7oB/fmkMDsGPeqxdHcB3iueqwasNqhnBru4Q/q3CzRgtK06xaltEk=
Received: from DM6PR17CA0019.namprd17.prod.outlook.com (2603:10b6:5:1b3::32)
 by SN6PR12MB2768.namprd12.prod.outlook.com (2603:10b6:805:72::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 02:09:41 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::4) by DM6PR17CA0019.outlook.office365.com
 (2603:10b6:5:1b3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22 via Frontend
 Transport; Wed, 25 May 2022 02:09:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Wed, 25 May 2022 02:09:41 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 24 May
 2022 21:09:39 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: simplify the logic in
 amdgpu_device_parse_gpu_info_fw()
Date: Tue, 24 May 2022 22:09:21 -0400
Message-ID: <20220525020926.1951685-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525020926.1951685-1-alexander.deucher@amd.com>
References: <20220525020926.1951685-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ceedd6a3-a92b-4c48-6e0c-08da3df3a118
X-MS-TrafficTypeDiagnostic: SN6PR12MB2768:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB2768BD53909674981723CC55F7D69@SN6PR12MB2768.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: engvzEI+PtPeWzwt53fNz4uUgdFzh/29BrM4gTwXkpYPQuSipWcpVIvgDH6D1aOOchGcPws9axWk1XBAWQt+SnXg0kP+1IGpnJzkwAz7yNIRjMmSUlPBRyIAReObwrpQCqFfBXPCq0V03FVkLjjnJQ44Opby8IKI+hpLlINmPf5WVbOsoRrxrjSGTYI9TTWsAXD/sTLOmvEXZRH9nCwwB1hXIdMB67X89APKHOid+qfdXyvcvd2vo4W491kfQywfGqUZdLxburwmDpPRpPgAxnX6Ymt/OXiCBAhrPsQsz2fIq4qd82qrWXtMdGAkFxEWtGeCfBGKPjK3j2e47GYXIHSJdiLRU0obOokIoexnNwa2qlCUIcZwRHcyx9GcWUdFd5w3cmmf/ThK+wIsWz/klFUz257GH3KfdYfsX7MJpqhl2QprIggNdPxh6z5FSCZ4KLilEYnHqpgca0SFZxhiAQRpRNYpB5+8NC85XnLudRXlIN+wmK624xpVme5ULSPWvjarzWeat6sLJbEeiSTy0GTJ+guMpXvsiNm+j++BNCkcG5kwLkZLolmg0mxv24r7taE7qU5vTQsA+V3Tjbm234hWso4p0iAp73Ps6HL7vxY0cYynH03Uo28uKF0lF4ZKKSUIXl8B9oazxVrNLmNWjwkghz/9R5rH1dIXEiOEu59jKabfRx8E51DIFo648aOVbMYE59xUW8ToMqNBaSjEsA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(1076003)(6916009)(70206006)(86362001)(70586007)(8936002)(316002)(2616005)(36756003)(4326008)(8676002)(6666004)(7696005)(26005)(81166007)(508600001)(356005)(426003)(336012)(83380400001)(82310400005)(5660300002)(36860700001)(40460700003)(2906002)(186003)(16526019)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 02:09:41.4489 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceedd6a3-a92b-4c48-6e0c-08da3df3a118
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2768
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Drop all of the extra cases in the default case.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 29 ----------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 4daa0e893965..7f7d475c46b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1942,35 +1942,6 @@ static int amdgpu_device_parse_gpu_info_fw(struct amdgpu_device *adev)
 	}
 
 	switch (adev->asic_type) {
-#ifdef CONFIG_DRM_AMDGPU_SI
-	case CHIP_VERDE:
-	case CHIP_TAHITI:
-	case CHIP_PITCAIRN:
-	case CHIP_OLAND:
-	case CHIP_HAINAN:
-#endif
-#ifdef CONFIG_DRM_AMDGPU_CIK
-	case CHIP_BONAIRE:
-	case CHIP_HAWAII:
-	case CHIP_KAVERI:
-	case CHIP_KABINI:
-	case CHIP_MULLINS:
-#endif
-	case CHIP_TOPAZ:
-	case CHIP_TONGA:
-	case CHIP_FIJI:
-	case CHIP_POLARIS10:
-	case CHIP_POLARIS11:
-	case CHIP_POLARIS12:
-	case CHIP_VEGAM:
-	case CHIP_CARRIZO:
-	case CHIP_STONEY:
-	case CHIP_VEGA20:
-	case CHIP_ALDEBARAN:
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
 	default:
 		return 0;
 	case CHIP_VEGA10:
-- 
2.35.3

