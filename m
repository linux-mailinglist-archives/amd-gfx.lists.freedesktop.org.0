Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC98E8582D8
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Feb 2024 17:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4548F10EC3D;
	Fri, 16 Feb 2024 16:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="YUDSDHoC";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB4F10E24A
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Feb 2024 16:44:35 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-50e4e36c09cso780365e87.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Feb 2024 08:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1708101874; x=1708706674; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=76wOtguCiFQWboTMzhB4hnS3UP+WhC0vzMoeMQ3V+XQ=;
 b=YUDSDHoCD8xgnJbpK3xxFoWwWgPzZH4oxumPE8N1RZJSGWrpXaB3M9fZiS8MQlVpRw
 IRwW2cqtXaCnvgUKwL4X30eKxNvtEr0SRnA3aOnBSxZZ7LqNnIfKarNG8E4+nK4MGxVO
 JXc0uZdUe3Bgd4VAxcwSsafKDdAvG7kQGsGi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708101874; x=1708706674;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=76wOtguCiFQWboTMzhB4hnS3UP+WhC0vzMoeMQ3V+XQ=;
 b=Y+dakvE/sXdkd/umPD90e7KoMSVbnYHhd9Pgl4luDIciPW46PW4eXg3jxeN9I+0WaQ
 FInUzBlXZgGbtuDsYfF1vt7yTsO17fQvt/ja4UkgywX8WkfyfyGO2QeHLUtoRrzcFiVl
 5vN6HG67N61EMolUcyU7k6y399FcUGammPEeorDZm6gjNk1T4xWH2qdk0DrVgOzBnpmM
 Vym5LjeFg1eX5wQ3h6JG4NuDvYxYYovO+k1zf/sutE+pI9qPDU5EUmB36XZ4p0TipSn6
 KqcW7Yb+nHsMslhNZCrQyqoO/n+2hUZtbrhssx5ockX3tpueGvA7MrThqMusX9h5rPms
 Z+jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGDi2oW0+pDvJbznGReCAVuAlyhfdnGsQx171Ecz9YvXooZibAIpStWbhenAMJDLyr0Bc85kz0dlct9UXJn5dxhVQY8g4Bjj9GXlYrsg==
X-Gm-Message-State: AOJu0YyeyOipvTXsKLtUANKQ7WOy9zgSe5fijMGszDvz633RnW08B4ad
 nz/iyS81yBfIA7eqKaxRhWJaXNagc/wloOxsEY2W1znVU0PiYtWiI43oIKiPNo4=
X-Google-Smtp-Source: AGHT+IEuloFhVFC2o5Kh7YQza+RJRv4NnWpfLQKn44MYcnzGH2WMyJG+wXU911TQAAApZBNb+DUWPw==
X-Received: by 2002:a19:9156:0:b0:511:5b35:d11c with SMTP id
 y22-20020a199156000000b005115b35d11cmr3508815lfj.2.1708101873965; 
 Fri, 16 Feb 2024 08:44:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05600c445100b00411fdf85d44sm2910563wmn.37.2024.02.16.08.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 08:44:33 -0800 (PST)
Date: Fri, 16 Feb 2024 17:44:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>, Dave Airlie <airlied@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v4 1/3] drm: Add drm_get_acpi_edid() helper
Message-ID: <Zc-Q73e7Z3ErVC67@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>, Dave Airlie <airlied@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20240207224429.104625-1-mario.limonciello@amd.com>
 <20240207224429.104625-2-mario.limonciello@amd.com>
 <87y1bvb7ns.fsf@intel.com> <ZcYHaXNJ8IqbLIra@phenom.ffwll.local>
 <9fa0c1ad-dd7d-4350-aad1-4723450850bd@amd.com>
 <ZcZ1tdXqH90RabvV@phenom.ffwll.local>
 <350ee747-c1bf-4513-aad3-f43b11fcdf0f@amd.com>
 <874jedapmq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874jedapmq.fsf@intel.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Mon, Feb 12, 2024 at 01:27:57PM +0200, Jani Nikula wrote:
