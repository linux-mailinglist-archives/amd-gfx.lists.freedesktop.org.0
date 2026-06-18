Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XwkkB0eGM2qQDAYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2026 07:46:47 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE2169DBBA
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2026 07:46:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=lLKQyhIV;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3582810F16E;
	Thu, 18 Jun 2026 05:46:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011065.outbound.protection.outlook.com [40.107.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA7B10F16E
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jun 2026 05:46:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iq7XOISwDBl90YLgfMxqoMKdLW4WUL3ovpilqciYYtyNaD7Dez/F/CnAiEZ2KUGGLlQWoFHn5tHdgsFh0o70j7kYNrE13xPEOjaSNBBh9w/l8lgclowRRXoQqG/J2SJ4rBsAVz7OS5u80OX953eyaeTBAHFJAaSC1UA5xO38ogivrZ+5fpLysdY9QTL3WeUzBtgxPI4n/z9GSwL9xJXZEAw3JD3eLZL9F+m/B5wzYxjHkhnKUkjq9cbMpDdcCXl4nPayJWZ2EVcxGnfAutgZkX6UtDJvYrRF9ZT/IXoA+9cnzAxD4kQhM0mYXieGVVKQ85SdMZggRMm5+afvDICaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoMbZZDx4spk7FL80PoUM0Bw4FVp9L5S7YaT/ZvwY0o=;
 b=KypzFa1Y903isqAoWRoh0DaiImVNjfMNSAnkAX9H4FdB/0Kw7Oj05AyZx9jwkl2xStcdoOfA/ejDX66AEIxPdvdEx8M3VyhyO7x+O6awqXWj6kMONUdKoUBUN2aJiZGSyayE8ldvUja+deIfs4luynDUvTzDkMg2D+InoUvvdpJZL+crOhblaJ3UZraL1r71mLsJtgbbDDYvzsRl7YqFTJo8cUdKiHh0edzdqhsZzAgzZUZNvaqPsFLzh23TrHizrAAOeuUHebY62sYrCBUydhk4MfrfZ5u9Oicg/x/AW6CImBnREQ/tclWlw4PGik2F1PR37lc9GC2PuVZyHTjUdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoMbZZDx4spk7FL80PoUM0Bw4FVp9L5S7YaT/ZvwY0o=;
 b=lLKQyhIVZwlR20tTglc8ArbWwv+bgz4em+h5yuZj5n6SKJ1GjB/qd+LdpKqAWfgRjTNxrDDAOqlQQc/8kwv8zZCeX+eyIt08l8GVXBtcip36JsuOHHLYCNRaulDJqfKJl8NUHzRyq86mgxYMDpkpwu86aWWH1iK4yOTPXFlC5O8=
Received: from MW4PR04CA0088.namprd04.prod.outlook.com (2603:10b6:303:6b::33)
 by CY1PR12MB9676.namprd12.prod.outlook.com (2603:10b6:930:104::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 05:46:39 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::4e) by MW4PR04CA0088.outlook.office365.com
 (2603:10b6:303:6b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Thu,
 18 Jun 2026 05:46:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 18 Jun 2026 05:46:39 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Thu, 18 Jun 2026 00:46:37 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v2 1/3] drm/amdgpu: Signal USERQ_EOP EVENTFD notifications
Date: Thu, 18 Jun 2026 11:16:16 +0530
Message-ID: <20260618054618.2956952-2-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618054618.2956952-1-srinivasan.shanmugam@amd.com>
References: <20260618054618.2956952-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|CY1PR12MB9676:EE_
X-MS-Office365-Filtering-Correlation-Id: d596c9ee-f6d0-4c0f-025b-08deccfcf7c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: jP5Z/cM/T3QByBBpGJhFihF/IrIO7MsDmTBOld+YImf/BK6tGTGrgUVxLAbpmo8h6Z7ISzWDDWtPS2cSGnAOFZlVZPxm/lZR5HUadWGG3tae4whJRuowoIZ3DjfK1Gbj2Fu08l+SwNevCuIfX/9WglPLdPp5tcPvTVKFzokVmsTeHk+FUjTbBNI3WXo/d7C35G+ouwlRH3SqSTL8FU2cjV+ji0zgy43+ug9C/Otz4jpBP/7D6CZdqW/m5uN3UxWXwD4TfL9HWPrzc97g11lLNUlPPk51S3yJhnDCPDZbKmna0qwe7nvEtYs02gvJXVviam8FwYDP6BKDDznZItK8YRQvH9RE9HS8rlTW8O7cPyFxVHV9mm3Ay0LUKEngghVhEv0bD3BaWKDrAc6ikRCvunCBDMmK0rFhC7Yw4jRn1mqt4osiDp0PhrON3/JSzyaEQjWklAjDebXJKmCSoedYaQdmjlEAKZUKy4YHkzivvDh+Kk7U0AoF+aM20JYH3PgLK9AutPQP9XT2l+9wcBt9fcU+FrX0V46U9h/GXewZEvweZh7UhiKCV51G3nbsHSnywWxSN3h35g/sNaAwIN9chOJ7RyxPDS8WxsDhxC3Aa2TrRf+HklSk3tABEg58QQv1+/iS7W4xEkgY0TZL/3j/ufDP6JFwSqN2w3h3G/Y7trPq8kLVg5Fpw8YT/TnfEzGqEPyBkiu2Lkxxzx3OFR9x3z2dkmD2XMG0ExHW0hh5Aq8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tYBCcDGxBLh4zjKhtE1a1QHK3r/eFreChwoM0LvyZMZeTb69DMIa1LN+5qkRbRG8miyypAanrlIyFWU+rDHFjEdVy4ZuoPgTbgRSkTPxIFKMNtWEocI7Hsbai8QDacxkLge+n2oiPYzPSwN35d/LlfkCAREa2bamYw1OpKMCxXQPcDYm0FjGG8xjS7iJO6ncWe/DBS10Yk6/5cR3r/YmwPno5ZapOdv3dPSqlTaBBfllK/dMjYyDuARGVZiMZrY7hmw2oWDlIAOQoA45TiG+O/EXlMvArgA8ZvPOBwEQHLBgWb45/EiMqzVnnNatjYpzlIylNFgK/QbnkKSQQR03eEKryDXnwH1FeR3SrBlF/NHj9bo5aO1GjvzoU5dTs5w2teMQD/0QmPbl8ralH9zVzq3GcEEQjnHhGintk+jG831ne0I6JgCUBDTwq8bEQB/a
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 05:46:39.2919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d596c9ee-f6d0-4c0f-025b-08deccfcf7c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9676
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BE2169DBBA

Signal USERQ_EOP EVENTFD subscriptions from the USERQ interrupt path.

The EOP interrupt already identifies the queue that completed. Use the
queue object directly to notify matching EVENTFD subscribers.

Routing notifications through the queue object keeps delivery tied to
the queue instance that generated the completion event, avoiding
ambiguities from reused queue identifiers or doorbell indices.

EVENTFD remains notification-only and carries no event payload.

v2: (per Christian)
- Move USERQ_EOP EVENTFD signaling into amdgpu_userq_process_fence_irq().
- Reuse the existing doorbell-to-queue lookup instead of duplicating it
  in the interrupt handler.
- Keep fence processing and EVENTFD notification handling together in a
  single helper.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index b77385e35e4e..ab3f6509a5bc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -214,6 +214,7 @@ void amdgpu_userq_process_fence_irq(struct amdgpu_device *adev, u32 doorbell)
 {
 	struct xarray *xa = &adev->userq_doorbell_xa;
 	struct amdgpu_usermode_queue *queue;
+	struct amdgpu_eventfd_mgr *eventfd_mgr;
 	unsigned long flags;
 	int r;
 
@@ -231,6 +232,11 @@ void amdgpu_userq_process_fence_irq(struct amdgpu_device *adev, u32 doorbell)
 		/* Restart the timer when there are still fences pending */
 		if (r == 1)
 			amdgpu_userq_start_hang_detect_work(queue);
+
+		eventfd_mgr = amdgpu_userq_eventfd_mgr(queue->userq_mgr);
+		amdgpu_eventfd_signal(eventfd_mgr,
+				      DRM_AMDGPU_EVENT_TYPE_USERQ_EOP,
+				      queue);
 	}
 	xa_unlock_irqrestore(xa, flags);
 }
-- 
2.34.1

