Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3DC3EDEEB
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Aug 2021 23:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94D789E15;
	Mon, 16 Aug 2021 21:02:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F0889E15
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Aug 2021 21:02:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8PJVDlsYXrIKu3Mw8tuOCF6Xr8CEm1K7Wc454x7H8swDIuQAcZV91MAnFBRESM+U+baBEH9gJ+BPH+SJQRqpJLHHayrswh62S9tQaWjHGcaP3lSw2oOl1A6OpU51nXkDLwqLun7/2l31T1cEsXLupKgRpgofha3XqZi7YJnniX1jVAnsmi26TUo/Q8Q/GbL/ZMUXUQlnFYubR+vW4T0LHSQ2VFsizycCtiXef7VjEcDU2BfQMAEQzYKkcKXVNvTtkQ8zuh4nEzvCg1VJ08Z/Egw8CmQU1qQzt/gskbTONi1Lg7Bcloph8PCwAg6k0f9gZKjKLTVK4pFFdYgRDJctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2MDQ5h4ON1GdFkYvS990WFuGDyhFq4bEhF9ug2roKQ=;
 b=i2wo7Scg854MhWX4gSqY8w8EhksHnYQokkEoABF2FoZQThvcPasQaZ32y/5SNjhiPJ/ClUCzejUzSf+h+UvpzWos2hyNvid0ZVsdl1+5IHeNZaNpz7WyNBDxOFGbFJ7fi8zIx0pVQPrce+MR8yGADpZL6oHMPgmocud9VhdBrXpRaph97H9D+JyjzEWms0w3iZFo34ACDEDVgYRt9Hty65ftUACE4wxrNoYF9TBK3Q5qK14lWXxqLoXPjCFHeNITz2ohko6QVfHgIbzfopCxvHe2KEbsdr4qvsncpNXXKyq/I2zBcfHQ2DbJTa3bgdMCilHL/S7JNPaQBdQ2t6Pldg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2MDQ5h4ON1GdFkYvS990WFuGDyhFq4bEhF9ug2roKQ=;
 b=iYVfT8kRf6w6V6eP7dQ7Ju7+KxIInYKRboKPSf1X+JBh4DJUCKH9yFceujze0m3M3F4/UzlFZXKxQec3Pv5KBURCxOc/K4rc3tOgvfni5ZJpY0EiW8i943hSVZ4nKTo8Kc1+me/Y8DQ/8l4NlSPNroR5rjhCRFEA/T4nVlWfuXI=
