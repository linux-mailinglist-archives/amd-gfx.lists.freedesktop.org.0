Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 093D74E8D6F
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Mar 2022 07:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712A210E59E;
	Mon, 28 Mar 2022 05:00:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E5110E59E
 for <amd-gfx@lists.freedesktop.org>; Mon, 28 Mar 2022 05:00:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQV1fmiBL8gjEWO0ec+R3MdX+XDu0QVYyd8JcUBw8VREipgDUcPTcVTNg10Y9ZVuhBy4aBkzq+hXxyVxiM+C0VOnhTTQHE6xCC1EgVPeLbanps5l1Bh4H15/v5LKB9cSXmMnn3Pc+Pl/T17vM4LzX+oEqOpn9Z3M4L8Tduos6KTsE+LbMVCQW7IovuyKDforq/EkCwcMmDRlPif2RzE+VDqZk+PkhhYtkA664oUZJu1kVk3esJY01VW5C63ihEQp+I8On/pw1sSs+CU95298PyxQ4gwx3OkFuWd2JLTB08KQp5/ZTaswTEvAqZ0fk8Y1wpjDeAzeCUjy3meaqh2ysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JX6DNNvbymc/5WxarCVkVBFe3rFBfYLn4USK6mfmPkA=;
 b=C+Wlt1ipzuY8Ah2VwK59nJGzSbohTSPiBKyyQdpT2dlKLHEOoRXo/qnPirdgmPYwDD25/HAcRZVsc9tJUjIZgJNpElPLa6OgyHU5zLTYG0jYK5y1LrLSEGUJlfZW3WJz681IDGtUNPYi26L/gEXKNiC+5K0H7mrQYzejy22z+or5/onb1f/p7GlUzwWteOaB259SN+yaqoDN7hYv5YEdL0RTz5JzHOTZDrbau5Vf9paO4LUMdqMgUexW7BSXbZOwLRz3a1rJT1njC9Wn+WusBJFIPsfv8PznLrsK1vUPtmy0NLxN7RjYb76O2Zhzau3kgrXJ91HAq2D6LgKlV91RvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JX6DNNvbymc/5WxarCVkVBFe3rFBfYLn4USK6mfmPkA=;
 b=FCFysjo4PCLwAAMdbZ8CNKcR+j3pafZOJPHgkoq3hETmhf0hJR5YH1B2dZR5Z/Ar4ldT6+4tv8xs3MDCIgztJCh4A576MsiZNd0sTAmaorpa3SZiTVx5wCyU65DT/+AW0J6gRB3ih84bM766rxs1vbvu3gS0vhI4R+z0MdGfZRo=
