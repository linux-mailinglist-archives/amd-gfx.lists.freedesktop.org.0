Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34C68D54C8
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2024 23:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5410D10F804;
	Thu, 30 May 2024 21:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pJB78o5f";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6639B10F804
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 May 2024 21:48:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrNV9wMJe/wvK8XCVRsetEl3vUOS6eXu6+c80D9j/TemX4ogs6B0HhvOosV6hfF0vdkLb5nbYvDbMeTJoYkx1WC7oUwle5yYB2JJFyFhNZqT1kFfcEqaMO6jj+TfbyBwZZPjHNBnqcv2JSvzTEDlJ96K3tTaAU2kxCN42bWgR5xT0fi2xtL7FZbjhMXvrfhnNJjDfhNghY8/OxUnKUIqIWVl7OIF659rHzCgMJl5jcZed2iKwJUF53Jt7z70KCys00sScR7uXZgqR56fu/yyr46CG6dQtc2A+09Wlwz988hC0JqJ5XR1lvITzRuCuZLMtHwyK24Xq/YMjk6Ncbfp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFn/WHEXtO6ZxA9aug+HPAfkopcn790CdRl1UL+aUyo=;
 b=PjnQj/3jZi2nxvTkyRFahKaQznxIIuIOIZVL7J1uz9J/PofS2qjdqLCvakNHkPU95RENMltMLrB48WsN0q/UfLX+prRh+8cnfXNj6M7tkNij8Gv+n14dGJJGxGk8TT7eVo+3Q0+TBs+eBf4DWZUIZGh8gUaWKK6DMS0oHIs3YUjV7opsS/XLK1pXU0Qq9czC3RmWHViVh0d10vFBPtmP2YM7jI456N3TcjcoZNu7AxBS/fpQp9jbdJmqaiQNsQ5i981nNFlMkln0OxCIv8E5EwzTdtIs/obrY0pWD6FucL36przJDtjEFoznQCBepZ1gdb5V2/p3COGayUPfQ8JgGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFn/WHEXtO6ZxA9aug+HPAfkopcn790CdRl1UL+aUyo=;
 b=pJB78o5fTdGHw3ukHqJda8vC8h34LwHtnUG95XgsZ69HqovXonMORZkAeixw8tyRe6wl/qNK27bcXkcw1cp0TNjHRJf3zGP6Q5ty+Ex7BdQwaB8pBVIXZ7P2AM/PYZKUsLdsnoT6AWUJsudtTFUz+ElXSZegBjJMAyLr2iY+b5I=
Received: from SA0PR11CA0125.namprd11.prod.outlook.com (2603:10b6:806:131::10)
 by PH8PR12MB7447.namprd12.prod.outlook.com (2603:10b6:510:215::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 21:48:31 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:806:131:cafe::b) by SA0PR11CA0125.outlook.office365.com
 (2603:10b6:806:131::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22 via Frontend
 Transport; Thu, 30 May 2024 21:48:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 30 May 2024 21:48:31 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 30 May
 2024 16:48:28 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, <christian.koenig@amd.com>, Yunxiang Li
 <Yunxiang.Li@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v3 7/8] drm/amdgpu: fix locking scope when flushing tlb
