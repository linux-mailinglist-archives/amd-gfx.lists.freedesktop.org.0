Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC5C79DF9A
	for <lists+amd-gfx@lfdr.de>; Wed, 13 Sep 2023 07:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0BC10E26A;
	Wed, 13 Sep 2023 05:58:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2064.outbound.protection.outlook.com [40.107.95.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA65F10E26A
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Sep 2023 05:58:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLhp7YqOTK0DY1qWUjJ5S9qZacRz6jC/fDLyfnar/VnBn/Y4VTT4C10f7ujhtEMfy23zyM8UiStxKRuRdD2TY6hdqdvsjHdNzj9Q9TJTFXxZTkrYaLn0qL60ByYQWgmNLW8nubnCgwFzvuW59ION026PtKsqmqotVA19mYfQc2yy/NI1PASWMX8wVuDKztWmqoVblJERb1C7Ch7RyvKvIaT3HfecALRdBCMPxRBwQP8jPUznwPOCscbptt3WFyqSJMR8fBJQUvs/Lh5R98l7zYLgm9wy6ZISSZqGerS6KkivfQJRxVUMpmY4s6NIABiPScAYkId8qdWf9HduWg6UYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMPRK4whpLfv8usbgoClDn0Xud1WdkvMHwTE/3ScaT8=;
 b=AMCEJ+QZ62Ov9fTLvKltAeMTf7qED9e9itRSri5Z8j4PPXK5n5BuwT2TwP8ROLc4ALOalftSuxXqnCNimwnLFeLWoKfXBodJ1w1fZ00CCbFnK6gXxW8wxo+tAtBk9RZ3bXf+B1Ho3PHOBe4SIBecgGP/gI/Z+EZKrK7CTM/qzzlh98iJ+gb6/wxqv7wETc3QUEdAnYH/OjksfmN5P3HndFcFvnBrzR+vwr+naQInBSinreWaHcf0d9pflZ8+F7eeTtjZwkAHSfB4yaeH8DjoysQW1XA4yIKRDbACvodOaNTps02bTAJ0a5q1nfNHNsfujA3li6hn0eV1Jdd0Ve6MeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMPRK4whpLfv8usbgoClDn0Xud1WdkvMHwTE/3ScaT8=;
 b=GRr2ztgvnLxaM8iIT6Bmndg1bBhYk/ivG6u9JpLUfhT+3KNueE+8B5Evu3ahhgAHCFJcn30AGXDcipD9gWrpJvi8ji3xrdlYD0mZpijFGnEZUM84E7Z1X6JurKMPkyFJF5JBROjOBv6gAZ5XQx/o56KCEYMgSBaUtgkx71kjlDE=
Received: from DM6PR04CA0018.namprd04.prod.outlook.com (2603:10b6:5:334::23)
 by CY8PR12MB7611.namprd12.prod.outlook.com (2603:10b6:930:9b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Wed, 13 Sep
 2023 05:58:18 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:5:334:cafe::b9) by DM6PR04CA0018.outlook.office365.com
 (2603:10b6:5:334::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19 via Frontend
 Transport; Wed, 13 Sep 2023 05:58:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Wed, 13 Sep 2023 05:58:18 +0000
Received: from mlse-blrlinux-ll.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 00:58:02 -0500
From: Lijo Lazar <lijo.lazar@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 1/2] drm/amdgpu: Use function for IP version check
Date: Wed, 13 Sep 2023 11:27:43 +0530
Message-ID: <20230913055744.1162406-1-lijo.lazar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|CY8PR12MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: 09146b01-31a0-481b-9f43-08dbb41e6d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VLKTUfs9veylwUCt+7gU4A7q1RxByI3enyF7MUNNvI3TLIWVOkVoQ4iExABMpYRtetqzQxsyi177ljJYBYwqqPNdMj7UpmsJQRbsONTedAhWVWKjPQVdoHGK9wHIPcHejUGxDZbgHzwxKJQErL9IrahZh/LhG8AUHjM50nzxI1PS0V2bd0i9EjOmJhtvTvuGZBOUGzTmNNW15sDaTqaV7tjmGBRYJ4fhuaCa4lvMzreg2a3roNxW91/ZCOq/qDgadwCDrIQ5rh5DUVwzd/zmFyiZ7rdVELFDbLCmvmCYsW7WuhZ5FUu5+ou3dUBbJRs9c+seWBueWo4woYkKVaaQK95bcKFmLbRL0ev/2vAE0awuQrZeVMHnH+Z/bwK/EY16PW2p2rZIi6u+U+9Jy8e7/dSwsmSIHBzWRmORA5apqXa274Hz/U6u5NcITrqnEIFpGdyDGWrP1ZZoZJzeyjuatkvJI0N2TZS6caXqKYMSEobh8Cpfket2NoqMDweQWRWbKZZ8Ij9/zbMgkGexI413ZiATHDDclWbH5DSoI+X9OM2w0848O1hNtgW65Xnyzv4+I73sEgxSmdihXPqb2RltS7NdGnvktho9uAtHBH2FO9cOVzDq8+gQ8DiLtd155jv9ykmBO/2Kfi1Vjz06CK0mVTtRtW1JT75k2DUXMcDAbMNzodrmbAcmhOtWeXMWj4bhmXz9EceSETf5Ty0SlueFqJjmKTQiOTKSeJWYi5yRbNQG8drwXS6APItCPQtdKFpz6oAcUbIychcc22IH5O0JlBz3aKAJyhHU8QkWiAHaDLs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(82310400011)(1800799009)(186009)(451199024)(36840700001)(46966006)(40470700004)(47076005)(83380400001)(356005)(81166007)(478600001)(336012)(36860700001)(426003)(2616005)(1076003)(26005)(16526019)(40480700001)(7696005)(6666004)(82740400003)(86362001)(2906002)(44832011)(30864003)(8936002)(8676002)(5660300002)(41300700001)(54906003)(6916009)(70206006)(4326008)(316002)(70586007)(36756003)(40460700003)(21314003)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 05:58:18.2357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09146b01-31a0-481b-9f43-08dbb41e6d8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7611
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Marek.Olsak@amd.com,
 Hawking.Zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Use an inline function for version check. Gives more flexibility to
handle any format changes.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/aldebaran.c        |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  6 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |  2 +-
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 29 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 92 +++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 28 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 12 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       | 11 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       | 48 +++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       | 38 ++++---
 .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c      |  7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     | 15 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       | 11 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c      |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c      |  3 +-
 drivers/gpu/drm/amd/amdgpu/athub_v1_0.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v3_0.c       |  6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 98 ++++++++++---------
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        | 27 ++---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         | 83 ++++++++--------
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c       |  8 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c      | 13 ++-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c      |  4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        | 28 +++---
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c        |  8 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         | 96 +++++++++---------
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c         | 18 ++--
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c         |  6 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        | 10 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c       | 12 +--
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c        |  6 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c        | 10 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/nv.c               |  8 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c        |  7 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c        |  6 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        | 48 +++++----
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  7 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  9 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  3 +-
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c            | 27 +++--
 drivers/gpu/drm/amd/amdgpu/soc21.c            | 12 +--
 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c    |  9 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c         |  9 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c         | 14 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c         |  7 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c        | 14 +--
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       | 12 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  2 +-
 .../drm/amd/amdkfd/kfd_packet_manager_v9.c    |  3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 34 +++----
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 10 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c            | 12 +--
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 24 ++---
 .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   | 46 +++++----
 .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   | 63 +++++++-----
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    | 32 +++---
 .../gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c   |  8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    | 18 ++--
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  |  8 +-
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c  |  2 +-
 .../drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c  | 18 ++--
 94 files changed, 714 insertions(+), 593 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/aldebaran.c b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
index 5d2516210a3a..02f4c6f9d4f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
@@ -35,7 +35,7 @@ static bool aldebaran_is_mode2_default(struct amdgpu_reset_control *reset_ctl)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)reset_ctl->handle;
 
-	if ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 2) &&
+	if ((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 2) &&
 	     adev->gmc.xgmi.connected_to_cpu))
 		return true;
 
@@ -154,7 +154,7 @@ aldebaran_mode2_perform_reset(struct amdgpu_reset_control *reset_ctl,
 	if (reset_device_list == NULL)
 		return -EINVAL;
 
-	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 2) &&
+	if (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 2) &&
 	    reset_context->hive == NULL) {
 		/* Wrong context, return error */
 		return -EINVAL;
@@ -335,7 +335,7 @@ aldebaran_mode2_restore_hwcontext(struct amdgpu_reset_control *reset_ctl,
 	if (reset_device_list == NULL)
 		return -EINVAL;
 
-	if (reset_context->reset_req_dev->ip_versions[MP1_HWIP][0] ==
+	if (amdgpu_ip_version(reset_context->reset_req_dev, MP1_HWIP, 0) ==
 		    IP_VERSION(13, 0, 2) &&
 	    reset_context->hive == NULL) {
 		/* Wrong context, return error */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 2bbac8bbb879..30f44db6c9c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1106,6 +1106,12 @@ struct amdgpu_device {
 	bool                            debug_disable_soft_recovery;
 };
 
+static inline uint32_t amdgpu_ip_version(const struct amdgpu_device *adev,
+					 uint8_t ip, uint8_t inst)
+{
+	return adev->ip_versions[ip][inst];
+}
+
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
 {
 	return container_of(ddev, struct amdgpu_device, ddev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 26ff5f8d9795..38b5457baded 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -707,7 +707,7 @@ void amdgpu_amdkfd_set_compute_idle(struct amdgpu_device *adev, bool idle)
 	/* Temporary workaround to fix issues observed in some
 	 * compute applications when GFXOFF is enabled on GFX11.
 	 */
-	if (IP_VERSION_MAJ(adev->ip_versions[GC_HWIP][0]) == 11) {
+	if (IP_VERSION_MAJ(amdgpu_ip_version(adev, GC_HWIP, 0)) == 11) {
 		pr_debug("GFXOFF is %s\n", idle ? "enabled" : "disabled");
 		amdgpu_gfx_off_ctrl(adev, idle);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
index d67d003bada2..b61a32d6af4b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -658,7 +658,7 @@ static int kgd_gfx_v11_validate_trap_override_request(struct amdgpu_device *adev
 				KFD_DBG_TRAP_MASK_DBG_ADDRESS_WATCH |
 				KFD_DBG_TRAP_MASK_DBG_MEMORY_VIOLATION;
 
-	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(11, 0, 4))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(11, 0, 4))
 		*trap_mask_supported |= KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_START |
 					KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_END;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 04b8c7dacd30..51011e8ee90d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -677,7 +677,7 @@ void kgd_gfx_v9_set_wave_launch_stall(struct amdgpu_device *adev,
 	int i;
 	uint32_t data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 1))
 		data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_VMID,
 							stall ? 1 << vmid : 0);
 	else
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3d540b0cf0e1..ca56b5a543b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1003,8 +1003,8 @@ static int amdgpu_device_asic_init(struct amdgpu_device *adev)
 
 	amdgpu_asic_pre_asic_init(adev);
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3) ||
-	    adev->ip_versions[GC_HWIP][0] >= IP_VERSION(11, 0, 0)) {
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3) ||
+	    amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(11, 0, 0)) {
 		amdgpu_psp_wait_for_bootloader(adev);
 		ret = amdgpu_atomfirmware_asic_init(adev, true);
 		return ret;
@@ -2845,7 +2845,7 @@ static void amdgpu_device_smu_fini_early(struct amdgpu_device *adev)
 {
 	int i, r;
 
-	if (adev->ip_versions[GC_HWIP][0] > IP_VERSION(9, 0, 0))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) > IP_VERSION(9, 0, 0))
 		return;
 
 	for (i = 0; i < adev->num_ip_blocks; i++) {
@@ -3098,8 +3098,10 @@ static int amdgpu_device_ip_suspend_phase2(struct amdgpu_device *adev)
 
 		/* SDMA 5.x+ is part of GFX power domain so it's covered by GFXOFF */
 		if (adev->in_s0ix &&
-		    (adev->ip_versions[SDMA0_HWIP][0] >= IP_VERSION(5, 0, 0)) &&
-		    (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_SDMA))
+		    (amdgpu_ip_version(adev, SDMA0_HWIP, 0) >=
+		     IP_VERSION(5, 0, 0)) &&
+		    (adev->ip_blocks[i].version->type ==
+		     AMD_IP_BLOCK_TYPE_SDMA))
 			continue;
 
 		/* Once swPSP provides the IMU, RLC FW binaries to TOS during cold-boot.
@@ -3590,8 +3592,8 @@ static void amdgpu_device_set_mcbp(struct amdgpu_device *adev)
 		adev->gfx.mcbp = true;
 	else if (amdgpu_mcbp == 0)
 		adev->gfx.mcbp = false;
-	else if ((adev->ip_versions[GC_HWIP][0] >= IP_VERSION(9, 0, 0)) &&
-		 (adev->ip_versions[GC_HWIP][0] < IP_VERSION(10, 0, 0)) &&
+	else if ((amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(9, 0, 0)) &&
+		 (amdgpu_ip_version(adev, GC_HWIP, 0) < IP_VERSION(10, 0, 0)) &&
 		 adev->gfx.num_gfx_rings)
 		adev->gfx.mcbp = true;
 
@@ -3811,7 +3813,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	 * internal path natively support atomics, set have_atomics_support to true.
 	 */
 	} else if ((adev->flags & AMD_IS_APU) &&
-		   (adev->ip_versions[GC_HWIP][0] > IP_VERSION(9, 0, 0))) {
+		   (amdgpu_ip_version(adev, GC_HWIP, 0) >
+		    IP_VERSION(9, 0, 0))) {
 		adev->have_atomics_support = true;
 	} else {
 		adev->have_atomics_support =
@@ -5444,8 +5447,9 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 			adev->asic_reset_res = r;
 
 		/* Aldebaran and gfx_11_0_3 support ras in SRIOV, so need resume ras during reset */
-		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2) ||
-		    adev->ip_versions[GC_HWIP][0] == IP_VERSION(11, 0, 3))
+		if (amdgpu_ip_version(adev, GC_HWIP, 0) ==
+			    IP_VERSION(9, 4, 2) ||
+		    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(11, 0, 3))
 			amdgpu_ras_resume(adev);
 	} else {
 		r = amdgpu_do_asic_reset(device_list_handle, reset_context);
@@ -5470,7 +5474,8 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 			drm_sched_start(&ring->sched, true);
 		}
 
-		if (adev->enable_mes && adev->ip_versions[GC_HWIP][0] != IP_VERSION(11, 0, 3))
+		if (adev->enable_mes &&
+		    amdgpu_ip_version(adev, GC_HWIP, 0) != IP_VERSION(11, 0, 3))
 			amdgpu_mes_self_test(tmp_adev);
 
 		if (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) && !job_signaled)
@@ -6147,7 +6152,7 @@ bool amdgpu_device_has_display_hardware(struct amdgpu_device *adev)
 		return true;
 	default:
 		/* IP discovery */
-		if (!adev->ip_versions[DCE_HWIP][0] ||
+		if (!amdgpu_ip_version(adev, DCE_HWIP, 0) ||
 		    (adev->harvest_ip_mask & AMD_HARVEST_IP_DMU_MASK))
 			return false;
 		return true;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 9ab33b0bbbad..430ee7f64a97 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -311,8 +311,8 @@ static void amdgpu_discovery_harvest_config_quirk(struct amdgpu_device *adev)
 	 * So far, apply this quirk only on those Navy Flounder boards which
 	 * have a bad harvest table of VCN config.
 	 */
-	if ((adev->ip_versions[UVD_HWIP][1] == IP_VERSION(3, 0, 1)) &&
-		(adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 2))) {
+	if ((amdgpu_ip_version(adev, UVD_HWIP, 1) == IP_VERSION(3, 0, 1)) &&
+	    (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(10, 3, 2))) {
 		switch (adev->pdev->revision) {
 		case 0xC1:
 		case 0xC2:
@@ -1363,8 +1363,8 @@ static void amdgpu_discovery_harvest_ip(struct amdgpu_device *adev)
 	 * so read harvest bit per IP data structure to set
 	 * harvest configuration.
 	 */
-	if (adev->ip_versions[GC_HWIP][0] < IP_VERSION(10, 2, 0) &&
-	    adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 4, 3)) {
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) < IP_VERSION(10, 2, 0) &&
+	    amdgpu_ip_version(adev, GC_HWIP, 0) != IP_VERSION(9, 4, 3)) {
 		if ((adev->pdev->device == 0x731E &&
 			(adev->pdev->revision == 0xC6 ||
 			 adev->pdev->revision == 0xC7)) ||
@@ -1607,7 +1607,7 @@ static int amdgpu_discovery_get_vcn_info(struct amdgpu_device *adev)
 static int amdgpu_discovery_set_common_ip_blocks(struct amdgpu_device *adev)
 {
 	/* what IP to use for this? */
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 0, 1):
 	case IP_VERSION(9, 1, 0):
 	case IP_VERSION(9, 2, 1):
@@ -1645,7 +1645,7 @@ static int amdgpu_discovery_set_common_ip_blocks(struct amdgpu_device *adev)
 	default:
 		dev_err(adev->dev,
 			"Failed to add common ip block(GC_HWIP:0x%x)\n",
-			adev->ip_versions[GC_HWIP][0]);
+			amdgpu_ip_version(adev, GC_HWIP, 0));
 		return -EINVAL;
 	}
 	return 0;
@@ -1654,7 +1654,7 @@ static int amdgpu_discovery_set_common_ip_blocks(struct amdgpu_device *adev)
 static int amdgpu_discovery_set_gmc_ip_blocks(struct amdgpu_device *adev)
 {
 	/* use GC or MMHUB IP version */
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 0, 1):
 	case IP_VERSION(9, 1, 0):
 	case IP_VERSION(9, 2, 1):
@@ -1690,9 +1690,8 @@ static int amdgpu_discovery_set_gmc_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &gmc_v11_0_ip_block);
 		break;
 	default:
-		dev_err(adev->dev,
-			"Failed to add gmc ip block(GC_HWIP:0x%x)\n",
-			adev->ip_versions[GC_HWIP][0]);
+		dev_err(adev->dev, "Failed to add gmc ip block(GC_HWIP:0x%x)\n",
+			amdgpu_ip_version(adev, GC_HWIP, 0));
 		return -EINVAL;
 	}
 	return 0;
@@ -1700,7 +1699,7 @@ static int amdgpu_discovery_set_gmc_ip_blocks(struct amdgpu_device *adev)
 
 static int amdgpu_discovery_set_ih_ip_blocks(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[OSSSYS_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, OSSSYS_HWIP, 0)) {
 	case IP_VERSION(4, 0, 0):
 	case IP_VERSION(4, 0, 1):
 	case IP_VERSION(4, 1, 0):
@@ -1733,7 +1732,7 @@ static int amdgpu_discovery_set_ih_ip_blocks(struct amdgpu_device *adev)
 	default:
 		dev_err(adev->dev,
 			"Failed to add ih ip block(OSSSYS_HWIP:0x%x)\n",
-			adev->ip_versions[OSSSYS_HWIP][0]);
+			amdgpu_ip_version(adev, OSSSYS_HWIP, 0));
 		return -EINVAL;
 	}
 	return 0;
@@ -1741,7 +1740,7 @@ static int amdgpu_discovery_set_ih_ip_blocks(struct amdgpu_device *adev)
 
 static int amdgpu_discovery_set_psp_ip_blocks(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[MP0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP0_HWIP, 0)) {
 	case IP_VERSION(9, 0, 0):
 		amdgpu_device_ip_block_add(adev, &psp_v3_1_ip_block);
 		break;
@@ -1787,7 +1786,7 @@ static int amdgpu_discovery_set_psp_ip_blocks(struct amdgpu_device *adev)
 	default:
 		dev_err(adev->dev,
 			"Failed to add psp ip block(MP0_HWIP:0x%x)\n",
-			adev->ip_versions[MP0_HWIP][0]);
+			amdgpu_ip_version(adev, MP0_HWIP, 0));
 		return -EINVAL;
 	}
 	return 0;
@@ -1795,7 +1794,7 @@ static int amdgpu_discovery_set_psp_ip_blocks(struct amdgpu_device *adev)
 
 static int amdgpu_discovery_set_smu_ip_blocks(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(9, 0, 0):
 	case IP_VERSION(10, 0, 0):
 	case IP_VERSION(10, 0, 1):
@@ -1836,7 +1835,7 @@ static int amdgpu_discovery_set_smu_ip_blocks(struct amdgpu_device *adev)
 	default:
 		dev_err(adev->dev,
 			"Failed to add smu ip block(MP1_HWIP:0x%x)\n",
-			adev->ip_versions[MP1_HWIP][0]);
+			amdgpu_ip_version(adev, MP1_HWIP, 0));
 		return -EINVAL;
 	}
 	return 0;
@@ -1861,8 +1860,8 @@ static int amdgpu_discovery_set_display_ip_blocks(struct amdgpu_device *adev)
 		return 0;
 
 #if defined(CONFIG_DRM_AMD_DC)
-	if (adev->ip_versions[DCE_HWIP][0]) {
-		switch (adev->ip_versions[DCE_HWIP][0]) {
+	if (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
+		switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 		case IP_VERSION(1, 0, 0):
 		case IP_VERSION(1, 0, 1):
 		case IP_VERSION(2, 0, 2):
@@ -1888,11 +1887,11 @@ static int amdgpu_discovery_set_display_ip_blocks(struct amdgpu_device *adev)
 		default:
 			dev_err(adev->dev,
 				"Failed to add dm ip block(DCE_HWIP:0x%x)\n",
-				adev->ip_versions[DCE_HWIP][0]);
+				amdgpu_ip_version(adev, DCE_HWIP, 0));
 			return -EINVAL;
 		}
-	} else if (adev->ip_versions[DCI_HWIP][0]) {
-		switch (adev->ip_versions[DCI_HWIP][0]) {
+	} else if (amdgpu_ip_version(adev, DCI_HWIP, 0)) {
+		switch (amdgpu_ip_version(adev, DCI_HWIP, 0)) {
 		case IP_VERSION(12, 0, 0):
 		case IP_VERSION(12, 0, 1):
 		case IP_VERSION(12, 1, 0):
@@ -1904,7 +1903,7 @@ static int amdgpu_discovery_set_display_ip_blocks(struct amdgpu_device *adev)
 		default:
 			dev_err(adev->dev,
 				"Failed to add dm ip block(DCI_HWIP:0x%x)\n",
-				adev->ip_versions[DCI_HWIP][0]);
+				amdgpu_ip_version(adev, DCI_HWIP, 0));
 			return -EINVAL;
 		}
 	}
@@ -1914,7 +1913,7 @@ static int amdgpu_discovery_set_display_ip_blocks(struct amdgpu_device *adev)
 
 static int amdgpu_discovery_set_gc_ip_blocks(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 0, 1):
 	case IP_VERSION(9, 1, 0):
 	case IP_VERSION(9, 2, 1):
@@ -1952,9 +1951,8 @@ static int amdgpu_discovery_set_gc_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &gfx_v11_0_ip_block);
 		break;
 	default:
-		dev_err(adev->dev,
-			"Failed to add gfx ip block(GC_HWIP:0x%x)\n",
-			adev->ip_versions[GC_HWIP][0]);
+		dev_err(adev->dev, "Failed to add gfx ip block(GC_HWIP:0x%x)\n",
+			amdgpu_ip_version(adev, GC_HWIP, 0));
 		return -EINVAL;
 	}
 	return 0;
@@ -1962,7 +1960,7 @@ static int amdgpu_discovery_set_gc_ip_blocks(struct amdgpu_device *adev)
 
 static int amdgpu_discovery_set_sdma_ip_blocks(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
 	case IP_VERSION(4, 0, 0):
 	case IP_VERSION(4, 0, 1):
 	case IP_VERSION(4, 1, 0):
@@ -2002,7 +2000,7 @@ static int amdgpu_discovery_set_sdma_ip_blocks(struct amdgpu_device *adev)
 	default:
 		dev_err(adev->dev,
 			"Failed to add sdma ip block(SDMA0_HWIP:0x%x)\n",
-			adev->ip_versions[SDMA0_HWIP][0]);
+			amdgpu_ip_version(adev, SDMA0_HWIP, 0));
 		return -EINVAL;
 	}
 	return 0;
@@ -2010,8 +2008,8 @@ static int amdgpu_discovery_set_sdma_ip_blocks(struct amdgpu_device *adev)
 
 static int amdgpu_discovery_set_mm_ip_blocks(struct amdgpu_device *adev)
 {
-	if (adev->ip_versions[VCE_HWIP][0]) {
-		switch (adev->ip_versions[UVD_HWIP][0]) {
+	if (amdgpu_ip_version(adev, VCE_HWIP, 0)) {
+		switch (amdgpu_ip_version(adev, UVD_HWIP, 0)) {
 		case IP_VERSION(7, 0, 0):
 		case IP_VERSION(7, 2, 0):
 			/* UVD is not supported on vega20 SR-IOV */
@@ -2021,10 +2019,10 @@ static int amdgpu_discovery_set_mm_ip_blocks(struct amdgpu_device *adev)
 		default:
 			dev_err(adev->dev,
 				"Failed to add uvd v7 ip block(UVD_HWIP:0x%x)\n",
-				adev->ip_versions[UVD_HWIP][0]);
+				amdgpu_ip_version(adev, UVD_HWIP, 0));
 			return -EINVAL;
 		}
-		switch (adev->ip_versions[VCE_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, VCE_HWIP, 0)) {
 		case IP_VERSION(4, 0, 0):
 		case IP_VERSION(4, 1, 0):
 			/* VCE is not supported on vega20 SR-IOV */
@@ -2034,11 +2032,11 @@ static int amdgpu_discovery_set_mm_ip_blocks(struct amdgpu_device *adev)
 		default:
 			dev_err(adev->dev,
 				"Failed to add VCE v4 ip block(VCE_HWIP:0x%x)\n",
-				adev->ip_versions[VCE_HWIP][0]);
+				amdgpu_ip_version(adev, VCE_HWIP, 0));
 			return -EINVAL;
 		}
 	} else {
-		switch (adev->ip_versions[UVD_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, UVD_HWIP, 0)) {
 		case IP_VERSION(1, 0, 0):
 		case IP_VERSION(1, 0, 1):
 			amdgpu_device_ip_block_add(adev, &vcn_v1_0_ip_block);
@@ -2089,7 +2087,7 @@ static int amdgpu_discovery_set_mm_ip_blocks(struct amdgpu_device *adev)
 		default:
 			dev_err(adev->dev,
 				"Failed to add vcn/jpeg ip block(UVD_HWIP:0x%x)\n",
-				adev->ip_versions[UVD_HWIP][0]);
+				amdgpu_ip_version(adev, UVD_HWIP, 0));
 			return -EINVAL;
 		}
 	}
@@ -2098,7 +2096,7 @@ static int amdgpu_discovery_set_mm_ip_blocks(struct amdgpu_device *adev)
 
 static int amdgpu_discovery_set_mes_ip_blocks(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 1, 10):
 	case IP_VERSION(10, 1, 1):
 	case IP_VERSION(10, 1, 2):
@@ -2136,7 +2134,7 @@ static int amdgpu_discovery_set_mes_ip_blocks(struct amdgpu_device *adev)
 
 static void amdgpu_discovery_init_soc_config(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 4, 3):
 		aqua_vanjaram_init_soc_config(adev);
 		break;
@@ -2147,7 +2145,7 @@ static void amdgpu_discovery_init_soc_config(struct amdgpu_device *adev)
 
 static int amdgpu_discovery_set_vpe_ip_blocks(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[VPE_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, VPE_HWIP, 0)) {
 	case IP_VERSION(6, 1, 0):
 		amdgpu_device_ip_block_add(adev, &vpe_v6_1_ip_block);
 		break;
@@ -2160,7 +2158,7 @@ static int amdgpu_discovery_set_vpe_ip_blocks(struct amdgpu_device *adev)
 
 static int amdgpu_discovery_set_umsch_mm_ip_blocks(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[VCN_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, VCN_HWIP, 0)) {
 	case IP_VERSION(4, 0, 5):
 		if (amdgpu_umsch_mm & 0x1) {
 			amdgpu_device_ip_block_add(adev, &umsch_mm_v4_0_ip_block);
@@ -2354,7 +2352,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
 	amdgpu_discovery_init_soc_config(adev);
 	amdgpu_discovery_sysfs_init(adev);
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 0, 1):
 	case IP_VERSION(9, 2, 1):
 	case IP_VERSION(9, 4, 0):
@@ -2408,7 +2406,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 1, 0):
 	case IP_VERSION(9, 2, 2):
 	case IP_VERSION(9, 3, 0):
@@ -2427,11 +2425,11 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
 		break;
 	}
 
