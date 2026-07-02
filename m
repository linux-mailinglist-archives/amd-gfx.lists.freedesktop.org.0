Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XkbFARkkRmqKKgsAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 02 Jul 2026 10:40:57 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49BA6F4E4E
	for <lists+amd-gfx@lfdr.de>; Thu, 02 Jul 2026 10:40:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=uLRxrqns;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3934610F248;
	Thu,  2 Jul 2026 08:40:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013065.outbound.protection.outlook.com
 [40.107.201.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1F810F247
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 Jul 2026 08:40:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjAq/U9eLcqiM5PmFgR+rXEFUjmXE3Audo8EqUzBOUkMeqaoT2Hurv2Zv/Y79Ma1u7zbVLPOFkQae7uanVCgHgPSOdpIcrc2lUOfmr+7h0fXUxe718mu6gVrH7DcK9TWWU1ekX3+MsLRh+c5aIzTnjgkXvvK7PYervUWInaMSuc3Sl7RmoaouOZwQ16WJQedqa9BIJ0tDV4lvkh9ymFm8k0m9T4sKvsVQ9+zxr0JMM1Sie1c3c68kzh53eAk83f8ZtA+jL68zh5NnftjldVELjuA69kQkZklPZiJYW4rSLMHwYmtZvLLmURz8Jv1YOwsiKi8doEbh6kZWUwWcxocVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TW9GcE19qzRELcWe9XSw1lWyXf9gBKmuKyca80R0lDE=;
 b=A5RvhAGOQ6Jy72R96naOcFtONcligyygG3WIW3X7NGuTOtIQZX4R185jVkHJwIqOTZ+5wIwnjAbYY83iNIge1l+Iaenciq/ggSFoCbS+XdtZECfvaAQacf3QmflwZ+2TLGJzEDRoKxDlUyROSP1jonl7ikcCyl0UMDHBzr2qQYhbRr2l4Re/lAS8T2Ix71KjSrzpPHtOz5rf2eKpfS3Wwv8XtddKp8zRQCjyN3ndbBDLpljLaptEswwyQNo4B6nKVbssss+zQs9lxYkrrS4OLazHvLGq3v8+449vvqZUyTHaE2K9F5dz66UG2g+Ood4yMac9z4KAkjG8EzOZ0h0uBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TW9GcE19qzRELcWe9XSw1lWyXf9gBKmuKyca80R0lDE=;
 b=uLRxrqnsh4NCR8TU5otesxaVQbhNEOyshVgxvtpP9S7Ju8tdDCcHEejJA0NXkYywwt8xRorOxXf+nd0RLjiAPY5uTLVBcGgxBvdQpD62MiUMHilKiY0CIAdHPq5e/TAFYmbzBws9tjO+CjZSD686n8k8IVSmPb4NQh39pFiQOn4=
Received: from BN1PR10CA0008.namprd10.prod.outlook.com (2603:10b6:408:e0::13)
 by IA0PR12MB8863.namprd12.prod.outlook.com (2603:10b6:208:488::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 08:40:47 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:e0:cafe::38) by BN1PR10CA0008.outlook.office365.com
 (2603:10b6:408:e0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 08:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 08:40:46 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Thu, 2 Jul 2026 03:40:45 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v3 2/4] drm/amdgpu: Register DRM PASID ownership
Date: Thu, 2 Jul 2026 14:10:19 +0530
Message-ID: <20260702084021.3140071-3-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702084021.3140071-1-srinivasan.shanmugam@amd.com>
References: <20260702084021.3140071-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|IA0PR12MB8863:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d3dd3b-f457-4b74-a412-08ded8159cc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JT/j1epPFQdI226vWyt/QoR6foDF1uJTFW4SfGJkliSiuwwjd4MK46DCfbFIvj4DZZodriCUvsCtcoPhq5NR7Y//Naxg6qIAe8RsGwLq1mePgfvYk0u7L215piJ0vO5J+ZXxb1FOhzRucP37hWQFqBobcVvPhoxt6tQ4pZJOiFxh+os8NWqcSvjY7EQ4S442LY+a0BrBpoSOTS/cLX8muw3wcmk8qHLYwLKPmclNi3+kI8wmX2DFR47RuvAkzmR6hrf4VgLHBnk6OQrXZY3GdgNdf+Sg6hUkZOU/cZhLEgwNRAjSbQyY0UlBFI8MlvW3KdP8byvqjxqlhCaAk2EbQG+Ql+4O0HS6NJ2gYyFb0p2qzQTAR7cK9n0cAPoFACQRcXseO0L3qlC4Mm7ZcfmBLUZ+xMTHu57TYwxkx9Qc/29flWrrUdj6AAKhLlBx/8QxXhXnfjtal7dfMT/VLm5fuDI4waWHg2HghKY641eiKiBFpfKq0YcAYb7whmf7DTF0XMUOLIxzs1yQjND//LWKhumk9S+YkDqUqXaJX39wOzaTYedKxbfwT4PulhNzZl4toMxFGCIGzFNmgBmk9v4yCxhNAN4LtbA2jGRBsXwy146h3Jm8pG6fJt7twdM28yRakdjf2romLXQVNr+5bjrOEIX38aSM7zUQhnE4bRwAS6Kzwe77A+DCkkNltdM/gu8c4MH32mAi14gOjYoDskg8Zw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Wv0GxcHRUxPjsez7Pk8ujiSmcjGF0I0Nu7i4oj2bFQ+WGjKoY+GpJVmUZyZ2gdqeoxiB6/btOSfrCKW1PE397mrVtgYWzp9gXYDD7rPkeyny6zf12UFmSE0Lhk3HU6WofPSJGhQ+A8GB+3ugaFkGErWfLwomva2q5PcwspOB8qG9BjhII+ULkWz75o+BjdeLFSsjdejdJORm1YlyUq4oWO48dmKiEaD7dKjCRQY1lqVcsewHjEGo95yCA2QvI6bd+A7vj1QXQlV/68tXj8yIrxdRBbs2yJiXVCMip4be991L/P/G+JeODx3FosSFIut33T/Se/mL7AK25gkFJDHY/yQXHclIS/t4ySFnfiDZMltBbicZbwmbpc2TO7quTmFRBIgWSdtRpID6qfRwBmttMl3BWcr3Fz6od0enBnKNtttkjrEaaEpR6CtT0ZJjGv+k
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 08:40:46.8930 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d3dd3b-f457-4b74-a412-08ded8159cc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8863
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:srinivasan.shanmugam@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A49BA6F4E4E

Store the DRM file-private owner in the global PASID xarray after DRM
file-private initialization.

This allows lookup users to resolve:

	PASID -> fpriv -> vm

Clear ownership before tearing down the VM.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index cacdc99b3ad6..7f4727bdb6e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1469,7 +1469,6 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 	/* Ensure IB tests are run on ring */
 	flush_delayed_work(&adev->delayed_init_work);
 
-
 	if (amdgpu_ras_intr_triggered()) {
 		DRM_ERROR("RAS Intr triggered, device disabled!!");
 		return -EHWPOISON;
@@ -1522,7 +1521,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 		uint64_t csa_addr = amdgpu_csa_vaddr(adev) & AMDGPU_GMC_HOLE_MASK;
 
 		r = amdgpu_map_static_csa(adev, &fpriv->vm, adev->virt.csa_obj,
-						&fpriv->csa_va, csa_addr, AMDGPU_CSA_SIZE);
+					   &fpriv->csa_va, csa_addr, AMDGPU_CSA_SIZE);
 		if (r)
 			goto error_vm;
 	}
