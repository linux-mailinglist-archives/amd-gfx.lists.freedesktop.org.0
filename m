Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a8lICsmiO2qiaggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 11:26:33 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2B86BCEB2
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 11:26:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=KL7AFEl8;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3EA10EE3E;
	Wed, 24 Jun 2026 09:26:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010068.outbound.protection.outlook.com [52.101.46.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675A410EE3E
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 09:26:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bioo2RtoeR+w0etNPADwPl+cEMlMjQc1lxJLTeUOFWC3dh35nYHWdY/ZTkpI3lzk2X8VidWHdiFSKLUbETdfys/nZpd2n04nplh3TdNhSHtur2g8xRGJfitxAWJuA1kMCu69GYVo5JHeVvSmefCDQuJ06rvxAJntF7Hi8IuKci9M+tvdMblRs6i3+HTM0RBRiOjinRmY9gfRGaU/ii1PH7J8AegpbFi4qWlDJFyp5Yyq6PRgfZLtxhV5zq/+D1x6U7UMBpglQC3bEuHpVSAbNHWYoURohMtRF2Wf82XPAmt98QndDwXoS96bs3l6Fg+Ow7vDNQSOe2ZQlX2kM7fbDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHXsr2xH9CxvdX+7b62UwJKdeJBIjHFVcZ9t1K8sHGQ=;
 b=CpZmUexXuewIw3bO1AKCa4D6Ghhm3DS23v9Gl/4jPb/7NX4Se3cWeCP8xij1QTmOHCgfWaEbw3V+fZlkwZwfo7k2U7twIE4OCbkkNnySQvjqjX+BHll9gx2TwCdlF5fvM4INqgvpSkUAXqCZ+Wf8X0pJfhn45vurgyyDu6bLJ7iXKgQo6GuR3B/a1O92sFQ3kUfNE6yisWV/23uaqmAAc7GiiE77QshYvleGLx/Fti0JOPuEJdtrvXnkmoZuNqdFIdgCCgioUSZoE6gn+vlRpsCP9d9UPbuNKMmtn1Raj5T2Te2flPu9rYDdGwhAHd1DDn8WfcC877SUy1VGB6ouIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHXsr2xH9CxvdX+7b62UwJKdeJBIjHFVcZ9t1K8sHGQ=;
 b=KL7AFEl8pgkMw5v1Jht9BLsWKBBXqfdLj+1BieZ+9B3RyRIkV5veS/5n++1sn1qqxq8c/bVhemWZDMYRwXGVqDMgd+SzXXHiE7Jb8VIxuq7m1FMPwlho4XJSUT6GDJ9umsv9eJY9IkId0XIePiZLn1EBOjSGIUfHAYNV5Cv/cug=
Received: from SJ0PR13CA0196.namprd13.prod.outlook.com (2603:10b6:a03:2c3::21)
 by CY8PR12MB7436.namprd12.prod.outlook.com (2603:10b6:930:50::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 09:26:24 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::75) by SJ0PR13CA0196.outlook.office365.com
 (2603:10b6:a03:2c3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 09:26:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 09:26:23 +0000
Received: from fedora.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 04:26:22 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <Alexander.Deucher@amd.com>, <Christian.Koenig@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, <Ray.Huang@amd.com>, Zhu Lingshan
 <lingshan.zhu@amd.com>
Subject: [PATCH] drm/amdgpu: reject mapping a reserved doorbell to a new queue
Date: Wed, 24 Jun 2026 17:26:02 +0800
Message-ID: <20260624092602.24803-1-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|CY8PR12MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e46255c-6537-41cb-5250-08ded1d2a8e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|56012099006|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: N7+JYnjhGzqWrUeradxxpKePUeRAzyAWr6c3gUhHhpqlOcNjfg0xtrroOLFGGm5UsENTi1pWG+QlWTIPvFI1byKV0TTD6Mx3hiOqvr0xguFZ8F9Ow6LTzFqsxQ8Kg9J4QdvjU207veCz34XnWvxivX/Mtcfx4GHZSfuk2YTGT+XDk/vKEFXBm7mscwt5ZZ/s1J82k+vN3Qp2eqUbTBxB2zPjTKCflTMeDTE8eyQoP6dqUSQljDoQFw8yo94JwRAmwn+APICkqXcdLnB1tra4zB1djz1kC0D2wpE74joEfhi+qfUqChmRg980KLyHR3VwnD0uSMLjhLfXotN+zH2Y2OUeGwPhhwkI/G3sWu9OBdrbvCmGNDEEpX6xMhDEWX8Bz4xAxDxD/vfHn5yip28sx4RQTCQWtDY4AZCHLfaLH9MCl4POlgs8bmMAo6N5+WLP0dL0f577wVB8ZN5nso4dwca/5/y1147vR459OOl4PYs44rSfHE3cFroZYLQrXsU4u2WT3BUPrOjkWHb7HWaO8JUA3oyDTzkmPuWISv+8kgkEfMe05mT5P8csxhL7l7IDa0CtUHVilf9tNKJgvJIhsVUelUa3miOVc++exWv+Rcomiqreo/cMRVo+Mk7yEBMtDD1CTwAYFJFpRS45Dli6loeL8NAlJjqlbEzxvRMC+ac//GbBNX+stx8HQ+DQKteC2DZUrhZu4Z9EA5/YB02z0g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(56012099006)(11063799006)(3023799007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kifBJLkyfApIH7zh9/ZLMfZOxtopZhs5y1Ve5N55ymS/VtFcu4Rw7fC1PdJCEwKo6VL3nPEHmxQm4JFqx+dDHvWvkzcW4QoMOoWkSjejm0CHGKHR+8jWRgZHFfL/VWjBsZaQp+1sKC0YcwC4FVA7IRJLOash6tEKszyqAsTc07IMbITVpH4WswQpT2LQF/BAw1fbftTi4O9Ft+q/icIsxo72dQ7cKIUfA78CpvljO2NgjDAj7xv947qU91m0PqiTojjxGBs98rzkvb6yWwE8q0TYAvBm0BvOVcRXfe9s2WF/eea7yIl2Hiq/TaeY6mcpfiMGA8eEe6ZtMipJ37Ivwgbwmlpi/RvM9LaqGIZkIv9+DiwMR94PAdoUWGl2CSSrPHTA+DGsAF0ALDCEkTTGkW7sd/hieBnIoqhfc0To5W3OzGV87s+dBCfSZzdjsI47
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:26:23.9174 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e46255c-6537-41cb-5250-08ded1d2a8e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7436
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Alexander.Deucher@amd.com,m:Christian.Koenig@amd.com,m:Ray.Huang@amd.com,m:lingshan.zhu@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lingshan.zhu@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[lingshan.zhu@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B2B86BCEB2

When creating an user-queue, the user space
provides a doorbell BO handle and an offset within
the bo to obtain a doorbell.

However current implementation using xa_store_irq()
to store a doorbell, which allows a later queue created
with the same BO and offset parameters to overwrite an
existing queue and doorbell mapping.

This can cause problems like misrouting fence IRQ
processing to a wrong queue, and mislead the cleanup
process of one queue erasing the mapping of another queue.

This commit fixes this issue by replacing xa_store_irq with
xa_insert_irq, which rejects mapping a reserved
doorbell to a newly created queue

Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index f45bc8cb815c..fb7e18c841ee 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -704,8 +704,8 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	/* Update VM owner at userq submit-time for page-fault attribution. */
 	amdgpu_vm_set_task_info(&fpriv->vm);
 
-	r = xa_err(xa_store_irq(&adev->userq_doorbell_xa, index, queue,
-				GFP_KERNEL));
+	r = xa_insert_irq(&adev->userq_doorbell_xa, index, queue,
+			  GFP_KERNEL);
 	if (r)
 		goto clean_mqd;
 
-- 
2.54.0

