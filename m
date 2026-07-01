Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9GWKFKlHRWru9woAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 19:00:25 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9985E6F016A
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 19:00:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=BMKY9EWB;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AD210E3CA;
	Wed,  1 Jul 2026 17:00:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013003.outbound.protection.outlook.com
 [40.93.196.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875DA10E3CA
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Jul 2026 17:00:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ear9LtQnMCEBxONukhtZ2TFkZKkmxvKKwvgfdwtcBTxk4kVRDvxhLkyOuk2hr9Zz59i0A6Q/0PJHBOIeCD2IgsWRuuizXnvkjRfbhu1rzOJsh+BfyrvBQtdkCnmQ2p+LxR5/2wOYLQHzpcJT3xZS2PaYn5dY61g+d2uzwfxOV9rH9Pl4liKP9VYbCzFUcDv1Sb/D6+qHRrASRloz+oKUPOOwGmbxapXrkuAQjLi0gCIzxG8wqgL5mJcscVjn6gRsHK1dw9gVqOvqnGHWkOFUzbbXEvzH1vgj2F23ibci31GdsGocjVBemyogZI9m4e3DMQA8H2rf+FRGfENteQEfVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jb/16ngP3pe4TSomcQ40jMP5uWhgrotNPWftrg6UrC4=;
 b=yKLc3P96i2oCOSYpvJGqjXJUXtrjQifMvPsT8aYWVBtqZ1HJ4+dDtv7GJkt1Z99OmfzKMxDH4yrAgoS1+/2DYUn/tKA2Jw/ZBvGAkFnmECLcbiVGKNeI+vk48nEVlh0RTPomDaHtxHF8yp4qzJtm5BZC88uzrwnP4YKyADT5TsEg7ponH7vZgf2myF51rDv+WK+VngHoNHmfrekrfxscWfxEfThF/vqMYk1d3GdtVKRE9pIgYxBmvinRoilMONv5+D1/IeCcso5/16G2QMjArUoxl/MRCprCpW+oBxtO/2FuBnEzHLAXSne0ZKFn14mOq5EbjmDFjw+5KkgKqDzJrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jb/16ngP3pe4TSomcQ40jMP5uWhgrotNPWftrg6UrC4=;
 b=BMKY9EWB31/K0pSed161i5WSVqP6R5xeMb8zMk7XDHJBWqyxNIMeaaXig+5HcOF5xkmqpGqVHESBvgDJ+yEZNe4qWAPjK1VaENNANp4kkDJmPwZdEHIhliL4bIO1i9YNrXa9DtNl8VBQw8h76W4u0EOogrcVP1cZCX3tEe6rrMw=
Received: from CH0PR03CA0276.namprd03.prod.outlook.com (2603:10b6:610:e6::11)
 by DS7PR12MB6359.namprd12.prod.outlook.com (2603:10b6:8:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 17:00:13 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::af) by CH0PR03CA0276.outlook.office365.com
 (2603:10b6:610:e6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Wed, 1
 Jul 2026 17:00:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 17:00:13 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 1 Jul
 2026 12:00:10 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] drm/amdgpu/display: Add amdgpu_display.c documentation
Date: Wed, 1 Jul 2026 12:00:04 -0500
Message-ID: <20260701170004.465737-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|DS7PR12MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: 33fb8320-a521-4e19-9358-08ded79237ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|18002099003|3023799007|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: qkpSyMXUerZvXGyHzvvdAOUnQRQwMAHutnwwyWnlOXsTHIRqAMBo4QsGYT0lYmrUp2AyOWH4VvwUx4RcwAVYDE2DKPwadgdavRKGl/0s2pkvE5hZvBH66lijKIAud0mMjYPXG6KiJ25TD8avuJMD3g5OrMpK/4JqqWUPpGX5qhekEd0x4wdMC8CY2QT1imc3CUjpfL7+gGY3QVqMsaYztihafPxrvB8lEhJXbOZ3q+TSqkGWWz2OynhmM/dnUPd6tE02W2RgdEfuUlJrg9whLErlNjxF+IFhCyBVBD4WsGtA2e5uwLcrQaYA9j40fH44PE6OKz8NibXMpEO+y1lIYzwBeruKaRUtvkV+lJ3lz5HToxmduFFNsEpT0MrMtLZNTdIwMHz9qVLpCAUophk88gVqu6BmA9Sx0/9gVu6Czxf45DP7uwztanpEcIc+IdTof/RgEwHqgGzJXGhelKz0kMdUcAu0P0nSh8/XI02oCVCzgGcQARkooIGJBo8Jk5BZJDrWlRlUzgW7kt31gFwb/hGWyKe4FI+IPi8MedhK1/zCs/4t00aFtqkldZ1hVZQ+cyQ3aNplKujzeKQCkY6Ng/aX92MaqW2jxTA4Fe753VZZ0vkj26FK05FY5F/8Kcd/qT9v2Hg0Vi38OkO5m3Yx58HSUB6knIGzzq074jZsdRCeJDtNQnKVueHuvgI+Y0n59Jig7xZueTXGKLQB9LC+Yg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(18002099003)(3023799007)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ne0TwzwEpab6fOODtaKMP1d3utifNnElpUbOSmrhuxpc6sqAdbajb1a5xqd8Du0rphlFKiRP1FF69JLeYBzfgemFZcAklRwNCWom6PWKgODF6kMP9FWvzsWRuagVGQpZCA0NlvPCrUyXF/ozoxY4zhmxjcTml/ndluIzAp3PIlT3iDqJU8+KLp+nwHoUJcF7Ad5GK2UyjGUTTj3rj3ZQp+ocYPYz7EAJw1IurUhZmhB7lcqY9fBRCCoM/Xet3zDxphYCLQhrDcNG2JByvjOh6WD1M+Vc27Zl0WGu5sKNHrFpXse55ODTX6TCIhjH/PoSqb46kLQ7Ov7pnQilqrdFvEN2nCQrdAjeiB0IwLzUHkrcnZQENYqLXbne6FnaTUvHrIznPllbk2jtZMuuIPLnUcL1CQ7dwpcTCNeme4BFCaU7cmPNkVDPmORh8rb7Im+D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 17:00:13.1888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fb8320-a521-4e19-9358-08ded79237ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6359
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
X-Rspamd-Queue-Id: 9985E6F016A

Add kernel-doc references for amdgpu_display.c to the display manager
documentation. This pulls in documentation for display core functions
like the hotplug work handler, and the adaptive backlight modulation
property.

The :internal: directive automatically includes all function documentation,
while the explicit :doc: directive captures the property documentation that
:internal: doesn't pull in.

Fixes: 1454642960b0a ("drm/amd: Re-introduce property to control adaptive backlight modulation")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 Documentation/gpu/amdgpu/display/display-manager.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Documentation/gpu/amdgpu/display/display-manager.rst
index b269ff3f7a545..4584a3fa48155 100644
--- a/Documentation/gpu/amdgpu/display/display-manager.rst
+++ b/Documentation/gpu/amdgpu/display/display-manager.rst
@@ -178,3 +178,15 @@ following path:
 2. On DC interface, :c:type:`struct mpcc_blnd_cfg <mpcc_blnd_cfg>` programs the
    MPCC blend configuration considering the :c:type:`dc_plane_info
    <dc_plane_info>` input from DPP.
+
+Display Core
+============
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+   :internal:
+
+Display Properties
+==================
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+   :doc: property for adaptive backlight modulation
-- 
2.43.0

