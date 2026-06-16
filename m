Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RG7LN01nMWo9igUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 17:10:05 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 532DC690CD1
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 17:10:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="g2gc/zcj";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA7E10EC40;
	Tue, 16 Jun 2026 15:10:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010045.outbound.protection.outlook.com [52.101.85.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9DE10EC40
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 15:10:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcg4LM18LM5dXj5BsqKd5Qcb9LiEZUuXHuuMfZlS9RrocLbM5qVb741HL3+URDdLqHCq7SReIvYAfJ2jX7D5twbTSi/34+Dv1lspuwGi1kjK4E7/VUmZO+lK9QCKDe8aJbrNQPLHljNsLv9K4U1vZfom0SRPAaUfS/0fT34j2bxNFyZDXGiIjhzMWgFsYaffqZGYV0ZEENKaTFGT6QIv4qJLyqQwiPTcLkWnPnTB7YoD9+oy9xPRcYKuzHOYMvaU1a19uIwjSw4u/jIOjm+x1R39l1rbCJX6oeZt3pZnp+n1o2+Es8qNADK6dHYYZ/77RQ7pGeQjTtgA2+4D2d9AYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrxwhDvuiWjG/OwDSUAwmaZWVbUdOpvK6BqUzxZoerg=;
 b=y/PY8ngZXix2RXKJ77FAfCrZgTJU9U6rqjtScc7Hx6cDBBLNNzuEH+IjEkr373itt05+Kmv9QfIaz/VuOOb89JWil/0awXIxS30wDhABly4j1LQMX9YpEX3nBxN3i1OerpQetw/0GteoUULvbfQ2PZTcu8ro5L8PLreCkJr3XI9lvblm20tTW9R3oGvgcXPpkcyOm/TaQx9H4TnEKvN7WhVBNRGw02sWLZtIFcyZ+qqJcagffA11Enc//8i0e89Q8Sx+EiAGfLNxViDtsSVCw6f7+IYdXwJSePZJj8SzLl2epdZj6NSHyW21J/IGr+jj9koIBlExKKo3sYhLWWaFzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrxwhDvuiWjG/OwDSUAwmaZWVbUdOpvK6BqUzxZoerg=;
 b=g2gc/zcjzEN2ub6JLGycEdS8wtu7qg6epHKv3lXpgQoOMJ5SiC8oJ/iI78389Va7Nlzmg/dvJpd0VVXqVz6glImyIxTUQ0Vytkd58loBbDwGI1+aEiuh2H5X9yS2bvSbPleaNFbv7xeHFRrBrLc9AhjPS0+CMSrRwplDt+pozII=
Received: from CH2PR08CA0013.namprd08.prod.outlook.com (2603:10b6:610:5a::23)
 by DM4PR12MB6207.namprd12.prod.outlook.com (2603:10b6:8:a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Tue, 16 Jun
 2026 15:09:57 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::14) by CH2PR08CA0013.outlook.office365.com
 (2603:10b6:610:5a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 15:09:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 15:09:56 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 16 Jun
 2026 10:09:56 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 16 Jun
 2026 10:09:56 -0500
Received: from Xiaogang-ROCM-Dev.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41
 via Frontend Transport; Tue, 16 Jun 2026 10:09:55 -0500
From: Xiaogang.Chen <xiaogang.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, <Philip.Yang@amd.com>, Xiaogang Chen
 <xiaogang.chen@amd.com>
Subject: [PATCH] drm/amdkfd: Use last + 1 of vm range to check 2MB huge page
 alignment
Date: Tue, 16 Jun 2026 10:07:13 -0500
Message-ID: <20260616150713.301236-1-xiaogang.chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|DM4PR12MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: c64857ba-260b-4b2d-d215-08decbb953c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: LUQounJyh/SEftNFA+XHc9q4AFdCzs12YJ1Vy/Sd3zk4TPWobNqYPQ93/VMA24xr/1S43VjDAHK8c/L3Ozr5JTvjcqgqxDbQRik/mp6USZpg0xxygM4xEuGHjFmHBFooDKDmRcoRsrAEq0ImfUZflbSQnWmAKewfNsXO6ak3ts5oHwA/824tobjkNuMooKLNRe2MZbhSewHz3eFgs0TMafbzKd+482bkTuMyjXFi7qsl+9n86m1nKYGcSmwdA5/BdeXmpdn72ZjWG2K06FTt3BYEqkSXOuykI14ZtWdTfR2nTu6ItiGtzYNys6eBi7nW9nQDRTpU9322frjjOlbiKz8zs/WFks2yxAeKhSTNPn3pEVOCcCQAhqM33FOG4AP6NaWi1dBbJ/VLrYPWb6LGrzVg7hrxiTg6+3DDRY0phSQX52cNomBeitX+ac/PhgDUvoF7LsSD8MBzp8V+cP0iqSCbGSG7LW/5ZVTEtNcK8+wQNzCaZdQ1DzdqFEXd68u7Yyt+9vx+CXrWl2T+V2UazbSKn32AVHjXHKn+CSOm/C1+YBa9cETlnLHqzwuT4Y0rXcvX/Rx5RKKtxk5fYv8UXy1wuVGHU0zTdqBRXPJ913E+0+jTJWqGAoGDusbzy3h5dm/JmYw4JOEIyu32hvhlMYCJpHlrsKxf4Ez+5zePxR9DRZ4A2Iq2V8i4lN83M5ZxcZhR5o/WAiCzaBkMqosHIAjId5cs5mh2Ni+RxGgknPM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IaaVRE/pczVmjIXuNJdwYg/CNOWyjiYfbtxxkELMqSKGY32xHR7kz2IYS7ZjfgX+J3wi8HFHcooEH6pfUhcytznM7DlMruxyTXjduPRA9YE44zylI35RHArpUxwBcA+dgFGFakuURrvK4fH2pi5TQ6G+1TxmnKZEiXIy/lG01nfRSetK59VId3v/y1iU65wNLjtWamAw0cjKlU/qE1SfCS4r78vO2Zjpd8wZcqG9Y/mHY+juXn2Jx9CFIponKAvRtVPA3M3i3Z4OffWQCKTeUTiJzo4RcMOXMQk+wpwWA4k+siIHhiyAedZdhMGCbAPP24NsT+hjzwG9FgH5ILkF5RWzhMqrZcQ5QFZvuSRjPtrxn0JkUHzRH1fvgjLj567f2hRaZd+Mi4au5c2UPaEh+hSU4P6hpfDFk0apmgUvs0CWURy2wJ07yg0uyuNprsBT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 15:09:56.7446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c64857ba-260b-4b2d-d215-08decbb953c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6207
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaogang.chen@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 532DC690CD1

From: Xiaogang Chen <xiaogang.chen@amd.com>

The last byte of svm range is included. Should use last + 1 to check
2MB alignment for possible huge page mapping.

Fixes: 448ee45353ef("drm/amdkfd: Use huge page size to check split svm
range alignment")

Signed-off-by: Xiaogang Chen <xiaogang.chen@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 25b3ecf85f30..20ccdc4dde6b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1144,7 +1144,7 @@ static int
 svm_range_split_tail(struct svm_range *prange, uint64_t new_last,
 		     struct list_head *insert_list, struct list_head *remap_list)
 {
-	unsigned long last_align_down = ALIGN_DOWN(prange->last, 512);
+	unsigned long last_align_down = ALIGN_DOWN(prange->last + 1, 512);
 	unsigned long start_align = ALIGN(prange->start, 512);
 	bool huge_page_mapping = last_align_down > start_align;
 	struct svm_range *tail = NULL;
@@ -1168,7 +1168,7 @@ static int
 svm_range_split_head(struct svm_range *prange, uint64_t new_start,
 		     struct list_head *insert_list, struct list_head *remap_list)
 {
-	unsigned long last_align_down = ALIGN_DOWN(prange->last, 512);
+	unsigned long last_align_down = ALIGN_DOWN(prange->last + 1, 512);
 	unsigned long start_align = ALIGN(prange->start, 512);
 	bool huge_page_mapping = last_align_down > start_align;
 	struct svm_range *head = NULL;
@@ -1181,8 +1181,8 @@ svm_range_split_head(struct svm_range *prange, uint64_t new_start,
 
 	list_add(&head->list, insert_list);
 
-	if (huge_page_mapping && head->last + 1 > start_align &&
-	    head->last + 1 < last_align_down && (!IS_ALIGNED(head->last, 512)))
+	if (huge_page_mapping && head->last > start_align &&
+	    head->last < last_align_down && (!IS_ALIGNED(head->last, 512)))
 		list_add(&head->update_list, remap_list);
 
 	return 0;
-- 
2.34.1

