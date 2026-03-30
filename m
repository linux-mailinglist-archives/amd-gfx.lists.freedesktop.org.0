Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCLnAi6Yymla+QUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Mar 2026 17:35:10 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF7535DF38
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Mar 2026 17:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0198110E5C1;
	Mon, 30 Mar 2026 15:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P02veCn0";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012030.outbound.protection.outlook.com [40.107.209.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E8E10E235;
 Mon, 30 Mar 2026 15:35:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ke0FmdQZpLMdXMhFwRsyFf0Rbzk+qodH1dMjPaMhr8tC+1rGXmfKbzy5Ii+crTtThBbXswL1POGUGisBIaQY8uloaJ1vx4weMUZfve/Vb0RxV4ee8gKGx7WlnE1bNDtBYGrZGHXV5eYJh42Tc4nsW4eXGe14L5E0+Asbw+7zpuImk1BGxC32pXA96HTnwXdEGK7PPD2pS6nxhe/z2yaQj98mvphWksZbjM9G7avI0MF1GrXZihfOxxbjfwXpe7ZTZJVyeAeo++o12Tbrvsd0WEf2Oa6MC6WE22E9KKEsNdA92wIPOnEmqSymOzD71aHcQQ6trOpwyQq6uhu0q5LxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gqBdp/CabIoXn4JlJqsFEZG5kGg6jaErWe2Dik9GZg=;
 b=Vo7D+1vIiQMmsiDvundT7Y3ueaTHizoTLE21lrMVrWyqMSNPqf8xhpQB+EspDBPqZYEMF6RFkITc7oo4yBeCSaWzlr4pNXHEYPfEtv1SlztDsTCAaEsdzlLmN28VNMpZINfHXJ573LpfV1r/wbbLp4+yQP2ch7bccjaUHV3h4zkc0PB3E7WX3x0vo2S0Mow9BMrKzC20WviBPGIVG7TZZu85RmC7dVSUsVb8dD2bSWmHcSm6wXAp5ARbYhi/bgbhxHFapMEDiHnV70gIHmxC+9J91OKO//jA/cciLFexIIrKybD7bhlwgwQtgou/Ajp7ckOPBmZ/GOMkK62cUd8YFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gqBdp/CabIoXn4JlJqsFEZG5kGg6jaErWe2Dik9GZg=;
 b=P02veCn0kagyzcknorEH5dpnHldw0vw1BztdUV2DIjHZ/qobc9xDuQAA5GO5TkUulr04BLQ1qULHKVyW8whYVcVXSYS0YAOa3jm4VeQrRhu4gI+khNTm01lrY7PTXmIYwjUHnlngJAMc7+BKCpzpWT8j2cswX876qE+1exVzC+Q=
Received: from SJ0PR05CA0086.namprd05.prod.outlook.com (2603:10b6:a03:332::31)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 15:35:00 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::11) by SJ0PR05CA0086.outlook.office365.com
 (2603:10b6:a03:332::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 15:35:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 15:35:00 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 10:34:59 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 10:34:59 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 10:34:58 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v2 6/9] drm/amd/display: Implement CSC FF colorop color
 space mapping
