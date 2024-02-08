Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19B384DD6A
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Feb 2024 10:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C249610E53E;
	Thu,  8 Feb 2024 09:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jrMazt4N";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B97210E53E;
 Thu,  8 Feb 2024 09:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707386240; x=1738922240;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HRn9JBFXL0AcaL15UpPEuHqSF/Q9gIFidqcgHAOPWQc=;
 b=jrMazt4N+kKTER3Bns87XllX2QqQIbLqT2NUFK2fq3lVLTPAUUkbbOOf
 2OVec4DqM1jSOlNEF/sVg6YDXtCSCVdMtxYka2KidxxMCdr3k42v8eT0f
 SS98jpIR+srCHEsFbTozf+NPpC+mQzOm7TpmI8Wy/VW4Nl/7lfMRj5gH6
 ylK0cSu+KmAoChiNLB8nh/NbD0wvM2eUttN769EGw7IUZxZvL7a8SfYFn
 trUD+8HplCO2S7Utk8sTko9mpy3w5lprt9WBaSVrP7Y5RZT7wBj0GMThU
 dWt8whvAzx0u89DIpoTq6rypGVLS9akxENi4zAEaRHdlIMcgMf67NpP+x g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1068840"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1068840"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 01:57:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; d="scan'208";a="24858667"
Received: from aavzirov-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.13])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 01:57:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
Cc: "open list:ACPI" <linux-acpi@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v4 1/3] drm: Add drm_get_acpi_edid() helper
In-Reply-To: <20240207224429.104625-2-mario.limonciello@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240207224429.104625-1-mario.limonciello@amd.com>
 <20240207224429.104625-2-mario.limonciello@amd.com>
Date: Thu, 08 Feb 2024 11:57:11 +0200
Message-ID: <87y1bvb7ns.fsf@intel.com>
MIME-Version: 1.0
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

On Wed, 07 Feb 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
> Some manufacturers have intentionally put an EDID that differs from
> the EDID on the internal panel on laptops.  Drivers can call this
> helper to attempt to fetch the EDID from the BIOS's ACPI _DDC method.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/Kconfig    |  5 +++
>  drivers/gpu/drm/drm_edid.c | 77 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_edid.h     |  1 +
>  3 files changed, 83 insertions(+)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 6ec33d36f3a4..ec2bb71e8b36 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -21,6 +21,11 @@ menuconfig DRM
>  	select KCMP
>  	select VIDEO_CMDLINE
>  	select VIDEO_NOMODESET
> +	select ACPI_VIDEO if ACPI
> +	select BACKLIGHT_CLASS_DEVICE if ACPI
> +	select INPUT if ACPI
> +	select X86_PLATFORM_DEVICES if ACPI && X86
> +	select ACPI_WMI if ACPI && X86

I think I'll defer to drm maintainers on whether this is okay or
something to be avoided.


>  	help
>  	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
>  	  introduced in XFree86 4.0. If you say Y here, you need to select
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 923c4423151c..c649b4f9fd8e 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -28,6 +28,7 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <acpi/video.h>
>  #include <linux/bitfield.h>
>  #include <linux/cec.h>
>  #include <linux/hdmi.h>
> @@ -2188,6 +2189,49 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
>  	return ret == xfers ? 0 : -1;
>  }
>  
> +/**
> + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
> + * @data: struct drm_device
> + * @buf: EDID data buffer to be filled
> + * @block: 128 byte EDID block to start fetching from
> + * @len: EDID data buffer length to fetch
> + *
> + * Try to fetch EDID information by calling acpi_video_get_edid() function.
> + *
> + * Return: 0 on success or error code on failure.
> + */
> +static int
> +drm_do_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
> +{
> +	struct drm_device *ddev = data;
> +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
> +	unsigned char start = block * EDID_LENGTH;
> +	void *edid;
> +	int r;
> +
> +	if (!acpidev)
> +		return -ENODEV;
> +
> +	/* fetch the entire edid from BIOS */
> +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
> +	if (r < 0) {
> +		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
> +		return -EINVAL;
> +	}
> +	if (len > r || start > r || start + len > r) {
> +		r = -EINVAL;
> +		goto cleanup;
> +	}
> +
> +	memcpy(buf, edid + start, len);
> +	r = 0;
> +
> +cleanup:
> +	kfree(edid);
> +
> +	return r;
> +}
> +
>  static void connector_bad_edid(struct drm_connector *connector,
>  			       const struct edid *edid, int num_blocks)
>  {
> @@ -2643,6 +2687,39 @@ struct edid *drm_get_edid(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_get_edid);
>  
> +/**
> + * drm_get_acpi_edid - get EDID data, if available

I'd prefer all the new EDID API to be named drm_edid_*. Makes a clean
break from the old API, and is more consistent.

So perhaps drm_edid_read_acpi() to be in line with all the other struct
drm_edid based EDID reading functions.

> + * @connector: connector we're probing
> + *
> + * Use the BIOS to attempt to grab EDID data if possible.
> + *
> + * The returned pointer must be freed using drm_edid_free().
> + *
> + * Return: Pointer to valid EDID or NULL if we couldn't find any.
> + */
> +const struct drm_edid *drm_get_acpi_edid(struct drm_connector *connector)
> +{
> +	const struct drm_edid *drm_edid;
> +
> +	switch (connector->connector_type) {
> +	case DRM_MODE_CONNECTOR_LVDS:
> +	case DRM_MODE_CONNECTOR_eDP:
> +		break;
> +	default:
> +		return NULL;
> +	}
> +
> +	if (connector->force == DRM_FORCE_OFF)
> +		return NULL;
> +
> +	drm_edid = drm_edid_read_custom(connector, drm_do_probe_acpi_edid, connector->dev);
> +
> +	/* Note: Do *not* call connector updates here. */
> +
> +	return drm_edid;
> +}
> +EXPORT_SYMBOL(drm_get_acpi_edid);
> +
>  /**
>   * drm_edid_read_custom - Read EDID data using given EDID block read function
>   * @connector: Connector to use
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 7923bc00dc7a..ca41be289fc6 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -410,6 +410,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	void *data);
>  struct edid *drm_get_edid(struct drm_connector *connector,
>  			  struct i2c_adapter *adapter);
> +const struct drm_edid *drm_get_acpi_edid(struct drm_connector *connector);

There's a comment

/* Interface based on struct drm_edid */

towards the end of the file, gathering all the new API under it.

Other than that, LGTM,

BR,
Jani.

>  u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
>  struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>  				     struct i2c_adapter *adapter);

-- 
Jani Nikula, Intel
