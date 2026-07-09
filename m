Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3DsfBEwRUGpcswIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Jul 2026 23:23:24 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B791735CD4
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Jul 2026 23:23:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=CTCcxcok;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081C610E0D9;
	Thu,  9 Jul 2026 21:23:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013048.outbound.protection.outlook.com
 [40.93.196.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9134310E0D9;
 Thu,  9 Jul 2026 21:23:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsFw/x2sE3Qgfr4e9Jp1iU/jvHKxZ5wVlQZdS9uGbiuEjMIo4sYT1U+LKl3YxOJ729PFTpQ5mwxOXNc4e7ga6Uq9462y7EkKhYv2fPWNYxiUR8Dh4NK8Lzz96joUxUxycWEA1Cuvhdof93G7VA9u94FjDtHlULZEQtV4HnjnBn0dkOwR7KfCC8Fxqy+dAx8/+iNXk1BUcScIDRkbVklCkr3IR1Kg1YDnI2Q3+RvOYgCwpNBVnypjaR0q/2IvUQnWEbwf/6GxMkP+TbgfT0dJwUeubUsWPdW/HOoDn+rFAyglGNdbEAGpn1Ud9KgqV9qmPWr3hgzv598V2KbGLpCeAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbEuhZ4l6D+XHtmfmdnCsnXXBJH61z7aa2C+l7rqMzg=;
 b=EQ3DUXBW7A2UOIbuTENnRZiraQQVZPOWKTe8Lir6WBZaNXMmklwNJwRGQVHMxCeOaQaO8kHjL2aDRACTwdm6Geps886KhNNwfKtLBFwPytj9Q8Mg4T1pY/AGEunS2a5Z5l+IU/LxCV/0k7+iPkYiNR3JzeBEjJYrfHRsYVLtXWYO9iMLHP3YByF367/bwPD9ifqioDG+7vAsNGgRE7F36bcMaQiKz260n/vn3ZDJnELrtMX+/bCBmbHJFN6G70728eS3WTofeiA2/SNa4z3BiIWY0GR99j27lNyYZXYykqphoMmZDCPbPGnMNQpGaAcruEGchkAK+W2QUtS6gqq+vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbEuhZ4l6D+XHtmfmdnCsnXXBJH61z7aa2C+l7rqMzg=;
 b=CTCcxcoktg1eEPcaWHe1hXyCJypgBUjX4ed4eATY3z59sY0yitNKKPI3MowNvA1sAnPOYInNcmR8++e0YvgQTzL6xDc+REhV0uTAjrNPH99w+wo6SK/c+YgyY8wJi6U16XADBrIgHhWjinixtJ9DREtzXhfQsGXJ6Gxu+8BbaF4=
Received: from DS1PR03CA0002.namprd03.prod.outlook.com (2603:10b6:8:450::9) by
 MW4PR12MB6849.namprd12.prod.outlook.com (2603:10b6:303:20d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.15; Thu, 9 Jul 2026 21:23:15 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:8:450:cafe::77) by DS1PR03CA0002.outlook.office365.com
 (2603:10b6:8:450::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 21:23:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 21:23:15 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 16:23:14 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 16:23:14 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-7.2
Date: Thu, 9 Jul 2026 17:23:03 -0400
Message-ID: <20260709212303.15913-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|MW4PR12MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: 706651d0-1af0-4816-fb4d-08dede0049b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Ehs6Xh5mQ2qbXlUcQsX4xCHPChI5FeQU1WsQpt33eTDS7kCcwwctj9S5NUkCtUt+R1ErIkPN99EW8UuO5+Tu0WEM7/0FayogCN7ZjzmxQIJ1H8s+oq3UHcOJvfUEqs7QEMAg2vWlggzeOst0c4ehBZ3bbrRYExmHj8yXzTVlJbZA+TywNcNYgnb1RBMHx+XaqBMv5U19Wsvrm6K+88IZh/k/Z1C6XpiEiUvAN2RTyXgPxN5L8NrXCOKGSaFcs1cDhXyU9soAQUnW047s8EN36nKnSAQFI5dJkN8GXoe4vrzMmqEk9iS/eKvlZ6SVWyn96FkWUg060Tue2054IB2SW20K8CaRLXj7hRXjcGz++3eag27RqLtvG0fhzSwWT6/QZrIvJSnQnbnEXl1Gn8OHWrTRM9O3FnoKieJ9PlREoHckUrZ0+F6SaVDtXIcbvPT7ivhI+7b3u7Ny7RQBCI1s12Ktnob3M/lLqL4hMOlErnRXGrMloja69y/kIgo8G+Rpv/WIhu7w3RLzRrtlDXG1xqjaULPhc/W2rdtLKMg3a589XGKsiMGRpY6AROfgyTqqWMAqLW4G1cFGoTNvfqMwYuctjc3TM52gj92LZni2WFFv0X26f16qoUSTofv8ZaKW9KQDJbU/c45Fywm7b1UsNA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 34cEVaaChiFy+ABYqNJZ1lIsMSODUc/n0LgzsY6yqXCVMv4NSHY9l2xqAgvQ5MnBIHmc6KwAvhRLArfLgVYsJY37IU6f8uoklbpSs97mzgA/pyU/HnbqKpS6g9Xx96S6B3vkQikSlttZpvIXi72QwS+CjSOhWi0WZ+7gAizBBb+fQhhG2mMuc5bqvxIWuxoX6VkBowwXMdl0/5q6oTVoM/GWg9KYlGYXuoTgIIFz78UMYQ7mxGtLlq/z5gZvHF8bwuWTenGNKbzqV+HJ8s+yqo/Fm6SRW10iCSot5EF25qiWJDVH4oIFuqzRedtvaVtzwaGAjXXXFxzQk5ubq2LSkuBM7ifMuidrACsqAZyJ+JHuZhBXGgOx10/5ymCLuMvLvElvAR+5aTv7bGsUpeNDEWmfD2pPFuXt0O0uLjbgQKCiMrmtViiXf35Qyy5ku1ga
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 21:23:15.0254 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 706651d0-1af0-4816-fb4d-08dede0049b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6849
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:dkim,amd.com:mid];
	TAGGED_RCPT(0.00)[amd-gfx];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B791735CD4

Hi Dave, Simona,

Fixes for 7.2.

The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:

  Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-7.2-2026-07-09

for you to fetch changes up to 47ea05f246bebc81c7796f56265cffd812cf0601:

  drm/amdkfd: Check bounds on CRIU restore queue type and mqd size (2026-07-08 16:46:53 -0400)

----------------------------------------------------------------
amd-drm-fixes-7.2-2026-07-09:

amdgpu:
- PSP 15.0.9 update
- SMU 15.0.9 update
- VCN 5.3 fix
- VI ASPM fix
- Userq fix
- lifetime fix for amdgpu_vm_get_task_info_pasid()
- Gfx10 fix
- SMU 14 fix

amdkfd:
- CRIU bounds checking fixes
- secondary context id fix
- Event bounds checking fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/gfx10: Program DB_RING_CONTROL

David Francis (4):
      drm/amdkfd: Check bounds on CRIU restore event id
      drm/amdkfd: Don't acquire buffers during CRIU queue restore.
      drm/amdkfd: Check bounds in allocate_event_notification_slot
      drm/amdkfd: Check bounds on CRIU restore queue type and mqd size

Jesse Zhang (1):
      drm/amdgpu: trigger GPU recovery when userq destroy fails to unmap a hung queue

Kanala Ramalingeswara Reddy (2):
      drm/amdgpu: add support for PSP version 15.0.9
      drm/amdgpu: add support for SMU version 15.0.9

Kenneth Feng (1):
      drm/amd/amdgpu: disable ASPM on VI if pcie dpm is disabled

Shahyan Soltani (1):
      drm/amdgpu: fix lifetime issue of amdgpu_vm_get_task_info_pasid()

Suresh Guttula (1):
      drm/amdgpu: Disable JDPG on VCN5_3

Yang Wang (1):
      drm/amd/pm: fix smu14 power limit range calculation

Zhu Lingshan (1):
      amdkfd: properly free secondary context id

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  5 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  9 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 25 ++++++---------
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  9 ++++++
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  3 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  6 ++++
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |  2 ++
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |  5 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |  3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  2 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 37 +++++++++++++---------
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  1 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   | 28 +++++++++-------
 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c     |  1 +
 .../gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_0_ppt.c   |  3 +-
 17 files changed, 94 insertions(+), 50 deletions(-)
