Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEFB52ADE8
	for <lists+amd-gfx@lfdr.de>; Wed, 18 May 2022 00:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D037910EDF8;
	Tue, 17 May 2022 22:15:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3983310EDF8
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 May 2022 22:15:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEGi6ku2nFE9DflZMdZtGxMgaKl3gOnu1zLadN/sbjvC0bh5O1Ftu4ly2kvg440tmsXKZIDBJvvfe1R4z3SFsKkR+uKT9m8o07MFouMF4SFRosvzhWM2ZI1as5zAMB6aizpfZWg9LKyb7r53WJ/rgnQcph/vh2iCy0Kmeal3YPuP10eVXgCA7sVNq+xuBFWKsI4Hdoj+fD4H28u4/bfYeZPEDhZwskE5PNtdhOoON/TTLCV1GCy80jvrvU2GY4vHgHtUQoXC1/2Y8uJyAuEelx8xnH5WEgE8vFZ1KI1ezYJHfUJhR2BOU4wmvf7cYCMetR59ut0HSF2bwewKXuyHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihqhYA6X4osqbE2hrc/FVqqzhFzzWeYlfnbIdLrTyNU=;
 b=Qhy/pRUXr3LVLOil10gHz3KKZ8LJ1AeVcM9v+1Ea3Y4bCzAZ1DM9hOxWTnrp05qvz2o3Icm0exLNyn11GvPbEgpSv5qrB47tr/yipzosNnwJUNhLLfIUQpIdCt17AlawfbM23DohJd9/Vqz1fEn+Ox+dBFHMxdPCnfWUgpFUklOSL7UCMbcnmq69stz08FjivW+CB0ES+rIbDyAVYuibOdLjUP8hb7LVH6q8uolU/qPMlERqhMld3/YFUUPy67x5Zuv4t3yhDCwAUYzHLrHm3SINZHeeaH7ZStrZIb7OlfQ1INrtrWtkyMoEM7+2oFVOfk9Bgp6E+Q+Gxd0hHbgXhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihqhYA6X4osqbE2hrc/FVqqzhFzzWeYlfnbIdLrTyNU=;
 b=BoGKehj4Mii8N4RPwaioL/57fmb+Yu4airCRexMyp1hY7TCOTknFWe7WtFijxYYv5alyqE33wjx4NxyzQta4/GGtaXSOFCdSRVJRtpPMNcymes4AnxxC/jmBxFI/las/3RN5WrYd3UA2QLxkF3utwRdVrFWTSbGYFoKAaRjAuEQ=
