Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A198B5C18
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2024 16:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F9510F1E8;
	Mon, 29 Apr 2024 14:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="igjpTEsI";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A7010F908
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2024 14:57:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7HrWKPYGi++u0KGR/ny527vA5flBy6/l6u9HxEPZY7H60+OvFd4kdX4ixLgTrGvWlxU9c1WL1z1DDYaOOQ2fJb/pXfJNAQGfbO8q4q3qsc5+2xSP1Acpq9rpIqsGt+CM5MxnheT5CpQ3iAmXHF4pyeQFTA3fhSBSf3868c8xlFu6nnwFtw/dKbVkQe/2m+fDNeLIjAo+cCePmh1TsSorKr/hGdOjQasBry5++2QQjcCAklb9Z4Wsc6CQYdBlujry5OEbZjTQIDp67L80FJv/KPjmZhn31dZYFiNW1CkMo6fDMK3jV/OAaOR0qP12txjpG9KTvEldruijwfdL4AhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7OONyW06vLPzeyGl5qscKhUI7tD49uOrZy2A9tM2Pg=;
 b=BAigFy39M/TxoESCFVGf5+uczrzQXWJal/voneF8K5UWfGrrUYICGvOKUkwt9tBlC8e1hsnoSXM96UFqA4YJQgyUK8XYwKfaFRqCvPXb0KZW0Cw2J06N3kCrQ44/p3hpsHeo7ELDup8OrN58MfYJlC9KLzMnGdTR7becgo6E525O4AnloIWwcE8vKursQRVaZaSc8/3hyY5f+syNoyX7CTR+Kc6JkVCbFGrPxzg5h3xS1vWDNJRhJj43GGA32n8YQZ9jsdz2BUaAbIDy8PU8H8UrKrtQRYLtbZ+IjSFeHbnG2uC7+VYZYvCTsFyfHAhNgUkGICLqIKKF68Vkyh+Zxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7OONyW06vLPzeyGl5qscKhUI7tD49uOrZy2A9tM2Pg=;
 b=igjpTEsId+gmoGv2n7X703lft8SKLp65stYUodOXmFraLlOWimQjLAI1WKp0WDb3io3y5j/+AmIUYskyAl3oqNarkPswVRYAy1ny1DSbi9iCep+Ui1qM7J0GyYUwGONRaQsH4w2ixlwy8psmZu58/J1YXpVEW3ScZZWt7AXE6Nk=
Received: from BY5PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:180::18)
 by DM6PR12MB4140.namprd12.prod.outlook.com (2603:10b6:5:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Mon, 29 Apr
 2024 14:57:49 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::5c) by BY5PR13CA0005.outlook.office365.com
 (2603:10b6:a03:180::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.21 via Frontend
 Transport; Mon, 29 Apr 2024 14:57:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 29 Apr 2024 14:57:48 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 29 Apr
 2024 09:57:46 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Jay Cornwall <jay.cornwall@amd.com>, Harish Kasiviswanathan
 <Harish.Kasiviswanathan@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 04/14] drm/amdkfd: Add gfx12 trap handler support
Date: Mon, 29 Apr 2024 10:57:16 -0400
Message-ID: <20240429145726.3459450-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429145726.3459450-1-alexander.deucher@amd.com>
References: <20240429145726.3459450-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|DM6PR12MB4140:EE_
X-MS-Office365-Filtering-Correlation-Id: 44bb8269-7b84-4d33-3add-08dc685cbceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400014|376005|1800799015|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c53SwrKZslkJqTmoXhjx+OQl3B0YgSjuDbhQeIyC1ziCwHHfzu6tAYDbo9he?=
 =?us-ascii?Q?AItUnU43L9izmzKynWGqk6aQZcPzlqDLrdrPl+NhBHYOkzOS9fjb5+t0wAjh?=
 =?us-ascii?Q?fj7O88i2xZmcmBhh7vBhmQPqM6Dtfgts8g40DzvQQqKMRa5ef3HezO0A++j8?=
 =?us-ascii?Q?ceE3pIXPoavPeP/Eyok2oYkAzHiO2eBeEYxuX0M4QKDdT7jsmoIbBBdFLa80?=
 =?us-ascii?Q?rxRBpSv4sEAuaUUINGC7m3NolCl/8thaPEqg4UOphD7SOmxQ4dbXLPVqoIdu?=
 =?us-ascii?Q?qzFYptBSYvVFiATVDD5oqU/fwM7U+tRvqscpOuKnscwVE5iR3vNYZLv1hVyr?=
 =?us-ascii?Q?4AqQ15rgcpTuHaersxbBvMStWma5qQtzfG3BeA9NA1yIU0V0CCALeqRS09xl?=
 =?us-ascii?Q?wL4mCrDczVJGrXOwr/8JwyzVMrpP/3xhTGuJZFKmMxHYG3dGYg6FBnMho3V7?=
 =?us-ascii?Q?Qz8g/ohFLYeeXIL/D22Y9nzs1AV0BSVBBDyMg89n1q8PKM2GhjEdWJ7iSRWT?=
 =?us-ascii?Q?bJa7+ngLAfXe9JMXX4BvsjFIHxaz4slT2EhrenvLDTSXx5d+JR6Jy26aoGdt?=
 =?us-ascii?Q?nlBk/M2cY+xMOOs5NZdI7yps8D61YJuuh3l6x1PV/XFavpuAgs2XN+aR+Iwq?=
 =?us-ascii?Q?yhbqARld0eYB43a6Ko37aXamqNB6uKm4Q89W7/YRLUgjfjvZDkAEogOFt/Kt?=
 =?us-ascii?Q?hJZUNKuE0mKsYbRgU+3mBvdjroOnZBbCnqlhig7Z7afGfLluSebIHGKTl4cw?=
 =?us-ascii?Q?t6hpinIGHbsnqmWFJ1Gh5dHy5latuEsbVRbZYB3KrvkFXrDIYIxMX0liwK8m?=
 =?us-ascii?Q?HUBYmijrSv2yJecq8mYl3bP3CBDrK7NMBd659omOVueXYxO3l8QzQgNBS7kC?=
 =?us-ascii?Q?5KPNLHu7k3jReTnce7x7IDGJXSstzpdayPPoxbN8VSGYWpvV5uQ/9JGS50zP?=
 =?us-ascii?Q?KBH0hqEovxFty2EBl29rXfCNH8XmdY3FsN0lu9DyI3UXX2YxdV41PffrxGBC?=
 =?us-ascii?Q?eBILNOL5eYn14M8NdqvjylnFsgX9x33huZtFzzH3FtNfVPKiKVuXL0ubH6ih?=
 =?us-ascii?Q?bU9/9SGzBYohGp4TAWmKI0/uhRJiRN2apX3aFmnY2bMBfP17bJXswmmA46X2?=
 =?us-ascii?Q?Lj0GTHsgdugvHFVDNIDb/zDCAnaC6cXL54W0ON3q6mdBY7OkX8TB3xFSuOmd?=
 =?us-ascii?Q?/f5/2S+u0+VNyDJTCQ8P/7HVrt99/VS+ym5c3ZgPTEDQ32UvE+wT9GeL4Hi6?=
 =?us-ascii?Q?4j5aCDEkApZEzauSR9Of4xB3/DfODymvRjqECDR3g++zhGSkcc2DLRdq9kLl?=
 =?us-ascii?Q?5Vrqd1GtNowh2bkQjMuwSKNi/EuiW44htufhwzYXrHbtsZCvfjh5/wovoyC2?=
 =?us-ascii?Q?MY2S+6o=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 14:57:48.9486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bb8269-7b84-4d33-3add-08dc685cbceb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4140
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jay Cornwall <jay.cornwall@amd.com>

