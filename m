Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1N9rNkwiNGqsPQYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2026 18:52:28 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABEC6A1B0A
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2026 18:52:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mSC8JJwZ;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C421210EE43;
	Thu, 18 Jun 2026 16:52:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7F510EE43;
 Thu, 18 Jun 2026 16:52:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B7C1342D85;
 Thu, 18 Jun 2026 16:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7641A1F000E9;
 Thu, 18 Jun 2026 16:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781801545;
 bh=8ZSjD4Gy0zG74j+xE9k9L78nCqmOGzl2OWVGk/wh3AI=;
 h=From:Date:Subject:To:Cc;
 b=mSC8JJwZBSyMXQAUkUMo84OVSRaE7Ax4pT0WBvMm1rkWhvuep2UeyOIGydZJ2omRR
 byvC8hDXSjZ50ipNIPKFgNMbhRmWhyzzvzkcgCy4pV8SGFzOPXqEUcdKLJJsN9o8ku
 /IVNtNNUJBQP/eXnbvPQ9AqHckiZe47JP+5xSptY0PRj4egImNgcxY+srH/cleGfwF
 VO9BrpiHdDlRDI4+5CK++Rr8wIyjG/2SrPTKuS8HJJ33qwYLvP5f51kBBUGC7jAwhG
 zykcDtQ9aldT3Ybhpn1q2UKEixjjGTkVqNxgwZuFYCvoBadXKLGrgNoKSTzr2jwsR0
 IieOlIUkNnF/w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 18 Jun 2026 09:52:14 -0700
Subject: [PATCH v2] drm/amd/display: Shorten hdmi_frl_status_polling_workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-amdgpu-fix-wq_name_len-warning-v2-1-ef0e2e6f5be7@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OWw6CMBBFt2L67Zi2Ahq/3IchpC1jqcKALQ8NY
 e8W3ICfJzm5584soHcY2GU3M4+jC66lCHK/Y6ZSZBFcGZlJLjOe8QRUU9pugLt7w/QqSDVY1Eg
 wKU+OLGRHc+ZCIjdSszjSeYzqFrjlPw6DfqDp19XVqFzoW//ZHoxi9f6OjQIEoE4Tkeok1fJ0f
 aInrA+ttyxfluULrz79u98AAAA=
X-Change-ID: 20260604-amdgpu-fix-wq_name_len-warning-63c8012e0c2b
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Alex Hung <alex.hung@amd.com>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001; i=nathan@kernel.org;
 h=from:subject:message-id; bh=6TfhnfijkEQ8/smiI3W4Z7KxLUCLXT/X4YBCr5s6MII=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkmSu6rn4varshoeL+45/SHiRIi1mtm2Z0SiLKSLPU6W
 mpzqImro5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExkpwQjw24N3zMpwgfPLT6x
 Zv3C8Glrbzr2NngFvV/HfOHj1oVm2XcZ/sc+fjZBYPtFiw8HZdMnbfkg7FGkZ2VxflYtZ/5bw8+
 KuzkA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4ABEC6A1B0A

There is a warning when creating the hdmi_frl_status_polling_wq
workqueue because "hdmi_frl_status_polling_workqueue" excceds
WQ_NAME_LEN:

  workqueue: name exceeds WQ_NAME_LEN. Truncating to: hdmi_frl_status_polling_workque

Shorten the workqueue name to "hdmi_frl_status_polling_wq" like the
structure member to avoid the warning.

Fixes: 5c9b8b27a883 ("drm/amd/display: Tie FRL support into amdgpu_dm")
Reviewed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Changes in v2:
- Rebase to solve conflicts with 0e967e086e75 ("drm/amd/display: Extract
  connector and encoder code to amdgpu_dm_connector").
- Pick up Alex's Reviewed-by.
- Link to v1: https://patch.msgid.link/20260604-amdgpu-fix-wq_name_len-warning-v1-1-eb5415b45b27@kernel.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2e74ff94dcac..881626f0f258 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -834,9 +834,9 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 	}
 	if (adev->dm.dc->caps.max_links > 0) {
 		adev->dm.hdmi_frl_status_polling_wq =
-			create_singlethread_workqueue("hdmi_frl_status_polling_workqueue");
+			create_singlethread_workqueue("hdmi_frl_status_polling_wq");
 		if (!adev->dm.hdmi_frl_status_polling_wq)
-			drm_err(adev_to_drm(adev), "failed to initialize hdmi_frl_status_polling_workqueue\n");
+			drm_err(adev_to_drm(adev), "failed to initialize hdmi_frl_status_polling_wq\n");
 	}
 	if (dc_is_dmub_outbox_supported(adev->dm.dc)) {
 		init_completion(&adev->dm.dmub_aux_transfer_done);

---
base-commit: 991fd2cb908bf5d35a496760519442d6e9f8763d
change-id: 20260604-amdgpu-fix-wq_name_len-warning-63c8012e0c2b

Best regards,
--  
Cheers,
Nathan

