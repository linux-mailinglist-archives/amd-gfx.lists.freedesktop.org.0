Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iPYWOOQvMWoidgUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 13:13:40 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418DE68EAEA
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 13:13:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=zZwbSO9X;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC76D10EA28;
	Tue, 16 Jun 2026 11:13:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011002.outbound.protection.outlook.com
 [40.93.194.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FE110EA28
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 11:13:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgHnixx2cXAwEAcHtETs6JSxgaQ5jgTF0W6VkplIjop0LTOyOye4uRUs2VB/MhCK/ROwlkDq5tmITOhAFmqjQlwR/S6dP7kk+SBLTiAJY2sMB/ZX7NKFREybRqB6ShPZineeJNXpMpBLWTm0qxnTjrd/2+CSWu066nVKMb8XzpO6K16OquChP7F88nSFXnhegn7dVpgmKPyf8pkDlcCCWDxeJisV9Sx7maBAYjoLVr8PtFTolTpqVAvPtmYwiIgr4uvDR/VygO3AyA5jYBYDnyNqXn7kWgJCGDmfOtsP5vIleAlfboSTIYK53uZT5K9JQWAKr0pGJr66GT8nK5ZQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZHGvhc128DylFxvLnsXT4LBsXKI01HApnXw0wAw3cw=;
 b=Zkui/5tBcXbv0PgWIT/azoqgL7+2cvitgsdSIWH8IllQlyf49AN/icIxkaJBgQG0uQ6GlYtP3yzDkVkU9Yor0wpY0qBwZsuAZOQM42Y01mYEsWxT2kfx62U5GZY7fzGRQLxbnp6dyyiGUktF5ccAcQlIKiptbMTY57SVQW3VndRIUw3kZFDiezZwOHtpxDlAeJyazB/iRNhwf1vl7n9zToLzQL4UlpxvwDcTTSUOCKoXwpW0ebAog+Nc55olsk2zqxbgopssyTaYasdQPd+LhQmUTE39gZhegafcrlfub9CLES993i/lMyNUpK1VNUafMomr0EPdrlv8tH+j5vfH8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZHGvhc128DylFxvLnsXT4LBsXKI01HApnXw0wAw3cw=;
 b=zZwbSO9Xl0E7jnS2/d3G4ipjgMj6CzKbl/mO2YP+4NVOQbNKaDxqesrG7kk5PVws392lJGIid+oiitw4K/uwYyWVLK380D5tYlTb1TTIp3w00eT6fNOx4IGUU5cn+wrXhfSga3l8waEh4PeRdqf10INnQxCQw5cM5im0HWu2EfQ=
Received: from DS7PR06CA0023.namprd06.prod.outlook.com (2603:10b6:8:2a::14) by
 DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Tue, 16 Jun 2026 11:13:33 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::75) by DS7PR06CA0023.outlook.office365.com
 (2603:10b6:8:2a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 11:13:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 11:13:32 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Tue, 16 Jun 2026 06:13:30 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v7 0/4] drm/amdgpu: Add WAIT_EVENT ioctl for render-node events
