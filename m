Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B628AE757
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Apr 2024 15:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B4011339E;
	Tue, 23 Apr 2024 13:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hWqrgtN0";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2068.outbound.protection.outlook.com [40.107.101.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305E111339E
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Apr 2024 13:05:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxzTtAtymFPkX7Hf90Qt7jVdh1mF1l30I9LVvQ5bIbfj8XTYWhCyCs+MfhMjHtCGd3Oo4+gpBpKoxwMQT3cImYdrbxKw/jR6U4ouqsVGA7NXkd+biSXhTufEfL5nVR4nI9Jy8Ny1ot1YytzNdyVBg9XwLNzipBVt1ZIxUdSnOzCvr5/bo2pp/FgfMOl/LoB6l6KkQpkL/qEkQSECU8yOoHRGHA6T81zLiztXh+8ifmm1LVAtFLZhjtUha+0HmRh1lVOBCusUdrlL7q/7JsSfpdyifegkgaTIkleD1EkC6LFJTJDDd8FBQ8WInroTYhZfgUkBJeJSMBX4+P6dH4W5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihOHjrIX6J7gtqiEtbuyb+wURe+2oQhDrzT/T9fjFkg=;
 b=CBfMlHgEo0J4PIZDdqQBAT67R4KywpE1Tn6FS1QNjClgwzvNbd6b/PHJgMzJz9CrqsweJVX05SmuM5hRNIPvey9QdmA9cnK51AXRGI0DxXXz++3ubdpJ9r+HZLdOO5pV6M3r+7D2nlXQM/Gr51soJuW8pszq3YaHPMc7QmKiwrpFy2ylb1MKqtgguiYbJoHvrqnus2DW+F7tUR1HzPoT3c2o+celTM4XeX9Hj+6uYb05/gFYeWZ1afGg14pXlG9YDwTN4U9Ss39MqWcKjwzfdnVs5CzX7FxtBlba5YaaM4LHg0Ze5rDA50xxB1Y5hGZiCSzriAVLXSNN/OnMcsJqMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihOHjrIX6J7gtqiEtbuyb+wURe+2oQhDrzT/T9fjFkg=;
 b=hWqrgtN0BxXE27k+agKmH5a/JOUOqEEE4AozumEDXstnXYxGVAnE+mA0wSzSNsfiG1E+cdS7ZmBX7TcM4PrIQbgBX8wG5O2eWP88RTJacDTFiVXtbLuQ2+ApKNQ5dW3PGHoDt8amcG5JR4sTFqCHE/blDC/UFxsdcV8/1GtflvY=
