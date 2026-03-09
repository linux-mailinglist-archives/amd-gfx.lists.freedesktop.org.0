Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCz5JrXfrmm/JQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Mar 2026 15:56:53 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BED823B0E6
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Mar 2026 15:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FAA10E518;
	Mon,  9 Mar 2026 14:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vfeppmZE";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012049.outbound.protection.outlook.com
 [40.107.200.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2138110E514
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Mar 2026 14:56:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVDZwg9SLYqn7J3pBzGvPZVBmQTJ2oiflu4tWs7ulepe8pSS7tNUW4wjtg4e70IJX8dX90oG2D954joYDDI0aVx0wn9RWZGuyR5o17CqqZ6qm5pKg5oq2rgXO/djSBlScJxCrWgLnzwdLUo2LAc3Z7J1Q7FxB7X9++zdQe2UoFQgij9yVFTBoKfRiAXdZ+qWpCO/h1Ju15SdoKU5wjHkRV042mdXRHaA7qVF/a96dglZxnXHBVBljNU8t1J2hX11ehxCZMfTDyLer7AL8cacX3xauH7oOTolNYA6qyFVzfxdXYkm1hqYOTAfCVS0ddQNFgrOgt0rkqm+KraHnFrT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4K76U0CJURFBRQlQ1zHFAkZo9d1nIAFz2H+b+VHMMA8=;
 b=EkI0gjn6di9YEEvs1YO0YefB9grNm3mlLtGGDQXNmgLrdajPoPw9NDy5xDnICZWoDGQRx9MZg23CUnjLqTnmvLmZ6C6gMXxTM+STyE24PzQC5c+Vf1O1IDEOdfJxjtd9YNDd3fTvxRONVPAX67rrzpdkDbt6iSaI/cvOh+LmFeERUOHDruZSeKtiVBVI+q5mN/gnbTBDVMsihUziEtQ690joW7K2Yd1K3OvsDvKOY47il5ao+dtcs4W6WwVDvBUaOSDfflvlNF1bnG6iBXG0B8c9hdtSTbCBeDm4Jm7sySt1mOedHtpOrYZGCbk7ZOd2/SydLJtgyyuXNaZ2+fOh4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4K76U0CJURFBRQlQ1zHFAkZo9d1nIAFz2H+b+VHMMA8=;
 b=vfeppmZELvy7Khpd2hQ8B2t/rNVFGZ1SzdG7k5p/e7UdyLQZRhP/0lEFOOhKCN0kdfWutZQB2KH3B/ph7tdDQOWi1YmM6pGurJ3TAg+n7k3fLVhFHLnF5mVdhB3e/bdKm/n45Ay9lubpzc+hYGSYgfm6a/k3t7CCA/iKqhJ/K8c=
Received: from SJ0PR03CA0193.namprd03.prod.outlook.com (2603:10b6:a03:2ef::18)
 by DM4PR12MB6472.namprd12.prod.outlook.com (2603:10b6:8:bc::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Mon, 9 Mar 2026 14:56:43 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::33) by SJ0PR03CA0193.outlook.office365.com
 (2603:10b6:a03:2ef::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.23 via Frontend Transport; Mon,
 9 Mar 2026 14:56:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 14:56:42 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Mar
 2026 09:56:41 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Mar
 2026 07:56:41 -0700
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 9 Mar 2026 09:56:41 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Hawking Zhang <Hawking.Zhang@amd.com>, Le Ma <le.ma@amd.com>, Feifei Xu
 <Feifei.Xu@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amdgpu: Limit physical transcation mode to A + A only
Date: Mon, 9 Mar 2026 10:56:13 -0400
Message-ID: <20260309145629.2844495-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309145629.2844495-1-alexander.deucher@amd.com>
References: <20260309145629.2844495-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|DM4PR12MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: d06cfa53-b5bd-4a56-770c-08de7dec1358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024; 
X-Microsoft-Antispam-Message-Info: /Bd/p15yDp8vxttmRkF2z4XgiKveOSOD0ByuUNok8KXwL7RPfaO2SjTW+ROm4w8ektPnSkdHpen7RQNP+XfHMtJ6gLVRGvJbUE9U++rNkl1zAcG5HTwQzAU0OoZMWM6R/unQtOl1qebZ90cfjW+VMFRldyrKVCVpQs2CMI63PtjLbnYzOBcQajlUuLUVAQQfJHQOZZ/4I4Ls618NMBJrKO7w4hq6mPAURaDxoG8q1rRHL7aiZcb7cYKyVYBqSsIKqBxNLCrwi5kTtM5GUgzfuCgO8QN//c//lV9QcZBmEDrAOxyKS3F87pqamAUUODzXDebLYOgTF72siKoR7xY/kEB3zCE5Ulr3ZZUKKE6yHeRcUrxHxuPR3T7XEupqPsuTHSbkKKJbbVX2mazM3JyemCBA7yQ3Heivk8X9iSOOIkuWM4jR+RNMpvPICO4+7arrWsfzbgj9CIPfR+qVU6BXD5LHfA4l8T2110OffkDqmGUAUk8VNAjQg4J754UQjKFEk8OvgbLQ0392qZqr5pdEDQsO2b8jE0V6/dXEhbpsd0yak8RvIMRhMgbcBMmBUFzJjP4Fq9smuE383ot2QM7o1R1OSM9Vx+dWi/7aWZZ/2e8YHb6NUUqC+DhANPfisImBk9AR1RSDEBJKldaGfrU3El4KVnNr4UBKldFnijyXFqCP/bvkjlAzE9lIim1NQUsCOSHBIM/arVu1xxQrGQF1dljBErOBfI2BS7FdWF0B4vhB8Otqby+kq7RcUcwKBPNkEazkEmVIUllaMHEZfjgWsg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: I+KDEdLHX+AUKa3gFF+59WPuS0BPEqT2q6M7a4N0oM+Od9cCXn47UoxfTZrnpReFwr+D0gRbkqHbAtZqETcrbBVF3E4utLVhpRfX6ESIT5etOcurWC0MqhkagXQ+T/i1sc5IEaMxYxKvFbbirgPxzXJjVnT77XYRB+i1P+qhdOsnpXDm12le9Dib3ATVBXxdRVjwJfj0RmiDSzrNh8tbJ7Psp+AZ3Kv7lezepacr0HdSNeGXu1mbN46J6feRqVx++x0wwDVsqty2ZXPyCTwjiF7cRQ93ndNJBAJRNd7vBiTyIA/vTz5BUUjjjkCUSDEkhOCaDus23BM43jKZ0zF3APqesfeiU4X+rEdGySiQJB2VqWQSZa0Mr1pwZSGF9qONG3mRNidL/SAU2YuEpr9gzjHRlW9lFHJN7mtXOHkLgxCEggiPGGuajgeR0pXoyYuT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:56:42.2395 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d06cfa53-b5bd-4a56-770c-08de7dec1358
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6472
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
X-Rspamd-Queue-Id: 4BED823B0E6
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
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

From: Hawking Zhang <Hawking.Zhang@amd.com>

Only enable page table walker to snoop CPU cache
on A + A platform

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Le Ma <le.ma@amd.com>
Reviewed-by: Feifei Xu <Feifei.Xu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c
index 4aa004ee2c4d9..6a6f1707cb53e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c
@@ -325,10 +325,18 @@ static void gfxhub_v12_1_xcc_init_cache_regs(struct amdgpu_device *adev,
 		WREG32_SOC15_RLC(GC, GET_INST(GC, i), regGCVM_L2_CNTL3, tmp);
 
 		tmp = regGCVM_L2_CNTL4_DEFAULT;
-		tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL4,
-				    VMC_TAP_PDE_REQUEST_PHYSICAL, 1);
-		tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL4,
-				    VMC_TAP_PTE_REQUEST_PHYSICAL, 1);
+		if (adev->gmc.xgmi.connected_to_cpu) {
+			tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL4,
+					    VMC_TAP_PDE_REQUEST_PHYSICAL, 1);
+			tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL4,
+					    VMC_TAP_PTE_REQUEST_PHYSICAL, 1);
+		} else {
+			tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL4,
+					    VMC_TAP_PDE_REQUEST_PHYSICAL, 0);
+			tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL4,
+					    VMC_TAP_PTE_REQUEST_PHYSICAL, 0);
+		}
+
 		WREG32_SOC15_RLC(GC, GET_INST(GC, i), regGCVM_L2_CNTL4, tmp);
 
 		tmp = regGCVM_L2_CNTL5_DEFAULT;
-- 
2.53.0

