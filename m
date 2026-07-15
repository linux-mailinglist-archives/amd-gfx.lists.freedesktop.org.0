Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h5qaNHaIV2q2WQAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 15:17:42 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8C075E910
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 15:17:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=D6hOeCCl;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EA110F05C;
	Wed, 15 Jul 2026 13:17:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010035.outbound.protection.outlook.com [52.101.46.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEB810F05C
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 13:17:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eA9Qv+j4duIGWR17f0c2pAk8XrDdcbssye7fPg2LgQfMMrCSxQOFailFZbFWIyJBz09rbrRFNYH5H4Od/AApF/E9J0PXXsbcuVmSEb5+MVpKhbOXQEUN+R7fehnGi8IXiMkuK2dY5Ra3qpcp+O0/6c3AqvUpsFvXrIjlq3ToosipE8W2pdfi0mUqQfQ9rsTknnY10nEb7FtxuOCJcM1DyUMpFy45FFPK3nz+BlOwNwhxkl/2Pna2kVsW60I/lJ5w36y5G1pUQdxy3YoYl6NkjZlAl4YS8gCcsZRADI/QtjUgV9DiYquww8QaB5wECyujyip/Eq7Tlr++upm/FRdM1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAZmZIb5SfHKUNd6JqkCFWmGZ+XYJbw5g5GKevlvAJU=;
 b=YN3CCLFeUcH/84l+bUobNiCkro1SJDiX43dxVMP9UqWsoT3USB07Ky83KVNmdoZypnczudshENieHjp4wM5XUl1lfzPCMK6jJVZSRAWkonrRtchsfEhHcJt8P1HOKj+7e9CrzaXhNfv47h/CWz3x4MGk6zIkzYNqMl0GGpbn00zAO+g4WHnJ1e7XmfRoQd1C4Hjp1ne6MI3CF+kWNBydQQxodoo1lFyjJr0tsfPJMxaF8IkC1LaZvtN+2aF7nkC+dLwVg5tnn1PQ2SUpxgzuz05FuE+E92UCxjF27caPFeB9W+l7NTiq48PJTz+pOlFUbJ+Ek8ALhQaek0eRs8Hmmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAZmZIb5SfHKUNd6JqkCFWmGZ+XYJbw5g5GKevlvAJU=;
 b=D6hOeCClZ9SiqRedg+ZTYCsa4bFFqs7VnE5eaCUNyySMIN2G0YgtoKXtTenfBuDlfj8Emw0cPkFVFNHKWwnwmw0hmZDQjrvzzp0k+DhzRZOctIKKN0AL8B+d4bujNPouW2PF/bfkTgiDQKvf5eH6Z4HTfg1TIbgfelywQ551cHw=
Received: from BN9PR03CA0144.namprd03.prod.outlook.com (2603:10b6:408:fe::29)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.22; Wed, 15 Jul
 2026 13:17:33 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::66) by BN9PR03CA0144.outlook.office365.com
 (2603:10b6:408:fe::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 13:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.3 via Frontend Transport; Wed, 15 Jul 2026 13:17:33 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Wed, 15 Jul 2026 08:17:27 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v10 5/5] drm/amdgpu: Record QUEUE_RESET WAIT_EVENT
 notifications
