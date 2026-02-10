Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCAnFqCni2noXwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 22:48:16 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD9411F859
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 22:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5382C10E5FE;
	Tue, 10 Feb 2026 21:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3h4A8IKn";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011012.outbound.protection.outlook.com [52.101.62.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22AC10E5FE
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Feb 2026 21:48:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMW8BGWuQuCeB3rIPlUc/jFRJ+xR6UguC1NfKocKqyvyIfGLiE8Yl50wYJMTMZwXy9hrYmXtENzyUeEIJfqiRVWhEI1uih04+LAueF1iE1a8kSme+/FtNHkK2R1v8edyQJkUf90iIIF6aQPAxgWVnitVeRL63Am14pYKtGOC0Hp/cLOouRGdXrm9XsnmtmzRyTkS4sEpYGgOIWYpETpUNhQg0kP8Q5RM4ur9VIIrnemQ686BN+N3UT9bqXQjJ4tIlii8M1CFojy6zTXxDf/csGjGntq9Yelh5hT2nMH4Q1WChNwDDFeO7/IxxuOf5t8s04oXRSmwwUtStiPfnsU5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtixhHYAI7blJnjAvR0FeiQ6rbxzCQqAaPMzLDEVpNY=;
 b=vcsxFmhuTdqWLRGifD368rzuhGtPKxIcJ/IlR3s8DGl8s79AexspBEYb/EH3HmTca+rW0M9Nsy4+PIYCmdo33a+gBusxO7KBflatYn87kiYp09wnhCSxhZTHGvLvFm+KUKLCAOsK0tc3AwXar3MWAkrDqTX7Lwk7A9HM677kq2bHOr9AjJ4EXIi8spfrow4yba24X9mtBaNe0D9oFGn3GfyMkFNoUVwUBKtBmw+ucpI6ne6pCiROexYOGwYdgnLcDJHrsWENokAqQRmrdRVA6afmIdpWSR+4/6XM5fHDS6FLZvrPiw0PDqh/Dc1FO1AZXDAXDRWZiCxFo7epAvw/ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtixhHYAI7blJnjAvR0FeiQ6rbxzCQqAaPMzLDEVpNY=;
 b=3h4A8IKnIOTh1VZJc+S8xNZu2GlCczpXerhSgxZ1aPQMZf0eqKZVaIHvgIjM0XRvSeXt3tY8mfyBXbL8GXBXuHyzGmN4wAprwwGBaKNhDu2IdfrdqlHXV95XVSFFTPREfkSsNus3ZkvraiQNkj+0pAMOLS40uG2o2QqQWVE4Fgo=