-	if (adev->ip_versions[XGMI_HWIP][0] == IP_VERSION(4, 8, 0))
+	if (amdgpu_ip_version(adev, XGMI_HWIP, 0) == IP_VERSION(4, 8, 0))
 		adev->gmc.xgmi.supported = true;
 
 	/* set NBIO version */
-	switch (adev->ip_versions[NBIO_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, NBIO_HWIP, 0)) {
 	case IP_VERSION(6, 1, 0):
 	case IP_VERSION(6, 2, 0):
 		adev->nbio.funcs = &nbio_v6_1_funcs;
@@ -2493,7 +2491,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
 		break;
 	}
 
-	switch (adev->ip_versions[HDP_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, HDP_HWIP, 0)) {
 	case IP_VERSION(4, 0, 0):
 	case IP_VERSION(4, 0, 1):
 	case IP_VERSION(4, 1, 0):
@@ -2525,7 +2523,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
 		break;
 	}
 
-	switch (adev->ip_versions[DF_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, DF_HWIP, 0)) {
 	case IP_VERSION(3, 6, 0):
 	case IP_VERSION(3, 6, 1):
 	case IP_VERSION(3, 6, 2):
@@ -2545,7 +2543,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
 		break;
 	}
 
-	switch (adev->ip_versions[SMUIO_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, SMUIO_HWIP, 0)) {
 	case IP_VERSION(9, 0, 0):
 	case IP_VERSION(9, 0, 1):
 	case IP_VERSION(10, 0, 0):
@@ -2588,7 +2586,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
 		break;
 	}
 
-	switch (adev->ip_versions[LSDMA_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, LSDMA_HWIP, 0)) {
 	case IP_VERSION(6, 0, 0):
 	case IP_VERSION(6, 0, 1):
 	case IP_VERSION(6, 0, 2):
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 363e6a2cad8c..0cacd0b9f8be 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -766,11 +766,13 @@ static int convert_tiling_flags_to_modifier(struct amdgpu_framebuffer *afb)
 			return -EINVAL;
 		}
 
-		if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(11, 0, 0))
+		if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(11, 0, 0))
 			version = AMD_FMT_MOD_TILE_VER_GFX11;
-		else if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0))
+		else if (amdgpu_ip_version(adev, GC_HWIP, 0) >=
+			 IP_VERSION(10, 3, 0))
 			version = AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS;
-		else if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 0, 0))
+		else if (amdgpu_ip_version(adev, GC_HWIP, 0) >=
+			 IP_VERSION(10, 0, 0))
 			version = AMD_FMT_MOD_TILE_VER_GFX10;
 		else
 			version = AMD_FMT_MOD_TILE_VER_GFX9;
@@ -779,13 +781,15 @@ static int convert_tiling_flags_to_modifier(struct amdgpu_framebuffer *afb)
 		case 0: /* Z microtiling */
 			return -EINVAL;
 		case 1: /* S microtiling */
-			if (adev->ip_versions[GC_HWIP][0] < IP_VERSION(11, 0, 0)) {
+			if (amdgpu_ip_version(adev, GC_HWIP, 0) <
+			    IP_VERSION(11, 0, 0)) {
 				if (!has_xor)
 					version = AMD_FMT_MOD_TILE_VER_GFX9;
 			}
 			break;
 		case 2:
-			if (adev->ip_versions[GC_HWIP][0] < IP_VERSION(11, 0, 0)) {
+			if (amdgpu_ip_version(adev, GC_HWIP, 0) <
+			    IP_VERSION(11, 0, 0)) {
 				if (!has_xor && afb->base.format->cpp[0] != 4)
 					version = AMD_FMT_MOD_TILE_VER_GFX9;
 			}
@@ -838,10 +842,12 @@ static int convert_tiling_flags_to_modifier(struct amdgpu_framebuffer *afb)
 			u64 render_dcc_offset;
 
 			/* Enable constant encode on RAVEN2 and later. */
-			bool dcc_constant_encode = (adev->asic_type > CHIP_RAVEN ||
-						   (adev->asic_type == CHIP_RAVEN &&
-						    adev->external_rev_id >= 0x81)) &&
-						    adev->ip_versions[GC_HWIP][0] < IP_VERSION(11, 0, 0);
+			bool dcc_constant_encode =
+				(adev->asic_type > CHIP_RAVEN ||
+				 (adev->asic_type == CHIP_RAVEN &&
+				  adev->external_rev_id >= 0x81)) &&
+				amdgpu_ip_version(adev, GC_HWIP, 0) <
+					IP_VERSION(11, 0, 0);
 
 			int max_cblock_size = dcc_i64b ? AMD_FMT_MOD_DCC_BLOCK_64B :
 					      dcc_i128b ? AMD_FMT_MOD_DCC_BLOCK_128B :
@@ -878,7 +884,9 @@ static int convert_tiling_flags_to_modifier(struct amdgpu_framebuffer *afb)
 				if (adev->family >= AMDGPU_FAMILY_NV) {
 					int extra_pipe = 0;
 
-					if ((adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0)) &&
+					if ((amdgpu_ip_version(adev, GC_HWIP,
+							       0) >=
+					     IP_VERSION(10, 3, 0)) &&
 					    pipes == packers && pipes > 1)
 						extra_pipe = 1;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 3ab7eac131e2..90d6c5e5d66d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2274,7 +2274,7 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 		pm_runtime_forbid(dev->dev);
 	}
 
-	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 2) &&
+	if (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 2) &&
 	    !amdgpu_sriov_vf(adev)) {
 		bool need_to_reset_gpu = false;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index e163cb0bacd8..709a2c1b9d63 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -570,7 +570,8 @@ static bool amdgpu_fence_need_ring_interrupt_restore(struct amdgpu_ring *ring)
 	switch (ring->funcs->type) {
 	case AMDGPU_RING_TYPE_SDMA:
 	/* SDMA 5.x+ is part of GFX power domain so it's covered by GFXOFF */
-		if (adev->ip_versions[SDMA0_HWIP][0] >= IP_VERSION(5, 0, 0))
+		if (amdgpu_ip_version(adev, SDMA0_HWIP, 0) >=
+		    IP_VERSION(5, 0, 0))
 			is_gfx_power_domain = true;
 		break;
 	case AMDGPU_RING_TYPE_GFX:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 2382921710ec..9a158018ae16 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -158,7 +158,7 @@ static bool amdgpu_gfx_is_compute_multipipe_capable(struct amdgpu_device *adev)
 		return amdgpu_compute_multipipe == 1;
 	}
 
-	if (adev->ip_versions[GC_HWIP][0] > IP_VERSION(9, 0, 0))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) > IP_VERSION(9, 0, 0))
 		return true;
 
 	/* FIXME: spreading the queues across pipes causes perf regressions
@@ -385,7 +385,7 @@ int amdgpu_gfx_mqd_sw_init(struct amdgpu_device *adev,
 	u32 domain = AMDGPU_GEM_DOMAIN_GTT;
 
 	/* Only enable on gfx10 and 11 for now to avoid changing behavior on older chips */
