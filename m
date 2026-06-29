Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t6ehGblrQmof6wkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 14:57:29 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81416DA9F4
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 14:57:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yandex.ru header.s=mail header.b=p3Ba5InO;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=yandex.ru
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD6D10E075;
	Mon, 29 Jun 2026 12:57:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net
 [178.154.239.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7346C10E79F;
 Mon, 29 Jun 2026 09:10:46 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:bb8b:0:640:6ac7:0])
 by forward103d.mail.yandex.net (postfix) with ESMTPS id A3FBEC4705;
 Mon, 29 Jun 2026 12:10:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net (smtp)
 with ESMTPSA id ZAZXGGsiDOs0-5jVX16YM; 
 Mon, 29 Jun 2026 12:10:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1782724242; bh=xa8mxpQF1gWUMUNTX/3Xc9iwg6Tf8Ib7YDOWmAM4pJ8=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=p3Ba5InO56HaMPWNkPtOvS6h7ow6ARn/OigJksxiJ//wfH8jvghIcYwuazG94uG24
 mJYeqQI62mOA4zhdU6FnPrHwpqIJoPZHcOx2eCJSNCs3YA9URjckaL+smgd4lTi7KC
 3Y0yVV+Ffs4PD7Ay5HG/2kyUt7x+D6lApen6mmw4=
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
 lvc-project@linuxtesting.org
Subject: [PATCH v4 0/3] drm/amd/display: Fix dangling pointers in state reset
 functions
Date: Mon, 29 Jun 2026 12:04:28 +0300
Message-ID: <20260629090435.9729-2-evg28bur@yandex.ru>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[yandex.ru:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_FROM(0.00)[yandex.ru];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[yandex.ru,amd.com,igalia.com,gmail.com,ffwll.ch,kernel.org,suse.de,oss.qualcomm.com,intel.com,lists.freedesktop.org,vger.kernel.org,linuxtesting.org];
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
X-Rspamd-Queue-Id: C81416DA9F4

This series fixes a dangling pointer issue in three reset functions:
- amdgpu_dm_plane_drm_plane_reset()
- amdgpu_dm_crtc_reset_state()
- amdgpu_dm_connector_funcs_reset()

Each function frees the old state before allocating a new one. If
kzalloc_obj() fails, the function returns without updating the state
pointer, leaving a dangling pointer to already freed memory.

The fix is to allocate the new state first. On allocation failure,
the old state remains untouched and the function safely returns.

For the connector function, additionally restore the explicit
kfree(old_state) which was lost during refactoring.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Evgenii Burenchev <evg28bur@yandex.ru>
---
Evgenii Burenchev (3):
  drm/amd/display: Fix dangling pointer in plane reset function
  drm/amd/display: Fix dangling pointer in CRTC reset function
  drm/amd/display: Fix dangling pointer in connector reset function

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 39 ++++++++++---------
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  8 ++--
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 10 ++---
 3 files changed, 28 insertions(+), 29 deletions(-)
---
Changes in v4:
- Split into three separate patches as requested (reviewer Fedor Pchelkin)
- Remove WARN_ON on memory allocation failure (reviewer Fedor Pchelkin)
- Remove redundant comments (reviewer Fedor Pchelkin)
- Fix empty line in local variable declaration block (reviewer Fedor Pchelkin)

Changes in v3:
- Restore explicit kfree(old_state) in amdgpu_dm_connector_funcs_reset()
  to prevent memory leak (reviewer Mario Limonciello)

Changes in v2:
- Also fix amdgpu_dm_crtc_reset_state() and amdgpu_dm_connector_funcs_reset()
-- 
2.43.0