- HWREG changes since gfx11
- Save/restore barrier state
- get_wave_size is now reserved by assembler

v2: rebase (Alex)

Signed-off-by: Jay Cornwall <jay.cornwall@amd.com>
Reviewed-by: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler.h    | 465 ++++++++++++++++++
 .../amd/amdkfd/cwsr_trap_handler_gfx10.asm    | 184 +++++--
 2 files changed, 607 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
index 5a0308d26b53c..2dd14f26d2f88 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
@@ -3645,3 +3645,468 @@ static const uint32_t cwsr_trap_gfx9_4_3_hex[] = {
 	0xb97a0002, 0xbf8a0000,
 	0xbe801f6c, 0xbf9b0000,
 };
+
+static const uint32_t cwsr_trap_gfx12_hex[] = {
+	0xbfa00001, 0xbfa0023b,
+	0xb0804009, 0xb8f8f804,
+	0x9178ff78, 0x00008c00,
+	0xb8fbf811, 0x8b6eff78,
+	0x00004000, 0xbfa10008,
+	0x8b6eff7b, 0x00000080,
+	0xbfa20015, 0x8b6ea07b,
+	0xbfa2003e, 0xbf830010,
+	0xb8fbf811, 0xbfa0fffb,
+	0x8b6eff7b, 0x00000050,
+	0xbfa2000d, 0xb8eef812,
+	0x8b6f8f7b, 0xbfa10002,
+	0x8c6eff6e, 0x00000080,
+	0xb8eff813, 0x8b6f6e6f,
+	0xbfa20005, 0x8b6eff6d,
+	0xf0000000, 0xbfa20002,
+	0x8b6ea07b, 0xbfa2002b,
+	0xbefa4d82, 0xbf89fc07,
+	0x84fa887a, 0xbf0d8f7b,
+	0xbfa10002, 0x8c7bff7b,
+	0xffff0000, 0xf4601bbd,
+	0xf8000010, 0xbf89fc07,
+	0x846e976e, 0x9177ff77,
+	0x00800000, 0x8c776e77,
+	0xf4603bbd, 0xf8000000,
+	0xbf89fc07, 0xf4603ebd,
+	0xf8000008, 0xbf89fc07,
+	0x8bee6e6e, 0xbfa10001,
+	0xbe80486e, 0x8b6eff6d,
+	0xf0000000, 0xbfa20009,
+	0xb8eef811, 0x8b6eff6e,
+	0x00000080, 0xbfa20007,
+	0x8c78ff78, 0x00004000,
+	0x80ec886c, 0x82ed806d,
+	0xbfa00002, 0x806c846c,
+	0x826d806d, 0x8b6dff6d,
+	0x0000ffff, 0x8bfe7e7e,
+	0x8bea6a6a, 0xb978f804,
+	0xbe804a6c, 0x8b6dff6d,
+	0x0000ffff, 0xbefa0080,
+	0xb97a0151, 0xbeee007e,
+	0xbeef007f, 0xbefe0180,
+	0xbefe4d84, 0xbf89fc07,
+	0x8b7aff7f, 0x04000000,
+	0x847a857a, 0x8c6d7a6d,
+	0xbefa007e, 0x8b7bff7f,
+	0x0000ffff, 0xbefe00c1,
+	0xbeff00c1, 0xee0a407a,
+	0x000c0000, 0x00000000,
+	0x7e000280, 0xbefe007a,
+	0xbeff007b, 0xb8fb0742,
+	0x847b997b, 0xb8fa3b05,
+	0x807a817a, 0xbf0d997b,
+	0xbfa20002, 0x847a897a,
+	0xbfa00001, 0x847a8a7a,
+	0xb8fb1e06, 0x847b8a7b,
+	0x807a7b7a, 0x8b7bff7f,
+	0x0000ffff, 0x807aff7a,
+	0x00000200, 0x807a7e7a,
+	0x827b807b, 0xd7610000,
+	0x00010870, 0xd7610000,
+	0x00010a71, 0xd7610000,
+	0x00010c72, 0xd7610000,
+	0x00010e73, 0xd7610000,
+	0x00011074, 0xd7610000,
+	0x00011275, 0xd7610000,
+	0x00011476, 0xd7610000,
+	0x00011677, 0xd7610000,
+	0x00011a79, 0xd7610000,
+	0x00011c7e, 0xd7610000,
+	0x00011e7f, 0xbefe00ff,
+	0x00003fff, 0xbeff0080,
+	0xee0a407a, 0x000c0000,
+	0x00004000, 0xd760007a,
+	0x00011d00, 0xd760007b,
+	0x00011f00, 0xbefe007a,
+	0xbeff007b, 0xbef4007e,
+	0x8b75ff7f, 0x0000ffff,
+	0x8c75ff75, 0x00040000,
+	0xbef60080, 0xbef700ff,
+	0x10807fac, 0xbef1007d,
+	0xbef00080, 0xb8f30742,
+	0x84739973, 0xbefe00c1,
+	0x857d9973, 0x8b7d817d,
+	0xbf06817d, 0xbfa20002,
+	0xbeff0080, 0xbfa00002,
+	0xbeff00c1, 0xbfa0000c,
+	0xbef600ff, 0x01000000,
+	0xc4068070, 0x008ce801,
+	0x00008000, 0xc4068070,
+	0x008ce802, 0x00010000,
+	0xc4068070, 0x008ce803,
+	0x00018000, 0xbfa0000b,
+	0xbef600ff, 0x01000000,
+	0xc4068070, 0x008ce801,
+	0x00010000, 0xc4068070,
+	0x008ce802, 0x00020000,
+	0xc4068070, 0x008ce803,
+	0x00030000, 0xb8f03b05,
+	0x80708170, 0xbf0d9973,
+	0xbfa20002, 0x84708970,
+	0xbfa00001, 0x84708a70,
+	0xb8fa1e06, 0x847a8a7a,
+	0x80707a70, 0x8070ff70,
+	0x00000200, 0xbef600ff,
+	0x01000000, 0x7e000280,
+	0x7e020280, 0x7e040280,
+	0xbefd0080, 0xbe804ec2,
+	0xbf94fffe, 0xd7610002,
+	0x0000fa71, 0x807d817d,
+	0xd7610002, 0x0000fa6c,
+	0x807d817d, 0x917aff6d,
+	0x80000000, 0xd7610002,
+	0x0000fa7a, 0x807d817d,
+	0xd7610002, 0x0000fa6e,
+	0x807d817d, 0xd7610002,
+	0x0000fa6f, 0x807d817d,
+	0xd7610002, 0x0000fa78,
+	0x807d817d, 0xb8faf811,
+	0xd7610002, 0x0000fa7a,
+	0x807d817d, 0xd7610002,
+	0x0000fa7b, 0x807d817d,
+	0xb8f1f801, 0xd7610002,
+	0x0000fa71, 0x807d817d,
+	0xb8f1f814, 0xd7610002,
+	0x0000fa71, 0x807d817d,
+	0xb8f1f815, 0xd7610002,
+	0x0000fa71, 0x807d817d,
+	0xb8f1f812, 0xd7610002,
+	0x0000fa71, 0x807d817d,
+	0xb8f1f813, 0xd7610002,
+	0x0000fa71, 0x807d817d,
+	0xb8faf802, 0xd7610002,
+	0x0000fa7a, 0x807d817d,
+	0xbefe00ff, 0x0000ffff,
+	0xbeff0080, 0xc4068070,
+	0x008ce802, 0x00000000,
+	0xbefe00c1, 0xb8f03b05,
+	0x80708170, 0xbf0d9973,
+	0xbfa20002, 0x84708970,
+	0xbfa00001, 0x84708a70,
+	0xb8fa1e06, 0x847a8a7a,
+	0x80707a70, 0xbef600ff,
+	0x01000000, 0xbef90080,
+	0xbefd0080, 0xbf800000,
+	0xbe804100, 0xbe824102,
+	0xbe844104, 0xbe864106,
+	0xbe884108, 0xbe8a410a,
+	0xbe8c410c, 0xbe8e410e,
+	0xd7610002, 0x0000f200,
+	0x80798179, 0xd7610002,
+	0x0000f201, 0x80798179,
+	0xd7610002, 0x0000f202,
+	0x80798179, 0xd7610002,
+	0x0000f203, 0x80798179,
+	0xd7610002, 0x0000f204,
+	0x80798179, 0xd7610002,
+	0x0000f205, 0x80798179,
+	0xd7610002, 0x0000f206,
+	0x80798179, 0xd7610002,
+	0x0000f207, 0x80798179,
+	0xd7610002, 0x0000f208,
+	0x80798179, 0xd7610002,
+	0x0000f209, 0x80798179,
+	0xd7610002, 0x0000f20a,
+	0x80798179, 0xd7610002,
+	0x0000f20b, 0x80798179,
+	0xd7610002, 0x0000f20c,
+	0x80798179, 0xd7610002,
+	0x0000f20d, 0x80798179,
+	0xd7610002, 0x0000f20e,
+	0x80798179, 0xd7610002,
+	0x0000f20f, 0x80798179,
+	0xbf06a079, 0xbfa10007,
+	0xc4068070, 0x008ce802,
+	0x00000000, 0x8070ff70,
+	0x00000080, 0xbef90080,
+	0x7e040280, 0x807d907d,
+	0xbf0aff7d, 0x00000060,
+	0xbfa2ffbb, 0xbe804100,
+	0xbe824102, 0xbe844104,
+	0xbe864106, 0xbe884108,
+	0xbe8a410a, 0xd7610002,
+	0x0000f200, 0x80798179,
+	0xd7610002, 0x0000f201,
+	0x80798179, 0xd7610002,
+	0x0000f202, 0x80798179,
+	0xd7610002, 0x0000f203,
+	0x80798179, 0xd7610002,
+	0x0000f204, 0x80798179,
+	0xd7610002, 0x0000f205,
+	0x80798179, 0xd7610002,
+	0x0000f206, 0x80798179,
+	0xd7610002, 0x0000f207,
+	0x80798179, 0xd7610002,
+	0x0000f208, 0x80798179,
+	0xd7610002, 0x0000f209,
+	0x80798179, 0xd7610002,
+	0x0000f20a, 0x80798179,
+	0xd7610002, 0x0000f20b,
+	0x80798179, 0xc4068070,
+	0x008ce802, 0x00000000,
+	0xbefe00c1, 0x857d9973,
+	0x8b7d817d, 0xbf06817d,
+	0xbfa20002, 0xbeff0080,
+	0xbfa00001, 0xbeff00c1,
+	0xb8fb4306, 0x8b7bc17b,
+	0xbfa10045, 0x8b7aff6d,
+	0x80000000, 0xbfa10042,
+	0x847b867b, 0x847b827b,
+	0xbef6007b, 0xb8f03b05,
+	0x80708170, 0xbf0d9973,
+	0xbfa20002, 0x84708970,
+	0xbfa00001, 0x84708a70,
+	0xb8fa1e06, 0x847a8a7a,
+	0x80707a70, 0x8070ff70,
+	0x00000200, 0x8070ff70,
+	0x00000080, 0xbef600ff,
+	0x01000000, 0xd71f0000,
+	0x000100c1, 0xd7200000,
+	0x000200c1, 0x16000084,
+	0x857d9973, 0x8b7d817d,
+	0xbf06817d, 0xbefd0080,
+	0xbfa20013, 0xbe8300ff,
+	0x00000080, 0xbf800000,
+	0xbf800000, 0xbf800000,
+	0xd8d80000, 0x01000000,
+	0xbf890000, 0xc4068070,
+	0x008ce801, 0x00000000,
+	0x807d037d, 0x80700370,
+	0xd5250000, 0x0001ff00,
+	0x00000080, 0xbf0a7b7d,
+	0xbfa2fff3, 0xbfa00012,
+	0xbe8300ff, 0x00000100,
+	0xbf800000, 0xbf800000,
+	0xbf800000, 0xd8d80000,
+	0x01000000, 0xbf890000,
+	0xc4068070, 0x008ce801,
+	0x00000000, 0x807d037d,
+	0x80700370, 0xd5250000,
+	0x0001ff00, 0x00000100,
+	0xbf0a7b7d, 0xbfa2fff3,
+	0xbefe00c1, 0x857d9973,
+	0x8b7d817d, 0xbf06817d,
+	0xbfa20004, 0xbef000ff,
+	0x00000200, 0xbeff0080,
+	0xbfa00003, 0xbef000ff,
+	0x00000400, 0xbeff00c1,
+	0xb8fb3b05, 0x807b817b,
+	0x847b827b, 0x857d9973,
+	0x8b7d817d, 0xbf06817d,
+	0xbfa2001b, 0xbef600ff,
+	0x01000000, 0xbefd0084,
+	0xbf0a7b7d, 0xbfa10040,
+	0x7e008700, 0x7e028701,
+	0x7e048702, 0x7e068703,
+	0xc4068070, 0x008ce800,
+	0x00000000, 0xc4068070,
+	0x008ce801, 0x00008000,
+	0xc4068070, 0x008ce802,
+	0x00010000, 0xc4068070,
+	0x008ce803, 0x00018000,
+	0x807d847d, 0x8070ff70,
+	0x00000200, 0xbf0a7b7d,
+	0xbfa2ffeb, 0xbfa0002a,
+	0xbef600ff, 0x01000000,
+	0xbefd0084, 0xbf0a7b7d,
+	0xbfa10015, 0x7e008700,
+	0x7e028701, 0x7e048702,
+	0x7e068703, 0xc4068070,
+	0x008ce800, 0x00000000,
+	0xc4068070, 0x008ce801,
+	0x00010000, 0xc4068070,
+	0x008ce802, 0x00020000,
+	0xc4068070, 0x008ce803,
+	0x00030000, 0x807d847d,
+	0x8070ff70, 0x00000400,
+	0xbf0a7b7d, 0xbfa2ffeb,
+	0xb8fb1e06, 0x8b7bc17b,
+	0xbfa1000d, 0x847b837b,
+	0x807b7d7b, 0xbefe00c1,
+	0xbeff0080, 0x7e008700,
+	0xc4068070, 0x008ce800,
+	0x00000000, 0x807d817d,
+	0x8070ff70, 0x00000080,
+	0xbf0a7b7d, 0xbfa2fff7,
+	0xbfa00159, 0xbef4007e,
+	0x8b75ff7f, 0x0000ffff,
+	0x8c75ff75, 0x00040000,
+	0xbef60080, 0xbef700ff,
+	0x10807fac, 0xb8f20742,
+	0x84729972, 0x8b6eff7f,
+	0x04000000, 0xbfa1003c,
+	0xbefe00c1, 0x857d9972,
+	0x8b7d817d, 0xbf06817d,
+	0xbfa20002, 0xbeff0080,
+	0xbfa00001, 0xbeff00c1,
+	0xb8ef4306, 0x8b6fc16f,
+	0xbfa10031, 0x846f866f,
+	0x846f826f, 0xbef6006f,
+	0xb8f83b05, 0x80788178,
+	0xbf0d9972, 0xbfa20002,
+	0x84788978, 0xbfa00001,
+	0x84788a78, 0xb8ee1e06,
+	0x846e8a6e, 0x80786e78,
+	0x8078ff78, 0x00000200,
+	0x8078ff78, 0x00000080,
+	0xbef600ff, 0x01000000,
+	0x857d9972, 0x8b7d817d,
+	0xbf06817d, 0xbefd0080,
+	0xbfa2000d, 0xc4050078,
+	0x0080e800, 0x00000000,
+	0xbf8903f7, 0xdac00000,
+	0x00000000, 0x807dff7d,
+	0x00000080, 0x8078ff78,
+	0x00000080, 0xbf0a6f7d,
+	0xbfa2fff4, 0xbfa0000c,
+	0xc4050078, 0x0080e800,
+	0x00000000, 0xbf8903f7,
+	0xdac00000, 0x00000000,
+	0x807dff7d, 0x00000100,
+	0x8078ff78, 0x00000100,
+	0xbf0a6f7d, 0xbfa2fff4,
+	0xbef80080, 0xbefe00c1,
+	0x857d9972, 0x8b7d817d,
+	0xbf06817d, 0xbfa20002,
+	0xbeff0080, 0xbfa00001,
+	0xbeff00c1, 0xb8ef3b05,
+	0x806f816f, 0x846f826f,
+	0x857d9972, 0x8b7d817d,
+	0xbf06817d, 0xbfa2002c,
+	0xbef600ff, 0x01000000,
+	0xbeee0078, 0x8078ff78,
+	0x00000200, 0xbefd0084,
+	0xbf0a6f7d, 0xbfa10061,
+	0xc4050078, 0x008ce800,
+	0x00000000, 0xc4050078,
+	0x008ce801, 0x00008000,
+	0xc4050078, 0x008ce802,
+	0x00010000, 0xc4050078,
+	0x008ce803, 0x00018000,
+	0xbf8903f7, 0x7e008500,
+	0x7e028501, 0x7e048502,
+	0x7e068503, 0x807d847d,
+	0x8078ff78, 0x00000200,
+	0xbf0a6f7d, 0xbfa2ffea,
+	0xc405006e, 0x008ce800,
+	0x00000000, 0xc405006e,
+	0x008ce801, 0x00008000,
+	0xc405006e, 0x008ce802,
+	0x00010000, 0xc405006e,
+	0x008ce803, 0x00018000,
+	0xbf8903f7, 0xbfa0003d,
+	0xbef600ff, 0x01000000,
+	0xbeee0078, 0x8078ff78,
+	0x00000400, 0xbefd0084,
+	0xbf0a6f7d, 0xbfa10016,
+	0xc4050078, 0x008ce800,
+	0x00000000, 0xc4050078,
+	0x008ce801, 0x00010000,
+	0xc4050078, 0x008ce802,
+	0x00020000, 0xc4050078,
+	0x008ce803, 0x00030000,
+	0xbf8903f7, 0x7e008500,
+	0x7e028501, 0x7e048502,
+	0x7e068503, 0x807d847d,
+	0x8078ff78, 0x00000400,
+	0xbf0a6f7d, 0xbfa2ffea,
+	0xb8ef1e06, 0x8b6fc16f,
+	0xbfa1000f, 0x846f836f,
+	0x806f7d6f, 0xbefe00c1,
+	0xbeff0080, 0xc4050078,
+	0x008ce800, 0x00000000,
+	0xbf8903f7, 0x7e008500,
+	0x807d817d, 0x8078ff78,
+	0x00000080, 0xbf0a6f7d,
+	0xbfa2fff6, 0xbeff00c1,
+	0xc405006e, 0x008ce800,
+	0x00000000, 0xc405006e,
+	0x008ce801, 0x00010000,
+	0xc405006e, 0x008ce802,
+	0x00020000, 0xc405006e,
+	0x008ce803, 0x00030000,
+	0xbf8903f7, 0xb8f83b05,
+	0x80788178, 0xbf0d9972,
+	0xbfa20002, 0x84788978,
+	0xbfa00001, 0x84788a78,
+	0xb8ee1e06, 0x846e8a6e,
+	0x80786e78, 0x8078ff78,
+	0x00000200, 0x80f8ff78,
+	0x00000050, 0xbef600ff,
+	0x01000000, 0xbefd00ff,
+	0x0000006c, 0x80f89078,
+	0xf462403a, 0xf0000000,
+	0xbf89fc07, 0x80fd847d,
+	0xbf800000, 0xbe804300,
+	0xbe824302, 0x80f8a078,
+	0xf462603a, 0xf0000000,
+	0xbf89fc07, 0x80fd887d,
+	0xbf800000, 0xbe804300,
+	0xbe824302, 0xbe844304,
+	0xbe864306, 0x80f8c078,
+	0xf462803a, 0xf0000000,
+	0xbf89fc07, 0x80fd907d,
+	0xbf800000, 0xbe804300,
+	0xbe824302, 0xbe844304,
+	0xbe864306, 0xbe884308,
+	0xbe8a430a, 0xbe8c430c,
+	0xbe8e430e, 0xbf06807d,
+	0xbfa1fff0, 0xb980f801,
+	0x00000000, 0xb8f83b05,
+	0x80788178, 0xbf0d9972,
+	0xbfa20002, 0x84788978,
+	0xbfa00001, 0x84788a78,
+	0xb8ee1e06, 0x846e8a6e,
+	0x80786e78, 0x8078ff78,
+	0x00000200, 0xbef600ff,
+	0x01000000, 0xf4621bfa,
+	0xf0000000, 0x80788478,
+	0xf4621b3a, 0xf0000000,
+	0x80788478, 0xf4621b7a,
+	0xf0000000, 0x80788478,
+	0xf4621c3a, 0xf0000000,
+	0x80788478, 0xf4621c7a,
+	0xf0000000, 0x80788478,
+	0xf4621eba, 0xf0000000,
+	0x80788478, 0xf4621efa,
+	0xf0000000, 0x80788478,
+	0xf4621e7a, 0xf0000000,
+	0x80788478, 0xf4621cfa,
+	0xf0000000, 0x80788478,
+	0xf4621bba, 0xf0000000,
+	0x80788478, 0xbf89fc07,
+	0xb96ef814, 0xf4621bba,
+	0xf0000000, 0x80788478,
+	0xbf89fc07, 0xb96ef815,
+	0xf4621bba, 0xf0000000,
+	0x80788478, 0xbf89fc07,
+	0xb96ef812, 0xf4621bba,
+	0xf0000000, 0x80788478,
+	0xbf89fc07, 0xb96ef813,
+	0xbe804ec2, 0xbf94fffe,
+	0xbefd006f, 0xbefe0070,
+	0xbeff0071, 0xb97bf811,
+	0xb973f801, 0xb8ee3b05,
+	0x806e816e, 0xbf0d9972,
+	0xbfa20002, 0x846e896e,
+	0xbfa00001, 0x846e8a6e,
+	0xb8ef1e06, 0x846f8a6f,
+	0x806e6f6e, 0x806eff6e,
+	0x00000200, 0x806e746e,
+	0x826f8075, 0x8b6fff6f,
+	0x0000ffff, 0xf4605c37,
+	0xf8000050, 0xf4605d37,
+	0xf8000060, 0xf4601e77,
+	0xf8000074, 0xbf89fc07,
+	0x8b6dff6d, 0x0000ffff,
+	0x8bfe7e7e, 0x8bea6a6a,
+	0xb97af804, 0xbe804a6c,
+	0xbfb00000, 0xbf9f0000,
+	0xbf9f0000, 0xbf9f0000,
+	0xbf9f0000, 0xbf9f0000,
+};
diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm
index dae912688c955..cab62a1517bf7 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm
@@ -33,36 +33,68 @@
  * gfx11:
  *   cpp -DASIC_FAMILY=CHIP_PLUM_BONITO cwsr_trap_handler_gfx10.asm -P -o gfx11.sp3
  *   sp3 gfx11.sp3 -hex gfx11.hex
