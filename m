Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nKCLLhzIQ2rfhgoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jun 2026 15:43:56 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660196E4FB4
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jun 2026 15:43:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=pVw7cv3V;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B1910E9FC;
	Tue, 30 Jun 2026 13:43:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013019.outbound.protection.outlook.com
 [40.93.201.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F84910E9FC
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jun 2026 13:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCLYy/aJtz6mJjRtLC3O5bAVzp6jNO4lyjriiRmQ+DfMDJGp+nelEU6oYsWzHq0k3JwNKBZztm5QOscDd9LsqhAuafkNB6BwQeZYNLct4Grm2r/CUzNxfLBT9+OjqokuzkyODrQZ1pSOWi2QhJjFi+Wi73ZwYxAl7TnpednarDBbAkka+FqY8S3wvjze7Io6CU7iZ3H6b+vweUtX/ersmJpVJ7K4ZNY1k1c9UaZtRTUEb3zELlobYnP6dVono1GisECa5CgrC5p+/SB8yZepOXeLfCRi0RLf6mnbluqVNb6W3Hen1KxchO+Ban7zhqXlMUW5TWym6nxsaVNVbGTjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAUl3t+5GS52vVKz/vcF/pkwdsz++meJZP0Ov0NdHgc=;
 b=GDYg+bHvLFxTmuunJwFiwPOYMUKS8uAz7hR0azMiYDYOFvCZoYbcvArbGb85CjTb1zRLxt6Lbn/HcM1G5z3ok9z9k0IHrEyAnl5nHEczGUYOL4FKcTzvTPDMJc8FfGhMxVeY6LTxZs7EyDr+DmowvIW8c9atieiaAayk/r03AMvAyPROas47okhoD2+0tThHNw0KVIN9Msh64jP8BCZw2rDt94AfnlYt+JIYFyoQaL3JaocvzywYMxxY6Zzq5PpFQxMJK/PpifHYJZxfPyQD1b/Lpp1y0jf0Kf4gtX9c3CoihTNyrmJXQqb/EG7n9ACSTXFA2hnDphyaYUeP6WCugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAUl3t+5GS52vVKz/vcF/pkwdsz++meJZP0Ov0NdHgc=;
 b=pVw7cv3VXJ67Dpszi2fF/9C1VBu4kZjm4wUI/1aAHwx11uBKoHvPdTe1OqQFTuHKC8g2bNZ8r14cqILOUocGOJ+esfN9wMlJpKOxoryY4rWAkVN8q2jElW7JU8O+4pA3Y9f+Vr4nhXX/D2loWvT223MSSBDMJNV255/FcuT9wyo=
Received: from BL1PR13CA0242.namprd13.prod.outlook.com (2603:10b6:208:2ba::7)
 by CH0PR12MB8550.namprd12.prod.outlook.com (2603:10b6:610:192::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 13:43:44 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::6a) by BL1PR13CA0242.outlook.office365.com
 (2603:10b6:208:2ba::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 13:43:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 13:43:44 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Tue, 30 Jun 2026 08:43:42 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [RFC PATCH v2 2/4] drm/amdgpu: Register DRM PASID ownership
Date: Tue, 30 Jun 2026 19:13:22 +0530
Message-ID: <20260630134324.3118873-3-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630134324.3118873-1-srinivasan.shanmugam@amd.com>
References: <20260630134324.3118873-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|CH0PR12MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: ff854c82-0bb3-44a2-34af-08ded6ad9a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|56012099006|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: XKjcgpFI7W3Yx9TOxEBpzHH5KesSyTz4inZCIyKkwhz+nRhfySfOHkfT33iD3befN/ehvF64BH/4CnGi4+up9m3FRNHxU/p+mK/iJsK7p1S8No/2M0/lsu7hQHa1O5OSW67ilhydm5F2KWoSabCoevewMIbe0Yq2zuD1Kuy71HbyEMGQEACWFkQ9ptR60+2MNQCRH+isIlsYvtYLbqYeeLYQxbSCn5ciLFf++JJp4g7km0DHgDzmk03hLF33vLoqR0uX2f3Jg+GPWHSvmqmkFQwdfAcrTks/95v0IK0diJA7TXRNbqIjMlyWIvlNnPG3MI3M23IZWsB0MOqHVxL7Dppuu6rLInjF6JIi1aQWZdEvSRhVrcYDTWcGlWP9F/XAeQJ+hG7i0in4zxW7xeP3UEn2rH+z1TWyR0j2136SYXHkMbmDj3IJkst+a0+zLwH8JsQRN/zhs1/qxnRiEhljt6mPF6NwXw6AijuIePNCaa//CZnF0NHYmCGWHWWfYapL4/DDXcUOCHBhl3wuwST49r/X7g9W3UVkg3fNS3y9nZj309jn/h7mrXapdzvUzX+4mKbYVync6aaFlq2ck9f3RUwvb71Cw4XIcBEC2i3cUwxZxbdAalzyBWQQzu+6aKto1GJvk75KQaqFUrvTadZKZTvHHvP1ulZxZ5sQQ6+hwM0EpcKOEyu01qra7kQd9ZtPB+B6M+jwbDmRy5u101o5Hg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4lCEuWAAnu7Md+NrpPAW3c6CO4I+c5if1hkQQOL8M3X4LsnhM8RspScarBVXKLrOyd3HMSy3NcA2ZxO1ApwFOvSEpBAQblvytkuVLwPKKJELl8FUzy8lq+aQDCTjgO5mvoeLFL/r06RM9RsJjoCLFEyVmZnwilN3vofs1UPiIA+9Q5a+RwYwCqV3HJA0KojQ0wtGgqJP9HrCv8FvILvLqrPzDH9C38zmxffyPMs0KHtwnvvzB3EBbDoxADl8MVH4nBZw7DyTlujyFCvEdudekCanvrpoyGZQHmKLHCwT5YIUUHJ3bP27wZVdIoLBlyZZFFlb2HEBRQOl9YxdWyVVGAuvWUoqWcPy0zimfPBTV56P4XZrJYP43WTPHzv3hadDqgVAj29vlf6xUPKFkBWXJwOf2S8cPTFf3Dz887hKmUjzJ7bHkaVP49FvkyXib0ai
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:43:44.3618 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff854c82-0bb3-44a2-34af-08ded6ad9a91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8550
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 660196E4FB4

Store the DRM file-private owner in the global PASID xarray after DRM
file-private initialization.

This allows lookup users to resolve:

	PASID -> fpriv -> vm

Clear ownership before tearing down the VM.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index cacdc99b3ad6..44403f856c08 100644
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
@@ -1542,10 +1541,17 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 	amdgpu_evf_mgr_init(&fpriv->evf_mgr);
 	amdgpu_ctx_mgr_init(&fpriv->ctx_mgr, adev);
 
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
@@ -1600,6 +1606,10 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
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

