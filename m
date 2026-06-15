Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id clklARuQL2o/CgUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 07:39:39 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1756838A6
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 07:39:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=ncqETvRL;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB5410E1BF;
	Mon, 15 Jun 2026 05:39:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011034.outbound.protection.outlook.com [40.107.208.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B5210E1BB
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 05:39:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIqUB1AJS+6P7aXbTvk9QIkxBUltZjjlRjGh4ZddR5oleLYvMX+mZfbKeqo+1XYFya8n+8pGjfoHSUvdfUwkk+G9czeF16WKt7XVPn5vcdH1kFKat1JDQrIlrSIrgEGNLQ/rq31PWYJ7hMXZL/YyQFzGW/KJcaSfWl8f8AAnQ5jgKiof1ooeju5c2/hEmE17yPPg0UoC5cr4KpTHkSa9Qroi49goDw9JSWFK56GKYw7KN2T1nArF+JhmIIguBkglY5vBVkuNtZ1b9LtJI8RSCB0BodZRMQ4yqjHmC9wlxDcPMtHDK5RlVbszaemLiaF9ibZiLI/I48GhRlMRp+qAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbMLAFaLGhrCPwN7cRnUuNMeu/9lgBCSmNL28hxEYs4=;
 b=l4H/CeHHjI2FD2x6GIdghyM6c9lYHa+9a7pYgSs+vIajDA1QqPj3zlfjhpnSCtPn13bNNshIGkgjEq/nMRLy+zQSmw4oxjTttwsodo6TZQYNJJYT8vReAnZz6pGaeDk7WFXznKZOG/3HRltZNcn3Wye3LlOoWTGTqPjQTKWvM/jMPj19dmvMeFB63uNYQLOvPnFkgoAq9WN0Xj22pBOTx4zI2TR91FQiag2ZUc6i1EYbtPP0uJWuFrX6WvRVI4krPD7cqcXeqvjuiQgEGA7VrXxsB74WfncVZ6UlBfVfSqYrm7ekFkIEgmV2VZV99g5UJijggpuW1Ct7WHS27oxAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbMLAFaLGhrCPwN7cRnUuNMeu/9lgBCSmNL28hxEYs4=;
 b=ncqETvRL0KwY8aD0GZMdezstYFN3Nl2dDZhddboXuB+kvwu2ldevhHxB8pBdNngTffsI/eZipAd8NDlyAth0MYVa6Mh/9w84uTyOydXrz7RGNZpJAxrEay1wwVqydZd64nt1UODr/VX75WiYS8HZvhxwVwvlo/YFpKBnQH9HPss=
Received: from PH7PR10CA0011.namprd10.prod.outlook.com (2603:10b6:510:23d::12)
 by CH3PR12MB9313.namprd12.prod.outlook.com (2603:10b6:610:1ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 05:39:31 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::a8) by PH7PR10CA0011.outlook.office365.com
 (2603:10b6:510:23d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 05:39:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 05:39:30 +0000
Received: from mlse-blrlinux-ll.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 00:39:28 -0500
From: Lijo Lazar <lijo.lazar@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <Alexander.Deucher@amd.com>,
 <Asad.Kamal@amd.com>, <candice.li@amd.com>
Subject: [PATCH] drm/amdgpu: Add checks to vbios fetch through ATRM
Date: Mon, 15 Jun 2026 11:09:11 +0530
Message-ID: <20260615053911.59876-1-lijo.lazar@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CH3PR12MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: 878320c8-4d27-41d1-573c-08decaa07929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 7PWOSUmsRNHdKYLOlRCGaBJ4m4m2Gx9EXzTMu8rCRA4FuMUxW1PZhjFYqw9v6LiheubxBEaWWWvGDiBoUWLPJleJZbEDPean02y5G+qUuN+yE/2RgBqp9TClV5eqgNRDOlKw0F8jIfAYa2ewpJO1/AHo+NC/clATGUlFaF9ZJO7bjvZ+ZquPDBwby4bwaNko1HBCfAlKt8aFgXFKaI8OXg4mR8Iacry1c5919UtkQg64gWklusx15WKnlYol3neAWiNLv2VNWW1vkzHQ7QRXl8HRIseMPllkeMZKxVgMh7aS/7Xw629I5TAqx5EccYrXRJBVci1CrCQ8coONrFXngqsFu9sPMoo0mddphlSkUVmEFmnDR2EeLmePAmxEpbp3P8NCfnrQKZTJk0RVi1Z8T+uuQQj1ujoy9RB1u6K+ibcMiOWTT5iz3xtGt1+YOZ9LXFOqDDOLDAJXK9FX0OrSwDUvNWJSvzn3jh+zVT1cptzrV6zPn/Uz0g3+oNNoo4yG16yTPs4GTuH6eKx7LNWk5QewIfpmcl4xWKLVysNMZvqj2Q1ELv9ox/UdoLdHZE9nxgDZROtrQo9FZzMVA6ux/4pLOV+WESlHDMgNSQIa1mRO+Cqbk3/5iabLHPazUkviSZP3xzOllKm03Hbyr7DBkOQw4/+gx+rd1O4sRgAK0/ejODOLOEgqsj/FbnvAnI5MoZcQpHD37e8aOOFnZpI8hyK8GhiZbsW+KN/tWA184ls=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jopGSX3EWPY8/TqkHBGfgKD0EwBKBTkLNpexHeIj7KJ4EEmpTVjc2osxq6bgza/U0Pukudg4uZPu/O+FMQowUoL8IBEu7LThGTP2ItYXaK6v5oFKGV0l7ZqP6J7YFoNJ10KZu8GG1Y02cNgtLKuM0JfB3dhY7Can+DZC2y3L/frIQ2AWneKLuTnTSMWCYi58t6L9XNEyiS4cj0PX0jKnlZjhTZm3pSxp0QnYl31fdForEfxIdXcxBAHlAd3sAmlPJZ7hQ0/M48J0PORYOZkUmcyBMbrsX2lxTL0r22WscwT/q82lLalmw1ARnyM9vRyqiwiGozhZpT//JdDGEOSMMzAK+sR/dy27zvdLLEaHBFDZ9xeRqkiZdHHkl9g92CMBovHlIivl9I2SoSH2a0n001Y9bbYR4aKxMBnWMX+QohxVm3C+REnkETX5k2mNqxR3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 05:39:30.8885 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 878320c8-4d27-41d1-573c-08decaa07929
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9313
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lijo.lazar@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A1756838A6

Check if a valid buffer object is returned after ATRM call. Also, match
the buffer length against requested size before copying.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
index aa039e148a5e..3ebdd792feec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
@@ -296,8 +296,14 @@ static int amdgpu_atrm_call(acpi_handle atrm_handle, uint8_t *bios,
 	}
 
 	obj = (union acpi_object *)buffer.pointer;
-	memcpy(bios+offset, obj->buffer.pointer, obj->buffer.length);
-	len = obj->buffer.length;
+	if (!obj || obj->type != ACPI_TYPE_BUFFER) {
+		DRM_ERROR("ATRM returned an invalid object\n");
+		kfree(buffer.pointer);
+		return -EINVAL;
+	}
+
+	len = min_t(size_t, obj->buffer.length, len);
+	memcpy(bios+offset, obj->buffer.pointer, len);
 	kfree(buffer.pointer);
 	return len;
 }
-- 
2.49.0

