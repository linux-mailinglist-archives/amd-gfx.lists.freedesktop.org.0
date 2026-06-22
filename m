Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id weX1NV32OGqikgcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 10:46:21 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B456ADDF7
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 10:46:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=PDSD+DwQ;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E4610E573;
	Mon, 22 Jun 2026 08:46:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010031.outbound.protection.outlook.com [52.101.61.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3424510E575
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 08:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5ezOEsqJ65CPWQIher2JJScjuHrPpmp6e5U+Os2zoWTucEhzG6EOr73WR4wZnL1h+8l/bou/7f8H+ClnR7Uwyce+B2+fWY3TbH3VMekev6e9k0F8SVx23ptUxAGZaxO55oQ4KzvXKKIcsPv+LjwfYZXfhCP1/WynuDdtwK/9Hfrm2AqIPGYwANPfbhjwpmqitCZw/Fb7hKjlTlGm/7uu+q0o26Yz2gVOPuVl18AyaOYCXhXeCyroOfMhuAeHwZU1eDzp5zqbwIt8oY0dysSA6JOHqhTJIHREWvBBVTleNECpT5JTZdzW82W7fvxRUHxy5RGYGRyqN/E2wEgTQ0ICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5ok40vPD0firo4DXv43OqqlvoEk+RfAq8BMZUsq5I4=;
 b=uZdJ0vGoNON2ndALzyXXoaeZyRl/Ti8Q11zAK31cYV1wtrnnsfo5epaez7hsj6X6TC2v/f5BpIe35KwoKBJaqNfZUz9ynLmrjlWXJ/Om8ZjhgvWECHHS/Ya+7Ae/WxNApJhVgpvgadBQRt7vuC2qei8uIXfVFojvk6scIHCT2lFeiAJ0An/PPft6Oa54HEzeZEhycUXVrErioncbQJlLchIKWwnO2MByHvdRIdPxTzLgVoOzKaRnt1KGgbDRO2EVuixTrx6DCN3K9OIp4UJPNPCjoO0XEYvPO/zZoJ9UAA/gYovC8VXYVa4IUfPTgvnIJiGb44RsOLiE7cDEK1S+Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5ok40vPD0firo4DXv43OqqlvoEk+RfAq8BMZUsq5I4=;
 b=PDSD+DwQiO51LG2vFDFOJOP+Ldsr5ELYUEvHioQg5Je7bUTL/jBeDApKiw880q/QoYA+vCGZgkOn7Xj2buQ5bxuMArR1HBVMtw2MwdaLN3VG28k+PFg8J1o2yUSwKQLHhfNJvO0R5f3utz+9TQJ3VHLrJcmHwjIi1aJ/05Fa++E=
Received: from PH8P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::14)
 by IA0PPFD4454CAA9.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::be5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 08:46:15 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:510:2db:cafe::73) by PH8P223CA0024.outlook.office365.com
 (2603:10b6:510:2db::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 08:46:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 08:46:14 +0000
Received: from sunce-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 03:46:12 -0500
From: Ce Sun <cesun102@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <YiPeng.Chai@amd.com>, <Tao.Zhou1@amd.com>,
 <Stanley.Yang@amd.com>, Ce Sun <cesun102@amd.com>
Subject: [PATCH v2 33/48] drm/amdgpu: retire legacy ras_eeprom_read_idx
 interface
Date: Mon, 22 Jun 2026 16:44:35 +0800
Message-ID: <dab2622fddfb78f05df3db93a1232b81b7394e58.1782117608.git.cesun102@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <594f7cbae0387b60f8af49505b57c1a5a604db2f.1782117608.git.cesun102@amd.com>
References: <594f7cbae0387b60f8af49505b57c1a5a604db2f.1782117608.git.cesun102@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|IA0PPFD4454CAA9:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a5da93-1c8a-4c19-829e-08ded03ab7e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: C3WwZgzZY7XoHAG5+CaQLCFb/Is6Fm0OKNUPHcHVxM/GoJbPvTXC1NqjPj2FMvC+iQaHs6ra1Tp3YdeM/UNIlrqVCqX89G0sWyVfNcJRySgaFAnsN7VGAUyWUXQf3NydXGW+bfMzDNTBBxnRePg1d2FdmQRAAC7VKaVqvvbE64qkKGgGpMH00Wf2wBQMJTnrryLmQKv6nZn/qQUk1KyDHEzthyMuGp0ZQgjBVJVotoTW8Z9j+YxKJz9bzU7cXhuPoxmv/WgH5ak1A/x1NusrW2e+EsSm/oi3h726Q2nrXLZoUtH43xg/dfDnp55u7My5aPBTezJpHmClfVncbehnQrVg9AdV73s5YhRHR/RYlHc7omgkZ/DVWjt1PltTmEhikt81pnn3rvzsjxDQ5fKlP5nWUW/LK3LhSUw2qn9QXiXk5lUqfGP9wveD838RamzlCBgGyIKVy10hOTM0stfJwMNYn+e/TgohSA+lz7nIG2pSg04So2jsUwRlkbfKGkyWs4Mkctxg9kS1b2yQSm77wVnY9cz8fwI+5QD1SIhNascsxr44KAioJ7hMNRBM+EtBopw72t4U6LW+mT0rOSE6CudulBMSCcpO1tugsEDlrKkevsEvVucHQb68j3hjz4BrboM8S9k7+6DeuZV4j5iDcnkESqLv8fHJzRFpPd/O+KHQu6vJTVbombT6rPbGLYgIP8739JQL66KpVHiOJesW/w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jYDDRTCmBCJkojpvbg6HH+KnXIt+mXobq7lwMdZAASuVZe86GlrGh/wdvT8QYuHjy8oOGWWXp9812jRvzD/MOVYxjdEtSPgGuy+iGoPW0jeERyz/4y0TDIvyBCxQwZfLzQOs7AuVJ4zi4LLvUO7Wk1p8fFB5AoJe/w0isAkanTUV5PZWr6cwIefxici6JpZcdfzghIyYeJ7cWZ8oOs5RdB9Jc2+xWwz/GaXB/MofR1rWacW/zmmjCik80CHZxpGFlOlnVy2HbRyK8OdMrp7HR7Ht+TzCKP97wdzsHhF9D6T+VGYIb2NLAMHZa1gVAl9jn77dU76ncdwNMYjRoQtUPe/ll43+HFN+zD8eA2XSyEIGb7lIXYRUCMFd2PlhdiXULgXqg8XHxoNSg/t2UzwXDltVBz4OQckTAyruaOTbthQuCajGLCIvNEXPe3vbu3BG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 08:46:14.4329 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a5da93-1c8a-4c19-829e-08ded03ab7e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFD4454CAA9
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
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[cesun102@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84B456ADDF7

Remove the legacy ras_eeprom_read_idx interface for PMFW-managed RAS eeprom

Signed-off-by: Ce Sun <cesun102@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    | 49 -------------------
 1 file changed, 49 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
index 80de2459c76a..9a9633b57022 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -975,52 +975,6 @@ static int __amdgpu_ras_eeprom_read(struct amdgpu_ras_eeprom_control *control,
 	return res;
 }
 
-int amdgpu_ras_eeprom_read_idx(struct amdgpu_ras_eeprom_control *control,
-			struct eeprom_table_record *record, u32 rec_idx,
-			const u32 num)
-{
-	struct amdgpu_device *adev = to_amdgpu_device(control);
-	uint64_t ts, end_idx;
-	int i, ret;
-	u64 mca, ipid;
-	u32 cu, mem_channel, mcumc_id;
-
-	if (!amdgpu_ras_smu_eeprom_supported(adev))
-		return 0;
-
-	if (!adev->umc.ras || !adev->umc.ras->mca_ipid_parse)
-		return -EOPNOTSUPP;
-
-	end_idx = rec_idx + num;
-	for (i = rec_idx; i < end_idx; i++) {
-		ret = amdgpu_ras_smu_get_badpage_mca_addr(adev, i, &mca);
-		if (ret)
-			return ret;
-
-		ret = amdgpu_ras_smu_get_badpage_ipid(adev, i, &ipid);
-		if (ret)
-			return ret;
-
-		ret = amdgpu_ras_smu_get_timestamp(adev, i, &ts);
-		if (ret)
-			return ret;
-
-		record[i - rec_idx].address = mca;
-		/* retired_page (pa) is unused now */
-		record[i - rec_idx].retired_page = 0x1ULL;
-		record[i - rec_idx].ts = ts;
-		record[i - rec_idx].err_type = AMDGPU_RAS_EEPROM_ERR_NON_RECOVERABLE;
-
-		adev->umc.ras->mca_ipid_parse(adev, ipid,
-			&cu, &mem_channel, &mcumc_id, NULL);
-		record[i - rec_idx].cu = (u8)cu;
-		record[i - rec_idx].mem_channel = (u8)mem_channel;
-		record[i - rec_idx].mcumc_id = (u8)mcumc_id;
-	}
-
-	return 0;
-}
-
 /**
  * amdgpu_ras_eeprom_read -- read EEPROM
  * @control: pointer to control structure
@@ -1042,9 +996,6 @@ int amdgpu_ras_eeprom_read(struct amdgpu_ras_eeprom_control *control,
 	u8 *buf, *pp;
 	u32 g0, g1;
 
-	if (amdgpu_ras_smu_eeprom_supported(adev))
-		return amdgpu_ras_eeprom_read_idx(control, record, 0, num);
-
 	if (!__is_ras_eeprom_supported(adev))
 		return 0;
 
-- 
2.34.1

