Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /r1DExf0OWplzQcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 04:48:55 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CC56B39AB
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 04:48:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="4pw5//de";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E72210E799;
	Tue, 23 Jun 2026 02:48:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012037.outbound.protection.outlook.com [52.101.48.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0815110E799
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jun 2026 02:48:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1iC7ZVadIMzg+woGPWWPZo2i4bYyddALKO4dkdDoACwjp0D9NvHOuH+52gH4Pc+jU8Vjf3Xn3rr3s8/J8fNbm6VXyOdnBUim2bqNXy5S4keTRId4sC+9b2i49sUxpkrYS+xd78KYIrTQ5YI9FX9gC/0BF1yN/l0lj1k9WDQp3m5KgU9bWPq2y29SwrVMUmT9kyXUVcEzHYdC5lwC4Q67hUz7JiGPLGGKYprdcdcrddxTqvU+PO+JmpzS+ac0NAo3YIR8sPzWYf1R2tJXZHxQiEzZgHDsfc2E82tJVNnmcGND7QooVRGSRJGIuZ5jrfK3NtjOJKBJ2pNwjDjENjUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJ2fXwOeZ6w8Tj6RrTDern379EIY785ruPM7LGMrvXA=;
 b=sOpmLIbWFJMvCLL6lheoPgriKxswPcLR2QhOj9zU0m3dKsIbmh28+rRM79KTpIWhjtMUNvC1QHprrE4fyosmw7b2wMD7mXjlz99wH96qMrO/qMlH8gatayUwnlf55fuKFPmn1FqqFtugihQyfcRzvPl3VHbkApwSCIsC+Uq6yCaRxO9+ANuGkhoCJV2qDZAjL0vupEDgedK59+uQrqz7o4njvlVRHPIf9VPqtbI2xPNJAmtNopg2OVVTn4Ye26w5BKualUwyXRip2baMrIfABl4j6JfGOqo/akpq2ks3gl7Nu1yeUijD7qqNs83OIbbzQRWZDq1x03/USfBVeftBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJ2fXwOeZ6w8Tj6RrTDern379EIY785ruPM7LGMrvXA=;
 b=4pw5//deBPop7cB5eFJFsGFB71980Dz8uxchrg/MsSlBBjW2+BlSO3ruJFH1oqFgbu8HMlafX+1Ad6riNNSGgJwyhj8S/u8BbJ0qdn9feQn23830ywyBrSRVCRAHN6LiM0TEO4WFD4r9djBLrPnRGWvzwao8ivog9wUdeiT0a+I=
Received: from BN9P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::35)
 by SN7PR12MB7275.namprd12.prod.outlook.com (2603:10b6:806:2ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 02:48:46 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::4b) by BN9P223CA0030.outlook.office365.com
 (2603:10b6:408:10b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Tue,
 23 Jun 2026 02:48:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 02:48:45 +0000
Received: from gangliang-mlse-vm.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Mon, 22 Jun 2026 21:48:44 -0500
From: Gangliang Xie <ganglxie@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <tao.zhou1@amd.com>, Gangliang Xie <ganglxie@amd.com>
Subject: [PATCH] drm/amdgpu: add check for xcp id
Date: Tue, 23 Jun 2026 10:48:09 +0800
Message-ID: <20260623024809.121196-1-ganglxie@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|SN7PR12MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b87c01b-cc07-432c-578e-08ded0d1f1ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: eHo8rcCHvl+emXQMIiF9P9yCC/AsKvwe/Ialog4kpsuGGOz/Zce/L6E8Rf14j1EzQPPmakTzqiCkQXSCRGuj0JaYNq6ULIukwawNXRppP568gfRw/dF3iT3yXGJaFAoYUE32XSHFURDLbS9VQ9zbpICg/BeS7ZmbGA5gZYoZsp6pyAhyhGk7lNe/cYERWnFrY34lz7eAkgIvCBGSepv4Q9A5DGX4GRX9lpHJCt/limo1VnNX2e1J0raFT611HKH7buerVX5Y9ijw/YVQ7emCkOSulrMSeLTbVbpID34FowWWLnb1jI+9EiyZCQMMW3L3RzM3B28Ml9ZAC6cepQ0BTFaHEbBpj0JNiUWu4ecjh4ZFe0K/wBVD6zf4BK1GE4UmP/D0QVgafvb6oDZEf4Cj7yYAGCOOx9Q209I7zVDtDU8sIMhHSMqCsq8rnJ2MHXY2OYBcDCaDl5j9oJG99MOLdNUwFo/C1zXSaMZC6vTkZ4rXHEa31LZdCvXJ3JKH1+wKxcKu0BgoAnv42pr0Q9nrBIqJS4d/IlyEclfsu9hw5NfbsnyVC4jYUAMDw8w77i/+XF04NDnyPD0C+B7AgY+kGpYi6SJEyHePfSHTHFTrZbpbzVRXtGqPTOSKapquZ+8zS8RxUzySoh3paevFe4zOaw5PqQYPOikZWjRVZ/CmOdpopXuUSVj2Mzdpq9yaYMpO4ODIUHKPN8xENIXPwE/mog==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8mPbd8zb3/vWuIz5ydEdDHbCeE1fGg3Y62/7/yyUDW1hFzoXM6x1weLhveOU8rs4AVsLEoZ88aPaZ3l7dhLs/Eigi8323GWc1rYPLrfMW8lPkkNOHOqiR9Ge5Q06jBDF6iSwXRQcHIz/9A2ut0d4uvuVXJruzoU0dK14v3AgfB0y5QNZRXqqJYJzG8dfQusoAhc6/rBJS+bXQ8yNf/TrD2b+YcL/DtMtvA18elscC3ZjKjJ12rgbpYFeLokPVXm7dFdIvW8sQxJJFqmqF9nlboHb3VpLEidf7mtfrb2J3jht8rZlt8u8trXFnaKKoEtmeTcEjcs7zR9ximaOgVjtkW/uBmEPo9Lk6TxvEDDnb6BoSXHB6CrCB2/uGl2eVgLn9yceBv+PdWZ+UDZD/BzUn6Z5nJEm8jVEiRG8a+4SRIIqVGUGllJpncZkiZTe1Qja
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 02:48:45.6336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b87c01b-cc07-432c-578e-08ded0d1f1ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7275
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
	FROM_NEQ_ENVFROM(0.00)[ganglxie@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81CC56B39AB

check sel_xcp_id before its use

Signed-off-by: Gangliang Xie <ganglxie@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
index 88e6eab91bc6..39416ff7386e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
@@ -576,6 +576,9 @@ static void amdgpu_xcp_gpu_sched_update(struct amdgpu_device *adev,
 {
 	unsigned int *num_gpu_sched;
 
+	if (sel_xcp_id >= MAX_XCP || sel_xcp_id == AMDGPU_XCP_NO_PARTITION)
+		return;
+
 	num_gpu_sched = &adev->xcp_mgr->xcp[sel_xcp_id]
 			.gpu_sched[ring->funcs->type][ring->hw_prio].num_scheds;
 	adev->xcp_mgr->xcp[sel_xcp_id].gpu_sched[ring->funcs->type][ring->hw_prio]
-- 
2.34.1

