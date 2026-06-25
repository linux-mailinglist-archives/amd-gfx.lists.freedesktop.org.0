Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NwzZFV8wPmrHBAkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 09:55:11 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C236CB28D
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 09:55:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yandex.ru header.s=mail header.b="QXcT2dL/";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=yandex.ru
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E726A10F4AD;
	Fri, 26 Jun 2026 07:55:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Thu, 25 Jun 2026 15:24:33 UTC
Received: from forward202b.mail.yandex.net (forward202b.mail.yandex.net
 [178.154.239.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4833A10E216;
 Thu, 25 Jun 2026 15:24:33 +0000 (UTC)
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d102])
 by forward202b.mail.yandex.net (Yandex) with ESMTPS id 88A4EC3663;
 Thu, 25 Jun 2026 18:18:26 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c24:221f:0:640:b03f:0])
 by forward102b.mail.yandex.net (Yandex) with ESMTPS id 629CDC00F6;
 Thu, 25 Jun 2026 18:18:23 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net (smtp)
 with ESMTPSA id DIbMBTIdH0U0-mdd7Epgp; 
 Thu, 25 Jun 2026 18:18:22 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1782400702; bh=8NQg9mqw8zBbJMcwecVSvlZHJ1JE4BFnWrwrF2BbF7A=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=QXcT2dL/k8M5RbOhYNhFlUOU5jtWfYXUCyN5lxYd3RQc2Ih1VuzyCV144MsLJ+eHs
 qjLoDS/5rH18f4VfKFmj2Qgdo4N7a3yFPn/PwLx1tRFzCq7Zc9H661N+X6DPS4TpPH
 1caTrKIfigb01wfGFnpOzrSoAMWSOQbL7WH5OW4M=
From: Evgenii Burenchev <evg28bur@yandex.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Evgenii Burenchev <evg28bur@yandex.ru>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 alex.hung@amd.com, mwen@igalia.com, tzimmermann@suse.de,
 Alvin.Lee2@amd.com, ray.wu@amd.com, dmitry.baryshkov@oss.qualcomm.com,
 chaitanya.kumar.borah@intel.com, pierre-eric.pelloux-prayer@amd.com,
 HaoPing.Liu@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH] drm/amd/display: Fix dangling pointer in plane state reset on
 allocation failure
Date: Thu, 25 Jun 2026 18:17:12 +0300
Message-ID: <20260625151717.27757-1-evg28bur@yandex.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 26 Jun 2026 07:54:04 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[yandex.ru,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[yandex.ru:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[yandex.ru,amd.com,igalia.com,gmail.com,ffwll.ch,suse.de,oss.qualcomm.com,intel.com,lists.freedesktop.org,vger.kernel.org,linuxtesting.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[yandex.ru];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[evg28bur@yandex.ru,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[yandex.ru:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57C236CB28D

In amdgpu_dm_plane_drm_plane_reset(), the old plane state is freed
before allocating a new one. If kzalloc_obj() fails, the function
returns without updating plane->state, leaving a dangling pointer
to already freed memory.

Fix this by allocating the new state first. If allocation fails,
free the old state (if present) and set plane->state to NULL to
prevent any dangling references.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 5d945cbcd4b1 ("drm/amd/display: Create a file dedicated to planes")
Signed-off-by: Evgenii Burenchev <evg28bur@yandex.ru>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index e957657b06c7..0d81cef5fdaa 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1490,20 +1490,30 @@ static void amdgpu_dm_plane_drm_plane_reset(struct drm_plane *plane)
 {
 	struct dm_plane_state *amdgpu_state = NULL;
 
-	if (plane->state)
-		plane->funcs->atomic_destroy_state(plane, plane->state);
-
 	amdgpu_state = kzalloc_obj(*amdgpu_state);
-	WARN_ON(amdgpu_state == NULL);
 
 	if (!amdgpu_state)
-		return;
+		goto err_alloc;
+
+	/* Old state can now be safely destroyed. The new state is already allocated and will be assigned */
+	if (plane->state)
+		plane->funcs->atomic_destroy_state(plane, plane->state);
 
 	__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
 	amdgpu_state->degamma_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
 	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
 	amdgpu_state->shaper_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
 	amdgpu_state->blend_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
+
+	return;
+
+err_alloc:
+	/* Allocation failed: free old state (if present) and set plane->state to NULL */
+	if (plane->state) {
+		plane->funcs->atomic_destroy_state(plane, plane->state);
+		plane->state = NULL;
+	}
+	WARN_ON(amdgpu_state == NULL);
 }
 
 static struct drm_plane_state *amdgpu_dm_plane_drm_plane_duplicate_state(struct drm_plane *plane)
-- 
2.43.0