+ *
+ * gfx12:
+ *   cpp -DASIC_FAMILY=CHIP_GFX12 cwsr_trap_handler_gfx10.asm -P -o gfx12.sp3
+ *   sp3 gfx12.sp3 -hex gfx12.hex
  */
 
 #define CHIP_NAVI10 26
 #define CHIP_SIENNA_CICHLID 30
 #define CHIP_PLUM_BONITO 36
+#define CHIP_GFX12 37
 
 #define NO_SQC_STORE (ASIC_FAMILY >= CHIP_SIENNA_CICHLID)
 #define HAVE_XNACK (ASIC_FAMILY < CHIP_SIENNA_CICHLID)
 #define HAVE_SENDMSG_RTN (ASIC_FAMILY >= CHIP_PLUM_BONITO)
 #define HAVE_BUFFER_LDS_LOAD (ASIC_FAMILY < CHIP_PLUM_BONITO)
-#define SW_SA_TRAP (ASIC_FAMILY >= CHIP_PLUM_BONITO)
+#define SW_SA_TRAP (ASIC_FAMILY >= CHIP_PLUM_BONITO && ASIC_FAMILY < CHIP_GFX12)
 #define SAVE_AFTER_XNACK_ERROR (HAVE_XNACK && !NO_SQC_STORE) // workaround for TCP store failure after XNACK error when ALLOW_REPLAY=0, for debugger
