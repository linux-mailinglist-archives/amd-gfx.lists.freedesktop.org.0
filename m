Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEC8876050
	for <lists+amd-gfx@lfdr.de>; Fri,  8 Mar 2024 09:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C051113732;
	Fri,  8 Mar 2024 08:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WzPeZ9RF";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE76E10F8CC
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 Mar 2024 08:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lP1XuTiZ2W6myRGZocpmdu4h/cc40cA35GBxdXnUyd5UhRi0H9mWSgCAVLd78GAMIUH+tiFLqU0oHRCfyE/gS8cZAA04D4EpnsTOfd0UNBgf87OtnkQBOWueHBBNOSkrj3G74zuxyGClUXdoUNLHzdIVKEwKylh8OKgn/kaPpCYfMOY+T0r/9cRfQ56pNoTyIXEdXAOUcivbxsgz6+mvn8w1ElE6WbX+BBuKoxCgvVyhhZP421ttuZb+/h64uj0nJUOAr45xmmCq0g7e2kl3eSpl2Ng3B5Xe/J5QAWGF/kxzWMgeCUAjdYdH38jhSaIwulowC9N7bLG/M8v1V5FyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gsk02kkDFJjBzHHZ1HwCCqEAy0oNc0I4ndsrr++G/l0=;
 b=SwxaSf4qE7NRY2kBEzk414Vr6y8VZ0WGZKxLdd1nQLVKNtPu0vvEkmxKF2rqpVXOl4HVHxMOLC8+dje+/XfGFz5qzxNfJTL+fHJFiZSjpyf5hDaXj1lS+nwIBS97y7XzhmvfuB1I2I0o99oBf/oTSXVj9lTuNUTo7KC9uXt20k43C994w5oK+MFKycUedyo9mj9rbebbyI7u6muISSOO6IpEirsAFuj5Dn7bnH5wc2S8Gp4CLSrg02Ck49IBdLkKn/vomvtSKj/iYvK0OG+fnsHnp4RQLLQQ528NLYgHUB+5Ffp4jeZg3QMm+lO5OztmbGbQ2o/1dckIIy1KsWhrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gsk02kkDFJjBzHHZ1HwCCqEAy0oNc0I4ndsrr++G/l0=;
 b=WzPeZ9RFsLGorKEKIuTaM37L3riSNHee+ZmZyNCXPehI7Pz0I3opzPKQt/CXF8wuc0thq5bCo1+18vPBxOf2TgGudbTtTBu8kYOaBfUH2jJAJctlIR9v4RYxF8xMi+5wxNtLmYvs6cxVC7Og8TY7RcTF4BGKoU9wepee5lmQIIU=
Received: from SJ0PR03CA0049.namprd03.prod.outlook.com (2603:10b6:a03:33e::24)
 by CH3PR12MB8329.namprd12.prod.outlook.com (2603:10b6:610:12e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Fri, 8 Mar
 2024 08:54:24 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::c4) by SJ0PR03CA0049.outlook.office365.com
 (2603:10b6:a03:33e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27 via Frontend
 Transport; Fri, 8 Mar 2024 08:54:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 08:54:23 +0000
Received: from jenkins-amdgpu-2666v3.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 02:54:21 -0600
From: Xiaojian Du <Xiaojian.Du@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, Xiaojian Du <Xiaojian.Du@amd.com>
Subject: [PATCH v2 4/7] drm/amdgpu: add VCN sensor value for Vangogh
Date: Fri, 8 Mar 2024 16:53:57 +0800
Message-ID: <20240308085400.385793-4-Xiaojian.Du@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308085400.385793-1-Xiaojian.Du@amd.com>
References: <20240308085400.385793-1-Xiaojian.Du@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|CH3PR12MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d097d0-c26d-407d-99fd-08dc3f4d5a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y1FS7L64Y+Gw3O72elDItqCIaA+saYHpMFo2NjRtIFWQnVJVII6elw4Vimho/iaWZ09gbWg3UhzT4PhUbhsJ90ygjg91Vg9hXvxcl8nKnx9/MlXzpLMav1TY0G10VXx3cRza8zcLuTz1zYWRopxD//dPhNS+Lo2N30SbsQ9tO1UrGEa1cUPZxeWm4YUVPspXGHoyeq8RIHCoaCalA1jWdKmMxL6A8+QVfePTcvZDqKyQR33wxe/ZZs9ifXGsHg/2s9k7NxFczAD4hcwjzG6tB97v+yYeTSamnTmOOxpblTo15xe17/e+fVhwX+9l7JZFBJ0ADBVkipuOpmfNolEz04zpLprRKAmfZbgrnN23BXiTE+8JwDSzlUyYO7eHEpKeHSzvJxX/LhGBTz9vLqR8u9OPOIvD5UlaESXYQ0okvdcQWn3tb5anuqDqHX8tLUPUS9E/6EZj5UwS5VyVWbRMRo8vVMdH2w4XGkxTxKkeAQKukTbfGbq+eYz2Vv7M2aScJgEG+xrrz4T2sgF8Av6yKd4xqY8GqF+jrO/EOOzd4EJmI8U4vQTQpgamPLzM05+p+vZO1obmdTFugEbybIADJTTgVkYNXiDE6TRofwvJpdpEs0ssykqmlNKrZPEGYnIQPEe4vm09b/6ZjDpCMIy1WK9nCJdiTRuIKixciyr62O1r7SJmYlGiwkBsEFfF3Dz4YxN3YcpGBuAbCCumm3Id+leta4flPMdCZ22CBDGMbfqIIycOyhEIV8temrnLAMhu
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 08:54:23.8796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d097d0-c26d-407d-99fd-08dc3f4d5a55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8329
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

This will drm/amdgpu: add VCN sensor value for Vangogh.

Signed-off-by: Xiaojian Du <Xiaojian.Du@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 2ff6deedef95..29295941aca9 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -301,7 +301,7 @@ static int vangogh_get_legacy_smu_metrics_data(struct smu_context *smu,
 		*value = metrics->GfxActivity / 100;
 		break;
 	case METRICS_AVERAGE_VCNACTIVITY:
-		*value = metrics->UvdActivity;
+		*value = metrics->UvdActivity / 100;
 		break;
 	case METRICS_AVERAGE_SOCKETPOWER:
 		*value = (metrics->CurrentSocketPower << 8) /
@@ -1507,6 +1507,12 @@ static int vangogh_read_sensor(struct smu_context *smu,
 						   (uint32_t *)data);
 		*size = 4;
 		break;
+	case AMDGPU_PP_SENSOR_VCN_LOAD:
+		ret = vangogh_common_get_smu_metrics_data(smu,
+						METRICS_AVERAGE_VCNACTIVITY,
+						(uint32_t *)data);
+		*size = 4;
+		break;
 	case AMDGPU_PP_SENSOR_GPU_AVG_POWER:
 		ret = vangogh_common_get_smu_metrics_data(smu,
 						   METRICS_AVERAGE_SOCKETPOWER,
-- 
2.34.1

