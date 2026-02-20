Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOlTCKG0mGlzLAMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Feb 2026 20:23:13 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72A316A548
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Feb 2026 20:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2808D10E826;
	Fri, 20 Feb 2026 19:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3Fxhjnzs";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010044.outbound.protection.outlook.com [52.101.56.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E6F10E81F
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Feb 2026 19:23:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAd9ARoOySV32fDj4C/x5a7vpFYmegLY1p8klk4F3AmYSerDIeqdRYUMdC4m6y+7d307G7VPwNGT5dO4t/Ebzeb+WD6OFHYxVPJNqguoUT2DjYIm3ieffinAsmEkcxDB5S0mPdx/HRKlubuGFbp/Z2ukV+UGyHlIwY+JzDsNaEqXvmzIdoRs/OncquDN4LXe3MY/hOVkcZGYIhzOgYIdgrEVGdnDs1B4uAXN4Pgt0pYy3WxizLLSAVAtN3Cg2Xu0mW9qaL1O4uVRwlkzQ+zUaXfp+uAJg5HlGiEGIJR0FX93fHNXKDWnxCAzKutSvPoNHpnlg0WG4Edwq1ydl+2zQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kpz2G7pcGa8c8/2J9vsovBcP+Z6LRBXShb6aWnX47vg=;
 b=L5xYZ1Kj8Zk8mvEjxm/axrBH+VbZ2UTkAT7IBrMoE9NwR0HdFHT6WfLW4uZZfzkStFF/rNRviZ4Uu2EAgHgd3HHo7sdUPBf3evTrPHJe7rH3ndo2hL4W4/hDBJuSwEmuAZy8NjE3ntiduS+ShzCq4Q0DO7OJJxoOCmESSe1cP5G4B8CFoMJ61S5WDwj7KKNP97JtErC/TtRs/iOidSZIuJcUmPrt6KjwVzolehrcEiAdWxKDro/Z9gLIkudI/FhKPNvQSTfI95jyMP8W/y4qD4JtDxa1wzixwF8ngFiP8257wG0C7u77qdIQHrrNpocRIJuygJEx1/g/JhUqHNEeFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kpz2G7pcGa8c8/2J9vsovBcP+Z6LRBXShb6aWnX47vg=;
 b=3FxhjnzsVBVaTbiG8GyifyxTSczZE6QrJDtKL75yLI8UCFTFGya90RoJSvohMsmZU8tI/GRZxutNZuOuM5tWa2a/AxD5aBPMGcH544ML/GCjdg9EJjTYZieXyW5ES1KtLNeT/uGt+Y2ftrf+3NxUkXXqGjUk/wtjcWqd1M9mTAI=
Received: from PH1PEPF00013302.namprd07.prod.outlook.com (2603:10b6:518:1::11)
 by DS7PR12MB5791.namprd12.prod.outlook.com (2603:10b6:8:76::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 19:22:56 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2a01:111:f403:f910::2) by PH1PEPF00013302.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 19:22:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 19:22:56 +0000
Received: from work-495456.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Feb
 2026 13:22:52 -0600
From: James Zhu <James.Zhu@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <alexander.deucher@amd.com>
CC: <Bing.Ma@amd.com>, <jamesz@amd.com>
Subject: [PATCH 05/17] drm/amdgpu: add amdgpu_vm_alloc_gtt_mem and
 amdgpu_vm_free_gtt_mem
