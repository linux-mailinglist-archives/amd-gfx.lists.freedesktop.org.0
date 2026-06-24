Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JzB0F+Z8O2qQYggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 08:44:54 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0814F6BBDB6
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 08:44:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=OaZdc36d;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9853410ED93;
	Wed, 24 Jun 2026 06:44:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011000.outbound.protection.outlook.com
 [40.93.194.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE52810ED34
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 06:44:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vh7yt7N6NZtmU5gkY7XQoOVpQOVbwRNZKoPw0Oi1V1/63/F7ZdG0HqN4J5LzyywfOt33xlVUudD/LnBxjOTCRepBO65gOdcCj8qNogy4eOiGMleOoqaqc6tGzngddeIyQikTTEWsPQRMOKhUDzaHUYRDaPyvYm2WeuHe1TXmvzqJE573d8+HO6ULRwDV2TsTsEMj7lrcZBUHfHksHIX9S7O85tV8guBU8uGe61zNuH/dBOsMIhDnOPigY1KRuTrWMVFI3Hnb/Eer8AV3EqT1//9Y6A3XonijhcyNQ3tHMqc1FdyQBsl4exH+w/Su0i5Fjtz/qmv4d1WknCAo4lMD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giFPH/JNv4B5JWilZDm0++K/C1BxSwtYScfAc6IqF/U=;
 b=esSKEwGw19FTB4LlROPQfrDlFTQ6dhBDTJ38lF2CqVqEpNXUyXvdrO4KzBGYoQqroNn8dZD+sWKD3+TOCNhP+HIrxJiKGg2WjAoXJSKS6RhbzH9gAmPjJpDCq2mD7XpyX9pEK83BJfEyn6Oe/5gV9zZyQAObh3oJWVi/AG5U6nGIED8ZWrRS9dgncWBOAHkbpCbGyaY1JvE02S3RZzMgQ8Rwfo8tz6T3INSKArSvRJ2J42zfw3SCvHBpWNqoAGZHSTXkpH5jpqgENwl3Y0WsZqBumJJ14PAkc5pSHUlPSDFwB2eFDlrR5LiQB13MVxFSk0t41izfHGW288NILcv4gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giFPH/JNv4B5JWilZDm0++K/C1BxSwtYScfAc6IqF/U=;
 b=OaZdc36drwdPeJnQab5Hqhj9YOtgrTRh9ChrvaqWVi2quZhk80WpW1gfPlDOlKU5I7wgirhOFxd3dLo3klUyYbrNTaJAb/udRVDAnimRJzS9jOSzsQrwNyFE8n4SqamNuXAhI/pghFsAYLk6GYdzidS+mc0yXBgAA0NeBfWtk0o=
Received: from SJ0PR05CA0128.namprd05.prod.outlook.com (2603:10b6:a03:33d::13)
 by MW6PR12MB8706.namprd12.prod.outlook.com (2603:10b6:303:249::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Wed, 24 Jun
 2026 06:44:46 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::aa) by SJ0PR05CA0128.outlook.office365.com
 (2603:10b6:a03:33d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Wed,
 24 Jun 2026 06:44:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 06:44:45 +0000
Received: from asad-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 01:44:42 -0500
From: Asad Kamal <asad.kamal@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <lijo.lazar@amd.com>, <hawking.zhang@amd.com>, <le.ma@amd.com>,
 <shiwu.zhang@amd.com>, <alexander.deucher@amd.com>, <kevinyang.wang@amd.com>, 
 <asad.kamal@amd.com>
Subject: [PATCH 4/5] drm/amdgpu/pm/powerplay: bounds-check voltage index in
 SMU7 lookup
Date: Wed, 24 Jun 2026 14:44:13 +0800
Message-ID: <20260624064414.144468-4-asad.kamal@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|MW6PR12MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cec9036-fde3-4e7b-dad0-08ded1bc1472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mYYulU38w7ciw/fUDLxPm7seKE5YMYST/u7hdtenZIvsg9cO/Jz8SD340V4c6KNF65rM86iMH8QYL0H3TpCWWH66IZsDOQa2fno5NLhmM5QkjF5RCYFBKDEoo9HdFrrkUBFCU64a+TWek6JunCb7GNd0tHPGyN5P62mHHJuaT95rZE5xQ+uo+F94X2UTSAgwXiygYF4oAL7PQjO3lzK5XXUGufxT6BwcvGM3vEnhj2+QwfLq5GufOy1opA6qZF1MynKL5IpleAcU3mOt60cT5uSsbMKZcoOuRKCTS6FdR6FofUcNNWbEO96ZD//RW6eiWf3FkcW8nHKHZb/9jDnYcrfiDvGDyenPmq1W607VuS46bMVCpYTfxK1MAJukKgDbucsgMU+DT3QFCxtHQZ1cwYu/Ezq05McSb4bujD5xP0ZQVZ/roeAuQC5UsfSULqp8eNSMwD1HXZ8ra7OyDDj0YElBHW2AEUtDXpA9qRqnTYq1v2FZ/l1fWdYbCAMKlfw1h4vGgRKgJgIScxaMlvHZjOQmKKxauGT2f2lpE2Bi279dcjrroMXw9hRHeNCq5RG+/+1cMAk6pwPv3ml9qX0vSZ9DzrSZPDzwmbWBeDUY91ol4lvn5F1MJiyozRJohaFGVRQcAdDKz2B7Fk/r13w0YPWVWCsiGPr5F93qLYA8V+/8pO5WfOga2Cs9mq6auqsfb1c1Zo4QA/FxFoJt1f8RPA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +74+khnbmZq5uTB53te1M4Q+UQMzZNfGlhlHLu82CW5hoZErSfC9XXcAllOpsTD4HrsLHkKLg5ImUaiNM/lmJ4Eh3wT4OhzKWvECooUFsRT1iowJkQGRm2y1zz0YDFlqXOL9sGkBPNPh9xHVo9gqFAN9v8duYH9Ado3u58hw3ecXSZEoAWcK0YxJAKVPuYuV8iJmDoSHQAxoLiaLbKrrmbc76PsCh/Zp/LByMyzoxX8U86DocE2H/Oid81+TReMKdkj3OSCzbQZ73w/K0Sqe8mBxgaBvGHdJ7UnnxdfIZLiCQE+LPi8M8Qi25HuV0V/BDNRT4l2UlELSFOEhI4ZAELnqeX63ePKYGzz5/QH4gO0Ybs9RI0ZiKXJlhUshnyUhCfOddRk68IPgqNV+nnED0t8XN1sml8kBJWwh8Aa1eMO98QiND1WOiwMHIR73WrlE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 06:44:45.8972 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cec9036-fde3-4e7b-dad0-08ded1bc1472
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8706
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
X-Rspamd-Queue-Id: 0814F6BBDB6

vddInd and vddcInd fields from VBIOS-parsed tables are used to index into
voltage lookup tables without a bounds check. Return -EINVAL when any
index is out of range.

Fixes: c82baa281843 ("drm/amd/powerplay: add Tonga dpm support (v3)")

Signed-off-by: Asad Kamal <asad.kamal@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
---
 .../drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
index aac6a0fa5d7b..be824e3d276b 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
@@ -2216,12 +2216,24 @@ static int smu7_patch_voltage_dependency_tables_with_lookup_table(
 	if (data->vdd_gfx_control == SMU7_VOLTAGE_CONTROL_BY_SVID2) {
 		for (entry_id = 0; entry_id < sclk_table->count; ++entry_id) {
 			voltage_id = sclk_table->entries[entry_id].vddInd;
+			if (voltage_id >= table_info->vddgfx_lookup_table->count) {
+				pr_err("amdgpu: sclk[%u] vddgfx index %u out of bounds (%u)\n",
+				       entry_id, voltage_id,
+				       table_info->vddgfx_lookup_table->count);
+				return -EINVAL;
+			}
 			sclk_table->entries[entry_id].vddgfx =
 				table_info->vddgfx_lookup_table->entries[voltage_id].us_vdd;
 		}
 	} else {
 		for (entry_id = 0; entry_id < sclk_table->count; ++entry_id) {
 			voltage_id = sclk_table->entries[entry_id].vddInd;
+			if (voltage_id >= table_info->vddc_lookup_table->count) {
+				pr_err("amdgpu: sclk[%u] vddc index %u out of bounds (%u)\n",
+				       entry_id, voltage_id,
+				       table_info->vddc_lookup_table->count);
+				return -EINVAL;
+			}
 			sclk_table->entries[entry_id].vddc =
 				table_info->vddc_lookup_table->entries[voltage_id].us_vdd;
 		}
@@ -2229,12 +2241,24 @@ static int smu7_patch_voltage_dependency_tables_with_lookup_table(
 
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
 	}
 
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
-- 
2.46.0

