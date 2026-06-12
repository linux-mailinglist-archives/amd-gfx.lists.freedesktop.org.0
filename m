Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ROZoMQrjK2pPHAQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jun 2026 12:44:26 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 222F8678C42
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jun 2026 12:44:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=4uPAYw4H;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A580A10F429;
	Fri, 12 Jun 2026 10:44:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010000.outbound.protection.outlook.com [52.101.56.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE7810F41F
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2026 10:44:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wc1+eXUJgsvX2Sq9HNzfGhtbCeQc+XgUSQFEMtZe9b4b44T/C1L34rYUfSekdzkC2rUDg7D2rvAZcqW39SoATJYNuDKWmeOrRx2orp6Jeh+67JMrgILq1hFXskNgKJAPEfL3qLbmwzoaXh0fbjSx+DxYp4tLnsE/4MySP8FKt7jyojpG6tH25nF+RtwBmI56hBM2lDGhUHIghgv9Cana6sXJ9JaVOZnTxh4VtxVqy+UpgDGU5yahKSkR2b/2REerTUam1QCtlRr/GsGBB7Rja1oSTAgxNj57Z+MqP19TkBh3C3GBCtTCTRFJKt7tVM1vhDdahv5MIdGnwTPJdDoAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSwY0/xasxW3BQ0kViLc2n/THcz6F7ybp0S0BxE2Upo=;
 b=Iy5gZ/Uxy0HFyBG+bhCUPIhHucwZ6dQh2xGoeWxR/CVqj/I2qHedFnek+gaYM3Bz0mdcTe5WjjyzVwR0Zi3ZLTtKOzdrfzqt1USQuewM+yFuIfPafODRaVoJlo3mrNHImfnv0PP9BCYR0pPjBvmccYncs1q/d6dMHOsY3C0bERcR6LciiDJBNZK5D/n09OopdKzE1/qREQmAsROpfEn4mAGam1Sb934IjajQWDFnaPPNcwebYy6xUxFqtiOCOG8h7D0yduPHMeF9nmgVd1ftyrq8ZWE8MTK56rEI7KCHuVsDPO20JFfw1KO3W87fDPxd/asbzeMeq1n7dZa1mLraFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSwY0/xasxW3BQ0kViLc2n/THcz6F7ybp0S0BxE2Upo=;
 b=4uPAYw4H6pbycs38TJEF3Ubikp3dwZD3nyZUmtO++ni1CeT67VsofWN2gCjKX6rxztcaov3BkUCQm8eSwtcDfgezl8m0bZFhGbkBX70ZnIgE/ifWQtoyj6Dt+oMX0ZTkUEqouCWDuBoPvtj6+yPz2XKRfKzHpHhJp/Tsv0j0R8Q=
Received: from MW4P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::22)
 by IA0PR12MB7553.namprd12.prod.outlook.com (2603:10b6:208:43f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Fri, 12 Jun
 2026 10:44:19 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:303:8b:cafe::84) by MW4P221CA0017.outlook.office365.com
 (2603:10b6:303:8b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.15 via Frontend Transport; Fri,
 12 Jun 2026 10:44:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 10:44:17 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 12 Jun
 2026 05:44:16 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 12 Jun
 2026 05:44:16 -0500
Received: from rtg-MAPLE.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 12 Jun 2026 05:44:14 -0500
From: Priya Hosur <Priya.Hosur@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Lijo.Lazar@amd.com>,
 <Alexander.Deucher@amd.com>, <Christian.Koenig@amd.com>,
 <Mario.Limonciello@amd.com>, <Kenneth.Feng@amd.com>
CC: <Pratik.Vishwakarma@amd.com>, <Veerabadhran.Gopalakrishnan@amd.com>,
 <Priya.Hosur@amd.com>
Subject: [PATCH v4 0/4] drm/amd/pm: fix pp_dpm_* clock reporting on SMU
 v14.0.0/v14.0.1 APUs
Date: Fri, 12 Jun 2026 16:14:04 +0530
Message-ID: <20260612104408.9596-1-Priya.Hosur@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|IA0PR12MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d29a17a-7736-47b4-8052-08dec86f8d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: SWiEwjWKoq7iK60DRiBPVlU4h3OP6UrFMiOxVvK/bqleRc2t+5FbZJUAz2vv18Z4a3Xk//8h8PdbFTEYj/T5hAeguSOpBOIevvMxh0M7//FwiQwiRBbwj+xsLBA3Bwc9BDZidAEzX0PCmPnddUjw2KmHK4DkY2NHTg3izT3uEY5AB0lWgBVuV6s76oO+ILeBcGRQWj4Fas/MOJzWFMYOOP8crI3RyJRpxa0JDr/anayYK+ZwlUTGIqvwHvffTRb6JCAXnWsh600Ot/3yLXjI/LrOl4qjiDwI0ZOf+tlf7gg6PRnRZHstLVMTbG2AermhY+djXMioenUHLI2fHNoEZrqoh7sTIlztxfM0UTbgUBuf089BDuZpS2D0WW15deUtOa2Q7kqYkOJdhGk0uQmnsN9A4y/M4famhm9HEm5mM/3AnQr8f7WwDVZ94e4Tz7h09s/Z6eas/nT3eP7lc4HsPMd0TAbaduqRHsUK77YnLvIfqpZZDuo4LtJJQBmlZzMUhZ84V5cZYdfl1LBYTF13yjBkOm2XA1wpqWfGxnahBTIirlfNSthPwCYSmiJh7dz9xeJyniq1w1yUE3DoSbzsFoGRPmsirJfqRbnme3ZghNNMo0czezExy6Uc7a9iP2/iXFs1ZyzSBuON/HPhuR2ySR64dioy9MBM/ctPpsBWmNayJcWx8AvVP6X7XAQsIx/IANPQn9enKNRN7M0eZro3myo9idXpr5TSUqeaMIUlRGA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: b7Kn6yR6A+7ECvC7aMVdQZ7vb8KTglxiEMps/k6qRTUTK4qxXdWstBi7CNKwjIChzmEaXUevNMUq0nWt5QoFmS5uVbUnRemV3lWLw9txkA0swHEQhGmjM9XKznbczh82+BdE2jLhZj8E8pq/kxPoaaqqaY/Ou+3awL/FlV1ebZZfGdSfRoad+bZlVWo52JTdgj4A0Tdn5KjZOMEjm4Z8dWCpg+rYJmOiqw/Q3YsURltpk1vlvRSoYTO1ooqNMylkvy9CFWDbH0SkH+UIEFVqUrLgTR0XJupNWbXx2sTCW5+SkrMvIoMVEdtcvSmR3fn2Ibbl4XiNxbHXXCWNrKsaQPxLtcwSTjkkmbVfswqF2Sk2YihSNgPAEo42tQUMBcL9W6dIKWaj64AqR4wEFC52eabaQyLfji9zZACWkNKGWJU+s9hYZ2mVb5hq3GjL+HSU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 10:44:17.4560 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d29a17a-7736-47b4-8052-08dec86f8d9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7553
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
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:mid,amd.com:from_mime,lists.freedesktop.org:from_smtp];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 222F8678C42

