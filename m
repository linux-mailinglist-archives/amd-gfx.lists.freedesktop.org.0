Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGP8EJul+GnQxQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 04 May 2026 15:56:43 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C401A4BE270
	for <lists+amd-gfx@lfdr.de>; Mon, 04 May 2026 15:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5D510E6FF;
	Mon,  4 May 2026 13:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="tsOqlRBQ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DF410E70B
 for <amd-gfx@lists.freedesktop.org>; Mon,  4 May 2026 13:56:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6CE074E42BB8;
 Mon,  4 May 2026 13:56:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 428AF5FD5F;
 Mon,  4 May 2026 13:56:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6C28911AD2272; 
 Mon,  4 May 2026 15:56:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777902998; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=FcSx4j0cNkFl2TQUExQl8fdsrLKfolnMq5zIaHD6gBg=;
 b=tsOqlRBQ4IRW6oXoIwDlw614XwnJ1low5ESgvAEKBo7sYxMFT3nQ8l0TSmrfOlkKZcsQ4e
 kOwgwMZ0MELMdL4tWouRIASNg12SvpZPxWOe0WM7bFIYL9R1WnEoxWvwGcOY3xMX+X+ii3
 Rr1OqiMsrAdsmIBHuT9WdD1tjQfuSm+CgqHAh6IWlC9sv+Qd6e5J3FYNc4gp7284QVKx2i
 EPAzfYuItvnrb6PgYccEtJ6zQFMY5KIQVoaIsqAhhFXdGgzYWbWl5iBmPQqVtzR3W8EYox
 iPavPqGYibwvlNAfEgIxGG5RiojsTaJUP6JNFdOE8Tj2FmIGY6umbGK1sN4V0A==
Message-ID: <b1a09658-ff19-4331-a184-b1a5457b7f69@bootlin.com>
Date: Mon, 4 May 2026 15:55:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] backlight: add kernel-internal backlight API
To: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, Xaver Hugl <xaver.hugl@gmail.com>,
 amd-gfx@lists.freedesktop.org, David Herrmann <dh.herrmann@gmail.com>,
 Marta Lofstedt <marta.lofstedt@intel.com>
