Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9wGtJ/GeKmpLtwMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 13:41:37 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DD0671792
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 13:41:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=x8UtuLrt;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C5710EEA2;
	Thu, 11 Jun 2026 11:41:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011012.outbound.protection.outlook.com [52.101.62.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B1C10EE94
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 11:41:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGQ73gkqn2zSVO0ZgqbEBMpdTxB0jvBQU9rSmJWIcbTzeqZuJj/tBambwpn+lZDNHwfW/msh4vXTHHvqICujMoYQhYQkMBrl8gxA1bE5TUbGU/tzd/zripaHHemWIuHeJlCewUnTc7/jUDAPZ5cGiVHpnEKlMSVoD/TiMQGxv+QjgClcs/eCtbd7PRQvQFbRiMuHLlVMVZwvqaNT1ucr21gR/uabQ49AqmlfjQ2YJqkUYuM+JNj2bs1piWDmTfGH2qvQYv4j5dMrFjL0yziqEEkRMlRJ1Xb4MYky5AYX+bShOrmyfhkF4Ri7c5bK59Tn15KpxlULNbm5MkKWcZFkbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2WEBE3bTxpA4cVTQp5WtjrcfsgxMOxfJ95+hI52bUM=;
 b=PoE170Mu5LlH+3Fn/56N8b/oHocWXknQIbf8XZhiIDr/GdIJGG2zxuCEjpRjdtVbo8ZHUGm2QgxmO6GpdiUlfGjjGNuwq4vx5lvYWTQ19tw2Ry1+m/k4HaYkICs9PgAumNS+x3NGCgjG/CnQgwNoTjEk/DddzNuGiZOmpp6uiuQtsWKMhpe4RzFPNJ6E6AdvmTEXaF8mmqwQS+cjj5xzU3SK5+zqUICZx4Qx+dBQnIfBEq8qyhL3BkU2IXl+Bp0fKX9U1EwwT3lmUEChDKjXmlwimtoI6xO1TPkHThRLpgeW1y5G8wCyILxCom4pMA68WnviXj9Lu8Ro+xcrRjKzAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2WEBE3bTxpA4cVTQp5WtjrcfsgxMOxfJ95+hI52bUM=;
 b=x8UtuLrtDY+nBSRl73R1O3ShlT6MzoDJe46TEA349XfdjRAo7xTsgNpywvVhVFaHRZxhTx30zhIZomWz2Jik3tJmvI6DsRqkn+aJfqrnEDYvRDu4r2QKdY5mv9cY+0uB8KbHM2A2bBy94BCKICX5p1Jdeb0bUuBQtDtiXOXh6Ds=
Received: from PH8PR02CA0037.namprd02.prod.outlook.com (2603:10b6:510:2da::35)
 by IA1PR12MB7544.namprd12.prod.outlook.com (2603:10b6:208:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 11:41:27 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:510:2da:cafe::76) by PH8PR02CA0037.outlook.office365.com
 (2603:10b6:510:2da::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 11:41:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 11:41:26 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 06:41:17 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 06:36:33 -0500
Received: from rtg-MAPLE.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 11 Jun 2026 06:36:31 -0500
From: Priya Hosur <Priya.Hosur@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Lijo.Lazar@amd.com>,
 <Alexander.Deucher@amd.com>, <Christian.Koenig@amd.com>,
 <Mario.Limonciello@amd.com>, <Kenneth.Feng@amd.com>
CC: <Pratik.Vishwakarma@amd.com>, <Veerabadhran.Gopalakrishnan@amd.com>,
 <Priya.Hosur@amd.com>
Subject: [PATCH v3 0/4] drm/amd/pm: fix pp_dpm_* clock reporting on SMU
 v14.0.0/v14.0.1 APUs
Date: Thu, 11 Jun 2026 17:06:11 +0530
Message-ID: <20260611113628.3217-1-Priya.Hosur@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="yes"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|IA1PR12MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d9d82f-7e1d-4971-2828-08dec7ae5ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: Jqbh9ixliqnnICqkUCMu/V0zhZUbSEQzJgW4NdVd58jCY9uL2xLtNej02wX7G+IeHxBmTPwjPeyDspHeYhH7JWu1R0D7BlKjgQFp3idoIwgUhEbhJH8C9ypC78LDx+en/KME/cMEpVaa7vu8F4bi9iQGFJ1DZz8IuPF7XG7YQHtYfUAUmY/aBxB4uUZN+xy/Iqoy0QKJG20TxDSVrXDOCb9Q2ewcZIERyb3Pv315UhPzcsVsZJsuwrAVG8V8FgK+G9GoXvXkiX4Mq/N5dbGpDg7nB+ugPGhSDhkkOc/wv5TPuUYBmlRDie2+IRBDx51YMPPeCztyK7+ryrf5xMgKjSVybUonV1XfCJY7nYwJ5mXRExmPeo+2OIFDoCLnHf/vh51S4g+i5E9RlvomRuoPuVGir01BwkQCsRHUrVE8VerzMNqmpZ5T500s6zF3raDVusAZjLgZ1OkiSHWWNVadZXsaYkUjFzLdJ7tEsz/gTcRXd8xsH2EWVww9dZV2glCoBhAYNjd9JvI92IaQUd12ftEy1/Ame43JR3deq4teaygE2QU+hH+hAt1hR2GZH9UshaabgU6i8SFs2zntbkXuVX8dfNJrmorqwYn8O/09yy17woX0SHElTy0SGigJaG37XePXWsiO22M0qNzfE+SkFpand5BMLu3krBQIArlBZBdVakZCJgemXG7+ZRK/2t6NRHFXpVcsFy0NiAqjW/WC+95jEqzgSvnJwnw4emn4pcA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YY2XjQFJ1oTFGEnvdiH4kGycJzua8VlJ2yWgW6fe5vy4N3g7XMbWl3K0sl9G07fWsUjTqRiJryp2hxiJK9VqfovWohbqPBUkqGs8bCz1SAs9g7CEjY2U96a1y9I+LXoRF33oPT/tvDEczEkaKTxPGGBAm2uhaVH+UZlJLZYenvP7F88Yrw+LNHolB4x8QnMScSLQWJFrAG3kyLF0dAtpgM0RiKMqi6oXTbcpvo7X58AXTys1I8DnuG9OUlV58cvWTa5lHocBJkIVLKFuVqU/8+UnzKAV09FihR0y1B7LS4/hC20PLwF2D4LUovsA3BmEN366/bHQ/dQqcnKhmiTMv15zKEagCNpkUeZOZbYhh+6uv4UomEOzkRoBFPNcTbWT1IJ7HJHEEX0bRJ3BABUuxk1zp6eyKaQbmm1LC5+eFftoBoeliRcHv57azjZxnYy4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 11:41:26.0629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d9d82f-7e1d-4971-2828-08dec7ae5ec3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7544
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Priya.Hosur@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49DD0671792

Fix several pp_dpm_* sysfs entries on SMU v14.0.0 and v14.0.1 APUs
(e.g. Radeon 8060S / GC 11.5.x) that either report incorrect values or
never show the active-level "*" marker.

v3:
- Patch 1: expanded inline comment to note that DCLK and VCLK have
  separate DPM tables even though SmuMetrics_t only has VclkFrequency
  (Lijo)
- Patch 4: dropped redundant exact_match bool; always use closest_idx
  to mark the active level (Lijo)

v2:
- Patch 1: dropped VCLK1/DCLK1 metric handlers (UINT_MAX → N/A is
  correct; VCN1 only present on v14.0.1) (Lijo, Mario)
- Patch 4: break on exact match; early exit when DPM table is sorted
  and diff starts increasing (Lijo)

Priya Hosur (4):
  drm/amd/pm: smu_v14_0_0: add DCLK metric handler via VCLK fall-through
  drm/amd/pm: add IP_VERSION(11,5,1) to vclk/dclk DPM sysfs whitelists
  drm/amd/pm: smu_v14_0_0: add SMU_DCEFCLK support in DPM frequency
    queries
  drm/amd/pm: smu_v14_0_0: add closest-match fallback for DPM level
    marking

 drivers/gpu/drm/amd/pm/amdgpu_pm.c            |  8 +-
 .../drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c  | 79 +++++++++++++++++--
 2 files changed, 77 insertions(+), 10 deletions(-)

-- 
2.43.0

