Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GALgGSLCnmnsXAQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Feb 2026 10:34:26 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6B519510B
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Feb 2026 10:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E03C89A5D;
	Wed, 25 Feb 2026 09:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vQmPsj6r";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F95E89A5D
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Feb 2026 09:34:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzKWSotVTHfEfFkxvoEAWotglpQaYpVjg839NbqLInzAUUY1bWBy+vI0Tgcewubv6QLSxYKJ83f20Q3/rjZcTTn6mEY5ZMcHUYoGvz6kAJZx1o1K2oX2olDVkcPOGvMyfPi3OAOckQNBykDmkn7ZkklwqoiFnmKQ286JZl62YDCPNOoh71SsGaTqsRXkgGiLu9+ambfi3dwFiE/83xYU7uz417xlz8wD4krqgHpEt7hoZIh1LfW9phdLKcod+2INiWi0KAty4ZXsTw0ZAK0aXAk54hCi0xt61VFH7aG7Bwhs9BREyU+RfPWknNHm9arRFQ4640PMx7f71L+2BVEdzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbyYs9li9BH2daciUYdnci1FqxohdAtETZjjtabFC3Q=;
 b=h3AtvRFUzCStvEXRzap0PzC9Pp7Tsimf19kR7DSiQeHKJzox054t3vqQE4Obj+JsYkzcrwZSUy2jPWlQAI6WKPPllAEN87n3VOlddvxgW9DXBCzL1W2m5L8rg0TanbouQEuwg1S8mSNRy8MB5L67kmQfRtwNRCoEB+aP/MLyGk+b/f7xjUXlNEw9Fuxvhd7d5/Sqb+oCcdO+WholgApVoaCbz+2aXkgr04BpC1gThQb4bZo691557bh9AFy457hDl4oVtT2WZEmQ83CfdDoB9/WVfG+t3RG/z9W+j2ipguo5jeapqSV2v1TaedSfhfQaJ59R7T1+kihHvzcP2imehw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbyYs9li9BH2daciUYdnci1FqxohdAtETZjjtabFC3Q=;
 b=vQmPsj6r1fKYgWHU1mtp1x80asGblrhtDYhw5e6S/kpHXQYwCpBZzmDqTw/x8TMe2p/9TcGd4Al45VYMfc7QwXBSaApCwaCEjSd8oJHmAd7clRRNCbjHfgS0b5F6oBcVpmzo9WRCmqeND4M7iyvXu/tzJDcdpFQpn+TKO/SVils=