References: <20260424220953.167058-1-mario.limonciello@amd.com>
 <20260424220953.167058-2-mario.limonciello@amd.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260424220953.167058-2-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Queue-Id: C401A4BE270
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,lists.freedesktop.org,intel.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[louis.chauvet@bootlin.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:dri-devel@lists.freedesktop.org,m:harry.wentland@amd.com,m:xaver.hugl@gmail.com,m:dh.herrmann@gmail.com,m:marta.lofstedt@intel.com,m:xaverhugl@gmail.com,m:dhherrmann@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[louis.chauvet@bootlin.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email]



On 4/25/26 00:09, Mario Limonciello wrote:
> From: David Herrmann <dh.herrmann@gmail.com>
> 
> So far backlights have only been controlled via sysfs. However, sysfs is
> not a proper user-space API for runtime modifications, and never was
> intended to provide such. The DRM drivers are now prepared to provide
> such a backlight link so user-space can control backlight via DRM
> connector properties. This allows us to employ the same access-management
> we use for mode-setting.
> 
> This patch adds few kernel-internal backlight helpers so we can modify
> backlights from within DRM.
> 
> Signed-off-by: David Herrmann <dh.herrmann@gmail.com>
> 
> V2: Marta Lofstedt <marta.lofstedt@intel.com>
> - rebase
> - minor edit for checkpatch warning
> 
> Signed-off-by: Marta Lofstedt <marta.lofstedt@intel.com>
> 
> V3: Mario Limonciello <mario.limonciello@amd.com>
>   - rebase
>   - Use guard(mutex)
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/video/backlight/backlight.c | 60 +++++++++++++++++++++++++++++
>   include/linux/backlight.h           | 16 ++++++++
>   2 files changed, 76 insertions(+)
> 
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index ab87a5e3dbf70..c3673bee6d9cf 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -513,6 +513,66 @@ static int devm_backlight_device_match(struct device *dev, void *res,
>   	return *r == data;
>   }
>   
> +/**
> + * backlight_device_lookup - find a backlight device
> + * @name: sysname of the backlight device
> + *
> + * @return Reference to the backlight device, NULL if not found.
> + *
> + * This searches through all registered backlight devices for a device with the
> + * given device name. In case none is found, NULL is returned, otherwise a
> + * new reference to the backlight device is returned. You must drop this
> + * reference via backlight_device_unref() once done.
> + * Note that the devices might get unregistered at any time. You need to lock
> + * around this lookup and inside of your backlight-notifier if you need to know
> + * when a device gets unregistered.
> + *
> + * This function can be safely called from IRQ context.
> + */
> +struct backlight_device *backlight_device_lookup(const char *name)
> +{
> +	struct backlight_device *bd;
> +	const char *t;
> +
> +	guard(mutex)(&backlight_dev_list_mutex);
> +	list_for_each_entry(bd, &backlight_dev_list, entry) {
> +		t = dev_name(&bd->dev);
> +		if (t && !strcmp(t, name)) {
> +			backlight_device_ref(bd);
> +			return bd;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(backlight_device_lookup);
> 

Hello,

I think this function can be repalced with backlight_device_get_by_name.

> +/**
> + * backlight_set_brightness - set brightness on a backlight device
> + * @bd: backlight device to operate on
> + * @value: brightness value to set on the device
> + * @reason: backlight-change reason to use for notifications
> + *
> + * This is the in-kernel API equivalent of writing into the 'brightness' sysfs
> + * file. It calls into the underlying backlight driver to change the brightness
> + * value. The value is clamped according to device bounds.
> + * A uevent notification is sent with the reason set to @reason.
> + */
> +void backlight_set_brightness(struct backlight_device *bd, unsigned int value,
> +			      enum backlight_update_reason reason)
> +{
> +	guard(mutex)(&bd->ops_lock);
> +	if (bd->ops) {
> +		value = clamp(value, 0U,
> +			      (unsigned int)bd->props.max_brightness);

Why did you use a clamping here? I think it is better to return error 
instead.

> +		dev_dbg(&bd->dev, "set brightness to %u\n", value);
> +		bd->props.brightness = value;
> +		backlight_update_status(bd);
> +	}
> +	backlight_generate_event(bd, reason);
> +}
> +EXPORT_SYMBOL_GPL(backlight_set_brightness);
> 

I think this could be nice to update backlight_device_set_brightness to 
avoid code duplication:

int backlight_device_set_brightness(...) {
	return backlight_set_brightness(..., BACKLIGHT_UPDATE_SYSFS);
}

>   /**
>    * backlight_register_notifier - get notified of backlight (un)registration
>    * @nb: notifier block with the notifier to call on backlight (un)registration
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index d905173c7f73c..7e4fee65fddd9 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -429,6 +429,22 @@ static inline void backlight_notify_blank_all(struct device *display_dev,
>   { }
>   #endif
>   
> +struct backlight_device *backlight_device_lookup(const char *name);
> +void backlight_set_brightness(struct backlight_device *bd, unsigned int value,
> +			      enum backlight_update_reason reason);
> +
> +static inline void backlight_device_ref(struct backlight_device *bd)
> +{
> +	if (bd)
> +		get_device(&bd->dev);
> +}
> +
> +static inline void backlight_device_unref(struct backlight_device *bd)
> +{
> +	if (bd)
> +		put_device(&bd->dev);
> +}
> +
Most of the kernel use _put and _get functions, I think it could be nice 
to keep the same naming.

Thanks,
Louis Chauvet

>   #define to_backlight_device(obj) container_of(obj, struct backlight_device, dev)
>   
>   /**

