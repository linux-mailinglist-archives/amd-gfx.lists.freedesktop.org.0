Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D9E36A5A0
	for <lists+amd-gfx@lfdr.de>; Sun, 25 Apr 2021 10:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501346E0F0;
	Sun, 25 Apr 2021 08:00:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839836ED0F
 for <amd-gfx@lists.freedesktop.org>; Sun, 25 Apr 2021 08:00:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgF4UIynPBuJtHm1F9aNFGBNsLOLLVA1VxVd7LE+wt+Y2+Zo1o6e811Lsqg9IOWxKzWsdXBQTw5wlQRI+dWB0amT7EP/IK0mBhiK45BWdJUPZQ8l1gvqPm5ks/BdWFdoq8e/J2zy6nNxanbwi5Z+KjzVwhz9ubpmxbDonoSa0cWYVLa2s3A+e4xGpZmYmeSrhzWwAnWXEll1WX318/EPZWCPCmIoD+Uw+6xQleGgav5ghIBGMdOZSf7Q/nkaIpxuawB3AMQrVADfTFYJx5ONyegJgXi6n6ti8MPwT9OMqxChto53dfHRrSTSeB1iK7grn/BT8fu7Vywih9Q/RSIc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONFq39CnOQoTQJ0Z9lWolgGTTDUaCRJlHy5H/YZ6cxQ=;
 b=Vu4jIUI+U89mJTv0H6t5BUVjaEydvt5JQd+OAY7IxgH9fsHBTmlHyDDpVUaRL9VvpG0nnPX44hpdhM3d/gRqgfaiTOOLfeYCgLFoJbdpLpeKHYZLPYwIqalfRTf4kWU9AnvBrIos8UeG2d4gZfUZrotq5T17N9UesrMNZu8agDbkYR65aaHaUFyM+wkTM9y2QcGK+7fYZVhoUy7KnLCwWlD4yy5dyvIR0HlcgnPVbCQa3d3Lr9ntAJGYscYtgfaEvqGTCBktOWhhvK06q2BY5sA6m+ey6W3tfrKCCV9H4HKhqVu+xQHL+6F1xXDlZTs+4QUqg4B+9ct/uY4tZ1ukxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONFq39CnOQoTQJ0Z9lWolgGTTDUaCRJlHy5H/YZ6cxQ=;
 b=pXoh+6vHft90i84A20WLxsDVwK+i3rzIPHsgh9Sf8LPXddQhpEsB8N7KMT6XspMpfVopzr8V3/pU+tc9KnMiKiGUn/B3TV4LiV2M5TVpOLakosNgpsK4L/wYliLdtiPRWap7/FFci0z9OFyVy0aL5jPp/94lWgKOqsA9GO938pw=