Date: Thu, 30 May 2024 17:48:04 -0400
Message-ID: <20240530214805.40970-8-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530214805.40970-1-Yunxiang.Li@amd.com>
References: <20240528172340.34517-1-Yunxiang.Li@amd.com>
 <20240530214805.40970-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|PH8PR12MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: 246a630d-19b5-4e6e-f58b-08dc80f23f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGFBU0FYQ2g1WmxJVmNBWnB3SHFEQUhnWTZwVWFVUEFYZnNjUGowMjZmSG5t?=
 =?utf-8?B?U09mTGVmejRwZjlXNmxSTXlSdGU2MHlWbWpWVVBYM3V6MDBFdFVaTmc3aEto?=
 =?utf-8?B?WHg5ZnpZczgzZ292V0xjakpEZVpwRUFmUG9MQk1YN29LenJ4QUtZa3pMM1Uz?=
 =?utf-8?B?bHgrWCtLZk9QNnY0ekxCeWZpZDVnaVArQXJzdFdmSDFEbmFYR3NBQUpLSm1a?=
 =?utf-8?B?eE1DKzJRQXhpQWV4c0swVnU0eHZKb3ppWlpNc3MvV2ZFeUlyMVp2SGlDalFZ?=
 =?utf-8?B?S3p0d2ttUEEvQzFyS2hnWnZPMm9QTTVNRUQ4allwZUk2SVBnWFZQNXJRbWMy?=
 =?utf-8?B?OG16N3hTMDg1Uzl0eU5sQXRud3BhNDFvS0FzSVhCR2JqN3NyMEVIUU94VFFv?=
 =?utf-8?B?OHM4TWVqWVphN0V2SGd3eXo1YkU5bkRwT2pGVzZrNTNsNHVZY2FOTEx1ZStE?=
 =?utf-8?B?QXQweUd2TUhiWEI5aHMwM2hvZ0FGb2dMOWVVYldidVNKbHVaWVJ6YWIrdFky?=
 =?utf-8?B?MGpZM205eG9teW45ajg3QUtoQm9WTkN2S1pkOEJmVDVpWFZHc2hYSmo5OXVY?=
 =?utf-8?B?QlgyOFhBRmpXSHdESnhnNzNMRDRlU1Y5TXh5UnZUNEV0TzlCQ200V2xzOFRz?=
 =?utf-8?B?Wjl0dTBhVEFTRW1LNnBKMTh3d3c5ZVJNYnlQR3BTeS9uVW1MRHkxck5SL0hi?=
 =?utf-8?B?U1AxYU9FcUJqcWZFcEpyMlIrSUZTcVVYZ2pDVUxmS1BFdTNhdHNmcjVRSjd5?=
 =?utf-8?B?dGRHdmxvVkh2c2NiZitJaXZaTEJnamJIS3JabEFXNlVSdzEzQUdZNjFlZTB0?=
 =?utf-8?B?cXRraGtOakNGTEZhRGRNemVaK2d4ZkxwaWFZOVhzZVI2SHdoT0pKcUlmQUMr?=
 =?utf-8?B?SEI4a1FrSGQwdFV3RDZoTFNWZnRpL1pGQ1ovaVZEVm5wRGRndCtLR2szV28w?=
 =?utf-8?B?OE9lcUgxYkhjOEhwYnErMEJuK3g2K3BZWkdndm03anFKZ0lsd2JHeFZncHh4?=
 =?utf-8?B?QmxXam52bFRtQTV6dGFBSU9BZERXUjZGVy9vQ2pwMG5rNUZZVXZDNmd5MUFa?=
 =?utf-8?B?VHI0dkpGemlCaERVaUtTbGcrTDZsR2ZnVERQVnBEcnZZb0NDTVpabHVBYzhp?=
 =?utf-8?B?WktqZCtITGNCRVVKeGVKNWlKazdNUmYxUldIdjhIR2tNRW1Fdld6N0VDN1hu?=
 =?utf-8?B?ZEVTMmpVemZpRXNRRzZ6VTlhWW9MNENmUFUrVTdRa1B4OGVudWkzVkp6UWpm?=
 =?utf-8?B?bXR6bERTV011Uk1kUHVEZzI1WGNjTldsd3hTUXlXU0RYZFQ2YkJsazlJbmNE?=
 =?utf-8?B?QVd3bFlqQ1Y3Sk1yRVRZOURFVEk1ZStjdzExOTNLa1ZQYWZaT0FET3A4MDNs?=
 =?utf-8?B?dEsvb1VOQzZhU0VEazVLbnI5aFdsZEVLKzdMM3NOVGxBSFIzSlMyMXZQVm4x?=
 =?utf-8?B?MENqcUxYSVVXWVMyaEt4N2RXMENWYnBzb3lkTjM2TW1XZmZmWlZockUzL3k2?=
 =?utf-8?B?aGF4MjBUU21udS9DREZMc3c3YjZDM1NFVnJPVEtuM3ErOEpLaVV5cjZqTitv?=
 =?utf-8?B?eERpdnZmUFlnVjhuQlZoMVV0YmlYc3dYWjZQcHE4YzNXckhuUGR2eDkxY3Nm?=
 =?utf-8?B?SDAveTRHK3NuYnd1djFRZGpjRk9ENDZWRGZWWmpUSVhBNzd6TzhzRW50WlpQ?=
 =?utf-8?B?VG9UcGV3SzB5SlFFZldtcmRaaXRMNmVEbVlZM0haTHQ3SzZQMWR2Sm5BSUdF?=
 =?utf-8?B?MldUMm1TS1pEcGc1TCtWd0FoQkY4ZVliUUE1K1FtZ1VCZ1VqcFhpUHNPT3hY?=
 =?utf-8?Q?4cah3w+1adSYSxHMMqsYgOmhNCyBhG5An1Ov4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 21:48:31.5130 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 246a630d-19b5-4e6e-f58b-08dc80f23f82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7447
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

