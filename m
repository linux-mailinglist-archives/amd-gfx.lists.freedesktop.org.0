Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rx+tCcCTOWoFvQcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 21:57:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F13D6B22C6
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 21:57:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=W5qxykyT;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F5110E746;
	Mon, 22 Jun 2026 19:57:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012070.outbound.protection.outlook.com
 [40.93.195.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD0210E746
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 19:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGFG7VorbUaRNptNVTbQYhgmAsq4jTyvMNrf+P8nhY7RuYsMUE6X7cHHKTvuZPUwBqBhBh0RBil5Fb6829B/LXypMbUKiQnjkWhDejIZpgiTM7DC0WDOq1lTBuhlKu0xV61qSE45F+mzfVbTgGoApp6PochymsgI8ypl/o1wegOjBFdDjU4gN00vVof04RWmDV4PCx1dTCI9TAfkW3HpPT/NfHSvunCgn8rQZdpPy+xCRFw1yBtoxwFrBzMIT0V5EZ6Lc8rsuGPtBLxwesnumL3OFkPuuaRj5oZ5od5J85jxvXca84Y++g9R9p6GxJd9ajyD5EfU4fLtJBNfghV2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWITPQyjfnzMUImt5rW3lHV2OHmL41hx/pEua/9/uE4=;
 b=unIOh5qZh3ANxo7OmcaFX7yIcs84KQOIpjaNJG0j2q0HcAaD/jIKRC5Evl3mMuYpgI+WROTXPn6NA44aBdJOVK127v31gWb+3h+OUmaN/2d0gqj3ASbXktAHV0q25114pGqMU9WN8lhGbYxlnQe52sa+Ngow84IgWD7eFIEPGbH8DQ9uXrR3eeVm4KpAkeujkVKY4IeNfGzaVfmh/oNJqWYVU8sZfdZvpv77zdjhLnYyPKJN0msJTxjM/1YWfOg6ycxBIlov5yCZilCpsYeb9fXQNO4rVCTkWtTnIJ+UVwQjP14vZgKRGQp+GmHAdS0lkqDT6eblbSHfLob4LrY+vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWITPQyjfnzMUImt5rW3lHV2OHmL41hx/pEua/9/uE4=;
 b=W5qxykyTi3C/7JGeJo/W5piUbZwHLvOxzYw+1+z31ePbQnMIpUoFPidtFsW/di/N1m9kcx7cnZZW+J6DQP5ohfHMg4CM6y8Oh2Uu0NHAkkm4NHMHPW1vng2cRb5hnlo4LaJ46Pm9z+4OpwrNmps44+CeVf3ptVtQ6vKI9jGHH5o=
Received: from PH1PEPF000132FB.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::2c)
 by DM6PR12MB4220.namprd12.prod.outlook.com (2603:10b6:5:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 19:57:43 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2a01:111:f403:f910::1) by PH1PEPF000132FB.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Mon,
 22 Jun 2026 19:57:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 19:57:42 +0000