Received: from BN6PR22CA0070.namprd22.prod.outlook.com (2603:10b6:404:ca::32)
 by BN6PR12MB1890.namprd12.prod.outlook.com (2603:10b6:404:106::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Sun, 25 Apr
 2021 08:00:07 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:ca:cafe::50) by BN6PR22CA0070.outlook.office365.com
 (2603:10b6:404:ca::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Sun, 25 Apr 2021 08:00:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Sun, 25 Apr 2021 08:00:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sun, 25 Apr
 2021 03:00:05 -0500
Received: from fiona-codemachine.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Sun, 25 Apr 2021 03:00:04 -0500
From: Feifei Xu <Feifei.Xu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: Correct and simplify sdma 4.x irq.num_types
Date: Sun, 25 Apr 2021 15:59:55 +0800
Message-ID: <20210425075955.49499-2-Feifei.Xu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210425075955.49499-1-Feifei.Xu@amd.com>
References: <20210425075955.49499-1-Feifei.Xu@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd7f4b69-11ac-44cd-04f5-08d907c02478
X-MS-TrafficTypeDiagnostic: BN6PR12MB1890:
X-Microsoft-Antispam-PRVS: <BN6PR12MB189047E7F481578BC42B8108FE439@BN6PR12MB1890.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j4DV1VDqhemmRDJqN9F7HHXx3JAW47aQy0EOXE14QfT31YVb4H3xqomRRTMxO+S4t7uH+hkeyHfz8FfgePiTSV/FztkKFEBm3znu5dVj5noZR6uWO/V2uYNgcggpKUAVc2gdQmdpO50qwwAHdSw9evkFr4HO8yQrTGUeRPLaKDU90ac2ug2slIQriEJ3BBBA9Ff0R6J30c4VYg2UgsoFBJmWkoK1v8FV4uAqiIX2QEpAcJQvAjc+psSnyY7pnF5CpDxJjF9UHrTZ7dnCczPjBxFadGQPkCYWhvE1xq1oCpoYSvyKIv4Mo7TZPNeXkEoirHRuyiFOK+CRbaNlU2L4YSKlWuWb1CUHICsc/vOybz8ZFlGjwr9w23ppzrR8oGYsFsvRHOo65XKvsC0e/7LO4HgRY+05P5UieeVfSbC+eKnlBEM+6lN51BCNHS/g9PqfEXg6qdyzwa1QUJ2TXDJVVf9x7u9aSZ1Dp8OltT4vGC/8pG/xy2la0fh++STO/nlkRmRraRrbsB4YNymAI2H6hHw1IeuGdoK0RUC4sDdFs2ldqndJ1E7CoQsHu6QqRQ8+wHc1vwWUk0YI4L+WY5in2cGexbQ1WNczuiPFXZt3OE1184EgrQwKATTFSLD1SkY8nKKBkMeA5JlHkUeohxaI9T/YnXCMhB/2yG+4ft+CPAUn2BMMVr4RW1CWbU071OkZ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(136003)(346002)(46966006)(36840700001)(36860700001)(5660300002)(47076005)(36756003)(82740400003)(316002)(6666004)(8676002)(478600001)(70586007)(83380400001)(70206006)(86362001)(82310400003)(7696005)(336012)(1076003)(2906002)(8936002)(81166007)(54906003)(186003)(26005)(6916009)(426003)(2616005)(4326008)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2021 08:00:07.6166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7f4b69-11ac-44cd-04f5-08d907c02478
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1890
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
Cc: Feifei Xu <Feifei.Xu@amd.com>, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Correct and init the sdma4.x irq.num_types.

Signed-off-by: Feifei Xu <Feifei.Xu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 29 ++++++++------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 7870fd09d98d..8a9b194b5826 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -2601,33 +2601,22 @@ static const struct amdgpu_irq_src_funcs sdma_v4_0_srbm_write_irq_funcs = {
 
 static void sdma_v4_0_set_irq_funcs(struct amdgpu_device *adev)
 {
+	adev->sdma.trap_irq.num_types = adev->sdma.num_instances;
+	adev->sdma.ecc_irq.num_types = adev->sdma.num_instances;
+
+	/*For Arcturus and Aldebaran, add another 4 irq handler*/
 	switch (adev->sdma.num_instances) {
-	case 1:
-		adev->sdma.trap_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE1;
-		adev->sdma.ecc_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE1;
-		break;
 	case 5:
-		adev->sdma.trap_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE5;
-		adev->sdma.ecc_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE5;
-		adev->sdma.vm_hole_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE5;
-		adev->sdma.doorbell_invalid_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE5;
-		adev->sdma.pool_timeout_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE5;
-		adev->sdma.srbm_write_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE5;
-		break;
 	case 8:
-		adev->sdma.trap_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE7;
-		adev->sdma.ecc_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE7;
-		adev->sdma.vm_hole_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE7;
-		adev->sdma.doorbell_invalid_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE7;
-		adev->sdma.pool_timeout_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE7;
-		adev->sdma.srbm_write_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE7;
+		adev->sdma.vm_hole_irq.num_types = adev->sdma.num_instances;
+		adev->sdma.doorbell_invalid_irq.num_types = adev->sdma.num_instances;
+		adev->sdma.pool_timeout_irq.num_types = adev->sdma.num_instances;
+		adev->sdma.srbm_write_irq.num_types = adev->sdma.num_instances;
 		break;
-	case 2:
 	default:
-		adev->sdma.trap_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE2;
-		adev->sdma.ecc_irq.num_types = AMDGPU_SDMA_IRQ_INSTANCE2;
 		break;
 	}
+
 	adev->sdma.trap_irq.funcs = &sdma_v4_0_trap_irq_funcs;
 	adev->sdma.illegal_inst_irq.funcs = &sdma_v4_0_illegal_inst_irq_funcs;
 	adev->sdma.ecc_irq.funcs = &sdma_v4_0_ecc_irq_funcs;
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
