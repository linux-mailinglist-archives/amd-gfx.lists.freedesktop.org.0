Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dNK3H3O5UWoKIAMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Jul 2026 05:33:07 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D206D740335
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Jul 2026 05:33:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="gxCEOm/Y";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB8510E71C;
	Sat, 11 Jul 2026 03:33:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012035.outbound.protection.outlook.com [52.101.48.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E55210E71C;
 Sat, 11 Jul 2026 03:33:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOqrmTclm3+UOJ+mQD+LZQeNdf6p2lepKfDkh7/pOPPbkWGbw2Q9T5LL5rr0ERADLHvw/JQ2jUCHBQHdTVnnW7ROxbS/8Cj8g9HgRdLh9oFaPibJGHdFeppNib19/hTLvhOhmA6cT5B4PtabXMhI++7MfFFnVD9stykdmUb14Tc2InNGlE9vbDsqp3JWhMzCduB+pSGJAXImud13xLoKCGNov0kxC+Yucz6pfIb/PAe9N9JP1egT5bQ/R8wz2dpMNwO3wM+Y3bseHVdMJ90zpKvBFy0YPpoMqccsuFH2WwdR/ljGt7RfdCGY+PT0+O1XnmtvvEPIXCKalLwRujUDlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kxc2gCFsaVA48is/7ia4RQppU4U06D5U3RkIiMtMVZg=;
 b=DZXj8UO+gZ1PVDAQCiyu1JQRlS5KZxkgAAy/4y1R6/7giX1W0XUjsJXx72BQDKEAoZu6c4zJFp+VPhTaBr36Qxw3kjo6/9Lil9EqIjfFDGdckRxDt7bwW555WBOpib6NZ1NmZoCxFe58B7nLM85yh47BSOuKwYhIzFfvXVPp1pzvhgxEXJfrRpBFZc3YwBWRfhlrog3O0qkRuKrIDQwcxUpNqvTiKgc04778hnCrPQQ7D2kC0aujZa9E3TWoWBkEjkD3rAG+qMx0IUYV4L26k2T6HsINdpd34qxoQYodpOx1EdDE/CBjh7hQbyay9JWUUvgFWA684AzoxZiaSzPVtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kxc2gCFsaVA48is/7ia4RQppU4U06D5U3RkIiMtMVZg=;
 b=gxCEOm/YOacdSsQyo26RkOj8PUytjqebO/Djlvcgumi0A+fH7TE8hkA+av9JSJGR9z6TOq6SZ7QeLJ5XZ3lNrLSmocDP/SOA3tEaW7HEa4zfUOq/FOLjm63jNmJCnQ9DW2D87NcfZkjex2bOmh7YrL5WAp9GGDKMPx8QCiNDI2M=
Received: from CH2PR14CA0048.namprd14.prod.outlook.com (2603:10b6:610:56::28)
 by IA0PPF9A76BB3A6.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bdc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Sat, 11 Jul
 2026 03:32:57 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::ab) by CH2PR14CA0048.outlook.office365.com
 (2603:10b6:610:56::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Sat,
 11 Jul 2026 03:32:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Sat, 11 Jul 2026 03:32:57 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 22:32:54 -0500
From: Alex Hung <alex.hung@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <siqueira@igalia.com>, <mwen@igalia.com>,
 <tzimmermann@suse.de>, <ray.wu@amd.com>, <jpeisach@ubuntu.com>,
 <mario.limonciello@amd.com>, <cristian.ciocaltea@collabora.com>,
 <alex.hung@amd.com>, <timur.kristof@gmail.com>, <ivan.lipski@amd.com>,
 <chen-yu.chen@amd.com>, <srinivasan.shanmugam@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Fix writeback completion timing
Date: Fri, 10 Jul 2026 21:31:58 -0600
Message-ID: <20260711033159.3096477-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|IA0PPF9A76BB3A6:EE_
X-MS-Office365-Filtering-Correlation-Id: 1754f33a-0308-416b-c2cf-08dedefd1994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|7416014|82310400026|36860700016|1800799024|56012099006|11063799006|18002099003|921020;
X-Microsoft-Antispam-Message-Info: bnG6m1SI5RCu03nILQoOD94+AJ3zeU3kOUrJMYVML15gB2n8UXu+2MN66mm7GjrZpVsp8Q2HFueZgpeXQVGlDV+ADaDnoiDRT70NneegC6Hc3shWBsnacuoSyUsw5bUnTEGGDYJA64o1ksUXlcQvbAr2F0TTbysqvlDCxRhiIIKe10j7iQAQL9MdWa1bbl09emkTRX7DIkVIoXiWPXEiUq0sfl5jyozYeI45ECOUMcJU0+YzQ7mvBbVtHI8+yjCyucUAgqcud/EDNDQ7CAKXqJA98EnJ6Jql3H4bP/PhfxPriltse3GRZsKGb5W4FMf9ilBM3f1Pjz4/SqAk0ooW//dnW8VWPi8v27fSdvWOOpqx3q6KEC+f4b8/kJssqKRbgm0jIzD4qZYM+2QOkK77qsQZwVMO1V2W1vbDQPn73E8qQCWCDPgfqeuoEQvumLr59HGb/i96vt4zyiwasxbgIifgZCmmAwQFslKiFxzk2or4DHDGjtnjdnTj5+47iNAY5NDBQovmVnOP8HFAMvpGOgsRE8KOd+p+Lwnn5WOWhfFev/dpUNy93TP35muZk/nP3mNxX81O7VQfzMO8OLl9I88TjZ8cqDiKG4+bQnYB+/J73qE56eq+PULKj/O3SxnfhxLWtrjIKcOpuS+64lYwxoZ+Ebm3Eq7mZs2EVNbhvRjCzDhPhwJ6Hn2srB0sEln5FgpNNElx4cqUQSdttnMGarHi5Kbc+1ZI+Y/xjAtf/HSgS2y05vFr2RUe5lLmPgDw
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(7416014)(82310400026)(36860700016)(1800799024)(56012099006)(11063799006)(18002099003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aLZbFStydULNyGy1DqKrKSNwyt+cNjKVQosS6pgNbIh8E1AimfialK4OqF1QthROx/fHaGTsFQcvkL+aU2Sozgdbs7haKHhMqaP26yG0alQMqF6+kAYcc2kal0J3njvqFt3MNVXZ37xdMcqwQum3X89cH6/YGMRAo9/VVWEzb7uX4LY6tbAegx2p36z3WRcgKES0o6CGyHl2lvP+QPoxfE3ett8U1q3uj75ZWm2tSYuCd9OEOzQuMhFbpxKaC5yypmlDNKXxTK/GjMEz9ltaGgZjOh+bhnH9/NgOhzKZHdKzxaA8SM70e34fB6qxE0Z3zgJ/w8HF6G/Tao7GIUawaye4l4V88IobLWtELvy9BguJQZ3njZCCsPZuNfwijOV8HLUuGRaPESJpnm+AubgRsbKHwchq8HUM7cSSvwRA46u4Bo6FsyHwgLPUiRKZrTRD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2026 03:32:57.0124 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1754f33a-0308-416b-c2cf-08dedefd1994
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF9A76BB3A6
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com,suse.de,ubuntu.com,collabora.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[alex.hung@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D206D740335

[WHY]
The out fence was signalled on the first vblank after arming, before the
DMA finished copying, and the old code worked around this with an
mdelay() in the IRQ handler.

[HOW]
Hold a vblank reference while writeback is pending and signal the out
fence on the second vblank instead of using mdelay(). Add
amdgpu_dm_crtc_complete_writeback() to finish and clean up writeback
from both the IRQ and teardown paths.

This can be verified by running IGT's kms_writeback 20 times without
timeout errors.

Assisted-by: Copilot:Claude-Opus-4.8
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 ++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c | 33 ++++++++++---------
 3 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 8069fc41cc7f..7c784277396a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -509,6 +509,7 @@ struct amdgpu_crtc {
 	struct drm_pending_vblank_event *event;

 	bool wb_pending;
+	bool wb_frame_done;
 	bool wb_enabled;
 	struct drm_writeback_connector *wb_conn;
 };
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d67dcaa3fa8f..0f5453649200 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4521,6 +4521,7 @@ bool amdgpu_dm_crtc_complete_writeback(struct amdgpu_crtc *acrtc)
 	spin_lock_irqsave(&acrtc->wb_conn->job_lock, flags);
 	pending = acrtc->wb_pending;
 	acrtc->wb_pending = false;
+	acrtc->wb_frame_done = false;
 	spin_unlock_irqrestore(&acrtc->wb_conn->job_lock, flags);

 	if (!pending)
@@ -4988,6 +4989,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 	 * cannot run its matching vblank_put before this get.
 	 */
 	WARN_ON(drm_crtc_vblank_get(&acrtc->base));
+	acrtc->wb_frame_done = false;
 	acrtc->wb_pending = true;
 }

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
index c5467f34c51f..4de7fb264cb2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
@@ -1974,23 +1974,26 @@ static void dm_crtc_high_irq(void *interrupt_params)
 		return;

 	if (acrtc->wb_conn && acrtc->wb_pending) {
-		struct dc_stream_state *stream = acrtc->dm_irq_params.stream;
-		unsigned int v_total, refresh_hz;
-
-		v_total = stream->adjust.v_total_max ?
-			  stream->adjust.v_total_max : stream->timing.v_total;
-		refresh_hz = div_u64((uint64_t) stream->timing.pix_clk_100hz *
-			     100LL, (v_total * stream->timing.h_total));
-		mdelay(1000 / refresh_hz);
-
-		/*
-		 * Completion (signalling the out fence and releasing the vblank
-		 * reference taken in dm_set_writeback()) is handled by the shared
-		 * helper, which is also used by the teardown path.
-		 */
-		if (amdgpu_dm_crtc_complete_writeback(acrtc))
+		if (acrtc->wb_frame_done) {
+			/*
+			 * Second vblank: the DMA for the captured frame has
+			 * had a full frame period to flush to memory. Signal
+			 * the out fence now.
+			 */
+			amdgpu_dm_crtc_complete_writeback(acrtc);
+		} else {
+			/*
+			 * First vblank after arming: the frame has been
+			 * scanned out and the DMA is finishing. Disable
+			 * writeback immediately to prevent the hardware from
+			 * starting a new capture that would overwrite the
+			 * buffer. Signal completion on the next vblank to
+			 * ensure the DMA is fully flushed to memory.
+			 */
 			dc_stream_fc_disable_writeback(adev->dm.dc,
 						       acrtc->dm_irq_params.stream, 0);
+			acrtc->wb_frame_done = true;
+		}
 	}

 	vrr_active = amdgpu_dm_crtc_vrr_active_irq(acrtc);
--
2.43.0

