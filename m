Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2E28909ED
	for <lists+amd-gfx@lfdr.de>; Thu, 28 Mar 2024 20:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6978211252F;
	Thu, 28 Mar 2024 19:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZCUV5qDk";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751FE112537
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 Mar 2024 19:52:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTKMiQlp22MmTGu7cDSz2vhwCzzZ/erhsSljlrvMFB3CkD5CZ+2uzz1o5E12x0RDPxSFgZycls6trX/n842vBI3UGnSyMquKVacYqG15c2rGNiDNAETRY0y1WTCjSSBQ2G1Ulga4YslADQ2kxVpWOCuTubr+TqfgbNbspXzOyQwQ74BbtiT0/6UhEBhuDID1FBbHKjlq+GWWt7sPO8O5fwpQPnAnGksY7nI9Q0hFzUHaRsxZNz2VchbEG6YEC3WM++Bily/q1SMif1MYaZsetGygcT3S6s78Xz0o1HwkEbhTmO5TDMe+fXOC+gF1IvUjc71qLEJPN3Ai8hCjiDeTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orctJ9hgCfGWIDznuChMH8FXiXeJPyodu6r6lFljqP4=;
 b=ZVX6+uhsuT4/9GjjsNzufhEnftDAYEFO+5d2C07OmD9nYw0rJQ+q1Ho2JWMzBOGZe/QZRIVVIdvTnrAm4SF1zhNDmE/V6QU973ukPxT1P8pitxQ9al02OTk+w+Ke94R40TRxwF5eNrrRwF9RHY/s/cpPKx23gDsN30IsY0mzdm7PQ8nMMjLTcsU/UlBQWxXZKXkasc49tmY0A0DmjUsM4b3yH0LNxyQS0k4jOrJBdXf7M7mzVIKpFnksehptGnQHUq3EFYDksPaRckcvI9gzdF+h6nwrKG5nPjC3dKalNpYADWw3EDaUt551QhfcUy2Yb2nCwSmE7tP2Musa/a6Dow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orctJ9hgCfGWIDznuChMH8FXiXeJPyodu6r6lFljqP4=;
 b=ZCUV5qDk45KmBRew03l5lZUYpOW4ccJxUyOgVSJhN7DONePELbjbDYXKeWL/QCDk0CfR9zQg2+BLAwqDguNGv2IgNaIg0UVMtK3XgPA2+K80k9jFhk1y6qrmJ2W+uI7ubPicGv9QoBC8UygEjBav+8ZwNEyMpvgfI9/52CyJVL8=
Received: from CH5PR02CA0009.namprd02.prod.outlook.com (2603:10b6:610:1ed::10)
 by PH7PR12MB5784.namprd12.prod.outlook.com (2603:10b6:510:1d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Thu, 28 Mar
 2024 19:52:05 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::ee) by CH5PR02CA0009.outlook.office365.com
 (2603:10b6:610:1ed::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.38 via Frontend
 Transport; Thu, 28 Mar 2024 19:52:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 28 Mar 2024 19:52:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Mar
 2024 14:52:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Mar
 2024 14:52:03 -0500
Received: from roman-vdev.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 28 Mar 2024 14:52:02 -0500
From: <Roman.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Daniel Wheeler <daniel.wheeler@amd.com>, <Harry.Wentland@amd.com>,
 <Sunpeng.Li@amd.com>, <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, 
 <roman.li@amd.com>, <wayne.lin@amd.com>, <solomon.chiu@amd.com>,
 <agustin.gutierrez@amd.com>, <hamza.mahfooz@amd.com>
Subject: [PATCH 28/43] drm/amd/display: Initialize DP ref clk with the correct
 clock
Date: Thu, 28 Mar 2024 15:50:32 -0400
Message-ID: <20240328195047.2843715-29-Roman.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328195047.2843715-1-Roman.Li@amd.com>
References: <20240328195047.2843715-1-Roman.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|PH7PR12MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f076ba-d1c2-46dc-687d-08dc4f608b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BPWkza2O2jQBKL6+OBPM4WXu4bhQgWdpGbpIisKvxYuPdr7e3I9UpNHMn8x1Ny7WxcOMGvFdN4+ziUP7xpZvDmaM41Pd2MQe0lantT53QjEKk3QyKrZEYAGcMQuX+QVlkgM9UhIaJtTRuX0x6gVnSgI9J9M0X27iLSexoq1Xs9Hq5h78YGVPK6Vq0+1MY1zboO097136VVVt3OsvPlXryx1KF7Dasj+NgmF2oQVeAQN81zasXEstDsjAYZDSkR4yhW99/G/11+NFaiKO2kEBRs4VTJoaChHI2zphGsetx/lFYp98+SmFSO3Q5HAPaR7TRPhIx85vo7m5EKaoyN9NDXQd8pwVlsElnvfailyxdSyFu5kjuLX2IfkZaRYOqkbTSRNoUYWdXH/l3z3xAYSIQ4OrRuOOM7Tv8JQeOjNIT38KqkjFEu1Co2Ff6UaUkwFaOkWIOOyllCyA4HBtecRW3eUn5jpKevL9M3rKLATX8bw3OR2Blpv0jlrJXJmcbtMZtGNkH9nidoP0qt9DHO4qLWBvk3RZyRi95cl66BlEt3bK+u3C8ImIM9VS3JFrn+l/STkRg2m/64RdMpKIXa+dhXkkL4fwPd0sKJRu4jHBIL9yGhCQHVWQhXy4kqqqLGqR8qvmgicAyLOrs4439YEM0elVHlSlKMjec4C7S6JG9laRMDkJDqeL5TvpBtg6852XBiWkq34R89lSb2i1saqc0MamykN177k3ioHLB2lhwTIH1V7KqeBoWIczOGSL1+Xz
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 19:52:05.1305 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f076ba-d1c2-46dc-687d-08dc4f608b5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5784
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

From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
index b77804cfde0f..2a5dd3a296b2 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
@@ -131,8 +131,8 @@ int dce_get_dp_ref_freq_khz(struct clk_mgr *clk_mgr_base)
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
 	int dprefclk_wdivider;
 	int dprefclk_src_sel;
-	int dp_ref_clk_khz;
-	int target_div = 600000;
+	int dp_ref_clk_khz = 600000;
+	int target_div;
 
 	/* ASSERT DP Reference Clock source is from DFS*/
 	REG_GET(DPREFCLK_CNTL, DPREFCLK_SRC_SEL, &dprefclk_src_sel);
-- 
2.34.1

