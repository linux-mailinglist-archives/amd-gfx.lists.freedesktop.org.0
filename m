Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G6cEAjD2OGqCkgcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 10:45:36 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F106ADD85
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 10:45:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=UG+0efPd;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC8710E559;
	Mon, 22 Jun 2026 08:45:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010012.outbound.protection.outlook.com [52.101.46.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEFC10E559
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 08:45:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbMRMtN+HteoOT7CLTUj33MjJEJhsrAKk2WIJPa7lhMJxUBrkwLecoverklm8f+NV6+QcSef2O6+f/wsTmNadjl/eJuxfZGGmzU57Alr3bL1dFGsm7hUvjHNo8QrinKVzT5u1FdTPRLfEewBHdwIGPavKKQ4lHk+VlLouXPFIibuvvrGG/0ryvK76qiuyBvJQxWLJ6uQX7tgGXS0tgv3gFbPaqIzQGs9Dgu6gSRiL9bB/6tCirZmBV9G/NZlc0o4bOUDpyeifJU9lFslYkcL11DMgymOQTt0EQoo8V/bTV6BhIttPD/WlEF286A7CKa6kp3rEjUewkXLKcAxsSloXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cd2EeHZX2t4bNV6SlOdtf7SOJ123ujJ0jQo+BuWruCQ=;
 b=vXyyRbeepaPGZv/GcB0R4G44ZEQAKIQeNNSqaDpV/KYfefqvcY9C83vTGjZNQkHy1w+aQrkVoTl48tZZT/hgMrMZFSp+/XsYspYwSA/mXZqI4EBC9D+btiRdTSn3bhEvjK1b2qA/epDAb4ncfPgqNlUP5I/n6EMzg+fx3dPyX8CViedKL9QCw0MCFCc+TicSK9kH52slWq3bxE0HZ9C09gB7yK8JGSSWsXsYlmsRNP1Ud5FBETFIgMnxXil5hQNaAUrtQLcsN02nGvrWIEwM3AvYaHGDcIEVXVJ84L769RZ/8RU/I5Nn+qWnwKGNEE1a4ngvLvGZej+SOMVkL1b7IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cd2EeHZX2t4bNV6SlOdtf7SOJ123ujJ0jQo+BuWruCQ=;
 b=UG+0efPd4ndFIffO62j/J7IgowF2SfkUdolUEW5nLNvCZ9v6m2R6rxpFdbbbs4qhuor+LmDAKus36MCDbX1yzi+YbJXhLZeDbZcWTlEjj6tjqdNJZ3MqilG+X20/3R5o2NIC9mctPcdJYYzJiMuUQQwIEy80XhFuEokDN13IZmE=
Received: from PH8P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::25)
 by CH3PR12MB7666.namprd12.prod.outlook.com (2603:10b6:610:152::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 08:45:29 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:510:2db:cafe::93) by PH8P223CA0029.outlook.office365.com
 (2603:10b6:510:2db::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.19 via Frontend Transport; Mon,
 22 Jun 2026 08:45:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 08:45:29 +0000
Received: from sunce-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 03:45:27 -0500
From: Ce Sun <cesun102@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <YiPeng.Chai@amd.com>, <Tao.Zhou1@amd.com>,
 <Stanley.Yang@amd.com>, Ce Sun <cesun102@amd.com>
Subject: [PATCH v2 10/48] drm/amdgpu: retire mmhub v1.8 ACA support
Date: Mon, 22 Jun 2026 16:44:12 +0800
Message-ID: <146088b690e5274b1210752ca3e7462eb77de865.1782117608.git.cesun102@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|CH3PR12MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: 4344ab9c-08e9-4096-c71c-08ded03a9ceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: PNBFTd9wz0nrTbAOB0RmfPN+5tkHZvHlG2zl+0GQxdkFyc8UPiDWPeTHUD4XlRBU2rspum9K2yFP0hGSpOyvtyaU+11CQXyLf+5cQofZlhEDmdRk2jJA3QDy4R95b/dBuBKG0AyHnr8JX9NcXnx0qmgWIc44Z7hqneMcBd52lwPdPBeHl0lKYzlKKvK75lZLL2PpChapG61tqZhd4KIB7YxwLKovvtztf9a3kfFAlUdQrfMN2lZLmgZKDeyHDAjwymNYb++9cBdWPKwC2O/cm3cWR5/hlI/6MPv8prR/3DYtK8Tzt8cGQjKiotkCOo/SiFCsi+hR1q5drpmesPgPuYaFuWRnrAcFVwyDP3DhUSRZRqNyB98XBhAjIYRHdky46k+ftP/qz6uy/FrQ27JFVqGj4216HnwoUppK9X4sgB25jnyqd4K/cbYEbhYhJ8rg0ukUNrVqwttk4lawKXaMuToxT4erVr98yK1uZj9sd9JYhfKtSHqTNJ+1n25f6jlqNWvvVc5Cf81spmerQuoNSVhgM0c9CnZSFP3ApxfeR4cSYIpTTt+dh9kXggUaO9adLdRKJ/v6ZuW8/cZjTWUR9846WDD9DJhNmFMkqhddAmxXNs/QYTYU8LrL5uetHrrgCnp6q/63CRWi1ZWVcJJMuLypzh4G91b+LU0ggsn/tBibx/CbJbRb4BoWaUT8h6b5YSr12r3bio7NI4G4H0P8Ag==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: a8eUSAgrDVyqdWCOXeHt36kFm3weiQkra5/65oXpjWqhNREDduSsCa74hoW7+32u5m+GyAi6p7ruFNkW2sNEzjbjE0DpZzoAAGZrzNiL5XPtiVQLMab4G9zK1sU8rFFM8MKU3z1gJSrxhYqrU2oLQBXndFaCZMJihnULm6/4T9haDTJJQp4DDACBK086slBmXlYjrRZ/29VO02+7ceBT+5SKS4iKh4g74h4Ki02ZUbQF2lrRey5P80xL9zFYQwz8g7rb4upmVDYWaWu89tqsKXXxneXE/7LoFCtJdCWPSceNkexmNwxQIzuieEkPHxDP3q0SKba3QLNtEYQ2hvHVY2Hrb3Jp5n3t7Y4Y/iOhx044sgXXLao2c02bKTgXR5PcZFOUw6hUZpeHLQ8drvmUou3V+Cz9WwUIjXKMptim7gKnAcltREBj8zKeG/KvN2DK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 08:45:29.1704 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4344ab9c-08e9-4096-c71c-08ded03a9ceb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7666
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5F106ADD85

retire mmhub v1.8 ACA support

Signed-off-by: Ce Sun <cesun102@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c | 92 -------------------------
 1 file changed, 92 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
index cc688ae79e84..2a6a5ac4f374 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
@@ -772,100 +772,8 @@ static const struct amdgpu_ras_block_hw_ops mmhub_v1_8_ras_hw_ops = {
 	.reset_ras_error_count = mmhub_v1_8_reset_ras_error_count,
 };
 
-static int mmhub_v1_8_aca_bank_parser(struct aca_handle *handle, struct aca_bank *bank,
-				      enum aca_smu_type type, void *data)
-{
-	struct aca_bank_info info;
-	u64 misc0;
-	int ret;
-
-	ret = aca_bank_info_decode(bank, &info);
-	if (ret)
-		return ret;
-
-	misc0 = bank->regs[ACA_REG_IDX_MISC0];
-	switch (type) {
-	case ACA_SMU_TYPE_UE:
-		bank->aca_err_type = ACA_ERROR_TYPE_UE;
-		ret = aca_error_cache_log_bank_error(handle, &info, ACA_ERROR_TYPE_UE,
-						     1ULL);
-		break;
-	case ACA_SMU_TYPE_CE:
-		bank->aca_err_type = ACA_ERROR_TYPE_CE;
-		ret = aca_error_cache_log_bank_error(handle, &info, bank->aca_err_type,
-						     ACA_REG__MISC0__ERRCNT(misc0));
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return ret;
-}
-
-/* reference to smu driver if header file */
-static int mmhub_v1_8_err_codes[] = {
-	0, 1, 2, 3, 4, /* CODE_DAGB0 - 4 */
-	5, 6, 7, 8, 9, /* CODE_EA0 - 4 */
-	10, /* CODE_UTCL2_ROUTER */
-	11, /* CODE_VML2 */
-	12, /* CODE_VML2_WALKER */
-	13, /* CODE_MMCANE */
-};
-
-static bool mmhub_v1_8_aca_bank_is_valid(struct aca_handle *handle, struct aca_bank *bank,
-					 enum aca_smu_type type, void *data)
-{
-	u32 instlo;
-
-	instlo = ACA_REG__IPID__INSTANCEIDLO(bank->regs[ACA_REG_IDX_IPID]);
-	instlo &= GENMASK(31, 1);
-
-	if (instlo != mmSMNAID_AID0_MCA_SMU)
-		return false;
-
-	if (aca_bank_check_error_codes(handle->adev, bank,
-				       mmhub_v1_8_err_codes,
-				       ARRAY_SIZE(mmhub_v1_8_err_codes)))
-		return false;
-
-	return true;
-}
-
-static const struct aca_bank_ops mmhub_v1_8_aca_bank_ops = {
-	.aca_bank_parser = mmhub_v1_8_aca_bank_parser,
-	.aca_bank_is_valid = mmhub_v1_8_aca_bank_is_valid,
-};
-
-static const struct aca_info mmhub_v1_8_aca_info = {
-	.hwip = ACA_HWIP_TYPE_SMU,
-	.mask = ACA_ERROR_UE_MASK,
-	.bank_ops = &mmhub_v1_8_aca_bank_ops,
-};
-
-static int mmhub_v1_8_ras_late_init(struct amdgpu_device *adev, struct ras_common_if *ras_block)
-{
-	int r;
-
-	r = amdgpu_ras_block_late_init(adev, ras_block);
-	if (r)
-		return r;
-
-	r = amdgpu_ras_bind_aca(adev, AMDGPU_RAS_BLOCK__MMHUB,
-				&mmhub_v1_8_aca_info, NULL);
-	if (r)
-		goto late_fini;
-
-	return 0;
-
-late_fini:
-	amdgpu_ras_block_late_fini(adev, ras_block);
-
-	return r;
-}
-
 struct amdgpu_mmhub_ras mmhub_v1_8_ras = {
 	.ras_block = {
 		.hw_ops = &mmhub_v1_8_ras_hw_ops,
-		.ras_late_init = mmhub_v1_8_ras_late_init,
 	},
 };
-- 
2.34.1

