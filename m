Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLKhKiQw1WmU2AcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Apr 2026 18:26:12 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E982F3B1D11
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Apr 2026 18:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8011B10E3B9;
	Tue,  7 Apr 2026 16:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pTrl3Zeo";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012044.outbound.protection.outlook.com [52.101.43.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E8510E3B9
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Apr 2026 16:26:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQWKm2anZiAZ7knOX9bXBTBRsh7PMtmA6lcObvJwzOz4eO6dFYOilxJLRmH1SooIW9hPXk5b6jz9bEy3dBxP+aiS6Qro/ekBPHeR9nBZAp2K7n7+dhzfEswNeqT+LBKrBg381iV1KbVxD3JjX0rdvD0zEaNTGCBJ5/XVDxsizmaXAZ7Pr/1GLDWFd1xEdHa5ihs5/wgVmr1LBaBPn4qezjT0ocaJTKMsMVmgZJ7h5RAlZ8vXzNWmktR2JkivjQa1Uvfahre1SQrmMkt51ggC9Yc20j8c6SJ5oCNyA4BzwRyOkjpKaICWbFpi1Yo/U9el/bjVavlfbRb9ulPj0WYppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Bzqa9WorYxNjkHJcKdMpTSj+9ImTvpPOp+XIoc3ve8=;
 b=dUiUAE4pzJc2k6IEl+avQCOD9VdGwri7PtCkOQMWpAP9O13sQS+bH/NXjJkZVjKx3W3i0IR8enmSq5bD7PvyLU0YQVvPPAnk23bDUGaaby8SEMM74kO6IShTKv+5JcHFaijuiWuVE9rO/RUbtDg0GbPA+rT5lsalyNSkXFBgUvQMTfpxrCRRhhI9nRuXZfN49EJw2X9kyKDKBmf7YvmI1+8JDLS5m3JU9S+iGyF6Ia/gsvWkfjp0mAFsYVV7xm85k8+lJvHqt/tupMAJufB8K4MiJBJqlCWoQJ3SLpj/dq0mtspkOjDBFp1vZFDIehRkUf8Q4Zm5jS7TfEwwN2YnDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Bzqa9WorYxNjkHJcKdMpTSj+9ImTvpPOp+XIoc3ve8=;
 b=pTrl3ZeoIhi6wqSbV42ISjGYZ0uq3NqxrnGWYiy/Su1r26YaIRMwUoB6DugdFyTUxPJEGw4POof7jmJghJzLr/CoJNZQKe8TlJiR+tXCBZ5kKi4tusAQg2RSM44F8LycC2vUXZ4T6toE20CeXD5B2jk7d/S8A76pVvh4NAqbHV8=
