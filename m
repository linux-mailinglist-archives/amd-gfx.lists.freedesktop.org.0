Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE333DAD71
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Jul 2021 22:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6236EE4E;
	Thu, 29 Jul 2021 20:21:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D846EE4E
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Jul 2021 20:21:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiZ8hzF04aqmJICKurOvFzc9C/R8x3/fgTwhEZZUlVKrDtEaqn9IAeB1Ivjf2IpcyrQqGGuD1y5DQGk4apgx4r3KhgWqWO/X2iVtkZllC+4MnUTIMsxjyn0V57sxnYhV5NdzSrlIJuzSRk1X5+icgkB1An6NzwTxIQOKByrVGsuJG336yGGAx2R+DQ/ALBWCIQHYF1Puqr0uAjGCnB4v44o0h7+gazTYTsKJAjA7IFrpegWDE8FJuI2ToVybC3ZxQNiQvZgKu83RnfKC1veecdo1Xl5Fdt4Y5z2JgOS+e4PN6RP/SVuO9MuaOfZ84YPCziJ1wPZOc/3S588TxJnWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NV5/wWO9xRtxS5CNkV1IoxJNuCchcchBzSqJSjR+83E=;
 b=csBmX65z6dbE5GyguEh59y6aSv3R7jOY40AMj1M5ARH8NuTDa75JRKStR3Nrx/sB/gTV37HVVlTOG/43yIuCqf2EjTpVoaYN1I/NNFagD/enT5Pk13WBX/2S4sqnWNU7wlgjIClrBTlXfDMAt1Ws8zFriWuG00YZ7EiRZK83iLxsM2NI5db/8PiVNvul6J7UJf8OrqE+csX6S2DOThBpEhZS6UCBmutXoqmWH3sOwAnYr66XNCy4UOIw8xdWubJN02ZeerSydvwik8SKsZ5iXeFS9YrLi4OVTsZevdUe0V/xGcWtTxBk4EhfF0BaPQqike2diZxOktoO1EuV7kcbNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NV5/wWO9xRtxS5CNkV1IoxJNuCchcchBzSqJSjR+83E=;
 b=1rgkzrGEgdAgNj2eXXcK3SqCvWBYe405EDXuxgtReqlxKNR+AK/H9jcSrRJ/BCYr/4xEXfOZH6+624VJZddEvKRhH5X8QEadUzOQ6HkEwdSMvoeX3dC4V3aUJ0Gja4pDQ5WtFUmS29AuziAaCy5MC8HCMVIJaNGr8YS4/V+pKcM=