Fix several pp_dpm_* sysfs entries on SMU v14.0.0 and v14.0.1 APUs
(e.g. Radeon 8060S / GC 11.5.x) that either report incorrect values or
never show the active-level "*" marker.

v4:
- Patch 1: instead of falling through to VclkFrequency for DCLK,
  match VclkFrequency to its DPM level index and report the DCLK
  frequency at the same level, since DCLK and VCLK have different
  DPM frequency tables (Lijo)
- Patch 4: added Reviewed-by from Lijo

v3:
- Patch 1: expanded inline comment to note that DCLK and VCLK have
  separate DPM tables even though SmuMetrics_t only has VclkFrequency
  (Lijo)
- Patch 4: dropped redundant exact_match bool; always use closest_idx
  to mark the active level (Lijo)

v2:
- Patch 1: dropped VCLK1/DCLK1 metric handlers (UINT_MAX -> N/A is
  correct; VCN1 only present on v14.0.1) (Lijo, Mario)
- Patch 4: break on exact match; early exit when DPM table is sorted
  and diff starts increasing (Lijo)

Priya Hosur (4):
  drm/amd/pm: smu_v14_0_0: fix DCLK metric reporting via VCLK level
    index
  drm/amd/pm: add IP_VERSION(11,5,1) to vclk/dclk DPM sysfs whitelists
  drm/amd/pm: smu_v14_0_0: add SMU_DCEFCLK support in DPM frequency
    queries
  drm/amd/pm: smu_v14_0_0: add closest-match fallback for DPM level
    marking

 drivers/gpu/drm/amd/pm/amdgpu_pm.c            |  8 +-
 .../drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c  | 97 ++++++++++++++++++-
 2 files changed, 98 insertions(+), 7 deletions(-)

-- 
2.43.0

