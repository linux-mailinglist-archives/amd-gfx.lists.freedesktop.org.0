Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A112151FC
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Jul 2020 07:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBBE6E2E9;
	Mon,  6 Jul 2020 05:05:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39E96E2E9
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jul 2020 05:05:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kt0t2/u9gmh0gyhQg9jf6j68zEw/li6FrzmX3ou8YqYtiSU4uyjdUhIhn+l51rLwNfWaRlPFhx0YZ0TV0oxTMyAwFKFbSLmfXKuL+CvcUK2uKBPhlDmqxuJxiogcG3peeg/wv+s+mbKMtMPqFiz/mcL0IO/q2zsv9tbekOdnrPL950Mq3TEarpRyIlbjLfyjoyKP2xnm3YwH/L9wfQ+ETcjR1uo0jVXyVpPAHkDD7nLESX5HRhokliSWdSsVBoUblG5dKrNTYef63HKjlZsbLpqH9IGFHsj3e86ufaQLu1Hl8PgJIPU0g3843B2EvksBupM3ZE8wPZEz8cKTr1fPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hIJO2jbcmydc6Ap0TSDIkwRQJ0vdiuLej6vv259Em4=;
 b=As3MViYht1Ie/mZpIH+NW+a/BlsnLzJJNHH+hcPvgmUKWhSI6AJB0NafbbBrn0MPNR5JzhgfPGnE9pLRLGb0r2jPd7TX/gPkzXUEfu9pCJ9u4vLWTmGxxr+rvsLxcAgagYUBLC553ZhPbDreP/RWzpoOmdWibS1SSJHdSiXn2OcjjvTlsUdNgpaBTVIbbc0vo8UH/tr0qv7o31otrwRW4I4fd5v2Bsb76h/6h0dAexyPW+R8U7/XaJ4HWxOJjLBWu/XPwqoQ1SAj57iTJdzf9xSSuOjShlXb7PHX5lrV77NEonp301M3H/iXgkKKSPnpaD2/nllDsBa1aa5NKs1Q0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hIJO2jbcmydc6Ap0TSDIkwRQJ0vdiuLej6vv259Em4=;
 b=Ii7JiVlT1nnwpJ2z4LyfDEXJda+J8KTM8yPQlfS21KuDXEBME5VFN7YKtWvE1VKmpXd0feoFe1Y8ThcC5kcMh61EhbawWpBI90M0O4YXuKF+wZUs2KHYCDl22LMrldyXSbLKx8t5aFwWcmVotgfQlFTAI6yJ9qAhxSySN7tVB34=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3774.namprd12.prod.outlook.com (2603:10b6:208:16a::13)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Mon, 6 Jul
 2020 05:05:43 +0000
