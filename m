Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AMVFviUHWrOcQkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 16:19:36 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEEE620B5F
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 16:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972B11133E6;
	Mon,  1 Jun 2026 14:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PD3oWoSN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kFdkoam1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PD3oWoSN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kFdkoam1";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B7C1133E1
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2026 14:19:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 980416ABFE;
 Mon,  1 Jun 2026 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1780323567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AR3xA5zcPnacGPzvxoEEDF5FVLEWtEBpLQoIFPOUVm0=;
 b=PD3oWoSNEFtNGwyN6IK92t0ZsjjN9g2oael27TKdx7u5tfGP8HRAkTzVfpbASOH9Z/igMw
 MxrKATOQZIp8Yxc7fpHqkRZgbl95b83/RtuJwCcm2eDtcFPYX9RqTyf+B9r1pPIoqRrYuh
 JmgfaUYnQHgZUc0/p4cJnr7OLoPLYgs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1780323567;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AR3xA5zcPnacGPzvxoEEDF5FVLEWtEBpLQoIFPOUVm0=;
 b=kFdkoam1sKfsAFsgx00LfxAOCnAvYHR9u49Ao5gduVjcq1bOOIcwqtElvim2lEblQQ+8JH
 YEdXMQ6CP0+JJUDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1780323567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AR3xA5zcPnacGPzvxoEEDF5FVLEWtEBpLQoIFPOUVm0=;
 b=PD3oWoSNEFtNGwyN6IK92t0ZsjjN9g2oael27TKdx7u5tfGP8HRAkTzVfpbASOH9Z/igMw
 MxrKATOQZIp8Yxc7fpHqkRZgbl95b83/RtuJwCcm2eDtcFPYX9RqTyf+B9r1pPIoqRrYuh
 JmgfaUYnQHgZUc0/p4cJnr7OLoPLYgs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1780323567;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AR3xA5zcPnacGPzvxoEEDF5FVLEWtEBpLQoIFPOUVm0=;
 b=kFdkoam1sKfsAFsgx00LfxAOCnAvYHR9u49Ao5gduVjcq1bOOIcwqtElvim2lEblQQ+8JH
 YEdXMQ6CP0+JJUDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 423C5779A7;
 Mon,  1 Jun 2026 14:19:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kqG8Du+UHWpSdwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Jun 2026 14:19:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, michel.daenzer@mailbox.org, louis.chauvet@bootlin.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com, mhklkml@zohomail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/7] drm/vblank: timer: Fix timestamps and improve reliabilty
Date: Mon,  1 Jun 2026 16:08:28 +0200
Message-ID: <20260601141922.91498-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:simona@ffwll.ch,m:michel.daenzer@mailbox.org,m:louis.chauvet@bootlin.com,m:ville.syrjala@linux.intel.com,m:jani.nikula@intel.com,m:mhklkml@zohomail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:dri-devel@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[ffwll.ch,mailbox.org,bootlin.com,linux.intel.com,intel.com,zohomail.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 0BEEE620B5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It appears that the DRM's vblank timers have always been somewhat buggy
in their timestamp calculations. Fix the generic implementation and
improve reliability.

Patch 1 returns success/failure to the caller, as expected by DRM.

Patch 2 fixes the timestamp calculation to return the time of the first
visible scanline in the current vblank phase.

Patch 3 switches the hrtimer to absolute values since boot, so that it's
easier to work with and we can predict future timestamps reliably.

Patches 4 and 5 allow for estimating timestamps even with the timer
being disabled.

Patches 6 and 7 improve the retrieval of the next vblank timeout's
timestamp.

Tested under heavy CPU-load on bochs and virtio. No ersors or warnings
showed up.

There have been reports about vblank timeouts being handled so late,
that they trigger DRM's internal error checks. Maybe these fixes and
adjustments can help to further avoid hick ups from delayed vblank
timers.

Thomas Zimmermann (7):
  drm/vblank: timer: Return success status from get_vblank_timeout
  drm/vblank: timer: Fix timestamp calculation
  drm/vblank: timer: Use absolute timer since boot
  drm/vblank: timer: Reorganize get_vblank_timeout
  drm/vblank: timer: Estimate vblank timeout if timer is disabled
  drm/vblank: timer: Verify that expiry time is in the future
  drm/vblank: timer: Avoid reading the vblank time unnecessarily

 drivers/gpu/drm/drm_vblank.c        | 105 ++++++++++++++++++++--------
 drivers/gpu/drm/drm_vblank_helper.c |   4 +-
 include/drm/drm_vblank.h            |   2 +-
 3 files changed, 79 insertions(+), 32 deletions(-)


base-commit: 4f554688dffcacf48630c14f9fb77a9f60394c1c
-- 
2.54.0

