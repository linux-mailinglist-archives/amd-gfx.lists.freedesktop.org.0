Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Oo3AIH/rMmq57gUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 20:46:23 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD1D69BFE1
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 20:46:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=NSd5Egm3;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B1410EAE4;
	Wed, 17 Jun 2026 18:46:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012039.outbound.protection.outlook.com [52.101.48.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B4710EAE4
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 18:46:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5Zncnqvwx1s2NxqwgkFuj+2ymNo7ksBv24O7/bmbXZ9R6oOWBeC+DHxe/ypBxcbWnthmmMVN/IzmMN8fMHa78em8FvvCDUqWhwDFFlJrlBga/c3Pc+L86RVSDdPLhF630zjpV7Av4OGaBMj0gl+qtzE98E62HP6rSyLdYk0v42v33QYhQFPIO3PKN4v39CQ49XqYPeogQOMiXy0df6RTShk0tAqlsnQuOhx/QqcB+x8iYuQj0J6zvK8Il8WE3fdgrUwfTr9jaGJtxJPclgEegBz1VedVdkA7p+Ch0QU+h6+iMTZmt0ZA0UAhz4+LIpLntTzeTqAYtOFF7bgzFkk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5kbPksL6TAle62jL0QtGwWimfoZ/7s2IlR8zZUjggA=;
 b=cMu8ZNyOiWBUFuyZTJpovOXOjOCrUYvc2ApTGn5TnonY33Aj1EjyjKE37PrevzsBkfC/d+rvWauedIhEcFtptpxhMj7ic7nzXnuDXTFP/EjrW8dWu+Sn/kRnubf8YuGi1IsCxA/TLbRlx5aGCOSo6/w8npVIYgNc6vhKV1ymNDdoV326JsLzFntDPiM4bd+29eYxXhvOYbmFE9uB5Bj61C9KsWf4wb3RtWFv94jn62Z9YvSnmaysnCqCe0XjDhuSrY469H393nGFbq6m/JHh6L/7ual0lwLRSJXxRynNFzip5zSaF/edty0E7x0HHRNxO2HmGLJUFBFY+ND4k8uJbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5kbPksL6TAle62jL0QtGwWimfoZ/7s2IlR8zZUjggA=;
 b=NSd5Egm3RT+Dq04RDCDLtKPkwsStZHGB3FSxvTwKa1a5QzTJfNaLlb0869T7+HFEN05POboD6po2p6kiCCAPtpF02e0KXawequKSKyi8NZoZuVrZyJd4LRcYJwyzI5ff7g3TTNXtpkYn0eBrqSHgSNsdcJN4b/oMhOGka3/oEjE=
Received: from BN9P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::19)
 by LV0PR12MB999070.namprd12.prod.outlook.com (2603:10b6:408:32a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Wed, 17 Jun
 2026 18:46:16 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:13e:cafe::24) by BN9P220CA0014.outlook.office365.com
 (2603:10b6:408:13e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 18:46:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.0 via Frontend Transport; Wed, 17 Jun 2026 18:46:15 +0000
Received: from eric-hp-elitebook-845-g7.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Wed, 17 Jun 2026 13:46:13 -0500
From: Eric Huang <jinhuieric.huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Eric Huang <jinhuieric.huang@amd.com>
Subject: [PATCH] drm/amdkfd: add overflow check in svm_range_is_valid
Date: Wed, 17 Jun 2026 14:45:58 -0400
Message-ID: <20260617184558.249687-1-jinhuieric.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|LV0PR12MB999070:EE_
X-MS-Office365-Filtering-Correlation-Id: c3da97ee-ed59-4ca4-6afc-08decca0b61e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: ZHgxIiO8OYXH48lQDAcViqLpE+vuU9Ev3se80NT46ehn9Gh7NdUondqPCCx0Lit68SZwdjMi9qmA9qgIUNS+2ebZvMqTbPadCWIs1o8Yapu8bGuZW0Wjnzm0+bgWPH3Tyv55uZDTZb6KVBDJubRF5HiOR+VTatJ/chT6tPgieio0alpkMbWtRKUDZuht7FNvh+jIFqioYuDTZAjcS2KOzxoV107Il79mZo2Hm9TC6AakhAm+0klhclaQSWHzx7WtZqQ5UnTV8IS+/GWOa9GrITQSzB+6Dd815nrRFhO8Lb73k5Q/PGl0PIGipefUhtIZG5QbxsQeu/oFe//RFahFUfa57HV0g/XrehUtwCQsSAHcIld2PJtcSkymfkFzYPEKd6ZjAcjAYTqWhcI3oY3mYTVt9V+B6/1qm3nNbuBLRtNO5FX9tlaq1NGLasl8eCwK68crfn/r6SRnpqMbg/E0Bjvf3lr4+6EwyJ4m52wQgMDD80jXmQRsxJufoBGgfvb5pyH6fn2E4tp2B7AG6lBGgQj/pzO8iwIJz+ocsUtjTMd0aYJgZbBam+JmKIIgoTN4wSlvQlbfL6JEIGU9/+QMyNExpC8C8raEhJ0ng2avV7cxFteDF9CMe61sWxxcbSPp4TWTY7SKzUCExYD17ZNVesOnc/GoCoL5uLYYJneMbEHUXDW2KqZ9vyrIAu6j0QTp1R+bU8GSUPfe+Py6XCVzA1pOabQSquQtgb43u6aPyYU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(56012099006)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: A7fDmyittRoo2nde8SlVWiCmOJnjdsFmnCt6NSgOfFtZUN0VVcELh0dvKrnAQGnVG3emrct4h6zGmT7Cgw8LmChPS+GaxVko+Y7PX68+rxLEREBO1Xev5JOEFy22d1mjN51tZFrPHyFZxqvhMB92JC17Ao6NsV5xQgC77HKkiuxoqyje301y5T1Xba/UiEJnIaAug05Obzn1F1HNwa+XMpKBqv8NNuL8d15clQVMKzPbZ00HbkiGwC5aGQi0daOgbXRfQpPQnEufegbbfY1oWBcq4tWOQFgk4LfpGgd6WzWsiT6QPW3TwmhJXCtLaIs58xrzE3xkZkOfYm1xQjVb8OsyV9/4hqQY3ivhKSPbPhF9IBTdEj/+w2gX29jl+1Y1GUUyXLknPLqCJwuXhPwrPZxe97izwxlp1mbov+VyW46oQK3Ro60hounnZ6ptFGnU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 18:46:15.5072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3da97ee-ed59-4ca4-6afc-08decca0b61e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999070
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
X-Rspamd-Queue-Id: DAD1D69BFE1

to prevent svm range to be overflow.

Signed-off-by: Eric Huang <jinhuieric.huang@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index ffecd818e611..ad4325d25e7c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -3473,7 +3473,9 @@ svm_range_is_valid(struct kfd_process *p, uint64_t start, uint64_t size)
 	unsigned long start_unchg = start;
 
 	start <<= PAGE_SHIFT;
-	end = start + (size << PAGE_SHIFT);
+	if (check_add_overflow(start, size << PAGE_SHIFT, &end))
+		return -EOVERFLOW;
+
 	do {
 		vma = vma_lookup(p->mm, start);
 		if (!vma || (vma->vm_flags & device_vma))
-- 
2.34.1

