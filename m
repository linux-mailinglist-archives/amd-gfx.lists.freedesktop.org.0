Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 911F2256136
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Aug 2020 21:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F0C6E5D4;
	Fri, 28 Aug 2020 19:25:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF036E519
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Aug 2020 19:25:57 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b79so212289wmb.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Aug 2020 12:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P1e2eQqXGTfdkHsVajCVZaCLUeH/8wdlskOE1FobVbY=;
 b=mR4oe8xvJ/gm4V3CI4rCG/PTI7jOK2udgy4WbhXFPUlDnjrpQex88U711e0dhczi2S
 1tGbqXmfEt/VqfT0q+GHz/5eSpLkQXwtJHZAaukHqZ2SP5Z0j1y6hLPFpePRFsAqZVdV
 kc1yMPyc6fh0ifdFSGZIUAB/JdBoXOP1pMwcq6KcUtDsIqvYBp+aeseCfL/uoU78SuPd
 +wsCBMeKR9RPV2JKQJ6cYQXASSESClD74huqNs0sj3fqDyO45bKyJ+hobM2QzLKX17v6
 8uldqJ1i1pxT+JurRrgR31q4W3CLztD8i73TCLeaBQasV/zCGD1WvLZx1kHsBOaF6nzg
 l7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P1e2eQqXGTfdkHsVajCVZaCLUeH/8wdlskOE1FobVbY=;
 b=ZiPTD5KumLO/iq586+Mbl/k8ek9mgOzWaMeHzoL/jW0Ia6w3FggDBOh0qDLC3eefrN
 2FW/b+gjhvmfLdqUrQ2nVVLjON/fLak2sUu+XIIzgNBv4b4VieGLREuGPgwfv1cYXYJ4
 lhmMvLeRGzCBnzhcfDseo3PHcOKUNbKNBE0/mtCT7oCWTASCZZDWllZ/HEi8PPv5VdJr
 3MoQe7axNqaZxKIY4B8x+xUP34ZvMBVImr8+6iazwy8xWQwtwlXZKQScUJZmPyOU3T2D
 bGL1r9ddhR/5K5gnHJ58CSSxRDnAAeQaB0EWYAYXerl6KvH4wA60fSqbG8HbO0F64vVk
 B/gw==
X-Gm-Message-State: AOAM532r9L15oTOOhAQ1OVgwusUKtEasipBIj23EfB/POM3+xSqNm6xt
 DHl/2CF9Gv4E1h8+OFKmFSqqTxoO1RsWG3Wz4TCxsSAQ
X-Google-Smtp-Source: ABdhPJzh3X90AsKkFjSBae0kjAt4l8XlQuK4R0VU1TsEBlFs4GU8zulKHK4UPONWsDu/UmzaSQpmVDfiPazlM71QljU=
X-Received: by 2002:a1c:6155:: with SMTP id v82mr189611wmb.70.1598642755814;
 Fri, 28 Aug 2020 12:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <1598630743-21155-1-git-send-email-andrey.grodzovsky@amd.com>
 <1598630743-21155-2-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1598630743-21155-2-git-send-email-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Aug 2020 15:25:44 -0400
