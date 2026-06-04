Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xCf4LtIFImqkRgEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 05 Jun 2026 01:10:10 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180DD643E5C
	for <lists+amd-gfx@lfdr.de>; Fri, 05 Jun 2026 01:10:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="xjygZ/C3";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C57C10FB50;
	Thu,  4 Jun 2026 23:10:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011008.outbound.protection.outlook.com [52.101.62.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6B510FB50;
 Thu,  4 Jun 2026 23:10:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPd0RO3jTzdXkxc6v4oByd5ON02N1ZLVxnhP7EzKN7yES9UMJg4ynQIJ1qX0MIcH6ZY/vwKVXbRn2thHmd+Yr2nIEJ6/DJT5F5GaPYQjhxUhZ6NUYMytfsauIW/nWmupAQ0+CiHW06k9NEShAf4gbxSN46RXUemrYYub/R/PCD58KnDDz/UTdrvZPAFTNQcaslC1gwlmD63NX/HJsIdeQzckVTYwczG74gwcZR7q3pxikRoVRPvoIpBo0Ml9BuUKjOmZ0GYJLXH6fg6UF3XyMuBSkrWBag0y5OacJU1GixQY4JQ1vqK+BMM8llIDXrSMTq3PgcRi0E0yJ0JNxz2hwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0csn6TWMxnam37qbJzx8EZVavePKHSls4afDGPwLZc=;
 b=PlYNK1gw9xOJKSI9pQNbcqtdrIS9k4/yZp/s0MqpTg/NKUS6MpQXB2mKGgw7IBlvsaAsC52opvdi3gH3nqqwEJZRTklbnRh7m7F4UeRg828vOh1feuKWxs2pCq41bfCCK05H0Tp6yDtXSeUtJ2m15SSldY/4YviPQh+eLyraYXEvkVJp8RtT6iDa2ORMwdVZy0gJtd7Js0vzDJ/B+jzNoPrPe+Wd4StgMvVlFoxbIhzPhnnepwBMLyVTdaW29vqTL4rx24PtBSl7dfYKAnz5ooFXRQP7J5hCyv9Iz0AgOKyS65OUfa8q9IqT6RwxVigAWxEU8TRZIK4aOzwsBL3KIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0csn6TWMxnam37qbJzx8EZVavePKHSls4afDGPwLZc=;
 b=xjygZ/C3ontPgHyL8ErjMlDgikOtSgbWfpS4+u0Kv189yPjxNnge4riOwb1QOfoe7kbbSZuZaWsCa/rYbdzq5b0OMPoXL6J77CSmg7V7dZHFNsBjaaW5tiws/8NXHmLkqZhOd1f585qXonTIcs43oWi7i7YCBRYYEN8BuxxW86k=
Received: from CH0PR03CA0182.namprd03.prod.outlook.com (2603:10b6:610:e4::7)
 by IA0PR12MB8351.namprd12.prod.outlook.com (2603:10b6:208:40e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 23:10:02 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::3c) by CH0PR03CA0182.outlook.office365.com
 (2603:10b6:610:e4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 23:10:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 23:10:02 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 18:10:02 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 4 Jun 2026 18:10:01 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-7.1
Date: Thu, 4 Jun 2026 19:09:55 -0400
Message-ID: <20260604230955.19629-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|IA0PR12MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3253d0-09dd-4754-127b-08dec28e6848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|13003099007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: tBGKPsTfo4t5TNWnAULJW3RHu1SNsOaM+G0J8vFrcq1hGMrN+gPlDb6nEDyGYIAE0f/myc89TugUhFCrlRFh1ec6OutZWKXsusFrROfE7Q+qqhfO4TUgwTsxAXT3yvKok0tOgq3tLaC8Hg4ZCtXReA70c9U3GMMoMZPzCMSQmneB5KTeFCWZlRlDlHa5lytHNg3fucqdJJRRzs00Kpqf2MUh3TXLYPobG7qdhs9L91tiBKn0AOYorK9tQMk5A9clVC5E3ZRZ82gzUgAvTkJw/DO48TgzEwvfYQG1nZ4CbqeiFjsb/cW95N6MQD8Ch4qpmh3KCsS/XMYkO18QgngSkr9x9rj6xjXLN/e8u/0QWmgMcoTaA0zG+wcJHvc7q56uXb9VYONEmR1kDhRJMOctd1GAkXfmnrpSkKSzAev0ohFjJtQNzFybexUWtEa1Y1TW65GCM70NsxX52l5WoM4FBRUY+RYan+assPQOBom/P7V0b//FunzGTTN3ipGREbkkd5efT2i37q6PGZ1/tFnrZEm9GZ9xL/Qv9o2vH9oaaGiny/Voo9aLLhGtdXmijjVHryg2gduTVxbK0ezXr/XajBw3ct6VVQJgJxz9ZWQFSmlSaEALQ9yrTHczg4k9G8g/6Rmt5D6LFRgV8wQg5Y3I9tG2h/rl3kdnH3Mgic3nqQEiCMbzo8j+hzKsmDZJoZiW
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(13003099007)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KMTBCpE05daeLuGRKNDVMb9USTvD7assClUUgF+CIW1WzQihwB7IMiyCPRuuWg7YWkEBRvrMR0/DNEP/rmiX1zAtMi+mDOxo26AwFLeRLV8wYBb2gB/0X4YjjHFpNG4A98ERFCi+/aamtKnjkQoBtlg9zOaXP+C7cgRPZY+ht+i8eKrEPGMdkaSEyre5iWzHuX7W7B1leznORKVnhc/tkLGFenwqOf9NMo1WrWy2Ioq2A+WZsuykC3Xnj6BveKcohj+RGn4d/2OvBDDMv9LWoDDvYW6E1VMatFhkftkpwgyaHo3dSpmOqzCvw2PurgMBYy6W5eLpQSyLdZ7IZfhMCOhjfbbVtrNojrl0Y/yq2wwQrq00QR7nrl51plNtmdPvD2h3qz/zSDmfO67PW4lpD4gQvwduulebJ5AhG1ZfvWfrjQ81/a8jzeqLogGxy20t
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 23:10:02.3470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3253d0-09dd-4754-127b-08dec28e6848
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8351
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:from_mime,amd.com:dkim,gitlab.freedesktop.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 180DD643E5C

Hi Dave, Simona,

Pull in the MCCS regression fix and a few other fixes while I'm at it.

The following changes since commit 03b70e0d8aa26bab89a0f1394c1c80a871925e42:

  drm/amd/pm: smu_v14_0_0: use SoftMin for gfxclk in set_soft_freq_limited_range (2026-06-03 14:57:46 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-7.1-2026-06-04

for you to fetch changes up to 2eeb342aff66477e0db9833a6393e581a6dac4f3:

  drm/amd/display: Consult MCCS FreeSync cap only if requested & supported (2026-06-04 16:00:11 -0400)

----------------------------------------------------------------
amd-drm-fixes-7.1-2026-06-04:

amdgpu:
- UserQ fix
- Userptr fix
- MCCS freesync fix

amdkfd:
- Fix an event information leak
- Events bounds check fix
- Trap cleanup fix

----------------------------------------------------------------
Christian König (1):
      drm/amdgpu: restart the CS if some parts of the VM are still invalidated

David Rosca (1):
      drm/amdgpu/userq: Fix reading timeline points in wait ioctl

Michel Dänzer (1):
      drm/amd/display: Consult MCCS FreeSync cap only if requested & supported

Sunday Clement (1):
      drm/amdkfd: Add bounds check for AMDKFD_IOC_WAIT_EVENTS

Yongqiang Sun (2):
      drm/amdkfd: fix SMI event cross-process information leak
      drm/amdkfd: Unwind debug trap enable on copy_to_user failure

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c            |  4 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   |  9 +++++----
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c            |  6 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_events.c           |  2 ++
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c       |  8 +++++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 ++++++--------
 6 files changed, 27 insertions(+), 16 deletions(-)
