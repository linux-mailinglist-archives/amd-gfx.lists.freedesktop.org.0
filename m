Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HNNzD1ZuOWrOsgcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 19:18:14 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A956B16E7
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 19:18:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=a7ozUjft;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4803E10E344;
	Mon, 22 Jun 2026 17:18:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013036.outbound.protection.outlook.com
 [40.93.201.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAAD10E344
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 17:18:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPSI0psC6wQ1XKegfHETcJ54jjvbiBb51Ak77zLCkNC6us/lDuf5N5BbcSiPHTTCrX2ig2T3LTlJnn+LP/GGHX2Qh98unrXoc5GpwrhEhDrZFsyZgEFYRSTBCz8xR1vl/yCRAKhMpzHinrZbsvYRl1TNipkKmJ+SbST6gGgI7RD7Gx6Qd2QLyKciPM2LXizQY7f59fbLEEfzRP9gZ7yGmbnfxqCGai2b2OP9ki17sVGzHC+npJ+7Yz20lt4RmBak9wJI43l/5AGtwpdjDnO1VXzURirdFXJKEInH37wexOB//b/E1n3c5GdtsDEMbmwYBf1U552GS0LJxrYFPtgqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+F8p93/HdFk//on5plkksok6+ZC1Ztf9YYxsyZH9mE=;
 b=JupPNBMY8h6gplPn+1/eY/qWJzpy2DrelkUWqrupTfh5yzEKFj7zvLYMl+etiRP9socZNPgePJJclKPWbDw/Lt16kheUY/hZAa5032fJCMWj0dbsrKXHqacjwHK+t+etT3/s78ZrF6xblulxti+ufiupfZKgGug+IMgWML6DqrKZnOLXMUqH2FvMm2i2TKM0ji12WUXcEWIBOjP/U6WeZU+gu1Qcy/8vf1uUcbJ41q3IBtx60xNldm5czqTj7WbqAWUVO+LL7CZTbWJHiqrtmxviKA55KghaqNw0UqOCEspo3U+h6vQ+t4/uvC5eVgYIEeoRhJCHfyc7mg2dSfX+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+F8p93/HdFk//on5plkksok6+ZC1Ztf9YYxsyZH9mE=;
 b=a7ozUjft/Y9K8uOE+uED/ViI+0RR2v4StgPcxgEhRgBlOfRWdEktd9CacW3SC2fAH6giuTtN9R76MsYDLRIKYsg1sInQXhJ4dLfHUBmblLtWRXEbl3hbXVdVLAu04/uEgAiyAicVPDl8oCMGRZAjmBq3eHfA6+xF/qqWKSh8zWg=
Received: from CH2PR14CA0043.namprd14.prod.outlook.com (2603:10b6:610:56::23)
 by CY8PR12MB8298.namprd12.prod.outlook.com (2603:10b6:930:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 17:18:06 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::15) by CH2PR14CA0043.outlook.office365.com
 (2603:10b6:610:56::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 17:18:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 17:18:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 12:18:06 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 12:18:05 -0500
Received: from flamewok (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.41 via Frontend Transport;
 Mon, 22 Jun 2026 12:18:05 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <mario.limonciello@amd.com>,
 <wiagn233@outlook.com>, <sysdadmin@m1k.cloud>, <timur.kristof@gmail.com>,
 <xaver.hugl@kde.org>, <mario.kleiner.de@gmail.com>,
 <michel.daenzer@mailbox.org>, <matthew.schwartz@linux.dev>,
 <chris@kode54.net>, Leo Li <sunpeng.li@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v2 3/3] Revert "drm/amd/display: Restore 5s vbl offdelay for
 NV3x+ DGPUs"
Date: Mon, 22 Jun 2026 13:17:50 -0400
Message-ID: <20260622171752.73374-4-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622171752.73374-1-sunpeng.li@amd.com>
References: <20260622171752.73374-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|CY8PR12MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: d66f3603-2b59-49da-0a8d-08ded0823992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|1800799024|30052699003|32650700020|36860700016|376014|7416014|56012099006|11063799006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: I6ag8HUcXuH3G0CCcKyKc6miWPvdz6LBwwwlNl7LDv+udZivuZFzTDuOIeg6lV5YKlEN3RWmfIWYmi6sU0C3ZUvyejMeR4pO/iYfd+39+yh1i+/R7hnAo7UdhgzosszwQGIkQOaSt/dyQJR9jTASQhO0J6pCpZjluX9URvv1DqMUZzlTEew9znAwRrhyGRdC+yu4UVlhScVNA0PTAJjauvfznK49EF7Mdu4Ykx2y5RZF8zFE9HV4Ojd576bE2CYcnlvCAReDfTOQZknK8DwzDAXxZjXhs3bjghkDCLqvLf82FTrpVVkXunsAr+18iavA2PM2z6qgiPCAZD0mawj1N8ehlHUe8LGDSnsvjCrrJ8jVmvXPJIVNXyi2LVA+NiHQrZR2atWxJif3kKh2w/Tr3gO0UCagE6ItyvwoA7CXKHIJtg3dZHKg5su/0EWAA7uf06iwbE0NM9JRulmD8e9aLH2A3pgjtgPOmIsPC5Jb0awieBPkFn52BM8TB+2cBfb7GbLKrInX/bHJuplHYTzN8/ab8e7zKOtq6Je0vL5dNAG6nFNbbDXfT4sydXMOud1nBp+neW4y2+vI34CW/jPeUKDm/3ZoM/HKdRArJ+cM/GaZKKQhg5iKu/4/VUGH4lNnelWdKJo0OD5oTclYiVCbMN1g+G09l5Hq6tx5p5SsKAy9Jcvv6khSA5bctFJgmZ0H5kI40Rg3Q9j/ZYMUnJTucA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(1800799024)(30052699003)(32650700020)(36860700016)(376014)(7416014)(56012099006)(11063799006)(22082099003)(18002099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HSkcPQU0M/U8M7SDp4FbaeMfHHg8cKdDhKOXw72FD7aFW9fjdne0dCIxreaWxlo8vawgjJp5vKQ4PX7RnS06hd8chEPA99E6XqQvVSI+0X/mrCy0iZG0agzHFVZi+E96r6ii4UAxyZcS8Yo9HHo4Ahwf8vLviBBafpClCcKxBqe5Jo0/J1kUYnvhJr3unzBvq3lUiYHU+kF70fraE0RpaEQa+wxv58SnmIOtzByTcbGGZcw9913IM73AED31ILmqrBiSbtXUp+qylEhCOTtQbD8aJTMs05nykNZ9rqAr+F4rG4UKltjgsbnf/02wn9P/yCemJfDCK4x/9mVwgHkQkSrQLBw8M3b1DSy+bcKoBxO70Z6CUXeNl3lmHGQc6RA2dJACiKUOG6LpBWVdzZQqJ5h5GJ4N1/fUuNOniuB4sek47BnaV4mGPC2A/m3oqUVb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 17:18:06.2808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d66f3603-2b59-49da-0a8d-08ded0823992
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8298
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,outlook.com,m1k.cloud,gmail.com,kde.org,mailbox.org,linux.dev,kode54.net,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[sunpeng.li@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A8A956B16E7

From: Leo Li <sunpeng.li@amd.com>

Now that proper fixes have been found, let's revert this workaround.

This reverts commit 751414c12388ff2b475e15c15d3c817dcf563635.

Cc: stable@vger.kernel.org
Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 732ddafb5cfea..8c5f5dc13a486 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3535,21 +3535,9 @@ static void manage_dm_interrupts(struct amdgpu_device *adev,
 	if (acrtc_state) {
 		timing = &acrtc_state->stream->timing;
 
-		if (amdgpu_ip_version(adev, DCE_HWIP, 0) >=
-		      IP_VERSION(3, 2, 0) &&
-		      !(adev->flags & AMD_IS_APU)) {
-			/*
-			 * DGPUs NV3x and newer that support idle optimizations
-			 * experience intermittent flip-done timeouts on cursor
-			 * updates. Restore 5s offdelay behavior for now.
-			 *
-			 * Discussion on the issue:
-			 * https://lore.kernel.org/amd-gfx/20260217191632.1243826-1-sysdadmin@m1k.cloud/
-			 */
-			config.offdelay_ms = 5000;
-			config.disable_immediate = false;
-		} else if (amdgpu_ip_version(adev, DCE_HWIP, 0) <
-			     IP_VERSION(3, 5, 0)) {
+		if (amdgpu_ip_version(adev, DCE_HWIP, 0) <
+			   IP_VERSION(3, 5, 0) ||
+			   !(adev->flags & AMD_IS_APU)) {
 			/*
 			 * Older HW and DGPU have issues with instant off;
 			 * use a 2 frame offdelay.
-- 
2.54.0