Message-ID: <CADnq5_OCH5uP57BCsq6z-xAKdfv-Z5Ywd4DA_jP2_CRafvDatA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] drm/amdgpu: Implement DPC recovery
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>, Nirmoy <nirmodas@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dennis Li <Dennis.Li@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Aug 28, 2020 at 12:06 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> Add DPC handlers with basic recovery functionality.
>
> v2: remove pci_save_state to avoid breaking suspend/resume
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   9 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 169 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   9 +-
>  3 files changed, 184 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 49ea9fa..3399242 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -49,6 +49,8 @@
>  #include <linux/rbtree.h>
>  #include <linux/hashtable.h>
>  #include <linux/dma-fence.h>
> +#include <linux/pci.h>
> +#include <linux/aer.h>
>
>  #include <drm/ttm/ttm_bo_api.h>
>  #include <drm/ttm/ttm_bo_driver.h>
> @@ -1263,6 +1265,13 @@ static inline int amdgpu_dm_display_resume(struct amdgpu_device *adev) { return
>  void amdgpu_register_gpu_instance(struct amdgpu_device *adev);
>  void amdgpu_unregister_gpu_instance(struct amdgpu_device *adev);
>
> +pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev,
> +                                          pci_channel_state_t state);
> +pci_ers_result_t amdgpu_pci_mmio_enabled(struct pci_dev *pdev);
> +pci_ers_result_t amdgpu_pci_slot_reset(struct pci_dev *pdev);
> +void amdgpu_pci_resume(struct pci_dev *pdev);
> +
> +
>  #include "amdgpu_object.h"
>
>  /* used by df_v3_6.c and amdgpu_pmu.c */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 5a948ed..937f8b0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -350,7 +350,8 @@ uint32_t amdgpu_mm_rreg(struct amdgpu_device *adev, uint32_t reg,
>   *
>   * Returns the 8 bit value from the offset specified.
>   */
> -uint8_t amdgpu_mm_rreg8(struct amdgpu_device *adev, uint32_t offset) {
> +uint8_t amdgpu_mm_rreg8(struct amdgpu_device *adev, uint32_t offset)
> +{
>         if (offset < adev->rmmio_size)
>                 return (readb(adev->rmmio + offset));
>         BUG();
> @@ -371,7 +372,8 @@ uint8_t amdgpu_mm_rreg8(struct amdgpu_device *adev, uint32_t offset) {
>   *
>   * Writes the value specified to the offset specified.
>   */
> -void amdgpu_mm_wreg8(struct amdgpu_device *adev, uint32_t offset, uint8_t value) {
> +void amdgpu_mm_wreg8(struct amdgpu_device *adev, uint32_t offset, uint8_t value)
> +{
>         if (offset < adev->rmmio_size)
>                 writeb(value, adev->rmmio + offset);
>         else
> @@ -2989,6 +2991,7 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>         NULL
>  };
>
> +
>  /**
>   * amdgpu_device_init - initialize the driver
>   *
> @@ -3207,6 +3210,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>                 }
>         }
>
> +       pci_enable_pcie_error_reporting(adev->ddev.pdev);
> +
> +
>         /* Post card if necessary */
>         if (amdgpu_device_need_post(adev)) {
>                 if (!adev->bios) {
> @@ -4701,3 +4707,162 @@ int amdgpu_device_baco_exit(struct drm_device *dev)
>
>         return 0;
>  }
> +
> +/**
> + * amdgpu_pci_error_detected - Called when a PCI error is detected.
> + * @pdev: PCI device struct
> + * @state: PCI channel state
> + *
> + * Description: Called when a PCI error is detected.
> + *
> + * Return: PCI_ERS_RESULT_NEED_RESET or PCI_ERS_RESULT_DISCONNECT.
> + */
> +pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
> +{
> +       struct drm_device *dev = pci_get_drvdata(pdev);
> +       struct amdgpu_device *adev = drm_to_adev(dev);
> +
> +       DRM_INFO("PCI error: detected callback, state(%d)!!\n", state);
> +
> +       switch (state) {
> +       case pci_channel_io_normal:
> +               return PCI_ERS_RESULT_CAN_RECOVER;
> +       case pci_channel_io_frozen: {
> +               /* Fatal error, prepare for slot reset */
> +
> +               amdgpu_device_lock_adev(adev);
> +               return PCI_ERS_RESULT_NEED_RESET;
> +       }
> +       case pci_channel_io_perm_failure:
> +               /* Permanent error, prepare for device removal */
> +               return PCI_ERS_RESULT_DISCONNECT;
> +       }
> +       return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
> +/**
> + * amdgpu_pci_mmio_enabled - Enable MMIO and dump debug registers
> + * @pdev: pointer to PCI device
> + */
> +pci_ers_result_t amdgpu_pci_mmio_enabled(struct pci_dev *pdev)
> +{
> +
> +       DRM_INFO("PCI error: mmio enabled callback!!\n");
> +
> +       /* TODO - dump whatever for debugging purposes */
> +
> +       /* This called only if amdgpu_pci_error_detected returns
> +        * PCI_ERS_RESULT_CAN_RECOVER. Read/write to the device still
> +        * works, no need to reset slot.
> +        */
> +
> +       return PCI_ERS_RESULT_RECOVERED;
> +}
> +
> +/**
> + * amdgpu_pci_slot_reset - Called when PCI slot has been reset.
> + * @pdev: PCI device struct
> + *
> + * Description: This routine is called by the pci error recovery
> + * code after the PCI slot has been reset, just before we
> + * should resume normal operations.
> + */
> +pci_ers_result_t amdgpu_pci_slot_reset(struct pci_dev *pdev)
> +{
> +       struct drm_device *dev = pci_get_drvdata(pdev);
> +       struct amdgpu_device *adev = drm_to_adev(dev);
> +       int r;
> +       bool vram_lost;
> +
> +       DRM_INFO("PCI error: slot reset callback!!\n");
> +
> +       pci_restore_state(pdev);
> +
> +       r = amdgpu_device_ip_suspend(adev);
> +       if (r)
> +               goto out;
> +
> +
> +       /* post card */
> +       r = amdgpu_atom_asic_init(adev->mode_info.atom_context);
> +       if (r)
> +               goto out;
> +
> +       r = amdgpu_device_ip_resume_phase1(adev);
> +       if (r)
> +               goto out;
> +
> +       vram_lost = amdgpu_device_check_vram_lost(adev);
> +       if (vram_lost) {
> +               DRM_INFO("VRAM is lost due to GPU reset!\n");
> +               amdgpu_inc_vram_lost(adev);
> +       }
> +
> +       r = amdgpu_gtt_mgr_recover(
> +               &adev->mman.bdev.man[TTM_PL_TT]);
> +       if (r)
> +               goto out;
> +
> +       r = amdgpu_device_fw_loading(adev);
> +       if (r)
> +               return r;
> +
> +       r = amdgpu_device_ip_resume_phase2(adev);
> +       if (r)
> +               goto out;
> +
> +       if (vram_lost)
> +               amdgpu_device_fill_reset_magic(adev);
> +
> +       /*
> +        * Add this ASIC as tracked as reset was already
> +        * complete successfully.
> +        */
> +       amdgpu_register_gpu_instance(adev);
> +
> +       r = amdgpu_device_ip_late_init(adev);
> +       if (r)
> +               goto out;
> +
> +       amdgpu_fbdev_set_suspend(adev, 0);
> +
> +       /* must succeed. */
> +       amdgpu_ras_resume(adev);
> +
> +
> +       amdgpu_irq_gpu_reset_resume_helper(adev);
> +       r = amdgpu_ib_ring_tests(adev);
> +       if (r)
> +               goto out;
> +
> +       r = amdgpu_device_recover_vram(adev);
> +
> +out:
> +
> +       if (!r)
> +               DRM_INFO("PCIe error recovery succeeded\n");
> +       else {
> +               DRM_ERROR("PCIe error recovery failed, err:%d", r);
> +               amdgpu_device_unlock_adev(adev);
> +       }
> +
> +       return r ? PCI_ERS_RESULT_DISCONNECT : PCI_ERS_RESULT_RECOVERED;
> +}
> +
> +/**
> + * amdgpu_pci_resume() - resume normal ops after PCI reset
> + * @pdev: pointer to PCI device
> + *
> + * Called when the error recovery driver tells us that its
> + * OK to resume normal operation. Use completion to allow
> + * halted scsi ops to resume.
> + */
> +void amdgpu_pci_resume(struct pci_dev *pdev)
> +{
> +       struct drm_device *dev = pci_get_drvdata(pdev);
> +       struct amdgpu_device *adev = drm_to_adev(dev);
> +
> +       amdgpu_device_unlock_adev(adev);
> +
> +       DRM_INFO("PCI error: resume callback!!\n");
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index d984c6a..4bbcc70 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -31,7 +31,6 @@
>  #include <drm/drm_pciids.h>
>  #include <linux/console.h>
>  #include <linux/module.h>
> -#include <linux/pci.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/vga_switcheroo.h>
>  #include <drm/drm_probe_helper.h>
> @@ -1534,6 +1533,13 @@ static struct drm_driver kms_driver = {
>         .patchlevel = KMS_DRIVER_PATCHLEVEL,
>  };
>
> +static struct pci_error_handlers amdgpu_pci_err_handler = {
> +       .error_detected = amdgpu_pci_error_detected,
> +       .mmio_enabled   = amdgpu_pci_mmio_enabled,
> +       .slot_reset     = amdgpu_pci_slot_reset,
> +       .resume         = amdgpu_pci_resume,
> +};
> +
>  static struct pci_driver amdgpu_kms_pci_driver = {
>         .name = DRIVER_NAME,
>         .id_table = pciidlist,
> @@ -1541,6 +1547,7 @@ static struct pci_driver amdgpu_kms_pci_driver = {
>         .remove = amdgpu_pci_remove,
>         .shutdown = amdgpu_pci_shutdown,
>         .driver.pm = &amdgpu_pm_ops,
> +       .err_handler = &amdgpu_pci_err_handler,
>  };
>
>  static int __init amdgpu_init(void)
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