-	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 0, 0))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(10, 0, 0))
 		domain |= AMDGPU_GEM_DOMAIN_VRAM;
 
 	/* create MQD for KIQ */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 5f7641d9f346..de7b379a9cc8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -588,7 +588,7 @@ int amdgpu_gmc_allocate_vm_inv_eng(struct amdgpu_device *adev)
  */
 void amdgpu_gmc_tmz_set(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	/* RAVEN */
 	case IP_VERSION(9, 2, 2):
 	case IP_VERSION(9, 1, 0):
@@ -652,7 +652,7 @@ void amdgpu_gmc_tmz_set(struct amdgpu_device *adev)
 void amdgpu_gmc_noretry_set(struct amdgpu_device *adev)
 {
 	struct amdgpu_gmc *gmc = &adev->gmc;
-	uint32_t gc_ver = adev->ip_versions[GC_HWIP][0];
+	uint32_t gc_ver = amdgpu_ip_version(adev, GC_HWIP, 0);
 	bool noretry_default = (gc_ver == IP_VERSION(9, 0, 1) ||
 				gc_ver == IP_VERSION(9, 3, 0) ||
 				gc_ver == IP_VERSION(9, 4, 0) ||
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index a74ea53899f6..dfd24a582391 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -501,18 +501,22 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
 	if (adev->asic_type >= CHIP_VEGA10) {
 		switch (type) {
 		case AMD_IP_BLOCK_TYPE_GFX:
-			result->ip_discovery_version = adev->ip_versions[GC_HWIP][0];
+			result->ip_discovery_version =
+				amdgpu_ip_version(adev, GC_HWIP, 0);
 			break;
 		case AMD_IP_BLOCK_TYPE_SDMA:
-			result->ip_discovery_version = adev->ip_versions[SDMA0_HWIP][0];
+			result->ip_discovery_version =
+				amdgpu_ip_version(adev, SDMA0_HWIP, 0);
 			break;
 		case AMD_IP_BLOCK_TYPE_UVD:
 		case AMD_IP_BLOCK_TYPE_VCN:
 		case AMD_IP_BLOCK_TYPE_JPEG:
-			result->ip_discovery_version = adev->ip_versions[UVD_HWIP][0];
+			result->ip_discovery_version =
+				amdgpu_ip_version(adev, UVD_HWIP, 0);
 			break;
 		case AMD_IP_BLOCK_TYPE_VCE:
-			result->ip_discovery_version = adev->ip_versions[VCE_HWIP][0];
+			result->ip_discovery_version =
+				amdgpu_ip_version(adev, VCE_HWIP, 0);
 			break;
 		default:
 			result->ip_discovery_version = 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 10ce5557bb11..70fe3b39c004 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -131,7 +131,8 @@ int amdgpu_mes_init(struct amdgpu_device *adev)
 		adev->mes.gfx_hqd_mask[i] = i ? 0 : 0xfffffffe;
 
 	for (i = 0; i < AMDGPU_MES_MAX_SDMA_PIPES; i++) {
-		if (adev->ip_versions[SDMA0_HWIP][0] < IP_VERSION(6, 0, 0))
+		if (amdgpu_ip_version(adev, SDMA0_HWIP, 0) <
+		    IP_VERSION(6, 0, 0))
 			adev->mes.sdma_hqd_mask[i] = i ? 0 : 0x3fc;
 		/* zero sdma_hqd_mask for non-existent engine */
 		else if (adev->sdma.num_instances == 1)
@@ -1339,8 +1340,10 @@ int amdgpu_mes_self_test(struct amdgpu_device *adev)
 
 	for (i = 0; i < ARRAY_SIZE(queue_types); i++) {
 		/* On GFX v10.3, fw hasn't supported to map sdma queue. */
-		if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0) &&
-		    adev->ip_versions[GC_HWIP][0] < IP_VERSION(11, 0, 0) &&
+		if (amdgpu_ip_version(adev, GC_HWIP, 0) >=
+			    IP_VERSION(10, 3, 0) &&
+		    amdgpu_ip_version(adev, GC_HWIP, 0) <
+			    IP_VERSION(11, 0, 0) &&
 		    queue_types[i][0] == AMDGPU_RING_TYPE_SDMA)
 			continue;
 
@@ -1401,7 +1404,7 @@ int amdgpu_mes_init_microcode(struct amdgpu_device *adev, int pipe)
 
 	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix,
 				       sizeof(ucode_prefix));
-	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(11, 0, 0)) {
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(11, 0, 0)) {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
 			 ucode_prefix,
 			 pipe == AMDGPU_MES_SCHED_PIPE ? "_2" : "1");
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index ed0955ccd3d7..72ee66db182c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -100,7 +100,7 @@ static void psp_check_pmfw_centralized_cstate_management(struct psp_context *psp
 		return;
 	}
 
-	switch (adev->ip_versions[MP0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP0_HWIP, 0)) {
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 4):
 	case IP_VERSION(11, 0, 5):
@@ -128,7 +128,7 @@ static int psp_init_sriov_microcode(struct psp_context *psp)
 
 	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	switch (adev->ip_versions[MP0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP0_HWIP, 0)) {
 	case IP_VERSION(9, 0, 0):
 	case IP_VERSION(11, 0, 7):
 	case IP_VERSION(11, 0, 9):
@@ -162,7 +162,7 @@ static int psp_early_init(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct psp_context *psp = &adev->psp;
 
-	switch (adev->ip_versions[MP0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP0_HWIP, 0)) {
 	case IP_VERSION(9, 0, 0):
 		psp_v3_1_set_psp_funcs(psp);
 		psp->autoload_supported = false;
@@ -334,7 +334,7 @@ static bool psp_get_runtime_db_entry(struct amdgpu_device *adev,
 	bool ret = false;
 	int i;
 
-	if (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(13, 0, 6))
+	if (amdgpu_ip_version(adev, MP0_HWIP, 0) == IP_VERSION(13, 0, 6))
 		return false;
 
 	db_header_pos = adev->gmc.mc_vram_size - PSP_RUNTIME_DB_OFFSET;
@@ -413,7 +413,7 @@ static int psp_sw_init(void *handle)
 
 	adev->psp.xgmi_context.supports_extended_data =
 		!adev->gmc.xgmi.connected_to_cpu &&
-			adev->ip_versions[MP0_HWIP][0] == IP_VERSION(13, 0, 2);
+		amdgpu_ip_version(adev, MP0_HWIP, 0) == IP_VERSION(13, 0, 2);
 
 	memset(&scpm_entry, 0, sizeof(scpm_entry));
 	if ((psp_get_runtime_db_entry(adev,
@@ -773,7 +773,7 @@ static int psp_load_toc(struct psp_context *psp,
 
 static bool psp_boottime_tmr(struct psp_context *psp)
 {
-	switch (psp->adev->ip_versions[MP0_HWIP][0]) {
+	switch (amdgpu_ip_version(psp->adev, MP0_HWIP, 0)) {
 	case IP_VERSION(13, 0, 6):
 		return true;
 	default:
@@ -828,7 +828,7 @@ static int psp_tmr_init(struct psp_context *psp)
 
 static bool psp_skip_tmr(struct psp_context *psp)
 {
-	switch (psp->adev->ip_versions[MP0_HWIP][0]) {
+	switch (amdgpu_ip_version(psp->adev, MP0_HWIP, 0)) {
 	case IP_VERSION(11, 0, 9):
 	case IP_VERSION(11, 0, 7):
 	case IP_VERSION(13, 0, 2):
@@ -1215,8 +1215,8 @@ int psp_xgmi_terminate(struct psp_context *psp)
 	struct amdgpu_device *adev = psp->adev;
 
 	/* XGMI TA unload currently is not supported on Arcturus/Aldebaran A+A */
-	if (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 4) ||
-	    (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(13, 0, 2) &&
+	if (amdgpu_ip_version(adev, MP0_HWIP, 0) == IP_VERSION(11, 0, 4) ||
+	    (amdgpu_ip_version(adev, MP0_HWIP, 0) == IP_VERSION(13, 0, 2) &&
 	     adev->gmc.xgmi.connected_to_cpu))
 		return 0;
 
@@ -1313,9 +1313,11 @@ int psp_xgmi_get_node_id(struct psp_context *psp, uint64_t *node_id)
 
 static bool psp_xgmi_peer_link_info_supported(struct psp_context *psp)
 {
-	return (psp->adev->ip_versions[MP0_HWIP][0] == IP_VERSION(13, 0, 2) &&
+	return (amdgpu_ip_version(psp->adev, MP0_HWIP, 0) ==
+			IP_VERSION(13, 0, 2) &&
 		psp->xgmi_context.context.bin_desc.fw_version >= 0x2000000b) ||
-		psp->adev->ip_versions[MP0_HWIP][0] >= IP_VERSION(13, 0, 6);
+	       amdgpu_ip_version(psp->adev, MP0_HWIP, 0) >=
+		       IP_VERSION(13, 0, 6);
 }
 
 /*
@@ -1424,8 +1426,10 @@ int psp_xgmi_get_topology_info(struct psp_context *psp,
 	if (psp_xgmi_peer_link_info_supported(psp)) {
 		struct ta_xgmi_cmd_get_peer_link_info_output *link_info_output;
 		bool requires_reflection =
-			(psp->xgmi_context.supports_extended_data && get_extended_data) ||
-				psp->adev->ip_versions[MP0_HWIP][0] == IP_VERSION(13, 0, 6);
+			(psp->xgmi_context.supports_extended_data &&
+			 get_extended_data) ||
+			amdgpu_ip_version(psp->adev, MP0_HWIP, 0) ==
+				IP_VERSION(13, 0, 6);
 
 		xgmi_cmd->cmd_id = TA_COMMAND_XGMI__GET_PEER_LINKS;
 
@@ -2517,10 +2521,9 @@ static int psp_load_smu_fw(struct psp_context *psp)
 	if (!ucode->fw || amdgpu_sriov_vf(psp->adev))
 		return 0;
 
-	if ((amdgpu_in_reset(adev) &&
-	     ras && adev->ras_enabled &&
-	     (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 4) ||
-	      adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 2)))) {
+	if ((amdgpu_in_reset(adev) && ras && adev->ras_enabled &&
+	     (amdgpu_ip_version(adev, MP0_HWIP, 0) == IP_VERSION(11, 0, 4) ||
+	      amdgpu_ip_version(adev, MP0_HWIP, 0) == IP_VERSION(11, 0, 2)))) {
 		ret = amdgpu_dpm_set_mp1_state(adev, PP_MP1_STATE_UNLOAD);
 		if (ret)
 			DRM_WARN("Failed to set MP1 state prepare for reload\n");
@@ -2603,9 +2606,12 @@ static int psp_load_non_psp_fw(struct psp_context *psp)
 			continue;
 
 		if (psp->autoload_supported &&
-		    (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 7) ||
-		     adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 11) ||
-		     adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 12)) &&
+		    (amdgpu_ip_version(adev, MP0_HWIP, 0) ==
+			     IP_VERSION(11, 0, 7) ||
+		     amdgpu_ip_version(adev, MP0_HWIP, 0) ==
+			     IP_VERSION(11, 0, 11) ||
+		     amdgpu_ip_version(adev, MP0_HWIP, 0) ==
+			     IP_VERSION(11, 0, 12)) &&
 		    (ucode->ucode_id == AMDGPU_UCODE_ID_SDMA1 ||
 		     ucode->ucode_id == AMDGPU_UCODE_ID_SDMA2 ||
 		     ucode->ucode_id == AMDGPU_UCODE_ID_SDMA3))
@@ -3146,7 +3152,7 @@ static int psp_init_sos_base_fw(struct amdgpu_device *adev)
 		le32_to_cpu(sos_hdr->header.ucode_array_offset_bytes);
 
 	if (adev->gmc.xgmi.connected_to_cpu ||
-	    (adev->ip_versions[MP0_HWIP][0] != IP_VERSION(13, 0, 2))) {
+	    (amdgpu_ip_version(adev, MP0_HWIP, 0) != IP_VERSION(13, 0, 2))) {
 		adev->psp.sos.fw_version = le32_to_cpu(sos_hdr->header.ucode_version);
 		adev->psp.sos.feature_version = le32_to_cpu(sos_hdr->sos.fw_version);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 632478874f7d..eeb695f9ff1c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -201,8 +201,8 @@ static ssize_t amdgpu_ras_debugfs_read(struct file *f, char __user *buf,
 		return -EINVAL;
 
 	/* Hardware counter will be reset automatically after the query on Vega20 and Arcturus */
-	if (obj->adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 2) &&
-	    obj->adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 4)) {
+	if (amdgpu_ip_version(obj->adev, MP0_HWIP, 0) != IP_VERSION(11, 0, 2) &&
+	    amdgpu_ip_version(obj->adev, MP0_HWIP, 0) != IP_VERSION(11, 0, 4)) {
 		if (amdgpu_ras_reset_error_status(obj->adev, info.head.block))
 			dev_warn(obj->adev->dev, "Failed to reset error counter and error status");
 	}
@@ -611,8 +611,8 @@ static ssize_t amdgpu_ras_sysfs_read(struct device *dev,
 	if (amdgpu_ras_query_error_status(obj->adev, &info))
 		return -EINVAL;
 
-	if (obj->adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 2) &&
-	    obj->adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 4)) {
+	if (amdgpu_ip_version(obj->adev, MP0_HWIP, 0) != IP_VERSION(11, 0, 2) &&
+	    amdgpu_ip_version(obj->adev, MP0_HWIP, 0) != IP_VERSION(11, 0, 4)) {
 		if (amdgpu_ras_reset_error_status(obj->adev, info.head.block))
 			dev_warn(obj->adev->dev, "Failed to reset error counter and error status");
 	}
@@ -1208,8 +1208,8 @@ static int amdgpu_ras_query_error_count_helper(struct amdgpu_device *adev,
 
 	/* some hardware/IP supports read to clear
 	 * no need to explictly reset the err status after the query call */
-	if (adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 2) &&
-	    adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 4)) {
+	if (amdgpu_ip_version(adev, MP0_HWIP, 0) != IP_VERSION(11, 0, 2) &&
+	    amdgpu_ip_version(adev, MP0_HWIP, 0) != IP_VERSION(11, 0, 4)) {
 		if (amdgpu_ras_reset_error_status(adev, query_info->head.block))
 			dev_warn(adev->dev,
 				 "Failed to reset error counter and error status\n");
@@ -1905,14 +1905,18 @@ static void amdgpu_ras_log_on_err_counter(struct amdgpu_device *adev)
 		 * should be removed until smu fix handle ecc_info table.
 		 */
 		if ((info.head.block == AMDGPU_RAS_BLOCK__UMC) &&
-			(adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 2)))
+		    (amdgpu_ip_version(adev, MP1_HWIP, 0) ==
+		     IP_VERSION(13, 0, 2)))
 			continue;
 
 		amdgpu_ras_query_error_status(adev, &info);
 
-		if (adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 2) &&
-		    adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 4) &&
-		    adev->ip_versions[MP0_HWIP][0] != IP_VERSION(13, 0, 0)) {
+		if (amdgpu_ip_version(adev, MP0_HWIP, 0) !=
+			    IP_VERSION(11, 0, 2) &&
+		    amdgpu_ip_version(adev, MP0_HWIP, 0) !=
+			    IP_VERSION(11, 0, 4) &&
+		    amdgpu_ip_version(adev, MP0_HWIP, 0) !=
+			    IP_VERSION(13, 0, 0)) {
 			if (amdgpu_ras_reset_error_status(adev, info.head.block))
 				dev_warn(adev->dev, "Failed to reset error counter and error status");
 		}
@@ -2400,7 +2404,7 @@ static int amdgpu_ras_recovery_fini(struct amdgpu_device *adev)
 static bool amdgpu_ras_asic_supported(struct amdgpu_device *adev)
 {
 	if (amdgpu_sriov_vf(adev)) {
-		switch (adev->ip_versions[MP0_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, MP0_HWIP, 0)) {
 		case IP_VERSION(13, 0, 2):
 		case IP_VERSION(13, 0, 6):
 			return true;
@@ -2410,7 +2414,7 @@ static bool amdgpu_ras_asic_supported(struct amdgpu_device *adev)
 	}
 
 	if (adev->asic_type == CHIP_IP_DISCOVERY) {
-		switch (adev->ip_versions[MP0_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, MP0_HWIP, 0)) {
 		case IP_VERSION(13, 0, 0):
 		case IP_VERSION(13, 0, 6):
 		case IP_VERSION(13, 0, 10):
@@ -2484,8 +2488,10 @@ static void amdgpu_ras_check_supported(struct amdgpu_device *adev)
 			/* VCN/JPEG RAS can be supported on both bare metal and
 			 * SRIOV environment
 			 */
-			if (adev->ip_versions[VCN_HWIP][0] == IP_VERSION(2, 6, 0) ||
-			    adev->ip_versions[VCN_HWIP][0] == IP_VERSION(4, 0, 0))
+			if (amdgpu_ip_version(adev, VCN_HWIP, 0) ==
+				    IP_VERSION(2, 6, 0) ||
+			    amdgpu_ip_version(adev, VCN_HWIP, 0) ==
+				    IP_VERSION(4, 0, 0))
 				adev->ras_hw_enabled |= (1 << AMDGPU_RAS_BLOCK__VCN |
 							1 << AMDGPU_RAS_BLOCK__JPEG);
 			else
@@ -2519,7 +2525,7 @@ static void amdgpu_ras_check_supported(struct amdgpu_device *adev)
 	 * Disable ras feature for aqua vanjaram
 	 * by default on apu platform.
 	 */
-	if (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(13, 0, 6) &&
+	if (amdgpu_ip_version(adev, MP0_HWIP, 0) == IP_VERSION(13, 0, 6) &&
 	    adev->gmc.is_app_apu)
 		adev->ras_enabled = amdgpu_ras_enable != 1 ? 0 :
 			adev->ras_hw_enabled & amdgpu_ras_mask;
@@ -2634,7 +2640,7 @@ int amdgpu_ras_init(struct amdgpu_device *adev)
 	/* initialize nbio ras function ahead of any other
 	 * ras functions so hardware fatal error interrupt
 	 * can be enabled as early as possible */
-	switch (adev->ip_versions[NBIO_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, NBIO_HWIP, 0)) {
 	case IP_VERSION(7, 4, 0):
 	case IP_VERSION(7, 4, 1):
 	case IP_VERSION(7, 4, 4):
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
index 595d5e535aca..8ced4be784e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -153,7 +153,7 @@
 
 static bool __is_ras_eeprom_supported(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(11, 0, 2): /* VEGA20 and ARCTURUS */
 	case IP_VERSION(11, 0, 7): /* Sienna cichlid */
 	case IP_VERSION(13, 0, 0):
@@ -191,7 +191,7 @@ static bool __get_eeprom_i2c_addr(struct amdgpu_device *adev,
 		return true;
 	}
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(11, 0, 2):
 		/* VEGA20 and ARCTURUS */
 		if (adev->asic_type == CHIP_VEGA20)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index 02d874799c16..970bfece775c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -30,7 +30,7 @@ int amdgpu_reset_init(struct amdgpu_device *adev)
 {
 	int ret = 0;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(13, 0, 2):
 	case IP_VERSION(13, 0, 6):
 		ret = aldebaran_reset_init(adev);
@@ -52,7 +52,7 @@ int amdgpu_reset_fini(struct amdgpu_device *adev)
 {
 	int ret = 0;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(13, 0, 2):
 	case IP_VERSION(13, 0, 6):
 		ret = aldebaran_reset_fini(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 572f861e3f70..e8cbc4142d80 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -251,8 +251,11 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
 				else {
 					/* Use a single copy per SDMA firmware type. PSP uses the same instance for all
 					 * groups of SDMAs */
-					if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 4, 2) &&
-					    adev->firmware.load_type == AMDGPU_FW_LOAD_PSP &&
+					if (amdgpu_ip_version(adev, SDMA0_HWIP,
+							      0) ==
+						    IP_VERSION(4, 4, 2) &&
+					    adev->firmware.load_type ==
+						    AMDGPU_FW_LOAD_PSP &&
 					    adev->sdma.num_inst_per_aid == i) {
 						break;
 					}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 4e51dce3aab5..05991c5c8ddb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1727,7 +1727,8 @@ static int amdgpu_ttm_reserve_tmr(struct amdgpu_device *adev)
 		reserve_size =
 			amdgpu_atomfirmware_get_fw_reserved_fb_size(adev);
 
-	if (!adev->bios && adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3))
+	if (!adev->bios &&
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3))
 		reserve_size = max(reserve_size, (uint32_t)280 << 20);
 	else if (!reserve_size)
 		reserve_size = DISCOVERY_TMR_OFFSET;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index 5aff383473f2..771ef8017a98 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -1119,7 +1119,7 @@ int amdgpu_ucode_init_bo(struct amdgpu_device *adev)
 static const char *amdgpu_ucode_legacy_naming(struct amdgpu_device *adev, int block_type)
 {
 	if (block_type == MP0_HWIP) {
-		switch (adev->ip_versions[MP0_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, MP0_HWIP, 0)) {
 		case IP_VERSION(9, 0, 0):
 			switch (adev->asic_type) {
 			case CHIP_VEGA10:
@@ -1170,7 +1170,7 @@ static const char *amdgpu_ucode_legacy_naming(struct amdgpu_device *adev, int bl
 			return "yellow_carp";
 		}
 	} else if (block_type == MP1_HWIP) {
-		switch (adev->ip_versions[MP1_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 		case IP_VERSION(9, 0, 0):
 		case IP_VERSION(10, 0, 0):
 		case IP_VERSION(10, 0, 1):
@@ -1196,7 +1196,7 @@ static const char *amdgpu_ucode_legacy_naming(struct amdgpu_device *adev, int bl
 			return "aldebaran_smc";
 		}
 	} else if (block_type == SDMA0_HWIP) {
-		switch (adev->ip_versions[SDMA0_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
 		case IP_VERSION(4, 0, 0):
 			return "vega10_sdma";
 		case IP_VERSION(4, 0, 1):
@@ -1240,7 +1240,7 @@ static const char *amdgpu_ucode_legacy_naming(struct amdgpu_device *adev, int bl
 			return "vangogh_sdma";
 		}
 	} else if (block_type == UVD_HWIP) {
-		switch (adev->ip_versions[UVD_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, UVD_HWIP, 0)) {
 		case IP_VERSION(1, 0, 0):
 		case IP_VERSION(1, 0, 1):
 			if (adev->apu_flags & AMD_APU_IS_RAVEN2)
@@ -1265,7 +1265,8 @@ static const char *amdgpu_ucode_legacy_naming(struct amdgpu_device *adev, int bl
 		case IP_VERSION(3, 0, 0):
 		case IP_VERSION(3, 0, 64):
 		case IP_VERSION(3, 0, 192):
-			if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
+			if (amdgpu_ip_version(adev, GC_HWIP, 0) ==
+			    IP_VERSION(10, 3, 0))
 				return "sienna_cichlid_vcn";
 			return "navy_flounder_vcn";
 		case IP_VERSION(3, 0, 2):
@@ -1278,7 +1279,7 @@ static const char *amdgpu_ucode_legacy_naming(struct amdgpu_device *adev, int bl
 			return "yellow_carp_vcn";
 		}
 	} else if (block_type == GC_HWIP) {
-		switch (adev->ip_versions[GC_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 		case IP_VERSION(9, 0, 1):
 			return "vega10";
 		case IP_VERSION(9, 2, 1):
@@ -1331,7 +1332,7 @@ void amdgpu_ucode_ip_version_decode(struct amdgpu_device *adev, int block_type,
 	int maj, min, rev;
 	char *ip_name;
 	const char *legacy;
-	uint32_t version = adev->ip_versions[block_type][0];
+	uint32_t version = amdgpu_ip_version(adev, block_type, 0);
 
 	legacy = amdgpu_ucode_legacy_naming(adev, block_type);
 	if (legacy) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
index db0d94ca4ffc..24fcc9a2e422 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
@@ -28,7 +28,7 @@ static int amdgpu_umc_convert_error_address(struct amdgpu_device *adev,
 				    struct ras_err_data *err_data, uint64_t err_addr,
 				    uint32_t ch_inst, uint32_t umc_inst)
 {
-	switch (adev->ip_versions[UMC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, UMC_HWIP, 0)) {
 	case IP_VERSION(6, 7, 0):
 		umc_v6_7_convert_error_address(adev,
 				err_data, err_addr, ch_inst, umc_inst);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
index 9da80b54d63e..aeff9926412f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
@@ -581,7 +581,7 @@ int amdgpu_umsch_mm_init_microcode(struct amdgpu_umsch_mm *umsch)
 	const char *fw_name = NULL;
 	int r;
 
-	switch (adev->ip_versions[VCN_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, VCN_HWIP, 0)) {
 	case IP_VERSION(4, 0, 5):
 		fw_name = "amdgpu/umsch_mm_4_0_0.bin";
 		break;
@@ -758,7 +758,7 @@ static int umsch_mm_early_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	switch (adev->ip_versions[VCN_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, VCN_HWIP, 0)) {
 	case IP_VERSION(4, 0, 5):
 		umsch_mm_v4_0_set_funcs(&adev->umsch_mm);
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index 80bcbe744e58..c93f3a4c0e31 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -126,7 +126,7 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 	 * Hence, check for these versions here - notice this is
 	 * restricted to Vangogh (Deck's APU).
 	 */
-	if (adev->ip_versions[UVD_HWIP][0] == IP_VERSION(3, 0, 2)) {
+	if (amdgpu_ip_version(adev, UVD_HWIP, 0) == IP_VERSION(3, 0, 2)) {
 		const char *bios_ver = dmi_get_system_info(DMI_BIOS_VERSION);
 
 		if (bios_ver && (!strncmp("F7A0113", bios_ver, 7) ||
@@ -171,7 +171,7 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP)
 		bo_size += AMDGPU_GPU_PAGE_ALIGN(le32_to_cpu(hdr->ucode_size_bytes) + 8);
 
-	if (adev->ip_versions[UVD_HWIP][0] >= IP_VERSION(4, 0, 0)) {
+	if (amdgpu_ip_version(adev, UVD_HWIP, 0) >= IP_VERSION(4, 0, 0)) {
 		fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn4_fw_shared));
 		log_offset = offsetof(struct amdgpu_vcn4_fw_shared, fw_log);
 	} else {
@@ -267,7 +267,7 @@ static bool amdgpu_vcn_using_unified_queue(struct amdgpu_ring *ring)
 	struct amdgpu_device *adev = ring->adev;
 	bool ret = false;
 
-	if (adev->ip_versions[UVD_HWIP][0] >= IP_VERSION(4, 0, 0))
+	if (amdgpu_ip_version(adev, UVD_HWIP, 0) >= IP_VERSION(4, 0, 0))
 		ret = true;
 
 	return ret;
@@ -998,7 +998,7 @@ int amdgpu_vcn_unified_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 	struct amdgpu_device *adev = ring->adev;
 	long r;
 
-	if (adev->ip_versions[UVD_HWIP][0] != IP_VERSION(4, 0, 3)) {
+	if (amdgpu_ip_version(adev, UVD_HWIP, 0) != IP_VERSION(4, 0, 3)) {
 		r = amdgpu_vcn_enc_ring_test_ib(ring, timeout);
 		if (r)
 			goto error;
@@ -1048,7 +1048,8 @@ void amdgpu_vcn_setup_ucode(struct amdgpu_device *adev)
 			adev->firmware.fw_size +=
 				ALIGN(le32_to_cpu(hdr->ucode_size_bytes), PAGE_SIZE);
 
-			if (adev->ip_versions[UVD_HWIP][0] == IP_VERSION(4, 0, 3))
+			if (amdgpu_ip_version(adev, UVD_HWIP, 0) ==
+			    IP_VERSION(4, 0, 3))
 				break;
 		}
 		dev_info(adev->dev, "Will use PSP to load VCN firmware\n");
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 96857ae7fb5b..a0aa624f5a92 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -837,7 +837,7 @@ enum amdgpu_sriov_vf_mode amdgpu_virt_get_sriov_vf_mode(struct amdgpu_device *ad
 
 void amdgpu_virt_post_reset(struct amdgpu_device *adev)
 {
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(11, 0, 3)) {
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(11, 0, 3)) {
 		/* force set to GFXOFF state after reset,
 		 * to avoid some invalid operation before GC enable
 		 */
@@ -847,7 +847,7 @@ void amdgpu_virt_post_reset(struct amdgpu_device *adev)
 
 bool amdgpu_virt_fw_load_skip_check(struct amdgpu_device *adev, uint32_t ucode_id)
 {
-	switch (adev->ip_versions[MP0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP0_HWIP, 0)) {
 	case IP_VERSION(13, 0, 0):
 		/* no vf autoload, white list */
 		if (ucode_id == AMDGPU_UCODE_ID_VCN1 ||
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 07a4bcbeb4b8..c2dd01094551 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -802,12 +802,12 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	 * heavy-weight flush TLB unconditionally.
 	 */
 	flush_tlb |= adev->gmc.xgmi.num_physical_nodes &&
-		     adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 0);
+		     amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 0);
 
 	/*
 	 * On GFX8 and older any 8 PTE block with a valid bit set enters the TLB
 	 */
-	flush_tlb |= adev->ip_versions[GC_HWIP][0] < IP_VERSION(9, 0, 0);
+	flush_tlb |= amdgpu_ip_version(adev, GC_HWIP, 0) < IP_VERSION(9, 0, 0);
 
 	memset(&params, 0, sizeof(params));
 	params.adev = adev;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
index ae070072705a..a68354d03a49 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
@@ -123,7 +123,7 @@ static int vpe_early_init(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct amdgpu_vpe *vpe = &adev->vpe;
 
-	switch (adev->ip_versions[VPE_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, VPE_HWIP, 0)) {
 	case IP_VERSION(6, 1, 0):
 		vpe_v6_1_set_funcs(vpe);
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 7e91b24784e5..061534e845a7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -948,7 +948,8 @@ static int amdgpu_xgmi_query_pcs_error_status(struct amdgpu_device *adev,
 	uint32_t field_array_size = 0;
 
 	if (is_xgmi_pcs) {
-		if (adev->ip_versions[XGMI_HWIP][0] == IP_VERSION(6, 1, 0)) {
+		if (amdgpu_ip_version(adev, XGMI_HWIP, 0) ==
+		    IP_VERSION(6, 1, 0)) {
 			pcs_ras_fields = &xgmi3x16_pcs_ras_fields[0];
 			field_array_size = ARRAY_SIZE(xgmi3x16_pcs_ras_fields);
 		} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/athub_v1_0.c b/drivers/gpu/drm/amd/amdgpu/athub_v1_0.c
index a13c443ea10f..42f4e163e251 100644
--- a/drivers/gpu/drm/amd/amdgpu/athub_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/athub_v1_0.c
@@ -68,7 +68,7 @@ int athub_v1_0_set_clockgating(struct amdgpu_device *adev,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[ATHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, ATHUB_HWIP, 0)) {
 	case IP_VERSION(9, 0, 0):
 	case IP_VERSION(9, 1, 0):
 	case IP_VERSION(9, 2, 0):
diff --git a/drivers/gpu/drm/amd/amdgpu/athub_v2_0.c b/drivers/gpu/drm/amd/amdgpu/athub_v2_0.c
index a9521c98e7f7..5a122f50a6e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/athub_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/athub_v2_0.c
@@ -77,7 +77,7 @@ int athub_v2_0_set_clockgating(struct amdgpu_device *adev,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[ATHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, ATHUB_HWIP, 0)) {
 	case IP_VERSION(1, 3, 1):
 	case IP_VERSION(2, 0, 0):
 	case IP_VERSION(2, 0, 2):
diff --git a/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c b/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c
index 78508ae6a670..e143fcc46148 100644
--- a/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c
@@ -70,7 +70,7 @@ int athub_v2_1_set_clockgating(struct amdgpu_device *adev,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[ATHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, ATHUB_HWIP, 0)) {
 	case IP_VERSION(2, 1, 0):
 	case IP_VERSION(2, 1, 1):
 	case IP_VERSION(2, 1, 2):
diff --git a/drivers/gpu/drm/amd/amdgpu/athub_v3_0.c b/drivers/gpu/drm/amd/amdgpu/athub_v3_0.c
index f0e235f98afb..5a318bc03d23 100644
--- a/drivers/gpu/drm/amd/amdgpu/athub_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/athub_v3_0.c
@@ -36,7 +36,7 @@ static uint32_t athub_v3_0_get_cg_cntl(struct amdgpu_device *adev)
 {
 	uint32_t data;
 
-	switch (adev->ip_versions[ATHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, ATHUB_HWIP, 0)) {
 	case IP_VERSION(3, 0, 1):
 		data = RREG32_SOC15(ATHUB, 0, regATHUB_MISC_CNTL_V3_0_1);
 		break;
@@ -49,7 +49,7 @@ static uint32_t athub_v3_0_get_cg_cntl(struct amdgpu_device *adev)
 
 static void athub_v3_0_set_cg_cntl(struct amdgpu_device *adev, uint32_t data)
 {
-	switch (adev->ip_versions[ATHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, ATHUB_HWIP, 0)) {
 	case IP_VERSION(3, 0, 1):
 		WREG32_SOC15(ATHUB, 0, regATHUB_MISC_CNTL_V3_0_1, data);
 		break;
@@ -99,7 +99,7 @@ int athub_v3_0_set_clockgating(struct amdgpu_device *adev,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[ATHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, ATHUB_HWIP, 0)) {
 	case IP_VERSION(3, 0, 0):
 	case IP_VERSION(3, 0, 1):
 	case IP_VERSION(3, 0, 2):
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 62329a822022..35357364b5b3 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -3627,7 +3627,7 @@ static void gfx_v10_0_set_kiq_pm4_funcs(struct amdgpu_device *adev)
 
 static void gfx_v10_0_init_spm_golden_registers(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 1, 10):
 		soc15_program_register_sequence(adev,
 						golden_settings_gc_rlc_spm_10_0_nv10,
@@ -3650,7 +3650,7 @@ static void gfx_v10_0_init_spm_golden_registers(struct amdgpu_device *adev)
 
 static void gfx_v10_0_init_golden_registers(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 1, 10):
 		soc15_program_register_sequence(adev,
 						golden_settings_gc_10_1,
@@ -3891,7 +3891,7 @@ static void gfx_v10_0_check_fw_write_wait(struct amdgpu_device *adev)
 {
 	adev->gfx.cp_fw_write_wait = false;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 1, 10):
 	case IP_VERSION(10, 1, 2):
 	case IP_VERSION(10, 1, 1):
@@ -3942,7 +3942,7 @@ static bool gfx_v10_0_navi10_gfxoff_should_enable(struct amdgpu_device *adev)
 
 static void gfx_v10_0_check_gfxoff_flag(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 1, 10):
 		if (!gfx_v10_0_navi10_gfxoff_should_enable(adev))
 			adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
@@ -3964,8 +3964,8 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 
 	DRM_DEBUG("\n");
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 1) &&
-	   (!(adev->pdev->device == 0x7340 && adev->pdev->revision != 0x00)))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(10, 1, 1) &&
+	    (!(adev->pdev->device == 0x7340 && adev->pdev->revision != 0x00)))
 		wks = "_wks";
 	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
@@ -4144,7 +4144,7 @@ static void gfx_v10_0_init_rlcg_reg_access_ctrl(struct amdgpu_device *adev)
 	reg_access_ctrl->scratch_reg3 = SOC15_REG_OFFSET(GC, 0, mmSCRATCH_REG3);
 	reg_access_ctrl->grbm_cntl = SOC15_REG_OFFSET(GC, 0, mmGRBM_GFX_CNTL);
 	reg_access_ctrl->grbm_idx = SOC15_REG_OFFSET(GC, 0, mmGRBM_GFX_INDEX);
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 0):
 		reg_access_ctrl->spare_int =
 			SOC15_REG_OFFSET(GC, 0, mmRLC_SPARE_INT_0_Sienna_Cichlid);
@@ -4358,7 +4358,7 @@ static void gfx_v10_0_gpu_early_init(struct amdgpu_device *adev)
 {
 	u32 gb_addr_config;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 1, 10):
 	case IP_VERSION(10, 1, 1):
 	case IP_VERSION(10, 1, 2):
@@ -4491,7 +4491,7 @@ static int gfx_v10_0_sw_init(void *handle)
 	struct amdgpu_kiq *kiq;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 1, 10):
 	case IP_VERSION(10, 1, 1):
 	case IP_VERSION(10, 1, 2):
@@ -4749,9 +4749,12 @@ static void gfx_v10_0_setup_rb(struct amdgpu_device *adev)
 	for (i = 0; i < adev->gfx.config.max_shader_engines; i++) {
 		for (j = 0; j < adev->gfx.config.max_sh_per_se; j++) {
 			bitmap = i * adev->gfx.config.max_sh_per_se + j;
-			if (((adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0)) ||
-				(adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 3)) ||
-				(adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 6))) &&
+			if (((amdgpu_ip_version(adev, GC_HWIP, 0) ==
+			      IP_VERSION(10, 3, 0)) ||
+			     (amdgpu_ip_version(adev, GC_HWIP, 0) ==
+			      IP_VERSION(10, 3, 3)) ||
+			     (amdgpu_ip_version(adev, GC_HWIP, 0) ==
+			      IP_VERSION(10, 3, 6))) &&
 			    ((gfx_v10_3_get_disabled_sa(adev) >> bitmap) & 1))
 				continue;
 			gfx_v10_0_select_se_sh(adev, i, j, 0xffffffff, 0);
@@ -4779,7 +4782,7 @@ static u32 gfx_v10_0_init_pa_sc_tile_steering_override(struct amdgpu_device *ade
 	/* for ASICs that integrates GFX v10.3
 	 * pa_sc_tile_steering_override should be set to 0
 	 */
-	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(10, 3, 0))
 		return 0;
 
 	/* init num_sc */
@@ -4960,7 +4963,7 @@ static void gfx_v10_0_get_tcc_info(struct amdgpu_device *adev)
 	/* TCCs are global (not instanced). */
 	uint32_t tcc_disable;
 
-	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0)) {
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(10, 3, 0)) {
 		tcc_disable = RREG32_SOC15(GC, 0, mmCGTS_TCC_DISABLE_gc_10_3) |
 			      RREG32_SOC15(GC, 0, mmCGTS_USER_TCC_DISABLE_gc_10_3);
 	} else {
@@ -5037,7 +5040,7 @@ static int gfx_v10_0_init_csb(struct amdgpu_device *adev)
 	adev->gfx.rlc.funcs->get_csb_buffer(adev, adev->gfx.rlc.cs_ptr);
 
 	/* csib */
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 2)) {
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(10, 1, 2)) {
 		WREG32_SOC15_RLC(GC, 0, mmRLC_CSIB_ADDR_HI,
 				adev->gfx.rlc.clear_state_gpu_addr >> 32);
 		WREG32_SOC15_RLC(GC, 0, mmRLC_CSIB_ADDR_LO,
@@ -5666,7 +5669,7 @@ static int gfx_v10_0_cp_gfx_enable(struct amdgpu_device *adev, bool enable)
 	tmp = REG_SET_FIELD(tmp, CP_ME_CNTL, PFP_HALT, enable ? 0 : 1);
 	tmp = REG_SET_FIELD(tmp, CP_ME_CNTL, CE_HALT, enable ? 0 : 1);
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 2))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(10, 1, 2))
 		WREG32_SOC15_RLC(GC, 0, mmCP_ME_CNTL, tmp);
 	else
 		WREG32_SOC15(GC, 0, mmCP_ME_CNTL, tmp);
@@ -6057,7 +6060,7 @@ static void gfx_v10_0_cp_gfx_set_doorbell(struct amdgpu_device *adev,
 		}
 		WREG32_SOC15(GC, 0, mmCP_RB_DOORBELL_CONTROL, tmp);
 	}
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 0):
 	case IP_VERSION(10, 3, 2):
 	case IP_VERSION(10, 3, 1):
@@ -6190,7 +6193,7 @@ static int gfx_v10_0_cp_gfx_resume(struct amdgpu_device *adev)
 static void gfx_v10_0_cp_compute_enable(struct amdgpu_device *adev, bool enable)
 {
 	if (enable) {
-		switch (adev->ip_versions[GC_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 		case IP_VERSION(10, 3, 0):
 		case IP_VERSION(10, 3, 2):
 		case IP_VERSION(10, 3, 1):
@@ -6206,7 +6209,7 @@ static void gfx_v10_0_cp_compute_enable(struct amdgpu_device *adev, bool enable)
 			break;
 		}
 	} else {
-		switch (adev->ip_versions[GC_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 		case IP_VERSION(10, 3, 0):
 		case IP_VERSION(10, 3, 2):
 		case IP_VERSION(10, 3, 1):
@@ -6306,7 +6309,7 @@ static void gfx_v10_0_kiq_setting(struct amdgpu_ring *ring)
 	struct amdgpu_device *adev = ring->adev;
 
 	/* tell RLC which is KIQ queue */
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 0):
 	case IP_VERSION(10, 3, 2):
 	case IP_VERSION(10, 3, 1):
@@ -6917,7 +6920,7 @@ static bool gfx_v10_0_check_grbm_cam_remapping(struct amdgpu_device *adev)
 	 * check if mmVGT_ESGS_RING_SIZE_UMD
 	 * has been remapped to mmVGT_ESGS_RING_SIZE
 	 */
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 0):
 	case IP_VERSION(10, 3, 2):
 	case IP_VERSION(10, 3, 4):
@@ -6966,7 +6969,7 @@ static void gfx_v10_0_setup_grbm_cam_remapping(struct amdgpu_device *adev)
 	 */
 	WREG32_SOC15(GC, 0, mmGRBM_CAM_INDEX, 0);
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 0):
 	case IP_VERSION(10, 3, 2):
 	case IP_VERSION(10, 3, 1):
@@ -7139,19 +7142,19 @@ static int gfx_v10_0_hw_init(void *handle)
 	 * init golden registers and rlc resume may override some registers,
 	 * reconfig them here
 	 */
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 10) ||
-	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 1) ||
-	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 2))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(10, 1, 10) ||
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(10, 1, 1) ||
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(10, 1, 2))
 		gfx_v10_0_tcp_harvest(adev);
 
 	r = gfx_v10_0_cp_resume(adev);
 	if (r)
 		return r;
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(10, 3, 0))
 		gfx_v10_3_program_pbb_mode(adev);
 
-	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(10, 3, 0))
 		gfx_v10_3_set_power_brake_sequence(adev);
 
 	return r;
@@ -7255,7 +7258,7 @@ static int gfx_v10_0_soft_reset(void *handle)
 
 	/* GRBM_STATUS2 */
 	tmp = RREG32_SOC15(GC, 0, mmGRBM_STATUS2);
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 0):
 	case IP_VERSION(10, 3, 2):
 	case IP_VERSION(10, 3, 1):
@@ -7312,7 +7315,7 @@ static uint64_t gfx_v10_0_get_gpu_clock_counter(struct amdgpu_device *adev)
 {
 	uint64_t clock, clock_lo, clock_hi, hi_check;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 1):
 	case IP_VERSION(10, 3, 3):
 	case IP_VERSION(10, 3, 7):
@@ -7399,7 +7402,7 @@ static int gfx_v10_0_early_init(void *handle)
 
 	adev->gfx.funcs = &gfx_v10_0_gfx_funcs;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 1, 10):
 	case IP_VERSION(10, 1, 1):
 	case IP_VERSION(10, 1, 2):
@@ -7470,7 +7473,7 @@ static void gfx_v10_0_set_safe_mode(struct amdgpu_device *adev, int xcc_id)
 	data = RLC_SAFE_MODE__CMD_MASK;
 	data |= (1 << RLC_SAFE_MODE__MESSAGE__SHIFT);
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 0):
 	case IP_VERSION(10, 3, 2):
 	case IP_VERSION(10, 3, 1):
@@ -7508,7 +7511,7 @@ static void gfx_v10_0_unset_safe_mode(struct amdgpu_device *adev, int xcc_id)
 	uint32_t data;
 
 	data = RLC_SAFE_MODE__CMD_MASK;
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 0):
 	case IP_VERSION(10, 3, 2):
 	case IP_VERSION(10, 3, 1):
@@ -7819,7 +7822,7 @@ static void gfx_v10_0_apply_medium_grain_clock_gating_workaround(struct amdgpu_d
 		mmCGTS_SA1_QUAD1_SM_CTRL_REG
 	};
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 2)) {
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(10, 1, 2)) {
 		for (i = 0; i < ARRAY_SIZE(tcp_ctrl_regs_nv12); i++) {
 			reg_idx = adev->reg_offset[GC_HWIP][0][mmCGTS_SA0_WGP00_CU0_TCP_CTRL_REG_BASE_IDX] +
 				  tcp_ctrl_regs_nv12[i];
@@ -7864,9 +7867,12 @@ static int gfx_v10_0_update_gfx_clock_gating(struct amdgpu_device *adev,
 		/* ===  CGCG + CGLS === */
 		gfx_v10_0_update_coarse_grain_clock_gating(adev, enable);
 
-		if ((adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 10)) ||
-		    (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 1)) ||
-		    (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 2)))
+		if ((amdgpu_ip_version(adev, GC_HWIP, 0) ==
+		     IP_VERSION(10, 1, 10)) ||
+		    (amdgpu_ip_version(adev, GC_HWIP, 0) ==
+		     IP_VERSION(10, 1, 1)) ||
+		    (amdgpu_ip_version(adev, GC_HWIP, 0) ==
+		     IP_VERSION(10, 1, 2)))
 			gfx_v10_0_apply_medium_grain_clock_gating_workaround(adev);
 	} else {
 		/* CGCG/CGLS should be disabled before MGCG/MGLS
@@ -7966,7 +7972,7 @@ static void gfx_v10_cntl_power_gating(struct amdgpu_device *adev, bool enable)
 	 * Power/performance team will optimize it and might give a new value later.
 	 */
 	if (enable && (adev->pg_flags & AMD_PG_SUPPORT_GFX_PG)) {
-		switch (adev->ip_versions[GC_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 		case IP_VERSION(10, 3, 1):
 		case IP_VERSION(10, 3, 3):
 		case IP_VERSION(10, 3, 6):
@@ -8027,7 +8033,7 @@ static int gfx_v10_0_set_powergating_state(void *handle,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 1, 10):
 	case IP_VERSION(10, 1, 1):
 	case IP_VERSION(10, 1, 2):
@@ -8064,7 +8070,7 @@ static int gfx_v10_0_set_clockgating_state(void *handle,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 1, 10):
 	case IP_VERSION(10, 1, 1):
 	case IP_VERSION(10, 1, 2):
@@ -9311,7 +9317,7 @@ static void gfx_v10_0_set_irq_funcs(struct amdgpu_device *adev)
 
 static void gfx_v10_0_set_rlc_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 1, 10):
 	case IP_VERSION(10, 1, 1):
 	case IP_VERSION(10, 1, 3):
@@ -9428,10 +9434,14 @@ static int gfx_v10_0_get_cu_info(struct amdgpu_device *adev,
 	for (i = 0; i < adev->gfx.config.max_shader_engines; i++) {
 		for (j = 0; j < adev->gfx.config.max_sh_per_se; j++) {
 			bitmap = i * adev->gfx.config.max_sh_per_se + j;
-			if (((adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0)) ||
-			     (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 3)) ||
-			     (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 6)) ||
-			     (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 7))) &&
+			if (((amdgpu_ip_version(adev, GC_HWIP, 0) ==
+			      IP_VERSION(10, 3, 0)) ||
+			     (amdgpu_ip_version(adev, GC_HWIP, 0) ==
+			      IP_VERSION(10, 3, 3)) ||
+			     (amdgpu_ip_version(adev, GC_HWIP, 0) ==
+			      IP_VERSION(10, 3, 6)) ||
+			     (amdgpu_ip_version(adev, GC_HWIP, 0) ==
+			      IP_VERSION(10, 3, 7))) &&
 			    ((gfx_v10_3_get_disabled_sa(adev) >> bitmap) & 1))
 				continue;
 			mask = 1;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 39c434ca0dad..42fc0cc13fdd 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -288,7 +288,7 @@ static void gfx_v11_0_set_kiq_pm4_funcs(struct amdgpu_device *adev)
 
 static void gfx_v11_0_init_golden_registers(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(11, 0, 1):
 	case IP_VERSION(11, 0, 4):
 		soc15_program_register_sequence(adev,
@@ -493,7 +493,7 @@ static int gfx_v11_0_init_toc_microcode(struct amdgpu_device *adev, const char *
 
 static void gfx_v11_0_check_fw_cp_gfx_shadow(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 2):
 	case IP_VERSION(11, 0, 3):
@@ -884,8 +884,7 @@ static const struct amdgpu_gfx_funcs gfx_v11_0_gfx_funcs = {
 
 static int gfx_v11_0_gpu_early_init(struct amdgpu_device *adev)
 {
-
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 2):
 		adev->gfx.config.max_hw_contexts = 8;
@@ -1332,7 +1331,7 @@ static int gfx_v11_0_sw_init(void *handle)
 
 	adev->gfxhub.funcs->init(adev);
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 2):
 	case IP_VERSION(11, 0, 3):
@@ -1364,8 +1363,8 @@ static int gfx_v11_0_sw_init(void *handle)
 	}
 
 	/* Enable CG flag in one VF mode for enabling RLC safe mode enter/exit */
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(11, 0, 3) &&
-		amdgpu_sriov_is_pp_one_vf(adev))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(11, 0, 3) &&
+	    amdgpu_sriov_is_pp_one_vf(adev))
 		adev->cg_flags = AMD_CG_SUPPORT_GFX_CGCG;
 
 	/* EOP Event */
@@ -2592,9 +2591,11 @@ static int gfx_v11_0_wait_for_rlc_autoload_complete(struct amdgpu_device *adev)
 	for (i = 0; i < adev->usec_timeout; i++) {
 		cp_status = RREG32_SOC15(GC, 0, regCP_STAT);
 
-		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(11, 0, 1) ||
-				adev->ip_versions[GC_HWIP][0] == IP_VERSION(11, 0, 4) ||
-				adev->ip_versions[GC_HWIP][0] == IP_VERSION(11, 5, 0))
+		if (amdgpu_ip_version(adev, GC_HWIP, 0) ==
+			    IP_VERSION(11, 0, 1) ||
+		    amdgpu_ip_version(adev, GC_HWIP, 0) ==
+			    IP_VERSION(11, 0, 4) ||
+		    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(11, 5, 0))
 			bootload_status = RREG32_SOC15(GC, 0,
 					regRLC_RLCS_BOOTLOAD_STATUS_gc_11_0_1);
 		else
@@ -5025,7 +5026,7 @@ static void gfx_v11_cntl_power_gating(struct amdgpu_device *adev, bool enable)
 
 	// Program RLC_PG_DELAY3 for CGPG hysteresis
 	if (enable && (adev->pg_flags & AMD_PG_SUPPORT_GFX_PG)) {
-		switch (adev->ip_versions[GC_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 		case IP_VERSION(11, 0, 1):
 		case IP_VERSION(11, 0, 4):
 			WREG32_SOC15(GC, 0, regRLC_PG_DELAY_3, RLC_PG_DELAY_3_DEFAULT_GC_11_0_1);
@@ -5054,7 +5055,7 @@ static int gfx_v11_0_set_powergating_state(void *handle,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 2):
 	case IP_VERSION(11, 0, 3):
@@ -5086,7 +5087,7 @@ static int gfx_v11_0_set_clockgating_state(void *handle,
 	if (amdgpu_sriov_vf(adev))
 	        return 0;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 1):
 	case IP_VERSION(11, 0, 2):
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index f99a3a6bfd91..e3ff6e46f3f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -895,7 +895,7 @@ static void gfx_v9_0_set_kiq_pm4_funcs(struct amdgpu_device *adev)
 
 static void gfx_v9_0_init_golden_registers(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 0, 1):
 		soc15_program_register_sequence(adev,
 						golden_settings_gc_9_0,
@@ -951,8 +951,8 @@ static void gfx_v9_0_init_golden_registers(struct amdgpu_device *adev)
 		break;
 	}
 
-	if ((adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 4, 1)) &&
-	    (adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 4, 2)))
+	if ((amdgpu_ip_version(adev, GC_HWIP, 0) != IP_VERSION(9, 4, 1)) &&
+	    (amdgpu_ip_version(adev, GC_HWIP, 0) != IP_VERSION(9, 4, 2)))
 		soc15_program_register_sequence(adev, golden_settings_gc_9_x_common,
 						(const u32)ARRAY_SIZE(golden_settings_gc_9_x_common));
 }
@@ -1095,14 +1095,14 @@ static void gfx_v9_0_check_fw_write_wait(struct amdgpu_device *adev)
 	adev->gfx.me_fw_write_wait = false;
 	adev->gfx.mec_fw_write_wait = false;
 
-	if ((adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 4, 1)) &&
+	if ((amdgpu_ip_version(adev, GC_HWIP, 0) != IP_VERSION(9, 4, 1)) &&
 	    ((adev->gfx.mec_fw_version < 0x000001a5) ||
-	    (adev->gfx.mec_feature_version < 46) ||
-	    (adev->gfx.pfp_fw_version < 0x000000b7) ||
-	    (adev->gfx.pfp_feature_version < 46)))
+	     (adev->gfx.mec_feature_version < 46) ||
+	     (adev->gfx.pfp_fw_version < 0x000000b7) ||
+	     (adev->gfx.pfp_feature_version < 46)))
 		DRM_WARN_ONCE("CP firmware version too old, please update!");
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 0, 1):
 		if ((adev->gfx.me_fw_version >= 0x0000009c) &&
 		    (adev->gfx.me_feature_version >= 42) &&
@@ -1202,7 +1202,7 @@ static bool is_raven_kicker(struct amdgpu_device *adev)
 
 static bool check_if_enlarge_doorbell_range(struct amdgpu_device *adev)
 {
-	if ((adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 3, 0)) &&
+	if ((amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 3, 0)) &&
 	    (adev->gfx.me_fw_version >= 0x000000a5) &&
 	    (adev->gfx.me_feature_version >= 52))
 		return true;
@@ -1215,7 +1215,7 @@ static void gfx_v9_0_check_if_need_gfxoff(struct amdgpu_device *adev)
 	if (gfx_v9_0_should_disable_gfxoff(adev->pdev))
 		adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 0, 1):
 	case IP_VERSION(9, 2, 1):
 	case IP_VERSION(9, 4, 0):
@@ -1326,9 +1326,9 @@ static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev,
 
 static bool gfx_v9_0_load_mec2_fw_bin_support(struct amdgpu_device *adev)
 {
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2) ||
-	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1) ||
-	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 3, 0))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 2) ||
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 1) ||
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 3, 0))
 		return false;
 
 	return true;
@@ -1485,7 +1485,7 @@ static void gfx_v9_0_init_always_on_cu_mask(struct amdgpu_device *adev)
 
 	if (adev->flags & AMD_IS_APU)
 		always_on_cu_num = 4;
-	else if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 2, 1))
+	else if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 2, 1))
 		always_on_cu_num = 8;
 	else
 		always_on_cu_num = 12;
@@ -1836,7 +1836,7 @@ static int gfx_v9_0_gpu_early_init(struct amdgpu_device *adev)
 	u32 gb_addr_config;
 	int err;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 0, 1):
 		adev->gfx.config.max_hw_contexts = 8;
 		adev->gfx.config.sc_prim_fifo_size_frontend = 0x20;
@@ -2002,7 +2002,7 @@ static int gfx_v9_0_sw_init(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	unsigned int hw_prio;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 0, 1):
 	case IP_VERSION(9, 2, 1):
 	case IP_VERSION(9, 4, 0):
@@ -2363,7 +2363,7 @@ static void gfx_v9_0_init_sq_config(struct amdgpu_device *adev)
 {
 	uint32_t tmp;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 4, 1):
 		tmp = RREG32_SOC15(GC, 0, mmSQ_CONFIG);
 		tmp = REG_SET_FIELD(tmp, SQ_CONFIG, DISABLE_BARRIER_WAITCNT,
@@ -2700,7 +2700,7 @@ static void gfx_v9_0_init_gfx_power_gating(struct amdgpu_device *adev)
 		/* program GRBM_REG_SAVE_GFX_IDLE_THRESHOLD to 0x55f0 */
 		data |= (0x55f0 << RLC_AUTO_PG_CTRL__GRBM_REG_SAVE_GFX_IDLE_THRESHOLD__SHIFT);
 		WREG32(SOC15_REG_OFFSET(GC, 0, mmRLC_AUTO_PG_CTRL), data);
-		if (adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 3, 0))
+		if (amdgpu_ip_version(adev, GC_HWIP, 0) != IP_VERSION(9, 3, 0))
 			pwr_10_0_gfxip_control_over_cgpg(adev, true);
 	}
 }
@@ -2812,7 +2812,8 @@ static void gfx_v9_0_init_pg(struct amdgpu_device *adev)
 	 * And it's needed by gfxoff feature.
 	 */
 	if (adev->gfx.rlc.is_rlc_v2_1) {
-		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 2, 1) ||
+		if (amdgpu_ip_version(adev, GC_HWIP, 0) ==
+			    IP_VERSION(9, 2, 1) ||
 		    (adev->apu_flags & AMD_APU_IS_RAVEN2))
 			gfx_v9_1_init_rlc_save_restore_list(adev);
 		gfx_v9_0_enable_save_restore_machine(adev);
@@ -2925,7 +2926,7 @@ static int gfx_v9_0_rlc_resume(struct amdgpu_device *adev)
 			return r;
 	}
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 2, 2):
 	case IP_VERSION(9, 1, 0):
 		gfx_v9_0_init_lbpw(adev);
@@ -3713,8 +3714,8 @@ static void gfx_v9_0_init_tcp_config(struct amdgpu_device *adev)
 {
 	u32 tmp;
 
-	if (adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 4, 1) &&
-	    adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 4, 2))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) != IP_VERSION(9, 4, 1) &&
+	    amdgpu_ip_version(adev, GC_HWIP, 0) != IP_VERSION(9, 4, 2))
 		return;
 
 	tmp = RREG32_SOC15(GC, 0, mmTCP_ADDR_CONFIG);
@@ -3754,7 +3755,7 @@ static int gfx_v9_0_hw_init(void *handle)
 	if (r)
 		return r;
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 2))
 		gfx_v9_4_2_set_power_brake_sequence(adev);
 
 	return r;
@@ -3802,7 +3803,7 @@ static int gfx_v9_0_hw_fini(void *handle)
 
 	/* Skip stopping RLC with A+A reset or when RLC controls GFX clock */
 	if ((adev->gmc.xgmi.connected_to_cpu && amdgpu_in_reset(adev)) ||
-	    (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(9, 4, 2))) {
+	    (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(9, 4, 2))) {
 		dev_dbg(adev->dev, "Skipping RLC halt\n");
 		return 0;
 	}
@@ -3986,7 +3987,7 @@ static uint64_t gfx_v9_0_get_gpu_clock_counter(struct amdgpu_device *adev)
 {
 	uint64_t clock, clock_lo, clock_hi, hi_check;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 3, 0):
 		preempt_disable();
 		clock_hi = RREG32_SOC15_NO_KIQ(SMUIO, 0, mmGOLDEN_TSC_COUNT_UPPER_Renoir);
@@ -4005,7 +4006,9 @@ static uint64_t gfx_v9_0_get_gpu_clock_counter(struct amdgpu_device *adev)
 	default:
 		amdgpu_gfx_off_ctrl(adev, false);
 		mutex_lock(&adev->gfx.gpu_clock_mutex);
-		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 0, 1) && amdgpu_sriov_runtime(adev)) {
+		if (amdgpu_ip_version(adev, GC_HWIP, 0) ==
+			    IP_VERSION(9, 0, 1) &&
+		    amdgpu_sriov_runtime(adev)) {
 			clock = gfx_v9_0_kiq_read_clock(adev);
 		} else {
 			WREG32_SOC15(GC, 0, mmRLC_CAPTURE_GPU_CLOCK_COUNT, 1);
@@ -4357,7 +4360,7 @@ static int gfx_v9_0_do_edc_gpr_workarounds(struct amdgpu_device *adev)
 	if (!ring->sched.ready)
 		return 0;
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1)) {
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 1)) {
 		vgpr_init_shader_ptr = vgpr_init_compute_shader_arcturus;
 		vgpr_init_shader_size = sizeof(vgpr_init_compute_shader_arcturus);
 		vgpr_init_regs_ptr = vgpr_init_regs_arcturus;
@@ -4509,8 +4512,8 @@ static int gfx_v9_0_early_init(void *handle)
 
 	adev->gfx.funcs = &gfx_v9_0_gfx_funcs;
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1) ||
-	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 1) ||
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 2))
 		adev->gfx.num_gfx_rings = 0;
 	else
 		adev->gfx.num_gfx_rings = GFX9_NUM_GFX_RINGS;
@@ -4548,7 +4551,7 @@ static int gfx_v9_0_ecc_late_init(void *handle)
 	}
 
 	/* requires IBs so do in late init after IB pool is initialized */
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 2))
 		r = gfx_v9_4_2_do_edc_gpr_workarounds(adev);
 	else
 		r = gfx_v9_0_do_edc_gpr_workarounds(adev);
@@ -4580,7 +4583,7 @@ static int gfx_v9_0_late_init(void *handle)
 	if (r)
 		return r;
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 2))
 		gfx_v9_4_2_debug_trap_config_init(adev,
 			adev->vm_manager.first_kfd_vmid, AMDGPU_NUM_VMID);
 	else
@@ -4676,7 +4679,7 @@ static void gfx_v9_0_update_medium_grain_clock_gating(struct amdgpu_device *adev
 		/* 1 - RLC_CGTT_MGCG_OVERRIDE */
 		def = data = RREG32_SOC15(GC, 0, mmRLC_CGTT_MGCG_OVERRIDE);
 
-		if (adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 2, 1))
+		if (amdgpu_ip_version(adev, GC_HWIP, 0) != IP_VERSION(9, 2, 1))
 			data &= ~RLC_CGTT_MGCG_OVERRIDE__CPF_CGTT_SCLK_OVERRIDE_MASK;
 
 		data &= ~(RLC_CGTT_MGCG_OVERRIDE__GRBM_CGTT_SCLK_OVERRIDE_MASK |
@@ -4710,7 +4713,7 @@ static void gfx_v9_0_update_medium_grain_clock_gating(struct amdgpu_device *adev
 		/* 1 - MGCG_OVERRIDE */
 		def = data = RREG32_SOC15(GC, 0, mmRLC_CGTT_MGCG_OVERRIDE);
 
-		if (adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 2, 1))
+		if (amdgpu_ip_version(adev, GC_HWIP, 0) != IP_VERSION(9, 2, 1))
 			data |= RLC_CGTT_MGCG_OVERRIDE__CPF_CGTT_SCLK_OVERRIDE_MASK;
 
 		data |= (RLC_CGTT_MGCG_OVERRIDE__RLC_CGTT_SCLK_OVERRIDE_MASK |
@@ -4816,7 +4819,7 @@ static void gfx_v9_0_update_coarse_grain_clock_gating(struct amdgpu_device *adev
 		/* enable cgcg FSM(0x0000363F) */
 		def = RREG32_SOC15(GC, 0, mmRLC_CGCG_CGLS_CTRL);
 
-		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1))
+		if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 1))
 			data = (0x2000 << RLC_CGCG_CGLS_CTRL__CGCG_GFX_IDLE_THRESHOLD__SHIFT) |
 				RLC_CGCG_CGLS_CTRL__CGCG_EN_MASK;
 		else
@@ -4951,7 +4954,7 @@ static int gfx_v9_0_set_powergating_state(void *handle,
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	bool enable = (state == AMD_PG_STATE_GATE);
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 2, 2):
 	case IP_VERSION(9, 1, 0):
 	case IP_VERSION(9, 3, 0):
@@ -4998,7 +5001,7 @@ static int gfx_v9_0_set_clockgating_state(void *handle,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 0, 1):
 	case IP_VERSION(9, 2, 1):
 	case IP_VERSION(9, 4, 0):
@@ -5048,7 +5051,7 @@ static void gfx_v9_0_get_clockgating_state(void *handle, u64 *flags)
 	if (data & CP_MEM_SLP_CNTL__CP_MEM_LS_EN_MASK)
 		*flags |= AMD_CG_SUPPORT_GFX_CP_LS | AMD_CG_SUPPORT_GFX_MGLS;
 
-	if (adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 4, 1)) {
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) != IP_VERSION(9, 4, 1)) {
 		/* AMD_CG_SUPPORT_GFX_3D_CGCG */
 		data = RREG32_KIQ(SOC15_REG_OFFSET(GC, 0, mmRLC_CGCG_CGLS_CTRL_3D));
 		if (data & RLC_CGCG_CGLS_CTRL_3D__CGCG_EN_MASK)
@@ -7087,7 +7090,7 @@ static void gfx_v9_0_set_irq_funcs(struct amdgpu_device *adev)
 
 static void gfx_v9_0_set_rlc_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 0, 1):
 	case IP_VERSION(9, 2, 1):
 	case IP_VERSION(9, 4, 0):
@@ -7106,7 +7109,7 @@ static void gfx_v9_0_set_rlc_funcs(struct amdgpu_device *adev)
 static void gfx_v9_0_set_gds_init(struct amdgpu_device *adev)
 {
 	/* init asci gds info */
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 0, 1):
 	case IP_VERSION(9, 2, 1):
 	case IP_VERSION(9, 4, 0):
@@ -7128,7 +7131,7 @@ static void gfx_v9_0_set_gds_init(struct amdgpu_device *adev)
 		break;
 	}
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 0, 1):
 	case IP_VERSION(9, 4, 0):
 		adev->gds.gds_compute_max_wave_id = 0x7ff;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index 32a740104868..fbfe0a1c4b19 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -682,7 +682,7 @@ static int gfx_v9_4_3_gpu_early_init(struct amdgpu_device *adev)
 	adev->gfx.funcs = &gfx_v9_4_3_gfx_funcs;
 	adev->gfx.ras = &gfx_v9_4_3_ras;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 4, 3):
 		adev->gfx.config.max_hw_contexts = 8;
 		adev->gfx.config.sc_prim_fifo_size_frontend = 0x20;
@@ -2430,7 +2430,7 @@ static int gfx_v9_4_3_set_clockgating_state(void *handle,
 		return 0;
 
 	num_xcc = NUM_XCC(adev->gfx.xcc_mask);
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 4, 3):
 		for (i = 0; i < num_xcc; i++)
 			gfx_v9_4_3_xcc_update_gfx_clock_gating(
@@ -4231,7 +4231,7 @@ static void gfx_v9_4_3_set_rlc_funcs(struct amdgpu_device *adev)
 static void gfx_v9_4_3_set_gds_init(struct amdgpu_device *adev)
 {
 	/* init asci gds info */
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 4, 3):
 		/* 9.4.3 removed all the GDS internal memory,
 		 * only support GWS opcode in kernel, like barrier
@@ -4243,7 +4243,7 @@ static void gfx_v9_4_3_set_gds_init(struct amdgpu_device *adev)
 		break;
 	}
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 4, 3):
 		/* deprecated for 9.4.3, no usage at all */
 		adev->gds.gds_compute_max_wave_id = 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c
index 0834af771549..ff60670b8464 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c
@@ -356,11 +356,14 @@ static void gfxhub_v1_2_xcc_setup_vmid_config(struct amdgpu_device *adev,
 			 * the SQ per-process.
 			 * Retry faults need to be enabled for that to work.
 			 */
-			tmp = REG_SET_FIELD(tmp, VM_CONTEXT1_CNTL,
-					    RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,
-					    !adev->gmc.noretry ||
-					    adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2) ||
-					    adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3));
+			tmp = REG_SET_FIELD(
+				tmp, VM_CONTEXT1_CNTL,
+				RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,
+				!adev->gmc.noretry ||
+					amdgpu_ip_version(adev, GC_HWIP, 0) ==
+						IP_VERSION(9, 4, 2) ||
+					amdgpu_ip_version(adev, GC_HWIP, 0) ==
+						IP_VERSION(9, 4, 3));
 			WREG32_SOC15_OFFSET(GC, GET_INST(GC, j), regVM_CONTEXT1_CNTL,
 					    i * hub->ctx_distance, tmp);
 			WREG32_SOC15_OFFSET(GC, GET_INST(GC, j),
diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
index 7708d5ded7b8..f829c441640a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
@@ -510,7 +510,7 @@ static int gfxhub_v2_1_get_xgmi_info(struct amdgpu_device *adev)
 	u32 max_num_physical_nodes   = 0;
 	u32 max_physical_node_id     = 0;
 
-	switch (adev->ip_versions[XGMI_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, XGMI_HWIP, 0)) {
 	case IP_VERSION(4, 8, 0):
 		max_num_physical_nodes   = 4;
 		max_physical_node_id     = 3;
@@ -548,7 +548,7 @@ static void gfxhub_v2_1_utcl2_harvest(struct amdgpu_device *adev)
 		adev->gfx.config.max_sh_per_se *
 		adev->gfx.config.max_shader_engines);
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 1):
 	case IP_VERSION(10, 3, 3):
 		/* Get SA disabled bitmap from eFuse setting */
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index fa87a85e1017..d3da13f4c80e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -145,7 +145,8 @@ static int gmc_v10_0_process_interrupt(struct amdgpu_device *adev,
 		 * the new fast GRBM interface.
 		 */
 		if ((entry->vmid_src == AMDGPU_GFXHUB(0)) &&
-		    (adev->ip_versions[GC_HWIP][0] < IP_VERSION(10, 3, 0)))
+		    (amdgpu_ip_version(adev, GC_HWIP, 0) <
+		     IP_VERSION(10, 3, 0)))
 			RREG32(hub->vm_l2_pro_fault_status);
 
 		status = RREG32(hub->vm_l2_pro_fault_status);
@@ -278,7 +279,7 @@ static void gmc_v10_0_flush_vm_hub(struct amdgpu_device *adev, uint32_t vmid,
 	 * to avoid a false ACK due to the new fast GRBM interface.
 	 */
 	if ((vmhub == AMDGPU_GFXHUB(0)) &&
-	    (adev->ip_versions[GC_HWIP][0] < IP_VERSION(10, 3, 0)))
+	    (amdgpu_ip_version(adev, GC_HWIP, 0) < IP_VERSION(10, 3, 0)))
 		RREG32_RLC_NO_KIQ(hub->vm_inv_eng0_req +
 				  hub->eng_distance * eng, hub_ip);
 
@@ -680,7 +681,7 @@ static void gmc_v10_0_set_gmc_funcs(struct amdgpu_device *adev)
 
 static void gmc_v10_0_set_umc_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[UMC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, UMC_HWIP, 0)) {
 	case IP_VERSION(8, 7, 0):
 		adev->umc.max_ras_err_cnt_per_query = UMC_V8_7_TOTAL_CHANNEL_NUM;
 		adev->umc.channel_inst_num = UMC_V8_7_CHANNEL_INSTANCE_NUM;
@@ -697,7 +698,7 @@ static void gmc_v10_0_set_umc_funcs(struct amdgpu_device *adev)
 
 static void gmc_v10_0_set_mmhub_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[MMHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(2, 3, 0):
 	case IP_VERSION(2, 4, 0):
 	case IP_VERSION(2, 4, 1):
@@ -711,7 +712,7 @@ static void gmc_v10_0_set_mmhub_funcs(struct amdgpu_device *adev)
 
 static void gmc_v10_0_set_gfxhub_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 0):
 	case IP_VERSION(10, 3, 2):
 	case IP_VERSION(10, 3, 1):
@@ -825,7 +826,7 @@ static int gmc_v10_0_mc_init(struct amdgpu_device *adev)
 
 	/* set the gart size */
 	if (amdgpu_gart_size == -1) {
-		switch (adev->ip_versions[GC_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 		default:
 			adev->gmc.gart_size = 512ULL << 20;
 			break;
@@ -892,7 +893,7 @@ static int gmc_v10_0_sw_init(void *handle)
 		adev->gmc.vram_vendor = vram_vendor;
 	}
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 0):
 		adev->gmc.mall_size = 128 * 1024 * 1024;
 		break;
@@ -910,7 +911,7 @@ static int gmc_v10_0_sw_init(void *handle)
 		break;
 	}
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 1, 10):
 	case IP_VERSION(10, 1, 1):
 	case IP_VERSION(10, 1, 2):
@@ -1195,7 +1196,8 @@ static int gmc_v10_0_set_clockgating_state(void *handle,
 	 * is a new problem observed at DF 3.0.3, however with the same suspend sequence not
 	 * seen any issue on the DF 3.0.2 series platform.
 	 */
-	if (adev->in_s0ix && adev->ip_versions[DF_HWIP][0] > IP_VERSION(3, 0, 2)) {
+	if (adev->in_s0ix &&
+	    amdgpu_ip_version(adev, DF_HWIP, 0) > IP_VERSION(3, 0, 2)) {
 		dev_dbg(adev->dev, "keep mmhub clock gating being enabled for s0ix\n");
 		return 0;
 	}
@@ -1204,7 +1206,7 @@ static int gmc_v10_0_set_clockgating_state(void *handle,
 	if (r)
 		return r;
 
-	if (adev->ip_versions[ATHUB_HWIP][0] >= IP_VERSION(2, 1, 0))
+	if (amdgpu_ip_version(adev, ATHUB_HWIP, 0) >= IP_VERSION(2, 1, 0))
 		return athub_v2_1_set_clockgating(adev, state);
 	else
 		return athub_v2_0_set_clockgating(adev, state);
@@ -1214,13 +1216,13 @@ static void gmc_v10_0_get_clockgating_state(void *handle, u64 *flags)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 3) ||
-	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 4))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(10, 1, 3) ||
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(10, 1, 4))
 		return;
 
 	adev->mmhub.funcs->get_clockgating(adev, flags);
 
-	if (adev->ip_versions[ATHUB_HWIP][0] >= IP_VERSION(2, 1, 0))
+	if (amdgpu_ip_version(adev, ATHUB_HWIP, 0) >= IP_VERSION(2, 1, 0))
 		athub_v2_1_get_clockgating(adev, flags);
 	else
 		athub_v2_0_get_clockgating(adev, flags);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index 671e288c7575..e1f47f9c1881 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -588,7 +588,7 @@ static void gmc_v11_0_set_gmc_funcs(struct amdgpu_device *adev)
 
 static void gmc_v11_0_set_umc_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[UMC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, UMC_HWIP, 0)) {
 	case IP_VERSION(8, 10, 0):
 		adev->umc.channel_inst_num = UMC_V8_10_CHANNEL_INSTANCE_NUM;
 		adev->umc.umc_inst_num = UMC_V8_10_UMC_INSTANCE_NUM;
@@ -611,7 +611,7 @@ static void gmc_v11_0_set_umc_funcs(struct amdgpu_device *adev)
 
 static void gmc_v11_0_set_mmhub_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[MMHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(3, 0, 1):
 		adev->mmhub.funcs = &mmhub_v3_0_1_funcs;
 		break;
@@ -629,7 +629,7 @@ static void gmc_v11_0_set_mmhub_funcs(struct amdgpu_device *adev)
 
 static void gmc_v11_0_set_gfxhub_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(11, 0, 3):
 		adev->gfxhub.funcs = &gfxhub_v3_0_3_funcs;
 		break;
@@ -782,7 +782,7 @@ static int gmc_v11_0_sw_init(void *handle)
 	adev->gmc.vram_type = vram_type;
 	adev->gmc.vram_vendor = vram_vendor;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 1):
 	case IP_VERSION(11, 0, 2):
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 3d13d0bba7b1..268ee533e7c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -640,7 +640,7 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
 		addr, entry->client_id,
 		soc15_ih_clientid_name[entry->client_id]);
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3))
 		dev_err(adev->dev, "  cookie node_id %d fault from die %s%d%s\n",
 			node_id, node_id % 4 == 3 ? "RSV" : "AID", node_id / 4,
 			node_id % 4 == 1 ? ".XCD0" : node_id % 4 == 2 ? ".XCD1" : "");
