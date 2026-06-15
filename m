Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v4J8Et1rMGqNSwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 23:17:17 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49D568A224
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 23:17:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=yPLWNDKl;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B28310E6F4;
	Mon, 15 Jun 2026 21:17:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013031.outbound.protection.outlook.com
 [40.107.201.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4960610E6CD
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 21:17:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSEUFbzUoA+1XouqYWDme1QK+cKxjQPuC3C05uuiCCuEQuyh4zwYOAxAQEPFrtpt3GC1GqLoJwgepjoM9Crza9XbMqsqsKpAvLBsf1m5Ck70jnz3+INRlbLqim+LF01adrGeX9/Gk6z83Lx6VRtQ3AsVM4BKQcNCHGxT46pLxSUVBgKmesrblJRH3nlbggFGUrxqWsuv7Efd55LtN97fBMs9dzRmzC2gLXWi9qPcybs9CZ1ktmNUcaO8IPiDXOpd12SeZ5fisKrf7GoGsqU3OhkM6PINfW6flw690gHP89w+8OHuUBwaYi3PuyEn9QPVd4+yuwuuKlo+bmnjsZGtPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWV1jIUpKPKTQo3tHf+8p3I4kS5zDf0nurf8pOqcb8Y=;
 b=BYRZyunW+RD7a1eo/e9p6PMyR90rylryl7NZ9qo25Aauy7dNw6BcGXY5/VgL/IBsN8rqztL1k7X1ho/UFsuBGRibCaFnHQI7l07Sl8VHM0RPGqb4gr6eaS7dVHl1qcqnYKS9yeZHbz86F9euQJrkwbC3JFV2vj4e1vE8fy5F9pV45zqfc3MSX/2quWkSjTs3fuoeEFsoiyLeotj7C5601E4+OV4/pFg9ZcDZF8O2gCG+nuvHR2xeuHXbjk10wx46X+HbxypPgg56FTXZgN+ehkTKTN0mM8XdA5J8YIcVQdXp5AJt6FDsKrjBzazAKsIeERcpaF9IQ1Kun/klr6k17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWV1jIUpKPKTQo3tHf+8p3I4kS5zDf0nurf8pOqcb8Y=;
 b=yPLWNDKlZybJanq/99TzdwJkfEwRULG+tnVktwAJf74bPhqUZqMIUoBIWnpjoc+0DuRXkC0jEcG9me8Z1Y1Wd68vpA7IcRBMO40bPKqZ3AOvARj+fBHPcTP/LYcDfz7FwzDL9HM76hV/SHkUAWrSG9Szpy+DLUmwqM5tyB4NxDQ=
Received: from SJ0PR03CA0117.namprd03.prod.outlook.com (2603:10b6:a03:333::32)
 by MN0PR12MB6149.namprd12.prod.outlook.com (2603:10b6:208:3c7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 21:17:09 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::33) by SJ0PR03CA0117.outlook.office365.com
 (2603:10b6:a03:333::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 21:17:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 21:17:08 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 16:17:07 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 16:17:07 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 15 Jun 2026 16:17:07 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Kent.Russell@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 2/9] drm/amdgpu/jpeg4.0.3: add support for disabling kernel
 queues
Date: Mon, 15 Jun 2026 17:16:47 -0400
Message-ID: <20260615211654.676386-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615211654.676386-1-alexander.deucher@amd.com>
References: <20260615211654.676386-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|MN0PR12MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 77dc851e-fb77-446f-6b98-08decb237594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Vwo8Mc3Fs01o83gLUVAKQosm64/6pxEP2ao26DCBdBCGmoJCoOZNUWbsMy/WZDpzG2fmdvYElm041yeEY6OvG6592SzGiXoYBoOhuBdaYILWTGWGEZxSIBl2w/vbwOhSAbOvyPcEwjQT7N1PxjJY89PpxFFxTsxLOLTNCc3lroYRK/tI83R83sOZ0mDsKNfK872kksv+dhklk8+d3Zs3q1/P3wIMFg21nQ9yUytCmeRtOaZuCkfgCt3IVnumBBCjoQOJ1tl5Gu7cHsR4VnsPXWGBTgVx9F6CHjoQ6fH8pmytogW54911elzezU3Zt3gKqjMYv3x9ArmicESZca6Ke/boYnTG/bQv2GD4MOSYIFeH/vfBSm50m9jRWuyHbdpZgR4EJjGbZ5f1NG3CvYYBgjILlnNBbY8Q8HGRf3MGnnVGN7kVNbb++jTEwsXOoLN0DUwFSJkbQUkqdxcoLDgpHtx5td0oUErCMkBDM3/KW1Z+yaI2eL3+Znvyklzrtk0RKf8g12jXKeHOnld2NnP4MM+XFAem+Clrlfl9C0kFqZ2PhfHLH6rwG8bSEYZhpR7Xp/G+oW8l0bOoFthIrPYB8r+y02RMTiO6gnm4OkCZaL2cRlV6ADQoSY1vGoZoSMxcNmI/UzpV5jEZRXrn4ZOMAe8LKegfD88Hh8MYswumMyDYN9XcEpdYpozqpkJL+EyTuLA8t1Hkecdq8D6Kod778Dx2ED+LWBSRh+mWf1GElvM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OwHfSZ5gT2EdKb/RQeVDnvxVYyGBs8kOOkYq8ZTyyeMm8BZteYspweq5q+Ws1OoqEPD7doHNADdqX3cYo+eZA+mXhs86gX6QZg8qDZXEZOHzibdLhc70DTkudPT1wT92KENCmwXE+Iq1IJG8FhPvfk0fKZNM0ht0hGV7hQMZktFWy+RPApcPHjGCrCl2v1JhY5jH4IbF4khAmGaHeFbgVsRQ2+BaQenJoxRgnT3i+QIUZzYDRMmYVy9Dq4t8a+kJGfpyJzK8zqCvaABEw/CrDSDT0oKlvRO7howIEn/dXiC8nA7sFxnFJChJAJxYnTE2CFB7WgpGd4Ywb90oc9PbqzbhvMv4C23rR7xp03nesDC7Xm2Ul1F5vV0dxiC9v3M/PL7JKVfnS++ppJPDPi9I3u54EgnblQ/tZm2RtjhUaqCY5KiFXvTvSktfcHKUz3lb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 21:17:08.9469 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77dc851e-fb77-446f-6b98-08decb237594
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6149
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E49D568A224

Allow the user to disable kernel queues.  This can be used
to free up vmid resources if kernel queues are not needed.

Set amdgpu.user_queue=2 to disable kernel queues.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
index 0c746580de113..b0bdb449538e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
@@ -119,6 +119,19 @@ static int jpeg_v4_0_3_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
 
+	switch (amdgpu_user_queue) {
+	case -1:
+	case 0:
+	default:
+		adev->jpeg.disable_kq = false;
+		adev->jpeg.disable_uq = true;
+		break;
+	case 2:
+		adev->jpeg.disable_kq = true;
+		adev->jpeg.disable_uq = true;
+		break;
+	}
+
 	adev->jpeg.num_jpeg_rings = AMDGPU_MAX_JPEG_RINGS_4_0_3;
 
 	jpeg_v4_0_3_set_dec_ring_funcs(adev);
@@ -175,6 +188,10 @@ static int jpeg_v4_0_3_sw_init(struct amdgpu_ip_block *ip_block)
 		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
 			ring = &adev->jpeg.inst[i].ring_dec[j];
 			ring->use_doorbell = true;
+			if (adev->jpeg.disable_kq) {
+				ring->no_scheduler = true;
+				ring->no_user_submission = true;
+			}
 			ring->vm_hub = AMDGPU_MMHUB0(adev->jpeg.inst[i].aid_id);
 			if (!amdgpu_sriov_vf(adev)) {
 				ring->doorbell_index =
-- 
2.54.0

