Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 33yIGLprQmoh6wkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 14:57:30 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2938C6DA9F9
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 14:57:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yandex.ru header.s=mail header.b=ks5im5QQ;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=yandex.ru
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8C610E868;
	Mon, 29 Jun 2026 12:57:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net
 [178.154.239.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5B310E7A4;
 Mon, 29 Jun 2026 09:11:02 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:bb8b:0:640:6ac7:0])
 by forward103d.mail.yandex.net (postfix) with ESMTPS id D8A06C4701;
 Mon, 29 Jun 2026 12:11:00 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net (smtp)
 with ESMTPSA id ZAZXGGsiDOs0-e82wDVD8; 
 Mon, 29 Jun 2026 12:10:59 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1782724259; bh=ozXm2Xvy6K1ZkZFvOIsIPVVdHjDSCB8gUTLLJ0/7c0k=;
 h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=ks5im5QQyUQzg9JH+aa30cTczRyFk3Ww3tnmluw6+PVrv+1Qf1qBsm6DesF7wkzoP
 YfRrVxvvohrCvZ/QT+MdaeD6MJ6BgiPGX+ZWVcbiE3fLR4QiT8AVf8w8RI4C4/4MNw
 Hr8SpgnsjrBNK1TPYsZoZ9hv0P3YFoZR7OOqqDXk=
From: Evgenii Burenchev <evg28bur@yandex.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Evgenii Burenchev <evg28bur@yandex.ru>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 mario.limonciello@amd.com, alex.hung@amd.com, superm1@kernel.org,
 timur.kristof@gmail.com, ivan.lipski@amd.com, ray.wu@amd.com,
 aurabindo.pillai@amd.com, chen-yu.chen@amd.com, mripard@kernel.org,
 Dillon.Varone@amd.com, mwen@igalia.com, chiahsuan.chung@amd.com,
 kenneth.feng@amd.com, srinivasan.shanmugam@amd.com, tzimmermann@suse.de,
 Alvin.Lee2@amd.com, dmitry.baryshkov@oss.qualcomm.com,
 chaitanya.kumar.borah@intel.com, ekurzinger@gmail.com,
 pierre-eric.pelloux-prayer@amd.com, HaoPing.Liu@amd.com,
 Tony.Cheng@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, mdaenzer@redhat.com
Subject: [PATCH v4 2/3] drm/amd/display: Fix dangling pointer in CRTC reset
 function
Date: Mon, 29 Jun 2026 12:04:30 +0300
Message-ID: <20260629090435.9729-4-evg28bur@yandex.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629090435.9729-2-evg28bur@yandex.ru>
References: <20260629090435.9729-2-evg28bur@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 29 Jun 2026 12:57:25 +0000
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[yandex.ru,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[yandex.ru:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_FROM(0.00)[yandex.ru];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[yandex.ru,amd.com,igalia.com,gmail.com,ffwll.ch,kernel.org,suse.de,oss.qualcomm.com,intel.com,lists.freedesktop.org,vger.kernel.org,linuxtesting.org,redhat.com];
	DKIM_TRACE(0.00)[yandex.ru:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[evg28bur@yandex.ru,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2938C6DA9F9

amdgpu_dm_crtc_reset_state() frees the old state before allocating
a new one. If kzalloc_obj() fails, the function returns without updating
the state pointer, leaving a dangling pointer to already freed memory.

Fix this by allocating the new state first. On allocation failure, the
old state remains untouched and the function safely returns.

Fixes: 473683a03495 ("drm/amd/display: Create a file dedicated for CRTC")
Signed-off-by: Evgenii Burenchev <evg28bur@yandex.ru>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 3dcedaa67ed8..5b5c4023a514 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -437,13 +437,13 @@ static void amdgpu_dm_crtc_reset_state(struct drm_crtc *crtc)
 {
 	struct dm_crtc_state *state;
 
-	if (crtc->state)
-		amdgpu_dm_crtc_destroy_state(crtc, crtc->state);
-
 	state = kzalloc_obj(*state);
-	if (WARN_ON(!state))
+	if (!state)
 		return;
 
+	if (crtc->state)
+		amdgpu_dm_crtc_destroy_state(crtc, crtc->state);
+
 	__drm_atomic_helper_crtc_reset(crtc, &state->base);
 }
 
-- 
2.43.0

