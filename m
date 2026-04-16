Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0El3FBLc4Gk/mwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Apr 2026 14:54:42 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD33740E67E
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Apr 2026 14:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423EC10E1DE;
	Thu, 16 Apr 2026 12:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ODnJc+vq";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B65F10E1E4
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Apr 2026 12:54:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8dh2sH9BU0aN1vNMAI01gNox31aeok2XfxpRXZdtUtFuLO6EiaFVb1HgV9ds45A7UiqTwMVsVS1LioDE0izXaDk4NKKQltt+McELL08cq+4XLEYdsZ5cl78HfB7Vp0t/po80UPhJySTWC0/whMcUV2tKZ4nf8Qg+SAO4MLzacyWROqIecIyGjnbI0cxVXX3URp/0KZ+B64dVaW5tj4Z7UPkBDS5JuaQE61/D+RN37zxM8TXLM5/4ztdqoc/s3GuKDmsmzWkNDN848pPpDq0AqcWoqm14+RlUDqI1o71twuPFkKKTc4l0CD3CffqKxZmSHd2jwAl4M31u8Ahv9R8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GahDCym+LmOGgwX+rfBobe2uV9fwJQiRWDYJhbglMv8=;
 b=JSN61dPNQHhYCaRfu5HIaSkXMytqJn37syZzUAeMPy080LaMhBcqavB3OOhKS00o8mI7IjbWETCL4Boo9dyi0ry2CC6KdxKHWSMNjtvszlBybqq5uJW9061VLUgCxkzJvMGpIaHYojkmPxwPvbOs4ZBVPe9xpXKjyjoKFvlWl14rCxy4OJC6UySIhd33c/SS+WJmmn0Sr8Xz99WwT0hFH1YJrrjsi9g6D+/MlngWJnNwZKOfgI3ZNwTQPBPqUazqf7HbR5gm7KLPfELtV8OAlMxQoSV7Fq6Zx30Zrm3wvRTVM0Qj26C0MWPsKGwsjLTH+oikuLd2VaAdJjL/3kysAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GahDCym+LmOGgwX+rfBobe2uV9fwJQiRWDYJhbglMv8=;
 b=ODnJc+vqQwuGhqKbgBnX9Gld1+15Tqf6DE8oeHRICSCN12WMVdCfc+RYVtd04S+xbsmJiUaGYiBYZr+SOH7EqeGDQ66P3xlXWNJYcM3d/vHtKAgQbE75dCCmGPoyKeZpAiLXbuphR7WkykbxJLG2JEvot93H1OpmVwHkpWEzUME=
