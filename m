Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y3lzOFpjKmpoogMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 09:27:22 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D9A66F606
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 09:27:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=BnLqCujv;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E111110ED22;
	Thu, 11 Jun 2026 07:27:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012012.outbound.protection.outlook.com
 [40.93.195.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90B310ED2B
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 07:27:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxtE2U/WYSjxGdra36osBTQgCEV3lLPW/UjUk6ucwAEkJ1VWWpYqsou7VIQm2Yw0RY6rQQroIsbCt4UVlxxf37pA9YHjRp3j6jCAIwxOT/BYmZAb/WBu3/V2pcWkSLwPrvhpwQAYFc7p1fchr5eisXaK4WJB0PUC0zV5SuKUZtlNOXSgJX7U2hvUqX7D9rWpqSVkdannZGY+3G0diIj4OK8+lH/7sizgK7XNc1qFdcnC9c6PVM2+e1zamqnFAARtyWCGGm1KiP+tB2xpa2zKOGHV3TI7m8J7v+rO2bkuncwiqzk8tV0z16yL5tkQf3ViTxDMEg3hksw7eZupVq30Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4Rl3O+mInorPTnT+nCpQImDZUGwqt/qFNWwnN2/Hn8=;
 b=wlukC1nClClcY00QREpfelUiUUgqPzjNzSAl8I4WdJaBI9GBOrRTwuFWXjwMszXxw31l2aKQVGxLsfbM94zyWD4cQA7QGadXAqsln9HotgNHEnMGGN246Mm8u1h8RG+BSOMpLpRDKoO8jgn9VMMoQu6yfeQEBOfe1dL7W+jtoN7dThhh4efYHwXrf2c/AS9AIN4OblPfetBzBDSUIktkssSyyGpinYBusBCkyixlNpQua2KFOHlcfqZfhdqXeLfYcHDCVcPycYqMSWRblohs1EEmkdodjbN2JLZHU2Q0i0kh7chMcj/rnFcl1aU02TW2AkUxGqOPxekvnHu9psVOFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4Rl3O+mInorPTnT+nCpQImDZUGwqt/qFNWwnN2/Hn8=;
 b=BnLqCujviDXzVrDGsZjaLxdNaaU8fH7nagvVfmgJa4q05s2KBIr4ghoXDchTCX90TjlSp5jbk57TQEZuhAbcM3BkD1R45R7W7hmFeS7tV8QTyz5myXQrcYO+yuAylUEpnFI3Jk0Zmdq6g86zlKqVeaXaKJjaNIG47alsdzDkzXo=
Received: from DS7PR06CA0038.namprd06.prod.outlook.com (2603:10b6:8:54::19) by
 SJ0PR12MB7008.namprd12.prod.outlook.com (2603:10b6:a03:486::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 07:27:12 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:8:54:cafe::1f) by DS7PR06CA0038.outlook.office365.com
 (2603:10b6:8:54::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Thu,
 11 Jun 2026 07:27:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 07:27:12 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Thu, 11 Jun 2026 02:27:09 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v11 3/5] drm/amdgpu: Add helper to access the fpriv eventfd
 manager
Date: Thu, 11 Jun 2026 12:56:42 +0530
Message-ID: <20260611072644.2856170-4-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611072644.2856170-1-srinivasan.shanmugam@amd.com>
References: <20260611072644.2856170-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SJ0PR12MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb1e9f7-633d-4b75-b542-08dec78adb15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: unvpZULuWfTIMeY3tkdDr7YbdTt9ghl0nAYLDFfVegb3AG7XHNUnAg74qRcpxxTxu97mW8IsJv47NCmmGAWSx8szebzHWqKsEgz89/GVqcWplwcoLpU18M+qalMEInSX9x0K6MJ+IWJFhCeHDbIYp9vcqI3JERiLXmVat0RhuD3pnUrJbPbORS9R8NKXzLn4pibUHHPmyG7YvML1kxO6R+hRRbTXFiwvRw+xJ0/ghb0mMKh4z3uh2nJZAyKE1jseAnklklhbh5zA0rj4ZLDX4vcniA7k7lwSPnxINUm4pjm9i2oX6RyuqXgyfb497pdF5sP/nQHuhg4vi4jfWYvTfxo3S0Vah594CbEguArX66bNtxw0o0miMB8M2U7STwTXyEnC6GEenPLO6gDzf5mxOoY+lH0B63ZAdQ5iqchZ1qqago1QwC5pThJtcWKmXJ4Uat+aShhRv1OIxivkCgMCi0Gf376lNdMWcKXCSxlr85R8ivp6ZBVaQOWJ5B5XGQ0sSttCTQ899izfOih/9PWUip4SswzvWMOCgwUsvn2GQgOZ9qfbO92WP9JUqGnte1o1UHBYonvbLORj1aeHf+4U5/0h6nPjFpS/7uBBH3SKMoZaYDTIlXPtyum6FiZVKe1LgR6HMkEKdV7Rs6wtwyw8Q9gpSKB6K/Ivmn2IRG5mo+6o+1uLW9Bk+PZkfs/+RyzLuYoZtE/vt60//FuaEnwCZZgwmCZ6rsKOz81HLXCdOSg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: N1FVw2sc+P5PJwmnvGUuSWdV6yKwDw9rqoIjoM9/e3Qgf/+d6cbIx+NJN2fx8xPm1y21kQGLx0T9HbkJiCBvEcJBcq94SqtxnfMp2Rxc7XwUtsIUI+H5ymqVxiRi0Lf6zTwOXcd6KkzNTsOZ6J9yDLFF96mP0vQSuupYj59O8m0QX4ragxuwwN62/Xr0opMB6LhPcYXFDl83/1OaWtNfFCjpAh78SS7455d71duKD7x8iFo2jPcbGorsoEhnGEIIgV2ut+3IGYlfd5lygQHvmg6Dmu7CK5L6YxqwfRtTRZXtHEVd63LUYSKH7UPxLpT7+j6+WCZv0HIK0+eI+KFSLhg98cdCpKsTNdj7id5TSid4Wy5Fw0eZJW0sWRgXoRKWw0fujzszGiAOOqZ2qPseJgIrIY3dunEb90DyN2iKRGy1wamB59rz5/ENUObNIXPz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 07:27:12.7492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb1e9f7-633d-4b75-b542-08dec78adb15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7008
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:srinivasan.shanmugam@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56D9A66F606

Provide a helper to retrieve the per-file eventfd manager associated
with a user queue manager.

The helper resolves the eventfd manager through the existing drm_file ->
driver_priv link instead of storing an additional eventfd manager
pointer inside amdgpu_userq_mgr.

This keeps the ownership model unchanged and avoids maintaining
duplicate references between USERQ and EVENTFD state.

v10: (per Christian)
- Remove the extra eventfd_mgr pointer from userq_mgr.
- Use the existing drm_file link to access the eventfd manager when
  needed.

v11:
- Replace defensive NULL checks with WARN_ON() for conditions that
  should never occur. (Christian)

Cc: Alex Deucher <alexander.deucher@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 19 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 99c711ddf71e..427c09c83d6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -34,6 +34,25 @@
 #include "amdgpu_hmm.h"
 #include "amdgpu_userq_fence.h"
 
+/*
+ * Get the per-file eventfd manager associated with this userq manager.
+ */
+struct amdgpu_eventfd_mgr *
+amdgpu_userq_eventfd_mgr(struct amdgpu_userq_mgr *userq_mgr)
+{
+	struct amdgpu_fpriv *fpriv;
+
+	if (WARN_ON(!userq_mgr || !userq_mgr->file))
+		return NULL;
+
+	fpriv = userq_mgr->file->driver_priv;
+
+	if (WARN_ON(!fpriv))
+		return NULL;
+
+	return &fpriv->eventfd_mgr;
+}
+
 u32 amdgpu_userq_get_supported_ip_mask(struct amdgpu_device *adev)
 {
 	int i;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
index d1751febaefe..8c4b55517a0a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
@@ -183,4 +183,6 @@ int amdgpu_userq_input_va_validate(struct amdgpu_device *adev,
 
 void amdgpu_userq_gem_va_unmap_validate(struct amdgpu_device *adev,
 					struct amdgpu_bo_va_mapping *mapping);
+struct amdgpu_eventfd_mgr *
+amdgpu_userq_eventfd_mgr(struct amdgpu_userq_mgr *userq_mgr);
 #endif
-- 
2.34.1

