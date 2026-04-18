Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK/nK6fV4mkT/AAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 18 Apr 2026 02:51:51 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBE641F830
	for <lists+amd-gfx@lfdr.de>; Sat, 18 Apr 2026 02:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FF710E2E0;
	Sat, 18 Apr 2026 00:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3NOwaJ2I";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012070.outbound.protection.outlook.com [52.101.43.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97E910E2E0
 for <amd-gfx@lists.freedesktop.org>; Sat, 18 Apr 2026 00:51:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJLaXhxidzgdLi+9cjx58Dl/Tyythv7bL8rbybzxiEzHdMIYIJbk4/gixaA381QFArXCAXYJMGhXd32xFFFWiRf9PJWiW9DV6ec6xIqtVSHqrhJ46PYD5RH9kh2l8RNeUGUGvG0xemMICD5oh31W8JzIUJt7jUAAv5Ypl0qySzhFIJ2tI+ia8HEd/w2ofF63EXTTApxvzpwDIOIITIB+ir9dmWqD41pFlKbulKroylqInHOhM2N53BmNwIXasIAW5bCId2XU+1qZGaZ+cl+vgC6HhSDydUOFmiB0/ORw4+IVLSXw0yHGhVT7eHH0yds1ya5s2f674ieTCfCfr4arSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfPdLEV8Hru0sIz07mOgPlBnza2W7Ucv/iaduUIpAGg=;
 b=Gk5K+sAnBk1t+ep2/Hj5S1jnqtAx6kSDNK6/IQTUEqwBo0iOFbvx8Q3Kz/qz67hMfWrSqq27LEPayNogNVjsRNhn9uGMX8+YbTCfzhG4ZIrkMrijlDgb04HoC3KUoqW/+Aerai3GayMcfKQMPZ8XEZDtWR22ie5vHfkqZbDr9Azx6TOFDrKLSlWqyQgjE2NLGJ+1orWx3HhuzXaF7x22V6dcoIs5ceWpqwGWkDIWEXbkpU/yuAT1VWgCIBURPhiwWll2icTNIlAa5CmPFTXV2VeORRGqBHJqtAVm3el7qa6w1hD7nnwfIWThPJQgG0cXH77XRgr6RH48lhBDtM12zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfPdLEV8Hru0sIz07mOgPlBnza2W7Ucv/iaduUIpAGg=;
 b=3NOwaJ2INzOiSixDVNcmCy7AWgxt9Igzo5oNNK3sbgnt+dKeYxsAL/wy6A1IFOqTLLOqhpTORYLqzMUMNI6WkFQT3C2WMhQ+ye5hxqCax6smJMs7RPl2eUZ+7fI9dr9kxbIx6UPkuauXiy/gm/3QAJ0aJ486WoJ7dfjox2r+cXg=
Received: from PH8PR02CA0046.namprd02.prod.outlook.com (2603:10b6:510:2da::20)
 by PH7PR12MB6467.namprd12.prod.outlook.com (2603:10b6:510:1f5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Sat, 18 Apr
 2026 00:51:36 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:510:2da:cafe::1) by PH8PR02CA0046.outlook.office365.com
 (2603:10b6:510:2da::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.55 via Frontend Transport; Sat,
 18 Apr 2026 00:51:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Sat, 18 Apr 2026 00:51:35 +0000
Received: from mlse-blrlinux-ll.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 17 Apr
 2026 19:51:34 -0500
From: Lijo Lazar <lijo.lazar@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <Alexander.Deucher@amd.com>, <Asad.Kamal@amd.com>
Subject: [PATCH] drm/amd/pm: Check SMUv13.0.6/12 metrics integrity
Date: Sat, 18 Apr 2026 06:21:17 +0530
Message-ID: <20260418005117.3437052-1-lijo.lazar@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|PH7PR12MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: e14b431c-c81a-4924-13f1-08de9ce4a47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: /yz+MbRTxeNjXChoS3g+hBC2ulvMHhJ9DLW0XMzfP7nYawg1ln+5OfM5AA5ZGxF/QIy6B4krTMlgHoMATri0dlem2dEMNwuzubPcNOIdgOep1Vt/Z+8L/FgZRTWM2UzDTBm6SkflIUbSCHhnqwJ35dTk4r+YU5RCHojkja5EPW1VoaRSMpTHSyDADlSurHBMlwspIIdZoNf1q6OK9cN4VtTqlNhWXj6aqmcwKK3M4ACpxgiSDgyC1uSLRE32yJaD5pNCxJ1ibfhixrJGOdgjaeLR0gtb9Q4cQ/zlZE0vhGwe/sAc4a1T312cfhhiIfUtumYg02OPlg4hgkcXjXb41Sm/OtTdPtn6D1wMehIC5B/6MCzBPPhVpCyaw1izOe1Le7icoOKlw7wnasHirhto16X148ff4dR/pP2kABRd5xGWsBs1/B/aSRBAMgRlfq62HarrL6ala9S0TqW0G/koZCduol1a3eNFOA4nFSf3aYybUcLwXOJF5OxAx260acV1ySqerWag6H3vv9wgsp4IIkp+diJqf3+nOS2hqrKkHj459AYpyT/aaeJ+sLJwy9yFHmNqbQ4TxAqq9WahIkh1gu/QtTAhfh+olcVYCXOeYAlcDnvz5O5oMpmHZ+VfEfajIGtB1M1fYSVoqo2ELIf5f8bRP/d0mWg4r5l8/PSzNBrsR7r9v4y+PWp4OborYJCyyV3I2Bm7kACSQKT0Bqp91b++O8LpIhI6NmNWk8RIHtr3KP1eafyX9frQYVGLWfZxY3BPCp1pRIAX+lzJ7jsQSw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2UEnSMI5l5odvYOK2i826CYGFRJ4mzyTAIDuehxHJpg9rQtS/1q7jDSXMPcT3TN7WLr4KsApPrgRUfRIL66YmsTMTGL2Y6GxtgwbTWz6xgM+OWhksfu/VCJ0zBiv1G7BRyxzG840eA4ctnUeBngx5ZFaEQJIl5kVKkDjJQmPgimKTSTFVg2dUo7vQS+yG2AHe6OFiJa5FVatwqwKoRPGZI3e8T3mP9noXsmkR8h9PUMjLpU5QGX79ZHTpvkEL0l3kT8Yp6+57Jxj2klcIAnOb9eILU1c+vRhLEA/UNaSPGloMAeTBT9w5LSqf1TeC18ey9Wz1Z0xzGVyE9CsGc5/7JFq1gnILOVpK8YRWqsaJUp6Y0hi1matnNbJsGeRwYMISkkfu5ajLycj3sBoT1vivVfXhLHk44ofmFA147N5Oq7GiU4dCTVleJvSrfTzKvm6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2026 00:51:35.8829 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e14b431c-c81a-4924-13f1-08de9ce4a47b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6467
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lijo.lazar@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 1CBE641F830
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Check if data fetch is proper by matching the first few bytes against
0xFFs. If 0xFFs, that means data couldn't be read properly.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index 03a4a3513228..40f0d8a685bf 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -783,6 +783,10 @@ int smu_v13_0_6_get_metrics_table(struct smu_context *smu, void *metrics_table,
 		if (ret)
 			return ret;
 
+		if (!memchr_inv(smu_table->metrics_table, 0xff,
+				min(16, table_size)))
+			return -EHWPOISON;
+
 		smu_table->metrics_time = jiffies;
 	}
 
-- 
2.49.0

