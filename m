Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB656C187
	for <lists+amd-gfx@lfdr.de>; Sat,  9 Jul 2022 00:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C6010ED70;
	Fri,  8 Jul 2022 22:09:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2058.outbound.protection.outlook.com [40.107.100.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB2A10ED71
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 Jul 2022 22:09:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjjcGp6pWhOL61Y49GG5FV0gYD4HHWeBxId01bs4EXI43LbgzEcBgPPJkww671y6gUm2p5KHh/rm3zRkZoUpH3pMm2OFLvc8Bm2vMuWDgX8KIM6BziHJimY5l2w7JCjkpVYgE9M1FTEB9SjkaV1iI3/Ns0sCrzjDzAImvxgRSTWc4kmXIbvIgkn6vUjbNV1yO1gS6SA5T041Az1yOSppyK/NkT3f/mHA+y/kQIE8Gj5aq4iwhQzPCd16C2zMi3vaaFuLcYMoWeFhyGWwK4jRvCLmfctmC/KFMFg2eTSgrFsresI98w56a2dtMQuLwFWrBQSHd1ww2w7Ka2/ZXhGA5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ab/OUhr7j7ULccJvb+95tdGrn4SaSWNvpficqsqzuw=;
 b=X9E1qtcdysRycT/T2TtyTTiQSSy6KBz1wnBYlvrJV8VCvDKz43nitWYm2jXPYBJRuRFN2bVSpIbHsfRDc0DFkzLp/4GvzFHbTAtE+8kh4Hr1Zgfi4+yuU3s6JUORU8YRwA7CJfOY1YMptTa4jMj0qVcJoTdTBmBcJlRohQ0eweRoF7mUWCPH0qBjMpp72GvFMWcd1q9al5xbVoRlKJ1gDdz6R8jmq6g2eSQNxUNg1fXGp1E2xxonNQGAB8MnpBM+NaLxWL3ihARhbCzl7fZ4+055hfDjGRvwYJd+bKrvpCM2sUo6EtsZbKPox+DVR9Ow2S0AZgieTuAUAUNJI+CWZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ab/OUhr7j7ULccJvb+95tdGrn4SaSWNvpficqsqzuw=;
 b=j72zB25dZkjkJKG/VGFnMylv3sDimNF6ThSf6MmfXcgNzcIr6xo3ItHADAFRMOoVcbFlHKyayJL5r0whzU5Ub8ol/20fUwwQ09TEXJNuZl0jiXBCSsnvXvRWVLZsYi17cMnjFPs2cBesb/lUlvc+PkY2tFbudVAEJUBTeLcCkUM=
Received: from DM6PR05CA0055.namprd05.prod.outlook.com (2603:10b6:5:335::24)
 by DM6PR12MB4651.namprd12.prod.outlook.com (2603:10b6:5:1f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 8 Jul
 2022 22:09:13 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::4d) by DM6PR05CA0055.outlook.office365.com
 (2603:10b6:5:335::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.5 via Frontend
 Transport; Fri, 8 Jul 2022 22:09:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 22:09:13 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 8 Jul
 2022 17:09:12 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 6/9] drm/amd/display: Add DCN314 version identifiers
Date: Fri, 8 Jul 2022 18:08:52 -0400
Message-ID: <20220708220855.1475213-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220708220855.1475213-1-alexander.deucher@amd.com>
References: <20220708220855.1475213-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74e156c4-b649-416a-eea7-08da612e7e24
X-MS-TrafficTypeDiagnostic: DM6PR12MB4651:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 92V2b4KVMT8pPJPxaZLxn1s/EJ9YgJzc9V5mMId8TaxzVvvB9F+XmdGNRKXE0KuL9uCwPaMuC+QGfgCVy10207+UPEkadBPUltrXJ7UvW5sde6VSRiEMy4uk+BKpVEpVx3QINRwN6YBfEdB8vNubgrEn6Z2A1kR6i/zC9PAG7NviutO+0xXfBFQmMVtWVmzQyHXJqx2Hw2eo+/eNisgl+qvHa5J6282n0L1zCf8CaGBDqKnuofnLSt69ox3xpdRw/W6OXUuiZL4ZY+ahBt3V/rBn4tivnpYzVKE4MncAi+Ya5KdtH4sgtjBHSxKZd5zEJLM7cAElXJEg411sUynnXGbccIQ4FNK7JqogfWwExJJ7kDYD6C4PsGqHLhOjn1OUn0gxMYIJGydX7SdYUsXxIdPHlB537bFqWnNFQSkyEAYXgzmWfir32bVZusROmirZmqk/8dfQ2DY19gI1mLxxRUwWH5VWNRckHyPaZ0cuIPBXDmz5oyvY7NsF86alKpb1EGXveLp7/lXvknY0GRIPJeVZ8T+zoF2eioW5koAApxZt2FUU6gGaVtczp9dg/9p11qB5lp02ga+pOetcNTdDK03Yu8QzS8S/rQU0GCjQrMIgZgH+2CTXZm6pz9MiFl8dPSpgOHzvojTzx+iQm8z+4NuyzeAJvkqSuMiTJKVvT38ZjzE8cbAeTOzXpPw6yr5kE59YTjYLqwWyugGYjFg0s4yOsuCaCL85EqGP1Qpnudkx3eq5OFp4nozn7rpUYVOat9YbExhaeNNF+zC2a2ycJnShIveAeE3wsLdSGxLW4ehvS7YIKXUFY7TGUpfAFAoC/X7vyM2YlJb38KX/JShBuIGFelarg4hnX5xSBEGAxppifQl2VRhUK9w898BfSPe2
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966006)(36840700001)(40470700004)(356005)(82740400003)(36860700001)(426003)(47076005)(316002)(82310400005)(6916009)(86362001)(8936002)(5660300002)(336012)(54906003)(81166007)(40480700001)(8676002)(4326008)(26005)(70586007)(40460700003)(41300700001)(34020700004)(7696005)(2616005)(478600001)(2906002)(186003)(6666004)(36756003)(16526019)(1076003)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 22:09:13.7992 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e156c4-b649-416a-eea7-08da612e7e24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4651
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Roman Li <roman.li@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Roman Li <roman.li@amd.com>

