Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D972EBB1CED
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Oct 2025 23:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6752110E169;
	Wed,  1 Oct 2025 21:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AWTOnJPq";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011061.outbound.protection.outlook.com [52.101.52.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35A610E169
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Oct 2025 21:28:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CpKrpyx4bfSImSz8rOLu1f1AxJQ4qWJxvoCXBYO1q3uDQxmBrWgPEwDCelD7i/P9JRJdjFzSJpV2r+bNWwHuZ4DHuoWhCJW7+ig8+D4TS8rifDmAolqyZyrgXSKqzVbjeTTxC0zQhllVl8yujH3TfH57wcDwS4y+NrT9kEvv7U4vRz7xRH7NwA0xN00g8rUdGdLOtIcXRcvWep6zK1tNV6E3pJXC8iWsoKeN0ceDvrHwovC9BR3qXi3YrFKHR8ddnkQEmsuBNGAxvWDzbp7SyYP7/KwQ+4W5nfqKcLOKP5yaTT7hhg1qoTHdVdk3OG5rEjaSh8av16+naUhMDXwOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7R/djAafN8k/q73CFihio0tb3v4WvH6HtjDq6BOOI4=;
 b=XnSteGC7GkXVFnqgMZXmB8Tpx0zKSwZCW/jeSWzKPb/y2kXHj0QafYMmjqCkPvLGQ3N+AJf1fF/MtTiAk+VxIV+H6K9NDpy+4MJf4sq0gCj+yq2ZYnDi85+N1iNiok0QAYjOtsTVKFiF6oNDdW6Po4tcU9oEJC+EPTa6L/2oOLq1ITpd/BH4BdEk+Bgu54hDTChmS3vxzUCUgj5cdsYlNyPzzVW5tcYKXEzeqotn8a7YzpCdctpzaLM1Gi5Mj8yYdA9QTGyaYFnwmB6doAdTZE2JBf6x+so6VYWgjMt35L28iiq6OXxd1OB1Pz3H9s9+0NYAYS3xv1HYjGB0wTlFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7R/djAafN8k/q73CFihio0tb3v4WvH6HtjDq6BOOI4=;
 b=AWTOnJPquSNKpLaubIjECxlXSB5FyqZjuHXyBaREox/2T3o4IpKP0aHV/KMj2eqGUACED5RB1xGBVpj5qq9KzyPCjz/LpiV/LsUYtWgjZy2dXiILQEjQm8AoBwDmEGWi8ABrPDdBBk2WPjkBu4l7+Agwaz7DBQ/uMBndziG/MTE=
