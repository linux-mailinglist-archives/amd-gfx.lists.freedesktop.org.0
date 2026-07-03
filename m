Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z/fWBVdUR2oaWQAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 08:19:03 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7E26FF04A
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 08:19:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=H2nzQuOv;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CE110E57F;
	Fri,  3 Jul 2026 06:19:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010070.outbound.protection.outlook.com
 [52.101.193.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFE410E57F
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 Jul 2026 06:18:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3VvtqOzFfQdxUm7i2sp8QnFf9XfkXALZWC7RHX2YCixEQp++WDsRRtHJVnUFJvNqjnAqYR7m5dgHlOPuVOxG8kjiIhB5W5b9LXI5OMOuCmnNQlxFY2ljiSOckqXlmxEy1xfp7mxKJeDUArRfpLMUD278r5UFp2VjSOjuhd8WXbmFHuntkhB0uP7K2dUgNMQIZ34Ti4ZSwgjcR1JwCooeNXrFhvJ0u97nuoeIEFonRwaQ/f66+BIwR9ExpVIdn9rQ9LNuBAhuFK3wDNiPGdd7bt/h3lwybjr8StI/7C3ydodHWw2pYeYJR3F/K/SFfcSeVxslD4Qw2qpYtj4h2Gb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8Bk62F1lArB2spXyofFHAIQcLyUTGGgm8g2wV7b8A0=;
 b=hmuEM4wavDQovNIxGG9n92IpyRY2axouNCrrQ0Sx13S4OHQ6L2/08i3ZEPJUtVThLW9uoPqXMcUEJzhmoKeigqgWpC/4TNpSuUqBVsybr7t0CLYfuA7uduburDmDMlZf1Ol5uRSBPPzwa2pazin5PUABsrnducFQK/4+cpWLW8mOLcx7aSiKLJgIAsCcNG/ERo/CFcDTy6aCnsFR2XjKEmgQ0F30X6WhIJdI86IYKjJfa7DqAYuOmcet6A1YXfd+qMdIMNdVhvxluLrci1q2b+zE6jfGOxPxEuorzog/WwDnTQtRa7eXJzj/2rTGILKFJ3D5dyfa0ZDB6DkKJ4foGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8Bk62F1lArB2spXyofFHAIQcLyUTGGgm8g2wV7b8A0=;
 b=H2nzQuOvTmzUoc5lzg60O8Vwa5WiDrMhkCvDSRE+h9RKsIYH1qbpN9kqCKwrdTy6qk/1KveXFNQUrut3rZ9UM9pWedRBaOwZZGe/kwMB0dm/mEHyqyue6XFEsqATqf+wgA28Gor+e9EMILvHKXqSIExPkqb+JVZGDqBYuHZgjyg=
Received: from MN2PR15CA0059.namprd15.prod.outlook.com (2603:10b6:208:237::28)
 by SN7PR12MB7417.namprd12.prod.outlook.com (2603:10b6:806:2a4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 06:18:54 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:208:237:cafe::a7) by MN2PR15CA0059.outlook.office365.com
 (2603:10b6:208:237::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Fri, 3
 Jul 2026 06:18:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 06:18:54 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Fri, 3 Jul 2026 01:18:52 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v4 0/3] Add PASID to fpriv lookup infrastructure
Date: Fri, 3 Jul 2026 11:48:30 +0530
Message-ID: <20260703061833.3163913-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|SN7PR12MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: 6840fa6b-3714-49ee-ef2e-08ded8caf54b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: AHub7GzlXn9YLeYP5D4lGDofURC8JAb9/4fpMjho6mE6ZbT9w+Jw4nF2tzPvZ7K8/0bIOk/M432+71fZxuwUlitot6sj2JSfkLwdgHjKuRkuR5h82S6UQLIUQlQh5GN5UWr8tplS/WGkHLSq0vbeMV+xqO0MK/19eftVcTkvDn+976/tAWrMMD/Nk2stUqA5XeGd3dfIV5h4mL0RewE4mXwypRngX/DLnYg/Ztp6kFTsbpn7Oh6uu716j62ZklY5JLJTCjKcCRk4z/3AxRlKs9a1nXt4qpYYFZPY+mc0WMqDjBTKTicy6PyyEGa+BmMnLfcsMMfvvzIv7KAcEktlOm+hzAyQDszYJqKbe6Kyy7W40e7nr/7A7RbAY+WfQ9hdPeByiTFAAtU/P3c8VQSfQE6MkoL3sfyFf6wknDtwS3F57ycixqfZap88w3VPMu+xGRqduw9pIiQXEPK4RW/1JXWtJIeRgetdymkY6pdAKKh+wKz3x00iB9QZDu5YQxOV/0RLlBFabkY1GhSVC9j0I6pov9lGN1JlmqeDqtBmANIVUC4GiF9aqmtLCYZcJYCpDHaAJ6AZqKgx+QnSfUSWLr9eGs2RP3SS9Wx0Bc3MFflXX24KeqX4mUUJ7H+Z1m4twu1TAUVn2Wia1lJxqTAvxUTRrgnFHPWY8BItLzBJX9Ft19U4XT4KrK8d1FfdBFBvwxN4JIdSw++ku1B+fIRs/w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9+Od68xR0Kil1TXqDE8CVhBvJy+diN/3qv8fDqeWfD+W6URyZMw5ADgE/DhTq7BkTvmng68FMZSZcUJGVZd4ZUxR1PeZjqxb93OUzg/+cQxodcyTE6+n+b02SBdtohGbjsOtqAw+cUzKz7urNVTdvvQrgu6q8kGPzr/y/4XO0dT26TOAKT5Dpqvf+PUlidnsagR0kXEO3CvTBIf7mAjuxiURhh/xp9c7zgkqS0Bl/snL2gb2s8Qv6jHP1gUdgriFUdgx4ouWNWL9p4mYrF0TTB6iuZm+hmXzfMHYsf5dCbE1gH5dz9SXVxhe/bgZW8LmUc/3S5ern9fLpskL9vgGdwogYzieFS1Pr2SkO6cYqcZUwRy3mR7P8CaOvhqgee4tSJ/PB4hxLvZJMiD4qF7WdQIWBqPqKXQD/CpZoILPnAgqH8FM9qshowDuO+trEhZf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 06:18:54.3154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6840fa6b-3714-49ee-ef2e-08ded8caf54b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7417
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:from_mime,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F7E26FF04A

v4: (per Christian)
- Extend amdgpu_pasid_alloc() to optionally store the DRM file-private
  owner directly.
- Allocate DRM PASIDs after fpriv initialization instead of registering
  the owner later.
- Drop the separate amdgpu_pasid_set_fpriv()/clear_fpriv() helpers.
- Squash PASID owner registration and VM lookup conversion into a
  single patch.
- Clear PASID ownership from the delayed PASID free path instead of
  using a separate unregister helper.

Only compilation tested.

Srinivasan Shanmugam (3):
  drm/amdgpu: Allow PASID allocator to store fpriv owner
  drm/amdgpu: Resolve VM through DRM PASID ownership
  drm/amdgpu: Drop vm_manager PASID to VM mapping

 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 82 +++++++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 16 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 65 +++++++++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  4 --
 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c  |  2 +-
 6 files changed, 120 insertions(+), 55 deletions(-)

-- 
2.34.1

