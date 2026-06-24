Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XzNuA+N8O2qPYggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 08:44:51 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2DD6BBDB1
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 08:44:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=GNHql9aE;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E73D10ED7F;
	Wed, 24 Jun 2026 06:44:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B6F10ED34
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 06:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoNcOradCEoYlqJd9pFGVP1g396j+JAXVIWhobCtKBBcwDlnG8UII5sokCvcrZH+LIReQ06ZHZGHC0DoPKWGh05pLF1udfrsdiUsO4bymgRQbTEleIigVMoFyu61Q8udsp2ZhXK3UF8Q2EUg6PlSuAGnxc/HXqhN9yY1LjRzd+EUFAEDKTQSX4p3NjjIjTrNagDFnEa1rgb+h0v80Wyh+tdv0jzQITF4jRhc+O+jaJCg4J5aQ+xuwT0vszsywpRtipCC21cGpd3CUJX4ZmGiKsk+zr7jTNlPFFzYlkdDB0rxuDjahE2T7KvIkPKXwZD7FihmJvAT5A/sGOfBI6vlQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xf7zjRD2vrRzZjF2ib9wqLb/NnYqHgdyYjFxGYWpFEg=;
 b=EXY6ACJCrsd0QcDOBP4pFB1ZQxOYat9IxbrS1X2jnIrHA8L/K2wYOyiCmwuyhaqYIBgwtVcPMjFZT79A7SACZLSMXPaZwgdhE0AYebr8Lvuucm9rz4kJCRVO9QsxxjnZVEvOPt6I75XOphVAK/IUPKGxw/eHBGEQlAPnS2aBH5zzkeqS9zcICTyQW22odWNE3WdQbLvDuUDiBpAdsbVrESc6wmLQmK8Lgf0Ep63nST93Y531ebbcLHtxtwW2EdF/GbaaDMqkZ2mo6AmINNxjUnBGZ+2SK97L0lb/PcRyugfUEQjLEQ0fHZhF6Wkc+N++z2hhjMGeN2v+65a6SD1jWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xf7zjRD2vrRzZjF2ib9wqLb/NnYqHgdyYjFxGYWpFEg=;
 b=GNHql9aExHcoZ8YaU5kgqeGFtW4YuHtVTEFZdh50WqIiQV64mfUtRKOqp7APm5crdHDuuRcO8uK20IcjG2SU2U3wkKAJGKmgWa6YXtR1cEN6MiAYGA45Lue2UByApAYGRC6FUUMfDnpn9+hZXBHZHwEDUZfWFFIBxs9MDKnx2iQ=