@@ -654,7 +654,7 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
 	 * the new fast GRBM interface.
 	 */
 	if ((entry->vmid_src == AMDGPU_GFXHUB(0)) &&
-	    (adev->ip_versions[GC_HWIP][0] < IP_VERSION(9, 4, 2)))
+	    (amdgpu_ip_version(adev, GC_HWIP, 0) < IP_VERSION(9, 4, 2)))
 		RREG32(hub->vm_l2_pro_fault_status);
 
 	status = RREG32(hub->vm_l2_pro_fault_status);
@@ -671,7 +671,7 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
 			gfxhub_client_ids[cid],
 			cid);
 	} else {
-		switch (adev->ip_versions[MMHUB_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 		case IP_VERSION(9, 0, 0):
 			mmhub_cid = mmhub_client_ids_vega10[cid][rw];
 			break;
@@ -772,8 +772,8 @@ static uint32_t gmc_v9_0_get_invalidate_req(unsigned int vmid,
 static bool gmc_v9_0_use_invalidate_semaphore(struct amdgpu_device *adev,
 				       uint32_t vmhub)
 {
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2) ||
-	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 2) ||
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3))
 		return false;
 
 	return ((vmhub == AMDGPU_MMHUB0(0) ||
@@ -824,7 +824,7 @@ static void gmc_v9_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 
 	hub = &adev->vmhub[vmhub];
 	if (adev->gmc.xgmi.num_physical_nodes &&
-	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 0)) {
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 0)) {
 		/* Vega20+XGMI caches PTEs in TC and TLB. Add a
 		 * heavy-weight TLB flush (type 2), which flushes
 		 * both. Due to a race condition with concurrent
@@ -834,7 +834,7 @@ static void gmc_v9_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 		inv_req = gmc_v9_0_get_invalidate_req(vmid, 2);
 		inv_req2 = gmc_v9_0_get_invalidate_req(vmid, flush_type);
 	} else if (flush_type == 2 &&
-		   adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3) &&
+		   amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3) &&
 		   adev->rev_id == 0) {
 		inv_req = gmc_v9_0_get_invalidate_req(vmid, 0);
 		inv_req2 = gmc_v9_0_get_invalidate_req(vmid, flush_type);
@@ -896,7 +896,7 @@ static void gmc_v9_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 		 * GRBM interface.
 		 */
 		if ((vmhub == AMDGPU_GFXHUB(0)) &&
-		    (adev->ip_versions[GC_HWIP][0] < IP_VERSION(9, 4, 2)))
+		    (amdgpu_ip_version(adev, GC_HWIP, 0) < IP_VERSION(9, 4, 2)))
 			RREG32_NO_KIQ(hub->vm_inv_eng0_req +
 				      hub->eng_distance * eng);
 
@@ -969,7 +969,8 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 		 * still need a second TLB flush after this.
 		 */
 		bool vega20_xgmi_wa = (adev->gmc.xgmi.num_physical_nodes &&
-				       adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 0));
+				       amdgpu_ip_version(adev, GC_HWIP, 0) ==
+					       IP_VERSION(9, 4, 0));
 		/* 2 dwords flush + 8 dwords fence */
 		unsigned int ndw = kiq->pmf->invalidate_tlbs_size + 8;
 