DCN 3.1.4 version and family ids

Signed-off-by: Roman Li <roman.li@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h       | 1 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h | 1 +
 drivers/gpu/drm/amd/display/include/dal_types.h   | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
index 04049dc5d9df..ced176d17bae 100644
--- a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
@@ -98,6 +98,7 @@ enum dmub_asic {
 	DMUB_ASIC_DCN303,
 	DMUB_ASIC_DCN31,
 	DMUB_ASIC_DCN31B,
+	DMUB_ASIC_DCN314,
 	DMUB_ASIC_DCN315,
 	DMUB_ASIC_DCN316,
 	DMUB_ASIC_DCN32,
diff --git a/drivers/gpu/drm/amd/display/include/dal_asic_id.h b/drivers/gpu/drm/amd/display/include/dal_asic_id.h
index a0dffe30b394..ab06c7fc7452 100644
--- a/drivers/gpu/drm/amd/display/include/dal_asic_id.h
+++ b/drivers/gpu/drm/amd/display/include/dal_asic_id.h
@@ -244,6 +244,7 @@ enum {
 #define ASICREV_IS_GC_10_3_7(eChipRev) ((eChipRev >= GC_10_3_7_A0) && (eChipRev < GC_10_3_7_UNKNOWN))
 
 #define AMDGPU_FAMILY_GC_11_0_0 145
+#define AMDGPU_FAMILY_GC_11_0_2 148
 #define GC_11_0_0_A0 0x1
 #define GC_11_0_2_A0 0x10
 #define GC_11_UNKNOWN 0xFF
diff --git a/drivers/gpu/drm/amd/display/include/dal_types.h b/drivers/gpu/drm/amd/display/include/dal_types.h
index 775c640fc820..d2427cf1155f 100644
--- a/drivers/gpu/drm/amd/display/include/dal_types.h
+++ b/drivers/gpu/drm/amd/display/include/dal_types.h
@@ -57,6 +57,7 @@ enum dce_version {
 	DCN_VERSION_3_02,
 	DCN_VERSION_3_03,
 	DCN_VERSION_3_1,
+	DCN_VERSION_3_14,
 	DCN_VERSION_3_15,
 	DCN_VERSION_3_16,
 	DCN_VERSION_3_2,
-- 
2.35.3

