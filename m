Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN+hHtqwFWpxYAcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 16:40:26 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABD95D7C7D
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 16:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B844B10E69F;
	Tue, 26 May 2026 14:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e8v98ShW";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB0810E69F
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 May 2026 14:40:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adfS97KR2toGm/YqX2Fc30spRJRGgOly1IYa7OcIEvJnQ/osDPflndD/bvaV+yiX4kL60cH27hoEeBzOudOwk646wPwz8U/ucXmFAGaO0SXVpz0NnTOlmo0s09cG4L3ZKwLTqOmORNNh8OMCbEBKzbsPOy59i6z32KZ8n/zPVAqyDvxo5RrztAwYWxJjGrlma5C4e6Et+PUkEuJDZ/Eo1ncMg+zxKY5Xr0Zz/Z2QMDRJ6VCcncZYKgdrc5XCGjJz8glV7T17NoRevsqm4H8rbA+HXed9cM2jX/paJLWocvwVOITD/MiCXyTBBeM7gfoNuEUkxDRG2h8wKIAatKCu5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZpMgJ7QxMKErVbW2ezJZbVGs0ZYNqSVrBnOWR9Gr2w=;
 b=hVEEU2NzvyQI9nP5JAWbZCet27m1BNxaz3vo7WequIgkJ3akOuWbgjTNu533szf7W2JSenjYhS/qMgGTgSqiorI4XaACYBkVIdNlnE0AmTix4nx4vqfKeH7waU3pFW2AoYlRhKfj+6XOA0MDq6NFnVBc2eKbJ1MHDRLtS2hsVWH0QNCaCBXPwUl9O56GyCrkFzYdUzk8KOBhjqJ2y5QDFsjyXS83yfbNUsO2tLimAWnH9LJtDaQq3whAUK9GmT/q51pWR8Kyykb8emoELtVXUSqhAvz3A8fLQN/2tvq6oINuw2PI3qoVf4tDb8/VGxRyFet/Dpkg7noN9Jg2/wsG0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZpMgJ7QxMKErVbW2ezJZbVGs0ZYNqSVrBnOWR9Gr2w=;
 b=e8v98ShWnRd/zVxc+SJbiJJ/Rrl3vhIZhOuYO6hSsKbhKwzc1DJ6De0SM0OqcX/SVl5Q2A+gk9L96cCbO5j8lfHXH55y6hEdA2Tn3+Sysc9baB7mrH/CfY0e2Di8FlUPgiDki99+KOcxYmEgNUpSENa8Sw7prk8z6qHW7hLELss=