@@ -984,7 +985,8 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 						      pasid, 2, all_hub);
 
 		if (flush_type == 2 &&
-		    adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3) &&
+		    amdgpu_ip_version(adev, GC_HWIP, 0) ==
+			    IP_VERSION(9, 4, 3) &&
 		    adev->rev_id == 0)
 			kiq->pmf->kiq_invalidate_tlbs(ring,
 						pasid, 0, all_hub);
@@ -1192,7 +1194,7 @@ static void gmc_v9_0_get_coherence_flags(struct amdgpu_device *adev,
 	bool snoop = false;
 	bool is_local;
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 4, 1):
 	case IP_VERSION(9, 4, 2):
 		if (is_vram) {
@@ -1206,8 +1208,10 @@ static void gmc_v9_0_get_coherence_flags(struct amdgpu_device *adev,
 				/* FIXME: is this still needed? Or does
 				 * amdgpu_ttm_tt_pde_flags already handle this?
 				 */
-				if ((adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2) ||
-				     adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3)) &&
+				if ((amdgpu_ip_version(adev, GC_HWIP, 0) ==
+					     IP_VERSION(9, 4, 2) ||
+				     amdgpu_ip_version(adev, GC_HWIP, 0) ==
+					     IP_VERSION(9, 4, 3)) &&
 				    adev->gmc.xgmi.connected_to_cpu)
 					snoop = true;
 			} else {
@@ -1316,7 +1320,7 @@ static void gmc_v9_0_override_vm_pte_flags(struct amdgpu_device *adev,
 	/* Only GFX 9.4.3 APUs associate GPUs with NUMA nodes. Local system
 	 * memory can use more efficient MTYPEs.
 	 */
-	if (adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 4, 3))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) != IP_VERSION(9, 4, 3))
 		return;
 
 	/* Only direct-mapped memory allows us to determine the NUMA node from
@@ -1385,7 +1389,7 @@ static unsigned int gmc_v9_0_get_vbios_fb_size(struct amdgpu_device *adev)
 	} else {
 		u32 viewport;
 
-		switch (adev->ip_versions[DCE_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 		case IP_VERSION(1, 0, 0):
 		case IP_VERSION(1, 0, 1):
 			viewport = RREG32_SOC15(DCE, 0, mmHUBP0_DCSURF_PRI_VIEWPORT_DIMENSION);
@@ -1456,7 +1460,7 @@ static void gmc_v9_0_set_gmc_funcs(struct amdgpu_device *adev)
 
 static void gmc_v9_0_set_umc_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[UMC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, UMC_HWIP, 0)) {
 	case IP_VERSION(6, 0, 0):
 		adev->umc.funcs = &umc_v6_0_funcs;
 		break;
@@ -1510,7 +1514,7 @@ static void gmc_v9_0_set_umc_funcs(struct amdgpu_device *adev)
 
 static void gmc_v9_0_set_mmhub_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[MMHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(9, 4, 1):
 		adev->mmhub.funcs = &mmhub_v9_4_funcs;
 		break;
@@ -1528,7 +1532,7 @@ static void gmc_v9_0_set_mmhub_funcs(struct amdgpu_device *adev)
 
 static void gmc_v9_0_set_mmhub_ras_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[MMHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(9, 4, 0):
 		adev->mmhub.ras = &mmhub_v1_0_ras;
 		break;
@@ -1549,7 +1553,7 @@ static void gmc_v9_0_set_mmhub_ras_funcs(struct amdgpu_device *adev)
 
 static void gmc_v9_0_set_gfxhub_funcs(struct amdgpu_device *adev)
 {
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3))
 		adev->gfxhub.funcs = &gfxhub_v1_2_funcs;
 	else
 		adev->gfxhub.funcs = &gfxhub_v1_0_funcs;
@@ -1565,7 +1569,7 @@ static void gmc_v9_0_set_mca_ras_funcs(struct amdgpu_device *adev)
 	struct amdgpu_mca *mca = &adev->mca;
 
 	/* is UMC the right IP to check for MCA?  Maybe DF? */
-	switch (adev->ip_versions[UMC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, UMC_HWIP, 0)) {
 	case IP_VERSION(6, 7, 0):
 		if (!adev->gmc.xgmi.connected_to_cpu) {
 			mca->mp0.ras = &mca_v3_0_mp0_ras;
@@ -1592,18 +1596,18 @@ static int gmc_v9_0_early_init(void *handle)
 	 * 9.4.0, 9.4.1 and 9.4.3 don't have XGMI defined
 	 * in their IP discovery tables
 	 */
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 0) ||
-	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1) ||
-	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 0) ||
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 1) ||
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3))
 		adev->gmc.xgmi.supported = true;
 
-	if (adev->ip_versions[XGMI_HWIP][0] == IP_VERSION(6, 1, 0)) {
+	if (amdgpu_ip_version(adev, XGMI_HWIP, 0) == IP_VERSION(6, 1, 0)) {
 		adev->gmc.xgmi.supported = true;
 		adev->gmc.xgmi.connected_to_cpu =
 			adev->smuio.funcs->is_host_gpu_xgmi_supported(adev);
 	}
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3)) {
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3)) {
 		enum amdgpu_pkg_type pkg_type =
 			adev->smuio.funcs->get_pkg_type(adev);
 		/* On GFXIP 9.4.3. APU, there is no physical VRAM domain present
@@ -1652,7 +1656,7 @@ static int gmc_v9_0_late_init(void *handle)
 	 * writes, while disables HBM ECC for vega10.
 	 */
 	if (!amdgpu_sriov_vf(adev) &&
-	    (adev->ip_versions[UMC_HWIP][0] == IP_VERSION(6, 0, 0))) {
+	    (amdgpu_ip_version(adev, UMC_HWIP, 0) == IP_VERSION(6, 0, 0))) {
 		if (!(adev->ras_enabled & (1 << AMDGPU_RAS_BLOCK__UMC))) {
 			if (adev->df.funcs &&
 			    adev->df.funcs->enable_ecc_force_par_wr_rmw)
@@ -1760,7 +1764,7 @@ static int gmc_v9_0_mc_init(struct amdgpu_device *adev)
 
 	/* set the gart size */
 	if (amdgpu_gart_size == -1) {
-		switch (adev->ip_versions[GC_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 		case IP_VERSION(9, 0, 1):  /* all engines support GPUVM */
 		case IP_VERSION(9, 2, 1):  /* all engines support GPUVM */
 		case IP_VERSION(9, 4, 0):
@@ -1839,8 +1843,8 @@ static int gmc_v9_0_gart_init(struct amdgpu_device *adev)
  */
 static void gmc_v9_0_save_registers(struct amdgpu_device *adev)
 {
-	if ((adev->ip_versions[DCE_HWIP][0] == IP_VERSION(1, 0, 0)) ||
-	    (adev->ip_versions[DCE_HWIP][0] == IP_VERSION(1, 0, 1)))
+	if ((amdgpu_ip_version(adev, DCE_HWIP, 0) == IP_VERSION(1, 0, 0)) ||
+	    (amdgpu_ip_version(adev, DCE_HWIP, 0) == IP_VERSION(1, 0, 1)))
 		adev->gmc.sdpif_register = RREG32_SOC15(DCE, 0, mmDCHUBBUB_SDPIF_MMIO_CNTRL_0);
 }
 
@@ -2035,7 +2039,7 @@ static int gmc_v9_0_sw_init(void *handle)
 
 	spin_lock_init(&adev->gmc.invalidate_lock);
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3)) {
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3)) {
 		gmc_v9_4_3_init_vram_info(adev);
 	} else if (!adev->bios) {
 		if (adev->flags & AMD_IS_APU) {
@@ -2075,7 +2079,7 @@ static int gmc_v9_0_sw_init(void *handle)
 		adev->gmc.vram_type = vram_type;
 		adev->gmc.vram_vendor = vram_vendor;
 	}
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 1, 0):
 	case IP_VERSION(9, 2, 2):
 		set_bit(AMDGPU_GFXHUB(0), adev->vmhubs_mask);
@@ -2108,7 +2112,7 @@ static int gmc_v9_0_sw_init(void *handle)
 			amdgpu_vm_adjust_size(adev, 256 * 1024, 9, 3, 47);
 		else
 			amdgpu_vm_adjust_size(adev, 256 * 1024, 9, 3, 48);
-		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2))
+		if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 2))
 			adev->gmc.translate_further = adev->vm_manager.num_level > 1;
 		break;
 	case IP_VERSION(9, 4, 1):
@@ -2140,7 +2144,7 @@ static int gmc_v9_0_sw_init(void *handle)
 	if (r)
 		return r;
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1)) {
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 1)) {
 		r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VMC1, VMC_1_0__SRCID__VM_FAULT,
 					&adev->gmc.vm_fault);
 		if (r)
@@ -2169,7 +2173,10 @@ static int gmc_v9_0_sw_init(void *handle)
 	 */
 	adev->gmc.mc_mask = 0xffffffffffffULL; /* 48 bit MC */
 
-	dma_addr_bits = adev->ip_versions[GC_HWIP][0] >= IP_VERSION(9, 4, 2) ? 48:44;
+	dma_addr_bits = amdgpu_ip_version(adev, GC_HWIP, 0) >=
+					IP_VERSION(9, 4, 2) ?
+				48 :
+				44;
 	r = dma_set_mask_and_coherent(adev->dev, DMA_BIT_MASK(dma_addr_bits));
 	if (r) {
 		dev_warn(adev->dev, "amdgpu: No suitable DMA available.\n");
@@ -2183,7 +2190,7 @@ static int gmc_v9_0_sw_init(void *handle)
 
 	amdgpu_gmc_get_vbios_allocations(adev);
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3)) {
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3)) {
 		r = gmc_v9_0_init_mem_ranges(adev);
 		if (r)
 			return r;
@@ -2209,9 +2216,11 @@ static int gmc_v9_0_sw_init(void *handle)
 	 * for video processing.
 	 */
 	adev->vm_manager.first_kfd_vmid =
-		(adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1) ||
-		 adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2) ||
-		 adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3)) ? 3 : 8;
+		(amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 1) ||
+		 amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 2) ||
+		 amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3)) ?
+			3 :
+			8;
 
 	amdgpu_vm_manager_init(adev);
 
@@ -2221,7 +2230,7 @@ static int gmc_v9_0_sw_init(void *handle)
 	if (r)
 		return r;
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3))
 		amdgpu_gmc_sysfs_init(adev);
 
 	return 0;
@@ -2231,7 +2240,7 @@ static int gmc_v9_0_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3))
 		amdgpu_gmc_sysfs_fini(adev);
 	adev->gmc.num_mem_partitions = 0;
 	kfree(adev->gmc.mem_partitions);
