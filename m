Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3rNHI2xNOWosqQcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 16:57:48 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392166B08AF
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 16:57:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=A8Rcvsl7;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE6410E741;
	Mon, 22 Jun 2026 14:57:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012019.outbound.protection.outlook.com [52.101.53.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FDE10E741
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 14:57:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNNr6DlyEPlbPmue3Ru0uEcCfzYya3VrSh8+x9dDyGl+8HJR4eynUCAJ7M33ZbgWkQMK6sInFl54ygNjhic+rVpMKRhzLPRhcuGxpRWfTe1PEUiwwDKLY6toJ7rfSm4fYB6fJIn6lx4FXjYb2G8ZXWjeK7JRS+Y6+kXA66YEFA7GoknjHvDXSvtWhtEeepgAmj+V3iTh6eWyHfjDd6ZVf6uSNuFz6REaHPxaWx7BALYkIrpvsZhVCOC7nTn803BE8J16ps33uL+9O7bRKFRQom4aQCSYef40v0juKi3pPXWCx8NquKz9fYSRWTvdzGcK2zsYAj38qQOy3LmHCOsFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wROyuS1yLcwVpzf/J+2Y2rjMHSwhL86ji/Hs3zOQkXI=;
 b=kfT8x5y4WDYTCimafjhLCZ6VRAk2O/G8SfnAKYQGAnNRGfkLFHLhubfls6z0RBZTi2roOgdFft/vUvQBtLVb7bfu7GMfTBXm0AB+gFc+K3FK1kTjv7VZFdlwGnFD1FXRsxMrh7BRUG29cIkkoebC4rvjb/YM9h8Nm7O69OV1zfXNa07XjSpc6yjAXJWS5JJWbGPPNhBA9aPySqmiqbISQNe57uzBuN2OhGkoR2TlfOWRgXhHQ7hjfS4MDFAwWZO5htIzpPC6CA4Oai92zLJVXc4eeY2UHndK+8/Q6KLF5+jInyS9GPAs4xHegKc2RRxt6nRIOpP5pvc8HQbCd2NJDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wROyuS1yLcwVpzf/J+2Y2rjMHSwhL86ji/Hs3zOQkXI=;
 b=A8Rcvsl7hlOsITYm695DqSPeBrpjUJ5CCdkjPjVX7ho/37nJSAlyst3MsXM9KSspy6/SHA+oOmjt5PAZL5V8eJ6z+NWt7eZNQpbju5oDPK8XzKgmPU/d/eIlx8Yb2lMnBhxaknnojJSgyA8Mmb9HwK1GuHAhAVMnt3mp1fhJPjI=
Received: from PH7P220CA0082.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::17)
 by IA1PR12MB6115.namprd12.prod.outlook.com (2603:10b6:208:3e9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 14:57:35 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::49) by PH7P220CA0082.outlook.office365.com
 (2603:10b6:510:32c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Mon,
 22 Jun 2026 14:57:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 14:57:35 +0000
Received: from mlse-blrlinux-ll.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 09:57:28 -0500
From: Lijo Lazar <lijo.lazar@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <Alexander.Deucher@amd.com>
Subject: [PATCH 5/5] drm/amdgpu: bounds check VBIOS build extraction
Date: Mon, 22 Jun 2026 20:27:06 +0530
Message-ID: <20260622145706.1382846-5-lijo.lazar@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260622145706.1382846-1-lijo.lazar@amd.com>
References: <20260622145706.1382846-1-lijo.lazar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|IA1PR12MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: b7aa4a02-dabc-4b53-48d7-08ded06e9870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: hXey6NR2PahNqenoNrzKz+nOYYdhJuawn0ex8aXuxExWz4pGmiLITSw3WxfrnvXrS5Iv7I9vSQ4+2rgvoBZeH7xf4vN0g9h5YbiQvqhEJ8SF++BIrloVlj9vvtV4K6psuk1Qhhdo2Qu+YErWGEgm0+fvG9+t4mVSB1Pt9lv5FwVqznKLGF9GfqSzLbbKN1oxzaQviuL3VT89gtWraI0udeZ2HQaQbgvVHVwApvlNcHtEM9VZkQksa6DsWqvLLaFYayAeKUu65w8QOYxLUjsbrj2b9QpX9YO6Erp3i8memIsnmBi/yY3zBf4I24VeAGQxL+lAMEZZfdvtBAT5wpPenQ0PoMgd+0C/odUHzFlY+xlekdHUEspOA7PnWA6LUySllFYkuTnG/IZEcUVC9+yOlB5qhXzVBTf94yddPB2MjprCxCe4Kmm8NK/LUdkyMwHJrE2Nw+aiaaRJOOGc9K5f/dW63yRbBEg7f2DXWGsRmnlG9IiZ5xTBrfT+xmKs5qiq/5DiodxPS9fuoJtBZSqQco+x0OPIBndq4w4P2LDTUiv4o+GpbXTt9raz5QbBOIXpXRFwSFRn6D+Dg2SqCxFUZ+DcJ8MTRrQmG9WEvTCwMJLCQxThXCGcRBb1mbuEkJPwAYVomXitic98B1q+cpMbWsPj/nORZkCi87qaXWB4TZ17GRRej+dIzrGq+U+tw6wTJj0jAHMxXDlT/E9yaOKMeg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Z5/YWnamJzyedCLfyM1pWujg3ZFJQoOqPVbOKdJu9zWhKOyl3ni5RhTEbEH5WYpKB83TK/XG8qF4WmbZx3uVjo/86ivTSefJ+woyG/4t3r0mJDld7gUSokjHqh5gpx6RtGspO1NzsS4NeR9yPD1NHgxeD8nQvwoAla7HgxR2XgGwl6kybrkZCYATlGb/rWKDOpL0XwCiT0GzBkcg5UlrDHbPWO6KPYgH+iALYLKr3Xdz/LQH1vCTfneGgOLzBTHLHYz5OSVtkOBJU/5fFhiN9Rs+lUYoOPGI2dDmV4Cslx/VuXe0ooN7U+rpN5E4fSj7NTQtgT1/8rfaDJFVcdhrUcfI38quV5kB6oFEwelV8K7Vv6ehKzWfyh8b3XUSsfkP4pnsS8qakUX22Ulc2bZZMWGM057V2XfMXw7rm0LLAgXpelqzFD3/KFZ54JTXrRQs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 14:57:35.4793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7aa4a02-dabc-4b53-48d7-08ded06e9870
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6115
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
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
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 392166B08AF

Bound atom_get_vbios_build() by the BIOS size to avoid out-of-bounds
reads.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index 0f6def9c3318..21ca934af26e 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -1568,6 +1568,10 @@ static void atom_get_vbios_build(struct atom_context *ctx)
 	uint16_t base, len;
 
 	base = CU16(ATOM_ROM_TABLE_PTR);
+
+	if (base + ATOM_ROM_CFG_PTR + 1 >= ctx->bios_size)
+		return;
+
 	atom_rom_hdr = CSTR(base);
 
 	str = CSTR(CU16(base + ATOM_ROM_CFG_PTR));
-- 
2.49.0

