Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7Ih0F3cWKmovigMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 03:59:19 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B275066DBA3
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 03:59:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=PGm470HD;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123E710EC61;
	Thu, 11 Jun 2026 01:59:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013053.outbound.protection.outlook.com
 [40.107.201.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D2310EC61
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 01:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/k4fEObQGOUh9wu3e2UTU9nfWVlZ7Vbv7Xo6AYxjEA08NOTXNlp1/BlO9S/zPTy5xlrbaVoYzLT3pzMfhcrWhF4gRXLl/RpfrS0+lvyJXdSQESvpXzZnDMzMVv/gYoPBkoldFixs1GE6zBLD2XuZedjajXjEyF1bIg5ZuFOqf6bG7gWD/1i6NoFT7Odnd24B8jfwjjq5m7ggZ+PvXHSOkBzCnhw4Oim1hvKhtEi1/T0t+FV6SSHJOWM3ftSz1AgIg4uCyBTftYJD8nrvefxIzbmXlIYo11fXUoxZW0XM60vWOZ9Z2DQDFCpr+BE1IChuO3hEWv9kDM70sVTRz/kbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIy07ll1V+hTmqL0N1Mhqs1gQcn4ZoWUhobVXl0kdfU=;
 b=ywRrkj3ifIqFA0HxvhnlOWMdMxx+BL3bwcjhey3A8AWSZAtqquPyZuiFaSho8Ckt0xkPjmqhk7rmHJebvW2PdIa1AkdUXtohiV0LkskNVEW0cEsPNBVb7M6c141EMvy9jvPqgk2Dfy40H1PMnVAeSn2ZqBhV1eeeCnWcG04VmXNNEYTPHZ/tN2fIOQp9VMwsSgRIafpjf2cDnLCKFZZVGo3v08diHK0sCHJT+5MscLO+ezOwDU1YwIA1gbWS90XY8SxPV8iAVmaVtYcgzAckncOEdDJQdJbArLDbOU5jHAFiK8kqz0stVO5dDeuet73ix6kTXZL6feB4v+ZKs0pIFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIy07ll1V+hTmqL0N1Mhqs1gQcn4ZoWUhobVXl0kdfU=;
 b=PGm470HDSSaYGCsXhVvIcJRykSuxY2JanAnGa4eRCa6WUrl5ZzwhQ+yJnVoNxs1pjxZb2PtB5Drq0vLNDLtJbC6zO+O+80rezFTG2nF+vifBby6q0BCEgE/tJkR2zddzq+7B+eXWyhV8IKrJNExme3t8zfF0tVwN+E7gErHFPac=
Received: from CH5PR04CA0003.namprd04.prod.outlook.com (2603:10b6:610:1f4::12)
 by SJ2PR12MB7822.namprd12.prod.outlook.com (2603:10b6:a03:4ca::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 01:59:10 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::51) by CH5PR04CA0003.outlook.office365.com
 (2603:10b6:610:1f4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 01:59:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 01:59:10 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 20:59:09 -0500
Received: from rtg-MAPLE.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 10 Jun 2026 20:59:06 -0500
From: Priya Hosur <Priya.Hosur@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Lijo.Lazar@amd.com>,
 <Alexander.Deucher@amd.com>, <Christian.Koenig@amd.com>,
 <Mario.Limonciello@amd.com>, <Kenneth.Feng@amd.com>
CC: <Pratik.Vishwakarma@amd.com>, <Veerabadhran.Gopalakrishnan@amd.com>,
 <Priya.Hosur@amd.com>
Subject: [PATCH v2 0/4] drm/amd/pm: smu_v14_0_0: fix pp_dpm_* clock reporting
 on SMU v14.0.0/v14.0.1 APUs
Date: Thu, 11 Jun 2026 07:29:06 +0530
Message-ID: <20260611015906.8291-1-Priya.Hosur@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|SJ2PR12MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 1354813f-0d0d-4676-bc5a-08dec75d0751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: C12T0pppNPhcg6WhiLoKw2jbqyTzJBlL/VRur1vue1kOQtvYwgHFn/ojJTMQtXV7vfhjU9O1Yt4g0Ni7QtvYymOjFAIDXYOb9QF7sOA8A2hBYsXrNCNTxbN1Ko1UG4qGWTvEEuTTXY254tQxkuo2kpdLQs4fgEkZ+ywSIGyMxsm2YmuD8v1mVcEzHYxkyxd4cSnt40h9gs5lyEWTNm2P0qG5VVcwH03nX47YHnf4m8Ovgd6s0gxwV7fzEZudRfryJ6AoJy2jWdKc+p6bKZam4HNZ2C29mC8taIoFzZ8mkH2iQPcvb8fLnWOAX7VnfaTPGjYaxqbhhbnh5/bdBpfUwDyk932ox2LFHyMHD8Wd/KGUjQ7VTAZVJ3cY20C8p37Yey1G40SK97cMHi+Bbkh7F/5+Lk7SNBnP5bFmDSaKSLtHzvrZ2eo/f6lnDZhZoV72w9P1EOgbSus7op7TMlhlBfkJDMnwq9DPvr8XDvm7XRrqsmfzby9YtBDb73jDvs0J90Ltv7xU6JU2pTwNJTmyU4Of8cgw74Y5fzm1jei19Np7M7LzD/P1MbrqGHLOcHQb4cpGgO3Y0H/IkNC7VYPLViSjf8EIAKAI1wsTJdz6NwKl1sW+wPkbDAAJg4zU6/X03iIPbsLb4uw36BmHMjntJO5Hu2iZG8znzZ/uBvdOUBz6I5Smn4D4q/AJcnbh7wq501VtFazaJ9zhIT6MIj0nBkyGzQZ/PPW/MkrnlfJ/QkY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(11063799006)(56012099006)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ICsg/vt4sRxWWrvsGJqcqzsod8gwj44MTKycF0W0V/D03Qc3ERgMYa5w0lYhJniEI8fr4n6MK4xs8L6om/RywZkdEhkNOMq9XcH3DRNr5a+RtcGI/ry2GkXuMGhgKisF8j7fe9EGzEuSVjFMUilO+TjwVRXmTl3j08PIcFcAG8iGP1ZTvP3rF3UdIAVMmYeq6H7TJts99EydwwTFpMwK68nCMnnXT7iDHPJ0nis4SH2RxGaXglMvNOLq8Qt5M0yk2eb1H5WfqH4DCvl6dbaqBUVAiJVYJbfF4hla6LtiMWsCV1dEQvzRZKNMnN2ko0voU+pXowWFk8NDOD+rv0mGl2Rb7HyEGzhE33aZaM0rkPuGvpIR7aSXGya8GSgiFuCvPlX8KFAdlWbKBf0AfddfhhlrUT60w97EETyp6h0SidNxpfWouyN3ECl1H+hdHdWp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 01:59:10.1327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1354813f-0d0d-4676-bc5a-08dec75d0751
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7822
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[Priya.Hosur@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B275066DBA3

This series fixes multiple pp_dpm_* sysfs clocks reporting N/A or missing
the * current-level marker on SMU v14.0.0/v14.0.1 APUs (GC 11.5.1).

Background
----------
On GC 11.5.1 APUs, amd-smi reports N/A for VCLK, DCLK, and DCEFCLK
clocks. Additionally, MCLK and FCLK show DPM levels but lack the *
marker indicating the current level.

Fix
---
1. Merge METRICS_AVERAGE_VCLK and METRICS_AVERAGE_DCLK into a single
   fall-through case mapping both to VclkFrequency (SmuMetrics_t has no
   DclkFrequency field; DCLK tracks VCLK on VCN).

2. Add IP_VERSION(11,5,1) to pp_dpm_vclk, pp_dpm_dclk, pp_dpm_vclk1
   and pp_dpm_dclk1 whitelists. The target APU has two VCN instances.

3. Add SMU_DCEFCLK to get_dpm_freq_by_index and get_dpm_level_count
   using DcfClocks[]/NumDcfClkLevelsEnabled. Add DCEFCLK case in
   emit_clk_levels.

4. Add closest-match fallback in emit_clk_levels: on exact match, set
   closest_idx and break immediately; otherwise track the DPM level
   with the smallest absolute frequency difference, with early exit
   when the diff starts increasing. Reverse DPM index for SMU_MCLK
   since MemPstateTable stores levels high-to-low.

Validation
----------
Tested on GC 11.5.1, SMU 14.0.1 APU. All pp_dpm_* clocks now report
correct DPM levels with * markers via both sysfs and amd-smi.

Changes since v1:
- Patch 1: Dropped VCLK1/DCLK1 metric handlers; let them fall through
  to default UINT_MAX (N/A) as suggested by Lijo.
- Patch 4: On exact match, set closest_idx and break instead of
  continuing the loop. Added early exit when diff starts increasing
  (monotonic DPM levels), as suggested by Lijo.

Priya Hosur (4):
  drm/amd/pm: smu_v14_0_0: add DCLK metric handler via VCLK fall-through
  drm/amd/pm: add IP_VERSION(11,5,1) to vclk/dclk DPM sysfs whitelists
  drm/amd/pm: smu_v14_0_0: add SMU_DCEFCLK support in DPM frequency
    queries
  drm/amd/pm: smu_v14_0_0: add closest-match fallback for DPM level
    marking

 drivers/gpu/drm/amd/pm/amdgpu_pm.c            |  8 +-
 .../drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c  | 82 +++++++++++++++++--
 2 files changed, 80 insertions(+), 10 deletions(-)

-- 
2.43.0

