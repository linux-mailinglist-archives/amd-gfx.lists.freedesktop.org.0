Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9e2zC8g+TWorxQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 20:00:40 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F6671E72B
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 20:00:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=idxrXqMV;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063E410E4EE;
	Tue,  7 Jul 2026 18:00:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012004.outbound.protection.outlook.com
 [40.107.200.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743FF10E4EE
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jul 2026 18:00:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJVxwfpTGQcsZcfO1nLx6AB5W6tYWNj2R207v+tY1z9m+PhYvquR5uvZgCCvIRunbsjGuQTP6fnl4ldlhmS3H+sS7FfSJNKg7JEOvl2mXXZI5f1D1ixgdyS1bAghtlItObzp1w5hz10taxdrl0Pw2PQNU4UmEV0tSvR0K/NzwMglWEhF9F+0ocDBhixx45K3XziQm+bsK2LaShHroyPxu61J0iHmvdbbtc/sxUOhCStEf9bWwVnxWGQDAPWOcPdFV+lp8pv8iVhORJqzZRRyhbcOUPaQMq5tqU+/WJVg65EPuICxnkyCPvEJ1Df13MdP38YSpDnxflDPw7ZI5hEULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvF3Qo+vZwjfYPhMTtGX4KJFQgNzXfAu1OvRrrMmKjc=;
 b=YownIw11YODs78wlxWGI6frS3QvaHIm92py1BeCfG++Odckw6kleCOeJVGDZA76SkT4ajqKnZZ87sFsXvFPjycaSnMbIIq4oAFQqSz/hBLFQ9s8NsYdi6djBWQ7cvqYQHy4ZLQJPYUz5YQ3qYzFredIY1hMLg3d32MxSf1uyNe2Bshlfkyv6AHhOuhFATXo/+VhAsPu9idAxTYOr8iCRBf7b3aztOF9uQEfhnSdx6LzfZ6ZKE0z96oHKV0tOWG7+HS5MZn/8Gu/KDRQ9utyETXIv5AVvS0GqMZGLcigWI42kGR5N0GDIH5w0cjZx6f+b4D4K6EzYYXM//ducv9HCDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvF3Qo+vZwjfYPhMTtGX4KJFQgNzXfAu1OvRrrMmKjc=;
 b=idxrXqMVP7w53BZvQiXYMVManX4a6a6s0ykUAoqMrjIFYS4/Nbn7zVO0KozoHC0lBRY1KCfm44sYOHjzt+rSB+3VE0/8CRwSL1Crsyfh0KVrNUoNBuGauV9C8PE8hFmR+a5kY1T81n3Ot0TG8r3RchEZ2/6O+1AIFoUfKtbov4k=
Received: from DSZP220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::9) by
 MN0PR12MB5953.namprd12.prod.outlook.com (2603:10b6:208:37c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 18:00:29 +0000
Received: from DS2PEPF000061C7.namprd02.prod.outlook.com
 (2603:10b6:5:280:cafe::2b) by DSZP220CA0008.outlook.office365.com
 (2603:10b6:5:280::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 18:00:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C7.mail.protection.outlook.com (10.167.23.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 18:00:28 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 13:00:28 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 11:00:28 -0700
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 7 Jul 2026 13:00:27 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 1/5] drm/amdgpu/gfx9: fix IP dump alloc ordering
Date: Tue, 7 Jul 2026 14:00:17 -0400
Message-ID: <20260707180021.2642432-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C7:EE_|MN0PR12MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: ff796170-5be1-4c9d-1fde-08dedc51a113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: UKR2Z0cKI/yUiVee+sPWfhLcl0vNLuKYlbA/eOAxk2kTKN0vNxfINoEg0yjx8dW8OWo4h4H22BWrpvkQY1q+boMx8NPL6y8z+Yml48RanYvkPsvMnxDEBhd2JgdmTguwkN3jov1LSohZPaFK2+VkEq3DfEfqKh8oai6sHfXlrOZNEjBjQJAUvKFgtg9IZFv337VNFDNGb0Ga5mpxaKRt5QHIhWw8FMnwg8JD9dDee2cFLYnA9ArqG2N7sHYWTcBLRtTnIm8INl906KgH0Ti1utz29V1iiA4sa1w9AA1I8p/Xkcc7qTA/qKMU2S0mSlWkT2KxxUgK1VORmY/rWvRafnjVMmC6BtbMMGne7yAnmu677NCFwC28/Eu+7DVDqtdmZoL9M83JvqDjy4rMxpJYZhoC5lHTKq0WPMJLX+Ywnm3icmAjltlQtahYokaIrZ301BEwhDZMoZiOXi6DBi7XKzAN09mwpdGUBpibSTlrwpV1WnLMgO5qfu0KBUWnmyZi0AZy1Ol6LergXs4Jiho2qKh/OiVPXdwMfaI6cmpTqDmm3OZ7BpR3jCELJs5gO9/9gW1jK2+D4eYzWR+2pNsG1JaMfGlTJ0EhgcVsUsgxgylIT2M8qKbJDchIfm1IPaw5fWWQzX75t8I6y1v6HVxa4arcr1Iy9DTvRGstTqv/s0rxUdnria5i5swtLneT4I1vl4YaP+3o+PSrPUJHEeWgCA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(18002099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: F0pmWpfsnZrPwas5ImFV0+ZiV2Hvw6voUVCtdClqOHTBYyuewZlb6OGffOXriAFK0l/faFT/exKMdaoRWkjG88hfXAc0+2YpTg/VROpfiuXkMgA4uXsapEYr6QyNJsmCbid3OnrWKaJ8wG0swNb8n0cZdUWfgd+hP6vaRFYKV15LXP18h9/GK1Bbrmql2uCiC7f5WOfG+nQrFiwCxhuJUrMeP5zjmYlMvKN33kiPtuGYudafSsSKu93cupED3G1CXcpOfEzeDQwHv+e+4Y98mytLYgVHGg500TznWqc/kFDRIivGxV37+dl6EsxU8OUH3N79/9nI05bS+gZnLdDiI4gSLob0HJxa71BmLJolCJvHbXr9UuySwLjt1wmNPpEgZHGUwfNbyboU6K9mY2ntsnBUGd/cmGtOX3EnYU0obgiBXcs8zrA/qcLPl60k9/Nh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 18:00:28.5577 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff796170-5be1-4c9d-1fde-08dedc51a113
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5953
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75F6671E72B

If gfx sysfs init fails, we may leak the ip dump
allocations.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 7e13023c324b9..2202eed327ea1 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2441,12 +2441,12 @@ static int gfx_v9_0_sw_init(struct amdgpu_ip_block *ip_block)
 		return -EINVAL;
 	}
 
-	gfx_v9_0_alloc_ip_dump(adev);
-
 	r = amdgpu_gfx_sysfs_init(adev);
 	if (r)
 		return r;
 
+	gfx_v9_0_alloc_ip_dump(adev);
+
 	return 0;
 }
 
-- 
2.55.0

