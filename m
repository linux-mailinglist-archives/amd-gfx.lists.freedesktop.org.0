Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42B457A68E
	for <lists+amd-gfx@lfdr.de>; Tue, 19 Jul 2022 20:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0F28BB72;
	Tue, 19 Jul 2022 18:35:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805C48B23C
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 Jul 2022 18:35:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gq+xrqpq+yxxzssZVM5xhWKdsE6f0UgoeazCBTTB7iSh0vBcEJGWWjt9FqvE14IkcEHfACb3g2yVFXL8sRY8IDgNQZYme9ImsG813Q62T0WB35Gnyvp/fDiB3jryiK1ni6uaj4ednx/KgYY/PNsi9IDiSb2UDuijl6vZZmejii8ufrawqhF23AnNy7mqqJMI3RYdaSy0yTO1jc/XsIEOBlF5D3XPpNiG3fR3IZxZg87zFyybeXbUWigfqgCSw6HjKPX3WexAwMt9o1ntzfomWskR3jZvjvI7SYjVINhn6LP7BukiasbCBSoQrkq8H0AOe5uiSFSH/Miust5/04AM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7t50GBOS5EFhrEoRARzFKUS33nQYOpZ4y8xafiHJ2I=;
 b=iHFPao+XxDNPmYIkCj/YMijX5HorXe0Bwa3WHLJIgYMpchmQZQDKF/nDy6jw4141Qc/19Zz07V/QN3mqR86gP/3HqrKsqLSxWEiCzi95aGKIIpJSWpqKt9aAQXOwdcg567il4/YZjRk74RextnW8+IHogSmXPDh4WyMfGR2dO6zlUknE/5wPYDEZ29chVRkD22j9P4u/O47hm6LowRAu8O91Y3X+7HotmyBkvfvITA2vHsI1ZpDxHlBY8IHizQDbIABy6f0gfyex/U/wM1Tk2TfW5Kdi5RkTRP5Knuz2L4zp74I0rl6qTdWjm8NDU8YMEMecSdYMksgy6kdB0xpzCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7t50GBOS5EFhrEoRARzFKUS33nQYOpZ4y8xafiHJ2I=;
 b=wJWFYp2EzWIcYvdTbRKP53tsARFQ+gPO3e8qWZ6pRw+mE3T1U40LYPS5OmQVk5tpXVsk2Vj25/y4QyE81WHBCb7y75wczc4ik7DLd0VZ+y+jOvA+6iehJd/M0sn9on52SuM1gqfy74VDLGvtjEdcTrJakHlqaT+wGf5blbu3NJc=
Received: from MW4PR03CA0005.namprd03.prod.outlook.com (2603:10b6:303:8f::10)
 by CY4PR12MB1751.namprd12.prod.outlook.com (2603:10b6:903:121::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Tue, 19 Jul
 2022 18:35:05 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::d2) by MW4PR03CA0005.outlook.office365.com
 (2603:10b6:303:8f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Tue, 19 Jul 2022 18:35:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Tue, 19 Jul 2022 18:35:04 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 19 Jul
 2022 13:34:57 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/amdgpu: use proper DC check in
 amdgpu_display_supported_domains()
Date: Tue, 19 Jul 2022 14:34:33 -0400
Message-ID: <20220719183436.1705006-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 383ed630-64a5-4e4c-4eb9-08da69b56639
X-MS-TrafficTypeDiagnostic: CY4PR12MB1751:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tSd4Ovu55iVT+Vb54xfDSvbEh2aHzNozziKzVuoCFbbodqBpPYKuS98+Pr/yNxVSfkbLVNLEcQwVhbR1NyW77THQifE/gRP2dL4FK6xB+U0ARxuuAf/flzrbkxsXd2U+D2eAXgVSM26nMcJS3THS+3eN2NyMApoR++lbBVhzAZxB0ADW7Q/TtdWyoYiLUUayA2TY3S3YUx94Oci8WguPGgzSGN0N7vwJf1nQyiNCA++oo/Rsl2VzP159eiB7mW4gsD+vsmeXgBR9dCbSvBu8o57d1gxjdOlB3EfLD3FdTnOMzom7HlGEIHCprtN7LK6EkWQeF5F5hBu2+IgycwTVDTg2zRzj+/Mxx1QJjnx/IJVVQ3SkJ6OEg3c9B8vCQt6s3IqVLIZTnFu1xDpVtUf0oGbDOyaEc96ihOBjhoWcLCGbrucNEvfNJ5KHc5gVH+aCsYe8qGzTpVHaGbPFPmB4q4+ZbRVm8PZAHtgm1Zw2H9DfCnIJIUuCg/CbLegwMydAuAPeJ3g6OhoASyIhBPFdRfMWriIvv58LO4/G4ttvGecI40pB1dAX5RlV4gjeU6elML0K8d/yRtLzG7yjsztrCxj7gAjULq4sWDDevdjMra0MVJKDznROqPJPZy0VV5dnJaWXVzm2lA9WgJqBPbKj3+607sLr3P0bJZAKG5kUf6JYj+V1bBlR4DWHGzoeqS9htWGmVGC/8K05hPaHi1+NsnIS4BxKF4/hA9ySzisk4Z3SsQXBxkp/TsTBvkYQq3ZuYYxwyRSpGJ0Ip43SACI4KwnLSFo4V21+kTBlLP3dpan/sv9TFCUVWDE1IPjd9VkrGmeTkZXUSZhtYXoS4/KpsQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(346002)(40470700004)(36840700001)(46966006)(16526019)(8676002)(4326008)(6666004)(70586007)(40460700003)(47076005)(426003)(83380400001)(26005)(70206006)(336012)(186003)(86362001)(7696005)(41300700001)(2906002)(1076003)(478600001)(2616005)(316002)(8936002)(36860700001)(40480700001)(356005)(82740400003)(6916009)(81166007)(36756003)(5660300002)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 18:35:04.8562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 383ed630-64a5-4e4c-4eb9-08da69b56639
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1751
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

amdgpu_device_asic_has_dc_support() just checks the asic itself.
amdgpu_device_has_dc_support() is a runtime check which not
only checks the asic, but also other things in the driver
like whether virtual display is enabled.  We want the latter
here.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index c20922a5af9f..b0fa5d065d50 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -514,7 +514,7 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
 	 */
 	if ((bo_flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC) &&
 	    amdgpu_bo_support_uswc(bo_flags) &&
-	    amdgpu_device_asic_has_dc_support(adev->asic_type) &&
+	    amdgpu_device_has_dc_support(adev) &&
 	    adev->mode_info.gpu_vm_support)
 		domain |= AMDGPU_GEM_DOMAIN_GTT;
 #endif
-- 
2.35.3