Date: Fri, 20 Feb 2026 14:22:24 -0500
Message-ID: <20260220192236.3121556-5-James.Zhu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220192236.3121556-1-James.Zhu@amd.com>
References: <20260220192236.3121556-1-James.Zhu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|DS7PR12MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: 8120eecf-7647-49a8-dcc6-08de70b5738c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p7Jztxe0gnsgqQkIfF28CTXxxsK7oFDSQnmgEwsng6zy/anj1yBNo7AA6E6n?=
 =?us-ascii?Q?zMq9OFXH++zKbkXdSWLeMOTaP3/mIkbPGt8VNZfaWiQd2QljWaX9egcw40OP?=
 =?us-ascii?Q?JSdC/LS9T8/cL7+cdQXnKE6kkPIoH0tE/mHunTHE3yuouAWexUeU6T1lHBoR?=
 =?us-ascii?Q?RO3y1uydYxjYV7rNXa0VAgH+kV3iaoqB3M9ZBruYIDuImE8z0MrC/M7tVT7R?=
 =?us-ascii?Q?DCSMYuE0RUoVcbLXtPdf3IVSWVV2Cdu9RIK2JXh8Z9lyeX4TXsFgl1ENwpCn?=
 =?us-ascii?Q?ux/ivol5Z09Fo686oxHGETkY+cE2bNo1tkdooBZl7RoZTyq3I3evKTrE/OB6?=
 =?us-ascii?Q?mKDM+aXMFTang+huBgawuJ88juuMBDEHkSKqvNXDcyZvUGSw2WEB9/Qqx1jl?=
 =?us-ascii?Q?RpBndikSJn0lKLX7glaj6KHUyTOeOdujXHovZbZXvOLvnBE2ccCLUMoqyEzH?=
 =?us-ascii?Q?M1EJM2kvKfwsUTj1F2D6c1dlfkJpQHuhUFi6xxJKnlE0fsGpOw1ZYycrlDYY?=
 =?us-ascii?Q?K0qvJPehhNri1BS5QBm7YBUUunYJ/yV0UdeHfmCHPLBEzVEH3TkHARDfzAWR?=
 =?us-ascii?Q?G3I3n5sbTtBUL3izOnAlZ41BuiSDBKUmomJUcTgBbGvqHEcBxEW+K/0nqV4c?=
 =?us-ascii?Q?esttENZMo+Q01r4gdbMipYdJHk9fGF02mJ3gnbw8+uHSyXNK3Jw3oQRkzkX/?=
 =?us-ascii?Q?fnXDVI2pxTnfbNW6/xPwLu4Vu2s1tUxy99Tss+7yXMuAYXpsymKzCkNmrMhl?=
 =?us-ascii?Q?Ye7BfopkPFXjV1yvLhcFfYiElYub8sij+Jl61Q5lFTW4/aAsIjWxpIp2yyCO?=
 =?us-ascii?Q?seLptosut2qq3fEFJoOaad6QR60gWRyI6RLPuSJqQhzajUCUo+ib3qMXkLvd?=
 =?us-ascii?Q?U22trVwqZSM8dD6wSIkBfAm1rXz+KMrvv5JkKjxK2G/ICg5K0L5M2inh3Fdt?=
 =?us-ascii?Q?17oN2GGLcExrVdkb5KUrGjlXctWfksan5970TW4PoFCWT3eMvoCszrqV7yVQ?=
 =?us-ascii?Q?8VLVMiBhgdwCrNhgzwxS+rF/PUJGgmGzORDPZwXkvNbziKh2VrW2LSgpSZhU?=
 =?us-ascii?Q?6lt7NpGw22D422fn2ezBcQCEsWi5EFNfBOL+dkmg7veEx+Pz2sT1vYR2FJgl?=
 =?us-ascii?Q?FdP0wWO49Ul8X5va4MnNcAtxAluob5wD8XEQx0R2pFJ0FvU/8t/0xnteIOy9?=
 =?us-ascii?Q?vGEH8QoVrpbRECxqddTLAxtpu2e0qXkGx3ePzlOC/jH5nV4CFIsH7EnUWIXN?=
 =?us-ascii?Q?B3ku/hzc181xKROK7rAU7TK0Mcr9KdGJZhIkefRkIPWiy8wBNpLtfIYGTOTW?=
 =?us-ascii?Q?FlQS+lZS1yP2Zjki0/lBAKEa2+/B9+VdhFYXqsvM+ceuCQeb5oTp18roo0sm?=
 =?us-ascii?Q?Gi0LCsRvIH/ON2x+zj9GLMrBZ3ERvZRMRcyQYGPlg7jH/sPsgUC3lPTB1Jvv?=
 =?us-ascii?Q?aAY51zwMzJ8+OTUbRKbHqixXou5LKrf5O40v78aYwEbVgjdcwuXMEVOcW3YH?=
 =?us-ascii?Q?LC5HisAATlRq1g0A+UKBCRQ9qOMFSv8fV06aUd5vPDuxURgg7qb47TNF5sVW?=
 =?us-ascii?Q?clodKrsgDO1YnrbQ6H5z9fqR9PCC2mgGayT7boZ5VnbPhI1HMPuNZbvHWByh?=
 =?us-ascii?Q?FRmePnvUBtJHRAQep/+YKbEcL5r5pjSyNC1a2iWArMNl16PQibSQ1a20TwmF?=
 =?us-ascii?Q?6GlHOw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vknpdIUnS7Qoqj3DBH+oTAqDH2lG94GkU/u1n9VNBowQecV81+2zAPa+4hV0ATLdoyRIFmEQxFgABEAPtqBXRw46v5/RFp1s5wOpdWpN2BsUqm/Fqvw9pzS6G8vCziLYHpOxqaC7tqIPvR6W/0lpGHkGQud61FRqsuWHAQnFXw/NF/Azie+8mQgOV1Vazae4jDtEKawTqUqme952MQf2gut6JVhxbHkAPIekgYfR94RF+hPvWDTDziJNjkaitckCkLLpMl8dpppY3jmzq9kGqxreBwWA3VJ1In9wpHt7DdBIyKCTCCj8BEJjZZh8ebFzq7cFeyR+Al9QqiFzcJ4jrjfDFK2ue6QGNwUdd9jl4sDjtTGtWITdhjhGwlTlq/7sasGTfyem96XusN4sIXz0hsXdyj3SY3Bh/Q/gj8Fk+Kb5gQeoPT1bY80gaX2/bfDn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 19:22:56.2316 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8120eecf-7647-49a8-dcc6-08de70b5738c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5791
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[James.Zhu@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C72A316A548
X-Rspamd-Action: no action

to support GTT memory allocation and free.

Signed-off-by: James Zhu <James.Zhu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 89 ++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h |  5 ++
 2 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 1fab953e9a03..4c05483e90d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3207,3 +3207,92 @@ void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
 		task_info->process_name, task_info->tgid,
 		task_info->task.comm, task_info->task.pid);
 }
