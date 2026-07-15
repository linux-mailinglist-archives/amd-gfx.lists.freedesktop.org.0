Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1lEVBnyYV2qnXgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 16:26:04 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5809E75F5A0
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 16:26:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=kgUOHVuQ;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C55610E1D5;
	Wed, 15 Jul 2026 14:26:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012031.outbound.protection.outlook.com [52.101.53.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A5110E1D5
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 14:26:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+gaCcHQBeiuHAB78P+gn1CJJBQxRNutsVzpuMQ8cFVTZIz8XqQha1E9e8gvXXYIdPzxwUVkXD3iRk9++EzNS+aS1dGAipIwOpISr8u2gBJVP9sBTPkVmoIjZNpLoEECx56ZJhqDBqSDax8L4ckmOcroO5tPrOjSMH2/bTb+xRiy1Xu8PApJ5Mam6WrajLHQt4//jJmR4WcGkwOY8PQaSWApWd0b0IeMmHSF+gf3KsqHhEl7QTi1azWOWK23iU7BzBKlbNIerQGPLF4upvXQp4tHBekPxaei+SGTN5tY+5WpZPQAe1cxsW1ao7tb1sgCNrnMRERaHUiHEmgy1Fn4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dw77wn+uDeQ41f2jx+LgG5IpstFn3pM9iZX2MW9MM+U=;
 b=RWK8Ntfo8bf8dLWB6JiFDcQVWr2Txlr/ZNUzHu4Oc6Lucxe3mQDWaqPlv1BpZTw8TP0IOntOntd8zFhRzw6QmHcdCbGK2VzrP6Cg1Hma47cOZ5dHEcG0cxzf/NCQYJSuW0KjkWyzsaIG0QGNNQwEAAnf1/FThbV5WJyoWUo8ucJpsiNn6Z21ZBLRgJB8oNl98TbPd/s8d/FbRY944SuwGl93Aua3zGHzGLzZ4W7lsVZj2tKTmYBlofk1haonYqhO/53hGCi8eRmPRV5cL3PAV97I3fLvSmyE16sIvCjfV7hnL7K82jJWM7PBC8oFrHcvCd1bj9FQm58iDqGrU1DfHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dw77wn+uDeQ41f2jx+LgG5IpstFn3pM9iZX2MW9MM+U=;
 b=kgUOHVuQ02ncoEWIjRj6ayaUcUiVgMOu7qP1hIAmZOIPOZ4w8i2C3k9wBGut+MO7RvAL7wdPrh7WcF/GTFTk/vbv3jKxjYRAcM8nLG6BZNZQJ8HnPU79/CAJKCos2SEyOxIzLiOb8GDYz9939sJ70ClatZel3PNzbYfhUdBu3hk=
Received: from SJ0PR03CA0062.namprd03.prod.outlook.com (2603:10b6:a03:331::7)
 by MN0PR12MB6197.namprd12.prod.outlook.com (2603:10b6:208:3c6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 14:25:57 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::78) by SJ0PR03CA0062.outlook.office365.com
 (2603:10b6:a03:331::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Wed,
 15 Jul 2026 14:25:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 14:25:56 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Wed, 15 Jul 2026 09:25:54 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v11 0/5] drm/amdgpu: Add WAIT_EVENT ioctl for render-node
 events
Date: Wed, 15 Jul 2026 19:55:37 +0530
Message-ID: <20260715142542.3475265-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|MN0PR12MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd27d92-183c-4c82-75d8-08dee27cfc21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: KdINjGztXs0fRPApqrzPOFtuKs/1V2rssSBgrj+eVuYMktWW7qlDaLFArRFjo7j7kDGMkpytrF+rxXaXu66swvrFoKLh4CrGqXLXaqkOWP3aBBMlhtsaBZZRkS3dPMPZ8xNHt7a5AIraJt/1BLXagydBFKHN9Y0vpVsQlrTQT2XDxy/bZew2TTuhWZVlwcncEJzs6C37f/6lloumtOuqVVPgA1dNzMTVVwoKJZOfkjBndpBRUhzJZB8vf8KEaNy2Qzjkz6OeHj30pJR7v/KLQEQ4YJ7yyxVrccZi5j+6R/rCqBeUM2SSpreDXt8QyTUMsyQzj5ef9D8HwnUgOKhXONBrHDcTC0c2Hx7Xu5kYU9Vn7734QvPVCRPuomA+bouSHwlO+lYvNsZifDtGLOOrSgqYVEEa9V6JPqInuRlm4qNpZ5E0X38+obrQHztWRSnX9MS2VaYccSENYowMHgr76Rso88MzmYh8sT+hTuqzJYoZDl1m1iJXnnzqs4T13W1Nqn2ZS94Pp4Z0FtCyny8axnnPT3Ea2/psksO3GqNJdg7SJlfGsf0pVWGUkdxKHorpKt09/Ji1X5XwaZVSK6wgi6h8+laAFEqKMmZM2AIpQKvtanw0J2l586ZIWEqJvWSaVUrNHKn9dFFF2VkPbv7xkna++4ch0RWr5U6ovVfyujKXuExltTut7faEbhOjQYeK
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OkcygL0g0gfVt5ceoqnxYehSMXGuDLdjqZ1qrxCJUkxejLAIwRfFnLKGHdpLwyOVSzK77u/aXa3PO7mCWN2Q/GDB+mud8vZcGQIaMT7M8GrN7b6jFDer21rJOfatD3SINvGRMuIJ3G4dVyMoX1Vz7L5YvYsndSGLT2rfMGp0q7arhs4jk6Gy45tv7hx/+WFkIogIPhX4I07JoyhoVNurRGeP55jGSWmCiAqouD7DW8HR8PJ7VmhiTJvOpN4ni2u0oBdT5GaSTLJwAx7tLuCzT1g8weYa5HVEt27ZZkb1pqcYzmWVFDXSxBh5+b7VYl1w9JoJUIJtR6abjRmITYxVhUmNWH59V0R+/urDwleVjw7VHnw4PDnWH2UIa46rle3sCT/onPEKXV5+HjUbz0pcR9jvW5w0NPD16CQ0IBgLpuplfX5icXYJi5j2AJzlL/pA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 14:25:56.5788 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd27d92-183c-4c82-75d8-08dee27cfc21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6197
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5809E75F5A0
X-Rspamd-Action: no action

This series introduces a render-node WAIT_EVENT ioctl for
retrieving AMDGPU event records and their associated metadata.

WAIT_EVENT complements the EVENTFD notification interface.
EVENTFD provides lightweight readiness notifications, while
WAIT_EVENT allows userspace to retrieve the corresponding event
type, queue identity, and event-specific metadata.

This series builds on the render-node EVENTFD infrastructure
and the EVENTFD producer series.

The initial producer set records USERQ_EOP and QUEUE_RESET
events by reusing the existing queue resolution and queue reset
handling paths.

Patches
=======

  1. drm/amdgpu/uapi: Add WAIT_EVENT ioctl and metadata structures
  2. drm/amdgpu: Add wait-event manager and per-file lifetime plumbing
  3. drm/amdgpu: Remove queue-scoped WAIT_EVENT records on queue teardown
  4. drm/amdgpu: Record USERQ_EOP WAIT_EVENT notifications
  5. drm/amdgpu: Record QUEUE_RESET WAIT_EVENT notifications

Changes since v10
=================

- Rebased on the latest user queue reset handling changes.
- Updated the QUEUE_RESET producer to reuse the common
  queue-specific reset helper.
- Kept device-level reset accounting and DRM wedged-event
  notification in the top-level recovery paths.

Only compilation tested.

Srinivasan Shanmugam (5):
  drm/amdgpu/uapi: Add WAIT_EVENT ioctl and metadata structures
  drm/amdgpu: Add wait-event manager and per-file lifetime plumbing
  drm/amdgpu: Remove queue-scoped WAIT_EVENT records on queue teardown
  drm/amdgpu: Record USERQ_EOP WAIT_EVENT notifications
  drm/amdgpu: Record QUEUE_RESET WAIT_EVENT notifications

 drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     |  35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h     |   2 +
 .../gpu/drm/amd/amdgpu/amdgpu_wait_event.c    | 508 ++++++++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_wait_event.h    | 101 ++++
 include/uapi/drm/amdgpu_drm.h                 | 115 ++++
 9 files changed, 770 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_wait_event.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_wait_event.h

-- 
2.34.1