Received: from SA1PR05CA0019.namprd05.prod.outlook.com (2603:10b6:806:2d2::26)
 by CYYPR12MB8703.namprd12.prod.outlook.com (2603:10b6:930:c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 21:28:04 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:2d2:cafe::f0) by SA1PR05CA0019.outlook.office365.com
 (2603:10b6:806:2d2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.5 via Frontend Transport; Wed, 1
 Oct 2025 21:28:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 21:28:04 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Oct
 2025 14:28:01 -0700
From: Alex Hung <alex.hung@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 <stable@vger.kernel.org>
Subject: [PATCH 3/7] drm/amd/display: Enable Dynamic DTBCLK Switch
Date: Wed, 1 Oct 2025 15:24:08 -0600
Message-ID: <20251001212700.1458245-4-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001212700.1458245-1-alex.hung@amd.com>
References: <20251001212700.1458245-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|CYYPR12MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f6e7e7-87e3-4b20-b56e-08de013167ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7LlbAH1jQEHoE3roevCwIoepsVUPGc3mj1bGNKG4jp2UQiMEFa9lGN6fvWjb?=
 =?us-ascii?Q?fcWOxxfu/mAh2dbbZZjfTvyrnaEkNXU3qkaag3/LukaG02xfJR2wZt93tcbm?=
 =?us-ascii?Q?nlXYelXZWy6vOnfAVqOTK3V48w/HU+XOVASUi56DXB3Jcuzv0SeRctQrkuS4?=
 =?us-ascii?Q?R+v9OtnxZ3MHbteMeGHf/JRWwtL0n5kDNWrEIil53u2I4oLJ7DDv7Wn/kw4/?=
 =?us-ascii?Q?kZ+KzX2qZfERY64t1gvXP41rxWbVKm5vTzoeuvA3rsctw9cVDJl1LkDZwhqI?=
 =?us-ascii?Q?LW0en3zEzqUTLVhut8wAWw2ZdvzVkNzZPeV4YWe2UMZSbfGyDAP690ysbi8e?=
 =?us-ascii?Q?q2p8OWVYJdjl7HFP0g9iJrj6yk9jRY+BLtW1IYMIxrOVvaANRq2QHHhVFQ1F?=
 =?us-ascii?Q?J3UOR+WQFE4ap3iunX//k0Iat8Hzbyp/IX+zk4ryjNDh5tmJSNhCBmZwWbd1?=
 =?us-ascii?Q?3Mop+xuP3gvNS5vNNalBZCzJVwgeSICct8/VAdnsPX604Tf4Mn4dkApy5gal?=
 =?us-ascii?Q?3czSgrbSKdQOjl1zTcXksgEpy76FF9RAdMSgCKdv90+UjO/LBxIIZHRQrwA8?=
 =?us-ascii?Q?t1S7OPx7YreEWYXyPCbES6OpKi/VkeHc4Ofv0l2LEy4XoD8tMGxO7wZ2W14G?=
 =?us-ascii?Q?FpyGaHyYQ4oZWu/5Zuh8aLW33f2Z1UUmnAde4M1+2vn+hBy54s4PJMYL87Bj?=
 =?us-ascii?Q?LfHbIndHRzKaiNjHCZPQ6tX/Q3elR8gWJ0QWDLPIfVwxVdg5UleyGaXVtwfh?=
 =?us-ascii?Q?Nij8UuOLXXQ/RbknDhxe7Vb4UytJSu9WRr4YiTRAoi0ftI2XYjtWIZSyYLRg?=
 =?us-ascii?Q?2DZ9YKwOaqSExyAm2NVpBkBYv047yLBrXGbBJUaJvcoKy8b9yKske9t0W+Rg?=
 =?us-ascii?Q?N1y6UyxCUViN8HGvQWjwRcQLzkCDUGZ6H350z/1bnw8HGarM7ljt/W4SwjrE?=
 =?us-ascii?Q?7VqyTE4lVJlHShWTwO5SHpSP8bO9m2sEYxe5kqqYuRhza9ZAXX03c8ymSYO3?=
 =?us-ascii?Q?UAwm/m/89zaySjm6tGvSt4mEr1SczHNCrHqErBS2LFqMq6svzBXDyeDKpWWa?=
 =?us-ascii?Q?t5Wc23auh1jpbQeesXJ9RfIvbH1sqUVKuxCXevTHFbXiXBfxQfnVIbSnse5i?=
 =?us-ascii?Q?F0kdr6Hos045MgemnXfTZVEhe6JkR6F4D+B9hKfpDp5qvqVAb+JGHPUe+rxQ?=
 =?us-ascii?Q?Ksbe2TXAQIsfLbijFxTtjvGAAhobMeHXBcyQ5GMEfpyThTw7+hbOGC4XEi4A?=
 =?us-ascii?Q?z222EkBqtwiodJwglPYBlAG6unTIk1ot+IHfsMmYuEecEQq8O2VoxeZeHFVn?=
 =?us-ascii?Q?q8Ia1O7hrgBk4ZVbWFX2zl5v1wpzVJmvW1PtNbibwpv7Ci1TnWBSJgvmmys9?=
 =?us-ascii?Q?dWXIZAPa/4FTc+ciKvo8wIswVWVuR16nHWs/oCm1/+ftbAiYHNjiyBy5rHa3?=
 =?us-ascii?Q?ZsqP0WR00zYUMjILXr4nB2bIjqkkwAr4SkCQhUTysy0dDoa6LdW+DY1bbziZ?=
 =?us-ascii?Q?fTC5JGVYtfeAm8BStlFtrupGrU9lRsWvq1RZJ+xgNm2uoMB008FoDB6q8KDK?=
 =?us-ascii?Q?Cib5uJqxyU/hx+PP6Ok=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:28:04.1330 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f6e7e7-87e3-4b20-b56e-08de013167ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8703
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

From: Fangzhi Zuo <Jerry.Zuo@amd.com>

[WHAT]
Since dcn35, DTBCLK can be disabled when no DP2 sink connected for
power saving purpose.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 20ab9fd1b82a..6f5be090b744 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2000,6 +2000,10 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 
 	init_data.flags.disable_ips_in_vpb = 0;
 
+	/* DCN35 and above supports dynamic DTBCLK switch */
+	if (amdgpu_ip_version(adev, DCE_HWIP, 0) >= IP_VERSION(3, 5, 0))
+		init_data.flags.allow_0_dtb_clk = true;
+
 	/* Enable DWB for tested platforms only */
 	if (amdgpu_ip_version(adev, DCE_HWIP, 0) >= IP_VERSION(3, 0, 0))
 		init_data.num_virtual_links = 1;
-- 
2.43.0

