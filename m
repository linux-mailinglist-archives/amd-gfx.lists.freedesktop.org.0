Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T5/oJOC+LGoFWAQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 13 Jun 2026 04:22:24 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC4F67D86B
	for <lists+amd-gfx@lfdr.de>; Sat, 13 Jun 2026 04:22:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=o8Cjzz2b;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02E210EBD6;
	Sat, 13 Jun 2026 02:22:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011010.outbound.protection.outlook.com [52.101.57.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBC510EBCF
 for <amd-gfx@lists.freedesktop.org>; Sat, 13 Jun 2026 02:22:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wY6XCyNVnR2bsPOw+2awSEERBI4dIKyfLZUZMONb9znUKC4+/ZOLD+xE6Gu8vBF8x6WwwGEcQWOy1Kdl+BZ0Xj7CDfSBYJvrXKxSLqaXdI3klsYTxh0ALOQ4OAB8dYNKYgrT417wOx0o3m5UCI9CMMW3tC5Wtl5Njk2kSKBF9WYjZnnxbER/e7Sx8f3Q7xA4iFZMUM8I+wczsn54zeByf+9u/g9pv6Hnyc8UCRPSzmME37EjSm8+uqLGiUYf2ajbHn8y5DaClWWJJTSSAsosgmkaRFqs0GW3oEKSJNBEFZLQrlEU7XeRtfQc60qJ3zwA4cyYi88xTWSzLrI5tbjx/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qb1xrY9RqMsR5cbK4wwEFfRNmY8HDXNoJCNpNirHdvk=;
 b=eZJYJr+Pq/tWIrhtnNhm2Zf+IdIyHX2QhVdl5U+r66RcAsZ+vlYy56aFmtmz5rItX++BfMaULc2CUvIfdCJc1wuRFcYZGHe8OfmC141tJt6G4HRXTLWgY1oP04p0sqRuCqpSVySOdjDwvnJ3mIZrMeAVAqQO1BWNtpusUyLq9aL9SucBV1pacn57VzVvPqWConRLQv2SxtLCDwFbxhD4jqcHXH0z16NKIdCTxj4nEHNdp24VHRIu3bZLmbCTI2HciRCtg6WiJTRYA9i4g0JLZ67As/GWR7i0+1JbRCJVA7U9es/zAi7Fgkwfil0xDeglCEEIvzuwzjunwUVCT9Apaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qb1xrY9RqMsR5cbK4wwEFfRNmY8HDXNoJCNpNirHdvk=;
 b=o8Cjzz2bJzjVULRHwWFLIGAsRrUMjU9aqUx9SONAbly84JBdDOpk3VQHwrxGSKwRgI05uYnUb05DetYAV9rXtvVz6OMQY9MYVUEyaUOGYXum0dcf0iN+S/cmWHsg/Uj6tG1kmS9s493PLMzfJ7tifMVYq7x+Kfd1o6sCNnAimws=
Received: from MW4P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::18)
 by MN0PR12MB6223.namprd12.prod.outlook.com (2603:10b6:208:3c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Sat, 13 Jun
 2026 02:22:14 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:303:8b:cafe::46) by MW4P221CA0013.outlook.office365.com
 (2603:10b6:303:8b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.15 via Frontend Transport; Sat,
 13 Jun 2026 02:22:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Sat, 13 Jun 2026 02:22:14 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 12 Jun
 2026 21:22:13 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] drm/amdkfd: fix list_del corruption in kfd_criu_resume_svm