Received: from BYAPR02CA0020.namprd02.prod.outlook.com (2603:10b6:a02:ee::33)
 by CYXPR12MB9425.namprd12.prod.outlook.com (2603:10b6:930:dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 21:48:07 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::dd) by BYAPR02CA0020.outlook.office365.com
 (2603:10b6:a02:ee::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 21:48:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 21:48:07 +0000
Received: from david-B650-PG-Lightning.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 10 Feb 2026 15:48:00 -0600
From: "David (Ming Qiang) Wu" <David.Wu3@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Christian.Koenig@amd.com>,
 <alexander.deucher@amd.com>
CC: <leo.liu@amd.com>, <Boyuan.Zhang@amd.com>, <David.Wu3@amd.com>
Subject: [PATCH 09/14] drm/amdgpu/userq: rework on
 amdgpu_userq_create_wptr_mapping
Date: Tue, 10 Feb 2026 16:47:24 -0500
Message-ID: <20260210214729.80964-10-David.Wu3@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210214729.80964-1-David.Wu3@amd.com>
References: <20260210214729.80964-1-David.Wu3@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|CYXPR12MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 38da319b-a8d0-489f-fe36-08de68ee13bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J5wM26M3kxwrRXzJDdAK8JlZoECMmwoW/pVtRqposmZ2LRe+OHSdt8iO8jlH?=
 =?us-ascii?Q?vFv2xEVd9pn1XIBZS1/7rXTDNH0sflW9WUmYbKySjE8dS8w9zqZaArCx4byz?=
 =?us-ascii?Q?j/g6Z8MoYsi/4fe4dunqgAbK+v5iUvwFcasox75Y+5TfXIXqKY4LJoZMvFUL?=
 =?us-ascii?Q?VJTKY571G9jzTTDDUHEqRvMM3LtQJyYxmHC3uJaAW+Zn69PGwRhQHWiDWnDr?=
 =?us-ascii?Q?4ZdkN/Vp1duY+sxTruJV3dFHE191+56bJlOe2LDrgBntTjl86tAoLen2tM2a?=
 =?us-ascii?Q?4hqmWpMw1U1KuIkR6yvJXmLyuF+rPuFLSbjvoCl1l/2MxORKgW7YtMXGLiSv?=
 =?us-ascii?Q?LB7qI+u493fql02zz1Ka8rWH8iVTJSl3k3JrxhcxNJd1Ww4xgt1wnsFEqMtZ?=
 =?us-ascii?Q?P/cml0SOXyM47tT2gcw2Gk+sM6Wy/8lsJSdUBwj8NvS8y7ltOtX+xYKTr/fY?=
 =?us-ascii?Q?Yp8zD3mXBpucGBpx6G9dvMCT3pNfgECEplg352eDtwfZffOP6KObQO7Nh6RK?=
 =?us-ascii?Q?hFQnTwhdyGEB7Ka8sl+REOgpJ2aperFKYLPSVyqaR5HD4lxDnReRFx/Mot1q?=
 =?us-ascii?Q?Yh5YxxT+JoY1vGTVPlT+bEi0wdS9Ix6VlOWOQptAwFrgro2GiNLyyXDpi04z?=
 =?us-ascii?Q?Pln+AkzfDv/goGygyhy7LwThNAZdl5mJcz7Zx774MrS7Qf2EHmskjptNrRWd?=
 =?us-ascii?Q?WOfcz7XqJpbSW3o7hhJb767j5vO6Hsx/MgwvwHVGnCi7nTmXGGkCXLkkXNzy?=
 =?us-ascii?Q?Bk79/mmwt290gf8ZqYNUSiedD/r+WvaNp1HglLNXPfSFf8xZQgEx1H4OZTk7?=
 =?us-ascii?Q?Z0yqfi7LBJcNAbPzukG8yhb9Dkf+of+eNbTI8f1TmNm8aqa7XrzxEEyQKnTa?=
 =?us-ascii?Q?1oLgfKDtUH20OlJR36sWjPmW4DJv4ckVlz/IQ1a/lzN43hoy/bNKIicyLRc9?=
 =?us-ascii?Q?g9N+Vi8SzepgAwRxyCt/96bVVYtygDNqCNhk0n+p2G8QmbtwojVB/cmVxjuW?=
 =?us-ascii?Q?ajuf6kyIh6KhI6T6zCIbHMtOSvud9tKeniAzzJ80QN+oU49cL7ZVOjyanp55?=
 =?us-ascii?Q?DmUSOGVfWkxiUgvPTVa/UyZFM/aaZQyl+5r5nlaZGFYkC/Xxl2c8N+CjKayi?=
 =?us-ascii?Q?hgV7cEpCpuGbTWssrWF9Gv6krEqlwFF/PtWMTOxep6Ejl0TLCUxmqPmx6Ae4?=
 =?us-ascii?Q?ER0pdbSY//8DJZ1GjeXNfL+rzGbt6xqaFqg78hGsG0z4wQK4USlQHb4hCKrR?=
 =?us-ascii?Q?hmI0il/DxSLZ/3UJwEls7X/XigcOLEcrrhSkBH0umkOn5+BSFbO4WG+lo6mR?=
 =?us-ascii?Q?a1V+DYS2iqSKK3NCplR8Tq4kYYIEO2oJ/LkUNqyt3MK/Vli09m5EnRSKTuBr?=
 =?us-ascii?Q?lQfgUF1MNj3c4U/9tfuj6MWqy/O+3dP5jMG4eaHyE+y5jNQ7aCN5aQ2HFRsO?=
 =?us-ascii?Q?N7HBY86/Wukbo716naiX2uHSgimya3Bx7h9rZIb8PDWih6+3sQ6z+qXk8nFy?=
 =?us-ascii?Q?pX9fbOOYS7xsKs0E6KYd0SUHyW1OXBjBQ7Nno3LeRg7YuLrqCVEIFiUcGxHB?=
 =?us-ascii?Q?8zE8wk8/WPlfGl7r5zGeqGH1IGHblZrQ7uRUHHYCj2IC978rtL8V1G8viBng?=
 =?us-ascii?Q?oEEtlhtcGrfLkekqFpGMVKIh/80BolxgIcZ4oHEqhRy4Vaj+P4MM1BMa4mPB?=
 =?us-ascii?Q?MXtoJg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Lpd7jdQxOCQ6/VFvrd/c4RvrtwPiuyktVVJ9jA2Y1nRoUHtF/6fX77nJltsTGdwxfNssCv+Vc2romAaFzqUbweiOp0baz8bxXdynYmzx3ocdKXMKnetc9+/Rt48L+uKgOjQsm0rKza6C2CZn/II842GiCRXrLry91BMxal80/141jsAZKgdV2vlldsSv/NDcxCEh1cjSFbCmmAtaZMjvNrewZCsdf+NWYzUxA0I9xha/wIEVzCkmSx4/SBtHxUkJSh6ML+LnF3MpdI6wie1/rJg+Zuv10kiPKuaTAcLZzn8jxqqYG4yYiufyPidL6vbqQjVjnFGVOX14XcLXqwCJwBmcom2zLfCMF9vEbbKdjMABmxQj3IyNLU7I1iVNoQpC9lGRR4AFgoUZjmoQqovS1i9pAlG41BdSj2uyfpHZBjrDcfTy0lWeTFB/w1i3WS5/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 21:48:07.4436 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38da319b-a8d0-489f-fe36-08de68ee13bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9425
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
	FROM_NEQ_ENVFROM(0.00)[David.Wu3@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: CBD9411F859
X-Rspamd-Action: no action

v3 - lock both VM and WPTR BO (Christian)
v2 - get a reference (amdgpu_bo_ref(wptr_obj->obj)) before
     amdgpu_bo_unreserve() to avoid use-after-free issue

remove amdgpu_userq_map_gtt_bo_to_gart() and move its calls
into amdgpu_userq_create_wptr_mapping() to eliminate duplicated
calls.

Signed-off-by: David (Ming Qiang) Wu <David.Wu3@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 89 ++++++++---------------
 1 file changed, 32 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index ebb0d8a9967f..59e593b3bae7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -1573,34 +1573,6 @@ int amdgpu_userq_post_reset(struct amdgpu_device *adev, bool vram_lost)
 	return r;
 }
 
-static int
-amdgpu_userq_map_gtt_bo_to_gart(struct amdgpu_device *adev, struct amdgpu_bo *bo)
-{
-	int ret;
-
-	ret = amdgpu_bo_reserve(bo, true);
-	if (ret) {
-		dev_err(adev->dev, "Failed to reserve bo. ret %d\n", ret);
-		goto err_reserve_bo_failed;
-	}
-
-	ret = amdgpu_ttm_alloc_gart(&bo->tbo);
-	if (ret) {
-		dev_err(adev->dev, "Failed to bind bo to GART. ret %d\n", ret);
-		goto err_map_bo_gart_failed;
-	}
-
-	amdgpu_bo_unreserve(bo);
-	bo = amdgpu_bo_ref(bo);
-
-	return 0;
-
-err_map_bo_gart_failed:
-	amdgpu_bo_unreserve(bo);
-err_reserve_bo_failed:
-	return ret;
-}
-
 int amdgpu_userq_create_wptr_mapping(struct amdgpu_userq_mgr *uq_mgr,
 			      struct amdgpu_usermode_queue *queue,
 			      uint64_t wptr)
@@ -1609,53 +1581,56 @@ int amdgpu_userq_create_wptr_mapping(struct amdgpu_userq_mgr *uq_mgr,
 	struct amdgpu_bo_va_mapping *wptr_mapping;
 	struct amdgpu_vm *wptr_vm;
 	struct amdgpu_userq_obj *wptr_obj = &queue->wptr_obj;
+	struct drm_exec exec;
 	int ret;
 
+	wptr &= AMDGPU_GMC_HOLE_MASK;
 	wptr_vm = queue->vm;
-	ret = amdgpu_bo_reserve(wptr_vm->root.bo, false);
-	if (ret)
-		return ret;
+	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
+	drm_exec_until_all_locked(&exec) {
+		ret = amdgpu_vm_lock_pd(wptr_vm, &exec, 0);
+		drm_exec_retry_on_contention(&exec);
+		if (unlikely(ret))
+			goto out_unlock;
 
-	wptr &= AMDGPU_GMC_HOLE_MASK;
-	wptr_mapping = amdgpu_vm_bo_lookup_mapping(wptr_vm, wptr >> PAGE_SHIFT);
-	amdgpu_bo_unreserve(wptr_vm->root.bo);
-	if (!wptr_mapping) {
-		dev_err(adev->dev, "Failed to lookup wptr bo\n");
-		return -EINVAL;
+		wptr_mapping = amdgpu_vm_bo_lookup_mapping(wptr_vm, wptr >> PAGE_SHIFT);
+		if (!wptr_mapping) {
+			dev_err(adev->dev, "Failed to lookup wptr bo\n");
+			goto out_unlock;
+		}
+
+		wptr_obj->obj = wptr_mapping->bo_va->base.bo;
+		ret = drm_exec_lock_obj(&exec, &wptr_obj->obj->tbo.base);
+		drm_exec_retry_on_contention(&exec);
+		if (unlikely(ret))
+			goto out_unlock;
 	}
 
-	wptr_obj->obj = wptr_mapping->bo_va->base.bo;
+	/* Now both VM and WPTR BO are locked */
 	if (wptr_obj->obj->tbo.base.size > PAGE_SIZE) {
 		dev_err(adev->dev, "Requested GART mapping for wptr bo larger than one page\n");
-		return -EINVAL;
-	}
-
-	ret = amdgpu_userq_map_gtt_bo_to_gart(adev, wptr_obj->obj);
-	if (ret) {
-		dev_err(adev->dev, "Failed to map wptr bo to GART\n");
-		return ret;
-	}
-
-	ret = amdgpu_bo_reserve(wptr_obj->obj, true);
-	if (ret) {
-		dev_err(adev->dev, "Failed to reserve wptr bo\n");
-		return ret;
+		ret = -EINVAL;
+		goto out_unlock;
 	}
 
 	/* TODO use eviction fence instead of pinning. */
 	ret = amdgpu_bo_pin(wptr_obj->obj, AMDGPU_GEM_DOMAIN_GTT);
 	if (ret) {
 		drm_file_err(uq_mgr->file, "[Usermode queues] Failed to pin wptr bo\n");
-		goto unresv_bo;
+		goto out_unlock;
 	}
 
+	ret = amdgpu_ttm_alloc_gart(&wptr_obj->obj->tbo);
+	if (ret) {
+		dev_err(adev->dev, "Failed to bind bo to GART. ret %d\n", ret);
+		amdgpu_bo_unpin(wptr_obj->obj);
+		goto out_unlock;
+	}
 	queue->wptr_obj.gpu_addr = amdgpu_bo_gpu_offset(wptr_obj->obj);
-	amdgpu_bo_unreserve(wptr_obj->obj);
-
-	return 0;
+	amdgpu_bo_ref(wptr_obj->obj);
 
-unresv_bo:
-	amdgpu_bo_unreserve(wptr_obj->obj);
+out_unlock:
+	drm_exec_fini(&exec);
 	return ret;
 
 }
-- 
2.43.0

