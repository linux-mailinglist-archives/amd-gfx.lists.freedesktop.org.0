Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC02B4B93A4
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Feb 2022 23:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306D110E263;
	Wed, 16 Feb 2022 22:09:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2070.outbound.protection.outlook.com [40.107.102.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AB010E263
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Feb 2022 22:09:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkuG6O5NqqpHaxcH+cPt8Gr3hHHLB29pXkxnNz/wEApTZW3qT6z8oPfOBmxZlQDvs//eVl8/yIuTvf0jwQc5U/l072Dt31FXBKIi7wGw2wqtWUgxy8AHqWkqSPwlP6d1Ug9DpCzsMjDQcpz+EVUJ+W7cpGJfin7WQAyQs4Vu0YyOJBDiFsRf3lZX0z2ffe1L6yNt0oFs2jMhoPwhfa6XJkvLaAsUP9yjm9Zv5UgExGmrg7IDoHIvYywCqmTaiW2LVGY8LuuXTk8dfsOebj+U7XSHU9hbyAAMEjK90h7iZozNlEKAF35uL41f1twalaC4Oo1SYnX7vqg3vrwvrTpsdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zGh3osjq9O5oNkoTtv4xRdLC0+yO4r0rzAx6ulg2EM=;
 b=dCAiJqFDTSlN5TpQVd1X0LNQCl0beXpk6bPZhOy/UglR0YzAeRCdUI2HY1qus5gugzxZezqzT+vEoX/YR25LHju0OwT9IyWCZqFZVZMpoNQqkxcF3S/ELSMcrhE7ZebU7CA+qfMO2OuTaSZuh+cYUuWwvi1EJY//4YyLBW4Cy75T1FOnxBdiU1a/XfkXPqJ4SaQnhE5hXh5CsN5iQuUDyVyY7ImfqAMV2GqB2/WTI1sdeEaPxXQjElSLk6ibJpocYeP3unyOU4uPz114JO+B5lGsdSUh4K5j52Kim2wpLCp4yfXqKr9d8zczVNNTaK6WN5NB3x0OImii5Gku6aVV6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zGh3osjq9O5oNkoTtv4xRdLC0+yO4r0rzAx6ulg2EM=;
 b=TOlBrEZn0O0jZ6ZZHJI2YrdMSssa4XAagGiNYdXCTXfqOTpkpI0IbRJW8YH/3hIbmxiy1SWwjsHPg1mNeS7E/BjvBH/xAtTFUNzgDvg1/7JyElEE+Pb2XU6xJyff4ykivrmEDwoxXFANItqWxSOc9qNIi+/iY/lzcgYBkizz/dg=
Received: from DS7PR03CA0272.namprd03.prod.outlook.com (2603:10b6:5:3ad::7) by
 MW4PR12MB5641.namprd12.prod.outlook.com (2603:10b6:303:186::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.16; Wed, 16 Feb 2022 22:09:10 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::b8) by DS7PR03CA0272.outlook.office365.com
 (2603:10b6:5:3ad::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Wed, 16 Feb 2022 22:09:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Wed, 16 Feb 2022 22:09:10 +0000
Received: from localhost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Feb
 2022 16:09:08 -0600
From: Luben Tuikov <luben.tuikov@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix ARM compilation warning
Date: Wed, 16 Feb 2022 17:08:53 -0500
Message-ID: <20220216220853.59961-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.35.1.129.gb80121027d
In-Reply-To: <202202160733.1Egjqp9Y-lkp@intel.com>
References: <202202160733.1Egjqp9Y-lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dfe932a-a93b-404d-e820-08d9f198f53e
X-MS-TrafficTypeDiagnostic: MW4PR12MB5641:EE_
X-Microsoft-Antispam-PRVS: <MW4PR12MB56414A45A9B27A3BAC0977E699359@MW4PR12MB5641.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/9TiwvOWLcU7KiAcA+7rlyVDcwvt2ERkdAVasJgpblu4cUBU3bYrdPE08DD9Obvj1hMVYIIkF5F6+ZTnIkdrmBuWLXc+vjs7xVx3Gl0ncbdtO3RGX2kIVrR6wpYdeFfwJdVJh/e/XFKv7LK3x3vw5QwfoZ7iWAu2qPtkZqudwAUAuzd9fYWOZbgHy1owMMf5S7LsLtQDwUNRlUZXdsGgViTsFx9Wt568LsDK91sIip+6JDUuu86cyuc/9jGelLNKcAyB+5iMA2Y9IPYDZk4ff8S05HWeUpCuhmbXcpKE58eLwmyiO3zuJJdhq/Lzu5ooyFL9rwVnlBv8Dzz6xnC7+T36QUcEBo+5zP7kAlzWZ4nnG55RGGbYu4tvLdnzvRRiHcpVEVVSpi3Xh21rfDjj4gsCpYaa2UQ6mVl1sv4tRmVJ7oPFH7PivUTHSQ0/7qTpYjYO1QH+8mF9h4esAZ9yqMQDEdmVWqID2CS/OiQKmgy2mlBDy/07nwS2TvkN8u4lghPDmrRTnZ5MWQOWLEXhqL44CRjuYZpSJRGDgr16K6W0jV3ojldLoSpsqohGqTGWWTtSwhtuYfJ2cazwjmL86okX1MYdkv+A6M0eOv5uvpWvIEP+NUfj2sLJ2FuiLyznGfgzsDvRRWtMFj6x8z87cNN/pHXsi8AtN2fPKXdMc2LegSlao3jnfqFcWwMKOna45kIhwJ0cAbVly/o/MY2cg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36756003)(26005)(356005)(86362001)(2906002)(81166007)(70206006)(70586007)(316002)(6916009)(54906003)(508600001)(83380400001)(2616005)(8936002)(4326008)(1076003)(8676002)(82310400004)(6666004)(47076005)(5660300002)(40460700003)(36860700001)(44832011)(7696005)(426003)(16526019)(186003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 22:09:10.0405 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfe932a-a93b-404d-e820-08d9f198f53e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5641
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix this ARM warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:664:35: warning: format '%ld'
expects argument of type 'long int', but argument 4 has type 'size_t' {aka
'unsigned int'} [-Wformat=]

Cc: Alex Deucher <Alexander.Deucher@amd.com>
Cc: kbuild-all@lists.01.org
Cc: linux-kernel@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Fixes: 7e60fbfbdc10a0 ("drm/amdgpu: Show IP discovery in sysfs")
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index ad2355b0037f52..6c3a3c74e0231f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -668,7 +668,7 @@ static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
 			    le16_to_cpu(ip->hw_id) != ii)
 				goto next_ip;
 
-			DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);
+			DRM_DEBUG("match:%d @ ip_offset:%zu", ii, ip_offset);
 
 			/* We have a hw_id match; register the hw
 			 * block if not yet registered.

base-commit: f723076ae13011a23d9a586899e38bc68feeb6b2
-- 
2.35.1.129.gb80121027d