Received: from MN2PR22CA0028.namprd22.prod.outlook.com (2603:10b6:208:238::33)
 by CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 16:26:02 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:238:cafe::8c) by MN2PR22CA0028.outlook.office365.com
 (2603:10b6:208:238::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 16:25:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 16:26:02 +0000
Received: from MKM-D1-FRANKSU9.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Apr
 2026 11:26:01 -0500
From: Chenglei Xie <Chenglei.Xie@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Lijo.Lazar@amd.com>, <Felix.Kuehling@amd.com>,
 <Alexander.Deucher@amd.com>, <Chenglei.Xie@amd.com>, <jeffrey.chan@amd.com>,
 <zhigang.luo@amd.com>, <Christian.Koenig@amd.com>,
 <Harish.Kasiviswanathan@amd.com>, <Victor.Zhao@amd.com>,
 <David.YatSin@amd.com>, <Lokesh.Dhinakararam@amd.com>
Subject: [[PATCH v6]] drm/amdgpu: gate VM CPU HDP flush on reset lock;
 force-complete KIQ before VF reset
Date: Tue, 7 Apr 2026 12:25:55 -0400
Message-ID: <20260407162555.65833-1-Chenglei.Xie@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: 27f32e08-f9ae-4a89-8eb7-08de94c25c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: U1YQU5TKk8MmtwvbuNbsysKr6nP9sf4xtogDboqHTjzGtty59wCxn8LwdJXdwJfYtcgxgLBlzNchj/XKqaptnY0bFC0VlgbRcdhmxCiBZne9rxBbGUAbzie1v+ZogE5PSn8JJIA+26Ra5HMdlHiIDCg/EIKgCssn3PBdXhjQmPR1VzYsz2nQK7TognjEZOapkON5GMl7bETumRPgz0geyY17tg+WM5+KGWh+ItDFX1SZY/E47rT/SPGhXegYanLlD1gogvtTe9oP2IJXfp6/vh3RbJYWOpuVFLVQjG6TEBzLrjLyTovrywVDyFaFxNJ5riH/bpOeTqz1JlqaJGB4OdYtBOXEinXGf0XZvBxb4VU8tkDHHcxZ4TpxRPu6oCgIp8EeypseIdFEnl9B664swA0fMaeQrMl2z+1smPKXFiVJEqVBw2jfKhdIsRh28NMyeSl3zY919OGZBpo6yPhQBEiDX1MK5nFw7VSrnRmb4934whtSbDZIzuRWDmd/epXKLp5fKqiUbhoZ2xtzPzSY7C1tDjNFOrxfTR2lc2NsXHTKXdr/Gs3ghoAEA8cRfrkbs33TOM6G1SJP6veMxrF9kMSFOet4v2VKieNz6GhMhWY9luukaQk5z/m7hx9dFyzh7lOTWFQ49Xwk44H9lmx0AYRAldN7lW3a1TN5/3YR/KMlc6X2yk1313eLjteSjTVCo8i7hivpcUV9fkyzg6rQQS6CKHcZ7x7sRWcCANqAnfgQ6QCthb4OZ+dbe5D5qLFtfyOx8Q/hWVUuZF3IUMYRJw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6AItDAYMgj3lGVZSslta3x/dZGdVY+JDEQrUwB5aytTs24QsGLPRwnvo3iTHGEhtJZBOT99oRRmrjymz36aidbMY0TaHXuduYJuQJHro7kSkbcyrLJlBxU6sCHAwCqMSKX1vKZ2Km+BkjzHv79+Jwwa0zg1oHg+m3MekKJavTUpBMgFBWGtI8GkKgZf5dAYuBhu2Ztkx9TKECipcSk2ItbQeGKQeeW9d116Ejyzp5VEcji8EvegPt/oQ8zOazFYbRT8fh+sqPTcp5iYDZI4+KroYOCOraV+9jkDbKitKEcl8yvw/S2PaqoX0iDoG0oFwKIjG6xjn8JdUDJjJMHVbKfFn/cQs58yFhbPcSl2GgCyLfCYfWznGeZVEk7K35yWf/Mk9EvaKJ/Q947Bi2booe8MW3eOzKSAC2xEMkfazo1C8VsoUeNiqGi6RGHvY71vC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 16:26:02.1499 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f32e08-f9ae-4a89-8eb7-08de94c25c0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
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
	TO_DN_NONE(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[Chenglei.Xie@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: E982F3B1D11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During GPU reset, the application could still run CPU page table updates. Each commit called
amdgpu_device_flush_hdp(), which on SR-IOV sends work through the KIQ ring.
That can advance sync_seq while the GPU is being reset,
leaving fence writeback out of sync and causing amdgpu_fence_emit_polling()
to time out on later KIQ use.

Fix:
amdgpu_vm_cpu_commit():
  Take reset_domain->sem with down_read_trylock() before amdgpu_device_flush_hdp().
  If the reset path holds the write lock, skip the HDP flush so no HDP-related HW
  access (including KIQ) runs during reset; state is re-established after reset.

amdgpu_virt_pre_reset():
  After stopping the data exchange thread and setting MP1 FLR state, call
  amdgpu_fence_driver_force_completion() on each initialized KIQ ring so pending
  fences are signalled and writeback is aligned before reset proceeds.

Signed-off-by: Chenglei Xie <Chenglei.Xie@amd.com>
Change-Id: I938bce0cab93a794dbdb02fe3ca9e041f9ac1424
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c   | 11 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c | 16 +++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 6974b1c5b56c2..0127b0d6c7277 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -1188,9 +1188,20 @@ enum amdgpu_sriov_vf_mode amdgpu_virt_get_sriov_vf_mode(struct amdgpu_device *ad
 
 void amdgpu_virt_pre_reset(struct amdgpu_device *adev)
 {
+	int i;
+
 	/* stop the data exchange thread */
 	amdgpu_virt_fini_data_exchange(adev);
 	amdgpu_dpm_set_mp1_state(adev, PP_MP1_STATE_FLR);
+
+	/* Force completion on KIQ ring fences so pending fences are signalled. */
+	for (i = 0; i < AMDGPU_MAX_GC_INSTANCES; i++) {
+		struct amdgpu_ring *ring = &adev->gfx.kiq[i].ring;
+
+		if (!ring->fence_drv.initialized)
+			continue;
+		amdgpu_fence_driver_force_completion(ring);
+	}
 }
 
 void amdgpu_virt_post_reset(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
index 22e2e5b473415..a9e33b7e87406 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
@@ -21,6 +21,8 @@
  */
 
 #include "amdgpu_vm.h"
+#include "amdgpu.h"
+#include "amdgpu_reset.h"
 #include "amdgpu_object.h"
 #include "amdgpu_trace.h"
 
@@ -108,11 +110,23 @@ static int amdgpu_vm_cpu_update(struct amdgpu_vm_update_params *p,
 static int amdgpu_vm_cpu_commit(struct amdgpu_vm_update_params *p,
 				struct dma_fence **fence)
 {
+	struct amdgpu_device *adev = p->adev;
+
 	if (p->needs_flush)
 		atomic64_inc(&p->vm->tlb_seq);
 
 	mb();
-	amdgpu_device_flush_hdp(p->adev, NULL);
+	/*
+	 * While GPU reset holds reset_domain write lock, skip HDP flush entirely so
+	 * no HDP-related HW access runs during reset;
+	 * reset re-establishes consistent state afterward.
+	 */
+	if (!down_read_trylock(&adev->reset_domain->sem))
+		return 0;
+
+	amdgpu_device_flush_hdp(adev, NULL);
+	up_read(&adev->reset_domain->sem);
+
 	return 0;
 }
 
-- 
2.34.1