@@ -2253,8 +2262,7 @@ static int gmc_v9_0_sw_fini(void *handle)
 
 static void gmc_v9_0_init_golden_registers(struct amdgpu_device *adev)
 {
-
-	switch (adev->ip_versions[MMHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(9, 0, 0):
 		if (amdgpu_sriov_vf(adev))
 			break;
@@ -2288,8 +2296,8 @@ static void gmc_v9_0_init_golden_registers(struct amdgpu_device *adev)
  */
 void gmc_v9_0_restore_registers(struct amdgpu_device *adev)
 {
-	if ((adev->ip_versions[DCE_HWIP][0] == IP_VERSION(1, 0, 0)) ||
-	    (adev->ip_versions[DCE_HWIP][0] == IP_VERSION(1, 0, 1))) {
+	if ((amdgpu_ip_version(adev, DCE_HWIP, 0) == IP_VERSION(1, 0, 0)) ||
+	    (amdgpu_ip_version(adev, DCE_HWIP, 0) == IP_VERSION(1, 0, 1))) {
 		WREG32_SOC15(DCE, 0, mmDCHUBBUB_SDPIF_MMIO_CNTRL_0, adev->gmc.sdpif_register);
 		WARN_ON(adev->gmc.sdpif_register !=
 			RREG32_SOC15(DCE, 0, mmDCHUBBUB_SDPIF_MMIO_CNTRL_0));
diff --git a/drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c b/drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c
index 71d1a2e3bac9..3f3a6445c006 100644
--- a/drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c
@@ -49,8 +49,8 @@ static void hdp_v4_0_flush_hdp(struct amdgpu_device *adev,
 static void hdp_v4_0_invalidate_hdp(struct amdgpu_device *adev,
 				    struct amdgpu_ring *ring)
 {
-	if (adev->ip_versions[HDP_HWIP][0] == IP_VERSION(4, 4, 0) ||
-	    adev->ip_versions[HDP_HWIP][0] == IP_VERSION(4, 4, 2))
+	if (amdgpu_ip_version(adev, HDP_HWIP, 0) == IP_VERSION(4, 4, 0) ||
+	    amdgpu_ip_version(adev, HDP_HWIP, 0) == IP_VERSION(4, 4, 2))
 		return;
 
 	if (!ring || !ring->funcs->emit_wreg)
@@ -80,7 +80,7 @@ static void hdp_v4_0_reset_ras_error_count(struct amdgpu_device *adev)
 	if (!amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__HDP))
 		return;
 
-	if (adev->ip_versions[HDP_HWIP][0] >= IP_VERSION(4, 4, 0))
+	if (amdgpu_ip_version(adev, HDP_HWIP, 0) >= IP_VERSION(4, 4, 0))
 		WREG32_SOC15(HDP, 0, mmHDP_EDC_CNT, 0);
 	else
 		/*read back hdp ras counter to reset it to 0 */
@@ -92,10 +92,10 @@ static void hdp_v4_0_update_clock_gating(struct amdgpu_device *adev,
 {
 	uint32_t def, data;
 
-	if (adev->ip_versions[HDP_HWIP][0] == IP_VERSION(4, 0, 0) ||
-	    adev->ip_versions[HDP_HWIP][0] == IP_VERSION(4, 0, 1) ||
-	    adev->ip_versions[HDP_HWIP][0] == IP_VERSION(4, 1, 1) ||
-	    adev->ip_versions[HDP_HWIP][0] == IP_VERSION(4, 1, 0)) {
+	if (amdgpu_ip_version(adev, HDP_HWIP, 0) == IP_VERSION(4, 0, 0) ||
+	    amdgpu_ip_version(adev, HDP_HWIP, 0) == IP_VERSION(4, 0, 1) ||
+	    amdgpu_ip_version(adev, HDP_HWIP, 0) == IP_VERSION(4, 1, 1) ||
+	    amdgpu_ip_version(adev, HDP_HWIP, 0) == IP_VERSION(4, 1, 0)) {
 		def = data = RREG32(SOC15_REG_OFFSET(HDP, 0, mmHDP_MEM_POWER_LS));
 
 		if (enable && (adev->cg_flags & AMD_CG_SUPPORT_HDP_LS))
@@ -137,7 +137,7 @@ static void hdp_v4_0_get_clockgating_state(struct amdgpu_device *adev,
 
 static void hdp_v4_0_init_registers(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[HDP_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, HDP_HWIP, 0)) {
 	case IP_VERSION(4, 2, 1):
 		WREG32_FIELD15(HDP, 0, HDP_MMHUB_CNTL, HDP_MMHUB_GCC, 1);
 		break;
@@ -147,7 +147,7 @@ static void hdp_v4_0_init_registers(struct amdgpu_device *adev)
 
 	WREG32_FIELD15(HDP, 0, HDP_MISC_CNTL, FLUSH_INVALIDATE_CACHE, 1);
 
-	if (adev->ip_versions[HDP_HWIP][0] == IP_VERSION(4, 4, 0))
+	if (amdgpu_ip_version(adev, HDP_HWIP, 0) == IP_VERSION(4, 4, 0))
 		WREG32_FIELD15(HDP, 0, HDP_MISC_CNTL, READ_BUFFER_WATERMARK, 2);
 
 	WREG32_SOC15(HDP, 0, mmHDP_NONSURFACE_BASE, (adev->gmc.vram_start >> 8));
diff --git a/drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c b/drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c
index 6f20f9889a78..ab06c2b4b20b 100644
--- a/drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c
@@ -51,7 +51,7 @@ static void hdp_v6_0_update_clock_gating(struct amdgpu_device *adev,
 				AMD_CG_SUPPORT_HDP_SD)))
 		return;
 
-	if (adev->ip_versions[HDP_HWIP][0] == IP_VERSION(6, 1, 0))
+	if (amdgpu_ip_version(adev, HDP_HWIP, 0) == IP_VERSION(6, 1, 0))
 		hdp_clk_cntl = RREG32_SOC15(HDP, 0, regHDP_CLK_CNTL_V6_1);
 	else
 		hdp_clk_cntl = RREG32_SOC15(HDP, 0, regHDP_CLK_CNTL);
@@ -61,7 +61,7 @@ static void hdp_v6_0_update_clock_gating(struct amdgpu_device *adev,
 	 * forced on IPH & RC clock */
 	hdp_clk_cntl = REG_SET_FIELD(hdp_clk_cntl, HDP_CLK_CNTL,
 				     RC_MEM_CLK_SOFT_OVERRIDE, 1);
-	if (adev->ip_versions[HDP_HWIP][0] == IP_VERSION(6, 1, 0))
+	if (amdgpu_ip_version(adev, HDP_HWIP, 0) == IP_VERSION(6, 1, 0))
 		WREG32_SOC15(HDP, 0, regHDP_CLK_CNTL_V6_1, hdp_clk_cntl);
 	else
 		WREG32_SOC15(HDP, 0, regHDP_CLK_CNTL, hdp_clk_cntl);
@@ -126,7 +126,7 @@ static void hdp_v6_0_update_clock_gating(struct amdgpu_device *adev,
 	/* disable IPH & RC clock override after clock/power mode changing */
 	hdp_clk_cntl = REG_SET_FIELD(hdp_clk_cntl, HDP_CLK_CNTL,
 				     RC_MEM_CLK_SOFT_OVERRIDE, 0);
-	if (adev->ip_versions[HDP_HWIP][0] == IP_VERSION(6, 1, 0))
+	if (amdgpu_ip_version(adev, HDP_HWIP, 0) == IP_VERSION(6, 1, 0))
 		WREG32_SOC15(HDP, 0, regHDP_CLK_CNTL_V6_1, hdp_clk_cntl);
 	else
 		WREG32_SOC15(HDP, 0, regHDP_CLK_CNTL, hdp_clk_cntl);
diff --git a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
index 0a8bc6c94fa9..875fb5ac70b5 100644
--- a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
@@ -353,7 +353,7 @@ static void imu_v11_0_program_rlc_ram(struct amdgpu_device *adev)
 
 	WREG32_SOC15(GC, 0, regGFX_IMU_RLC_RAM_INDEX, 0x2);
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(11, 0, 0):
 		program_imu_rlc_ram(adev, imu_rlc_ram_golden_11,
 				(const u32)ARRAY_SIZE(imu_rlc_ram_golden_11));
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
index aadb74de52bc..e67a337457ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
@@ -128,7 +128,7 @@ static int jpeg_v2_5_sw_init(void *handle)
 
 		ring = adev->jpeg.inst[i].ring_dec;
 		ring->use_doorbell = true;
-		if (adev->ip_versions[UVD_HWIP][0] == IP_VERSION(2, 5, 0))
+		if (amdgpu_ip_version(adev, UVD_HWIP, 0) == IP_VERSION(2, 5, 0))
 			ring->vm_hub = AMDGPU_MMHUB1(0);
 		else
 			ring->vm_hub = AMDGPU_MMHUB0(0);
@@ -822,7 +822,7 @@ static struct amdgpu_jpeg_ras jpeg_v2_6_ras = {
 
 static void jpeg_v2_5_set_ras_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[JPEG_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, JPEG_HWIP, 0)) {
 	case IP_VERSION(2, 6, 0):
 		adev->jpeg.ras = &jpeg_v2_6_ras;
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
index df4440c21bbf..a92481da60cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
@@ -52,7 +52,7 @@ static int jpeg_v3_0_early_init(void *handle)
 
 	u32 harvest;
 
-	switch (adev->ip_versions[UVD_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, UVD_HWIP, 0)) {
 	case IP_VERSION(3, 1, 1):
 	case IP_VERSION(3, 1, 2):
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
index 3eb3dcd56b57..98ed49b16e62 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
@@ -831,7 +831,7 @@ static struct amdgpu_jpeg_ras jpeg_v4_0_ras = {
 
 static void jpeg_v4_0_set_ras_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[JPEG_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, JPEG_HWIP, 0)) {
 	case IP_VERSION(4, 0, 0):
 		adev->jpeg.ras = &jpeg_v4_0_ras;
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
index eb06d749876f..1e5ad1e08d2a 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
@@ -558,7 +558,7 @@ static int mes_v10_1_load_microcode(struct amdgpu_device *adev,
 	WREG32_SOC15(GC, 0, mmCP_MES_MDBOUND_LO, 0x3FFFF);
 
 	/* invalidate ICACHE */
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 0):
 		data = RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid);
 		break;
@@ -568,7 +568,7 @@ static int mes_v10_1_load_microcode(struct amdgpu_device *adev,
 	}
 	data = REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, PRIME_ICACHE, 0);
 	data = REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, INVALIDATE_CACHE, 1);
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 0):
 		WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid, data);
 		break;
@@ -578,7 +578,7 @@ static int mes_v10_1_load_microcode(struct amdgpu_device *adev,
 	}
 
 	/* prime the ICACHE. */
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 0):
 		data = RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid);
 		break;
@@ -587,7 +587,7 @@ static int mes_v10_1_load_microcode(struct amdgpu_device *adev,
 		break;
 	}
 	data = REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, PRIME_ICACHE, 1);
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 0):
 		WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid, data);
 		break;
@@ -995,7 +995,7 @@ static void mes_v10_1_kiq_setting(struct amdgpu_ring *ring)
 	struct amdgpu_device *adev = ring->adev;
 
 	/* tell RLC which is KIQ queue */
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 3, 0):
 	case IP_VERSION(10, 3, 2):
 	case IP_VERSION(10, 3, 1):
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 3fa5bc3ddf92..4a3020b5b30f 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -1316,7 +1316,7 @@ static int mes_v11_0_late_init(void *handle)
 
 	/* it's only intended for use in mes_self_test case, not for s0ix and reset */
 	if (!amdgpu_in_reset(adev) && !adev->in_s0ix && !adev->in_suspend &&
-	    (adev->ip_versions[GC_HWIP][0] != IP_VERSION(11, 0, 3)))
+	    (amdgpu_ip_version(adev, GC_HWIP, 0) != IP_VERSION(11, 0, 3)))
 		amdgpu_mes_self_test(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
index 8f76c6ecf50a..37458f906980 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
@@ -151,7 +151,7 @@ mmhub_v2_0_print_l2_protection_fault_status(struct amdgpu_device *adev,
 	dev_err(adev->dev,
 		"MMVM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
 		status);
-	switch (adev->ip_versions[MMHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(2, 0, 0):
 	case IP_VERSION(2, 0, 2):
 		mmhub_cid = mmhub_client_ids_navi1x[cid][rw];
@@ -568,7 +568,7 @@ static void mmhub_v2_0_update_medium_grain_clock_gating(struct amdgpu_device *ad
 	if (!(adev->cg_flags & AMD_CG_SUPPORT_MC_MGCG))
 		return;
 
-	switch (adev->ip_versions[MMHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(2, 1, 0):
 	case IP_VERSION(2, 1, 1):
 	case IP_VERSION(2, 1, 2):
@@ -601,7 +601,7 @@ static void mmhub_v2_0_update_medium_grain_clock_gating(struct amdgpu_device *ad
 			  DAGB0_CNTL_MISC2__DISABLE_TLBRD_CG_MASK);
 	}
 
-	switch (adev->ip_versions[MMHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(2, 1, 0):
 	case IP_VERSION(2, 1, 1):
 	case IP_VERSION(2, 1, 2):
@@ -625,7 +625,7 @@ static void mmhub_v2_0_update_medium_grain_light_sleep(struct amdgpu_device *ade
 	if (!(adev->cg_flags & AMD_CG_SUPPORT_MC_LS))
 		return;
 
-	switch (adev->ip_versions[MMHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(2, 1, 0):
 	case IP_VERSION(2, 1, 1):
 	case IP_VERSION(2, 1, 2):
@@ -651,7 +651,7 @@ static int mmhub_v2_0_set_clockgating(struct amdgpu_device *adev,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[MMHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(2, 0, 0):
 	case IP_VERSION(2, 0, 2):
 	case IP_VERSION(2, 1, 0):
@@ -676,7 +676,7 @@ static void mmhub_v2_0_get_clockgating(struct amdgpu_device *adev, u64 *flags)
 	if (amdgpu_sriov_vf(adev))
 		*flags = 0;
 
-	switch (adev->ip_versions[MMHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(2, 1, 0):
 	case IP_VERSION(2, 1, 1):
 	case IP_VERSION(2, 1, 2):
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
index 1dce053a4c4d..4ddd9448e2bc 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
@@ -90,7 +90,7 @@ mmhub_v2_3_print_l2_protection_fault_status(struct amdgpu_device *adev,
 	dev_err(adev->dev,
 		"MMVM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
 		status);
-	switch (adev->ip_versions[MMHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(2, 3, 0):
 	case IP_VERSION(2, 4, 0):
 	case IP_VERSION(2, 4, 1):
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c
index 7c9ab5491067..9627df8b194b 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c
@@ -107,7 +107,7 @@ mmhub_v3_0_print_l2_protection_fault_status(struct amdgpu_device *adev,
 	dev_err(adev->dev,
 		"MMVM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
 		status);
-	switch (adev->ip_versions[MMHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(3, 0, 0):
 	case IP_VERSION(3, 0, 1):
 		mmhub_cid = mmhub_client_ids_v3_0_0[cid][rw];
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c
index db79e6f92441..77bff803b452 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c
@@ -108,7 +108,7 @@ mmhub_v3_0_1_print_l2_protection_fault_status(struct amdgpu_device *adev,
 		"MMVM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
 		status);
 
-	switch (adev->ip_versions[MMHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(3, 0, 1):
 		mmhub_cid = mmhub_client_ids_v3_0_1[cid][rw];
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c
index 8194ee2b96c4..3d80a184ce6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c
@@ -96,7 +96,7 @@ mmhub_v3_3_print_l2_protection_fault_status(struct amdgpu_device *adev,
 		"MMVM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
 		status);
 
-	switch (adev->ip_versions[MMHUB_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(3, 3, 0):
 		mmhub_cid = mmhub_client_ids_v3_3[cid][rw];
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index b6a8478dabf4..bb1873363d75 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -107,7 +107,7 @@ force_update_wptr_for_self_int(struct amdgpu_device *adev,
 {
 	u32 ih_cntl, ih_rb_cntl;
 
-	if (adev->ip_versions[OSSSYS_HWIP][0] < IP_VERSION(5, 0, 3))
+	if (amdgpu_ip_version(adev, OSSSYS_HWIP, 0) < IP_VERSION(5, 0, 3))
 		return;
 
 	ih_cntl = RREG32_SOC15(OSSSYS, 0, mmIH_CNTL2);
@@ -330,7 +330,7 @@ static int navi10_ih_irq_init(struct amdgpu_device *adev)
 
 	if (unlikely(adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT)) {
 		if (ih[0]->use_bus_addr) {
-			switch (adev->ip_versions[OSSSYS_HWIP][0]) {
+			switch (amdgpu_ip_version(adev, OSSSYS_HWIP, 0)) {
 			case IP_VERSION(5, 0, 3):
 			case IP_VERSION(5, 2, 0):
 			case IP_VERSION(5, 2, 1):
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
index 4038455d7998..e523627cfe25 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
@@ -536,7 +536,7 @@ static void nbio_v2_3_clear_doorbell_interrupt(struct amdgpu_device *adev)
 {
 	uint32_t reg, reg_data;
 
-	if (adev->ip_versions[NBIO_HWIP][0] != IP_VERSION(3, 3, 0))
+	if (amdgpu_ip_version(adev, NBIO_HWIP, 0) != IP_VERSION(3, 3, 0))
 		return;
 
 	reg = RREG32_SOC15(NBIO, 0, mmBIF_RB_CNTL);
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c b/drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c
index e5b5b0f4940f..a3622897e3fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c
@@ -338,7 +338,7 @@ const struct nbio_hdp_flush_reg nbio_v4_3_hdp_flush_reg = {
 
 static void nbio_v4_3_init_registers(struct amdgpu_device *adev)
 {
-	if (adev->ip_versions[NBIO_HWIP][0] == IP_VERSION(4, 3, 0)) {
+	if (amdgpu_ip_version(adev, NBIO_HWIP, 0) == IP_VERSION(4, 3, 0)) {
 		uint32_t data;
 
 		data = RREG32_SOC15(NBIO, 0, regRCC_DEV0_EPF2_STRAP2);
@@ -392,8 +392,8 @@ static void nbio_v4_3_program_aspm(struct amdgpu_device *adev)
 #ifdef CONFIG_PCIEASPM
 	uint32_t def, data;
 
-	if (!(adev->ip_versions[PCIE_HWIP][0] == IP_VERSION(7, 4, 0)) &&
-	      !(adev->ip_versions[PCIE_HWIP][0] == IP_VERSION(7, 6, 0)))
+	if (!(amdgpu_ip_version(adev, PCIE_HWIP, 0) == IP_VERSION(7, 4, 0)) &&
+	    !(amdgpu_ip_version(adev, PCIE_HWIP, 0) == IP_VERSION(7, 6, 0)))
 		return;
 
 	def = data = RREG32_SOC15(NBIO, 0, regPCIE_LC_CNTL);
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c
index 4ef1fa4603c8..e962821ae6a1 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c
@@ -59,7 +59,7 @@ static u32 nbio_v7_2_get_rev_id(struct amdgpu_device *adev)
 {
 	u32 tmp;
 
-	switch (adev->ip_versions[NBIO_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, NBIO_HWIP, 0)) {
 	case IP_VERSION(7, 2, 1):
 	case IP_VERSION(7, 3, 0):
 	case IP_VERSION(7, 5, 0):
@@ -78,7 +78,7 @@ static u32 nbio_v7_2_get_rev_id(struct amdgpu_device *adev)
 
 static void nbio_v7_2_mc_access_enable(struct amdgpu_device *adev, bool enable)
 {
-	switch (adev->ip_versions[NBIO_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, NBIO_HWIP, 0)) {
 	case IP_VERSION(7, 2, 1):
 	case IP_VERSION(7, 3, 0):
 	case IP_VERSION(7, 5, 0):
@@ -262,7 +262,7 @@ static void nbio_v7_2_update_medium_grain_light_sleep(struct amdgpu_device *adev
 {
 	uint32_t def, data;
 
-	switch (adev->ip_versions[NBIO_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, NBIO_HWIP, 0)) {
 	case IP_VERSION(7, 2, 1):
 	case IP_VERSION(7, 3, 0):
 	case IP_VERSION(7, 5, 0):
@@ -369,7 +369,7 @@ const struct nbio_hdp_flush_reg nbio_v7_2_hdp_flush_reg = {
 static void nbio_v7_2_init_registers(struct amdgpu_device *adev)
 {
 	uint32_t def, data;
-	switch (adev->ip_versions[NBIO_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, NBIO_HWIP, 0)) {
 	case IP_VERSION(7, 2, 1):
 	case IP_VERSION(7, 3, 0):
 	case IP_VERSION(7, 5, 0):
@@ -394,7 +394,7 @@ static void nbio_v7_2_init_registers(struct amdgpu_device *adev)
 		break;
 	}
 
-	switch (adev->ip_versions[NBIO_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, NBIO_HWIP, 0)) {
 	case IP_VERSION(7, 3, 0):
 	case IP_VERSION(7, 5, 1):
 		data = RREG32_SOC15(NBIO, 0, regRCC_DEV2_EPF0_STRAP2);
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
index 685abf57ffdd..7d6d7734dbec 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
@@ -347,7 +347,7 @@ static void nbio_v7_4_init_registers(struct amdgpu_device *adev)
 		adev->rmmio_remap.reg_offset = SOC15_REG_OFFSET(NBIO, 0,
 			mmBIF_BX_DEV0_EPF0_VF0_HDP_MEM_COHERENCY_FLUSH_CNTL) << 2;
 
-	if (adev->ip_versions[NBIO_HWIP][0] == IP_VERSION(7, 4, 4) &&
+	if (amdgpu_ip_version(adev, NBIO_HWIP, 0) == IP_VERSION(7, 4, 4) &&
 	    !amdgpu_sriov_vf(adev)) {
 		baco_cntl = RREG32_SOC15(NBIO, 0, mmBACO_CNTL);
 		if (baco_cntl &
@@ -702,7 +702,7 @@ static void nbio_v7_4_program_aspm(struct amdgpu_device *adev)
 #ifdef CONFIG_PCIEASPM
 	uint32_t def, data;
 
-	if (adev->ip_versions[NBIO_HWIP][0] == IP_VERSION(7, 4, 4))
+	if (amdgpu_ip_version(adev, NBIO_HWIP, 0) == IP_VERSION(7, 4, 4))
 		return;
 
 	def = data = RREG32_PCIE(smnPCIE_LC_CNTL);
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 13aca808ecab..0535cabe3b16 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -214,7 +214,7 @@ static int nv_query_video_codecs(struct amdgpu_device *adev, bool encode,
 	if (adev->vcn.num_vcn_inst == hweight8(adev->vcn.harvest_config))
 		return -EINVAL;
 
-	switch (adev->ip_versions[UVD_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, UVD_HWIP, 0)) {
 	case IP_VERSION(3, 0, 0):
 	case IP_VERSION(3, 0, 64):
 	case IP_VERSION(3, 0, 192):
@@ -453,7 +453,7 @@ nv_asic_reset_method(struct amdgpu_device *adev)
 		dev_warn(adev->dev, "Specified reset method:%d isn't supported, using AUTO instead.\n",
 				  amdgpu_reset_method);
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(11, 5, 0):
 	case IP_VERSION(13, 0, 1):
 	case IP_VERSION(13, 0, 3):
@@ -669,7 +669,7 @@ static int nv_common_early_init(void *handle)
 	/* TODO: split the GC and PG flags based on the relevant IP version for which
 	 * they are relevant.
 	 */
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(10, 1, 10):
 		adev->cg_flags = AMD_CG_SUPPORT_GFX_MGCG |
 			AMD_CG_SUPPORT_GFX_CGCG |
@@ -1073,7 +1073,7 @@ static int nv_common_set_clockgating_state(void *handle,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[NBIO_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, NBIO_HWIP, 0)) {
 	case IP_VERSION(2, 3, 0):
 	case IP_VERSION(2, 3, 1):
 	case IP_VERSION(2, 3, 2):
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
index 5f10883da6a2..145186a1e48f 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
@@ -58,9 +58,10 @@ static int psp_v10_0_init_microcode(struct psp_context *psp)
 		return err;
 
 	err = psp_init_ta_microcode(psp, ucode_prefix);
-	if ((adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 1, 0)) &&
-		(adev->pdev->revision == 0xa1) &&
-		(psp->securedisplay_context.context.bin_desc.fw_version >= 0x27000008)) {
+	if ((amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 1, 0)) &&
+	    (adev->pdev->revision == 0xa1) &&
+	    (psp->securedisplay_context.context.bin_desc.fw_version >=
+	     0x27000008)) {
 		adev->psp.securedisplay_context.context.bin_desc.size_bytes = 0;
 	}
 	return err;
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index 8f84fe40abbb..efa37e3b7931 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -95,7 +95,7 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 
 	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	switch (adev->ip_versions[MP0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP0_HWIP, 0)) {
 	case IP_VERSION(11, 0, 2):
 	case IP_VERSION(11, 0, 4):
 		err = psp_init_sos_microcode(psp, ucode_prefix);
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
index 469eed084976..54008a8991fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
@@ -79,7 +79,7 @@ static int psp_v13_0_init_microcode(struct psp_context *psp)
 
 	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	switch (adev->ip_versions[MP0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP0_HWIP, 0)) {
 	case IP_VERSION(13, 0, 2):
 		err = psp_init_sos_microcode(psp, ucode_prefix);
 		if (err)
@@ -181,7 +181,7 @@ static int psp_v13_0_wait_for_bootloader_steady_state(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
 
-	if (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(13, 0, 6)) {
+	if (amdgpu_ip_version(adev, MP0_HWIP, 0) == IP_VERSION(13, 0, 6)) {
 		psp_v13_0_wait_for_vmbx_ready(psp);
 
 		return psp_v13_0_wait_for_bootloader(psp);
@@ -728,7 +728,7 @@ static int psp_v13_0_fatal_error_recovery_quirk(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
 
-	if (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(13, 0, 10)) {
+	if (amdgpu_ip_version(adev, MP0_HWIP, 0) == IP_VERSION(13, 0, 10)) {
 		uint32_t  reg_data;
 		/* MP1 fatal error: trigger PSP dram read to unhalt PSP
 		 * during MP1 triggered sync flood.
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c b/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
index d5ba58eba3e2..eaa5512a21da 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
@@ -40,7 +40,7 @@ static int psp_v13_0_4_init_microcode(struct psp_context *psp)
 
 	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	switch (adev->ip_versions[MP0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP0_HWIP, 0)) {
 	case IP_VERSION(13, 0, 4):
 		err = psp_init_toc_microcode(psp, ucode_prefix);
 		if (err)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index cd37f45e01a1..8562ac7f7ff0 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -469,7 +469,7 @@ static int sdma_v4_0_irq_id_to_seq(unsigned client_id)
 
 static void sdma_v4_0_init_golden_registers(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
 	case IP_VERSION(4, 0, 0):
 		soc15_program_register_sequence(adev,
 						golden_settings_sdma_4,
@@ -539,7 +539,7 @@ static void sdma_v4_0_setup_ulv(struct amdgpu_device *adev)
 	 * The only chips with SDMAv4 and ULV are VG10 and VG20.
 	 * Server SKUs take a different hysteresis setting from other SKUs.
 	 */
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
 	case IP_VERSION(4, 0, 0):
 		if (adev->pdev->device == 0x6860)
 			break;
@@ -578,8 +578,10 @@ static int sdma_v4_0_init_microcode(struct amdgpu_device *adev)
 	int ret, i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
-		if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 2) ||
-                    adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 4, 0)) {
+		if (amdgpu_ip_version(adev, SDMA0_HWIP, 0) ==
+			    IP_VERSION(4, 2, 2) ||
+		    amdgpu_ip_version(adev, SDMA0_HWIP, 0) ==
+			    IP_VERSION(4, 4, 0)) {
 			/* Acturus & Aldebaran will leverage the same FW memory
 			   for every SDMA instance */
 			ret = amdgpu_sdma_init_microcode(adev, 0, true);
@@ -978,7 +980,8 @@ static void sdma_v4_0_ctx_switch_enable(struct amdgpu_device *adev, bool enable)
 		 * Arcturus for the moment and firmware version 14
 		 * and above.
 		 */
-		if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 2) &&
+		if (amdgpu_ip_version(adev, SDMA0_HWIP, 0) ==
+			    IP_VERSION(4, 2, 2) &&
 		    adev->sdma.instance[i].fw_version >= 14)
 			WREG32_SDMA(i, mmSDMA0_PUB_DUMMY_REG2, enable);
 		/* Extend page fault timeout to avoid interrupt storm */
@@ -1255,7 +1258,7 @@ static void sdma_v4_0_init_pg(struct amdgpu_device *adev)
 	if (!(adev->pg_flags & AMD_PG_SUPPORT_SDMA))
 		return;
 
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
 	case IP_VERSION(4, 1, 0):
         case IP_VERSION(4, 1, 1):
 	case IP_VERSION(4, 1, 2):
@@ -1698,7 +1701,7 @@ static bool sdma_v4_0_fw_support_paging_queue(struct amdgpu_device *adev)
 {
 	uint fw_version = adev->sdma.instance[0].fw_version;
 
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
 	case IP_VERSION(4, 0, 0):
 		return fw_version >= 430;
 	case IP_VERSION(4, 0, 1):
@@ -1723,7 +1726,7 @@ static int sdma_v4_0_early_init(void *handle)
 	}
 
 	/* TODO: Page queue breaks driver reload under SRIOV */
-	if ((adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 0, 0)) &&
+	if ((amdgpu_ip_version(adev, SDMA0_HWIP, 0) == IP_VERSION(4, 0, 0)) &&
 	    amdgpu_sriov_vf((adev)))
 		adev->sdma.has_page_queue = false;
 	else if (sdma_v4_0_fw_support_paging_queue(adev))
@@ -1823,7 +1826,9 @@ static int sdma_v4_0_sw_init(void *handle)
 		 * On Arcturus, SDMA instance 5~7 has a different vmhub
 		 * type(AMDGPU_MMHUB1).
 		 */
-		if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 2) && i >= 5)
+		if (amdgpu_ip_version(adev, SDMA0_HWIP, 0) ==
+			    IP_VERSION(4, 2, 2) &&
+		    i >= 5)
 			ring->vm_hub = AMDGPU_MMHUB1(0);
 		else
 			ring->vm_hub = AMDGPU_MMHUB0(0);
@@ -1843,8 +1848,10 @@ static int sdma_v4_0_sw_init(void *handle)
 			/* paging queue use same doorbell index/routing as gfx queue
 			 * with 0x400 (4096 dwords) offset on second doorbell page
 			 */
-			if (adev->ip_versions[SDMA0_HWIP][0] >= IP_VERSION(4, 0, 0) &&
-			    adev->ip_versions[SDMA0_HWIP][0] < IP_VERSION(4, 2, 0)) {
+			if (amdgpu_ip_version(adev, SDMA0_HWIP, 0) >=
+				    IP_VERSION(4, 0, 0) &&
+			    amdgpu_ip_version(adev, SDMA0_HWIP, 0) <
+				    IP_VERSION(4, 2, 0)) {
 				ring->doorbell_index =
 					adev->doorbell_index.sdma_engine[i] << 1;
 				ring->doorbell_index += 0x400;
@@ -1856,7 +1863,9 @@ static int sdma_v4_0_sw_init(void *handle)
 					(adev->doorbell_index.sdma_engine[i] + 1) << 1;
 			}
 
-			if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 2) && i >= 5)
+			if (amdgpu_ip_version(adev, SDMA0_HWIP, 0) ==
+				    IP_VERSION(4, 2, 2) &&
+			    i >= 5)
 				ring->vm_hub = AMDGPU_MMHUB1(0);
 			else
 				ring->vm_hub = AMDGPU_MMHUB0(0);
@@ -1890,8 +1899,8 @@ static int sdma_v4_0_sw_fini(void *handle)
 			amdgpu_ring_fini(&adev->sdma.instance[i].page);
 	}
 
-	if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 2) ||
-            adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 4, 0))
+	if (amdgpu_ip_version(adev, SDMA0_HWIP, 0) == IP_VERSION(4, 2, 2) ||
+	    amdgpu_ip_version(adev, SDMA0_HWIP, 0) == IP_VERSION(4, 4, 0))
 		amdgpu_sdma_destroy_inst_ctx(adev, true);
 	else
 		amdgpu_sdma_destroy_inst_ctx(adev, false);
@@ -2036,14 +2045,16 @@ static int sdma_v4_0_process_trap_irq(struct amdgpu_device *adev,
 		amdgpu_fence_process(&adev->sdma.instance[instance].ring);
 		break;
 	case 1:
-		if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 0))
+		if (amdgpu_ip_version(adev, SDMA0_HWIP, 0) ==
+		    IP_VERSION(4, 2, 0))
 			amdgpu_fence_process(&adev->sdma.instance[instance].page);
 		break;
 	case 2:
 		/* XXX compute */
 		break;
 	case 3:
-		if (adev->ip_versions[SDMA0_HWIP][0] != IP_VERSION(4, 2, 0))
+		if (amdgpu_ip_version(adev, SDMA0_HWIP, 0) !=
+		    IP_VERSION(4, 2, 0))
 			amdgpu_fence_process(&adev->sdma.instance[instance].page);
 		break;
 	}
@@ -2259,7 +2270,7 @@ static int sdma_v4_0_set_powergating_state(void *handle,
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
 	case IP_VERSION(4, 1, 0):
 	case IP_VERSION(4, 1, 1):
 	case IP_VERSION(4, 1, 2):
@@ -2622,7 +2633,7 @@ static struct amdgpu_sdma_ras sdma_v4_0_ras = {
 
 static void sdma_v4_0_set_ras_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
 	case IP_VERSION(4, 2, 0):
 	case IP_VERSION(4, 2, 2):
 		adev->sdma.ras = &sdma_v4_0_ras;
@@ -2633,7 +2644,6 @@ static void sdma_v4_0_set_ras_funcs(struct amdgpu_device *adev)
 	default:
 		break;
 	}
-
 }
 
 const struct amdgpu_ip_block_version sdma_v4_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index 267c1b7b8dcd..1cadd3cb26a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -132,7 +132,8 @@ static int sdma_v4_4_2_init_microcode(struct amdgpu_device *adev)
 	int ret, i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
-		if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 4, 2)) {
+		if (amdgpu_ip_version(adev, SDMA0_HWIP, 0) ==
+		    IP_VERSION(4, 4, 2)) {
 			ret = amdgpu_sdma_init_microcode(adev, 0, true);
 			break;
 		} else {
@@ -1231,7 +1232,7 @@ static void sdma_v4_4_2_ring_emit_reg_wait(struct amdgpu_ring *ring, uint32_t re
 
 static bool sdma_v4_4_2_fw_support_paging_queue(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
 	case IP_VERSION(4, 4, 2):
 		return false;
 	default:
@@ -1401,7 +1402,7 @@ static int sdma_v4_4_2_sw_fini(void *handle)
 			amdgpu_ring_fini(&adev->sdma.instance[i].page);
 	}
 
-	if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 4, 2))
+	if (amdgpu_ip_version(adev, SDMA0_HWIP, 0) == IP_VERSION(4, 4, 2))
 		amdgpu_sdma_destroy_inst_ctx(adev, true);
 	else
 		amdgpu_sdma_destroy_inst_ctx(adev, false);
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 1cc34efb455b..e0527e5ed7d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -184,7 +184,7 @@ static u32 sdma_v5_0_get_reg_offset(struct amdgpu_device *adev, u32 instance, u3
 
 static void sdma_v5_0_init_golden_registers(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
 	case IP_VERSION(5, 0, 0):
 		soc15_program_register_sequence(adev,
 						golden_settings_sdma_5,
@@ -1697,7 +1697,7 @@ static int sdma_v5_0_set_clockgating_state(void *handle,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
 	case IP_VERSION(5, 0, 0):
 	case IP_VERSION(5, 0, 2):
 	case IP_VERSION(5, 0, 5):
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 2b3ebebc4299..0ccb7523bc55 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -1510,7 +1510,7 @@ static int sdma_v5_2_process_illegal_inst_irq(struct amdgpu_device *adev,
 static bool sdma_v5_2_firmware_mgcg_support(struct amdgpu_device *adev,
 						     int i)
 {
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
 	case IP_VERSION(5, 2, 1):
 		if (adev->sdma.instance[i].fw_version < 70)
 			return false;
@@ -1575,8 +1575,9 @@ static void sdma_v5_2_update_medium_grain_light_sleep(struct amdgpu_device *adev
 	int i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
-
-		if (adev->sdma.instance[i].fw_version < 70 && adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(5, 2, 1))
+		if (adev->sdma.instance[i].fw_version < 70 &&
+		    amdgpu_ip_version(adev, SDMA0_HWIP, 0) ==
+			    IP_VERSION(5, 2, 1))
 			adev->cg_flags &= ~AMD_CG_SUPPORT_SDMA_LS;
 
 		if (enable && (adev->cg_flags & AMD_CG_SUPPORT_SDMA_LS)) {
@@ -1605,7 +1606,7 @@ static int sdma_v5_2_set_clockgating_state(void *handle,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
 	case IP_VERSION(5, 2, 0):
 	case IP_VERSION(5, 2, 2):
 	case IP_VERSION(5, 2, 1):
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index 0e25b6fb1340..4d6de77d289e 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1246,14 +1246,13 @@ static struct amdgpu_sdma_ras sdma_v6_0_3_ras = {
 
 static void sdma_v6_0_set_ras_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
 	case IP_VERSION(6, 0, 3):
 		adev->sdma.ras = &sdma_v6_0_3_ras;
 		break;
 	default:
 		break;
 	}
-
 }
 
 static int sdma_v6_0_early_init(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c b/drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c
index 07ded70f4df9..93f6772d1b24 100644
--- a/drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c
+++ b/drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c
@@ -36,7 +36,7 @@ static bool sienna_cichlid_is_mode2_default(struct amdgpu_reset_control *reset_c
 #if 0
 	struct amdgpu_device *adev = (struct amdgpu_device *)reset_ctl->handle;
 
-	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7) &&
+	if (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 7) &&
 	    adev->pm.fw_version >= 0x3a5500 && !amdgpu_sriov_vf(adev))
 		return true;
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 9c72add6f93d..66ed28136bc8 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -174,8 +174,8 @@ static const struct amdgpu_video_codecs vcn_4_0_3_video_codecs_encode = {
 static int soc15_query_video_codecs(struct amdgpu_device *adev, bool encode,
 				    const struct amdgpu_video_codecs **codecs)
 {
-	if (adev->ip_versions[VCE_HWIP][0]) {
-		switch (adev->ip_versions[VCE_HWIP][0]) {
+	if (amdgpu_ip_version(adev, VCE_HWIP, 0)) {
+		switch (amdgpu_ip_version(adev, VCE_HWIP, 0)) {
 		case IP_VERSION(4, 0, 0):
 		case IP_VERSION(4, 1, 0):
 			if (encode)
@@ -187,7 +187,7 @@ static int soc15_query_video_codecs(struct amdgpu_device *adev, bool encode,
 			return -EINVAL;
 		}
 	} else {
-		switch (adev->ip_versions[UVD_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, UVD_HWIP, 0)) {
 		case IP_VERSION(1, 0, 0):
 		case IP_VERSION(1, 0, 1):
 			if (encode)
@@ -324,12 +324,12 @@ static u32 soc15_get_xclk(struct amdgpu_device *adev)
 {
 	u32 reference_clock = adev->clock.spll.reference_freq;
 
-	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(12, 0, 0) ||
-	    adev->ip_versions[MP1_HWIP][0] == IP_VERSION(12, 0, 1) ||
-	    adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 6))
+	if (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(12, 0, 0) ||
+	    amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(12, 0, 1) ||
+	    amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 6))
 		return 10000;
-	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(10, 0, 0) ||
-	    adev->ip_versions[MP1_HWIP][0] == IP_VERSION(10, 0, 1))
+	if (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(10, 0, 0) ||
+	    amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(10, 0, 1))
 		return reference_clock / 4;
 
 	return reference_clock;
@@ -523,7 +523,7 @@ soc15_asic_reset_method(struct amdgpu_device *adev)
 		dev_warn(adev->dev, "Specified reset method:%d isn't supported, using AUTO instead.\n",
 				  amdgpu_reset_method);
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(10, 0, 0):
 	case IP_VERSION(10, 0, 1):
 	case IP_VERSION(12, 0, 0):
@@ -599,7 +599,7 @@ static int soc15_asic_reset(struct amdgpu_device *adev)
 
 static bool soc15_supports_baco(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(9, 0, 0):
 	case IP_VERSION(11, 0, 2):
 		if (adev->asic_type == CHIP_VEGA20) {
@@ -938,7 +938,7 @@ static int soc15_common_early_init(void *handle)
 	/* TODO: split the GC and PG flags based on the relevant IP version for which
 	 * they are relevant.
 	 */
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 0, 1):
 		adev->asic_funcs = &soc15_asic_funcs;
 		adev->cg_flags = AMD_CG_SUPPORT_GFX_MGCG |
@@ -1367,7 +1367,7 @@ static int soc15_common_set_clockgating_state(void *handle,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[NBIO_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, NBIO_HWIP, 0)) {
 	case IP_VERSION(6, 1, 0):
 	case IP_VERSION(6, 2, 0):
 	case IP_VERSION(7, 4, 0):
@@ -1423,8 +1423,7 @@ static void soc15_common_get_clockgating_state(void *handle, u64 *flags)
 
 	adev->hdp.funcs->get_clock_gating_state(adev, flags);
 
-	if (adev->ip_versions[MP0_HWIP][0] != IP_VERSION(13, 0, 2)) {
-
+	if (amdgpu_ip_version(adev, MP0_HWIP, 0) != IP_VERSION(13, 0, 2)) {
 		/* AMD_CG_SUPPORT_DRM_MGCG */
 		data = RREG32(SOC15_REG_OFFSET(MP0, 0, mmMP0_MISC_CGTT_CTRL0));
 		if (!(data & 0x01000000))
diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
index 2ecc8c9a078b..92a80780ab72 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -153,7 +153,7 @@ static int soc21_query_video_codecs(struct amdgpu_device *adev, bool encode,
 	if (adev->vcn.num_vcn_inst == hweight8(adev->vcn.harvest_config))
 		return -EINVAL;
 
-	switch (adev->ip_versions[UVD_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, UVD_HWIP, 0)) {
 	case IP_VERSION(4, 0, 0):
 	case IP_VERSION(4, 0, 2):
 	case IP_VERSION(4, 0, 4):
@@ -374,7 +374,7 @@ soc21_asic_reset_method(struct amdgpu_device *adev)
 		dev_warn(adev->dev, "Specified reset method:%d isn't supported, using AUTO instead.\n",
 				  amdgpu_reset_method);
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(13, 0, 0):
 	case IP_VERSION(13, 0, 7):
 	case IP_VERSION(13, 0, 10):
@@ -448,7 +448,7 @@ const struct amdgpu_ip_block_version soc21_common_ip_block = {
 
 static bool soc21_need_full_reset(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(11, 0, 0):
 		return amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__UMC);
 	case IP_VERSION(11, 0, 2):
@@ -577,7 +577,7 @@ static int soc21_common_early_init(void *handle)
 
 	adev->rev_id = amdgpu_device_get_rev_id(adev);
 	adev->external_rev_id = 0xff;
-	switch (adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(11, 0, 0):
 		adev->cg_flags = AMD_CG_SUPPORT_GFX_CGCG |
 			AMD_CG_SUPPORT_GFX_CGLS |
@@ -843,7 +843,7 @@ static int soc21_common_set_clockgating_state(void *handle,
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	switch (adev->ip_versions[NBIO_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, NBIO_HWIP, 0)) {
 	case IP_VERSION(4, 3, 0):
 	case IP_VERSION(4, 3, 1):
 	case IP_VERSION(7, 7, 0):
@@ -865,7 +865,7 @@ static int soc21_common_set_powergating_state(void *handle,
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	switch (adev->ip_versions[LSDMA_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, LSDMA_HWIP, 0)) {
 	case IP_VERSION(6, 0, 0):
 	case IP_VERSION(6, 0, 2):
 		adev->lsdma.funcs->update_memory_power_gating(adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c b/drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c
index 67164991f541..99713949b61f 100644
--- a/drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c
@@ -273,14 +273,15 @@ static int umsch_mm_v4_0_set_hw_resources(struct amdgpu_umsch_mm *umsch)
 
 	memcpy(set_hw_resources.mmhub_base, adev->reg_offset[MMHUB_HWIP][0],
 	       sizeof(uint32_t) * 5);
-	set_hw_resources.mmhub_version = adev->ip_versions[MMHUB_HWIP][0];
+	set_hw_resources.mmhub_version = amdgpu_ip_version(adev, MMHUB_HWIP, 0);
 
 	memcpy(set_hw_resources.osssys_base, adev->reg_offset[OSSSYS_HWIP][0],
 	       sizeof(uint32_t) * 5);
-	set_hw_resources.osssys_version = adev->ip_versions[OSSSYS_HWIP][0];
+	set_hw_resources.osssys_version =
+		amdgpu_ip_version(adev, OSSSYS_HWIP, 0);
 
-	set_hw_resources.vcn_version = adev->ip_versions[VCN_HWIP][0];
-	set_hw_resources.vpe_version = adev->ip_versions[VPE_HWIP][0];
+	set_hw_resources.vcn_version = amdgpu_ip_version(adev, VCN_HWIP, 0);
+	set_hw_resources.vpe_version = amdgpu_ip_version(adev, VPE_HWIP, 0);
 
 	set_hw_resources.api_status.api_completion_fence_addr = umsch->ring.fence_drv.gpu_addr;
 	set_hw_resources.api_status.api_completion_fence_value = ++umsch->ring.fence_drv.sync_seq;
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index 6fbea38f4d3e..aba403d71806 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -187,7 +187,7 @@ static int vcn_v2_5_sw_init(void *handle)
 		ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) +
 				(amdgpu_sriov_vf(adev) ? 2*j : 8*j);
 
-		if (adev->ip_versions[UVD_HWIP][0] == IP_VERSION(2, 5, 0))
+		if (amdgpu_ip_version(adev, UVD_HWIP, 0) == IP_VERSION(2, 5, 0))
 			ring->vm_hub = AMDGPU_MMHUB1(0);
 		else
 			ring->vm_hub = AMDGPU_MMHUB0(0);
@@ -207,7 +207,8 @@ static int vcn_v2_5_sw_init(void *handle)
 			ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) +
 					(amdgpu_sriov_vf(adev) ? (1 + i + 2*j) : (2 + i + 8*j));
 
-			if (adev->ip_versions[UVD_HWIP][0] == IP_VERSION(2, 5, 0))
+			if (amdgpu_ip_version(adev, UVD_HWIP, 0) ==
+			    IP_VERSION(2, 5, 0))
 				ring->vm_hub = AMDGPU_MMHUB1(0);
 			else
 				ring->vm_hub = AMDGPU_MMHUB0(0);
@@ -794,7 +795,7 @@ static void vcn_v2_6_enable_ras(struct amdgpu_device *adev, int inst_idx,
 {
 	uint32_t tmp;
 
-	if (adev->ip_versions[UVD_HWIP][0] != IP_VERSION(2, 6, 0))
+	if (amdgpu_ip_version(adev, UVD_HWIP, 0) != IP_VERSION(2, 6, 0))
 		return;
 
 	tmp = VCN_RAS_CNTL__VCPU_VCODEC_REARM_MASK |
@@ -1985,7 +1986,7 @@ static struct amdgpu_vcn_ras vcn_v2_6_ras = {
 
 static void vcn_v2_5_set_ras_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[VCN_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, VCN_HWIP, 0)) {
 	case IP_VERSION(2, 6, 0):
 		adev->vcn.ras = &vcn_v2_6_ras;
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index a61ecefdafc5..e02af4de521c 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -100,7 +100,8 @@ static int vcn_v3_0_early_init(void *handle)
 			/* both instances are harvested, disable the block */
 			return -ENOENT;
 
-		if (adev->ip_versions[UVD_HWIP][0] == IP_VERSION(3, 0, 33))
+		if (amdgpu_ip_version(adev, UVD_HWIP, 0) ==
+		    IP_VERSION(3, 0, 33))
 			adev->vcn.num_enc_rings = 0;
 		else
 			adev->vcn.num_enc_rings = 2;
@@ -227,9 +228,10 @@ static int vcn_v3_0_sw_init(void *handle)
 					     cpu_to_le32(AMDGPU_VCN_FW_SHARED_FLAG_0_RB);
 		fw_shared->sw_ring.is_enabled = cpu_to_le32(DEC_SW_RING_ENABLED);
 		fw_shared->present_flag_0 |= AMDGPU_VCN_SMU_VERSION_INFO_FLAG;
-		if (adev->ip_versions[UVD_HWIP][0] == IP_VERSION(3, 1, 2))
+		if (amdgpu_ip_version(adev, UVD_HWIP, 0) == IP_VERSION(3, 1, 2))
 			fw_shared->smu_interface_info.smu_interface_type = 2;
-		else if (adev->ip_versions[UVD_HWIP][0] == IP_VERSION(3, 1, 1))
+		else if (amdgpu_ip_version(adev, UVD_HWIP, 0) ==
+			 IP_VERSION(3, 1, 1))
 			fw_shared->smu_interface_info.smu_interface_type = 1;
 
 		if (amdgpu_vcnfw_log)
@@ -1255,7 +1257,8 @@ static int vcn_v3_0_start(struct amdgpu_device *adev)
 		fw_shared->rb.wptr = lower_32_bits(ring->wptr);
 		fw_shared->multi_queue.decode_queue_mode &= cpu_to_le32(~FW_QUEUE_RING_RESET);
 
-		if (adev->ip_versions[UVD_HWIP][0] != IP_VERSION(3, 0, 33)) {
+		if (amdgpu_ip_version(adev, UVD_HWIP, 0) !=
+		    IP_VERSION(3, 0, 33)) {
 			fw_shared->multi_queue.encode_generalpurpose_queue_mode |= cpu_to_le32(FW_QUEUE_RING_RESET);
 			ring = &adev->vcn.inst[i].ring_enc[0];
 			WREG32_SOC15(VCN, i, mmUVD_RB_RPTR, lower_32_bits(ring->wptr));
@@ -1628,7 +1631,8 @@ static int vcn_v3_0_pause_dpg_mode(struct amdgpu_device *adev,
 					UVD_POWER_STATUS__STALL_DPG_POWER_UP_MASK,
 					~UVD_POWER_STATUS__STALL_DPG_POWER_UP_MASK);
 
-				if (adev->ip_versions[UVD_HWIP][0] != IP_VERSION(3, 0, 33)) {
+				if (amdgpu_ip_version(adev, UVD_HWIP, 0) !=
+				    IP_VERSION(3, 0, 33)) {
 					/* Restore */
 					fw_shared = adev->vcn.inst[inst_idx].fw_shared.cpu_addr;
 					fw_shared->multi_queue.encode_generalpurpose_queue_mode |= cpu_to_le32(FW_QUEUE_RING_RESET);
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index ae8db12d8832..96831f931423 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -169,7 +169,8 @@ static int vcn_v4_0_sw_init(void *handle)
 		fw_shared->smu_dpm_interface.smu_interface_type = (adev->flags & AMD_IS_APU) ?
 			AMDGPU_VCN_SMU_DPM_INTERFACE_APU : AMDGPU_VCN_SMU_DPM_INTERFACE_DGPU;
 
-		if (adev->ip_versions[VCN_HWIP][0] == IP_VERSION(4, 0, 2)) {
+		if (amdgpu_ip_version(adev, VCN_HWIP, 0) ==
+		    IP_VERSION(4, 0, 2)) {
 			fw_shared->present_flag_0 |= AMDGPU_FW_SHARED_FLAG_0_DRM_KEY_INJECT;
 			fw_shared->drm_key_wa.method =
 				AMDGPU_DRM_KEY_INJECT_WORKAROUND_VCNFW_ASD_HANDSHAKING;
@@ -1852,7 +1853,7 @@ static void vcn_v4_0_set_unified_ring_funcs(struct amdgpu_device *adev)
 		if (adev->vcn.harvest_config & (1 << i))
 			continue;
 
-		if (adev->ip_versions[VCN_HWIP][0] == IP_VERSION(4, 0, 2))
+		if (amdgpu_ip_version(adev, VCN_HWIP, 0) == IP_VERSION(4, 0, 2))
 			vcn_v4_0_unified_ring_vm_funcs.secure_submission_supported = true;
 
 		adev->vcn.inst[i].ring_enc[0].funcs =
@@ -2159,7 +2160,7 @@ static struct amdgpu_vcn_ras vcn_v4_0_ras = {
 
 static void vcn_v4_0_set_ras_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[VCN_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, VCN_HWIP, 0)) {
 	case IP_VERSION(4, 0, 0):
 		adev->vcn.ras = &vcn_v4_0_ras;
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
index dbc99536440f..ddfc6941f9d5 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -291,7 +291,7 @@ static int vega20_ih_irq_init(struct amdgpu_device *adev)
 
 	adev->nbio.funcs->ih_control(adev);
 
-	if ((adev->ip_versions[OSSSYS_HWIP][0] == IP_VERSION(4, 2, 1)) &&
+	if ((amdgpu_ip_version(adev, OSSSYS_HWIP, 0) == IP_VERSION(4, 2, 1)) &&
 	    adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
 		ih_chicken = RREG32_SOC15(OSSSYS, 0, mmIH_CHICKEN);
 		if (adev->irq.ih.use_bus_addr) {
@@ -304,8 +304,8 @@ static int vega20_ih_irq_init(struct amdgpu_device *adev)
 	/* psp firmware won't program IH_CHICKEN for aldebaran
 	 * driver needs to program it properly according to
 	 * MC_SPACE type in IH_RB_CNTL */
-	if ((adev->ip_versions[OSSSYS_HWIP][0] == IP_VERSION(4, 4, 0)) ||
-	    (adev->ip_versions[OSSSYS_HWIP][0] == IP_VERSION(4, 4, 2))) {
+	if ((amdgpu_ip_version(adev, OSSSYS_HWIP, 0) == IP_VERSION(4, 4, 0)) ||
+	    (amdgpu_ip_version(adev, OSSSYS_HWIP, 0) == IP_VERSION(4, 4, 2))) {
 		ih_chicken = RREG32_SOC15(OSSSYS, 0, mmIH_CHICKEN_ALDEBARAN);
 		if (adev->irq.ih.use_bus_addr) {
 			ih_chicken = REG_SET_FIELD(ih_chicken, IH_CHICKEN,
@@ -334,8 +334,8 @@ static int vega20_ih_irq_init(struct amdgpu_device *adev)
 		vega20_setup_retry_doorbell(adev->irq.retry_cam_doorbell_index));
 
 	/* Enable IH Retry CAM */
-	if (adev->ip_versions[OSSSYS_HWIP][0] == IP_VERSION(4, 4, 0) ||
-	    adev->ip_versions[OSSSYS_HWIP][0] == IP_VERSION(4, 4, 2))
+	if (amdgpu_ip_version(adev, OSSSYS_HWIP, 0) == IP_VERSION(4, 4, 0) ||
+	    amdgpu_ip_version(adev, OSSSYS_HWIP, 0) == IP_VERSION(4, 4, 2))
 		WREG32_FIELD15(OSSSYS, 0, IH_RETRY_INT_CAM_CNTL_ALDEBARAN,
 			       ENABLE, 1);
 	else
@@ -537,7 +537,7 @@ static int vega20_ih_sw_init(void *handle)
 		return r;
 
 	if ((adev->flags & AMD_IS_APU) &&
-	    (adev->ip_versions[OSSSYS_HWIP][0] == IP_VERSION(4, 4, 2)))
+	    (amdgpu_ip_version(adev, OSSSYS_HWIP, 0) == IP_VERSION(4, 4, 2)))
 		use_bus_addr = false;
 
 	r = amdgpu_ih_ring_init(adev, &adev->irq.ih, IH_RING_SIZE, use_bus_addr);
@@ -554,7 +554,7 @@ static int vega20_ih_sw_init(void *handle)
 	adev->irq.ih1.use_doorbell = true;
 	adev->irq.ih1.doorbell_index = (adev->doorbell_index.ih + 1) << 1;
 
-	if (adev->ip_versions[OSSSYS_HWIP][0] != IP_VERSION(4, 4, 2)) {
+	if (amdgpu_ip_version(adev, OSSSYS_HWIP, 0) != IP_VERSION(4, 4, 2)) {
 		r = amdgpu_ih_ring_init(adev, &adev->irq.ih2, PAGE_SIZE, true);
 		if (r)
 			return r;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index ab4a63bb3e3e..0a9cf9dfc224 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -65,7 +65,7 @@ static int kfd_resume(struct kfd_node *kfd);
 
 static void kfd_device_info_set_sdma_info(struct kfd_dev *kfd)
 {
-	uint32_t sdma_version = kfd->adev->ip_versions[SDMA0_HWIP][0];
+	uint32_t sdma_version = amdgpu_ip_version(kfd->adev, SDMA0_HWIP, 0);
 
 	switch (sdma_version) {
 	case IP_VERSION(4, 0, 0):/* VEGA10 */
@@ -282,7 +282,7 @@ struct kfd_dev *kgd2kfd_probe(struct amdgpu_device *adev, bool vf)
 			f2g = &gfx_v8_kfd2kgd;
 		break;
 	default:
-		switch (adev->ip_versions[GC_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 		/* Vega 10 */
 		case IP_VERSION(9, 0, 1):
 			gfx_target_version = 90000;
@@ -427,9 +427,11 @@ struct kfd_dev *kgd2kfd_probe(struct amdgpu_device *adev, bool vf)
 	}
 
 	if (!f2g) {
-		if (adev->ip_versions[GC_HWIP][0])
-			dev_err(kfd_device, "GC IP %06x %s not supported in kfd\n",
-				adev->ip_versions[GC_HWIP][0], vf ? "VF" : "");
+		if (amdgpu_ip_version(adev, GC_HWIP, 0))
+			dev_err(kfd_device,
+				"GC IP %06x %s not supported in kfd\n",
+				amdgpu_ip_version(adev, GC_HWIP, 0),
+				vf ? "VF" : "");
 		else
 			dev_err(kfd_device, "%s %s not supported in kfd\n",
 				amdgpu_asic_name[adev->asic_type], vf ? "VF" : "");
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 7d82c7da223a..192b0d106413 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -1001,7 +1001,7 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 	void *r;
 
 	/* Page migration works on gfx9 or newer */
-	if (adev->ip_versions[GC_HWIP][0] < IP_VERSION(9, 0, 1))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) < IP_VERSION(9, 0, 1))
 		return -EINVAL;
 
 	if (adev->gmc.is_app_apu)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
index 1a03173e2313..8ee2bedd301a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
@@ -205,7 +205,8 @@ static int pm_set_resources_v9(struct packet_manager *pm, uint32_t *buffer,
 
 static inline bool pm_use_ext_eng(struct kfd_dev *dev)
 {
-	return dev->adev->ip_versions[SDMA0_HWIP][0] >= IP_VERSION(5, 2, 0);
+	return amdgpu_ip_version(dev->adev, SDMA0_HWIP, 0) >=
+	       IP_VERSION(5, 2, 0);
 }
 
 static int pm_map_queues_v9(struct packet_manager *pm, uint32_t *buffer,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index b9950074aee0..9cc32f577e38 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -202,7 +202,7 @@ enum cache_policy {
 	cache_policy_noncoherent
 };
 
-#define KFD_GC_VERSION(dev) ((dev)->adev->ip_versions[GC_HWIP][0])
+#define KFD_GC_VERSION(dev) (amdgpu_ip_version((dev)->adev, GC_HWIP, 0))
 #define KFD_IS_SOC15(dev)   ((KFD_GC_VERSION(dev)) >= (IP_VERSION(9, 0, 1)))
 #define KFD_SUPPORT_XNACK_PER_PROCESS(dev)\
 	((KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2)) ||	\
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 841ba6102bbb..c8abe7118907 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1194,7 +1194,7 @@ svm_range_get_pte_flags(struct kfd_node *node,
 	if (domain == SVM_RANGE_VRAM_DOMAIN)
 		bo_node = prange->svm_bo->node;
 
-	switch (node->adev->ip_versions[GC_HWIP][0]) {
+	switch (amdgpu_ip_version(node->adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 4, 1):
 		if (domain == SVM_RANGE_VRAM_DOMAIN) {
 			if (bo_node == node) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5efebc06296b..933c9b5d5252 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1173,7 +1173,7 @@ static int dm_dmub_hw_init(struct amdgpu_device *adev)
 	for (i = 0; i < fb_info->num_fb; ++i)
 		hw_params.fb[i] = &fb_info->fb[i];
 
-	switch (adev->ip_versions[DCE_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 	case IP_VERSION(3, 1, 3):
 	case IP_VERSION(3, 1, 4):
 	case IP_VERSION(3, 5, 0):
@@ -1606,7 +1606,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 
 	init_data.dce_environment = DCE_ENV_PRODUCTION_DRV;
 
-	switch (adev->ip_versions[DCE_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 	case IP_VERSION(2, 1, 0):
 		switch (adev->dm.dmcub_fw_version) {
 		case 0: /* development */
@@ -1631,7 +1631,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 		init_data.flags.gpu_vm_support = true;
 		break;
 	default:
-		switch (adev->ip_versions[DCE_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 		case IP_VERSION(1, 0, 0):
 		case IP_VERSION(1, 0, 1):
 			/* enable S/G on PCO and RV2 */
@@ -2015,7 +2015,7 @@ static int load_dmcu_fw(struct amdgpu_device *adev)
 			return 0;
 		break;
 	default:
-		switch (adev->ip_versions[DCE_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 		case IP_VERSION(2, 0, 2):
 		case IP_VERSION(2, 0, 3):
 		case IP_VERSION(2, 0, 0):
@@ -2105,7 +2105,7 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
 	enum dmub_status status;
 	int r;
 
-	switch (adev->ip_versions[DCE_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 	case IP_VERSION(2, 1, 0):
 		dmub_asic = DMUB_ASIC_DCN21;
 		break;
@@ -2477,7 +2477,7 @@ static int amdgpu_dm_smu_write_watermarks_table(struct amdgpu_device *adev)
 	 * therefore, this function apply to navi10/12/14 but not Renoir
 	 * *
 	 */
-	switch (adev->ip_versions[DCE_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 	case IP_VERSION(2, 0, 2):
 	case IP_VERSION(2, 0, 0):
 		break;
@@ -4429,7 +4429,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 		}
 
 	/* Use Outbox interrupt */
-	switch (adev->ip_versions[DCE_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 	case IP_VERSION(3, 0, 0):
 	case IP_VERSION(3, 1, 2):
 	case IP_VERSION(3, 1, 3):
@@ -4447,12 +4447,12 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 		break;
 	default:
 		DRM_DEBUG_KMS("Unsupported DCN IP version for outbox: 0x%X\n",
-			      adev->ip_versions[DCE_HWIP][0]);
+			      amdgpu_ip_version(adev, DCE_HWIP, 0));
 	}
 
 	/* Determine whether to enable PSR support by default. */
 	if (!(amdgpu_dc_debug_mask & DC_DISABLE_PSR)) {
-		switch (adev->ip_versions[DCE_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 		case IP_VERSION(3, 1, 2):
 		case IP_VERSION(3, 1, 3):
 		case IP_VERSION(3, 1, 4):
@@ -4470,7 +4470,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 	}
 
 	if (!(amdgpu_dc_debug_mask & DC_DISABLE_REPLAY)) {
-		switch (adev->ip_versions[DCE_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 		case IP_VERSION(3, 1, 4):
 		case IP_VERSION(3, 1, 5):
 		case IP_VERSION(3, 1, 6):
@@ -4589,7 +4589,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 		}
 		break;
 	default:
-		switch (adev->ip_versions[DCE_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 		case IP_VERSION(1, 0, 0):
 		case IP_VERSION(1, 0, 1):
 		case IP_VERSION(2, 0, 2):
@@ -4615,7 +4615,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 			break;
 		default:
 			DRM_ERROR("Unsupported DCE IP versions: 0x%X\n",
-					adev->ip_versions[DCE_HWIP][0]);
+					amdgpu_ip_version(adev, DCE_HWIP, 0));
 			goto fail;
 		}
 		break;
@@ -4698,14 +4698,14 @@ static int dm_init_microcode(struct amdgpu_device *adev)
 	char *fw_name_dmub;
 	int r;
 
-	switch (adev->ip_versions[DCE_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 	case IP_VERSION(2, 1, 0):
 		fw_name_dmub = FIRMWARE_RENOIR_DMUB;
 		if (ASICREV_IS_GREEN_SARDINE(adev->external_rev_id))
 			fw_name_dmub = FIRMWARE_GREEN_SARDINE_DMUB;
 		break;
 	case IP_VERSION(3, 0, 0):
-		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
+		if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(10, 3, 0))
 			fw_name_dmub = FIRMWARE_SIENNA_CICHLID_DMUB;
 		else
 			fw_name_dmub = FIRMWARE_NAVY_FLOUNDER_DMUB;
@@ -4835,7 +4835,7 @@ static int dm_early_init(void *handle)
 		break;
 	default:
 
-		switch (adev->ip_versions[DCE_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 		case IP_VERSION(2, 0, 2):
 		case IP_VERSION(3, 0, 0):
 			adev->mode_info.num_crtc = 6;
@@ -4872,7 +4872,7 @@ static int dm_early_init(void *handle)
 			break;
 		default:
 			DRM_ERROR("Unsupported DCE IP versions: 0x%x\n",
-					adev->ip_versions[DCE_HWIP][0]);
+					amdgpu_ip_version(adev, DCE_HWIP, 0));
 			return -EINVAL;
 		}
 		break;
@@ -11006,7 +11006,7 @@ int amdgpu_dm_process_dmub_set_config_sync(
  */
 bool check_seamless_boot_capability(struct amdgpu_device *adev)
 {
-	switch (adev->ip_versions[DCE_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
 	case IP_VERSION(3, 0, 1):
 		if (!adev->mman.keep_stolen_vga_memory)
 			return true;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index b97cbc4e5477..8038fe3d193e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -226,7 +226,7 @@ static void fill_gfx9_tiling_info_from_device(const struct amdgpu_device *adev,
 	tiling_info->gfx9.num_rb_per_se =
 		adev->gfx.config.gb_addr_config_fields.num_rb_per_se;
 	tiling_info->gfx9.shaderEnable = 1;
-	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0))
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(10, 3, 0))
 		tiling_info->gfx9.num_pkrs = adev->gfx.config.gb_addr_config_fields.num_pkrs;
 }
 
@@ -669,7 +669,7 @@ static int get_plane_modifiers(struct amdgpu_device *adev, unsigned int plane_ty
 	case AMDGPU_FAMILY_YC:
 	case AMDGPU_FAMILY_GC_10_3_6:
 	case AMDGPU_FAMILY_GC_10_3_7:
-		if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0))
+		if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(10, 3, 0))
 			add_gfx10_3_modifiers(adev, mods, &size, &capacity);
 		else
 			add_gfx10_1_modifiers(adev, mods, &size, &capacity);
@@ -1069,8 +1069,8 @@ int amdgpu_dm_plane_fill_dc_scaling_info(struct amdgpu_device *adev,
 	 * is to gesture the YouTube Android app into full screen
 	 * on ChromeOS.
 	 */
-	if (((adev->ip_versions[DCE_HWIP][0] == IP_VERSION(1, 0, 0)) ||
-	    (adev->ip_versions[DCE_HWIP][0] == IP_VERSION(1, 0, 1))) &&
+	if (((amdgpu_ip_version(adev, DCE_HWIP, 0) == IP_VERSION(1, 0, 0)) ||
+	    (amdgpu_ip_version(adev, DCE_HWIP, 0) == IP_VERSION(1, 0, 1))) &&
 	    (state->fb && state->fb->format->format == DRM_FORMAT_NV12 &&
 	    (scaling_info->src_rect.x != 0 || scaling_info->src_rect.y != 0)))
 		return -EINVAL;
@@ -1509,7 +1509,7 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 		drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
 						   supported_rotations);
 
-	if (dm->adev->ip_versions[DCE_HWIP][0] > IP_VERSION(3, 0, 1) &&
+	if (amdgpu_ip_version(dm->adev, DCE_HWIP, 0) > IP_VERSION(3, 0, 1) &&
 	    plane->type != DRM_PLANE_TYPE_CURSOR)
 		drm_plane_enable_fb_damage_clips(plane);
 
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 84e1af6a6ce7..e789a48089ad 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -2024,8 +2024,8 @@ static int default_attr_update(struct amdgpu_device *adev, struct amdgpu_device_
 			       uint32_t mask, enum amdgpu_device_attr_states *states)
 {
 	struct device_attribute *dev_attr = &attr->dev_attr;
-	uint32_t mp1_ver = adev->ip_versions[MP1_HWIP][0];
-	uint32_t gc_ver = adev->ip_versions[GC_HWIP][0];
+	uint32_t mp1_ver = amdgpu_ip_version(adev, MP1_HWIP, 0);
+	uint32_t gc_ver = amdgpu_ip_version(adev, GC_HWIP, 0);
 	const char *attr_name = dev_attr->attr.name;
 
 	if (!(attr->flags & mask)) {
@@ -2917,7 +2917,7 @@ static ssize_t amdgpu_hwmon_show_power_label(struct device *dev,
 					 char *buf)
 {
 	struct amdgpu_device *adev = dev_get_drvdata(dev);
-	uint32_t gc_ver = adev->ip_versions[GC_HWIP][0];
+	uint32_t gc_ver = amdgpu_ip_version(adev, GC_HWIP, 0);
 
 	if (gc_ver == IP_VERSION(10, 3, 1))
 		return sysfs_emit(buf, "%s\n",
@@ -3205,7 +3205,7 @@ static umode_t hwmon_attributes_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct amdgpu_device *adev = dev_get_drvdata(dev);
 	umode_t effective_mode = attr->mode;
-	uint32_t gc_ver = adev->ip_versions[GC_HWIP][0];
+	uint32_t gc_ver = amdgpu_ip_version(adev, GC_HWIP, 0);
 	uint32_t tmp;
 
 	/* under multi-vf mode, the hwmon attributes are all not supported */
@@ -4158,8 +4158,8 @@ static void amdgpu_debugfs_prints_cpu_info(struct seq_file *m,
 
 static int amdgpu_debugfs_pm_info_pp(struct seq_file *m, struct amdgpu_device *adev)
 {
-	uint32_t mp1_ver = adev->ip_versions[MP1_HWIP][0];
-	uint32_t gc_ver = adev->ip_versions[GC_HWIP][0];
+	uint32_t mp1_ver = amdgpu_ip_version(adev, MP1_HWIP, 0);
+	uint32_t gc_ver = amdgpu_ip_version(adev, GC_HWIP, 0);
 	uint32_t value;
 	uint64_t value64 = 0;
 	uint32_t query = 0;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index ed23d7de3f28..e6f1620acdd4 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -485,7 +485,7 @@ bool is_support_sw_smu(struct amdgpu_device *adev)
 	if (adev->asic_type == CHIP_VEGA20)
 		return false;
 
-	if (adev->ip_versions[MP1_HWIP][0] >= IP_VERSION(11, 0, 0))
+	if (amdgpu_ip_version(adev, MP1_HWIP, 0) >= IP_VERSION(11, 0, 0))
 		return true;
 
 	return false;
@@ -603,7 +603,7 @@ static int smu_set_funcs(struct amdgpu_device *adev)
 	if (adev->pm.pp_feature & PP_OVERDRIVE_MASK)
 		smu->od_enabled = true;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 5):
 	case IP_VERSION(11, 0, 9):
@@ -775,8 +775,8 @@ static int smu_late_init(void *handle)
 		}
 	}
 
-	if ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 1)) ||
-	    (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 3)))
+	if ((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 1)) ||
+	    (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 3)))
 		return 0;
 
 	if (!amdgpu_sriov_vf(adev) || smu->od_enabled) {
@@ -1259,7 +1259,7 @@ static int smu_smc_hw_setup(struct smu_context *smu)
 	uint64_t features_supported;
 	int ret = 0;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(11, 0, 7):
 	case IP_VERSION(11, 0, 11):
 	case IP_VERSION(11, 5, 0):
@@ -1449,7 +1449,7 @@ static int smu_start_smc_engine(struct smu_context *smu)
 	int ret = 0;
 
 	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
-		if (adev->ip_versions[MP1_HWIP][0] < IP_VERSION(11, 0, 0)) {
+		if (amdgpu_ip_version(adev, MP1_HWIP, 0) < IP_VERSION(11, 0, 0)) {
 			if (smu->ppt_funcs->load_microcode) {
 				ret = smu->ppt_funcs->load_microcode(smu);
 				if (ret)
@@ -1549,7 +1549,7 @@ static int smu_disable_dpms(struct smu_context *smu)
 	 * For SMU 13.0.0 and 13.0.7, PMFW will handle the DPM features(disablement or others)
 	 * properly on suspend/reset/unload. Driver involvement may cause some unexpected issues.
 	 */
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(13, 0, 0):
 	case IP_VERSION(13, 0, 7):
 	case IP_VERSION(13, 0, 10):
@@ -1570,7 +1570,7 @@ static int smu_disable_dpms(struct smu_context *smu)
 	 *     properly.
 	 */
 	if (smu->uploading_custom_pp_table) {
-		switch (adev->ip_versions[MP1_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 		case IP_VERSION(11, 0, 0):
 		case IP_VERSION(11, 0, 5):
 		case IP_VERSION(11, 0, 9):
@@ -1590,7 +1590,7 @@ static int smu_disable_dpms(struct smu_context *smu)
 	 * on BACO in. Driver involvement is unnecessary.
 	 */
 	if (use_baco) {
-		switch (adev->ip_versions[MP1_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 		case IP_VERSION(11, 0, 7):
 		case IP_VERSION(11, 0, 0):
 		case IP_VERSION(11, 0, 5):
@@ -1607,7 +1607,7 @@ static int smu_disable_dpms(struct smu_context *smu)
 	 * for gpu reset and S0i3 cases. Driver involvement is unnecessary.
 	 */
 	if (amdgpu_in_reset(adev) || adev->in_s0ix) {
-		switch (adev->ip_versions[MP1_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 		case IP_VERSION(13, 0, 4):
 		case IP_VERSION(13, 0, 11):
 			return 0;
@@ -1634,7 +1634,7 @@ static int smu_disable_dpms(struct smu_context *smu)
 		}
 	}
 
-	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(9, 4, 2) &&
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(9, 4, 2) &&
 	    !amdgpu_sriov_vf(adev) && adev->gfx.rlc.funcs->stop)
 		adev->gfx.rlc.funcs->stop(adev);
 
@@ -2391,7 +2391,7 @@ int smu_get_power_limit(void *handle,
 	} else {
 		switch (limit_level) {
 		case SMU_PPT_LIMIT_CURRENT:
-			switch (adev->ip_versions[MP1_HWIP][0]) {
+			switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 			case IP_VERSION(13, 0, 2):
 			case IP_VERSION(11, 0, 7):
 			case IP_VERSION(11, 0, 11):
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index 18487ae10bcf..650482cedd1f 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -345,8 +345,8 @@ navi10_get_allowed_feature_mask(struct smu_context *smu,
 
 	/* DPM UCLK enablement should be skipped for navi10 A0 secure board */
 	if (!(is_asic_secure(smu) &&
-	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0)) &&
-	     (adev->rev_id == 0)) &&
+	      (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 0)) &&
+	      (adev->rev_id == 0)) &&
 	    (adev->pm.pp_feature & PP_MCLK_DPM_MASK))
 		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DPM_UCLK_BIT)
 				| FEATURE_MASK(FEATURE_MEM_VDDCI_SCALING_BIT)
@@ -354,7 +354,7 @@ navi10_get_allowed_feature_mask(struct smu_context *smu,
 
 	/* DS SOCCLK enablement should be skipped for navi10 A0 secure board */
 	if (is_asic_secure(smu) &&
-	    (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0)) &&
+	    (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 0)) &&
 	    (adev->rev_id == 0))
 		*(uint64_t *)feature_mask &=
 				~FEATURE_MASK(FEATURE_DS_SOCCLK_BIT);
@@ -916,7 +916,7 @@ static int navi1x_get_smu_metrics_data(struct smu_context *smu,
 		return ret;
 	}
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(11, 0, 9):
 		if (smu_version > 0x00341C00)
 			ret = navi12_get_smu_metrics_data(smu, member, value);
@@ -926,8 +926,12 @@ static int navi1x_get_smu_metrics_data(struct smu_context *smu,
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 5):
 	default:
-		if (((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 5)) && smu_version > 0x00351F00) ||
-		      ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0)) && smu_version > 0x002A3B00))
+		if (((amdgpu_ip_version(adev, MP1_HWIP, 0) ==
+		      IP_VERSION(11, 0, 5)) &&
+		     smu_version > 0x00351F00) ||
+		    ((amdgpu_ip_version(adev, MP1_HWIP, 0) ==
+		      IP_VERSION(11, 0, 0)) &&
+		     smu_version > 0x002A3B00))
 			ret = navi10_get_smu_metrics_data(smu, member, value);
 		else
 			ret = navi10_get_legacy_smu_metrics_data(smu, member, value);
@@ -1712,7 +1716,7 @@ static int navi10_populate_umd_state_clk(struct smu_context *smu)
 	uint32_t sclk_freq;
 
 	pstate_table->gfxclk_pstate.min = gfx_table->min;
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(11, 0, 0):
 		switch (adev->pdev->revision) {
 		case 0xf0: /* XTX */
@@ -2754,8 +2758,8 @@ static bool navi10_need_umc_cdr_workaround(struct smu_context *smu)
 	if (!smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT))
 		return false;
 
-	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0) ||
-	    adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 5))
+	if (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 0) ||
+	    amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 5))
 		return true;
 
 	return false;
@@ -2863,8 +2867,10 @@ static int navi10_run_umc_cdr_workaround(struct smu_context *smu)
 	 * - PPSMC_MSG_SetDriverDummyTableDramAddrLow
 	 * - PPSMC_MSG_GetUMCFWWA
 	 */
-	if (((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0)) && (pmfw_version >= 0x2a3500)) ||
-	    ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 5)) && (pmfw_version >= 0x351D00))) {
+	if (((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 0)) &&
+	     (pmfw_version >= 0x2a3500)) ||
+	    ((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 5)) &&
+	     (pmfw_version >= 0x351D00))) {
 		ret = smu_cmn_send_smc_msg_with_param(smu,
 						      SMU_MSG_GET_UMC_FW_WA,
 						      0,
@@ -2883,13 +2889,15 @@ static int navi10_run_umc_cdr_workaround(struct smu_context *smu)
 			return 0;
 
 		if (umc_fw_disable_cdr) {
-			if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0))
+			if (amdgpu_ip_version(adev, MP1_HWIP, 0) ==
+			    IP_VERSION(11, 0, 0))
 				return navi10_umc_hybrid_cdr_workaround(smu);
 		} else {
 			return navi10_set_dummy_pstates_table_location(smu);
 		}
 	} else {
-		if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0))
+		if (amdgpu_ip_version(adev, MP1_HWIP, 0) ==
+		    IP_VERSION(11, 0, 0))
 			return navi10_umc_hybrid_cdr_workaround(smu);
 	}
 
@@ -3356,7 +3364,7 @@ static ssize_t navi1x_get_gpu_metrics(struct smu_context *smu,
 		return ret;
 	}
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(11, 0, 9):
 		if (smu_version > 0x00341C00)
 			ret = navi12_get_gpu_metrics(smu, table);
@@ -3366,8 +3374,12 @@ static ssize_t navi1x_get_gpu_metrics(struct smu_context *smu,
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 5):
 	default:
-		if (((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 5)) && smu_version > 0x00351F00) ||
-		      ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0)) && smu_version > 0x002A3B00))
+		if (((amdgpu_ip_version(adev, MP1_HWIP, 0) ==
+		      IP_VERSION(11, 0, 5)) &&
+		     smu_version > 0x00351F00) ||
+		    ((amdgpu_ip_version(adev, MP1_HWIP, 0) ==
+		      IP_VERSION(11, 0, 0)) &&
+		     smu_version > 0x002A3B00))
 			ret = navi10_get_gpu_metrics(smu, table);
 		else
 			ret = navi10_get_legacy_gpu_metrics(smu, table);
@@ -3385,7 +3397,7 @@ static int navi10_enable_mgpu_fan_boost(struct smu_context *smu)
 	uint32_t param = 0;
 
 	/* Navi12 does not support this */
-	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 9))
+	if (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 9))
 		return 0;
 
 	/*
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 4bb289f9b4b8..164c2264027d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -73,12 +73,16 @@
 
 #define SMU_11_0_7_GFX_BUSY_THRESHOLD 15
 
-#define GET_PPTABLE_MEMBER(field, member) do {\
-	if (smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 13))\
-		(*member) = (smu->smu_table.driver_pptable + offsetof(PPTable_beige_goby_t, field));\
-	else\
-		(*member) = (smu->smu_table.driver_pptable + offsetof(PPTable_t, field));\
-} while(0)
+#define GET_PPTABLE_MEMBER(field, member)                                    \
+	do {                                                                 \
+		if (amdgpu_ip_version(smu->adev, MP1_HWIP, 0) ==             \
+		    IP_VERSION(11, 0, 13))                                   \
+			(*member) = (smu->smu_table.driver_pptable +         \
+				     offsetof(PPTable_beige_goby_t, field)); \
+		else                                                         \
+			(*member) = (smu->smu_table.driver_pptable +         \
+				     offsetof(PPTable_t, field));            \
+	} while (0)
 
 /* STB FIFO depth is in 64bit units */
 #define SIENNA_CICHLID_STB_DEPTH_UNIT_BYTES 8
@@ -91,7 +95,7 @@
 
 static int get_table_size(struct smu_context *smu)
 {
-	if (smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 13))
+	if (amdgpu_ip_version(smu->adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 13))
 		return sizeof(PPTable_beige_goby_t);
 	else
 		return sizeof(PPTable_t);
@@ -309,7 +313,7 @@ sienna_cichlid_get_allowed_feature_mask(struct smu_context *smu,
 	}
 
 	if ((adev->pm.pp_feature & PP_GFX_DCS_MASK) &&
-	    (adev->ip_versions[MP1_HWIP][0] > IP_VERSION(11, 0, 7)) &&
+	    (amdgpu_ip_version(adev, MP1_HWIP, 0) > IP_VERSION(11, 0, 7)) &&
 	    !(adev->flags & AMD_IS_APU))
 		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_GFX_DCS_BIT);
 
@@ -434,7 +438,7 @@ static int sienna_cichlid_append_powerplay_table(struct smu_context *smu)
 	PPTable_beige_goby_t *ppt_beige_goby;
 	PPTable_t *ppt;
 
-	if (smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 13))
+	if (amdgpu_ip_version(smu->adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 13))
 		ppt_beige_goby = smu->smu_table.driver_pptable;
 	else
 		ppt = smu->smu_table.driver_pptable;
@@ -447,7 +451,7 @@ static int sienna_cichlid_append_powerplay_table(struct smu_context *smu)
 	if (ret)
 		return ret;
 
-	if (smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 13))
+	if (amdgpu_ip_version(smu->adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 13))
 		smu_memcpy_trailing(ppt_beige_goby, I2cControllers, BoardReserved,
 				    smc_dpm_table, I2cControllers);
 	else
@@ -725,7 +729,7 @@ static int sienna_cichlid_get_smu_metrics_data(struct smu_context *smu,
 	uint32_t apu_percent = 0;
 	uint32_t dgpu_percent = 0;
 
-	switch (smu->adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(smu->adev, MP1_HWIP, 0)) {
 	case IP_VERSION(11, 0, 7):
 		if (smu->smc_fw_version >= 0x3A4900)
 			use_metrics_v3 = true;
@@ -1385,8 +1389,9 @@ static int sienna_cichlid_print_clk_levels(struct smu_context *smu,
 		 * and onwards SMU firmwares.
 		 */
 		smu_cmn_get_smc_version(smu, NULL, &smu_version);
-		if ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
-		     (smu_version < 0x003a2900))
+		if ((amdgpu_ip_version(adev, MP1_HWIP, 0) ==
+		     IP_VERSION(11, 0, 7)) &&
+		    (smu_version < 0x003a2900))
 			break;
 
 		size += sysfs_emit_at(buf, size, "OD_VDDGFX_OFFSET:\n");
@@ -1494,7 +1499,7 @@ static int sienna_cichlid_populate_umd_state_clk(struct smu_context *smu)
 	pstate_table->socclk_pstate.min = soc_table->min;
 	pstate_table->socclk_pstate.peak = soc_table->max;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(11, 0, 7):
 	case IP_VERSION(11, 0, 11):
 		pstate_table->gfxclk_pstate.standard = SIENNA_CICHLID_UMD_PSTATE_PROFILING_GFXCLK;
@@ -1945,7 +1950,8 @@ static int sienna_cichlid_read_sensor(struct smu_context *smu,
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_SS_APU_SHARE:
-		if (adev->ip_versions[MP1_HWIP][0] != IP_VERSION(11, 0, 7)) {
+		if (amdgpu_ip_version(adev, MP1_HWIP, 0) !=
+		    IP_VERSION(11, 0, 7)) {
 			ret = sienna_cichlid_get_smu_metrics_data(smu,
 						METRICS_SS_APU_SHARE, (uint32_t *)data);
 			*size = 4;
@@ -1954,7 +1960,8 @@ static int sienna_cichlid_read_sensor(struct smu_context *smu,
 		}
 		break;
 	case AMDGPU_PP_SENSOR_SS_DGPU_SHARE:
-		if (adev->ip_versions[MP1_HWIP][0] != IP_VERSION(11, 0, 7)) {
+		if (amdgpu_ip_version(adev, MP1_HWIP, 0) !=
+		    IP_VERSION(11, 0, 7)) {
 			ret = sienna_cichlid_get_smu_metrics_data(smu,
 						METRICS_SS_DGPU_SHARE, (uint32_t *)data);
 			*size = 4;
@@ -1978,7 +1985,7 @@ static void sienna_cichlid_get_unique_id(struct smu_context *smu)
 
 	/* Only supported as of version 0.58.83.0 and only on Sienna Cichlid */
 	if (smu->smc_fw_version < 0x3A5300 ||
-	    smu->adev->ip_versions[MP1_HWIP][0] != IP_VERSION(11, 0, 7))
+	    amdgpu_ip_version(smu->adev, MP1_HWIP, 0) != IP_VERSION(11, 0, 7))
 		return;
 
 	if (sienna_cichlid_get_smu_metrics_data(smu, METRICS_UNIQUE_ID_UPPER32, &upper32))
@@ -2148,8 +2155,8 @@ static void sienna_cichlid_dump_od_table(struct smu_context *smu,
 							od_table->UclkFmax);
 
 	smu_cmn_get_smc_version(smu, NULL, &smu_version);
-	if (!((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
-	       (smu_version < 0x003a2900)))
+	if (!((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 7)) &&
+	      (smu_version < 0x003a2900)))
 		dev_dbg(smu->adev->dev, "OD: VddGfxOffset: %d\n", od_table->VddGfxOffset);
 }
 
@@ -2381,8 +2388,9 @@ static int sienna_cichlid_od_edit_dpm_table(struct smu_context *smu,
 		 * and onwards SMU firmwares.
 		 */
 		smu_cmn_get_smc_version(smu, NULL, &smu_version);
-		if ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
-		     (smu_version < 0x003a2900)) {
+		if ((amdgpu_ip_version(adev, MP1_HWIP, 0) ==
+		     IP_VERSION(11, 0, 7)) &&
+		    (smu_version < 0x003a2900)) {
 			dev_err(smu->adev->dev, "OD GFX Voltage offset functionality is supported "
 						"only by 58.41.0 and onwards SMU firmwares!\n");
 			return -EOPNOTSUPP;
@@ -3105,7 +3113,8 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
 	PPTable_t *pptable = table_context->driver_pptable;
 	int i;
 
-	if (smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 13)) {
+	if (amdgpu_ip_version(smu->adev, MP1_HWIP, 0) ==
+	    IP_VERSION(11, 0, 13)) {
 		beige_goby_dump_pptable(smu);
 		return;
 	}
@@ -3910,7 +3919,7 @@ static ssize_t sienna_cichlid_get_gpu_metrics(struct smu_context *smu,
 	uint16_t average_gfx_activity;
 	int ret = 0;
 
-	switch (smu->adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(smu->adev, MP1_HWIP, 0)) {
 	case IP_VERSION(11, 0, 7):
 		if (smu->smc_fw_version >= 0x3A4900)
 			use_metrics_v3 = true;
@@ -4026,8 +4035,10 @@ static ssize_t sienna_cichlid_get_gpu_metrics(struct smu_context *smu,
 	gpu_metrics->current_fan_speed = use_metrics_v3 ? metrics_v3->CurrFanSpeed :
 		use_metrics_v2 ? metrics_v2->CurrFanSpeed : metrics->CurrFanSpeed;
 
-	if (((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) && smu->smc_fw_version > 0x003A1E00) ||
-	      ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 11)) && smu->smc_fw_version > 0x00410400)) {
+	if (((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 7)) &&
+	     smu->smc_fw_version > 0x003A1E00) ||
+	    ((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 11)) &&
+	     smu->smc_fw_version > 0x00410400)) {
 		gpu_metrics->pcie_link_width = use_metrics_v3 ? metrics_v3->PcieWidth :
 			use_metrics_v2 ? metrics_v2->PcieWidth : metrics->PcieWidth;
 		gpu_metrics->pcie_link_speed = link_speed[use_metrics_v3 ? metrics_v3->PcieRate :
@@ -4253,7 +4264,7 @@ static int sienna_cichlid_get_default_config_table_settings(struct smu_context *
 	table->gfx_activity_average_tau = 10;
 	table->mem_activity_average_tau = 10;
 	table->socket_power_average_tau = 100;
-	if (adev->ip_versions[MP1_HWIP][0] != IP_VERSION(11, 0, 7))
+	if (amdgpu_ip_version(adev, MP1_HWIP, 0) != IP_VERSION(11, 0, 7))
 		table->apu_socket_power_average_tau = 100;
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index aa4a5498a12f..ece43b41141c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -101,8 +101,8 @@ int smu_v11_0_init_microcode(struct smu_context *smu)
 	struct amdgpu_firmware_info *ucode = NULL;
 
 	if (amdgpu_sriov_vf(adev) &&
-	    ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 9)) ||
-	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7))))
+	    ((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 9)) ||
+	     (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 7))))
 		return 0;
 
 	amdgpu_ucode_ip_version_decode(adev, MP1_HWIP, ucode_prefix, sizeof(ucode_prefix));
@@ -213,7 +213,7 @@ int smu_v11_0_check_fw_version(struct smu_context *smu)
 	if (smu->is_apu)
 		adev->pm.fw_version = smu_version;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(11, 0, 0):
 		smu->smc_driver_if_version = SMU11_DRIVER_IF_VERSION_NV10;
 		break;
@@ -246,7 +246,7 @@ int smu_v11_0_check_fw_version(struct smu_context *smu)
 		break;
 	default:
 		dev_err(smu->adev->dev, "smu unsupported IP version: 0x%x.\n",
-			adev->ip_versions[MP1_HWIP][0]);
+			amdgpu_ip_version(adev, MP1_HWIP, 0));
 		smu->smc_driver_if_version = SMU11_DRIVER_IF_VERSION_INV;
 		break;
 	}
@@ -474,9 +474,10 @@ int smu_v11_0_init_power(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
 	struct smu_power_context *smu_power = &smu->smu_power;
-	size_t size = adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 5, 0) ?
-			sizeof(struct smu_11_5_power_context) :
-			sizeof(struct smu_11_0_power_context);
+	size_t size = amdgpu_ip_version(adev, MP1_HWIP, 0) ==
+				      IP_VERSION(11, 5, 0) ?
+			      sizeof(struct smu_11_5_power_context) :
+			      sizeof(struct smu_11_0_power_context);
 
 	smu_power->power_context = kzalloc(size, GFP_KERNEL);
 	if (!smu_power->power_context)
@@ -731,10 +732,10 @@ int smu_v11_0_init_display_count(struct smu_context *smu, uint32_t count)
 	/* Navy_Flounder/Dimgrey_Cavefish do not support to change
 	 * display num currently
 	 */
-	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 11) ||
-	    adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 5, 0) ||
-	    adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 12) ||
-	    adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 13))
+	if (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 11) ||
+	    amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 5, 0) ||
+	    amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 12) ||
+	    amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 13))
 		return 0;
 
 	return smu_cmn_send_smc_msg_with_param(smu,
@@ -1103,7 +1104,7 @@ int smu_v11_0_gfx_off_control(struct smu_context *smu, bool enable)
 	int ret = 0;
 	struct amdgpu_device *adev = smu->adev;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 5):
 	case IP_VERSION(11, 0, 9):
@@ -1591,7 +1592,7 @@ int smu_v11_0_baco_set_state(struct smu_context *smu, enum smu_baco_state state)
 		return 0;
 
 	if (state == SMU_BACO_STATE_ENTER) {
-		switch (adev->ip_versions[MP1_HWIP][0]) {
+		switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 		case IP_VERSION(11, 0, 7):
 		case IP_VERSION(11, 0, 11):
 		case IP_VERSION(11, 0, 12):
@@ -1610,7 +1611,8 @@ int smu_v11_0_baco_set_state(struct smu_context *smu, enum smu_baco_state state)
 		default:
 			if (!ras || !adev->ras_enabled ||
 			    adev->gmc.xgmi.pending_reset) {
-				if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 2)) {
+				if (amdgpu_ip_version(adev, MP1_HWIP, 0) ==
+				    IP_VERSION(11, 0, 2)) {
 					data = RREG32_SOC15(THM, 0, mmTHM_BACO_CNTL_ARCT);
 					data |= 0x80000000;
 					WREG32_SOC15(THM, 0, mmTHM_BACO_CNTL_ARCT, data);
@@ -1894,7 +1896,7 @@ int smu_v11_0_set_performance_level(struct smu_context *smu,
 	 * Separate MCLK and SOCCLK soft min/max settings are not allowed
 	 * on Arcturus.
 	 */
-	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 2)) {
+	if (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 0, 2)) {
 		mclk_min = mclk_max = 0;
 		socclk_min = socclk_max = 0;
 	}
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
index c8119491c516..8908bbb3ff1f 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
@@ -1198,8 +1198,12 @@ static int renoir_get_smu_metrics_data(struct smu_context *smu,
 		*value = metrics->AverageUvdActivity / 100;
 		break;
 	case METRICS_CURR_SOCKETPOWER:
-		if (((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(12, 0, 1)) && (adev->pm.fw_version >= 0x40000f)) ||
-		((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(12, 0, 0)) && (adev->pm.fw_version >= 0x373200)))
+		if (((amdgpu_ip_version(adev, MP1_HWIP, 0) ==
+		      IP_VERSION(12, 0, 1)) &&
+		     (adev->pm.fw_version >= 0x40000f)) ||
+		    ((amdgpu_ip_version(adev, MP1_HWIP, 0) ==
+		      IP_VERSION(12, 0, 0)) &&
+		     (adev->pm.fw_version >= 0x373200)))
 			*value = metrics->CurrentSocketPower << 8;
 		else
 			*value = (metrics->CurrentSocketPower << 8) / 1000;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index fd1798fd716e..d86499ac8931 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -196,9 +196,9 @@ int smu_v13_0_init_pptable_microcode(struct smu_context *smu)
 	if (!adev->scpm_enabled)
 		return 0;
 
-	if ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 7)) ||
-	    (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 0)) ||
-	    (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 10)))
+	if ((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 7)) ||
+	    (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 0)) ||
+	    (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 10)))
 		return 0;
 
 	/* override pptable_id from driver parameter */
@@ -234,7 +234,7 @@ int smu_v13_0_check_fw_status(struct smu_context *smu)
 	struct amdgpu_device *adev = smu->adev;
 	uint32_t mp1_fw_flags;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(13, 0, 4):
 	case IP_VERSION(13, 0, 11):
 		mp1_fw_flags = RREG32_PCIE(MP1_Public |
@@ -269,7 +269,7 @@ int smu_v13_0_check_fw_version(struct smu_context *smu)
 	smu_minor = (smu_version >> 8) & 0xff;
 	smu_debug = (smu_version >> 0) & 0xff;
 	if (smu->is_apu ||
-	    adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 6))
+	    amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 6))
 		adev->pm.fw_version = smu_version;
 
 	/* only for dGPU w/ SMU13*/
@@ -802,7 +802,7 @@ int smu_v13_0_gfx_off_control(struct smu_context *smu, bool enable)
 	int ret = 0;
 	struct amdgpu_device *adev = smu->adev;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(13, 0, 0):
 	case IP_VERSION(13, 0, 1):
 	case IP_VERSION(13, 0, 3):
@@ -1779,7 +1779,7 @@ int smu_v13_0_set_performance_level(struct smu_context *smu,
 	 * Unset those settings for SMU 13.0.2. As soft limits settings
 	 * for those clock domains are not supported.
 	 */
-	if (smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 2)) {
+	if (amdgpu_ip_version(smu->adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 2)) {
 		mclk_min = mclk_max = 0;
 		socclk_min = socclk_max = 0;
 		vclk_min = vclk_max = 0;
@@ -1926,7 +1926,7 @@ static int smu_v13_0_get_dpm_level_count(struct smu_context *smu,
 
 	ret = smu_v13_0_get_dpm_freq_by_index(smu, clk_type, 0xff, value);
 	/* SMU v13.0.2 FW returns 0 based max level, increment by one for it */
-	if ((smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 2)) && (!ret && value))
+	if ((amdgpu_ip_version(smu->adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 2)) && (!ret && value))
 		++(*value);
 
 	return ret;
@@ -1986,7 +1986,7 @@ int smu_v13_0_set_single_dpm_table(struct smu_context *smu,
 		return ret;
 	}
 
-	if (smu->adev->ip_versions[MP1_HWIP][0] != IP_VERSION(13, 0, 2)) {
+	if (amdgpu_ip_version(smu->adev, MP1_HWIP, 0) != IP_VERSION(13, 0, 2)) {
 		ret = smu_v13_0_get_fine_grained_status(smu,
 							clk_type,
 							&single_dpm_table->is_fine_grained);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index 093962a37688..a3cbe15c3123 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -2754,7 +2754,7 @@ static int smu_v13_0_0_mode1_reset(struct smu_context *smu)
 	uint32_t param;
 	struct amdgpu_device *adev = smu->adev;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 	case IP_VERSION(13, 0, 0):
 		/* SMU 13_0_0 PMFW supports RAS fatal error reset from 78.77 */
 		smu_v13_0_0_set_mode1_reset_param(smu, 0x004e4d00, &param);
@@ -2787,7 +2787,7 @@ static int smu_v13_0_0_mode2_reset(struct smu_context *smu)
 	int ret;
 	struct amdgpu_device *adev = smu->adev;
 
-	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 10))
+	if (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 10))
 		ret = smu_cmn_send_smc_msg(smu, SMU_MSG_Mode2Reset, NULL);
 	else
 		return -EOPNOTSUPP;
@@ -2799,7 +2799,7 @@ static int smu_v13_0_0_enable_gfx_features(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
 
-	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 10))
+	if (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 10))
 		return smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_EnableAllSmuFeatures,
 										   FEATURE_PWR_GFX, NULL);
 	else
@@ -2863,7 +2863,7 @@ static int smu_v13_0_0_check_ecc_table_support(struct smu_context *smu)
 	if (ret)
 		return -EOPNOTSUPP;
 
-	if ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 10)) &&
+	if ((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 10)) &&
 		(smu_version >= SUPPORT_ECCTABLE_SMU_13_0_10_VERSION))
 		return ret;
 	else
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
index 626591f54bc4..bb98156b2fa1 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
@@ -1144,7 +1144,7 @@ void smu_v13_0_4_set_ppt_funcs(struct smu_context *smu)
 	smu->smc_driver_if_version = SMU13_0_4_DRIVER_IF_VERSION;
 	smu->is_apu = true;
 
-	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 4))
+	if (amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 4))
 		smu_v13_0_4_set_smu_mailbox_registers(smu);
 	else
 		smu_v13_0_set_smu_mailbox_registers(smu);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
index 2e74d749efdd..2d1736234b4a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
@@ -1024,24 +1024,24 @@ static uint32_t yellow_carp_get_umd_pstate_clk_default(struct smu_context *smu,
 	switch (clk_type) {
 	case SMU_GFXCLK:
 	case SMU_SCLK:
-		if ((adev->ip_versions[MP1_HWIP][0]) == IP_VERSION(13, 0, 8))
+		if ((amdgpu_ip_version(adev, MP1_HWIP, 0)) == IP_VERSION(13, 0, 8))
 			clk_limit = SMU_13_0_8_UMD_PSTATE_GFXCLK;
-		if ((adev->ip_versions[MP1_HWIP][0]) == IP_VERSION(13, 0, 1) ||
-			(adev->ip_versions[MP1_HWIP][0]) == IP_VERSION(13, 0, 3))
+		if ((amdgpu_ip_version(adev, MP1_HWIP, 0)) == IP_VERSION(13, 0, 1) ||
+			(amdgpu_ip_version(adev, MP1_HWIP, 0)) == IP_VERSION(13, 0, 3))
 			clk_limit = SMU_13_0_1_UMD_PSTATE_GFXCLK;
 		break;
 	case SMU_SOCCLK:
-		if ((adev->ip_versions[MP1_HWIP][0]) == IP_VERSION(13, 0, 8))
+		if ((amdgpu_ip_version(adev, MP1_HWIP, 0)) == IP_VERSION(13, 0, 8))
 			clk_limit = SMU_13_0_8_UMD_PSTATE_SOCCLK;
-		if ((adev->ip_versions[MP1_HWIP][0]) == IP_VERSION(13, 0, 1) ||
-			(adev->ip_versions[MP1_HWIP][0]) == IP_VERSION(13, 0, 3))
+		if ((amdgpu_ip_version(adev, MP1_HWIP, 0)) == IP_VERSION(13, 0, 1) ||
+			(amdgpu_ip_version(adev, MP1_HWIP, 0)) == IP_VERSION(13, 0, 3))
 			clk_limit = SMU_13_0_1_UMD_PSTATE_SOCCLK;
 		break;
 	case SMU_FCLK:
-		if ((adev->ip_versions[MP1_HWIP][0]) == IP_VERSION(13, 0, 8))
+		if ((amdgpu_ip_version(adev, MP1_HWIP, 0)) == IP_VERSION(13, 0, 8))
 			clk_limit = SMU_13_0_8_UMD_PSTATE_FCLK;
-		if ((adev->ip_versions[MP1_HWIP][0]) == IP_VERSION(13, 0, 1) ||
-			(adev->ip_versions[MP1_HWIP][0]) == IP_VERSION(13, 0, 3))
+		if ((amdgpu_ip_version(adev, MP1_HWIP, 0)) == IP_VERSION(13, 0, 1) ||
+			(amdgpu_ip_version(adev, MP1_HWIP, 0)) == IP_VERSION(13, 0, 3))
 			clk_limit = SMU_13_0_1_UMD_PSTATE_FCLK;
 		break;
 	default:
-- 
2.25.1

