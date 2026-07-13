Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4F3tANMVVWoqjwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 18:44:03 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E43074DB2F
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 18:44:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=ZSMvLGIs;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CB410EA67;
	Mon, 13 Jul 2026 16:44:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012040.outbound.protection.outlook.com [52.101.43.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2485D10EA67
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 16:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4tk2CJAZPp59BwucQLL0qNavMZszo1bAQHVeIMaNbFPAWzW4VTgXFh3sheyXKHjcPvLvUrOITzrZH9YXiyPTUdn3wLVJUP1MQaQIIZHtLCnXqVOf3VjKk8yQnjmAzVPN8Ksam9rP7jY583SWRzS7ILkidUS03jI5GWMFuIrumeWiYlVtSLroeo/l7N6J+LSbIE94dvTo2OB40HjBsnV01HPmvxzhqXfTPymTVguCeiSxeGfKP03MTstHzcrWlgNBdaOSuYikIKWupIAU+nKrS2ClFfuv+sITJ9vpvFPZi66MTUkzOX6NQX+QeH9OMd4RwHxnRz0ZxRzWpxNWFqkeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/+qUNiA8WxWiAsD7zG+0O+dPZec1VepBiPM51rzIV4=;
 b=lpA3AJamD92zWywSxC3XKA0XJW9DVGktS8bM6QUfzVX6mEveorBZoo4qrArvmuA4Vm0ZfWxwdrQk8y6SC8l7+E96bMRJr6M9h9Cb33z0VWZnBrX8qmPi0gj779lnH1dRoH1pgMhRaIh5dU/uy+noLBeg8N5mOFW4NrhElreArJvVZvnJViNGUxRWm3fWUMgF/oegQRj9kybHUyZk9J8sSMRGLu08qrTLB4HTg/aTuFoLHyRW0nBUKDs5ekfhpXzBfrI6LoOBvD8K+fzh/8ERNjT7FkPXpGDiGXnkbKEc0wb6ns77BVXmu/yGVt1Z8PVwQvtcAFeBZJVtlxJk3dTZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/+qUNiA8WxWiAsD7zG+0O+dPZec1VepBiPM51rzIV4=;
 b=ZSMvLGIsyWLclJxTdbvBdjZKyB1XEN7DD24iLWwCk+8x1JNrVIsGYzURjKM9CJFmmFNTMIxfQ/AHTPljanLvm6LtdwYsnpIHXsTBN3IwM/HKDgKy9ogOA2GcvdPkxSiP8QfGNKZPKuerp+k8DVNNBRfB2bu9VR3ITJB1UW/xTmc=
Received: from SA0PR11CA0179.namprd11.prod.outlook.com (2603:10b6:806:1bb::34)
 by MN6PR12MB8542.namprd12.prod.outlook.com (2603:10b6:208:477::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 16:43:53 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:806:1bb:cafe::80) by SA0PR11CA0179.outlook.office365.com
 (2603:10b6:806:1bb::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 16:43:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 16:43:52 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Mon, 13 Jul 2026 11:43:49 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v8 4/6] drm/amdgpu: Remove queue-scoped WAIT_EVENT records on
 queue teardown
Date: Mon, 13 Jul 2026 22:13:19 +0530
Message-ID: <20260713164321.3350036-5-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713164321.3350036-1-srinivasan.shanmugam@amd.com>
References: <20260713164321.3350036-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|MN6PR12MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: 8457262a-c3a3-481f-c60c-08dee0fdec60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: XzJ3TZxraNqv7i+lBvxHiIsjUwzqtxMCg5oaRze37aZxbZFgEs5JV+K+VG1FBUPpWo+Kw/URBRoA1wj37fADIMRKkDdGZU0GwkXKjoPpmz2uahdp81OhIj23GXTy+NYQIyBw9OHszlw3ETJsM+QEPMSf1YnPelfPdMv6jXYno71wKpqOE3hdukhIGQuG5z4FJNhpvlLHNjl+Q8MAGCMy/s/aUD02HASP3ANqe9BDty6/xgOfUtMQeH3ou291rn2VZXPjZWMCWjSiGfFPvdBKfH9vhnB+IFbYdtpIjvHDy6PuMIF5tmoNqnZr11aXAnAkm3E6SqpMnPNKtFdwEwYxLZRU2x609uf5OJ3P+k0giF7Sd+1LynXCiSwtOrXDATxso6tlHbrywW2N5PZq35HPGrl/p8MCCJ2pKVidt2ml4AiIb3QzdGyv7xtDjVyru4gVPPjx9Z3zvVpKEMkgFOc3C6h8RhcdKsij1+Dje+gWsnjss026Lz8yyHs0Q0uKmD5c+Dr7dEjmqp7ICTkaIbqmlGUSd2QvB/pSB/JF6h92brigFu37Fcm1NfGrdL7HLk6VpPLac0r9+24g6a709lyCmvPrdihe1Y93W3FtB4FpG/N+SgJBqiHz7guZAYQ9k55lOwYwMKcfT6P3BqwIOtoCHYjUidDBY6mlrXcTXUxWe3OBLRBpns5I6AT2w9p2HAc1qM/d3w/rIyNNDhJgTaa+tQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4jYxmqCCi9W1vtf44ta7RpqOqwnT3iMei1PSFmGYbcdfXQW7zCvhGvX7npaWLtRkSmcBLdBCXQlNbkVdl3zXVRm2AYTjxBX5krNNGz90PNaFuM0ao4JJDroFKjVVBg5hGiRkFide6hhWxkk5sON0LQoeP6oWdVePWTkDSqc3/WEAU6rE2sEJdzn9DfHOL5i2Gu0Or7NBNGrvlWZ6/wuFfm99ec0ulpDZCzMewDxb7i4RGb9drlUFR3Qk+3s5P6AXxd6pfunJ1vdHKngPS/CzD1W6yMrzhRKNkOiHJxiEX1vPXoYVi1DSQ7nHZo48jrvGwFyibuW6qimAVtLL5qJ52KCwLeh6TWqPPtolmN5QkgRqbsY7qluyba7xCRx3OvLC3D/2QOj8B3c8AM+4dmw++bHktKO5wxyZnoxE/7MxD7zyxSju4lBdyG0664VdsDV9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 16:43:52.9650 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8457262a-c3a3-481f-c60c-08dee0fdec60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8542
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:srinivasan.shanmugam@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:mid,amd.com:email,amd.com:dkim,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E43074DB2F

Pending WAIT_EVENT records for queue-scoped events store queue pointers
and own queue references while queued.

Remove all WAIT_EVENT records associated with a user queue before USERQ
drops its queue reference during queue teardown. This mirrors the
EVENTFD queue cleanup path and prevents pending records from keeping
stale queue state after the queue is removed from USERQ ownership.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 5bf231d7a630..b3ac1e81c9ca 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -56,6 +56,24 @@ amdgpu_userq_eventfd_mgr(struct amdgpu_userq_mgr *userq_mgr)
 	return &fpriv->eventfd_mgr;
 }
 
