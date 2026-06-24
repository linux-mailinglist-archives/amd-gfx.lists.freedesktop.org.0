Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LkJEMUAaPGqOjwgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 19:56:16 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7417F6C088B
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 19:56:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=pbS6oYsg;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C9E10EFE8;
	Wed, 24 Jun 2026 17:56:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011061.outbound.protection.outlook.com [52.101.52.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448A210E0CC
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 17:56:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HX9/mN2nckQz5fgQBmYo7/WhTzxFMv7v2vapGvJZhRa5Tiu4urz5SpP1FTZfuJSUWtbk3Y9bQ7CGKPmMxpU+1mdSF2V3aDftaQ7pQDm5yr3TD8la33SZuPp88L1S8JbJ/CxPtv/99RGLoxFZNqqLjOTmdrnH8ZDJ8iM2ZneA3v8jfQ2evfT7wO/45S1vzPtLS7rYJJO7BjIdGDQ0yjOVhAsu3wIpCpgeO2E3u2qkT4kiaQpI+OaLuTVDMU+KOyQbWG1q8lsTjSR2kKUqOMxUVLLqc+kJ9Ri0RJEFeh732SzNNAB3vxFh458nt8Q1kuGPXzJJFvy8zNKuSYjMbV7HYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uof/SQ+DJOBsq+jIoFt0nWtrxTSXGPmv21Rrr9VuT0=;
 b=tdGZiYtgNwtA9B7QD7atx7TG4DvhReSi02shG6abYlGjx6iAlYqqfJlLlmwYJbuQR58WPGLEnWBtm87aQNeJE0oQN6+1CPgY49WRrtU+MFn0kX255sSVmKjYgadKaQPCEcUqvgtwzTAM4Pggl+Krvl+h9hyuEzXK8gZjsQ1N4Gq/riDF9TrYjXWpSYruk8Lo6e1um8qYbJen8g3YnFaTOdgxqE0C0cUvUlq21ghR02LHz8wYfML0PZOQMDSgUWuGOO6BLsSxSfpRj9PvEORKcQy90E9JQooW1fNPXQD25slLHzyidb75AUyh09M/v4WTet4C3A/x729Cbd4FbFbJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uof/SQ+DJOBsq+jIoFt0nWtrxTSXGPmv21Rrr9VuT0=;
 b=pbS6oYsg3W6Atqcj4sLFqBvmB+spDBryOJuhzYHKiJtYqe8wGr7A5TCBdHEQ+ozJmFIOYNnK4v0bA1MkeAoFWavuKa3q6jBlQNrGtmUkpts6kzqcbfqAetRi+BdQxUmtb1vyojjA75+apQqN96EUbBye9u/Y+76BUaLAdhthoW0=
Received: from BN9PR03CA0161.namprd03.prod.outlook.com (2603:10b6:408:f4::16)
 by CH1PR12MB9600.namprd12.prod.outlook.com (2603:10b6:610:2ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 17:56:11 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:f4:cafe::3e) by BN9PR03CA0161.outlook.office365.com
 (2603:10b6:408:f4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Wed,
 24 Jun 2026 17:56:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 17:56:10 +0000
Received: from amd-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 12:56:04 -0500
From: Shahyan Soltani <shahyan.soltani@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <christian.koenig@amd.com>
Subject: [PATCH v4 5/6] drm/amdgpu: move amdgpu_allowed_register_entry into
 amdgpu_reg_access.h
Date: Wed, 24 Jun 2026 13:55:06 -0400
Message-ID: <20260624175554.489406-6-shahyan.soltani@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624175554.489406-1-shahyan.soltani@amd.com>
References: <20260624175554.489406-1-shahyan.soltani@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|CH1PR12MB9600:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d240aac-7613-41a3-ba61-08ded219e009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 8C+9z+eF9BaU7XoGNhAwvQg+2itiACRSF/yacqsN1/5dM7Ug2Y/P+wFCCGpqfUvsg1guowGLLbmA+11BL+XODWrXDIvT1AdENHoxgFwtqYKBVt+SQ1Nz2x22bBfrUftxtk83r+7+Jkax/XqF1usQ1eyARXqBrg3+sIm2An69Uf182cv5szD1seTrcc8hGnUbUMc94eXzSEdPG52iHHWJvII/zhLi/LxK80/7l3TTlziaiVB0+Gbqg5pAf5mhniIbulQylJkARC1otsF0XKMnCAg3wXaSsZmDOTyGlThEx0cxi/PSPtwgWOulk1vrBJxFVVe2SSavjAVD/qL1gKW+rOf+Cu6YFZljuDpO9RGkPks48U1NqNSI0txSWAnziZVLpWRm0I2eHM0xsRPy3HGuNRDyKsiM2fM3l8SYG2sgiHqxPXRIjW3Srxpj9pruLGdSbfBEAipjhOictOmzyzWxWL1Jb+SYji2lKAYXNzKNeMYTM6Wd4ATKWHyyryaAR0ofD9WVhrxK8HFNy4oj9PXnG4wU/lnSZm0PsyaaWIZHICnAHmTeOWD1ODWkuH7hrKUjNxQbasZE1m4XFQok/q/fYndgykk5iIPAL55X4dWZOqG6p0WRS+5D/3g0e0MYdXn5JF6ov3vl8VDSw7rx37TEjWU2IrFnHSALuhnN9Ui2hJ4iGDNbLwUZ/4tbPSb9JOFgEmHy21IUTinxWL8JGpwNkg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xgWmguOxUHk84TYuiDOmDEdy6c/9J13X+6TvIoWLuJ8xczujV+5FWsA74Wq7mmGyZ8/liesC1d52mqFNQxq/uW61wp7XkA9A3EnEWkRThAnJqhoFg0a3ttN25GPC0hN/lhnCsbmxqHWPXT5+5Lbr0A+jSu7Ugt4yOXhZb4hbnhTG9loL5mYT6bJCfxEVecBTbkaR/0Q26/vrb2uCJOcFvT3Av8dmAsNHA1hnG3R59ve0HFQY4tC+Pf+l7bThnNMhgkxjAsuAgs11L5Hytspcq4Otn9bcYJ+k21WAIaQLcicVsxfx15plMHJHydNC1RZ/vAP9G79QaKXkkCkEfM5mxqFSo6GTERH3GYp2ygGN53PcwYndD3vgLF4+jMVWQvWYsJLhCcezt+J48qJ6xABDY38kg2RVGHh34KMvie5xQiiuahqSk4WrabB3T9pTUWiB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 17:56:10.7509 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d240aac-7613-41a3-ba61-08ded219e009
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9600
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[shahyan.soltani@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7417F6C088B

Move struct amdgpu_allowed_register_entry from monolithic amdgpu.h file into
existing amdgpu_reg_access.h file.

This is part of the ongoing effort to reduce the size of amdgpu.h into their own respective
separate headers.

Signed-off-by: Shahyan Soltani <shahyan.soltani@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h            | 8 --------
 drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.h | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index b53d83bbb6ef..020b79c9ca78 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -431,14 +431,6 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv);
  */
 int amdgpu_benchmark(struct amdgpu_device *adev, int test_number);
 
-/*
- * ASIC specific register table accessible by UMD
- */
-struct amdgpu_allowed_register_entry {
-	uint32_t reg_offset;
-	bool grbm_indexed;
-};
-
 /*
  * ASIC specific functions.
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.h
index a1011af6b52b..320c30ce4a62 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.h
@@ -89,6 +89,14 @@ struct amdgpu_reg_access {
 	struct amdgpu_reg_smn_ext smn;
 };
 
+/*
+ * ASIC specific register table accessible by UMD
+ */
+struct amdgpu_allowed_register_entry {
+	uint32_t reg_offset;
+	bool grbm_indexed;
+};
+
 void amdgpu_reg_access_init(struct amdgpu_device *adev);
 uint32_t amdgpu_reg_smc_rd32(struct amdgpu_device *adev, uint32_t reg);
 void amdgpu_reg_smc_wr32(struct amdgpu_device *adev, uint32_t reg, uint32_t v);
-- 
2.54.0