+#define SINGLE_STEP_MISSED_WORKAROUND (ASIC_FAMILY < CHIP_GFX12)	//workaround for lost MODE.DEBUG_EN exception when SAVECTX raised
 
+#if ASIC_FAMILY < CHIP_GFX12
 #define S_COHERENCE glc:1
 #define V_COHERENCE slc:1 glc:1
+#else
+#define S_COHERENCE scope:SCOPE_SYS
+#define V_COHERENCE scope:SCOPE_SYS
+
+#define HW_REG_SHADER_FLAT_SCRATCH_LO HW_REG_WAVE_SCRATCH_BASE_LO
+#define HW_REG_SHADER_FLAT_SCRATCH_HI HW_REG_WAVE_SCRATCH_BASE_HI
+#define HW_REG_GPR_ALLOC HW_REG_WAVE_GPR_ALLOC
+#define HW_REG_LDS_ALLOC HW_REG_WAVE_LDS_ALLOC
+#define HW_REG_MODE HW_REG_WAVE_MODE
+#endif
 
-var SINGLE_STEP_MISSED_WORKAROUND		= 1	//workaround for lost MODE.DEBUG_EN exception when SAVECTX raised
-
+#if ASIC_FAMILY < CHIP_GFX12
 var SQ_WAVE_STATUS_SPI_PRIO_MASK		= 0x00000006
 var SQ_WAVE_STATUS_HALT_MASK			= 0x2000
 var SQ_WAVE_STATUS_ECC_ERR_MASK			= 0x20000
 var SQ_WAVE_STATUS_TRAP_EN_SHIFT		= 6
