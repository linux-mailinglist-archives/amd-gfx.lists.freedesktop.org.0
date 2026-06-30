Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pVLcABXIQ2rShgoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jun 2026 15:43:49 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521896E4F9F
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jun 2026 15:43:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=YfhDVP3A;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D960110E213;
	Tue, 30 Jun 2026 13:43:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010010.outbound.protection.outlook.com [52.101.61.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CA010E213
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jun 2026 13:43:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fspqHhkunDCKuS1GVc4tazqTWfvmj4h38a94CyUGO6vtYOIC54tBGeF1NI5oTb6mmDBwrC/Bxb6U9guv7gsyC3QuwyYmL8mKJ1exoCNUBqdk5+uG7dc2xuccvSZsBjyc55woG6y4mcUr+to8hoI3cdvT51h/CAux0mO26E79ww9iG9aRw23dYkKc+tc/PEeCzKjTMcd2ToFwgKKb4FK75IikippZ9Jos/E8fr0thyRhrZAqcGXb/3bA1JNg968wCX0JcWeo0IH1nchQ8evfpS2bISKuwteUXJggRjK2d0OgnmbntYzPjBfcWJKLrAxzs/fRadDOR9hPnLLxUExqROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEKGLpssffoYfNFvRJX7EIpxIp+yq9XMeMwr2KFBQR8=;
 b=cBLvdD9Zb8DTGTUL/0gFR/EByy6Eck7SJgEwVZxsNi1rr7d7yMPU6zE1FPSGRdb9H5ab5R60AXDGV49UkXK6SvwlkTfbg280TlOO89UkxH2PrrQ4m52cLCJ5hPR0FfkxS4ygJ7dasRAWQHYGRhXjB/uHTLXpLjDZdq48tce/Em2weebehKqlF7k+lMreio6MtCGc3j9kFJ5VDNX0MMTzFoTQidciDwIk6oI6+/x1ue1Fl0uuiPxqSN7RymTQ4+yCnQVMOepaj/LGAUi20WSkHZwMxEW8ZmujyGhxGX7Ne8MX0iY1HedSylaX30TBRiPOVV0eKBbmUKLfyBm0gxmiIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEKGLpssffoYfNFvRJX7EIpxIp+yq9XMeMwr2KFBQR8=;
 b=YfhDVP3AibplqvBvUfQ1LWdGdhTwtH+mvmG7xfGKnS7BJaji6nSq7uIPiM9eHdUWJbu6xGV1V68qcY5VWfwtfqyiYknyMCrlmto9PP6u8fTxii0GGQLfrDGZ0tRbvtVCXvatmkHkito+LLihEsNHkUjepRoguqkVrEVnZpglH+U=
Received: from BN1PR13CA0020.namprd13.prod.outlook.com (2603:10b6:408:e2::25)
 by CH2PR12MB4246.namprd12.prod.outlook.com (2603:10b6:610:a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:43:41 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::6e) by BN1PR13CA0020.outlook.office365.com
 (2603:10b6:408:e2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 13:43:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 13:43:40 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Tue, 30 Jun 2026 08:43:39 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [RFC PATCH v2 0/4] Add PASID to fpriv lookup infrastructure
Date: Tue, 30 Jun 2026 19:13:20 +0530
Message-ID: <20260630134324.3118873-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|CH2PR12MB4246:EE_
X-MS-Office365-Filtering-Correlation-Id: deb3025e-ffc9-4571-5133-08ded6ad9874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: uVBnKFID2ll7QrWlk8NxPUj5vTmD7jHaVgMpalJIy/ScJBlJ5F8ug49kXCEnFzlXSW+WQ7AxIkdb4K28OuESQWeoYEKEioG7J1T4j4jat/TD3s6OsTecCLlDYw7MGRBL01IupHnuhGAOI0qrXFI7w4CjWQsEyTUuWaE4vlJJb19XFW6urtu2qgS6AJfYkwf1mgeWFccFcvaRcae9c567OAQpCUmod6H5eRki11gK5yyBKni8k1YL9VJu0CKd9rar6i4gp8B9SLDicp1ZGMGz3RhvfKuCE4ar9WDEI5Phyk9E/E0VTM5bQ4nk+hfM7hMZ03I9FS4CU9M5HuCFDn7sjPZr5SC0FjWpKDx5GYa6nhsbW7RbfjA3W7JqoH9Um0Ia0kJAjv+K/IlER27B/AXIsnEypyx0iTi6yVBjKpvPxbqvey72oE2mrSqCr0BZF5nVYgBibx2m0PafLKDPLeyC+qat85ZgBybD4u+U8o2UQtV99dn3inxLdPwZlHtsb/trjerrMORdwF3wvHKcoj2/cCN8Nymt3MPm+v3k7/WILJt9ZCeJuj2WdxoSB7ISCIKBKSP4Wv2xNvJgz1Q3gyCRUy+fuVJmJ2aXLa/yDkpDUWupq0ViMpzeaPTdF0gVD36nUf+3otd2+tMSC+bF6P9irNbfI5qxUwm9eP6Udp/usuhG683LS2NUZ46ULHamZYzz1VO/lFVkBIklHWkGxeyfNg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CV3T7B3XgqZ/H83zda0vj7Jcl5fQgyC9ue2wQze28nYovzvaLFEpxAPFtCwKNgfe145KB5FHLr+0zDGrkm/HIZiYxmeTv5VF+RkOGiSGZVw9GgPkxpIeTRa2LwqVHmp33pFnTY5v+v6iZyA1j/ESbzD5OejPALSVspgzU84sjs0LZC45A+8qtp2he/3w7j3RHT5CQAxw7VJLPjdRBtuYrZ13hnBDORW1YGdKzqaGNoWhDpY8nbOAds0/pJwsFHxg/uXeJigzZntmwimsL3LtduUTN+BCWmkUkJFC8rw9WgoCBax+tig/LhZQG8hrzcOngi2Ixl/P8fDW1PCPJIr069RuuUOOwuWS3ByisijKSemC9W9DMRHLnuILiZh5dfBjM8VuxXALEC9sBJuFLqO19lbewg4dEKrmYS7t+yJxrjQ0FHX+k+lkWlL7EpieeTkj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:43:40.8216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deb3025e-ffc9-4571-5133-08ded6ad9874
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4246
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 521896E4F9F

Following review feedback, this series reuses the existing global
amdgpu_pasid_xa infrastructure as the single PASID ownership table
instead of introducing a new PASID mapping.

For DRM PASIDs, amdgpu_pasid_xa now tracks:

	PASID -> amdgpu_fpriv

and VM users derive the VM through:

	PASID -> fpriv -> VM

This allows all PASID users to share a single ownership table while
removing the dedicated vm_manager.pasids infrastructure.

For this RFC, lifetime handling is intentionally kept simple.
Existing VM fault users resolve PASID ownership while holding the
PASID XA lock and acquire a reference on the VM root BO before
dropping the lock.

Future asynchronous users (EVENTFD, debugger notifications,
WAIT_EVENT, etc.) may require additional lifetime protection if
they need to continue using the owner after dropping the PASID
XA lock.

One possible future direction is:

	PASID -> refcounted owner object -> fpriv

for example:

	struct amdgpu_pasid_owner {
		struct kref refcount;
		struct amdgpu_fpriv *fpriv;
	};

That is intentionally left for later discussion when a real
asynchronous user is added.

Open discussion points:

  - Is PASID -> fpriv -> VM the preferred long-term routing
    model for process-scoped events?

  - Future asynchronous users may require additional lifetime
    protection beyond the current lock-based lookup model.

Only compilation tested.

Srinivasan Shanmugam (4):
  drm/amdgpu: Add PASID fpriv ownership helpers
  drm/amdgpu: Register DRM PASID ownership
  drm/amdgpu: Resolve VM through DRM PASID ownership
  drm/amdgpu: Drop vm_manager PASID to VM mapping

 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 91 +++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h | 13 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 17 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 59 +++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  4 --
 5 files changed, 140 insertions(+), 44 deletions(-)

-- 
2.34.1

