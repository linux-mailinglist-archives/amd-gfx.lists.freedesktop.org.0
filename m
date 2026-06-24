Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2u9UNu4qPGpQkwgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 21:07:26 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2FD6C0DD3
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 21:07:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=RdJLLJpb;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D4D10E0F9;
	Wed, 24 Jun 2026 19:07:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD67710E0F9
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 19:07:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foRQssbOznlmyP95H5z+6xyAe652mgz2c6wOIEP2E5ucvReeb7VYNnHoqYFIKczD1VPJWxaGQupmfRB200ys0TXcUK2GJJIZYT/cokhRP2VMHlE1C59Au+oHR7qdan3kz/5nathnPl1mrmsc73tnUd3FK3sUWVsgbcq9Nn5+f8icvB/9PgdRpAHRastOI1xM9vSIWyKQLU8lu8ATzuww4SB4EubCioj4mfrK0iGpIsqSInCDHyk7QM4V7UfvoygEPK6XL1N4It3Lq0efbwaCD7eWQAeVElM/FauHPAkdXPzWEJgjoICcdoShYLpPTC7IzuZSHYWxgu1YMrzZ3SlkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcNinL6X/mUEZYXg6pCQ91dVnAhgtCZ4PwOYS8NmVnc=;
 b=Rgjdj+qR0IHDCYohvZx/ysv93yvVTOImGffj8wSLg/zpZEfSlbCiPBqfxQ7XwNm6CeLv1gSNGT2Him2RZouZ6AUh/GJWCydD//ozBGwEA2mty+15J/wcyHl+RyCuKMDpJkRauMBTIz/Ob71xGxuc5z2cMAgcF58FbZ09sxIi9qZBpj9szlvHY7l9U6wUCmHqomE3TYTvz+bMR4763L+lrU1B9LcRYEbR5mznfHxFxJeJ3tvmL3nmpdsxesuP1zZnshhsuO/iGfAuGC56vyc022x5UEwhWmrCFjwXhZMwDNKmkJDuqX2yd6t4gH9ziJ5jcw9VVrAiKJlwPtXArCg4TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcNinL6X/mUEZYXg6pCQ91dVnAhgtCZ4PwOYS8NmVnc=;
 b=RdJLLJpbPgjB8SI1tctmx2sf6lOwhgPT/IlP5K8IXaJNEBE4dbDecd5Zi3pN3I6mEzl0UvXeZCE5cIlDMX8xVh47jrW0IRHVPstsnZs9VJTCHMBbjBaamyolXyjIuHoMnXcCeC8aBKFDHXC1wsYrr9EvAnRwp9HSjvc+JtIC//I=
Received: from BN1PR12CA0023.namprd12.prod.outlook.com (2603:10b6:408:e1::28)
 by CYYPR12MB8991.namprd12.prod.outlook.com (2603:10b6:930:b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 19:07:19 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:e1:cafe::50) by BN1PR12CA0023.outlook.office365.com
 (2603:10b6:408:e1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 19:07:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 19:07:18 +0000
Received: from eric-hp-elitebook-845-g7.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Wed, 24 Jun 2026 14:07:17 -0500
From: Eric Huang <jinhuieric.huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <David.Belanger@amd.com>, Eric Huang <jinhuieric.huang@amd.com>
Subject: [PATCH] drm/amdgpu: fix atomics on gfx1301
Date: Wed, 24 Jun 2026 15:07:02 -0400
Message-ID: <20260624190702.596001-1-jinhuieric.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|CYYPR12MB8991:EE_
X-MS-Office365-Filtering-Correlation-Id: 702f0c9d-f76c-48bc-99cb-08ded223d011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Vzj+lTZMTrGXlSTQ0lE+5QA3mvm/HFEn57aKi7akA3FARnEaTCs9x+b4MLs9tNKmG4l36xaHEdZP35doTtFA7sCZZj9jLEqGHzxHmInacj2NF/g+YzdrHTLQx1WqLIp/OI9fOz6dKMY+PdUFIMV8CwaCXKLjPC4SWxRkmXl+xbI2YnQKrtDq+zqCwylJ4Ep3kfFzRnkbkxXyogbO/PoQ7a3Pj+LJZXwS10niVynyKhjUK0ab3SJy1nhvDITHvpY6Ye/FUMKfNxbLbbmBVyUH9Nf96Brz9u5IS3GY3CN5zkrY8+HEq9Ectemd6uTgjKqznhCRP6Esw0EzUZk0DmnSmaWDhiwCSBf3zS0c4UtVx5gSpWcJMjhXy/43M2+BiWMUyZ9DJU83HUymTZoIkyx+SPLCZXjVN2GkKWQCZ3elGUSi7AQzPiTHnHoBlX1aZ57xny3xGzn/V0+0I/N14H2Zff5DYpNLlU0Z4f5EGcpg601ElvcwR5rv2q8pfo+/BBNfUwVedOQQqiizX8VsqeTbCrAc2eRMwoQFpdOljpuJbx+iBpF8auauDiP1rUM9I3jVj5ESjsDRHnP9ZRQxxLQv1jvHrX/O9SStBA2gQDW0nexYcOGWI1UqEyAOzwFGuDsMAg7u13sMv7WvOtiyaA5s3RIYZMJrCeYspwrEalcqlYmmYfiHNHHr/cIONgX/QZRhxMoZZ8oNlZjosH9tjstcSg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wMiMcvR36UCfoBH3QOJy2CnGMrx+5Q8nImcMOJEY/9RVTs8wKkg7P3MFuvdjxEDlQvn7AF3vmwzV+caRKGl7NCxngyCkYjGhRrp2zV0ezxAQV163PNpDYh7MOdieDbJsQj7PJRMesP48auzwuGFbZ35c2t8z8GtuMRvg6r2ikLy6WOsIpUHGkhbUZudMmH6byCJFmJQfeks4XF8Xk6FEJfXpMx7X3pBUDcewRndQPQcJrx4Q6ec5GmeZxvmW7CDEI8nkXvYvx9rNiY6mUi+3zN731YWlj/UHthBSDNJXHuObmFyRoycWr4k0TqCaYGZU08+1Exd0qYqCIPQxlxruA8i3nIrAC4gvsyYkR75qefkvqUneGfalW4oPWyFfg529XmbrCk7LvSLymEYsgNIS+Gl4qB2F6xH7ZvHuYwDnm/ihmqeaCmrQ3IfQklwOHwFC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 19:07:18.9258 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 702f0c9d-f76c-48bc-99cb-08ded223d011
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8991
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
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[jinhuieric.huang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B2FD6C0DD3

gfx13 needs to program DF config register as gfx12, so
share the function of gfx12, they have the same register
layout.

Signed-off-by: Eric Huang <jinhuieric.huang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 055cc4f1c861..56a7764f3f8f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -3385,6 +3385,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
 		break;
 	case IP_VERSION(4, 15, 0):
 	case IP_VERSION(4, 15, 1):
+	case IP_VERSION(5, 0, 2):
 		adev->df.funcs = &df_v4_15_funcs;
 		break;
 	default:
-- 
2.34.1