> On Sat, 10 Feb 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
> > On 2/9/2024 12:57, Daniel Vetter wrote:
> >> On Fri, Feb 09, 2024 at 09:34:13AM -0600, Mario Limonciello wrote:
> >>> On 2/9/2024 05:07, Daniel Vetter wrote:
> >>>> On Thu, Feb 08, 2024 at 11:57:11AM +0200, Jani Nikula wrote:
> >>>>> On Wed, 07 Feb 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
> >>>>>> Some manufacturers have intentionally put an EDID that differs from
> >>>>>> the EDID on the internal panel on laptops.  Drivers can call this
> >>>>>> helper to attempt to fetch the EDID from the BIOS's ACPI _DDC method.
> >>>>>>
> >>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >>>>>> ---
> >>>>>>    drivers/gpu/drm/Kconfig    |  5 +++
> >>>>>>    drivers/gpu/drm/drm_edid.c | 77 ++++++++++++++++++++++++++++++++++++++
> >>>>>>    include/drm/drm_edid.h     |  1 +
> >>>>>>    3 files changed, 83 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> >>>>>> index 6ec33d36f3a4..ec2bb71e8b36 100644
> >>>>>> --- a/drivers/gpu/drm/Kconfig
> >>>>>> +++ b/drivers/gpu/drm/Kconfig
> >>>>>> @@ -21,6 +21,11 @@ menuconfig DRM
> >>>>>>    	select KCMP
> >>>>>>    	select VIDEO_CMDLINE
> >>>>>>    	select VIDEO_NOMODESET
> >>>>>> +	select ACPI_VIDEO if ACPI
> >>>>>> +	select BACKLIGHT_CLASS_DEVICE if ACPI
> >>>>>> +	select INPUT if ACPI
> >>>>>> +	select X86_PLATFORM_DEVICES if ACPI && X86
> >>>>>> +	select ACPI_WMI if ACPI && X86
> >>>>>
> >>>>> I think I'll defer to drm maintainers on whether this is okay or
> >>>>> something to be avoided.
> >>>>
> >>>> Uh yeah this is a bit much, and select just messes with everything. Just
> >>>> #ifdef this in the code with a dummy alternative, if users configure their
> >>>> kernel without acpi but need it, they get to keep all the pieces.
> >>>>
> >>>> Alternatively make a DRM_ACPI_HELPERS symbol, but imo a Kconfig for every
> >>>> function is also not great. And just using #ifdef in the code also works
> >>>> for CONFIG_OF, which is exactly the same thing for platforms using dt to
> >>>> describe hw.
> >>>>
> >>>> Also I'd expect ACPI code to already provide dummy functions if ACPI is
> >>>> provided, so you probably dont even need all that much #ifdef in the code.
> >>>>
> >>>> What we defo cant do is select platform/hw stuff just because you enable
> >>>> CONFIG_DRM.
> >>>> -Sima
> >>>
> >>> The problem was with linking.  I'll experiment with #ifdef for the next
> >>> version.
> >> 
> >> Ah yes, if e.g. acpi is a module but drm is built-in then it will compile,
> >> but not link.
> >> 
> >> You need
> >> 
> >> 	depends on (ACPI || ACPI=n)
> >> 
> >> for this. Looks a bit funny but works for all combinations.
> >
> > Nope; this fails at link time with this combination:
> >
> > CONFIG_ACPI=y
> > CONFIG_ACPI_VIDEO=m
> > CONFIG_DRM=y
> >
> > ld: drivers/gpu/drm/drm_edid.o: in function `drm_do_probe_acpi_edid':
> > drm_edid.c:(.text+0xd34): undefined reference to `acpi_video_get_edid'
> > make[5]: *** [scripts/Makefile.vmlinux:37: vmlinux] Error 1
> >
> > So the logical solution is to try
> > 	depends on (ACPI_VIDEO || ACPI_VIDEO=n)
> >
> > But that leads me back to the rabbit hole of why I had the selects moved 
> > to drm instead of drivers in the first place:
> >
> > drivers/gpu/drm/Kconfig:8:error: recursive dependency detected!
> > drivers/gpu/drm/Kconfig:8:      symbol DRM depends on ACPI_VIDEO
> > drivers/acpi/Kconfig:213:       symbol ACPI_VIDEO depends on 
> > BACKLIGHT_CLASS_DEVICE
> > drivers/video/backlight/Kconfig:136:    symbol BACKLIGHT_CLASS_DEVICE is 
> > selected by DRM_RADEON
> > drivers/gpu/drm/radeon/Kconfig:3:       symbol DRM_RADEON depends on DRM
> 
> Generally speaking the root cause is using "select" instead of "depends
> on" in the first place. The excessive selects are just band-aid over
> that root cause. And if you try to convert some but not all the selects
> to depends ons, you'll get recursive dependencies.
> 
> Quoting Documentation/kbuild/kconfig-language.rst:
> 
>   Note:
> 	select should be used with care. select will force
> 	a symbol to a value without visiting the dependencies.
> 	By abusing select you are able to select a symbol FOO even
> 	if FOO depends on BAR that is not set.
> 	In general use select only for non-visible symbols
> 	(no prompts anywhere) and for symbols with no dependencies.
> 	That will limit the usefulness but on the other hand avoid
> 	the illegal configurations all over.
> 
> Yeah, we ignore that, and get to keep all the pieces.

