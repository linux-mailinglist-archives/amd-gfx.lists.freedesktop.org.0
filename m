Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4699910BE7
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2024 18:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A3610EB16;
	Thu, 20 Jun 2024 16:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oZdAGjRl";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B6910EB16
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2024 16:19:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdgRqKQQ95FRpx/dvP+7wI3TWA+Gn4OPBF+X50+UyxctyUof0HsbicPg0OosRxAfx/Uv1R8sssiavgQWDmzuEAK/nqYo8O/m4fL73CAucAB1d7vpGGU45l4IzUR2CD3Dn3qwUPur7fmnuPpichwBlGvBf4P+ymKhF7s7GNoYiTldCUHWnkB168klmxnMaDhUYqsKrSDi8sDl+WDlWeecD+oWJwgHlGb3N6So1VmzHFPSSqtOgiC7X/oD2R1m0wBDaDpUjKqDJtKJk6Ka3e8K7aBgjbOdmZCn/ait2wBpE3czuFubaGHJU3TEIPUj6QwOqc1Vj0sEPgqEaSkPsqzKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwGWGWQvf2ALOHAreucA3jauWAh3vY6NAoI1/DMeih4=;
 b=iml4a/Xm921WxEzIlh7ddVqWVLkOCSLRNRWhXtDmAbOkXbNbd9qql00zAcgom5WfiN4/24XTFfyMnYswkuyIQXGybsI2I6liW+XYTApZ5qeEgRRHhVVwnH5T0uW5619SJNDK45+DGuC7la5RtmnfILhUlYz0RMIhuZE1qz73va8WAFiAEblmukLjjDExI9ZLjnsrwe4KSIU0GvV6nre9mtz1p1haAEMZxcZi6GmYK/YMv8nnaLT6t1Ho1bwfoOv/wIFB8ideVNgrXLGaPZkadrq8urEyAff7gkGZMbJDf181XZ3RB4Vl8zVxEqu1EmG3ElSjmoMwEEa4QE7rluUclA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwGWGWQvf2ALOHAreucA3jauWAh3vY6NAoI1/DMeih4=;
 b=oZdAGjRlqy2+fidwNTDj8TWcGtuyaL3EB0ANv9XV6xAyYuxUnNvk0AEESjTjNrexy8ITua8BzFNeZoivuvc7apIpAR1l3t/BzsGCTj+CnY9SF4xVOKRBCFYkQenqwd8n+tjub3SFtt/tTdfX7GxL7jW/BJxY18ByZRwo3jifiTI=