Which method is used to flush tlb does not depend on whether a reset is
in progress or not. We should skip flush altogether if the GPU will get
reset. So put both path under reset_domain read lock.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
CC: stable@vger.kernel.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 66 +++++++++++++------------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 603c0738fd03..4edd10b10a92 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -684,12 +684,17 @@ int amdgpu_gmc_flush_gpu_tlb_pasid(struct amdgpu_device *adev, uint16_t pasid,
 	struct amdgpu_ring *ring = &adev->gfx.kiq[inst].ring;
 	struct amdgpu_kiq *kiq = &adev->gfx.kiq[inst];
 	unsigned int ndw;
-	signed long r;
+	int r;
 	uint32_t seq;
 
-	if (!adev->gmc.flush_pasid_uses_kiq || !ring->sched.ready ||
-	    !down_read_trylock(&adev->reset_domain->sem)) {
+	/*
+	 * A GPU reset should flush all TLBs anyway, so no need to do
+	 * this while one is ongoing.
+	 */
+	if (!down_read_trylock(&adev->reset_domain->sem))
+		return 0;
 
+	if (!adev->gmc.flush_pasid_uses_kiq || !ring->sched.ready) {
 		if (adev->gmc.flush_tlb_needs_extra_type_2)
 			adev->gmc.gmc_funcs->flush_gpu_tlb_pasid(adev, pasid,
 								 2, all_hub,
@@ -703,43 +708,40 @@ int amdgpu_gmc_flush_gpu_tlb_pasid(struct amdgpu_device *adev, uint16_t pasid,
 		adev->gmc.gmc_funcs->flush_gpu_tlb_pasid(adev, pasid,
 							 flush_type, all_hub,
 							 inst);
-		return 0;
-	}
+		r = 0;
+	} else {
+		/* 2 dwords flush + 8 dwords fence */
+		ndw = kiq->pmf->invalidate_tlbs_size + 8;
 
-	/* 2 dwords flush + 8 dwords fence */
-	ndw = kiq->pmf->invalidate_tlbs_size + 8;
+		if (adev->gmc.flush_tlb_needs_extra_type_2)
+			ndw += kiq->pmf->invalidate_tlbs_size;
 
-	if (adev->gmc.flush_tlb_needs_extra_type_2)
-		ndw += kiq->pmf->invalidate_tlbs_size;
+		if (adev->gmc.flush_tlb_needs_extra_type_0)
+			ndw += kiq->pmf->invalidate_tlbs_size;
 
-	if (adev->gmc.flush_tlb_needs_extra_type_0)
-		ndw += kiq->pmf->invalidate_tlbs_size;
+		spin_lock(&adev->gfx.kiq[inst].ring_lock);
+		amdgpu_ring_alloc(ring, ndw);
+		if (adev->gmc.flush_tlb_needs_extra_type_2)
+			kiq->pmf->kiq_invalidate_tlbs(ring, pasid, 2, all_hub);
 
-	spin_lock(&adev->gfx.kiq[inst].ring_lock);
-	amdgpu_ring_alloc(ring, ndw);
-	if (adev->gmc.flush_tlb_needs_extra_type_2)
-		kiq->pmf->kiq_invalidate_tlbs(ring, pasid, 2, all_hub);
+		if (flush_type == 2 && adev->gmc.flush_tlb_needs_extra_type_0)
+			kiq->pmf->kiq_invalidate_tlbs(ring, pasid, 0, all_hub);
 
-	if (flush_type == 2 && adev->gmc.flush_tlb_needs_extra_type_0)
-		kiq->pmf->kiq_invalidate_tlbs(ring, pasid, 0, all_hub);
+		kiq->pmf->kiq_invalidate_tlbs(ring, pasid, flush_type, all_hub);
+		r = amdgpu_fence_emit_polling(ring, &seq, MAX_KIQ_REG_WAIT);
+		if (r) {
+			amdgpu_ring_undo(ring);
+			spin_unlock(&adev->gfx.kiq[inst].ring_lock);
+			goto error_unlock_reset;
+		}
 
-	kiq->pmf->kiq_invalidate_tlbs(ring, pasid, flush_type, all_hub);
-	r = amdgpu_fence_emit_polling(ring, &seq, MAX_KIQ_REG_WAIT);
-	if (r) {
-		amdgpu_ring_undo(ring);
+		amdgpu_ring_commit(ring);
 		spin_unlock(&adev->gfx.kiq[inst].ring_lock);
-		goto error_unlock_reset;
-	}
-
-	amdgpu_ring_commit(ring);
-	spin_unlock(&adev->gfx.kiq[inst].ring_lock);
-	r = amdgpu_fence_wait_polling(ring, seq, usec_timeout);
-	if (r < 1) {
-		dev_err(adev->dev, "wait for kiq fence error: %ld.\n", r);
-		r = -ETIME;
-		goto error_unlock_reset;
+		if (amdgpu_fence_wait_polling(ring, seq, usec_timeout) < 1) {
+			dev_err(adev->dev, "timeout waiting for kiq fence\n");
+			r = -ETIME;
+		}
 	}
-	r = 0;
 
 error_unlock_reset:
 	up_read(&adev->reset_domain->sem);
-- 
2.34.1