Received: from SJ0PR05CA0002.namprd05.prod.outlook.com (2603:10b6:a03:33b::7)
 by PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Wed, 24 Jun
 2026 06:44:38 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:33b:cafe::a2) by SJ0PR05CA0002.outlook.office365.com
 (2603:10b6:a03:33b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 06:44:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 06:44:38 +0000
Received: from asad-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 01:44:35 -0500
From: Asad Kamal <asad.kamal@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <lijo.lazar@amd.com>, <hawking.zhang@amd.com>, <le.ma@amd.com>,
 <shiwu.zhang@amd.com>, <alexander.deucher@amd.com>, <kevinyang.wang@amd.com>, 
 <asad.kamal@amd.com>
Subject: [PATCH 1/5] drm/amdgpu/pm: add pp_entries_max() helper
Date: Wed, 24 Jun 2026 14:44:10 +0800
Message-ID: <20260624064414.144468-1-asad.kamal@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 7edb7600-20eb-4128-2ac4-08ded1bc1004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: snDm5a30foA/mVG/K+kwdvIjAbXOdXXL94klCPRtCkSYsPki8C3D7ZzkQSm/9OezVrLKz1dGXWKskPuXxioOYp3iOPzbP8TQzR6xJwgKT9v/mwW9t9NJ7XWPQrzl50W8Ktrlx3NTxt15DGWOtpnSPfaKyVBhDJQSaWpEweKrdsRHb4ZYvuZz2FSH0p8EpPpGz3H6WkF3VnFafFtnitGDE0e6MpcIqhNFtE/xrvStMnwNuJu64/qCUBC7IKdxBF+c8RM95saZJJrNSavmT9Rl6v6f7XxO0SOe8Zi5+leH9pA/CTEwXx7WRo3w84eDYvEpbN90q08RjxB7GzSC5lPj5wYKZ+xmw0P/3jwBfeEEV2wJvOpt8zggsPEdM6pCF64TKAf4iINz4fm66jMSDYtVwWpvg3+0Iqnv9YOIt+LYEVheFqn2WLloXK/G4Yf+x3eztz6vL2rAasjhLSKS2nNLWLEWUmevPj0zrDDmQ4lzb81kofd5HTzzpgnhX4xjsnLrHXsP3frzD09cbrfLh2+J/KZqCfkMIBT3/iCXQRlYe/TtzwY0LcQPtxbi5yrF6l+BLn7EXFqABsvE0VEQt15IejfNqpfwiZpD5aXm2gnUE+uDXCJlTiUKJG1EijnB+w5KyPDSFO2EinHuDqx2RFcRcxJMPM5ZAfds2tFMHi1ZL8g7WbCL3M9TGm/EIl16zTRPTQZkUIj6EQLXL2QatuJdvQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DRvASNB2I+Qr41G4NnaCMTsup/EGp3o6Dk2KWpsmrj/3J25aPS/wQUAyA51CkOdRzAll+QFZsePSAApr3vwLLdl+cvbi6B5Wz2ZF80ZFNimNVd1x6z9CYO5NyIDvQOz/k/QoeV/NpenExb/1nDnnhQV8CEAdCYaICLUyuCXlgD6yetBihBtHP+sJd2KSBO6E8rb3D7Iydh/zLIyNTblL870CHl+DuI0T+4HV8TKKIPYIJhxII9R9Lrmsdjpo7DkUq0R+P0ouLm6WLBZHP/qWRC2mI0r8kf/seZOeouaR0omrhNn6sqd5adXyrhnLdORXxQafTHpMjBNpX2J6ZcnttJ0swb5BZNeLcMaIo44OZSmaRv7fSaPubDnax8y0ZKnp7I+Wwdh/BDDUOPAPtehDkTdh/SNYjHxhxipvDzMISYP52YPxiVYG6087zmOhfDgT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 06:44:38.4604 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7edb7600-20eb-4128-2ac4-08ded1bc1004
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229
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
X-Rspamd-Queue-Id: AB2DD6BBDB1

Add a static inline that returns the maximum safe record count for a
PowerPlay sub-table, bounded by the lesser of soft_pp_table_size and
adev->bios_size. Uses adev->bios directly to avoid a dependency on
struct atom_context. Subsequent patches use it to clamp ucNumEntries.

Signed-off-by: Asad Kamal <asad.kamal@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h b/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
index ca71efaa1656..7ebc1344023f 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
@@ -829,4 +829,21 @@ int smu8_init_function_pointers(struct pp_hwmgr *hwmgr);
 int vega12_hwmgr_init(struct pp_hwmgr *hwmgr);
 int vega20_hwmgr_init(struct pp_hwmgr *hwmgr);
 
+static inline uint32_t pp_entries_max(const struct pp_hwmgr *hwmgr,
+				      const void *sub_table,
+				      size_t hdr_size, size_t rec_size)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)hwmgr->adev;
+	const char *bios_end = (const char *)adev->bios + adev->bios_size;
+	const char *pp_end   = (const char *)hwmgr->soft_pp_table
+			       + hwmgr->soft_pp_table_size;
+	const char *entries  = (const char *)sub_table + hdr_size;
+
+	if (pp_end > bios_end)
+		return 0;
+	if (!rec_size || entries >= pp_end)
+		return 0;
+	return (uint32_t)((pp_end - entries) / rec_size);
+}
+
 #endif /* _HWMGR_H_ */
-- 
2.46.0

