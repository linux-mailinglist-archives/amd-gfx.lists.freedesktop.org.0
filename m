Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B019255C1
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Jul 2024 10:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1634410E0E8;
	Wed,  3 Jul 2024 08:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="F54+j/EV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eueX/tUo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F54+j/EV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eueX/tUo";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995DF10E0E8;
 Wed,  3 Jul 2024 08:47:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 36D4D21B97;
 Wed,  3 Jul 2024 08:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719996428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T6LPjluvy4Yz+kj/Evbi4y5Uu1VH0X+xtPFjfSSd5x8=;
 b=F54+j/EVVd/xrnxY3ylQ5DmfMC4JK7405U1QyG1J+u4KbujjdxSbhl9cFQaghMUGQDUSLb
 NqIhFJXQqbh6SmRXiUO5Y4fssC71sjIkbU6prQIpjwoaREsvz/JGrX0qSrVVClnD+VcSAv
 pNaLFeg94eN+d1z5id2jeqhCaMKjS2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719996428;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T6LPjluvy4Yz+kj/Evbi4y5Uu1VH0X+xtPFjfSSd5x8=;
 b=eueX/tUoTiGCXg5oW2cEJiczSehbrwOEbYB9sLIkrL+TDHkAXSi3TxYc1m7m1rDnKjFlN7
 5GErsA3eHWmDdZCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="F54+j/EV";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="eueX/tUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719996428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T6LPjluvy4Yz+kj/Evbi4y5Uu1VH0X+xtPFjfSSd5x8=;
 b=F54+j/EVVd/xrnxY3ylQ5DmfMC4JK7405U1QyG1J+u4KbujjdxSbhl9cFQaghMUGQDUSLb
 NqIhFJXQqbh6SmRXiUO5Y4fssC71sjIkbU6prQIpjwoaREsvz/JGrX0qSrVVClnD+VcSAv
 pNaLFeg94eN+d1z5id2jeqhCaMKjS2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719996428;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T6LPjluvy4Yz+kj/Evbi4y5Uu1VH0X+xtPFjfSSd5x8=;
 b=eueX/tUoTiGCXg5oW2cEJiczSehbrwOEbYB9sLIkrL+TDHkAXSi3TxYc1m7m1rDnKjFlN7
 5GErsA3eHWmDdZCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC7B913889;
 Wed,  3 Jul 2024 08:47:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bhSlNAsQhWY1SQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Jul 2024 08:47:07 +0000
Message-ID: <3ecb6fb4-ff60-4c49-8199-b76b4f297ecf@suse.de>
Date: Wed, 3 Jul 2024 10:47:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/radeon: change drm_dev_alloc to
 devm_drm_dev_alloc
To: Wu Hoi Pok <wuhoipok@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240630165949.117634-1-wuhoipok@gmail.com>
 <20240630165949.117634-7-wuhoipok@gmail.com>
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
In-Reply-To: <20240630165949.117634-7-wuhoipok@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[gmail.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:dkim,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 36D4D21B97
X-Spam-Flag: NO
X-Spam-Score: -4.50
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



Am 30.06.24 um 18:59 schrieb Wu Hoi Pok:
> "drm_dev_alloc" is deprecated, in order to use the newer "devm_drm_dev_alloc",
> the "drm_device" is stored inside "radeon_device", by changing "rdev_to_drm(rdev)"
> other functions still gain access to the member "drm_device". Also, "devm_drm_dev_alloc"
> is now allocating "radeon_device", allocation inside "radeon_driver_load_kms" has to be
> removed.
>
> In "radeon_device_init", it originally assigned "rdev->dev" etc. However it is already
> done right after "devm_drm_dev_alloc" as you can see down below. It is better remove them.
>
> Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Thomas Zimmermann <tzimmermann@suse.de>


> ---
>   drivers/gpu/drm/radeon/radeon.h        |  4 ++--
>   drivers/gpu/drm/radeon/radeon_device.c |  3 ---
>   drivers/gpu/drm/radeon/radeon_drv.c    | 12 +++++++++---
>   drivers/gpu/drm/radeon/radeon_kms.c    |  8 +-------
>   4 files changed, 12 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index ae35c102a487..fd8a4513025f 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -2297,7 +2297,7 @@ typedef void (*radeon_wreg_t)(struct radeon_device*, uint32_t, uint32_t);
>   
>   struct radeon_device {
>   	struct device			*dev;
> -	struct drm_device		*ddev;
> +	struct drm_device		ddev;
>   	struct pci_dev			*pdev;
>   #ifdef __alpha__
>   	struct pci_controller		*hose;
> @@ -2478,7 +2478,7 @@ void cik_mm_wdoorbell(struct radeon_device *rdev, u32 index, u32 v);
>   
>   static inline struct drm_device *rdev_to_drm(struct radeon_device *rdev)
>   {
> -	return rdev->ddev;
> +	return &rdev->ddev;
>   }
>   
>   /*
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index 32851632643d..554b236c2328 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1285,9 +1285,6 @@ int radeon_device_init(struct radeon_device *rdev,
>   	bool runtime = false;
>   
>   	rdev->shutdown = false;
> -	rdev->dev = &pdev->dev;
> -	rdev->ddev = ddev;
> -	rdev->pdev = pdev;
>   	rdev->flags = flags;
>   	rdev->family = flags & RADEON_FAMILY_MASK;
>   	rdev->is_atom_bios = false;
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index 7b8aa8406751..f36aa71c57c7 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -260,6 +260,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
>   {
>   	unsigned long flags = 0;
>   	struct drm_device *ddev;
> +	struct radeon_device *rdev;
>   	int ret;
>   
>   	if (!ent)
> @@ -300,9 +301,14 @@ static int radeon_pci_probe(struct pci_dev *pdev,
>   	if (ret)
>   		return ret;
>   
> -	ddev = drm_dev_alloc(&kms_driver, &pdev->dev);
> -	if (IS_ERR(ddev))
> -		return PTR_ERR(ddev);
> +	rdev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*rdev), ddev);
> +	if (IS_ERR(rdev))
> +		return PTR_ERR(rdev);
> +
> +	rdev->dev = &pdev->dev;
> +	rdev->pdev = pdev;
> +	ddev = rdev_to_drm(rdev);
> +	ddev->dev_private = rdev;
>   
>   	ret = pci_enable_device(pdev);
>   	if (ret)
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
> index a16590c6247f..645e33bf7947 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -104,15 +104,9 @@ void radeon_driver_unload_kms(struct drm_device *dev)
>   int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
>   {
>   	struct pci_dev *pdev = to_pci_dev(dev->dev);
> -	struct radeon_device *rdev;
> +	struct radeon_device *rdev = dev->dev_private;
>   	int r, acpi_status;
>   
> -	rdev = kzalloc(sizeof(struct radeon_device), GFP_KERNEL);
> -	if (rdev == NULL) {
> -		return -ENOMEM;
> -	}
> -	dev->dev_private = (void *)rdev;
> -
>   #ifdef __alpha__
>   	rdev->hose = pdev->sysdata;
>   #endif

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

