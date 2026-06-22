Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xG8dH3z2OGrAkgcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 10:46:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FF26ADE53
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 10:46:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=mHlovOS2;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A975110E584;
	Mon, 22 Jun 2026 08:46:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012018.outbound.protection.outlook.com [40.107.209.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B326210E584
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 08:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycI0GaowDbgcqSD0CGTz57K1awLTE7yhWOIUzMBWi8r5eCa9u8TIn/aPnCN6DW5BFHY+9SgfywNnpA8EuBd3ZgCTAOoSF+hnHDXaey4iJBJNSX4j9SpXVhdpOKGssJ1QyS+ZBqH87AUhdJP+L537iK/DFtuuKRyPrnu3sZJEzSEDp79tdZ+IsSBwGIE0valbi88zxVCbuEbATLxaJ3mP+HeZQ53SZsKn5kgvvPqg4D6I+QH5WnRAYaDiAoIN4MoPbk5Ppp3G31jl3vroLH0FdhITv09l5S0Tx4SsSBwctJlf8z3X25Yoca1rmyWPSX7M1HP4aJzii8hl6fQHNYDPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5qqz1+kflxFfXBUYbuOBbG8a7/1NDWka+M646PgGho=;
 b=fivB+c0MATep4SHifibdAjpyMBL1DcO6uL1SqEG/AxptmXnr4JU9zB/m92KIJXo0g5CsQO+bxljs9e/Ls1k+6mrq1uWxD8mfOEc6OLVKYetylUm6s6eStohJjVOM6hg7ZOtbz9ksc8/H6MxtPrV7j/+UyKMxPLlmNMH8+vL0TSOMVJX/SdqNThUwdBx8iNhx48y27bBjOlAwOhnxjaivKq9BypwBqW4QNMNOnKJm3s/FSKvQYyD1A5NtLEtwkXXBj1Bg45P/3lQLDqEMKGmoF+YkOXCze034mspZPTbxlxsWqHPOGXs5YctgrbpTyll1O5o1BG/AGMt+4S58LlMWag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5qqz1+kflxFfXBUYbuOBbG8a7/1NDWka+M646PgGho=;
 b=mHlovOS2d7bYvAaHtB4qcpgOZpyzkIxE0VwwRMIVpG4fKzD26x0gE9ABSvmsBCy97zWozWp2ecW+reRiyqOwRttldk6L1q3aJdkvke9G+4N1910RyFbswRtavlJXNL5YIuzMxxmpiHPPcAx+miseHwm39eIRbTT+bVSP16ReC8k=
Received: from DS7PR03CA0262.namprd03.prod.outlook.com (2603:10b6:5:3b3::27)
 by SA1PR12MB8643.namprd12.prod.outlook.com (2603:10b6:806:387::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 08:46:44 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:5:3b3:cafe::79) by DS7PR03CA0262.outlook.office365.com
 (2603:10b6:5:3b3::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 08:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 08:46:44 +0000
Received: from sunce-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 03:46:41 -0500
From: Ce Sun <cesun102@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <YiPeng.Chai@amd.com>, <Tao.Zhou1@amd.com>,
 <Stanley.Yang@amd.com>, Ce Sun <cesun102@amd.com>
Subject: [PATCH v2 48/48] drm/amd/pm: retire legacy MCMP1_* macros
Date: Mon, 22 Jun 2026 16:44:50 +0800
Message-ID: <cd9c39c7c8d1e5c53a9b9b601c502c0c7ef037e3.1782117608.git.cesun102@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <594f7cbae0387b60f8af49505b57c1a5a604db2f.1782117608.git.cesun102@amd.com>
References: <594f7cbae0387b60f8af49505b57c1a5a604db2f.1782117608.git.cesun102@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|SA1PR12MB8643:EE_
X-MS-Office365-Filtering-Correlation-Id: bc446cb0-4fc1-424d-a58c-08ded03ac98b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: hwZZXAXD8V0Q5kJxwROIl3HzDwkjH897Mc9S5ipffSu3Fq/H6wsulojOB4vWSNYvkikMorw/oXWyDDObSfaAfp3NxR1XUq4z6XoLOKO/UMQe27O+k84d+fqWK2tqAfXDD/iuNncX7isKHgoegeJwBZDzjgS3g/0hsj532NNkOeiqRsYkG7eafk+2ea7sPecLVOxjoV2gycxFGGSQRS4aaLO2cGK3HoFf09YLypqnvGyGZM8zKXV/8wNyC0X/LELSz+DFgrG+YM12jvGv3aGV1MqDVwM9ChlkYx+htWaapVqNFfjszGkEpokXRZDypE2uOOHHZXmN/i2Dbpe1uZvd3wfxS6vOf58NlKiGhQkrq8we86vYxAJ46tVmVD3WdhcHT9Ld4Cy0qO5HbhEu4QHQDtnzdSM3NW8xm9N7yHCjsbzWxaudfl+QhfiGl1NiSGCulSVl2DoExq0O+HiPMD21ZxrG3dTT5ZLQooDdVkbhq6jUmbkQynporBOhBqmIjx83m1EV5iDVKyNHJfpwF98YRmsRHhCp5ZqNW8WRKlz+rSXdabPMTWnkmX1SuHs81PBpMvRUTsCPHxizqWaMFl1MSwc3qST/ko4dkKTD0sPZq1GlW+59ZHS/M6cUcsjQoTmlwhg2BPZaglZhhWjY1CMPOhgPZipLq1s76ydGPBoFXTQRYEYIFIEWC279F9t8jurVmK8qdvD2sBr4DgH7GXOn8g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xOXrzBuVHXtdLAlVJKo9/c25mCqOi7rQZeaqgUIsXrMh7BU6bLJLvPBMKYigf67GbIVz/7omk3WTp8uFSpXpbBNK9KPcYfAAlrPLGM4CLYoAKm9DFM4ncl1OODBenBMnetrmXWP44eOCwRgfitUfAh2bjF/XImhIl3V4/0l0OVGF6aC8vDBVGO3txe0gIbvVe/5a0A0Toysq/qiwhUiPxdib81lGg5L/nkqBc+TgZEW3sJ2W+rWtczm8dUBCX+1LLrN/2R0Ws5A/urkDi8BIrFC4SQmLOnGoLk4nh5iZsTAH81kO61+cwVxqDxEgkObi0E3gc86OuV8HLphUKOtw4aGvSx4zri91YCL4pru7W+on5AJ8ghiIvqFNaxMFJ6eGCjztT6qskKiY4hS35f//IcW8oHOh+cmfnn6G8C//T9N1+S7in5aM19PgKfH1T8ln
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 08:46:44.0363 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc446cb0-4fc1-424d-a58c-08ded03ac98b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8643
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
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[cesun102@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27FF26ADE53

Remove legacy MCMP1_* macros

Signed-off-by: Ce Sun <cesun102@amd.com>
---
 .../include/asic_reg/mp/mp_13_0_6_sh_mask.h   | 29 -------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_6_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_6_sh_mask.h
index 2684e396f548..9d237924a59c 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_6_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_6_sh_mask.h
@@ -670,33 +670,4 @@
 #define MP1_FIRMWARE_FLAGS__INTERRUPTS_ENABLED_MASK                                                           0x00000001L
 #define MP1_FIRMWARE_FLAGS__RESERVED_MASK                                                                     0xFFFFFFFEL
 
-//MCMP1_IPIDT0
-#define MCMP1_IPIDT0__InstanceIdLo__SHIFT                                                                     0x0
-#define MCMP1_IPIDT0__HardwareID__SHIFT                                                                       0x20
-#define MCMP1_IPIDT0__InstanceIdHi__SHIFT                                                                     0x2c
-#define MCMP1_IPIDT0__McaType__SHIFT                                                                          0x30
-
-#define MCMP1_IPIDT0__InstanceIdLo_MASK                                                                       0x00000000FFFFFFFFL
-#define MCMP1_IPIDT0__HardwareID_MASK                                                                         0x00000FFF00000000L
-#define MCMP1_IPIDT0__InstanceIdHi_MASK                                                                       0x0000F00000000000L
-#define MCMP1_IPIDT0__McaType_MASK                                                                            0xFFFF000000000000L
-
-//MCMP1_STATUST0
-#define MCMP1_STATUST0__ErrorCode__SHIFT                                                                      0x0
-#define MCMP1_STATUST0__ErrorCodeExt__SHIFT                                                                   0x10
-#define MCMP1_STATUST0__PCC__SHIFT                                                                            0x39
-#define MCMP1_STATUST0__UC__SHIFT                                                                             0x3d
-#define MCMP1_STATUST0__Val__SHIFT                                                                            0x3f
-
-#define MCMP1_STATUST0__ErrorCode_MASK                                                                        0x000000000000FFFFL
-#define MCMP1_STATUST0__ErrorCodeExt_MASK                                                                     0x00000000003F0000L
-#define MCMP1_STATUST0__PCC_MASK                                                                              0x0200000000000000L
-#define MCMP1_STATUST0__UC_MASK                                                                               0x2000000000000000L
-#define MCMP1_STATUST0__Val_MASK                                                                              0x8000000000000000L
-
-//MCMP1_MISC0T0
-#define MCMP1_MISC0T0__ErrCnt__SHIFT                                                                          0x20
-
-#define MCMP1_MISC0T0__ErrCnt_MASK                                                                            0x00000FFF00000000L
-
 #endif
-- 
2.34.1

