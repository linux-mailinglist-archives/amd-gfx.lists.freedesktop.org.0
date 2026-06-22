Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OU5FDngAOWrmlAcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 11:29:28 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9050E6AE36E
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 11:29:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=wA8bGluE;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3195089091;
	Mon, 22 Jun 2026 09:29:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6DE89091
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 09:29:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZxBNgQgxBLQ54SGQEA3B2sQKoVFG5sHrKJ7Dll//uxu2mmVZJ63g9aeGuabUBzpMDkLAdx4eVxfgFQO9lSmWkE2kmWPJqaF7D4Vb082WFP8cqiA4qz358i6bye2m907DO/r1HU1pehlgDeWIh4/n2QWqh8vXDLhJCpUtir4lznBSS7ZxWwtMS0zk+YwAZhJgkGHVCsGmnrKmN/Dfn+f4mhUD+RnGG61rdPHNdfrg1OzFYAljy/LkQ+Te7pLzzC4/HYWqqbwV0RGLElhqu4AJpTRlHHmI+u/jkaXxwPP5MGh4RerCH4v4mRyEK7qwPDgVIo8kY5gr3rmOy+IECaqdwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLGjF2idEGMzFJpBFHRP+bKN9Z1rUX4avudXVWw+Jao=;
 b=vMBODYDF32YHM9rMAF8a/PDkhYbYwAfZX7kBjhWh99pTvQ0b6TAYZd8NmpsHfihsGz4/8rWtytzbMl8p0MVZ+N9Hm5BxDlEgdkNrWTOGbq7hDsUnWJh3Za8G5qMXBhoyib+la0wUN5I0PakkmNUrok3HVi8XuXDlNwLWad+KKDgGmROtqCoOqAb3JSu75B5fOpLSUVhnVgNIb/wYdyWRVX9WgeaUPWwoW/AgX20YFcO3D33VHDerUP4mNIp9V/1igfzsX4b5L4P1LiRhTKoE2RfmgZYCVPg1QGrYZhcPAs79bzfe/kj6bAqF18neDnIefKLRMhnACYfcBxxiRkiszA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLGjF2idEGMzFJpBFHRP+bKN9Z1rUX4avudXVWw+Jao=;
 b=wA8bGluEzUlVAftGNk9JtMVh/lfwnMUfh8Zl0bwoueknqpPSoQ5Lb2356b7hDFuPetfYIU6TAMdVLRTXmWdY0NIp+5QGVFQpXJ/M1mzy0eab0Ql4YcGrHgGf/6cNMNGO+ZbBpb1Ev5ZZRzsmn/cGTKQxrIbTde2C278XOT6tRWg=