+var SQ_WAVE_IB_STS2_WAVE64_SHIFT		= 11
+var SQ_WAVE_IB_STS2_WAVE64_SIZE			= 1
+var S_STATUS_HWREG				= HW_REG_STATUS
+var S_STATUS_ALWAYS_CLEAR_MASK			= SQ_WAVE_STATUS_SPI_PRIO_MASK|SQ_WAVE_STATUS_ECC_ERR_MASK
+var S_STATUS_HALT_MASK				= SQ_WAVE_STATUS_HALT_MASK
+var S_SAVE_PC_HI_TRAP_ID_MASK			= 0x00FF0000
+var S_SAVE_PC_HI_HT_MASK			= 0x01000000
+#else
+var SQ_WAVE_STATE_PRIV_SYS_PRIO_MASK		= 0xC00
+var SQ_WAVE_STATE_PRIV_HALT_MASK		= 0x4000
+var SQ_WAVE_STATE_PRIV_POISON_ERR_MASK		= 0x8000
+var SQ_WAVE_STATUS_WAVE64_SHIFT			= 29
+var SQ_WAVE_STATUS_WAVE64_SIZE			= 1
+var S_STATUS_HWREG				= HW_REG_WAVE_STATE_PRIV
+var S_STATUS_ALWAYS_CLEAR_MASK			= SQ_WAVE_STATE_PRIV_SYS_PRIO_MASK|SQ_WAVE_STATE_PRIV_POISON_ERR_MASK
+var S_STATUS_HALT_MASK				= SQ_WAVE_STATE_PRIV_HALT_MASK
+var S_SAVE_PC_HI_TRAP_ID_MASK			= 0xF0000000
+#endif
 
 var SQ_WAVE_LDS_ALLOC_LDS_SIZE_SHIFT		= 12
 var SQ_WAVE_LDS_ALLOC_LDS_SIZE_SIZE		= 9
 var SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SIZE		= 8
 var SQ_WAVE_LDS_ALLOC_VGPR_SHARED_SIZE_SHIFT	= 24
 var SQ_WAVE_LDS_ALLOC_VGPR_SHARED_SIZE_SIZE	= 4
-var SQ_WAVE_IB_STS2_WAVE64_SHIFT		= 11
-var SQ_WAVE_IB_STS2_WAVE64_SIZE			= 1
 
 #if ASIC_FAMILY < CHIP_PLUM_BONITO
 var SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT		= 8
@@ -70,6 +102,7 @@ var SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT		= 8
 var SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT		= 12
 #endif
 
+#if ASIC_FAMILY < CHIP_GFX12
 var SQ_WAVE_TRAPSTS_SAVECTX_MASK		= 0x400
 var SQ_WAVE_TRAPSTS_EXCP_MASK			= 0x1FF
 var SQ_WAVE_TRAPSTS_SAVECTX_SHIFT		= 10
@@ -77,12 +110,6 @@ var SQ_WAVE_TRAPSTS_ADDR_WATCH_MASK		= 0x80
 var SQ_WAVE_TRAPSTS_ADDR_WATCH_SHIFT		= 7
 var SQ_WAVE_TRAPSTS_MEM_VIOL_MASK		= 0x100
 var SQ_WAVE_TRAPSTS_MEM_VIOL_SHIFT		= 8
-var SQ_WAVE_TRAPSTS_PRE_SAVECTX_MASK		= 0x3FF
-var SQ_WAVE_TRAPSTS_PRE_SAVECTX_SHIFT		= 0x0
-var SQ_WAVE_TRAPSTS_PRE_SAVECTX_SIZE		= 10
-var SQ_WAVE_TRAPSTS_POST_SAVECTX_MASK		= 0xFFFFF800
-var SQ_WAVE_TRAPSTS_POST_SAVECTX_SHIFT		= 11
-var SQ_WAVE_TRAPSTS_POST_SAVECTX_SIZE		= 21
 var SQ_WAVE_TRAPSTS_ILLEGAL_INST_MASK		= 0x800
 var SQ_WAVE_TRAPSTS_EXCP_HI_MASK		= 0x7000
 #if ASIC_FAMILY >= CHIP_PLUM_BONITO
