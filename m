Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f1HMIWUeTWqPvQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 17:42:29 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44471D66A
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 17:42:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=wN6zmpTU;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A62710EE17;
	Tue,  7 Jul 2026 15:42:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013015.outbound.protection.outlook.com
 [40.107.201.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF7410EE0D
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jul 2026 15:42:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecK6lgHZ8BlSzkuQSPNv/OclSEbOFfNZM2bVDag0SCmbhbjaWn/QBzFr2yggvX0WWYQb7wHAByf+XOe6+JO6Xdckyi4/7jpVBSEUn65teMUrP0GsQPAhkSx2UBI/Qb2vkmL7V07buCKm5SH/FSGLaGVF+rLeaVSn/98LZV4ULt/UraAx63Op//mUQtkoHSZygPtqZSbIBukwqHl7haaye1V7sNW+uxFzY/O4OkrWPYpgeKndChBpd/gB4NWECTcYWKF/V4kK7iIidgrITSHpvt1VjO0x4L+49wP9kUMXseFcf7aiFCaz87iq72bziTRuY2VrgauPoT71EX+kmRkkJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOIi+tqZ1ttyUdj8GrU6zzlvvkGq8tn+dHC7VvCGfLo=;
 b=bSwWflVFIMVCzNfiLFFHv4vAwB3Lt7BlUI2b7czAylHXncPbWwmkTrT0J6D0BXOmSaN9ITt/m5CsKMT2W4rs0V4hZbvJ7BIoBieRA3deP5PtRI3ewpioGsyqw1TYo29DRJBhmoQAtvUPZbjFy24F12pllXKUGWTmiIGX0yU0BV8Wk6XpLSvJ/feTJIKZYemISGNZzmZvqeCq2/Blxv409SLD8VCWljr09mbAj8ur1h33QAPwl2VW4IMjhpHjkvjdp/8T7yUhis4LrX+viAuBRIGxf3S4MYYF8fpup2Jo2rPI1MJI4Ms/yiCauksVDw9DHiePHDOTZOwO3skF6JtBuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOIi+tqZ1ttyUdj8GrU6zzlvvkGq8tn+dHC7VvCGfLo=;
 b=wN6zmpTUHbc93tPAvwvi/h7Q+CcPSWtvdHHamiagxbVRcUGlZ8cqxy4L+Rq/+jyxRoe9raaXkXk04qCzqh79bjwolIee7fpTR/f26FM5RKGOuDQ3E5kKqi+i0YJRThG4aHM53EQZkpoICFtx8lJ4VTwIPmmJpk3mUojC9wmFTmA=
Received: from BN8PR04CA0059.namprd04.prod.outlook.com (2603:10b6:408:d4::33)
 by SJ0PR12MB7083.namprd12.prod.outlook.com (2603:10b6:a03:4ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 15:42:16 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:408:d4:cafe::19) by BN8PR04CA0059.outlook.office365.com
 (2603:10b6:408:d4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 15:42:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 15:42:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 10:42:14 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 08:42:14 -0700
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 7 Jul 2026 10:42:13 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 02/30] drm/amdgpu/gfx11: WARN() rather than BUG() for invalid
 SDMA engine
Date: Tue, 7 Jul 2026 11:41:35 -0400
Message-ID: <20260707154203.2603209-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260707154203.2603209-1-alexander.deucher@amd.com>
References: <20260707154203.2603209-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|SJ0PR12MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: 571cde44-f980-48a2-6cf3-08dedc3e528a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Hg/xHwwBl7o1G3iZXuhd8dMJ/HXKHAV3a7V2OSKda5VINC/9DZgDztgzy8XW8wWMfWDee88H9UfdJ+9It5HnWYHHswLYS0dXgaSPydo9xDZ96ZkbIkd1KuD3hXywz1Jsxz5uYAB+ypGB+NU1PJ0qmBzuT4oYoUjT6unrPSWrFrBPmIb0kZTsNQOIjzJXsPgceUiOiKD2943VawA/RDqbbnQgO9bmy/QUEs67m/WKSZei5k2u879XQhB2iol+L62DgV7/iVhUASE3kOsJqIzTbk+BzJdP86/gtz0TiAfod5lbXG00/KEhk1YtERox8dNDgboA5Axp78U58VGpxLxeQNnjY2zH/pUjKzRkcB8kOMsm07Pwofh7ys9GRCGmxH0L7Jet7F4W8u6tRxH2MUsoQ9s7bDQtaLGuq71UB6PqJkwZQ/+A5hqr2pVgdGkVW3Qt9KxPyHOcNDBXH0u7zIy8tupSZuVI5pqSfIzZOvdgeR0syz7ImxMtjtyox0YXaHPGBWbJcjLuHqAuFLloreFYogoU+sQ6+Fzx9VZy0V8fsYajUsVK4Q+fCtW2ZFD4sdD1XgYuYERKags9WY9V4X7WYDiTRF383kA9oOkvFg/o7V+PJEyGzm4bbi8wimVrdAO4PVeQxps18LrOOLMOBZtgkvHHuv5TPWfNkjSC8OQtRwxDDWm4bnb8mE/GyKqH7WruQV1MEeMdjhhEg40hihBv5Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /Q1FxO/cfd7VF5oKmYK0l6rFpRMPTr64A3mUMv56NOJ690IJC/QlEmzfSUwilsVqAkca5y38JWx/NNZ/uXiFqFHhhOHAWpyiXAoSWQ1k8R+537GkAFmZ6EnuDBiJUKSNf5m9R7bgPo9iXnkoZgEyiiFzY7uTfl6yWKNdAgEUZJ5jjFDOzBT3QPT3zmvWckKFO012p4CUwd2sfLh7/CIZzgMJ16Rc3YY9r0kLz1BPtkWEwqd1gheDM4Kn1OrrZhHLmlBcE7jvVvgK/WiWJMUPSVU5UfbJAgPX774L1/DPCu+fJGIWYSX083htAI/gi9tJjg6/FejJtiRzVrwBzFb2cBnG96grNdBRCX2fGcgM25nd7EBbbEzKdlugPweKqUz01mhBeYbCeT0ft9KYNdoYGT9cHwBh+HM/SxEoYwW752QNRz7jlFXz6WQRtop4QkMD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 15:42:16.3652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 571cde44-f980-48a2-6cf3-08dedc3e528a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7083
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F44471D66A

There's no need to crash the kernel for these cases.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
index aaccf0b9947d4..d32ea91eeb343 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -139,7 +139,8 @@ static uint32_t get_sdma_rlc_reg_offset(struct amdgpu_device *adev,
 				regSDMA1_QUEUE0_RB_CNTL) - regSDMA0_QUEUE0_RB_CNTL;
 		break;
 	default:
-		BUG();
+		WARN(1, "Invalid SDMA engine id %d\n", engine_id);
+		break;
 	}
 
 	sdma_rlc_reg_offset = sdma_engine_reg_base
-- 
2.55.0

