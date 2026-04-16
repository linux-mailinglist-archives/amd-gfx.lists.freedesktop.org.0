Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II7hMzZb4GmsfQAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Apr 2026 05:44:54 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810F340A03A
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Apr 2026 05:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABFD10E7F4;
	Thu, 16 Apr 2026 03:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YpBs+wG4";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE03C10E7DF
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Apr 2026 03:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5UtmFFfJ+u7xhCKcfTSdlVaAVlFk3B3pQVJWs0qQEo03I+xBZWsRWSINWjpKNlLGYHO+Co04+9PKZB0IZj+Yclx/qquwno6ZYV40dotewSWj9Na1juNXtU9byNwKy5uFaQRIxFGc2wz8Nd/Bl2AR5gO1Xmy4OHKAHX9NKF+JNpQnbliVtmCzTUOu6WzotKC8FrEqaE+TqpKRbZEVgCBVYUfCF5ojv/AobYwyDbH47q5QGAR+CcNsoDEtT/1qH+4mG+zo1fJyQqkQaVhkquxUcRdA6DVu7ZdoPgbsaX+gqgyWV7OZmvH4IPRcmOKGUBCGGGKNhPZFdEYVYFggjWVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWFt/RNUMCwJueL8ehlf9O5NMLfkbg6H+pbGP8GPM6Y=;
 b=Onmdp4df757tdsULjCFXr48wYIcYFdUIfqIcdb2SGqBjA7E261wXkrIlgKhTaszfeGZwSEeEzt0lIfPw9hcV55qEdudWx78joSKdHi2xR8tqnt74bHDWRXgNyOT6uFvqdNk1l6DU8Iv56dWwSrCl5MZh+jVuTdsjk1aWQeU7jYRfUetDe0kpVaG5xE5Ei9eMYzv+Wl+OAFowVQ14NjAVJx6hTNuhzGXopgdDHRQLPLNkPsBiYmVrHYd9UT+EQgBgaQrBzxhOuaKQqQwH6bvtPo0U0VmGTnhpWCTqp7VMpJWqP+xnTpcav3197bghF5LU4xNSeSUj3B1Sbq3GpT/NGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWFt/RNUMCwJueL8ehlf9O5NMLfkbg6H+pbGP8GPM6Y=;
 b=YpBs+wG473WTdEWbj8v6QkVLbvz7NOAwmmlS23aRUW9zGeUeuG+z8CrjMk7IxCiPQQVkTOFtVmpFnsa6ScdMlsbPydHtX+cZ3DkPX3rG+fxqwU7jIUovcDW1WveWwSzX/GEokxylbXGcXmD9IGW/UT3PLLnxL2DeGzUj3VDxlz8=
Received: from MN0P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::22)
 by PH7PR12MB8777.namprd12.prod.outlook.com (2603:10b6:510:26b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 03:44:47 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:52b:cafe::24) by MN0P223CA0005.outlook.office365.com
 (2603:10b6:208:52b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.50 via Frontend Transport; Thu,
 16 Apr 2026 03:44:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 03:44:47 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 15 Apr 2026 22:44:45 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [RFC PATCH v4 03/11] drm/amdgpu: Register WAIT_EVENT ioctl
Date: Thu, 16 Apr 2026 09:14:12 +0530
Message-ID: <20260416034420.2368152-4-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260416034420.2368152-1-srinivasan.shanmugam@amd.com>
References: <20260416034420.2368152-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|PH7PR12MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: c14b9ebe-16e1-4208-55df-08de9b6a8190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: tDSL1+ta6t4jGm2S1zuCvaNeAuQ3IHQ7tNokPC/78HZfl72nTwYs6sfWKgswKlVp160fjlJaSMW6c91RHszXNArk0Ehg8ecbmd5eFORgNh+19Pcm4NyFMcUpqaeiCiQc5jcb2Pf0xg/9GG2a0SNsTFmKSKet/NI8i33RvY5ZhFqa/D1GJqRSPrMovwcUdj7qcAAUqeXSC5mGeY2naZTQQSv8QBXguawBNMDpGOnwpsX8PbS9TLW8U563nywc67Rx6T1P7wr4GKHjRVStGnKEtyspTTGXefvYkyEdYDsP9s5b9m1LiYzfm18GrqJtHqAPhjl7q5/Y/Hx711TKXg291KwLMoUAQuczWNJ9VFWLoH2xDdZ2TPY8M0GWz0Uf7ID2a1vNseHolOupqKGjhJCiD4tWV1uSOXxgfm8GEhftsqBRm0Af8zN+y7xx+NjxIB7YRyQf29CR17mT0qw6ZupdO94YnmLV7cphGEy7YpfrK/oDclHyTJVWTczWb5ON/3Ebhf4J21SPK62e5jyNCqyUyhA57h4sOQ0Kcj5YcIBcj9+ehyNCJwE8eFJ35RbGWeJxydJgebhh9/e7vUZVPRLIOhcGeSLeakyZVtM3l2iGZur0th7aj6aT34Irrl2Pp/rkNkYMJtFOcO1YtqiOEbVF8yfyzAOTdXb/dY+UdFWmKf7rNnf7T8blR2aWKrzchQh1wtt9x7YRYgAOWmyIscE4N1/cVMk1bCr9kiTco/F+0KvvmekDBNww2YZigpt+ThnSKEh077EhQejfj4uyvps0Vg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5mnOh/LEZJvburF+AmcamqKj9yT2uOJ8gfCHJBCOrEdbxTNR9P7rQfrqUjz0Mo7LyceH7sjkZfJr8MSnYyHvAB+4MJOiRMKFwalrHNaccVzy9o+Pc9f22eLpG91oFkTqd9LJH44YQzrV8FunNxtDqgtOIAhOb2vcy7CD6lhM8tFYYMzPOYuz95hPm1f5180L6SYZAchwa1You3SwfHBQKvrD5bnpPIpyH+L6iQB5vISyH8GjHtWTIeYNDovusW434IGxxX4Zoq/8diNclE7FCgvvfn36SEqTSww6OgOsAguw3lStKhh0eJ5Ey0BsRxkLDC0ZLnA3Xylj3Gd1UvPofFOsT+cBagf/YXq6IV32LVilnf/ZPLXM9+QyEfY5whGewdzr31uyjcpbgvAZuKQJeHMNDkqUkcc5L+k+PcQg7xV9VwVbX9UG/EsMqr5hznJ5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 03:44:47.5310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c14b9ebe-16e1-4208-55df-08de9b6a8190
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8777
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:srinivasan.shanmugam@amd.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[177.210.252.131.asn.rspamd.com:server fail];
	FORGED_SENDER(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 810F340A03A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Register the WAIT_EVENT ioctl for render-node event consumption.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index f4acb785b3fb..91b143c3683e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -3079,6 +3079,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_LIST_HANDLES, amdgpu_gem_list_handles_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_EVENTFD, amdgpu_eventfd_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_EVENT, amdgpu_wait_event_drm_ioctl, DRM_RENDER_ALLOW),
 };
 
 static const struct drm_driver amdgpu_kms_driver = {
-- 
2.34.1

