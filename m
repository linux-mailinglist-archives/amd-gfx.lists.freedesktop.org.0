Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFfpFsG+smmvPAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 14:25:21 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4246272750
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 14:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6EE10E9E7;
	Thu, 12 Mar 2026 13:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C7WmJs/T";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012030.outbound.protection.outlook.com
 [40.93.195.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEA110E9E7
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Mar 2026 13:25:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYp/k/gbUwkO0N21ht2GlvsTisMVcJW2/AKi0xEDdIGkDyhkTKqDo0KN3b0n/BlwGSBU2ZhM8KsW7AaOzD3RN55JIME6rQ2nRjyg068oGVOmonnU5A+Th5QEnH1lY9tXxxr+mtjs/hXtQDbZAYIuoibXAv+vdJ52hwx0Mtic2FTgh0sj833ZhWJySQc0ly3lPMIB5cog3c8hlhIIZefa/ywnokahPrfRpPBQ5WOwueEUIU8GOAKCjAdIFrp+xgVA6Y6NufqrKkIV+/mHF/XBnpQovkW+B5H11IsFs1N888GTgjM6OlGaFwen2DcVh4Rpq6CxlKzEeY+dN+ldoVft7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFd+Opq3H5QlVX7wFmGuBZ1ffDTo6L/e0Wgu0l4ZXKg=;
 b=KZ8d0QZLcs6Sr0Yu5WPsI05hi1xwLuxCo5RMh15hZ8Anc87MkoDbrGGIXM0RJdsJ7iiHZ2GINxd9qVS+fDDZ2iUz86mK7vihwbWdwm8INYthIuzm3dpwYBkJ+yJPTA/9Ssp/vsBCnTG/yN2uDRfOUrOLWTaxTai3C8eslIMBz3ypiy2GkYSZ7TizeW/WZN+0IDb877+EbxY4uiJElD13t+dx9gnFgVlvaKJCx4O2VwYDUPOq7iFZcq4Q1bwiuWsv73w4SqGOOgs3ueaJMEHyEQFDdVVDYhCd+IyBq7uu7nJOgJMFX3rYaVwoHvE2Y538TZmIpenY1Pr/9gJAnOMGaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFd+Opq3H5QlVX7wFmGuBZ1ffDTo6L/e0Wgu0l4ZXKg=;
 b=C7WmJs/TGO5Ly436YyZs73GRqUV0MdWcl6gDvJrl50G8t4U9xzpEIfVz6Kkzl6OhpxBSpHPd+hyhVv8u43ZH1aQzGJa6qRF9g4W0AENXT7YAwbc0GN3UEDea3hyS4mroM51p5zqVHr70W2OLyLZE46zVI9smK4loiHXghybLH2M=
Received: from BYAPR21CA0011.namprd21.prod.outlook.com (2603:10b6:a03:114::21)
 by DM6PR12MB4105.namprd12.prod.outlook.com (2603:10b6:5:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 13:25:12 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::77) by BYAPR21CA0011.outlook.office365.com
 (2603:10b6:a03:114::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.6 via Frontend Transport; Thu,
 12 Mar 2026 13:25:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 13:25:11 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 12 Mar 2026 08:25:04 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Ellen Pan <yunru.pan@amd.com>, Lijo Lazar <lijo.lazar@amd.com>
Subject: [PATCH] drm/amdgpu: Remove dead negative offset check in
 amdgpu_virt_init_critical_region()
Date: Thu, 12 Mar 2026 18:54:56 +0530
Message-ID: <20260312132456.1839323-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|DM6PR12MB4105:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c6845a4-6041-441b-b05b-08de803ac9db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: QMj2iUn0prwTxawU4S8BpZZP6fNzXVW8tsWW/hdz1NY/+HeoKHspceARH0FXQHP7Aao/e3g/qF/R7rDq3a6tM5SM7JYxAbkDSP9iRloNRLpJ+AHci3HubnRCLb48MfBpUoNw47fHUetk2LX47aclAOyhTaUCr9Rh/7y9A29gfjLKmlT3J2tzVOPD+IpMg74Kt5/qXt9+4E4+HC+OzT8Ie0YfATiGT0gMQucyPRJel70g1THAGO80A7q5tmNVDXh7k9Ip5sI7f3H5JAWrmkngb50DEUGWEOj35OLpAUwqBWXWRx6Bp1rDpH6CIan67l750eTk2JrS0RlzsYNG+p6VnfTObyRVvEoQsb1BICxLyuoR+X1RQPLtSZeJw4acTcIMHqTfFPQzmxXFIIOQQGTHSFAxAHN+8T/lcPSZ7DktmZ+qfEoPHc+6kH8PyXjktxHen8jDomb2XHO0MJyIvXFYYhgRtHJAqo9AmzSixCf5S6iRVNMlYLwrA4WVWtnj37XhuUHjUkWaWjlaTs01Ns4dOEycT7hklD6gXRdb26d3TlFK4Mv14MQLHy3A17ctIuVW+jcmKtSMcvMUQW7zmIOtLn/WNU3lBmyEChbQBP1RknYOYrLIgdG9gsgBf7spEB1v62qcSmJyy1GFi2xQq8hvUJMcHrvuqPetfBZN+rVbhc/zZc9CrwZ89+xYfOuSXQ9pUM5jextX7ANKChzKo1QK0RZROTaL5NyfgY56fyU2PNpq3M62Y+YR6V2IcxFVlcL3KTaos62gwouFwjTe53ab2w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zhk6QLYSi3FahgXFH1yctn7ggr3Y44xsJM6YTBLqHY5LUdnUO4P4m7mkzTeN0O2OkRO+j2ZVDGYgt/pxwnQLEQY/00OKxAE9gvnXE3/mc4EmOKZlFV458MNjINpkYZT8HbyNGWgMJugY6aapb/4W0uv4ctZnapB1S4bK0EBqI6XzFO5WOt6RL5RDT8GwwS9kJ+tf+BCqfgTEFKmdbA8BoUgkqCJl9CF9Ec4S1OdAMP63ymMu0EIa5Fp5d0axItCyPDezaC14CC4nvwgywX/PxDjH3NXxcjdP5OoIS6z4ZGPkvuZUeHkbLojxVwZcLaYbm3UoKryrQPinrp3ueX19ob3+Nuw8pkHAM0PPHwGzkqR8YIn3andkJ9XOpG3w3kTerpxzDOYdU3vcHu0ZnjaW0wXQlm17m3xwfnYASYGN0ExAvPOgSpdu6c1wX9I9R3Mi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 13:25:11.4909 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6845a4-6041-441b-b05b-08de803ac9db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4105
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:srinivasan.shanmugam@amd.com,m:dan.carpenter@linaro.org,m:yunru.pan@amd.com,m:lijo.lazar@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A4246272750
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

amdgpu_virt_init_critical_region() stores init_hdr_offset as u64.
The subsequent check for init_hdr_offset < 0 is therefore always false.

Drop the unreachable validation and rely on the existing
check_add_overflow() and VRAM end bounds check for offset validation.

This resolves the Smatch warning about comparing an unsigned value
against zero.

drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:953 amdgpu_virt_init_critical_region() warn: unsigned 'init_hdr_offset' is never less than zero.

Fixes: 07009df6494d ("drm/amdgpu: Introduce SRIOV critical regions v2 during VF init")
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ellen Pan <yunru.pan@amd.com>
Cc: Lijo Lazar <lijo.lazar@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index f01f38509108..07f0f17bad49 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -950,11 +950,6 @@ int amdgpu_virt_init_critical_region(struct amdgpu_device *adev)
 	if (adev->virt.req_init_data_ver != GPU_CRIT_REGION_V2)
 		return 0;
 
-	if (init_hdr_offset < 0) {
-		dev_err(adev->dev, "Invalid init header offset\n");
-		return -EINVAL;
-	}
-
 	vram_size = RREG32(mmRCC_CONFIG_MEMSIZE);
 	if (!vram_size || vram_size == U32_MAX)
 		return -EINVAL;
-- 
2.34.1

