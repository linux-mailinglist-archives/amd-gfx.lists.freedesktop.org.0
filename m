Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nIiiD8SrKWoNbwMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jun 2026 20:24:04 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F10166C38D
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jun 2026 20:24:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=PivTynVQ;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E1610EB2E;
	Wed, 10 Jun 2026 18:24:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012059.outbound.protection.outlook.com [40.107.209.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E1F10EB2E
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jun 2026 18:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3UkV0s5kCNHbQxkPYfYo2UHUGy2KSVkcVdGt6JkADB9gkgn5vTIGQPEZXsag7RXpwenwwIlSe3fMcqrqQGS+LJNgk1Krexx29/LeUUReyBa5BK8dXmoyqSPQjLHfhz7gVFa08clHz8pRN8l6GYoHTCfk1S4h2tBRox7wjTKt6yI7PWctL1pKwAgw1l73DPZhvbTz/YaIMvWRDXLFoLq2Lq+KZox6gSwSc9bgLSI/Bkbpfg0ROA6ldQcl3SPg+IUudADXaTWnhr+KMZXOpAK4PfdBqL6mSkSnUfvHLyrxyIWwxCZRDdMWXUTkbAbiP2WMxiFk/UwWYZvAnKftmzSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYxM0wI/w0ymGCOp1naNJ/hrXFlHnmZovEb5UdCL6XA=;
 b=CLr9n2zLMhLoEO9tVh3LSPJ5A8nBnlZAi46r7TiBlsFv0BRk7cJK0nNTOb8BhbrtwHcfDK7gEho43zUlR9ixM9+TmZrQboNSeWpJ1sV0cUdO+aqyvagsGkhCpGw02q3jS2ienWHDy8kpULIR+ciIsn0YXQaubEpJSeZyRpkOWYVK1EHSwIHiMW9KIf4Jvg7icfsPupyApmbmhCKHBME5sMXRnyLL20/D3Ub0MgVtEWtIDUfBcNvf6uyHd87HDWdOwUnZfffJUuNCOJvSfVM4K0Hmgn2V1H7BCJYosXwlBDH7oHusEEJNdr1EZsBdiZ0cZP1X81LHY5r5FVMszWuDYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYxM0wI/w0ymGCOp1naNJ/hrXFlHnmZovEb5UdCL6XA=;
 b=PivTynVQMzxFjS+zpB09MnQDEEgCiXfmITs5bI/BFOIzSc7Lfin3zruQcA1f/Rwez0+BBjVARPHVYM2UPj/Z/U/KpuVOoIDbzUurC7Oryk73/conZO66OnyQjEsAk7aLk8trkmfNXgC1miTJ4ruuDEqj8Z6T6vCEOSiCjCNJYBM=
Received: from CH3P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::21)
 by DM4PR12MB7672.namprd12.prod.outlook.com (2603:10b6:8:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 18:23:49 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::1f) by CH3P221CA0013.outlook.office365.com
 (2603:10b6:610:1e7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Wed,
 10 Jun 2026 18:23:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 18:23:49 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 13:23:45 -0500
Received: from rtg-MAPLE.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 10 Jun 2026 13:23:43 -0500
From: Priya Hosur <Priya.Hosur@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Lijo.Lazar@amd.com>,
 <Alexander.Deucher@amd.com>, <Christian.Koenig@amd.com>,
 <Mario.Limonciello@amd.com>, <Kenneth.Feng@amd.com>
CC: <Pratik.Vishwakarma@amd.com>, <Veerabadhran.Gopalakrishnan@amd.com>,
 <Priya.Hosur@amd.com>
Subject: [PATCH v2 3/4] drm/amd/pm: smu_v14_0_0: add SMU_DCEFCLK support in
 DPM frequency queries
Date: Wed, 10 Jun 2026 23:53:32 +0530
Message-ID: <20260610182333.3922-4-Priya.Hosur@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610182333.3922-1-Priya.Hosur@amd.com>
References: <20260610182333.3922-1-Priya.Hosur@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|DM4PR12MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 2053269f-fb78-4711-f1b8-08dec71d6b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ncfXG+hd/UV7sAR3H8+L/UiJr6ovyQbz7+FGByrkQ3TDYJJ6Ltk8jF0yG6m7cE9YBq0do3mhCid3u3t9mjQTppVGio5jEfGeJUBPDpSw5XFroQEg0aEhT84VEQkuiCvxxzr0YQ7XPRwHtMJ0sd2Em8Ai3a6B0EJblxtMphRUrjP7lecKY/oJzIzTyr93R8KPdi8EPQ9rMIMqfcr+0JQ8G5TniZPLchncUkKHDKBJBeAEIfLEXmDP9Ov3QBRtlFxGK/hskIm1wW/TZYe8yws5nNQJwHfyxMhtSUEtvf01R317CBS+ESUjYS6aBy8cXYhA0WBRVauUr7VRK0yRg1mfQtGahXO4/nKhN9Fn0SaxLVDXLiISX9Sg4MCV53Lwad1faerqb4x5MKddwNJraiCylfH9pTh0IZvjc27fQxwdLWiv7nqy4DHnxpthq83LGNTtiRGs6c1WbJ1+2OG63xKGOgCLZ0B/YXX38IA0pHCU0QN3Mmzi/2JgAXRonk9PftlemB/3ZRdiJ2MlGTfV/uCnlotFHGg8p+gZT7QznzAd74P5H55RYIHJBw6R1a6v9OGSqdB5jYVwn/M0xcmXk+V/YiUVe7bhxRYwqUzztM+/zWiWUYa5ty4FKszngBoMkW4f2rutlGcZ2gttT5DZUuAKM6gDWfdeDEQ3ZPLpnupPxTldSJ7jD1DdNnFZcmJLXFeVjKuexi8P770Wkb+czwT/7usP9rvc0OMs2gqtVBNBIaI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wfUZUXHYe5KmoYa8+1sbSWC4fGXQIGF5dZIlyimKrG1SQdXXJFfvdc4rOIHau+B5Kcq3iTB/f8gtlbpndAoIkdQcthp9Tz9Qb+U4nARRKEmnOhpSORpwgAFIzpGHP1Cwd1TtxYof14lJOSivLwiStlFbrNSI8rC6Wuqwr0iDM53nmeff3uVHaRTopMB1lwsfTmdBzJlXvijMhldNE0sP/Xbcwpp9Wr1fBj3dFAHhwWnL7BoBpd5V1lNEtlAjG5V9LGckGOUtnCqcr6AJ5U/rqTuuzHoXQqEfs/s9FPTXL+kR090RjzN1wJ8jHMTMp+EPXt4V3+HvY2a6jo6rWf4b1PHHMIETIag48W51RmRXQF0A9plfd5H3i0Fw8xjCc4Scrl589w/HCN0fz9WIO31ykihIdj6cVVWe6ZqfxRgU12MKRkMYZ+jPDsNnzBReAVyI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 18:23:49.7053 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2053269f-fb78-4711-f1b8-08dec71d6b0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7672
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	TAGGED_RCPT(0.00)[amd-gfx];
	FROM_NEQ_ENVFROM(0.00)[Priya.Hosur@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F10166C38D

Add SMU_DCEFCLK case to smu_v14_0_1_get_dpm_freq_by_index and
smu_v14_0_0_get_dpm_freq_by_index using DcfClocks[] with
NumDcfClkLevelsEnabled bounds check. Add matching case in both
get_dpm_level_count functions.

Add SMU_DCEFCLK case in emit_clk_levels to list DCEF DPM levels.
No * marker is emitted since SmuMetrics_t has no DcfclkFrequency
field (same firmware limitation as Phoenix).

Without this, pp_dpm_dcefclk reports N/A on Strix Halo.

Signed-off-by: Priya Hosur <Priya.Hosur@amd.com>
---
 .../drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
index 79e0e2fca602..1be8d1a8da19 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
@@ -682,6 +682,11 @@ static int smu_v14_0_1_get_dpm_freq_by_index(struct smu_context *smu,
 			return -EINVAL;
 		*freq = clk_table->FclkClocks_Freq[dpm_level];
 		break;
+	case SMU_DCEFCLK:
+		if (dpm_level >= clk_table->NumDcfClkLevelsEnabled)
+			return -EINVAL;
+		*freq = clk_table->DcfClocks[dpm_level];
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -726,6 +731,11 @@ static int smu_v14_0_0_get_dpm_freq_by_index(struct smu_context *smu,
 			return -EINVAL;
 		*freq = clk_table->FclkClocks_Freq[dpm_level];
 		break;
+	case SMU_DCEFCLK:
+		if (dpm_level >= clk_table->NumDcfClkLevelsEnabled)
+			return -EINVAL;
+		*freq = clk_table->DcfClocks[dpm_level];
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1089,6 +1099,9 @@ static int smu_v14_0_1_get_dpm_level_count(struct smu_context *smu,
 	case SMU_FCLK:
 		*count = clk_table->NumFclkLevelsEnabled;
 		break;
+	case SMU_DCEFCLK:
+		*count = clk_table->NumDcfClkLevelsEnabled;
+		break;
 	default:
 		break;
 	}
@@ -1118,6 +1131,9 @@ static int smu_v14_0_0_get_dpm_level_count(struct smu_context *smu,
 	case SMU_FCLK:
 		*count = clk_table->NumFclkLevelsEnabled;
 		break;
+	case SMU_DCEFCLK:
+		*count = clk_table->NumDcfClkLevelsEnabled;
+		break;
 	default:
 		break;
 	}
@@ -1184,6 +1200,18 @@ static int smu_v14_0_0_emit_clk_levels(struct smu_context *smu,
 					      cur_value == value ? "*" : "");
 		}
 		break;
+	case SMU_DCEFCLK:
+		ret = smu_v14_0_common_get_dpm_level_count(smu, clk_type, &count);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < count; i++) {
+			ret = smu_v14_0_common_get_dpm_freq_by_index(smu, clk_type, i, &value);
+			if (ret)
+				return ret;
+			size += sysfs_emit_at(buf, size, "%d: %uMhz\n", i, value);
+		}
+		break;
 	case SMU_GFXCLK:
 	case SMU_SCLK:
 		ret = smu_v14_0_0_get_current_clk_freq(smu, clk_type, &cur_value);
-- 
2.43.0

