Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NVyDFHEdPGpykAgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 20:09:53 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF94F6C0A91
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 20:09:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=yb66Srt6;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6703010F0A8;
	Wed, 24 Jun 2026 18:09:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013071.outbound.protection.outlook.com
 [40.93.201.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF3410F096
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 18:09:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qc0dhXphWB/zcUL7qN/ohgvGGAN6RvIs1S2jvtwoQG2tafEm/TymZwAT/yOq1IrUubNh44UI2QN0qY0OtrfQM2ShWLIRj3ed5/rbnNR43N5rKDkv6/96fZ+3uoT9aUeHtqAw2EYG+yl1+cGtqZcToug2K2lA2ZQgopMuqe5y1U5X9hs6X2soedwLGopXx4zuR+VVbO8ICmmCXOulDu1gAMWXPdvBDXlyFzGJQEVC2919jtrGurcZwwPYcbSLsgKtQNe9/kNq+vZfzaXLF8q7gs40ZDfaOZI3pOTY9es0umiIaDIfoktPwezZQDmrwJExUeEff+krwAW3fYs7U90B/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zQ60OUgysFARDJ9IFBnpl2Ar1daGyuwxMriUF5YlTo=;
 b=O77zl2dIsPJ21qL5DF+dAO3LFzHSFBrAntuc7elcvs1u1IzCncShJ7T3HMZdNHsWxdpLqslRR23YUg9KQNsVCHKTFNZRK0fk1FZI/EJM+EoJcr51YRv8Mu4tyH0/k0hU+bihCPcxMWYf9QCDUDDVDGOmJB93tYiXCBqL7oZZAFBSzZsQhNet7VcqsLDCN4D9KZeStXz/cX08UoPKHfHzeBSnozLGbP6xdoESOMC9CvB/XxnxJWktCfTUxgoUuPiBCdbdJQHHIgmSF/iamDp7h8NUS7dz/WezdNcdmDNA/EdEcJWPQwa/PTje/Ldwz1XOuNjs8pCFMvFEtbt8kJg0Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zQ60OUgysFARDJ9IFBnpl2Ar1daGyuwxMriUF5YlTo=;
 b=yb66Srt60DO6IuK+J/xPzCxmUvMhxGkY+fwAugZDPIzRDUe25+GA4oARvBRSun/XCHOvUd9CgROpFtlP/A/gady8kWWWINRo0iXs9CbvKZ0ThQVTBH6aiPvuq+5v8JRwSUSyg9fQgixHsvk6MAH4egXtXWR+53mqXYHa+OJ5QIw=
Received: from SJ0PR03CA0012.namprd03.prod.outlook.com (2603:10b6:a03:33a::17)
 by IA0PR12MB8351.namprd12.prod.outlook.com (2603:10b6:208:40e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Wed, 24 Jun
 2026 18:09:46 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::d) by SJ0PR03CA0012.outlook.office365.com
 (2603:10b6:a03:33a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Wed,
 24 Jun 2026 18:09:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 18:09:46 +0000
Received: from MKMGEORZHAN02.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 13:09:40 -0500
From: George Zhang <george.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, James Lin <PingLei.Lin@amd.com>, Chenyu Chen
 <Chen-Yu.Chen@amd.com>, Leo Chen <leo.chen@amd.com>, Charlene Liu
 <charlene.liu@amd.com>, George Zhang <george.zhang@amd.com>
Subject: [PATCH 26/28] drm/amd/display: revert "Enable HUBP/DPP power gate for
 DCN42"
Date: Wed, 24 Jun 2026 14:03:24 -0400
Message-ID: <20260624180829.4775-27-george.zhang@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624180829.4775-1-george.zhang@amd.com>
References: <20260624180829.4775-1-george.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|IA0PR12MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: c416c65b-ba9e-42d8-dfd5-08ded21bc64c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: nzab1LIcfTMrNIKpg23amtf2elCqtQPKMsFc3gxXvdr6kdxb8zrz0wSz/IVLqPCAh08ODbj4C54vevl/VeS4uiDyQxiuwdaqf3qYUM5X+/y01Emt4WLw/K9VXJE46KfL1dWoS9EG1zFijrUb8Uk5Pkd/VKtrWaYUzDPwNP2/cIofq+kGc3xhIyBFeCeA9QKgAX1xIAACGfKrag+u9TGGhN/iEjtjF+xCR5YN1aZVCxWTItG3Sfj4Pai+E+ezYnmoI7+6+/oKDeJ2ywgwQ0tEftweOOkl3v3410QnWrvVlcB50T+xpXyq94WrLMKMSHvz5Rg+bSQMllBbaoH3tm3UgLTla18mybbZ6p2cig+ttfZxlDuMrcaCxHjYWsTltfpBN408NsJ2cuO8hil0bQkEZ4mWcBalLM8HsiLCApP2MSqRZ5zIHZ9YDZWymnEWqtV8Aew4zVLxxz0ktyUj9iUsYKGJYRXeLpEPBmlSLvVr6/cf3HjAxo9x94CroDS875OQrOTde9rWRFbk88UiHdiuSC666PpXyDwpVHmpHtfyL7KZsPCdbHUE8a6Bs9BgH+S/UeW3Fivzx0WE7nDZ/9X2NKPAVYZeYOJzXHaIbw453DQXmm2lyO43rOfLH7NDfqPG992OXTNBWx57hnyywjhTAZNAlJJKcjZtofTVIxlty69QsTk9UN0iKW9i3Qlgabhh/2qnib2pPaHmi2cB/rbvKw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qfbAsYS8TgE6onpnbWN1wSMCaXIv5a8Dzvu4PPYPtjizzDKucirNZ26eFgS/PV3SG86B012Sfygc+lmQm4YrpPI/PYNYaly8G92yplH87Ou2OshJrGrz4NzB3Qn5QMsJFcTWpYAFFmdEYv33H8OSWWhcPAxR2HmSACtMR5may703lDM72eU+yRCHOMlMMflpnVQjmYN/mLH0bjFt5VInFg4i7JwV5+k6AWowNWNIcAJlzEWCv3KTE2/RTHSNjci6UtIMO5E3rC47JbokV71ehMus5IidGbG25HEEzpwY+vDAtVGMbf/LCPZi1RvqDIvgUf+r7ykp4TR28yHn4Hf5r9jB3SiuFI3PBEgwklyxbxwwHXb5ryLazEQGcGWwS7YpSXjdufiakB9Z3I44mnWbHWHYbbuLI/z03sNhbPuWNPhaJdBsTrZGZlwZEFsLMaNj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 18:09:46.5317 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c416c65b-ba9e-42d8-dfd5-08ded21bc64c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CD.namprd05.prod.outlook.com
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[george.zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF94F6C0A91

From: Leo Chen <leo.chen@amd.com>

[why]
Disabling HUBP/DPP Driver PG as it's causing corruption issues.
This reverts commit a07a9b8295758e5c2b14684bb90738ac20e77406.

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Signed-off-by: Leo Chen <leo.chen@amd.com>
Signed-off-by: George Zhang <george.zhang@amd.com>
---
 .../gpu/drm/amd/display/dc/resource/dcn42/dcn42_resource.c    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn42/dcn42_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn42/dcn42_resource.c
index c999db12d0a5..7620da96ffc1 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn42/dcn42_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn42/dcn42_resource.c
@@ -729,8 +729,8 @@ static const struct dc_debug_options debug_defaults_drv = {
 	.clock_trace = true,
 	.disable_pplib_clock_request = false,
 	.ignore_pg = false,
-	.disable_dpp_power_gate = false,
-	.disable_hubp_power_gate = false,
+	.disable_dpp_power_gate = true,
+	.disable_hubp_power_gate = true,
 	.disable_optc_power_gate = true,
 	.disable_dsc_power_gate = false,
 	.disable_dio_power_gate = true,
-- 
2.53.0

