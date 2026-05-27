Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH4QMyD0FmquygcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 27 May 2026 15:39:44 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DE65E5274
	for <lists+amd-gfx@lfdr.de>; Wed, 27 May 2026 15:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D6610E81B;
	Wed, 27 May 2026 13:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZuOGIY27";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a0FY+x5j";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZuOGIY27";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a0FY+x5j";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDF410E80A
 for <amd-gfx@lists.freedesktop.org>; Wed, 27 May 2026 13:39:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C56916787A;
 Wed, 27 May 2026 13:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1779889167; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYQL44Q722k2hIk897RtDzxRSZ9J5NycjtA+xblyFt0=;
 b=ZuOGIY27+zd+IbOlRLULJ6va8B/GSdM2fFcGwN4Tf4hY1eq6hs0RJjb6i8CXiOsaPX06lX
 Bzlwy7SLQjyWgkgw4SQfkkoYTqSXUvHScWgXi/gqSE//O3ktHFKq0G9gwAYlRspU4KLM70
 z6iJvXv1cWQ3KjkUf1lnpLK2udlHuno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1779889167;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYQL44Q722k2hIk897RtDzxRSZ9J5NycjtA+xblyFt0=;
 b=a0FY+x5jILdC4cvF66CGmneNv3I3u6CqY112DaQKUgmky7v9KH3Ccbj7cFYnch7wwO2MZ+
 ZlL27qf9hKPdPqBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1779889167; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYQL44Q722k2hIk897RtDzxRSZ9J5NycjtA+xblyFt0=;
 b=ZuOGIY27+zd+IbOlRLULJ6va8B/GSdM2fFcGwN4Tf4hY1eq6hs0RJjb6i8CXiOsaPX06lX
 Bzlwy7SLQjyWgkgw4SQfkkoYTqSXUvHScWgXi/gqSE//O3ktHFKq0G9gwAYlRspU4KLM70
 z6iJvXv1cWQ3KjkUf1lnpLK2udlHuno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1779889167;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYQL44Q722k2hIk897RtDzxRSZ9J5NycjtA+xblyFt0=;
 b=a0FY+x5jILdC4cvF66CGmneNv3I3u6CqY112DaQKUgmky7v9KH3Ccbj7cFYnch7wwO2MZ+
 ZlL27qf9hKPdPqBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 641535A861;
 Wed, 27 May 2026 13:39:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wN8HFw/0FmrpMQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 27 May 2026 13:39:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, mdaenzer@redhat.com,
 pekka.paalanen@collabora.com, jadahl@gmail.com, contact@emersion.fr,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, mhklinux@outlook.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 9/9] drm/vkms: Set DRM_VBLANK_FLAG_SIMULATED
Date: Wed, 27 May 2026 15:32:50 +0200
Message-ID: <20260527133917.207150-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527133917.207150-1-tzimmermann@suse.de>
References: <20260527133917.207150-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -6.80
X-Spam-Flag: NO
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:simona@ffwll.ch,m:airlied@gmail.com,m:mdaenzer@redhat.com,m:pekka.paalanen@collabora.com,m:jadahl@gmail.com,m:contact@emersion.fr,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mhklinux@outlook.com,m:dri-devel@lists.freedesktop.org,m:wayland-devel@lists.freedesktop.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:spice-devel@lists.freedesktop.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com,collabora.com,emersion.fr,linux.intel.com,kernel.org,outlook.com];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,suse.de:email,suse.de:mid,suse.de:dkim]
X-Rspamd-Queue-Id: 81DE65E5274
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mark the vblank event on vkms as simulated, so that the WAIT_VBLANK
ioctl fails with an error. The ioctl should not be supported because
the output is not synchronized to a display refresh.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 5a640b531d88..c4cfa1e5ab01 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -192,8 +192,8 @@ int vkms_create(struct vkms_config *config)
 		goto out_devres;
 	}
 
-	ret = drm_vblank_init(&vkms_device->drm,
-			      vkms_config_get_num_crtcs(config));
+	ret = drmm_vblank_init(&vkms_device->drm, vkms_config_get_num_crtcs(config),
+			       DRM_VBLANK_FLAG_SIMULATED);
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
 		goto out_devres;
-- 
2.54.0