+
+int amdgpu_vm_alloc_gtt_mem(struct amdgpu_device *adev, size_t size,
+				void **mem_obj, uint64_t *gpu_addr,
+				void **cpu_ptr, bool cp_mqd_gfx9, bool is_uswc_mode)
+{
+	struct amdgpu_bo *bo = NULL;
+	struct amdgpu_bo_param bp;
+	int r;
+	void *cpu_ptr_tmp = NULL;
+
+	memset(&bp, 0, sizeof(bp));
+	bp.size = size;
+	bp.byte_align = PAGE_SIZE;
+	bp.domain = AMDGPU_GEM_DOMAIN_GTT;
+	if (is_uswc_mode)
+		bp.flags = AMDGPU_GEM_CREATE_CPU_GTT_USWC;
+	else
+		bp.flags = 0;
+	bp.type = ttm_bo_type_kernel;
+	bp.resv = NULL;
+	bp.bo_ptr_size = sizeof(struct amdgpu_bo);
+
+	if (cp_mqd_gfx9)
+		bp.flags |= AMDGPU_GEM_CREATE_CP_MQD_GFX9;
+
+	r = amdgpu_bo_create(adev, &bp, &bo);
+	if (r) {
+		dev_err(adev->dev,
+			"failed to allocate BO for amdkfd (%d)\n", r);
+		return r;
+	}
+
+	/* map the buffer */
+	r = amdgpu_bo_reserve(bo, true);
+	if (r) {
+		dev_err(adev->dev, "(%d) failed to reserve bo for amdkfd\n", r);
+		goto allocate_mem_reserve_bo_failed;
+	}
+
+	r = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
+	if (r) {
+		dev_err(adev->dev, "(%d) failed to pin bo for amdkfd\n", r);
+		goto allocate_mem_pin_bo_failed;
+	}
+
+	r = amdgpu_ttm_alloc_gart(&bo->tbo);
+	if (r) {
+		dev_err(adev->dev, "%p bind failed\n", bo);
+		goto allocate_mem_kmap_bo_failed;
+	}
+
+	r = amdgpu_bo_kmap(bo, &cpu_ptr_tmp);
+	if (r) {
+		dev_err(adev->dev,
+			"(%d) failed to map bo to kernel for amdkfd\n", r);
+		goto allocate_mem_kmap_bo_failed;
+	}
+
+	*mem_obj = bo;
+	*gpu_addr = amdgpu_bo_gpu_offset(bo);
+	*cpu_ptr = cpu_ptr_tmp;
+
+	amdgpu_bo_unreserve(bo);
+
+	return 0;
+
+allocate_mem_kmap_bo_failed:
+	amdgpu_bo_unpin(bo);
+allocate_mem_pin_bo_failed:
+	amdgpu_bo_unreserve(bo);
+allocate_mem_reserve_bo_failed:
+	amdgpu_bo_unref(&bo);
+
+	return r;
+}
+
+void amdgpu_vm_free_gtt_mem(struct amdgpu_device *adev, void **mem_obj)
+{
+	struct amdgpu_bo **bo = (struct amdgpu_bo **) mem_obj;
+
+	if (!bo || !*bo)
+		return;
+
+	(void)amdgpu_bo_reserve(*bo, true);
+	amdgpu_bo_kunmap(*bo);
+	amdgpu_bo_unpin(*bo);
+	amdgpu_bo_unreserve(*bo);
+	amdgpu_bo_unref(bo);
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index fe9f759fdbe9..854cfaf0cd42 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -715,4 +715,9 @@ void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
 #define amdgpu_vm_bo_va_for_each_invalid_mapping(bo_va, mapping) \
 		list_for_each_entry(mapping, &(bo_va)->invalids, list)
 
+int amdgpu_vm_alloc_gtt_mem(struct amdgpu_device *adev, size_t size,
+				void **mem_obj, uint64_t *gpu_addr,
+				void **cpu_ptr, bool mqd_gfx9, bool is_uswc_mode);
+void amdgpu_vm_free_gtt_mem(struct amdgpu_device *adev, void **mem_obj);
+
 #endif
-- 
2.34.1

