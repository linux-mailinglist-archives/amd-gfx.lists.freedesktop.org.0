Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83384258980
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Sep 2020 09:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319566E830;
	Tue,  1 Sep 2020 07:44:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8B36E830
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Sep 2020 07:44:34 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e17so168507wme.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 01 Sep 2020 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vJXOiNPInTnV43yDjf0Yi2LM76W5p/LybHdJ0wWlulE=;
 b=kVa/81Bw0CKT3+qMUTEsfmSWzu0/3IFTFIsLvj1oxheFdl4gSdyHZ897Ijacpt14q5
 VbyGwp2DL8UIlCM5Z/46BfqzIYDped9vkqVjhL6rcAMPWvhvj2q+ZIzHdgzcEG3+O0ZI
 pfwOHEvtWoHJhCCI7Td9slE9MSnjSY5FbK+S8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vJXOiNPInTnV43yDjf0Yi2LM76W5p/LybHdJ0wWlulE=;
 b=PEMxHv8LzzhW8qIwxVZmZ3smhcG8tfLV2bd414WZ/RtobFoZH4/AXey/XWMfmvsdYF
 wxNcYBbhchfbpRrjiXYmM32IQbkVXOstk4HCgrTPz6U2PlhBpf/+UMgM8wtuxKmLTELK
 fhrstaugpsQvDC2Hvjl++6PlMrsUvV/ZxrksXVa3ZUnVmx2RRDjwX4H0QV8mzgQ+j7lK
 D/fHZ07SgCUaRPEdE/Qz7NvB5mHr3HBJSu7nOyQ5s6NBF1LXDwP+zqE9pLY0Bt9xx8GF
 M9XqnVKqvrzoYkZFCOTGsCoCFftjt7EB9WV9gKcyuEwehMltzTJwezbreun52WOSe/pv
 k87g==
X-Gm-Message-State: AOAM531E0g5k+uMWwsW5X84+gHBpQmq0HG5Nfd5Q79Aeu4ueB+2pf1An
 JZucjByQ3OEjXLxw2MW/mB4nmA==
X-Google-Smtp-Source: ABdhPJxw1WA9BE/gyGm+ZbDWWtK6pQy79ffSjVsaOdguGrkHPm4sfGMOE4ljs2t3JR/wONmWqINVcA==
X-Received: by 2002:a7b:c1c6:: with SMTP id a6mr441926wmj.97.1598946272861;
 Tue, 01 Sep 2020 00:44:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t1sm561500wmi.16.2020.09.01.00.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 00:44:32 -0700 (PDT)
Date: Tue, 1 Sep 2020 09:44:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: Embed drm_device into amdgpu_device (v2)
Message-ID: <20200901074430.GU2352366@phenom.ffwll.local>
References: <20200819050042.7370-1-luben.tuikov@amd.com>
 <20200819050042.7370-4-luben.tuikov@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819050042.7370-4-luben.tuikov@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 01:00:42AM -0400, Luben Tuikov wrote:
> a) Embed struct drm_device into struct amdgpu_device.
> b) Modify the inline-f drm_to_adev() accordingly.
> c) Modify the inline-f adev_to_drm() accordingly.
> d) Eliminate the use of drm_device.dev_private,
>    in amdgpu.
> e) Switch from using drm_dev_alloc() to
>    drm_dev_init().
> f) Add a DRM driver release function, which frees
>    the container amdgpu_device after all krefs on
>    the contained drm_device have been released.
> 
> v2: Split out adding adev_to_drm() into its own
>     patch (previous commit), making this patch
>     more succinct and clear. More detailed commit
>     description.
> 
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 10 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 15 +++-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 43 ++++++++++++++--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 20 +++-------
>  4 files changed, 43 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 735480cc7dcf..107a6ec920f7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -724,8 +724,8 @@ struct amd_powerplay {
>  #define AMDGPU_MAX_DF_PERFMONS 4
>  struct amdgpu_device {
>  	struct device			*dev;
> -	struct drm_device		*ddev;
>  	struct pci_dev			*pdev;
> +	struct drm_device		ddev;
>  
>  #ifdef CONFIG_DRM_AMD_ACP
>  	struct amdgpu_acp		acp;
> @@ -990,12 +990,12 @@ struct amdgpu_device {
>  
>  static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
>  {
> -	return ddev->dev_private;
> +	return container_of(ddev, struct amdgpu_device, ddev);
>  }
>  
>  static inline struct drm_device *adev_to_drm(struct amdgpu_device *adev)
>  {
> -	return adev->ddev;
> +	return &adev->ddev;
>  }
>  
>  static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
> @@ -1004,8 +1004,6 @@ static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
>  }
>  
>  int amdgpu_device_init(struct amdgpu_device *adev,
> -		       struct drm_device *ddev,
> -		       struct pci_dev *pdev,
>  		       uint32_t flags);
>  void amdgpu_device_fini(struct amdgpu_device *adev);
>  int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
> @@ -1195,7 +1193,7 @@ static inline void *amdgpu_atpx_get_dhandle(void) { return NULL; }
>  extern const struct drm_ioctl_desc amdgpu_ioctls_kms[];
>  extern const int amdgpu_max_kms_ioctl;
>  
> -int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags);
> +int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags);
>  void amdgpu_driver_unload_kms(struct drm_device *dev);
>  void amdgpu_driver_lastclose_kms(struct drm_device *dev);
>  int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 07012d71eeea..6e529548e708 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1216,7 +1216,8 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
>   * Callback for the switcheroo driver.  Suspends or resumes the
>   * the asics before or after it is powered up using ACPI methods.
>   */
> -static void amdgpu_switcheroo_set_state(struct pci_dev *pdev, enum vga_switcheroo_state state)
> +static void amdgpu_switcheroo_set_state(struct pci_dev *pdev,
> +					enum vga_switcheroo_state state)
>  {
>  	struct drm_device *dev = pci_get_drvdata(pdev);
>  	int r;
> @@ -2977,8 +2978,6 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>   * amdgpu_device_init - initialize the driver
>   *
>   * @adev: amdgpu_device pointer
> - * @ddev: drm dev pointer
> - * @pdev: pci dev pointer
>   * @flags: driver flags
>   *
>   * Initializes the driver info and hw (all asics).
> @@ -2986,18 +2985,15 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>   * Called at driver startup.
>   */
>  int amdgpu_device_init(struct amdgpu_device *adev,
> -		       struct drm_device *ddev,
> -		       struct pci_dev *pdev,
>  		       uint32_t flags)
>  {
> +	struct drm_device *ddev = adev_to_drm(adev);
> +	struct pci_dev *pdev = adev->pdev;
>  	int r, i;
>  	bool boco = false;
>  	u32 max_MBps;
>  
>  	adev->shutdown = false;
> -	adev->dev = &pdev->dev;
> -	adev->ddev = ddev;
> -	adev->pdev = pdev;
>  	adev->flags = flags;
>  
>  	if (amdgpu_force_asic_type >= 0 && amdgpu_force_asic_type < CHIP_LAST)
> @@ -3451,9 +3447,8 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
>  	struct drm_connector_list_iter iter;
>  	int r;
>  
> -	if (dev == NULL || dev->dev_private == NULL) {
> +	if (!dev)
>  		return -ENODEV;

Random comment, but is this really still needed?

This pattern goes back to dri1 shadow attach trickery where everything was
horrible and we could end up with a device but not a device and trying to
suspend it.

With a proper kms pci device you shouldn't ever end up in this situation
where the drm_device doesn't exist or isn't completely set up, but we're
trying to suspend. Maybe wrap in a WARN_ON at least?
-Daniel

> -	}
>  
>  	adev = drm_to_adev(dev);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 38023c879db1..6866c515f00a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1082,7 +1082,7 @@ static struct drm_driver kms_driver;
>  static int amdgpu_pci_probe(struct pci_dev *pdev,
>  			    const struct pci_device_id *ent)
>  {
> -	struct drm_device *dev;
> +	struct drm_device *ddev;
>  	struct amdgpu_device *adev;
>  	unsigned long flags = ent->driver_data;
>  	int ret, retry = 0;
> @@ -1138,36 +1138,42 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>  	if (ret)
>  		return ret;
>  
> -	dev = drm_dev_alloc(&kms_driver, &pdev->dev);
> -	if (IS_ERR(dev))
> -		return PTR_ERR(dev);
> +	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	adev->dev  = &pdev->dev;
> +	adev->pdev = pdev;
> +	ddev = adev_to_drm(adev);
> +	ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
> +	if (ret)
> +		goto err_free;
>  
>  	if (!supports_atomic)
> -		dev->driver_features &= ~DRIVER_ATOMIC;
> +		ddev->driver_features &= ~DRIVER_ATOMIC;
>  
>  	ret = pci_enable_device(pdev);
>  	if (ret)
>  		goto err_free;
>  
> -	dev->pdev = pdev;
> +	ddev->pdev = pdev;
> +	pci_set_drvdata(pdev, ddev);
>  
> -	pci_set_drvdata(pdev, dev);
> -
> -	ret = amdgpu_driver_load_kms(dev, ent->driver_data);
> +	ret = amdgpu_driver_load_kms(adev, ent->driver_data);
>  	if (ret)
>  		goto err_pci;
>  
>  retry_init:
> -	ret = drm_dev_register(dev, ent->driver_data);
> +	ret = drm_dev_register(ddev, ent->driver_data);
>  	if (ret == -EAGAIN && ++retry <= 3) {
>  		DRM_INFO("retry init %d\n", retry);
>  		/* Don't request EX mode too frequently which is attacking */
>  		msleep(5000);
>  		goto retry_init;
> -	} else if (ret)
> +	} else if (ret) {
>  		goto err_pci;
> +	}
>  
> -	adev = drm_to_adev(dev);
>  	ret = amdgpu_debugfs_init(adev);
>  	if (ret)
>  		DRM_ERROR("Creating debugfs files failed (%d).\n", ret);
> @@ -1177,7 +1183,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>  err_pci:
>  	pci_disable_device(pdev);
>  err_free:
> -	drm_dev_put(dev);
> +	drm_dev_put(ddev);
>  	return ret;
>  }
>  
> @@ -1197,6 +1203,14 @@ amdgpu_pci_remove(struct pci_dev *pdev)
>  	drm_dev_put(dev);
>  }
>  
> +static void amdgpu_driver_release(struct drm_device *ddev)
> +{
> +	struct amdgpu_device *adev = drm_to_adev(ddev);
> +
> +	drm_dev_fini(ddev);
> +	kfree(adev);
> +}
> +
>  static void
>  amdgpu_pci_shutdown(struct pci_dev *pdev)
>  {
> @@ -1491,6 +1505,7 @@ static struct drm_driver kms_driver = {
>  	.open = amdgpu_driver_open_kms,
>  	.postclose = amdgpu_driver_postclose_kms,
>  	.lastclose = amdgpu_driver_lastclose_kms,
> +	.release   = amdgpu_driver_release,
>  	.irq_handler = amdgpu_irq_handler,
>  	.ioctls = amdgpu_ioctls_kms,
>  	.gem_free_object_unlocked = amdgpu_gem_object_free,
> @@ -1525,8 +1540,6 @@ static struct pci_driver amdgpu_kms_pci_driver = {
>  	.driver.pm = &amdgpu_pm_ops,
>  };
>  
> -
> -
>  static int __init amdgpu_init(void)
>  {
>  	int r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 47cd3558f9c7..f2a4fdcd542d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -86,7 +86,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
>  	amdgpu_unregister_gpu_instance(adev);
>  
>  	if (adev->rmmio == NULL)
> -		goto done_free;
> +		return;
>  
>  	if (adev->runpm) {
>  		pm_runtime_get_sync(dev->dev);
> @@ -96,10 +96,6 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
>  	amdgpu_acpi_fini(adev);
>  
>  	amdgpu_device_fini(adev);
> -
> -done_free:
> -	kfree(adev);
> -	dev->dev_private = NULL;
>  }
>  
>  void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
> @@ -130,22 +126,18 @@ void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
>  /**
>   * amdgpu_driver_load_kms - Main load function for KMS.
>   *
> - * @dev: drm dev pointer
> + * @adev: pointer to struct amdgpu_device
>   * @flags: device flags
>   *
>   * This is the main load function for KMS (all asics).
>   * Returns 0 on success, error on failure.
>   */
> -int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
> +int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags)
>  {
> -	struct amdgpu_device *adev;
> +	struct drm_device *dev;
>  	int r, acpi_status;
>  
> -	adev = kzalloc(sizeof(struct amdgpu_device), GFP_KERNEL);
> -	if (adev == NULL) {
> -		return -ENOMEM;
> -	}
> -	dev->dev_private = (void *)adev;
> +	dev = adev_to_drm(adev);
>  
>  	if (amdgpu_has_atpx() &&
>  	    (amdgpu_is_atpx_hybrid() ||
> @@ -160,7 +152,7 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
>  	 * properly initialize the GPU MC controller and permit
>  	 * VRAM allocation
>  	 */
> -	r = amdgpu_device_init(adev, dev, dev->pdev, flags);
> +	r = amdgpu_device_init(adev, flags);
>  	if (r) {
>  		dev_err(&dev->pdev->dev, "Fatal error during GPU init\n");
>  		goto out;
> -- 
> 2.28.0.215.g878e727637
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