+/*
+ * Get the per-file wait-event manager associated with this userq manager.
+ */
+struct amdgpu_wait_event_mgr *
+amdgpu_userq_wait_event_mgr(struct amdgpu_userq_mgr *userq_mgr)
+{
+	struct amdgpu_fpriv *fpriv;
+
+	if (WARN_ON(!userq_mgr || !userq_mgr->file))
+		return NULL;
+
+	fpriv = userq_mgr->file->driver_priv;
+	if (WARN_ON(!fpriv))
+		return NULL;
+
+	return &fpriv->wait_event_mgr;
+}
+
 u32 amdgpu_userq_get_supported_ip_mask(struct amdgpu_device *adev)
 {
 	int i;
@@ -1040,6 +1058,7 @@ int amdgpu_userq_ioctl(struct drm_device *dev, void *data,
 			return -ENOENT;
 
 		amdgpu_eventfd_remove_queue(&fpriv->eventfd_mgr, queue);
+		amdgpu_wait_event_remove_queue(&fpriv->wait_event_mgr, queue);
 
 		amdgpu_userq_put(queue);
 		break;
@@ -1426,6 +1445,8 @@ void amdgpu_userq_mgr_fini(struct amdgpu_userq_mgr *userq_mgr)
 
 		amdgpu_eventfd_remove_queue(amdgpu_userq_eventfd_mgr(userq_mgr),
 					    queue);
+		amdgpu_wait_event_remove_queue(amdgpu_userq_wait_event_mgr(userq_mgr),
+					       queue);
 
 		amdgpu_userq_put(queue);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
index 187bfd66eb13..6a53cd3208da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
@@ -203,4 +203,6 @@ int amdgpu_userq_input_cwsr_params_validate(
 	struct amdgpu_cwsr_params *cwsr_params);
 struct amdgpu_eventfd_mgr *
 amdgpu_userq_eventfd_mgr(struct amdgpu_userq_mgr *userq_mgr);
+struct amdgpu_wait_event_mgr *
+amdgpu_userq_wait_event_mgr(struct amdgpu_userq_mgr *userq_mgr);
 #endif
-- 
2.34.1

