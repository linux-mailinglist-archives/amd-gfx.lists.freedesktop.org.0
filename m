Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2A39AFDB0
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Oct 2024 11:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5707310EA41;
	Fri, 25 Oct 2024 09:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTFs+SBl";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3293510EA3D;
 Fri, 25 Oct 2024 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729847341; x=1761383341;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=G5BIlmm+WSpxZRIPofsex7d0rfAOVWkHAwmJRG0FiN8=;
 b=cTFs+SBlB84GxN7xBTPV4eLtL+2H4wlLlm+UONiRoiGi2ip4D7LEr7ft
 uAVYJTLVxeMc7Hf8WFjBlydzdIagKp46pZFFIfPWBVCQUd0Ru31vBWhaD
 4/zs29ubp/LofhJT1XmJfHVczYvaZqHpKG6eJ3poUFiqej1Fec2YXDHY5
 i6xw41BeIiApoVKCrqAh0a4RiL9FOxyq4tex1/Auipq+DxnXBN34UKC8s
 2O2YXQsXi8evQfPYtIh6d4PZPWrhfvRkNYtYkhHTi6dHrImgdzmDdF1+c
 BFff1c3w78kLJgRMbxf6KlDaALitDLRvVhhbkCwLoknD8Glwz4br8wetz Q==;
X-CSE-ConnectionGUID: 98yVfy/KQBC+BZZBhBIh0Q==
X-CSE-MsgGUID: BrcskT36So28rWLTDSdTQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33201623"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33201623"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 02:09:01 -0700
X-CSE-ConnectionGUID: XOVKQFolT5aF37UnQwF3Tw==
X-CSE-MsgGUID: MitKjFT0R/6tJM3r0s93AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80771854"
Received: from zzombora-mobl1.ti.intel.com (HELO localhost) ([10.245.246.193])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:08:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, christian.koenig@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, Raag Jadav
 <raag.jadav@intel.com>
Subject: Re: [PATCH v8 1/4] drm: Introduce device wedged event
In-Reply-To: <20241025084817.144621-2-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241025084817.144621-1-raag.jadav@intel.com>
 <20241025084817.144621-2-raag.jadav@intel.com>
Date: Fri, 25 Oct 2024 12:08:50 +0300
Message-ID: <87r084r1lp.fsf@intel.com>
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

On Fri, 25 Oct 2024, Raag Jadav <raag.jadav@intel.com> wrote:
> Introduce device wedged event, which will notify userspace of wedged
> (hanged/unusable) state of the DRM device through a uevent. This is
> useful especially in cases where the device is no longer operating as
> expected even after a reset and has become unrecoverable from driver
> context. Purpose of this implementation is to provide drivers a generic
> way to recover with the help of userspace intervention without taking
> any drastic measures in the driver.
>
> A 'wedged' device is basically a dead device that needs attention.
> The uevent is the notification that is sent to userspace along with a
> hint about what could possibly be attempted to recover the device and
> bring it back to usable state. Different drivers may have different
> ideas of a 'wedged' device depending on their hardware implementation,
> and hence the vendor agnostic nature of the event. It is up to the
> drivers to decide when they see the need for recovery and how they
> want to recover from the available methods.
>
> Recovery
> --------
>
> Current implementation defines two recovery methods, out of which,
> drivers can use any one, both or none. Method(s) of choice will be
> sent in the uevent environment as ``WEDGED=<method1>[,<method2>]``
> in order of less to more side-effects. If driver is unsure about
> recovery or method is unknown (like soft/hard reboot, firmware
> flashing, hardware replacement or any other procedure which can't
> be attempted on the fly), ``WEDGED=none`` will be sent instead.
>
> It is the responsibility of the driver to perform required cleanups
> (like disabling system memory access or signalling dma_fences) and
> prepare itself for the recovery before sending the event. Once the
> event is sent, driver should block all IOCTLs with an error code.
> This will signify the reason for wegeding which can be reported to
> the application if needed.
>
> Userspace consumers can parse this event and attempt recovery as per
> below expectations.
>
>     =============== ==================================
>     Recovery method Consumer expectations
>     =============== ==================================
>     rebind          unbind + rebind driver
>     bus-reset       unbind + reset bus device + rebind
>     none            admin/user policy
>     =============== ==================================
>
> Example for rebind
> ~~~~~~~~~~~~~~~~~~
>
> Udev rule::
>
>     SUBSYSTEM=="drm", ENV{WEDGED}=="rebind", DEVPATH=="*/drm/card[0-9]",
>     RUN+="/path/to/rebind.sh $env{DEVPATH}"
>
> Recovery script::
>
>     #!/bin/sh
>
>     DEVPATH=$(readlink -f /sys/$1/device)
>     DEVICE=$(basename $DEVPATH)
>     DRIVER=$(readlink -f $DEVPATH/driver)
>
>     echo -n $DEVICE > $DRIVER/unbind
>     sleep 1
>     echo -n $DEVICE > $DRIVER/bind
>
> Although scripts are simple enough for basic recovery, admin/users
> can define customized policies around recovery action. For example if
> the driver supports multiple recovery methods, consumers can opt for
> the suitable one based on policy definition. Consumers can also take
> additional steps like gathering telemetry information (devcoredump,
> syslog), or have the device available for further debugging and data
> collection before performing the recovery. This is useful especially
> when the driver is unsure about recovery or method is unknown.
>
> v4: s/drm_dev_wedged/drm_dev_wedged_event
>     Use drm_info() (Jani)
>     Kernel doc adjustment (Aravind)
> v5: Send recovery method with uevent (Lina)
> v6: Access wedge_recovery_opts[] using helper function (Jani)
>     Use snprintf() (Jani)
> v7: Convert recovery helpers into regular functions (Andy, Jani)
>     Aesthetic adjustments (Andy)
>     Handle invalid method cases
> v8: Allow sending multiple methods with uevent (Lucas, Michal)
>     static_assert() globally (Andy)
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 51 +++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_device.h  |  7 ++++++
>  include/drm/drm_drv.h     |  1 +
>  3 files changed, 59 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index ac30b0ec9d93..ded6327fc242 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -26,6 +26,8 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <linux/array_size.h>
> +#include <linux/build_bug.h>
>  #include <linux/debugfs.h>
>  #include <linux/fs.h>
>  #include <linux/module.h>
> @@ -33,6 +35,7 @@
>  #include <linux/mount.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/slab.h>
> +#include <linux/sprintf.h>
>  #include <linux/srcu.h>
>  #include <linux/xarray.h>
>  
> @@ -70,6 +73,16 @@ static struct dentry *drm_debugfs_root;
>  
>  DEFINE_STATIC_SRCU(drm_unplug_srcu);
>  
> +/*
> + * Available recovery methods for wedged device. To be sent along with device
> + * wedged uevent.
> + */
> +static const char *const drm_wedge_recovery_opts[] = {
> +	[ffs(DRM_WEDGE_RECOVERY_REBIND) - 1]	= "rebind",
> +	[ffs(DRM_WEDGE_RECOVERY_BUS_RESET) - 1]	= "bus-reset",
> +};
> +static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == ffs(DRM_WEDGE_RECOVERY_BUS_RESET));

