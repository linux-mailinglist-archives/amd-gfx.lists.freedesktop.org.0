Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /HyLMaOmS2qQXwEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 06 Jul 2026 14:59:15 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D27F710E8A
	for <lists+amd-gfx@lfdr.de>; Mon, 06 Jul 2026 14:59:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=q85eH9pP;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A0010E972;
	Mon,  6 Jul 2026 12:59:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010045.outbound.protection.outlook.com
 [52.101.193.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF4710E972
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jul 2026 12:59:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6HJJcxB+gxpEavF2fUdePIhAuamPdsN307JSFJle5sw/xu2XPykNvFdUFTgQbmt5+ASzOT8xfMeNX21hlN13sS3ESAKAjiF9CJJeu7786ZbgtdFgK9ZMzIQNTY9FnNdmiOMqOSdSjX+lGCSpjFjO8WohUtDZMOt1d+fT5A6piSrhobn4/Am0ctXl4EUxIloPOqvDhFkrsEmZ8bjwiZogqbj61tKJvMhhuGRA827C/zUZ5ldOVE8pL7eYvIu/Nyezu02UNzN3faymq3uY7Ujhst2X3699PmmpIRyYPV3jAVgeJCOSIr7kgWQ8qrWHZVel6fc+sgcPDcR5aVaBTZMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdO/TQK3X+AWxUx+0cMArZa89PXuLl4ZVFVP3E9ZMGE=;
 b=tf2TFFH2T0zQ18afRcS9AiBJytp5rVz6sDcEjwU/Gml7M46AgxUmGNk8L6acVtIPwvSVVvd1by2NVzUwFmzlGwt7E7YHggPwAQZWkDUDnivjPjH9nuivdMLvQKH5fnWvjlNQUfIcJSrJON36x7ZRN5mHcJYrAv7813wzNW2GoNqr2OH17nrcVxDPSPfz6E54r+VUFf3VrsaeU2SubFmVzLFQr6NYIBNxqH9aOcRi9kwMAg5t0EUU7oi6tYIksasX0B5A4i9oPSJwaFrngOxgUCz/muS+8qYkxx19nFqeHbI4qh7N3AMfjHfDcSjDqyr3Z1zMmGOxkmY0fBGsLVmndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdO/TQK3X+AWxUx+0cMArZa89PXuLl4ZVFVP3E9ZMGE=;
 b=q85eH9pPoYiP/x73SBX2YcTnz+iFsfXguVLGZKalIz20NvmUYZE21QU+0yAADcP/bWL762SiPdaCfqHXVxG8SG8LaRXqnbIAhxJU+RjnAPpjQPCRNtKlYKGEXl8njY5zZ0RPjqSZ2aiw0R0XtfVJuCnrD1qtorKseJ82FQzDctU=
Received: from BN9PR03CA0669.namprd03.prod.outlook.com (2603:10b6:408:10e::14)
 by IA0PR12MB8894.namprd12.prod.outlook.com (2603:10b6:208:483::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 12:59:08 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::1d) by BN9PR03CA0669.outlook.office365.com
 (2603:10b6:408:10e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 12:59:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 12:59:07 +0000
Received: from amd-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 6 Jul
 2026 07:59:07 -0500
From: Shahyan Soltani <shahyan.soltani@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <christian.koenig@amd.com>
Subject: [PATCH] drm/amdgpu: fix lifetime issue of
 amdgpu_vm_get_task_info_pasid()
Date: Mon, 6 Jul 2026 08:58:56 -0400
Message-ID: <20260706125856.634904-1-shahyan.soltani@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|IA0PR12MB8894:EE_
X-MS-Office365-Filtering-Correlation-Id: 3393066f-a2bd-4585-0632-08dedb5e5dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: AeqFz82026SZ1TggHcp6qNTjU6LAmGKqUjjqdDH9GGtEZML9hzrU++4Q5pU5VMbWtVYmXsHZEcK1dKriv7nE0IKCKuVvTEy3kup4ta0vQj9VwrhM0GXvfVc7aYMqqiYO+cDjS+rvkvQwa06LDObMLu/yh6Wa0NoYt9CL7txJoUb+4E85gHMDbTrxeYxmrtlacCsvS7oNIGwnopuegVFb1OaA+Jm0EZ+tBYgbUDzob22top1sZe0fXAThwBFDR/j5Bx3CgU3n0lem68K4PWQWnQ08O/uy7r0mEbMYqJM4yAHL9J09x9vymXETAkVWIkbC5fz648XWRu95KjN0edZKo06FyjsAw8vnMNYIOYnHlyYENGq+m6ylX8dle3Iov0Ax5ZSPjtWNFInTd3RsKKg87Ul2J6nfrXwOuJhWxgw9UohnKiqJ4w17JDF4xNasWgume8Alhtan0Qj0X2n9HRamxDckOgfrO5drLAzo8r6F0Ldb+kGTZ5kcvSsgspYsfiTuM/2G+NqWINNSekHPMelhXoU/EwWFIxgktcuKXl9Akj2/7u+bW2BtfGZ7Znwn418Ca6rm6J+kyLf7ykc4gpQe5XzFzguM8s6kdLdUTERPe658TGcvCBgQ8VzyHDKoGPT8ohFPRsR7q75b5aLwxpeA6UzZKUvudES8jIjmDivHX1VzUKbe2q7N26U1jcLggpt0G03fu44Fmd0TZ70n5Wsv6Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eDXc4STqDCixN6EET53+qBBXRODNLYQyK8iwvjgIG2JtyUVSY+mhnmDpOqxVP5R55UJhqlqkZnaXN71pnPRM/BJLj9O0eAFn3bxd0h/NhidfKgOp8vJ4iKgSjcPcs64hM89JLLO+1ORaFvPAwqpi0ENd0rPG0qfx8gfEt6BKhxdY6r6RI/7flU8PfCJgN8qKqFH/OWAXe9B9Gp65pfBkBesqYAMGCcNDr/dsLHKN1j8WkVY6qnYpu8tTb0GD2NDft/ww9sFAQvGYHJuFFyVA7CZs+BFQBZ6TesbtO6gmJ+yKguZpoizRaKbnpp+m3VXF7RhRLmgOdBUFmQa6/pKqYr5lNGp6gLtDz3XlxhTjY6MZxu/h5sw2gdoLEaf1PgNSwk07A3PBlEFtOmGx9MepdpbTOE2Veot48Vb5bgB/L6c391Hr2M9ztoRxXF/Cfq9Y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 12:59:07.9960 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3393066f-a2bd-4585-0632-08dedb5e5dce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8894
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shahyan.soltani@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D27F710E8A

The vm pointer returned from amdgpu_vm_get_vm_from_pasid() is only
valid while the lock is still being held. Once xa_unlock_irqrestore is
called and returned, the pointer is no longer under lock and is subject
to modification. Since, the caller still dereferences vm->task_info in
amdgpu_vm_get_task_info_vm() after the lock is removed, this causes a
use after unlock problem.

Remove the lifetime issue present in amdgpu_vm_get_task_info_pasid()
through removing the amdgpu_vm_get_vm_from_pasid() function from
amdgpu_vm.c and making the relevant code inline to hold the lock while
it is still in use.

Signed-off-by: Shahyan Soltani <shahyan.soltani@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 32719f31b6c9..180d694323e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2460,19 +2460,6 @@ static void amdgpu_vm_destroy_task_info(struct kref *kref)
 	kfree(ti);
 }
 
-static inline struct amdgpu_vm *
-amdgpu_vm_get_vm_from_pasid(struct amdgpu_device *adev, u32 pasid)
-{
-	struct amdgpu_vm *vm;
-	unsigned long flags;
-
-	xa_lock_irqsave(&adev->vm_manager.pasids, flags);
-	vm = xa_load(&adev->vm_manager.pasids, pasid);
-	xa_unlock_irqrestore(&adev->vm_manager.pasids, flags);
-
-	return vm;
-}
-
 /**
  * amdgpu_vm_put_task_info - reference down the vm task_info ptr
  *
@@ -2519,8 +2506,16 @@ amdgpu_vm_get_task_info_vm(struct amdgpu_vm *vm)
 struct amdgpu_task_info *
 amdgpu_vm_get_task_info_pasid(struct amdgpu_device *adev, u32 pasid)
 {
-	return amdgpu_vm_get_task_info_vm(
-			amdgpu_vm_get_vm_from_pasid(adev, pasid));
+	struct amdgpu_task_info *ti;
+	struct amdgpu_vm *vm;
+	unsigned long flags;
+
+	xa_lock_irqsave(&adev->vm_manager.pasids, flags);
+	vm = xa_load(&adev->vm_manager.pasids, pasid);
+	ti = amdgpu_vm_get_task_info_vm(vm);
+	xa_unlock_irqrestore(&adev->vm_manager.pasids, flags);
+
+	return ti;
 }
 
 static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
-- 
2.54.0

