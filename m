Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SUF1HKCJKmrqrwMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 12:10:40 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7520670B65
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 12:10:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b="fWqqg/qE";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688AB10EDDA;
	Thu, 11 Jun 2026 10:10:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E95110EDE5
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 10:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781172636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rQRyqUjYEtr0y/u9/sXosv9fI09dOaWuwDl+f7MSICU=;
 b=fWqqg/qEEOeBhLTiXQh5WxsmVoRKTGr1GVdI4gJB/RA9tyWt61Ta7r5+D5i885hdF+V7hr
 b/+HE/ZO+JeZQG2lviWKUE/MbIKl66dSoE1DSNNFfYGYdYwL5xSyeSzlkRfNcD7R6XQ/NB
 RjtD+vlnBM15QU09C0/DzgBpVCzYt54=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-RddXGPrHMQyU-GUl0YN7lw-1; Thu, 11 Jun 2026 06:10:35 -0400
X-MC-Unique: RddXGPrHMQyU-GUl0YN7lw-1
X-Mimecast-MFC-AGG-ID: RddXGPrHMQyU-GUl0YN7lw_1781172634
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-490dad70f95so22702465e9.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 03:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781172634; x=1781777434;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rQRyqUjYEtr0y/u9/sXosv9fI09dOaWuwDl+f7MSICU=;
 b=J768uEY90jI0FJuEjaBH8skYhenMki/9Dq+75lPNQ7+ts//DFc1ZNgcD7bsfRCjoMv
 8I/UlVnXS5CuO24nPqZ8KCEapxEh0lg245PBUSlnoupl8QQAby7vMGJfiGxHOpxWVfUb
 u6AuExnW8U47TF6GnX2uo+lMK4rUwxAGPeHH6QjLIJq/Py9b9LNjeUNVgWtALpiEsd6z
 xPszNbdYiAJKt6HdLv9NdKmlnYymO1f+Jw/zly4qPKTzQqbhKGd9UHuFTZ4NVhReCncS
 sswp/4a97zgRWP9cQOPUN97XXSYu/zRb03Zs61alr94encQukeYJYcnmc9e7q5yaLI3K
 m+3A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+VZqnzPozeFijM2tnwrvtWAOTWMk6mNSWbgTI0s8zg4XPd7XSBD/aS3D/ypZb5mbYxyWOdvrDZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIc/4QLSX9VGJ+/XoN2l6VMEeEl6ZR72cdrdEX/pNoSdjdzZkg
 z2Mc7mBkybcBppbTdiA3awUbiFokg3QS4kcaa6Nhe0U2ykeRIupORP2cJQfBUmtvBUHyHWUSQb9
 m4KgrM7JBtgu8eVAMKKgWgUi0ioaP9veqXug54XnjTz8Dc9H5xWNIqQGAYvhauD3O/d8=
X-Gm-Gg: Acq92OEDk8zbzvKDYhBntF1A0Yif1jtein0r+DrFo2MEaw/NYGX3UiDpDMuMCeUlx3W
 Vb0CmZycS2KSpUPPfKt2FV6zBo0nzhQ008jTVRG5DL7WG93qhKMezGJhQByM894c05PpnJewvBs
 abCxAI5OHDUBV7t2/5AAj+PvXVkJZXLekELRcAJ6JPPksDIkNzMixJNKw+LaF2xzGoQP4tKWJ3/
 hksAp5xpu67O3AiZUMnkAm0U1RaFz4idGkeysKh0sE0PDDaCtI6HcNfVeUoH5Z2tzoLUcF19/XK
 9N5p4Ofp4nQKxhK4VKEAFfEN2WtuaO7xz8P5yUmhY4HbQSxOiKrOgZjKNywBk6Fugo5Jm1ofVNw
 Ge4aahW93yLatYn9uOfwO7GdRKJUKDZmIEByL5Dz2goNDe3GUau/pOytJmz/YkvGBH8FcJw32TO
 i0BlVclzmqHy3YYLg=
X-Received: by 2002:a05:600c:4685:b0:490:e1e6:8988 with SMTP id
 5b1f17b1804b1-490e55dc1damr31237575e9.7.1781172633839; 
 Thu, 11 Jun 2026 03:10:33 -0700 (PDT)
X-Received: by 2002:a05:600c:4685:b0:490:e1e6:8988 with SMTP id
 5b1f17b1804b1-490e55dc1damr31236645e9.7.1781172633469; 
 Thu, 11 Jun 2026 03:10:33 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e52ac9aasm38076025e9.4.2026.06.11.03.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 03:10:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklkml@zohomail.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zackr@vmware.com>, stable@vger.kernel.org
Subject: Re: [PATCH v5 01/15] drm/amd/display: Handle struct
 drm_plane_state.ignore_damage_clips
In-Reply-To: <20260610152505.260172-2-tzimmermann@suse.de>
References: <20260610152505.260172-1-tzimmermann@suse.de>
 <20260610152505.260172-2-tzimmermann@suse.de>
Date: Thu, 11 Jun 2026 12:10:31 +0200
Message-ID: <87y0gl5qw8.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yWuErkUNmaN_yIG_Sh5bt6jU2MDneVkdarawhixju4k_1781172634
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:airlied@redhat.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:admin@kodeit.net,m:gargaditya08@proton.me,m:paul@crapouillou.net,m:jani.nikula@linux.intel.com,m:mhklkml@zohomail.com,m:zack.rusin@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-hyperv@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:virtualization@lists.linux.dev,m:zackr@vmware.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,kernel.org,linux.intel.com,redhat.com,gmail.com,ffwll.ch,kodeit.net,proton.me,crapouillou.net,zohomail.com,broadcom.com,amd.com,igalia.com,intel.com,ursulin.net,collabora.com,chromium.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_SENDER(0.00)[javierm@redhat.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ocarina.mail-host-address-is-not-set:mid,suse.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7520670B65

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> The mode-setting pipeline can disabled damage clippings for a commit
> by setting ignore_damage_clips in struct drm_plane_state. The commit
> will then do a full display update.
>
> Test the flag in DCN code and do a full update in DCN code if it has
> been set.
>
> Commit 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers
> to ignore damage clips") introduced ignore_damage_clips to selectively
> ignore damage clipping in certain framebuffer changes. This driver does
> not do that, but DRM's damage iterator will soon rely on the flag.
> Therefore supporting it here as well make sense for consistency.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")

I don't think that a Fixes tag is correct here? Your patch series
is changing the 'struct drm_plane_state.ignore_damage_clips' and
the changes make sense, but definitely isn't a fix in my opinion.

Having said that, the change look good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

