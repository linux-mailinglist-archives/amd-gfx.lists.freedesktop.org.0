Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v1drBNNXIGpY1gAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 18:35:31 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2007639CC1
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 18:35:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=d6gTgL1i;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCA91120DA;
	Wed,  3 Jun 2026 16:35:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012049.outbound.protection.outlook.com [40.107.209.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEA71120D8
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jun 2026 16:35:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESNdDgwnOT0ItVqIeXuM73pHMRohHWdnc8uiKtct6udD145bOoD2+CTEuiWwdooG6HvxaQkPaJtltB0SL77AtLCG/noS5CbQr8xc5O94gaXbfeFPwKu3hJyZLXmcpMTjMiwM+fpcPmiFP6s6Pu2rV6P0a9IO42mEpSUUyosVfrcHvY3Tp9fN9Q66b26td17Ov4g871Vxb3ayMSWgUGQeHosO+fWk2/x1ybEMDBkmjj7vFAThSipxatiOYPFB1KlLAR7Xqis7+9t0tZcTOFxOZiGkNphOD4wAAMnirlp8oStN1SdSqTTUHFHFrbsjUMBbk72QUiOCu9/VXmB29bQITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4z6Hfiw6b970B0EBeT1y4hU3tSyCFiIz7LMcCNNu778=;
 b=YAniJrqR6zdhxSnNjEpdAmfhQDtAEmly6cwVOehwi3ADrZ52I38HrTjS5ZDq7oxd9aA88utJZDsDtIZ+gQLhxOPbMmy+3pw1LJ+BgBokq6b4+A0pdk0FA15OOIwoppRfmqaHUSGFA4fcJBkblODnuCq2oj+pM5W5lW7BqnXW0Mahd+Mr7wGNJ258jXGGMVNDZLsLxQNy/FlO3HYZOelaDMT4KWIvnl0CY/ze+dO4lV4O6Kgutiqlp01PPPyA0ow8K2Fks0U5980QdrX7KC6XmFTWp8CGtVV+BHSxOPCC/H1U5Wp2m/bkLj9oshW6DOBUS4uYuelDkC9tHqK/NuIKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4z6Hfiw6b970B0EBeT1y4hU3tSyCFiIz7LMcCNNu778=;
 b=d6gTgL1ivnOjZA4HkG/fluoVzyX/HRK7O5ad+Ka8PT4GCJ/NtjtL5QBJIlzOJbDz+KgcvdkIaJlzhQhS/QtUjY6t7kXgcITN96UDfiyjir6GQrr0XkGcXGHD0U2L3ez1fk+6GcrgFzEkeXWmL6dN4eLNn1v8IkFlbZ6wLSP97LI=
Received: from BN0PR04CA0071.namprd04.prod.outlook.com (2603:10b6:408:ea::16)
 by DS0PR12MB6439.namprd12.prod.outlook.com (2603:10b6:8:c9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Wed, 3 Jun 2026 16:35:20 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:408:ea:cafe::d) by BN0PR04CA0071.outlook.office365.com
 (2603:10b6:408:ea::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 16:35:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 16:35:20 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Wed, 3 Jun 2026 11:35:18 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v6 08/11] drm/amdgpu: Add queue reset records to WAIT_EVENT
Date: Wed, 3 Jun 2026 22:04:47 +0530
Message-ID: <20260603163450.2678374-9-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260603163450.2678374-1-srinivasan.shanmugam@amd.com>
References: <20260603163450.2678374-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|DS0PR12MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: de62143a-44b5-4dfb-5e56-08dec18e1a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700016|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bmQdzqK+KEzBe7OJNDZTwOIBXW2LAocAdFnVvdiiqS0OQowG8CG6AnkGJOtrr6JVi2Ox6B5Kk+fAG/ZUZJthld2a+QIqF7DkJGbd1YeiVfMayGRfuHcOpwkPk/6z1QPZ+uNNvOOMiXMT1C8Yv6fKUhDM/c6kAPFDTQ2oxYdl6aZ2WNoO6QCrmLUPJUC28U481xye0DiQaut/TVek9MtNWwS38J9mUTgo3qqPTYMxCw/dnpCqr3PE1LkUjpKjDpFyrOeThl96edP5gFL5TDTxZm1SEgg9SyxgiQWF0XpiBTpCm8fxGLUPHdAFs6OvKzyiIgd2xlelO2pTrAU4Ya3Id+Y3foyUJX1vwJzpnfBbBA+T5W1Ttbgg4FmNdE4CSaZOlarCNA6LgnTpCDCDhft0zPXZHat6tostcd3/ETdkZQdCqybKi1dbmSDUkQW8Dln6tlQBxEbgUfKvtl6NGshee9s2IcztKFqDCm2y0rQkOg10Yi7B0v5rom/sikY6vrmto//EDBx/Ur+35cw3YYdhwIedziygycVDK1UjipwNqv12R55VpOQmoqS8FX+VqbKPVZtEKd0XIyWSM8hYXsGYs2bjKT8z6mXGzgFO/TKEDrksuQdGlHSoWJqL5/+vy8rz8663G9C7iccW8iEWTSpx94IUtepB0ttR3SsRiJ0TtxAom3NDLtn/6kHrpfP8DJepwTTjKphQ3MDiAkbANmJrEqMpH0Q6TZUxXZ74brIVkKk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: i617jcjjOGY5Msv9SZ43Y0Lsge+ltJwy5JwREz5RuyqR2m60Stl46HQCyGqOm5uPko3iz40p1GjinWa2xxOwHhwzLATQqVCZeBpVMk0g5nvrqNKPzpK1e4cIsmcwX5pHTxcqX9XeOoCfTiFEDMAH5XwrOpNL7p6O86ghhabHC4BoSodLB1cKLo2CbSF3+VDhLWQcdP17RPyAUyrz6kqbmnqNuiT3aNf7mp3taGmheT1yWfXRfnBjuQZfaghiW6NYHMNwe5Ui/XbdrVM3iGmXYE8TBWCvg3ox5zdkn5MCjUy0gJzOYr7M9BmYK9NwEBXk9bPu1j/z2CNALcUyu0LEsOv6g3PpAU1/WRTqWqJ7yKE0EFTFKuUbE2+Uknf7VOBtsbPLleVobxCPpt123VW3REn3YzF2CS9krh67b5+0g+RvPqkevc6O+kC/FkBJyTg1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 16:35:20.4015 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de62143a-44b5-4dfb-5e56-08dec18e1a53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6439
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2007639CC1

Queue reset records into the WAIT_EVENT path when hung user queues are
detected and reset.

The user queue reset path already identifies the affected queue and
marks it as AMDGPU_USERQ_STATE_HUNG. Reuse that point to queue a
queue-scoped WAIT_EVENT reset record keyed by the queue doorbell index.

This does not change WAIT_EVENT UAPI semantics.

Changes in v5:
- Use queue->qid instead of doorbell_index for queue-scoped event
  handling (Alex)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
index 855304f0c530..cdbd732ee7ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
@@ -24,6 +24,7 @@
 #include <drm/drm_drv.h>
 #include "amdgpu.h"
 #include "amdgpu_gfx.h"
+#include "amdgpu_wait_event.h"
 #include "mes_userqueue.h"
 #include "amdgpu_userq_fence.h"
 
@@ -247,6 +248,13 @@ static int mes_userq_detect_and_reset(struct amdgpu_device *adev,
 								DRM_AMDGPU_EVENT_TYPE_QUEUE_RESET,
 								queue->qid);
 
+						if (queue->userq_mgr &&
+						    queue->userq_mgr->wait_event_mgr)
+							amdgpu_wait_event_push_queue_reset(
+								queue->userq_mgr->wait_event_mgr,
+								queue->qid,
+								0, 0, 0);
+
 						found_hung_queue = true;
 						atomic_inc(&adev->gpu_reset_counter);
 						amdgpu_userq_fence_driver_force_completion(queue);
-- 
2.34.1