Received: from DM5PR1401CA0022.namprd14.prod.outlook.com (2603:10b6:4:4a::32)
 by BYAPR12MB2853.namprd12.prod.outlook.com (2603:10b6:a03:13a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Thu, 29 Jul
 2021 20:21:53 +0000
Received: from DM6NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4a:cafe::ac) by DM5PR1401CA0022.outlook.office365.com
 (2603:10b6:4:4a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Thu, 29 Jul 2021 20:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT008.mail.protection.outlook.com (10.13.172.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Thu, 29 Jul 2021 20:21:53 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 29 Jul
 2021 15:21:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 29 Jul
 2021 13:21:52 -0700
Received: from elite-desk-aura.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Thu, 29 Jul 2021 15:21:52 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/9] DC Patches Aug 2, 2021
Date: Thu, 29 Jul 2021 16:21:42 -0400
Message-ID: <20210729202151.1556188-1-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a588baf-66c5-42a6-9936-08d952ce816f
X-MS-TrafficTypeDiagnostic: BYAPR12MB2853:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2853FA3694DE48BB9C4527E18BEB9@BYAPR12MB2853.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OeFmGvnqOExHWgoHsFPNybM3+O6B3K1xFbHsUQeCYCILkaO2V3i/fdmXuryitQxNqmhlXss1KlAKOadHAvTtJ5Lvyd939v7SQ2KMmG+vT8GatpkO2hXo/gALZ1pjzFK5xOXwfUp9r6AalDsIbSwUUU7TgXgiEmVTUJ2V5OdfNyp32px9nQBCFi07MLkuO8f3MQSmeqLRQoQUM2w538ExWQe7d3CK4KcOCc5CS4GVKeLscAzrr1/iK4wzugwj7zpT/iDsJ3hrIBTycTw/zrVrGlPrLPTTlxNF0HrrinVJAGJlWD8Q0JfRckCpbQyTQ5vCDLDcEqvLmvujvn0lTlNLyixov0quYObCtoN1E33fw84dEDgEkO6aMWNJKGlTaBsW3VSy/4IcQ3MLYsAmP7poLB+Er5RgI7MxCI81cq7ZOkvIBldy/R5N84GcQ/JI0gZ1JoJ0fj3reKKeGi7oZkKEHSL6216RuLF9g6wGRyDh5B8WGju8G8/r4YO0V9yTSYsLrZl4NatAB4dFnSj5Jo8XnvTSUCLq5MNfQp9oEeyVM9+GKAcKNEn786PhrcL2QbeSdvOwsHIH3mQUjVe092zYkPsk7byW9XLLoyANecr9Zmo2Lxsvayuljl/S8L8Kj0FcfFCI2j7YhHN+9vFYGP2+2FM043/hyaY99lWD0C24J/rQVCsEeZC11hd+maJIPBv+IQh2wlzaibHpYPEYQgsVvNkCOSuEycAX6G0tohaspgA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(36840700001)(46966006)(47076005)(186003)(5660300002)(82310400003)(356005)(81166007)(54906003)(336012)(36860700001)(83380400001)(426003)(70586007)(1076003)(4326008)(316002)(8676002)(7696005)(36756003)(6666004)(44832011)(86362001)(478600001)(8936002)(70206006)(82740400003)(2616005)(26005)(6916009)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 20:21:53.6961 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a588baf-66c5-42a6-9936-08d952ce816f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2853
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
Cc: Eryk.Brol@amd.com, Sunpeng.Li@amd.com, Harry.Wentland@amd.com,
 Qingqing.Zhuo@amd.com, Rodrigo.Siqueira@amd.com, Anson.Jacob@amd.com,
 Aurabindo.Pillai@amd.com, Bhawanpreet.Lakha@amd.com, bindu.r@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Its a small set of changes this week for DC. In summary, we have:

* DC version 3.2.147
* LTTPR, MPO Improvements
* General stability and bug fixes

--

Anthony Koo (1):
  drm/amd/display: [FW Promotion] Release 0.0.77

Aric Cyr (1):
  drm/amd/display: 3.2.147

Guo, Bing (2):
  drm/amd/display: Fix Dynamic bpp issue with 8K30 with Navi 1X
  drm/amd/display: Increase stutter watermark for dcn303

Jaehyun Chung (1):
  drm/amd/display: Add check for validating unsupported ODM plus MPO
    case

Jude Shih (1):
  drm/amd/display: Fix resetting DCN3.1 HW when resuming from S4

Qingqing Zhuo (1):
  drm/amd/display: workaround for hard hang on HPD on native DP

Roman Li (1):
  drm/amd/display: Remove redundant vblank workqueues in DM

Wesley Chalmers (1):
  drm/amd/display: Assume LTTPR interop for DCN31+

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++-----
 .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c |  4 +++-
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  | 21 ++-----------------
 .../gpu/drm/amd/display/dc/core/dc_resource.c |  5 +++++
 drivers/gpu/drm/amd/display/dc/dc.h           |  4 +++-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_optc.c |  2 +-
 .../drm/amd/display/dc/dcn30/dcn30_resource.c | 20 ++++++++++++++++++
 .../amd/display/dc/dcn303/dcn303_resource.c   |  4 ++--
 .../drm/amd/display/dc/dcn31/dcn31_resource.c | 16 ++++++++++++++
 .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h   |  4 ++--
 .../gpu/drm/amd/display/dmub/src/dmub_dcn31.c |  8 ++++---
 11 files changed, 61 insertions(+), 35 deletions(-)

-- 
2.32.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
