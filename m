Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC0576A218
	for <lists+amd-gfx@lfdr.de>; Mon, 31 Jul 2023 22:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BB910E2E0;
	Mon, 31 Jul 2023 20:41:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F3F10E2E0
 for <amd-gfx@lists.freedesktop.org>; Mon, 31 Jul 2023 20:41:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbBrtBu11Hk7zjC0dqOlFKVeVpjCDFCpaLVZ34wk8Sw7uW+SqNaOAnVWQ1xUZuRGv4NIAhQcqa95WMZ6Kt0X/hee8ScZW+XNB/hIxPUj+84PAhnk4Z+1UCXJvzqI8DB2rB0Y1Y9obcUCeNxDn2nkHgPJR0o4tqBTJJ7F2T7jfs3INM2c03Xg9dYhUf/5L4jyWisRcD31xCH8/SviobGnxw6OnUEbBLhEoUCdtx11H956a7g0wz/NDt+pQoi7D1PbVfqswjh0Rmo7KvwPVePWgFDEmKHwIopLJMN/GtJSpOJ5UKx+G7doh2ZqSmWxM/Mb7ErmzLcYgs+6Duf+fCZoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcuYq5FXF9haZ4LE2o4FQdfodLwYdtqzMfaJmwDOkEE=;
 b=gq9WmzeZ8H/yrYoWqePdE8cMiO0zn9WGJXgTw32w4BgkmiP9rrIKGUq9P/7yUthb+d1V3Vvnk7C48pXqTDVetB8SQdruSp0RU+PBvlWOBbQI+k8Jk+tY2MtJ5wC74tDUJ5MWMfwAoqqRqSeErfmwR1YjQO6MYahj9NuxeD06dIFYIfdL/rcCDwLTw+BS31wtiTa2JSSeL/XQtZQluoE/sPv9uo3scZ9c3og68UDhUV8O7m2SBeg0zZS/1CXwB3D5mX93RhwaaEjYmz1akwntvtM0Di9Li/PuPRMDVnobdi4cnA0kMKzxM9OIaI2EHa8kAj/F9CkKkYebOnJbm13uhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcuYq5FXF9haZ4LE2o4FQdfodLwYdtqzMfaJmwDOkEE=;
 b=hDxRKWfvHirdNSk2azv3CBvetmPAwhrloo/8VWfJqP58DN90BPUJiLQoX+iNjNtknNEDIut3ikFBv/2QTmWvrZK2+tiBXk2pDkb6dgkq4m8Yx97ls4rhPodY2UbF+sa7yxgpF+9+t5WPmgvjxkqhevrGXPO10ex5p/cojSRCnAM=
Received: from BY5PR20CA0001.namprd20.prod.outlook.com (2603:10b6:a03:1f4::14)
 by BY5PR12MB4965.namprd12.prod.outlook.com (2603:10b6:a03:1c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 20:41:26 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::75) by BY5PR20CA0001.outlook.office365.com
 (2603:10b6:a03:1f4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.39 via Frontend
 Transport; Mon, 31 Jul 2023 20:41:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.25 via Frontend Transport; Mon, 31 Jul 2023 20:41:26 +0000
Received: from jc-d.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 31 Jul
 2023 15:41:25 -0500
From: Jay Cornwall <jay.cornwall@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdkfd: Sync trap handler binaries with source
Date: Mon, 31 Jul 2023 15:40:17 -0500
Message-ID: <20230731204019.9519-1-jay.cornwall@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|BY5PR12MB4965:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aa80b4d-fbf6-4ede-5bf8-08db920682c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jYKjkLubk7NzeJu0gNalY4om1CLatU9Qz0qtE9vQlDOXMTIO4Pa8i1UJhFk9iL2xaWzRXoh08oetDbqeCIkXU5rIy7gI25P1585t/k6mehX+Hqf+p7X116PyJwEUVBIkilf/mfmSunneJ5OR+a5Jj48oLCvakTbN3teFaZvKV3NzaarXenLwDHgOSxOluvmNP28rGz0L5+bJxsCQQfLD7DppOwJ9ajdlTI5ZHpSHICbM58lSfRL6Mw1upSKkjUiq53CszFwWetuDKKTtNiixL/cfoyScOBrfxRBJDKC1yInxcMIrrVagh9HzeZBAZpWj7Tt6Dseh73Nlfae1uFXhbxAu0X19qr/K0mDP4K0NSDTQA5BAp81y0PYsZJh5I/VFNvZrgZq1CUjSiZ28kOyC66DoTlLCGSw/eNOdNKn6sAm+oW2/IXFniHRZZkkEdhC/grKsHigatIs5pn2E6SUJwxbLgB5ZyVwv7i6GlaeSdh1QlbU8Gv+5xsexhMBhzYLCvXQf6I6nu3MCCEHQJhXnTWnl0QBjWI89xiktA1Z9TS3F/7jkB/q6TDAgDxt/KE5eP1eGybQj3j+z/uAXsGq4OQGfRM0/v1mNk1aeI4fQ3Bo8KJisbH1hIf6WORP4bFGO9TZR9jKPD38GM9Vd1IH01xcE1+F8QF9OTxeCS9WsiPQBq2sMOXWTTqeMUN6FddUpC9m4zjGzAG4SxYNbP4XbB+AvskWteN9AdbKyl2G6Ykw4V6y8dUiwFc/8tb/bl1uh/YjtFJ7O+acB8/PlqJmW3A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199021)(82310400008)(40470700004)(36840700001)(46966006)(86362001)(8676002)(8936002)(5660300002)(316002)(4326008)(6916009)(41300700001)(356005)(70206006)(81166007)(70586007)(82740400003)(478600001)(30864003)(2906002)(6666004)(36756003)(47076005)(36860700001)(44832011)(7696005)(26005)(1076003)(83380400001)(426003)(336012)(186003)(16526019)(2616005)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 20:41:26.3122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa80b4d-fbf6-4ede-5bf8-08db920682c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4965
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
Cc: Jay Cornwall <jay.cornwall@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Some changes have been lost during rebases. Rebuild sources.

