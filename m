Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMzqBhDrp2lDlwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 04 Mar 2026 09:19:28 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5211FC705
	for <lists+amd-gfx@lfdr.de>; Wed, 04 Mar 2026 09:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F22B10E977;
	Wed,  4 Mar 2026 08:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="35Et0Ye/";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012023.outbound.protection.outlook.com [52.101.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BD410E972
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Mar 2026 08:19:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ne3MSIGAL75GbuvBejYHjMWm4UY6QS0DLcvtdx7Z80qakHhu1XDAT16Gz/XQhXoZe8pvRj029ZXT/NyR0st0pXYTcJ9+V5+5nxFsu9Kd/euv1fSNHJr0/I34QzA4Nt5XZiPhtAM+6g+ENOMJKdKsIMVZ60y8UaFrupLLAqY47+Z4pqkVUvkql71tbno9/rhx7XGgIuBZtj98CeNxuWeAQHqwLjDtRFGUtQu+wfQzWkF+zaH298qHkc2JtgO41ttiZZBY0FOwFyZZyba2Ef87B23Ps1EKo+cw8qJclrAWtJVtb8p/tmVauHp2CtRr58h03Sui2avkjb60QeJoAT+eEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7IR9kfvh42i3tMhelg1bRNtfGenhDfdAkLnf1rNkKA=;
 b=IcdC2Egbj97S292mnMyT1QWYT+47cr1E/So+Br8V0HZ1kNm0+Z5meoIWa4zzG9sLzc7GKs0owFDXB36qb7pNMl/oOk83/TqdfOOdsijuUmbSFH2DJsIo3xIyy7irVt5GekFb8SdoPLiiLmutDgBfZdDzm+Bsuv9CBIP1Gypc6cjWSP48KXPxcwGAWycWliqLOCCx74f7BMI1pKI+Rw+ZJ0AX8e5ijHlcAGONK6vBzNDlRUa6mIOhVsMpL2qmNRwoEujPOMgeaAXX5HY4b310571OubQYq8HVOg3C4L7dYXaHnqZekh590tvFXSoHjI1Opnp+Dukird7bZDTIhXPCzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7IR9kfvh42i3tMhelg1bRNtfGenhDfdAkLnf1rNkKA=;
 b=35Et0Ye/SmKrZP8r0P0OetISndfsAVfsvvcr5BGMgaMAXcrYzQHJhd67AmYzWCmVgIO4kvuFEOEdOdmR1ADJYRqpmu51f82kTKEDj65jEbq6aN/nkiiNJAljA6i/0o3hAUn4DhqxTsqSq+YUxlJFMhARsLHoA1J/qXO0NlLOORw=
Received: from SJ0PR13CA0189.namprd13.prod.outlook.com (2603:10b6:a03:2c3::14)
 by LV2PR12MB5896.namprd12.prod.outlook.com (2603:10b6:408:172::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 08:19:21 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::8f) by SJ0PR13CA0189.outlook.office365.com
 (2603:10b6:a03:2c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 08:19:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 08:19:21 +0000
Received: from asad-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 02:19:18 -0600
From: Asad Kamal <asad.kamal@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <lijo.lazar@amd.com>, <hawking.zhang@amd.com>, <le.ma@amd.com>,
 <shiwu.zhang@amd.com>, <alexander.deucher@amd.com>, <kevinyang.wang@amd.com>, 
 <asad.kamal@amd.com>
Subject: [PATCH v2 2/2] drm/amd/pm: Enable aid/xcd/hbm temperature reporting
Date: Wed, 4 Mar 2026 16:19:04 +0800
Message-ID: <20260304081904.3132877-2-asad.kamal@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260304081904.3132877-1-asad.kamal@amd.com>
References: <20260304081904.3132877-1-asad.kamal@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|LV2PR12MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: 57773892-7407-467f-5b5c-08de79c6bcfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: qDTVoazhytqhY5VFDk8Ces0H7+FuY1iIbXZzBkUU/rGQ+caR8IppRUCpXwm5Ly9HD+RbnH/W0qA7eg4Xg5Fi1SVlUJIFeRdkLzEchJWXJAe3kdU+fzhFKiFy1Mrii44T9jWnAViqZVFyy6EYCNVxSQCiHrgWByAiG/zG31g/DZrgE8b/12gLfP0OQGMBlD+IjzofQohHYKZ+ddcGBoafElJy5ilJLIYicH7FqZ9fkmqn0p7BMZ4oxqxy37a4m+JaX46rMI/GuMPKTMnBL2yBtZsYK6bKox180ljwXAnIMBc4Lfjdb9WGAQryngNm4/YzgwujSnHUzhCdjRP7RkTKYrPwqIdUxJ9eBP3iLbSzvEmobvT9ZHxgGyIKQnqllIyYaxoB3cglXlsxpm3jvdt6JnqfXiDPxK9y6043I2ukThut8n8p61qjyD4s969PA8Ad1W7UUfDa5oEWVjP/t3DOUMfg2cNY/vMRLo/U8r/OWUdwhJIZQnmDBEBN9A87JJObG8Qbh3QWbBL7RUilvdjIGkMwigEXWY0I5tx62qpQot4CLNS9ONpFphsnMshNoHsUze70vhazBlmaM2mTd+UkUXyxP4dDdUlnY0e5zi3pBewVd8HNZOB4Ly/poX6aT3yUzWii7Glk7QF23+qkFsjviCQ9rsUqVqVhxGEuhg1tznuCYgqylm1AJ+ZOpnwSjDxrny0YllzwvK0JIO2qeHkBjfotX0dStwtM4S16nydalpw1Qb34Ub0Me3+9n8laRe4ab088I7qNno3Glpk6MLnBHA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: grtGAKt4Onn3LKO7Mx+8h7xJfyu1X1TQIsgfkDP2fD5Pm6xu7LCPvQX0kb4H8azNHp456dEszn8f+QZkGLn+5fAeeX6/048hihGKmykUBe6IAStq4SK0O3IUOqi1nNUORj1IEqHCVe087HmQS9g5HKprXKNNSX0lxWWOvd4jPhqWNgWLdrXOt+uQxefHaB7fG6gizqkcd3qovwEt4/9hdVJJtue+b1jkSKcze9DK5VG0Bo+aupWsizgvYpg99rjqzc+v8Z8kqKcSOhazgIqT7S2cl9Pyv/HxgpsQ4Lkm+d0W3LCTpDzpnGfEErnW3IcuMscQW2nYEE6PRkKAp+yohQU3tK1fFUhwKe9S4o6Jotr8NCjslPBEt9Fmf7bwCMMQb7ISwM1AVBQxSXzv5gXYNe7VK2VXBHSpDZKwKeaf956bs5DTqORnXCcMRb9wfNFA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:19:21.3587 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57773892-7407-467f-5b5c-08de79c6bcfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5896
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
X-Rspamd-Queue-Id: BD5211FC705
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[asad.kamal@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Enable aid/xcd/hbm temperature reporting for smu_v13_0_12 via gpu
metrics

Signed-off-by: Asad Kamal <asad.kamal@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index ab690fcccf0b..1bf3ebfe8656 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -373,6 +373,9 @@ static void smu_v13_0_12_init_caps(struct smu_context *smu)
 	} else {
 		smu_v13_0_12_tables_fini(smu);
 	}
+
+	if (fw_ver >= 0x04561000)
+		smu_v13_0_6_cap_set(smu, SMU_CAP(TEMP_AID_XCD_HBM));
 }
 
 static void smu_v13_0_6_init_caps(struct smu_context *smu)
-- 
2.46.0

