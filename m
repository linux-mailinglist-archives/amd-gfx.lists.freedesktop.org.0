Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gGd5FuhgMmruzAUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 10:55:04 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031F0697B07
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 10:55:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=e0zsCH8U;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5689910EEE3;
	Wed, 17 Jun 2026 08:55:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011063.outbound.protection.outlook.com [40.107.208.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2F610EEC8
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 08:55:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oh0VjQCAu7bDFbJyLEkElZE7ZVH/VGPUZ5XQfLe8ezkQHuvaao+RtF+ONgDNioxmIY6n/EMby/qeErLD8fDFU5iaHpv0Nmce84+V3DlU663/lLXCESUncemZ7tHiwTOfYKhLx86GBiJ9jtT3j8MCQlESMirRPr4S/mMjp3FeWpoQ9FMMyK/1kGfCOgE5VkX/Faegz0KoMThqNvv3u6Mh7Ld8dWT7RrvJETuBz9/D0fDUXPjaPLOewKKCqx1ErA9+J0PKRam5Y7JzzmMyiKUgNDg+5wuF/UbbbB0r2ujs33nk4Y4Wd+9TrB2Rskb9k8MjHGN7gkrCBK5XqNW79BNonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNBnuA60kCk3KVUk3spFV/0Qwstb7S8RNSCVu22em44=;
 b=LHl4pEtEzR0dkYbczsbgPhHtd5w/xiVGWxpkEQ9NYz/6WW+ci1QJORsS+czGimKyZaGbHvPGBtQpgCvsS1D8SJj6o5618aN/OLgws3hLVbamEj3THKP4RnvurVcW8nVQOtQM6F1hncQMHa119Wg6ysHxG8VIffrpMxdMyFgbxIDhhpcd5xgVDU6Uu7DLY8zXrHQNedZMeD7UWPi6ti0f1efTzsZi3yGWkuh9zBNp1vwl31mLfBFwsKs453lOr4kmTNXl+Inm/WBCt1yq97JOuRZWwywlou4HnxhzUp7/lTJv75uOitqkzscIJR08QyOp7hrkXnJFO4dHsE6zCdTCfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNBnuA60kCk3KVUk3spFV/0Qwstb7S8RNSCVu22em44=;
 b=e0zsCH8UazgYC7C95wKjdN2yPLFGUSOb1fmWaI2hsA89X8DfY+wW9/IU0qhG1hVPwvW0hwNmbkHgpwj0FZ199cUYR5wTlkdUsUBkmI/io12BjLDVCKP2L0AmilWF+0ah84pFVtUK/2xmt9GuhzVBDnNMp5fXk1CF6G9CUiHfBV4=
Received: from SA1P222CA0102.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::10)
 by BN7PPF49208036B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6cf) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 08:54:57 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:35e:cafe::30) by SA1P222CA0102.outlook.office365.com
 (2603:10b6:806:35e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.12 via Frontend Transport; Wed,
 17 Jun 2026 08:54:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 08:54:56 +0000
Received: from mlse-blrlinux-ll.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 03:54:53 -0500
From: Lijo Lazar <lijo.lazar@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <Alexander.Deucher@amd.com>,
 <Asad.Kamal@amd.com>, <candice.li@amd.com>
Subject: [PATCH] drm/amdgpu: Fix kobject cleanup in xcp sysfs
Date: Wed, 17 Jun 2026 14:24:35 +0530
Message-ID: <20260617085435.723531-1-lijo.lazar@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|BN7PPF49208036B:EE_
X-MS-Office365-Filtering-Correlation-Id: 341d59bb-a464-41e2-e292-08decc4e1af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: QcrHgBkPUF889uwAYMHUcYIp8c37KOeQ7GCeBQnVXLbdwwyQRjqQKaNZG86/j+9gAc6n776c8Hy3qJxFyJTaVoXffgUcXjEziQMNgsVxtLTp9S9Um9K+8o1EpBEHqdn97HalTVtvfp2LG5EoagiTT2HHl0BnKxLYOh7L/6E/jrc+Nlrxr18jqeM/OSlhul/9ErtDGVL1JrbayV+KJ5fWI1lQxP35mp4nxL1ps0W4ZpwR1GfKawTZuCoMQDWWh++qRK1mahbP5NSb1cPDoSK4ogeJbFoBVuF6THVcYW1S4RCV6s5WkiDPP2NI4qFUG3eWn6vEFrAploL+xAs8bqDhKDO+QLsc544pF7+r99apDvR3b/5mg/ONMDAnKubGOQvtgVw0q3fFjGhWofPZ9iWaThs0sGtaUxxv8gvRQEEsUU+KY49XckIExyZ+7/Asp7YuaQ3rSrc6sn4FVsjhmHnl1v8SlzvvKAnDCH9kvo2Kp5TGQn+zHrneNgzUZpbeFxJjWePWlyicREKQXTBdHZ/onaGRC5OGe9qNX3+0rjbFi1/aX6cnf2gfML3ZvnvZVplP+3K4OFWIRG+Oom/tLXe91L0VFRqODc4z4AV6Xy3rJEax8dyhLRCPKodDpFeB7vp1kCclzaaDgT/IR8PIzzp9SEDAoRwE2emfVOhx+RcO/Zg9GgOX4LG3VUuL0qw0BWL10Sy/wSBL5HII9rrANmqVEEXasrJFziz1bqvyzzVAPq0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(56012099006)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: z+AA998k8tgEKb2xZjj9j7VBS6YFD2bYNIJfDP7lI9Hod3D4yXzfdoe1kliAB8O2W1ygFYJKdvLuyC6G6eTZSrKaftQMiKT8LnJlFQxeX4Z8rMtTSDWDP1QgQwmT+L9OpxV1HKvgPGIFZj8UKf7c016L43kQ+pDPfCJWFrdrqwVIOqmvJEO63iqBtiqrQMwV4PMxWqnt5DSqbkDmIHJAfyYmXFjCeoakXda2ugJoHDOfC5LMYqltXGPuI0/57RNt7vCA+esF6mu6BKC/lpdJZkueeu1Eii4lWatdSZI+hNHNKRcZ1PE9QrXJLYQfWKJWSm+nqqHBqCP6TyxFX32bhH+187mMRWThGzQOAo0awlNTb3qCntUjfEZT9WOGl0ysUaKBAyNC4l7B0qsidh7p1rMnrJfhTB77VxSBtA94J8o8yvyudyY21QBSRMM4+IBs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 08:54:56.4930 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 341d59bb-a464-41e2-e292-08decc4e1af9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF49208036B
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
	TO_DN_NONE(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lijo.lazar@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 031F0697B07

Fix the indexing issue. Release the kobject whose init/add failed, and
unwind the successfully added ones.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
index 14cef0264c17..d0d494e00cfe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
@@ -904,7 +904,7 @@ static void amdgpu_xcp_cfg_sysfs_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_xcp_res_details *xcp_res;
 	struct amdgpu_xcp_cfg *xcp_cfg;
-	int i, r, j, rid, mode;
+	int i, r, rid, mode;
 
 	if (!adev->xcp_mgr)
 		return;
@@ -950,14 +950,16 @@ static void amdgpu_xcp_cfg_sysfs_init(struct amdgpu_device *adev)
 					 &xcp_cfg_res_sysfs_ktype,
 					 &xcp_cfg->kobj, "%s",
 					 xcp_res_names[rid]);
-		if (r)
+		if (r) {
+			kobject_put(&xcp_res->kobj);
 			goto err;
+		}
 	}
 
 	adev->xcp_mgr->xcp_cfg = xcp_cfg;
 	return;
 err:
-	for (j = 0; j < i; j++) {
+	while (i--) {
 		xcp_res = &xcp_cfg->xcp_res[i];
 		kobject_put(&xcp_res->kobj);
 	}
-- 
2.49.0

