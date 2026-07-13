Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UCzQJysuVWr+kwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 20:27:55 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8AF74E7A9
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 20:27:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=pFDahXu7;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D342210EA95;
	Mon, 13 Jul 2026 18:27:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011051.outbound.protection.outlook.com
 [40.93.194.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D5110E64E
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 18:27:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQ0WCLwzYKMPM0oywa9yoAkzYj0cmoVkbhgfn+MvkKVAJYobg54f4GjMFbBNTqyVF0uM76+xSGrOauQXMAF1ZEKZA0o0se0PrlaTdXL4gkbH0rBgsnu4FQyKv9FRDyLwrG0aC3uxCLERFiEt9Mn0tn87TeWEBsNq8067EiI66e8piLGefKF/SOMm49zb44MX8NNj4tJf1qNpWKgyG21Iq/esn/6As7YXUDdbPkQQxv8R4O+ZV5YqkmpzqUhqMSzVEhE76ikITOpuJQuCDrO9KJjZeMc9UU1PVGWpVAsy7uj1J/K1OxAIq0px2XGOPrcDl/pdWvYB7bWnPQtFKDPiBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWmseeTJtQMLpA+NYcbpqzaZHqDAvdb094CjxhVMzcU=;
 b=vn2/9U5tQAgkauZyP3YOV6bpEMCR2e9T8ElPLse2nqTYIyoZ1gS56Z7Y5klCdx1Wbi98YkE8bQCjxzcS+abpYFZiaioNHUlawwAhagZG98jHXyNiyvXiGo3QShmMWL1ujLU7T83Pa+PtC/Z2Y04Me28dbwrG9U6/2os5iLTlIexIGxyjpBPaLiTYZN+e/yy6HXDwNYG+OmZqLxldGC9NN8OSU49FiiQrQbImQL4cFiTDjxL+oN7LEMJdEsPstzV/fEBi3QNh9GfGvTa5MsC5FNEMbRlqpNksyOzQnuO/S1FITJNP91XLmEP3EpKST7ilQ6qcqJNBNSNne8lOlYXohQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWmseeTJtQMLpA+NYcbpqzaZHqDAvdb094CjxhVMzcU=;
 b=pFDahXu7pLWBQYlp2kx82vIilyiHUk2B40dgs2bmsU9FFScFOig45nOKv1wdwIP9KAiZRjDO9PiNNo4rIB15H6Bi9zKW/ZYhHWrAwo2P0kmZpC9GrxGb1or7ArziI5sm7K57SePmWXBaaCNk6BEgLXGLyp3GCtM4Vr51zDTfB1c=
Received: from SJ0P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::9)
 by PH7PR12MB8596.namprd12.prod.outlook.com (2603:10b6:510:1b7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 18:27:44 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::5) by SJ0P220CA0004.outlook.office365.com
 (2603:10b6:a03:41b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 18:27:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 18:27:43 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 13:27:43 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 11:27:43 -0700
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 13 Jul 2026 13:27:42 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 03/14] drm/amdgpu/gmc11: disallow gfxoff around TLB flushes
Date: Mon, 13 Jul 2026 14:27:21 -0400
Message-ID: <20260713182732.630947-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713182732.630947-1-alexander.deucher@amd.com>
References: <20260713182732.630947-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|PH7PR12MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c57c98e-118c-4669-235b-08dee10c6e48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: AxJda19YN/p3jHNlhCMlEy2cauIm4rkCf0uDbkjtUoYmLtZ/gLOHpPaaNULSOlLn8d/wcMFjBQUrTbwSSLqYNJl716/QZXmx4zaxdHxB8OqrdaX6wifybLmbHPXC1AV3/zxbjhvisGDsSK3HcGjZ9u/KCy6bO5Rl1do0ADRaAhIJRladbOUUkLOQbvrBjnyjl8w5z68ymkD32s321bPNNDne05ilmv/hpG3C7RGSZvdzbickVaHrbRZVJV43QB4Rg3Mst+DnO+ofDBjsR36ldbVKyf5ze7xHGJYU98p41KOvDThIg9z49CH9u5W+/17I3iPhd3CU3jN6uY5DCy+ZIN6wwIytdhLHKVAZgG2IdyK15WbUAVGRA+gymVQPX6d1qrbbQzpVEG7UGEM+0QyXEzz/L1Ljjl1IIOVN36X0gdLTAW5Zvu+XxSBGmpD6mAw4oB9LvR08Bwxi73egTvadrcHPMeKgiw2X5cTIrT1iWtGtxW7gMEeLqPmIHtg8rwns69RDEhdlu8gGnGg0E++Qynoe21rh2uS8rtwfu39Ex/PmkS1BAjNCK10LT2Dmie3pu/szT0By3JPmqR3celLyQKtqWwsMzRNGp4vV3UZ+GihDPSeri9NJdQ6A0NUmUrdA10U4OBKgnMZZcMT0/YZKzRxgvkadTIC89J/rwVwFB43QGJpaw6I2TFVoZLJGVGT7ptaiUbrwMGzqhtSYSTQhMw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cjRx/Rr9U/iWGToGPfJG541rSodOnJNzC8L3HG8Myi3MDHPzdoSVRAJcB+Cgyfxv/KDq+OXf3ZD1qudVCqMQPLrH6yzIjbe4T5I74bSTlVqvnokN7ehQLJFbQLJFP0EFXo2FOt1vIJWEZCHfvv69a0p6ue9yrGyM1IzxOEf0i47P5RrsESO+/HZXNJvdWkiDQGRPGLkd/vLN/dq2ViLI3WooI0VFalKZBetx+nbxLhowepvWb+K4hNvngOKYBPSM0GezAwkXL7wT8vhz02xPh0BwpOcn5UKXTUZlvxgy00315pGKny8NproviigaEzhlIWNLRismqewcQU6yCKwxftWG4eMda3dSGUpnabyrMqJnS+k9K18aAnBCQ7L93gviDRVGXpqN96TYqpFbOeLHZI31PPvm63wVk+QPHWiWSQLXEoyUDH6M0dhwtb1uBu6u
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:27:43.7913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c57c98e-118c-4669-235b-08dee10c6e48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8596
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:from_mime,amd.com:mid,amd.com:email,amd.com:dkim];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A8AF74E7A9

We need to disallow gfxoff if we touch GC MMIO registers.
At the moment we use KIQ or MES for TLB flushes so
no intended functional change.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index c40d9c4672045..e3d74dcd8373d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -253,6 +253,10 @@ static void gmc_v11_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	/* This path is needed before KIQ/MES/GFXOFF are set up */
 	hub_ip = (vmhub == AMDGPU_GFXHUB(0)) ? GC_HWIP : MMHUB_HWIP;
 
+	/* disabllow gfxoff when we invalidate */
+	if (hub_ip == GC_HWIP)
+		amdgpu_gfx_off_ctrl(adev, false);
+
 	spin_lock(&adev->gmc.invalidate_lock);
 	/*
 	 * It may lose gpuvm invalidate acknowldege state across power-gating
@@ -306,6 +310,9 @@ static void gmc_v11_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 
 	spin_unlock(&adev->gmc.invalidate_lock);
 
+	if (hub_ip == GC_HWIP)
+		amdgpu_gfx_off_ctrl(adev, true);
+
 	if (i >= adev->usec_timeout)
 		dev_err(adev->dev, "Timeout waiting for VM flush ACK!\n");
 }
-- 
2.55.0