Received: from MN2PR12MB3774.namprd12.prod.outlook.com
 ([fe80::9ca1:81ba:bd45:53f4]) by MN2PR12MB3774.namprd12.prod.outlook.com
 ([fe80::9ca1:81ba:bd45:53f4%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 05:05:43 +0000
From: Huang Rui <ray.huang@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/12] drm/amdgpu: use register distance member instead of
 hardcode in GMC10
Date: Mon,  6 Jul 2020 13:05:00 +0800
Message-Id: <20200706050509.714975-4-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706050509.714975-1-ray.huang@amd.com>
References: <20200706050509.714975-1-ray.huang@amd.com>
X-ClientProxiedBy: HK2PR0302CA0017.apcprd03.prod.outlook.com
 (2603:1096:202::27) To MN2PR12MB3774.namprd12.prod.outlook.com
 (2603:10b6:208:16a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd.amd.com (58.247.170.242) by
 HK2PR0302CA0017.apcprd03.prod.outlook.com (2603:1096:202::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.13 via Frontend Transport; Mon, 6 Jul 2020 05:05:40 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [58.247.170.242]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3720169a-aaab-40b1-0e84-08d8216a3c3d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB44709124DE54C568EC25CC90EC690@MN2PR12MB4470.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S60oLdDM3qryKXbBrctLRh5sY3rXaxlkVrOt9jT4jk8MJf4K1dCHnZ6J10zV0CI4M3Wb8t9OtaKSuhHHLbYYjR9zxvKSjj3wvcS57t5Sux7YJXt+QP28OtYNt0PY6EUM7mL1Zfm7LRc5JmNmvyHjwYTFZMnGvmbB5LNTl5cSqz504k7JJEH2Xaax9l/G2zfKU34gjoNTzUkn5QWxO2e+AFIC7iBRc/3vJv0BIUgPkqAXVtFD8kMIJUjiMAx8cHx/ZsjUWgoZuWTuzKgnN85iChWBYe3UiY535FHnIHL9hZsDOYJRdkPE8mfVGEPjWp+t71dWpxh6ux8O2ZklKEWL+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3774.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(6666004)(26005)(54906003)(66476007)(7696005)(52116002)(8936002)(66556008)(66946007)(36756003)(478600001)(5660300002)(86362001)(6916009)(2616005)(186003)(6486002)(2906002)(316002)(1076003)(8676002)(16526019)(956004)(4326008)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Ka6dMUlIyUHsmgIbVs1Fgqq4X0Ck2aJml1eDA39LKmpZuX4jFKkqn3a9FJySgsLz9LUoTzAX1q07n3doWGyWWUMVjPv/GK6jOfBFe5D45z6k/FZl+XXlZXsLwYLRY4xA7fsA7jTh//v6pqAJn6npSuWC03FKCa6N2+vCGWFveNWlO7DgkUHlUaRZ1ScqN8zrHTNIKFYM6sDVR4pSLty9sSuw2dMOlV5o323DUmPf8WtwtNco9GnSZOnIa062J0SPLzbuYRZkzPzeDHKFER2nXxdONK/QWk73lwMOIFD6i2kSIf9LT8sAdApixUkumOedVUAkNECs1Q+EOfgDJ0tfLMyvxiwK2bjYbuXbdR5cxb3iN5k++S4QnAZ/9hLbcEdTG2MNIxM2NH1l1WiIzKSsUFfa8/27Oes0QbhWOv1uyDNa1y3dvah6HJSb+8xqPHERRs2hHQ8CIOa76f4JjEUiyQXZtlP+DoL9vkStPDiiAfX+sQcGtjIFllan1iuzbKus
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3720169a-aaab-40b1-0e84-08d8216a3c3d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3774.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 05:05:43.6697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0pu1ll10l8pgmaO+pNrgiJj8p9ELLZuUe52tQ+7WFADlQQf2vUMO7SdgaPv5VS+QlPYskOvmycLYQb+Ucc77g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470
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
Cc: AnZhong Huang <anzhong.huang@amd.com>, Aaron Liu <aaron.liu@amd.com>,
 Huang Rui <ray.huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Leo Liu <leo.liu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This patch updates to use register distance member instead of hardcode
in GMC10.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Tested-by: AnZhong Huang <anzhong.huang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 43 ++++++++++++++++----------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index bfe62985afff..8f29f79f820d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -86,7 +86,7 @@ gmc_v10_0_vm_fault_interrupt_state(struct amdgpu_device *adev,
 		/* MM HUB */
 		hub = &adev->vmhub[AMDGPU_MMHUB_0];
 		for (i = 0; i < 16; i++) {
-			reg = hub->vm_context0_cntl + i;
+			reg = hub->vm_context0_cntl + hub->ctx_distance * i;
 			tmp = RREG32(reg);
 			tmp &= ~bits[AMDGPU_MMHUB_0];
 			WREG32(reg, tmp);
@@ -95,7 +95,7 @@ gmc_v10_0_vm_fault_interrupt_state(struct amdgpu_device *adev,
 		/* GFX HUB */
 		hub = &adev->vmhub[AMDGPU_GFXHUB_0];
 		for (i = 0; i < 16; i++) {
-			reg = hub->vm_context0_cntl + i;
+			reg = hub->vm_context0_cntl + hub->ctx_distance * i;
 			tmp = RREG32(reg);
 			tmp &= ~bits[AMDGPU_GFXHUB_0];
 			WREG32(reg, tmp);
@@ -105,7 +105,7 @@ gmc_v10_0_vm_fault_interrupt_state(struct amdgpu_device *adev,
 		/* MM HUB */
 		hub = &adev->vmhub[AMDGPU_MMHUB_0];
 		for (i = 0; i < 16; i++) {
-			reg = hub->vm_context0_cntl + i;
+			reg = hub->vm_context0_cntl + hub->ctx_distance * i;
 			tmp = RREG32(reg);
 			tmp |= bits[AMDGPU_MMHUB_0];
 			WREG32(reg, tmp);
@@ -114,7 +114,7 @@ gmc_v10_0_vm_fault_interrupt_state(struct amdgpu_device *adev,
 		/* GFX HUB */
 		hub = &adev->vmhub[AMDGPU_GFXHUB_0];
 		for (i = 0; i < 16; i++) {
-			reg = hub->vm_context0_cntl + i;
+			reg = hub->vm_context0_cntl + hub->ctx_distance * i;
 			tmp = RREG32(reg);
 			tmp |= bits[AMDGPU_GFXHUB_0];
 			WREG32(reg, tmp);
@@ -283,7 +283,8 @@ static void gmc_v10_0_flush_vm_hub(struct amdgpu_device *adev, uint32_t vmid,
 	if (use_semaphore) {
 		for (i = 0; i < adev->usec_timeout; i++) {
 			/* a read return value of 1 means semaphore acuqire */
-			tmp = RREG32_NO_KIQ(hub->vm_inv_eng0_sem + eng);
+			tmp = RREG32_NO_KIQ(hub->vm_inv_eng0_sem +
+					    hub->eng_distance * eng);
 			if (tmp & 0x1)
 				break;
 			udelay(1);
@@ -293,18 +294,19 @@ static void gmc_v10_0_flush_vm_hub(struct amdgpu_device *adev, uint32_t vmid,
 			DRM_ERROR("Timeout waiting for sem acquire in VM flush!\n");
 	}
 
-	WREG32_NO_KIQ(hub->vm_inv_eng0_req + eng, inv_req);
+	WREG32_NO_KIQ(hub->vm_inv_eng0_req + hub->eng_distance * eng, inv_req);
 
 	/*
 	 * Issue a dummy read to wait for the ACK register to be cleared
 	 * to avoid a false ACK due to the new fast GRBM interface.
 	 */
 	if (vmhub == AMDGPU_GFXHUB_0)
-		RREG32_NO_KIQ(hub->vm_inv_eng0_req + eng);
+		RREG32_NO_KIQ(hub->vm_inv_eng0_req + hub->eng_distance * eng);
 
 	/* Wait for ACK with a delay.*/
 	for (i = 0; i < adev->usec_timeout; i++) {
-		tmp = RREG32_NO_KIQ(hub->vm_inv_eng0_ack + eng);
+		tmp = RREG32_NO_KIQ(hub->vm_inv_eng0_ack +
+				    hub->eng_distance * eng);
 		tmp &= 1 << vmid;
 		if (tmp)
 			break;
@@ -318,7 +320,8 @@ static void gmc_v10_0_flush_vm_hub(struct amdgpu_device *adev, uint32_t vmid,
 		 * add semaphore release after invalidation,
 		 * write with 0 means semaphore release
 		 */
-		WREG32_NO_KIQ(hub->vm_inv_eng0_sem + eng, 0);
+		WREG32_NO_KIQ(hub->vm_inv_eng0_sem +
+			      hub->eng_distance * eng, 0);
 
 	spin_unlock(&adev->gmc.invalidate_lock);
 
@@ -358,8 +361,8 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 		struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
 		const unsigned eng = 17;
 		u32 inv_req = gmc_v10_0_get_invalidate_req(vmid, flush_type);
-		u32 req = hub->vm_inv_eng0_req + eng;
-		u32 ack = hub->vm_inv_eng0_ack + eng;
+		u32 req = hub->vm_inv_eng0_req + hub->eng_distance * eng;
+		u32 ack = hub->vm_inv_eng0_ack + hub->eng_distance * eng;
 
 		amdgpu_virt_kiq_reg_write_reg_wait(adev, req, ack, inv_req,
 				1 << vmid);
@@ -502,16 +505,21 @@ static uint64_t gmc_v10_0_emit_flush_gpu_tlb(struct amdgpu_ring *ring,
 	if (use_semaphore)
 		/* a read return value of 1 means semaphore acuqire */
 		amdgpu_ring_emit_reg_wait(ring,
-					  hub->vm_inv_eng0_sem + eng, 0x1, 0x1);
+					  hub->vm_inv_eng0_sem +
+					  hub->eng_distance * eng, 0x1, 0x1);
 
-	amdgpu_ring_emit_wreg(ring, hub->ctx0_ptb_addr_lo32 + (2 * vmid),
+	amdgpu_ring_emit_wreg(ring, hub->ctx0_ptb_addr_lo32 +
+			      (hub->ctx_addr_distance * vmid),
 			      lower_32_bits(pd_addr));
 
-	amdgpu_ring_emit_wreg(ring, hub->ctx0_ptb_addr_hi32 + (2 * vmid),
+	amdgpu_ring_emit_wreg(ring, hub->ctx0_ptb_addr_hi32 +
+			      (hub->ctx_addr_distance * vmid),
 			      upper_32_bits(pd_addr));
 
-	amdgpu_ring_emit_reg_write_reg_wait(ring, hub->vm_inv_eng0_req + eng,
-					    hub->vm_inv_eng0_ack + eng,
+	amdgpu_ring_emit_reg_write_reg_wait(ring, hub->vm_inv_eng0_req +
+					    hub->eng_distance * eng,
+					    hub->vm_inv_eng0_ack +
+					    hub->eng_distance * eng,
 					    req, 1 << vmid);
 
 	/* TODO: It needs to continue working on debugging with semaphore for GFXHUB as well. */
@@ -520,7 +528,8 @@ static uint64_t gmc_v10_0_emit_flush_gpu_tlb(struct amdgpu_ring *ring,
 		 * add semaphore release after invalidation,
 		 * write with 0 means semaphore release
 		 */
-		amdgpu_ring_emit_wreg(ring, hub->vm_inv_eng0_sem + eng, 0);
+		amdgpu_ring_emit_wreg(ring, hub->vm_inv_eng0_sem +
+				      hub->eng_distance * eng, 0);
 
 	return pd_addr;
 }
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