Received: from SA0PR11CA0108.namprd11.prod.outlook.com (2603:10b6:806:d1::23)
 by IA0PR12MB7602.namprd12.prod.outlook.com (2603:10b6:208:43a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 09:34:19 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:d1:cafe::1b) by SA0PR11CA0108.outlook.office365.com
 (2603:10b6:806:d1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 09:33:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 09:34:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 03:34:18 -0600
Received: from kevin-mlse-vm.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 01:34:16 -0800
From: Yang Wang <kevinyang.wang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <hawking.zhang@amd.com>,
 <kenneth.feng@amd.com>
Subject: [PATCH] drm/amd/pm: restrict sensor load values to 0-100
Date: Wed, 25 Feb 2026 04:34:06 -0500
Message-ID: <20260225093406.498727-1-kevinyang.wang@amd.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|IA0PR12MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: 03008ab3-e5b1-4399-96cf-08de74510c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: wlxpHuLBZZoMaaDOcZZjP6+hSRYQRASt7izaPGOZnxDfv2ri8ZgCu78wdO9Q5oc/5fjbKCt4SbkQlJ80MBjpz/8y2OW/zXNmqVLZKlxkhLG8X6/uQ9TcyKfRriXcpToBKzGiMrjBl8lCL8rBeatuEcLQBPHH6fWwxbeNlhhM0EzKKZy2r4U6UCZw3stwDGQOtJzTfBo3+4LGHqS8SwSX4MxtZpe4BsDLyTLxhfaGbTRVYnpnqEzDT+20b9USF+BGFmF8A0Nz9nq2L53GjbaUx4VuGHaSa6fur+QquruN72rXZugzJJ1TIWqQEMqBaBD5A87vyRQEOwa0BohA0HBgRyxuwK1+hslUXyw8JWiFrdv1FeKTAW8zbbZNF1TUIkyh5z66wAe4+6An7hCsSMIpJMceDwO4f/Wd/vpnCrI+dHgk/Jw0ldmswQVPFZegJ1wUNBZsRlBRBhM6AduEOWMDeofNBPup54Fi6LP3CzVX+3gYWe+4lUsbls2xi5uYJw2iopZGrPypxPpT4w0/6QcWCT5H5SmY1bcBch8hi82ue7gUaFJ1SA2OSX9bvTQwHoubnErlCG0/hi7LCpXxHq3vvuygZs6RigZzTaFh61JeKWYxMB2Tj1yIkifylSoEoU/adU4VQvjwx6WNdOQqRLpjBEXqtGn+4/VXQPUBqymd/iLkF2ttONrwH29YaYtyV8F9mBKjIsbX4uClGCD+kp9PP/GINLftITTA5PrmbhxnY32mCpF3yaD9DKVCJaLNYxUvlReVoYJT7YiL6Mve4+UMQs2rywNqujUjDbKW7419LS8EvfVqhFdaTUFEkYzzPR+Rn5Q+XSQ7nBW8KdFpeQ2euQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VLZvoP669D9jwMtxNRhwCiK9me5oC+3SmJi6cK7MmD/7oUOEPotwGIuR6JyD028DbdPdSq4nj+aiv1cTzyhDIZqgIrW62CshqKVvxnrtpFOzN7PgJRYpfymjV/Jx/tnvDgU7txyV5wn3zzNAV/+YryEGVcQTo4Mlsw+UIQ6azJPr6nnyzH4Zus5QQZolt8dSfRqI6x72cui9+z+3PAlsjX1xab5ySsft8zd6MpVOzEJ4Habisk06BviC1UAEQzekxdtsSSP/itwgrJlJYP1bE4yfW0BjPcElzWXbfdyBcDEFUVOHYcHolNDDNbRnjU+FIUlAmMEa4bmcF6TcgHRnGQQqgw4f3SgohJMW66IajpV8kYTHSxbwD/dvXu3psn+NSGL6eRA4foyhqNz7Z7NVcguKYTQwV5bL/nIxNwH4Z1id71IHVI89DJUk9HEjF1Wn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 09:34:18.4574 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03008ab3-e5b1-4399-96cf-08de74510c91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7602
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[kevinyang.wang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC6B519510B
X-Rspamd-Action: no action

Limit GPU/MEM/VCN load sensor values to 0-100 range via clamp_t to ensure
validity.

Signed-off-by: Yang Wang <kevinyang.wang@amd.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 938361ecae05..86ef1ffbf1dd 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -1414,20 +1414,39 @@ static ssize_t amdgpu_set_pp_power_profile_mode(struct device *dev,
 
 static int amdgpu_pm_get_sensor_generic(struct amdgpu_device *adev,
 					enum amd_pp_sensors sensor,
-					void *query)
+					uint32_t *val)
 {
-	int r, size = sizeof(uint32_t);
+	uint32_t tmp = UINT_MAX, size = sizeof(tmp);
+	int r;
+
+	if (!val)
+		return -EINVAL;
 
 	r = amdgpu_pm_get_access_if_active(adev);
 	if (r)
 		return r;
 
 	/* get the sensor value */
-	r = amdgpu_dpm_read_sensor(adev, sensor, query, &size);
+	r = amdgpu_dpm_read_sensor(adev, sensor, (void *)&tmp, &size);
 
 	amdgpu_pm_put_access(adev);
 
-	return r;
+	if (r)
+		return r;
+
+	switch (sensor) {
+	case AMDGPU_PP_SENSOR_GPU_LOAD:
+	case AMDGPU_PP_SENSOR_MEM_LOAD:
+	case AMDGPU_PP_SENSOR_VCN_LOAD:
+		tmp = clamp_t(uint32_t, tmp, 0, 100);
+		break;
+	default:
+		break;
+	}
+
+	*val = tmp;
+
+	return 0;
 }
 
 /**
-- 
2.47.3

