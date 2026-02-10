Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJa7HaVEi2nzTgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 15:45:57 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E5911C099
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 15:45:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744CA10E255;
	Tue, 10 Feb 2026 14:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vQy4DMoq";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012041.outbound.protection.outlook.com
 [40.93.195.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6901210E255
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Feb 2026 14:45:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvFEulkD9rGsJ/hHYfyh/w8YYnB3yUHQPcx+0SFTDYR+rxbd40bwNUyOhofiyUN8mD5RmhhQ9mh2z4eoDCfDpRgoKg4GbR1UKaB6lILO5BpL2bzwoMezOrvId2YNhKn3ugaLB/7apShR/MCUW608YL1c6Jlvi25/+hxM+NNZLVXKwU9BsXmUP8RA8lEQd//GXwM9VHpvEptERQn/ARCLN764WWXDPmGcfUo6bPDayLo0UXk6Xewg9pj5CV7v9KL+afJIH+hjvSPo6KlQsJXs9TsruUux2PKyKqu3U247o1Zfb/Eez84Y6Q0eX98Lxw+ZVEJGIy+kLHToi6oBA3i2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDMcAifK2WcphwrGelD3mu9Lu5MypC4psSpt6zCjGlY=;
 b=zHgVKooalp/20QE38TXQOkJRbS+gjveMiIZ2ywsBrym1BsJX1lEXkH91XsCctrjMzGlZBqxZ24IsdAW33G6/BJn2pukDTIsXzp6AdCdoeP48ST7uYPr8ngyULuplgdG8stgCyah/PvL5KCGUbbdJ5FoUv+pir6SnJ9y81S6eX+UXJ2LFr7ceqMZyh/8NHmIfhsalWvQR0lI5HL90z8WzUWCumYTI8CLxoD45BH8RGRc7TsYRhFrS/wuD8762MP0o/Q4AEZJNjt9eiL/HU/YnOO6dWSha0CgUq9LFPmZkvRVSqyKCdxqzACOTsw00zGLz9GKOZfRlH0Lh2UARYolS2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDMcAifK2WcphwrGelD3mu9Lu5MypC4psSpt6zCjGlY=;
 b=vQy4DMoqE50MC8Q9AKxGMM1ogwe9a8SbPTHdxGt3yX1aVa/UbIjXB5+fkUyDPW6nocITZuqE2XW7nOHvpcKJAxzESdX2FQnmREPmW/ihEC2jEVSoIwR5ZpdCaF6NhCHRosdfC/WgiAx9ha5jPpA9+iTv/FFdCypqfbDNV+z6oko=
Received: from SJ0PR03CA0044.namprd03.prod.outlook.com (2603:10b6:a03:33e::19)
 by DM4PR12MB6471.namprd12.prod.outlook.com (2603:10b6:8:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 14:45:45 +0000
Received: from CO1PEPF00012E66.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::6a) by SJ0PR03CA0044.outlook.office365.com
 (2603:10b6:a03:33e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 14:45:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E66.mail.protection.outlook.com (10.167.249.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 14:45:44 +0000
Received: from siweihe2-Desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 08:45:43 -0600
From: Siwei He <siwei.he@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <felix.kuehling@amd.com>, <harish.kasiviswanathan@amd.com>, Siwei He
 <siwei.he@amd.com>
Subject: [PATCH] drm/amdkfd: Fix APU to use GTT, not VRAM for MQD
Date: Tue, 10 Feb 2026 09:45:31 -0500
Message-ID: <20260210144531.817154-1-siwei.he@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E66:EE_|DM4PR12MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: 76623d4a-6146-42d4-9448-08de68b3122c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zTh8pWIHtSrE/qFNw9MvwJCeVw11K1iE9pyh4nS3nmroviZK+Cdc//fE3uLQ?=
 =?us-ascii?Q?xnC0ZvGtYa2uCpq2Eel/ozEbVXSbkRlCCyBk8heLPIu8dv6V0+csMWNpWVs2?=
 =?us-ascii?Q?v07vxJPOxRaNXCoDiLxD4COofUz/dNbzKrnZ/BKbew7D70D0cE8WC8RSO2na?=
 =?us-ascii?Q?hW1aTaRVIceDbbzGBQnGg20XMwfF0b8hJ2/RsGNiGDH51f3oh5mv6AFuKRc7?=
 =?us-ascii?Q?b2rYwkQNtzcYABv1AQ/79sJ5w10B3FD6JFxS0v6FxIQI0MnQyyVK1bsPeelC?=
 =?us-ascii?Q?z4RGdjgxqgDr+uo1MQFJhqbbLfbrZMBy+s0Tzh5awqDx845v+KFTGHGzYrDq?=
 =?us-ascii?Q?Ofli68cWjWZmkiMu+agGHfjGnyLkioxvH6HqOORiJTOoSm+AKdaLMAFBzECl?=
 =?us-ascii?Q?E+8rcrehcfNzle2gNSJNAVwI220xoATsjiIUoD+v4ANfp0b/2+ahJASuTrl1?=
 =?us-ascii?Q?k5h8oJAnKaGEO8/oXi0c9E3RcazR+5m3LmBjT374YT8aa5P96eql8ZEUCm+a?=
 =?us-ascii?Q?h/jF3XICr3G0DtgbC9Or7bf7MmnJbifDvtScNPu/xerRSqd7UM1pyM+H/Hyo?=
 =?us-ascii?Q?0RO7oeKUQtc5SErBQv5pjrPjel+sTTWJsFE5u1fSrvR804d9lrO4JoVeaNXA?=
 =?us-ascii?Q?q6WWbjodSF0/09Ythd3GbuFwxxZc4gOLTIcngBD20onzLcTyHu9nYko6h6ej?=
 =?us-ascii?Q?TJKXWT4LtW2QXAWWK4wGl0gr5Ir5alLhGHa0fLoO4rkPN2LqErOyOqLuud7Y?=
 =?us-ascii?Q?I7ZM2pEB6NZnfiX2XWLY/XNjabvLYhHKJ75XRmg6RYpEqUt0ipPkc4vETL8B?=
 =?us-ascii?Q?kBjkPc41XzSzjiwtMwwQX6yPIkwm2cJAK5yyPQ5t5kzo4vHpp+rfxtkmSd0W?=
 =?us-ascii?Q?QRDrDhdrMLi6xkY3tq5ihtkEhjJ1wyTeNCetamdUItjAzkyu33mB44Qm51yt?=
 =?us-ascii?Q?9u6AUdAI1Wh8VuTCbnbQGk0d3WlevpagOxacz/wsIhKQHQRpKjMHrfj2+VrD?=
 =?us-ascii?Q?ZBSe2gYnLmDOzz+QDYcPnouUIW4Bogf41NyKDYOXiTvQpQdlYHEXx0rceSBc?=
 =?us-ascii?Q?6cPjjiUtdBN4r8jJXaWKjGS6GiN32McWD/2QlGuX+DAIZyw+hVfaBMQD/al0?=
 =?us-ascii?Q?GAu88QOv95HTgcopScZW9Wgq4CLJT11v3bGq/4/+JK+/rH7kjOT85CcAd2io?=
 =?us-ascii?Q?ZWn/onMzSDKt7CUFTsjxhYBH4Je27OMjBLyyrXjPDtbZf53URiGyFJ7foUfS?=
 =?us-ascii?Q?E/6HqJP609nY8MMHbe7ziWjQhodFk19eHPetdqeaaCvqReDqqaiznlCqw56/?=
 =?us-ascii?Q?vy171wLPfSsgkv/17PrMHLE8ifH/hECOVh6nnCLUyUJwp9uiINvvxP6I/38p?=
 =?us-ascii?Q?i3PC1C9McGHqTWZe4maYz+B1MHMnmW3RVcdmh8o2RSbhDZcbfKzzXJ/Zj7VA?=
 =?us-ascii?Q?lIL3i+yRykuKgYmJI9mpV5azP/L8cTOvFrizOtpMNp0eNvUNdSh4SUk6Rgl1?=
 =?us-ascii?Q?U4pG/lU5+CrvBZmwjc8NZmEU/a/thxmF3bhcKRUGq5cv7iVS5loX2T86nQYT?=
 =?us-ascii?Q?GJkqvsq0g+2pkxhhXJ3gGdMnFP0qW4RIa3GrmHLUsinHL6mlld+H/oY4OdNW?=
 =?us-ascii?Q?7Vz/wCnF5tk07wBJEdX1XgvfY/mbTdN6VdWb8anqnCiMhYI7s4Tbt9O0c9BC?=
 =?us-ascii?Q?y59WyA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cDEs7C3S9rgxJnLXXOrP8mp6Y598fRHBXc2tyquADOtJJ1CEpK0ph4jhfo2PIvDzKK40uRiJxp0Z1RUmmG1S5VJzTH/CNNj1zO7+UR8wu/knusspGzIPOxytNOx9l569gGq3xOcxfZhlipa1GoJXqjVE6y+F/N8rbroiYCkHJiywCWP6kArVy+A+swg2Pg8T4R26EclUqC5U9etv44x2oPv2Xq192hRy+gemd7VqCj70C1lwRWIbVmriUwrICaViG3ZcNuQ0249OlsRYaYyDMcGQBQoBS53gpz45450akaFP9iDY4GJe41mct63H9kIbd/Ufae2M/N5KE39xM2XPERn4USsGYv/aU123OWIfwOALWfDMCEJwmUtbfS0K+jDKPmTb7lA+EIKzbSUgIODlBW7HlL//9LLAUF5dcxm61Ev5FhWHwlix5V4s7Pl8OyWC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 14:45:44.5188 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76623d4a-6146-42d4-9448-08de68b3122c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E66.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6471
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[siwei.he@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	HAS_XOIP(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: C6E5911C099
X-Rspamd-Action: no action

Fixes: d4a814f400d4 ("drm/amdkfd: Move gfx9.4.3 and gfx 9.5 MQD to HBM")
Add a check in mqd_on_vram. If the device prefers GTT, it returns false

Signed-off-by: Siwei He <siwei.he@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index d4659a438be5..a987e732e31a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -111,6 +111,9 @@ static void set_priority(struct v9_mqd *m, struct queue_properties *q)
 
 static bool mqd_on_vram(struct amdgpu_device *adev)
 {
+	if (adev->apu_prefer_gtt)
+		return false;
+
 	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 4, 3):
 	case IP_VERSION(9, 5, 0):
-- 
2.43.0

