Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA5564A59C
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Dec 2022 18:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F73A10E227;
	Mon, 12 Dec 2022 17:11:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0855610E227
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Dec 2022 17:11:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MydG925I6Anl6G/1yGIszpB0bjIayfA86udfHIOg2epu2jxLzqTHrJS0de5hMxHDeYn8jmSy8m1YY5vzp9i7ly36BkBcsicCwCwDsaeS/kHa77Ld5tEVA8lygpBBBjwwPAWpCAn5Wij+EvXBI2lZtuNITrNJZTCi8+wB3W25uy28zxwZdP+RAysRNqs7F9RG5QdU6ENiDgLNtqya2w9MWNdL4gUTafuJeP9o3SbDy0ycOPBq7Ooq0ZFHloil/1+I5m9JxVph6gX+Yd3Vf4kVIJ1tUFqu/NF6khLcUs4Mh7gjcj9Qm92hP+EA9vEpI0BqOwLRflpkUo7Vg+eIOUaJdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7hEPeKR2M7QELUZGJ53jGVk3vQ+XHp+b5mvg4R3hLM=;
 b=gbx3SihIpVNSTnixj8qYqw/O04SR61LGC0Wj3wmAPqGbnb59B0/wWPVAE8/asMgB/dSIJ68+aGkAuaOKvFkn4Efz8HGstIqJus+lMBl7p1EDLPE4k8NAPH5qGypsCwduCSex6gZWIZ7GKZhpo10jMNFd3eP9FhoNPXTc2MDe3MKF2/k+F3O7TSRJXInqHpU7cVGk0hLhGVR8MaJg5OSO8CpY/jSJy9pW0dylnie2EU1L2yfroaSz0JQcZM8hsQWFugN74h6d5zPEyKJTuhGED5b4FFXOWRr7Cux3SLLNsubb1lYFr858p+q3/qLR39N6GQ47qKFPosfLJg+XQ7vymw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7hEPeKR2M7QELUZGJ53jGVk3vQ+XHp+b5mvg4R3hLM=;
 b=KTnrFfVlh5E2Hkmr/Z3qosTZFaJRHmerkc26gz0V3NtZzUtYuwBGK3V4yHe82k0ODV58sAouwm4M3XaQkCgH9P0QJzckrhbW8kVa9umWAXC069d92Ac5XHatu9W+5L5hJd7K9e2d66WTi5aSVI+G4kiQOCGsKVxSOOikQSQXe9Y=
Received: from DS7PR03CA0182.namprd03.prod.outlook.com (2603:10b6:5:3b6::7) by
 DM6PR12MB4942.namprd12.prod.outlook.com (2603:10b6:5:1be::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.19; Mon, 12 Dec 2022 17:11:53 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::20) by DS7PR03CA0182.outlook.office365.com
 (2603:10b6:5:3b6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 17:11:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.17 via Frontend Transport; Mon, 12 Dec 2022 17:11:52 +0000
Received: from localhost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 11:11:52 -0600
From: Luben Tuikov <luben.tuikov@amd.com>
To: AMD Graphics <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Check if fru_addr is not NULL
Date: Mon, 12 Dec 2022 12:11:33 -0500
Message-ID: <20221212171133.33982-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.39.0.rc2
MIME-Version: 1.0
X-check-string-leak: v1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT042:EE_|DM6PR12MB4942:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de4692a-33ff-4a2e-c711-08dadc63f6f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2NnREDRArUTioxqeCKPwe6n4yU4QVDFLbUyGKoTOfeJW1dvR0z3noTZ7222JMrcwodSdlLrSWygTZdQKNSOrkL5EYXcvlwUq0rzPTZUCupWgFXnqe2D1eP6oW5jGhj+nqmxlZbZPl6jUQPuGZuv2aUVuG1aSGqrWkR97LzsLsp/ZKacKdy1RG6kklKgNPWMg0NdkLb1wdruN3k35QbSM23iBqeDJzK+YMnQ+lwpz9gqFYaAatLQvqn7Q8OnLpR9WnRB2aHZSvQUCj7vXfCthDNePcScSkrnZyJUr+jY09a+G9+3+97WWMAnJTzh2sQX0Bm/QeNndDFt0hz8ZOnb8gq8mvwn6Xq8cuSADMTif71giHHODELQer+8QWm/c103rIoztmFTSRV+0FpbLJQUrbJ5+XzMuJS8B/G80hEESx1txs2UVzr5+2Q7eSJ766zSY1ImAxDuCqlGLKBgoqDKvwOlhILl7CKIM/TNC96YvXjPJKBLllHtnUmLjYvNZCdCMJ8QWDq3S/UlZS6bknQTfPTxYS4z5wDp1sYu96ZrePl/exflNKF/JW3lSlEGLKC5pfN19+kHlfhKwa4oxpUzOvuNjlkr2ctsPbgLyZJhq6TeXcH76PM/UrPv9ZzDi9f8go7Jso1jqlDL9CN56jligkhnNliphhxwt3CEWT+oHE959yESIxR9y2pTQ7E+hp/Pr54K1GzOfKJYMs4BiA0Cs2z6Kt/3iJKwxlRIxxicJxA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(6916009)(54906003)(86362001)(316002)(41300700001)(44832011)(8936002)(5660300002)(70586007)(36756003)(70206006)(81166007)(47076005)(4326008)(356005)(82740400003)(426003)(2616005)(186003)(16526019)(1076003)(36860700001)(83380400001)(336012)(40460700003)(7696005)(82310400005)(26005)(40480700001)(478600001)(2906002)(6666004)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 17:11:52.8806 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de4692a-33ff-4a2e-c711-08dadc63f6f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4942
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Dan Carpenter <error27@gmail.com>,
 kernel test robot <lkp@intel.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Always check if fru_addr is not NULL. This commit also fixes a "smatch"
warning.

Cc: Alex Deucher <Alexander.Deucher@amd.com>
Cc: Dan Carpenter <error27@gmail.com>
Cc: kernel test robot <lkp@intel.com>
Cc: AMD Graphics <amd-gfx@lists.freedesktop.org>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
index 2c38ac7bc643d5..4620c4712ce32a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
@@ -64,7 +64,8 @@ static bool is_fru_eeprom_supported(struct amdgpu_device *adev, u32 *fru_addr)
 			    sizeof(atom_ctx->vbios_version)) ||
 		    strnstr(atom_ctx->vbios_version, "D163",
 			    sizeof(atom_ctx->vbios_version))) {
-			*fru_addr = FRU_EEPROM_MADDR_6;
+			if (fru_addr)
+				*fru_addr = FRU_EEPROM_MADDR_6;
 			return true;
 		} else {
 			return false;
@@ -83,7 +84,8 @@ static bool is_fru_eeprom_supported(struct amdgpu_device *adev, u32 *fru_addr)
 				    sizeof(atom_ctx->vbios_version))) {
 				return false;
 			} else {
-				*fru_addr = FRU_EEPROM_MADDR_6;
+				if (fru_addr)
+					*fru_addr = FRU_EEPROM_MADDR_6;
 				return true;
 			}
 		} else {

base-commit: 20e03e7f6e8efd42168db6d3fe044b804e0ede8f
-- 
2.39.0.rc2

