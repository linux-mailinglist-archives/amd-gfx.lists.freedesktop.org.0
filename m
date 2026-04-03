Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEaQG7SHz2mwwwYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Apr 2026 11:26:12 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A89A392C25
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Apr 2026 11:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30DA10F3EE;
	Fri,  3 Apr 2026 09:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r3rzdAN0";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010042.outbound.protection.outlook.com [52.101.85.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5785B10F3EE
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 Apr 2026 09:26:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMNPXRq0veadvZpw3dclJkw6r2YdI3+Li5pa4E7XVTCjcDJqdhrctgm8tq0xhNFrlPufzQ13hAB9dGqYz6KIuji0Rbd3V2y+dCPuhsvFne8Dxf6CmvcuSaUyE4QusacWYvQ0Jqia8LdrtF74EvD/sKKt1hO1T8iWPr4jJUUViOFsagBYgtQYmvxntRen1XjP7u4qEwB+sfMSFGcoDmvlOd0++37jw/RyOFzNe5TMOdOtQVyWRYrxFabI2svu0Cfj3HJm8fq4YMm8PFUe3CjVZZgCvIfbwDgswgdjchZCtC6CN+Qqmj/18IoulFiAtzeEJHenJcrv4DWJb6gkuyuTow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdIbasxqgsxs96zviX1Vhlbj/Q0Nhq6JXZRfTEVE6LU=;
 b=oboaxKyRqu6gdrQ1cWdqIcEjPiyX5fIrA7BSVZCRixHd4LaX2LAVXnNdWILRKRMKlw7XvNKZXXgEGPM2zyTh6L0Th3GOPYpp7lCfXslkqCfvyvOV+sabQiP8/I6k9Wwnh1w5s+6CHQR6YnCOSSlT2IdpjzPxfIzE3j5VrEqFG7GGYC88NGuKVvPcQa1tMCuUPU6M1tNbStnzsi6zbvZGWciwih7geEN+3WWiEO/TmNuJYUtCUkrIoD2FxRTAxi7mm20iyCjDsa5urh8zL4sImageF0kF6aWTkQH3TyYoRqxMg3TLmlJbvtU9+yMXSBbrGq5K+mS3UF+0o7W79a1mXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdIbasxqgsxs96zviX1Vhlbj/Q0Nhq6JXZRfTEVE6LU=;
 b=r3rzdAN0u2s0+cTJ6HeoAbeMK2/Bn5bEyTbHbomY9t826pmz22Ac7NtfHr/FNcTv8D0AMe0dM+PDWuJADUAZdvG6rYDf787omaN5xjFX1ChRzXZuQVbiQg7PH7QizU+OUbY2n0iCTHPyjUPy1Wl4uCUpVsBr7tx23sklxv/iVzo=
