Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9570039A2DB
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Jun 2021 16:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18276F47E;
	Thu,  3 Jun 2021 14:13:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2081.outbound.protection.outlook.com [40.107.95.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081726F47E
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Jun 2021 14:13:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RglRzjhI1uN0TFKlLW0b+BL1IHJNo3XNZW/0o0u3HO2HP+GBSDJye/sFHD54mOd9MDNxZr53L6LJSSUccG16uKklvG6YpBr3N0rMplTgxsedsxN1fo6+UM0XewZGyv+joBTZ/U7/DnObcnEb2UW5YXCy3kx9KqhIa5+g4d7qMHoTeHkP8bCYfW5QzvqnS3ezHAfOurC8hz+DIgYI0trZevYGadBJuopuuXYX9ayKA4Qdn4WeKu7ljIcfviuEIO64TlIkTLwQ22d2OxlgvzuYPp8IhenITJkwh+cUjSQdUNBy+7RusXaHcgyhPVLC9PQlMp/qhN/nGRnnK+nHkvB1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUeMPSHO5l+9MnUi4LXPDcoyU58i2JZ2SvOpPrrmr9w=;
 b=ASrJKX59DRjhHQ2Eeo9KKOagSF5GXZ7ti9Vbd7UlAprkhhyMwvtx6Q9l/MXWXQBzzjeDGoQrOXFRf+tShFywI1+A9YaknAZksrcfFyuwBJd6l0heBJ//jyODd/1i8HriA1SmrDSH8hi/BBSPi76lSuHCUdcETlEbbdRPS6Ccefz14XThhuFG3tu+9cSS4zuQlGG7RC9kHtD3jEhNuCu2ndEhy9B3qrevd8ufCBNqeqJVoaRS1nbIHcLcrEZMpVoVAnmGGZnrqBhNqYUqR6tG7RQ60Gd5p2BrItppNDLe9wYkxaegxzgVEWMF/s2iCY3YgqfSveXo/BNFEMz+Iet87A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUeMPSHO5l+9MnUi4LXPDcoyU58i2JZ2SvOpPrrmr9w=;
 b=KBJ84xNSeFRBmSxNqzLxRIEBfLHIK/RRWCLhd0aRA8h7KxyDVf2ksBerq5NM7l4LCz8dNZo+Gt6ESqNcWuDLDL4t8j9goLi683KsrMkOOzUsBTqKffJym7CrXUXkMedwBUo9tJWFb7kbIhjRF8LGGC5K9eqeakA1gFSLO85p/yc=
Received: from DM5PR10CA0023.namprd10.prod.outlook.com (2603:10b6:4:2::33) by
 DM5PR12MB2406.namprd12.prod.outlook.com (2603:10b6:4:b7::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.21; Thu, 3 Jun 2021 14:13:28 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:2:cafe::93) by DM5PR10CA0023.outlook.office365.com
 (2603:10b6:4:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23 via Frontend
 Transport; Thu, 3 Jun 2021 14:13:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4195.22 via Frontend Transport; Thu, 3 Jun 2021 14:13:28 +0000
Received: from Zhigang-WS.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 3 Jun 2021
 09:13:19 -0500
From: Zhigang Luo <zhigang.luo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/5] drm/amdgpu: remove sriov vf checking from getting fb
 location
Date: Thu, 3 Jun 2021 10:13:01 -0400
Message-ID: <20210603141305.2542-1-zhigang.luo@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1c5e14f-47a3-45a9-9fc3-08d92699c253
X-MS-TrafficTypeDiagnostic: DM5PR12MB2406:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2406A24036DF1E6C3E3F67A4F13C9@DM5PR12MB2406.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ViZz5Dhc5PZfCkLoLYkY3LXGVUIpX8upj982pwWAC2LyNtl+851G8HaaTyGPuJquV/nMdK5O0g0kvPGWClfTZ3gB/FBfDfanh0aJOW+kAOzEszihyrMnoC8aInMkMQ3BokwY7S1eint7mod3BIaBNpvkpYjbgRIbrhnFUHnEzP2o734WNfziyJhjxDIxly6MolKqAXjMJ0Ur6V5V9y23bDuhSAuv4qmn8HZqIX5nl0Cp1iH0nmmi0YdcWxVHY8B5xzzbjCxyDWkgated7VJi1aApxld5nXQWnsyNyIVQsC/ZBOEsRP1n/Sww0iiPvpp39yMZngePYHCMGKNTDOcrYSXl5Gg+156hiyqDZdN4CYpyN0KCy2W8E5A9Z6CdbIeBrgn7CA9SNmZzf9pQy10OBJlCzR/50pYdNQNRmNZfcOebfQe4afy7Da9cBTXjReyDxqg2bZsyhaZY6KzqMxe2wkXkVmyVYF5qTTVZsLuscgSnXklGuvIoxyxOTjeitAFK+CbfLxTt62ecpBg/FcHFQHr+765min+YJOPd+F/6MGM+0cl5YrL2tGqwU9tIwH23NZKSPTQxpJADJTiCPTrhg1aGa5Bg7cW3+8niabrDVmmR2XunYQzmOTrScMH8NdpBDXxZCYFfrDBOd576j1EcC61lIB8SerkK1VzOqp5pqcIJf/ot/yk5qWlwxcqcVYeq
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39850400004)(36840700001)(46966006)(4326008)(83380400001)(82310400003)(44832011)(336012)(1076003)(426003)(8676002)(7696005)(478600001)(82740400003)(47076005)(36756003)(6916009)(81166007)(356005)(5660300002)(70586007)(70206006)(16526019)(86362001)(186003)(4744005)(316002)(36860700001)(8936002)(2616005)(6666004)(26005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 14:13:28.0924 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c5e14f-47a3-45a9-9fc3-08d92699c253
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2406
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
Cc: Zhigang Luo <zhigang.luo@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

host driver programmed fb location registers for vf, no need to
check anymore.

Signed-off-by: Zhigang Luo <zhigang.luo@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index ceb3968d8326..1c2d9fde9021 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1292,10 +1292,7 @@ static int gmc_v9_0_late_init(void *handle)
 static void gmc_v9_0_vram_gtt_location(struct amdgpu_device *adev,
 					struct amdgpu_gmc *mc)
 {
-	u64 base = 0;
-
-	if (!amdgpu_sriov_vf(adev))
-		base = adev->mmhub.funcs->get_fb_location(adev);
+	u64 base = adev->mmhub.funcs->get_fb_location(adev);
 
 	/* add the xgmi offset of the physical node */
 	base += adev->gmc.xgmi.physical_node_id * adev->gmc.xgmi.node_segment_size;
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
