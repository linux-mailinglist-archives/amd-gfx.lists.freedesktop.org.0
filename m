Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CBA4F9BA5
	for <lists+amd-gfx@lfdr.de>; Fri,  8 Apr 2022 19:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6F610EE26;
	Fri,  8 Apr 2022 17:26:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D292710EE26
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 Apr 2022 17:26:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NduMh6NmmHVljfB7NXgVYS7qdKIIwIOMb+7Fk5XW9yWpuOuICGCcf6qODvGqGnIg28I8TDQ4vpnwvFdkay0RStkNtAuq00dTaVX30lxDob6lLw6O8mugESYiHJq0uNs0RjtUjP0Nttj5nwUUuBmUTfptEgDwfxRrBNMjf5JZDIdn1hyGxKBxAqZh2xcbtVrRxNqzFLSAYEPbSZiRtkmvPM8YTppUFV5UTIbdxn3RyDyK+iL3IvdDDrPjnvNzsgTQ7EolMj3gMd0jNVS8sv0pxilkHZjP4f2z+ay9GJMqK/qboYVOucskyPotyROIDmXpvebzAk8mJlg3uYNXNtKfsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHizMusd2gTufPN09mi0SwZkd0PICnfD2UIO43pthlg=;
 b=WNAj6HyvP258TC/9Rk1H4t8AWs/Q6OXYCH6LTCKSjTWCqT5PpR70LhCPqbbvcg2BA2quKkc59XmR3q3I1c5WQcT86T89vdxQIobVKonqop1ow1A2pNGTr+12bIw3ufyTGAgbH71sde6T2a89N/tM9vHXv+sH27r3UsOc1JgkclJ/26M4qgA6LSpUpLPHxCTG0fPGZ2AfW4+Yur3etph3DOf3FuLERj9ix5hYygVmJnX+fJ6EpZOXpN79XsrAvj/7UibX5KDeyhRUuWReZv77+/ssDlsPTGCZbs6hjwBGDNwL1kOuaFuEQQgQ52c4U7zeNUKjSF2LHKWR/MquZsnFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHizMusd2gTufPN09mi0SwZkd0PICnfD2UIO43pthlg=;
 b=Mv6H9xWzbKwFVs/7GY6BHX3GKM6laMaGUpP9o4FwIDeve+tAZ5gGVKSQJncWD4XYYiJcxT55ttn+Qxs72kihiZcTYQeaPTu0D4/bQVH7RypFKWHu0zhIoI2AK3Y9dUEf1TVsMCSm4IEf3mHr+mwrVns/c+Z1J2+GSayD0Yfnpoo=
Received: from DM6PR07CA0096.namprd07.prod.outlook.com (2603:10b6:5:337::29)
 by BN9PR12MB5132.namprd12.prod.outlook.com (2603:10b6:408:119::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 17:26:20 +0000
Received: from DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::b4) by DM6PR07CA0096.outlook.office365.com
 (2603:10b6:5:337::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.23 via Frontend
 Transport; Fri, 8 Apr 2022 17:26:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT013.mail.protection.outlook.com (10.13.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Fri, 8 Apr 2022 17:26:19 +0000
Received: from lnxpromo.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 8 Apr
 2022 12:26:18 -0500
From: Pavle Kotarac <Pavle.Kotarac@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/20] drm/amd/display: Disabling Z10 on DCN31
Date: Fri, 8 Apr 2022 13:18:54 -0400
Message-ID: <20220408171911.601615-4-Pavle.Kotarac@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220408171911.601615-1-Pavle.Kotarac@amd.com>
References: <20220408171911.601615-1-Pavle.Kotarac@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae09f235-70cb-48af-64e8-08da1984e548
X-MS-TrafficTypeDiagnostic: BN9PR12MB5132:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB51323367E2FA1EF116A84BC1FCE99@BN9PR12MB5132.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cbz6okZ/RuU3XOLA6S2BwZOkZhO3DWa9CIpoLyB5p1hC7DRJjitf8rGL3e3eKgo/AmVa0fuWFI5EzqR8ru69EPuLgwQtjVA15YjIrk9MVOnJOKGHnseUPP6XF7uDKvpyzhya416qBJL9km4SCXNmxa8Sj1oabn8Ov2eWdOWLW2jvujcZHeSnLxsB4Py5zT8nIkDZ1AkRZcE3YBeIldHuoGs+fgS34AmE4lziI5t3mu5R98i/Edi0GUwWo5OB33Dj/TAVnKdXL0nRnwBUW4CmCaHRQoeju+wo1k8FLsdYdlJa8ScmSuyX6sUJIKYCXAJFeaKgJEKO9D7rTK/gyZlskYH4wFzOiS4mxK5PEKhoZY+p01nsPHuxFf4Bi+GJwS0dBNjfdG6p3UlmsiyjBLKNhfYPxmWI0pyhvwp4JjuhaHk7RNQluppQFfSAAbLjIcvD5gJibY2t/kjIr5lF3ZHjwejZNOoYDnlQBATkZ5Q1Cw21Vwe4JZEpO0SKkQ15DdURPYxuXWZWc596drisp7+GKvzQXI/Mh9kbHPRWUwJR4EHYz0++B6zoXlDy19qUiMOFhfXghH2bDkM3XYFG37Xj/fXzw8gpolivi23SxpQ+w+ydhE1Mo2SbnXVb23fHEmOSzfQYgmIbEmkJbMuOc4N4oAKxdGRDfchgOOivXJhKpQrr1ZQjyWh0OZ6P+3IyOBRsTZhbk6Y5nNLTGWOXti/6oQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(186003)(6916009)(36756003)(2906002)(4744005)(47076005)(7696005)(6666004)(26005)(1076003)(2616005)(8676002)(336012)(426003)(82310400005)(8936002)(16526019)(70586007)(508600001)(316002)(36860700001)(70206006)(54906003)(4326008)(356005)(40460700003)(86362001)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 17:26:19.8513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae09f235-70cb-48af-64e8-08da1984e548
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5132
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
Cc: stylon.wang@amd.com, Eric Yang <Eric.Yang2@amd.com>, Sunpeng.Li@amd.com,
 Harry.Wentland@amd.com, qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, "AMD\\syerizvi" <syerizvi@amd.com>, solomon.chiu@amd.com,
 Aurabindo.Pillai@amd.com, wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, Pavle Kotarac <Pavle.Kotarac@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: "AMD\\syerizvi" <syerizvi@amd.com>

[WHY]
Z10 is should not be enabled by default on DCN31.

[HOW]
Using DC debug flags to disable Z10 by default on DCN31.

Reviewed-by: Eric Yang <Eric.Yang2@amd.com>
Acked-by: Pavle Kotarac <Pavle.Kotarac@amd.com>
Signed-off-by: AMD\syerizvi <syerizvi@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index f27262417abe..6cc580be7c79 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -885,6 +885,7 @@ static const struct dc_debug_options debug_defaults_drv = {
 			.afmt = true,
 		}
 	},
+	.disable_z10 = true,
 	.optimize_edp_link_rate = true,
 	.enable_sw_cntl_psr = true,
 	.apply_vendor_specific_lttpr_wa = true,
-- 
2.32.0

