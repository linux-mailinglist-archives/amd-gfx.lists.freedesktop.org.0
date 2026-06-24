Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SilXDet8O2qXYggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 08:44:59 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF11D6BBDC2
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 08:44:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=EZcvITam;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4567610ED98;
	Wed, 24 Jun 2026 06:44:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010003.outbound.protection.outlook.com [52.101.56.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9F810ED98
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 06:44:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrGrs/WFCW81QeogajsGA+qyB9+OlzwPoAJ8fik9tRjFIvjTATnWwfk+sdqkBtmXot6e9HfnF80UrMvhvXKbJ7/ELTRK2jLD51M9eAuzpT+3bag/w+HmShwwx90PKK+sT7m970huitmuG5xNxIvxrGR0pS5y1xL4FzG3Iix9y95NMyFrAlJEO7fc6vV6pUUV9IjYpXBYVEIOiuQbEVHIdGHeyPz18q+W6JgKhUxnQ/Tqxf8BVybhpfkvO/yGqNV8MWVZOMI57bIpxfzgHcyqr/bjsqtyHq82qvzK8SpzIaRB4T4hQrech/MRF1OLLl4nAZzd8TFaSEw5yXYtIIADsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1LZ1qxy9pZoXgOsBZOrDCSqhXYHFefM4rXY5ajS/yA=;
 b=kGrV/2xPgqw1PT53FxRNKQfJqST2MBbujPVr8Cm90T3TuakkcxtLZxtcmfr+7/6E7GfjYmgqItsFBKemXFjhhgMZj2Pn6huqqo6f+n2J50KIYxZyDGN2x33/5pML31+V9WUYmWJZSb2Qut0aB5QOPffFAE4hx0kF10pTFXD4MlHIh2mgJkMngKsZnTJSGReQssGTlkkKw1XyjF0+nSXWXHjo9TG6dZWFGynZfBerVkrfHo+EwWZXaNz9JTR+9j5zBl352xUyEVDxjITrEg8SQxxX/HGZq6bnEQPVyC97tHNVkP7l8ooN645WE+YcI33ZMENpPkNxkY7TsGdHBbnSfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1LZ1qxy9pZoXgOsBZOrDCSqhXYHFefM4rXY5ajS/yA=;
 b=EZcvITam/WhgpDOMZlkWAVNlPdfA+ghuQuLJ6JOxUVKq/iVWhaViQ+Uctr6xpI13hX3fgnTsMVbLg8WH8ahrbkV5flD3CLhvY1nuT+Xgo2Mr6BG3u73Xbdnm4fJtHqs16CXbG+LhutSKbSYfdlJwgstVE37+yIJcPb93SU9Dkcw=
Received: from SJ2P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::6)
 by SJ2PR12MB8136.namprd12.prod.outlook.com (2603:10b6:a03:4f8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 06:44:48 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:5da:cafe::a3) by SJ2P220CA0003.outlook.office365.com
 (2603:10b6:a03:5da::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 06:44:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 06:44:47 +0000
Received: from asad-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 01:44:45 -0500
From: Asad Kamal <asad.kamal@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <lijo.lazar@amd.com>, <hawking.zhang@amd.com>, <le.ma@amd.com>,
 <shiwu.zhang@amd.com>, <alexander.deucher@amd.com>, <kevinyang.wang@amd.com>, 
 <asad.kamal@amd.com>
Subject: [PATCH 5/5] drm/amdgpu/pm/powerplay: bounds-check voltage index in
 Vega10 lookup
Date: Wed, 24 Jun 2026 14:44:14 +0800
Message-ID: <20260624064414.144468-5-asad.kamal@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260624064414.144468-1-asad.kamal@amd.com>
References: <20260624064414.144468-1-asad.kamal@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SJ2PR12MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: b4bfa0d5-8c0e-484d-c4c3-08ded1bc15a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: F//Cyf/RvartERmfZzWwWd6SjDPtQZtr6RmYUeGvg1fFWegCZnHMHbLyGl3VR1LPMlgBEY/ufewIQVGb5jeUiPm6NdKpPoFc2yPQMPzhveIw3aJRx8IpgKivv+xGaMqwvtPyutJIGh4TsHzMremiz2iJzeifr/4djrNkp7h3odnNA7jM3VZ0ij6GVyzZhmXAbSKMWnnrrAzQ/eDrwRV3iaPYGvdme8FHsbJ3usezvdMITy/iYl8cpnB4hnMCubC9Enkpb33P2fIkKAGq8QZ8v250ajr+mhCdkCuZ1nwQV98UmBj8eIZ8QQPSiiWzwL13dGg/5mfFy9TzPxawSNyqaAF6UhXUQexCglU/7fedXdZG8wj3ndWSTNkAxLJn4WkM8PA5LIIZWQxZa3lR0rcPvU47NueofnulPxNOca8FivoTp0ZnIFIABicAZEUc8oXsIcNqd4riwuBubHRuLQISj4YfTkeBRK3rIOVY2vYI5OOiqI/qs3QdEhmoDz5wy9i/E/jisW9gNsQaGpBnhqYvGb/yAhXyl799H2CDS8qqtorzAOMm7uGER0iA6kthPgFyGjMMm0DA8mfFTn3wxGhXptk3RqLhmcXWsnC9qVemzUNayoTChczH+mrUMjyAXFNHgFIe4esSnhSftTzq+3OIwIXu8b4W3Riu/OEjmtMI5fprg6gXIfpqpDbTjyEIGYpFGaiwaXp/QV/De9s5qCQezg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5TfBLlyoR8A38d/eZ44iEjIu86MsG85dqci347U/PWwn61KQH/mhZDR0Pawc7mjYcKRsRdqWl/YNv1L9RZuM9UTsM+IvuRDSQ6ubX05nEhlJ5pqkGir9X07mJJVzRzEI1Wf3Mn0tdotFGodEqyV6BprpjFYNCqFdcJ7s4SZHfvTH626oxyaPem3GlA+XFEcGmKsCHNIqsdXv+gKyjS6AT0cSeRLc1JAsZRgrolmamkj5jQWhI740nSIrzahfwhZ3CW9yiIpRX/32Mk5U+Gr2KUmD/S+0uOCqOMUpegtbCPg9gBRoZY3yhalPknE8T4yH2fv27l06blxs4gcwtXCBqybWU8RJxrjRU0fLsqx/+3pVlXGKrVyGVGNp3q+GqNc8BptAO85IJUQYaUFdy+YlVA+5fOsVS64sCrPtLfNUHgLlWziy/UDh/eFL/sAujvs3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 06:44:47.8832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bfa0d5-8c0e-484d-c4c3-08ded1bc15a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8136
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
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asad.kamal@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF11D6BBDC2

vddInd, vddciInd and mvddInd from VBIOS-parsed tables index into vddc,
vddci and vddmem lookup tables without bounds checks across nine sites.
Return -EINVAL when any index is out of range.

Fixes: f83a9991648b ("drm/amd/powerplay: add Vega10 powerplay support (v5)")

Signed-off-by: Asad Kamal <asad.kamal@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
---
 .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index 649cfad7d36c..0ab5792298ea 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -685,10 +685,18 @@ static int vega10_patch_voltage_dependency_tables_with_lookup_table(
 			case 3: vdt = table_info->vdd_dep_on_pixclk; break;
 			case 4: vdt = table_info->vdd_dep_on_dispclk; break;
 			case 5: vdt = table_info->vdd_dep_on_phyclk; break;
+			default:
+				continue;
 		}
 
 		for (entry_id = 0; entry_id < vdt->count; entry_id++) {
 			voltage_id = vdt->entries[entry_id].vddInd;
+			if (voltage_id >= table_info->vddc_lookup_table->count) {
+				pr_err("amdgpu: clk_dep[%u][%u] vddc index %u out of bounds (%u)\n",
+				       i, entry_id, voltage_id,
+				       table_info->vddc_lookup_table->count);
+				return -EINVAL;
+			}
 			vdt->entries[entry_id].vddc =
 					table_info->vddc_lookup_table->entries[voltage_id].us_vdd;
 		}
@@ -696,23 +704,48 @@ static int vega10_patch_voltage_dependency_tables_with_lookup_table(
 
 	for (entry_id = 0; entry_id < mm_table->count; ++entry_id) {
 		voltage_id = mm_table->entries[entry_id].vddcInd;
+		if (voltage_id >= table_info->vddc_lookup_table->count) {
+			pr_err("amdgpu: mm[%u] vddc index %u out of bounds (%u)\n",
+			       entry_id, voltage_id,
+			       table_info->vddc_lookup_table->count);
+			return -EINVAL;
+		}
 		mm_table->entries[entry_id].vddc =
 			table_info->vddc_lookup_table->entries[voltage_id].us_vdd;
 	}
 
 	for (entry_id = 0; entry_id < mclk_table->count; ++entry_id) {
 		voltage_id = mclk_table->entries[entry_id].vddInd;
+		if (voltage_id >= table_info->vddc_lookup_table->count) {
+			pr_err("amdgpu: mclk[%u] vddc index %u out of bounds (%u)\n",
+			       entry_id, voltage_id,
+			       table_info->vddc_lookup_table->count);
+			return -EINVAL;
+		}
 		mclk_table->entries[entry_id].vddc =
 				table_info->vddc_lookup_table->entries[voltage_id].us_vdd;
+
 		voltage_id = mclk_table->entries[entry_id].vddciInd;
+		if (voltage_id >= table_info->vddci_lookup_table->count) {
+			pr_err("amdgpu: mclk[%u] vddci index %u out of bounds (%u)\n",
+			       entry_id, voltage_id,
+			       table_info->vddci_lookup_table->count);
+			return -EINVAL;
+		}
 		mclk_table->entries[entry_id].vddci =
 				table_info->vddci_lookup_table->entries[voltage_id].us_vdd;
+
 		voltage_id = mclk_table->entries[entry_id].mvddInd;
+		if (voltage_id >= table_info->vddmem_lookup_table->count) {
+			pr_err("amdgpu: mclk[%u] vddmem index %u out of bounds (%u)\n",
+			       entry_id, voltage_id,
+			       table_info->vddmem_lookup_table->count);
+			return -EINVAL;
+		}
 		mclk_table->entries[entry_id].mvdd =
 				table_info->vddmem_lookup_table->entries[voltage_id].us_vdd;
 	}
 
-
 	return 0;
 
 }
-- 
2.46.0

