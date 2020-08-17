Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E4D245D5F
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Aug 2020 09:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28346E480;
	Mon, 17 Aug 2020 07:08:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5866E10A
 for <amd-gfx@lists.freedesktop.org>; Sun, 16 Aug 2020 08:49:51 +0000 (UTC)
Received: from monopod.intra.ispras.ru (unknown [10.10.3.121])
 by mail.ispras.ru (Postfix) with ESMTPS id 36C9440A207A;
 Sun, 16 Aug 2020 08:49:49 +0000 (UTC)
Date: Sun, 16 Aug 2020 11:49:49 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/amd/display: use correct scale for
 actual_brightness
In-Reply-To: <20200804201313.6464-1-amonakov@ispras.ru>
Message-ID: <alpine.LNX.2.20.13.2008161149010.7727@monopod.intra.ispras.ru>
References: <20200804201313.6464-1-amonakov@ispras.ru>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:08:07 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ping.

On Tue, 4 Aug 2020, Alexander Monakov wrote:

> Documentation for sysfs backlight level interface requires that
> values in both 'brightness' and 'actual_brightness' files are
> interpreted to be in range from 0 to the value given in the
> 'max_brightness' file.
> 
> With amdgpu, max_brightness gives 255, and values written by the user
> into 'brightness' are internally rescaled to a wider range. However,
> reading from 'actual_brightness' gives the raw register value without
> inverse rescaling. This causes issues for various userspace tools such
> as PowerTop and systemd that expect the value to be in the correct
> range.
> 
> Introduce a helper to retrieve internal backlight range. Use it to
> reimplement 'convert_brightness' as 'convert_brightness_from_user' and
> introduce 'convert_brightness_to_user'.
> 
> Bug: https://bugzilla.kernel.org/show_bug.cgi?id=203905
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1242
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Signed-off-by: Alexander Monakov <amonakov@ispras.ru>
> ---
> v2: split convert_brightness to &_from_user and &_to_user (Nicholas)
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 81 +++++++++----------
>  1 file changed, 40 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 710edc70e37e..b60a763f3f95 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2881,51 +2881,50 @@ static int set_backlight_via_aux(struct dc_link *link, uint32_t brightness)
>  	return rc ? 0 : 1;
>  }
>  
> -static u32 convert_brightness(const struct amdgpu_dm_backlight_caps *caps,
> -			      const uint32_t user_brightness)
> +static int get_brightness_range(const struct amdgpu_dm_backlight_caps *caps,
> +				unsigned *min, unsigned *max)
>  {
> -	u32 min, max, conversion_pace;
> -	u32 brightness = user_brightness;
> -
>  	if (!caps)
> -		goto out;
> +		return 0;
>  
> -	if (!caps->aux_support) {
> -		max = caps->max_input_signal;
> -		min = caps->min_input_signal;
> -		/*
> -		 * The brightness input is in the range 0-255
> -		 * It needs to be rescaled to be between the
> -		 * requested min and max input signal
> -		 * It also needs to be scaled up by 0x101 to
> -		 * match the DC interface which has a range of
> -		 * 0 to 0xffff
> -		 */
> -		conversion_pace = 0x101;
> -		brightness =
> -			user_brightness
> -			* conversion_pace
> -			* (max - min)
> -			/ AMDGPU_MAX_BL_LEVEL
> -			+ min * conversion_pace;
> +	if (caps->aux_support) {
> +		// Firmware limits are in nits, DC API wants millinits.
> +		*max = 1000 * caps->aux_max_input_signal;
> +		*min = 1000 * caps->aux_min_input_signal;
>  	} else {
> -		/* TODO
> -		 * We are doing a linear interpolation here, which is OK but
> -		 * does not provide the optimal result. We probably want
> -		 * something close to the Perceptual Quantizer (PQ) curve.
> -		 */
> -		max = caps->aux_max_input_signal;
> -		min = caps->aux_min_input_signal;
> -
> -		brightness = (AMDGPU_MAX_BL_LEVEL - user_brightness) * min
> -			       + user_brightness * max;
> -		// Multiple the value by 1000 since we use millinits
> -		brightness *= 1000;
> -		brightness = DIV_ROUND_CLOSEST(brightness, AMDGPU_MAX_BL_LEVEL);
> +		// Firmware limits are 8-bit, PWM control is 16-bit.
> +		*max = 0x101 * caps->max_input_signal;
> +		*min = 0x101 * caps->min_input_signal;
>  	}
> +	return 1;
> +}
>  
> -out:
> -	return brightness;
> +static u32 convert_brightness_from_user(const struct amdgpu_dm_backlight_caps *caps,
> +					uint32_t brightness)
> +{
> +	unsigned min, max;
> +
> +	if (!get_brightness_range(caps, &min, &max))
> +		return brightness;
> +
> +	// Rescale 0..255 to min..max
> +	return min + DIV_ROUND_CLOSEST((max - min) * brightness,
> +				       AMDGPU_MAX_BL_LEVEL);
> +}
> +
> +static u32 convert_brightness_to_user(const struct amdgpu_dm_backlight_caps *caps,
> +				      uint32_t brightness)
> +{
> +	unsigned min, max;
> +
> +	if (!get_brightness_range(caps, &min, &max))
> +		return brightness;
> +
> +	if (brightness < min)
> +		return 0;
> +	// Rescale min..max to 0..255
> +	return DIV_ROUND_CLOSEST(AMDGPU_MAX_BL_LEVEL * (brightness - min),
> +				 max - min);
>  }
>  
>  static int amdgpu_dm_backlight_update_status(struct backlight_device *bd)
> @@ -2941,7 +2940,7 @@ static int amdgpu_dm_backlight_update_status(struct backlight_device *bd)
>  
>  	link = (struct dc_link *)dm->backlight_link;
>  
> -	brightness = convert_brightness(&caps, bd->props.brightness);
> +	brightness = convert_brightness_from_user(&caps, bd->props.brightness);
>  	// Change brightness based on AUX property
>  	if (caps.aux_support)
>  		return set_backlight_via_aux(link, brightness);
> @@ -2958,7 +2957,7 @@ static int amdgpu_dm_backlight_get_brightness(struct backlight_device *bd)
>  
>  	if (ret == DC_ERROR_UNEXPECTED)
>  		return bd->props.brightness;
> -	return ret;
> +	return convert_brightness_to_user(&dm->backlight_caps, ret);
>  }
>  
>  static const struct backlight_ops amdgpu_dm_backlight_ops = {
> 
> base-commit: bcf876870b95592b52519ed4aafcf9d95999bc9c
> 
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