@@ -111,6 +138,23 @@ var S_TRAPSTS_NON_MASKABLE_EXCP_MASK		= SQ_WAVE_TRAPSTS_MEM_VIOL_MASK		|\
 						  SQ_WAVE_TRAPSTS_WAVE_END_MASK		|\
 						  SQ_WAVE_TRAPSTS_TRAP_AFTER_INST_MASK
 #endif
+var S_TRAPSTS_HWREG				= HW_REG_TRAPSTS
+var S_TRAPSTS_SAVE_CONTEXT_MASK			= SQ_WAVE_TRAPSTS_SAVECTX_MASK
+var S_TRAPSTS_SAVE_CONTEXT_SHIFT		= SQ_WAVE_TRAPSTS_SAVECTX_SHIFT
+#else
+var SQ_WAVE_EXCP_FLAG_PRIV_ADDR_WATCH_MASK	= 0xF
+var SQ_WAVE_EXCP_FLAG_PRIV_MEM_VIOL_MASK	= 0x10
+var SQ_WAVE_EXCP_FLAG_PRIV_SAVE_CONTEXT_SHIFT	= 5
+var SQ_WAVE_EXCP_FLAG_PRIV_SAVE_CONTEXT_MASK	= 0x20
+var SQ_WAVE_EXCP_FLAG_PRIV_ILLEGAL_INST_MASK	= 0x40
+var SQ_WAVE_EXCP_FLAG_PRIV_HOST_TRAP_MASK	= 0x80
+var SQ_WAVE_TRAP_CTRL_ADDR_WATCH_MASK		= 0x80
+
+var S_TRAPSTS_HWREG				= HW_REG_WAVE_EXCP_FLAG_PRIV
+var S_TRAPSTS_SAVE_CONTEXT_MASK			= SQ_WAVE_EXCP_FLAG_PRIV_SAVE_CONTEXT_MASK
+var S_TRAPSTS_SAVE_CONTEXT_SHIFT		= SQ_WAVE_EXCP_FLAG_PRIV_SAVE_CONTEXT_SHIFT
+var S_TRAPSTS_NON_MASKABLE_EXCP_MASK		= SQ_WAVE_EXCP_FLAG_PRIV_MEM_VIOL_MASK|SQ_WAVE_EXCP_FLAG_PRIV_ILLEGAL_INST_MASK
+#endif
 
 // bits [31:24] unused by SPI debug data
 var TTMP11_SAVE_REPLAY_W64H_SHIFT		= 31
@@ -124,8 +168,6 @@ var TTMP11_DEBUG_TRAP_ENABLED_MASK		= 0x800000
 // when ADD_TID_ENABLE and BUF_DATA_FORMAT_32 for MTBUF), ADD_TID_ENABLE
 var S_SAVE_BUF_RSRC_WORD1_STRIDE		= 0x00040000
 var S_SAVE_BUF_RSRC_WORD3_MISC			= 0x10807FAC
-var S_SAVE_PC_HI_TRAP_ID_MASK			= 0x00FF0000
-var S_SAVE_PC_HI_HT_MASK			= 0x01000000
 var S_SAVE_SPI_INIT_FIRST_WAVE_MASK		= 0x04000000
 var S_SAVE_SPI_INIT_FIRST_WAVE_SHIFT		= 26
 
@@ -197,13 +239,13 @@ L_JUMP_TO_RESTORE:
 	s_branch	L_RESTORE
 
 L_SKIP_RESTORE:
-	s_getreg_b32	s_save_status, hwreg(HW_REG_STATUS)			//save STATUS since we will change SCC
+	s_getreg_b32	s_save_status, hwreg(S_STATUS_HWREG)			//save STATUS since we will change SCC
 
 	// Clear SPI_PRIO: do not save with elevated priority.
 	// Clear ECC_ERR: prevents SQC store and triggers FATAL_HALT if setreg'd.
-	s_andn2_b32	s_save_status, s_save_status, SQ_WAVE_STATUS_SPI_PRIO_MASK|SQ_WAVE_STATUS_ECC_ERR_MASK
+	s_andn2_b32	s_save_status, s_save_status, S_STATUS_ALWAYS_CLEAR_MASK
 
-	s_getreg_b32	s_save_trapsts, hwreg(HW_REG_TRAPSTS)
+	s_getreg_b32	s_save_trapsts, hwreg(S_TRAPSTS_HWREG)
 
 #if SW_SA_TRAP
 	// If ttmp1[30] is set then issue s_barrier to unblock dependent waves.
@@ -218,23 +260,27 @@ L_TRAP_NO_BARRIER:
 	s_cbranch_scc1  L_CHECK_SAVE
 #endif
 
-	s_and_b32       ttmp2, s_save_status, SQ_WAVE_STATUS_HALT_MASK
+	s_and_b32       ttmp2, s_save_status, S_STATUS_HALT_MASK
 	s_cbranch_scc0	L_NOT_HALTED
 
 L_HALTED:
 	// Host trap may occur while wave is halted.
+#if ASIC_FAMILY < CHIP_GFX12
 	s_and_b32	ttmp2, s_save_pc_hi, S_SAVE_PC_HI_TRAP_ID_MASK
+#else
+	s_and_b32	ttmp2, s_save_trapsts, SQ_WAVE_EXCP_FLAG_PRIV_HOST_TRAP_MASK
+#endif
 	s_cbranch_scc1	L_FETCH_2ND_TRAP
 
 L_CHECK_SAVE:
-	s_and_b32	ttmp2, s_save_trapsts, SQ_WAVE_TRAPSTS_SAVECTX_MASK
+	s_and_b32	ttmp2, s_save_trapsts, S_TRAPSTS_SAVE_CONTEXT_MASK
 	s_cbranch_scc1	L_SAVE
 
 	// Wave is halted but neither host trap nor SAVECTX is raised.
 	// Caused by instruction fetch memory violation.
 	// Spin wait until context saved to prevent interrupt storm.
 	s_sleep		0x10
-	s_getreg_b32	s_save_trapsts, hwreg(HW_REG_TRAPSTS)
+	s_getreg_b32	s_save_trapsts, hwreg(S_TRAPSTS_HWREG)
 	s_branch	L_CHECK_SAVE
 
 L_NOT_HALTED:
@@ -250,6 +296,7 @@ L_NOT_HALTED:
 	// Check for maskable exceptions in trapsts.excp and trapsts.excp_hi.
 	// Maskable exceptions only cause the wave to enter the trap handler if
 	// their respective bit in mode.excp_en is set.
+#if ASIC_FAMILY < CHIP_GFX12
 	s_and_b32	ttmp2, s_save_trapsts, SQ_WAVE_TRAPSTS_EXCP_MASK|SQ_WAVE_TRAPSTS_EXCP_HI_MASK
 	s_cbranch_scc0	L_CHECK_TRAP_ID
 
@@ -262,21 +309,32 @@ L_NOT_ADDR_WATCH:
 	s_lshl_b32	ttmp2, ttmp2, SQ_WAVE_MODE_EXCP_EN_SHIFT
 	s_and_b32	ttmp2, ttmp2, ttmp3
 	s_cbranch_scc1	L_FETCH_2ND_TRAP
