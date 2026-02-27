Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INgcNhRboWmDsQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Feb 2026 09:51:32 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6091B4B50
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Feb 2026 09:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502F510E107;
	Fri, 27 Feb 2026 08:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KzlC3XFA";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4C710E107
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Feb 2026 08:51:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1TPENU3NSl7eXLl2PVwSI7d6Re1XvZxIUgoQSYHhBMi+Zvh5h7UnderPFRzCf1b3kukrg2mVPgKOmAB2pqjHUymoUJ5iPIGNinEFmVlUo76THmNBZE7oqlcHYDX613QUQLb0Qvx6oSBtH43LygdyYkstPxbZkzIS+pc/HPkcMUn7o3IFOMxtCH6UQsu8/5zvb6tQuWwi0+6yj0DQT0hrS018zrEAmnC++qurlcTfLh6k8jqUyRJ+zTYsosUzC5dIFsnWKo0wFtZ266A53Xoq+rbpZZ7ZOPSsTKIvUUgEa0a3jVPxXUQ2Zy5sS6bujHyk7as6p//wRjR1kNJ2eXLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRMkEFn0YZzs9H96FgoF4vb1jxRMvY/CZLT4dPF4g0Q=;
 b=HVZNqbdzYvsa2jGFoXOWDKqiGB5p5jVZrFQHTiJJLITpngiSvSe07FQUfv8NTuHeHJoiFC2CJrWtSMN3PdDHJy9jtfBLAxB/H6c80htGNo1v5Snr6PAAwk5ly6q8MedkkCA6I9nltj03dhrsAwF1V6hI1j0jm5ipzAeqlgN0LbPrrjBT8oKehcUYFKEqIt6WQhAZPWMwSWh5S9kv5fmjA4JA8PktDVpqOq5C/chzpYHS1Ln/DBWFTahtiKK/trMt3IH866EvoP1js0V5CGqdJvJBZO5qhCPEjXfH92261s2NFI9XUPYmM8T3e3EeuAapg0UIUL+w9taIPXo0fPOR/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRMkEFn0YZzs9H96FgoF4vb1jxRMvY/CZLT4dPF4g0Q=;
 b=KzlC3XFAlLNizzMi92vWfajnJdYr1zjcjzJkCeGG3M6LtGBp6N+uvwL+WwbJyaB6oFUd1BJD06BDf542T2hEoOPULkPBzUWJdrUhVVn3qB93xsYouD6U0Mr6uW58bXbsBM5+3UzROCcfUNlHmoupExh5ueiLBIiyJWkCoMNtUgo=
Received: from SJ0PR05CA0091.namprd05.prod.outlook.com (2603:10b6:a03:334::6)
 by SA1PR12MB8163.namprd12.prod.outlook.com (2603:10b6:806:332::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 27 Feb
 2026 08:51:24 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::c3) by SJ0PR05CA0091.outlook.office365.com
 (2603:10b6:a03:334::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Fri,
 27 Feb 2026 08:51:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 08:51:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 27 Feb
 2026 02:51:22 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Feb
 2026 02:51:22 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Fri, 27 Feb 2026 02:51:16 -0600
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH v2] drm/amdgpu: Fix null pointer access in
 amdgpu_userq_signal_ioctl
