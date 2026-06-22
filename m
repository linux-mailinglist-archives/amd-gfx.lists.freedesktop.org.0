Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EJcpDDW9OGo6hQcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 06:42:29 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B4D6AC91A
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 06:42:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="pMbj/TzU";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4507E10E461;
	Mon, 22 Jun 2026 04:42:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010012.outbound.protection.outlook.com [52.101.61.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC83310E463
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 04:42:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vho6wXrnvVQpxCzJexZD2xvEJhPE4s4oO8RHncdRVomS53NM1l9xLVNwbi7tkr2mxP+Ysv59hWnUya0PAlxp3q+A9zka6aZmC6uvJsxwa3bXQ6tPBbO7huy5qBuSXf65YAr7KrM/Iks3Gn2giUAebRq6IyWncxFtonL3OAKF1F0WiOiI2hxk8YAr7H5HXJmI5LbSBrZsu4/t94CP/dvAxCX4g66EYuz4KVckGLyUdx450bEFE8eMjyy6VS/gHQqlDsTPLqumxzSwlPjCXRSQhR2plyLXP9js1JtbIrJkkGE6EqJMwHoPYSuJKfKIjieqPb0HKptHttURrp+kAGc2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnA/vfR18tcCM0/EXtmQRMonq0HD1GrUIiiRf/iJPt4=;
 b=ulHQjkqt9L7cQsI+T7vfiH5+oduU2N6lWSH4Tk0uqRBSERz0In8bbPiXisWyH3Egz0PqW0HaMW4GrNxfIyLHMk9Bp7kujjr5YbCDMSzbhuwu9Vh29hlYAxq7G81bEkAZ12byp7gXlmkA8rp2u6PJ7oUuIwejtNLCWyWqHsbZXnvxRhuzejGlh2LPH3VyFZ2fAyanIKKB1NmXH8s/4vghoWQbLs8VnKYCoOygUYUrxRNR8ME6FIGxQK9qrtkdO5/qSRuwJjAG5Li2eK3qEDbWG9G3ROZOeVaRvs3WtmJdo5cT4Xm37Ux84nFTqBdgKrJiuu4IUxEsAQAsmBjFoC8Qzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnA/vfR18tcCM0/EXtmQRMonq0HD1GrUIiiRf/iJPt4=;
 b=pMbj/TzUM32GVTyC/VtJ2zWA1cLS9JjLvQrfdzOcy9WZ1OtxIkJopVUQ9qWJBRAjXRLQIS/sE1Ec0Tt34kyqOe/vOJazMwh4aluLIEZIq7A4m5Q5SR5v1fMmBcn1ku9XoZCSJxQ6pGtjDP48jPnzyw8huZUR2WWdEC56+blhlII=
Received: from BL1PR13CA0391.namprd13.prod.outlook.com (2603:10b6:208:2c2::6)
 by DM3PR12MB9325.namprd12.prod.outlook.com (2603:10b6:0:46::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 04:42:20 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::18) by BL1PR13CA0391.outlook.office365.com
 (2603:10b6:208:2c2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.11 via Frontend Transport; Mon,
 22 Jun 2026 04:42:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 04:42:20 +0000
Received: from sunce-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 21 Jun
 2026 23:42:18 -0500
From: Ce Sun <cesun102@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <YiPeng.Chai@amd.com>, <Tao.Zhou1@amd.com>, "Ce
 Sun" <cesun102@amd.com>
Subject: [PATCH v1 09/48] drm/amdgpu: retire sdma v4.4.2 ACA support
Date: Mon, 22 Jun 2026 12:39:58 +0800
Message-ID: <f73e99fd41726262f62542ce89f12f9fe6c22e5f.1782103073.git.cesun102@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1782103073.git.cesun102@amd.com>
References: <cover.1782103073.git.cesun102@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|DM3PR12MB9325:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f76d1ec-e73a-48c0-7688-08ded018a533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: JA9ItiPUi7KvFQtgX5pAv1QTmvrGNyJ6T9n2ZDBAEmi6TLCrky7zV7j8sgwZ9lxudZofSypthgDAuTvCr7wmxSr/JFlhOUslOQ3WGyX7tJ5AOqStc/wtdHi/sBhP5/zwwEtJfy5vxcCAzOLUdXLplAAoCRTap4CP0segY/DslpoqlWvTFoH48e8kN7HqGvebYplIVGpW35+IvISspTj85mokVcrcej2TMNt0C0ZfINPlUDtvKCqQ+7vQlG9icubF0GaG80vgpESOsYVoYcYn6lr5QXtlMVIhi5z2tL0zABhyFVgvEFwLUtzeUa6Wsgyyy4NmGUVQe1T/mqFsHxe6uSts82b4gjOFORrTWT0AQpYjGIdtRBoq8vTpmVrRSl7yndv7Byy6uF85fEclHe7DeItRlPVlKp3Wwkah52PbSHRKZNT5l+4UsMV5ClUChPvINgAz3qv+/7JEaH9Z/pAFMf3EIfTWfuIFetXpehxfFLsmpDR1zY2yljTF8/QqIEXWnZpG02BiPBPpATy6iOhMdMNy6AR//1vaM/cDT8hpYLULvUepqnsHQpawsT+AUj/L8f0lueLKq/0ZJgF6jUn5dU5/4ZiZdfdLRJD3/KISV5HEnrf+xB33hUsCPNMoqgrTRQgblpd0Hjr9RTD/MxmiK55duSHEu+gIhYRWTOJ1Ubt8bT5lMkjS3uetMmOhSzlARL2Y1NauddSpcEOxp50JJA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0xU1VwEowEMuCndoJ4SCWI2J1HzS95W3AWMKGBzjtAIdhKOFIQLgARQliKKkfYqnTmD1fCN820CZmjSCaWykrhkIppcJc+yyk+Hikbd0iyC8BWvsLCV3zbOwJt9utOCmv4UcfNLVJNncvoa/g7WReLY5YgOkiTrwsmFkLsDw4iJnym1Twk8HXDDfIgndoNTPw6Yel+Q/oXC86JgoZIfbyN1/FHRBZJY4gLtkN/sZvWBPQYxOXcTht9gNYoHUVBv21Y+kyPGNbkaie2GcA+6+ua48Kb6o09tunwTeqp2bs+WdKk/LUt9vqRaW4WddkzIj0NcM7Dn+MI8gNoFy1CMPkoZ/ipFTxnT45b1cJy3fd483M5pzBflWFHWYZ/KecrvyE9iQYPUFqMVXtAaQP+g6T6vxA1YJkYpkyS99L1mY88CICR7YxxQK0uFWq+UJEMFL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 04:42:20.2170 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f76d1ec-e73a-48c0-7688-08ded018a533
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9325
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[cesun102@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7B4D6AC91A

retire sdma v4.4.2 ACA support

Signed-off-by: Ce Sun <cesun102@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 78 ------------------------
 1 file changed, 78 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index a7685b516f19..0d7e22060a92 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -95,8 +95,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_4_4_2[] = {
 	SOC15_REG_ENTRY_STR(GC, 0, regSDMA_VM_CNTL)
 };
 
-#define mmSMNAID_AID0_MCA_SMU 0x03b30400
-
 #define WREG32_SDMA(instance, offset, value) \
 	WREG32(sdma_v4_4_2_get_reg_offset(adev, (instance), (offset)), value)
 #define RREG32_SDMA(instance, offset) \
@@ -2520,85 +2518,9 @@ static const struct amdgpu_ras_block_hw_ops sdma_v4_4_2_ras_hw_ops = {
 	.reset_ras_error_count = sdma_v4_4_2_reset_ras_error_count,
 };
 
-static int sdma_v4_4_2_aca_bank_parser(struct aca_handle *handle, struct aca_bank *bank,
-				       enum aca_smu_type type, void *data)
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
-/* CODE_SDMA0 - CODE_SDMA4, reference to smu driver if header file */
-static int sdma_v4_4_2_err_codes[] = { 33, 34, 35, 36 };
-
-static bool sdma_v4_4_2_aca_bank_is_valid(struct aca_handle *handle, struct aca_bank *bank,
-					  enum aca_smu_type type, void *data)
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
-				       sdma_v4_4_2_err_codes,
-				       ARRAY_SIZE(sdma_v4_4_2_err_codes)))
-		return false;
-
-	return true;
-}
-
-static const struct aca_bank_ops sdma_v4_4_2_aca_bank_ops = {
-	.aca_bank_parser = sdma_v4_4_2_aca_bank_parser,
-	.aca_bank_is_valid = sdma_v4_4_2_aca_bank_is_valid,
-};
-
-static const struct aca_info sdma_v4_4_2_aca_info = {
-	.hwip = ACA_HWIP_TYPE_SMU,
-	.mask = ACA_ERROR_UE_MASK,
-	.bank_ops = &sdma_v4_4_2_aca_bank_ops,
-};
-
-static int sdma_v4_4_2_ras_late_init(struct amdgpu_device *adev, struct ras_common_if *ras_block)
-{
-	int r;
-
-	r = amdgpu_sdma_ras_late_init(adev, ras_block);
-	if (r)
-		return r;
-
-	return amdgpu_ras_bind_aca(adev, AMDGPU_RAS_BLOCK__SDMA,
-				   &sdma_v4_4_2_aca_info, NULL);
-}
-
 static struct amdgpu_sdma_ras sdma_v4_4_2_ras = {
 	.ras_block = {
 		.hw_ops = &sdma_v4_4_2_ras_hw_ops,
-		.ras_late_init = sdma_v4_4_2_ras_late_init,
 	},
 };
 
-- 
2.34.1