Received: from SN1PR12CA0098.namprd12.prod.outlook.com (2603:10b6:802:21::33)
 by CY3PR12MB9555.namprd12.prod.outlook.com (2603:10b6:930:10a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 09:26:05 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:802:21:cafe::2f) by SN1PR12CA0098.outlook.office365.com
 (2603:10b6:802:21::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Fri,
 3 Apr 2026 09:26:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 3 Apr 2026 09:26:05 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 3 Apr
 2026 04:26:04 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 3 Apr 2026 04:25:58 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
 Prike Liang <Prike.Liang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 "Jesse Zhang" <jesse.zhang@amd.com>
Subject: [PATCH 5/5] drm/amdgpu/gfx_v12_0: enable compute pipe reset flag
Date: Fri, 3 Apr 2026 17:24:39 +0800
Message-ID: <20260403092529.2238333-5-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260403092529.2238333-1-Jesse.Zhang@amd.com>
References: <20260403092529.2238333-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|CY3PR12MB9555:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c5e9bf-66ad-4659-6952-08de91630804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: mLKhnLre0qYj2tcSpShW0y5yQhAYhgmtc5Ig3KHxrLrfxGdiq2gciN+mtllBnbHG5XthgwivElG0q4VhQn2VKhLP8uHljIu8fmEHrOENN1Bbb/MVMrCWn5IHjTgS5iFJNiK/htxnKs41hwKGbg0NEujNFUA9Gv0s6wJxtjX/ANl7WN2Jou0ahgASA2T7XF2ieuo2XJsPrxPspOh7kcUYQmtISg7TrPmoLB7GoGpdWOWlqPAiTg+d9NU1pN8hBiXApBctj5MdFFOWTi2VYMEzS3MeGuHS8GcWlqifDBA6RGEQgLeNHIejO+OQDan5Q1HY02FHoiIxwwxxezQwG3qHO3Lco7qIGMb8mo4yk8n0T5JsAjhOa9nzQ0IUV56RKcxfu4rInJnpXDrtxVLs5TeiHpujV9D6AU8NaZpBzSVQrW9Ey4UF2yte7p5xequFM178BzKJ8K0riLRF6KBDh3N/A0I9RVTmN5Gi0SxeOx0sLOoJ4VfqwqitSIBThJNbIYFC3vwmhpDIYnXPqIdzDHWB79JXy1kZG5pf1yH8/k4fDM+x19OnfJMtS7E7uWYfsY2kErfjq9a6ASN5uUTPfKi132S7Z4s8drlkx9HtLQlGdIerFrzI4PRT5p9YKOmUPdISJ5d0YC55SJETsXW7UMcEhjbxYJy0CeMgjrIM6YU6gLqpzojVR0XhBY8UvqIySVDvypnBoGq8fRQbD0cxAvwlCq1Xs1WXIZk/60zAegzidyNGeAO+H4ZcKAZpz9TAxKa5Ibq4Jrvx+VQa986my3nvPw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ehZAdhcioGWmCD4HbPrjPradL4jTE/TQQa/gID/tgGQ71mFTLZFUhbDrFxgst863Q3q/QLGlwPQUtIBkZFhYfNVcOW5pBNmbksR+MhgfpzXaT7KIzMyJ8/ZgAK0z0yCGoV72pr3zMaFlndgZKJZFMecTGaFeo846nESs3TCLoyg/qUBHjY3DdTT4oNLGQYJ0910ZKdUdldERDCaRM/1yXd9ZqXJrHLUm4gYopDsjU3QXO/X2XC40s+5hgSbCTlvByRbxd5s538czas3cQSoO9w3pKzttrFcCWsUnpGsjvDo2CmOfOpOPVGW/KVz/YG7C8nMeRSnq2P1IH6P3oxJY0jsGJyJGzhybgvsjs9Tj88KCojA9GEgNm/wuB3msbnpjnBqw+N9ZWgiZ5+XMXL8Gst2e53EQbCdvDQ6WYkZTXRBOB5WW1WsTLDEOOK2v0gnP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 09:26:05.4832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c5e9bf-66ad-4659-6952-08de91630804
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9555
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
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Jesse.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A89A392C25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Previously, the per-pipe reset sequence was incorrect, leading to unreliable
recovery and potential firmware hangs. The reset logic has now been fixed
to properly handle HQD cleanup while the pipe is held in reset before
bringing it out of reset.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index 7aa3853f8db7..17c590444af4 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@ -1563,6 +1563,7 @@ static int gfx_v12_0_sw_init(struct amdgpu_ip_block *ip_block)
 		    !amdgpu_sriov_vf(adev) &&
 		    !adev->debug_disable_gpu_ring_reset) {
 			adev->gfx.compute_supported_reset |= AMDGPU_RESET_TYPE_PER_QUEUE;
+			adev->gfx.compute_supported_reset |= AMDGPU_RESET_TYPE_PER_PIPE;
 			adev->gfx.gfx_supported_reset |= AMDGPU_RESET_TYPE_PER_QUEUE;
 		}
 		break;
@@ -5362,6 +5363,11 @@ static int gfx_v12_0_reset_kgq(struct amdgpu_ring *ring,
 	return amdgpu_ring_reset_helper_end(ring, timedout_fence);
 }
 
+static bool gfx_v12_compute_pipe_reset_support(struct amdgpu_device *adev)
+{
+	return !!(adev->gfx.compute_supported_reset & AMDGPU_RESET_TYPE_PER_PIPE);
+}
+
 /*
  * With MEC pipe reset asserted, clear CP_HQD_ACTIVE / CP_HQD_DEQUEUE_REQUEST for
  * every queue on (me, pipe). HQDs must be torn down while pipe reset stays
@@ -5396,7 +5402,7 @@ static int gfx_v12_0_reset_compute_pipe(struct amdgpu_ring *ring)
 	uint32_t reset_val, clean_val;
 	int r = 0;
 
-	if (!gfx_v12_pipe_reset_support(adev))
+	if (!gfx_v12_compute_pipe_reset_support(adev))
 		return -EOPNOTSUPP;
 
 	gfx_v12_0_set_safe_mode(adev, 0);
-- 
2.49.0