@@ -1542,10 +1541,20 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 	amdgpu_evf_mgr_init(&fpriv->evf_mgr);
 	amdgpu_ctx_mgr_init(&fpriv->ctx_mgr, adev);
 
+	/*
+	 * Register PASID ownership after fpriv has been fully initialized.
+	 */
+	r = amdgpu_pasid_set_fpriv(fpriv->vm.pasid, fpriv);
+	if (r)
+		goto error_vm;
+
 	file_priv->driver_priv = fpriv;
 	goto out_suspend;
 
 error_vm:
+	if (fpriv->vm.pasid)
+		amdgpu_pasid_clear_fpriv(fpriv->vm.pasid, fpriv);
+
 	amdgpu_vm_fini(adev, &fpriv->vm);
 
 error_pasid:
@@ -1600,6 +1609,10 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
 	amdgpu_seq64_unmap(adev, fpriv);
 
 	pasid = fpriv->vm.pasid;
+
+	if (pasid)
+		amdgpu_pasid_clear_fpriv(pasid, fpriv);
+
 	pd = amdgpu_bo_ref(fpriv->vm.root.bo);
 	if (!WARN_ON(amdgpu_bo_reserve(pd, true))) {
 		amdgpu_vm_bo_del(adev, fpriv->prt_va);
-- 
2.34.1

