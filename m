Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IZ41ItJRO2pyWAgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 05:41:06 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B616BB23B
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 05:41:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=2Aehd7XS;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5BC10E051;
	Wed, 24 Jun 2026 03:41:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013021.outbound.protection.outlook.com
 [40.93.201.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED8F10E051
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 03:41:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAMF4XW1PYHqqSaQ7GCmVC6YcwHbNMR8kJcA0IfNE1BFuW3zq0xacrpwDINZAgqsQDkecGUPupua7swEQ0KYCj03l/A5PWGBiYr7SIpODEw2Xkj/+MEmHvp/oGGveJ3MDPGR5EYmaVwG44COQtwPKOIkPRqN66f03zTchrLJfBoNgfUjJgssAoS/HbEcRs2E9825dgT8EV6d6ofuw092XQn2lGUWsFv2cy4MgSpM9J6EC7GZ3wYUXz3zqsb3NU/b7C+6l+EPXn3kp+CZrE8e1wjVFMky/kwrStVidQAPM/C3LlGOATe15qwEI+Ahz7iZNzqGgSHSNYmY8Dj++StTrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7KfVyakA/LclrB+7u/C3s+gSCxiHhsx6bP7MGv3L24=;
 b=L2gecUAohc7Eg67Myj3Ko+UZsorbAOfEh9IVeQPImRjn/h2lDaiLiaugOTacw2Cz63WE9GWL/tacZIrOcR5Wa0HUJC2S+5/piQt7r9t1f+Rog7+fDG+Myga1c6LO7tp+yXEwYg3xPI/JYWU6dvzRqb/a3qQfBYn+pwbmgqvjBqfCJDme6XSWHqE7ER25YtGpP0D30XdmJsh3MRe6PD/3xnFseEHan5FTgfx87zeZM2xcX9otQFV9DajkxTy+5LlzctE/9DqXKWMmvx86MjBiBu4o9Y0AhcopF0v5UNfH/XB7H6ggl8CX3uD4iC0Igwy3IUQSRl3pq+N88SSIsL0o8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7KfVyakA/LclrB+7u/C3s+gSCxiHhsx6bP7MGv3L24=;
 b=2Aehd7XSwdkCW1FBzDne/EdW22vKgz79T+zR8fGQr6661QrtvgBYbnRdGEyw/P8h411uP0TlZ+l/5iK01p48LM/lEQZTzyLDN7nzJJyM0UfOOeWKwt8NdEflJluU4Gr8OrYJZDVLOvuxUZBG9+8dVnTZ60CicpLQUIC5+mPf5kE=
Received: from DS1PR02CA0005.namprd02.prod.outlook.com (2603:10b6:8:452::6) by
 DS0PR12MB9348.namprd12.prod.outlook.com (2603:10b6:8:1a0::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Wed, 24 Jun 2026 03:40:59 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:8:452:cafe::f) by DS1PR02CA0005.outlook.office365.com
 (2603:10b6:8:452::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 03:40:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 03:40:59 +0000
Received: from amberlin-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 22:40:56 -0500
From: Amber Lin <amber.lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Jesse.zhang@amd.com>
CC: Amber Lin <amber.lin@amd.com>, Shaoyun Liu <shaoyun.liu@amd.com>
Subject: [PATCH 2/2] drm/amdkfd: Add gfx12.0 queue reset support to topology
Date: Tue, 23 Jun 2026 23:40:41 -0400
Message-ID: <20260624034041.78450-2-amber.lin@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624034041.78450-1-amber.lin@amd.com>
References: <20260624034041.78450-1-amber.lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|DS0PR12MB9348:EE_
X-MS-Office365-Filtering-Correlation-Id: bb89ff91-b97e-405d-27ad-08ded1a2680e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|22082099003|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 8vGQyPHTt5jcYyx8NIIfV3uBOQ2TCQ/4QzfddnSXSm/i0rUuwRKxQJFqq3ZpI+1GA2PQtqTS5T6J2qPsqNSB1YMyeHbF+/coa8mBTXrOCT6zxzpokxuxnVymXMjwWgLakV7Nj+ZuRbMQnbKqyzUFW9YZH7OfbUdndmAMjd79GFuYRFk2rOFtSzDF5XSzJwnFItAnkFIG4jBMGdnL0uVXRSPWF3cRh5LRVHhXxePtiEXqU1kd7mUaHz5Itl229Jl5Bc6BjCjoD2V7P01P9ANh13LloeGzY/ZxbyFRgtP5PT0BVjaQfYE/jCpTcleaFZ3DpPofRg/S2dxx3CkiqZiYLJWXy2AeKZCV9bpi1ZfShpCh/iiMQQuAOO76GSsLNWiMUh50J6s6/zQYo9MdMSx4qzcEBNkakFGIPwVlY8WCQVZ+bGQa5dN3i/1sNxljxGCmj/SM/ny51TnA7Y9M03GHUyVlvDmjI7Boiu794LY/f+4lSuhJX0rjvzfCQKoeWK8hsBx86MUUOv4DodWxfW+ODzvVc4D53vTIC/lDpzBgmoA8zbbWYef4mppfC1+/FZElaqENZIUWwecWCCz7EYOr3MvvQ2708wO7z+R9aCUdAvOFKtihAd2BaiEx5CZy3UjPNtGz8nympNQ7mKe4fObgnsUlk1ByR6w0ZSJuxnIaCZTmTt+Y5otCSGd4xXANFBfCHLA6NJjwWiguaHeyuSwjuA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Nqzltbv4pDsRuYSPrhcDzadIPov2D7UNDz8vakgLrWX7TiwVzZ0koqZgDfBxGoUB9YRQgFRTnzS+pkbVISuWFwDjjHMQsYBfJxmk8hWwREExm2yuvP8CPCaKz3SajazOnJDlkNZmTV3yMrI2nOTCPR6LA6AldMtj7FBgPVM7vk6ASA0/Uljz8FFe5ZQC7ZnmhEIndEnO6A4Ux4H1WVx+BAclNoHnWw4GstS8/mKL7Fm+OSUuN2Yk1bdOvXzYGUJckJs1DLlOwMNJedJNBclXHEfV2taPDL7FDoLNZymdP6Cv2XAmth/GcTmiWEn6hl1OroYWX8ou8hwsGHyC/7ogezhBIpygInitrYtojKUdDZHrnla366KnpqHjEl7Sf7VyphilRd276dSy7OFeuntYsQQzhzrw0wQCME8VFLNo67Ks+U1bbX4+4HoNjrVbvmI4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 03:40:59.2967 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb89ff91-b97e-405d-27ad-08ded1a2680e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9348
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[amber.lin@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1B616BB23B

This adds queue reset support in KFD topology for gfx12.0.0 and
gfx12.0.1 on non-sriov mode.

Signed-off-by: Amber Lin <amber.lin@amd.com>
Reviewed-by: Shaoyun Liu <shaoyun.liu@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 1bf67b6e9aac..9997ed4e5613 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -2020,10 +2020,12 @@ static void kfd_topology_set_capabilities(struct kfd_topology_device *dev)
 	} else {
 		dev->node_props.debug_prop |= HSA_DBG_WATCH_ADDR_MASK_LO_BIT_GFX10 |
 					HSA_DBG_WATCH_ADDR_MASK_HI_BIT;
-		/* gfx11 dGPU */
+		/* gfx11 dGPU and gfx12.0 */
 		if ((KFD_GC_VERSION(dev->gpu) == IP_VERSION(11, 0, 0) ||
 		     KFD_GC_VERSION(dev->gpu) == IP_VERSION(11, 0, 2) ||
-		     KFD_GC_VERSION(dev->gpu) == IP_VERSION(11, 0, 3)) &&
+		     KFD_GC_VERSION(dev->gpu) == IP_VERSION(11, 0, 3) ||
+		     KFD_GC_VERSION(dev->gpu) == IP_VERSION(12, 0, 0) ||
+		     KFD_GC_VERSION(dev->gpu) == IP_VERSION(12, 0, 1)) &&
 		     !amdgpu_sriov_vf(dev->gpu->adev))
 			dev->node_props.capability |= HSA_CAP_PER_QUEUE_RESET_SUPPORTED;
 
-- 
2.43.0

