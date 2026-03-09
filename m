Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG8EGc/frmmoJgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Mar 2026 15:57:19 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE4C23B18C
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Mar 2026 15:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DA110E520;
	Mon,  9 Mar 2026 14:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RxXnrCGT";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011006.outbound.protection.outlook.com [52.101.52.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7092510E520
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Mar 2026 14:57:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOGYtvfrMwcQ7BHt/8hY59C0a7Is5iKpp5felMGGjiDofpEbExsMX6iBxBUkVVg7+Gp2ZtuCrf6rRL6F6viUXQJnhY2G2MnIpH7jCJUE/hHbGC9Md3xjXosdGQLtlOCKJGHCvRpxpVwxk8GED3h8W7cQkjx/cuaqOLYmxSt8wB/Im2nWQkogVVV8qjDtnZGZDacHen061zvhejFTGmjn9oHfNQUuZQYcCd94LKZVaZKZy0lTuRpDiGBXOKsMtzuIoVR77HbMcCGHgq0XXsIz1165YASeprM0hK3WCAti04sRd2ZDKEq5+T1wkeqmzkjXFQGyZGAyGrYBd1hsfkGiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BY1FJQkHK8k9DIIeRXtpaSfxDfzBgtA9+X+aeFVkkIU=;
 b=QlmWhqK86OGOrP+N0WOmS23kI4Ds5AfW9G8fMjBQIy9Wz0CgElaAdBQAoU2aRLW+8pHNRDf2tcvWqeLr+6JEJE4JKH5bnB9Oi9DPf3TE8UDxx7yQqt5mnZlP1ZfclPoq+HtdGMyflm1KwUNZVymVdBngn4RowGJFvHsQoJ5fHphq5QxjtZ/oVM0MpVEaY+/FW0KuWs02mwjJvnKcGQFKighSCNaKSo3qKDYolSmZkqaW8jZkh6U+EPTpZxlesernW3MWaKxbzn/a14pzgmTrMku9jZ8B8ARpg4dxpHw6c6wcMl26ogaUhmnxVLdK4acGfvxjOctVuSi8GVK6iOc29A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BY1FJQkHK8k9DIIeRXtpaSfxDfzBgtA9+X+aeFVkkIU=;
 b=RxXnrCGTM8yTu5DErYK+BQX1ooL3CULVldM2kNqz8kcoE9GzU7xykVDupHvjTKMLX1yiM1x9GI9LwA0zg/lDZ9Pjlrm5juUXdu/hy2VIc8klEgbtbsqi+b4kdDX7vtxCasvU6vKEHPgZWlgGfUbZQ2rzFKX5FAh0cykZyrR2I+c=
Received: from SJ0PR03CA0372.namprd03.prod.outlook.com (2603:10b6:a03:3a1::17)
 by SJ2PR12MB8781.namprd12.prod.outlook.com (2603:10b6:a03:4d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 14:57:11 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::ab) by SJ0PR03CA0372.outlook.office365.com
 (2603:10b6:a03:3a1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 14:57:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 14:57:09 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Mar
 2026 09:56:49 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 9 Mar 2026 09:56:48 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Hawking Zhang <Hawking.Zhang@amd.com>, Le Ma <le.ma@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
Subject: [PATCH] drm/amdgpu/gmc12: Fix VRAM base offset calculation
Date: Mon, 9 Mar 2026 10:56:25 -0400
Message-ID: <20260309145629.2844495-15-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309145629.2844495-1-alexander.deucher@amd.com>
References: <20260309145629.2844495-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|SJ2PR12MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f4d3e3f-cc97-498e-8f9c-08de7dec23d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|376014; 
X-Microsoft-Antispam-Message-Info: tSZX6Wra7jgeba/7Axzg4GC725od9zRSX94tngI4nJNXEaeNmxvHjBExflSDs4jNry5zwMaoaZWUcXnwMQaeQQcFx+bEWtOGIr4MYRHBBhj0P+YnOMOawOpRUBPtnhH0Hsa7JgcMoEkQlcI2UtrXMlLl6h93mO7DUinOJh60QtnEgLDqrbLYNbJL50heKAtnLvUFsEuEeGKsl4+OBBIJlHucLZcAeFaAzZAxhJDDyH5+3eOFNg9qPjQPW+2Jopnkp67eeoBAtkmqgAj/YWct3jLOHEChx7F4wxOcW8Ox+8PEaur6+5WWUjF2a18UyC+zAOXP0cbda74e21WPGtwsFyoRW5JDj7ebLzut6dOwn5Ent55+LPJm+gne4MZDwhfesZMeRz4rNrGN0A/tVdzRFJoNry+wtNcuf48+KYApqSXePidermCQbJMaKL0uBGQhMjDFGeGn1Q4aqMq0MncfVePWVAvxqpxPAJF2HuXKCs7j+q+JT87y27fctH3rrvJ9bn6dYltSudLTBsPSdKoQRgBCJR3ey7dLMzUIXiEuDwFoMPJhg7m9jZdu+yj1Lgk0vmF3FAmwahwgLjCRZ/jeAyId8KWSd085XNjNwMYYnbx9o/hjQfMf2LUIRnGhPuNZRJoVr7JBuKe7jTb6nUp6RL477TQ6o89U6SSbZviZIgT5PoN9KePSTXRyGBgHGxMSeEC8jwIp1UAuXk3UJWDVgQxaPafbLcwV8NZyyIO0jMxDUMRYZauSCsXxXbqJmlQnUjBuVwM8L79LmjNeb1OQ6g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wd/G/QCQIO+meVtkoEfQm0kdAaz3hdAOQceafCl8mkgYlBI3o9JSAnGPraqR7JqXS+ECwc1eDU8MynsC1k55+LFN9i82qbfYLFWUFuGFq8kxBu5tWjUXIiSagyT+oUXNH/aAw8rUdseq0ZcsWoryh3Pg4FD8nMmAERIA8pEWg8MgUOdf72Odqtw7GOrDa/tpNJDf2kpV+I+mluewySgKeNTmOKq458raVqJGOVbjw7ipgS+Wen2IgyhpUmr6M7mvcXG4VXxzY9CW2VL/IVp0euQUX6KRz+bu0JjBXdLvNMyzvdrPhjZrJAycQx6RVwcpLGsrPZXt5Y1Nv6p8mXQQS7ubzsUU3jBX3JFRSnb9NrPe3OmviwnHzDhE7V6N8Ao2Y2U29dDE7HE5YE+C+NnmsJV+v8RvfEgdx4ItkiucaKLToGZ9RMXdFEHp0o4gUDsl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:57:09.9120 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4d3e3f-cc97-498e-8f9c-08de7dec23d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8781
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
X-Rspamd-Queue-Id: DBE4C23B18C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Hawking Zhang <Hawking.Zhang@amd.com>

Include segment size when calculating vram base offset

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Le Ma <le.ma@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
index 0e47268100ff9..75bff46ca5946 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -709,6 +709,9 @@ static void gmc_v12_0_vram_gtt_location(struct amdgpu_device *adev,
 		adev->vm_manager.vram_base_offset = 0;
 	else
 		adev->vm_manager.vram_base_offset = adev->mmhub.funcs->get_mc_fb_offset(adev);
+
+	adev->vm_manager.vram_base_offset +=
+		adev->gmc.xgmi.physical_node_id * adev->gmc.xgmi.node_segment_size;
 }
 
 /**
-- 
2.53.0

