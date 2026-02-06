Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aE6MEr+diWlU/wQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Feb 2026 09:41:35 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D2710D17C
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Feb 2026 09:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5983E10E34D;
	Mon,  9 Feb 2026 08:41:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from MTA-08-4.privateemail.com (mta-08-4.privateemail.com
 [198.54.122.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411FA10E1BB;
 Sat,  7 Feb 2026 00:01:58 +0000 (UTC)
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
 by mta-08.privateemail.com (Postfix) with ESMTP id 4f7B2s5nVCz3hhTB;
 Fri,  6 Feb 2026 19:01:57 -0500 (EST)
Received: from localhost.localdomain (unknown [45.38.20.240])
 by mta-08.privateemail.com (Postfix) with ESMTPA;
 Fri,  6 Feb 2026 19:01:23 -0500 (EST)
From: Hamza Mahfooz <someguy@effective-light.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Xaver Hugl <xaver.hugl@kde.org>,
 Hamza Mahfooz <someguy@effective-light.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Kenneth Feng <kenneth.feng@amd.com>, Ivan Lipski <ivan.lipski@amd.com>,
 Alex Hung <alex.hung@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/amdgpu: implement page_flip_timeout() support
Date: Fri,  6 Feb 2026 18:58:43 -0500
Message-ID: <20260206235846.1019172-2-someguy@effective-light.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206235846.1019172-1-someguy@effective-light.com>
References: <20260206235846.1019172-1-someguy@effective-light.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 09 Feb 2026 08:41:30 +0000
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[56];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mailbox.org,kde.org,effective-light.com,amd.com,igalia.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,redhat.com,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[effective-light.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[someguy@effective-light.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[amd-gfx];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C6D2710D17C
X-Rspamd-Action: no action

We now have a means to respond to page flip timeouts. So, hook up
support for the new page_flip_timeout() callback.

Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
v2: send a wedged event instead of attempting a GPU reset.
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 697e232acebf..1faf39b7a1b4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -23,6 +23,7 @@
  * Authors: AMD
  *
  */
+#include <drm/drm_drv.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_atomic_helper.h>
 
@@ -578,12 +579,19 @@ amdgpu_dm_atomic_crtc_get_property(struct drm_crtc *crtc,
 }
 #endif
 
+static void amdgpu_dm_crtc_handle_timeout(struct drm_crtc *crtc)
+{
+	drm_dev_wedged_event(crtc->dev, DRM_WEDGE_RECOVERY_REBIND |
+			     DRM_WEDGE_RECOVERY_BUS_RESET, NULL);
+}
+
 /* Implemented only the options currently available for the driver */
 static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 	.reset = amdgpu_dm_crtc_reset_state,
 	.destroy = amdgpu_dm_crtc_destroy,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
+	.page_flip_timeout = amdgpu_dm_crtc_handle_timeout,
 	.atomic_duplicate_state = amdgpu_dm_crtc_duplicate_state,
 	.atomic_destroy_state = amdgpu_dm_crtc_destroy_state,
 	.set_crc_source = amdgpu_dm_crtc_set_crc_source,
-- 
2.52.0

