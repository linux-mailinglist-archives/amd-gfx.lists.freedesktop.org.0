Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UOAwARXIQ2rRhgoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jun 2026 15:43:49 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC616E4FA0
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jun 2026 15:43:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=OfpN3DqY;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E4F10E20E;
	Tue, 30 Jun 2026 13:43:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD93F10E20E
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jun 2026 13:43:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUczrNGI9SNFYT74aLMN1PQOQvldCws3LvXt/aEp4ivthSlyg4K6s1UPqByTXhsoNdCYVf4JaPi7GVBJZaHD6PGfNr/kPErU0rYofhGFugzVmptEwU13USNnGWkYlUYEhBPigVKbj6FNqvFcnT6qHrgqerQgd04B7yLJGSd2OXJj9vscebFyD0z8cajNOMf1LXMFFQ7MZtY/LfWPjyo09R0esD4jtGxk606dvDgKTQW2zmhxjCaFedWEimOv/H67lOAfvuRa+uYtELPsn1gJfbzvVu0W53LGWUnSBhzEg6fdPUtJ18JDAhiToxgv2Nq6sezqm76N27vlC0PuH2/6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5GsllFqqSbwNmzLapK0sIMgmCHXlEPK/JLLvf36lkw=;
 b=q26E4zP9mYQPWKo25GmFQhV3c773hxFZ/Kk2NjRC7XAQ6TIo8EkV07jvFU6H6Y0+17F76uNt5kMKf8V/RMkeAacxKU4J8YSY5bBckIbFRBfY97sIsdASGzvIu1h1ZJG7ZEKBBrtTyefW42jjVnGkc2aoEWHcxcmOiPGMMXUCZhsZBY9q+Oja2Z71yeIbJK3rUzI52Txll0OljWKRMVfrjqZwPxwCJMvAs2J1x2W+10lpVbPsX2/yg/okvlXxjpX8AXNNxco1CzmWyS+4I6M2YFZ/r2OSMhBQA1lbm3pXaSEHmYtbRpW3J3isyUDu7yATeFTUVKtDxP45woxfD4Evtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5GsllFqqSbwNmzLapK0sIMgmCHXlEPK/JLLvf36lkw=;
 b=OfpN3DqYotr5HCmY0XbG0IDG5Y5fn3HJd/gfvpclGWcYgvo0mp9t3zCgv66JZb3uFjWFhYUyF36uhINY61fLtddZ+aArJ4BGGGHrz7PU5dtK8lgCctYa1ITJrJ8f2Ey4w14EUolsn9+nrpdVnPAf92809iXBverr4tcuuRf02Bw=
Received: from BN9PR03CA0514.namprd03.prod.outlook.com (2603:10b6:408:131::9)
 by IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:43:42 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::6a) by BN9PR03CA0514.outlook.office365.com
 (2603:10b6:408:131::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 13:43:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 13:43:42 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Tue, 30 Jun 2026 08:43:40 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [RFC PATCH v2 1/4] drm/amdgpu: Add PASID fpriv ownership helpers
Date: Tue, 30 Jun 2026 19:13:21 +0530
Message-ID: <20260630134324.3118873-2-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630134324.3118873-1-srinivasan.shanmugam@amd.com>
References: <20260630134324.3118873-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|IA1PR12MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 6780b1a6-c0bd-4981-b481-08ded6ad9989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|22082099003|6133799003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: oNOsHDp8mWFNbkg13EcpPryQWMIbY1qCOYV6RJhBufIsFy3Zbr5PWGOJWaDwu1LdPBtYOibZoDK2Sm2COyFkHYWjQ2Ht5s07HY/gtLxpATo4dypagYsuttyEXpTiJLENmv6RhjrHkwPynAfuBWpbKIrUifoVV0NrUWY6MS99oSKUh/xuugtCQJtaKZKd6pZOxh+PdOaAMabPLYZHYGlDetgi6c8r4svW3EapJ2puXbe3mriIE34wcssm2dm76XZsnbGlBCg/SaNDUlNLV8msJ1TYul1gkr8vwredMLh6JohFuQMttY7TZSz/va4UEDRQR7B4BmVOj3c8tc4BEeFFi8SakKLyBjX2rAGxhUSCDEAkrIT6K5l3wlKen7+1Rfv4DhUaXFRT5XTSufwZf0fzFNn8n4Nzr32Qlq7JtUQ7jRUeL8HtLo8+aflNtU33IiK3yptfrt4b/ReZcuzAZLuVgHg61ASDn7BNbKPewf4nYFcPLI67CtmdxYlBXmAXvfauH+Kzz4iH4LmaBN8f46yACCdqI9FxqeUCj1yqn1iX2H7VMuX6oEbiwgoL6l+HklosfRlEfh/w9d7hZzCFIQyl4YSmnTlxNeCPoG8mrI1l6zX+6YUWd+b1adwTp8UUxo2wLKsuxV9PElmI4NDa5xT9zh4ErNwyNTUJn/uBGFmyhG6un5rF4X16kY+kW7AqcXp/AXGZ3fht5J7oKT3C018kdA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(22082099003)(6133799003)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: x6grpGsmKEd1P6baVR6/kAe0lMnnUUOEiIvmwuJh9BHsa1YwmUwueTH/a0dLnwPx9JXWxfA4LtdiwIB5EJmBd2uT2Bprq5/+Xmwg131tmML0bzHhM216NNKRM4Fqld93zY8TgniWfSa9RZ9NM3PixEMbRP4A0kmql4R8aPy/GHEEMMNW8yoazh48x3EQymoWqdBMY8K825A6NSjDnrHjA3DvOdLz25CZRQEvpT/ueHfvAkzRGm+C80DHjLYJJbp8bZR3Rv4Lf6dAh6jjZiWbT+Msd9Dlg85rQImNNwha84bFJG5ZLXoQAJyF7e72Bk4ps81eF2UAU+po5ljZxNvo6Q2fi2ds5SamwxXtaoL94a0xxUp0xLp/YkNl45oYyHHJQI/8xHsI9Oy1miwAW3YJnnf+h01Axd4DewY5QZuPGqVOr1DfWbxMu1BDcBeydTfI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:43:42.6384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6780b1a6-c0bd-4981-b481-08ded6ad9989
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6532
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DC616E4FA0

AMDGPU already has a global PASID xarray used by the PASID allocator.

Currently allocated PASIDs store a dummy value in that xarray.

Add helper functions so DRM-owned PASIDs can store and retrieve their
owning DRM file-private object.

This prepares for using:

	PASID -> fpriv -> vm

instead of the separate per-device:

	PASID -> vm

mapping.

Cc: Alex Deucher <alexander.deucher@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 91 +++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h | 13 ++++
 2 files changed, 104 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index 684f40fce73f..f65d57b4cc04 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -78,6 +78,97 @@ int amdgpu_pasid_alloc(unsigned int bits)
 	return pasid;
 }
 
