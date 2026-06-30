Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2eCsMxUFRGpbnQoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jun 2026 20:04:05 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498FF6E7154
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jun 2026 20:04:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Xq4R9JI4;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A8710E232;
	Tue, 30 Jun 2026 18:04:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011006.outbound.protection.outlook.com [52.101.57.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B249D10E232
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jun 2026 18:04:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nf2vkMOWZvSUj4HF0d2H46g9rcFSMWGUl6GAJq1knURx2mT3eK0nFlNb8v3jdHLufYhGcnGl9lzXb8I25Doad/622cSaiie1ALOjaDdTNoBObEGfTuhks312WxsGILe8JhjT5bOgof7h0KrNDxZEZy1ylG/0mmhrpBCRm/nGeGNoZ9Q3FtWE5GdzhyrgmNpzFDtF2iKq1SxO5gX9qHh0HiTWRt3AVmjm8CNT0EC1kLZvSCKAE+oHHeG8ZAQPQ0zoHweKDCgzYS07+vuhRWicyd4+DSA2aWQzrZHhGaB8TaxV5KPVRZgpiN3iUa9geimH9aupzzDnvyfcZFHIzIybWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDdwRciHAiEs1fOdP0WenP48KHaWlCFjQbD94j3bDBc=;
 b=cS5EEaEPJIO+MwqS14NTylVAYSBlBC3eLlFMY26GF/WFjWTFd5K6pFPk6Pa5zceDAzwVxaym6PxLBEZu/2AR1aCqoIAonHQDkVjyjBYyi1JRwKZ5P8rqyWXc5lxJh45LZf/sFOfwRpoZwqb+LCvIBYID6Br6wz8gq3sy8VRRcL283Anw1FeTySqunwYiyW+AmQ2TBfAHlKA6PjdZPOgj5nsuPxbbcDT4aqTKjZzXvc5UcMF8bmNy851QZBkJmN9gv46Az+NuURHeYLenPyr+So7CYkgLW2pYli1uMEBgXp2y2RkrrlFwaDvqtFdeoxJwCB0+qsoV8+kosGGIIuQwPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDdwRciHAiEs1fOdP0WenP48KHaWlCFjQbD94j3bDBc=;
 b=Xq4R9JI44JqK6MR69oI+/RrbDqebf2a/IvtdsoQP1l3SNllXU2zT4WwqOxKQed8oOuvKS+GRT/kDozBe7qQmccsQrxf3nJsI6JHtFeHNXXfoqm8vtoTh8QXKO1gEfOCNOIvh515KoTeTb+vfD/l1yn7kIenQ1cG3WmSKhtx7INA=
Received: from DSSP220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3d3::16) by
 CY8PR12MB7731.namprd12.prod.outlook.com (2603:10b6:930:86::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Tue, 30 Jun 2026 18:03:54 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:8:3d3:cafe::57) by DSSP220CA0011.outlook.office365.com
 (2603:10b6:8:3d3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 18:03:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 18:03:53 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 13:03:49 -0500
Received: from flamewok (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.41 via Frontend Transport;
 Tue, 30 Jun 2026 13:03:48 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <mario.limonciello@amd.com>,
 <wiagn233@outlook.com>, <sysdadmin@m1k.cloud>, <timur.kristof@gmail.com>,
 <xaver.hugl@kde.org>, <mario.kleiner.de@gmail.com>,
 <michel.daenzer@mailbox.org>, <matthew.schwartz@linux.dev>,
 <chris@kode54.net>, Leo Li <sunpeng.li@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v3 3/3] Revert "drm/amd/display: Restore 5s vbl offdelay for
 NV3x+ DGPUs"
Date: Tue, 30 Jun 2026 14:03:01 -0400
Message-ID: <20260630180301.362070-4-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630180301.362070-1-sunpeng.li@amd.com>
References: <20260630180301.362070-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|CY8PR12MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c640b4-b2b8-47c3-5af4-08ded6d1f24e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|7416014|30052699003|1800799024|82310400026|36860700016|32650700020|13003099007|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: gVrBtmqhBU0QqRyTLYOUfZz1tjLkD7FJgN4hJnbs63lnt5wqz0WVul86YPW6UzqzrgEFAJkvrXDqGK6f2OWvDgaKvoFKY9Uq1gqobtwHmaMy4aVe7EvRwjlDOsgtJIIYl53yhS+NtWuWe9lJCvx9ZsHoIJO6k3IasinwxocKKJZ9kGftzn+el9Yzxdwi7HyRtBvqYx9OFXxTXm7OOl6Hq02SHR0uBqrUAILAftGVdFDiLJD4AQxt1e05nS9He8qzL6qyc1lrOYroAkM9MS93pVccH4hJvSuvsww797Q1DOhr/n0VjpEe2rx0U10mDDKO7lM4GLY7+z1j5Q2aaOoUwwdS7yLpP/DWIdxfuPKZsJb5Der01luPxcwo8LFW+P7QkAxg1/Wja3AowcAIt7OqZjXilGFF3w+AVhFi2dsatt3tDKFsHSU/fGUJw8hrL8o5Qp7+O4QYCMWHGrrKMJtZUj8HpGgBPdpm6ZXes44kYKZG0seP8jS4WX9iQzcdPCH5i4rGYfKUkhNQOf9K6yVmj1rqZ0PymxR3F7DZL6P3Xyvo5H/RSC+GVNA85BN6Rw+IubOvP3PNVznHpaqg9KaiCZvkjFUH+g9xeBFElTTdYTilrrhE38+gowrG0voV1rfZYPoktUGaBe6HO3GVYwOIgA6zTtzrpqE0g7MzwkqtD8/J4stgzK3EOrxQtf7wgXCGOjGo8pzER2vBXBXlUURYCA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(7416014)(30052699003)(1800799024)(82310400026)(36860700016)(32650700020)(13003099007)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: u5xOaExZyp7WLGOZ2ASgyonqOngS7sCQAooNbk4N6XxjGEIEORbeCrw05Gd200zz3HYWSie5OAP8Uh4/+eYVad2DmGX+xIA+od5jzFF0PQHQ+Epr+pOykRIIhfMKZqQQ/vIY7TXpMWrJN0gmzbyKUstMcymHqzOPnv1b4d9TrIBnERIPFH3VAmZ+axK/pzpUhqSj94BT1wiMVjR3KDb5VDmyvbwXjGtLUjPgbJHS5x8zVxXyI+F+/VhSl1vezpHEfk5yXOVGcQqt3KH56BsKP/SQMAyHrWNhJr1oqspbXHH0hBkCKrGNx6hEqul2jA5OdnEiwSfXAIlsPAVLmzRhhNknZdJMoyKdjx5j8vgZfxic0DBidKP6uNHIneJ4sCFDep/1+GO3NbfvYuZA26vFSjhV1S2S3IBG19QTmnHUoxn9cvGjI7jKsakSABKpFrRH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 18:03:53.4388 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c640b4-b2b8-47c3-5af4-08ded6d1f24e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7731
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[sunpeng.li@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 498FF6E7154

From: Leo Li <sunpeng.li@amd.com>

Now that proper fixes have been found, let's revert this workaround.

This reverts commit 751414c12388ff2b475e15c15d3c817dcf563635.

Cc: stable@vger.kernel.org
Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 754fedbdd7460..43a786f08516e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3526,21 +3526,9 @@ static void manage_dm_interrupts(struct amdgpu_device *adev,
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

