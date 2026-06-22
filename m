Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bwS9Byq9OGouhQcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 06:42:18 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1776AC902
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 06:42:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Jo4ZBImt;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C174310E45E;
	Mon, 22 Jun 2026 04:42:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010049.outbound.protection.outlook.com [52.101.201.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A7A10E45E
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 04:42:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cEBb8xdNLSC7AN+ekBHMipbo5JIDS+Hjm0+YpDFnba4FSLXqiqrYLeiZ2YDEsRQZtUdbCBUm3D7CKPap1l/djFgHvHWnqd38dj46vfqFx3SBJ43VggoOTDv0FWpBg0sUASVWaaCzOhCFVr0sVtwtYHhnhl1gL0sBQv+HRM73wrhrMDraDrdVTU8+kB5IDNEeOc7O8Z986mogFuDrx2E/4UOYkBjLj9LGk1b9PHm8O8vwEMREofqVGfo4SJG767B2fhz/yVzEiFd1GZFe3NNgT+5egsXEb0n/f/Kjn/fHnZvPnC2JGIg/TsZ/RZYCIDkm+kx4le8fKpBRLww3zBNXcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0d32WSbPjKrt/6GgkfFxDGqIfuAibukozeMLbrOW7k=;
 b=A+iODslgpFL7jDxAuWqRSK9VO3lxqfnVlAZfONmfwmO3z6rZhjkyfoIrrnazg7Izc/YN2fyl3miFPdPQPjVXHj8plR2zc3SAgil+wWm9qTd3fxcSmLZppyqz2x7hUAsZOsfGOG+f0+BCRv9sKg+y0meQ7FJXOPCmuEEHrjXFfdgK7Ngy93OqaclpEyTEj1AzWRrO4yjujfMtBONPSwNMaTdDdTDqZ0UEyeU6+9oK3QDT6gcLy5vFVg1+KVeHKE3pZEAebBfbDYfaruPBS7hUr+b/0ceIEBz7A21u4qa8qqaQIcNnZwn/lXcg3LC2ZzF1dnhIrv0UC8HOsLslDur7IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0d32WSbPjKrt/6GgkfFxDGqIfuAibukozeMLbrOW7k=;
 b=Jo4ZBImt68W0bW+hQ1RnQyxxa41YGiUNm7x0jFo6YvLS2cQqilj42rvlSA3UHUp1grYkncsk6wHP1MFboPsBBviMb6wNQ3pLTJaS0WC4akq6JHAT9WtJFwCQKdhMtq/raBPgIm+8kDh8QjQYViY5isX1rl9phJecO6YihqzgRmI=
Received: from MN2PR08CA0023.namprd08.prod.outlook.com (2603:10b6:208:239::28)
 by MW6PR12MB7085.namprd12.prod.outlook.com (2603:10b6:303:238::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Mon, 22 Jun
 2026 04:42:11 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::6c) by MN2PR08CA0023.outlook.office365.com
 (2603:10b6:208:239::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.19 via Frontend Transport; Mon,
 22 Jun 2026 04:42:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 04:42:11 +0000
Received: from sunce-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 21 Jun
 2026 23:42:09 -0500
From: Ce Sun <cesun102@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <YiPeng.Chai@amd.com>, <Tao.Zhou1@amd.com>, "Ce
 Sun" <cesun102@amd.com>
Subject: [PATCH v1 04/48] drm/amdgpu: retire ACA support for vcn v5.0.1
Date: Mon, 22 Jun 2026 12:39:53 +0800
Message-ID: <2017f7b1efaddeca62dbfe2aadb32926fe39232e.1782103073.git.cesun102@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|MW6PR12MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: ed311254-0f4e-4487-7ec4-08ded0189fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: GWHXpEgj0HKC7oKhzmagdpHIPNSK8OXOhdM53R/fM6wliRIvZR4niC89/0LDewHEo2xmR9Yq2iixln451f1Uot8l0D4f38ecaZHVd+G9HVhCpItnsdx/2p4zl/u/bIDsQo1nK6TqeonSKicjnVtvbBF3zlm0QHdKnVIa01Ah4wKrRKatpFAGLbPiITZj40rgJTBx69XtNqKTATqsyzSXWbV1M2BiXX1/lWQULqJ3/bn6S0nc883dwARBFHUe8Ha7uTEPr0JZtKBqxHtlRp+xwJFAv9T9CiDwvMkZkJFbaV2mjjsyBMi4ZeH6BuR0ylH7wgiJ2g0IAPETgFBTMkNAEPb6c5Q8npwgzEBmmayz6FP+npvuxUZ12VVT4k9uEGnxQjJdpru2fyRekFx++z6p+9gkRFvOZJh0wdNT+u68ygSKwLWjMr0oIoldtublN5CokFofIzhbqrTKzOpo6gdkCD2DJu9R8g5W3Ekm+IbGqZBTjKN99WQVPpioepqlTTU6B8fJkeOTDxiCKdmStXpZrmPulTvrU0xxPTfVDXpyh5nKFz+f0tVUZBbnzEv9XVh61XEA8JFecxR2HXgAf85apGsGhlkMm8+UEAvWFF0DPlI0GinZwINaI/eIOk/rOI0V4ObzDvo7R5d6ViEzjOJBIQNy3qotvGECjHKN5InGtMsjK/J0ogTotmP3tLejC7+g4y04JiigdAAjN5E+nI+Juw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Jl7N8pgw3Ge5fEBE5g4/yXlbO3JJ3frKgW+QhBQY/HiSjR3/FBl+LjcCYQFJEqSRSMLIL9kYlVV5U4p6+rgpPeSavmwI5q027yX7IswT1Xz2qPdln4ReRM6g0dicHoy3hFQv7aAMWQvhXyruAtQ/xQwDkgmRZX08lgHFnKnj1QCW3gRPd4nl+WakC3WRC+lH6C0y4z93q1nEa4FHQAkaTCYBzhe8tDi1qubde9TX+zesar2YxHhlyfVmNpFb2oLKrQ6XKrS5hM0Y4GU4IpuDdhagG6XeF6f/yMkITeJxiEg4ACFStki0mzIVq8fJneBfu4hgYbmt8gXKm2Mdux7U3HyXxBca4a2Y2Xd3y+ITzoAgjcFYgYA3cdvs9xXS6dg5gsxUa8OG9HqW0RZDy85R/Uab+uOyit9oBcDvFcWCw1xppC2y6IMYUxfsj8rvkRg5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 04:42:11.1552 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed311254-0f4e-4487-7ec4-08ded0189fcb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7085
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
X-Rspamd-Queue-Id: 3E1776AC902

Retire ACA support for vcn v5.0.1

Signed-off-by: Ce Sun <cesun102@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c | 94 -------------------------
 1 file changed, 94 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
index 9c23055cf5ce..0a3c9c59fb19 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
@@ -1727,103 +1727,9 @@ static const struct amdgpu_ras_block_hw_ops vcn_v5_0_1_ras_hw_ops = {
 	.query_poison_status = vcn_v5_0_1_query_poison_status,
 };
 
-static int vcn_v5_0_1_aca_bank_parser(struct aca_handle *handle, struct aca_bank *bank,
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
-static int vcn_v5_0_1_err_codes[] = {
-	14, 15, 47, /* VCN [D|V|S] */
-};
-
-static bool vcn_v5_0_1_aca_bank_is_valid(struct aca_handle *handle, struct aca_bank *bank,
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
-				       vcn_v5_0_1_err_codes,
-				       ARRAY_SIZE(vcn_v5_0_1_err_codes)))
-		return false;
-
-	return true;
-}
-
-static const struct aca_bank_ops vcn_v5_0_1_aca_bank_ops = {
-	.aca_bank_parser = vcn_v5_0_1_aca_bank_parser,
-	.aca_bank_is_valid = vcn_v5_0_1_aca_bank_is_valid,
-};
-
-static const struct aca_info vcn_v5_0_1_aca_info = {
-	.hwip = ACA_HWIP_TYPE_SMU,
-	.mask = ACA_ERROR_UE_MASK,
-	.bank_ops = &vcn_v5_0_1_aca_bank_ops,
-};
-
-static int vcn_v5_0_1_ras_late_init(struct amdgpu_device *adev, struct ras_common_if *ras_block)
-{
-	int r;
-
-	r = amdgpu_ras_block_late_init(adev, ras_block);
-	if (r)
-		return r;
-
-	r = amdgpu_ras_bind_aca(adev, AMDGPU_RAS_BLOCK__VCN,
-				&vcn_v5_0_1_aca_info, NULL);
-	if (r)
-		goto late_fini;
-
-	if (amdgpu_ras_is_supported(adev, ras_block->block) &&
-		adev->vcn.inst->ras_poison_irq.funcs) {
-		r = amdgpu_irq_get(adev, &adev->vcn.inst->ras_poison_irq, 0);
-		if (r)
-			goto late_fini;
-	}
-
-	return 0;
-
-late_fini:
-	amdgpu_ras_block_late_fini(adev, ras_block);
-
-	return r;
-}
-
 static struct amdgpu_vcn_ras vcn_v5_0_1_ras = {
 	.ras_block = {
 		.hw_ops = &vcn_v5_0_1_ras_hw_ops,
-		.ras_late_init = vcn_v5_0_1_ras_late_init,
 	},
 };
 
-- 
2.34.1

