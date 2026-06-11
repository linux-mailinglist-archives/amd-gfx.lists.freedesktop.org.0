Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kt/BKSddKmrAoAMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 09:00:55 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E3766F377
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 09:00:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=IHXN0aXR;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8468B10ECFD;
	Thu, 11 Jun 2026 07:00:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011039.outbound.protection.outlook.com [52.101.57.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4239E10E715
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 07:00:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qb1jl6oqYcuwhbBYo1uOWiuiA+tovpNTmdOTnHwXXhuNJIfUzrCZ+P1U0f2yBo6B6CG0dBaVOwIbwKSIOAO8RfxtAkSNLSYrU53aCP+eBNmhp8Gwwrbjmmd6qBlYQjzDY5sa3FcKYfkLpDKGlGf6xbDx3KSOfHlCMNyNvbgwrOwVFYKWkPgNP2G/6Z+lKGbVkzCMo8W/Hyl6ALQLGU7E/3cMx6xboDGl3Z0Bu2guTsBPmoHh7jHY/Cw6tcPDCaT7jLslLXfl1OVz2lENOwZFlp0GLhr01rmmre7r+iOpXtKlA2X1WQs/Dkcmt0seJft41LwmZaEDN606P6pnhj2Txg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EY4GO/um4Ja/Li/LBHod1KsFSSN4c5nSabCvfNT0c08=;
 b=AcZoYDPJ8mbhNJZYZX/ikbPU1UoeJZ1BZqOYF/p5Lu3lJaqwxgWkZdFp547DaQsAyLAVuVYej1zsV2jjLdr+DLNKsf5TIWjASrcA02RDT4r4nzdkKw5j343jjKAnmKCDgMeZo7MGFyuvxZ13uWku4owuBfZ55eqzHKOLQOvHIkaNY0w2jL3RI93wJtyioyIiHZ4eQOQtGj4XwCtaVYqNIQwmKgwTOvLQKQSBSLK6FcB9ev7tdh6TjXm3ZlD3h55C1kpN4wcM+V6ImEoll8lmJm/2WAJlsWZS9TkRQDvuaSGwIDqFasab1g3HQwAyspASDpfm/95s2Kj4wVgvMHKYAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EY4GO/um4Ja/Li/LBHod1KsFSSN4c5nSabCvfNT0c08=;
 b=IHXN0aXRDkPhYEIiZ7BaIh8CTTMivhSONGh7hH5sr7/jqsm3w7Kapi0V3/fmDEWTBrMydVI2FxLSfijQC22kzntiQ1SiQ4kCDJ+jn8ikfUc/SqaneDkHlIk+mOGDvp6txNbaT9afJxDgRyOa0vTH5jd4cHFsvEeojj7jMPV20OI=
Received: from SJ0PR13CA0032.namprd13.prod.outlook.com (2603:10b6:a03:2c2::7)
 by SA1PR12MB8724.namprd12.prod.outlook.com (2603:10b6:806:38b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 07:00:46 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::8) by SJ0PR13CA0032.outlook.office365.com
 (2603:10b6:a03:2c2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Thu,
 11 Jun 2026 07:00:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 07:00:45 +0000
Received: from prike-code-pc.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 02:00:44 -0500
From: Prike Liang <Prike.Liang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, <Christian.Koenig@amd.com>, Prike Liang
 <Prike.Liang@amd.com>
Subject: [PATCH] drm/amdgpu: correct reservation fence slots for userq per-vm
 BOs eviction
Date: Thu, 11 Jun 2026 15:00:30 +0800
Message-ID: <20260611070030.186604-1-Prike.Liang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|SA1PR12MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: 5815f4a3-b69f-4cd9-b40a-08dec787293c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: URhG4KYkgX3xByFFnIKTiJJEQUhGOe6umd2YgWu12pOTwOuaFqQB+qNc3FZ0hD3SvJadXqQQtmQ6adDh77yDbpuAZYDc3tTyq+jOxtdcHPQj721TgJowK/3pClFPJNFoB7HBBr8uLM5Z/m/LJhusKM24HYDc5MnmYBF0rJL8BC0JBWrE1Bl4rb9G+fdlBvJPgFRJRqwXaMc3CAA5XjQ8Z/PfzBozjtSff/i3lzvNdF0vnnG9QyMULNAYGF1DDA2cDh8dDBGtb6dKqS8E7JSELTmAzqb77DnJeWCtHp5RaGiOw/Qxz5m66c2WQvjDduC4C14g5FBlbFOO9OWCcg2H7Xe3cIhdkwiqijvAfm2W73ME3hf9Z+fS/k02ujma72gAJP3uoPMR3VWeEb8dcRewj/Aw3E3YPloszGr9nV++VUWHlkGiteefAYgLVGwLiP5pfvOJAQa0u99dTzzIfl/Fa8auxQ+zTtvrGqg/G2jL3VbRtNxp6S1oYAeMCTIw+qiDVH2wX0e4t//4xr8dWUfvqyM0Oo+iQWVo6HaKcyINLf0WDdvXb776f1GauqdSrWaKYBrXZaboJeftihBOIW+Yr/Fn2TkcRh6wf1WHp1isOGuETTfAbMQHNHYCUyK9ePwlUxU9cx3LfZX9nXvg62e2FooJuzK/O7RPOoi+X6UOofm49je6vyNK+ySZDsluxjDJuq/LEVtSTcXnMqpVT9Q65yyaZTO9P2cV3YaU1GUT9CA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 049HmGX7HIbdhA+JH2pNC2jjsHpdDxLdzA6CzEmcBsOVlCsFValKX1iqJBO0/KN4BjUaggcwa8Xx7PxeJ0R0/nn79UR8e2ItKz5RiogqlDdqYzXgJFWpbEyMRYi2M5lD6bHLc01FvcLr2AV3r3FszA98saZm5UrLCyVU91U0YAv4JX9UkAzGwIwTK3MDznEmyg5BVudTZq7w8F8o9afCJYAbyJgNEQkWscXskLmYuIXgwpffEf4ci+jVjIAgG1iRntCdA9YPuvfJo2HIHHOKZsJnbnB3cZ0Leip+Kf9ZKnlqk5ZS37zC+ynXbbBMQIcYAp590tEyHG6AhdAX7IyVzuFMSUxSqgHCBmBH4stWNjgIbiddelO5tQOcqnFyjhlxQzzCTyqXKdDhejzQ87sHJK6mpMzHP5sqMacOezN+iEfmADDiuQIW05N/+2EUBQM/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 07:00:45.8751 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5815f4a3-b69f-4cd9-b40a-08dec787293c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8724
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
	FROM_NEQ_ENVFROM(0.00)[Prike.Liang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05E3766F377

It fixes both the move overflow and the eviction fence add for
evicting these per-vm BOs,

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index cd0ae8a77c37..c1175cb6d242 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -935,7 +935,8 @@ amdgpu_userq_bo_validate(struct amdgpu_device *adev, struct drm_exec *exec,
 		spin_unlock(&vm->individual_lock);
 
 		bo = bo_va->base.bo;
-		ret = drm_exec_prepare_obj(exec, &bo->tbo.base, 2);
+		ret = drm_exec_prepare_obj(exec, &bo->tbo.base,
+					   TTM_NUM_MOVE_FENCES + 1);
 		if (unlikely(ret))
 			return ret;
 
-- 
2.34.1

