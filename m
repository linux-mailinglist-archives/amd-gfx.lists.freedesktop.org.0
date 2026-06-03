Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LxhVOecrIGqXyAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 15:28:07 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941296380AC
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 15:28:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=hRgMQqN9;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3369110FE2B;
	Wed,  3 Jun 2026 13:28:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011068.outbound.protection.outlook.com [40.107.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B969010FE2A
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jun 2026 13:28:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asZxSqDo9njHhsD81A/dAVzBxkQJp1uFCMvAJmVaKaXUH0u04L9E9t7ej6z/2iVE37SPfLOrSp3fsgu4sj3Ts23Ymb327AZoygfLAengHsaEUtoI0ppuYKJDQ2pWQ32nwBefS2MlwAPQOtJaXnOfngEgVUzMvUMsLPs3e0bzf6hZ6TyIOFflUbgYL3F4sLwWOHhH6BgLzzG3qkVqkTEeb5fhbCnCn8sxZ4rVtNPuN5vCY+gqbZmxB588THAN6WNiax0Lc7ue0rJwE9SZEjnB+ckUEbxNmjh49V4GHzxdCwPYSsjspyqCdEUJtBP+5eZc32OAT9iasmnEjutZSgAQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dxJA2/SWkhkwK0hwyJ/dCnVJjctBERcD0DY0lyvT2Q=;
 b=Y7WwUFHQLEsiRi8hddXW62t89E7quUsC8RFK6gt7DGCjK26QIadgVHEbSScvAvi0juP1LXST1TWw8oSOLLCRD7oYJyToOB4FY6+jIC0PDW7kB9I5AvYz2leRWt+nbBn+dtLW6Uvz0r8Jtz84p+ZxJ5P31MalZ0e1sjVHWJlelbVBK04HSK4mt87hg5Ec07WtEXzPqZaP6/wGSMnHlgbE6qh/k2F4zyb/b1KjtOZ/9WZeeW8K9UEuoEnCKRV7z/u1iHJfl0ZDV7QFndVKM15Otwa+Zjd0nBTv1NsYBOVfeamfK9NfkkasZmc1GXgODqV4FiJ7NSeM5KhjcE6GrtIcQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dxJA2/SWkhkwK0hwyJ/dCnVJjctBERcD0DY0lyvT2Q=;
 b=hRgMQqN9V7BaxL3QlIDC7FHhjabqJs3nUKGBB+ncmkz1D5n45p9datJBUVVs9HxRTUqVKzML1ZSUondjVwlqwm55GBDsGB2JdggpU140SOTkmw1pC/ndf+OtP+d/yaTFpuwPcggoIEnhnKd1bDdd+fOkqV6hFE2vbx59GvJ7v1Q=
Received: from PH0PR07CA0082.namprd07.prod.outlook.com (2603:10b6:510:f::27)
 by DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 13:27:56 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::16) by PH0PR07CA0082.outlook.office365.com
 (2603:10b6:510:f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 13:27:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 13:27:56 +0000
Received: from krussell.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 08:27:55 -0500
From: Kent Russell <kent.russell@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Kent Russell <kent.russell@amd.com>
Subject: [PATCH 2/3] drm/amdkfd: Extend MQDs in HBM to gfx942
Date: Wed, 3 Jun 2026 09:27:39 -0400
Message-ID: <20260603132740.180346-2-kent.russell@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603132740.180346-1-kent.russell@amd.com>
References: <20260603132740.180346-1-kent.russell@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|DS7PR12MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: ab4d79e6-4978-4ef4-bbef-08dec173ec55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: juv2dxG9NWCJTihjTqJcR7MzkDm7QpLzHzx4gz53+W9d7b57zqxn/o+c3zhMxSR4kuW9VAdBS9KBBslqNI2SCWIKcLTsfmdRt4idyhQs8mvEwz5DnpSgY9E9/CAhn/pyaCleIyAo1KXzLTUYv+rgv61igqDTAS/HAthLXXJU564QfQsVkV1YH0dXU2/H8oyCETe2z+95aXaWe7nGlNQQKuW+qgVUJqFyJsGAYbqb/4h4sUuFBIazPXXWmNpd15V3Lfk4BTmmZPMGrp4qOzmhpuL1jAAxm7pQ5qXviu4kytj7iZv6nfBppbfiv4w6AWydh6miQhJvFs4BMllzPefwNN1JoxfUVlHTAG7rx8XkXwPdNWIkANLnf3mlxIabhipupYAbT7DyLlciIdrYVdE/yjNQaagHasFMFYDC0cFekAuRHwKzCEWCnKcmYY6t02LnnVrd66n8izTPeFr7lxvgi5AXRYYQyRyqV9S3wx7yNxppfLaGaZS7eTYAplBB247Z8m6FvdPKzY76SefSmnn3JroRZEwARI+wrdh81yd7f9trcU/wvGfXlM58r1/W2q57i1NCLhPjduHdMubNjTDPvV70TVC8GDUijh2/iLMAWgKexLg92zKjlpP0ddG9xmDQAZ23jQkx2Q/+a/gEtAQow8DyVzNUsFTW6QHCez/P+6YbLSmZ1NK4mTKi0hVe3BwMNgieDIADWuwubzqOFg1qagebZChqtyGmVas7eFQQDYE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eN2K/ZGovMJeDw7ga4EDMJ/yPCQLSYNotcbNeohRTs8oXcQkLnnW0jnlIGbEZlT6RwXV8Qfetat8lnLrWlitGiBkj+++0yfLAUyYpSUZaiOi+rdqBymRL2coqI6KcC/lXX3tDd+98TU5IZ6H544+lPCArSEgyMEMsis2Q4PNSjiepaIAhHgshzfJhZxMnm1zMLBwwiILdq58Urdx3fHG0ze7TtqI8hDtTdVrmdUZc2pWXNn3K4Is5iEyMcu/ArwpKxDn27cHH4xkevFJbQiypzeEpW+ZUk3UCge45SQGMa5hzj0DXy4lPY73KCZrA8ePheuTeWcJG88moRRcpsxbPTfn3/MUR9dDh8+xodfhlLQ5EEVj/eohUxiiTf8xLsn7WncLH3+V+J3mPJnU3TGHp/2AYQ+eMY9+itGrSiiv2M4JrhGHIjNc+HyEDAV/zSEQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 13:27:56.2754 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4d79e6-4978-4ef4-bbef-08dec173ec55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5984
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
	FROM_NEQ_ENVFROM(0.00)[kent.russell@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 941296380AC

This has proven stable and performant on gfx943 and gfx950, so extend
it to the Aldebaran/gfx942 series

Signed-off-by: Kent Russell <kent.russell@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
index 02b52f907f80..5970a1694286 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
@@ -322,6 +322,7 @@ bool mqd_on_vram(struct amdgpu_device *adev)
 		return false;
 
 	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
+	case IP_VERSION(9, 4, 2):
 	case IP_VERSION(9, 4, 3):
 	case IP_VERSION(9, 5, 0):
 		return true;
-- 
2.43.0

