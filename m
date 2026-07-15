Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FsxNBOqYV2rLXgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 16:27:54 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA3875F61F
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 16:27:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=g9Syy8zj;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E868B10F0E3;
	Wed, 15 Jul 2026 14:27:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011024.outbound.protection.outlook.com [52.101.57.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718A010F0E6
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 14:27:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmGeXWYL01BFA/DdD188B4beckdVleSDpa/MpVnxH69j4PcXpQQ1GCkOAA8fspPJMGxXyX2vrtZrNGQzKSapH2a0LMwhspfqpfV1a2s7yCKC5nXoShw764GzkeiLdBhzAOWphl57hyMyIhdw1WJzpy76+NcprJujlaZRziwlpxJE5KMVb8HCKmE5m8VdhNCigW2uh01Tpb3RYyn92ZSZtB3QHJ6ZGfyhiTf+KYpS1jv5Ek+CW8gaXtzNo7cIPMLCrt4cGZUCrassVZ+jMh79h+chFO9CdKIsNmceO5B7XNX4M3cWh/4CQtuksDNmXG2EXcokysl7+6u4E44Ve+afpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Vg7NSiC0GDi3sChNKMfROzclJyaQgRoCusPCgB7myA=;
 b=mpqlECaYSfOgjURhraTDSMh6NVu9TbT1iPwObPivJLbHXRSSY9lfSg2au+DxOEHk5O4mQ3R4TxW4lLGnAEZwZU4RBRzStQGS/Jb5Lt2bJr8JK11BHehq/1Qu5pV1v1vkmZGga4JJbzdmUF1HHUacYfCi9YTfRr7z619Ch9pI3Tnfylm6Wwowc85kUajid3lMN4oGPj3R8jSpvDr26JnbOTtF+62JzOVMpFrdE43P2yPY/9ORUeM5n3OYpwb0n+oWPeiX1tEE3IDdF93fycEAqyM0EpuJC7eGyei4Da3VRVJ45BKZJZWj/DNOrYYEsuO54fjP5N9w5v2lOoMqjh9+iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Vg7NSiC0GDi3sChNKMfROzclJyaQgRoCusPCgB7myA=;
 b=g9Syy8zjfNmn1ltH+cQDl2QEtwushwJMLQaFid+WMiDwgLLW1ICoNMQnHj9Bydx+jME6KSVQg3CHKhm4jzWxn9etpMQ2CEVu2kM/bOzyg0m7fFsXRCLuQqY8iJR0UfrhC0o5U6j/Ji3O2Zj1pV9+9yIRaJQr/oJSdLOVtozTXjc=
Received: from MW4PR03CA0070.namprd03.prod.outlook.com (2603:10b6:303:b6::15)
 by IA1PR12MB8311.namprd12.prod.outlook.com (2603:10b6:208:3fa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 14:27:42 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::78) by MW4PR03CA0070.outlook.office365.com
 (2603:10b6:303:b6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 14:27:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 14:27:40 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Wed, 15 Jul 2026 09:27:38 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v5 0/4] drm/amdgpu: Wire GPU events into EVENTFD notifications
Date: Wed, 15 Jul 2026 19:57:26 +0530
Message-ID: <20260715142730.3475371-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|IA1PR12MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d806820-7580-4307-95de-08dee27d3a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: yR1FMDnvsKA+7vz+aMRPlR9lyys0egiayJgNXc+NheXZFBsg3adq9edjSMFF6Li+th+/ln7GcKXUrPcG9UVy7jIKtbNLM0pFmTxQ10xLRgG1d4udpZaWjkGUMChHbXkg8RqpcT0X/zjaEYGLfTTKT744clJAE0fkL6eaEBJtd3xC80rBzFIjDot0EVN/+q55NmEH14bIcbAUyUY+HKxkCN3zkwxePjYeV1XgB2/bT3tWrFiBVwQHBspSAGePXuX4CwU+07rpMq+qjRO5e4qyyWXO85TSKMi6S1kzrVOTTw1zzHF6CC8wk+mSJhEzjl7sTEe/e+YIgoDVjd4TKgbfZwaDVWSwlUG+LNGP0p1LczBe3z/sspySGWkX0GplxxmDql9hLLx47aEkaByQu8l9caQYbfMy3QdHUn99xv1SnwoHf3OF/b1Vx7DZwrf3pR/6+8WWE++A94GcN1d6u1IcB/EsQoknRNIrQB14F7Cs1XWU6EIqqA21gxsZ6Dw2r5wbhN6vbDNlbVe+KhMPDaRLZPdmD+wuUdFmQKnGQ1otBMIyWTye+eWOR3AYOfQQsl8LHU6sAqSXpZjHe60wvIKEnTDYzEN19HUUFd4I8Z6J6G/9r90NHPDEH/hxoJEH892XNNFnbIHk9v8sqLjaUrpfkSzjKabrxI8GYLV0tkfN/FhuGdznRoba/4PllyCbj+3RNO61b33UeDgKjigAdEieVA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(56012099006)(11063799006)(10067099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dbFZ5J7UZx8yTGz/SE2D0/dXHvK+IIuml/Heaz5VkZ8dtD+odGFPQEgodYZ+Qm4K3jY1JWt+W6wtnFj9hqJiCvSbzF3h21WxUy4lWgRlrr95tarArWMQTUdxCskS3vr+yHziypKWW3g7eMqTckeZEVlhwGdrk1KZqVu3pNRxvhQ7T1RuPQZQa2qWHxpshPVk4bg5aGVR1zh5BuTag3ER5TzWSs1hNrchznU3m5uIfbRsncmhH5DJgwl9/ZZoZvIcqMMuxY5gCdbEjlUgwj81KfOGVEp9vAsBKSm5gxD+jEqVT2Xi74umPq5dmk4WyPBqvXs88jT8tpjrj1RRkRI9uq9n8WrhnBEWTBURj8APq6pgCgp9Ith4Hy80t2wj76992XDNh+LfU85tg5fXDaISYM3WTWh0Pfe7iRqsf6MNWWEXSAitySlwW7kR53Yhod5Z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 14:27:40.9138 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d806820-7580-4307-95de-08dee27d3a51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8311
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9EA3875F61F
X-Rspamd-Action: no action

This series wires GPU events into the render-node EVENTFD
notification infrastructure.

It builds on the render-node EVENTFD infrastructure by adding
notification producers for USERQ_EOP, QUEUE_RESET, and GPU_RESET
events.

QUEUE_RESET notifications are generated from the common
queue-specific reset helper, while device-level reset accounting
and DRM wedged-event notification remain in the top-level
recovery paths.

Patches
=======

  1. drm/amdgpu: Signal USERQ_EOP EVENTFD notifications
  2. drm/amdgpu/userq: properly account for resets with user queues
  3. drm/amdgpu: Signal QUEUE_RESET EVENTFD notifications
  4. drm/amdgpu: Signal GPU_RESET EVENTFD notifications

Changes since v4
================

- Rebased on the latest user queue reset handling changes.
- Reworked the QUEUE_RESET producer to reuse the common
  queue-specific reset helper.
- Kept device-level reset accounting and DRM wedged-event
  notification in the top-level recovery paths.

Only compilation tested.

Alex Deucher (1):
  drm/amdgpu: properly account for resets with user queues

Srinivasan Shanmugam (3):
  drm/amdgpu: Signal USERQ_EOP EVENTFD notifications
  drm/amdgpu: Signal QUEUE_RESET EVENTFD notifications
  drm/amdgpu: Signal GPU_RESET EVENTFD notifications

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 51 +++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     | 61 +++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h     |  1 +
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c    | 77 +++++++++++++------
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 17 +++-
 5 files changed, 173 insertions(+), 34 deletions(-)

-- 
2.34.1

