Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEcqJuOLuWnkJwIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Mar 2026 18:14:11 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E38852AF277
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Mar 2026 18:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818D010E3FB;
	Tue, 17 Mar 2026 17:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XMhmtKSZ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012068.outbound.protection.outlook.com [52.101.53.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4C510E3FB
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Mar 2026 17:09:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfRA9MErMaKXI7Ni63pEnUBUP0yXOrW1IKP1occbsF5jVWbJaCyQunsQoSYkh0Mue9YbVW8Jvqn/i6ZujgLwdPGbu9EZUdMZs7hvDiKhpenV3btnTpPXIgrvIZzuWlRNmQn8+B02AbCsMaXe6k5tEeYCTKGr/nVI7f2RjEStwt+JDKtE2vhib8XdGtroqj2vfosMitV99ebTI27KdPn0os+UkXmheS9oEKbUxHD2HkxtOzZPhvJHY+8fFcev6KIEN9OP7eh8lpFI6aS+hj09Fq7uwrSaTEh4Ct3+PEleYFB2wVb1uJknQ5hm5QaZw/jvj8D/uPCeRlfpWXq92p54Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWa+L5LSQrWILxofy+QMVgxZGydrZKehVp9IyhHefD0=;
 b=s5oBodM6uFRF1nQIMYeJM716X9Gz+CKnBCDZxJgZxw01c6F8zKZKTZcke0ShaZR9ELDaPYR3bLT4FAMLl5kXtveYyaAwPFKHPhFsi1/C8CSf9PLMnzy4SEC7HkHLlP03tGHXjm5sJXKUqlQAGbhJljn90n1EI48yP8EfT4S/lDlGXLzoSbi4JPqzETbskTlpTqukBjouVkRB7DjLzTZ80lAaE3bjjpf1ciZwoiRPuTW7ZekgWHIv7FWr82p+tuCHbyZA4kHc1BATqSHo/UM+PENfkkC8EVr2P/lFoQajvM5NdTVDgkoJu/1JAzMMsQ6kptTjFWVHMu4y711UMEKhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWa+L5LSQrWILxofy+QMVgxZGydrZKehVp9IyhHefD0=;
 b=XMhmtKSZoZ+As1+tkRNoyIFPz2ntgJtWT65Ne6PTa84dDv3gzP66J8ednlYpboLSZx2rdIBTnV/wQW0BVWDZz4FsK4P0r78ml6WH76o3mMhgH1rSYBfFerJmiQ+I5CYajx6WpuTZGQXnmxDCoAGAE683ItLe+W8pt2LuvfaWauI=
Received: from BL0PR0102CA0064.prod.exchangelabs.com (2603:10b6:208:25::41) by
 SJ5PPF28EF61683.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Tue, 17 Mar
 2026 17:08:59 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:25:cafe::aa) by BL0PR0102CA0064.outlook.office365.com
 (2603:10b6:208:25::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 17:08:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 17:08:58 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 12:08:57 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 10:08:57 -0700
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 12:08:57 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH] Revert "drm/amd/display: Add NV12/P010 formats to primary
 plane"
Date: Tue, 17 Mar 2026 13:08:51 -0400
Message-ID: <20260317170851.296517-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|SJ5PPF28EF61683:EE_
X-MS-Office365-Filtering-Correlation-Id: ac0c2b29-e532-47e2-c5d4-08de8447e0d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: EEo7rSaXpDtWkoXUI+INGafJ/jcf0cer1+Zx+919U17mnVIt2nkCKco5vS7X4iwnMBqQOLkUZl1eEGbn9aZZmlKrcfBmxukjuo68uD08E0ioVedEWNmDmyD8FT6uIz1T0/9zsjtbwbcMG18PzRYnrNwwoNoN8tDc2tugHlKJHg/DG4F8GZSCCUsJauIp/0Nv0E0eqmOTcLT9W3W/jtBuIgMklZXzTdfNh1hvIkx+C33KdeWgsviY8HID4BkY8zeHD3ot+ANeGsfVKNS0I4you8RR8GpOrlYiyLBKneX1G7dTyIAOzfkmAsPH/Ra4p00Ik48BVTcXlRmEdKfVoBBa0ob/6ALRNA+eD9gHmT5GHNgWfFGaIJUWg3qiWDNYLvZFMA766tSQezH1a2MUg8u1dGtV4CK3IwlCI+VQH6ksRCTLCmUvpn3FcVliGDYEdV7dD2SdG+r25HgoEl/3kmFp8CEYWqZOjNW0ZDyu+FmV7Loac12P4IajrO0VzFFN62kVlnlEnOHPhzlRIyX3NRYMWlHZ3T/yB8SXky8FtpmlZdjYSxkcGaoWPf/AyiwEAiIIL7H52qB8nObBHY0PNFaG3jRy2ZsjqhZyvmmpW9cSSdkDvm2oSTGtRTfcrv/WQBeptdwrof+ubptieXvcrx9Q0Pe1QVqoE/c4uMZRevim9L5PiwoLyEEixP6PQtLFok3dGOCHQe7G5exjIrUzBN9EbkQr3DEc9s88uOxF4oAVKBKU7KOIbAZm54j3iB0Sk85mGiJgZyJUcAuotTreJhBC3Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: W/3QEw4OyUYoNN4fAa5QZ+LhKgehUygvl/YS6g/HPMwAvnB2kTqXdQTNyY1PdQyxZ6UGC7bYgCLYHSI3JAqVjQVZVjsYFqxi9ua0mzes5NOzdUO8oSyaiHR/jC+GOk4IgIzxr017kuomBc0jyY6R7+yoLUAf7mlIXrJ+fHXQNC5WPKErweOM/lp07ljXQg8i4/DXAYwZSlJHtUbtn2dvW5Mp1N1A3y/AlKiPhjelgivGMAzi8mvaIxgcuHVL8Ov6ISk+bN5qqoTr/4IyBomdcmBNsRmlUfkTOzKTyVJ7C4hQgWEmp/K4kiMfINQrjQeqBZS2fOUpSOatZqSvSQn+yzCBvh41nW3aStqZnP/PF9kuDUkmNRVvjWNJZT3Y7i5PXe4o5ueRbB/5kcqEh68D39VElpyJPNnjRU0LztarjnIiYywN6iIuWujnm19NITOV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 17:08:58.2547 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0c2b29-e532-47e2-c5d4-08de8447e0d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF28EF61683
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
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E38852AF277
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With this change we're adding NV12 and P010 twice to reported
formats on a primary plane, which causes us to hit an assert
in Weston.

This reverts commit e01716e8352a3cf504058fd6ab90d8969e379275.

Fixes: e01716e8352a ("drm/amd/display: Add NV12/P010 formats to primary plane")
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 0638f77c511b..812497d428aa 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -62,9 +62,6 @@ static const uint32_t rgb_formats[] = {
 	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_RGB565,
-	DRM_FORMAT_NV21,
-	DRM_FORMAT_NV12,
-	DRM_FORMAT_P010
 };
 
 static const uint32_t overlay_formats[] = {
-- 
2.53.0