Received: from CH0PR07CA0028.namprd07.prod.outlook.com (2603:10b6:610:32::33)
 by DM6PR12MB4188.namprd12.prod.outlook.com (2603:10b6:5:215::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 16:19:24 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::db) by CH0PR07CA0028.outlook.office365.com
 (2603:10b6:610:32::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.34 via Frontend
 Transport; Thu, 20 Jun 2024 16:19:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 20 Jun 2024 16:19:23 +0000
Received: from 10.254.92.128.in-addr.arpa (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 11:19:21 -0500
From: Alex Hung <alex.hung@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, <roman.li@amd.com>,
 <wayne.lin@amd.com>, <agustin.gutierrez@amd.com>, <chiahsuan.chung@amd.com>,
 <jerry.zuo@amd.com>, Ryan Seto <ryanseto@amd.com>, Wenjing Liu
 <wenjing.liu@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, <stable@vger.kernel.org>, Alex Hung
 <alex.hung@amd.com>
Subject: [PATCH 30/39] drm/amd/display: Adjust reg field for DSC wait for
 disconnect
Date: Thu, 20 Jun 2024 10:11:36 -0600
Message-ID: <20240620161145.2489774-31-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620161145.2489774-1-alex.hung@amd.com>
References: <20240620161145.2489774-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|DM6PR12MB4188:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e9f371-9d43-4189-3254-08dc9144bfbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|36860700010|82310400023|376011|1800799021; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+0kHofnMbcvx5SNe7GFis+pDQbKPdG2EOWafZbVcCh2t6aKxtt2WhZvCwY0f?=
 =?us-ascii?Q?vLn9FwFPQDqeEWHUxgjveRo5/rQXU8vUHd/RjQyd7ggQITliN0QYOyj+VLYD?=
 =?us-ascii?Q?IEMGtFbPJtF3Jg5SB8nlk9pB9m591T1ZoHrvaqnvZ9aM40GNx85rEBy0lZNo?=
 =?us-ascii?Q?17FqOEUj96liEIQeImySbBbVD/eb1OIsU5AlhkuEQFeUB6dOJSgI6IS19DqW?=
 =?us-ascii?Q?kLTa8EeZFnppBiy2q+kcXPIdQT76Wt17dAYETmPvR+aMjK1eJ0kIdl1YsO62?=
 =?us-ascii?Q?5buV0hcUXU2OCHvlFWhE6cr9Tgk8kDv+lzc0m/PYfqqt2kx/Sqme2OIwVuPp?=
 =?us-ascii?Q?imxxxOUxHpcv2iANQ17P1xT/BwwMOzrhvDhrFfTW4ss0Y16m88zUZPaVsVPy?=
 =?us-ascii?Q?vVjDp+LI/g/G3cZcDnHcsjBAuKz/8mSv+CGbunLuuPV4Zb7s6HrKUtnAUPGu?=
 =?us-ascii?Q?eLYQcg7rtBuUcAhZTTnduX2VJ1okooeS17Oc2ctsPeOsUHSiEyhJtEDOFHg8?=
 =?us-ascii?Q?fMhoPTZcrRwtB/RcCAFd5GAqAX4f3cr+NbFBzQfDq5aVi01g7DOQgGaO9pz8?=
 =?us-ascii?Q?twLh/n2Tcnwem+Ji+/Gn84ZJPwefRM1VYi9JbigfGJDENSLpeXy9pqci9m4P?=
 =?us-ascii?Q?l+rOomG3Vlog+o1Rw3ozgDIDmudiD6pzXc2ps0HcKz/lDp7nAoJgfO/SrFzh?=
 =?us-ascii?Q?c5EYuoBU8a5K0mWn25sMF+rmeF6mcKX9ycczFBfvhHP8Ie76/nosAbmnhNoK?=
 =?us-ascii?Q?Qpo208VeEKn0zCCswg0EF+7BmwWKR2J5huE5CIsTJuOo+Pagq6hds1LK0fIC?=
 =?us-ascii?Q?fRaWMeKpW6pWW7K7PCEnsNvzXon/4+u9P46QbThQvCc7pwweu3B+VFPO4aYK?=
 =?us-ascii?Q?DPH9ucHY0odK0kE1BnEHvj2tNqsl1IlJC6YksAI3p4K5E1BTi5h+lVcl71hw?=
 =?us-ascii?Q?327otcFM3a6jb/iR0E/SELF8fe+4S/+cxPO+YPz9fJItL8T+DxFTwwVorhv1?=
 =?us-ascii?Q?jUIRr9x8oFgOJHptqKfiv9KlQ/ShQv1BGgK9+HTeool4LGRgYPkXrexUbSWC?=
 =?us-ascii?Q?ShCtQsGOnZ6hF4bnPrXWG131bFIZ7WEDzeLykEdo+gNEqkGPKruahHzMWrkz?=
 =?us-ascii?Q?xEuG9BJInJtvmdXEhcf/Xqcbfg3BpNH226sk1mRONcpkyVe66FLcA6OPqTLC?=
 =?us-ascii?Q?XPQTWneGjxvAzHclKev3dDtINMPKgFZ/f3voWNsSudTyACSUKiVgQRJpRsDO?=
 =?us-ascii?Q?2WPwgr1F+HUzim4N0WL6Q3lVVvOmBIk/s+rg0sT3O/GvrNrfishAOj9rsW7K?=
 =?us-ascii?Q?EkbsVtwRzkfqKZKScZo3moOvfweC7uX3j5ds3WtftWOcJbzL5DDjLr669bZv?=
 =?us-ascii?Q?vc9vJtVUuuiWdMeSrjDqBzKa6qd7opL3W3nYpFT+pxBHOfvxfQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(36860700010)(82310400023)(376011)(1800799021); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 16:19:23.9612 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e9f371-9d43-4189-3254-08dc9144bfbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4188
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

From: Ryan Seto <ryanseto@amd.com>

[WHY]
DSC was waiting for the wrong field to disconnect cleanly.

[HOW]
Changed field the DSC disconnect was waiting on.

Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Ryan Seto <ryanseto@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.h   | 4 +++-
 drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c | 2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.h b/drivers/gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.h
index a23308a785bc..1fb90b52b814 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.h
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.h
@@ -454,7 +454,9 @@
 	type DSCCIF_UPDATE_TAKEN_ACK; \
 	type DSCRM_DSC_FORWARD_EN; \
 	type DSCRM_DSC_OPP_PIPE_SOURCE; \
-	type DSCRM_DSC_DOUBLE_BUFFER_REG_UPDATE_PENDING
+	type DSCRM_DSC_DOUBLE_BUFFER_REG_UPDATE_PENDING; \
+	type DSCRM_DSC_FORWARD_EN_STATUS
+
 
 struct dcn20_dsc_registers {
 	uint32_t DSC_TOP_CONTROL;
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c
index 52f23bb554af..6acb6699f146 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c
@@ -208,7 +208,7 @@ static void dsc401_wait_disconnect_pending_clear(struct display_stream_compresso
 {
 	struct dcn401_dsc *dsc401 = TO_DCN401_DSC(dsc);
 
-	REG_WAIT(DSCRM_DSC_FORWARD_CONFIG, DSCRM_DSC_DOUBLE_BUFFER_REG_UPDATE_PENDING, 0, 2, 50000);
+	REG_WAIT(DSCRM_DSC_FORWARD_CONFIG, DSCRM_DSC_FORWARD_EN_STATUS, 0, 2, 50000);
 }
 
 static void dsc401_disconnect(struct display_stream_compressor *dsc)
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h b/drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h
index 2143e81ca22a..3c9fa8988974 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h
@@ -196,7 +196,8 @@
 	DSC2_SF(DSCCIF0, DSCCIF_CONFIG0__BITS_PER_COMPONENT, mask_sh), \
 	DSC_SF(DSCCIF0_DSCCIF_CONFIG0, DOUBLE_BUFFER_REG_UPDATE_PENDING, mask_sh), \
 	DSC_SF(DSCRM0_DSCRM_DSC_FORWARD_CONFIG, DSCRM_DSC_FORWARD_EN, mask_sh), \
-	DSC_SF(DSCRM0_DSCRM_DSC_FORWARD_CONFIG, DSCRM_DSC_OPP_PIPE_SOURCE, mask_sh)
+	DSC_SF(DSCRM0_DSCRM_DSC_FORWARD_CONFIG, DSCRM_DSC_OPP_PIPE_SOURCE, mask_sh), \
+	DSC_SF(DSCRM0_DSCRM_DSC_FORWARD_CONFIG, DSCRM_DSC_FORWARD_EN_STATUS, mask_sh)
 
 struct dcn401_dsc_registers {
 	uint32_t DSC_TOP_CONTROL;
-- 
2.34.1

