Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 926AD6E4ED5
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Apr 2023 19:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8424F10E575;
	Mon, 17 Apr 2023 17:09:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692AD10E07C
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Apr 2023 17:09:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=er/KOHCEf9xXWuKNEib+oB5jeyGooC4tSLzOrF493tHBQeq3TfDNB69DIxy/UhbWr6X1p9qEO+9B7Nyo17koVxN4q7KlcguyN6+5z2jaQlJMLXNTcYy5uPrpTd/c2Mw/JIGw0OSHnQUoh2IjuP4UTLbYchSQPL3aavDob2rhCRs0ZacHcvvNqt5EVgoz6wMq8cyyiu0Tt9aB12/1qX+0QWRH7iDfw6rTDPRfGg59qerBB5LrfQplCtK02WeGSxKokaBxZEv0uSlWOGO0XhMgW/zEn5tiKI9zAiqBH2Xadtelp5rl+l/QWIuWxRjTZ3h1RVeYlMs3+0J58IrO1khVOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6t4tMFSfRRD1WL/b233hp/sCsSRnHbQDWBfDQrl1eQ=;
 b=G1iBK19Zbku10shnCfcQVK5n9JGcS0zReDGyI3rSUrJrHXTTJ5uSUgF3/0jrcv9WMaKaa1U/BiNlmx6yg63WhactCK8sdbqtuVr0kjy0OkXHJGKljs4JOiptawowL693gCLS9X2ImTl3Vb9MLuxt4rCBMebJIr9ANMhkMzTB4JzkO3TC8AWN/WSpo+J8jNXR0M7s/9Y1E4obb8Fo94w24fI2tZDwlLHd7rKfLTZyDyXfkAEkHqNB/UNkLnXB9pDscRwHfci3fhz+W00s1uJFoRBKZ/uHDW+cv2nkwqwBh7pMUgKZseKQL0YknE7Glt8Zork7YBu4g7VvCfsmPCTc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6t4tMFSfRRD1WL/b233hp/sCsSRnHbQDWBfDQrl1eQ=;
 b=RZcFPhulJoPjDv0pvPzLw7/ZmDbenBzrq/JZjBs//aAhTJl7e+BpiQelTdUeVlASDf7XZmGdzizLr6b/981samGPh5LYDO5aBZsQOArMdXv+2Vav/qjFDbtMVvI2rI4jlwMuwhEmBGCWRlwZbXM7Q8BqQWByEPZ8vrGRhqRHDko=
Received: from BN9PR03CA0353.namprd03.prod.outlook.com (2603:10b6:408:f6::28)
 by DS0PR12MB7803.namprd12.prod.outlook.com (2603:10b6:8:144::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 17:08:59 +0000
Received: from BN8NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::a7) by BN9PR03CA0353.outlook.office365.com
 (2603:10b6:408:f6::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 17:08:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT092.mail.protection.outlook.com (10.13.176.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.20 via Frontend Transport; Mon, 17 Apr 2023 17:08:59 +0000
Received: from TRX40-1.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 12:08:57 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, Fangzhi Zuo
 <Jerry.Zuo@amd.com>
Subject: [PATCH] drm/amd/display: Unconditionally print when DP sink power
 state fails
Date: Mon, 17 Apr 2023 22:38:44 +0530
Message-ID: <20230417170844.3836427-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT092:EE_|DS0PR12MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: 10d1682e-14f3-4dc4-0806-08db3f666f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EbEoBqe8wkDHeTfvn4V8/42H/N22yV5+vgrfhn9KCQlRZ7NZjUJj8BIRbmT78/4zr8GVYbaDFJT5i0vpO+fOy5vNR6Q3LhQ17Lnz6dSPTuuO1L5kjRQZ+0wpd7VSxXAVa1PaMYX7DIIEQUsNpGOhtZN9L2pI1jKiO1lP+qToBm9mPiOwqeYH6pMfy6p9PfMqbVea2Bc+QG4jm4wcaB5IStnxr7+RhSHKLI4xboejxzDiTJWq3dsgdBXOFgGsMeJ2XoJXKfO+3RdW95Cl/xLXBiSWT24ODJsah5w+jPe/EgaFwI7jpED3e75zdXe9McbhSd5SEOpPeAYtik3WGKFTC4MNPmr3ejxkbMsluZFxvAHjqTiM4Iez+T6ut+LghWSibQeMYREqk+FYKiD/gpVfqmnKttvc2bq6P+rTXXQ69zlhGkCGJ4Nyz3LEfLxe8hYf2aX2QmoWpcyFhB80Laq6CItRxVO11DlNtzLryMy7KcEEQ/SAssxefFpkfFaIY4VDE/36SVfEMmDe4mBfAJ2gWEt4SH0UWk1F+NR/+Vy0oevfZM4czOleCGJyAKA1NHnUePZfYas12nsPcoAONnmFJiZHff2uc5i83bPauNFk6SFFQ4VGOWmNl23w+6naEfjipwWYwjUjj6NhAylgtb4R6nZCBjjrAUavemKlPWFrmhzoDBuPISxz6MkTRCZziu3tJvz1PhFeMVvfjjqVxLlQV98VE59mmB0g2kRacGmLhzA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(54906003)(6636002)(110136005)(2616005)(26005)(1076003)(478600001)(82740400003)(70586007)(70206006)(47076005)(316002)(83380400001)(7696005)(6666004)(186003)(16526019)(336012)(426003)(4326008)(356005)(41300700001)(8936002)(8676002)(2906002)(5660300002)(81166007)(36756003)(44832011)(82310400005)(40460700003)(40480700001)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 17:08:59.3668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d1682e-14f3-4dc4-0806-08db3f666f90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7803
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
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The previous 'commit 9360c01646d4e ("drm/amd/display: Add logging when
setting DP sink power state fails")', it is better to unconditionally
print "failed to power up sink", because we are returning
DC_ERROR_UNEXPECTED.

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 .../drm/amd/display/dc/link/protocols/link_dp_capability.c    | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index 59adc61156cb..2914fca7dab3 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -1043,9 +1043,7 @@ static enum dc_status wake_up_aux_channel(struct dc_link *link)
 				DP_SET_POWER,
 				&dpcd_power_state,
 				sizeof(dpcd_power_state));
-		if (status < 0)
-			DC_LOG_DC("%s: Failed to power up sink: %s\n", __func__,
-				  dpcd_power_state == DP_SET_POWER_D0 ? "D0" : "D3");
+		DC_LOG_DC("%s: Failed to power up sink\n", __func__);
 		return DC_ERROR_UNEXPECTED;
 	}
 
-- 
2.25.1