Received: from BN9PR03CA0314.namprd03.prod.outlook.com (2603:10b6:408:112::19)
 by BL0PR12MB5505.namprd12.prod.outlook.com (2603:10b6:208:1ce::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 21:02:49 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::44) by BN9PR03CA0314.outlook.office365.com
 (2603:10b6:408:112::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 21:02:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 21:02:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 16 Aug
 2021 16:02:48 -0500
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Mon, 16 Aug 2021 16:02:46 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <nicholas.kazlauskas@amd.com>,
 <harry.wentland@amd.com>
CC: <wayne.lin@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: [PATCH 0/6] Add DP 2.0 SST Support
Date: Mon, 16 Aug 2021 16:59:13 -0400
Message-ID: <20210816205919.614691-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81085728-6682-4a58-aa47-08d960f9343a
X-MS-TrafficTypeDiagnostic: BL0PR12MB5505:
X-Microsoft-Antispam-PRVS: <BL0PR12MB5505BB5E7EFFF34AFDF7F63EE5FD9@BL0PR12MB5505.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VJE1OAHDIjGUoe+DLkolQNiAGRZHMqUITiFf0OJs++/ABQo56JJhaKBmhQFsRd0qLpPIQrx5tFNWPrfrTtD4sGxs5LD2nEzfBNmvzL4QKYRFDbsLBLx3VDwiwyeKhtMmtxCbQfyOMuOEjb3vxkLlh2V+JL9iW4itSJ/fjPwEaxxt0gTRjTR8jQ0WijyC6VoALGvGhMrLTRD8M/JKnhA/v5aW63BOha4tXW/n00W5v/eeLL4/uVtqLH5srYFLmoSljRC7CByaFGFcenQpneb7Lo+xCbAwNsvmnAQ5tkKUxOlkIg6wqHcslgs7W9AxOahbwrlBbxHeQgXp9GJOEUd0x+QZ1MYaW5Gzi5qgVZUp1bRyYfNLjjomB+eiZQL4bbMEvci27p8p9p7cFvZrlAwneNbVGx7yd9DXFdy0naI24sB+f0f+3vZBC3IFVA5NS8si/8/prBCocJvtFtIo/X3M/QLvGMh+HElonSFHLUV6RsDsQrEXi4dIK7ZVAnWDcnDB33ebKswkSj6wjSkEW4GmIh/XI4StwKVrfruZjY0HCYU4tZ+ZZftXWdhfT2Ld04YNiKcEbiYiXVPson6+H8WYPzPj5IqUJleIWXj+aa60Mq0HVWJO+ODCIcm/LPef760VqGEtZ1wYyhjTRpPnqDr57PjkRss8t3o/+l1y89aY5Uzjrqd4TnpkYSpg+CgtISqVAXU2HKtMdDSGndt7+xcl9tJXs+DKl0mY0SeK6S3KFz7CuMyMmjA4KIHl5dPYg2l87hjP1nwbenrbq+TpOhQCcw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(46966006)(36840700001)(70586007)(70206006)(6666004)(7696005)(110136005)(86362001)(316002)(426003)(54906003)(336012)(4326008)(83380400001)(186003)(2616005)(478600001)(8936002)(36756003)(26005)(6636002)(1076003)(5660300002)(82310400003)(82740400003)(34020700004)(356005)(81166007)(36860700001)(8676002)(2906002)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 21:02:48.8589 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81085728-6682-4a58-aa47-08d960f9343a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5505
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

The patch series adds SST UHBR10 support

Fangzhi Zuo (6):
  drm/amd/display: Add DP 2.0 Audio Package Generator
  drm/amd/display: Add DP 2.0 HPO Stream Encoder
  drm/amd/display: Add DP 2.0 HPO Link Encoder
  drm/amd/display: Add DP 2.0 DCCG
  drm/amd/display: Add DP 2.0 BIOS and DMUB Support
  drm/amd/display: Add DP 2.0 SST DC Support

 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |    6 +
 .../drm/amd/display/dc/bios/bios_parser2.c    |    8 +
 .../drm/amd/display/dc/bios/command_table2.c  |    6 +
 drivers/gpu/drm/amd/display/dc/core/dc.c      |   17 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |  503 +++++++-
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  | 1071 +++++++++++++++--
 .../drm/amd/display/dc/core/dc_link_hwss.c    |  291 ++++-
 .../gpu/drm/amd/display/dc/core/dc_resource.c |  104 ++
 drivers/gpu/drm/amd/display/dc/dc.h           |   17 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h  |  199 ++-
 drivers/gpu/drm/amd/display/dc/dc_link.h      |    3 +
 drivers/gpu/drm/amd/display/dc/dc_types.h     |   15 +
 .../display/dc/dce110/dce110_hw_sequencer.c   |   86 +-
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |   65 +
 .../amd/display/dc/dcn10/dcn10_link_encoder.c |    9 +
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |   26 +-
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |    4 +
 .../display/dc/dcn30/dcn30_dio_link_encoder.c |    4 +
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile |    3 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_apg.c  |  173 +++
 .../gpu/drm/amd/display/dc/dcn31/dcn31_apg.h  |  115 ++
 .../gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c |  162 +++
 .../gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h |   18 +
 .../display/dc/dcn31/dcn31_dio_link_encoder.c |    4 +
 .../dc/dcn31/dcn31_hpo_dp_link_encoder.c      |  620 ++++++++++
 .../dc/dcn31/dcn31_hpo_dp_link_encoder.h      |  222 ++++
 .../dc/dcn31/dcn31_hpo_dp_stream_encoder.c    |  761 ++++++++++++
 .../dc/dcn31/dcn31_hpo_dp_stream_encoder.h    |  241 ++++
 .../drm/amd/display/dc/dcn31/dcn31_resource.c |  181 +++
 drivers/gpu/drm/amd/display/dc/dm_cp_psp.h    |    1 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |    2 +
 .../gpu/drm/amd/display/dc/inc/core_types.h   |    6 +
 .../gpu/drm/amd/display/dc/inc/dc_link_dp.h   |   22 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h  |   21 +
 .../gpu/drm/amd/display/dc/inc/hw/hw_shared.h |    2 +
 .../drm/amd/display/dc/inc/hw/link_encoder.h  |   89 ++
 .../amd/display/dc/inc/hw/stream_encoder.h    |   79 ++
 .../amd/display/dc/inc/hw/timing_generator.h  |    1 +
 .../amd/display/dc/inc/hw_sequencer_private.h |    1 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h |   12 +
 .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h   |    2 +-
 .../amd/display/include/bios_parser_types.h   |    6 +
 .../gpu/drm/amd/display/include/dpcd_defs.h   |   14 +-
 .../amd/display/include/grph_object_defs.h    |   10 +
 .../drm/amd/display/include/grph_object_id.h  |    6 +
 .../amd/display/include/link_service_types.h  |   31 +-
 .../drm/amd/display/include/logger_types.h    |    2 +
 drivers/gpu/drm/amd/include/atomfirmware.h    |    4 +
 48 files changed, 5018 insertions(+), 227 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_link_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h

-- 
2.25.1