Received: from DS7PR06CA0014.namprd06.prod.outlook.com (2603:10b6:8:2a::11) by
 DM6PR12MB3259.namprd12.prod.outlook.com (2603:10b6:5:180::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.18; Tue, 17 May 2022 22:15:39 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::73) by DS7PR06CA0014.outlook.office365.com
 (2603:10b6:8:2a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Tue, 17 May 2022 22:15:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Tue, 17 May 2022 22:15:39 +0000
Received: from eric-tp68xe.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 17 May
 2022 17:15:37 -0500
From: Eric Huang <JinhuiEric.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdkfd: port cwsr trap handler from dkms branch
Date: Tue, 17 May 2022 18:15:24 -0400
Message-ID: <20220517221524.94146-1-JinhuiEric.Huang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c0717e2-e779-4e31-9cc3-08da3852c665
X-MS-TrafficTypeDiagnostic: DM6PR12MB3259:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3259E7360BDA3E5FE750C01482CE9@DM6PR12MB3259.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 414OrEhCicSdA3WR0WM78r8/qIenjQMFUjx94PsM+VUyZtA0oYTltsuZGOQEnWlhUORRxUV7CyOCy9qOq7VON2MGMP5CwQssw3wDkyLAmC2caGTvgzFoRQJjwfmPAbZDr5CbH6r+c6+Yxulbp+xTtbIdR5rZTtvYLseuwuwTLKq1nsxD8UviEQyWgJCetY4XPuUV9QljFaA/FHjLH+aW29d/7FT1lhzElr0nUB96Ye6izlj1V5l2InnnIP/8HNkNmk5wo8vnbEE06GEXnBrBAnVBLhH1GiRwj47Q+Jtz80DkdDqn9TR9CHIn4BMnrVN7MjG5kcwTelFSnkTULjP4DfzcR1OcAiALvr1k/CTNPT2AySQFmXd5q96NEU6dD/Yne0Yu/3wMqZQ03OM1aUxnpXlzxbK5h+Rhr0U7LHdX8dquC0TksFGEUwvsRgKO+fOHJTZwKTOJwai0mmBW9mLd/2WzIf00FOxImTRLIvWpSWufPzVZPBrLNwHTXfG9jZKKr96NjApXGeD0co5Xflxk0UgdHRC4xx/Oril8ogLqbXbeD7MWAwv9wqNgjSmG1RAQrxQth43wquTwbcYA9kvbrwrOUZj1f0gQCqKIRtqP/cfIkCmWrszB9THW0myeEVQpJQ1E61uhfo0+V8RM8VqppWBs4BFmy0tvR8yDQ4myBEycYlPSJFWoRkqB7GKCLPBvtOKbShO+f0+mR2E31nYkPA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(40460700003)(316002)(83380400001)(54906003)(36756003)(6916009)(336012)(426003)(186003)(6666004)(81166007)(7696005)(8676002)(47076005)(4326008)(86362001)(356005)(30864003)(5660300002)(8936002)(16526019)(508600001)(2616005)(1076003)(2906002)(26005)(70586007)(70206006)(36860700001)(82310400005)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 22:15:39.2430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0717e2-e779-4e31-9cc3-08da3852c665
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3259
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
Cc: Eric Huang <jinhuieric.huang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Most of changes are for debugger feature, and it is
to simplify trap handler support for new asics in the
future.

Signed-off-by: Eric Huang <jinhuieric.huang@amd.com>
---
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler.h    | 2527 +++++++++--------
 .../amd/amdkfd/cwsr_trap_handler_gfx10.asm    |  325 ++-
 .../drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm |  244 +-
 3 files changed, 1596 insertions(+), 1500 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
index 475f89700c74..8cbdc7f519c6 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
@@ -166,7 +166,7 @@ static const uint32_t cwsr_trap_gfx8_hex[] = {
 	0x807c847c, 0x806eff6e,
 	0x00000400, 0xbf0a757c,
 	0xbf85ffef, 0xbf9c0000,
-	0xbf8200cd, 0xbef8007e,
+	0xbf8200ce, 0xbef8007e,
 	0x8679ff7f, 0x0000ffff,
 	0x8779ff79, 0x00040000,
 	0xbefa0080, 0xbefb00ff,
@@ -212,304 +212,310 @@ static const uint32_t cwsr_trap_gfx8_hex[] = {
 	0x761e0000, 0xe0524100,
 	0x761e0100, 0xe0524200,
 	0x761e0200, 0xe0524300,
-	0x761e0300, 0xb8f22a05,
-	0x80728172, 0x8e728a72,
-	0xb8f61605, 0x80768176,
-	0x8e768676, 0x80727672,
-	0x80f2c072, 0xb8f31605,
-	0x80738173, 0x8e738473,
-	0x8e7a8273, 0xbefa00ff,
-	0x01000000, 0xbefc0073,
-	0xc031003c, 0x00000072,
-	0x80f2c072, 0xbf8c007f,
-	0x80fc907c, 0xbe802d00,
-	0xbe822d02, 0xbe842d04,
-	0xbe862d06, 0xbe882d08,
-	0xbe8a2d0a, 0xbe8c2d0c,
-	0xbe8e2d0e, 0xbf06807c,
-	0xbf84fff1, 0xb8f22a05,
-	0x80728172, 0x8e728a72,
-	0xb8f61605, 0x80768176,
-	0x8e768676, 0x80727672,
-	0xbefa0084, 0xbefa00ff,
-	0x01000000, 0xc0211cfc,
+	0x761e0300, 0xbf8c0f70,
+	0xb8f22a05, 0x80728172,
+	0x8e728a72, 0xb8f61605,
+	0x80768176, 0x8e768676,
+	0x80727672, 0x80f2c072,
+	0xb8f31605, 0x80738173,
+	0x8e738473, 0x8e7a8273,
+	0xbefa00ff, 0x01000000,
+	0xbefc0073, 0xc031003c,
+	0x00000072, 0x80f2c072,
+	0xbf8c007f, 0x80fc907c,
+	0xbe802d00, 0xbe822d02,
+	0xbe842d04, 0xbe862d06,
+	0xbe882d08, 0xbe8a2d0a,
+	0xbe8c2d0c, 0xbe8e2d0e,
+	0xbf06807c, 0xbf84fff1,
+	0xb8f22a05, 0x80728172,
+	0x8e728a72, 0xb8f61605,
+	0x80768176, 0x8e768676,
+	0x80727672, 0xbefa0084,
+	0xbefa00ff, 0x01000000,
+	0xc0211cfc, 0x00000072,
+	0x80728472, 0xc0211c3c,
 	0x00000072, 0x80728472,
-	0xc0211c3c, 0x00000072,
-	0x80728472, 0xc0211c7c,
+	0xc0211c7c, 0x00000072,
+	0x80728472, 0xc0211bbc,
 	0x00000072, 0x80728472,
-	0xc0211bbc, 0x00000072,
-	0x80728472, 0xc0211bfc,
+	0xc0211bfc, 0x00000072,
+	0x80728472, 0xc0211d3c,
 	0x00000072, 0x80728472,
-	0xc0211d3c, 0x00000072,
-	0x80728472, 0xc0211d7c,
+	0xc0211d7c, 0x00000072,
+	0x80728472, 0xc0211a3c,
 	0x00000072, 0x80728472,
-	0xc0211a3c, 0x00000072,
-	0x80728472, 0xc0211a7c,
+	0xc0211a7c, 0x00000072,
+	0x80728472, 0xc0211dfc,
 	0x00000072, 0x80728472,
-	0xc0211dfc, 0x00000072,
-	0x80728472, 0xc0211b3c,
+	0xc0211b3c, 0x00000072,
+	0x80728472, 0xc0211b7c,
 	0x00000072, 0x80728472,
-	0xc0211b7c, 0x00000072,
-	0x80728472, 0xbf8c007f,
-	0xbefc0073, 0xbefe006e,
-	0xbeff006f, 0x867375ff,
-	0x000003ff, 0xb9734803,
-	0x867375ff, 0xfffff800,
-	0x8f738b73, 0xb973a2c3,
-	0xb977f801, 0x8673ff71,
-	0xf0000000, 0x8f739c73,
-	0x8e739073, 0xbef60080,
-	0x87767376, 0x8673ff71,
-	0x08000000, 0x8f739b73,
-	0x8e738f73, 0x87767376,
-	0x8673ff74, 0x00800000,
-	0x8f739773, 0xb976f807,
-	0x8671ff71, 0x0000ffff,
-	0x86fe7e7e, 0x86ea6a6a,
-	0x8f768374, 0xb976e0c2,
-	0xbf800002, 0xb9740002,
-	0xbf8a0000, 0x95807370,
-	0xbf810000, 0x00000000,
+	0xbf8c007f, 0xbefc0073,
+	0xbefe006e, 0xbeff006f,
+	0x867375ff, 0x000003ff,
+	0xb9734803, 0x867375ff,
+	0xfffff800, 0x8f738b73,
+	0xb973a2c3, 0xb977f801,
+	0x8673ff71, 0xf0000000,
+	0x8f739c73, 0x8e739073,
+	0xbef60080, 0x87767376,
+	0x8673ff71, 0x08000000,
+	0x8f739b73, 0x8e738f73,
+	0x87767376, 0x8673ff74,
+	0x00800000, 0x8f739773,
+	0xb976f807, 0x8671ff71,
+	0x0000ffff, 0x86fe7e7e,
+	0x86ea6a6a, 0x8f768374,
+	0xb976e0c2, 0xbf800002,
+	0xb9740002, 0xbf8a0000,
+	0x95807370, 0xbf810000,
 };
 
 
 static const uint32_t cwsr_trap_gfx9_hex[] = {
-	0xbf820001, 0xbf820248,
-	0xb8f8f802, 0x89788678,
-	0xb8eef801, 0x866eff6e,
-	0x00000800, 0xbf840003,
+	0xbf820001, 0xbf820254,
+	0xb8f8f802, 0x8978ff78,
+	0x00020006, 0xb8fbf803,
 	0x866eff78, 0x00002000,
-	0xbf840016, 0xb8fbf803,
+	0xbf840009, 0x866eff6d,
+	0x00ff0000, 0xbf85001e,
 	0x866eff7b, 0x00000400,
-	0xbf85003b, 0x866eff7b,
-	0x00000800, 0xbf850003,
-	0x866eff7b, 0x00000100,
-	0xbf84000c, 0x866eff78,
-	0x00002000, 0xbf840005,
-	0xbf8e0010, 0xb8eef803,
-	0x866eff6e, 0x00000400,
-	0xbf84fffb, 0x8778ff78,
-	0x00002000, 0x80ec886c,
-	0x82ed806d, 0xb8eef807,
-	0x866fff6e, 0x001f8000,
-	0x8e6f8b6f, 0x8977ff77,
-	0xfc000000, 0x87776f77,
-	0x896eff6e, 0x001f8000,
-	0xb96ef807, 0xb8faf812,
+	0xbf850051, 0xbf8e0010,
+	0xb8fbf803, 0xbf82fffa,
+	0x866eff7b, 0x00000900,
+	0xbf850015, 0x866eff7b,
+	0x000071ff, 0xbf840008,
+	0x866fff7b, 0x00007080,
+	0xbf840001, 0xbeee1a87,
+	0xb8eff801, 0x8e6e8c6e,
+	0x866e6f6e, 0xbf85000a,
+	0x866eff6d, 0x00ff0000,
+	0xbf850007, 0xb8eef801,
+	0x866eff6e, 0x00000800,
+	0xbf850003, 0x866eff7b,
+	0x00000400, 0xbf850036,
+	0xb8faf807, 0x867aff7a,
+	0x001f8000, 0x8e7a8b7a,
+	0x8977ff77, 0xfc000000,
+	0x87777a77, 0xba7ff807,
+	0x00000000, 0xb8faf812,
 	0xb8fbf813, 0x8efa887a,
-	0xc0071bbd, 0x00000000,
-	0xbf8cc07f, 0xc0071ebd,
-	0x00000008, 0xbf8cc07f,
-	0x86ee6e6e, 0xbf840001,
-	0xbe801d6e, 0xb8fbf803,
-	0x867bff7b, 0x000001ff,
+	0xc0031bbd, 0x00000010,
+	0xbf8cc07f, 0x8e6e976e,
+	0x8977ff77, 0x00800000,
+	0x87776e77, 0xc0071bbd,
+	0x00000000, 0xbf8cc07f,
+	0xc0071ebd, 0x00000008,
+	0xbf8cc07f, 0x86ee6e6e,
+	0xbf840001, 0xbe801d6e,
+	0x866eff6d, 0x01ff0000,
+	0xbf850005, 0x8778ff78,
+	0x00002000, 0x80ec886c,
+	0x82ed806d, 0xbf820005,
+	0x866eff6d, 0x01000000,
 	0xbf850002, 0x806c846c,
 	0x826d806d, 0x866dff6d,
-	0x0000ffff, 0x8f6e8b77,
-	0x866eff6e, 0x001f8000,
-	0xb96ef807, 0x86fe7e7e,
+	0x0000ffff, 0x8f7a8b77,
+	0x867aff7a, 0x001f8000,
+	0xb97af807, 0x86fe7e7e,
 	0x86ea6a6a, 0x8f6e8378,
 	0xb96ee0c2, 0xbf800002,
 	0xb9780002, 0xbe801f6c,
 	0x866dff6d, 0x0000ffff,
 	0xbefa0080, 0xb97a0283,
-	0xb8fa2407, 0x8e7a9b7a,
-	0x876d7a6d, 0xb8fa03c7,
-	0x8e7a9a7a, 0x876d7a6d,
 	0xb8faf807, 0x867aff7a,
-	0x00007fff, 0xb97af807,
-	0xbeee007e, 0xbeef007f,
-	0xbefe0180, 0xbf900004,
-	0x877a8478, 0xb97af802,
-	0xbf8e0002, 0xbf88fffe,
-	0xb8fa2a05, 0x807a817a,
-	0x8e7a8a7a, 0xb8fb1605,
-	0x807b817b, 0x8e7b867b,
-	0x807a7b7a, 0x807a7e7a,
-	0x827b807f, 0x867bff7b,
-	0x0000ffff, 0xc04b1c3d,
-	0x00000050, 0xbf8cc07f,
-	0xc04b1d3d, 0x00000060,
-	0xbf8cc07f, 0xc0431e7d,
-	0x00000074, 0xbf8cc07f,
-	0xbef4007e, 0x8675ff7f,
-	0x0000ffff, 0x8775ff75,
-	0x00040000, 0xbef60080,
-	0xbef700ff, 0x00807fac,
-	0x867aff7f, 0x08000000,
-	0x8f7a837a, 0x87777a77,
-	0x867aff7f, 0x70000000,
-	0x8f7a817a, 0x87777a77,
-	0xbef1007c, 0xbef00080,
-	0xb8f02a05, 0x80708170,
-	0x8e708a70, 0xb8fa1605,
-	0x807a817a, 0x8e7a867a,
-	0x80707a70, 0xbef60084,
-	0xbef600ff, 0x01000000,
-	0xbefe007c, 0xbefc0070,
-	0xc0611c7a, 0x0000007c,
-	0xbf8cc07f, 0x80708470,
-	0xbefc007e, 0xbefe007c,
-	0xbefc0070, 0xc0611b3a,
+	0x001f8000, 0x8e7a8b7a,
+	0x8977ff77, 0xfc000000,
+	0x87777a77, 0xba7ff807,
+	0x00000000, 0xbeee007e,
+	0xbeef007f, 0xbefe0180,
+	0xbf900004, 0x877a8478,
+	0xb97af802, 0xbf8e0002,
+	0xbf88fffe, 0xb8fa2a05,
+	0x807a817a, 0x8e7a8a7a,
+	0xb8fb1605, 0x807b817b,
+	0x8e7b867b, 0x807a7b7a,
+	0x807a7e7a, 0x827b807f,
+	0x867bff7b, 0x0000ffff,
+	0xc04b1c3d, 0x00000050,
+	0xbf8cc07f, 0xc04b1d3d,
+	0x00000060, 0xbf8cc07f,
+	0xc0431e7d, 0x00000074,
+	0xbf8cc07f, 0xbef4007e,
+	0x8675ff7f, 0x0000ffff,
+	0x8775ff75, 0x00040000,
+	0xbef60080, 0xbef700ff,
+	0x00807fac, 0xbef1007c,
+	0xbef00080, 0xb8f02a05,
+	0x80708170, 0x8e708a70,
+	0xb8fa1605, 0x807a817a,
+	0x8e7a867a, 0x80707a70,
+	0xbef60084, 0xbef600ff,
+	0x01000000, 0xbefe007c,
+	0xbefc0070, 0xc0611c7a,
 	0x0000007c, 0xbf8cc07f,
 	0x80708470, 0xbefc007e,
 	0xbefe007c, 0xbefc0070,
-	0xc0611b7a, 0x0000007c,
+	0xc0611b3a, 0x0000007c,
 	0xbf8cc07f, 0x80708470,
 	0xbefc007e, 0xbefe007c,
-	0xbefc0070, 0xc0611bba,
+	0xbefc0070, 0xc0611b7a,
 	0x0000007c, 0xbf8cc07f,
 	0x80708470, 0xbefc007e,
 	0xbefe007c, 0xbefc0070,
-	0xc0611bfa, 0x0000007c,
+	0xc0611bba, 0x0000007c,
 	0xbf8cc07f, 0x80708470,
 	0xbefc007e, 0xbefe007c,
-	0xbefc0070, 0xc0611e3a,
-	0x0000007c, 0xbf8cc07f,
-	0x80708470, 0xbefc007e,
-	0xb8fbf803, 0xbefe007c,
-	0xbefc0070, 0xc0611efa,
+	0xbefc0070, 0xc0611bfa,
 	0x0000007c, 0xbf8cc07f,
 	0x80708470, 0xbefc007e,
 	0xbefe007c, 0xbefc0070,
-	0xc0611a3a, 0x0000007c,
+	0xc0611e3a, 0x0000007c,
+	0xbf8cc07f, 0x80708470,
+	0xbefc007e, 0xb8fbf803,
+	0xbefe007c, 0xbefc0070,
+	0xc0611efa, 0x0000007c,
 	0xbf8cc07f, 0x80708470,
 	0xbefc007e, 0xbefe007c,
-	0xbefc0070, 0xc0611a7a,
-	0x0000007c, 0xbf8cc07f,
-	0x80708470, 0xbefc007e,
-	0xb8f1f801, 0xbefe007c,
-	0xbefc0070, 0xc0611c7a,
+	0xbefc0070, 0xc0611a3a,
 	0x0000007c, 0xbf8cc07f,
 	0x80708470, 0xbefc007e,
-	0x867aff7f, 0x04000000,
-	0xbeef0080, 0x876f6f7a,
-	0xb8f02a05, 0x80708170,
-	0x8e708a70, 0xb8fb1605,
-	0x807b817b, 0x8e7b847b,
-	0x8e76827b, 0xbef600ff,
-	0x01000000, 0xbef20174,
-	0x80747074, 0x82758075,
-	0xbefc0080, 0xbf800000,
-	0xbe802b00, 0xbe822b02,
-	0xbe842b04, 0xbe862b06,
-	0xbe882b08, 0xbe8a2b0a,
-	0xbe8c2b0c, 0xbe8e2b0e,
-	0xc06b003a, 0x00000000,
-	0xbf8cc07f, 0xc06b013a,
-	0x00000010, 0xbf8cc07f,
-	0xc06b023a, 0x00000020,
-	0xbf8cc07f, 0xc06b033a,
-	0x00000030, 0xbf8cc07f,
-	0x8074c074, 0x82758075,
-	0x807c907c, 0xbf0a7b7c,
-	0xbf85ffe7, 0xbef40172,
-	0xbef00080, 0xbefe00c1,
-	0xbeff00c1, 0xbee80080,
-	0xbee90080, 0xbef600ff,
-	0x01000000, 0x867aff78,
-	0x00400000, 0xbf850003,
-	0xb8faf803, 0x897a7aff,
-	0x10000000, 0xbf85004d,
-	0xbe840080, 0xd2890000,
-	0x00000900, 0x80048104,
-	0xd2890001, 0x00000900,
-	0x80048104, 0xd2890002,
-	0x00000900, 0x80048104,
-	0xd2890003, 0x00000900,
-	0x80048104, 0xc069003a,
-	0x00000070, 0xbf8cc07f,
-	0x80709070, 0xbf06c004,
-	0xbf84ffee, 0xbe840080,
-	0xd2890000, 0x00000901,
+	0xbefe007c, 0xbefc0070,
+	0xc0611a7a, 0x0000007c,
+	0xbf8cc07f, 0x80708470,
+	0xbefc007e, 0xb8f1f801,
+	0xbefe007c, 0xbefc0070,
+	0xc0611c7a, 0x0000007c,
+	0xbf8cc07f, 0x80708470,
+	0xbefc007e, 0x867aff7f,
+	0x04000000, 0xbeef0080,
+	0x876f6f7a, 0xb8f02a05,
+	0x80708170, 0x8e708a70,
+	0xb8fb1605, 0x807b817b,
+	0x8e7b847b, 0x8e76827b,
+	0xbef600ff, 0x01000000,
+	0xbef20174, 0x80747074,
+	0x82758075, 0xbefc0080,
+	0xbf800000, 0xbe802b00,
+	0xbe822b02, 0xbe842b04,
+	0xbe862b06, 0xbe882b08,
+	0xbe8a2b0a, 0xbe8c2b0c,
+	0xbe8e2b0e, 0xc06b003a,
+	0x00000000, 0xbf8cc07f,
+	0xc06b013a, 0x00000010,
+	0xbf8cc07f, 0xc06b023a,
+	0x00000020, 0xbf8cc07f,
+	0xc06b033a, 0x00000030,
+	0xbf8cc07f, 0x8074c074,
+	0x82758075, 0x807c907c,
+	0xbf0a7b7c, 0xbf85ffe7,
+	0xbef40172, 0xbef00080,
+	0xbefe00c1, 0xbeff00c1,
+	0xbee80080, 0xbee90080,
+	0xbef600ff, 0x01000000,
+	0x867aff78, 0x00400000,
+	0xbf850003, 0xb8faf803,
+	0x897a7aff, 0x10000000,
+	0xbf85004d, 0xbe840080,
+	0xd2890000, 0x00000900,
 	0x80048104, 0xd2890001,
-	0x00000901, 0x80048104,
-	0xd2890002, 0x00000901,
+	0x00000900, 0x80048104,
+	0xd2890002, 0x00000900,
 	0x80048104, 0xd2890003,
-	0x00000901, 0x80048104,
+	0x00000900, 0x80048104,
 	0xc069003a, 0x00000070,
 	0xbf8cc07f, 0x80709070,
 	0xbf06c004, 0xbf84ffee,
 	0xbe840080, 0xd2890000,
-	0x00000902, 0x80048104,
-	0xd2890001, 0x00000902,
+	0x00000901, 0x80048104,
+	0xd2890001, 0x00000901,
 	0x80048104, 0xd2890002,
-	0x00000902, 0x80048104,
-	0xd2890003, 0x00000902,
+	0x00000901, 0x80048104,
+	0xd2890003, 0x00000901,
 	0x80048104, 0xc069003a,
 	0x00000070, 0xbf8cc07f,
 	0x80709070, 0xbf06c004,
 	0xbf84ffee, 0xbe840080,
-	0xd2890000, 0x00000903,
+	0xd2890000, 0x00000902,
 	0x80048104, 0xd2890001,
-	0x00000903, 0x80048104,
-	0xd2890002, 0x00000903,
+	0x00000902, 0x80048104,
+	0xd2890002, 0x00000902,
 	0x80048104, 0xd2890003,
-	0x00000903, 0x80048104,
+	0x00000902, 0x80048104,
 	0xc069003a, 0x00000070,
 	0xbf8cc07f, 0x80709070,
 	0xbf06c004, 0xbf84ffee,
-	0xbf820008, 0xe0724000,
-	0x701d0000, 0xe0724100,
-	0x701d0100, 0xe0724200,
-	0x701d0200, 0xe0724300,
-	0x701d0300, 0xbefe00c1,
-	0xbeff00c1, 0xb8fb4306,
-	0x867bc17b, 0xbf840063,
-	0xbf8a0000, 0x867aff6f,
-	0x04000000, 0xbf84005f,
-	0x8e7b867b, 0x8e7b827b,
-	0xbef6007b, 0xb8f02a05,
-	0x80708170, 0x8e708a70,
-	0xb8fa1605, 0x807a817a,
-	0x8e7a867a, 0x80707a70,
-	0x8070ff70, 0x00000080,
-	0xbef600ff, 0x01000000,
-	0xbefc0080, 0xd28c0002,
-	0x000100c1, 0xd28d0003,
-	0x000204c1, 0x867aff78,
-	0x00400000, 0xbf850003,
-	0xb8faf803, 0x897a7aff,
-	0x10000000, 0xbf850030,
-	0x24040682, 0xd86e4000,
-	0x00000002, 0xbf8cc07f,
 	0xbe840080, 0xd2890000,
-	0x00000900, 0x80048104,
-	0xd2890001, 0x00000900,
+	0x00000903, 0x80048104,
+	0xd2890001, 0x00000903,
 	0x80048104, 0xd2890002,
-	0x00000900, 0x80048104,
-	0xd2890003, 0x00000900,
+	0x00000903, 0x80048104,
+	0xd2890003, 0x00000903,
 	0x80048104, 0xc069003a,
 	0x00000070, 0xbf8cc07f,
 	0x80709070, 0xbf06c004,
-	0xbf84ffee, 0xbe840080,
-	0xd2890000, 0x00000901,
+	0xbf84ffee, 0xbf820008,
+	0xe0724000, 0x701d0000,
+	0xe0724100, 0x701d0100,
+	0xe0724200, 0x701d0200,
+	0xe0724300, 0x701d0300,
+	0xbefe00c1, 0xbeff00c1,
+	0xb8fb4306, 0x867bc17b,
+	0xbf840063, 0xbf8a0000,
+	0x867aff6f, 0x04000000,
+	0xbf84005f, 0x8e7b867b,
+	0x8e7b827b, 0xbef6007b,
+	0xb8f02a05, 0x80708170,
+	0x8e708a70, 0xb8fa1605,
+	0x807a817a, 0x8e7a867a,
+	0x80707a70, 0x8070ff70,
+	0x00000080, 0xbef600ff,
+	0x01000000, 0xbefc0080,
+	0xd28c0002, 0x000100c1,
+	0xd28d0003, 0x000204c1,
+	0x867aff78, 0x00400000,
+	0xbf850003, 0xb8faf803,
+	0x897a7aff, 0x10000000,
+	0xbf850030, 0x24040682,
+	0xd86e4000, 0x00000002,
+	0xbf8cc07f, 0xbe840080,
+	0xd2890000, 0x00000900,
 	0x80048104, 0xd2890001,
-	0x00000901, 0x80048104,
-	0xd2890002, 0x00000901,
+	0x00000900, 0x80048104,
+	0xd2890002, 0x00000900,
 	0x80048104, 0xd2890003,
-	0x00000901, 0x80048104,
+	0x00000900, 0x80048104,
 	0xc069003a, 0x00000070,
 	0xbf8cc07f, 0x80709070,
 	0xbf06c004, 0xbf84ffee,
-	0x680404ff, 0x00000200,
+	0xbe840080, 0xd2890000,
+	0x00000901, 0x80048104,
+	0xd2890001, 0x00000901,
+	0x80048104, 0xd2890002,
+	0x00000901, 0x80048104,
+	0xd2890003, 0x00000901,
+	0x80048104, 0xc069003a,
+	0x00000070, 0xbf8cc07f,
+	0x80709070, 0xbf06c004,
+	0xbf84ffee, 0x680404ff,
+	0x00000200, 0xd0c9006a,
+	0x0000f702, 0xbf87ffd2,
+	0xbf820015, 0xd1060002,
+	0x00011103, 0x7e0602ff,
+	0x00000200, 0xbefc00ff,
+	0x00010000, 0xbe800077,
+	0x8677ff77, 0xff7fffff,
+	0x8777ff77, 0x00058000,
+	0xd8ec0000, 0x00000002,
+	0xbf8cc07f, 0xe0765000,
+	0x701d0002, 0x68040702,
 	0xd0c9006a, 0x0000f702,
-	0xbf87ffd2, 0xbf820015,
-	0xd1060002, 0x00011103,
-	0x7e0602ff, 0x00000200,
-	0xbefc00ff, 0x00010000,
-	0xbe800077, 0x8677ff77,
-	0xff7fffff, 0x8777ff77,
-	0x00058000, 0xd8ec0000,
-	0x00000002, 0xbf8cc07f,
-	0xe0765000, 0x701d0002,
-	0x68040702, 0xd0c9006a,
-	0x0000f702, 0xbf87fff7,
-	0xbef70000, 0xbef000ff,
-	0x00000400, 0xbefe00c1,
-	0xbeff00c1, 0xb8fb2a05,
-	0x807b817b, 0x8e7b827b,
-	0x8e76887b, 0xbef600ff,
+	0xbf87fff7, 0xbef70000,
+	0xbef000ff, 0x00000400,
+	0xbefe00c1, 0xbeff00c1,
+	0xb8fb2a05, 0x807b817b,
+	0x8e7b827b, 0xbef600ff,
 	0x01000000, 0xbefc0084,
 	0xbf0a7b7c, 0xbf84006d,
 	0xbf11017c, 0x807bff7b,
@@ -566,15 +572,11 @@ static const uint32_t cwsr_trap_gfx9_hex[] = {
 	0x701d0300, 0x807c847c,
 	0x8070ff70, 0x00000400,
 	0xbf0a7b7c, 0xbf85ffef,
-	0xbf9c0000, 0xbf8200da,
+	0xbf9c0000, 0xbf8200c7,
 	0xbef4007e, 0x8675ff7f,
 	0x0000ffff, 0x8775ff75,
 	0x00040000, 0xbef60080,
 	0xbef700ff, 0x00807fac,
-	0x866eff7f, 0x08000000,
-	0x8f6e836e, 0x87776e77,
-	0x866eff7f, 0x70000000,
-	0x8f6e816e, 0x87776e77,
 	0x866eff7f, 0x04000000,
 	0xbf84001e, 0xbefe00c1,
 	0xbeff00c1, 0xb8ef4306,
@@ -591,34 +593,34 @@ static const uint32_t cwsr_trap_gfx9_hex[] = {
 	0x781d0000, 0x807cff7c,
 	0x00000200, 0x8078ff78,
 	0x00000200, 0xbf0a6f7c,
-	0xbf85fff6, 0xbef80080,
-	0xbefe00c1, 0xbeff00c1,
-	0xb8ef2a05, 0x806f816f,
-	0x8e6f826f, 0x8e76886f,
-	0xbef600ff, 0x01000000,
-	0xbeee0078, 0x8078ff78,
-	0x00000400, 0xbefc0084,
-	0xbf11087c, 0x806fff6f,
-	0x00008000, 0xe0524000,
-	0x781d0000, 0xe0524100,
-	0x781d0100, 0xe0524200,
-	0x781d0200, 0xe0524300,
-	0x781d0300, 0xbf8c0f70,
-	0x7e000300, 0x7e020301,
-	0x7e040302, 0x7e060303,
-	0x807c847c, 0x8078ff78,
-	0x00000400, 0xbf0a6f7c,
-	0xbf85ffee, 0xbf9c0000,
-	0xe0524000, 0x6e1d0000,
-	0xe0524100, 0x6e1d0100,
-	0xe0524200, 0x6e1d0200,
-	0xe0524300, 0x6e1d0300,
-	0xb8f82a05, 0x80788178,
-	0x8e788a78, 0xb8ee1605,
-	0x806e816e, 0x8e6e866e,
-	0x80786e78, 0x80f8c078,
-	0xb8ef1605, 0x806f816f,
-	0x8e6f846f, 0x8e76826f,
+	0xbf85fff6, 0xbefe00c1,
+	0xbeff00c1, 0xbef600ff,
+	0x01000000, 0xb8ef2a05,
+	0x806f816f, 0x8e6f826f,
+	0x806fff6f, 0x00008000,
+	0xbef80080, 0xbeee0078,
+	0x8078ff78, 0x00000400,
+	0xbefc0084, 0xbf11087c,
+	0xe0524000, 0x781d0000,
+	0xe0524100, 0x781d0100,
+	0xe0524200, 0x781d0200,
+	0xe0524300, 0x781d0300,
+	0xbf8c0f70, 0x7e000300,
+	0x7e020301, 0x7e040302,
+	0x7e060303, 0x807c847c,
+	0x8078ff78, 0x00000400,
+	0xbf0a6f7c, 0xbf85ffee,
+	0xbf9c0000, 0xe0524000,
+	0x6e1d0000, 0xe0524100,
+	0x6e1d0100, 0xe0524200,
+	0x6e1d0200, 0xe0524300,
+	0x6e1d0300, 0xbf8c0f70,
+	0xb8f82a05, 0x80788178,
+	0x8e788a78, 0xb8ee1605,
+	0x806e816e, 0x8e6e866e,
+	0x80786e78, 0x80f8c078,
+	0xb8ef1605, 0x806f816f,
+	0x8e6f846f, 0x8e76826f,
 	0xbef600ff, 0x01000000,
 	0xbefc006f, 0xc031003a,
 	0x00000078, 0x80f8c078,
@@ -663,90 +665,101 @@ static const uint32_t cwsr_trap_gfx9_hex[] = {
 	0xc00b1c37, 0x00000050,
 	0xc00b1d37, 0x00000060,
 	0xc0031e77, 0x00000074,
-	0xbf8cc07f, 0x866fff6d,
-	0xf8000000, 0x8f6f9b6f,
-	0x8e6f906f, 0xbeee0080,
-	0x876e6f6e, 0x866fff6d,
-	0x04000000, 0x8f6f9a6f,
-	0x8e6f8f6f, 0x876e6f6e,
-	0x866fff7a, 0x00800000,
-	0x8f6f976f, 0xb96ef807,
-	0x866dff6d, 0x0000ffff,
-	0x86fe7e7e, 0x86ea6a6a,
-	0x8f6e837a, 0xb96ee0c2,
-	0xbf800002, 0xb97a0002,
-	0xbf8a0000, 0x95806f6c,
-	0xbf810000, 0x00000000,
+	0xbf8cc07f, 0x8f6e8b77,
+	0x866eff6e, 0x001f8000,
+	0xb96ef807, 0x866dff6d,
+	0x0000ffff, 0x86fe7e7e,
+	0x86ea6a6a, 0x8f6e837a,
+	0xb96ee0c2, 0xbf800002,
+	0xb97a0002, 0xbf8a0000,
+	0xbe801f6c, 0xbf810000,
 };
 
 static const uint32_t cwsr_trap_nv1x_hex[] = {
-	0xbf820001, 0xbf8201cd,
+	0xbf820001, 0xbf8201f1,
 	0xb0804004, 0xb978f802,
-	0x8a788678, 0xb96ef801,
-	0x876eff6e, 0x00000800,
-	0xbf840003, 0x876eff78,
+	0x8a78ff78, 0x00020006,
+	0xb97bf803, 0x876eff78,
 	0x00002000, 0xbf840009,
-	0xb97bf803, 0x876eff7b,
-	0x00000400, 0xbf850033,
-	0x876eff7b, 0x00000100,
-	0xbf840002, 0x8878ff78,
-	0x00002000, 0x8a77ff77,
-	0xff000000, 0xb96ef807,
-	0x876fff6e, 0x02000000,
-	0x8f6f866f, 0x88776f77,
-	0x876fff6e, 0x003f8000,
-	0x8f6f896f, 0x88776f77,
-	0x8a6eff6e, 0x023f8000,
-	0xb9eef807, 0xb97af812,
+	0x876eff6d, 0x00ff0000,
+	0xbf85001e, 0x876eff7b,
+	0x00000400, 0xbf850057,
+	0xbf8e0010, 0xb97bf803,
+	0xbf82fffa, 0x876eff7b,
+	0x00000900, 0xbf850015,
+	0x876eff7b, 0x000071ff,
+	0xbf840008, 0x876fff7b,
+	0x00007080, 0xbf840001,
+	0xbeee1d87, 0xb96ff801,
+	0x8f6e8c6e, 0x876e6f6e,
+	0xbf85000a, 0x876eff6d,
+	0x00ff0000, 0xbf850007,
+	0xb96ef801, 0x876eff6e,
+	0x00000800, 0xbf850003,
+	0x876eff7b, 0x00000400,
+	0xbf85003c, 0x8a77ff77,
+	0xff000000, 0xb97af807,
+	0x877bff7a, 0x02000000,
+	0x8f7b867b, 0x88777b77,
+	0x877bff7a, 0x003f8000,
+	0x8f7b897b, 0x88777b77,
+	0x8a7aff7a, 0x023f8000,
+	0xb9faf807, 0xb97af812,
 	0xb97bf813, 0x8ffa887a,
-	0xf4051bbd, 0xfa000000,
-	0xbf8cc07f, 0xf4051ebd,
-	0xfa000008, 0xbf8cc07f,
-	0x87ee6e6e, 0xbf840001,
-	0xbe80206e, 0xb97bf803,
-	0x877bff7b, 0x000001ff,
+	0xf4011bbd, 0xfa000010,
+	0xbf8cc07f, 0x8f6e976e,
+	0x8a77ff77, 0x00800000,
+	0x88776e77, 0xf4051bbd,
+	0xfa000000, 0xbf8cc07f,
+	0xf4051ebd, 0xfa000008,
+	0xbf8cc07f, 0x87ee6e6e,
+	0xbf840001, 0xbe80206e,
+	0x876eff6d, 0x01ff0000,
+	0xbf850005, 0x8878ff78,
+	0x00002000, 0x80ec886c,
+	0x82ed806d, 0xbf820005,
+	0x876eff6d, 0x01000000,
 	0xbf850002, 0x806c846c,
 	0x826d806d, 0x876dff6d,
-	0x0000ffff, 0x906e8977,
-	0x876fff6e, 0x003f8000,
-	0x906e8677, 0x876eff6e,
-	0x02000000, 0x886e6f6e,
-	0xb9eef807, 0x87fe7e7e,
+	0x0000ffff, 0x907a8977,
+	0x877bff7a, 0x003f8000,
+	0x907a8677, 0x877aff7a,
+	0x02000000, 0x887a7b7a,
+	0xb9faf807, 0x87fe7e7e,
 	0x87ea6a6a, 0xb9f8f802,
 	0xbe80226c, 0x876dff6d,
 	0x0000ffff, 0xbefa0380,
-	0xb9fa0283, 0xb97a2c07,
-	0x8f7a9a7a, 0x886d7a6d,
-	0xb97a03c7, 0x8f7a997a,
-	0x886d7a6d, 0xb97a0647,
-	0x8f7a987a, 0x886d7a6d,
-	0xb97af807, 0x877aff7a,
-	0x00007fff, 0xb9faf807,
-	0xbeee037e, 0xbeef037f,
-	0xbefe0480, 0xbf900004,
-	0xbf8e0002, 0xbf88fffe,
-	0xb97b02dc, 0x8f7b997b,
-	0x887b7b7f, 0xb97a2a05,
+	0xb9fa0283, 0x8a77ff77,
+	0xff000000, 0xb97af807,
+	0x877bff7a, 0x02000000,
+	0x8f7b867b, 0x88777b77,
+	0x877bff7a, 0x003f8000,
+	0x8f7b897b, 0x88777b77,
+	0x8a7aff7a, 0x023f8000,
+	0xb9faf807, 0xbeee037e,
+	0xbeef037f, 0xbefe0480,
+	0xbf900004, 0xbf8e0002,
+	0xbf88fffe, 0x877aff7f,
+	0x04000000, 0x8f7a857a,
+	0x886d7a6d, 0xb97b02dc,
+	0x8f7b997b, 0xb97a2a05,
 	0x807a817a, 0xbf0d997b,
 	0xbf850002, 0x8f7a897a,
 	0xbf820001, 0x8f7a8a7a,
-	0x877bff7f, 0x0000ffff,
-	0x807aff7a, 0x00000200,
-	0x807a7e7a, 0x827b807b,
-	0xf4491c3d, 0xfa000050,
-	0xf4491d3d, 0xfa000060,
-	0xf4411e7d, 0xfa000074,
-	0xbef4037e, 0x8775ff7f,
-	0x0000ffff, 0x8875ff75,
-	0x00040000, 0xbef60380,
-	0xbef703ff, 0x10807fac,
-	0x877aff7f, 0x08000000,
-	0x907a837a, 0x88777a77,
-	0x877aff7f, 0x70000000,
-	0x907a817a, 0x88777a77,
-	0xbef1037c, 0xbef00380,
-	0xb97302dc, 0x8f739973,
-	0x8873737f, 0xb97bf816,
+	0xb97b1e06, 0x8f7b8a7b,
+	0x807a7b7a, 0x877bff7f,
+	0x0000ffff, 0x807aff7a,
+	0x00000200, 0x807a7e7a,
+	0x827b807b, 0xf4491c3d,
+	0xfa000050, 0xf4491d3d,
+	0xfa000060, 0xf4411e7d,
+	0xfa000074, 0xbef4037e,
+	0x8775ff7f, 0x0000ffff,
+	0x8875ff75, 0x00040000,
+	0xbef60380, 0xbef703ff,
+	0x10807fac, 0xbef1037c,
+	0xbef00380, 0xb97302dc,
+	0x8f739973, 0xb97bf816,
 	0xba80f816, 0x00000000,
 	0xbefe03c1, 0x907c9973,
 	0x877c817c, 0xbf06817c,
@@ -776,8 +789,9 @@ static const uint32_t cwsr_trap_nv1x_hex[] = {
 	0xbefe037c, 0xbefc0370,
 	0xf4611b3a, 0xf8000000,
 	0x80708470, 0xbefc037e,
+	0x8a7aff6d, 0x80000000,
 	0xbefe037c, 0xbefc0370,
-	0xf4611b7a, 0xf8000000,
+	0xf4611eba, 0xf8000000,
 	0x80708470, 0xbefc037e,
 	0xbefe037c, 0xbefc0370,
 	0xf4611bba, 0xf8000000,
@@ -838,7 +852,7 @@ static const uint32_t cwsr_trap_nv1x_hex[] = {
 	0xbf820001, 0xbeff03c1,
 	0xb97b4306, 0x877bc17b,
 	0xbf840044, 0xbf8a0000,
-	0x877aff73, 0x04000000,
+	0x877aff6d, 0x80000000,
 	0xbf840040, 0x8f7b867b,
 	0x8f7b827b, 0xbef6037b,
 	0xb9702a05, 0x80708170,
@@ -894,7 +908,7 @@ static const uint32_t cwsr_trap_nv1x_hex[] = {
 	0xbf0a7b7c, 0xbf85ffef,
 	0xbf820025, 0xbef603ff,
 	0x01000000, 0xbefc0384,
-	0xbf0a7b7c, 0xbf840020,
+	0xbf0a7b7c, 0xbf840011,
 	0x7e008700, 0x7e028701,
 	0x7e048702, 0x7e068703,
 	0xe0704000, 0x705d0000,
@@ -911,71 +925,69 @@ static const uint32_t cwsr_trap_nv1x_hex[] = {
 	0x705d0000, 0x807c817c,
 	0x8070ff70, 0x00000080,
 	0xbf0a7b7c, 0xbf85fff8,
-	0xbf820151, 0xbef4037e,
+	0xbf820144, 0xbef4037e,
 	0x8775ff7f, 0x0000ffff,
 	0x8875ff75, 0x00040000,
 	0xbef60380, 0xbef703ff,
-	0x10807fac, 0x876eff7f,
-	0x08000000, 0x906e836e,
-	0x88776e77, 0x876eff7f,
-	0x70000000, 0x906e816e,
-	0x88776e77, 0xb97202dc,
-	0x8f729972, 0x8872727f,
-	0x876eff7f, 0x04000000,
-	0xbf840034, 0xbefe03c1,
-	0x907c9972, 0x877c817c,
-	0xbf06817c, 0xbf850002,
-	0xbeff0380, 0xbf820001,
-	0xbeff03c1, 0xb96f4306,
-	0x876fc16f, 0xbf840029,
-	0x8f6f866f, 0x8f6f826f,
-	0xbef6036f, 0xb9782a05,
-	0x80788178, 0xbf0d9972,
-	0xbf850002, 0x8f788978,
-	0xbf820001, 0x8f788a78,
-	0xb96e1e06, 0x8f6e8a6e,
-	0x80786e78, 0x8078ff78,
-	0x00000200, 0x8078ff78,
-	0x00000080, 0xbef603ff,
-	0x01000000, 0x907c9972,
-	0x877c817c, 0xbf06817c,
-	0xbefc0380, 0xbf850009,
-	0xe0310000, 0x781d0000,
-	0x807cff7c, 0x00000080,
-	0x8078ff78, 0x00000080,
-	0xbf0a6f7c, 0xbf85fff8,
-	0xbf820008, 0xe0310000,
-	0x781d0000, 0x807cff7c,
-	0x00000100, 0x8078ff78,
-	0x00000100, 0xbf0a6f7c,
-	0xbf85fff8, 0xbef80380,
+	0x10807fac, 0xb97202dc,
+	0x8f729972, 0x876eff7f,
+	0x04000000, 0xbf840034,
 	0xbefe03c1, 0x907c9972,
 	0x877c817c, 0xbf06817c,
 	0xbf850002, 0xbeff0380,
 	0xbf820001, 0xbeff03c1,
-	0xb96f2a05, 0x806f816f,
-	0x8f6f826f, 0x907c9972,
-	0x877c817c, 0xbf06817c,
-	0xbf850021, 0xbef603ff,
-	0x01000000, 0xbeee0378,
+	0xb96f4306, 0x876fc16f,
+	0xbf840029, 0x8f6f866f,
+	0x8f6f826f, 0xbef6036f,
+	0xb9782a05, 0x80788178,
+	0xbf0d9972, 0xbf850002,
+	0x8f788978, 0xbf820001,
+	0x8f788a78, 0xb96e1e06,
+	0x8f6e8a6e, 0x80786e78,
 	0x8078ff78, 0x00000200,
-	0xbefc0384, 0xe0304000,
-	0x785d0000, 0xe0304080,
-	0x785d0100, 0xe0304100,
-	0x785d0200, 0xe0304180,
-	0x785d0300, 0xbf8c3f70,
-	0x7e008500, 0x7e028501,
-	0x7e048502, 0x7e068503,
-	0x807c847c, 0x8078ff78,
-	0x00000200, 0xbf0a6f7c,
-	0xbf85ffee, 0xe0304000,
-	0x6e5d0000, 0xe0304080,
-	0x6e5d0100, 0xe0304100,
-	0x6e5d0200, 0xe0304180,
-	0x6e5d0300, 0xbf820032,
+	0x8078ff78, 0x00000080,
+	0xbef603ff, 0x01000000,
+	0x907c9972, 0x877c817c,
+	0xbf06817c, 0xbefc0380,
+	0xbf850009, 0xe0310000,
+	0x781d0000, 0x807cff7c,
+	0x00000080, 0x8078ff78,
+	0x00000080, 0xbf0a6f7c,
+	0xbf85fff8, 0xbf820008,
+	0xe0310000, 0x781d0000,
+	0x807cff7c, 0x00000100,
+	0x8078ff78, 0x00000100,
+	0xbf0a6f7c, 0xbf85fff8,
+	0xbef80380, 0xbefe03c1,
+	0x907c9972, 0x877c817c,
+	0xbf06817c, 0xbf850002,
+	0xbeff0380, 0xbf820001,
+	0xbeff03c1, 0xb96f2a05,
+	0x806f816f, 0x8f6f826f,
+	0x907c9972, 0x877c817c,
+	0xbf06817c, 0xbf850024,
+	0xbef603ff, 0x01000000,
+	0xbeee0378, 0x8078ff78,
+	0x00000200, 0xbefc0384,
+	0xbf0a6f7c, 0xbf840050,
+	0xe0304000, 0x785d0000,
+	0xe0304080, 0x785d0100,
+	0xe0304100, 0x785d0200,
+	0xe0304180, 0x785d0300,
+	0xbf8c3f70, 0x7e008500,
+	0x7e028501, 0x7e048502,
+	0x7e068503, 0x807c847c,
+	0x8078ff78, 0x00000200,
+	0xbf0a6f7c, 0xbf85ffee,
+	0xe0304000, 0x6e5d0000,
+	0xe0304080, 0x6e5d0100,
+	0xe0304100, 0x6e5d0200,
+	0xe0304180, 0x6e5d0300,
+	0xbf8c3f70, 0xbf820034,
 	0xbef603ff, 0x01000000,
 	0xbeee0378, 0x8078ff78,
 	0x00000400, 0xbefc0384,
+	0xbf0a6f7c, 0xbf840012,
 	0xe0304000, 0x785d0000,
 	0xe0304100, 0x785d0100,
 	0xe0304200, 0x785d0200,
@@ -1060,270 +1072,272 @@ static const uint32_t cwsr_trap_nv1x_hex[] = {
 	0xb96e2a05, 0x806e816e,
 	0xbf0d9972, 0xbf850002,
 	0x8f6e896e, 0xbf820001,
-	0x8f6e8a6e, 0x806eff6e,
-	0x00000200, 0x806e746e,
-	0x826f8075, 0x876fff6f,
-	0x0000ffff, 0xf4091c37,
-	0xfa000050, 0xf4091d37,
-	0xfa000060, 0xf4011e77,
-	0xfa000074, 0xbf8cc07f,
-	0x876fff6d, 0xfc000000,
-	0x906f9a6f, 0x8f6f906f,
-	0xbeee0380, 0x886e6f6e,
-	0x876fff6d, 0x02000000,
-	0x906f996f, 0x8f6f8f6f,
-	0x886e6f6e, 0x876fff6d,
-	0x01000000, 0x906f986f,
-	0x8f6f996f, 0x886e6f6e,
-	0x876fff7a, 0x00800000,
-	0x906f976f, 0xb9eef807,
-	0x876dff6d, 0x0000ffff,
-	0x87fe7e7e, 0x87ea6a6a,
-	0xb9faf802, 0xbe80226c,
-	0xbf810000, 0xbf9f0000,
+	0x8f6e8a6e, 0xb96f1e06,
+	0x8f6f8a6f, 0x806e6f6e,
+	0x806eff6e, 0x00000200,
+	0x806e746e, 0x826f8075,
+	0x876fff6f, 0x0000ffff,
+	0xf4091c37, 0xfa000050,
+	0xf4091d37, 0xfa000060,
+	0xf4011e77, 0xfa000074,
+	0xbf8cc07f, 0x906e8977,
+	0x876fff6e, 0x003f8000,
+	0x906e8677, 0x876eff6e,
+	0x02000000, 0x886e6f6e,
+	0xb9eef807, 0x876dff6d,
+	0x0000ffff, 0x87fe7e7e,
+	0x87ea6a6a, 0xb9faf802,
+	0xbe80226c, 0xbf810000,
 	0xbf9f0000, 0xbf9f0000,
 	0xbf9f0000, 0xbf9f0000,
+	0xbf9f0000, 0x00000000,
 };
 
 static const uint32_t cwsr_trap_arcturus_hex[] = {
-	0xbf820001, 0xbf8202c4,
-	0xb8f8f802, 0x89788678,
-	0xb8eef801, 0x866eff6e,
-	0x00000800, 0xbf840003,
+	0xbf820001, 0xbf8202d0,
+	0xb8f8f802, 0x8978ff78,
+	0x00020006, 0xb8fbf803,
 	0x866eff78, 0x00002000,
-	0xbf840016, 0xb8fbf803,
+	0xbf840009, 0x866eff6d,
+	0x00ff0000, 0xbf85001e,
 	0x866eff7b, 0x00000400,
-	0xbf85003b, 0x866eff7b,
-	0x00000800, 0xbf850003,
-	0x866eff7b, 0x00000100,
-	0xbf84000c, 0x866eff78,
-	0x00002000, 0xbf840005,
-	0xbf8e0010, 0xb8eef803,
-	0x866eff6e, 0x00000400,
-	0xbf84fffb, 0x8778ff78,
-	0x00002000, 0x80ec886c,
-	0x82ed806d, 0xb8eef807,
-	0x866fff6e, 0x001f8000,
-	0x8e6f8b6f, 0x8977ff77,
-	0xfc000000, 0x87776f77,
-	0x896eff6e, 0x001f8000,
-	0xb96ef807, 0xb8faf812,
+	0xbf850051, 0xbf8e0010,
+	0xb8fbf803, 0xbf82fffa,
+	0x866eff7b, 0x00000900,
+	0xbf850015, 0x866eff7b,
+	0x000071ff, 0xbf840008,
+	0x866fff7b, 0x00007080,
+	0xbf840001, 0xbeee1a87,
+	0xb8eff801, 0x8e6e8c6e,
+	0x866e6f6e, 0xbf85000a,
+	0x866eff6d, 0x00ff0000,
+	0xbf850007, 0xb8eef801,
+	0x866eff6e, 0x00000800,
+	0xbf850003, 0x866eff7b,
+	0x00000400, 0xbf850036,
+	0xb8faf807, 0x867aff7a,
+	0x001f8000, 0x8e7a8b7a,
+	0x8977ff77, 0xfc000000,
+	0x87777a77, 0xba7ff807,
+	0x00000000, 0xb8faf812,
 	0xb8fbf813, 0x8efa887a,
-	0xc0071bbd, 0x00000000,
-	0xbf8cc07f, 0xc0071ebd,
-	0x00000008, 0xbf8cc07f,
-	0x86ee6e6e, 0xbf840001,
-	0xbe801d6e, 0xb8fbf803,
-	0x867bff7b, 0x000001ff,
+	0xc0031bbd, 0x00000010,
+	0xbf8cc07f, 0x8e6e976e,
+	0x8977ff77, 0x00800000,
+	0x87776e77, 0xc0071bbd,
+	0x00000000, 0xbf8cc07f,
+	0xc0071ebd, 0x00000008,
+	0xbf8cc07f, 0x86ee6e6e,
+	0xbf840001, 0xbe801d6e,
+	0x866eff6d, 0x01ff0000,
+	0xbf850005, 0x8778ff78,
+	0x00002000, 0x80ec886c,
+	0x82ed806d, 0xbf820005,
+	0x866eff6d, 0x01000000,
 	0xbf850002, 0x806c846c,
 	0x826d806d, 0x866dff6d,
-	0x0000ffff, 0x8f6e8b77,
-	0x866eff6e, 0x001f8000,
-	0xb96ef807, 0x86fe7e7e,
+	0x0000ffff, 0x8f7a8b77,
+	0x867aff7a, 0x001f8000,
+	0xb97af807, 0x86fe7e7e,
 	0x86ea6a6a, 0x8f6e8378,
 	0xb96ee0c2, 0xbf800002,
 	0xb9780002, 0xbe801f6c,
 	0x866dff6d, 0x0000ffff,
 	0xbefa0080, 0xb97a0283,
-	0xb8fa2407, 0x8e7a9b7a,
-	0x876d7a6d, 0xb8fa03c7,
-	0x8e7a9a7a, 0x876d7a6d,
 	0xb8faf807, 0x867aff7a,
-	0x00007fff, 0xb97af807,
-	0xbeee007e, 0xbeef007f,
-	0xbefe0180, 0xbf900004,
-	0x877a8478, 0xb97af802,
-	0xbf8e0002, 0xbf88fffe,
-	0xb8fa2a05, 0x807a817a,
-	0x8e7a8a7a, 0x8e7a817a,
-	0xb8fb1605, 0x807b817b,
-	0x8e7b867b, 0x807a7b7a,
-	0x807a7e7a, 0x827b807f,
-	0x867bff7b, 0x0000ffff,
-	0xc04b1c3d, 0x00000050,
-	0xbf8cc07f, 0xc04b1d3d,
-	0x00000060, 0xbf8cc07f,
-	0xc0431e7d, 0x00000074,
-	0xbf8cc07f, 0xbef4007e,
-	0x8675ff7f, 0x0000ffff,
-	0x8775ff75, 0x00040000,
-	0xbef60080, 0xbef700ff,
-	0x00807fac, 0x867aff7f,
-	0x08000000, 0x8f7a837a,
-	0x87777a77, 0x867aff7f,
-	0x70000000, 0x8f7a817a,
-	0x87777a77, 0xbef1007c,
-	0xbef00080, 0xb8f02a05,
-	0x80708170, 0x8e708a70,
-	0x8e708170, 0xb8fa1605,
-	0x807a817a, 0x8e7a867a,
-	0x80707a70, 0xbef60084,
-	0xbef600ff, 0x01000000,
-	0xbefe007c, 0xbefc0070,
-	0xc0611c7a, 0x0000007c,
-	0xbf8cc07f, 0x80708470,
-	0xbefc007e, 0xbefe007c,
-	0xbefc0070, 0xc0611b3a,
+	0x001f8000, 0x8e7a8b7a,
+	0x8977ff77, 0xfc000000,
+	0x87777a77, 0xba7ff807,
+	0x00000000, 0xbeee007e,
+	0xbeef007f, 0xbefe0180,
+	0xbf900004, 0x877a8478,
+	0xb97af802, 0xbf8e0002,
+	0xbf88fffe, 0xb8fa2a05,
+	0x807a817a, 0x8e7a8a7a,
+	0x8e7a817a, 0xb8fb1605,
+	0x807b817b, 0x8e7b867b,
+	0x807a7b7a, 0x807a7e7a,
+	0x827b807f, 0x867bff7b,
+	0x0000ffff, 0xc04b1c3d,
+	0x00000050, 0xbf8cc07f,
+	0xc04b1d3d, 0x00000060,
+	0xbf8cc07f, 0xc0431e7d,
+	0x00000074, 0xbf8cc07f,
+	0xbef4007e, 0x8675ff7f,
+	0x0000ffff, 0x8775ff75,
+	0x00040000, 0xbef60080,
+	0xbef700ff, 0x00807fac,
+	0xbef1007c, 0xbef00080,
+	0xb8f02a05, 0x80708170,
+	0x8e708a70, 0x8e708170,
+	0xb8fa1605, 0x807a817a,
+	0x8e7a867a, 0x80707a70,
+	0xbef60084, 0xbef600ff,
+	0x01000000, 0xbefe007c,
+	0xbefc0070, 0xc0611c7a,
 	0x0000007c, 0xbf8cc07f,
 	0x80708470, 0xbefc007e,
 	0xbefe007c, 0xbefc0070,
-	0xc0611b7a, 0x0000007c,
+	0xc0611b3a, 0x0000007c,
 	0xbf8cc07f, 0x80708470,
 	0xbefc007e, 0xbefe007c,
-	0xbefc0070, 0xc0611bba,
+	0xbefc0070, 0xc0611b7a,
 	0x0000007c, 0xbf8cc07f,
 	0x80708470, 0xbefc007e,
 	0xbefe007c, 0xbefc0070,
-	0xc0611bfa, 0x0000007c,
+	0xc0611bba, 0x0000007c,
 	0xbf8cc07f, 0x80708470,
 	0xbefc007e, 0xbefe007c,
-	0xbefc0070, 0xc0611e3a,
-	0x0000007c, 0xbf8cc07f,
-	0x80708470, 0xbefc007e,
-	0xb8fbf803, 0xbefe007c,
-	0xbefc0070, 0xc0611efa,
+	0xbefc0070, 0xc0611bfa,
 	0x0000007c, 0xbf8cc07f,
 	0x80708470, 0xbefc007e,
 	0xbefe007c, 0xbefc0070,
-	0xc0611a3a, 0x0000007c,
+	0xc0611e3a, 0x0000007c,
+	0xbf8cc07f, 0x80708470,
+	0xbefc007e, 0xb8fbf803,
+	0xbefe007c, 0xbefc0070,
+	0xc0611efa, 0x0000007c,
 	0xbf8cc07f, 0x80708470,
 	0xbefc007e, 0xbefe007c,
-	0xbefc0070, 0xc0611a7a,
+	0xbefc0070, 0xc0611a3a,
 	0x0000007c, 0xbf8cc07f,
 	0x80708470, 0xbefc007e,
-	0xb8f1f801, 0xbefe007c,
-	0xbefc0070, 0xc0611c7a,
-	0x0000007c, 0xbf8cc07f,
-	0x80708470, 0xbefc007e,
-	0x867aff7f, 0x04000000,
-	0xbeef0080, 0x876f6f7a,
-	0xb8f02a05, 0x80708170,
-	0x8e708a70, 0x8e708170,
-	0xb8fb1605, 0x807b817b,
-	0x8e7b847b, 0x8e76827b,
-	0xbef600ff, 0x01000000,
-	0xbef20174, 0x80747074,
-	0x82758075, 0xbefc0080,
-	0xbf800000, 0xbe802b00,
-	0xbe822b02, 0xbe842b04,
-	0xbe862b06, 0xbe882b08,
-	0xbe8a2b0a, 0xbe8c2b0c,
-	0xbe8e2b0e, 0xc06b003a,
-	0x00000000, 0xbf8cc07f,
-	0xc06b013a, 0x00000010,
-	0xbf8cc07f, 0xc06b023a,
-	0x00000020, 0xbf8cc07f,
-	0xc06b033a, 0x00000030,
-	0xbf8cc07f, 0x8074c074,
-	0x82758075, 0x807c907c,
-	0xbf0a7b7c, 0xbf85ffe7,
-	0xbef40172, 0xbef00080,
-	0xbefe00c1, 0xbeff00c1,
-	0xbee80080, 0xbee90080,
-	0xbef600ff, 0x01000000,
-	0x867aff78, 0x00400000,
-	0xbf850003, 0xb8faf803,
-	0x897a7aff, 0x10000000,
-	0xbf85004d, 0xbe840080,
-	0xd2890000, 0x00000900,
-	0x80048104, 0xd2890001,
+	0xbefe007c, 0xbefc0070,
+	0xc0611a7a, 0x0000007c,
+	0xbf8cc07f, 0x80708470,
+	0xbefc007e, 0xb8f1f801,
+	0xbefe007c, 0xbefc0070,
+	0xc0611c7a, 0x0000007c,
+	0xbf8cc07f, 0x80708470,
+	0xbefc007e, 0x867aff7f,
+	0x04000000, 0xbeef0080,
+	0x876f6f7a, 0xb8f02a05,
+	0x80708170, 0x8e708a70,
+	0x8e708170, 0xb8fb1605,
+	0x807b817b, 0x8e7b847b,
+	0x8e76827b, 0xbef600ff,
+	0x01000000, 0xbef20174,
+	0x80747074, 0x82758075,
+	0xbefc0080, 0xbf800000,
+	0xbe802b00, 0xbe822b02,
+	0xbe842b04, 0xbe862b06,
+	0xbe882b08, 0xbe8a2b0a,
+	0xbe8c2b0c, 0xbe8e2b0e,
+	0xc06b003a, 0x00000000,
+	0xbf8cc07f, 0xc06b013a,
+	0x00000010, 0xbf8cc07f,
+	0xc06b023a, 0x00000020,
+	0xbf8cc07f, 0xc06b033a,
+	0x00000030, 0xbf8cc07f,
+	0x8074c074, 0x82758075,
+	0x807c907c, 0xbf0a7b7c,
+	0xbf85ffe7, 0xbef40172,
+	0xbef00080, 0xbefe00c1,
+	0xbeff00c1, 0xbee80080,
+	0xbee90080, 0xbef600ff,
+	0x01000000, 0x867aff78,
+	0x00400000, 0xbf850003,
+	0xb8faf803, 0x897a7aff,
+	0x10000000, 0xbf85004d,
+	0xbe840080, 0xd2890000,
 	0x00000900, 0x80048104,
-	0xd2890002, 0x00000900,
-	0x80048104, 0xd2890003,
+	0xd2890001, 0x00000900,
+	0x80048104, 0xd2890002,
 	0x00000900, 0x80048104,
-	0xc069003a, 0x00000070,
-	0xbf8cc07f, 0x80709070,
-	0xbf06c004, 0xbf84ffee,
-	0xbe840080, 0xd2890000,
-	0x00000901, 0x80048104,
-	0xd2890001, 0x00000901,
-	0x80048104, 0xd2890002,
-	0x00000901, 0x80048104,
-	0xd2890003, 0x00000901,
+	0xd2890003, 0x00000900,
 	0x80048104, 0xc069003a,
 	0x00000070, 0xbf8cc07f,
 	0x80709070, 0xbf06c004,
 	0xbf84ffee, 0xbe840080,
-	0xd2890000, 0x00000902,
+	0xd2890000, 0x00000901,
 	0x80048104, 0xd2890001,
-	0x00000902, 0x80048104,
-	0xd2890002, 0x00000902,
+	0x00000901, 0x80048104,
+	0xd2890002, 0x00000901,
 	0x80048104, 0xd2890003,
-	0x00000902, 0x80048104,
+	0x00000901, 0x80048104,
 	0xc069003a, 0x00000070,
 	0xbf8cc07f, 0x80709070,
 	0xbf06c004, 0xbf84ffee,
 	0xbe840080, 0xd2890000,
-	0x00000903, 0x80048104,
-	0xd2890001, 0x00000903,
-	0x80048104, 0xd2890002,
-	0x00000903, 0x80048104,
-	0xd2890003, 0x00000903,
-	0x80048104, 0xc069003a,
-	0x00000070, 0xbf8cc07f,
-	0x80709070, 0xbf06c004,
-	0xbf84ffee, 0xbf820008,
-	0xe0724000, 0x701d0000,
-	0xe0724100, 0x701d0100,
-	0xe0724200, 0x701d0200,
-	0xe0724300, 0x701d0300,
-	0xbefe00c1, 0xbeff00c1,
-	0xb8fb4306, 0x867bc17b,
-	0xbf840064, 0xbf8a0000,
-	0x867aff6f, 0x04000000,
-	0xbf840060, 0x8e7b867b,
-	0x8e7b827b, 0xbef6007b,
-	0xb8f02a05, 0x80708170,
-	0x8e708a70, 0x8e708170,
-	0xb8fa1605, 0x807a817a,
-	0x8e7a867a, 0x80707a70,
-	0x8070ff70, 0x00000080,
-	0xbef600ff, 0x01000000,
-	0xbefc0080, 0xd28c0002,
-	0x000100c1, 0xd28d0003,
-	0x000204c1, 0x867aff78,
-	0x00400000, 0xbf850003,
-	0xb8faf803, 0x897a7aff,
-	0x10000000, 0xbf850030,
-	0x24040682, 0xd86e4000,
-	0x00000002, 0xbf8cc07f,
-	0xbe840080, 0xd2890000,
-	0x00000900, 0x80048104,
-	0xd2890001, 0x00000900,
+	0x00000902, 0x80048104,
+	0xd2890001, 0x00000902,
 	0x80048104, 0xd2890002,
-	0x00000900, 0x80048104,
-	0xd2890003, 0x00000900,
+	0x00000902, 0x80048104,
+	0xd2890003, 0x00000902,
 	0x80048104, 0xc069003a,
 	0x00000070, 0xbf8cc07f,
 	0x80709070, 0xbf06c004,
 	0xbf84ffee, 0xbe840080,
-	0xd2890000, 0x00000901,
+	0xd2890000, 0x00000903,
 	0x80048104, 0xd2890001,
-	0x00000901, 0x80048104,
-	0xd2890002, 0x00000901,
+	0x00000903, 0x80048104,
+	0xd2890002, 0x00000903,
 	0x80048104, 0xd2890003,
-	0x00000901, 0x80048104,
+	0x00000903, 0x80048104,
+	0xc069003a, 0x00000070,
+	0xbf8cc07f, 0x80709070,
+	0xbf06c004, 0xbf84ffee,
+	0xbf820008, 0xe0724000,
+	0x701d0000, 0xe0724100,
+	0x701d0100, 0xe0724200,
+	0x701d0200, 0xe0724300,
+	0x701d0300, 0xbefe00c1,
+	0xbeff00c1, 0xb8fb4306,
+	0x867bc17b, 0xbf840064,
+	0xbf8a0000, 0x867aff6f,
+	0x04000000, 0xbf840060,
+	0x8e7b867b, 0x8e7b827b,
+	0xbef6007b, 0xb8f02a05,
+	0x80708170, 0x8e708a70,
+	0x8e708170, 0xb8fa1605,
+	0x807a817a, 0x8e7a867a,
+	0x80707a70, 0x8070ff70,
+	0x00000080, 0xbef600ff,
+	0x01000000, 0xbefc0080,
+	0xd28c0002, 0x000100c1,
+	0xd28d0003, 0x000204c1,
+	0x867aff78, 0x00400000,
+	0xbf850003, 0xb8faf803,
+	0x897a7aff, 0x10000000,
+	0xbf850030, 0x24040682,
+	0xd86e4000, 0x00000002,
+	0xbf8cc07f, 0xbe840080,
+	0xd2890000, 0x00000900,
+	0x80048104, 0xd2890001,
+	0x00000900, 0x80048104,
+	0xd2890002, 0x00000900,
+	0x80048104, 0xd2890003,
+	0x00000900, 0x80048104,
 	0xc069003a, 0x00000070,
 	0xbf8cc07f, 0x80709070,
 	0xbf06c004, 0xbf84ffee,
-	0x680404ff, 0x00000200,
+	0xbe840080, 0xd2890000,
+	0x00000901, 0x80048104,
+	0xd2890001, 0x00000901,
+	0x80048104, 0xd2890002,
+	0x00000901, 0x80048104,
+	0xd2890003, 0x00000901,
+	0x80048104, 0xc069003a,
+	0x00000070, 0xbf8cc07f,
+	0x80709070, 0xbf06c004,
+	0xbf84ffee, 0x680404ff,
+	0x00000200, 0xd0c9006a,
+	0x0000f702, 0xbf87ffd2,
+	0xbf820015, 0xd1060002,
+	0x00011103, 0x7e0602ff,
+	0x00000200, 0xbefc00ff,
+	0x00010000, 0xbe800077,
+	0x8677ff77, 0xff7fffff,
+	0x8777ff77, 0x00058000,
+	0xd8ec0000, 0x00000002,
+	0xbf8cc07f, 0xe0765000,
+	0x701d0002, 0x68040702,
 	0xd0c9006a, 0x0000f702,
-	0xbf87ffd2, 0xbf820015,
-	0xd1060002, 0x00011103,
-	0x7e0602ff, 0x00000200,
-	0xbefc00ff, 0x00010000,
-	0xbe800077, 0x8677ff77,
-	0xff7fffff, 0x8777ff77,
-	0x00058000, 0xd8ec0000,
-	0x00000002, 0xbf8cc07f,
-	0xe0765000, 0x701d0002,
-	0x68040702, 0xd0c9006a,
-	0x0000f702, 0xbf87fff7,
-	0xbef70000, 0xbef000ff,
-	0x00000400, 0xbefe00c1,
-	0xbeff00c1, 0xb8fb2a05,
-	0x807b817b, 0x8e7b827b,
-	0x8e76887b, 0xbef600ff,
+	0xbf87fff7, 0xbef70000,
+	0xbef000ff, 0x00000400,
+	0xbefe00c1, 0xbeff00c1,
+	0xb8fb2a05, 0x807b817b,
+	0x8e7b827b, 0xbef600ff,
 	0x01000000, 0xbefc0084,
 	0xbf0a7b7c, 0xbf84006d,
 	0xbf11017c, 0x807bff7b,
@@ -1440,15 +1454,11 @@ static const uint32_t cwsr_trap_arcturus_hex[] = {
 	0x701d0300, 0x807c847c,
 	0x8070ff70, 0x00000400,
 	0xbf0a7b7c, 0xbf85ffeb,
-	0xbf9c0000, 0xbf820106,
+	0xbf9c0000, 0xbf8200e3,
 	0xbef4007e, 0x8675ff7f,
 	0x0000ffff, 0x8775ff75,
 	0x00040000, 0xbef60080,
 	0xbef700ff, 0x00807fac,
-	0x866eff7f, 0x08000000,
-	0x8f6e836e, 0x87776e77,
-	0x866eff7f, 0x70000000,
-	0x8f6e816e, 0x87776e77,
 	0x866eff7f, 0x04000000,
 	0xbf84001f, 0xbefe00c1,
 	0xbeff00c1, 0xb8ef4306,
@@ -1466,26 +1476,14 @@ static const uint32_t cwsr_trap_arcturus_hex[] = {
 	0x807cff7c, 0x00000200,
 	0x8078ff78, 0x00000200,
 	0xbf0a6f7c, 0xbf85fff6,
-	0xbef80080, 0xbefe00c1,
-	0xbeff00c1, 0xb8ef2a05,
-	0x806f816f, 0x8e6f826f,
-	0x8e76886f, 0xbef90076,
+	0xbefe00c1, 0xbeff00c1,
 	0xbef600ff, 0x01000000,
+	0xb8ef2a05, 0x806f816f,
+	0x8e6f826f, 0x806fff6f,
+	0x00008000, 0xbef80080,
 	0xbeee0078, 0x8078ff78,
-	0x00000400, 0xbef30079,
-	0x8079ff79, 0x00000400,
-	0xbefc0084, 0xbf11087c,
-	0x806fff6f, 0x00008000,
-	0xe0524000, 0x791d0000,
-	0xe0524100, 0x791d0100,
-	0xe0524200, 0x791d0200,
-	0xe0524300, 0x791d0300,
-	0x8079ff79, 0x00000400,
-	0xbf8c0f70, 0xd3d94000,
-	0x18000100, 0xd3d94001,
-	0x18000101, 0xd3d94002,
-	0x18000102, 0xd3d94003,
-	0x18000103, 0xe0524000,
+	0x00000400, 0xbefc0084,
+	0xbf11087c, 0xe0524000,
 	0x781d0000, 0xe0524100,
 	0x781d0100, 0xe0524200,
 	0x781d0200, 0xe0524300,
@@ -1494,20 +1492,24 @@ static const uint32_t cwsr_trap_arcturus_hex[] = {
 	0x7e040302, 0x7e060303,
 	0x807c847c, 0x8078ff78,
 	0x00000400, 0xbf0a6f7c,
-	0xbf85ffdb, 0xbf9c0000,
-	0xe0524000, 0x731d0000,
-	0xe0524100, 0x731d0100,
-	0xe0524200, 0x731d0200,
-	0xe0524300, 0x731d0300,
-	0xbf8c0f70, 0xd3d94000,
-	0x18000100, 0xd3d94001,
-	0x18000101, 0xd3d94002,
-	0x18000102, 0xd3d94003,
-	0x18000103, 0xe0524000,
-	0x6e1d0000, 0xe0524100,
-	0x6e1d0100, 0xe0524200,
-	0x6e1d0200, 0xe0524300,
-	0x6e1d0300, 0xb8f82a05,
+	0xbf85ffee, 0xbefc0080,
+	0xbf11087c, 0xe0524000,
+	0x781d0000, 0xe0524100,
+	0x781d0100, 0xe0524200,
+	0x781d0200, 0xe0524300,
+	0x781d0300, 0xbf8c0f70,
+	0xd3d94000, 0x18000100,
+	0xd3d94001, 0x18000101,
+	0xd3d94002, 0x18000102,
+	0xd3d94003, 0x18000103,
+	0x807c847c, 0x8078ff78,
+	0x00000400, 0xbf0a6f7c,
+	0xbf85ffea, 0xbf9c0000,
+	0xe0524000, 0x6e1d0000,
+	0xe0524100, 0x6e1d0100,
+	0xe0524200, 0x6e1d0200,
+	0xe0524300, 0x6e1d0300,
+	0xbf8c0f70, 0xb8f82a05,
 	0x80788178, 0x8e788a78,
 	0x8e788178, 0xb8ee1605,
 	0x806e816e, 0x8e6e866e,
@@ -1559,268 +1561,225 @@ static const uint32_t cwsr_trap_arcturus_hex[] = {
 	0xc00b1c37, 0x00000050,
 	0xc00b1d37, 0x00000060,
 	0xc0031e77, 0x00000074,
-	0xbf8cc07f, 0x866fff6d,
-	0xf8000000, 0x8f6f9b6f,
-	0x8e6f906f, 0xbeee0080,
-	0x876e6f6e, 0x866fff6d,
-	0x04000000, 0x8f6f9a6f,
-	0x8e6f8f6f, 0x876e6f6e,
-	0x866fff7a, 0x00800000,
-	0x8f6f976f, 0xb96ef807,
-	0x866dff6d, 0x0000ffff,
-	0x86fe7e7e, 0x86ea6a6a,
-	0x8f6e837a, 0xb96ee0c2,
-	0xbf800002, 0xb97a0002,
-	0xbf8a0000, 0x95806f6c,
-	0xbf810000, 0x00000000,
+	0xbf8cc07f, 0x8f6e8b77,
+	0x866eff6e, 0x001f8000,
+	0xb96ef807, 0x866dff6d,
+	0x0000ffff, 0x86fe7e7e,
+	0x86ea6a6a, 0x8f6e837a,
+	0xb96ee0c2, 0xbf800002,
+	0xb97a0002, 0xbf8a0000,
+	0xbe801f6c, 0xbf810000,
 };
 
 static const uint32_t cwsr_trap_aldebaran_hex[] = {
-	0xbf820001, 0xbf8202ce,
-	0xb8f8f802, 0x89788678,
-	0xb8eef801, 0x866eff6e,
-	0x00000800, 0xbf840003,
+	0xbf820001, 0xbf8202db,
+	0xb8f8f802, 0x8978ff78,
+	0x00020006, 0xb8fbf803,
 	0x866eff78, 0x00002000,
-	0xbf840016, 0xb8fbf803,
+	0xbf840009, 0x866eff6d,
+	0x00ff0000, 0xbf85001e,
 	0x866eff7b, 0x00000400,
-	0xbf85003b, 0x866eff7b,
-	0x00000800, 0xbf850003,
-	0x866eff7b, 0x00000100,
-	0xbf84000c, 0x866eff78,
-	0x00002000, 0xbf840005,
-	0xbf8e0010, 0xb8eef803,
-	0x866eff6e, 0x00000400,
-	0xbf84fffb, 0x8778ff78,
-	0x00002000, 0x80ec886c,
-	0x82ed806d, 0xb8eef807,
-	0x866fff6e, 0x001f8000,
-	0x8e6f8b6f, 0x8977ff77,
-	0xfc000000, 0x87776f77,
-	0x896eff6e, 0x001f8000,
-	0xb96ef807, 0xb8faf812,
+	0xbf850051, 0xbf8e0010,
+	0xb8fbf803, 0xbf82fffa,
+	0x866eff7b, 0x00000900,
+	0xbf850015, 0x866eff7b,
+	0x000071ff, 0xbf840008,
+	0x866fff7b, 0x00007080,
+	0xbf840001, 0xbeee1a87,
+	0xb8eff801, 0x8e6e8c6e,
+	0x866e6f6e, 0xbf85000a,
+	0x866eff6d, 0x00ff0000,
+	0xbf850007, 0xb8eef801,
+	0x866eff6e, 0x00000800,
+	0xbf850003, 0x866eff7b,
+	0x00000400, 0xbf850036,
+	0xb8faf807, 0x867aff7a,
+	0x001f8000, 0x8e7a8b7a,
+	0x8977ff77, 0xfc000000,
+	0x87777a77, 0xba7ff807,
+	0x00000000, 0xb8faf812,
 	0xb8fbf813, 0x8efa887a,
-	0xc0071bbd, 0x00000000,
-	0xbf8cc07f, 0xc0071ebd,
-	0x00000008, 0xbf8cc07f,
-	0x86ee6e6e, 0xbf840001,
-	0xbe801d6e, 0xb8fbf803,
-	0x867bff7b, 0x000001ff,
+	0xc0031bbd, 0x00000010,
+	0xbf8cc07f, 0x8e6e976e,
+	0x8977ff77, 0x00800000,
+	0x87776e77, 0xc0071bbd,
+	0x00000000, 0xbf8cc07f,
+	0xc0071ebd, 0x00000008,
+	0xbf8cc07f, 0x86ee6e6e,
+	0xbf840001, 0xbe801d6e,
+	0x866eff6d, 0x01ff0000,
+	0xbf850005, 0x8778ff78,
+	0x00002000, 0x80ec886c,
+	0x82ed806d, 0xbf820005,
+	0x866eff6d, 0x01000000,
 	0xbf850002, 0x806c846c,
 	0x826d806d, 0x866dff6d,
-	0x0000ffff, 0x8f6e8b77,
-	0x866eff6e, 0x001f8000,
-	0xb96ef807, 0x86fe7e7e,
+	0x0000ffff, 0x8f7a8b77,
+	0x867aff7a, 0x001f8000,
+	0xb97af807, 0x86fe7e7e,
 	0x86ea6a6a, 0x8f6e8378,
 	0xb96ee0c2, 0xbf800002,
 	0xb9780002, 0xbe801f6c,
 	0x866dff6d, 0x0000ffff,
 	0xbefa0080, 0xb97a0283,
-	0xb8fa2407, 0x8e7a9b7a,
-	0x876d7a6d, 0xb8fa03c7,
-	0x8e7a9a7a, 0x876d7a6d,
 	0xb8faf807, 0x867aff7a,
-	0x00007fff, 0xb97af807,
-	0xbeee007e, 0xbeef007f,
-	0xbefe0180, 0xbf900004,
-	0x877a8478, 0xb97af802,
-	0xbf8e0002, 0xbf88fffe,
-	0xb8fa2985, 0x807a817a,
-	0x8e7a8a7a, 0x8e7a817a,
-	0xb8fb1605, 0x807b817b,
-	0x8e7b867b, 0x807a7b7a,
-	0x807a7e7a, 0x827b807f,
-	0x867bff7b, 0x0000ffff,
-	0xc04b1c3d, 0x00000050,
-	0xbf8cc07f, 0xc04b1d3d,
-	0x00000060, 0xbf8cc07f,
-	0xc0431e7d, 0x00000074,
-	0xbf8cc07f, 0xbef4007e,
-	0x8675ff7f, 0x0000ffff,
-	0x8775ff75, 0x00040000,
-	0xbef60080, 0xbef700ff,
-	0x00807fac, 0x867aff7f,
-	0x08000000, 0x8f7a837a,
-	0x87777a77, 0x867aff7f,
-	0x70000000, 0x8f7a817a,
-	0x87777a77, 0xbef1007c,
-	0xbef00080, 0xb8f02985,
-	0x80708170, 0x8e708a70,
-	0x8e708170, 0xb8fa1605,
-	0x807a817a, 0x8e7a867a,
-	0x80707a70, 0xbef60084,
-	0xbef600ff, 0x01000000,
-	0xbefe007c, 0xbefc0070,
-	0xc0611c7a, 0x0000007c,
-	0xbf8cc07f, 0x80708470,
-	0xbefc007e, 0xbefe007c,
-	0xbefc0070, 0xc0611b3a,
+	0x001f8000, 0x8e7a8b7a,
+	0x8977ff77, 0xfc000000,
+	0x87777a77, 0xba7ff807,
+	0x00000000, 0xbeee007e,
+	0xbeef007f, 0xbefe0180,
+	0xbf900004, 0x877a8478,
+	0xb97af802, 0xbf8e0002,
+	0xbf88fffe, 0xb8fa2985,
+	0x807a817a, 0x8e7a8a7a,
+	0x8e7a817a, 0xb8fb1605,
+	0x807b817b, 0x8e7b867b,
+	0x807a7b7a, 0x807a7e7a,
+	0x827b807f, 0x867bff7b,
+	0x0000ffff, 0xc04b1c3d,
+	0x00000050, 0xbf8cc07f,
+	0xc04b1d3d, 0x00000060,
+	0xbf8cc07f, 0xc0431e7d,
+	0x00000074, 0xbf8cc07f,
+	0xbef4007e, 0x8675ff7f,
+	0x0000ffff, 0x8775ff75,
+	0x00040000, 0xbef60080,
+	0xbef700ff, 0x00807fac,
+	0xbef1007c, 0xbef00080,
+	0xb8f02985, 0x80708170,
+	0x8e708a70, 0x8e708170,
+	0xb8fa1605, 0x807a817a,
+	0x8e7a867a, 0x80707a70,
+	0xbef60084, 0xbef600ff,
+	0x01000000, 0xbefe007c,
+	0xbefc0070, 0xc0611c7a,
 	0x0000007c, 0xbf8cc07f,
 	0x80708470, 0xbefc007e,
 	0xbefe007c, 0xbefc0070,
-	0xc0611b7a, 0x0000007c,
+	0xc0611b3a, 0x0000007c,
 	0xbf8cc07f, 0x80708470,
 	0xbefc007e, 0xbefe007c,
-	0xbefc0070, 0xc0611bba,
+	0xbefc0070, 0xc0611b7a,
 	0x0000007c, 0xbf8cc07f,
 	0x80708470, 0xbefc007e,
 	0xbefe007c, 0xbefc0070,
-	0xc0611bfa, 0x0000007c,
+	0xc0611bba, 0x0000007c,
 	0xbf8cc07f, 0x80708470,
 	0xbefc007e, 0xbefe007c,
-	0xbefc0070, 0xc0611e3a,
-	0x0000007c, 0xbf8cc07f,
-	0x80708470, 0xbefc007e,
-	0xb8fbf803, 0xbefe007c,
-	0xbefc0070, 0xc0611efa,
+	0xbefc0070, 0xc0611bfa,
 	0x0000007c, 0xbf8cc07f,
 	0x80708470, 0xbefc007e,
 	0xbefe007c, 0xbefc0070,
-	0xc0611a3a, 0x0000007c,
+	0xc0611e3a, 0x0000007c,
+	0xbf8cc07f, 0x80708470,
+	0xbefc007e, 0xb8fbf803,
+	0xbefe007c, 0xbefc0070,
+	0xc0611efa, 0x0000007c,
 	0xbf8cc07f, 0x80708470,
 	0xbefc007e, 0xbefe007c,
-	0xbefc0070, 0xc0611a7a,
+	0xbefc0070, 0xc0611a3a,
 	0x0000007c, 0xbf8cc07f,
 	0x80708470, 0xbefc007e,
-	0xb8f1f801, 0xbefe007c,
-	0xbefc0070, 0xc0611c7a,
-	0x0000007c, 0xbf8cc07f,
-	0x80708470, 0xbefc007e,
-	0x867aff7f, 0x04000000,
-	0xbeef0080, 0x876f6f7a,
-	0xb8f02985, 0x80708170,
-	0x8e708a70, 0x8e708170,
-	0xb8fb1605, 0x807b817b,
-	0x8e7b847b, 0x8e76827b,
-	0xbef600ff, 0x01000000,
-	0xbef20174, 0x80747074,
-	0x82758075, 0xbefc0080,
-	0xbf800000, 0xbe802b00,
-	0xbe822b02, 0xbe842b04,
-	0xbe862b06, 0xbe882b08,
-	0xbe8a2b0a, 0xbe8c2b0c,
-	0xbe8e2b0e, 0xc06b003a,
-	0x00000000, 0xbf8cc07f,
-	0xc06b013a, 0x00000010,
-	0xbf8cc07f, 0xc06b023a,
-	0x00000020, 0xbf8cc07f,
-	0xc06b033a, 0x00000030,
-	0xbf8cc07f, 0x8074c074,
-	0x82758075, 0x807c907c,
-	0xbf0a7b7c, 0xbf85ffe7,
-	0xbef40172, 0xbef00080,
-	0xbefe00c1, 0xbeff00c1,
-	0xbee80080, 0xbee90080,
-	0xbef600ff, 0x01000000,
-	0x867aff78, 0x00400000,
-	0xbf850003, 0xb8faf803,
-	0x897a7aff, 0x10000000,
-	0xbf85004d, 0xbe840080,
-	0xd2890000, 0x00000900,
-	0x80048104, 0xd2890001,
+	0xbefe007c, 0xbefc0070,
+	0xc0611a7a, 0x0000007c,
+	0xbf8cc07f, 0x80708470,
+	0xbefc007e, 0xb8f1f801,
+	0xbefe007c, 0xbefc0070,
+	0xc0611c7a, 0x0000007c,
+	0xbf8cc07f, 0x80708470,
+	0xbefc007e, 0x867aff7f,
+	0x04000000, 0xbeef0080,
+	0x876f6f7a, 0xb8f02985,
+	0x80708170, 0x8e708a70,
+	0x8e708170, 0xb8fb1605,
+	0x807b817b, 0x8e7b847b,
+	0x8e76827b, 0xbef600ff,
+	0x01000000, 0xbef20174,
+	0x80747074, 0x82758075,
+	0xbefc0080, 0xbf800000,
+	0xbe802b00, 0xbe822b02,
+	0xbe842b04, 0xbe862b06,
+	0xbe882b08, 0xbe8a2b0a,
+	0xbe8c2b0c, 0xbe8e2b0e,
+	0xc06b003a, 0x00000000,
+	0xbf8cc07f, 0xc06b013a,
+	0x00000010, 0xbf8cc07f,
+	0xc06b023a, 0x00000020,
+	0xbf8cc07f, 0xc06b033a,
+	0x00000030, 0xbf8cc07f,
+	0x8074c074, 0x82758075,
+	0x807c907c, 0xbf0a7b7c,
+	0xbf85ffe7, 0xbef40172,
+	0xbef00080, 0xbefe00c1,
+	0xbeff00c1, 0xbee80080,
+	0xbee90080, 0xbef600ff,
+	0x01000000, 0x867aff78,
+	0x00400000, 0xbf850003,
+	0xb8faf803, 0x897a7aff,
+	0x10000000, 0xbf85004d,
+	0xbe840080, 0xd2890000,
 	0x00000900, 0x80048104,
-	0xd2890002, 0x00000900,
-	0x80048104, 0xd2890003,
+	0xd2890001, 0x00000900,
+	0x80048104, 0xd2890002,
 	0x00000900, 0x80048104,
-	0xc069003a, 0x00000070,
-	0xbf8cc07f, 0x80709070,
-	0xbf06c004, 0xbf84ffee,
-	0xbe840080, 0xd2890000,
-	0x00000901, 0x80048104,
-	0xd2890001, 0x00000901,
-	0x80048104, 0xd2890002,
-	0x00000901, 0x80048104,
-	0xd2890003, 0x00000901,
+	0xd2890003, 0x00000900,
 	0x80048104, 0xc069003a,
 	0x00000070, 0xbf8cc07f,
 	0x80709070, 0xbf06c004,
 	0xbf84ffee, 0xbe840080,
-	0xd2890000, 0x00000902,
+	0xd2890000, 0x00000901,
 	0x80048104, 0xd2890001,
-	0x00000902, 0x80048104,
-	0xd2890002, 0x00000902,
+	0x00000901, 0x80048104,
+	0xd2890002, 0x00000901,
 	0x80048104, 0xd2890003,
-	0x00000902, 0x80048104,
+	0x00000901, 0x80048104,
 	0xc069003a, 0x00000070,
 	0xbf8cc07f, 0x80709070,
 	0xbf06c004, 0xbf84ffee,
 	0xbe840080, 0xd2890000,
-	0x00000903, 0x80048104,
-	0xd2890001, 0x00000903,
-	0x80048104, 0xd2890002,
-	0x00000903, 0x80048104,
-	0xd2890003, 0x00000903,
-	0x80048104, 0xc069003a,
-	0x00000070, 0xbf8cc07f,
-	0x80709070, 0xbf06c004,
-	0xbf84ffee, 0xbf820008,
-	0xe0724000, 0x701d0000,
-	0xe0724100, 0x701d0100,
-	0xe0724200, 0x701d0200,
-	0xe0724300, 0x701d0300,
-	0xbefe00c1, 0xbeff00c1,
-	0xb8fb4306, 0x867bc17b,
-	0xbf840064, 0xbf8a0000,
-	0x867aff6f, 0x04000000,
-	0xbf840060, 0x8e7b867b,
-	0x8e7b827b, 0xbef6007b,
-	0xb8f02985, 0x80708170,
-	0x8e708a70, 0x8e708170,
-	0xb8fa1605, 0x807a817a,
-	0x8e7a867a, 0x80707a70,
-	0x8070ff70, 0x00000080,
-	0xbef600ff, 0x01000000,
-	0xbefc0080, 0xd28c0002,
-	0x000100c1, 0xd28d0003,
-	0x000204c1, 0x867aff78,
-	0x00400000, 0xbf850003,
-	0xb8faf803, 0x897a7aff,
-	0x10000000, 0xbf850030,
-	0x24040682, 0xd86e4000,
-	0x00000002, 0xbf8cc07f,
-	0xbe840080, 0xd2890000,
-	0x00000900, 0x80048104,
-	0xd2890001, 0x00000900,
+	0x00000902, 0x80048104,
+	0xd2890001, 0x00000902,
 	0x80048104, 0xd2890002,
-	0x00000900, 0x80048104,
-	0xd2890003, 0x00000900,
+	0x00000902, 0x80048104,
+	0xd2890003, 0x00000902,
 	0x80048104, 0xc069003a,
 	0x00000070, 0xbf8cc07f,
 	0x80709070, 0xbf06c004,
 	0xbf84ffee, 0xbe840080,
-	0xd2890000, 0x00000901,
+	0xd2890000, 0x00000903,
 	0x80048104, 0xd2890001,
-	0x00000901, 0x80048104,
-	0xd2890002, 0x00000901,
+	0x00000903, 0x80048104,
+	0xd2890002, 0x00000903,
 	0x80048104, 0xd2890003,
-	0x00000901, 0x80048104,
+	0x00000903, 0x80048104,
 	0xc069003a, 0x00000070,
 	0xbf8cc07f, 0x80709070,
 	0xbf06c004, 0xbf84ffee,
-	0x680404ff, 0x00000200,
-	0xd0c9006a, 0x0000f702,
-	0xbf87ffd2, 0xbf820015,
-	0xd1060002, 0x00011103,
-	0x7e0602ff, 0x00000200,
-	0xbefc00ff, 0x00010000,
-	0xbe800077, 0x8677ff77,
-	0xff7fffff, 0x8777ff77,
-	0x00058000, 0xd8ec0000,
-	0x00000002, 0xbf8cc07f,
-	0xe0765000, 0x701d0002,
-	0x68040702, 0xd0c9006a,
-	0x0000f702, 0xbf87fff7,
-	0xbef70000, 0xbef000ff,
-	0x00000400, 0xbefe00c1,
-	0xbeff00c1, 0xb8fb2b05,
-	0x807b817b, 0x8e7b827b,
-	0xbef600ff, 0x01000000,
-	0xbefc0084, 0xbf0a7b7c,
-	0xbf84006d, 0xbf11017c,
-	0x807bff7b, 0x00001000,
+	0xbf820008, 0xe0724000,
+	0x701d0000, 0xe0724100,
+	0x701d0100, 0xe0724200,
+	0x701d0200, 0xe0724300,
+	0x701d0300, 0xbefe00c1,
+	0xbeff00c1, 0xb8fb4306,
+	0x867bc17b, 0xbf840064,
+	0xbf8a0000, 0x867aff6f,
+	0x04000000, 0xbf840060,
+	0x8e7b867b, 0x8e7b827b,
+	0xbef6007b, 0xb8f02985,
+	0x80708170, 0x8e708a70,
+	0x8e708170, 0xb8fa1605,
+	0x807a817a, 0x8e7a867a,
+	0x80707a70, 0x8070ff70,
+	0x00000080, 0xbef600ff,
+	0x01000000, 0xbefc0080,
+	0xd28c0002, 0x000100c1,
+	0xd28d0003, 0x000204c1,
 	0x867aff78, 0x00400000,
 	0xbf850003, 0xb8faf803,
 	0x897a7aff, 0x10000000,
-	0xbf850051, 0xbe840080,
+	0xbf850030, 0x24040682,
+	0xd86e4000, 0x00000002,
+	0xbf8cc07f, 0xbe840080,
 	0xd2890000, 0x00000900,
 	0x80048104, 0xd2890001,
 	0x00000900, 0x80048104,
@@ -1839,51 +1798,31 @@ static const uint32_t cwsr_trap_aldebaran_hex[] = {
 	0x80048104, 0xc069003a,
 	0x00000070, 0xbf8cc07f,
 	0x80709070, 0xbf06c004,
-	0xbf84ffee, 0xbe840080,
-	0xd2890000, 0x00000902,
-	0x80048104, 0xd2890001,
-	0x00000902, 0x80048104,
-	0xd2890002, 0x00000902,
-	0x80048104, 0xd2890003,
-	0x00000902, 0x80048104,
-	0xc069003a, 0x00000070,
-	0xbf8cc07f, 0x80709070,
-	0xbf06c004, 0xbf84ffee,
-	0xbe840080, 0xd2890000,
-	0x00000903, 0x80048104,
-	0xd2890001, 0x00000903,
-	0x80048104, 0xd2890002,
-	0x00000903, 0x80048104,
-	0xd2890003, 0x00000903,
-	0x80048104, 0xc069003a,
-	0x00000070, 0xbf8cc07f,
-	0x80709070, 0xbf06c004,
-	0xbf84ffee, 0x807c847c,
-	0xbf0a7b7c, 0xbf85ffb1,
-	0xbf9c0000, 0xbf820012,
-	0x7e000300, 0x7e020301,
-	0x7e040302, 0x7e060303,
-	0xe0724000, 0x701d0000,
-	0xe0724100, 0x701d0100,
-	0xe0724200, 0x701d0200,
-	0xe0724300, 0x701d0300,
-	0x807c847c, 0x8070ff70,
-	0x00000400, 0xbf0a7b7c,
-	0xbf85ffef, 0xbf9c0000,
-	0xb8fb2985, 0x807b817b,
-	0x8e7b837b, 0xb8fa2b05,
-	0x807a817a, 0x8e7a827a,
-	0x80fb7a7b, 0x867b7b7b,
-	0xbf84007a, 0x807bff7b,
-	0x00001000, 0xbefc0080,
-	0xbf11017c, 0x867aff78,
+	0xbf84ffee, 0x680404ff,
+	0x00000200, 0xd0c9006a,
+	0x0000f702, 0xbf87ffd2,
+	0xbf820015, 0xd1060002,
+	0x00011103, 0x7e0602ff,
+	0x00000200, 0xbefc00ff,
+	0x00010000, 0xbe800077,
+	0x8677ff77, 0xff7fffff,
+	0x8777ff77, 0x00058000,
+	0xd8ec0000, 0x00000002,
+	0xbf8cc07f, 0xe0765000,
+	0x701d0002, 0x68040702,
+	0xd0c9006a, 0x0000f702,
+	0xbf87fff7, 0xbef70000,
+	0xbef000ff, 0x00000400,
+	0xbefe00c1, 0xbeff00c1,
+	0xb8fb2b05, 0x807b817b,
+	0x8e7b827b, 0xbef600ff,
+	0x01000000, 0xbefc0084,
+	0xbf0a7b7c, 0xbf84006d,
+	0xbf11017c, 0x807bff7b,
+	0x00001000, 0x867aff78,
 	0x00400000, 0xbf850003,
 	0xb8faf803, 0x897a7aff,
-	0x10000000, 0xbf850059,
-	0xd3d84000, 0x18000100,
-	0xd3d84001, 0x18000101,
-	0xd3d84002, 0x18000102,
-	0xd3d84003, 0x18000103,
+	0x10000000, 0xbf850051,
 	0xbe840080, 0xd2890000,
 	0x00000900, 0x80048104,
 	0xd2890001, 0x00000900,
@@ -1923,169 +1862,241 @@ static const uint32_t cwsr_trap_aldebaran_hex[] = {
 	0xbf8cc07f, 0x80709070,
 	0xbf06c004, 0xbf84ffee,
 	0x807c847c, 0xbf0a7b7c,
-	0xbf85ffa9, 0xbf9c0000,
-	0xbf820016, 0xd3d84000,
-	0x18000100, 0xd3d84001,
-	0x18000101, 0xd3d84002,
-	0x18000102, 0xd3d84003,
-	0x18000103, 0xe0724000,
+	0xbf85ffb1, 0xbf9c0000,
+	0xbf820012, 0x7e000300,
+	0x7e020301, 0x7e040302,
+	0x7e060303, 0xe0724000,
 	0x701d0000, 0xe0724100,
 	0x701d0100, 0xe0724200,
 	0x701d0200, 0xe0724300,
 	0x701d0300, 0x807c847c,
 	0x8070ff70, 0x00000400,
-	0xbf0a7b7c, 0xbf85ffeb,
-	0xbf9c0000, 0xbf820101,
-	0xbef4007e, 0x8675ff7f,
-	0x0000ffff, 0x8775ff75,
-	0x00040000, 0xbef60080,
-	0xbef700ff, 0x00807fac,
-	0x866eff7f, 0x08000000,
-	0x8f6e836e, 0x87776e77,
-	0x866eff7f, 0x70000000,
-	0x8f6e816e, 0x87776e77,
-	0x866eff7f, 0x04000000,
-	0xbf84001f, 0xbefe00c1,
-	0xbeff00c1, 0xb8ef4306,
-	0x866fc16f, 0xbf84001a,
-	0x8e6f866f, 0x8e6f826f,
-	0xbef6006f, 0xb8f82985,
-	0x80788178, 0x8e788a78,
-	0x8e788178, 0xb8ee1605,
-	0x806e816e, 0x8e6e866e,
-	0x80786e78, 0x8078ff78,
-	0x00000080, 0xbef600ff,
-	0x01000000, 0xbefc0080,
-	0xe0510000, 0x781d0000,
-	0xe0510100, 0x781d0000,
-	0x807cff7c, 0x00000200,
-	0x8078ff78, 0x00000200,
-	0xbf0a6f7c, 0xbf85fff6,
+	0xbf0a7b7c, 0xbf85ffef,
+	0xbf9c0000, 0xb8fb2985,
+	0x807b817b, 0x8e7b837b,
+	0xb8fa2b05, 0x807a817a,
+	0x8e7a827a, 0x80fb7a7b,
+	0x867b7b7b, 0xbf84007a,
+	0x807bff7b, 0x00001000,
+	0xbefc0080, 0xbf11017c,
+	0x867aff78, 0x00400000,
+	0xbf850003, 0xb8faf803,
+	0x897a7aff, 0x10000000,
+	0xbf850059, 0xd3d84000,
+	0x18000100, 0xd3d84001,
+	0x18000101, 0xd3d84002,
+	0x18000102, 0xd3d84003,
+	0x18000103, 0xbe840080,
+	0xd2890000, 0x00000900,
+	0x80048104, 0xd2890001,
+	0x00000900, 0x80048104,
+	0xd2890002, 0x00000900,
+	0x80048104, 0xd2890003,
+	0x00000900, 0x80048104,
+	0xc069003a, 0x00000070,
+	0xbf8cc07f, 0x80709070,
+	0xbf06c004, 0xbf84ffee,
+	0xbe840080, 0xd2890000,
+	0x00000901, 0x80048104,
+	0xd2890001, 0x00000901,
+	0x80048104, 0xd2890002,
+	0x00000901, 0x80048104,
+	0xd2890003, 0x00000901,
+	0x80048104, 0xc069003a,
+	0x00000070, 0xbf8cc07f,
+	0x80709070, 0xbf06c004,
+	0xbf84ffee, 0xbe840080,
+	0xd2890000, 0x00000902,
+	0x80048104, 0xd2890001,
+	0x00000902, 0x80048104,
+	0xd2890002, 0x00000902,
+	0x80048104, 0xd2890003,
+	0x00000902, 0x80048104,
+	0xc069003a, 0x00000070,
+	0xbf8cc07f, 0x80709070,
+	0xbf06c004, 0xbf84ffee,
+	0xbe840080, 0xd2890000,
+	0x00000903, 0x80048104,
+	0xd2890001, 0x00000903,
+	0x80048104, 0xd2890002,
+	0x00000903, 0x80048104,
+	0xd2890003, 0x00000903,
+	0x80048104, 0xc069003a,
+	0x00000070, 0xbf8cc07f,
+	0x80709070, 0xbf06c004,
+	0xbf84ffee, 0x807c847c,
+	0xbf0a7b7c, 0xbf85ffa9,
+	0xbf9c0000, 0xbf820016,
+	0xd3d84000, 0x18000100,
+	0xd3d84001, 0x18000101,
+	0xd3d84002, 0x18000102,
+	0xd3d84003, 0x18000103,
+	0xe0724000, 0x701d0000,
+	0xe0724100, 0x701d0100,
+	0xe0724200, 0x701d0200,
+	0xe0724300, 0x701d0300,
+	0x807c847c, 0x8070ff70,
+	0x00000400, 0xbf0a7b7c,
+	0xbf85ffeb, 0xbf9c0000,
+	0xbf8200ee, 0xbef4007e,
+	0x8675ff7f, 0x0000ffff,
+	0x8775ff75, 0x00040000,
+	0xbef60080, 0xbef700ff,
+	0x00807fac, 0x866eff7f,
+	0x04000000, 0xbf84001f,
 	0xbefe00c1, 0xbeff00c1,
+	0xb8ef4306, 0x866fc16f,
+	0xbf84001a, 0x8e6f866f,
+	0x8e6f826f, 0xbef6006f,
+	0xb8f82985, 0x80788178,
+	0x8e788a78, 0x8e788178,
+	0xb8ee1605, 0x806e816e,
+	0x8e6e866e, 0x80786e78,
+	0x8078ff78, 0x00000080,
 	0xbef600ff, 0x01000000,
-	0xb8ef2b05, 0x806f816f,
-	0x8e6f826f, 0x806fff6f,
-	0x00008000, 0xbef80080,
-	0xbeee0078, 0x8078ff78,
-	0x00000400, 0xbefc0084,
+	0xbefc0080, 0xe0510000,
+	0x781d0000, 0xe0510100,
+	0x781d0000, 0x807cff7c,
+	0x00000200, 0x8078ff78,
+	0x00000200, 0xbf0a6f7c,
+	0xbf85fff6, 0xbefe00c1,
+	0xbeff00c1, 0xbef600ff,
+	0x01000000, 0xb8ef2b05,
+	0x806f816f, 0x8e6f826f,
+	0x806fff6f, 0x00008000,
+	0xbef80080, 0xbeee0078,
+	0x8078ff78, 0x00000400,
+	0xbefc0084, 0xbf11087c,
+	0xe0524000, 0x781d0000,
+	0xe0524100, 0x781d0100,
+	0xe0524200, 0x781d0200,
+	0xe0524300, 0x781d0300,
+	0xbf8c0f70, 0x7e000300,
+	0x7e020301, 0x7e040302,
+	0x7e060303, 0x807c847c,
+	0x8078ff78, 0x00000400,
+	0xbf0a6f7c, 0xbf85ffee,
+	0xb8ef2985, 0x806f816f,
+	0x8e6f836f, 0xb8f92b05,
+	0x80798179, 0x8e798279,
+	0x80ef796f, 0x866f6f6f,
+	0xbf84001a, 0x806fff6f,
+	0x00008000, 0xbefc0080,
 	0xbf11087c, 0xe0524000,
 	0x781d0000, 0xe0524100,
 	0x781d0100, 0xe0524200,
 	0x781d0200, 0xe0524300,
 	0x781d0300, 0xbf8c0f70,
-	0x7e000300, 0x7e020301,
-	0x7e040302, 0x7e060303,
+	0xd3d94000, 0x18000100,
+	0xd3d94001, 0x18000101,
+	0xd3d94002, 0x18000102,
+	0xd3d94003, 0x18000103,
 	0x807c847c, 0x8078ff78,
 	0x00000400, 0xbf0a6f7c,
-	0xbf85ffee, 0xb8ef2985,
-	0x806f816f, 0x8e6f836f,
-	0xb8f92b05, 0x80798179,
-	0x8e798279, 0x80ef796f,
-	0x866f6f6f, 0xbf84001a,
-	0x806fff6f, 0x00008000,
-	0xbefc0080, 0xbf11087c,
-	0xe0524000, 0x781d0000,
-	0xe0524100, 0x781d0100,
-	0xe0524200, 0x781d0200,
-	0xe0524300, 0x781d0300,
-	0xbf8c0f70, 0xd3d94000,
-	0x18000100, 0xd3d94001,
-	0x18000101, 0xd3d94002,
-	0x18000102, 0xd3d94003,
-	0x18000103, 0x807c847c,
-	0x8078ff78, 0x00000400,
-	0xbf0a6f7c, 0xbf85ffea,
-	0xbf9c0000, 0xe0524000,
-	0x6e1d0000, 0xe0524100,
-	0x6e1d0100, 0xe0524200,
-	0x6e1d0200, 0xe0524300,
-	0x6e1d0300, 0xbf8c0f70,
-	0xb8f82985, 0x80788178,
-	0x8e788a78, 0x8e788178,
-	0xb8ee1605, 0x806e816e,
-	0x8e6e866e, 0x80786e78,
-	0x80f8c078, 0xb8ef1605,
-	0x806f816f, 0x8e6f846f,
-	0x8e76826f, 0xbef600ff,
-	0x01000000, 0xbefc006f,
-	0xc031003a, 0x00000078,
-	0x80f8c078, 0xbf8cc07f,
-	0x80fc907c, 0xbf800000,
-	0xbe802d00, 0xbe822d02,
-	0xbe842d04, 0xbe862d06,
-	0xbe882d08, 0xbe8a2d0a,
-	0xbe8c2d0c, 0xbe8e2d0e,
-	0xbf06807c, 0xbf84fff0,
-	0xb8f82985, 0x80788178,
-	0x8e788a78, 0x8e788178,
-	0xb8ee1605, 0x806e816e,
-	0x8e6e866e, 0x80786e78,
-	0xbef60084, 0xbef600ff,
-	0x01000000, 0xc0211bfa,
+	0xbf85ffea, 0xbf9c0000,
+	0xe0524000, 0x6e1d0000,
+	0xe0524100, 0x6e1d0100,
+	0xe0524200, 0x6e1d0200,
+	0xe0524300, 0x6e1d0300,
+	0xbf8c0f70, 0xb8f82985,
+	0x80788178, 0x8e788a78,
+	0x8e788178, 0xb8ee1605,
+	0x806e816e, 0x8e6e866e,
+	0x80786e78, 0x80f8c078,
+	0xb8ef1605, 0x806f816f,
+	0x8e6f846f, 0x8e76826f,
+	0xbef600ff, 0x01000000,
+	0xbefc006f, 0xc031003a,
+	0x00000078, 0x80f8c078,
+	0xbf8cc07f, 0x80fc907c,
+	0xbf800000, 0xbe802d00,
+	0xbe822d02, 0xbe842d04,
+	0xbe862d06, 0xbe882d08,
+	0xbe8a2d0a, 0xbe8c2d0c,
+	0xbe8e2d0e, 0xbf06807c,
+	0xbf84fff0, 0xb8f82985,
+	0x80788178, 0x8e788a78,
+	0x8e788178, 0xb8ee1605,
+	0x806e816e, 0x8e6e866e,
+	0x80786e78, 0xbef60084,
+	0xbef600ff, 0x01000000,
+	0xc0211bfa, 0x00000078,
+	0x80788478, 0xc0211b3a,
 	0x00000078, 0x80788478,
-	0xc0211b3a, 0x00000078,
-	0x80788478, 0xc0211b7a,
+	0xc0211b7a, 0x00000078,
+	0x80788478, 0xc0211c3a,
 	0x00000078, 0x80788478,
-	0xc0211c3a, 0x00000078,
-	0x80788478, 0xc0211c7a,
+	0xc0211c7a, 0x00000078,
+	0x80788478, 0xc0211eba,
 	0x00000078, 0x80788478,
-	0xc0211eba, 0x00000078,
-	0x80788478, 0xc0211efa,
+	0xc0211efa, 0x00000078,
+	0x80788478, 0xc0211a3a,
 	0x00000078, 0x80788478,
-	0xc0211a3a, 0x00000078,
-	0x80788478, 0xc0211a7a,
+	0xc0211a7a, 0x00000078,
+	0x80788478, 0xc0211cfa,
 	0x00000078, 0x80788478,
-	0xc0211cfa, 0x00000078,
-	0x80788478, 0xbf8cc07f,
-	0xbefc006f, 0xbefe0070,
-	0xbeff0071, 0x866f7bff,
-	0x000003ff, 0xb96f4803,
-	0x866f7bff, 0xfffff800,
-	0x8f6f8b6f, 0xb96fa2c3,
-	0xb973f801, 0xb8ee2985,
-	0x806e816e, 0x8e6e8a6e,
-	0x8e6e816e, 0xb8ef1605,
-	0x806f816f, 0x8e6f866f,
-	0x806e6f6e, 0x806e746e,
-	0x826f8075, 0x866fff6f,
-	0x0000ffff, 0xc00b1c37,
-	0x00000050, 0xc00b1d37,
-	0x00000060, 0xc0031e77,
-	0x00000074, 0xbf8cc07f,
-	0x866fff6d, 0xf8000000,
-	0x8f6f9b6f, 0x8e6f906f,
-	0xbeee0080, 0x876e6f6e,
-	0x866fff6d, 0x04000000,
-	0x8f6f9a6f, 0x8e6f8f6f,
-	0x876e6f6e, 0x866fff7a,
-	0x00800000, 0x8f6f976f,
+	0xbf8cc07f, 0xbefc006f,
+	0xbefe0070, 0xbeff0071,
+	0x866f7bff, 0x000003ff,
+	0xb96f4803, 0x866f7bff,
+	0xfffff800, 0x8f6f8b6f,
+	0xb96fa2c3, 0xb973f801,
+	0xb8ee2985, 0x806e816e,
+	0x8e6e8a6e, 0x8e6e816e,
+	0xb8ef1605, 0x806f816f,
+	0x8e6f866f, 0x806e6f6e,
+	0x806e746e, 0x826f8075,
+	0x866fff6f, 0x0000ffff,
+	0xc00b1c37, 0x00000050,
+	0xc00b1d37, 0x00000060,
+	0xc0031e77, 0x00000074,
+	0xbf8cc07f, 0x8f6e8b77,
+	0x866eff6e, 0x001f8000,
 	0xb96ef807, 0x866dff6d,
 	0x0000ffff, 0x86fe7e7e,
 	0x86ea6a6a, 0x8f6e837a,
 	0xb96ee0c2, 0xbf800002,
 	0xb97a0002, 0xbf8a0000,
-	0x95806f6c, 0xbf810000,
+	0xbe801f6c, 0xbf810000,
 };
 
 static const uint32_t cwsr_trap_gfx10_hex[] = {
-	0xbf820001, 0xbf8201cf,
+	0xbf820001, 0xbf82021c,
 	0xb0804004, 0xb978f802,
-	0x8a788678, 0xb96ef801,
-	0x876eff6e, 0x00000800,
-	0xbf840003, 0x876eff78,
+	0x8a78ff78, 0x00020006,
+	0xb97bf803, 0x876eff78,
 	0x00002000, 0xbf840009,
-	0xb97bf803, 0x876eff7b,
-	0x00000400, 0xbf85001d,
-	0x876eff7b, 0x00000100,
-	0xbf840002, 0x8878ff78,
-	0x00002000, 0xb97af812,
+	0x876eff6d, 0x00ff0000,
+	0xbf85001e, 0x876eff7b,
+	0x00000400, 0xbf850041,
+	0xbf8e0010, 0xb97bf803,
+	0xbf82fffa, 0x876eff7b,
+	0x00000900, 0xbf850015,
+	0x876eff7b, 0x000071ff,
+	0xbf840008, 0x876fff7b,
+	0x00007080, 0xbf840001,
+	0xbeee1d87, 0xb96ff801,
+	0x8f6e8c6e, 0x876e6f6e,
+	0xbf85000a, 0x876eff6d,
+	0x00ff0000, 0xbf850007,
+	0xb96ef801, 0x876eff6e,
+	0x00000800, 0xbf850003,
+	0x876eff7b, 0x00000400,
+	0xbf850026, 0xb97af812,
 	0xb97bf813, 0x8ffa887a,
-	0xf4051bbd, 0xfa000000,
-	0xbf8cc07f, 0xf4051ebd,
-	0xfa000008, 0xbf8cc07f,
-	0x87ee6e6e, 0xbf840001,
-	0xbe80206e, 0xb97bf803,
-	0x877bff7b, 0x000001ff,
+	0xf4011bbd, 0xfa000010,
+	0xbf8cc07f, 0x8f6e976e,
+	0x8a77ff77, 0x00800000,
+	0x88776e77, 0xf4051bbd,
+	0xfa000000, 0xbf8cc07f,
+	0xf4051ebd, 0xfa000008,
+	0xbf8cc07f, 0x87ee6e6e,
+	0xbf840001, 0xbe80206e,
+	0x876eff6d, 0x01ff0000,
+	0xbf850005, 0x8878ff78,
+	0x00002000, 0x80ec886c,
+	0x82ed806d, 0xbf820005,
+	0x876eff6d, 0x01000000,
 	0xbf850002, 0x806c846c,
 	0x826d806d, 0x876dff6d,
 	0x0000ffff, 0x87fe7e7e,
@@ -2095,37 +2106,55 @@ static const uint32_t cwsr_trap_gfx10_hex[] = {
 	0xb9fa0283, 0xbeee037e,
 	0xbeef037f, 0xbefe0480,
 	0xbf900004, 0xbf8cc07f,
+	0x877aff7f, 0x04000000,
+	0x8f7a857a, 0x886d7a6d,
+	0xbefa037e, 0x877bff7f,
+	0x0000ffff, 0xbefe03c1,
+	0xbeff03c1, 0xdc5f8000,
+	0x007a0000, 0x7e000280,
+	0xbefe037a, 0xbeff037b,
 	0xb97b02dc, 0x8f7b997b,
-	0x887b7b7f, 0xb97a2a05,
-	0x807a817a, 0xbf0d997b,
-	0xbf850002, 0x8f7a897a,
-	0xbf820001, 0x8f7a8a7a,
+	0xb97a2a05, 0x807a817a,
+	0xbf0d997b, 0xbf850002,
+	0x8f7a897a, 0xbf820001,
+	0x8f7a8a7a, 0xb97b1e06,
+	0x8f7b8a7b, 0x807a7b7a,
 	0x877bff7f, 0x0000ffff,
 	0x807aff7a, 0x00000200,
 	0x807a7e7a, 0x827b807b,
-	0xbef4037e, 0x8775ff7f,
-	0x0000ffff, 0x8875ff75,
-	0x00040000, 0xbef60380,
-	0xbef703ff, 0x10807fac,
-	0x877aff7f, 0x08000000,
-	0x907a837a, 0x88777a77,
-	0x877aff7f, 0x70000000,
-	0x907a817a, 0x88777a77,
-	0xbef1037c, 0xbef00380,
-	0xb97302dc, 0x8f739973,
-	0x8873737f, 0xbefe03c1,
+	0xd7610000, 0x00010870,
+	0xd7610000, 0x00010a71,
+	0xd7610000, 0x00010c72,
+	0xd7610000, 0x00010e73,
+	0xd7610000, 0x00011074,
+	0xd7610000, 0x00011275,
+	0xd7610000, 0x00011476,
+	0xd7610000, 0x00011677,
+	0xd7610000, 0x00011a79,
+	0xd7610000, 0x00011c7e,
+	0xd7610000, 0x00011e7f,
+	0xbefe03ff, 0x00003fff,
+	0xbeff0380, 0xdc5f8040,
+	0x007a0000, 0xd760007a,
+	0x00011d00, 0xd760007b,
+	0x00011f00, 0xbefe037a,
+	0xbeff037b, 0xbef4037e,
+	0x8775ff7f, 0x0000ffff,
+	0x8875ff75, 0x00040000,
+	0xbef60380, 0xbef703ff,
+	0x10807fac, 0xbef1037c,
+	0xbef00380, 0xb97302dc,
+	0x8f739973, 0xbefe03c1,
 	0x907c9973, 0x877c817c,
 	0xbf06817c, 0xbf850002,
 	0xbeff0380, 0xbf820002,
-	0xbeff03c1, 0xbf82000b,
+	0xbeff03c1, 0xbf820009,
 	0xbef603ff, 0x01000000,
-	0xe0704000, 0x705d0000,
 	0xe0704080, 0x705d0100,
 	0xe0704100, 0x705d0200,
 	0xe0704180, 0x705d0300,
-	0xbf82000a, 0xbef603ff,
-	0x01000000, 0xe0704000,
-	0x705d0000, 0xe0704100,
+	0xbf820008, 0xbef603ff,
+	0x01000000, 0xe0704100,
 	0x705d0100, 0xe0704200,
 	0x705d0200, 0xe0704300,
 	0x705d0300, 0xb9702a05,
@@ -2140,8 +2169,9 @@ static const uint32_t cwsr_trap_gfx10_hex[] = {
 	0xbefc0380, 0xd7610002,
 	0x0000f871, 0x807c817c,
 	0xd7610002, 0x0000f86c,
-	0x807c817c, 0xd7610002,
-	0x0000f86d, 0x807c817c,
+	0x807c817c, 0x8a7aff6d,
+	0x80000000, 0xd7610002,
+	0x0000f87a, 0x807c817c,
 	0xd7610002, 0x0000f86e,
 	0x807c817c, 0xd7610002,
 	0x0000f86f, 0x807c817c,
@@ -2156,160 +2186,157 @@ static const uint32_t cwsr_trap_gfx10_hex[] = {
 	0x0000f871, 0x807c817c,
 	0xb971f815, 0xd7610002,
 	0x0000f871, 0x807c817c,
+	0xbefe03ff, 0x0000ffff,
 	0xbeff0380, 0xe0704000,
-	0x705d0200, 0xb9702a05,
-	0x80708170, 0xbf0d9973,
-	0xbf850002, 0x8f708970,
-	0xbf820001, 0x8f708a70,
-	0xb97a1e06, 0x8f7a8a7a,
-	0x80707a70, 0xbef603ff,
-	0x01000000, 0xbef90380,
-	0xbefc0380, 0xbf800000,
-	0xbe802f00, 0xbe822f02,
-	0xbe842f04, 0xbe862f06,
-	0xbe882f08, 0xbe8a2f0a,
-	0xbe8c2f0c, 0xbe8e2f0e,
-	0xd7610002, 0x0000f200,
-	0x80798179, 0xd7610002,
-	0x0000f201, 0x80798179,
-	0xd7610002, 0x0000f202,
-	0x80798179, 0xd7610002,
-	0x0000f203, 0x80798179,
-	0xd7610002, 0x0000f204,
+	0x705d0200, 0xbefe03c1,
+	0xb9702a05, 0x80708170,
+	0xbf0d9973, 0xbf850002,
+	0x8f708970, 0xbf820001,
+	0x8f708a70, 0xb97a1e06,
+	0x8f7a8a7a, 0x80707a70,
+	0xbef603ff, 0x01000000,
+	0xbef90380, 0xbefc0380,
+	0xbf800000, 0xbe802f00,
+	0xbe822f02, 0xbe842f04,
+	0xbe862f06, 0xbe882f08,
+	0xbe8a2f0a, 0xbe8c2f0c,
+	0xbe8e2f0e, 0xd7610002,
+	0x0000f200, 0x80798179,
+	0xd7610002, 0x0000f201,
 	0x80798179, 0xd7610002,
-	0x0000f205, 0x80798179,
-	0xd7610002, 0x0000f206,
+	0x0000f202, 0x80798179,
+	0xd7610002, 0x0000f203,
 	0x80798179, 0xd7610002,
-	0x0000f207, 0x80798179,
-	0xd7610002, 0x0000f208,
+	0x0000f204, 0x80798179,
+	0xd7610002, 0x0000f205,
 	0x80798179, 0xd7610002,
-	0x0000f209, 0x80798179,
-	0xd7610002, 0x0000f20a,
+	0x0000f206, 0x80798179,
+	0xd7610002, 0x0000f207,
 	0x80798179, 0xd7610002,
-	0x0000f20b, 0x80798179,
-	0xd7610002, 0x0000f20c,
+	0x0000f208, 0x80798179,
+	0xd7610002, 0x0000f209,
 	0x80798179, 0xd7610002,
-	0x0000f20d, 0x80798179,
-	0xd7610002, 0x0000f20e,
+	0x0000f20a, 0x80798179,
+	0xd7610002, 0x0000f20b,
 	0x80798179, 0xd7610002,
-	0x0000f20f, 0x80798179,
-	0xbf06a079, 0xbf840006,
-	0xe0704000, 0x705d0200,
-	0x8070ff70, 0x00000080,
-	0xbef90380, 0x7e040280,
-	0x807c907c, 0xbf0aff7c,
-	0x00000060, 0xbf85ffbc,
-	0xbe802f00, 0xbe822f02,
-	0xbe842f04, 0xbe862f06,
-	0xbe882f08, 0xbe8a2f0a,
-	0xd7610002, 0x0000f200,
+	0x0000f20c, 0x80798179,
+	0xd7610002, 0x0000f20d,
 	0x80798179, 0xd7610002,
-	0x0000f201, 0x80798179,
-	0xd7610002, 0x0000f202,
+	0x0000f20e, 0x80798179,
+	0xd7610002, 0x0000f20f,
+	0x80798179, 0xbf06a079,
+	0xbf840006, 0xe0704000,
+	0x705d0200, 0x8070ff70,
+	0x00000080, 0xbef90380,
+	0x7e040280, 0x807c907c,
+	0xbf0aff7c, 0x00000060,
+	0xbf85ffbc, 0xbe802f00,
+	0xbe822f02, 0xbe842f04,
+	0xbe862f06, 0xbe882f08,
+	0xbe8a2f0a, 0xd7610002,
+	0x0000f200, 0x80798179,
+	0xd7610002, 0x0000f201,
 	0x80798179, 0xd7610002,
-	0x0000f203, 0x80798179,
-	0xd7610002, 0x0000f204,
+	0x0000f202, 0x80798179,
+	0xd7610002, 0x0000f203,
 	0x80798179, 0xd7610002,
-	0x0000f205, 0x80798179,
-	0xd7610002, 0x0000f206,
+	0x0000f204, 0x80798179,
+	0xd7610002, 0x0000f205,
 	0x80798179, 0xd7610002,
-	0x0000f207, 0x80798179,
-	0xd7610002, 0x0000f208,
+	0x0000f206, 0x80798179,
+	0xd7610002, 0x0000f207,
 	0x80798179, 0xd7610002,
-	0x0000f209, 0x80798179,
-	0xd7610002, 0x0000f20a,
+	0x0000f208, 0x80798179,
+	0xd7610002, 0x0000f209,
 	0x80798179, 0xd7610002,
-	0x0000f20b, 0x80798179,
-	0xe0704000, 0x705d0200,
+	0x0000f20a, 0x80798179,
+	0xd7610002, 0x0000f20b,
+	0x80798179, 0xe0704000,
+	0x705d0200, 0xbefe03c1,
+	0x907c9973, 0x877c817c,
+	0xbf06817c, 0xbf850002,
+	0xbeff0380, 0xbf820001,
+	0xbeff03c1, 0xb97b4306,
+	0x877bc17b, 0xbf840044,
+	0xbf8a0000, 0x877aff6d,
+	0x80000000, 0xbf840040,
+	0x8f7b867b, 0x8f7b827b,
+	0xbef6037b, 0xb9702a05,
+	0x80708170, 0xbf0d9973,
+	0xbf850002, 0x8f708970,
+	0xbf820001, 0x8f708a70,
+	0xb97a1e06, 0x8f7a8a7a,
+	0x80707a70, 0x8070ff70,
+	0x00000200, 0x8070ff70,
+	0x00000080, 0xbef603ff,
+	0x01000000, 0xd7650000,
+	0x000100c1, 0xd7660000,
+	0x000200c1, 0x16000084,
+	0x907c9973, 0x877c817c,
+	0xbf06817c, 0xbefc0380,
+	0xbf850012, 0xbe8303ff,
+	0x00000080, 0xbf800000,
+	0xbf800000, 0xbf800000,
+	0xd8d80000, 0x01000000,
+	0xbf8c0000, 0xe0704000,
+	0x705d0100, 0x807c037c,
+	0x80700370, 0xd5250000,
+	0x0001ff00, 0x00000080,
+	0xbf0a7b7c, 0xbf85fff4,
+	0xbf820011, 0xbe8303ff,
+	0x00000100, 0xbf800000,
+	0xbf800000, 0xbf800000,
+	0xd8d80000, 0x01000000,
+	0xbf8c0000, 0xe0704000,
+	0x705d0100, 0x807c037c,
+	0x80700370, 0xd5250000,
+	0x0001ff00, 0x00000100,
+	0xbf0a7b7c, 0xbf85fff4,
 	0xbefe03c1, 0x907c9973,
 	0x877c817c, 0xbf06817c,
-	0xbf850002, 0xbeff0380,
-	0xbf820001, 0xbeff03c1,
-	0xb97b4306, 0x877bc17b,
-	0xbf840044, 0xbf8a0000,
-	0x877aff73, 0x04000000,
-	0xbf840040, 0x8f7b867b,
-	0x8f7b827b, 0xbef6037b,
-	0xb9702a05, 0x80708170,
-	0xbf0d9973, 0xbf850002,
-	0x8f708970, 0xbf820001,
-	0x8f708a70, 0xb97a1e06,
-	0x8f7a8a7a, 0x80707a70,
-	0x8070ff70, 0x00000200,
-	0x8070ff70, 0x00000080,
-	0xbef603ff, 0x01000000,
-	0xd7650000, 0x000100c1,
-	0xd7660000, 0x000200c1,
-	0x16000084, 0x907c9973,
+	0xbf850004, 0xbef003ff,
+	0x00000200, 0xbeff0380,
+	0xbf820003, 0xbef003ff,
+	0x00000400, 0xbeff03c1,
+	0xb97b2a05, 0x807b817b,
+	0x8f7b827b, 0x907c9973,
 	0x877c817c, 0xbf06817c,
-	0xbefc0380, 0xbf850012,
-	0xbe8303ff, 0x00000080,
-	0xbf800000, 0xbf800000,
-	0xbf800000, 0xd8d80000,
-	0x01000000, 0xbf8c0000,
-	0xe0704000, 0x705d0100,
-	0x807c037c, 0x80700370,
-	0xd5250000, 0x0001ff00,
-	0x00000080, 0xbf0a7b7c,
-	0xbf85fff4, 0xbf820011,
-	0xbe8303ff, 0x00000100,
-	0xbf800000, 0xbf800000,
-	0xbf800000, 0xd8d80000,
-	0x01000000, 0xbf8c0000,
-	0xe0704000, 0x705d0100,
-	0x807c037c, 0x80700370,
-	0xd5250000, 0x0001ff00,
-	0x00000100, 0xbf0a7b7c,
-	0xbf85fff4, 0xbefe03c1,
-	0x907c9973, 0x877c817c,
-	0xbf06817c, 0xbf850004,
-	0xbef003ff, 0x00000200,
-	0xbeff0380, 0xbf820003,
-	0xbef003ff, 0x00000400,
-	0xbeff03c1, 0xb97b2a05,
-	0x807b817b, 0x8f7b827b,
-	0x907c9973, 0x877c817c,
-	0xbf06817c, 0xbf850017,
+	0xbf850017, 0xbef603ff,
+	0x01000000, 0xbefc0384,
+	0xbf0a7b7c, 0xbf840037,
+	0x7e008700, 0x7e028701,
+	0x7e048702, 0x7e068703,
+	0xe0704000, 0x705d0000,
+	0xe0704080, 0x705d0100,
+	0xe0704100, 0x705d0200,
+	0xe0704180, 0x705d0300,
+	0x807c847c, 0x8070ff70,
+	0x00000200, 0xbf0a7b7c,
+	0xbf85ffef, 0xbf820025,
 	0xbef603ff, 0x01000000,
 	0xbefc0384, 0xbf0a7b7c,
-	0xbf840037, 0x7e008700,
+	0xbf840011, 0x7e008700,
 	0x7e028701, 0x7e048702,
 	0x7e068703, 0xe0704000,
-	0x705d0000, 0xe0704080,
-	0x705d0100, 0xe0704100,
-	0x705d0200, 0xe0704180,
+	0x705d0000, 0xe0704100,
+	0x705d0100, 0xe0704200,
+	0x705d0200, 0xe0704300,
 	0x705d0300, 0x807c847c,
-	0x8070ff70, 0x00000200,
+	0x8070ff70, 0x00000400,
 	0xbf0a7b7c, 0xbf85ffef,
-	0xbf820025, 0xbef603ff,
-	0x01000000, 0xbefc0384,
-	0xbf0a7b7c, 0xbf840020,
-	0x7e008700, 0x7e028701,
-	0x7e048702, 0x7e068703,
+	0xb97b1e06, 0x877bc17b,
+	0xbf84000c, 0x8f7b837b,
+	0x807b7c7b, 0xbefe03c1,
+	0xbeff0380, 0x7e008700,
 	0xe0704000, 0x705d0000,
-	0xe0704100, 0x705d0100,
-	0xe0704200, 0x705d0200,
-	0xe0704300, 0x705d0300,
-	0x807c847c, 0x8070ff70,
-	0x00000400, 0xbf0a7b7c,
-	0xbf85ffef, 0xb97b1e06,
-	0x877bc17b, 0xbf84000c,
-	0x8f7b837b, 0x807b7c7b,
-	0xbefe03c1, 0xbeff0380,
-	0x7e008700, 0xe0704000,
-	0x705d0000, 0x807c817c,
-	0x8070ff70, 0x00000080,
-	0xbf0a7b7c, 0xbf85fff8,
-	0xbf82013c, 0xbef4037e,
-	0x8775ff7f, 0x0000ffff,
-	0x8875ff75, 0x00040000,
-	0xbef60380, 0xbef703ff,
-	0x10807fac, 0x876eff7f,
-	0x08000000, 0x906e836e,
-	0x88776e77, 0x876eff7f,
-	0x70000000, 0x906e816e,
-	0x88776e77, 0xb97202dc,
-	0x8f729972, 0x8872727f,
+	0x807c817c, 0x8070ff70,
+	0x00000080, 0xbf0a7b7c,
+	0xbf85fff8, 0xbf82013b,
+	0xbef4037e, 0x8775ff7f,
+	0x0000ffff, 0x8875ff75,
+	0x00040000, 0xbef60380,
+	0xbef703ff, 0x10807fac,
+	0xb97202dc, 0x8f729972,
 	0x876eff7f, 0x04000000,
 	0xbf840034, 0xbefe03c1,
 	0x907c9972, 0x877c817c,
@@ -2345,10 +2372,11 @@ static const uint32_t cwsr_trap_gfx10_hex[] = {
 	0xb96f2a05, 0x806f816f,
 	0x8f6f826f, 0x907c9972,
 	0x877c817c, 0xbf06817c,
-	0xbf850021, 0xbef603ff,
+	0xbf850024, 0xbef603ff,
 	0x01000000, 0xbeee0378,
 	0x8078ff78, 0x00000200,
-	0xbefc0384, 0xe0304000,
+	0xbefc0384, 0xbf0a6f7c,
+	0xbf840050, 0xe0304000,
 	0x785d0000, 0xe0304080,
 	0x785d0100, 0xe0304100,
 	0x785d0200, 0xe0304180,
@@ -2361,94 +2389,97 @@ static const uint32_t cwsr_trap_gfx10_hex[] = {
 	0x6e5d0000, 0xe0304080,
 	0x6e5d0100, 0xe0304100,
 	0x6e5d0200, 0xe0304180,
-	0x6e5d0300, 0xbf820032,
-	0xbef603ff, 0x01000000,
-	0xbeee0378, 0x8078ff78,
-	0x00000400, 0xbefc0384,
+	0x6e5d0300, 0xbf8c3f70,
+	0xbf820034, 0xbef603ff,
+	0x01000000, 0xbeee0378,
+	0x8078ff78, 0x00000400,
+	0xbefc0384, 0xbf0a6f7c,
+	0xbf840012, 0xe0304000,
+	0x785d0000, 0xe0304100,
+	0x785d0100, 0xe0304200,
+	0x785d0200, 0xe0304300,
+	0x785d0300, 0xbf8c3f70,
+	0x7e008500, 0x7e028501,
+	0x7e048502, 0x7e068503,
+	0x807c847c, 0x8078ff78,
+	0x00000400, 0xbf0a6f7c,
+	0xbf85ffee, 0xb96f1e06,
+	0x876fc16f, 0xbf84000e,
+	0x8f6f836f, 0x806f7c6f,
+	0xbefe03c1, 0xbeff0380,
 	0xe0304000, 0x785d0000,
-	0xe0304100, 0x785d0100,
-	0xe0304200, 0x785d0200,
-	0xe0304300, 0x785d0300,
 	0xbf8c3f70, 0x7e008500,
-	0x7e028501, 0x7e048502,
-	0x7e068503, 0x807c847c,
-	0x8078ff78, 0x00000400,
-	0xbf0a6f7c, 0xbf85ffee,
-	0xb96f1e06, 0x876fc16f,
-	0xbf84000e, 0x8f6f836f,
-	0x806f7c6f, 0xbefe03c1,
-	0xbeff0380, 0xe0304000,
-	0x785d0000, 0xbf8c3f70,
-	0x7e008500, 0x807c817c,
-	0x8078ff78, 0x00000080,
-	0xbf0a6f7c, 0xbf85fff7,
-	0xbeff03c1, 0xe0304000,
-	0x6e5d0000, 0xe0304100,
-	0x6e5d0100, 0xe0304200,
-	0x6e5d0200, 0xe0304300,
-	0x6e5d0300, 0xbf8c3f70,
+	0x807c817c, 0x8078ff78,
+	0x00000080, 0xbf0a6f7c,
+	0xbf85fff7, 0xbeff03c1,
+	0xe0304000, 0x6e5d0000,
+	0xe0304100, 0x6e5d0100,
+	0xe0304200, 0x6e5d0200,
+	0xe0304300, 0x6e5d0300,
+	0xbf8c3f70, 0xb9782a05,
+	0x80788178, 0xbf0d9972,
+	0xbf850002, 0x8f788978,
+	0xbf820001, 0x8f788a78,
+	0xb96e1e06, 0x8f6e8a6e,
+	0x80786e78, 0x8078ff78,
+	0x00000200, 0x80f8ff78,
+	0x00000050, 0xbef603ff,
+	0x01000000, 0xbefc03ff,
+	0x0000006c, 0x80f89078,
+	0xf429003a, 0xf0000000,
+	0xbf8cc07f, 0x80fc847c,
+	0xbf800000, 0xbe803100,
+	0xbe823102, 0x80f8a078,
+	0xf42d003a, 0xf0000000,
+	0xbf8cc07f, 0x80fc887c,
+	0xbf800000, 0xbe803100,
+	0xbe823102, 0xbe843104,
+	0xbe863106, 0x80f8c078,
+	0xf431003a, 0xf0000000,
+	0xbf8cc07f, 0x80fc907c,
+	0xbf800000, 0xbe803100,
+	0xbe823102, 0xbe843104,
+	0xbe863106, 0xbe883108,
+	0xbe8a310a, 0xbe8c310c,
+	0xbe8e310e, 0xbf06807c,
+	0xbf84fff0, 0xba80f801,
+	0x00000000, 0xbf8a0000,
 	0xb9782a05, 0x80788178,
 	0xbf0d9972, 0xbf850002,
 	0x8f788978, 0xbf820001,
 	0x8f788a78, 0xb96e1e06,
 	0x8f6e8a6e, 0x80786e78,
 	0x8078ff78, 0x00000200,
-	0x80f8ff78, 0x00000050,
 	0xbef603ff, 0x01000000,
-	0xbefc03ff, 0x0000006c,
-	0x80f89078, 0xf429003a,
-	0xf0000000, 0xbf8cc07f,
-	0x80fc847c, 0xbf800000,
-	0xbe803100, 0xbe823102,
-	0x80f8a078, 0xf42d003a,
-	0xf0000000, 0xbf8cc07f,
-	0x80fc887c, 0xbf800000,
-	0xbe803100, 0xbe823102,
-	0xbe843104, 0xbe863106,
-	0x80f8c078, 0xf431003a,
-	0xf0000000, 0xbf8cc07f,
-	0x80fc907c, 0xbf800000,
-	0xbe803100, 0xbe823102,
-	0xbe843104, 0xbe863106,
-	0xbe883108, 0xbe8a310a,
-	0xbe8c310c, 0xbe8e310e,
-	0xbf06807c, 0xbf84fff0,
-	0xba80f801, 0x00000000,
-	0xbf8a0000, 0xb9782a05,
-	0x80788178, 0xbf0d9972,
-	0xbf850002, 0x8f788978,
-	0xbf820001, 0x8f788a78,
-	0xb96e1e06, 0x8f6e8a6e,
-	0x80786e78, 0x8078ff78,
-	0x00000200, 0xbef603ff,
-	0x01000000, 0xf4211bfa,
+	0xf4211bfa, 0xf0000000,
+	0x80788478, 0xf4211b3a,
 	0xf0000000, 0x80788478,
-	0xf4211b3a, 0xf0000000,
-	0x80788478, 0xf4211b7a,
+	0xf4211b7a, 0xf0000000,
+	0x80788478, 0xf4211c3a,
 	0xf0000000, 0x80788478,
-	0xf4211c3a, 0xf0000000,
-	0x80788478, 0xf4211c7a,
+	0xf4211c7a, 0xf0000000,
+	0x80788478, 0xf4211eba,
 	0xf0000000, 0x80788478,
-	0xf4211eba, 0xf0000000,
-	0x80788478, 0xf4211efa,
+	0xf4211efa, 0xf0000000,
+	0x80788478, 0xf4211e7a,
 	0xf0000000, 0x80788478,
-	0xf4211e7a, 0xf0000000,
-	0x80788478, 0xf4211cfa,
+	0xf4211cfa, 0xf0000000,
+	0x80788478, 0xf4211bba,
 	0xf0000000, 0x80788478,
+	0xbf8cc07f, 0xb9eef814,
 	0xf4211bba, 0xf0000000,
 	0x80788478, 0xbf8cc07f,
-	0xb9eef814, 0xf4211bba,
-	0xf0000000, 0x80788478,
-	0xbf8cc07f, 0xb9eef815,
-	0xbefc036f, 0xbefe0370,
-	0xbeff0371, 0x876f7bff,
-	0x000003ff, 0xb9ef4803,
-	0x876f7bff, 0xfffff800,
-	0x906f8b6f, 0xb9efa2c3,
-	0xb9f3f801, 0xb96e2a05,
-	0x806e816e, 0xbf0d9972,
-	0xbf850002, 0x8f6e896e,
-	0xbf820001, 0x8f6e8a6e,
+	0xb9eef815, 0xbefc036f,
+	0xbefe0370, 0xbeff0371,
+	0x876f7bff, 0x000003ff,
+	0xb9ef4803, 0x876f7bff,
+	0xfffff800, 0x906f8b6f,
+	0xb9efa2c3, 0xb9f3f801,
+	0xb96e2a05, 0x806e816e,
+	0xbf0d9972, 0xbf850002,
+	0x8f6e896e, 0xbf820001,
+	0x8f6e8a6e, 0xb96f1e06,
+	0x8f6f8a6f, 0x806e6f6e,
 	0x806eff6e, 0x00000200,
 	0x806e746e, 0x826f8075,
 	0x876fff6f, 0x0000ffff,
diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm
index 5081f91190b8..0348191e8592 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm
@@ -35,10 +35,9 @@
 
 var SINGLE_STEP_MISSED_WORKAROUND		= 1	//workaround for lost MODE.DEBUG_EN exception when SAVECTX raised
 
-var SQ_WAVE_STATUS_INST_ATC_SHIFT		= 23
-var SQ_WAVE_STATUS_INST_ATC_MASK		= 0x00800000
 var SQ_WAVE_STATUS_SPI_PRIO_MASK		= 0x00000006
 var SQ_WAVE_STATUS_HALT_MASK			= 0x2000
+var SQ_WAVE_STATUS_ECC_ERR_MASK			= 0x20000
 
 var SQ_WAVE_LDS_ALLOC_LDS_SIZE_SHIFT		= 12
 var SQ_WAVE_LDS_ALLOC_LDS_SIZE_SIZE		= 9
@@ -52,8 +51,10 @@ var SQ_WAVE_IB_STS2_WAVE64_SHIFT		= 11
 var SQ_WAVE_IB_STS2_WAVE64_SIZE			= 1
 
 var SQ_WAVE_TRAPSTS_SAVECTX_MASK		= 0x400
-var SQ_WAVE_TRAPSTS_EXCE_MASK			= 0x1FF
+var SQ_WAVE_TRAPSTS_EXCP_MASK			= 0x1FF
 var SQ_WAVE_TRAPSTS_SAVECTX_SHIFT		= 10
+var SQ_WAVE_TRAPSTS_ADDR_WATCH_MASK		= 0x80
+var SQ_WAVE_TRAPSTS_ADDR_WATCH_SHIFT		= 7
 var SQ_WAVE_TRAPSTS_MEM_VIOL_MASK		= 0x100
 var SQ_WAVE_TRAPSTS_MEM_VIOL_SHIFT		= 8
 var SQ_WAVE_TRAPSTS_PRE_SAVECTX_MASK		= 0x3FF
@@ -63,46 +64,37 @@ var SQ_WAVE_TRAPSTS_POST_SAVECTX_MASK		= 0xFFFFF800
 var SQ_WAVE_TRAPSTS_POST_SAVECTX_SHIFT		= 11
 var SQ_WAVE_TRAPSTS_POST_SAVECTX_SIZE		= 21
 var SQ_WAVE_TRAPSTS_ILLEGAL_INST_MASK		= 0x800
+var SQ_WAVE_TRAPSTS_EXCP_HI_MASK		= 0x7000
+
+var SQ_WAVE_MODE_EXCP_EN_SHIFT			= 12
+var SQ_WAVE_MODE_EXCP_EN_ADDR_WATCH_SHIFT	= 19
 
-var SQ_WAVE_IB_STS_RCNT_SHIFT			= 16
 var SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT		= 15
 var SQ_WAVE_IB_STS_REPLAY_W64H_SHIFT		= 25
-var SQ_WAVE_IB_STS_REPLAY_W64H_SIZE		= 1
 var SQ_WAVE_IB_STS_REPLAY_W64H_MASK		= 0x02000000
-var SQ_WAVE_IB_STS_FIRST_REPLAY_SIZE		= 1
-var SQ_WAVE_IB_STS_RCNT_SIZE			= 6
 var SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK	= 0x003F8000
-var SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK_NEG	= 0x00007FFF
 
 var SQ_WAVE_MODE_DEBUG_EN_MASK			= 0x800
 
-var SQ_BUF_RSRC_WORD1_ATC_SHIFT			= 24
-var SQ_BUF_RSRC_WORD3_MTYPE_SHIFT		= 27
-
 // bits [31:24] unused by SPI debug data
 var TTMP11_SAVE_REPLAY_W64H_SHIFT		= 31
 var TTMP11_SAVE_REPLAY_W64H_MASK		= 0x80000000
 var TTMP11_SAVE_RCNT_FIRST_REPLAY_SHIFT		= 24
 var TTMP11_SAVE_RCNT_FIRST_REPLAY_MASK		= 0x7F000000
+var TTMP11_DEBUG_TRAP_ENABLED_SHIFT		= 23
+var TTMP11_DEBUG_TRAP_ENABLED_MASK		= 0x800000
 
 // SQ_SEL_X/Y/Z/W, BUF_NUM_FORMAT_FLOAT, (0 for MUBUF stride[17:14]
 // when ADD_TID_ENABLE and BUF_DATA_FORMAT_32 for MTBUF), ADD_TID_ENABLE
 var S_SAVE_BUF_RSRC_WORD1_STRIDE		= 0x00040000
 var S_SAVE_BUF_RSRC_WORD3_MISC			= 0x10807FAC
-
-var S_SAVE_SPI_INIT_ATC_MASK			= 0x08000000
-var S_SAVE_SPI_INIT_ATC_SHIFT			= 27
-var S_SAVE_SPI_INIT_MTYPE_MASK			= 0x70000000
-var S_SAVE_SPI_INIT_MTYPE_SHIFT			= 28
+var S_SAVE_PC_HI_TRAP_ID_MASK			= 0x00FF0000
+var S_SAVE_PC_HI_HT_MASK			= 0x01000000
 var S_SAVE_SPI_INIT_FIRST_WAVE_MASK		= 0x04000000
 var S_SAVE_SPI_INIT_FIRST_WAVE_SHIFT		= 26
 
-var S_SAVE_PC_HI_RCNT_SHIFT			= 26
-var S_SAVE_PC_HI_RCNT_MASK			= 0xFC000000
-var S_SAVE_PC_HI_FIRST_REPLAY_SHIFT		= 25
-var S_SAVE_PC_HI_FIRST_REPLAY_MASK		= 0x02000000
-var S_SAVE_PC_HI_REPLAY_W64H_SHIFT		= 24
-var S_SAVE_PC_HI_REPLAY_W64H_MASK		= 0x01000000
+var S_SAVE_PC_HI_FIRST_WAVE_MASK		= 0x80000000
+var S_SAVE_PC_HI_FIRST_WAVE_SHIFT		= 31
 
 var s_sgpr_save_num				= 108
 
@@ -130,19 +122,10 @@ var s_save_ttmps_hi				= s_save_trapsts
 var S_RESTORE_BUF_RSRC_WORD1_STRIDE		= S_SAVE_BUF_RSRC_WORD1_STRIDE
 var S_RESTORE_BUF_RSRC_WORD3_MISC		= S_SAVE_BUF_RSRC_WORD3_MISC
 
-var S_RESTORE_SPI_INIT_ATC_MASK			= 0x08000000
-var S_RESTORE_SPI_INIT_ATC_SHIFT		= 27
-var S_RESTORE_SPI_INIT_MTYPE_MASK		= 0x70000000
-var S_RESTORE_SPI_INIT_MTYPE_SHIFT		= 28
 var S_RESTORE_SPI_INIT_FIRST_WAVE_MASK		= 0x04000000
 var S_RESTORE_SPI_INIT_FIRST_WAVE_SHIFT		= 26
 var S_WAVE_SIZE					= 25
 
-var S_RESTORE_PC_HI_RCNT_SHIFT			= S_SAVE_PC_HI_RCNT_SHIFT
-var S_RESTORE_PC_HI_RCNT_MASK			= S_SAVE_PC_HI_RCNT_MASK
-var S_RESTORE_PC_HI_FIRST_REPLAY_SHIFT		= S_SAVE_PC_HI_FIRST_REPLAY_SHIFT
-var S_RESTORE_PC_HI_FIRST_REPLAY_MASK		= S_SAVE_PC_HI_FIRST_REPLAY_MASK
-
 var s_restore_spi_init_lo			= exec_lo
 var s_restore_spi_init_hi			= exec_hi
 var s_restore_mem_offset			= ttmp12
@@ -179,51 +162,77 @@ L_JUMP_TO_RESTORE:
 
 L_SKIP_RESTORE:
 	s_getreg_b32	s_save_status, hwreg(HW_REG_STATUS)			//save STATUS since we will change SCC
-	s_andn2_b32	s_save_status, s_save_status, SQ_WAVE_STATUS_SPI_PRIO_MASK
 
-if SINGLE_STEP_MISSED_WORKAROUND
-	// No single step exceptions if MODE.DEBUG_EN=0.
-	s_getreg_b32    ttmp2, hwreg(HW_REG_MODE)
-	s_and_b32       ttmp2, ttmp2, SQ_WAVE_MODE_DEBUG_EN_MASK
-	s_cbranch_scc0  L_NO_SINGLE_STEP_WORKAROUND
+	// Clear SPI_PRIO: do not save with elevated priority.
+	// Clear ECC_ERR: prevents SQC store and triggers FATAL_HALT if setreg'd.
+	s_andn2_b32	s_save_status, s_save_status, SQ_WAVE_STATUS_SPI_PRIO_MASK|SQ_WAVE_STATUS_ECC_ERR_MASK
+
+	s_getreg_b32	s_save_trapsts, hwreg(HW_REG_TRAPSTS)
 
-	// Second-level trap already handled exception if STATUS.HALT=1.
 	s_and_b32       ttmp2, s_save_status, SQ_WAVE_STATUS_HALT_MASK
+	s_cbranch_scc0	L_NOT_HALTED
+
+L_HALTED:
+	// Host trap may occur while wave is halted.
+	s_and_b32	ttmp2, s_save_pc_hi, S_SAVE_PC_HI_TRAP_ID_MASK
+	s_cbranch_scc1	L_FETCH_2ND_TRAP
 
+L_CHECK_SAVE:
+	s_and_b32	ttmp2, s_save_trapsts, SQ_WAVE_TRAPSTS_SAVECTX_MASK
+	s_cbranch_scc1	L_SAVE
+
+	// Wave is halted but neither host trap nor SAVECTX is raised.
+	// Caused by instruction fetch memory violation.
+	// Spin wait until context saved to prevent interrupt storm.
+	s_sleep		0x10
+	s_getreg_b32	s_save_trapsts, hwreg(HW_REG_TRAPSTS)
+	s_branch	L_CHECK_SAVE
+
+L_NOT_HALTED:
+	// Let second-level handle non-SAVECTX exception or trap.
+	// Any concurrent SAVECTX will be handled upon re-entry once halted.
+
+	// Check non-maskable exceptions. memory_violation, illegal_instruction
+	// and xnack_error exceptions always cause the wave to enter the trap
+	// handler.
+	s_and_b32	ttmp2, s_save_trapsts, SQ_WAVE_TRAPSTS_MEM_VIOL_MASK|SQ_WAVE_TRAPSTS_ILLEGAL_INST_MASK
+	s_cbranch_scc1	L_FETCH_2ND_TRAP
+
+	// Check for maskable exceptions in trapsts.excp and trapsts.excp_hi.
+	// Maskable exceptions only cause the wave to enter the trap handler if
+	// their respective bit in mode.excp_en is set.
+	s_and_b32	ttmp2, s_save_trapsts, SQ_WAVE_TRAPSTS_EXCP_MASK|SQ_WAVE_TRAPSTS_EXCP_HI_MASK
+	s_cbranch_scc0	L_CHECK_TRAP_ID
+
+	s_and_b32	ttmp3, s_save_trapsts, SQ_WAVE_TRAPSTS_ADDR_WATCH_MASK|SQ_WAVE_TRAPSTS_EXCP_HI_MASK
+	s_cbranch_scc0	L_NOT_ADDR_WATCH
+	s_bitset1_b32	ttmp2, SQ_WAVE_TRAPSTS_ADDR_WATCH_SHIFT // Check all addr_watch[123] exceptions against excp_en.addr_watch
+
+L_NOT_ADDR_WATCH:
+	s_getreg_b32	ttmp3, hwreg(HW_REG_MODE)
+	s_lshl_b32	ttmp2, ttmp2, SQ_WAVE_MODE_EXCP_EN_SHIFT
+	s_and_b32	ttmp2, ttmp2, ttmp3
+	s_cbranch_scc1	L_FETCH_2ND_TRAP
+
+L_CHECK_TRAP_ID:
+	// Check trap_id != 0
+	s_and_b32	ttmp2, s_save_pc_hi, S_SAVE_PC_HI_TRAP_ID_MASK
+	s_cbranch_scc1	L_FETCH_2ND_TRAP
+
+if SINGLE_STEP_MISSED_WORKAROUND
 	// Prioritize single step exception over context save.
 	// Second-level trap will halt wave and RFE, re-entering for SAVECTX.
-	s_cbranch_scc0  L_FETCH_2ND_TRAP
-
-L_NO_SINGLE_STEP_WORKAROUND:
+	s_getreg_b32	ttmp2, hwreg(HW_REG_MODE)
+	s_and_b32	ttmp2, ttmp2, SQ_WAVE_MODE_DEBUG_EN_MASK
+	s_cbranch_scc1	L_FETCH_2ND_TRAP
 end
 
-
-	s_getreg_b32	s_save_trapsts, hwreg(HW_REG_TRAPSTS)
-	s_and_b32	ttmp2, s_save_trapsts, SQ_WAVE_TRAPSTS_SAVECTX_MASK	//check whether this is for save
+	s_and_b32	ttmp2, s_save_trapsts, SQ_WAVE_TRAPSTS_SAVECTX_MASK
 	s_cbranch_scc1	L_SAVE
 
-	// If STATUS.MEM_VIOL is asserted then halt the wave to prevent
-	// the exception raising again and blocking context save.
-	s_and_b32	ttmp2, s_save_trapsts, SQ_WAVE_TRAPSTS_MEM_VIOL_MASK
-	s_cbranch_scc0	L_FETCH_2ND_TRAP
-	s_or_b32	s_save_status, s_save_status, SQ_WAVE_STATUS_HALT_MASK
-
 L_FETCH_2ND_TRAP:
-
 #if ASIC_TARGET_NAVI1X
-	// Preserve and clear scalar XNACK state before issuing scalar loads.
-	// Save IB_STS.REPLAY_W64H[25], RCNT[21:16], FIRST_REPLAY[15] into
-	// unused space ttmp11[31:24].
-	s_andn2_b32	ttmp11, ttmp11, (TTMP11_SAVE_REPLAY_W64H_MASK | TTMP11_SAVE_RCNT_FIRST_REPLAY_MASK)
-	s_getreg_b32	ttmp2, hwreg(HW_REG_IB_STS)
-	s_and_b32	ttmp3, ttmp2, SQ_WAVE_IB_STS_REPLAY_W64H_MASK
-	s_lshl_b32	ttmp3, ttmp3, (TTMP11_SAVE_REPLAY_W64H_SHIFT - SQ_WAVE_IB_STS_REPLAY_W64H_SHIFT)
-	s_or_b32	ttmp11, ttmp11, ttmp3
-	s_and_b32	ttmp3, ttmp2, SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK
-	s_lshl_b32	ttmp3, ttmp3, (TTMP11_SAVE_RCNT_FIRST_REPLAY_SHIFT - SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT)
-	s_or_b32	ttmp11, ttmp11, ttmp3
-	s_andn2_b32	ttmp2, ttmp2, (SQ_WAVE_IB_STS_REPLAY_W64H_MASK | SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK)
-	s_setreg_b32	hwreg(HW_REG_IB_STS), ttmp2
+	save_and_clear_ib_sts(ttmp14, ttmp15)
 #endif
 
 	// Read second-level TBA/TMA from first-level TMA and jump if available.
@@ -232,31 +241,49 @@ L_FETCH_2ND_TRAP:
 	s_getreg_b32	ttmp14, hwreg(HW_REG_SHADER_TMA_LO)
 	s_getreg_b32	ttmp15, hwreg(HW_REG_SHADER_TMA_HI)
 	s_lshl_b64	[ttmp14, ttmp15], [ttmp14, ttmp15], 0x8
+
+	s_load_dword    ttmp2, [ttmp14, ttmp15], 0x10 glc:1			// debug trap enabled flag
+	s_waitcnt       lgkmcnt(0)
+	s_lshl_b32      ttmp2, ttmp2, TTMP11_DEBUG_TRAP_ENABLED_SHIFT
+	s_andn2_b32     ttmp11, ttmp11, TTMP11_DEBUG_TRAP_ENABLED_MASK
+	s_or_b32        ttmp11, ttmp11, ttmp2
+
 	s_load_dwordx2	[ttmp2, ttmp3], [ttmp14, ttmp15], 0x0 glc:1		// second-level TBA
 	s_waitcnt	lgkmcnt(0)
 	s_load_dwordx2	[ttmp14, ttmp15], [ttmp14, ttmp15], 0x8 glc:1		// second-level TMA
 	s_waitcnt	lgkmcnt(0)
+
 	s_and_b64	[ttmp2, ttmp3], [ttmp2, ttmp3], [ttmp2, ttmp3]
 	s_cbranch_scc0	L_NO_NEXT_TRAP						// second-level trap handler not been set
 	s_setpc_b64	[ttmp2, ttmp3]						// jump to second-level trap handler
 
 L_NO_NEXT_TRAP:
-	s_getreg_b32	s_save_trapsts, hwreg(HW_REG_TRAPSTS)
-	s_and_b32	s_save_trapsts, s_save_trapsts, SQ_WAVE_TRAPSTS_EXCE_MASK
-	s_cbranch_scc1	L_EXCP_CASE						// Exception, jump back to the shader program directly.
-	s_add_u32	ttmp0, ttmp0, 4						// S_TRAP case, add 4 to ttmp0
-	s_addc_u32	ttmp1, ttmp1, 0
-L_EXCP_CASE:
+	// If not caused by trap then halt wave to prevent re-entry.
+	s_and_b32	ttmp2, s_save_pc_hi, (S_SAVE_PC_HI_TRAP_ID_MASK|S_SAVE_PC_HI_HT_MASK)
+	s_cbranch_scc1	L_TRAP_CASE
+	s_or_b32	s_save_status, s_save_status, SQ_WAVE_STATUS_HALT_MASK
+
+	// If the PC points to S_ENDPGM then context save will fail if STATUS.HALT is set.
+	// Rewind the PC to prevent this from occurring.
+	s_sub_u32	ttmp0, ttmp0, 0x8
+	s_subb_u32	ttmp1, ttmp1, 0x0
+
+	s_branch	L_EXIT_TRAP
+
+L_TRAP_CASE:
+	// Host trap will not cause trap re-entry.
+	s_and_b32	ttmp2, s_save_pc_hi, S_SAVE_PC_HI_HT_MASK
+	s_cbranch_scc1	L_EXIT_TRAP
+
+	// Advance past trap instruction to prevent re-entry.
+	s_add_u32	ttmp0, ttmp0, 0x4
+	s_addc_u32	ttmp1, ttmp1, 0x0
+
+L_EXIT_TRAP:
 	s_and_b32	ttmp1, ttmp1, 0xFFFF
 
 #if ASIC_TARGET_NAVI1X
-	// Restore SQ_WAVE_IB_STS.
-	s_lshr_b32	ttmp2, ttmp11, (TTMP11_SAVE_RCNT_FIRST_REPLAY_SHIFT - SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT)
-	s_and_b32	ttmp3, ttmp2, SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK
-	s_lshr_b32	ttmp2, ttmp11, (TTMP11_SAVE_REPLAY_W64H_SHIFT - SQ_WAVE_IB_STS_REPLAY_W64H_SHIFT)
-	s_and_b32	ttmp2, ttmp2, SQ_WAVE_IB_STS_REPLAY_W64H_MASK
-	s_or_b32	ttmp2, ttmp2, ttmp3
-	s_setreg_b32	hwreg(HW_REG_IB_STS), ttmp2
+	restore_ib_sts(ttmp14, ttmp15)
 #endif
 
 	// Restore SQ_WAVE_STATUS.
@@ -272,19 +299,7 @@ L_SAVE:
 	s_setreg_b32	hwreg(HW_REG_TRAPSTS, SQ_WAVE_TRAPSTS_SAVECTX_SHIFT, 1), s_save_tmp	//clear saveCtx bit
 
 #if ASIC_TARGET_NAVI1X
-	s_getreg_b32	s_save_tmp, hwreg(HW_REG_IB_STS, SQ_WAVE_IB_STS_RCNT_SHIFT, SQ_WAVE_IB_STS_RCNT_SIZE)
-	s_lshl_b32	s_save_tmp, s_save_tmp, S_SAVE_PC_HI_RCNT_SHIFT
-	s_or_b32	s_save_pc_hi, s_save_pc_hi, s_save_tmp
-	s_getreg_b32	s_save_tmp, hwreg(HW_REG_IB_STS, SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT, SQ_WAVE_IB_STS_FIRST_REPLAY_SIZE)
-	s_lshl_b32	s_save_tmp, s_save_tmp, S_SAVE_PC_HI_FIRST_REPLAY_SHIFT
-	s_or_b32	s_save_pc_hi, s_save_pc_hi, s_save_tmp
-	s_getreg_b32	s_save_tmp, hwreg(HW_REG_IB_STS, SQ_WAVE_IB_STS_REPLAY_W64H_SHIFT, SQ_WAVE_IB_STS_REPLAY_W64H_SIZE)
-	s_lshl_b32	s_save_tmp, s_save_tmp, S_SAVE_PC_HI_REPLAY_W64H_SHIFT
-	s_or_b32	s_save_pc_hi, s_save_pc_hi, s_save_tmp
-	s_getreg_b32	s_save_tmp, hwreg(HW_REG_IB_STS)			//clear RCNT and FIRST_REPLAY and REPLAY_W64H in IB_STS
-	s_and_b32	s_save_tmp, s_save_tmp, SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK_NEG
-
-	s_setreg_b32	hwreg(HW_REG_IB_STS), s_save_tmp
+	save_and_clear_ib_sts(s_save_tmp, s_save_trapsts)
 #endif
 
 	/* inform SPI the readiness and wait for SPI's go signal */
@@ -305,16 +320,57 @@ L_SLEEP:
 	s_waitcnt	lgkmcnt(0)
 #endif
 
+	// Save first_wave flag so we can clear high bits of save address.
+	s_and_b32	s_save_tmp, s_save_spi_init_hi, S_SAVE_SPI_INIT_FIRST_WAVE_MASK
+	s_lshl_b32	s_save_tmp, s_save_tmp, (S_SAVE_PC_HI_FIRST_WAVE_SHIFT - S_SAVE_SPI_INIT_FIRST_WAVE_SHIFT)
+	s_or_b32	s_save_pc_hi, s_save_pc_hi, s_save_tmp
+
+#if NO_SQC_STORE
+	// Trap temporaries must be saved via VGPR but all VGPRs are in use.
+	// There is no ttmp space to hold the resource constant for VGPR save.
+	// Save v0 by itself since it requires only two SGPRs.
+	s_mov_b32	s_save_ttmps_lo, exec_lo
+	s_and_b32	s_save_ttmps_hi, exec_hi, 0xFFFF
+	s_mov_b32	exec_lo, 0xFFFFFFFF
+	s_mov_b32	exec_hi, 0xFFFFFFFF
+	global_store_dword_addtid	v0, [s_save_ttmps_lo, s_save_ttmps_hi] slc:1 glc:1
+	v_mov_b32	v0, 0x0
+	s_mov_b32	exec_lo, s_save_ttmps_lo
+	s_mov_b32	exec_hi, s_save_ttmps_hi
+#endif
+
 	// Save trap temporaries 4-11, 13 initialized by SPI debug dispatch logic
-	// ttmp SR memory offset : size(VGPR)+size(SGPR)+0x40
+	// ttmp SR memory offset : size(VGPR)+size(SVGPR)+size(SGPR)+0x40
 	get_wave_size(s_save_ttmps_hi)
 	get_vgpr_size_bytes(s_save_ttmps_lo, s_save_ttmps_hi)
+	get_svgpr_size_bytes(s_save_ttmps_hi)
+	s_add_u32	s_save_ttmps_lo, s_save_ttmps_lo, s_save_ttmps_hi
 	s_and_b32	s_save_ttmps_hi, s_save_spi_init_hi, 0xFFFF
 	s_add_u32	s_save_ttmps_lo, s_save_ttmps_lo, get_sgpr_size_bytes()
 	s_add_u32	s_save_ttmps_lo, s_save_ttmps_lo, s_save_spi_init_lo
 	s_addc_u32	s_save_ttmps_hi, s_save_ttmps_hi, 0x0
 
-#if ASIC_TARGET_NAVI1X
+#if NO_SQC_STORE
+	v_writelane_b32	v0, ttmp4, 0x4
+	v_writelane_b32	v0, ttmp5, 0x5
+	v_writelane_b32	v0, ttmp6, 0x6
+	v_writelane_b32	v0, ttmp7, 0x7
+	v_writelane_b32	v0, ttmp8, 0x8
+	v_writelane_b32	v0, ttmp9, 0x9
+	v_writelane_b32	v0, ttmp10, 0xA
+	v_writelane_b32	v0, ttmp11, 0xB
+	v_writelane_b32	v0, ttmp13, 0xD
+	v_writelane_b32	v0, exec_lo, 0xE
+	v_writelane_b32	v0, exec_hi, 0xF
+
+	s_mov_b32	exec_lo, 0x3FFF
+	s_mov_b32	exec_hi, 0x0
+	global_store_dword_addtid	v0, [s_save_ttmps_lo, s_save_ttmps_hi] inst_offset:0x40 slc:1 glc:1
+	v_readlane_b32	ttmp14, v0, 0xE
+	v_readlane_b32	ttmp15, v0, 0xF
+	s_mov_b32	exec_lo, ttmp14
+	s_mov_b32	exec_hi, ttmp15
+#else
 	s_store_dwordx4	[ttmp4, ttmp5, ttmp6, ttmp7], [s_save_ttmps_lo, s_save_ttmps_hi], 0x50 glc:1
 	s_store_dwordx4	[ttmp8, ttmp9, ttmp10, ttmp11], [s_save_ttmps_lo, s_save_ttmps_hi], 0x60 glc:1
 	s_store_dword   ttmp13, [s_save_ttmps_lo, s_save_ttmps_hi], 0x74 glc:1
@@ -326,12 +382,6 @@ L_SLEEP:
 	s_or_b32	s_save_buf_rsrc1, s_save_buf_rsrc1, S_SAVE_BUF_RSRC_WORD1_STRIDE
 	s_mov_b32	s_save_buf_rsrc2, 0					//NUM_RECORDS initial value = 0 (in bytes) although not neccessarily inited
 	s_mov_b32	s_save_buf_rsrc3, S_SAVE_BUF_RSRC_WORD3_MISC
-	s_and_b32	s_save_tmp, s_save_spi_init_hi, S_SAVE_SPI_INIT_ATC_MASK
-	s_lshr_b32	s_save_tmp, s_save_tmp, (S_SAVE_SPI_INIT_ATC_SHIFT-SQ_BUF_RSRC_WORD1_ATC_SHIFT)
-	s_or_b32	s_save_buf_rsrc3, s_save_buf_rsrc3, s_save_tmp		//or ATC
-	s_and_b32	s_save_tmp, s_save_spi_init_hi, S_SAVE_SPI_INIT_MTYPE_MASK
-	s_lshr_b32	s_save_tmp, s_save_tmp, (S_SAVE_SPI_INIT_MTYPE_SHIFT-SQ_BUF_RSRC_WORD3_MTYPE_SHIFT)
-	s_or_b32	s_save_buf_rsrc3, s_save_buf_rsrc3, s_save_tmp		//or MTYPE
 
 	s_mov_b32	s_save_m0, m0
 
@@ -361,7 +411,9 @@ L_SAVE_4VGPR_WAVE32:
 
 	// VGPR Allocated in 4-GPR granularity
 
+#if !NO_SQC_STORE
 	buffer_store_dword	v0, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1
+#endif
 	buffer_store_dword	v1, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:128
 	buffer_store_dword	v2, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:128*2
 	buffer_store_dword	v3, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:128*3
@@ -372,7 +424,9 @@ L_SAVE_4VGPR_WAVE64:
 
 	// VGPR Allocated in 4-GPR granularity
 
+#if !NO_SQC_STORE
 	buffer_store_dword	v0, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1
+#endif
 	buffer_store_dword	v1, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:256
 	buffer_store_dword	v2, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:256*2
 	buffer_store_dword	v3, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:256*3
@@ -397,7 +451,8 @@ L_SAVE_HWREG:
 
 	write_hwreg_to_mem(s_save_m0, s_save_buf_rsrc0, s_save_mem_offset)
 	write_hwreg_to_mem(s_save_pc_lo, s_save_buf_rsrc0, s_save_mem_offset)
-	write_hwreg_to_mem(s_save_pc_hi, s_save_buf_rsrc0, s_save_mem_offset)
+	s_andn2_b32	s_save_tmp, s_save_pc_hi, S_SAVE_PC_HI_FIRST_WAVE_MASK
+	write_hwreg_to_mem(s_save_tmp, s_save_buf_rsrc0, s_save_mem_offset)
 	write_hwreg_to_mem(s_save_exec_lo, s_save_buf_rsrc0, s_save_mem_offset)
 	write_hwreg_to_mem(s_save_exec_hi, s_save_buf_rsrc0, s_save_mem_offset)
 	write_hwreg_to_mem(s_save_status, s_save_buf_rsrc0, s_save_mem_offset)
@@ -418,9 +473,13 @@ L_SAVE_HWREG:
 	write_hwreg_to_mem(s_save_m0, s_save_buf_rsrc0, s_save_mem_offset)
 
 #if NO_SQC_STORE
-	// Write HWREG/SGPRs with 32 VGPR lanes, wave32 is common case.
+	// Write HWREGs with 16 VGPR lanes. TTMPs occupy space after this.
+	s_mov_b32       exec_lo, 0xFFFF
 	s_mov_b32	exec_hi, 0x0
 	buffer_store_dword	v2, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1
+
+	// Write SGPRs with 32 VGPR lanes. This works in wave32 and wave64 mode.
+	s_mov_b32       exec_lo, 0xFFFFFFFF
 #endif
 
 	/* save SGPRs */
@@ -506,7 +565,7 @@ L_SAVE_LDS_NORMAL:
 	s_cbranch_scc0	L_SAVE_LDS_DONE						//no lds used? jump to L_SAVE_DONE
 
 	s_barrier								//LDS is used? wait for other waves in the same TG
-	s_and_b32	s_save_tmp, s_wave_size, S_SAVE_SPI_INIT_FIRST_WAVE_MASK
+	s_and_b32	s_save_tmp, s_save_pc_hi, S_SAVE_PC_HI_FIRST_WAVE_MASK
 	s_cbranch_scc0	L_SAVE_LDS_DONE
 
 	// first wave do LDS save;
@@ -628,7 +687,7 @@ L_SAVE_VGPR_WAVE64:
 	// VGPR store using dw burst
 	s_mov_b32	m0, 0x4							//VGPR initial index value =4
 	s_cmp_lt_u32	m0, s_save_alloc_size
-	s_cbranch_scc0	L_SAVE_VGPR_END
+	s_cbranch_scc0	L_SAVE_SHARED_VGPR
 
 L_SAVE_VGPR_W64_LOOP:
 	v_movrels_b32	v0, v0							//v0 = v[0+m0]
@@ -646,6 +705,7 @@ L_SAVE_VGPR_W64_LOOP:
 	s_cmp_lt_u32	m0, s_save_alloc_size					//scc = (m0 < s_save_alloc_size) ? 1 : 0
 	s_cbranch_scc1	L_SAVE_VGPR_W64_LOOP					//VGPR save is complete?
 
+L_SAVE_SHARED_VGPR:
 	//Below part will be the save shared vgpr part (new for gfx10)
 	s_getreg_b32	s_save_alloc_size, hwreg(HW_REG_LDS_ALLOC,SQ_WAVE_LDS_ALLOC_VGPR_SHARED_SIZE_SHIFT,SQ_WAVE_LDS_ALLOC_VGPR_SHARED_SIZE_SIZE)
 	s_and_b32	s_save_alloc_size, s_save_alloc_size, 0xFFFFFFFF	//shared_vgpr_size is zero?
@@ -674,12 +734,7 @@ L_RESTORE:
 	s_or_b32	s_restore_buf_rsrc1, s_restore_buf_rsrc1, S_RESTORE_BUF_RSRC_WORD1_STRIDE
 	s_mov_b32	s_restore_buf_rsrc2, 0					//NUM_RECORDS initial value = 0 (in bytes)
 	s_mov_b32	s_restore_buf_rsrc3, S_RESTORE_BUF_RSRC_WORD3_MISC
-	s_and_b32	s_restore_tmp, s_restore_spi_init_hi, S_RESTORE_SPI_INIT_ATC_MASK
-	s_lshr_b32	s_restore_tmp, s_restore_tmp, (S_RESTORE_SPI_INIT_ATC_SHIFT-SQ_BUF_RSRC_WORD1_ATC_SHIFT)
-	s_or_b32	s_restore_buf_rsrc3, s_restore_buf_rsrc3, s_restore_tmp	//or ATC
-	s_and_b32	s_restore_tmp, s_restore_spi_init_hi, S_RESTORE_SPI_INIT_MTYPE_MASK
-	s_lshr_b32	s_restore_tmp, s_restore_tmp, (S_RESTORE_SPI_INIT_MTYPE_SHIFT-SQ_BUF_RSRC_WORD3_MTYPE_SHIFT)
-	s_or_b32	s_restore_buf_rsrc3, s_restore_buf_rsrc3, s_restore_tmp	//or MTYPE
+
 	//determine it is wave32 or wave64
 	get_wave_size(s_restore_size)
 
@@ -765,6 +820,8 @@ L_RESTORE_VGPR_NORMAL:
 	s_mov_b32	s_restore_mem_offset_save, s_restore_mem_offset		// restore start with v1, v0 will be the last
 	s_add_u32	s_restore_mem_offset, s_restore_mem_offset, 128*4
 	s_mov_b32	m0, 4							//VGPR initial index value = 4
+	s_cmp_lt_u32	m0, s_restore_alloc_size
+	s_cbranch_scc0	L_RESTORE_SGPR
 
 L_RESTORE_VGPR_WAVE32_LOOP:
 	buffer_load_dword	v0, v0, s_restore_buf_rsrc0, s_restore_mem_offset slc:1 glc:1
@@ -786,6 +843,7 @@ L_RESTORE_VGPR_WAVE32_LOOP:
 	buffer_load_dword	v1, v0, s_restore_buf_rsrc0, s_restore_mem_offset_save slc:1 glc:1 offset:128
 	buffer_load_dword	v2, v0, s_restore_buf_rsrc0, s_restore_mem_offset_save slc:1 glc:1 offset:128*2
 	buffer_load_dword	v3, v0, s_restore_buf_rsrc0, s_restore_mem_offset_save slc:1 glc:1 offset:128*3
+	s_waitcnt	vmcnt(0)
 
 	s_branch	L_RESTORE_SGPR
 
@@ -796,6 +854,8 @@ L_RESTORE_VGPR_WAVE64:
 	s_mov_b32	s_restore_mem_offset_save, s_restore_mem_offset		// restore start with v4, v0 will be the last
 	s_add_u32	s_restore_mem_offset, s_restore_mem_offset, 256*4
 	s_mov_b32	m0, 4							//VGPR initial index value = 4
+	s_cmp_lt_u32	m0, s_restore_alloc_size
+	s_cbranch_scc0	L_RESTORE_SHARED_VGPR
 
 L_RESTORE_VGPR_WAVE64_LOOP:
 	buffer_load_dword	v0, v0, s_restore_buf_rsrc0, s_restore_mem_offset slc:1 glc:1
@@ -812,6 +872,7 @@ L_RESTORE_VGPR_WAVE64_LOOP:
 	s_cmp_lt_u32	m0, s_restore_alloc_size				//scc = (m0 < s_restore_alloc_size) ? 1 : 0
 	s_cbranch_scc1	L_RESTORE_VGPR_WAVE64_LOOP				//VGPR restore (except v0) is complete?
 
+L_RESTORE_SHARED_VGPR:
 	//Below part will be the restore shared vgpr part (new for gfx10)
 	s_getreg_b32	s_restore_alloc_size, hwreg(HW_REG_LDS_ALLOC,SQ_WAVE_LDS_ALLOC_VGPR_SHARED_SIZE_SHIFT,SQ_WAVE_LDS_ALLOC_VGPR_SHARED_SIZE_SIZE)	//shared_vgpr_size
 	s_and_b32	s_restore_alloc_size, s_restore_alloc_size, 0xFFFFFFFF	//shared_vgpr_size is zero?
@@ -945,8 +1006,10 @@ L_RESTORE_HWREG:
 	s_setreg_b32	hwreg(HW_REG_MODE), s_restore_mode
 
 	// Restore trap temporaries 4-11, 13 initialized by SPI debug dispatch logic
-	// ttmp SR memory offset : size(VGPR)+size(SGPR)+0x40
+	// ttmp SR memory offset : size(VGPR)+size(SVGPR)+size(SGPR)+0x40
 	get_vgpr_size_bytes(s_restore_ttmps_lo, s_restore_size)
+	get_svgpr_size_bytes(s_restore_ttmps_hi)
+	s_add_u32	s_restore_ttmps_lo, s_restore_ttmps_lo, s_restore_ttmps_hi
 	s_add_u32	s_restore_ttmps_lo, s_restore_ttmps_lo, get_sgpr_size_bytes()
 	s_add_u32	s_restore_ttmps_lo, s_restore_ttmps_lo, s_restore_buf_rsrc0
 	s_addc_u32	s_restore_ttmps_hi, s_restore_buf_rsrc1, 0x0
@@ -957,23 +1020,7 @@ L_RESTORE_HWREG:
 	s_waitcnt	lgkmcnt(0)
 
 #if ASIC_TARGET_NAVI1X
-	s_and_b32	s_restore_m0, s_restore_pc_hi, S_SAVE_PC_HI_RCNT_MASK
-	s_lshr_b32	s_restore_m0, s_restore_m0, S_SAVE_PC_HI_RCNT_SHIFT
-	s_lshl_b32	s_restore_m0, s_restore_m0, SQ_WAVE_IB_STS_RCNT_SHIFT
-	s_mov_b32	s_restore_tmp, 0x0
-	s_or_b32	s_restore_tmp, s_restore_tmp, s_restore_m0
-	s_and_b32	s_restore_m0, s_restore_pc_hi, S_SAVE_PC_HI_FIRST_REPLAY_MASK
-	s_lshr_b32	s_restore_m0, s_restore_m0, S_SAVE_PC_HI_FIRST_REPLAY_SHIFT
-	s_lshl_b32	s_restore_m0, s_restore_m0, SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT
-	s_or_b32	s_restore_tmp, s_restore_tmp, s_restore_m0
-	s_and_b32	s_restore_m0, s_restore_pc_hi, S_SAVE_PC_HI_REPLAY_W64H_MASK
-	s_lshr_b32	s_restore_m0, s_restore_m0, S_SAVE_PC_HI_REPLAY_W64H_SHIFT
-	s_lshl_b32	s_restore_m0, s_restore_m0, SQ_WAVE_IB_STS_REPLAY_W64H_SHIFT
-	s_or_b32	s_restore_tmp, s_restore_tmp, s_restore_m0
-
-	s_and_b32	s_restore_m0, s_restore_status, SQ_WAVE_STATUS_INST_ATC_MASK
-	s_lshr_b32	s_restore_m0, s_restore_m0, SQ_WAVE_STATUS_INST_ATC_SHIFT
-	s_setreg_b32 	hwreg(HW_REG_IB_STS), s_restore_tmp
+	restore_ib_sts(s_restore_tmp, s_restore_m0)
 #endif
 
 	s_and_b32	s_restore_pc_hi, s_restore_pc_hi, 0x0000ffff		//pc[47:32] //Do it here in order not to affect STATUS
@@ -1089,5 +1136,29 @@ end
 function get_wave_size(s_reg)
 	s_getreg_b32	s_reg, hwreg(HW_REG_IB_STS2,SQ_WAVE_IB_STS2_WAVE64_SHIFT,SQ_WAVE_IB_STS2_WAVE64_SIZE)
 	s_lshl_b32	s_reg, s_reg, S_WAVE_SIZE
-	s_or_b32	s_reg, s_save_spi_init_hi, s_reg			//share with exec_hi, it's at bit25
+end
+
+function save_and_clear_ib_sts(tmp1, tmp2)
+	// Preserve and clear scalar XNACK state before issuing scalar loads.
+	// Save IB_STS.REPLAY_W64H[25], RCNT[21:16], FIRST_REPLAY[15] into
+	// unused space ttmp11[31:24].
+	s_andn2_b32	ttmp11, ttmp11, (TTMP11_SAVE_REPLAY_W64H_MASK | TTMP11_SAVE_RCNT_FIRST_REPLAY_MASK)
+	s_getreg_b32	tmp1, hwreg(HW_REG_IB_STS)
+	s_and_b32	tmp2, tmp1, SQ_WAVE_IB_STS_REPLAY_W64H_MASK
+	s_lshl_b32	tmp2, tmp2, (TTMP11_SAVE_REPLAY_W64H_SHIFT - SQ_WAVE_IB_STS_REPLAY_W64H_SHIFT)
+	s_or_b32	ttmp11, ttmp11, tmp2
+	s_and_b32	tmp2, tmp1, SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK
+	s_lshl_b32	tmp2, tmp2, (TTMP11_SAVE_RCNT_FIRST_REPLAY_SHIFT - SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT)
+	s_or_b32	ttmp11, ttmp11, tmp2
+	s_andn2_b32	tmp1, tmp1, (SQ_WAVE_IB_STS_REPLAY_W64H_MASK | SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK)
+	s_setreg_b32	hwreg(HW_REG_IB_STS), tmp1
+end
+
+function restore_ib_sts(tmp1, tmp2)
+	s_lshr_b32	tmp1, ttmp11, (TTMP11_SAVE_RCNT_FIRST_REPLAY_SHIFT - SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT)
+	s_and_b32	tmp2, tmp1, SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK
+	s_lshr_b32	tmp1, ttmp11, (TTMP11_SAVE_REPLAY_W64H_SHIFT - SQ_WAVE_IB_STS_REPLAY_W64H_SHIFT)
+	s_and_b32	tmp1, tmp1, SQ_WAVE_IB_STS_REPLAY_W64H_MASK
+	s_or_b32	tmp1, tmp1, tmp2
+	s_setreg_b32	hwreg(HW_REG_IB_STS), tmp1
 end
diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm
index eed78a04e7c7..6770cbe3250a 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm
@@ -46,8 +46,6 @@ var SINGLE_STEP_MISSED_WORKAROUND   =	1		    //workaround for lost MODE.DEBUG_EN
 /**************************************************************************/
 /*			variables					  */
 /**************************************************************************/
-var SQ_WAVE_STATUS_INST_ATC_SHIFT  = 23
-var SQ_WAVE_STATUS_INST_ATC_MASK   = 0x00800000
 var SQ_WAVE_STATUS_SPI_PRIO_SHIFT  = 1
 var SQ_WAVE_STATUS_SPI_PRIO_MASK   = 0x00000006
 var SQ_WAVE_STATUS_HALT_MASK       = 0x2000
@@ -56,6 +54,7 @@ var SQ_WAVE_STATUS_PRE_SPI_PRIO_SIZE    = 1
 var SQ_WAVE_STATUS_POST_SPI_PRIO_SHIFT  = 3
 var SQ_WAVE_STATUS_POST_SPI_PRIO_SIZE   = 29
 var SQ_WAVE_STATUS_ALLOW_REPLAY_MASK    = 0x400000
+var SQ_WAVE_STATUS_ECC_ERR_MASK         = 0x20000
 
 var SQ_WAVE_LDS_ALLOC_LDS_SIZE_SHIFT	= 12
 var SQ_WAVE_LDS_ALLOC_LDS_SIZE_SIZE	= 9
@@ -72,8 +71,10 @@ var SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT	= 8
 #endif
 
 var SQ_WAVE_TRAPSTS_SAVECTX_MASK    =	0x400
-var SQ_WAVE_TRAPSTS_EXCE_MASK	    =	0x1FF			// Exception mask
+var SQ_WAVE_TRAPSTS_EXCP_MASK	    =	0x1FF
 var SQ_WAVE_TRAPSTS_SAVECTX_SHIFT   =	10
+var SQ_WAVE_TRAPSTS_ADDR_WATCH_MASK =	0x80
+var SQ_WAVE_TRAPSTS_ADDR_WATCH_SHIFT =	7
 var SQ_WAVE_TRAPSTS_MEM_VIOL_MASK   =	0x100
 var SQ_WAVE_TRAPSTS_MEM_VIOL_SHIFT  =	8
 var SQ_WAVE_TRAPSTS_PRE_SAVECTX_MASK	=   0x3FF
@@ -83,37 +84,30 @@ var SQ_WAVE_TRAPSTS_POST_SAVECTX_MASK	=   0xFFFFF800
 var SQ_WAVE_TRAPSTS_POST_SAVECTX_SHIFT	=   11
 var SQ_WAVE_TRAPSTS_POST_SAVECTX_SIZE	=   21
 var SQ_WAVE_TRAPSTS_ILLEGAL_INST_MASK	=   0x800
+var SQ_WAVE_TRAPSTS_EXCP_HI_MASK	=   0x7000
 var SQ_WAVE_TRAPSTS_XNACK_ERROR_MASK	=   0x10000000
 
-var SQ_WAVE_IB_STS_RCNT_SHIFT		=   16			//FIXME
+var SQ_WAVE_MODE_EXCP_EN_SHIFT		=   12
+var SQ_WAVE_MODE_EXCP_EN_ADDR_WATCH_SHIFT	= 19
+
 var SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT	=   15			//FIXME
 var SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK	= 0x1F8000
-var SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK_NEG	= 0x00007FFF	//FIXME
 
 var SQ_WAVE_MODE_DEBUG_EN_MASK		=   0x800
 
-var SQ_BUF_RSRC_WORD1_ATC_SHIFT	    =	24
-var SQ_BUF_RSRC_WORD3_MTYPE_SHIFT   =	27
-
 var TTMP11_SAVE_RCNT_FIRST_REPLAY_SHIFT	=   26			// bits [31:26] unused by SPI debug data
 var TTMP11_SAVE_RCNT_FIRST_REPLAY_MASK	=   0xFC000000
+var TTMP11_DEBUG_TRAP_ENABLED_SHIFT	=   23
+var TTMP11_DEBUG_TRAP_ENABLED_MASK	=   0x800000
 
 /*	Save	    */
 var S_SAVE_BUF_RSRC_WORD1_STRIDE	=   0x00040000		//stride is 4 bytes
 var S_SAVE_BUF_RSRC_WORD3_MISC		=   0x00807FAC		//SQ_SEL_X/Y/Z/W, BUF_NUM_FORMAT_FLOAT, (0 for MUBUF stride[17:14] when ADD_TID_ENABLE and BUF_DATA_FORMAT_32 for MTBUF), ADD_TID_ENABLE
-
-var S_SAVE_SPI_INIT_ATC_MASK		=   0x08000000		//bit[27]: ATC bit
-var S_SAVE_SPI_INIT_ATC_SHIFT		=   27
-var S_SAVE_SPI_INIT_MTYPE_MASK		=   0x70000000		//bit[30:28]: Mtype
-var S_SAVE_SPI_INIT_MTYPE_SHIFT		=   28
+var S_SAVE_PC_HI_TRAP_ID_MASK		=   0x00FF0000
+var S_SAVE_PC_HI_HT_MASK		=   0x01000000
 var S_SAVE_SPI_INIT_FIRST_WAVE_MASK	=   0x04000000		//bit[26]: FirstWaveInTG
 var S_SAVE_SPI_INIT_FIRST_WAVE_SHIFT	=   26
 
-var S_SAVE_PC_HI_RCNT_SHIFT		=   27			//FIXME	 check with Brian to ensure all fields other than PC[47:0] can be used
-var S_SAVE_PC_HI_RCNT_MASK		=   0xF8000000		//FIXME
-var S_SAVE_PC_HI_FIRST_REPLAY_SHIFT	=   26			//FIXME
-var S_SAVE_PC_HI_FIRST_REPLAY_MASK	=   0x04000000		//FIXME
-
 var s_save_spi_init_lo		    =	exec_lo
 var s_save_spi_init_hi		    =	exec_hi
 
@@ -140,18 +134,9 @@ var s_save_ttmps_hi	    =	s_save_trapsts		//no conflict
 var S_RESTORE_BUF_RSRC_WORD1_STRIDE	    =	S_SAVE_BUF_RSRC_WORD1_STRIDE
 var S_RESTORE_BUF_RSRC_WORD3_MISC	    =	S_SAVE_BUF_RSRC_WORD3_MISC
 
-var S_RESTORE_SPI_INIT_ATC_MASK		    =	0x08000000	    //bit[27]: ATC bit
-var S_RESTORE_SPI_INIT_ATC_SHIFT	    =	27
-var S_RESTORE_SPI_INIT_MTYPE_MASK	    =	0x70000000	    //bit[30:28]: Mtype
-var S_RESTORE_SPI_INIT_MTYPE_SHIFT	    =	28
 var S_RESTORE_SPI_INIT_FIRST_WAVE_MASK	    =	0x04000000	    //bit[26]: FirstWaveInTG
 var S_RESTORE_SPI_INIT_FIRST_WAVE_SHIFT	    =	26
 
-var S_RESTORE_PC_HI_RCNT_SHIFT		    =	S_SAVE_PC_HI_RCNT_SHIFT
-var S_RESTORE_PC_HI_RCNT_MASK		    =	S_SAVE_PC_HI_RCNT_MASK
-var S_RESTORE_PC_HI_FIRST_REPLAY_SHIFT	    =	S_SAVE_PC_HI_FIRST_REPLAY_SHIFT
-var S_RESTORE_PC_HI_FIRST_REPLAY_MASK	    =	S_SAVE_PC_HI_FIRST_REPLAY_MASK
-
 var s_restore_spi_init_lo		    =	exec_lo
 var s_restore_spi_init_hi		    =	exec_hi
 
@@ -199,71 +184,77 @@ L_JUMP_TO_RESTORE:
 L_SKIP_RESTORE:
 
     s_getreg_b32    s_save_status, hwreg(HW_REG_STATUS)				    //save STATUS since we will change SCC
-    s_andn2_b32	    s_save_status, s_save_status, SQ_WAVE_STATUS_SPI_PRIO_MASK	    //check whether this is for save
 
-if SINGLE_STEP_MISSED_WORKAROUND
-    // No single step exceptions if MODE.DEBUG_EN=0.
-    s_getreg_b32    ttmp2, hwreg(HW_REG_MODE)
-    s_and_b32       ttmp2, ttmp2, SQ_WAVE_MODE_DEBUG_EN_MASK
-    s_cbranch_scc0  L_NO_SINGLE_STEP_WORKAROUND
+    // Clear SPI_PRIO: do not save with elevated priority.
+    // Clear ECC_ERR: prevents SQC store and triggers FATAL_HALT if setreg'd.
+    s_andn2_b32     s_save_status, s_save_status, SQ_WAVE_STATUS_SPI_PRIO_MASK|SQ_WAVE_STATUS_ECC_ERR_MASK
 
-    // Second-level trap already handled exception if STATUS.HALT=1.
-    s_and_b32       ttmp2, s_save_status, SQ_WAVE_STATUS_HALT_MASK
+    s_getreg_b32    s_save_trapsts, hwreg(HW_REG_TRAPSTS)
 
-    // Prioritize single step exception over context save.
-    // Second-level trap will halt wave and RFE, re-entering for SAVECTX.
-    s_cbranch_scc0  L_FETCH_2ND_TRAP
+    s_and_b32       ttmp2, s_save_status, SQ_WAVE_STATUS_HALT_MASK
+    s_cbranch_scc0  L_NOT_HALTED
 
-L_NO_SINGLE_STEP_WORKAROUND:
-end
+L_HALTED:
+    // Host trap may occur while wave is halted.
+    s_and_b32       ttmp2, s_save_pc_hi, S_SAVE_PC_HI_TRAP_ID_MASK
+    s_cbranch_scc1  L_FETCH_2ND_TRAP
 
-    s_getreg_b32    s_save_trapsts, hwreg(HW_REG_TRAPSTS)
+L_CHECK_SAVE:
     s_and_b32       ttmp2, s_save_trapsts, SQ_WAVE_TRAPSTS_SAVECTX_MASK    //check whether this is for save
     s_cbranch_scc1  L_SAVE					//this is the operation for save
 
-    // *********    Handle non-CWSR traps	*******************
-
-    // Illegal instruction is a non-maskable exception which blocks context save.
-    // Halt the wavefront and return from the trap.
-    s_and_b32       ttmp2, s_save_trapsts, SQ_WAVE_TRAPSTS_ILLEGAL_INST_MASK
-    s_cbranch_scc1  L_HALT_WAVE
-
-    // If STATUS.MEM_VIOL is asserted then we cannot fetch from the TMA.
-    // Instead, halt the wavefront and return from the trap.
-    s_and_b32       ttmp2, s_save_trapsts, SQ_WAVE_TRAPSTS_MEM_VIOL_MASK
-    s_cbranch_scc0  L_FETCH_2ND_TRAP
-
-L_HALT_WAVE:
-    // If STATUS.HALT is set then this fault must come from SQC instruction fetch.
-    // We cannot prevent further faults. Spin wait until context saved.
-    s_and_b32       ttmp2, s_save_status, SQ_WAVE_STATUS_HALT_MASK
-    s_cbranch_scc0  L_NOT_ALREADY_HALTED
-
-L_WAIT_CTX_SAVE:
+    // Wave is halted but neither host trap nor SAVECTX is raised.
+    // Caused by instruction fetch memory violation.
+    // Spin wait until context saved to prevent interrupt storm.
     s_sleep         0x10
-    s_getreg_b32    ttmp2, hwreg(HW_REG_TRAPSTS)
-    s_and_b32       ttmp2, ttmp2, SQ_WAVE_TRAPSTS_SAVECTX_MASK
-    s_cbranch_scc0  L_WAIT_CTX_SAVE
+    s_getreg_b32    s_save_trapsts, hwreg(HW_REG_TRAPSTS)
+    s_branch        L_CHECK_SAVE
+
+L_NOT_HALTED:
+    // Let second-level handle non-SAVECTX exception or trap.
+    // Any concurrent SAVECTX will be handled upon re-entry once halted.
+
+    // Check non-maskable exceptions. memory_violation, illegal_instruction
+    // and xnack_error exceptions always cause the wave to enter the trap
+    // handler.
+    s_and_b32       ttmp2, s_save_trapsts, SQ_WAVE_TRAPSTS_MEM_VIOL_MASK|SQ_WAVE_TRAPSTS_ILLEGAL_INST_MASK
+    s_cbranch_scc1  L_FETCH_2ND_TRAP
+
+    // Check for maskable exceptions in trapsts.excp and trapsts.excp_hi.
+    // Maskable exceptions only cause the wave to enter the trap handler if
+    // their respective bit in mode.excp_en is set.
+    s_and_b32       ttmp2, s_save_trapsts, SQ_WAVE_TRAPSTS_EXCP_MASK|SQ_WAVE_TRAPSTS_EXCP_HI_MASK
+    s_cbranch_scc0  L_CHECK_TRAP_ID
+
+    s_and_b32       ttmp3, s_save_trapsts, SQ_WAVE_TRAPSTS_ADDR_WATCH_MASK|SQ_WAVE_TRAPSTS_EXCP_HI_MASK
+    s_cbranch_scc0  L_NOT_ADDR_WATCH
+    s_bitset1_b32   ttmp2, SQ_WAVE_TRAPSTS_ADDR_WATCH_SHIFT // Check all addr_watch[123] exceptions against excp_en.addr_watch
+
+L_NOT_ADDR_WATCH:
+    s_getreg_b32    ttmp3, hwreg(HW_REG_MODE)
+    s_lshl_b32      ttmp2, ttmp2, SQ_WAVE_MODE_EXCP_EN_SHIFT
+    s_and_b32       ttmp2, ttmp2, ttmp3
+    s_cbranch_scc1  L_FETCH_2ND_TRAP
+
+L_CHECK_TRAP_ID:
+    // Check trap_id != 0
+    s_and_b32       ttmp2, s_save_pc_hi, S_SAVE_PC_HI_TRAP_ID_MASK
+    s_cbranch_scc1  L_FETCH_2ND_TRAP
 
-L_NOT_ALREADY_HALTED:
-    s_or_b32        s_save_status, s_save_status, SQ_WAVE_STATUS_HALT_MASK
+if SINGLE_STEP_MISSED_WORKAROUND
+    // Prioritize single step exception over context save.
+    // Second-level trap will halt wave and RFE, re-entering for SAVECTX.
+    s_getreg_b32    ttmp2, hwreg(HW_REG_MODE)
+    s_and_b32       ttmp2, ttmp2, SQ_WAVE_MODE_DEBUG_EN_MASK
+    s_cbranch_scc1  L_FETCH_2ND_TRAP
+end
 
-    // If the PC points to S_ENDPGM then context save will fail if STATUS.HALT is set.
-    // Rewind the PC to prevent this from occurring. The debugger compensates for this.
-    s_sub_u32       ttmp0, ttmp0, 0x8
-    s_subb_u32      ttmp1, ttmp1, 0x0
+    s_and_b32       ttmp2, s_save_trapsts, SQ_WAVE_TRAPSTS_SAVECTX_MASK
+    s_cbranch_scc1  L_SAVE
 
 L_FETCH_2ND_TRAP:
     // Preserve and clear scalar XNACK state before issuing scalar reads.
-    // Save IB_STS.FIRST_REPLAY[15] and IB_STS.RCNT[20:16] into unused space ttmp11[31:26].
-    s_getreg_b32    ttmp2, hwreg(HW_REG_IB_STS)
-    s_and_b32       ttmp3, ttmp2, SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK
-    s_lshl_b32      ttmp3, ttmp3, (TTMP11_SAVE_RCNT_FIRST_REPLAY_SHIFT - SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT)
-    s_andn2_b32     ttmp11, ttmp11, TTMP11_SAVE_RCNT_FIRST_REPLAY_MASK
-    s_or_b32        ttmp11, ttmp11, ttmp3
-
-    s_andn2_b32     ttmp2, ttmp2, SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK
-    s_setreg_b32    hwreg(HW_REG_IB_STS), ttmp2
+    save_and_clear_ib_sts(ttmp14)
 
     // Read second-level TBA/TMA from first-level TMA and jump if available.
     // ttmp[2:5] and ttmp12 can be used (others hold SPI-initialized debug data)
@@ -271,27 +262,48 @@ L_FETCH_2ND_TRAP:
     s_getreg_b32    ttmp14, hwreg(HW_REG_SQ_SHADER_TMA_LO)
     s_getreg_b32    ttmp15, hwreg(HW_REG_SQ_SHADER_TMA_HI)
     s_lshl_b64      [ttmp14, ttmp15], [ttmp14, ttmp15], 0x8
+
+    s_load_dword    ttmp2, [ttmp14, ttmp15], 0x10 glc:1 // debug trap enabled flag
+    s_waitcnt       lgkmcnt(0)
+    s_lshl_b32      ttmp2, ttmp2, TTMP11_DEBUG_TRAP_ENABLED_SHIFT
+    s_andn2_b32     ttmp11, ttmp11, TTMP11_DEBUG_TRAP_ENABLED_MASK
+    s_or_b32        ttmp11, ttmp11, ttmp2
+
     s_load_dwordx2  [ttmp2, ttmp3], [ttmp14, ttmp15], 0x0 glc:1 // second-level TBA
     s_waitcnt       lgkmcnt(0)
     s_load_dwordx2  [ttmp14, ttmp15], [ttmp14, ttmp15], 0x8 glc:1 // second-level TMA
     s_waitcnt       lgkmcnt(0)
+
     s_and_b64       [ttmp2, ttmp3], [ttmp2, ttmp3], [ttmp2, ttmp3]
     s_cbranch_scc0  L_NO_NEXT_TRAP // second-level trap handler not been set
     s_setpc_b64     [ttmp2, ttmp3] // jump to second-level trap handler
 
 L_NO_NEXT_TRAP:
-    s_getreg_b32    s_save_trapsts, hwreg(HW_REG_TRAPSTS)
-    s_and_b32	    s_save_trapsts, s_save_trapsts, SQ_WAVE_TRAPSTS_EXCE_MASK // Check whether it is an exception
-    s_cbranch_scc1  L_EXCP_CASE	  // Exception, jump back to the shader program directly.
-    s_add_u32	    ttmp0, ttmp0, 4   // S_TRAP case, add 4 to ttmp0
-    s_addc_u32	ttmp1, ttmp1, 0
-L_EXCP_CASE:
+    // If not caused by trap then halt wave to prevent re-entry.
+    s_and_b32       ttmp2, s_save_pc_hi, (S_SAVE_PC_HI_TRAP_ID_MASK|S_SAVE_PC_HI_HT_MASK)
+    s_cbranch_scc1  L_TRAP_CASE
+    s_or_b32        s_save_status, s_save_status, SQ_WAVE_STATUS_HALT_MASK
+
+    // If the PC points to S_ENDPGM then context save will fail if STATUS.HALT is set.
+    // Rewind the PC to prevent this from occurring.
+    s_sub_u32       ttmp0, ttmp0, 0x8
+    s_subb_u32      ttmp1, ttmp1, 0x0
+
+    s_branch        L_EXIT_TRAP
+
+L_TRAP_CASE:
+    // Host trap will not cause trap re-entry.
+    s_and_b32       ttmp2, s_save_pc_hi, S_SAVE_PC_HI_HT_MASK
+    s_cbranch_scc1  L_EXIT_TRAP
+
+    // Advance past trap instruction to prevent re-entry.
+    s_add_u32       ttmp0, ttmp0, 0x4
+    s_addc_u32      ttmp1, ttmp1, 0x0
+
+L_EXIT_TRAP:
     s_and_b32	ttmp1, ttmp1, 0xFFFF
 
-    // Restore SQ_WAVE_IB_STS.
-    s_lshr_b32      ttmp2, ttmp11, (TTMP11_SAVE_RCNT_FIRST_REPLAY_SHIFT - SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT)
-    s_and_b32       ttmp2, ttmp2, SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK
-    s_setreg_b32    hwreg(HW_REG_IB_STS), ttmp2
+    restore_ib_sts(ttmp14)
 
     // Restore SQ_WAVE_STATUS.
     s_and_b64       exec, exec, exec // Restore STATUS.EXECZ, not writable by s_setreg_b32
@@ -312,16 +324,7 @@ L_SAVE:
     s_mov_b32	    s_save_tmp, 0							    //clear saveCtx bit
     s_setreg_b32    hwreg(HW_REG_TRAPSTS, SQ_WAVE_TRAPSTS_SAVECTX_SHIFT, 1), s_save_tmp	    //clear saveCtx bit
 
-    s_getreg_b32    s_save_tmp, hwreg(HW_REG_IB_STS, SQ_WAVE_IB_STS_RCNT_SHIFT, SQ_WAVE_IB_STS_RCNT_SIZE)		    //save RCNT
-    s_lshl_b32	    s_save_tmp, s_save_tmp, S_SAVE_PC_HI_RCNT_SHIFT
-    s_or_b32	    s_save_pc_hi, s_save_pc_hi, s_save_tmp
-    s_getreg_b32    s_save_tmp, hwreg(HW_REG_IB_STS, SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT, SQ_WAVE_IB_STS_FIRST_REPLAY_SIZE)   //save FIRST_REPLAY
-    s_lshl_b32	    s_save_tmp, s_save_tmp, S_SAVE_PC_HI_FIRST_REPLAY_SHIFT
-    s_or_b32	    s_save_pc_hi, s_save_pc_hi, s_save_tmp
-    s_getreg_b32    s_save_tmp, hwreg(HW_REG_IB_STS)					    //clear RCNT and FIRST_REPLAY in IB_STS
-    s_and_b32	    s_save_tmp, s_save_tmp, SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK_NEG
-
-    s_setreg_b32    hwreg(HW_REG_IB_STS), s_save_tmp
+    save_and_clear_ib_sts(s_save_tmp)
 
     /*	    inform SPI the readiness and wait for SPI's go signal */
     s_mov_b32	    s_save_exec_lo, exec_lo						    //save EXEC and use EXEC for the go signal from SPI
@@ -360,12 +363,6 @@ L_SAVE:
     s_or_b32	    s_save_buf_rsrc1,	s_save_buf_rsrc1,  S_SAVE_BUF_RSRC_WORD1_STRIDE
     s_mov_b32	    s_save_buf_rsrc2,	0									//NUM_RECORDS initial value = 0 (in bytes) although not neccessarily inited
     s_mov_b32	    s_save_buf_rsrc3,	S_SAVE_BUF_RSRC_WORD3_MISC
-    s_and_b32	    s_save_tmp,		s_save_spi_init_hi, S_SAVE_SPI_INIT_ATC_MASK
-    s_lshr_b32	    s_save_tmp,		s_save_tmp, (S_SAVE_SPI_INIT_ATC_SHIFT-SQ_BUF_RSRC_WORD1_ATC_SHIFT)	    //get ATC bit into position
-    s_or_b32	    s_save_buf_rsrc3,	s_save_buf_rsrc3,  s_save_tmp						//or ATC
-    s_and_b32	    s_save_tmp,		s_save_spi_init_hi, S_SAVE_SPI_INIT_MTYPE_MASK
-    s_lshr_b32	    s_save_tmp,		s_save_tmp, (S_SAVE_SPI_INIT_MTYPE_SHIFT-SQ_BUF_RSRC_WORD3_MTYPE_SHIFT)	    //get MTYPE bits into position
-    s_or_b32	    s_save_buf_rsrc3,	s_save_buf_rsrc3,  s_save_tmp						//or MTYPE
 
     //FIXME  right now s_save_m0/s_save_mem_offset use tma_lo/tma_hi  (might need to save them before using them?)
     s_mov_b32	    s_save_m0,		m0								    //save M0
@@ -690,12 +687,6 @@ L_RESTORE:
     s_or_b32	    s_restore_buf_rsrc1,    s_restore_buf_rsrc1,  S_RESTORE_BUF_RSRC_WORD1_STRIDE
     s_mov_b32	    s_restore_buf_rsrc2,    0										    //NUM_RECORDS initial value = 0 (in bytes)
     s_mov_b32	    s_restore_buf_rsrc3,    S_RESTORE_BUF_RSRC_WORD3_MISC
-    s_and_b32	    s_restore_tmp,	    s_restore_spi_init_hi, S_RESTORE_SPI_INIT_ATC_MASK
-    s_lshr_b32	    s_restore_tmp,	    s_restore_tmp, (S_RESTORE_SPI_INIT_ATC_SHIFT-SQ_BUF_RSRC_WORD1_ATC_SHIFT)	    //get ATC bit into position
-    s_or_b32	    s_restore_buf_rsrc3,    s_restore_buf_rsrc3,  s_restore_tmp						    //or ATC
-    s_and_b32	    s_restore_tmp,	    s_restore_spi_init_hi, S_RESTORE_SPI_INIT_MTYPE_MASK
-    s_lshr_b32	    s_restore_tmp,	    s_restore_tmp, (S_RESTORE_SPI_INIT_MTYPE_SHIFT-SQ_BUF_RSRC_WORD3_MTYPE_SHIFT)   //get MTYPE bits into position
-    s_or_b32	    s_restore_buf_rsrc3,    s_restore_buf_rsrc3,  s_restore_tmp						    //or MTYPE
 
     /*	    global mem offset		*/
 //  s_mov_b32	    s_restore_mem_offset, 0x0				    //mem offset initial value = 0
@@ -889,19 +880,7 @@ L_RESTORE:
     s_load_dword    ttmp13, [s_restore_ttmps_lo, s_restore_ttmps_hi], 0x74 glc:1
     s_waitcnt	    lgkmcnt(0)
 
-    //reuse s_restore_m0 as a temp register
-    s_and_b32	    s_restore_m0, s_restore_pc_hi, S_SAVE_PC_HI_RCNT_MASK
-    s_lshr_b32	    s_restore_m0, s_restore_m0, S_SAVE_PC_HI_RCNT_SHIFT
-    s_lshl_b32	    s_restore_m0, s_restore_m0, SQ_WAVE_IB_STS_RCNT_SHIFT
-    s_mov_b32	    s_restore_tmp, 0x0										    //IB_STS is zero
-    s_or_b32	    s_restore_tmp, s_restore_tmp, s_restore_m0
-    s_and_b32	    s_restore_m0, s_restore_pc_hi, S_SAVE_PC_HI_FIRST_REPLAY_MASK
-    s_lshr_b32	    s_restore_m0, s_restore_m0, S_SAVE_PC_HI_FIRST_REPLAY_SHIFT
-    s_lshl_b32	    s_restore_m0, s_restore_m0, SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT
-    s_or_b32	    s_restore_tmp, s_restore_tmp, s_restore_m0
-    s_and_b32	    s_restore_m0, s_restore_status, SQ_WAVE_STATUS_INST_ATC_MASK
-    s_lshr_b32	    s_restore_m0, s_restore_m0, SQ_WAVE_STATUS_INST_ATC_SHIFT
-    s_setreg_b32    hwreg(HW_REG_IB_STS),   s_restore_tmp
+    restore_ib_sts(s_restore_tmp)
 
     s_and_b32 s_restore_pc_hi, s_restore_pc_hi, 0x0000ffff	//pc[47:32]	   //Do it here in order not to affect STATUS
     s_and_b64	 exec, exec, exec  // Restore STATUS.EXECZ, not writable by s_setreg_b32
@@ -910,8 +889,7 @@ L_RESTORE:
 
     s_barrier							//barrier to ensure the readiness of LDS before access attempts from any other wave in the same TG //FIXME not performance-optimal at this time
 
-//  s_rfe_b64 s_restore_pc_lo					//Return to the main shader program and resume execution
-    s_rfe_restore_b64  s_restore_pc_lo, s_restore_m0		// s_restore_m0[0] is used to set STATUS.inst_atc
+    s_rfe_b64 s_restore_pc_lo					//Return to the main shader program and resume execution
 
 
 /**************************************************************************/
@@ -1078,3 +1056,19 @@ function set_status_without_spi_prio(status, tmp)
     s_nop           0x2 // avoid S_SETREG => S_SETREG hazard
     s_setreg_b32    hwreg(HW_REG_STATUS, SQ_WAVE_STATUS_PRE_SPI_PRIO_SHIFT, SQ_WAVE_STATUS_PRE_SPI_PRIO_SIZE), status
 end
+
+function save_and_clear_ib_sts(tmp)
+    // Save IB_STS.FIRST_REPLAY[15] and IB_STS.RCNT[20:16] into unused space ttmp11[31:26].
+    s_getreg_b32    tmp, hwreg(HW_REG_IB_STS)
+    s_and_b32       tmp, tmp, SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK
+    s_lshl_b32      tmp, tmp, (TTMP11_SAVE_RCNT_FIRST_REPLAY_SHIFT - SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT)
+    s_andn2_b32     ttmp11, ttmp11, TTMP11_SAVE_RCNT_FIRST_REPLAY_MASK
+    s_or_b32        ttmp11, ttmp11, tmp
+    s_setreg_imm32_b32 hwreg(HW_REG_IB_STS), 0x0
+end
+
+function restore_ib_sts(tmp)
+    s_lshr_b32      tmp, ttmp11, (TTMP11_SAVE_RCNT_FIRST_REPLAY_SHIFT - SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT)
+    s_and_b32       tmp, tmp, SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK
+    s_setreg_b32    hwreg(HW_REG_IB_STS), tmp
+end
-- 
2.25.1

