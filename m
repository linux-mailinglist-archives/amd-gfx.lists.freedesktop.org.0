Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02EC753019
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jul 2023 05:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6796E10E0F3;
	Fri, 14 Jul 2023 03:42:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3397F10E0F3
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jul 2023 03:42:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlsqY/w/OzDfv5kN+AGYF79FuhurRLxXaaTKGs4K7uPP3kL2SKk5eARZieJmEsu8VMC0WVmcRtrB81xoGpoi0VeBVK4BTW9r5dORM7AyLaZFezbin3N9zUkJgMon5ocrH2iYT3MJo4ouvy0HxnQIoff/LKumFRBxYeTWKCIO1HCZBtF+MhXisjeYv4SqJdl4pDIPbvBqnO8RIVuQlpgZhhDxPM+IiRq/pFWCbncmdoq+CC3GmOFjGHgLbhZRYWT9tmaT4a+5X5KNcX+smXYN572+lJCEfQVOds/7l8hqqk/410jYaSzQTPSx/UDH0wZ26ry+sMxW2pK9dMzaMpdmIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDDxGEaphCgrNGkGele1IiV/vBKm2VpzL7/BqAoWbIQ=;
 b=Ef8l3krOSA3wdX5c3fOpL3KmKozBsV8tIFMBRvUi3CfqLg70mHQzHxiSMBxs8Y4/omMa0JGYawyOzfp75xCFWh1R/X+1pfJrQ5kgU4kBGUIP/hj3zBuk+kdUw4HY4S9fpncVNKJ80SkUzs3hMzTs4g/9pB7noMloGPbfqrRWd4zXSsbV92NLkYakrSImK1+nsnTidQZh98oupc2CUJY0ikkbJPERtkxfBkCojLKoXhr5Ezxah7EWXw9CIkiHtN3LI71bDYrz3a0sNM2VzORR6bCdfCJKY26M4AYuNjJ073niFdT5hFx3NW4ccQCkF1n+mN3V6AugIg2xYNL/SEF66A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDDxGEaphCgrNGkGele1IiV/vBKm2VpzL7/BqAoWbIQ=;
 b=hiYo0iY7kOpNx+HnOjqrq7afJUK7nuK04W7Xj/9mDCrLjgRVlxI+i5RJbToKkcP/Xoz8x2nlRSrDaHQskE4G7XdUeQoL9qloHVcqSIjlGRZLgkzbOv7vMgO8m05zdwFFKh0F6dtkdN8yKA30bpkhj1IxuhXI7o9It1kmx6eG8FU=
Received: from BY5PR17CA0006.namprd17.prod.outlook.com (2603:10b6:a03:1b8::19)
 by SA0PR12MB4415.namprd12.prod.outlook.com (2603:10b6:806:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 14 Jul
 2023 03:42:22 +0000
Received: from DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:1b8:cafe::5b) by BY5PR17CA0006.outlook.office365.com
 (2603:10b6:a03:1b8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24 via Frontend
 Transport; Fri, 14 Jul 2023 03:42:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT011.mail.protection.outlook.com (10.13.172.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.27 via Frontend Transport; Fri, 14 Jul 2023 03:42:21 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 13 Jul
 2023 22:42:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 13 Jul
 2023 20:42:20 -0700
Received: from stanley-test.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 13 Jul 2023 22:42:18 -0500
From: Stanley.Yang <Stanley.Yang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Hawking.Zhang@amd.com>,
 <Tao.Zhou1@amd.com>, <YiPeng.Chai@amd.com>, <Candice.Li@amd.com>
Subject: [PATCH Review V3 1/2] drm/amdgpu: Enable aqua vanjaram RAS
Date: Fri, 14 Jul 2023 11:42:15 +0800
Message-ID: <20230714034216.500658-1-Stanley.Yang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT011:EE_|SA0PR12MB4415:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d28ea1b-9e1e-45b2-13c3-08db841c545c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i5LT4AOTZSW6Zj7RPDjPLCvMJHz0haeD41TKkaImnbsx3g55A5bhjC0w8hRH2c0TsAB/B5x1r+IfwWXudni1RUCh3ZyYal+phIxZ/Vlfbo5vTTKPyZMiz/raTcfX3G9MXfhaiQP1sLMxyESh7pKJuGMVntULSUbYcJIG3kFzZo1EmL4TkT0m2sBUJMxAvBNo6HLUZgyJkq0rsvvM60+kicF3cWwrCOihZTaqKx+roldy1j0ixSdgiGGyfhfayeXkCa5d58VGzAH51VXOclqn/4eDANxzFB645Wa+yFZOChaoXmqXSbdwXaM2e3kz3O6Oad2wKv2fIW0FvrQh5ukdwy8NpuM1dUf2k3/S0KJ5fdhaVCmPEMMVIIB81P4iq7N/JoVFwTP1TLxY0T23s5YtdSRlSo6jOuuGkcDgj61ynnlpEQ6/3I4hkOjXtkCmFZ/RbZhpPIgjXHjiD/cxXL0irbibZ5tzNHT6ngCZpVvgs8ZAPID3CuXOhW5CT635dZQHsOQ7zFt1qScqwb/wtXgQDK8cbXA4Y/tOxV8zToMihKFGuBuUVryGrARHidXeAhdbiRrBBjtPQDUBMcmn6u1Rc/XPVEt+e8iG+Qg2lNmMOipP0YGTY7soGqPxsayGw/rQV74jEZfqI6zqWFgZGm1KJBXfHfzFFJNt7QvyKXvLt7MqSA4QrUYSytwxG8rKWQodkACppJVh4/LXXTDKbaUMwZj9UDgGXBu6t/LaG0RZIfSv/BZ4MRd+uflhW1qLZZmhIhO1BJHxfHctLc9umhdVmA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(6636002)(8676002)(5660300002)(2906002)(41300700001)(8936002)(316002)(40480700001)(4744005)(40460700003)(82310400005)(36756003)(86362001)(478600001)(7696005)(6666004)(36860700001)(47076005)(186003)(2616005)(336012)(1076003)(26005)(426003)(110136005)(70206006)(4326008)(356005)(81166007)(82740400003)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 03:42:21.1547 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d28ea1b-9e1e-45b2-13c3-08db841c545c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4415
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

Enable RAS for aqua vanjaram.

Changed from V1:
	Split the change in amdgpu_ras_asic_supported into a
	separated patch.

Changed from V2:
	Avoid to modify global variable amdgpu_ras_enable.

Signed-off-by: Stanley.Yang <Stanley.Yang@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 5371fbd3fe17..8673d9790bb0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2422,6 +2422,7 @@ static bool amdgpu_ras_asic_supported(struct amdgpu_device *adev)
 	if (adev->asic_type == CHIP_IP_DISCOVERY) {
 		switch (adev->ip_versions[MP0_HWIP][0]) {
 		case IP_VERSION(13, 0, 0):
+		case IP_VERSION(13, 0, 6):
 		case IP_VERSION(13, 0, 10):
 			return true;
 		default:
-- 
2.25.1