Signed-off-by: Jay Cornwall <jay.cornwall@amd.com>
---
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler.h    | 741 +++++++++---------
 1 file changed, 371 insertions(+), 370 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
index 73ca9aebf086..717ad0633dbe 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
@@ -283,7 +283,7 @@ static const uint32_t cwsr_trap_gfx9_hex[] = {
 	0x866eff7b, 0x00000400,
 	0xbf850051, 0xbf8e0010,
 	0xb8fbf803, 0xbf82fffa,
-	0x866eff7b, 0x00000900,
+	0x866eff7b, 0x03c00900,
 	0xbf850015, 0x866eff7b,
 	0x000071ff, 0xbf840008,
 	0x866fff7b, 0x00007080,
@@ -1103,7 +1103,7 @@ static const uint32_t cwsr_trap_arcturus_hex[] = {
 	0x866eff7b, 0x00000400,
 	0xbf850051, 0xbf8e0010,
 	0xb8fbf803, 0xbf82fffa,
-	0x866eff7b, 0x00000900,
+	0x866eff7b, 0x03c00900,
 	0xbf850015, 0x866eff7b,
 	0x000071ff, 0xbf840008,
 	0x866fff7b, 0x00007080,
@@ -1581,7 +1581,7 @@ static const uint32_t cwsr_trap_aldebaran_hex[] = {
 	0x866eff7b, 0x00000400,
 	0xbf850051, 0xbf8e0010,
 	0xb8fbf803, 0xbf82fffa,
-	0x866eff7b, 0x00000900,
+	0x866eff7b, 0x03c00900,
 	0xbf850015, 0x866eff7b,
 	0x000071ff, 0xbf840008,
 	0x866fff7b, 0x00007080,
@@ -2494,6 +2494,7 @@ static const uint32_t cwsr_trap_gfx10_hex[] = {
 	0xbf9f0000, 0xbf9f0000,
 	0xbf9f0000, 0x00000000,
 };
+
 static const uint32_t cwsr_trap_gfx11_hex[] = {
 	0xbfa00001, 0xbfa00221,
 	0xb0804006, 0xb8f8f802,
@@ -2938,211 +2939,149 @@ static const uint32_t cwsr_trap_gfx11_hex[] = {
 };
 
 static const uint32_t cwsr_trap_gfx9_4_3_hex[] = {
-	0xbf820001, 0xbf8202d6,
-	0xb8f8f802, 0x89788678,
-	0xb8fbf803, 0x866eff78,
-	0x00002000, 0xbf840009,
-	0x866eff6d, 0x00ff0000,
-	0xbf85001a, 0x866eff7b,
-	0x00000400, 0xbf85004d,
-	0xbf8e0010, 0xb8fbf803,
-	0xbf82fffa, 0x866eff7b,
-	0x03c00900, 0xbf850011,
-	0x866eff7b, 0x000071ff,
-	0xbf840008, 0x866fff7b,
-	0x00007080, 0xbf840001,
-	0xbeee1a87, 0xb8eff801,
-	0x8e6e8c6e, 0x866e6f6e,
-	0xbf850006, 0x866eff6d,
-	0x00ff0000, 0xbf850003,
+	0xbf820001, 0xbf8202d7,
+	0xb8f8f802, 0x8978ff78,
+	0x00020006, 0xb8fbf803,
+	0x866eff78, 0x00002000,
+	0xbf840009, 0x866eff6d,
+	0x00ff0000, 0xbf85001a,
 	0x866eff7b, 0x00000400,
-	0xbf850036, 0xb8faf807,
+	0xbf85004d, 0xbf8e0010,
+	0xb8fbf803, 0xbf82fffa,
+	0x866eff7b, 0x03c00900,
+	0xbf850011, 0x866eff7b,
+	0x000071ff, 0xbf840008,
+	0x866fff7b, 0x00007080,
+	0xbf840001, 0xbeee1a87,
+	0xb8eff801, 0x8e6e8c6e,
+	0x866e6f6e, 0xbf850006,
+	0x866eff6d, 0x00ff0000,
+	0xbf850003, 0x866eff7b,
+	0x00000400, 0xbf850036,
+	0xb8faf807, 0x867aff7a,
+	0x001f8000, 0x8e7a8b7a,
+	0x8979ff79, 0xfc000000,
+	0x87797a79, 0xba7ff807,
+	0x00000000, 0xb8faf812,
+	0xb8fbf813, 0x8efa887a,
+	0xc0031bbd, 0x00000010,
+	0xbf8cc07f, 0x8e6e976e,
+	0x8979ff79, 0x00800000,
+	0x87796e79, 0xc0071bbd,
+	0x00000000, 0xbf8cc07f,
+	0xc0071ebd, 0x00000008,
+	0xbf8cc07f, 0x86ee6e6e,
+	0xbf840001, 0xbe801d6e,
+	0x866eff6d, 0x01ff0000,
+	0xbf850005, 0x8778ff78,
+	0x00002000, 0x80ec886c,
+	0x82ed806d, 0xbf820005,
+	0x866eff6d, 0x01000000,
+	0xbf850002, 0x806c846c,
+	0x826d806d, 0x866dff6d,
+	0x0000ffff, 0x8f7a8b79,
 	0x867aff7a, 0x001f8000,
-	0x8e7a8b7a, 0x8979ff79,
-	0xfc000000, 0x87797a79,
-	0xba7ff807, 0x00000000,
-	0xb8faf812, 0xb8fbf813,
-	0x8efa887a, 0xc0031bbd,
-	0x00000010, 0xbf8cc07f,
-	0x8e6e976e, 0x8979ff79,
-	0x00800000, 0x87796e79,
-	0xc0071bbd, 0x00000000,
-	0xbf8cc07f, 0xc0071ebd,
-	0x00000008, 0xbf8cc07f,
-	0x86ee6e6e, 0xbf840001,
-	0xbe801d6e, 0x866eff6d,
-	0x01ff0000, 0xbf850005,
-	0x8778ff78, 0x00002000,
-	0x80ec886c, 0x82ed806d,
-	0xbf820005, 0x866eff6d,
-	0x01000000, 0xbf850002,
-	0x806c846c, 0x826d806d,
+	0xb97af807, 0x86fe7e7e,
+	0x86ea6a6a, 0x8f6e8378,
+	0xb96ee0c2, 0xbf800002,
+	0xb9780002, 0xbe801f6c,
 	0x866dff6d, 0x0000ffff,
-	0x8f7a8b79, 0x867aff7a,
-	0x001f8000, 0xb97af807,
-	0x86fe7e7e, 0x86ea6a6a,
-	0x8f6e8378, 0xb96ee0c2,
-	0xbf800002, 0xb9780002,
-	0xbe801f6c, 0x866dff6d,
-	0x0000ffff, 0xbefa0080,
-	0xb97a0283, 0xb8faf807,
-	0x867aff7a, 0x001f8000,
-	0x8e7a8b7a, 0x8979ff79,
-	0xfc000000, 0x87797a79,
-	0xba7ff807, 0x00000000,
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
-	0x00807fac, 0xbef1007c,
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
+	0xbefa0080, 0xb97a0283,
+	0xb8faf807, 0x867aff7a,
+	0x001f8000, 0x8e7a8b7a,
+	0x8979ff79, 0xfc000000,
+	0x87797a79, 0xba7ff807,
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
-	0x0000007c, 0xbf8cc07f,
-	0x80708470, 0xbefc007e,
-	0xb8f1f801, 0xbefe007c,
-	0xbefc0070, 0xc0611c7a,
+	0xbefc0070, 0xc0611a3a,
 	0x0000007c, 0xbf8cc07f,
 	0x80708470, 0xbefc007e,
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
-	0x00000900, 0x80048104,
-	0xd2890002, 0x00000900,
-	0x80048104, 0xd2890003,
-	0x00000900, 0x80048104,
-	0xc069003a, 0x00000070,
-	0xbf8cc07f, 0x80709070,
-	0xbf06c004, 0xbf84ffee,
-	0xbe840080, 0xd2890000,
-	0x00000901, 0x80048104,
-	0xd2890001, 0x00000901,
-	0x80048104, 0xd2890002,
-	0x00000901, 0x80048104,
-	0xd2890003, 0x00000901,
-	0x80048104, 0xc069003a,
-	0x00000070, 0xbf8cc07f,
-	0x80709070, 0xbf06c004,
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
 	0x00400000, 0xbf850003,
 	0xb8faf803, 0x897a7aff,
-	0x10000000, 0xbf850030,
-	0x24040682, 0xd86e4000,
-	0x00000002, 0xbf8cc07f,
+	0x10000000, 0xbf85004d,
 	0xbe840080, 0xd2890000,
 	0x00000900, 0x80048104,
 	0xd2890001, 0x00000900,
@@ -3162,94 +3101,93 @@ static const uint32_t cwsr_trap_gfx9_4_3_hex[] = {
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
-	0x867aff78, 0x00400000,
-	0xbf850003, 0xb8faf803,
-	0x897a7aff, 0x10000000,
-	0xbf850051, 0xbe840080,
-	0xd2890000, 0x00000900,
-	0x80048104, 0xd2890001,
-	0x00000900, 0x80048104,
-	0xd2890002, 0x00000900,
-	0x80048104, 0xd2890003,
-	0x00000900, 0x80048104,
-	0xc069003a, 0x00000070,
-	0xbf8cc07f, 0x80709070,
-	0xbf06c004, 0xbf84ffee,
 	0xbe840080, 0xd2890000,
-	0x00000901, 0x80048104,
-	0xd2890001, 0x00000901,
+	0x00000902, 0x80048104,
+	0xd2890001, 0x00000902,
 	0x80048104, 0xd2890002,
-	0x00000901, 0x80048104,
-	0xd2890003, 0x00000901,
+	0x00000902, 0x80048104,
+	0xd2890003, 0x00000902,
 	0x80048104, 0xc069003a,
 	0x00000070, 0xbf8cc07f,
 	0x80709070, 0xbf06c004,
 	0xbf84ffee, 0xbe840080,
-	0xd2890000, 0x00000902,
+	0xd2890000, 0x00000903,
 	0x80048104, 0xd2890001,
-	0x00000902, 0x80048104,
-	0xd2890002, 0x00000902,
+	0x00000903, 0x80048104,
+	0xd2890002, 0x00000903,
 	0x80048104, 0xd2890003,
-	0x00000902, 0x80048104,
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
+	0xbef6007b, 0xb8f02985,
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
 	0xbe840080, 0xd2890000,
-	0x00000903, 0x80048104,
-	0xd2890001, 0x00000903,
+	0x00000901, 0x80048104,
+	0xd2890001, 0x00000901,
 	0x80048104, 0xd2890002,
-	0x00000903, 0x80048104,
-	0xd2890003, 0x00000903,
+	0x00000901, 0x80048104,
+	0xd2890003, 0x00000901,
 	0x80048104, 0xc069003a,
 	0x00000070, 0xbf8cc07f,
 	0x80709070, 0xbf06c004,
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
@@ -3289,137 +3227,200 @@ static const uint32_t cwsr_trap_gfx9_4_3_hex[] = {
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
-	0xbf9c0000, 0xbf8200ee,
-	0xbef4007e, 0x8675ff7f,
-	0x0000ffff, 0x8775ff75,
-	0x00040000, 0xbef60080,
-	0xbef700ff, 0x00807fac,
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
-	0x8f6e8b79, 0x866eff6e,
-	0x001f8000, 0xb96ef807,
-	0x866dff6d, 0x0000ffff,
-	0x86fe7e7e, 0x86ea6a6a,
-	0x8f6e837a, 0xb96ee0c2,
-	0xbf800002, 0xb97a0002,
-	0xbf8a0000, 0xbe801f6c,
-	0xbf810000, 0x00000000,
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
+	0xbf8cc07f, 0x8f6e8b79,
+	0x866eff6e, 0x001f8000,
+	0xb96ef807, 0x866dff6d,
+	0x0000ffff, 0x86fe7e7e,
+	0x86ea6a6a, 0x8f6e837a,
+	0xb96ee0c2, 0xbf800002,
+	0xb97a0002, 0xbf8a0000,
+	0xbe801f6c, 0xbf810000,
 };
-- 
2.25.1

