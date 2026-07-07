Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +4vBBWMeTWqHvQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 17:42:27 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D0571D65F
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 17:42:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=fv8vgTUZ;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C11310EE0A;
	Tue,  7 Jul 2026 15:42:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010038.outbound.protection.outlook.com [52.101.201.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABAB10EE07
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jul 2026 15:42:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdlRNZuUzLEUbeUngVpxVYXB1/fVrD37cJo83lbE4eps6BFVvZl/nTTB6qggpLO1yFcIJsBGfuY6wFUgLwBZUvD12v0xUOncJQhJGk1+LpFFv1SriRZQu8qi9jzxGDu082rzfZeirTNwJgQndUCop9GooZuID5puK22tfrHDUmRmucV/S6EFc5c4rEMXN5TmJJnerFBbHATX8cmfuqs0ATUoYU10v50RB5ddFCr+BqgyJK+m8WWDqqsoHuRmgQn/AzZEAnaI2DhUNPNlS9snH6dx1+EDUD7o52y1Z6lrovcev8aEUFaZKyWmMt5uq3vhDfTmKDZmnxgXpsMNMy+wdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbkyVymp6b2X8i3f0LGk46yo8IMZw5rKFPYS6Pt4fMg=;
 b=AXl2Zej6ZnJIA6m/MT9pOt8FFSFxBNjSmty1tI4SSy1hi67/SkLLiAxvev6mo24sYhEL5kBjzNE/2ARdWphIZ6ppmfC/gAZq9h7R6x7AcHfJILC0PtaTknHpJXWnt+UuKzogwouMJGstsiLu1DH8wHC5uyWuFXfz41pnuWPgW5AKl6cUi+f4C7wu8YGgSrPE6IQ2tJaRzCFM189YgidekAcSK5R48olUi7EtoVqeNqfeYHHdMtrh+/MGkpQU8e6xbPYM7EsdUibDVHjOabWYK8W2TH+S73Dtp01HAdrBzoN9U+0UioeL0MlcKIteLQKaVg29JU/9I5F/zVHAOl8mJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbkyVymp6b2X8i3f0LGk46yo8IMZw5rKFPYS6Pt4fMg=;
 b=fv8vgTUZ9jjun6e63/I/6zb/YoPbk+FKBPP55dtn6gvCRY09NvyB9B7KYLMYwtTToET4ysGzQiiiGSWsC59u5KMbQb2YVRWJQCbBL+yrNHzUoMw19493vCQCqS5UEyBwyMPtY2QqZU1Zy0AWMj5dFqt19SygTK0xFsjNUeZRuCs=
Received: from BL1PR13CA0089.namprd13.prod.outlook.com (2603:10b6:208:2b8::34)
 by DS4PR12MB9707.namprd12.prod.outlook.com (2603:10b6:8:278::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 15:42:19 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:2b8:cafe::a1) by BL1PR13CA0089.outlook.office365.com
 (2603:10b6:208:2b8::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 15:42:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 15:42:18 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 10:42:17 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 7 Jul 2026 10:42:17 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 07/30] drm/amdgpu/ucode: WARN() rather than BUG()
Date: Tue, 7 Jul 2026 11:41:40 -0400
Message-ID: <20260707154203.2603209-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260707154203.2603209-1-alexander.deucher@amd.com>
References: <20260707154203.2603209-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|DS4PR12MB9707:EE_
X-MS-Office365-Filtering-Correlation-Id: 988751ae-76bd-413e-8412-08dedc3e5414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0qsChxFWy0ORLhmW/4spcMcKyAHJIsdUK3WjJglN6yBmEdXpds+tQfppka2YRJ57oc/G0HWaAvxZelnBD+z2dwvCIWcNDpXHPKyLsX3IMrgU/s1mvm91alJ1CUY5RrJpthL5UIYgmCzt7eb5vP7XN1DGBy7S8kUExln3hsMDiag8+UlASIj7Z6QbQH35o388kxW+3AJxhgxWRwtn3uL2NXecVLnTMM6zOhMfzRo5T9EkEsUvqzOp5Y47Aawq4H3q/Zqq+EeEFlksnII94jNWw5tpCt8HIh+ykJrKXJO9UyDzB5rqPYbOvk8nerNXvOe6+B+MUy/s6xHpdJTQnxVyyXmnUro24vJP0facYF5HpKWSmaLkNuMz77oTO8T203ARn8pSU49fgJfLfkcm7Gicjo6QlNbcAE0ml2Wv2HEuHPIHMf5svh7nr4MGFbYOzeTUfJc0mvfzDovpWM+CYcYgeITz/7wVng/gb3nOzCqwGHt9bf+0xTwntIWe2GL7NIFdwhDjG9S31w/OQ8eSgy95KKa+FpoaWJWKlvQb809gpLIWZGPIXcuH++sUvH9JEWPPGwxGKKDZayA60KSFs/QQiU0kyGRALTu4x6no/KqMkedMZ09elXRDrhznbDp7R4ZolC6tQ+O5hRFiNvyS63SwSeoSRcR9q9OxsnxVcSrk269Zsch/pSj92vs6ridDEmqrZp5GleSfOIbnCyQ9jnldAQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3pos7lTIQAFinELmYQbqohCsnpYutz/LAlKIghcCTxIiNRD3IvKcYi2zjl/01kBhqTRwDOgIFyjrc5GbeAXy6cPXxorERGBXSt5SyxU5MTKSAkKQqIQTmYFGXBYVEp5S3o+GwlE9lKofW964rHzRSvLh5gcv6RRr518vIEvdtzyeEI/yRYY2gTt489y9AhYf9Ell7uPMhtJA5VNeHP83yrEq7wyXnwcvTS/X4MbZdaPoDQ0lHCPfOAxgBsv8TGg9YIxnRoKgpLjTcQb8jpVJ1QfQ0cLDL4XzMSlJUzWU9VlH46XGFWR1HNhhJW2ohcJew1OxbP5ezQmiWVYz/1B767QM89a80T4Bqoj0XnosXqE95Bobd+yCUQ0HsSqx25sbVNtDl9tcWpp06Ua0DA/82dmbSZSooAmIoBwEP/ayunSQE0PrLswlizOxjHqrS1UJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 15:42:18.9464 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 988751ae-76bd-413e-8412-08dedc3e5414
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9707
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
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2D0571D65F

There's no need to crash the kernel for this case.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index 6d9e96fabd581..4f1c711df5bd7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -1478,7 +1478,8 @@ void amdgpu_ucode_ip_version_decode(struct amdgpu_device *adev, int block_type,
 		ip_name = "isp";
 		break;
 	default:
-		BUG();
+		WARN(1, "invalid HWIP %d\n", block_type);
+		return;
 	}
 
 	maj = IP_VERSION_MAJ(version);
-- 
2.55.0

