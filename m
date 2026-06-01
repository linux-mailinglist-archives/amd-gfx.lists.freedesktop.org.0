Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFfkGfuUHWqmcQkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 16:19:39 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0D1620B76
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 16:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0924210E810;
	Mon,  1 Jun 2026 14:19:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064E310E7E7
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2026 14:19:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5C32A67222;
 Mon,  1 Jun 2026 14:19:28 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 077B7779A7;
 Mon,  1 Jun 2026 14:19:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YACkAPCUHWpSdwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Jun 2026 14:19:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, michel.daenzer@mailbox.org, louis.chauvet@bootlin.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com, mhklkml@zohomail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/7] drm/vblank: timer: Fix timestamp calculation
Date: Mon,  1 Jun 2026 16:08:30 +0200
Message-ID: <20260601141922.91498-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601141922.91498-1-tzimmermann@suse.de>
References: <20260601141922.91498-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
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
X-Spamd-Result: default: False [0.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:simona@ffwll.ch,m:michel.daenzer@mailbox.org,m:louis.chauvet@bootlin.com,m:ville.syrjala@linux.intel.com,m:jani.nikula@intel.com,m:mhklkml@zohomail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:dri-devel@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:tzimmermann@suse.de,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[ffwll.ch,mailbox.org,bootlin.com,linux.intel.com,intel.com,zohomail.com,kernel.org,gmail.com];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 1A0D1620B76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In drm_crtc_vblank_get_vblank_timeout(), return the timestamp of the
first visible scanline after the last vblank timeout. This is what the
caller expects.

A vblank phase starts with a vblank timeout. At this point the display
is blanked for several scanlines. Afterwards the display is unblanked
until the next vblank timeout occurs. The display content is only visible
during that second part.

The current implementation of drm_crtc_vblank_get_vblank_timeout()
returns the timestamp of the last vblank timeout that started the current
vblank phase. But the display only unblanks after 20 to 30 percent of
the overall frame duration. The returned timestamp is therefore too early.

The next vblank timeout is already known when calculating the returned
timestamp. Instead of subtracting the duration of a full frame from the
value, only subtract the duration of the active, visible part. The result
is the timestamp of the first visible scanline, as expected by the caller.

This bug was not introduced by the generic vblank timer. It appears that
the get_vblank_timeout logic has always been buggy since it was first
added in commit 3a0709928b17 ("drm/vkms: Add vblank events simulated by
hrtimers").

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_vblank.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 96d70c3d4522..d52df247d04e 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -2293,10 +2293,19 @@ EXPORT_SYMBOL(drm_crtc_vblank_cancel_timer);
  */
 bool drm_crtc_vblank_get_vblank_timeout(struct drm_crtc *crtc, ktime_t *vblank_time)
 {
+	struct drm_device *dev = crtc->dev;
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	struct drm_vblank_crtc_timer *vtimer = &vblank->vblank_timer;
+	const struct drm_display_mode *mode;
 	u64 cur_count;
 	ktime_t cur_time;
+	s64 framedur_ns;
+	s64 activedur_ns;
+
+	if (drm_drv_uses_atomic_modeset(dev))
+		mode = &vblank->hwmode;
+	else
+		mode = &crtc->hwmode;
 
 	if (!READ_ONCE(vblank->enabled))
 		return false;
@@ -2312,17 +2321,26 @@ bool drm_crtc_vblank_get_vblank_timeout(struct drm_crtc *crtc, ktime_t *vblank_t
 		*vblank_time = READ_ONCE(vtimer->timer.node.expires);
 	} while (cur_count != drm_crtc_vblank_count_and_time(crtc, &cur_time));
 
-	if (drm_WARN_ON(crtc->dev, !ktime_compare(*vblank_time, cur_time)))
+	if (drm_WARN_ON(dev, !ktime_compare(*vblank_time, cur_time)))
 		return false; /* Already expired */
 
+	framedur_ns = vblank->framedur_ns;
+
 	/*
-	 * To prevent races we roll the hrtimer forward before we do any
-	 * interrupt processing - this is how real hw works (the interrupt
-	 * is only generated after all the vblank registers are updated)
-	 * and what the vblank core expects. Therefore we need to always
-	 * correct the timestamp by one frame.
+	 * To prevent races we rolled the hrtimer forward before we did any
+	 * timeout processing - this is how real hw works (the interrupt is
+	 * only generated after all the vblank registers are updated) and what
+	 * the vblank core expects.
+	 *
+	 * Therefore we always need to correct the timestamp. The returned
+	 * time should be the time of the first active scanline after the
+	 * previous vblank. Hence subtract the active phase's duration from
+	 * the next expiration time.
 	 */
-	*vblank_time = ktime_sub(*vblank_time, vtimer->interval);
+	if (drm_WARN_ON(dev, !mode->crtc_vtotal))
+		return false;
+	activedur_ns = div_s64(framedur_ns * mode->crtc_vdisplay, mode->crtc_vtotal);
+	*vblank_time = ktime_sub_ns(*vblank_time, activedur_ns);
 
 	return true;
 }
-- 
2.54.0

