Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AASOBJNAtGlljgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:31 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00C9287806
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55AB210ECC4;
	Fri, 13 Mar 2026 16:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MdycYuDm";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5C210EC13
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:19 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-463a0e14abfso1412722b6e.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408259; x=1774013059; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vB+cc01KMDy+1bX+9nVaruepBX97i9TSrBfN/R0HMBE=;
 b=MdycYuDmncXDn72uVtohze40ooYOKurGUI/qdNe/ZB4SqtcJ6UOZ1evgz6TjfxEn7M
 TzEcPj0dcDuAtgIhUp2CPCRdZyUkwzbsKJ+gz6WNobXgGxSYGb3ap3CBx5TiDxFIrh04
 ZwUruwihvmdFrf5pAjRYL7T7GD4/I7J7Zrz318HclYkOFWgLJYBED5dSqBgWMfGocq26
 yDg5XU++iXE+KqoIy50za8+xt53xn+CaJM9bjXY+/urLvx6KKq+x3YWAJZfLhsRhBzRU
 mcIbHZDu9vdVPAB0ZFbaRwrx6BPvAO4jZIw3lsKo4kfmunlG6BOHx+D8vz0GwDsu2wCJ
 uVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408259; x=1774013059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vB+cc01KMDy+1bX+9nVaruepBX97i9TSrBfN/R0HMBE=;
 b=i1wrztgERP7hQh0G0JmrNmZEsty0i1eMThBPP9UZrRqYPhvs2lyQkDpPxzrwf2z4wY
 XlDGXtXtmrfYwIDR0h+JcxXehfXTD6HxU+PPbiWTaU1KJlQbHbVU+6PlookwyUL8Qdn0
 /9N+NE82/Ut2XRzfc49m+6GynHGJAgHUwnJcGZNC4J+k36R2VRc7PaFLwnWHJ+tfTm2N
 UPxZRnmQo6eijfUVLqymZ89iXTk3Zfl9/ygPjrSSItfsXxXdED51cgdvstWsb7zamwhJ
 ZtyITa+sSG8HGBKCo11EbcxmJZnxVdGLL/bFg7Hex2Z4y3HB9AVQhNTmfdCOPidCvSrA
 QLWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPjs/PAZAUoXRYSXY0q5FlGJK3CCALmplWuoGYSv78O1XI+dJ+0To/0vNJazOXOB6Thwz+rTtc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS/cdqIcBtXluCjUq4NxgJ/gA/9HmotBvPOfCROO8qgOzPerMz
 GbMW2O8hMZcqLukLYtT6QM1SmDNWrZ9EhEZCA1BGnN12Ncx5n+SWohn2
X-Gm-Gg: ATEYQzyJStUSXyvlUuxp0q2kcJNhWYAZgGE3f9NcmWcRrs+4bbnZhqTk+fyh3mPZsnD
 kPyCNqv5McQqqs1b6J7KNgtLoWF7bsN2f0yMTA7+mSfS8kH6CgX85XfiyBC7IEErzJURK+bVmqa
 a1/xz4uVd6QaTf7iEskeisR7fAeO+nTeZcDMpgBIYsYKJALcX4bPLAGqFXgzzQ4OrivhXGHUXms
 PYYyqdpqpKiQzIa5VhvBgtRB0K/akz9akOFz6evqRjSBrxMEj0FpTe8z5iMkenV/qpiDXh/t/En
 8CH47q/jpENLnkEXvDpFlKpYV9e7cfSWEIw6qCXjmvbQ+ZwIyqocvL69PP6q31olSM3JoCrg7P0
 /cLJM2BF8rQ4yqGDH1C0KlJkpm8gfsEzDCWdjCZijGtZ9ylH86rVf1ruBWvxG0WipwNOQGoT3kS
 IwanhSkI4r7v/kGPIkHaBrTL681Jm9yrF3lYG8fy+CkS8oO524
X-Received: by 2002:a05:6808:158e:b0:45e:e07d:85af with SMTP id
 5614622812f47-467570a2be8mr1585147b6e.2.1773408258671; 
 Fri, 13 Mar 2026 06:24:18 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 38/65] drm-print: fix config-dependent unused variable
Date: Fri, 13 Mar 2026 07:20:03 -0600
Message-ID: <20260313132103.2529746-39-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313132103.2529746-1-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Mar 2026 16:51:10 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jim.cromie@gmail.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:louis.chauvet@bootlin.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:intel-gfx@lists.freedesktop.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,akamai.com,linuxfoundation.org,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,linux.intel.com,amd.com,bootlin.com,linuxfoundation.org,suse.com,chromium.org,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: A00C9287806
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With CONFIG_DRM_USE_DYNAMIC_DEBUG=y, __drm_printfn_dbg() gets an
unused variable warning/error on 'category', even though the usage
follows immediately, in drm_debug_enabled(category).

For static-key optimized dyndbg, the macro doesn't actually check the
category var, since the static-key patches in the proper state.  The
compiler evidently sees this lack of reference and complains.

So this drops the local var and refs the field directly in the
macro-call, which avoids the warning/error.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 93dd714d4533..ceede094ff13 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -213,9 +213,8 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 
-	if (!__drm_debug_enabled(category))
+	if (!__drm_debug_enabled(p->category))
 		return;
 
 	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);
-- 
2.53.0