Received: from amd-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 14:57:42 -0500
From: Shahyan Soltani <shahyan.soltani@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <christian.koenig@amd.com>
Subject: [PATCH v3 0/8] refactor monolithic amdgpu.h
Date: Mon, 22 Jun 2026 15:57:21 -0400
Message-ID: <20260622195729.181216-1-shahyan.soltani@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|DM6PR12MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: edae5ac7-dae8-4646-7a22-08ded09885a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: ut+mRBE0uydZToOr1CMZJ0M5xc/jhYNjxYCPCfWuVg51VkAkkZiwoX0ost5x/lOBTZJdIaCwu3VnNzJUEn/IhGnXhOW++h7u9zY2ZMBo9a0WwaJIPYEufFFTPIUwX3kv9maZKL409APdcvVT11vd4Y72XBsf4nSg9d+ObQLpZFVuMKIL0kZzHDi71TsnaNMZr8Vw4PzK6YeYzDI6EhqTipAAAEuO5xde9uKsZuPqgdStKZt9y9mKisKpnuv9QIDLt5TCA6lhe8b5ZIM+RbfBc/oXZlRDRcopQ9JmBpqn3tX+blfTbDId4ufJlHNlkbdryXT5WP2UWixHtuogK7XB4Gk0lvcU0FKwtqTjYlB8sgR35L5i4FXesP7Qb36ZTOvyjkV1tT8tjFqqGIvnFUJS6LpyktBlt8Pm5ViqLV5xIcnwtZA7zre9Kft5hT9Y2nv5CgECj2qKJvAoivDBm7NdxWSDDgZwKogjxqZ31oa2GWlTHKWtq8HqXPNBRQeydXycRXECmB9RER65V82gWQwmVMjznbre73QVkzUoqyzfx34y+lxL5g/uGFWuzFXN3lJR5lj3tJk8BIQeKAKlRKq+8w/dURbEr9OXdFmisbeNhf0Vyo2hPVPjI8QhwWuhO2Ujg4mQa02HlCZU+i2/7nDCnxhMA+ys/veVaP0oG8TRyRvCHgHzJz+Vbs/JBWhfE5aeIziOh2qvdbwnFGuR2ilHqA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(18002099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Six8co+guLo0Ceh/UUPeIh0sdGB9gmgrhOQ9HA831CLtnY3xXJhCJHdx08aXjLiYMnTuMzKfButoSCDnU9XRNCqN8TtLkz6qWrxbKNZYconOuFjNh8VapBTOGvJ2+h/5Hh7DrVwY3vxMQI/2aT3i7blnys8+o92gxy1IdpVGkT6aWmTM62MphcG4Luu7ByZjPFgBeEf93JJSH5ZMVNTYKFrK6+6JES9efl5YmnIfM3VLcLFr0jjMzV6x5Py3b8anCp1lKNRcL6OyEbxkqOWVTwk6KoBofwdiN3JEeWWAc/ZyJyN3xZxGEafU9swJ85xMd92CoCJxgc7Nd4cXf2Z5h14pgHo5Jq94A2op5iwQySqv+4GNsg5zDjcSVZjl91mzA+bNvnylUI9flrBQDgAieelOjsm1a8IHBlrh46Extkt93evjht4dLwg172zfUtKD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 19:57:42.7887 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edae5ac7-dae8-4646-7a22-08ded09885a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[shahyan.soltani@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F13D6B22C6

This patch series refactors amdgpu.h by moving several structures and their
associated helpers into dedicated or existing header files. This improves
code organization and makes the structure easier to parse.

v3:
 - Dropped patch "Move struct amdgpu_sa_manager out of the monolithic header
   amdgpu.h into its own dedicated header amdgpu_sa.h" addressing v2's feedback
 - Removed the "_device_" part for amdgpu_wb functions addressing v2's feedback
 - Patches 2 and 7 are unchanged but can be dropped if amdgpu_uid is not
   desired to be removed from amdgpu.h
 - Removed amdgpu_mqd.h and moved the relevant structs and helpers into
   amdgpu_mes.h addressing v2's feedback
 - Dropped patch "Move struct amdgpu_init_level and helpers from the monolithic amdgpu.h
   file into a new amdgpu_init_level.h file." addressing v2's feedback
 - Dropped patch "Remove #include "amdgpu_init_level.h" from amdgpu.h and add forward
   declaration of struct amdgpu_init_level."

v2:
 - Moved amdgpu_device_wb_get()/free() into new amdgpu_wb.c file and
   amdgpu_device_set_uid()/get_uid() into new amdgpu_uid.c file
   (addressing v1 review feedback)
 - Removed v1 patches 8, 10, and 11 (addressing v1 review feedback)
 - Moved the includes of headers amdgpu_uid.h, amdgpu_init_level.h
   and amdgpu_video_codecs.h out of amdgpu.h into files where they are
   actually used (addressing v1 review feedback)

Notes from v2:
- Moving the includes out of amdgpu.h into where they are actually used
  caused the commits to go into different subsystems like /pm.
- Dropping patches 9, 10, and 11 is advised if this isn't desirable.

Shahyan Soltani (8):
  drm/amdgpu: move struct amdgpu_wb and helpers into separate files
  drm/amdgpu: move struct amdgpu_uid and helpers into separate files
  drm/amdgpu: move struct amdgpu_video_codecs and helpers into header
    file
  drm/amdgpu: move struct amdgpu_mqd and helpers into header file
  drm/amdgpu: move amdgpu_acpi helpers into new header
  drm/amdgpu: move amdgpu_allowed_register_entry into
    amdgpu_reg_access.h
  drm/amdgpu: include amdgpu_uid.h only where needed
  drm/amdgpu: include amdgpu_video_codecs.h only where needed

 drivers/gpu/drm/amd/amdgpu/Makefile           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           | 289 +-----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.h      | 151 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  96 +-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c        |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h       |  46 +++
 .../gpu/drm/amd/amdgpu/amdgpu_reg_access.h    |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uid.c       |  75 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_uid.h       |  50 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |   6 +-
 .../gpu/drm/amd/amdgpu/amdgpu_video_codecs.h  |  47 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c       |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_wb.c        |  71 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_wb.h        | 100 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/cik.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |   8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         |  10 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/nv.c               |   1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |   8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |   8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |   8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |   8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        |  10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c        |  10 +-
 drivers/gpu/drm/amd/amdgpu/si.c               |   1 +
 drivers/gpu/drm/amd/amdgpu/si_dma.c           |   8 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/soc21.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/soc24.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/soc_v1_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/vi.c               |   1 +
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c |   1 +
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c  |   1 +
 .../drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c  |   1 +
 53 files changed, 679 insertions(+), 491 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_uid.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_uid.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_video_codecs.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_wb.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_wb.h

-- 
2.54.0

