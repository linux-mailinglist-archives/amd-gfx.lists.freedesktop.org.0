Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK+eLNMY5mkprgEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 20 Apr 2026 14:15:15 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D42742A8BB
	for <lists+amd-gfx@lfdr.de>; Mon, 20 Apr 2026 14:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552B310E567;
	Mon, 20 Apr 2026 12:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QKukJqbO";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013067.outbound.protection.outlook.com
 [40.93.196.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EFA10E567;
 Mon, 20 Apr 2026 12:15:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCvRXfUpIEl7Sd/tG18JVZoqb4AIwzWcR5bc7wgAH0mkZCD6MyhyuVjDzlw4P4dTv9ypOCuWC6CKMyebio9MNU1my80rrke+bhozZrPGowE+StSxW6EH+Bt9mP7kPfPw1m+a+ovN7T3uP5QuPqGKFUC9VLg0uEr2Xp/VHBZYTGO2eEoSV+zWCZ2tGHuRCBJc+mhIGw6gZ3Hjs2qpJSpHHZH2IGejTIqPhhUiQk30eR8CUNgqVbbEBW0Lzivj7v2A0d09ZTQ0NJBkqNsCKlqnyQYWBXF3DZzgLGCiLPdNAW8GzBPgJdkdKHPYtgTqqU1Mei2P7Rf+QbP2msx2ry87wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ez/lidpEnOe4uJwHqEnV67J0t/BQ0RidYk/mH92RMJk=;
 b=CsH+MWpDB4eP6HwYPmsqsSy0drZ3UMc38N4FH1iK9c9BEOaxT1omRdMUpjIj/0T7XFYD9RUyqmMGUT/MTrRUkFhatcazO4I5Z1XfDhLdb/Vg+7NKkDYhHJglKOfNOCo+oiNeuKNoitT3XMcpZbPiCbZzFUVd/ZdvziLPqsRzXnc7EzrszBoniG4EUawMLH5Jom9mXT1mPuGJzZgVIRNPALGeHcFgDq6hIP7XiPTeTrrZ9DWbsBHVdv+ijyb+rI+94n1uqpg2ZSuwqERn30ep+sHyawDNu3wgKOL8BRjIhXiviVblT37ZLFjJhfiPxmR5+gXC+S49c6lfVjHWw4SbMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ez/lidpEnOe4uJwHqEnV67J0t/BQ0RidYk/mH92RMJk=;
 b=QKukJqbOtMh79gPsr6EYBHUGAs0cGU1wokVl0rrXVX6I2Tt8U5HjvJbJuDTHW40CJxNNQyv2OR+gt1h16fJI7xZY0/qhkRg5D4P8yYMfE3nEiU8LMiFY2qpI4dsKBg8Nnf+w8ZpWHyJXd0MOrzWOtv6oahBS2Npya+KIZhIxOkA=
Received: from CH2PR08CA0021.namprd08.prod.outlook.com (2603:10b6:610:5a::31)
 by SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 12:15:08 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::b5) by CH2PR08CA0021.outlook.office365.com
 (2603:10b6:610:5a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.51 via Frontend Transport; Mon,
 20 Apr 2026 12:15:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 12:15:07 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 20 Apr 2026 07:15:03 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Pierre-Eric
 Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/amdgpu: fix root reservation in amdgpu_vm_handle_fault
Date: Mon, 20 Apr 2026 14:14:38 +0200
Message-ID: <20260420121438.1612-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|SN7PR12MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 573cfbf2-46a0-4c14-4abb-08de9ed67638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: RrQVN1HGpxP5Om4iAHCiFxePRE7BMvKY2x8hkyctHP1K8bnVUjO8pgV7dG4yoZ9s3tXGMhlvotflA6NUp/OJF4NsOXyHRkGLcZZmgw3orSmteL4kEbOYh+ZKtTvRM98SejZE1tWEYAi8q4FVx0Bqzn3XHhhTr591CsYLuptrhP5WTUO7R76YUcYAYteSrJo70f6693dk6Lds+V/Wt9I17wYoy+vMV9iSHsjkYIlmXWMAiL1mP7TVx/sGniGZJAYDs0bSHbkM6y2OzYfT7lQYcknZGkXqTlK5eT+FJJ7SLkXC4lAm5AqDsJIsz2KftgUlbdD+qQa/tEcpet1kA3BHNkYwUpUJZ/S84M2pEZZU79tK0lBrXq6kup7/ThpvqRlF9UDKg8EjO0QBBgPZsYyOg4Ce8E4OK09tF5cbBv669cy5Zuhi7gL+lZoZz60usURx44J5sTrP1vIrIokbH/IHnjWONpFH5NACndn7cm+HhyAC7I6jhJ7EcjzPFQCMoVyek8XMtVyFx2MLzbZLQPKjQIjMWujzWW7UZAPoQAKKVBIUlhXGt/rJS94zYmsZcgweLi9SxPtZd4OrGF7/ZFHRrSVI/CbALzIYzERR1cyp/eBAzKRdoTJR5lBeOz9q6epz9suHo26FPGb8efBPFbUumVhP/WK7CdpXthNy+oq6IvNOga5mLnaFW2I6J/JU5ExwFRsPQ3ZypSSCVZO+5mcHcSrXcZV+pIy9msmpcspbX/Lcgrx7VQnEMtcdpcynwphB4SyiwHDEroB+anWmGvYnFw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fHFlc4kTgJkIsLeWVIDsMdofKoh4U6Q6Je8BlPmOZmIdwNI5XxGJyNgUvAkhEjvV4C9ks83545Qa7wfio1Ejyt5H2q26UAPqa7xoMnp1VE5PEZZYwEeclodjsdC6E+7H/bAYmHMexLPR8zldWs1S1Ik678LZogqtV5LXbmgqdVesjDwMRyqqokkZ88uzyLAhksP7xIHOtQbMhYBNhxbIuzv7iXqFTyO/M0Z1ZZgOlU4jM2VddyZ7XU13qT7E8hn8fMsVcpMSvnnmTnN7BjaaG7OcsNrKtoqE92mCDi69le2erSPQm6zB58Ajm9NwJEXw+Lzu9di9aM5srCVUhT0ZfhwpYZa6fUqzrJbGO+B4DkydvqZZUoD5b5LstAfxF3sJcQkMJMzrxpupWgK2Mmoob2TAmUdayHjN0NXeq62igbdX0mg/8DfVZQd0AEO1chX2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 12:15:07.6258 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 573cfbf2-46a0-4c14-4abb-08de9ed67638
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 1D42742A8BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

svm_range_restore_pages might reserve the root bo so it must
be called after unreserving it.

---
v2:
  - don't modify amdgpu_vm_lock_by_pasid
  - add a TODO
---

Fixes: 32b486e8541c ("drm/amdgpu: extract amdgpu_vm_lock_by_pasid from amdgpu_vm_handle_fault")
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 63156289ae7f..799a1803d941 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3026,11 +3026,22 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 
 	is_compute_context = vm->is_compute_context;
 
-	if (is_compute_context && !svm_range_restore_pages(adev, pasid, vmid,
-	    node_id, addr >> PAGE_SHIFT, ts, write_fault)) {
+	if (is_compute_context) {
+		/* Unreserve root since svm_range_restore_pages might try to reserve it. */
+		/* TODO: rework svm_range_restore_pages so that this isn't necessary. */
 		amdgpu_bo_unreserve(root);
+
+		if (!svm_range_restore_pages(adev, pasid, vmid,
+					     node_id, addr >> PAGE_SHIFT, ts, write_fault)) {
+			amdgpu_bo_unref(&root);
+			return true;
+		}
 		amdgpu_bo_unref(&root);
-		return true;
+
+		/* Double check that the VM still exists. */
+		vm = amdgpu_vm_lock_by_pasid(adev, &root, pasid);
+		if (!vm)
+			return false;
 	}
 
 	addr /= AMDGPU_GPU_PAGE_SIZE;
-- 
2.43.0

