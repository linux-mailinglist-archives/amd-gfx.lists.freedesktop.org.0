Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +gGcJHCEIGpj4gAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 21:45:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BF263AF57
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 21:45:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=gWxAbr3L;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DC3112304;
	Wed,  3 Jun 2026 19:45:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012002.outbound.protection.outlook.com [52.101.53.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E719112304
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jun 2026 19:45:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRfbo8/IIvsViy4ABRyvwGbfQes/jMTe06EfzKMhHXIEEjKN9OH+I7Ajjb5xTB3aFbQeopM+y/bZTro7dE8pa4tK3uq/AbNQfQXsjIYwA+Atn8LeVy4RKg23UZISXeoB89F0SPcHTZA+E6h2Us1n4MoP12YzX2UdsPeBEFdXU/jjHdi1O8eXg6wa0CDiJsYVPosqlsofl4eOgMkebiQJRyugBFzosgU+fFhpSnjqG7o3IFNwnGhLlY6bnDHk4hj2r4NmbOd26vOyOf8XSj+2eVnP/dXPh+XmWGTQ6DV1ijwwk4taSjaO2ZO4JOTwCF0au3+B4dZgYWRcMe16NFNWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFj4fM27mIghEr2zKJ0bJ24aD2ld8ktPUKLVMx+nkr4=;
 b=YNbSh7hpoJDma57zuMDpGOv5NQMN1XeOT8HVwHfuRn6ogmMvAgfsl/ZjS0Noh2xnqIkCyfGVVAwnB2CU2P9uErozaIXpSFTX8eEb3A9E5gAKYCI8FIsUNmUGYIDeH7MOOUoovZn/Cngbj6IifgtjT6VS5FsGsqmK+8H45oDp/yPsqyZOWGrIe+MIuXeunnKSjxOiNo4l/iFcJpuIoaHZ6m+mtp3emP1FnRjXDu6Dm63Tupe70gSFozUvGl8wrlZYR6GR3VqGtRtr6l8g5KhoBVsRaUHkP+4g8Q80Hna73NkG6GCXfTQYCcPWOiIlKJB+GLx9vWq3v1An6ipYJFlrWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFj4fM27mIghEr2zKJ0bJ24aD2ld8ktPUKLVMx+nkr4=;
 b=gWxAbr3LSiJ0fPE5/zJ66Yb8sHFmfvoTQiuM1AZmLAEOKvG7mYcUIpYrYEVMd3yE6vXMhIeELH+sjL2XJPoh1sKdA+D6uNf7nL/wpmqKgQbz1JSngaNqHLQ6gWEpDSa8044G4oq2ODcBDLw+zHWPqyoJHDc30G2YS+tmPiNIL50=
Received: from SA1P222CA0059.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::11)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 3 Jun 2026
 19:45:46 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:2c1:cafe::64) by SA1P222CA0059.outlook.office365.com
 (2603:10b6:806:2c1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 19:45:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 19:45:45 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 14:45:43 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 3 Jun 2026 14:45:42 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>, <timur.kristof@gmail.com>,
 <christian.koenig@amd.com>
Subject: [PATCH] drm/amdgpu: always emit the job vm fence
Date: Wed, 3 Jun 2026 15:45:35 -0400
Message-ID: <20260603194535.2371150-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5a5234-bd16-4a45-280d-08dec1a8b42b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|56012099006|6133799003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: S3oYZpjmefZZMnW4uea4AjvrlM2V8igfSmESv0O9BoloQce3RAxd66/02oysxtasq0B68HySzHNVzfMAMp9CB71am7gF5o30JDDRjxWPLN8aQVkV2t3oTPJBdHSH8rZ6jQwF/38H/m+pXpyJ0yPTp325VPamYSUaX62jsyXQqdNZ8lUJDAccLxbWT1gOKWRoQxFDEp9CaEzsqrIsjIoghsQiRSF664YJyHgXCr+8lnQzrJ7DsnYE6lJQb678ptoQxaG2eUucvr3LtD8OXwLsrTneU4EPrBIUSL1GpZtn83uHJLMsueZQC0DlNtnraoAjZ3fEbhEOqJYJtPCo1WgnlJcKXToXItIM/8liTYt9RMVWvKIN8YwWANmQ5/oqicdFJa9OYaty+PWyaSvzyuNh/JEGC+IruxvELfkFyBO9//LsgzreL40eo9H+0EI8SUcZQ8CJbWOhw3rAMfxfsg8dVYad4WtEdmMA6C39kGvjhjYpvmGZAgnawHy0WMYMGdNKvFpe2z9WMpCy0OXSiStmO5VZWriexnr6F9LyEgB46gRRo7dT6ZxVKeFoV0i/qsIVO7JtkOCt6Hy+/zg8Ry5mAvxNjjF0EAMd2ldr3Z8oiOZvoeZAExk/PZofgfnfjXTQLTb0GLX4G0Oy0M4G8JGGUOQxqHbyWSI0/RcbwLXmDbA+5BH4Rv/XYiFxwY1ZQ70VdJ64fYWaQGb/in84+tWWrTnIlhV7mXXmdh0aAEzzFo4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099006)(6133799003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: F4rgDjt2CJOoT8wdgDX6XeCpbCoyU1H1b01Dy5lOWzG26oMNCHhOKQc5jM8o2mjOH+CX+aBMEY26kenXttUnDGHzpbBiL9tfIpg0VGHAXqdliSJEjipe/65RPiQJH+8zPYoUlsj3MlaRRnrew9AMto7wnj2w8Ulc/o9WeGBKmTzvG3lOGVskDFMs2SDIozcCSo4ICu/OPOtYxJTsHuhr4Pz5vK7n7VcGFczptVgSB2JZQwK1P/VqAgbCrRP/oqFkDRGwmkcXog+6CwE7clAXp6KG1EBG2Aw7blVtPZNkfEqGY86lEbMoW2X9s4JugqSLV1EbAVxA+cOpNf47AHXA8v+8gF6O+XSTbOaXb5q/54d6JkNtIw629tMu4dvdFMYv4BJpMnOAdSrry303xbaB7pZXzF7Dczmv6bFPibBIqACC7RweAcLkc7ofVxzfj6k4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:45:45.3921 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5a5234-bd16-4a45-280d-08dec1a8b42b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07BF263AF57

We need the fence to reemit the gds switch or spm update
after a queue reset.

Fixes: a17ef941212b ("drm/amdgpu: rework ring reset backup and reemit v9")
Cc: timur.kristof@gmail.com
Cc: christian.koenig@amd.com
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 2f3470208829e..7e0e2281719b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -853,12 +853,10 @@ void amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
 					    job->oa_size);
 	}
 
-	if (vm_flush_needed || pasid_mapping_needed || cleaner_shader_needed) {
-		amdgpu_fence_emit(ring, job->hw_vm_fence, 0);
-		fence = &job->hw_vm_fence->base;
-		/* get a ref for the job */
-		dma_fence_get(fence);
-	}
+	amdgpu_fence_emit(ring, job->hw_vm_fence, 0);
+	fence = &job->hw_vm_fence->base;
+	/* get a ref for the job */
+	dma_fence_get(fence);
 
 	if (vm_flush_needed) {
 		mutex_lock(&id_mgr->lock);
-- 
2.54.0