Date: Wed, 15 Jul 2026 18:47:04 +0530
Message-ID: <20260715131704.3452312-6-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715131704.3452312-1-srinivasan.shanmugam@amd.com>
References: <20260715131704.3452312-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e21febb-718f-4593-590c-08dee2736e7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 14saZgMxdG/7YBiT9AClI+97kCd7MmPFa/83ALABo+uc5ERBN7Y/b4ysy/YkWoMvmI92BO+5NZKfg2H0g1y+uKH4XhKqO7d6ExozKo9zjfP88FzLKS2e3UygUVZsGtWaile59HAO12lKg51fMTKa1zzFdce7+ebCkk2sKXq3NdEmQO/kY2YfyrCWcZ591h8Ns6616QJ0BbeinZIgs9wXAhMbng0NEUOac0I2ZyGT0/8ShTDBPNFs+0CWcDqufUJ4hRmnuhqtAYlu9G/AlabofCC+p5brbKUCl2e201tMWpEEw9emK/0JCFs7wL7iMUtEUSo4n/nLl9iU3mR55EJXVcu3TL+WBc9FM7C/WaIlks67B2NqyFWcTt1lVdq1gtgoDzgAdF4XET01hRfa5KfbDm8eWwhdzHIfbm+oY7UdN5qD0jP62DG/xfxUIUs24sVqU+lbRmXHghmI2qlwP5F/6FPM+8YOMNVfQ/HvYUhbiVwOJwO1CRGs5i4NuBdxLlwqmay4nw7+5jJKUupAbpgOPwQYyE3QQJB9BLfpRSuw0GTR0vpLOXE5W3Jaaw5NSeMYIKGsOdzGoc4I3OhvDOhdtSdAQHwZBj6CUtx+BQW5xDA2TWS2RXtWSqQemOFb1GoUgvILWIZ4/PxCiDcK0rVpfz/2EvjvW50VAHUqRM8dtRtcA+XAary/aeJRnsReuLAnhzyu7VmOgoa24anG9F2b5g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vOsFrNkFYihESa/5Z+Ec9dFwdbJmZ888bWR7WaAKTHex1q8H6/JjjwAjV9/WIV7kUgol/e4hK1RoSu5nk40KBrzjOx+FwX91Mo9KTfvpn/NEgrLJ20vd5uS8iZ+zc4e82TavW6kUtZZJUw0PoD775sC3OyM6buz8JV0kYLEd4Z8bHcIW0st1WTHzh7/bSKk9NulUQ5bszmW6kQyY+EnWs0RJClwZW1xB7K01AuOuJWnSAJ/mAFi9DzQeCFaAmRdEhchsdrpW2xvGyFuIFR7VQDThivHpqySArtmrYF6EMC1MbJjm7ei1NEwznZNH9J/p2/9gB1YrYd6dvBmnH0W/LntcECNFXek6NQb7JnGXVsH2nbyaw6K4vJG2Cw1em6Xbha48/zPSerE8FITbg0euJP72fW5WEkwdQX1lAnpL6V3VGPwVrtVhajC9jcJ53C8T
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 13:17:33.5390 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e21febb-718f-4593-590c-08dee2736e7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:srinivasan.shanmugam@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[165.204.84.17:received,10.180.168.240:received,2603:10b6:408:fe:cafe::66:received,2603:10b6:408:fe::29:received];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E8C075E910
X-Rspamd-Action: no action

The queue reset path already resolves the affected queue directly from
the doorbell and funnels successful reset handling through
amdgpu_userq_handle_hung_queue(). Reuse that common handling point to
create the corresponding WAIT_EVENT record.

Keeping the notification in the common helper ensures that queue state
is updated before userspace is notified and that both EVENTFD and
WAIT_EVENT observe the same reset. It also avoids duplicating the
doorbell lookup or adding a queue scan in the MES reset path.

No MES or GFX interrupt changes are needed.

Changes since v9:
- Document the existing USERQ-before-postclose teardown ordering in the
  WAIT_EVENT manager patch to clarify the manager lifetime used by this
  reset producer.

Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 28f9d3fe0e80..37be0414fea7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -166,6 +166,7 @@ void amdgpu_userq_handle_hung_queue(struct amdgpu_device *adev,
 			            struct amdgpu_usermode_queue *queue)
 {
 	struct amdgpu_eventfd_mgr *eventfd_mgr;
+	struct amdgpu_wait_event_mgr *wait_event_mgr;
 
 	queue->state = AMDGPU_USERQ_STATE_HUNG;
 	atomic_inc(&adev->gpu_reset_counter);
@@ -177,6 +178,11 @@ void amdgpu_userq_handle_hung_queue(struct amdgpu_device *adev,
 			      DRM_AMDGPU_EVENT_TYPE_QUEUE_RESET,
 			      queue);
 
+	wait_event_mgr = amdgpu_userq_wait_event_mgr(queue->userq_mgr);
+	amdgpu_wait_event_add(wait_event_mgr,
+			      DRM_AMDGPU_EVENT_TYPE_QUEUE_RESET,
+			      queue);
+
 	drm_dev_wedged_event(adev_to_drm(adev),
 			     DRM_WEDGE_RECOVERY_NONE, NULL);
 }
-- 
2.34.1