Yeah we need radically fewer select and replace them with depends. The
idea is that people just magically get the correct kernel config because
even menuconfig sucks at showing you why you cannot enable a driver.

But it's really not a good solution to that issue, and we need to stop
suffering. Reality is that enabling a correct config for complex drivers
like we have in drm is a bit a black belt art :-/
-Sima

> 
> 
> BR,
> Jani.
> 
> 
> >
> >
> >> 
> >> Since this gets mess it might be useful to have a DRM_ACPI_HELPERS Kconfig
> >> that controls all this.
> >
> > How about all those selects that I had in this patch moved to 
> > DRM_ACPI_HELPERS and keep the patch that drops from all the drivers then?
> >
> >> -Sima
> >> 
> >>>
> >>>>
> >>>>>
> >>>>>
> >>>>>>    	help
> >>>>>>    	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
> >>>>>>    	  introduced in XFree86 4.0. If you say Y here, you need to select
> >>>>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> >>>>>> index 923c4423151c..c649b4f9fd8e 100644
> >>>>>> --- a/drivers/gpu/drm/drm_edid.c
> >>>>>> +++ b/drivers/gpu/drm/drm_edid.c
> >>>>>> @@ -28,6 +28,7 @@
> >>>>>>     * DEALINGS IN THE SOFTWARE.
> >>>>>>     */
> >>>>>> +#include <acpi/video.h>
> >>>>>>    #include <linux/bitfield.h>
> >>>>>>    #include <linux/cec.h>
> >>>>>>    #include <linux/hdmi.h>
> >>>>>> @@ -2188,6 +2189,49 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
> >>>>>>    	return ret == xfers ? 0 : -1;
> >>>>>>    }
> >>>>>> +/**
> >>>>>> + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
> >>>>>> + * @data: struct drm_device
> >>>>>> + * @buf: EDID data buffer to be filled
> >>>>>> + * @block: 128 byte EDID block to start fetching from
> >>>>>> + * @len: EDID data buffer length to fetch
> >>>>>> + *
> >>>>>> + * Try to fetch EDID information by calling acpi_video_get_edid() function.
> >>>>>> + *
> >>>>>> + * Return: 0 on success or error code on failure.
> >>>>>> + */
> >>>>>> +static int
> >>>>>> +drm_do_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
> >>>>>> +{
> >>>>>> +	struct drm_device *ddev = data;
> >>>>>> +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
> >>>>>> +	unsigned char start = block * EDID_LENGTH;
> >>>>>> +	void *edid;
> >>>>>> +	int r;
> >>>>>> +
> >>>>>> +	if (!acpidev)
> >>>>>> +		return -ENODEV;
> >>>>>> +
> >>>>>> +	/* fetch the entire edid from BIOS */
> >>>>>> +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
> >>>>>> +	if (r < 0) {
> >>>>>> +		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
> >>>>>> +		return -EINVAL;
> >>>>>> +	}
> >>>>>> +	if (len > r || start > r || start + len > r) {
> >>>>>> +		r = -EINVAL;
> >>>>>> +		goto cleanup;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	memcpy(buf, edid + start, len);
> >>>>>> +	r = 0;
> >>>>>> +
> >>>>>> +cleanup:
> >>>>>> +	kfree(edid);
> >>>>>> +
> >>>>>> +	return r;
> >>>>>> +}
> >>>>>> +
> >>>>>>    static void connector_bad_edid(struct drm_connector *connector,
> >>>>>>    			       const struct edid *edid, int num_blocks)
> >>>>>>    {
> >>>>>> @@ -2643,6 +2687,39 @@ struct edid *drm_get_edid(struct drm_connector *connector,
> >>>>>>    }
> >>>>>>    EXPORT_SYMBOL(drm_get_edid);
> >>>>>> +/**
> >>>>>> + * drm_get_acpi_edid - get EDID data, if available
> >>>>>
> >>>>> I'd prefer all the new EDID API to be named drm_edid_*. Makes a clean
> >>>>> break from the old API, and is more consistent.
> >>>>>
> >>>>> So perhaps drm_edid_read_acpi() to be in line with all the other struct
> >>>>> drm_edid based EDID reading functions.
> >>>>>
> >>>>>> + * @connector: connector we're probing
> >>>>>> + *
> >>>>>> + * Use the BIOS to attempt to grab EDID data if possible.
> >>>>>> + *
> >>>>>> + * The returned pointer must be freed using drm_edid_free().
> >>>>>> + *
> >>>>>> + * Return: Pointer to valid EDID or NULL if we couldn't find any.
> >>>>>> + */
> >>>>>> +const struct drm_edid *drm_get_acpi_edid(struct drm_connector *connector)
> >>>>>> +{
> >>>>>> +	const struct drm_edid *drm_edid;
> >>>>>> +
> >>>>>> +	switch (connector->connector_type) {
> >>>>>> +	case DRM_MODE_CONNECTOR_LVDS:
> >>>>>> +	case DRM_MODE_CONNECTOR_eDP:
> >>>>>> +		break;
> >>>>>> +	default:
> >>>>>> +		return NULL;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	if (connector->force == DRM_FORCE_OFF)
> >>>>>> +		return NULL;
> >>>>>> +
> >>>>>> +	drm_edid = drm_edid_read_custom(connector, drm_do_probe_acpi_edid, connector->dev);
> >>>>>> +
> >>>>>> +	/* Note: Do *not* call connector updates here. */
> >>>>>> +
> >>>>>> +	return drm_edid;
> >>>>>> +}
> >>>>>> +EXPORT_SYMBOL(drm_get_acpi_edid);
> >>>>>> +
> >>>>>>    /**
> >>>>>>     * drm_edid_read_custom - Read EDID data using given EDID block read function
> >>>>>>     * @connector: Connector to use
> >>>>>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> >>>>>> index 7923bc00dc7a..ca41be289fc6 100644
> >>>>>> --- a/include/drm/drm_edid.h
> >>>>>> +++ b/include/drm/drm_edid.h
> >>>>>> @@ -410,6 +410,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
> >>>>>>    	void *data);
> >>>>>>    struct edid *drm_get_edid(struct drm_connector *connector,
> >>>>>>    			  struct i2c_adapter *adapter);
> >>>>>> +const struct drm_edid *drm_get_acpi_edid(struct drm_connector *connector);
> >>>>>
> >>>>> There's a comment
> >>>>>
> >>>>> /* Interface based on struct drm_edid */
> >>>>>
> >>>>> towards the end of the file, gathering all the new API under it.
> >>>>>
> >>>>> Other than that, LGTM,
> >>>>>
> >>>>> BR,
> >>>>> Jani.
> >>>>>
> >>>>>>    u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
> >>>>>>    struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
> >>>>>>    				     struct i2c_adapter *adapter);
> >>>>>
> >>>>> -- 
> >>>>> Jani Nikula, Intel
> >>>>
> >>>
> >> 
> >
> 
> -- 
> Jani Nikula, Intel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
