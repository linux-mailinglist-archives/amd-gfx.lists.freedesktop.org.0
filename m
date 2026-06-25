Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KO6RHe/kPGrftwgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jun 2026 10:21:03 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D886C3B08
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jun 2026 10:21:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=xXpVPOnE;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BE410F18C;
	Thu, 25 Jun 2026 08:21:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010052.outbound.protection.outlook.com [52.101.61.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACFC10F18C
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jun 2026 08:20:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEll2wPGoU8iLZlnQyiB0u++KZ3KI8fGTug7IzacKd2itriHYyMZFRwl9YVmelXmk6Bry/jnyERaiqr9rDAvWfzdWoCwSGYr1nBNVmPNE/9Irn39hYBcYKr+mxb+y9udjvTzulk5yelA7zzhB4aU8P+Jgk9IWb1eLnBxQ8a3agCctocE7KIOU7vYoxwn6dLyj34xyj9uj4vMbvsTcrJd4G6tW0url9Ge3Mn/TB2jqNUBZIwlYdKZKOFyywo6W0sWRRnrjMj2d1WHyKgR0muB3Q0qkXHWkFSUToDVpjn1uCkQrQr9te4PEe/zySUzwWMrNmvIXGJG2jO+kX21Yk1fcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naNDdB/+/wf5P/vcSMCIvfWR8+vDbh4hhOC7FFT63LE=;
 b=CSduAfA4d31mkWiankSr6Yvu3gevZcH41NljJ72DaepM29/s0dcROCmukYqIWUySnShcIY0ky5QJ3uNL8E5q8j5b3OtFsJo66pHbshoJavkvjQfAZa37C8pLqqVstBmsOaB3Er3rG10io3jcbtSCPpgto941y4E0x1ODFVuZOhkrjYj7aVnZIgvnxP7kdcjsKFKi/7xSZgMiVuhHc+Q62cUp0fwFy+stSFzIbhkdurmZ5uucZvGVQU19VCOeO1bSqRAOrp0jXJ7EOmjm61vD+w2eOMNMXhZEBolrRGiZR9nqHYjZEObKmZi3kEd1qmAFCMsSz6NZxGMb+cF2jgM0xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naNDdB/+/wf5P/vcSMCIvfWR8+vDbh4hhOC7FFT63LE=;
 b=xXpVPOnEbNlN7aAjC55U0vSlvCCm76qxnCTXQagSUdNZPElh5gPFkd6L/wU7p0zrYacmutBIPAr3IO2/6cXr7GjXG6vFaCKVa6VHP+QEsrIFJjNcGksFXxPpdTdkgprqJvxAMOKXh0RT6U8MTe4HxJj9tFMQu+UPhaAZZzishhk=
Received: from CYZPR14CA0012.namprd14.prod.outlook.com (2603:10b6:930:8f::7)
 by PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 08:20:54 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:930:8f:cafe::9b) by CYZPR14CA0012.outlook.office365.com
 (2603:10b6:930:8f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 08:20:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 08:20:54 +0000
Received: from sunce-mlse-vm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 25 Jun
 2026 03:20:51 -0500
From: Ce Sun <cesun102@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <YiPeng.Chai@amd.com>, <Tao.Zhou1@amd.com>,
 <Stanley.Yang@amd.com>, Ce Sun <cesun102@amd.com>
Subject: [PATCH v3 22/44] drm/amdgpu: add the macro definition of
 UMC_V12_0_PER_CHANNEL_OFFSET
Date: Thu, 25 Jun 2026 16:19:15 +0800
Message-ID: <e5d8880c9d441b24bdb6690d197283a501292a78.1782373702.git.cesun102@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <b5587fca5f57f8f352245edf2c76606ad3307923.1782373701.git.cesun102@amd.com>
References: <b5587fca5f57f8f352245edf2c76606ad3307923.1782373701.git.cesun102@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|PH7PR12MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: d80c6fa7-e05d-4a7a-8313-08ded292ace6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: LjQmHWbWKGG7nAIZJe5Fg7B4v0yJI/9EouBNLnfU+yJVI7WtclriPgE5qJyBW+9Iz8NuvjYSFto41n1j2xpI/5nCKGuonP152meSqDsfkleCMhnl8Oyu3fheym1SlXG2983odT9jRS9oVr6qFnxQ4taIPbbF1U+FVqesZ7GvZLmf2srSsHI2Mp4FxPZIE1w/g07ScbJJiPOaBLGuXb3fBSPAQrKquR0f5hoU3RWJ/p0JH3GjnFidm5Bk5btyD2k0Z5akS4+AAhODhOJYzrBT2hVu1mrpEc5zitGhyP4q03I1so/T+Iqh18lB5ee94YDcsHW1AEomy5EbzKQkhlcbOYawV7Kr5iHqCd8Xgu7gBAzvINGBGQqLIsANp+MouSYFLn37Og7xSmmrHmg6WdLUfzOQyWXc6yVJYYLNhBoZibXyzFaQuxHyYX5BmcZnPDiJ3FbMUQuUrVQArQylrJjqkR5//5itlQ8tk3BFa7nyJ88NOb9SYvDOSg5IHbA8qe+aWBos4eqhWrjQoGi3ruFDhZMRoPQzTCJvMVUf2TETgWJtfIM3LHRYR3I8cUaO719d7hN5f9nKmSRqRFC4fMqiA/RCerlFQNTmcRLpmtb7RIOjxJNxHdC63jw805A6fUHMD0d5/rffpjn5JTU933sJ1aiUXEQfdFTiF1GQD0fhyjvZjhuojf0OTEFrNcqditPkudYtDtfkUtVu79c6Nv8Qjg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7SQCZJcMFxJcEydsVnFNCnm744gtBmfyC/KtsMyf61bbuJ8/mTJVRuVAwYt9YwADKJGxsXLIdXmBBBtqV+428p8BsWzd2X7Yd80ZSXuTrl77T9hHIZaYEEk/vS7XEG0vwA0skzQn80/XRpQblaXcjjvGVk/vxyyaIgezkfjoBY3acjmn70mzOioO3IahDAdj/ziV7zLK54rBOqAhVtyBTsbbCLu7R+Uor5BCQB+Bjjgy27WLRK+hzdLedhyd+SHU2KSrgVy8RGjYSYMwN7GPExGAlHkEM+YYDEN7JHydWDRcecYh8gUY2/q6XBJ4K52qR6nPT370v4K1+CaOTTdTwtFyFMd7ZOrrp0RUpQO1Vhhp9YtVi201LLRZyGmdNu7qbfkArMCipG4X1uO0MwR2FrL4URSTG5b4p6rhbllxyjwyjqLuT7BG7vn9sreRiI5X
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 08:20:54.0123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d80c6fa7-e05d-4a7a-8313-08ded292ace6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8156
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[cesun102@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0D886C3B08

Add the macro definition of UMC_V12_0_PER_CHANNEL_OFFSET for subsequent
use.

Signed-off-by: Ce Sun <cesun102@amd.com>
---
 drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.h b/drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.h
index 8a35ad856165..650b5f1f22f7 100644
--- a/drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.h
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.h
@@ -290,6 +290,8 @@
 /* R13 bit shift should be considered, double the number */
 #define UMC_V12_0_BAD_PAGE_NUM_PER_CHANNEL (UMC_V12_0_NA_MAP_PA_NUM * 2)
 
+/* UMC register per channel offset */
+#define UMC_V12_0_PER_CHANNEL_OFFSET    0x400
 
 /* C2, C3, C4, R13, four MCA bits are looped in page retirement */
 #define UMC_V12_0_RETIRE_LOOP_BITS 4
-- 
2.34.1

