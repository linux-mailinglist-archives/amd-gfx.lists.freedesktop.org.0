Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JptPC0x6VWokpAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 01:52:44 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7E074FC92
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 01:52:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=g7VBA5XD;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D4110E03B;
	Mon, 13 Jul 2026 23:52:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E521710E03B;
 Mon, 13 Jul 2026 23:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oshCRkuTSc7HxbPUpUr4GjCt+a0l1+09+Fh6sX4fpLk=; b=g7VBA5XDvnfdDlnIRZRUfNhIAi
 s2ZBkYWHnsScnBwuY8HBw7OUPK2qMcNc8E27oWIQEYijBLOoXvvW83SrTXKdv6mknBOQgYeJUK7cC
 a+hX1yKpQvSWhbaaEcCqtc1DDvy3xMdtzWAoGT9w9cy3e3eT5Ioe+cmYDNa2uKx6d7h60gKVqqiEa
 /n28FlMKmVnU0iox8EUtM5YOwLV0+IfcazQlXNMZ+S2Sl+qze8csFPsfEPOD2cMSSAlEg/qjgBk7l
 I/eHfwq5mDakgfPrwRAAbQN2XPmhUKxa6c32ymeDibujg9xZDcOC4IIjtgqKh+b+QFM6wEZhWrU5O
 6tjwc6fw==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wjQRy-00EjJa-9K; Tue, 14 Jul 2026 01:52:39 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 0/9] v7 drm: writeback: clean up writeback connector
 initialization
Date: Mon, 13 Jul 2026 16:51:42 -0700
Message-ID: <20260713235153.3862650-1-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[John.Harrison@Igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A7E074FC92

Drivers using drm_writeback_connector_init() / _with_encoder() don't
perform cleanup in a manner similar to drmm_writeback_connector_init()
(see drm_writeback_connector_cleanup()). Migrate all existing drivers
to use drmm_writeback_connector_init(), drop
drm_writeback_connector_init() and drm_writeback_connector::encoder
(it's unused afterwards).

This series leaves former drm_writeback_connector_init_with_encoder()
(renamed to drm_writeback_connector_init as a non-managed counterpart
for drmm_writeback_connector_init()). It is supposed to be used by
drivers which can not use drmm functions (like Intel). However I think
it would be better to drop it completely.

NB: Patch set written by Dmitry B but taken over by John H at v7 due to
time pressures.

---
Changes in v7 (by John Harrison):
- Fix missing parameter in drmm_kfree
- Fix leaking error paths
- Fix kernel docs
- Add typecast to drmm_zalloc_obj(s)
- Drop extra obsolete cleanup call in vc4

Changes in v6:
- Dropped applied patch
- Implemented suggestion by Alex to use drmm allocation for the
  writeback connector.
- Link to v5: https://patch.msgid.link/20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com

Changes in v5:
- Rebased on top of drm-misc-next
- Expanded commit message for msm patch, describing devm vs drmm issues (Laurent)
- Expanded commit messages, describing why the drivers are converted to
  drmm_writeback_connector_init() (Laurent)
- Link to v4: https://lore.kernel.org/r/20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com

Changes in v4:
- Rebase on top of drm-misc-next, dropping applied patch.
- Added a note regarding memory leak in the AMDGPU driver.
- Fixed a devm vs drmm issue in the msm/dpu driver.
- Link to v3: https://lore.kernel.org/r/20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com

Changes in v3:
- Fixed subject prefix for the rcar-du patch (Jessica Zhang)
- Link to v2: https://lore.kernel.org/r/20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com

Changes in v2:
- Switched to drm_crtc_mask() where applicable (Louis Chauvet)
- Link to v1: https://lore.kernel.org/r/20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Harry Wentland <harry.wentland@amd.com>
To: Leo Li <sunpeng.li@amd.com>
To: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>
To: Christian König <christian.koenig@amd.com>
To: Liviu Dudau <liviu.dudau@arm.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maíra Canal <mcanal@igalia.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org

Dmitry Baryshkov (9):
  drm/managed: implement managed versions of kzalloc_obj/objs()
  drm/amd/display: use drmm allocation for writeback connector
  drm/amd/display: use drmm_writeback_connector_init()
  drm/komeda: use drmm_writeback_connector_init()
  drm/mali: use drmm_writeback_connector_init()
  drm: renesas: rcar-du: use drmm_writeback_connector_init()
  drm/vc4: use drmm_writeback_connector_init()
  drm: writeback: drop excess connector initialization functions
  drm: writeback: rename drm_writeback_connector_init_with_encoder()

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  7 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  | 18 +++--
 .../arm/display/komeda/komeda_wb_connector.c  | 37 ++++++----
 drivers/gpu/drm/arm/malidp_mw.c               | 26 ++++---
 drivers/gpu/drm/drm_writeback.c               | 71 +++----------------
 .../drm/renesas/rcar-du/rcar_du_writeback.c   | 22 ++++--
 drivers/gpu/drm/vc4/vc4_txp.c                 | 18 ++---
 include/drm/drm_managed.h                     | 23 ++++++
 include/drm/drm_writeback.h                   | 22 +-----
 9 files changed, 106 insertions(+), 138 deletions(-)

-- 
2.43.0