Date: Fri, 12 Jun 2026 21:22:04 -0500
Message-ID: <20260613022204.1147028-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|MN0PR12MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf43865-184c-41c9-e778-08dec8f2950d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: EO2C+xleQR35QTHoRBjzPbSjoMpTn3jIhdE9QFcxhyiWNPWY/TDz+p+p/YeQsDTL1T2KLBTxavzsCktNgkPAwyiXix/HmjN+DgBhL14OW18BXd5uLFc8UisrKG+ABX79EqTCkS7SrJQaSm9WXhXVwVB3wpKTdVwXgML9naV7kIMumyUD51TC3+kHKzAOtQeEl8bV5II3/zadTDbOVxSSdu/iYUPkSQSgka8LGIDohXFp2KaHV8srYIWI062hq4VgGfvRy2aDINVYqaAlILsVmhQqCWg9/pGlhZZRiHvkQATCU2fUGkVxsd1eleGP3aPf90hcI43b+oScVoRgCmzvDTSE3rkCk0OT6es5BLpi5E0ViLI/c96O8kwy38s48BQZOzyQt9KOT+QRrXDJYAFpKyLR4lMyymjlaxnohRCjjuf6rUGeGaJ1cRk5zNYHjdkFlJnnRqEArA0lXNfuNFVY4ra4MFIMuG+rJ5N0gXC9Wd7Xiu3Bbh+icIjVAZ0+GYm6tw/EwPofKlBu/6IEpBzaLc4Y//0EMxJFOlhImiSiqBFv7dc8B8iJTRb07DLx5E55mKDqBnLjdUfSOHYFDRhKEOvuh7lXaxy48zr01Qif1KhT4dk2MJbWcyQ5K7SrzAQjs9rKyyB+PwWLUIRngIi7bOEUkIH4L5B8RoT1Gqn82LkQ5rPq71/z9RqAZAZ4YAE2Rg2pk/nE7M+MRJH+t0uX3apxfvlRKJpVCkLN7W2lEkY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(56012099006)(11063799006)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hW23ZsVhifkFzz7po6DgvKcI1fWC4IXTECovKjPYOiUGGD7CkU5LTR0a+lVLtnyjC4hLwF28flyuyGbAt8wnGV4hbuui/cjsbGj2L1iH5/Jl4DZbbCswxkh7wqMnmW+YXdYncTaaBwLFe7L1gVYDq/XYIeebRkkqxzg9MWB2s14lQ4Way+KoImdZ861n275+eYDFUsISXdOD3Oq8t+HqqfYHc208ZzsGVn28TyTbKZr8mLg1Ve3hcqzxNi3ZRU7S+DnGs7KeuYleI4abo6ABYS1jzbChG30CrS/pVlYplVFyQqW9AeK1XYQPqbYLCnUKqGxs86mWBSMX5Ch8d1BiOEXgM/0B0jYIHyDqX06PKGrJAp8Jvj1Jp3LDyTMuZyPt5K8qbkjK0BagSD6wRWXHKJb+8DOHv3F3TArz6ZSc12oTHoB5UlbVcN+J17k4+jsl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 02:22:14.0699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf43865-184c-41c9-e778-08dec8f2950d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6223
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
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEC4F67D86B

The cleanup tail of kfd_criu_resume_svm() walks
svms->criu_svm_metadata_list and kfree()s each struct criu_svm_metadata
without removing it from the list. The list head is left pointing at
freed kmalloc-96 objects.

A second AMDKFD_IOC_CRIU_OP from the same process re-enters: list_empty()
reads the dangling ->next (use-after-free), the loop walks freed entries,
and each is kfree()'d again (double-free). This is reachable by an
unprivileged render-group user via /dev/kfd with no capabilities required.

Add list_del() before the kfree() so the list is properly emptied. The
list_for_each_entry_safe() iterator already caches the next pointer, so
unlinking during the walk is safe.

Fixes: 2a909ae71871 ("drm/amdkfd: CRIU resume shared virtual memory ranges")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 8d241ad760f19..df7fca65e9a21 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -4115,6 +4115,7 @@ int kfd_criu_resume_svm(struct kfd_process *p)
 	list_for_each_entry_safe(criu_svm_md, next, &svms->criu_svm_metadata_list, list) {
 		pr_debug("freeing criu_svm_md[]\n\tstart: 0x%llx\n",
 						criu_svm_md->data.start_addr);
+		list_del(&criu_svm_md->list);
 		kfree(criu_svm_md);
 	}
 
-- 
2.43.0

