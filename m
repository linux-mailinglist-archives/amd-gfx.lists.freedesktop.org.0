Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NhA0CGAST2pdaAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Jul 2026 05:15:44 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7159B72C39C
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Jul 2026 05:15:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=gCF6Y5Lm;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0547210E449;
	Thu,  9 Jul 2026 03:15:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011060.outbound.protection.outlook.com [52.101.57.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0804C10E449
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Jul 2026 03:15:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5TUDiwxZrF74q6SmaoRrJkUnQV7/fcw7ZIOGtSplf+S0OCO2qTKNiA/wx+KBYx8LUf1uRj96T2EqOnNMQf239tlVC8Bso0efCWzyP18Y4a6tf5UAkNXHSxP7YTtOQQ/LJDe5TPt+riw9uFlUqd6vwfzVx3bKuK8pyEhw6J4eevA0gcGe8uzSn9vrIXL0JT2EfwqzxL565go+4MJYvqBUR54981VrhwUzY5k6gBvolKYwHmJuILgMkL9KjRmOZRgMmW5JbRnhNhxttOoMhf1zPVLvlZbVNbL+h1Rrl4arvyDVsiP7qBZYnpVT+2g9U/bdK76hNMulbqDX5wmBKW5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEth+vf85CQEnrNIEF/F/GxILLw+bXkhkRtZ9TTylkQ=;
 b=N+kdTQErsFlgBt0Ukz5ehUUP4dO58fCd9pDUlEHU/DZu7Cky5GA+eeekQa7/B2BmDyFRhfxxZQmlcfkpjbEGP9CIxvfsCevmTkvCQamAg1Ao/P9TB3Bn2k6uFA4Z9W9jKQSFJBPVMuRMti/YNBzESYvihnuEYD6GVtKP2EWENFZ0dCVJSCBV1TCqQ+t7ygcES+yoWD0EU1UIJoFTXgn+R+YBCSgxIc5bmbnAsbkIRnOG9mzCHvgMqJNuWnxPZhQsWLog/LcPyyfxN4GpHIXEpkSjd1z8RwDc5QNdVrR2Nb2A7W9LPjkuuHIjrLeRi+QEfIxSdfaYZYh0H+0cTTAGGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEth+vf85CQEnrNIEF/F/GxILLw+bXkhkRtZ9TTylkQ=;
 b=gCF6Y5LmULpSjihz1HGrPmTP/JCLb1FZYpjscWKopF2mxBwFn7AG0ThpOdHQ3qzCXxYd+NUV5ZVD8iqtiKZIwGrYJDjyN9B9H1Xtyxk20CNGUCCVyGZ94AQznbAf0YBlCSSd+vYO9+qjGOTrdrgk2V3FLxSlU16Wxv4diug6B9c=
Received: from CH2PR18CA0057.namprd18.prod.outlook.com (2603:10b6:610:55::37)
 by SA1PR12MB8144.namprd12.prod.outlook.com (2603:10b6:806:337::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 03:15:35 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::9b) by CH2PR18CA0057.outlook.office365.com
 (2603:10b6:610:55::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 03:15:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 03:15:34 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 22:15:34 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] drm/amdgpu: Disable PCIe dynamic speed switching on Ryzen
 Pinnacle Ridge
Date: Wed, 8 Jul 2026 22:15:20 -0500
Message-ID: <20260709031520.841611-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|SA1PR12MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: 1265176f-934c-45e7-ca3a-08dedd6857a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|56012099006|11063799006|6133799003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: ejd/WjOMBoigCuE1V5Sk6n1rvzaqSuqGa0ICZtLgFZAsZmz8zbGIlruMwPLA9UqRPOgZVcp6xwUp8t2m0MTlwYR+ovvpur43rn//CINBs5TY1xJoQiREwoet1pu5Gm+MVxGxXc4QB9gEK6AmNn45SoYGz8sR/umJOEjydlr40RxSGlPSg2S5oj7Cq3qXDtPJnLCPJXCieXocc30OecauRAWhPYtrtHzUsABHWI0/seuLQYCw5hsiyzBwsU1sBBhGkWe6mehBhf8y6Yol0EqiWup42F0vvudIR8rrPkZqXDqQQiMP/2ukVlH9lT8iLJ4OMg9XJ+4VwP8caiofd1E0Bh7XbkN7CjDjAMiXMymbU2e3dgz4DnyNKyJRiu6hZWWdcfoMUmiWUKoywmzspOD+YZEDNrUCe5qbNLogLhNfc9Z/yXdLBY+NUvmwCkT1+Ezu+pr2cBNPGf7kkUnnnFUfXqYJ4jpnTSTX7cRJaajDNkEiqQyBxZJdn0DfSN9gHtMnB4a19GaxOJpMyIICsNOSXx+yXZ0zFL5GhjNgs4sk4JVCaLnSezbYXoVLRuk3TvTCcqiL04eMqBW0l7fzJ/fSRI068BPvAa/CuaXu3ngj3iZPlj1Nw4Wg2Ku0vTNbd4muQiDSBxLrNJW+Vk5TBG8eGA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(56012099006)(11063799006)(6133799003)(18002099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Jfm7u33eJCjnQVkESghIj11Rk47XtS8GDnD3Alr4p/pB7prks5U/q1Eng8dQIh/iX4dSjvRv4+R5TJzg5UVgAHrssyl50Ivp4ezoBE3Hvt4pTC/Z44N+urYyH7kZn1ysstoqJNHask1buP9t7u9iaj+UDJy3JFo5QzQZLFVglmQTHoWUjPefS89Huuw1pH43fiVnSYQrpBS8XOtGzzzSNkyyQJJyZ41wI1GkPT0LJ4kiXO8VRLHMZOkQ/bJFTpKX9rmHa9evEuA6frfC+uWqCtG8KM44tcWAIAaw479enQ6MhwCczFas2uXqvnpA3I5Tapgplie6WqjHzDZ++40+3CiwBKiAZ3aUayISgevdUEPTXZNTRWAh3iAm/S7uuPLScHYCJ9npeS7uHRC3aTK/3MsbZajohAH4God1NN7jxHUNp7GzEo4egQMxfbwnLbxe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 03:15:34.9608 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1265176f-934c-45e7-ca3a-08dedd6857a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8144
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7159B72C39C

AMD Ryzen Pinnacle Ridge (Zen+, family 0x17 model 0x08) CPUs have
PCI controllers that don't support PCIe dynamic speed switching,
causing system freezes during GPU initialization when enabled.

Disable dynamic speed switching when this CPU is detected.

Assisted-by: Claude:sonnet
Fixes: 466a7d115326e ("drm/amd: Use the first non-dGPU PCI device for BW limits")
Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/5436
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 27f7a841cd623..f8324712b712c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1289,6 +1289,15 @@ static bool amdgpu_device_pcie_dynamic_switching_supported(struct amdgpu_device
 
 	if (c->x86_vendor == X86_VENDOR_INTEL)
 		return false;
+
+	/*
+	 * AMD Ryzen Pinnacle Ridge (Zen+, family 0x17 model 0x08) CPUs don't
+	 * support PCIe dynamic speed switching.
+	 * https://gitlab.freedesktop.org/drm/amd/-/work_items/5436
+	 */
+	if (c->x86_vendor == X86_VENDOR_AMD && c->x86 == 0x17 &&
+	    c->x86_model == 0x08)
+		return false;
 #endif
 	return true;
 }
-- 
2.43.0