This might work in most cases, but you also might end up finding that
there's an arch and compiler combo out there that just won't be able to
figure out ffs() at compile time, and the array initialization fails.

If that happens, you'd have to either convert back to an enum (and call
the wedge event function with BIT(DRM_WEDGE_RECOVERY_REBIND) etc.), or
make this a array of structs mapping the macro values to strings and
loop over it.

Also, the main point of the static assert was to ensure the array is
updated when a new recovery option is added, and there's no out of
bounds access. That no longer holds, and the static assert is pretty
much useless. You still have to manually find and update this.

> +
>  /*
>   * DRM Minors
>   * A DRM device can provide several char-dev interfaces on the DRM-Major. Each
> @@ -497,6 +510,44 @@ void drm_dev_unplug(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_dev_unplug);
>  
> +/**
> + * drm_dev_wedged_event - generate a device wedged uevent
> + * @dev: DRM device
> + * @method: method(s) to be used for recovery
> + *
> + * This generates a device wedged uevent for the DRM device specified by @dev.
> + * Recovery @method from drm_wedge_recovery_opts[] is sent in the uevent
> + * environment as ``WEDGED=<method1>[,<method2>]`` in order of less to more
> + * side-effects. If caller is unsure about recovery or @method is unknown (0),
> + * ``WEDGED=none`` will be sent instead.
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> +{
> +	unsigned int len, opt, size = ARRAY_SIZE(drm_wedge_recovery_opts);
> +	const char *recovery = NULL;
> +	/* Event string length up to 24+ characters with available methods */
> +	char event_string[32];
> +	char *envp[] = { event_string, NULL };
> +
> +	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
> +
> +	for_each_set_bit(opt, &method, size) {
> +		recovery = drm_wedge_recovery_opts[opt];

You've left out bounds checking with the idea that the static assert
covers this. I don't think it does.

BR,
Jani.

> +		len += scnprintf(event_string + len, sizeof(event_string),
> +				 opt == size - 1 ? "%s" : "%s,", recovery);
> +	}
> +
> +	if (!recovery)
> +		/* Caller is unsure about recovery, do the best we can at this point. */
> +		scnprintf(event_string + len, sizeof(event_string), "%s", "none");
> +
> +	drm_info(dev, "device wedged, needs recovery\n");
> +	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> +}
> +EXPORT_SYMBOL(drm_dev_wedged_event);
> +
>  /*
>   * DRM internal mount
>   * We want to be able to allocate our own "struct address_space" to control
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index c91f87b5242d..edf8b200891d 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -21,6 +21,13 @@ struct inode;
>  struct pci_dev;
>  struct pci_controller;
>  
> +/*
> + * Recovery methods for wedged device in order of less to more side-effects.
> + * To be used with drm_dev_wedged_event() as recovery @method. Callers can
> + * use any one, multiple (or'd) or none depending on their needs.
> + */
> +#define DRM_WEDGE_RECOVERY_REBIND	BIT(0)	/* unbind + rebind driver */
> +#define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(1)	/* unbind + reset bus device + rebind */
>  
>  /**
>   * enum switch_power_state - power state of drm device
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 02ea4e3248fd..cc7bcb94ad6a 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -461,6 +461,7 @@ void drm_put_dev(struct drm_device *dev);
>  bool drm_dev_enter(struct drm_device *dev, int *idx);
>  void drm_dev_exit(int idx);
>  void drm_dev_unplug(struct drm_device *dev);
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method);
>  
>  /**
>   * drm_dev_is_unplugged - is a DRM device unplugged

-- 
Jani Nikula, Intel
