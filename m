Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C23478FE8
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Dec 2021 16:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725B710E416;
	Fri, 17 Dec 2021 15:31:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D702E10E3ED
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Dec 2021 15:31:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERVe/I20fdbk2bhq5pxXlko2iKWX4M6Jqbv4OCPRllGCxiGxBwI7z2YG0KAOUjfGV3EmcVN80dn02O8HfFLrIvwhHAuCTNfVtPmAH4Zjjddlx7Xi7loEraqyEwHS1cX4SV1utpRt9ycW9nmHqc+9KUXY87g/w6d1Bq3dTeehUJJTtALl2Is8xcsTWiIUO+GRcTT5CsErECNsmBSwHPOkFCHtkuHzLGt0D0EsgklSVBoYf40T/GsZ/l1+YYrb3gNmXkDoYoIx7aLL/jnQs8JhXcjmg7/GvSQEtzIarRr9zD6mnqYPYBsy0O5cvj1vfmZKSIuF/KTnvpHLExXscEupEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNvBVTwgIV/RzgvBtwcasApqIFilSldIZMmHRuzHAbA=;
 b=J1M4qmIdnUlA/XK4MGW5UQpCrewI92kwhfI3reFn3APtak3dY639t3Zg30AobAL+FtneHt4Y4UsHm+dWfjwT4Qwfv2lotJwenr+hUb7mvTyMCb7F7pu0nbQf7kO5+BWyd4qynFYWrNQ+qoYIq1oTq5SYC3l4v44D1cBWQmjuqgqZw3yLCfpZnjidAtO+3auE725Mf95OvKhingT6NtpOC8SY+FVfy6kGH4KfrD1+Ju+ZI5HUg9hpSnBB/SIaTzaF6NIOhjAg7HT4SHThm+glsjZgODrY011/9HsOzHQ3A0TYyJTGLRHpN+sRIYp+vxNNa/vDJ2yzHnenNRSkCw2Q/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNvBVTwgIV/RzgvBtwcasApqIFilSldIZMmHRuzHAbA=;
 b=V6mCtKehr/l6uQBNN3+7bszEvNZXQe7JpQTCk/usVTMIG2H5ZMGVNLfvASjQv/9cbMXr5E2y4CHoUs9Mqf62CoiHcYH9h5xOWTIa0STAk2VLzgqvzCHSR2XQjbDsDgHCqldlsYNaCMvs7E1z4leDaskZkQ1zRAAQ3+lU7FhIug8=
Received: from DM5PR11CA0012.namprd11.prod.outlook.com (2603:10b6:3:115::22)
 by CO6PR12MB5476.namprd12.prod.outlook.com (2603:10b6:303:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 15:31:45 +0000
Received: from DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:115:cafe::14) by DM5PR11CA0012.outlook.office365.com
 (2603:10b6:3:115::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15 via Frontend
 Transport; Fri, 17 Dec 2021 15:31:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT022.mail.protection.outlook.com (10.13.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Fri, 17 Dec 2021 15:31:45 +0000
Received: from krussell.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 17 Dec
 2021 09:31:44 -0600
From: Kent Russell <kent.russell@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amdgpu: Enable unique_id for Aldebaran
Date: Fri, 17 Dec 2021 10:31:29 -0500
Message-ID: <20211217153131.321226-2-kent.russell@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217153131.321226-1-kent.russell@amd.com>
References: <20211217153131.321226-1-kent.russell@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 952c7f41-6fa2-435b-0ca2-08d9c172556f
X-MS-TrafficTypeDiagnostic: CO6PR12MB5476:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB5476A2633B22AA61DA2D6BC785789@CO6PR12MB5476.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3JboidHJSuCzCSPVkbizd70tT+HjsI1cekbRa0JrB6kJq3uT+S1yxDCp+ejEQYA1CvXa4A4IHEXR7W+iR5IkqljgtA+gUsYNttFjisee/UlyOlJM8oJe2ykqqyzKhUoVxmkqwqNfMU5ygMOfgYL/C2JwqZbJhKlD+BwP/2sHku6m+wiL4cKU5V3YCNplfgIegNV2WdjaCQVFTcHb9CxHJMe7Uksf9EyA4oA5inrbbR9OPmsKNAZVhPyimS8nnmKCVTnaw07B+J18si2PYnSYg5Uxos0JRfZAf4lJoZAs/YxO6PWHDoHpB3TMx3Ytft4OoT9Jl4TUBjULd5rtaSq8w+eymiaxAmAuuuK9yx9V6TdXJ6e8p9ldQGhsoLCwXG3TfvsYIhvyDFlHeKGa0k80xX2wBaOG3T+UlMcQS88wT6IX7TJLFciTvX5lm2QK4MFKZkCnfYKlVWlOLtAgdnjxZWiCokFOndYSp3BfcHxURRi8BjNXXS1G5Tns9zPUVar4xyT93fApwW6tqcPbCyiDSMUUPaIuJ0aKhRXwUydV1wcUSI+ikihKseXhZJx3HZsN1VR1yvpU+Au/GJLtTWj0uorznBYVC7bfRZb4Ema6Od1IxvSi7jYytNUN7SCzhD7v/bl5q4AuwApb3TiAx7W3I7+0KDUGuhUjBXzjF+B6lUKKP6SvXZrf+cyAx55KzC1X9HE+pGqqJOAjOU7uR0k1hL4ag3X35RhECHvEEm60OjZ092xBKQTMx8xzzXb5NocmlXJWNsTgqWTRzOgs4HfC9A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(2906002)(426003)(8936002)(8676002)(5660300002)(316002)(6916009)(4326008)(6666004)(82310400004)(40460700001)(336012)(44832011)(508600001)(16526019)(186003)(4744005)(86362001)(83380400001)(26005)(81166007)(36860700001)(36756003)(7696005)(1076003)(47076005)(356005)(2616005)(70206006)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 15:31:45.2628 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 952c7f41-6fa2-435b-0ca2-08d9c172556f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5476
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
Cc: Kent Russell <kent.russell@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

It's supported, so support the unique_id sysfs file

Signed-off-by: Kent Russell <kent.russell@amd.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 082539c70fd4..dfefb147ac2c 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -2090,7 +2090,8 @@ static int default_attr_update(struct amdgpu_device *adev, struct amdgpu_device_
 	} else if (DEVICE_ATTR_IS(unique_id)) {
 		if (asic_type != CHIP_VEGA10 &&
 		    asic_type != CHIP_VEGA20 &&
-		    asic_type != CHIP_ARCTURUS)
+		    asic_type != CHIP_ARCTURUS &&
+		    asic_type != CHIP_ALDEBARAN)
 			*states = ATTR_STATE_UNSUPPORTED;
 	} else if (DEVICE_ATTR_IS(pp_features)) {
 		if (adev->flags & AMD_IS_APU || asic_type < CHIP_VEGA10)
-- 
2.25.1