+#else
+	s_getreg_b32	ttmp2, hwreg(HW_REG_WAVE_EXCP_FLAG_USER)
+	s_and_b32	ttmp3, s_save_trapsts, SQ_WAVE_EXCP_FLAG_PRIV_ADDR_WATCH_MASK
+	s_cbranch_scc0	L_NOT_ADDR_WATCH
+	s_or_b32	ttmp2, ttmp2, SQ_WAVE_TRAP_CTRL_ADDR_WATCH_MASK
+
+L_NOT_ADDR_WATCH:
+	s_getreg_b32	ttmp3, hwreg(HW_REG_WAVE_TRAP_CTRL)
+	s_and_b32	ttmp3, ttmp3, ttmp2
+	s_cbranch_scc1	L_FETCH_2ND_TRAP
+#endif
 
 L_CHECK_TRAP_ID:
 	// Check trap_id != 0
 	s_and_b32	ttmp2, s_save_pc_hi, S_SAVE_PC_HI_TRAP_ID_MASK
 	s_cbranch_scc1	L_FETCH_2ND_TRAP
 
-if SINGLE_STEP_MISSED_WORKAROUND
+#if SINGLE_STEP_MISSED_WORKAROUND
 	// Prioritize single step exception over context save.
 	// Second-level trap will halt wave and RFE, re-entering for SAVECTX.
 	s_getreg_b32	ttmp2, hwreg(HW_REG_MODE)
 	s_and_b32	ttmp2, ttmp2, SQ_WAVE_MODE_DEBUG_EN_MASK
 	s_cbranch_scc1	L_FETCH_2ND_TRAP
-end
+#endif
 
-	s_and_b32	ttmp2, s_save_trapsts, SQ_WAVE_TRAPSTS_SAVECTX_MASK
+	s_and_b32	ttmp2, s_save_trapsts, S_TRAPSTS_SAVE_CONTEXT_MASK
 	s_cbranch_scc1	L_SAVE
 
 L_FETCH_2ND_TRAP:
@@ -318,9 +376,18 @@ L_NO_SIGN_EXTEND_TMA:
 
 L_NO_NEXT_TRAP:
 	// If not caused by trap then halt wave to prevent re-entry.
-	s_and_b32	ttmp2, s_save_pc_hi, (S_SAVE_PC_HI_TRAP_ID_MASK|S_SAVE_PC_HI_HT_MASK)
+	s_and_b32	ttmp2, s_save_pc_hi, S_SAVE_PC_HI_TRAP_ID_MASK
 	s_cbranch_scc1	L_TRAP_CASE
-	s_or_b32	s_save_status, s_save_status, SQ_WAVE_STATUS_HALT_MASK
+
+	// Host trap will not cause trap re-entry.
+#if ASIC_FAMILY < CHIP_GFX12
+	s_and_b32	ttmp2, s_save_pc_hi, S_SAVE_PC_HI_HT_MASK
+#else
+	s_getreg_b32	ttmp2, hwreg(HW_REG_WAVE_EXCP_FLAG_PRIV)
+	s_and_b32	ttmp2, ttmp2, SQ_WAVE_EXCP_FLAG_PRIV_HOST_TRAP_MASK
+#endif
+	s_cbranch_scc1	L_EXIT_TRAP
+	s_or_b32	s_save_status, s_save_status, S_STATUS_HALT_MASK
 
 	// If the PC points to S_ENDPGM then context save will fail if STATUS.HALT is set.
 	// Rewind the PC to prevent this from occurring.
@@ -330,10 +397,6 @@ L_NO_NEXT_TRAP:
 	s_branch	L_EXIT_TRAP
 
 L_TRAP_CASE:
-	// Host trap will not cause trap re-entry.
-	s_and_b32	ttmp2, s_save_pc_hi, S_SAVE_PC_HI_HT_MASK
-	s_cbranch_scc1	L_EXIT_TRAP
-
 	// Advance past trap instruction to prevent re-entry.
 	s_add_u32	ttmp0, ttmp0, 0x4
 	s_addc_u32	ttmp1, ttmp1, 0x0
@@ -348,14 +411,14 @@ L_EXIT_TRAP:
 	// Restore SQ_WAVE_STATUS.
 	s_and_b64	exec, exec, exec					// Restore STATUS.EXECZ, not writable by s_setreg_b32
 	s_and_b64	vcc, vcc, vcc						// Restore STATUS.VCCZ, not writable by s_setreg_b32
-	s_setreg_b32	hwreg(HW_REG_STATUS), s_save_status
+	s_setreg_b32	hwreg(S_STATUS_HWREG), s_save_status
 
 	s_rfe_b64	[ttmp0, ttmp1]
 
 L_SAVE:
 	s_and_b32	s_save_pc_hi, s_save_pc_hi, 0x0000ffff			//pc[47:32]
 	s_mov_b32	s_save_tmp, 0
-	s_setreg_b32	hwreg(HW_REG_TRAPSTS, SQ_WAVE_TRAPSTS_SAVECTX_SHIFT, 1), s_save_tmp	//clear saveCtx bit
+	s_setreg_b32	hwreg(S_TRAPSTS_HWREG, S_TRAPSTS_SAVE_CONTEXT_SHIFT, 1), s_save_tmp	//clear saveCtx bit
 
 #if HAVE_XNACK
 	save_and_clear_ib_sts(s_save_tmp, s_save_trapsts)
@@ -410,7 +473,7 @@ L_SLEEP:
 
 	// Save trap temporaries 4-11, 13 initialized by SPI debug dispatch logic
 	// ttmp SR memory offset : size(VGPR)+size(SVGPR)+size(SGPR)+0x40
-	get_wave_size(s_save_ttmps_hi)
+	get_wave_size2(s_save_ttmps_hi)
 	get_vgpr_size_bytes(s_save_ttmps_lo, s_save_ttmps_hi)
 	get_svgpr_size_bytes(s_save_ttmps_hi)
 	s_add_u32	s_save_ttmps_lo, s_save_ttmps_lo, s_save_ttmps_hi
@@ -456,7 +519,7 @@ L_SLEEP:
 
 	/* global mem offset */
 	s_mov_b32	s_save_mem_offset, 0x0
-	get_wave_size(s_wave_size)
+	get_wave_size2(s_wave_size)
 
 #if HAVE_XNACK
 	// Save and clear vector XNACK state late to free up SGPRs.
@@ -538,6 +601,12 @@ L_SAVE_HWREG:
 	s_mov_b32	m0, 0x0							//Next lane of v2 to write to
 #endif
 
+#if ASIC_FAMILY >= CHIP_GFX12
+	// Ensure no further changes to barrier or LDS state.
+	s_barrier_signal	-2
+	s_barrier_wait	-2
+#endif
+
 	write_hwreg_to_mem(s_save_m0, s_save_buf_rsrc0, s_save_mem_offset)
 	write_hwreg_to_mem(s_save_pc_lo, s_save_buf_rsrc0, s_save_mem_offset)
 	s_andn2_b32	s_save_tmp, s_save_pc_hi, S_SAVE_PC_HI_FIRST_WAVE_MASK
@@ -546,7 +615,7 @@ L_SAVE_HWREG:
 	write_hwreg_to_mem(s_save_exec_hi, s_save_buf_rsrc0, s_save_mem_offset)
 	write_hwreg_to_mem(s_save_status, s_save_buf_rsrc0, s_save_mem_offset)
 
-	s_getreg_b32	s_save_tmp, hwreg(HW_REG_TRAPSTS)
+	s_getreg_b32	s_save_tmp, hwreg(S_TRAPSTS_HWREG)
 	write_hwreg_to_mem(s_save_tmp, s_save_buf_rsrc0, s_save_mem_offset)
 
 	// Not used on Sienna_Cichlid but keep layout same for debugger.
