Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FD051CA1B
	for <lists+amd-gfx@lfdr.de>; Thu,  5 May 2022 22:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9589610E8B8;
	Thu,  5 May 2022 20:08:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2D710E7E7
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 May 2022 20:08:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lt3qAe3tq7uk40wK1bnXqB5tymR9zEfBTIc29LtRwiNJS2nehJXkU46pUKDxcSgmh7OUtby+qKWrIpCvFIC1nbXYBPUZkJ168PgRESgYlnWgHpyMPotLwO5dbZMQlKkxc2RjZw+30L6RuvC0yGsgM8gNmO0IESToHGYLahEDgLQPhQmRvkRsiMYs/HwCimaqEsLf3DGLRd/4tYyGhZR183FexYCLC2qhKVADVaBJpbNShyoqu+E/pNCbrcQ5fxehTa1c1Xhrm9InmDo9zu/6E7mCjn1Cpwlu9xNsZDOQaC+3G5+g0OOHZHpAE+ZDNvTXHeGvd3/ixJ/wZgwS8RXcpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGYPfNpIIgo4443AWvG4pfhNlYNLpBM8bsyFCvX9JRE=;
 b=KnBRti2Lmaj8egucXvzg5I/yRlIUVdBErqIBr5zxyFA4Toa9rgzAVJVr1lzO5RwyRTPJFFuT/RWZ4nDm1bFX+Ur+7hoGRYPcN4QcIomFs88ey+BYvQQfn7Pa68Gmqh/CdyN3znslS6FurY3kYgFe5sPM38ajvzcCuTLSTtAut72iAXEfQYmI6MC24jyY/KcF+Wz3rre+/PAN283VbtgrWfwMe/7GsVkRf+HWnQvI76VucmnCmyL2bdg1T8b/uT/SfdoSBje9bVfEIEIYlFw1kY88s4h1Had25e2lhHLwVjkWc2sQYGJu/hanT0i48me2QYgWEWhRXJoKOTFJSQJstw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGYPfNpIIgo4443AWvG4pfhNlYNLpBM8bsyFCvX9JRE=;
 b=Duu8AIt2i8BEeq5jeBWQx3A0oyaHrneSFg1HaK7kaUu40wdD4PLzISkFDLVMuRyfA3m7hOQMuHLmEWXCVHD5Gen546mFE/RBb8HAyB/JraTNNaAXAiyy4ipQA9FFRMPJGmYHZETgefyFg2qGPEqa0A2eXeQjhMn3xUn95fPUyTY=
Received: from DM6PR06CA0061.namprd06.prod.outlook.com (2603:10b6:5:54::38) by
 DM5PR1201MB0058.namprd12.prod.outlook.com (2603:10b6:4:50::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.13; Thu, 5 May 2022 20:08:37 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::38) by DM6PR06CA0061.outlook.office365.com
 (2603:10b6:5:54::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Thu, 5 May 2022 20:08:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 20:08:36 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 5 May
 2022 15:08:32 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/pm: disable ac/dc on smu_v13_0_7
Date: Thu, 5 May 2022 16:07:45 -0400
Message-ID: <20220505200750.1293725-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505200750.1293725-1-alexander.deucher@amd.com>
References: <20220505200750.1293725-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d09d5c2-7010-4a5a-2004-08da2ed30a35
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0058:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0058242A9BDCD4C88EED5CB7F7C29@DM5PR1201MB0058.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J3qZ4vcYo+0m9sE5ad0n2X/A8U2gKl/jcV3xVkFDODIlVbVhI3UkUiDchOzkKalP1+IHkWEV92B4csvmndn08ShqEWjlSX/tAQdFHnqjhGu0l7y3H3zJbOLGSH6uWPd8Bcxmry55g+LtOFTAuZSnXcPp0+OFM2SDEAyqEbMb6aF1zfzmy3TBu6j+D+Ds6cuDcvo/A935rlUkUcPwRnMTR84k6XKCOiMG2wTX6U5VKeK9XGwb8j0xM7K5pF0vzHq0dsoWyvl6dswNaSBhstI8CHfdqbm0oj/HO7KwvysATDEvfxOufrXaC8w8Xo9uN73G/oKMYLCq4LKU6P9lyXzkJCcGNu/LYLk0KyzKCWJ6KwTIk4hR3dkKTsvP3yimQq9S0QUvF0Hr6PRDJGp+gu8Jqvu1rQH3jPayseOEEwDtuDoD0GETZW+iuLSnj2QzNoYYrMYoTxEzKsPF/5SWXxwb2/E40oKchhYkw16Y4mhjyC+/xS8auEtIgMUCj8fumMD4sKRi00/cpv0e67IBARzPaP/ASek4VAP/PYCswv5hW6Of6R7gYOXmOgaclJLp1V1TMpyK/rtA0M2xpBrA4V101I1tCFwz5s7xlOjTUKFFSvbdRBqZqqePZIX+vFAmrsmpVbb3i670AqiFBRCoW/QGhsFuUtUvC+s/cyM6BP0BWEBLN5VaCZOmIxNYXnzzwIGwTBUnT2d9VIORNVkNtC06IA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(86362001)(2616005)(4326008)(8676002)(2906002)(81166007)(6666004)(40460700003)(426003)(356005)(8936002)(508600001)(7696005)(83380400001)(26005)(5660300002)(36860700001)(1076003)(6916009)(54906003)(316002)(16526019)(186003)(36756003)(70586007)(70206006)(47076005)(82310400005)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 20:08:36.9483 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d09d5c2-7010-4a5a-2004-08da2ed30a35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0058
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Kenneth Feng <kenneth.feng@amd.com>

temporarily disable ac/dc on smu_v13_0_7 due to the force clock issue.

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
Acked-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
index 8e576054bee5..92e606a72a85 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -226,7 +226,6 @@ smu_v13_0_7_get_allowed_feature_mask(struct smu_context *smu,
 	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DS_FCLK_BIT);
 	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DF_CSTATE_BIT);
 	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_THROTTLERS_BIT);
-	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_ACDC_BIT);
 	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_VR0HOT_BIT);
 	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_FW_CTF_BIT);
 	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_FAN_CONTROL_BIT);
-- 
2.35.1

