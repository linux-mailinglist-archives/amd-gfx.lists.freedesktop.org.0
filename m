Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3zFnJVSRMGr+UQUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 01:57:08 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4264568AB0A
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 01:57:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=xN++efDO;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E647210E6FB;
	Mon, 15 Jun 2026 23:57:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010016.outbound.protection.outlook.com [52.101.56.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA8110E68E
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 23:57:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUESLz6J4RarZsfG3joJc1L1BnJxAmeQv6CMWfHpLa/BU+/s0uiDuYVde3u04wPZ3Xxg9qc3P7bIJYaoiy3OGthqFRJCFmj6jow0uzPXVnorZxLjyBrqTgq7yePV00Gt96fJGHDD0LRk+qhIhRXuhLFkgSrDTBI5Pa+4hYM6S9pOY1AShuDoXgLl6zNE7mhHqZC0o4uMJCFZLHgDO0eaneJmYZtToPRTzry4Fvg4OFVPh/eCpTws0URcJKx4cT0NwZjAc7x83xQf8e1X4LKwsG64CtBr0zl4zx7tsyX2T/Em22hfOH8HqQtKR1I/1r303MaCP2o4LtnWFxoL4vXTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1voxGlpKvy+VmDzisB12v3d3nXISzL4WJfm3EFHilvU=;
 b=b7pA5T+YOnZiYE62oD8thePYdIZbVkEF+ojsD31wtQ19tRrJWxnUn84YcQ95f9jYJS/ZwcbNYQYWB7APhZN5zlaRoIXuCY5IwcPDKF5IuqLhKKzOzl1fU9I9LncYYOdN1cSvpC3GowX992+/rqWQAE9DK2BBUa56JYYB+AS6kUijv5RwLrc6GqUfjZm+bSZAgSp52KHgmW+dZYtzsnEP/hYdMHlP7nYk4nfaltYHwwY4bCvEJ3zYPUJda6Ipizriq/zOr05327V8lM3NRchVg3x62VmgpH+SlKchU9Oso9YGA035Ln8mQm8EQTwaDkCgpsvXP9hyzJvN5nWR0iCANg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1voxGlpKvy+VmDzisB12v3d3nXISzL4WJfm3EFHilvU=;
 b=xN++efDOUCtX8wcEukPTKtXIkCr3e/kwfcrCcW50FR+MtJ+o567Pei7TCkl4i431ABCkW1cjx1/TP8joc7vgAFa2hvHoOlAX1tFjdjP6ZeFHRxYfi6qPeTnl6BsvBkvTyAQKDcMR1gdAeniYNRoZaPly+f1KIO58k7zNmE9jCDc=
Received: from CY5PR22CA0049.namprd22.prod.outlook.com (2603:10b6:930:1d::14)
 by CY5PR12MB6276.namprd12.prod.outlook.com (2603:10b6:930:f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 23:56:57 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:930:1d:cafe::1) by CY5PR22CA0049.outlook.office365.com
 (2603:10b6:930:1d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 23:56:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 23:56:57 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 18:56:56 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 15 Jun 2026 18:56:56 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 08/43] drm/amdgpu/sdma4.4.2: replace BUG_ON() with WARN_ON()
Date: Mon, 15 Jun 2026 19:56:10 -0400
Message-ID: <20260615235645.737189-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615235645.737189-1-alexander.deucher@amd.com>
References: <20260615235645.737189-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|CY5PR12MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 979d5f3a-ef07-4635-592e-08decb39c8b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: VuVr2k56dyGZ5/fO2qQq8RvvN0jfVENy7JoBgnhMyBncVC2WQJewl2ZBRxjOrVb58uU66NViHKq4CW9JJhnmWZAlvFDb85nvKo0dH9tAJhZfTPBBVbio8TJj8nYGNvpU5mZVVhqhNunQRaO+J1s7U/PcRw81/iQGFiHgxit9nboiSm0jD0syh9PULb1i0I6tfWBGQUcfuHVPF+A4HfLtAY7yQtQP6AdXuYW4BoZR5Ru8kReuJ67cAAeaKrpdfMFYrwmSM3o9YW+ePZgEQ5yYghg2n7K/AusfWQ5EUH41kybZiSeiTR16ObnS6NqVPtu14PdgZb9SI90qalgLqWlmxXV8Q7cp36QQhtNnJ58JDeGvAkJR7bH4sa2323gr60Z5X7FdztngwS9TKx8pxhKzTr4qiNnhxecm8I5kBKzImrwNIlcVuE6fpfUAMEcSmlDBRPBJ1T/np4xSpsr8tb2PEuMBtSq7EIrJy8dM2Big/sygMsggIk0pKMMDqvp50g1egEr2KyVEqqGwZ+mIjR5LLCF4ExIqKvdP283HWzgtijp35Ew6V/VdCddoqSSPzS7wkb1TZ6eI1aKVo1YlWqu+6qPSA8exkStRYtamz2ryswa/JnXLMPhQqY7g15dMXciA6P4445LBzeeDCkFp6P9KiJA4hfbmkDfPTByAIPFzj23yzIyj+MjTeJGP+mwULhw+HG+Rc9ZJKoetguSOw50mJpadJuKf2vmOkZEu8N0lfoM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1vmrGR8z7S3PL0NiyESy7ZnTSqyAYbEg/tASJuyql2gWes+jITzXF1vibIuFWjHHdUI3234W47aoVBCySOa7+ezaHvARwGra6/lSzBfvrSBZAVmSSmkZsThsfM4DPFJDtChH6Us5Cs5OLn17qxB249SCy8a3g5mCuB4LFQJSIJYOlkQc9YMjafTHpdUgm21duniqzNiDob/8NkGRjEqm9slLqdpVLY0uUxmVg1QA+8V7+OxywsjfTala0u1pEyX+722JDdhWlNP29lgk6vBj4F9YWpgc9FqQLcl7cYJuNubKT81E6I1nP0mS9GW2gyN+Es9JPYhieECVjqnWrCG12ei8PSVrA64qrZ0qFOvjdvblaAId875dM7/k9pQhBd7DUeyHYCx8ObkPfPsVlah0C2ClaAMiW7bHjmlnwJuQXilq1dcVS5DGHuiWFYuVdzHE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 23:56:57.3545 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 979d5f3a-ef07-4635-592e-08decb39c8b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6276
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4264568AB0A

There's no need to crash the kernel for these cases.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index 88428b88e00fc..8652928861ad7 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -457,7 +457,7 @@ static void sdma_v4_4_2_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64
 	/* write the fence */
 	amdgpu_ring_write(ring, SDMA_PKT_HEADER_OP(SDMA_OP_FENCE));
 	/* zero in first two bits */
-	BUG_ON(addr & 0x3);
+	WARN_ON(addr & 0x3);
 	amdgpu_ring_write(ring, lower_32_bits(addr));
 	amdgpu_ring_write(ring, upper_32_bits(addr));
 	amdgpu_ring_write(ring, lower_32_bits(seq));
@@ -467,7 +467,7 @@ static void sdma_v4_4_2_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64
 		addr += 4;
 		amdgpu_ring_write(ring, SDMA_PKT_HEADER_OP(SDMA_OP_FENCE));
 		/* zero in first two bits */
-		BUG_ON(addr & 0x3);
+		WARN_ON(addr & 0x3);
 		amdgpu_ring_write(ring, lower_32_bits(addr));
 		amdgpu_ring_write(ring, upper_32_bits(addr));
 		amdgpu_ring_write(ring, upper_32_bits(seq));
-- 
2.54.0

