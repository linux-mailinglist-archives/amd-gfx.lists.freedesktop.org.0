Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fdmOClgdPGpbkAgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 20:09:28 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9346C0A41
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 20:09:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=RZE7e8c6;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B8D10F087;
	Wed, 24 Jun 2026 18:09:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012054.outbound.protection.outlook.com [52.101.48.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D61210F086
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 18:09:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywuxyBZOtyux4dAnFMegkH1TwvEqmgUq+WW1kBzOS6App/KDjbqWx0BJxWtSn7/sdJD3iVxgEDira281EKvhM7t4fYwe5EkWeSfAFNyfWSY1f3ndg42p6kptvFmKqW1jGlVP6gTLVHK1bgDdQaUnQvIiSd9cp5PvG/jQumMHOFU20Sl6QtXjE/VMEbsgrpS4CjJ5s3S7eR6/IkYU4ULMvrM/VzmzE+CdOLdJBCPKKQZu9SiXE1VHBEJw8JLyDSwMhTtgSPtgAtKpMsmPmJ7ISKDbFy2vv8RKLAtyHtGlJkbYee/YZ+O/CfBCkO7IlgR6PhoW4SYE20BTth5Z9lGKcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiUVgMs+mNLBUAgm9U64AM2eEWHIpCdN26gKd942jU4=;
 b=CIlWraPe4xA1RZ2ODba3n8SqdBz1Pc681kaC52QOJmzMLAIMJjcx5evt8CcWz1lXyVGWWiU/OzQ9jz4bC6fi/JodlCKmUYexTlXR6musqWdpVsfYwwP+ylvTVHS9Drq6lsgj7B2o6yh4FrYYxuMsQIqHxgz5MwuTa6NZZurJInhWfA8ilyeUFLGIoipKjx7+Hy2a4oa1VaJ3NRU+gSFSpEvqJKjk923Xs/tojdOcS4qnl19mlK98ev/fz19ZbXfQYtDJ2XMcak2JKI4/Pa/5j4CwuszZrRGZxKn/dmzQ+6uS64JyrPMLzYlHJajMHyEYcZftW0kqQxLYYJZNg6bsfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiUVgMs+mNLBUAgm9U64AM2eEWHIpCdN26gKd942jU4=;
 b=RZE7e8c6c8UTnAONWxMyx6C2nRlXVIWmcvEt+2MuSyDhZKFpIllph0AjFj8OCFgJ9cr0OZgb1jmR4O66Z04FqEkQNRLJPOMtHbB2aTKdMPJJJYZAwHJM+iAttVzizJg5YnzYBBbfgk2qA32IbI63bF2WfP7ptqCmQoZ5b2/5T/k=
Received: from SJ0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:33a::24)
 by IA0PR12MB8839.namprd12.prod.outlook.com (2603:10b6:208:493::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 18:09:19 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::2d) by SJ0PR03CA0019.outlook.office365.com
 (2603:10b6:a03:33a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 18:09:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 18:09:19 +0000
Received: from MKMGEORZHAN02.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 13:09:15 -0500
From: George Zhang <george.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, James Lin <PingLei.Lin@amd.com>, Chenyu Chen
 <Chen-Yu.Chen@amd.com>, Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 "George Zhang" <george.zhang@amd.com>
Subject: [PATCH 09/28] drm/amd/display: Fix KUnit test crash after global
 alpha change
Date: Wed, 24 Jun 2026 14:03:07 -0400
Message-ID: <20260624180829.4775-10-george.zhang@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|IA0PR12MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: 09084cab-af9d-48a4-c05a-08ded21bb605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: JbvLVXpgxOMWZ6HfxVTGlgbXS9vViN0NYFJddaWtsZmZdbq+CWkauIT0B4u0ys9tB4fYhdrMTvbecoUOvKJzTasHlIGOBEBUSI3hlgLBUG7GHjkHaV06JTyCT/Nuf8FB+lay44UfjdiNM5LodcBr5nUpj6HEJVa7WxuhZ2ZyGCygzhluzG0uWEqF5Dzocb7iyt1Sdr8/m5+vxwSt1gTO+yONY007xOCmVnO8FvTjNkIHGWWrNV2dBiXb8zhoHJ3QTZzGpgZ4QYab6q1JPFePiX+9Nh095jvWwfBWjBhNUZKNlU+bJBKenQpx/bF2DJQEge5lOAgZqg+JqYK5Hzm4/Xz9OaEtLGQEI4KPg85dmPlnexsGsvLE45K6Mrp+fyr+ohQ+uwCyobKeyyUJmuM1/gdLK6HxromvCc0tt1HRNz3rnDuE8qzhmi3+9HraCmtH6zdcObPVOUyJG8Vo8Hk47p4Kbx0zFTuJwI8XQIeOFJ6Q/kqvzVjkwe3BviWkynfgmHUtJh5C1SPvQTBCUH9/Fn7lLkaeImlgeAGsnmoljpmVPH/a0nXs+f/KRvjyrTbhIaB/EbiDYdK6DGslkKXh0iny0nLtXTKUvCnoxz+adYhkGw0ifDXUEA9nhUcSY/uK1tnfibyiBrGj2YuabiMvba+VJZY1Vy20hjQWEqjNWLDQF7zolmLJPo/dMerGe9XF6pW9QlM22/KVWrfRXD6f9Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Fjk/xs3V/X18whhT2a3CFESEWWz2CTNjyvpeTAlJ+mFL+pn8FOwSsT/+XWzjkNIm8bs60ZlHGAcmQazpbjEtasJgNHU1C6HYIpgiCO8BPRl5I43KqxE+l9sTsTuG2iTmgnJqTKwaaF/Q5S9qaMfOz47LJ4ViQGFcMUXsQKr+9dotpf6Nh8Qjzhu9kzUvi90PBqAgFIH4Zu9fn7Wtn+LSKw91cI2t2SuN2t71KE8m83cL6GvSu7v7jrRZhzTFP2AK4uezGtgv18ZbPzgX5YusnsVOV21HSwSe+ECS9kNh8pkHgZB0YQjQrVoNJvZk23C9chwTu5z7OoQAT0I2D4ZxSFA/btJ7IQHpfeTNy8S75jXyIDWs5XZ1LFveJPfOeAuf18fEmowcz9vZ/rR+2Ds28LZy+faPU54okOyI6tKPLRt1C2mmOogeLnCf1vouls8/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 18:09:19.1503 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09084cab-af9d-48a4-c05a-08ded21bb605
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8839
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
	RCPT_COUNT_TWELVE(0.00)[16];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF9346C0A41

From: Alex Hung <alex.hung@amd.com>

[WHY]
amdgpu_dm_plane_fill_blending_from_plane_state added drm_to_adev() but
dm_test_fill_blending_global_alpha did not initialize
plane_state->plane, causing a NULL pointer dereference.

[HOW]
Add an amdgpu_device and drm_plane so the plane->dev
dereference is valid in the test.

Fixes: cba0cc70f251 ("drm/amd/display: scale plane global alpha to 12 bits on DCN 4.2")
Cc: PingLei.Lin@amd.com
Assisted-by: Copilot:Claude-Opus-4.6
Reviewed-by: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: George Zhang <george.zhang@amd.com>
---
 .../drm/amd/display/amdgpu_dm/tests/amdgpu_dm_plane_test.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_plane_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_plane_test.c
index deec75857c0e..071c28abaa8a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_plane_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_plane_test.c
@@ -184,12 +184,19 @@ static void dm_test_fill_blending_coverage_alpha_format(struct kunit *test)
  */
 static void dm_test_fill_blending_global_alpha(struct kunit *test)
 {
+	struct amdgpu_device *adev;
+	struct drm_plane plane = {0};
 	struct drm_plane_state state = { 0 };
 	bool per_pixel_alpha;
 	bool pre_multiplied_alpha;
 	bool global_alpha;
 	int global_alpha_value;
 
+	adev = kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, adev);
+
+	plane.dev = &adev->ddev;
+	state.plane = &plane;
 	state.pixel_blend_mode = DRM_MODE_BLEND_PIXEL_NONE;
 	state.alpha = 0x8000;
 
-- 
2.53.0