Date: Mon, 30 Mar 2026 11:34:48 -0400
Message-ID: <20260330153451.99472-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330153451.99472-1-harry.wentland@amd.com>
References: <20260330153451.99472-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|SA0PR12MB4448:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e46234-4486-4026-ee79-08de8e71e7b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: nSgMjlz4PCAAQchcAET36OiizggK/EKM9jheWzLsRWW3QlZ0vbGrizXXC9AkJk1APp3VdQYk+c+qQL3aXHWgvbo81QATUq7MNuvDgGIN9C9zP+j9KpBZNxXlYdY/Ht9cx3gc2Y5duR2eyP16U+ZcvFjc6odcIX+dAquSG3+3OGBVOz8kWpVC0D7+hukAGJS7EsCou1rtMWfPZVPzmgPGaWyz1r22brC7b6mGiBqAkQ+/4MdIYcRVi9+9uLkcxbFD34/bl+UJS9QlFswRe8N1WXvp0FbuW1bgpsy0GMTI9gd1wABTjiLRHOmZdzdQhvbCBQh08iJTBwI+zzHasQYqeHwVU3rJJfnmeOamae2m2gowdcCnUo2Xp1cnSq7irLcQxr+5C4jcOpTIs3l+CAM3Vo2xUD14TtSTj/i9JkpcoUaYINFNnVpPm7hC/7YLK6EwmTNYQl/HumSwPoCstBG60BslQ3bKslsCjYea7QdYBci0jicBPNULHZloqdFUHsBwE9PZLlp449DSDdZo+XUYortaO67mWcgfKtJsyV94kB9UWRH2GXmOWXsVhtjcxW4aJlT5k8Z4Je1RfGfqwu/j0I2l1O4ih6X/IeWEbYd2bSjbh4DDhDO5QtEWJ4vGyg6E/Tda6NUAWbFMaFsav6Px0UBn+AGcmAl3sNDFAky2jiJDRifZNJoZUr0A34FKoXkx/HOBtEh7bSrooTe1y9SsnV8X9CZ+bb2JiI6r6Ri+dxNe1k4ipvCLKdDJGnsN+DUTgd7zNJuArjGJSG1XQMkgow==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZBc0tKth06gH3d6heHdtlMs+s7R+slZNkZGDGOY8ZKnA4sKyDgll6DJ3Mz6p8RQiJdcAOAzm1vqMS6BHHePHioEY8NZKl6/yVhdcw+BeR90hqCwl9IMHtoBAK9FeSKXzPe9aZXi5epa+xRNKIx3RZC9Fnmi7nv6PvDnDmHuYh/q0oWBKS3WPVXQ0m9WC1zN/oDgmLG3fvHZUQ+aVIMHgnU6TR6/uotLm1N2NU605QkpLhfXPQjSt/jqRH4d9gVLnSCjRVzvU+TngYEuV2EN4GL+He4MVi6U4N27bLBXirgcTHbY3PXdEQM9izHKia/9xmFVaakom8DAzYwPTIracrCa3jZasD/iYhPHHiGyKZJAxph8oJZO7PoBCOVfLtqG0UYiO9bV+KPZPqELyFEBkmCzqJzWWB+QxzHSEmh1/u2uTMkXrZ9PyB8/bM4hS1bx9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:35:00.1426 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e46234-4486-4026-ee79-08de8e71e7b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
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
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AEF7535DF38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add __set_dm_plane_colorop_csc_ff() which maps the CSC FF type
enum to the appropriate dc_color_space for DC programming:

  YUV601_RGB601         -> COLOR_SPACE_YCBCR601
  YUV601_LIMITED_RGB601 -> COLOR_SPACE_YCBCR601_LIMITED
  YUV709_RGB709         -> COLOR_SPACE_YCBCR709
  YUV709_LIMITED_RGB709 -> COLOR_SPACE_YCBCR709_LIMITED
  YUV2020_RGB2020       -> COLOR_SPACE_2020_YCBCR_FULL
  YUV2020_LIMITED_RGB2020 -> COLOR_SPACE_2020_YCBCR_LIMITED

When CSC FF is bypassed, color_space is set to COLOR_SPACE_UNKNOWN.

Update amdgpu_dm_plane_set_colorop_properties() to process the
CSC FF colorop first (before DEGAM), matching the new pipeline
order.

Assisted-by Claude:claude-opus-4.6

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 68 ++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index cd1e58b8defc..d5b4190e635c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1492,6 +1492,61 @@ __set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
 	return 0;
 }
 
+static int
+__set_dm_plane_colorop_csc_ff(struct drm_plane_state *plane_state,
+			      struct dc_plane_state *dc_plane_state,
+			      struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	int i = 0;
+
+	old_colorop = colorop;
+
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (!colorop_state)
+		return -EINVAL;
+
+	if (colorop_state->bypass) {
+		dc_plane_state->color_space = COLOR_SPACE_UNKNOWN;
+		return 0;
+	}
+
+	switch (colorop_state->csc_ff_type) {
+	case DRM_COLOROP_CSC_FF_YUV601_RGB601:
+		dc_plane_state->color_space = COLOR_SPACE_YCBCR601;
+		break;
+	case DRM_COLOROP_CSC_FF_YUV601_LIMITED_RGB601:
+		dc_plane_state->color_space = COLOR_SPACE_YCBCR601_LIMITED;
+		break;
+	case DRM_COLOROP_CSC_FF_YUV709_RGB709:
+		dc_plane_state->color_space = COLOR_SPACE_YCBCR709;
+		break;
+	case DRM_COLOROP_CSC_FF_YUV709_LIMITED_RGB709:
+		dc_plane_state->color_space = COLOR_SPACE_YCBCR709_LIMITED;
+		break;
+	case DRM_COLOROP_CSC_FF_YUV2020_RGB2020:
+		dc_plane_state->color_space = COLOR_SPACE_2020_YCBCR_FULL;
+		break;
+	case DRM_COLOROP_CSC_FF_YUV2020_LIMITED_RGB2020:
+		dc_plane_state->color_space = COLOR_SPACE_2020_YCBCR_LIMITED;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	dc_plane_state->update_flags.bits.full_update = 1;
+
+	return 0;
+}
+
 static int
 __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 			       struct dc_plane_state *dc_plane_state,
@@ -1879,10 +1934,21 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	bool has_3dlut = adev->dm.dc->caps.color.dpp.hw_3d_lut || adev->dm.dc->caps.color.mpc.preblend;
 	int ret;
 
-	/* 1D Curve - DEGAM TF */
+	/* CSC Fixed-Function (YUV to RGB) */
 	if (!colorop)
 		return -EINVAL;
 
+	ret = __set_dm_plane_colorop_csc_ff(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
+	/* 1D Curve - DEGAM TF */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no degamma colorop found\n");
+		return -EINVAL;
+	}
+
 	ret = __set_dm_plane_colorop_degamma(plane_state, dc_plane_state, colorop);
 	if (ret)
 		return ret;
-- 
2.53.0

