Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2q4aCH+8LGqqVwQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 13 Jun 2026 04:12:15 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0F767D834
	for <lists+amd-gfx@lfdr.de>; Sat, 13 Jun 2026 04:12:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=VdrXn3gd;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710C210EBC5;
	Sat, 13 Jun 2026 02:12:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013017.outbound.protection.outlook.com
 [40.107.201.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE65010EBC5
 for <amd-gfx@lists.freedesktop.org>; Sat, 13 Jun 2026 02:12:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWJbn2yO4Q6QPry3s0QG2WqsnbU1REqlm72GsJr0wm6SvwNmdo1lm9wbO6ysjLmZEpFPOc77mlE6X+B1XEIij+XqqjrCJUiPsYJyAFeqb9BsneK3EknzRDET0z7GRF7ohm+OaDwHVQRzywC1QHkVKDkXDaA9pPbjxC8rl3RQ7EzjwgUi8K2kTmVTaQYRMxBX9NUfUtI7stBXxGWA18T5BKLvhWRPqBUfRNrHpQUARuA/nfnCXDGhPJuce495coEKt8Q4m8cV59k3puf8voaoAc+XsmFV6tZ5iYqyXT0bB+2fGY4aXV3EDflY8avcERqJUlPzvNHqeSBh+gT69nbN2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVaglQ0PLbPqbHZ14J/KHh3JLkV8s/hbc1596c/hlaI=;
 b=s7VdC/8UrHBmhP3Zs+QPgnWjw063ZIkb+00SRozvyK/BxgypiykHPk4QBKouvhd8bV8G0OEaw6CNZOg10Apux3muGcTfuQzyUWIKU5w7niuagqRc6VeJXeDJk3vCP7JYI2qomlpf/AldWClIdvVoEOIoWW7lzrYSgOc7ugavzFr/TeBjGDtRFYi51D24GYGBn2TO4KUXGg2Rk9jQbCfNsfvzBBp+nZl9ixnYhfD4HEdfFtQfaM0FuJJknpRqjYSODDToc6lP0o0vxnBSVyxBY7vYuBYT25Sddsd7Ea8zNQl0tlovHy413l9wbu8QNJ8yRhWR2ALE31WPPZ3aC/vzrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVaglQ0PLbPqbHZ14J/KHh3JLkV8s/hbc1596c/hlaI=;
 b=VdrXn3gdQEBp3OP1WnJj7qaJ/VeHCxAEa7ggp2LItLr8zoHflwdkwwVmlbWFotEqGAR6ZVjacsw2rransmB9Kbo2zRiAKJwmiWlqVLR/S1sUeHsaiw7USNyDkmFnlTRaLEyyQIro0bV6Bosfxa0FhgORQZ3AGxuR0plYbngZ33w=
Received: from SA9PR13CA0021.namprd13.prod.outlook.com (2603:10b6:806:21::26)
 by SJ0PR12MB8167.namprd12.prod.outlook.com (2603:10b6:a03:4e6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Sat, 13 Jun
 2026 02:12:05 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:21:cafe::8a) by SA9PR13CA0021.outlook.office365.com
 (2603:10b6:806:21::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.6 via Frontend Transport; Sat, 13
 Jun 2026 02:12:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Sat, 13 Jun 2026 02:12:04 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 12 Jun
 2026 21:12:01 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] drm/amdgpu: check amdgpu_vm_bo_find() result in
 GET_MAPPING_INFO
Date: Fri, 12 Jun 2026 21:11:53 -0500
Message-ID: <20260613021153.1136397-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|SJ0PR12MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: 46796734-2481-4318-6efa-08dec8f129c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 7sxwoUw+Br4TjtPsk9KfBF2Rljgov5/MX3Z7vhHjORhFHJ5ad+g4OmkseEHx3TQqwWwLWoYGfwAYNXAP8Pn9mb0iY+C+4CGTfJVoZ11j0XDDfsMEGql4N8PlNxsKnNsdcfZAndou18pcCMJJczB2bX1Lt5rf++uk4TSAfi77tTwpcjtq1cL0JkK0QwlsvkebkGwKE8VI4YlUOYJnsKkhc3Ab3gfpByBMVwxclsxErG9sbyynoP7ENuU48li0lS0Dtqsq5sjivVtauWDvLYuTDjvw8xntXeh7q46WQEGwjGLv4zQqH0iQ9PrCaHdxCsR7oHetpErJeEnoN3wyGtsju6uNh/zfS7NBG+f5nXOT6AAZPt7yRXAZC+tU+eSRtbOyUl5C4XjT24jCvvn2TMJnHe1kiAaPRYimuCEeok4XbVE5IVKMoDLeQnqDIMIJUqcsAzZjN4c+7DPEoQovzlSLxsoiwQydDWCpQp8uPXsJPTOhGbLcqvz7652j89hHbc2dRoZiU9XGX576sR7cIVGXfKVv3XnXC7j/EgoMJABb5/LP1nmxDTXbOmbWL4KnTZYA2H9rgK7RWXhfcd/EXQQxIbSTfzaJZl1pJxnJ38oBnT1iy0L1LF2l5ap63g+2YCxiMM0darKPFRqvd/Kb17HQWBu+tGZynJCouBb1yctcS/GFH119tq3oKGxnl9XEOwWIAqFUHWsvFt7KNJwdSo35YJev4TFypGPlINM8tzjtuEU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cLFGnUWOKOwKrX5/mXGO+Eb4aEH1ru2Iiy2vIp09EBgDhX1VzZikSbI0OgKyRBOWCaXCYOhsIytKdlBarccKBGjwbxUaYkVcj63aLXDHXz3/VPomTOcwqVRJgfJF3Y3ACzgnmYTMRxrKc1aEqnOQ/eHpIhx3arbo1Z6u/hcPva8E1NQO6EHfmaJbrsaTgWl04N//h2vXnC6ybKuAg98C7fXAENCqGemuXtbjL+kO4Iub+qPJIeCLi3JTZv8ORv55hAdbNTNQjr5g43+U7OkOm24VUX4FiM5VOLNaoxUhcJwj7yViz5EO2zTkqx4d36LXO8wBdof5uKVdhLPJIRpMUhG5kij9vAzDz74kkK4CkZVkKh7uOUv2mWJgyB8QhwvGV4Z+z0MiQko0b2/uMwLgXmirKuk7DNnfH9Aj/b9Kjn/Nvn/iL07kkMGOmHi9Hfzs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 02:12:04.5844 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46796734-2481-4318-6efa-08dec8f129c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8167
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B0F767D834

The AMDGPU_GEM_OP_GET_MAPPING_INFO path of amdgpu_gem_op_ioctl() looks
up the bo_va for the buffer object in the caller's VM via
amdgpu_vm_bo_find(), but uses the returned pointer without checking it.

amdgpu_vm_bo_find() returns NULL when the BO has no bo_va in that VM,
which is the normal case for a BO that has never been mapped. The result
is fed straight into amdgpu_vm_bo_va_for_each_valid_mapping(), which
expands to list_for_each_entry(mapping, &(bo_va)->valids, list) and
dereferences bo_va, causing a NULL pointer dereference.

This is reachable by any process able to issue the ioctl (render group)
simply by requesting mapping info for an unmapped BO.

Return -ENOENT when no bo_va is found, jumping to out_exec so the
drm_exec context and GEM object reference are released.

Fixes: 4d82724f7f2b ("drm/amdgpu: Add mapping info option for GEM_OP ioctl")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 22ec4eb6e17f8..28f89ae8ca745 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -1094,6 +1094,11 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
 		 * If that number is larger than the size of the array, the ioctl must
 		 * be retried.
 		 */
+		if (!bo_va) {
+			r = -ENOENT;
+			goto out_exec;
+		}
+
 		if (args->num_entries > INT_MAX / sizeof(*vm_entries)) {
 			r = -EINVAL;
 			goto out_exec;
-- 
2.43.0

