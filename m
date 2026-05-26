Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMq5KnwNFWrHSQcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 05:03:24 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC855D02F0
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 05:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D950B10E43E;
	Tue, 26 May 2026 03:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uXGuJkm6";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010029.outbound.protection.outlook.com
 [52.101.193.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB1510E43E;
 Tue, 26 May 2026 03:03:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDtk6iSCynmS1EtrDWISkgusC/lQ+lafCmYV1P+HrYArZg/as6+YuMRbBmp032Un0Nfw6vsoy5h5Xz+W32gWoGqoB8aThEHEJmsFAgHPoCsqDgQFsEApicjpI12ngjsayDj4nestw055U0PRFFdzE96qQZn7PptfMTE3fphErKr+aVUCo9LDFoxPaiHYZs+1hKegAQNy6jR3kXMZsvVKLplw3K7n1omv1TzK4aDERDhIQCiaTge7zK42wDldVQ1C7GoZodrCm1AU16Oh1VHfWyAamAh9Ge0MYZG6vrN3lGca+Fz7QUduM+P+2nV2OFrOrmAuVSivAUaEaH/AT8KvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzrNgfJvGIhZQGR4RCkmJKxA/Ls9MdXheLTZFWv2xXM=;
 b=XEjm67djEyWT8g8MGaes5+VOtoA5sP1UFEBi6nv/GetxUNRoSab2b4YvSyq9miLETpB9/a4BXRh2AONxF2lsQP9kUcXdGipbqvoJssgphvbogJj+Z7DX3UirSKawPRQPVVT2gu19f+TDdwPnfDVTcf0/tizZSBpwb7hBGc7fqtrOnUp48aADP2uYwQzPpqMvwubdL9eia64uhkPMTmcMwtuj+ay9niL3n0F3nOKiMi9gsrdQV7IjduPPnBA0QdsYsCUILwVLjjXAYnBuApEFE9jTPCWBS3HyBIvtQSiyudIXR934c3eRzC85YW8OPWUMG84epQwQDpSOZx9OEHfgCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzrNgfJvGIhZQGR4RCkmJKxA/Ls9MdXheLTZFWv2xXM=;
 b=uXGuJkm6QYFamA0JiHYpoYqyP7Joi7YT3jJNXw37zonH+QJR8kSFzEr7/bRpGiElGRq+UULgbcgH8k6YZFv1PFEvQ6EQIBWUHdzSj8x8jZ14JRJrff2oWVPzfbP1EAdeaEIKjFy1DJGYwl0Rm6c0Ngl9N96WWE6PdVfSNofVv8M=
Received: from MN0P223CA0028.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::17)
 by SJ2PR12MB8928.namprd12.prod.outlook.com (2603:10b6:a03:53e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 03:03:16 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:208:52b:cafe::74) by MN0P223CA0028.outlook.office365.com
 (2603:10b6:208:52b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Tue, 26
 May 2026 03:03:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Tue, 26 May 2026 03:03:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 25 May
 2026 22:03:13 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 May
 2026 22:03:13 -0500
Received: from chenyu-station.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 25 May 2026 22:03:11 -0500
From: Chenyu Chen <chen-yu.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, "Ray
 Wu" <Ray.Wu@amd.com>, Limonciello Mario <Mario.Limonciello@amd.com>, "Jani
 Nikula" <jani.nikula@intel.com>, Chenyu Chen <chen-yu.chen@amd.com>
Subject: [PATCH v3 3/3] drm/amd/display: use DisplayID panel type in
 dm_set_panel_type
Date: Tue, 26 May 2026 10:59:51 +0800
Message-ID: <20260526030254.1460480-4-chen-yu.chen@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526030254.1460480-1-chen-yu.chen@amd.com>
References: <20260526030254.1460480-1-chen-yu.chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: chen-yu.chen@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|SJ2PR12MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a4378a5-a0dc-4d3c-cff2-08debad3544c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: yfgEhCtNWKZhV+rdCWmEk3arjCbxZBTiOc6iAKYr2PP1ONdU7k4Z2s1FzbiALK6hIHVbA4+MZWENl8GlYS6BSZjE6evJfmDdo+qPZ83uWWAVuN2XCYLwUCSDxz7Odke+JkgJUKdbeUjF0D5HldKHPec4drBB+nCFjJ5i8XDSuIMVS4OIcWgvFuKLEz4qtNyjdn4fQm2X6tqdHdsGx9iES7twzLvkIOIw51JwfXOl+Gf9aOjF2wQ4b4WLhXu2NV4pjtddfH0hK+/5AHYri6Oi/dFA9gbmqizSxmtrtFc4zNafCuNIjT9QVQQrKSweKf0D+yy5q6DaHQUBopiOLULh1mUrL3Q+hsaOZN8aPc13WjrTPNBdWAZW/kqXsMPKh/jCkNMNBYglVHD169elPNCgvEoqdYV4nikzOrYPB0aOMD8XWJfkaJ99uQA0oO4IiO7wkbcaJnD79ViauvI0k9iKRCxcFA+fuyLB9Vn+k4HlYukuLHSvEPA4nCpOwZkz0PUjLvOMK8WVcYGxhk3Jkbmr9pPxkPZqmmoyEWiqhUazRHnuq+NG0HCTqY9+p92jAI6Qxrl0p18a5Dd27r3zUgvPieLbu0FOc7phg3W7SlgAHTg2tzIhX95kUx28+uehoE3Uf76yv72zAho8q5Gxf9Jcw+QG5D8s59LS5NWWs0b4CWEnMgCWEPtrg2+JoW4ockw/bAvb4166CNhq3Nbje/cOYlQtvIaWFLRsgA/fDoXzozM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Fld/6WVXLcar8FvP19pjRKA6v2kj2AhuRDDedBavwQ6mo+Q2NQnvoHIpDP5+OA5F4hB+8DxCtoBkQ5LOh+FoW+F6brtzrwPwLDCeRWJwp4hVv0oKEcnWKCLTYbeQcxalhZUHu0AtrY8N8kJe93Mvq7cY6Y/pizJ/VSVJgh3q5fTPZqgyh02yY378tjo3lJ/2u2VjvXfVXOG8uqMPaE3med0Lpqx2H5g9sxqyrwgoGfOWif5N5eGIrlu+yDcbtgFKoQzTRgdRC7Ulbnfp4oDFl+sGB1mHWGmVUC2mcyDLmyUOSIZohrndW0FcjUTLi5egbNMcfGnFuoqrQWrNOyVrdgQztW7o8Ks/d9O3HsijmhLRFtfWF5ja4URT3C5+jVwghLPm705ke4Bgpr5n278YMnDi2dpRxqp+/WT7pCIo+0LS2c35DVDGR1t7W261FCJa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 03:03:14.7972 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4378a5-a0dc-4d3c-cff2-08debad3544c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8928
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
X-Spamd-Result: default: False [1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chen-yu.chen@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5DC855D02F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wire up the newly parsed panel_type from drm_display_info into
amdgpu_dm's panel type detection path. When neither the AMD VSDB
nor DPCD determines the panel type, fall back to the DisplayID
Display Device Technology field to set PANEL_TYPE_LCD or
PANEL_TYPE_OLED accordingly. Also expose LCD to userspace via
the panel_type connector property.

Assisted-by: Copilot:Claude-Opus-4.6
Signed-off-by: Chenyu Chen <chen-yu.chen@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e42a5eecdf46..ccf933ed63de 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3944,11 +3944,13 @@ static void dm_set_panel_type(struct amdgpu_dm_connector *aconnector)
 			link->panel_type = PANEL_TYPE_OLED;
 	}
 
-	/*
-	 * TODO: get panel type from DID2 that has device technology field
-	 * to specify if it's OLED or not. But we need to wait for DID2
-	 * support in DC and EDID parser to be able to use it here.
-	 */
+	/* If VSDB and DPCD didn't determine panel type, check DID */
+	if (link->panel_type == PANEL_TYPE_NONE) {
+		if (display_info->panel_type == DRM_MODE_PANEL_TYPE_LCD)
+			link->panel_type = PANEL_TYPE_LCD;
+		else if (display_info->panel_type == DRM_MODE_PANEL_TYPE_OLED)
+			link->panel_type = PANEL_TYPE_OLED;
+	}
 
 	if (link->panel_type == PANEL_TYPE_NONE) {
 		struct drm_amd_vsdb_info *vsdb = &display_info->amd_vsdb;
@@ -3966,6 +3968,10 @@ static void dm_set_panel_type(struct amdgpu_dm_connector *aconnector)
 		drm_object_property_set_value(&connector->base,
 		    adev_to_drm(adev)->mode_config.panel_type_property,
 		    DRM_MODE_PANEL_TYPE_OLED);
+	else if (link->panel_type == PANEL_TYPE_LCD)
+		drm_object_property_set_value(&connector->base,
+		    adev_to_drm(adev)->mode_config.panel_type_property,
+		    DRM_MODE_PANEL_TYPE_LCD);
 	else
 		drm_object_property_set_value(&connector->base,
 		    adev_to_drm(adev)->mode_config.panel_type_property,
-- 
2.43.0

