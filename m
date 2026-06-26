Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MgfUOPbjPmqUMgkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 22:41:26 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929636D00CD
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 22:41:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=PZICHDcq;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2975A10F708;
	Fri, 26 Jun 2026 20:41:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010014.outbound.protection.outlook.com [52.101.85.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD2610E3F2
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 20:41:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiPdei+455jrS32f7cMn/vSbg6F3+kwFDFQ6QSE4wiGMDHL6YMjWcfUCiyNxgqWp27UYFpDqTQkdpe3jcVngNha3m60iXvq/vLwdMgt7z2EKDoWahFhCTD5QzGQwslRrK0FMLkuMsoI64WicTqKG0ghvLRsoHnga9curgpYQmSLiQrw8EuwlbpLG+j4Fc8Hf5XDehnuVxFtXO8tzuTbAaOGj+VBFFYr40VxV1Z+1kNO3IBWM1Fm+zHQKwL0XYvkusWpG2BqPOGA5hBtDogla1TocuXNhlI5U+QgRykHaPS0bV5mSKW65PHBYAcV4zIPfWfPmUaR4l5TaQhi0dr8a0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glCoZh8eshZHreQYFgaqljEVPU2ikcwJCE9LiHdRl1s=;
 b=oIiyuqyEh5bM5TZd+P25kt7/NI3bvozb4Goot6YfRX+Ws/krIcil6/CR0kkBVn/wu2boX5mtYRB1KJ3q+DAQJ/BcQlXqZ7MR2iCJF79Jt7EHH/n7aQd+rqb8biQ3eSMbSv6zAYK3ccPWsegN3OGyvxvoNBAfa3GZfs9LUUM1LQfm7JZmC1gIm7mvczuyyeTIP6AK3ra4eBllDGvkHY21ToM/huASYys8JZmD1kMg9afg/6UUCrTiQMuFD+1YvTn459kRYpdD7HrMfoIuDo7r2Uq3GjQc0i6om2abZWy5fe6X6fUau4qOhUHpqajO12KThEvpy0CE9oAOFJtt5C0IPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glCoZh8eshZHreQYFgaqljEVPU2ikcwJCE9LiHdRl1s=;
 b=PZICHDcq8hDelPGFztHNhFbYQ0kEY3fdo41lk+2OBrKl0xA9tubjQ4OUHzKgSgsS4t0hP/oxYlVvNBmtYVcHyfn6FQR2OReO20PZg5RU8v/HIQflqNP3XwX0UuRXeHekNTf6fzvfCT4bb94fQVMJGgIpnhZZv2jgZZuVeXp29Do=
Received: from CH0P221CA0036.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::14)
 by DS0PR12MB7995.namprd12.prod.outlook.com (2603:10b6:8:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 20:41:13 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::41) by CH0P221CA0036.outlook.office365.com
 (2603:10b6:610:11d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.18 via Frontend Transport; Fri,
 26 Jun 2026 20:41:13 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 20:41:11 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 26 Jun
 2026 15:41:08 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 26 Jun 2026 15:41:08 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 1/4] drm/gfx10: Program DB_RING_CONTROL
Date: Fri, 26 Jun 2026 16:40:58 -0400
Message-ID: <20260626204101.31172-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|DS0PR12MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: a18658af-8005-42ef-1ceb-08ded3c34277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|3023799007|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: uv4qwpWNeAS4mPVowGkt8F1+8JrK6fSlgCKUInunt56MxWhcsPmkkKyHVrgGrFgePQdHBAoeoyNZRtGSHV3lnIJhRjJ455U5W/hS2k3uVWz9b5ByL+8NM4QwUdR8weHxMHGYtWrergG6LO4GRS4iYnq1ZhWEKWyKFlSgGXS3ALfS9vuUt0hxRtZ6mgW37Z2fYHu6PxcZTNPBSSeriDDKONinrEEmPP6bueMWhmTfEZZNFnCyUwt+4pgOhIBVk/3TtR8PdPA1TgDVwNuJvJGhLmjr4GzQZIjDyavSF+x17Km8036b8tB64z8BL1zn/fodgxhWuHr6F/6pjAci1zSkLKco4GBt9upJ1WbAAuYBuK0POEfAAHV9/1STHDXK8/AJWNFF3ZHB6tVMwu2A0SBVDsXHi5DQhxWARghxgBmZLpppQjTjrJk408oGnNQP8fAUSdJxd+t9QEonP+gB9CbtVF5+NmuVIAdntSYW3acl5/q8lt8uKcwZnhqRc000wZkCM+/XDjmXY/weIGi/n00jL1BWkmOQdBWY029XDCjulK2kO7RdAhuGYkkSCfykC29VvVsq4VdOLFw1WNVgoippfvm9UlAlPVcpgULXgOWsX4DkeISTyXU5NjSQyQAwUtrwXxspHtXUrL6DNT/95VK63L1hi15h0G/tppBCB512axbp3nauf9G0EHqUuupW4qLqORH9GEFR+qJJInSuDZlzmw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(3023799007)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vR3VMzDSPLoU8Y72w8u3g3Iz9bOV/K2BI52PF3yzqQ1pJAxih2ok5+ShUgFfI21Bi8bKl9Pykoxg6EMUZrXiEm7BOe7fVPFj1ihTPijEez+6TOf5IdbeORCGeX6g8SLm5M5vpDLcatlrwGKmd5ogQuhSqOI9+iZ+H1X+HxkHCx/Uekd90yBTjLgEAq9/Fv3iv0BBkMLTRIOH2GFpQnQd0UwPrRbYOKCw7SuRYIj4jhxgm4OJu3v+aL1sAuv+eSlAD6DtTlERgU4/8OapqD/3dl+iQguHxC1gRBg6VZSYOmGI/5i9sJw1EEGqUV6zHlBfrNL0Qh5yZL1btJSbskHVCoBJpSzKzGIZuq2T75RalURBdvgYLD94RwTehasTzrtIQ5ylBmRxXnKqcQS3shg4SssTSBuSnkxkwIBkM97Dz0JeMvmA89JtpLbbgsyG42bE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 20:41:11.9814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a18658af-8005-42ef-1ceb-08ded3c34277
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7995
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.freedesktop.org:from_smtp];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 929636D00CD

This is needed to allocate occlusion counters across
both gfx pipes.

Fixes: b7a1a0ef12b8 ("drm/amd/amdgpu: add pipe1 hardware support")
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index d72ecf5dab09e..6ff7a8a700939 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -5352,6 +5352,9 @@ static void gfx_v10_0_constants_init(struct amdgpu_device *adev)
 	gfx_v10_0_get_tcc_info(adev);
 	adev->gfx.config.pa_sc_tile_steering_override =
 		gfx_v10_0_init_pa_sc_tile_steering_override(adev);
+	/* program DB_RING_CONTROL for multiple GFX pipes */
+	WREG32_FIELD15(GC, 0, DB_RING_CONTROL, COUNTER_CONTROL,
+		       (adev->gfx.me.num_pipe_per_me > 1) ? 0 : 1);
 
 	/* XXX SH_MEM regs */
 	/* where to put LDS, scratch, GPUVM in FSA64 space */
-- 
2.54.0

