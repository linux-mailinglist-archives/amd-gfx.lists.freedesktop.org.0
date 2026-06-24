Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5UFsLVgdPGpjkAgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 20:09:28 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0D36C0A4C
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 20:09:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=tRahE4kS;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCFA10F08D;
	Wed, 24 Jun 2026 18:09:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012030.outbound.protection.outlook.com
 [40.107.200.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0677710F087
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 18:09:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGUNhb+uwbKoTI7fIk9nMjeIvtmPaBSQcJb4dr2Ghfwu7dZVMZ+5nKEoRM8lPfbVFRFE2TVrq+PjUA/unmiImsWBIxDCJDwpW9DfOn22mkYKjq6+Vp+lYXg9z4gYdsKvVhlw80aVCGAcC54GgdNkWG3l4l07O3xLH/OsiiarUfCDyVw9GQIg8xzprWNtKndfmzTIMK5d83IEiUCWVR6a04HYGsgNK5E0I1d4uVL82GmknpMH7ko5cVZPA3h/+tru22gYlEST0GlOQ3O7Ek3zAHYaxaxXjLg6NHxMWjlomXL2dkAaZshIOWX6xeQIlWH4bsd8YkMB710uanTB+gVG2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A39GRa8WvufJfE3LJiFH3ZFTOp9/ntqIZya/fTS7cSY=;
 b=I5jYet/hcpSZxX9Mngbutm0x3JU3kga0XS4qAFiiFgSI3pLcXQScKT66YoZJWb7KCoDi5i7r9k1/+dRQdH4zfXCt2ZhRvEooUL9DAuy1lzNhJvz9qmDK1p1cIXpemMFV4xu28VkRdTwhPjxfSjmpIuJ+F2IqFOzPfpHJjRxCRxOp7lNoXZPnh8sUSaYVBhUn5zjNA3Ej/TPX3RCAfqJrSI1t7hXJCuk7eC37MrpQDGSp3kyCUHhCLF3D3xk1iV90HilaKkAgYoC2yPrFFz70h/Lgj9OJHIlASn5owfJjXnmyxyQx+Wdx5YBE4J+uRMRhR9YO/gnAYzuVB5u0Tm/low==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A39GRa8WvufJfE3LJiFH3ZFTOp9/ntqIZya/fTS7cSY=;
 b=tRahE4kSoUSWbqsmtvRGZVppbaF2QrKXeTSrOfRZe/U0lCdMgscDQiOuR0PjRJMn6Botc9lUjjd2pD1y6wUYKEVgdWRUcqg001voqZckfFr6ggN1saBbcSLKR93ThGMWjRgiAdykQNy1USMkbErAG4nDEJ0z64A3s3f/WqG5rno=
Received: from SJ0PR03CA0022.namprd03.prod.outlook.com (2603:10b6:a03:33a::27)
 by CH3PR12MB8728.namprd12.prod.outlook.com (2603:10b6:610:171::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 18:09:17 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::10) by SJ0PR03CA0022.outlook.office365.com
 (2603:10b6:a03:33a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 18:09:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 18:09:17 +0000
Received: from MKMGEORZHAN02.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 13:09:14 -0500
From: George Zhang <george.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, James Lin <PingLei.Lin@amd.com>, Chenyu Chen
 <Chen-Yu.Chen@amd.com>, George Zhang <george.zhang@amd.com>
Subject: [PATCH 08/28] drm/amd/display: scale plane global alpha to 12 bits on
 DCN 4.2
Date: Wed, 24 Jun 2026 14:03:06 -0400
Message-ID: <20260624180829.4775-9-george.zhang@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624180829.4775-1-george.zhang@amd.com>
References: <20260624180829.4775-1-george.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|CH3PR12MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: f653cb8d-6f30-46da-bb2f-08ded21bb4d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: T9G3nyGvxP6Gt3RrbduspvHvrvBdUNkMbbG3qmYc1ZAkK5gidKUb80arNItUVucHPp+vgUKqV7j+QL+6BUqHhlPM09JgVsU5PQxos5kO0T33TdIZ5XKq5l3BvOjAgpc7AkokvKew1VjbQLbPiSWxyXLlmXhyOQy1xUbLLx7QPhQIz5FpC3dN2mcRURmKhn5bqkIzjeyMVGWfjyNt9vHT3cSwavnuep6MOd1tt3gUMGhmxKEntjfdIJYy5HZKFAB+2303z60O8sfwhBJBtOETI6UKw8G1hC/vUgeOLEkPVOAQXrlgdovKMAqcqZLEFaK/5Z3IFoD1KrraQgqlUwVg4dG9lho6an3Ukc0zakOYeXyL74RNVXPaOOCqGrNz8J0gEIt4azK/Hhh4QFpbBOSWSpoEOTtlv5gimEzZloLcLDAUuDtBlfgD09btFZCzDfCnI0eSDmoBJcruLEHygfZKOecnE9gqXQKkkb8JNXkAEyWO5RrXoT9XMZJnzHUACr2CLVXKB5FzKh/tNPRqlqJL+Xu+ugNu9E5eX7L60J4lS7Wq/g23dS7fyeuprWxn+0dijaX5zmeWCURbhkafRtzEubFiOFmMDmmxJrwLLhEPhOYjHi/ofqWsh1L+HNKFmY4JCEc49KniVhnIUySwyaIjaNi8fGsN5mjFmK8U2UMTFsAcRtDQ7YRWrIA5eNtrgfTJmxrdY/QKbzDYbtFXdOz7VA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: m53OxNFUJayy12GYeYFa4xzmzvmxxDE0rYW3BSlNXS5rhFWca11aA2uv35bT5KnOz5z1Ah+/Be+ShhfpEQg8+Hi0nGXBoq8T+2C3ZAFz+Ig5D6UqigN1RrlC2BkSIdFWcMbYAF+yghpKnk25UL/2Gy26Zbt2fa+wkQODLKONSqXXLtnGz8E/ow9j1BpszcUngIQDhQ33RSzPQ82E+irvyYMQZkSY/mzMPACGuoBdil7woDZIQ72Avc4db0aKiKRiCfN1H+ElVK4DWDxL1ygvDahfoOm/cNWxEmYdx4jBAgPAwQfh9hpw0W4iWL9Erfi11msTgMsz8b++AL5JepxVP8SPHIcBxOeSJpurNC7GFGHzm6Cx0oPisGuWEDXl2Rb49++AfV2Q+TqsN6Yo0CxS87T0TF1YZZM2gRv6PjKTd7sJzCbtTxvdJzC7PwL+21Pw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 18:09:17.1419 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f653cb8d-6f30-46da-bb2f-08ded21bb4d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8728
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
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[george.zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D0D36C0A4C

From: James Lin <PingLei.Lin@amd.com>

[why]
On DCN 4.2 the global alpha is reported using 12 bits
(MPCC_GLOBAL_ALPHA spans bits [0:11]), whereas other ASICs such as
DCN 3.1.4 use an 8-bit field (MPCC_GLOBAL_ALPHA spans bits
[16:23]). The DRM plane alpha property is 16-bit and amdgpu_dm
unconditionally scaled it down by >> 8, which only matches the 8-bit
hardware field. On DCN 4.2 this fed a value that was 4 bits too small
into the 12-bit field, so the hardware applied the wrong global alpha
and the resulting blended output did not match the expected hw * alpha
value.

[how]
Detect DCN 4.2 via amdgpu_ip_version(adev, DCE_HWIP, 0) and scale the
16-bit plane alpha by >> 4 to fill the 12-bit MPCC_GLOBAL_ALPHA field.
All other ASICs keep the existing >> 8 behavior for their 8-bit field.

Reviewed-by: ChiaHsuan (Tom) Chung <chiahsuan.chung@amd.com>
Signed-off-by: James Lin <PingLei.Lin@amd.com>
Signed-off-by: George Zhang <george.zhang@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c  | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 20bac36be335..458b3dcdbfa3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -137,8 +137,18 @@ void amdgpu_dm_plane_fill_blending_from_plane_state(const struct drm_plane_state
 	}
 
 	if (plane_state->alpha < 0xffff) {
+		struct amdgpu_device *adev = drm_to_adev(plane_state->plane->dev);
 		*global_alpha = true;
-		*global_alpha_value = plane_state->alpha >> 8;
+		/*
+		 * DCN 4.2 uses a 12-bit MPCC_GLOBAL_ALPHA field, while
+		 * other ASICs use an 8-bit field. The DRM plane alpha is
+		 * 16-bit, so scale it down to the width the hardware expects.
+		 */
+		if (amdgpu_ip_version(adev, DCE_HWIP, 0) == IP_VERSION(4, 2, 0))
+			*global_alpha_value = plane_state->alpha >> 4;
+		else
+			*global_alpha_value = plane_state->alpha >> 8;
+
 	}
 }
 EXPORT_IF_KUNIT(amdgpu_dm_plane_fill_blending_from_plane_state);
-- 
2.53.0

