Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 422FD51524A
	for <lists+amd-gfx@lfdr.de>; Fri, 29 Apr 2022 19:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE7F10EEE9;
	Fri, 29 Apr 2022 17:32:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AAD10EEE6
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 Apr 2022 17:32:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibAq6qkv/gPYGGypBS6e8otvqAcfPV2lyBh1uRZwIGk2Fmbn6jPu4DyLVFrnSRxh07jBysFhMjqGyjplu6FIEBhbHwXWjDUvjtuloGf2pPruVNsThv3CmSB0DVLyykRMcfKwYdTzLhuED3uXwWA4PY/Brrqeg/cuVtEzcJ73zChKAPdDVHpjxqFLOGl06MLQUxH/V6syqCO5r3JuOg2af2SzwVNJULY9smR4rDy6I5FVqtUK0Ynv74fCf/NwTP/A20bFK8kCJaB00+huVCaezwy7VtN8842da1I3dpYYcaVDAdxjokxxTMWmajyeJvF6IUjqUSpxQnDCYoBcLCj2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLIao+qItC0+binohGAzUaj5j74VlQGcyZh2n/aCdek=;
 b=Hr6l1YqFv8coYuHLDxAU7x3ekQ7lVp24BiYmoIVM/5UTDW4+onFsT0+LkLrn7v9aAMpaLu7dcvh/CFdM/eTlBaO/vAdBI1OYHo4S5KVbDk1igwvyHOirfxsH7SyfJoxgSnOKsv9I5+1S+onTJlfH5jFUGDXT/a9k+qxOYuxKq/fax57ltnGup3mBXWuet8Zpdq3AMIm350+pj+p6bZsV7NXJ9sU0eqxXjIplkLCI0J+qsBy9WicudedYAd8gYfjCQ4J0LbHpBJ68QEEZvaLf7w4B60lfBKJTraVMdBefBjbVYLHU2EWJCunr7nXkx6hevZDZOKwNWa7OkvP1U20rpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLIao+qItC0+binohGAzUaj5j74VlQGcyZh2n/aCdek=;
 b=2Mp8m6dMumhXpG/fucMPpNRwG0z4B5Zxgfsp5BPbq7rdyGcVfVoanzs9DT93YBp4mWYsFaf8iqFWKRE1CuSo6WJqLdDHpAR2Fvg9msU/wuYAp36SKVkGw1S2yYchx17zMqjShHZk+GtPo7sgZDvamBr+7X3BodO48xSf9a8POXI=
Received: from MW4PR03CA0305.namprd03.prod.outlook.com (2603:10b6:303:dd::10)
 by MW2PR12MB2588.namprd12.prod.outlook.com (2603:10b6:907:a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Fri, 29 Apr
 2022 17:32:34 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::b6) by MW4PR03CA0305.outlook.office365.com
 (2603:10b6:303:dd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Fri, 29 Apr 2022 17:32:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Fri, 29 Apr 2022 17:32:33 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 29 Apr
 2022 12:32:32 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: add GC v11_0_0 family id
Date: Fri, 29 Apr 2022 13:32:17 -0400
Message-ID: <20220429173218.433113-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae603a82-1360-4ccd-3ba4-08da2a063eb8
X-MS-TrafficTypeDiagnostic: MW2PR12MB2588:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2588471028A6AB5C4D4DD8D4F7FC9@MW2PR12MB2588.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AG7kCWtHB5l2gMOGUEqwj7mqPl1jXlPtilE4o+AULh4xVFFAqBYlIn+S6S9VIxJxjpplv+GxyZyUI/lyhsvWwjDRMt7FapxYhLR3e3y/j5bC9fFN3TEMkG4Rml7xNTaT33MkMgVbc71igswVd1O3biCWlPjr5zLwqoRbV/JSQNX6v0rGixx95yCwcJDvlB7Kl+jiRBwdWh5uQeqI/Y7m7mQX67sbshEfL4e76D7Ipv8fPkpOh9PnYEDncuZOdz90cczdbeh6c1ecHZLbtmv2+a1C/MHO/yOYUQSa1Svv4gVHxj7Ec3ZDJv7g4Z5aXLKt3P/cmHYsoipWOzcpHE6FC2Qkg15yUXuN50ot/7JFkUTGzoyycQqnFkqrgY0RlRaM6mqvSzqGOUYP8HdiocMio9PTmVaJNWz4z/y+T8B+f9/wPJBHNag0gL/2KmFB+lCUB7h/3TrgEKXOYeIRoYUsjJQQDj+QfqPRna4Zs/aLFJlyiCEHa2Y/Sud7ixJA1/jw67bOxNx1AVgXuUx1M8oqKcCrztVu4IbwcOcGB342GTcFJQ6J+f+U1eUcHRqz4HT6VorZbgm0dg0CJUtkc2mJnAaW18x2owPGUG+QDoKcBZyYtgkaYiOmjyqBSmumVXNZtiTZ0GF5wujA2IaLc7cBQSSQSjCOYWYDyk3AzpjzY4GdnRvzxY49w7xUDzgeF40NuHOvzFvWBfHui2XXtTchMQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2906002)(7696005)(2616005)(6666004)(36756003)(4326008)(8676002)(82310400005)(1076003)(54906003)(6916009)(70206006)(70586007)(81166007)(316002)(336012)(5660300002)(426003)(8936002)(508600001)(4744005)(40460700003)(86362001)(26005)(16526019)(36860700001)(186003)(356005)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 17:32:33.4903 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae603a82-1360-4ccd-3ba4-08da2a063eb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2588
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Hawking Zhang <Hawking.Zhang@amd.com>

Add GC v11_0_0 family id

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Likun Gao <Likun.Gao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 include/uapi/drm/amdgpu_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 1d65c1fbc4ec..992851219441 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -1150,6 +1150,7 @@ struct drm_amdgpu_info_video_caps {
 #define AMDGPU_FAMILY_RV			142 /* Raven */
 #define AMDGPU_FAMILY_NV			143 /* Navi10 */
 #define AMDGPU_FAMILY_VGH			144 /* Van Gogh */
+#define AMDGPU_FAMILY_GC_11_0_0			145 /* GC 11.0.0 */
 #define AMDGPU_FAMILY_YC			146 /* Yellow Carp */
 #define AMDGPU_FAMILY_GC_10_3_6			149 /* GC 10.3.6 */
 #define AMDGPU_FAMILY_GC_10_3_7			151 /* GC 10.3.7 */
-- 
2.35.1

