Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A1C9255E6
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Jul 2024 10:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC8410E128;
	Wed,  3 Jul 2024 08:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="13XjcBnq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6WN91WI7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="13XjcBnq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6WN91WI7";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7D510E17F;
 Wed,  3 Jul 2024 08:52:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 121121FC9E;
 Wed,  3 Jul 2024 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719996763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vL2mwRISun4ZAo3P75oUig4aPMONa2S3X9TsSq90GtI=;
 b=13XjcBnqLAWkgkt49/Om3DGVVmX0DPZpO6UpVVUJ96IKSuX32zhBiQsa0bkMPmebQcCywC
 HY6qnHT3lBsrTdKJgfo6d+QP9guhc4P9eyN5VOGs+PPBxbZy9cxgYHuTcQOmU/wpkB5MMW
 LajIz3UPkhK+dAMDHmo3A+3ykxPit8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719996763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vL2mwRISun4ZAo3P75oUig4aPMONa2S3X9TsSq90GtI=;
 b=6WN91WI7pHZjGruwSpxqySZyNSLws3lkAgvnC399YKBlYqEurqZ/rGBYAQeIODKCzV81e/
 UnWj7+CwpobuH1DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719996763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vL2mwRISun4ZAo3P75oUig4aPMONa2S3X9TsSq90GtI=;
 b=13XjcBnqLAWkgkt49/Om3DGVVmX0DPZpO6UpVVUJ96IKSuX32zhBiQsa0bkMPmebQcCywC
 HY6qnHT3lBsrTdKJgfo6d+QP9guhc4P9eyN5VOGs+PPBxbZy9cxgYHuTcQOmU/wpkB5MMW
 LajIz3UPkhK+dAMDHmo3A+3ykxPit8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719996763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vL2mwRISun4ZAo3P75oUig4aPMONa2S3X9TsSq90GtI=;
 b=6WN91WI7pHZjGruwSpxqySZyNSLws3lkAgvnC399YKBlYqEurqZ/rGBYAQeIODKCzV81e/
 UnWj7+CwpobuH1DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C86E913889;
 Wed,  3 Jul 2024 08:52:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +aFAL1oRhWb9SgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Jul 2024 08:52:42 +0000
Message-ID: <748e1bd6-6c40-443d-acbc-3d379229d068@suse.de>
Date: Wed, 3 Jul 2024 10:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] drm/radeon: remove load callback & drm_dev_alloc
To: Wu Hoi Pok <wuhoipok@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240630165949.117634-1-wuhoipok@gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20240630165949.117634-1-wuhoipok@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.29
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

Hi

Am 30.06.24 um 18:59 schrieb Wu Hoi Pok:
> .load and drm_dev_alloc are deprecated. These patch series aims to
> remove them.
>
> v3: Both v1 and v2 sucks. v3 improves greatly on readability.

Very nice, thank you. I tested the patches with Radeon hardware and did 
not find issues. AFAICT this can be merged as-is. I think it should go 
into the amd trees. Maybe Alex or Christian can pick it up.

Thanks for sticking with it.

Best regards
Thomas

>
> Wu Hoi Pok (6):
>    drm/radeon: change variable name "dev" to "ddev" for consistency
>    drm/radeon: remove load callback from kms_driver
>    drm/radeon: use variable flags as parameter
>    drm/radeon: add helper rdev_to_drm(rdev)
>    drm/radeon: change rdev->ddev to rdev_to_drm(rdev)
>    drm/radeon: change drm_dev_alloc to devm_drm_dev_alloc
>
>   drivers/gpu/drm/radeon/atombios_encoders.c |  2 +-
>   drivers/gpu/drm/radeon/cik.c               | 14 ++--
>   drivers/gpu/drm/radeon/dce6_afmt.c         |  2 +-
>   drivers/gpu/drm/radeon/evergreen.c         | 12 ++--
>   drivers/gpu/drm/radeon/ni.c                |  2 +-
>   drivers/gpu/drm/radeon/r100.c              | 24 +++----
>   drivers/gpu/drm/radeon/r300.c              |  6 +-
>   drivers/gpu/drm/radeon/r420.c              |  6 +-
>   drivers/gpu/drm/radeon/r520.c              |  2 +-
>   drivers/gpu/drm/radeon/r600.c              | 12 ++--
>   drivers/gpu/drm/radeon/r600_cs.c           |  2 +-
>   drivers/gpu/drm/radeon/r600_dpm.c          |  4 +-
>   drivers/gpu/drm/radeon/r600_hdmi.c         |  2 +-
>   drivers/gpu/drm/radeon/radeon.h            |  7 +-
>   drivers/gpu/drm/radeon/radeon_acpi.c       | 10 +--
>   drivers/gpu/drm/radeon/radeon_agp.c        |  2 +-
>   drivers/gpu/drm/radeon/radeon_atombios.c   |  2 +-
>   drivers/gpu/drm/radeon/radeon_audio.c      |  4 +-
>   drivers/gpu/drm/radeon/radeon_combios.c    | 12 ++--
>   drivers/gpu/drm/radeon/radeon_device.c     | 13 ++--
>   drivers/gpu/drm/radeon/radeon_display.c    | 74 +++++++++++-----------
>   drivers/gpu/drm/radeon/radeon_drv.c        | 27 +++++---
>   drivers/gpu/drm/radeon/radeon_fbdev.c      | 26 ++++----
>   drivers/gpu/drm/radeon/radeon_fence.c      |  8 +--
>   drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
>   drivers/gpu/drm/radeon/radeon_i2c.c        |  2 +-
>   drivers/gpu/drm/radeon/radeon_ib.c         |  2 +-
>   drivers/gpu/drm/radeon/radeon_irq_kms.c    | 12 ++--
>   drivers/gpu/drm/radeon/radeon_kms.c        |  8 +--
>   drivers/gpu/drm/radeon/radeon_object.c     |  2 +-
>   drivers/gpu/drm/radeon/radeon_pm.c         | 20 +++---
>   drivers/gpu/drm/radeon/radeon_ring.c       |  2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c        |  6 +-
>   drivers/gpu/drm/radeon/rs400.c             |  6 +-
>   drivers/gpu/drm/radeon/rs600.c             | 14 ++--
>   drivers/gpu/drm/radeon/rs690.c             |  2 +-
>   drivers/gpu/drm/radeon/rv515.c             |  4 +-
>   drivers/gpu/drm/radeon/rv770.c             |  2 +-
>   drivers/gpu/drm/radeon/si.c                |  4 +-
>   39 files changed, 184 insertions(+), 179 deletions(-)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