Date: Tue, 16 Jun 2026 16:42:38 +0530
Message-ID: <20260616111242.2922144-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|DS7PR12MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 901d4d50-d3a2-4fbd-9ef9-08decb984d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|56012099006|11063799006|6133799003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: kpqBYF1kzCKgtCVcpilAz7NoM06kszuZkxWotNabm1WYOIC7xHTQvmxORsruglvsi+KcR/OiB3QohxqrY7HAz5NVsQrhHYravF9TKGnysVtu0bl+6KSE98PwGrJLRB2BvlBGo5mKrvpXUXDa6tCV8Ga8yv27OpmWxij8ml9nKaPNTMnKOXb07Ss2g7wZSz7TrOJ3RuL6GIVx31tlc6A9YfzURdJ0w/UnRSkIxdHV7RSGS+VM/I9jue7VKt94LlH7xjRySdYG5IsyyGChFhpo1gcRyOi9kkVoUSUF6MCql2TGSXyvpmINkufsURzZBDUdQtuy14eRzk8QsW5jsD9PGK1AavQNfBw65XGP9ikbM+eJ4tyqaECMaCKd1aURvMztGeT9fD1pSSDdALMET5fUtYoaQDDL14VcTB0RTiXQYA0EHMttGBevFtnv8Oeq2D4xLwnHQZh3/818RLqBe6sC5s6QLMC4lZLijK5iz9AalInSOoJCCqGkXU+SfY72rxdi/G8fAgX0ShoXuCYr4dp00GY8dE29UY/8VSXONwuZsNdvLMhMcx3zgFL8HdYfFLrPqVVXq6N6tKQ6XseUSxoPLgvX8fw9P7cTp9ZcXd/atq7vpajqKijc34vBWPHrRFN/4ijmWdvCWHbG5rvx4yPJ/s5j9X7ak8+lnBVrFN/lZ42jfhfLrLS2RiIIsjKLV1uI
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(11063799006)(6133799003)(13003099007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: U5nO57nX8ZXmlcI3Vf27YLi05OV9o5ooQyltSKib+DPipf4yqx13qjEzRePmSNQz5zcQrdlR5Tn0/7xMcmlDr7m66dyjfO2IH0+MSKYSxrskf+eRd6WyfOvljdsJP3Upi0T9lprzvX2Lql+M9nG6rkEO/xwMueqo9lW0PD8ichVkBgZfpMJmZ3aoCV0EAuH2pu862JgS8I1l+J1NwQM94//TzA//iHPPmNSuBDqDvBNRH45UlqUFy4hkcb7Cdrk23GSTGpIZA4U9KcVgWlThX2bd/a/OhF/Nyav5g0ekPWI8y6w28CoMirAAXT8nqoHaTecWgZ/0px2FtxhVUDFzeuhyfKyd8rmnySXfyOtzUosQZGG2EnuE5oNgnUWH2xxV+yklnNhjxciqyW+PQyFFr1UDKmxykAv4hIrwl1prKl3Iw5f7Vr4MD2O75KVO71by
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 11:13:32.2585 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 901d4d50-d3a2-4fbd-9ef9-08decb984d29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:mid,amd.com:from_mime,patchwork.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 418DE68EAEA

This series adds a WAIT_EVENT interface for AMDGPU render-node clients.

WAIT_EVENT lets userspace wait for GPU events and receive information
about those events. EVENTFD provides notifications, while WAIT_EVENT
provides the event details.

This series follows the same approach used by the EVENTFD series.

- queue_id is treated as a userspace handle.
- queue_id is used only at the ioctl boundary and in metadata returned
  to userspace.
- Internally, queue-scoped events use queue pointers instead of queue_id
  for matching.
- Pending WAIT_EVENT records keep queue references while they are
  queued.
- USERQ continues to own the queue lifetime.
- WAIT_EVENT records are removed before USERQ destroys a queue.
- The WAIT_EVENT manager is tied to drm_file so that pending records are
  cleaned up and blocked waiters are woken before file-private data is
- destroyed.

For reference, the EVENTFD series that follows the same design can be
found here:

https://patchwork.freedesktop.org/series/164618/#rev7

This series only adds the core WAIT_EVENT infrastructure. Event
producers will be added in follow-up patches so that the review can stay
focused on the basic WAIT_EVENT design and lifetime handling.

Testing:
Compilation tested

Srinivasan Shanmugam (4):
  drm/amdgpu/uapi: Add WAIT_EVENT ioctl and metadata structures
  drm/amdgpu: Add wait-event manager and per-file lifetime plumbing
  drm/amdgpu: Register WAIT_EVENT ioctl
  drm/amdgpu: Remove queue-scoped WAIT_EVENT records on queue teardown

 drivers/gpu/drm/amd/amdgpu/Makefile           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     |  21 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h     |   2 +
 .../gpu/drm/amd/amdgpu/amdgpu_wait_event.c    | 286 ++++++++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_wait_event.h    |  74 +++++
 include/uapi/drm/amdgpu_drm.h                 | 103 +++++++
 9 files changed, 497 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_wait_event.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_wait_event.h

-- 
2.34.1

