Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EUwMFf5uWlfQAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Mar 2026 02:01:11 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701292B4C22
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Mar 2026 02:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E2510E5AC;
	Wed, 18 Mar 2026 01:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u0aBfqan";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010069.outbound.protection.outlook.com
 [52.101.193.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0226510E5AC
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Mar 2026 01:01:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQHvZzWcKqneoWILyCsYSKqV0yXmwmbmCVI/lbZ2oJwBmrwHW2yfQAiQ8hubp9RYVsIopbqFc0BSDN/2n2WwPImcJud4Ujs4H/LLJjp9bIN5ryw4wHOfem6AYM8e1od9EFJfg6kZyQsToOAS8aOSY5aahJky0zg/gq8L++hkUHGLQymdFxkMxGFXJqyA573Z6IrQJb6QhpopiqaR33mNDv1WZTA0pNB9ocOgdEVgH75iyvrE6+CWG6FR5TrqrdYR6rYTfiJEQ0JH/CdBxS0ZGPeB/k2JQF71/ZoLeCiMHS9ggAaEWOHBcwko4Kqd6+sdV/TFVP/W/pUsoZU3qD77fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arEitOjt9j3Yy63IxGKyAV5/tj8/7uSL/1RZF39UmA4=;
 b=veCrtcFDtqMc4+PXE+NMd1JzCqQs4F97ke0mmm8HM2VW7JZuL+Zwf/nFJ07a8HftwJYmPBUDhYla+Yz2gmsUhlIx5/uusNv5D/B03oC3Blk0nnS7LggOxwVkTlBQTIIa8NPTDtizZ7mCHSVMF/e3uJmubmHT563Fj/in/2Co+JFntoGGkPGU4LGIMkQBCFNJSeU9vH+I9w7aFeoSvPDXjqPiuJkztUO0v0uf4jjY3GNQSWfF+WJ+O3scoDQzG4z/cQhIgH1sH4Frb1USu4ok/HSCHM5INAQtgaqbGoMRgzpaxoECG2RqjAwbt7mps7Dv2M9neA2Cu+z0J9V6UfEJDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arEitOjt9j3Yy63IxGKyAV5/tj8/7uSL/1RZF39UmA4=;
 b=u0aBfqanviii4RO2Q4WxPaHhmyqSl2xwlc7IDECf9nKfYMpfkXgnxinVLhO1ZWTjWQrN0n3SBu+umYSQA8MJVgb0LRELLm5Ok3YuY4mGLCg74BMctzN9QxLkXTDZ+oEgW8o8VdPuKieJu1+OL/nkIrQPLP2bRoFJUkMKejhyCJU=
Received: from PH8P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::33)
 by CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 01:01:04 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:510:2d7:cafe::7b) by PH8P222CA0022.outlook.office365.com
 (2603:10b6:510:2d7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Wed,
 18 Mar 2026 01:01:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Wed, 18 Mar 2026 01:01:03 +0000
Received: from maxMSI.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 20:00:59 -0500
From: ChuanYu Tseng <ChuanYu.Tseng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, Meenakshikumar Somasundaram
 <meenakshikumar.somasundaram@amd.com>, Ovidiu Bunea <ovidiu.bunea@amd.com>,
 Chuanyu Tseng <Chuanyu.Tseng@amd.com>
Subject: [PATCH 01/31] drm/amd/display: Update dpia supported configuration
Date: Wed, 18 Mar 2026 08:59:10 +0800
Message-ID: <20260318010224.513094-2-ChuanYu.Tseng@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318010224.513094-1-ChuanYu.Tseng@amd.com>
References: <20260318010224.513094-1-ChuanYu.Tseng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|CH2PR12MB4262:EE_
X-MS-Office365-Filtering-Correlation-Id: 215c816e-6506-45bb-fbe2-08de8489d423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: i9QYIBJ4Nph865Mf1VJeqT9eB6+ADRk+nVY7K1XZXNzYxjajxPV+WTPCPR2f0P/2uaH/pvoEy64jHJiszMoDHt5B8nLXU2d+N7p5ZezxKAICEfhSBtG97TjRH55o9uTyQKhh6M9GyJjwzUybkhniXKznIEyJ4gIFL9gM6ap1Ax7hCecvL2X4w6qjo1rMfB4CrfpLo/2Xkdob+yfmNeHWz/f7wcEyaTKOmIjFaqNLzvK/VzHArtT6KuUXCS6sfvVGJXUnxHTdpVW1SdnKmeZPcME4vnguUrhQmx9hknMT3/3YIwhdJ7B8amZqXuWOGK2Mtcm1pCLe5zwIxxbh0WZlDyj6ypTzLIzbhAFEuG/+VbsLSLShrWagIuyw9Es6xlsxG4Jt+CNe4x3Z8tW1rqn30lukRy3uTuRC4dvyupIbxs+EBeAZ3kyZ8fks5J7v4spDfsVF+WLIud9R0REBhdCQuFEMkF2RVYKhuXM56i9lL1VCpzu5dqepSy0Cy8YHNBJGLM2YHKzE8tXEtboUGQ98G5eJgOSiVLI8pd0f14SAYT+7jcxH7P+jEF1vBCFQ0KDOUYa3UGAxI/0LSdKJlhLG/lKX2Viea4TTyEv6mTnlLGbCxJcGA7pa/5zPDxRksJ7rYt5+trjaL49AjcqrvXjQIw+OBN7EcorYR/q20jNXWxocwTm2ZaIfXoG8qhLu4VTTt/2mSuT0Ww+jf+xWwvJW1Xp5aG3GJTyclN7KKjNWY4s4a5Peln6LgpbnWZX/EFz4taleqVHfkNp7/x2PpfGDLQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6uhTA+7dt4P6u20aMJmEuB/gVORnEh1R10Hsow1V/wZW0PTBI+BiyZuurr1Gc5cNEOzG06HTrLrWWegH+D1UoXAwHtzYqraBleI77uyV2q8+HJtgrLrBv9aK5kXIYKAaOf8OU/C86qdvG8+JaJnSSPL8O4Zu65uVsrMLuMXQ95XknQWe7KAboZ+Ph0fl5xqmiETfyinA8ZvuOHkyPNsog2bzW/7ubYI6H16f+3zrLqT+KCA43yHqnzWKlBaWGgkApfV3IdXQHYxiXkTmEfvWZEBFthN4YeZPqXjl0kWEVZJDJ1Jq94jMYE9LOA3XMkh5xqcuAlhFdOme7y/yGdI/PXAEGfWGvZbfZrEgqNnFtLuYIMMUk3F3AJFsmQRx3BJjJQMJQygLpr5lW/mp5sZ3aP25Ap5retY3IxO9MTdXLStuOVTzygonf5gtPsJXi8uV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 01:01:03.6181 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 215c816e-6506-45bb-fbe2-08de8489d423
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4262
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ChuanYu.Tseng@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 701292B4C22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>

[Why & How]
Init a flag to track if dpia enabled previously
and update that to boot options.

Reviewed-by: Ovidiu Bunea <ovidiu.bunea@amd.com>
Signed-off-by: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
Signed-off-by: Chuanyu Tseng <Chuanyu.Tseng@amd.com>
---
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn42.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn42.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn42.c
index 4d274b7034e8..7833a4fb7fbf 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn42.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn42.c
@@ -39,13 +39,14 @@ void dmub_srv_dcn42_regs_init(struct dmub_srv *dmub, struct dc_context *ctx)
 void dmub_dcn42_enable_dmub_boot_options(struct dmub_srv *dmub, const struct dmub_srv_hw_params *params)
 {
 	union dmub_fw_boot_options boot_options = {0};
-	union dmub_fw_boot_options cur_boot_options = {0};
 
-	cur_boot_options = dmub_dcn42_get_fw_boot_option(dmub);
+	if (!dmub->dpia_supported) {
+		dmub->dpia_supported = dmub_dcn42_get_fw_boot_option(dmub).bits.enable_dpia;
+	}
 
 	boot_options.bits.z10_disable = params->disable_z10;
 	boot_options.bits.dpia_supported = params->dpia_supported;
-	boot_options.bits.enable_dpia = cur_boot_options.bits.enable_dpia && !params->disable_dpia;
+	boot_options.bits.enable_dpia = dmub->dpia_supported && !params->disable_dpia;
 	boot_options.bits.usb4_cm_version = params->usb4_cm_version;
 	boot_options.bits.dpia_hpd_int_enable_supported = params->dpia_hpd_int_enable_supported;
 	boot_options.bits.power_optimization = params->power_optimization;
-- 
2.43.0