Received: from CH2PR05CA0007.namprd05.prod.outlook.com (2603:10b6:610::20) by
 PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 13:05:49 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:0:cafe::22) by CH2PR05CA0007.outlook.office365.com
 (2603:10b6:610::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Tue, 23 Apr 2024 13:05:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 23 Apr 2024 13:05:49 +0000
Received: from Philip-Dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 08:05:41 -0500
From: Philip Yang <Philip.Yang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Felix.Kuehling@amd.com>, <christian.koenig@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, Philip Yang <Philip.Yang@amd.com>
Subject: [PATCH v4 5/7] drm/amdkfd: Increase KFD bo restore wait time
Date: Tue, 23 Apr 2024 09:04:48 -0400
Message-ID: <20240423130450.25200-6-Philip.Yang@amd.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240423130450.25200-1-Philip.Yang@amd.com>
References: <20240423130450.25200-1-Philip.Yang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 49dca9d9-74f2-4736-6caa-08dc639618e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TYUXvKD6C2Px9s6j195uRjtKn1Flj7XqTR7eBJPckb1kUDz2UTSKWqAW9fq5?=
 =?us-ascii?Q?8UnSeH0iprGzl+N90KSozVIQuB6cUfcThR1MiJqFQzTA//1kRq4I9hlMgiMZ?=
 =?us-ascii?Q?4b9syrJotqDuaZXadkm7dRDIfQnXfqABCocoHkoUgHPfI+8kAkB6wSduPuMz?=
 =?us-ascii?Q?99vBUVEfmQRBhpOdsfq4tdmA5A4qZ069iyMQf9pl902XcF2plk8S3snwtFcZ?=
 =?us-ascii?Q?yMOBtP++I0YVP0PmliOTjBvmaUP794BXUKoNB+jsSHeAucbRtdiGeKB4Omh6?=
 =?us-ascii?Q?lsKYCZC1qZLAB2YHAQAsxMc+1sUzJHv3lTfmDgCtuBoklvYWDavmcX4QfIfI?=
 =?us-ascii?Q?M2xqt3SnOHUc6LjWKT7MYlIgP9nEywLUzVwmIeALKvifecgvp34uhb/O4o95?=
 =?us-ascii?Q?hHb99n2e+ffALHO+8pquwoZReJvkOnZgyV/B2yXbrcSjiZR32ENzQJlvtPRr?=
 =?us-ascii?Q?JWVKQ6Vsj2mHU4ynVTcACc5C/hU3//Goe85I3x7kuU8hmnYQcxfC7Lg6fOKr?=
 =?us-ascii?Q?yH8Rw3Yo3YvKu5SucKMMpaWHAOymJ5h8IzVPpVwPJgVk++MfIipIZXCGWfai?=
 =?us-ascii?Q?PTinnuqY2/mIV6XvSMu/FVcBs5BMf+QByECfs7sMfukk8PFHgIDFrPetzDlw?=
 =?us-ascii?Q?WpBF/fFsubG/8jlIWVTyaljikSvsvZ6zq6oP8OqwYJaaKFG63me/EQJaMUKr?=
 =?us-ascii?Q?Tc2wpcREr8hXdUi7W7kiX61fO67OaJ3zbR9eRMNe70Cz4TnMZaKcX+rK79gL?=
 =?us-ascii?Q?UtLwzjpMx8EzRMK410ShWREqANT/LbpgiYpzjYjHumbfgg5EdbV2fZqZjhcZ?=
 =?us-ascii?Q?fW1eXRrW4p9ySSOryg3AN3ccuFnxv6n0qyVujUv31usUKdGYWdqUcQQ5WkD2?=
 =?us-ascii?Q?xmteI23KsYjEcbsUB+2MAeb06kpH8uoWQNN5qG+LignVKcFeCu1TkroIyUrn?=
 =?us-ascii?Q?U+K3fGF97UYw0Hqthm3n//JxE6pNpMRDs+y3ZdAW/Hd9q31uUy3QCaJmikWH?=
 =?us-ascii?Q?WC1i2iQ0+IurpDKMPKMqZN8aI7Bw0El0rr+Cl9az96U+/qSF9T8cCefs81OX?=
 =?us-ascii?Q?edTSwwcfzlHzM2S3m9qGYmeus+QniJjl64AzBlmK1vvKH1OUmD0nMPJLwUhU?=
 =?us-ascii?Q?XUii/le/L1oZ0s0+YLNIYuideaQWMsmimMkdRMZdRD+HKPv7ScQuYxPNgYTZ?=
 =?us-ascii?Q?QzsYQTAv0oy0Y/tKJW4UPDxQHdKOx2PI03V1G8Is28cIgdbwbVsfneKVlPmS?=
 =?us-ascii?Q?Z/FwDhR1ylpIMEPdXbkzahp07pNu2RiRNU0nw+mEQ4Y/wBNpdBhzcjJX4PlW?=
 =?us-ascii?Q?d0ivZHgIqH8KNNwuYxIv4wy3eHPYY7zLNE/TJpJDcSlXdgp4SZvS80i2N+xp?=
 =?us-ascii?Q?oYs8fsKVeBVV461SF7GP5q9K8RGD?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 13:05:49.2813 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49dca9d9-74f2-4736-6caa-08dc639618e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
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

TTM allocate contiguous VRAM may takes more than 1 second to evict BOs
for larger size RDMA buffer. Because KFD restore bo worker reserves all
KFD BOs, then TTM cannot hold the remainning KFD BOs lock to evict them,
this causes TTM failed to alloc contiguous VRAM.

Increase the KFD restore BO wait time to 2 seconds, long enough for RDMA
pin BO to alloc the contiguous VRAM.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index a81ef232fdef..c205e2d3acf9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -698,7 +698,7 @@ struct qcm_process_device {
 /* KFD Memory Eviction */
 
 /* Approx. wait time before attempting to restore evicted BOs */
-#define PROCESS_RESTORE_TIME_MS 100
+#define PROCESS_RESTORE_TIME_MS 2000
 /* Approx. back off time if restore fails due to lack of memory */
 #define PROCESS_BACK_OFF_TIME_MS 100
 /* Approx. time before evicting the process again */
-- 
2.43.2