Received: from MW4PR03CA0052.namprd03.prod.outlook.com (2603:10b6:303:8e::27)
 by MWHPR12MB1277.namprd12.prod.outlook.com (2603:10b6:300:f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Mon, 28 Mar
 2022 05:00:34 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::31) by MW4PR03CA0052.outlook.office365.com
 (2603:10b6:303:8e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Mon, 28 Mar 2022 05:00:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Mon, 28 Mar 2022 05:00:33 +0000
Received: from ruiliji2-lsy-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 00:00:30 -0500
From: "Ji, Ruili" <ruili.ji@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH V2] drm/amdgpu: fix incorrect GCR_GENERAL_CNTL address
Date: Mon, 28 Mar 2022 12:58:45 +0800
Message-ID: <20220328045845.1986195-1-ruili.ji@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f55d9677-12c9-45b9-5bcb-08da1077e400
X-MS-TrafficTypeDiagnostic: MWHPR12MB1277:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1277306AB665B16226BF4A439B1D9@MWHPR12MB1277.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s8GUimuchHq/WUcfcF2N9+yAcEBvEyksCLLON6olFG4w7W96giUP1aIWrnRP1UEPiLxix1QTwbE9yJHSVF/6/UhoXQ4+FRrrAxhv5GBxQuYo/ESlN3EhiKiQ1gITktx6sjNULghKUd1IuVEN96bHDpumf46DUj2P7KWoCu+aUaABFnxRE4lR80Exdxw8lbTAtaoHPnkMXnobL0lfAxLuudbK/HBBmLhJvLvsjg/AanYj1RDr9XgCjZk9ape0L/m+MCZ8uc8NMHgLylf5Nh6CCggchw6AOyjnqSyIVglFIDjMpyrKsBdIRyIPqeQ7YNQchzTRIhba4K2lRQjhd0p4ipJGvRbRyUvqpHFBEmXxSylos7/1ONfyQeAk5YJBesrjEZzs1JGejJtBVpzFoa5LCThvLTbCzZXTEpJSOjtPpU3zAMzfSjOy4yicPe+q6gihbo5RkbDrwYbyTUaZjUeu0oqZoAo/ZnFEKVD79NjUFqogZtlSZeD2QMBkKMsOdRe/Y4w506DngHvY2d1zm3kSEJTKqTJIz0PBAaxDhSFos6lVWn2pXVzwLDwIz0ItwXsS7TW86ApB4GG46BGROSHeWDG3do97XnjoFmvmL+PZI/qXfmPfnjkTxeRjAhETfrE+a4L460nMJ+W/kJxvWkWrkC31qRofX9t3RuVWMBQGQ3KB3lR3hzea0LycUbAVzVCd59zDC2EqhMv0Yo/lBOCtVw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(2906002)(186003)(1076003)(26005)(2616005)(5660300002)(16526019)(47076005)(36860700001)(8936002)(316002)(81166007)(54906003)(8676002)(36756003)(40460700003)(356005)(336012)(6916009)(508600001)(83380400001)(6666004)(7696005)(426003)(70586007)(86362001)(82310400004)(4326008)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 05:00:33.6852 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f55d9677-12c9-45b9-5bcb-08da1077e400
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1277
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
Cc: yifan1.zhang@amd.com, Aaron.Liu@amd.com, prike.liang@amd.com,
 Ray.Huang@amd.com, Alexander.Deucher@amd.com, Ruili Ji <ruiliji2@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Ruili Ji <ruiliji2@amd.com>

gfx10.3.3/gfx10.3.6/gfx10.3.7 shall use 0x1580 address for GCR_GENERAL_CNTL

Signed-off-by: Ruili Ji <ruiliji2@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 99df18ae7316..e4c9d92ac381 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -3300,7 +3300,7 @@ static const struct soc15_reg_golden golden_settings_gc_10_3_3[] =
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmDB_DEBUG3, 0xffffffff, 0x00000280),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmDB_DEBUG4, 0xffffffff, 0x00800000),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGB_ADDR_CONFIG, 0x0c1807ff, 0x00000242),
-	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGCR_GENERAL_CNTL, 0x1ff1ffff, 0x00000500),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGCR_GENERAL_CNTL_Vangogh, 0x1ff1ffff, 0x00000500),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGL1_PIPE_STEER, 0x000000ff, 0x000000e4),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGL2_PIPE_STEER_0, 0x77777777, 0x32103210),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGL2_PIPE_STEER_1, 0x77777777, 0x32103210),
@@ -3436,7 +3436,7 @@ static const struct soc15_reg_golden golden_settings_gc_10_3_6[] =
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmDB_DEBUG3, 0xffffffff, 0x00000280),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmDB_DEBUG4, 0xffffffff, 0x00800000),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGB_ADDR_CONFIG, 0x0c1807ff, 0x00000042),
-	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGCR_GENERAL_CNTL, 0x1ff1ffff, 0x00000500),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGCR_GENERAL_CNTL_Vangogh, 0x1ff1ffff, 0x00000500),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGL1_PIPE_STEER, 0x000000ff, 0x00000044),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGL2_PIPE_STEER_0, 0x77777777, 0x32103210),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGL2_PIPE_STEER_1, 0x77777777, 0x32103210),
@@ -3461,7 +3461,7 @@ static const struct soc15_reg_golden golden_settings_gc_10_3_7[] = {
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmDB_DEBUG3, 0xffffffff, 0x00000280),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmDB_DEBUG4, 0xffffffff, 0x00800000),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGB_ADDR_CONFIG, 0x0c1807ff, 0x00000041),
-	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGCR_GENERAL_CNTL, 0x1ff1ffff, 0x00000500),
+	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGCR_GENERAL_CNTL_Vangogh, 0x1ff1ffff, 0x00000500),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGL1_PIPE_STEER, 0x000000ff, 0x000000e4),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGL2_PIPE_STEER_0, 0x77777777, 0x32103210),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmGL2_PIPE_STEER_1, 0x77777777, 0x32103210),
-- 
2.25.1

