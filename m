Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oO37B0KhMmr02wUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 15:29:38 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E14869A1DE
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 15:29:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=3YFaI8FJ;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3093B10EA3B;
	Wed, 17 Jun 2026 13:29:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012049.outbound.protection.outlook.com [52.101.53.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E4110EA49;
 Wed, 17 Jun 2026 13:29:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSZysXFkqMDIr4s7yzuejfMUvgiXqw3V3l5u7vzuaYO2KUOtUkjzbNVsk4z7m/LxgPL3/dNV+ID+R5uM61Ox/iXzHR7SyvhUY7qohcB2eF4/inG1tvemv9CHvXpFw9W4v5Y062bcQ/4L/kUNTiZmU0gjQzN+b6LhrYe02ZKwuZ5d4UgzeJQS4nMGbpG5D2n3R5ECRvuaYeBaaS+vehHAvB8/XRpzEShi60urrQNRSQj6AUMGIP2eHL0mr5b5uOIDOaboFKkYgNuIzIllqYQtqIgIC38tyIVa6Q/fOtg2ubwba1BOBtwVZR4QroNTuRc9sGYQccfi5JiJMrEDmRgbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNsC1YWxnbAB+TNwL97FJhNvL2rfUaXD2cfsY5JuuSs=;
 b=k6mwsEhmwhlVDqqz9WEpV+oiiRASO4TdP4JEu98Ks+EKytu6nyEHAymlapDOk243YYFb72HXeNidPvDW0qb6qGjlFCikGAgdLRF/AssRWhgOtn85UHSHNDrGQm6d49VMz2x0RsojlEjGFQil8C9o+6NZtrKBfKak0kX5nIAOHsI1S1roXq6nkCQNtCcNFzU6e8kaZjYUrBMZYdFrsGMUXYBf0nn6Gbw0RWNN2hJK9T0ngsuHbo7qb2FL27+V5LYRod7HHPIzzPruecA1H4WWEC08JLsAgkwtb14GhSRuuI/kMMpwwiTeXbS3/kt6iaaplVohB3gK5PN9zcnQ5g/+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNsC1YWxnbAB+TNwL97FJhNvL2rfUaXD2cfsY5JuuSs=;
 b=3YFaI8FJiAdx/kiqFDgJ9B3DRPr04Y7JFQ7Sbl+x64C0eNn3WsB3n3Rk4TrBHG0dB4pxC8sVwCNNWKK3CjAtacehmcf5q4o5iZx9Z8ZDdlSudp5nxWsfcjRnsUQLKw5nTRZXDrM7D5lB/57Qme272JqP016R8XKDyh/cLZ6ZHQM=
Received: from BL1PR13CA0200.namprd13.prod.outlook.com (2603:10b6:208:2be::25)
 by DM3PR12MB9392.namprd12.prod.outlook.com (2603:10b6:0:44::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.11; Wed, 17 Jun 2026 13:29:24 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::53) by BL1PR13CA0200.outlook.office365.com
 (2603:10b6:208:2be::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.12 via Frontend Transport; Wed,
 17 Jun 2026 13:29:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 13:29:24 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Wed, 17 Jun 2026 08:29:19 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] drm/amdgpu: remove useless enable/disable of ttm
 buffer funcs
Date: Wed, 17 Jun 2026 15:28:34 +0200
Message-ID: <20260617132835.12306-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617132835.12306-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260617132835.12306-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|DM3PR12MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ddccdb-ca12-4bd1-4fd0-08decc747278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: QN4/y9F+by1HO1D8SfIqhO4EgI3+9WHng1ZfbTobUf+aVZR9FGc7aL2QfQwR2nF1VzrxxyvaMSxNR+6luCs95g7uD3S/wTWd8ypX5Dt6jhWyoa8uO/nBVcBbkGecK31qL1AhvZZeTwOo5j9eL0vJaUHb1zCswjOMfHp/vK1eWXIXXSWCpi8vT4afd3MlOhqo8dXlI24r6FV22vCP1qJLrXncR/Pu5dasZEXFHL7MFPm1XkNoWaFVsQMOCErUUE4jrKDJem6LxFgU61OmKAzcOMSFd9NlXOcUbNZt1kBEc/JfwweGRpjHeRt52JphOQnPRSBVcgYalYtxFxwjGBmEgKXfArMUAmiuiD7ogcnO0/sl5CCvBXqE6kaqi4y//G9V63kiCbIDg4d5FqCXJoXFPAvMojBuDnH/pC1eWB2g8uOIYBM/CH9ggaH+SSq+glrYmTO/8FpwQEat8WMKgf0GjGaFBolTbkzk0aA4qHYwDJnUjwvRRcV2x0tSDN841t5LPnPyCsFxoo2bwh1mu88CrzHVmewZGEVxFl1KqYy227zwGDqeLFcY+n//3ostiXVjP32ZYX/XbPcv8SCY8obn9/wuYd/2gV42j3rjaP3mIZApWluhmnOjPoWx6kCA+tQ/Q2is5T2NiwGVf2MoxMr+Z3XyEBiD1rZTRhpyGd5CJDJRDIvImScUA2+sa81Hg49jVaf54voTYxvEqHwlZmkxMMY6YcOfy4hJo42I5N5U2Bo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3hP/jn7p+jFUkrUTcs+OrRaamx6aSaak2ePHmhzkWj4WHp741CgqtdvBxqWkfVI7EldDVFVt/wo8VEk+jSZQ5JwoA5RYj56urAunlyDplWFyUerFZmeCI2FzejSCIBr4o/5qP5EQK3PNG9VXi1JCGtFu0wiiIU65aFxPJwkKXs5n1zsyyUInKG9JgdUPvoW8Uosx9QIGE8rRkP5eGwum8ngfriklXyZmfr//auuHk0xiWjYawpqCtjw+gv6d3l2SLF3B738LovUKYSk/Z1C+ZAOykPQw+hv4ocRc5iwyrwiE8o5o8PkG4gc0hs3givWoDIEdEikwHwuM3GYi63Yzg33Ab4AmTmIHH6nt30GMVJAcO+vpS2Y8qy2IwRhlpF1PW4POZfjZfVGBWu6LjBelIjhYVxpl5mJW6n1NYdIKzmoRqk00kzQUPUNHPWT8Ukmj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 13:29:24.1509 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ddccdb-ca12-4bd1-4fd0-08decc747278
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9392
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E14869A1DE

amdgpu_ttm_disable_buffer_funcs and amdgpu_ttm_enable_buffer_funcs should
each only be called once per amdgpu_device: at startup and teardown.

Therefore the other calls are redundant and can be safely dropped.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 5 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 1 -
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 53150fe55350..6abcde8a1a00 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3381,8 +3381,6 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
 
 	r = amdgpu_device_ip_resume_phase2(adev);
 
-	amdgpu_ttm_enable_buffer_funcs(adev);
-
 	if (r)
 		return r;
 
@@ -4505,8 +4503,6 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
 	if (r)
 		goto unwind_userq;
 
-	amdgpu_ttm_disable_buffer_funcs(adev);
-
 	amdgpu_fence_driver_hw_fini(adev);
 
 	r = amdgpu_device_ip_suspend_phase2(adev);
@@ -4519,7 +4515,6 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
 	return 0;
 
 unwind_evict:
-	amdgpu_ttm_enable_buffer_funcs(adev);
 	amdgpu_fence_driver_hw_init(adev);
 
 unwind_userq:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 6c6ab4dd6ea9..95f879e723ea 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2099,7 +2099,6 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	}
 
 	/* Change the size here instead of the init above so only lpfn is affected */
-	amdgpu_ttm_disable_buffer_funcs(adev);
 #ifdef CONFIG_64BIT
 #ifdef CONFIG_X86
 	if (adev->gmc.xgmi.connected_to_cpu)
-- 
2.43.0

