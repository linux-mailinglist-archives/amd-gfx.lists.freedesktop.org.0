Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rgHIC9IVVWopjwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 18:44:02 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7C074DB2C
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 18:44:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Q8uDCamP;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6428710EA63;
	Mon, 13 Jul 2026 16:44:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012020.outbound.protection.outlook.com [40.107.209.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2457310EA63
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 16:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUybVkBLcDGcAblKyiYSRZDrgeW9gD+IyJldKwSwedy8UYG6obLUj52UhoAZRlf/M5XdZpX8DKn+QNDdft56KCY0HVDW63MkquX6csOTw7fJ5SzHvAaIYUBsVSXM+HBK3BjpHndy/2o+QSZyhrr5LLEHg4FsxkGaT+ivOVpdWe+yepuUv6H3Gnmq13j/DskWNiDCMt9hpvaUe0wHK87IEEhNaEqS8hkoM1Q0NkQAZpxsrVyGZ9fkt5m3epqlD0aEpv4mEftb0BsUWPly+zvBXIApLnWhag8ELGirBB7MiudXHKS7Zh9zQZPldmfgEju7yXl7mzbCposbeqU2xdfVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1ehLfrp8DZYfcmQPQ0SM7T5Pm84swvTtUx7XTCrYBo=;
 b=ICydsWkUHy5SspAdr2Lcax0Lrkx9GpGPeSAUBi0wfQkwXG3u2MCFsBgK2DF1Jcg/pqHmeLkrAapStkgw04D+PEWWFqC9J+kzijqj01aH2gFED0imdeEeh0CUc/Qenh+8D7+m6KDEGlQD2zwL62aHv8FzhotENg97ae6aUkpUxUvfADVtL36RVDIlNxjjtG98U57MIKRJq4l2copGIXMUeoc+9x0w5wL1J4+4rqk1e0V1606MKGLZNgWaOFbFB9PPvhHpLkQ450mEg1kgHcYTMQG/xdDPPtVUw2eyhuWBaf6IYMVGwXtIBkdC7Q7ufRZOFWr0jg3tDGrlo+iJn4yg2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1ehLfrp8DZYfcmQPQ0SM7T5Pm84swvTtUx7XTCrYBo=;
 b=Q8uDCamPa6Z6V7NXaDeCrdoKam8MbfgqDGVBAObAAZ/AutfdwAqpA851tFtPCbelgzeSfLeEyzx8XapJFwk3S2fwIRChI0vheApVAmxodUvt4e8TeAKcxunYAjtcY12G8eVt08Bop7it/sg5CrYKs8n3Y7RSBb0SyYWRYZC6y0Q=
Received: from SA0PR11CA0156.namprd11.prod.outlook.com (2603:10b6:806:1bb::11)
 by DS0PR12MB6392.namprd12.prod.outlook.com (2603:10b6:8:cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 16:43:52 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:806:1bb:cafe::7e) by SA0PR11CA0156.outlook.office365.com
 (2603:10b6:806:1bb::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 16:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 16:43:51 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Mon, 13 Jul 2026 11:43:47 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v8 3/6] drm/amdgpu: Register WAIT_EVENT ioctl
Date: Mon, 13 Jul 2026 22:13:18 +0530
Message-ID: <20260713164321.3350036-4-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713164321.3350036-1-srinivasan.shanmugam@amd.com>
References: <20260713164321.3350036-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|DS0PR12MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d064a54-17b3-483e-766c-08dee0fdebbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: jxixmuhO72KGE/skUOltq7d+WtXT6AJK20lu/qfAieCHwOj8srrETxcNrgIONJsctq8XGEnzLnbvl3wPDmNqvF2XCX58napDvW+Q3ZNkOvL15jdvf/oauO4bhpDzarWh09l0Nb3tBH9PmIgF+TatZINuOGzbPI6/0RGmGtAsVTlCRtOc+EX+wW8hOXBxGfqGKj9tVtRuQHzT0oJMZQxSQhxCYkp3hn8wNMLkDRqDojrEEEZV3O0Hdg19R5tpnn+7RgNjUlUEGbQZCrVCfjNe32OaxaRodXqMUfmzBI8iEzhiQffpOXu26UK40ONUkU7UNQzpO4FSb+Ht5IqphmiuKwO2N2Pz74uP3eX287FGA/E6CdpwLK3QWPAe4+58WbfDhAW20fSlDot+CEMau10Tkq1yjz6xs0EVUmkTvlu1v6A1oi4pO6GXECK3r4GixxRkXzVC31bVNRxHt0T8a+ILdDSdzIuyK1FNnJK+agENlQitCFKp4DXmfWprEIGaJwMTFY2MwyJab3HuwpL8na0El68CHa/vULItVKa1lTCrIc5UW4jIEDbk4M4r+QDOpo78D9zuVQ4iXdUj7KdaeEzFmpTTrsBOSkHFuKqRmNDEsoiQJE0CJsy6HF33nOpWvnki6iN80kOT5vQGWm3juzbYYfD2S828lJNQ+7KEMzwkMm7q4YeZm1dLnXTlpXh+LlIMa4lZOcEjTv1GmteA7WMTmQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GLauln6hcw4AgjFz8B6k8e99tpy8EkcKwPPPx1dVLT8ObQoMN2nJLPIQHr7mDO0CoZosTgMJadhjbjGJlpwIdVmurccWWgltwxsuzKk9r6UY42LwrxRuf5MtunL4ZdyTrUEyZku+solo60vjsyio48fJDIBkNC9U5n0bhaWXGatQQlF0GIkfPj5wy3rE0pTJF8aCyrDPUw+dkhj0NUR8Kvjoq0kM0KUEzbsrdkF2H5zow2HmMzqRELQnR0ZCZC1vwkLdyHinN23XxIE74IcWTXOeH8C7LJk8foK8HxDZ2sb9YnYpxWKfxvq/APh0ScClF9VMXWZTnOwXNyXReNp+an4ohp9x8qhpS7ob13iVkSaIuWeNWCdtDSq4Zxd7nmIsRgGDIHK8gGBkIR9mSAmHELCnB3GkBOvzqeUo5Fp6T8cs/l76ZQGTK6ud7Lw8VjRD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 16:43:51.9095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d064a54-17b3-483e-766c-08dee0fdebbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6392
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:from_mime,amd.com:mid,amd.com:email,amd.com:dkim,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA7C074DB2C

Register the WAIT_EVENT ioctl so render-node clients can wait for AMDGPU
event records and receive event metadata through the per-file WAIT_EVENT
manager.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index e90cf67c1cd8..b738a1bdf9d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -3097,6 +3097,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
 	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_LIST_HANDLES, amdgpu_gem_list_handles_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_PROC_OPTIONS, amdgpu_proc_options_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_EVENTFD, amdgpu_eventfd_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_EVENT, amdgpu_wait_event_drm_ioctl, DRM_RENDER_ALLOW),
 };
 
 static const struct drm_driver amdgpu_kms_driver = {
-- 
2.34.1

