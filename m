Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8571E732D77
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Jun 2023 12:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E198010E151;
	Fri, 16 Jun 2023 10:24:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C5610E151
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Jun 2023 10:24:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdEh0HDk9jUj8D97Q+VdzwXrezt/0UNJSsz2NwS10a5Q5ghqfKtXr9H6HbEv4RR/hoqbrEWIrxWZNlymFaQ+XGZV9kRbTSgQRXUGrSrgiXG8sIbEd8lVbZp0cmaet/c7d95VExdnVaKTtHXkZYzk2bcXLFSPNk8eq2skwQiIBa7KtevYlXVW49SO/c9cNY+IazxfuySDHdrMI4hPcE2bnXT33il8mpmu/hnRB6SY1sJnMF8Wmwn2GhTb03NJgAimYYQe7pmfvgVr9Fa3EZ/jBx65a1fvRvRAOdod+HBm8UYUSeItVyxQ/pEK1tSSqy08dOJfqETXj3Zs3abA8/NQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aPGhEJCtfuy7z6XeluFwzE1XDJOvexM9+D2XfwHHKo=;
 b=MTs69ZgbZOVYoPRlKYBYKAKWpOodadPgLi8oh2uqmkqrq2RBIb2ZbsD0Znp0UuycK1DrzyXXrkt7k2WeprHEVs0sqGgkqESGFqJBxBfVcIe6gfg2MqNHR34N4/1sy9+PiRKeZotP09p3rPW4LQQ8jNU048FcCDKd5cDuawTILmgeHrV/n1XusnYm/gqSg3vmIqmD8JoI+NL1PJzEslP7XK3vNIOyLn+BsZL/AeNrQvpw9WwYLKqycA0gob7yie/mqvY6j44AU7/Pbv0FnFCMzNuAAfU0S2UjwAVFFnZQetCSiJDXtbyGjq8xS+MJmORgemCYWrcvdagkf4SOey7cVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aPGhEJCtfuy7z6XeluFwzE1XDJOvexM9+D2XfwHHKo=;
 b=LHYruy9OVqJ+NSq6BEhh4MEp6PEZoavfdowzjAECi49/D03+bDwLz5aoXKSLDOm+LAYoEjGeaD5fXBa9jsmVuol/ppoUZJpTRlGuouy9m7JBA7Z4SNihxmDgnWFz5Y5IoNc88sr2j9Kkphht61HifhprISkFIVZczVY7k+e3hqo=
Received: from DS7P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::15) by
 DM6PR12MB4577.namprd12.prod.outlook.com (2603:10b6:5:2aa::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.27; Fri, 16 Jun 2023 10:23:57 +0000
Received: from DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::93) by DS7P222CA0012.outlook.office365.com
 (2603:10b6:8:2e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.41 via Frontend
 Transport; Fri, 16 Jun 2023 10:23:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT102.mail.protection.outlook.com (10.13.173.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.29 via Frontend Transport; Fri, 16 Jun 2023 10:23:57 +0000
Received: from mlse-blrlinux-ll.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 16 Jun
 2023 05:23:54 -0500
From: Lijo Lazar <lijo.lazar@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Modify for_each_inst macro
Date: Fri, 16 Jun 2023 15:53:40 +0530
Message-ID: <20230616102340.1665822-1-lijo.lazar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT102:EE_|DM6PR12MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d93843-8469-40d4-c8cd-08db6e53cb40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eKZaq+ZS/YmEbpSgThIg6/JGLbNO0UW1qt4xeP8xEYgm2kpHyHEnACdrRTjL3yluHDmzVjeJERswSia9Bg9fXKlgyM1+1pNh0/+8rWt8tWGOfoS5j3LULnYi15iwDiDvD2Jy+pJzUjKfvFKELXY/PBmXq7eGZmv8NIrpCze7njWGlvxoRK7aLfMrJxEW0pbPQZ9j8V1Oo8p/mgYTNXbreKgFd1nK6OLN7OObQphTkqteQ6/r1VOJs8Xuuf5noBvzaimoo9a9+7j8mvrnYT4xaEih4LCtWtJMfFe4FdkD3COL/DPPb5e3jk1rwOFFk5NbKf8GKOTQroWIGD3cVLmbGvARPOrsmls/F4Y/q6LYcT3mNp0TRuH+rhrplNjZSKP698brDp2hJ8R+5KGjsWIqrQ8ZQVaGXGdl0OtRihPpwBT2wZw8FXnKhTMR6RhW3MVmjnXq3CYqGVTxkZcOPcbEbE4VP39N7Ila4UH1iDtfiBVhKEXwPNaiTg7f/0m4K9mvSiLcJxYoZDgrmAMmxRPHXtskzSelo0acwwsjGPvQpwhT5r07kSEY77U90E6sXvRQTsBEMnxpVs4ncAiR2Pbr6qzxHhEqiGvoVjxKaIJVAVmnWxewTuESGoNwW5N52cQVFrvzIal5aek2tf5A5Vtwfpdt/O+7pvtFXjp8smG+BDQM4W1jJ5N8YU3kRIx7+gG7F5mh8ldqS1zj/wdnYpgH0RpqoYeq8o1w4bemo23nQD4gVR/OoZ7gx9BQ5ozK5EIyp2juTexqZ1EmhkocX76o7A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199021)(36840700001)(40470700004)(46966006)(36756003)(82310400005)(86362001)(478600001)(8676002)(7696005)(8936002)(41300700001)(81166007)(82740400003)(4326008)(54906003)(6666004)(316002)(5660300002)(44832011)(1076003)(4744005)(16526019)(186003)(26005)(2906002)(36860700001)(2616005)(47076005)(40480700001)(356005)(6916009)(70586007)(70206006)(426003)(83380400001)(40460700003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 10:23:57.3637 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d93843-8469-40d4-c8cd-08db6e53cb40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4577
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
Cc: Alexander.Deucher@amd.com, Le.Ma@amd.com, Asad.Kamal@amd.com,
 Hawking.Zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Modify it such that it doesn't change the instance mask parameter.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index f4029c13a9be..c5451a9b0ee4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1295,9 +1295,9 @@ int emu_soc_asic_init(struct amdgpu_device *adev);
 
 #define amdgpu_inc_vram_lost(adev) atomic_inc(&((adev)->vram_lost_counter));
 
-#define for_each_inst(i, inst_mask)                                            \
-	for (i = ffs(inst_mask) - 1; inst_mask;                                \
-	     inst_mask &= ~(1U << i), i = ffs(inst_mask) - 1)
+#define for_each_inst(i, inst_mask)        \
+	for (i = ffs(inst_mask); i-- != 0; \
+	     i = ffs((inst_mask & (~0U << (i + 1)))))
 
 #define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
 
-- 
2.25.1

