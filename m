Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130375EE5EB
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Sep 2022 21:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40E010E9C8;
	Wed, 28 Sep 2022 19:41:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A0910E9B1
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Sep 2022 19:41:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P27OYOI0S7IMJwH43vEQeArGrFXGYoJWfAjA42NtrYxARM6UmSX0Ex04bm9QRLwaG5G0NlVBTj3cU763LmU6S5vNbVCVsc2prAGR2Ww1QbzphhPaDiuqSyhB3iYi5NDsPWCsK2cANa3GaLKfSscyQ7+uBBs9irWiSghNeyTKOwHEwlgfW5RX7VJtqHd9L87wyGbKJpRIq9DDIrHVQtvQyc+XAjAsSxIbM34kXCxbaN+Flzdfdez+qUScVorSN+9h2iGXTBlPHlmALDWrKmtO2SsFngwGYykhwABbTNDVVbLrzuyuhuWpu5nH+cHC2XxoGudn6qkjmhRqUbQVj19pwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9foskys4jxF6rU4thUFOwFW4h+AT6ODtpjc+WgWZgwk=;
 b=b8io0juuicpLJkIVRx1q6aVEBScnRqM8x7a2fmIpbyicBMl3rCiS8fBPsDDLotaXDC6L88iBsswvJbAD8BCvYuZ9oD8gg6bevAew5bcQOToZNDaJNYPm41vLPdId4i8T+Xjwv6SlHfFVo20yI8E4+5sjHjOp5mjherucS9xrQPjIJjMxxY4B+lrDTjhgsAJF17XjNZWAKHM+R3/5UZkSLcfXwLHqg0629gUr/GMtIQqFYv3b7wprUH32JIGSpuS2AwMGbQR9CnBWF9hl5fvxnIqpWEowryp28coiNW0Gg4HBn2lhPzISQ3IXzFQgXQW7EiiF4LjtHCe9OjoDIieYrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9foskys4jxF6rU4thUFOwFW4h+AT6ODtpjc+WgWZgwk=;
 b=43srubbvM7SS6mslSQA0qexL1jCaL9I/p98S4uY7+vzQm3z86LERwW8fGlTj1vPa+txUsLzXt+QBVTnD8+Y4a8FiVX2e/MWAn8HcWQGC/k9bA8rGknlDGrXorS37LrdYF4kw/d8+J5xAb03jo1a6eUwcNuaAqPgY1Zfigwny748=
Received: from BN9PR03CA0326.namprd03.prod.outlook.com (2603:10b6:408:112::31)
 by BY5PR12MB4949.namprd12.prod.outlook.com (2603:10b6:a03:1df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 19:41:40 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::d6) by BN9PR03CA0326.outlook.office365.com
 (2603:10b6:408:112::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Wed, 28 Sep 2022 19:41:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Wed, 28 Sep 2022 19:41:39 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 28 Sep
 2022 14:41:37 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 30/36] drm/amd/display: Add missing mask sh for
 SYM32_TP_SQ_PULSE register
Date: Wed, 28 Sep 2022 15:40:22 -0400
Message-ID: <20220928194028.144879-31-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220928194028.144879-1-hamza.mahfooz@amd.com>
References: <20220928194028.144879-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT015:EE_|BY5PR12MB4949:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af0b4dd-899d-4191-51f1-08daa1897676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YdIpTt2SLFib65yXpAYQs3PJ5h5a1zeiK9s7unzbO6vDuBHGqsZRY116x5KddSf4AAet+b0MPOr4H112oeo7/gN0eOk0jhIlFxo2Ynrj50TFUwn2Prn+eBs3PdjMTvv5Esdk/GEtzO6w+muH+oeiWUN7lqVuwIN3fV9q/Do6JBh95eBc5dnCrJsqUfH8ow2NbBzZcqS2AcKSSgRxYxA+sceCxgtwfKWBu6rRH4FMcrrdqmfMnirTSdJs3Z0Yqa2+W2KRjequpgInyoIE8R68YVoTSt3wJReztJGd2CMxKAkf2lTFrnC4RRXVEH0RamihjU3Kl6C0stfPY6dSWyBJHCJWbIKZyiwruuojH8P7S9pX+dVCMgTgqEOsVvjg4CEqWOwHt7bPFMXDwSZGWqA5829j89S/eXma3sNrVJ7zZR0Lw2fWbGoZCIeALAGwOO8sG0dNLPyZJJVs31G9qrihw1rJjkyaW1ZEczVKGWgJDmJtJtHNUaPghbNRRPQa+4AxPR62JvXV7NRKes8XZYEIjRo/EFIiY3GEFt7j+viwBrY5SxkA/8ttz4oxA7wgFvB395nzlD2iGfkhxPEnQ+1SW86z+NhFOV2IzkbL9ZK73MFWlrtBaCixZETUv7GfiEFYHS4FM+QN5F5I2fYzEkB2pnLXZwPKJDQI2r3GGNuLE/AzqFLkM1qcmVUH2YMYPM7llxGEu3/6Z6cR2bLEF0kHQEhbxaZs+qiDLjmKfSQNpivJiKD5SoxLzdHQcze8eBOMkO3EPr6qdVk/mOEgv3t49Fz7miOnQ3mrtcvRXrCXJllXPEUoLE+R4OsrhC4FjFZA8MpSZfqLQl/rjhbnzazA2w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199015)(46966006)(40470700004)(36840700001)(6666004)(6916009)(36756003)(2616005)(36860700001)(316002)(478600001)(54906003)(40480700001)(7696005)(1076003)(186003)(86362001)(2906002)(44832011)(5660300002)(8936002)(8676002)(82740400003)(70206006)(70586007)(426003)(47076005)(82310400005)(41300700001)(4326008)(26005)(336012)(40460700003)(81166007)(16526019)(356005)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 19:41:39.5622 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af0b4dd-899d-4191-51f1-08daa1897676
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4949
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
Cc: stylon.wang@amd.com, Sunpeng.Li@amd.com, Harry.Wentland@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 Wenjing Liu <wenjing.liu@amd.com>, solomon.chiu@amd.com,
 Aurabindo.Pillai@amd.com, wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Wenjing Liu <wenjing.liu@amd.com>

There is a missing register mask in dcn32 causing the hardware
programming is not executed when programming SQ_num test pattern for
DP2.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.h
index 9db1323e1933..176b1537d2a1 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.h
@@ -47,6 +47,7 @@
 	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_TP_CONFIG, TP_PRBS_SEL1, mask_sh),\
 	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_TP_CONFIG, TP_PRBS_SEL2, mask_sh),\
 	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_TP_CONFIG, TP_PRBS_SEL3, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_TP_SQ_PULSE, TP_SQ_PULSE_WIDTH, mask_sh),\
 	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_SAT_VC0, SAT_STREAM_SOURCE, mask_sh),\
 	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_SAT_VC0, SAT_SLOT_COUNT, mask_sh),\
 	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_VC_RATE_CNTL0, STREAM_VC_RATE_X, mask_sh),\
-- 
2.37.2