+int amdgpu_pasid_set_fpriv(u32 pasid,
+			   struct amdgpu_fpriv *fpriv)
+{
+	unsigned long flags;
+	void *entry;
+	int r = 0;
+
+	if (!pasid || !fpriv)
+		return -EINVAL;
+
+	xa_lock_irqsave(&amdgpu_pasid_xa, flags);
+
+	entry = xa_load(&amdgpu_pasid_xa, pasid);
+
+	if (!entry) {
+		r = -ENOENT;
+		goto unlock;
+	}
+
+	if (!xa_is_value(entry)) {
+		r = -EBUSY;
+		goto unlock;
+	}
+
+	entry = __xa_store(&amdgpu_pasid_xa, pasid,
+			   fpriv, GFP_ATOMIC);
+	r = xa_err(entry);
+
+unlock:
+	xa_unlock_irqrestore(&amdgpu_pasid_xa, flags);
+
+	return r;
+}
+
+void amdgpu_pasid_clear_fpriv(u32 pasid,
+			      struct amdgpu_fpriv *fpriv)
+{
+	unsigned long flags;
+	void *entry;
+
+	if (!pasid || !fpriv)
+		return;
+
+	xa_lock_irqsave(&amdgpu_pasid_xa, flags);
+
+	entry = xa_load(&amdgpu_pasid_xa, pasid);
+
+	if (entry == fpriv)
+		__xa_store(&amdgpu_pasid_xa,
+			   pasid,
+			   xa_mk_value(0),
+			   GFP_ATOMIC);
+
+	xa_unlock_irqrestore(&amdgpu_pasid_xa, flags);
+}
+
+void amdgpu_pasid_lock(unsigned long *flags)
+{
+	xa_lock_irqsave(&amdgpu_pasid_xa, *flags);
+}
+
+void amdgpu_pasid_unlock(unsigned long flags)
+{
+	xa_unlock_irqrestore(&amdgpu_pasid_xa, flags);
+}
+
+/**
+ * amdgpu_pasid_get_fpriv_locked - get fpriv from PASID
+ * @pasid: PASID to resolve
+ *
+ * Caller must hold the PASID XA lock.
+ *
+ * The returned pointer is only protected by the PASID XA lock.
+ * Callers must not continue using it after dropping the lock
+ * unless additional lifetime protection exists.
+ *
+ * This intentionally does not add kref/RCU lifetime handling.
+ */
+	struct amdgpu_fpriv *
+amdgpu_pasid_get_fpriv_locked(u32 pasid)
+{
+	void *entry;
+
+	entry = xa_load(&amdgpu_pasid_xa, pasid);
+
+	if (!entry || xa_is_value(entry))
+		return NULL;
+
+	return entry;
+}
+
 /**
  * amdgpu_pasid_free - Free a PASID
  * @pasid: PASID to free
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h
index a57919478d3b..220a0ba0cfb6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h
@@ -38,6 +38,7 @@ struct amdgpu_vm;
 struct amdgpu_ring;
 struct amdgpu_sync;
 struct amdgpu_job;
+struct amdgpu_fpriv;
 
 struct amdgpu_vmid {
 	struct list_head	list;
@@ -92,4 +93,16 @@ void amdgpu_vmid_reset_all(struct amdgpu_device *adev);
 void amdgpu_vmid_mgr_init(struct amdgpu_device *adev);
 void amdgpu_vmid_mgr_fini(struct amdgpu_device *adev);
 
+int amdgpu_pasid_set_fpriv(u32 pasid,
+			   struct amdgpu_fpriv *fpriv);
+
+void amdgpu_pasid_clear_fpriv(u32 pasid,
+			      struct amdgpu_fpriv *fpriv);
+
+void amdgpu_pasid_lock(unsigned long *flags);
+void amdgpu_pasid_unlock(unsigned long flags);
+
+struct amdgpu_fpriv *
+amdgpu_pasid_get_fpriv_locked(u32 pasid);
+
 #endif
-- 
2.34.1