Received: from DM6PR08CA0054.namprd08.prod.outlook.com (2603:10b6:5:1e0::28)
 by DS4PR12MB9817.namprd12.prod.outlook.com (2603:10b6:8:2ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 09:29:20 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:5:1e0:cafe::11) by DM6PR08CA0054.outlook.office365.com
 (2603:10b6:5:1e0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 09:29:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 09:29:20 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Mon, 22 Jun 2026 04:29:17 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, Dan Carpenter <error27@gmail.com>, Roman Li
 <roman.li@amd.com>, Tom Chung <chiahsuan.chung@amd.com>
Subject: [PATCH] drm/amd/display: Check dc_link before applying DSC policy
Date: Mon, 22 Jun 2026 14:58:52 +0530
Message-ID: <20260622092852.3015134-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|DS4PR12MB9817:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c517c5-ab73-487d-1a2d-08ded040bd39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|56012099006|11063799006|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: sQ2TOMvM1w8h3F7cQJm9FCNFtBFuesQBY+2KDJzFABawtI9czk6UbvsjWaYaVYZm9Ld31kU7CMKTAOH50hSH0Bz6sMwzg+oNv2zfQ8MLLBrOXe1fPVPM02yk4zvL39gLb84m6b1/XxbvxvqsurvZIj3Oco6pl78/wQBBKhqQFBeQqCoA+k1V5EP3M5JGGe6aTSixaDqUOTp5N1yZxBvTc6rZwZX7uSmDu6KriVa3XDYyyXiydwmZ2VpSs+avrB3RZFEp6w/0mtv+kdjIQNSGK0GcnQyHPgddvmOHkIy/99rWaSirKmI4hxweMECabEks/eyjRvozsGzosf4L7DtTf4yI+TCKUC/mU+xFQmP94lPE7o3lGz2nWXoDtmJSJ186COJ3lzcKtBNrW9FII/90jcjo6acswPyfO3uSQu6XDBnM3dAIvRagQsk2+szXJSDPwVHf/kKzO8ZawD55N0/xMNiV/lj2wOwRh+IHlHnznTsePdPLvQWQDeteGPPN9Ddit3ENORANt57zgREeMAf5HnqTMMZiSIz+G0kqVDAPzpk7Odo2qq1tk063PWZirYdCW4joG2P1PXomWO1dKDK405AGuX92W549LHs0p7EFNpdnYV4uRgTTMnstY5dKJImb0+TX+ixiV0kQbCK/a7tVQrwYxEWSvhR8/KchsMvmU1pdFwbsnmN+PM2QeDro0OiuBFUh6UCCkPTVidzOpILNTw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(56012099006)(11063799006)(6133799003)(3023799007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: c4nCjC9eyHaTLrwrSZxg7+Nq91cRHamTYB/Q0R6vaWkfhhrxl1Os7sAhFucSrfsBcaXvvYhrySOZ/3SoVAJXAzGtn1WWHr0BQnQBl66tY/wgQGA//WE2VQlzaoxOvDu59Q/3KEqHOh8fVYLAEevSQHhRPBlDbA4Pnc2wHCFYIJYrRHxZgKLgABqB3psccljeP/b2RE0TxTn7gdNlW2FvIiMXp81QC5RNzcMfNtkq3WQA253lJ3sOJkstt/4Wh9fHGxeLSDFK0EXqFJG6LJujai7mSJrrS2Zvt1iUYK5/psOh3AIOFWJauj5k0HZVGbp6jQ5cSkQF3rA+jEyH/yWehXqKjxhq/H5cFkH0SlIFdWfwQ/gQUK2XRUN+hfQgjU8LtuOJbn2yuJ0Lzw3zXolzWokfRyoMeD5o+HkEM5froYmCTMpmLVhVik+nwRKHcica
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 09:29:20.3510 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c517c5-ab73-487d-1a2d-08ded040bd39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9817
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmail.com];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex.hung@amd.com,m:aurabindo.pillai@amd.com,m:srinivasan.shanmugam@amd.com,m:error27@gmail.com,m:roman.li@amd.com,m:chiahsuan.chung@amd.com,s:lists@lfdr.de];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9050E6AE36E

apply_dsc_policy_for_stream() decides whether Display Stream Compression
(DSC) should be enabled for a display stream based on display
capabilities, link bandwidth and user overrides.

Smatch reports that apply_dsc_policy_for_stream() dereferences
aconnector->dc_link before checking whether it is NULL.

Add an early NULL check for aconnector->dc_link before the first
dereference and remove the later redundant NULL check in the HDMI_FRL
path.

Fixes: 5903cc8da891 ("drm/amd/display: Extract connector and encoder code to amdgpu_dm_connector")
Reported-by: Dan Carpenter <error27@gmail.com>
Cc: Roman Li <roman.li@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Tom Chung <chiahsuan.chung@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index 6143cdcf2a32..64e5c551191f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@ -1210,6 +1210,9 @@ static void apply_dsc_policy_for_stream(struct amdgpu_dm_connector *aconnector,
 		drm_connector->display_info.max_dsc_bpp;
 	struct dc_dsc_config_options dsc_options = {0};
 
+	if (!aconnector->dc_link)
+		return;
+
 	dc_dsc_get_default_config_option(dc, &dsc_options);
 	dsc_options.max_target_bpp_limit_override_x16 = max_dsc_target_bpp_limit_override * 16;
 
@@ -1271,7 +1274,7 @@ static void apply_dsc_policy_for_stream(struct amdgpu_dm_connector *aconnector,
 							(dsc_caps->is_frl == 1) ? "HDMI FRL RX" : "DP-HDMI PCON");
 				}
 		}
-	} else if (aconnector->dc_link && sink->sink_signal == SIGNAL_TYPE_HDMI_FRL) {
+	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_FRL) {
 		frl_verified_link_cap = dc_link_get_frl_link_cap(stream->link);
 		timing_bw_in_kbps = dc_bandwidth_in_kbps_from_timing(&stream->timing, DC_LINK_ENCODING_HDMI_FRL);
 		link_bandwidth_kbps = dc_link_frl_bandwidth_kbps(stream->link, frl_verified_link_cap->frl_link_rate);
-- 
2.34.1

