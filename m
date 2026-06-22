Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4JXABHS9OGp4hQcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 06:43:32 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7EE6AC9B6
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 06:43:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Q8W0QJAd;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF5910E48F;
	Mon, 22 Jun 2026 04:43:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012035.outbound.protection.outlook.com [40.107.209.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C1F10E48B
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 04:43:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AThKRsF0h5Dp+36WYQm1G0aasIZVaDaAzh7Of7jDRKKpRuSCW9n3PTtTSOckgWUHiVTnrXsEvcjPXP3W8hhZyyk/iAgjXmRVU8NJdctp6lFvf0VOVZHs00b5A9x8mqOvnf80scY/tEmy3/z6OGkdRQsmA9WO4V2BqXiKmHYSgfCapqWAs4gOYGEpQbkDYkicYbXMzmJcch4BVmYPi3qGo7AKMjYC7qgFNTCpL+Mr2hoqb4WdCOqXquv+0ApmxtA3tFYLiiGFgZC1MVcDrQKUEFOOeF8YUtSmJMGaJqLLHtr9WgSYb6VrlzKtnzYkiyZHXtkhEyUpVYgIbI33pqoAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGGyN7zPQGpEAyqBUpPqeNT3gxnyrSqUOxQtBSvQn+g=;
 b=AV1naAEzqxCvYwH3FgrVHXK9W+S4yVKADqmmOKLcankzFVbXRdX5c8oKURwuQtQdhcJKroXZNkYE0p/p5KLjFXhj9DMU/DMCj1CVwEpkvov6UV8VWSepHyiA3XrjD90NiKaer+4zEHKu8bD1//dT88rk+7bz22eVhYN7WKPe8bp2jKDpfvdLituXAEFkbgc56YVZH5n20lajGV3drQ4EU3h2E+QTDIxJ27qSACJOiaUGoNKfSya2UyuNnNDQ01/fV0OKrim2uE9D2eJYj7Sm/UmKX6yUXPOTwACoteEdrTofAZ2wvfnlIFX1KpqYrYvcGdNLXKZ6ZqNz7Nsly7meWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGGyN7zPQGpEAyqBUpPqeNT3gxnyrSqUOxQtBSvQn+g=;
 b=Q8W0QJAdmMvacJRThVvAKW65rKP4YicHbkkxpnwnJvu+uYTqgwBk12UZ/bGgI+h+Pg09n/4TbkH5XOft3oL0z9/JhlAPg7apdKlBghXb6p4+sfW7z6fYObZBMYPOKU/kPstWcbY2RloR4YubWFu8b1rIoxOZ03A/OU+lex+NoPA=
Received: from MN2PR08CA0014.namprd08.prod.outlook.com (2603:10b6:208:239::19)
 by DS7PR12MB6070.namprd12.prod.outlook.com (2603:10b6:8:9e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 04:43:21 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::8c) by MN2PR08CA0014.outlook.office365.com
 (2603:10b6:208:239::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.19 via Frontend Transport; Mon,
 22 Jun 2026 04:43:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 04:43:21 +0000
Received: from sunce-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 21 Jun
 2026 23:43:19 -0500
From: Ce Sun <cesun102@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <YiPeng.Chai@amd.com>, <Tao.Zhou1@amd.com>, "Ce
 Sun" <cesun102@amd.com>
Subject: [PATCH v1 43/48] drm/amdgpu: retire legacy mca umc status check
 interface
Date: Mon, 22 Jun 2026 12:40:32 +0800
Message-ID: <1cc172b9ceb555d81bc0858bb60a0e38208a2300.1782103074.git.cesun102@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1782103073.git.cesun102@amd.com>
References: <cover.1782103073.git.cesun102@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|DS7PR12MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ad8859-0297-4687-3a15-08ded018c988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: a2PKAClAjrqyiVpVMzzflOjDmJKHkRPSI3fXiECEGe6SK6dSiiti4NFRaofHsx1yLH3RIYuwZY+uGB9/BJvmAOUp5hAWcCOn+IYyllrqhkKjt0kD9wxfz/zGEL7Bdod8QeGmLKGwjp4HxalkgeYataqgIV6UjBLKgRGDQtDVXFDTPLIz0PZGM0OmXs00qm+u0AoU7OfLwoEDGdyARHnpw2GM3jdHc48dHPQ7rYnL2UbHTyNll3AU/96VYt3J/m6wo2HqOONMkINarzSOdcAvZ7fgVM01VzFMl2rG9tNfuSqrGhEELNgJRYye6mB2organKTE8XejJ3lWAjZLqTPlpZWVe3OTwCU56wkDCNhjmGGNf3T6JR6brzJeFSRJN3a6SCXl4j78xm3qOWFQ3dQcq05zOxhPAXvzGPpz4Td8WyUGmZgMw7AGqg6kmq0X2ZKuDqVtmyLOrx4c9vj8w0oA98ZfpXo9LWvJOdeogl/9NfQQUHxoahyAGRsoBBPpumthYuGd+WKu+thTJoYVuqoXnLFGt8U/XkSQVnHL9DHS4c0FVTP5tUGpWlP7CH2z0F/HTjqA96v0IJokTHDrmv3sLjuUobFymr/wBNi676Vix7D+QaGf8+CP2KP6gOR3lZlSufdrN50n0uC6jsWIDcRuWsFz15lbkGdgg0gvWPRuBbHLLm+ydC3fR7+G59Omp7MKfmoUtCQrZfhGpJDuqZRuHg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nG/BD8KRQlkhuUPqdK3MKw3EUI12ElZvRWnVrNHL4Ohi0cTZeFyCb3PrHUvFKMAvWRJPrl1vkZg57FT76uAXpcTZT85HsibtpR5tL4hiuVy0QcBCPo3QC5SkCFFzBA52qzy2nwWkB3gwZopbsHHTqRLt7nT3gX/mYO7LQngKa5ATns9ghjrFRDUg7g5lUS2AKKA7TS1NccSeKcRVV9h31hokjVftiZ3GmWRivrbyc9bs4ljbSai3HpDWRFw64/BXPDlY8xF4MX6hLU0ERQQeYkxpjISUr8gGeXWRuW/hWCMK0DwyG8R9BeW98Z04rNeXdohQbi315qTa6wpq7q+fl8EZjo2/WmXqf9ZpzKRYV1OfXVff7xQSr5alaYtQ5AAJHHKwBy5MzBtfuCNbNT4RjTQR6jedUk+HI/PrnSrTfQGPhIn+iVi7rk9/Rq1rbC3P
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 04:43:21.1708 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ad8859-0297-4687-3a15-08ded018c988
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6070
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[cesun102@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF7EE6AC9B6

Remove the legacy interface to check mca umc status

Signed-off-by: Ce Sun <cesun102@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h |  3 ---
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c  | 20 --------------------
 3 files changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h
index 6d12f8a516d5..8ad47c5ab022 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h
@@ -26,7 +26,6 @@
 enum amdgpu_mca_error_type {
 	AMDGPU_MCA_ERROR_TYPE_UE = 0,
 	AMDGPU_MCA_ERROR_TYPE_CE,
-	AMDGPU_MCA_ERROR_TYPE_DE,
 };
 
 struct amdgpu_mca_ras_block {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h
index cf06d5f856f9..46c42997d314 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h
@@ -21,7 +21,6 @@
 #ifndef __AMDGPU_UMC_H__
 #define __AMDGPU_UMC_H__
 #include "amdgpu_ras.h"
-#include "amdgpu_mca.h"
 /*
  * (addr / 256) * 4096, the higher 26 bits in ErrorAddr
  * is the index of 4KB block
@@ -101,8 +100,6 @@ struct amdgpu_umc_ras {
 				      void *ras_error_status);
 	void (*ecc_info_query_ras_error_address)(struct amdgpu_device *adev,
 					void *ras_error_status);
-	bool (*check_ecc_err_status)(struct amdgpu_device *adev,
-			enum amdgpu_mca_error_type type, void *ras_error_status);
 	void (*get_retire_flip_bits)(struct amdgpu_device *adev);
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/umc_v12_0.c
index 67bdf7303e6b..d62712324940 100644
--- a/drivers/gpu/drm/amd/amdgpu/umc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/umc_v12_0.c
@@ -178,30 +178,10 @@ static void umc_v12_0_get_retire_flip_bits(struct amdgpu_device *adev)
 	adev->umc.retire_unit = 0x1 << flip_bits->bit_num;
 }
 
-static bool umc_v12_0_check_ecc_err_status(struct amdgpu_device *adev,
-			enum amdgpu_mca_error_type type, void *ras_error_status)
-{
-	uint64_t mc_umc_status = *(uint64_t *)ras_error_status;
-
-	switch (type) {
-	case AMDGPU_MCA_ERROR_TYPE_UE:
-		return umc_v12_0_is_uncorrectable_error(adev, mc_umc_status);
-	case AMDGPU_MCA_ERROR_TYPE_CE:
-		return umc_v12_0_is_correctable_error(adev, mc_umc_status);
-	case AMDGPU_MCA_ERROR_TYPE_DE:
-		return umc_v12_0_is_deferred_error(adev, mc_umc_status);
-	default:
-		return false;
-	}
-
-	return false;
-}
-
 struct amdgpu_umc_ras umc_v12_0_ras = {
 	.ras_block = {
 		.hw_ops = NULL,
 	},
-	.check_ecc_err_status = umc_v12_0_check_ecc_err_status,
 	.get_retire_flip_bits = umc_v12_0_get_retire_flip_bits,
 };
 
-- 
2.34.1