Received: from SA9PR13CA0004.namprd13.prod.outlook.com (2603:10b6:806:21::9)
 by SJ2PR12MB7797.namprd12.prod.outlook.com (2603:10b6:a03:4c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 12:54:31 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:21:cafe::c9) by SA9PR13CA0004.outlook.office365.com
 (2603:10b6:806:21::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.51 via Frontend Transport; Thu,
 16 Apr 2026 12:54:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 12:54:30 +0000
Received: from hawzhang-System-Product-Master.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 16 Apr 2026 07:54:29 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/amd/display: use GNU make rwildcard instead of find
Date: Thu, 16 Apr 2026 20:54:12 +0800
Message-ID: <20260416125412.29552-1-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|SJ2PR12MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a8cae7-cd39-4302-664d-08de9bb74d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: BlDpRlX4oKDVNnEF3nqi4CPsj7nh9cE0KF441fQwVbXHJFypijW6Dp1nKl07vveceuAH5GZTxnR2wP7cXyLGjVjGddQ+K9aWkaQoK8/iVNkWMP/wTCf3oJyZ28H9AlhTUD3iheMwh72t3kMqgkCmXj0sQnQ7uWQLIOaKpDrLA4vtJ3JoBww5LzGe+DVOCuPncrAng2iBzB74zwCYjgI8Naqk3zO1w1NDx+eYPrPuGOetzzQMFT3X7KjuNI4GFbxMd8xxqALiRJLJLS47gruQRLdfsFrsqqy7Gkm3TiKNKDcXJ/od0VX+0ddBTdOPEl25es5+CPFd4hutnGhowGDJ0+J/c+7SkJeTZQ48l9dIxXkKJEtBX4AI2Sbzf8Wtmm+UHTOwHMVyd95NVwsQ1hskFlJ7LQVfnwOsKsGutXmZ80D6gFG4/8VvTk/YBlu55FX+pld/SGqNIFtKMTo6F3B9faIERpLrSQ+2AIJf5fpQFS+BbHdSt2EEum/VbyzvQIAI8zpKvjjM6sZuWT1g9VOCWcFChoMXRrMZVq+BPvqyzZ81o4+mtNwYemjCJUxR0FibriSatW8h+h0L77zoiC/EKnRTrb2yjbLHrhF2DNeHSRdyHdGpH/hcfNVhnBpuzylU7AykW3mIeDxwDOjxu3vIFHcP/K1w54AqXLA4cMa2CySfwuG9e2pLs6GC22wLP7UQOcGrxJzMxpziUg5sW9yqEhfY7cGY/pcfJN1KCISj7B00WwyBkconnYyGBy+go+5Jso6ak6Kxlt4BcN9ki5MjUQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WqxtNWSMyn0kX15LwQfGFlx8n7vc6v1QgTKACV0z0NR6TOlAEu4ikyg/EZCzAhFv2VhE+YxXQElBq+/mlzMlVukdQ1lp44Hf/QKAOmsZeT5mp6oQ+/N9l/SU53uF2KLRtUBWIP8rAxfpHEsb8yim5RBSlX3gXQmyz1TB1IgWU9yzuZQUxkjmtf9QBWssXT89HGf05zOuIiMYpvVAXb1LEcDaGphsWE0ZKfABXITi+Ig/8DcnsgyHQyjKNDNNOQPYXF5ShIJDQzCTZ+iITHKkU7Sk4CisKMvlRmFuETHTAVoDP0oy29sqAC5Pc6B3UMatpsuBdyYYe/gFj7M2OB7kPO46Cly30BD32YH13eAEejTRgyzfigCTBAs3MpKNdF6h6M1RIqkU85F9JvPXGlI4R1QtgIGL+0AUflCKE9io6mF2ByhdN/zxqIin2DKI0UHh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 12:54:30.8616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a8cae7-cd39-4302-664d-08de9bb74d2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7797
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Hawking.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AD33740E67E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace external find calls with GNU Make’s $(rwildcard …)
to collect files. Depending on ‘find’ can fail if it’s
unavailable or returns no matches, which left CFLAGS_*
unset. In that case, floating-point code was built
with -mno-sse, leading to build failures.

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dml2_0/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile b/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
index 8a451c36fdb3..10c547e63657 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
@@ -55,8 +55,9 @@ subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/dml2_0/dml21/
 
 # Add FPU flags to all dml2 files by default, remove NO_FPU flags.
 # FPU flags step 1: Find all .c files in dal/dc/dml2_0 and it's subfolders
+rwildcard = $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$(2)) $(filter $(subst *,%,$(2)),$d))
 DML2_ABS_PATH := $(FULL_AMD_DISPLAY_PATH)/dc/dml2_0
-DML2_C_FILES := $(shell find $(DML2_ABS_PATH) -name '*.c' -type f)
+DML2_C_FILES := $(call rwildcard,$(DML2_ABS_PATH)/,*.c)
 
 # FPU flags step 2: Convert to .o and make paths relative to $(AMDDALPATH)/dc/dml2_0/
 DML2_RELATIVE_O_FILES := $(patsubst $(DML2_ABS_PATH)/%,dc/dml2_0/%,$(patsubst %.c,%.o,$(DML2_C_FILES)))
-- 
2.17.1