@@ -561,6 +630,17 @@ L_SAVE_HWREG:
 	s_getreg_b32	s_save_m0, hwreg(HW_REG_SHADER_FLAT_SCRATCH_HI)
 	write_hwreg_to_mem(s_save_m0, s_save_buf_rsrc0, s_save_mem_offset)
 
+#if ASIC_FAMILY >= CHIP_GFX12
+	s_getreg_b32	s_save_m0, hwreg(HW_REG_WAVE_EXCP_FLAG_USER)
+	write_hwreg_to_mem(s_save_m0, s_save_buf_rsrc0, s_save_mem_offset)
+
+	s_getreg_b32	s_save_m0, hwreg(HW_REG_WAVE_TRAP_CTRL)
+	write_hwreg_to_mem(s_save_m0, s_save_buf_rsrc0, s_save_mem_offset)
+
+	s_getreg_b32	s_save_tmp, hwreg(HW_REG_WAVE_STATUS)
+	write_hwreg_to_mem(s_save_tmp, s_save_buf_rsrc0, s_save_mem_offset)
+#endif
+
 #if NO_SQC_STORE
 	// Write HWREGs with 16 VGPR lanes. TTMPs occupy space after this.
 	s_mov_b32       exec_lo, 0xFFFF
@@ -653,7 +733,9 @@ L_SAVE_LDS_NORMAL:
 	s_and_b32	s_save_alloc_size, s_save_alloc_size, 0xFFFFFFFF	//lds_size is zero?
 	s_cbranch_scc0	L_SAVE_LDS_DONE						//no lds used? jump to L_SAVE_DONE
 
+#if ASIC_FAMILY < CHIP_GFX12
 	s_barrier								//LDS is used? wait for other waves in the same TG
+#endif
 	s_and_b32	s_save_tmp, s_save_pc_hi, S_SAVE_PC_HI_FIRST_WAVE_MASK
 	s_cbranch_scc0	L_SAVE_LDS_DONE
 
@@ -920,7 +1002,7 @@ L_RESTORE:
 	s_mov_b32	s_restore_buf_rsrc3, S_RESTORE_BUF_RSRC_WORD3_MISC
 
 	//determine it is wave32 or wave64
-	get_wave_size(s_restore_size)
+	get_wave_size2(s_restore_size)
 
 	s_and_b32	s_restore_tmp, s_restore_spi_init_hi, S_RESTORE_SPI_INIT_FIRST_WAVE_MASK
 	s_cbranch_scc0	L_RESTORE_VGPR
@@ -1154,7 +1236,9 @@ L_RESTORE_SGPR:
 	// s_barrier with MODE.DEBUG_EN=1, STATUS.PRIV=1 incorrectly asserts debug exception.
 	// Clear DEBUG_EN before and restore MODE after the barrier.
 	s_setreg_imm32_b32	hwreg(HW_REG_MODE), 0
+#if ASIC_FAMILY < CHIP_GFX12
 	s_barrier								//barrier to ensure the readiness of LDS before access attemps from any other wave in the same TG
+#endif
 
 	/* restore HW registers */
 L_RESTORE_HWREG:
@@ -1185,20 +1269,30 @@ L_RESTORE_HWREG:
 
 	s_setreg_b32	hwreg(HW_REG_SHADER_FLAT_SCRATCH_HI), s_restore_flat_scratch
 
+#if ASIC_FAMILY >= CHIP_GFX12
+	read_hwreg_from_mem(s_restore_tmp, s_restore_buf_rsrc0, s_restore_mem_offset)
+	s_waitcnt	lgkmcnt(0)
+	s_setreg_b32	hwreg(HW_REG_WAVE_EXCP_FLAG_USER), s_restore_tmp
+
+	read_hwreg_from_mem(s_restore_tmp, s_restore_buf_rsrc0, s_restore_mem_offset)
+	s_waitcnt	lgkmcnt(0)
+	s_setreg_b32	hwreg(HW_REG_WAVE_TRAP_CTRL), s_restore_tmp
+
+L_SKIP_BARRIER_RESTORE:
+	// Make barrier and LDS state visible to all waves in the group.
+	s_barrier_signal	-2
+	s_barrier_wait	-2
+#endif
+
 	s_mov_b32	m0, s_restore_m0
 	s_mov_b32	exec_lo, s_restore_exec_lo
 	s_mov_b32	exec_hi, s_restore_exec_hi
 
-	s_and_b32	s_restore_m0, SQ_WAVE_TRAPSTS_PRE_SAVECTX_MASK, s_restore_trapsts
-	s_setreg_b32	hwreg(HW_REG_TRAPSTS, SQ_WAVE_TRAPSTS_PRE_SAVECTX_SHIFT, SQ_WAVE_TRAPSTS_PRE_SAVECTX_SIZE), s_restore_m0
-
 #if HAVE_XNACK
 	s_setreg_b32	hwreg(HW_REG_SHADER_XNACK_MASK), s_restore_xnack_mask
 #endif
 
-	s_and_b32	s_restore_m0, SQ_WAVE_TRAPSTS_POST_SAVECTX_MASK, s_restore_trapsts
-	s_lshr_b32	s_restore_m0, s_restore_m0, SQ_WAVE_TRAPSTS_POST_SAVECTX_SHIFT
-	s_setreg_b32	hwreg(HW_REG_TRAPSTS, SQ_WAVE_TRAPSTS_POST_SAVECTX_SHIFT, SQ_WAVE_TRAPSTS_POST_SAVECTX_SIZE), s_restore_m0
+	s_setreg_b32	hwreg(S_TRAPSTS_HWREG), s_restore_trapsts
 	s_setreg_b32	hwreg(HW_REG_MODE), s_restore_mode
 
 	// Restore trap temporaries 4-11, 13 initialized by SPI debug dispatch logic
@@ -1235,7 +1329,7 @@ L_RESTORE_HWREG:
 L_RETURN_WITHOUT_PRIV:
 #endif
 
-	s_setreg_b32	hwreg(HW_REG_STATUS), s_restore_status			// SCC is included, which is changed by previous salu
+	s_setreg_b32	hwreg(S_STATUS_HWREG), s_restore_status			// SCC is included, which is changed by previous salu
 	s_rfe_b64	s_restore_pc_lo						//Return to the main shader program and resume execution
 
 L_END_PGM:
@@ -1378,11 +1472,16 @@ function get_hwreg_size_bytes
 	return 128
 end
 
-function get_wave_size(s_reg)
+function get_wave_size2(s_reg)
+#if ASIC_FAMILY < CHIP_GFX12
 	s_getreg_b32	s_reg, hwreg(HW_REG_IB_STS2,SQ_WAVE_IB_STS2_WAVE64_SHIFT,SQ_WAVE_IB_STS2_WAVE64_SIZE)
+#else
+	s_getreg_b32	s_reg, hwreg(HW_REG_WAVE_STATUS,SQ_WAVE_STATUS_WAVE64_SHIFT,SQ_WAVE_STATUS_WAVE64_SIZE)
+#endif
 	s_lshl_b32	s_reg, s_reg, S_WAVE_SIZE
 end
 
+#if HAVE_XNACK
 function save_and_clear_ib_sts(tmp1, tmp2)
 	// Preserve and clear scalar XNACK state before issuing scalar loads.
 	// Save IB_STS.REPLAY_W64H[25], RCNT[21:16], FIRST_REPLAY[15] into
@@ -1407,3 +1506,4 @@ function restore_ib_sts(tmp1, tmp2)
 	s_or_b32	tmp1, tmp1, tmp2
 	s_setreg_b32	hwreg(HW_REG_IB_STS), tmp1
 end
+#endif
-- 
2.44.0

