Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FFB5B1328
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Sep 2022 06:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3452B10E66A;
	Thu,  8 Sep 2022 04:09:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2086.outbound.protection.outlook.com [40.107.102.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FA310E66A
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Sep 2022 04:09:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnkT3a1pLS9c2mOfWhjV+/UfTZsf65tNSs/eQ5BPW34AabYMVtThFA84J6bRhV7tjx0BYRVATvBWIlfAYxk0Bz9qcNoxhcPb4sAyewbsE9licaocN3nnBkG+r7vlBlzlyfdLp+Mr6SYH/CtKhCK3ohesI4eExca5kCbHQi43iHG3E0nqmL7chWTGKUq9EB7IpU+X/PMnHEp6alyFqxu6AunMKkFP5Q3IaZZkxm4Nei/SvCuqHHzvgB6KwOWcRI+shlq6ZUChaP5AudOVfo9PK3DtRM/fqq69IJ7ZQpmC3kuUt3rSUwOtVb+USKA5be/5rYBwgo/FU5Y2Znt9f2NVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qpt8yhpmvOUVlUf3nnssi5bgCD20PgkR8IQhLbD624g=;
 b=gySH7IBWpxvoRFLHKwqPV79T/PC7tWgrJC1m2/iYL16nNj+9vug5gSV6yd60S2vg5dp3cvKw1LCmOKX6wXmzq8BQh+CjGVtSfllsCNWd3fKGf2kN3AOzowUD5Yd9MamHVYTXtcg7YBy/4zHtbXalKlwuYhwYsD6xMeELs1kuTd7WDYaduyj82cyqYFV5HERzrwu1UtCGyDU02o/fHLHzupQHPQY4f5oZQZQmvm2P5aGWUDsut+icFSKLc4X+AYHtuR2NtTnSquI6vHWFKW3HmuCowdFHhkpbjmZQ5HXKax0bL8Psrd5rVfdp9c6X9d1mHHOcwX0cdx4fY6PwD+0/NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qpt8yhpmvOUVlUf3nnssi5bgCD20PgkR8IQhLbD624g=;
 b=BDQ05ru/xTZlNYl2WoP17htwE22kD9sQM6F97Q7LT4vzPhNNyvGm3udl8u6zCUVoQxLVXjkFLxTiZ6rRwAcjGTf+YQN7BRTBcKyONyY+JjkNPWm8Wt0dDLp7CTky2PW9ydK6Yfglh6s5qR6qRdeLbRxl82ZUt4hmC5mBWy/1uDQ=
Received: from DS7PR05CA0086.namprd05.prod.outlook.com (2603:10b6:8:56::7) by
 CH0PR12MB5108.namprd12.prod.outlook.com (2603:10b6:610:bf::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.14; Thu, 8 Sep 2022 04:09:08 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::2a) by DS7PR05CA0086.outlook.office365.com
 (2603:10b6:8:56::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.6 via Frontend
 Transport; Thu, 8 Sep 2022 04:09:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 04:09:08 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 23:09:04 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <helgaas@kernel.org>
Subject: [PATCH 1/2] drm/amdgpu: make sure to init common IP before gmc
Date: Thu, 8 Sep 2022 00:08:20 -0400
Message-ID: <20220908040821.5786-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT039:EE_|CH0PR12MB5108:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef8b029-756f-411e-bf00-08da914fe0bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C42Mb9owkmoYFcaspOZPBFGwdkZXP5fRdxqLh0S/X7C0kYhaiJ/PcRNPNZPnthg1lu9XuH/h3w2S45p4suH7scBVVdCiWesJU/qJ1u6PaH1PeKbMJd/7bnup0u34DzmGo6dFx+ULBa73J5WPwnTnMIOidnqYTP0OyLAwg4feVgDfqGJiaxcm0g2v2N1Txqi4mQ8ZqOHltWOIOtk0GbIcUYrjtbirFQZbSvOjwZulNMYxLEbiQbfGCfBb4wtDJFPbmh0S7nTPTFy3tn0dSEJiUdGkHk+MAzI9qLNyuNnnilFoP0fef5GgGPkqnpzGA5rYHAz2GTmtp8NyRe0ehVo4qwb9n+jnypWbTPOgQ2+scNVQG3XSxTCB9LVlVeFbiOiWPHDuVwef+cG3qCjmR9WgDM94UGT6lLzKZJOa/6zzWDEJoX4glXiRNJ9+PoHoqRmH0UAUawJAIfy0Ww6PTH0eWtgkaVIUJBMQthpn9w8Glc9B9dNRFvqTK7ooiYV/VlpP36TAcR4Im2rS1tQFYxs9ZEfTggPW1EHc52faVmapP2nW6aGt8kcUYebflmv++HYBk56QFddzi86PBIAQItt3mNJaETUtJV91u6GksdbYfrLCwXUKfAragrZ3WGZRxGz3u6MVbAhNLqQoAuSqOmkJS4PvbwJiuOu4svRggkQU2KDjML5tXDBQMwj3s1Jse+dtQPzg5MOZwwnsOmJKBJiS01A8knNR2L0SsFk3uz6cImXilqLd2LJBmVnjGAmYzbnedbRLu/2ZJHSPJ74HvbbtJlU0UZpFZXLxIZI9gyGbMmbxQv1deQUUVWljesFuk81TMQj6h/9nUMzmaddr0jIYUw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(376002)(36840700001)(46966006)(40470700004)(36860700001)(356005)(40460700003)(81166007)(82740400003)(316002)(110136005)(54906003)(5660300002)(8936002)(70586007)(70206006)(2906002)(8676002)(4326008)(16526019)(2616005)(336012)(966005)(186003)(426003)(47076005)(41300700001)(40480700001)(83380400001)(478600001)(1076003)(6666004)(82310400005)(7696005)(26005)(36756003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 04:09:08.4319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef8b029-756f-411e-bf00-08da914fe0bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5108
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
Cc: regressions@lists.linux.dev, airlied@linux.ie, linux-pci@vger.kernel.org,
 tseewald@gmail.com, kai.heng.feng@canonical.com, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, sr@denx.de
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Common is mainly golden register setting and HDP register
remapping, it shouldn't allocate any GPU memory.  Make sure
common happens before gmc so that the HDP registers are
remapped before gmc attempts to access them.

This fixes the Unsupported Request error reported through
AER during driver load. The error happens as a write happens
to the remap offset before real remapping is done.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216373

The error was unnoticed before and got visible because of the commit
referenced below. This doesn't fix anything in the commit below, rather
fixes the issue in amdgpu exposed by the commit. The reference is only
to associate this commit with below one so that both go together.

Fixes: 8795e182b02d ("PCI/portdrv: Don't disable AER reporting in get_port_device_capability()")

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 899564ea8b4b..4da85ce9e3b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2375,8 +2375,16 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 		}
 		adev->ip_blocks[i].status.sw = true;
 
-		/* need to do gmc hw init early so we can allocate gpu mem */
-		if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GMC) {
+		if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_COMMON) {
+			/* need to do common hw init early so everything is set up for gmc */
+			r = adev->ip_blocks[i].version->funcs->hw_init((void *)adev);
+			if (r) {
+				DRM_ERROR("hw_init %d failed %d\n", i, r);
+				goto init_failed;
+			}
+			adev->ip_blocks[i].status.hw = true;
+		} else if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GMC) {
+			/* need to do gmc hw init early so we can allocate gpu mem */
 			/* Try to reserve bad pages early */
 			if (amdgpu_sriov_vf(adev))
 				amdgpu_virt_exchange_data(adev);
@@ -3062,8 +3070,8 @@ static int amdgpu_device_ip_reinit_early_sriov(struct amdgpu_device *adev)
 	int i, r;
 
 	static enum amd_ip_block_type ip_order[] = {
-		AMD_IP_BLOCK_TYPE_GMC,
 		AMD_IP_BLOCK_TYPE_COMMON,
+		AMD_IP_BLOCK_TYPE_GMC,
 		AMD_IP_BLOCK_TYPE_PSP,
 		AMD_IP_BLOCK_TYPE_IH,
 	};
-- 
2.37.2