Received: from BL0PR0102CA0014.prod.exchangelabs.com (2603:10b6:207:18::27) by
 SN7PR12MB6791.namprd12.prod.outlook.com (2603:10b6:806:268::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 14:40:18 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:207:18:cafe::4c) by BL0PR0102CA0014.outlook.office365.com
 (2603:10b6:207:18::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 14:40:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 14:40:18 +0000
Received: from caden-arch.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 26 May
 2026 09:40:15 -0500
From: Caden Chien <chih-wei.chien@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Christian.Koenig@amd.com>,
 <Alexander.Deucher@amd.com>
CC: <Solomon.Chiu@amd.com>, <Peyton.Lee@amd.com>, <HaoPing.Liu@amd.com>,
 <Yu.Wang4@amd.com>, Caden Chien <chih-wei.chien@amd.com>
Subject: [PATCH 3/3] drm/amdgpu/vpe: add vpe v2.2.0 support
Date: Tue, 26 May 2026 22:32:19 +0800
Message-ID: <20260526143219.609033-4-chih-wei.chien@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526143219.609033-1-chih-wei.chien@amd.com>
References: <20260526143219.609033-1-chih-wei.chien@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|SN7PR12MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: c135a6ab-91c6-4c81-a359-08debb34b4e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|11063799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 1FAJWOv68dbYxo6wZDIRpiA6Rsktlffsc35TIYKeUPU7d+hdZq0nXE5n/kDADSrqNi9cykWp4Wgok8fQdu5t87FA7bLMtmqV4EmII+isAfDx6K/QQ9KX66Qpp8IvnxUWQ051cEyWishB8S7/leSAJwjSjQp4ME3f9aKmKE+81srt46jF6MH4jdTkK5vWUDEvVH/0m4X1XMeThx6E0HFlFm8kL4fqF5DTCUYqAjGQtzzyDdz0MtrHnKQQFSLwDTclXxP6QmKvHld867Ba8y3bFtkoUKlKGW+bGwoaznVlLI4zmH5eLKHgaXpb6IiCvkSIHwaAXWWohbXtRkwy8rX7Bvo0fQqHkta+ogCgV8gKzKtMNBjRT7lQbqJXZmwMbX7Vtq28LN7pXuZ7Rs19whELcPSbIbmQZVz3wCd9WtgJ8/2TuPH17w+h/irJ2BN8PHII/aufKxWl/EVKe86p9K8mS7S1rD0Jyu2w7iHBUlICcJSTFQzSdH/L7K/bCazWgXK9CPxtb8CDgV7N6CUfwWpOrA0s5sncxgTPhbMAvDq1vDKEleslsV0IhX5B/Tjd3FX2eJRzI+VSYnycKlcjutXPLNiMZ6ck8xSBaVGKXLsSoZe27aGkVoWmJB/xok+mFUyHPXZov/kvxMPJlLO6JNcT8cx5x90yvHkl8I/rWKn8YwO9iIb4Uo72JcP3Ym64zXUY1fVfyj0uC+mhSRtkS/7P2UP2FvbaLRCAiUxLvxN3XGE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(11063799006)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mFcdB0+VeXzS2JOU5bRBqEc3m1EAeCGHwMnR/o6jllVDq4dOCc1TcBpVg+fflGR87Hjg6zBxXYSsisFeAaxthme4k5A5x6sHp/tcLv8cAFOFYmnY34IDQsjAsCwwkqjLzSQ6SeOgsqrG7HmokaPO0LhbuGxNbbfyykqAOrIeL+tpAN6ujzJRgmP3jnKZhp8U6TaJHVl47WtOijsTJ1WG9+Ns3y0pg0Mg9ttevnJx/+s4nHt33I8Cwi5KFxsmvh00E0Sgdyue5a1pcRBTQiNKrS4SplwfcMRkzanc6CTMP3NfT70yNw0NtCwoBPiH41dWDhk/MRFyX9Gjy8LvW7wM+vaeDH7a4Ea2rsxymO5vnbM/hSFbHUkLLFEA5tkDllFY/qsbzONkUP6PbzbJOVztrdIrnn7J8Y1PrxtVt/Bc6TR+DPftpvGc0lWhKd2R3n/h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 14:40:18.0215 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c135a6ab-91c6-4c81-a359-08debb34b4e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6791
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
X-Spamd-Result: default: False [1.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chih-wei.chien@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 2ABD95D7C7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This initializes VPE IP version 2.2.0

Signed-off-by: Caden Chien <chih-wei.chien@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c       | 1 +
 drivers/gpu/drm/amd/amdgpu/vpe_v2_0.c         | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 8e3b6a4050e9..9d95a4f915f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -2740,6 +2740,7 @@ static int amdgpu_discovery_set_vpe_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &vpe_v6_1_ip_block);
 		break;
 	case IP_VERSION(2, 0, 0):
+	case IP_VERSION(2, 2, 0):
 		amdgpu_device_ip_block_add(adev, &vpe_v2_0_ip_block);
 		break;
 	default:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
index 601420491477..7bf74ff93fbd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
@@ -312,6 +312,7 @@ static int vpe_early_init(struct amdgpu_ip_block *ip_block)
 		vpe->collaborate_mode = true;
 		break;
 	case IP_VERSION(2, 0, 0):
+	case IP_VERSION(2, 2, 0):
 		vpe_v2_0_set_funcs(vpe);
 		break;
 	default:
diff --git a/drivers/gpu/drm/amd/amdgpu/vpe_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vpe_v2_0.c
index 0d91e01fbf3a..c92c5fc59aeb 100644
--- a/drivers/gpu/drm/amd/amdgpu/vpe_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vpe_v2_0.c
@@ -31,6 +31,7 @@
 #include "vpe/vpe_2_0_0_sh_mask.h"
 
 MODULE_FIRMWARE("amdgpu/vpe_2_0_0.bin");
+MODULE_FIRMWARE("amdgpu/vpe_2_2_0.bin");
 
 #define VPE_THREAD1_UCODE_OFFSET	0x8000
 
-- 
2.53.0