Date: Fri, 27 Feb 2026 16:50:15 +0800
Message-ID: <20260227085110.2865415-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|SA1PR12MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: b4545493-6b74-4101-fe22-08de75dd6285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: T7SU4audKQ0BCK19hVPsJhGPY7/BCpJqJ5EDdpNGc71FjpHqqociFELjyYmArP8Jg/0LaVPPRtKpIvoDyvPPHBXuvufJ19Yfz0zAGtzXUTuggyuH+qc7W95NP6IWnavUWLWLeIl8Hhv9OIgfh1yjK8KqP0hpYC6+xRHdwoHtNIpdBtbxgBjb0wbYsnHyiEiZiUulDY+jBM+mDsPsRMeOjN6rcrm9pQhvOzIw3xQPuhGCJEYvgcv8xw9xdPX/jyPBvWhYZmVuim2dstU64Kf7fwEB+kGkBJbx8AcYedjnTEhj1f9GANNSERsGizz7/DQ++K61cWKjhe/syWbRDWbP1p7RcQMRgCsd9xDobhYFNeBPR3NJoSLv8HBebJ//qCOksuJ0Hi8OBLsSuwVIVyWO9NyVwMUZ40WgIiRgKefOqsVNMEJ3Q0NPzLev0RwP8lfeR0o/Jcm6ZBr7Pw5xts7e79tA5zsioJaTyTOnqDONPUHl9Zo0N/TmWCiMLiidXVeBKFveyIPMQZ8pDuOyzQglMgJlxjTBdDMaikEcUeGF80qvtIbwOW/O++u/cQGJDRTlVGT0GDWDkYXDEKwRg4LOO3vJs4EyLnBIG2T6CtXL9Kgk3O+HjXtfx9e4gE1mutmtpL+ntpD0+t3nhZcLJHytdPcVyUzquz0QP+a3kIN1GMnn7to/IO9Y5wqAcgQqQO+duwNLws07ivuN84mBT/Bkl+V3v+xK0mg+fuNgHm6YU2xcU1hD8NMI2BTD1DR+QC9B5LpknFlNANCYYEwHeER7nyy/z8yvgxQCnCk6uYdBUWb4nzt9y0aC4OcDIr++v9FE65AK4hVbJjHwR5/cKkvYcw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: T+SzY/ywby+3i0Us9LUaircD0UzcSjBUiNTRGMm/UtOxx+IA70z7eR0Tque6j6VPele7BTM2GHOBbKS9+brPQiXp/DBUisYxXB527vrBoEWAwsEjte9Q1M/l52ffwQmgpK1T8b+iH4vdgM7CeXhl9qv3gfcWlYG1wHhSCd+LcBxH5HvhYd92wn4hB2dDf3oOk7aqEKqOGY3qti086S3e4v/E9FNPjsVpDT0nNZriB5B/GQtPGtaEDiX9UtZ0Y0WDhRNKqn7LIUWWQwTSnsjD4h2kBMV1wpXdt0sw0rM6G5ElZs3qFaB+yM/AOPdYA96rYCo3d7/2ZSzjYd2Y9gnz8zrq/8DamrY58PnfSI0tPbK6Z8xgh3NRoqD21zIxb0nprvfjv8CMNced4vZUrl7IdJKlsiUGABQSjNMf1Aw00GPsOUsj95bwQUljTxKDtcCB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 08:51:23.2461 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4545493-6b74-4101-fe22-08de75dd6285
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8163
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[Jesse.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3D6091B4B50
X-Rspamd-Action: no action

The amdgpu_userq_signal_ioctl function was triggering kernel page faults
due to missing null pointer checks when accessing gobj_read/gobj_write
arrays, and improper handling of memory allocation for these arrays.

The crash stack showed the failure originated from the ioctl path:
[   64.977695] Call Trace:
[   64.977696]  <TASK>
[   64.977700]  amdgpu_userq_signal_ioctl+0x8e4/0xda0 [amdgpu]
[   64.977830]  ? tty_ldisc_deref+0x1a/0x20
[   64.977834]  ? __pfx_amdgpu_userq_signal_ioctl+0x10/0x10 [amdgpu]
[   64.977934]  drm_ioctl_kernel+0xab/0x110 [drm]
[   64.977955]  ? __pfx_amdgpu_userq_signal_ioctl+0x10/0x10 [amdgpu]
[   64.978071]  drm_ioctl+0x2cb/0x5a0 [drm]
[   64.978088]  ? ttm_bo_vm_fault_reserved+0x1ef/0x410 [ttm]
[   64.978093]  amdgpu_drm_ioctl+0x4f/0x90 [amdgpu]
[   64.978179]  __x64_sys_ioctl+0x9e/0xf0
[   64.978182]  x64_sys_call+0x1274/0x2190
[   64.978185]  do_syscall_64+0x74/0x950
[   64.978189]  ? ___pte_offset_map+0x20/0x170
[   64.978191]  ? __handle_mm_fault+0x986/0xfb0
[   64.978194]  ? count_memcg_events+0xe7/0x1e0
[   64.978197]  ? handle_mm_fault+0x1cc/0x2b0
[   64.978199]  ? do_user_addr_fault+0x394/0x8a0
[   64.978202]  ? irqentry_exit_to_user_mode+0x2a/0x1e0
[   64.978205]  ? irqentry_exit+0x3f/0x50
[   64.978206]  ? exc_page_fault+0x97/0x190
[   64.978208]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   64.978210] RIP: 0033:0x7f3c08b24ded

Fixes: fd4fde1df18b ("drm/amdgpu/userq: Use drm_gem_objects_lookup in amdgpu_userq_signal_ioctl")

V2: initialize gobj_write

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 3c30512a6266..af934374df94 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -467,7 +467,7 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 	const unsigned int num_read_bo_handles = args->num_bo_read_handles;
 	struct amdgpu_fpriv *fpriv = filp->driver_priv;
 	struct amdgpu_userq_mgr *userq_mgr = &fpriv->userq_mgr;
-	struct drm_gem_object **gobj_write, **gobj_read;
+	struct drm_gem_object **gobj_write = NULL, **gobj_read = NULL;
 	u32 *syncobj_handles, num_syncobj_handles;
 	struct amdgpu_userq_fence *userq_fence;
 	struct amdgpu_usermode_queue *queue;
@@ -597,13 +597,21 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 exec_fini:
 	drm_exec_fini(&exec);
 put_gobj_write:
-	for (i = 0; i < num_write_bo_handles; i++)
-		drm_gem_object_put(gobj_write[i]);
-	kfree(gobj_write);
+	for (i = 0; i < num_write_bo_handles; i++) {
+		if (gobj_write)
+			drm_gem_object_put(gobj_write[i]);
+	}
+
+	if (gobj_write)
+		kfree(gobj_write);
 put_gobj_read:
-	for (i = 0; i < num_read_bo_handles; i++)
-		drm_gem_object_put(gobj_read[i]);
-	kfree(gobj_read);
+	for (i = 0; i < num_read_bo_handles; i++) {
+		if (gobj_read)
+			drm_gem_object_put(gobj_read[i]);
+	}
+
+	if (gobj_read)
+		kfree(gobj_read);
 free_syncobj:
 	while (entry-- > 0)
 		if (syncobj[entry])
-- 
2.49.0

