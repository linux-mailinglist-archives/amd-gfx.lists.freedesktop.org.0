Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 422904AEB9A
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Feb 2022 08:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC4910E44A;
	Wed,  9 Feb 2022 07:59:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E639B10E44A;
 Wed,  9 Feb 2022 07:59:14 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id e7so815403ejn.13;
 Tue, 08 Feb 2022 23:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2tr3A4Jv4+csKvCmmABWCd0dmQirkYFmlJUELoBzzRM=;
 b=Pw96S/0Pq0CG9rHKohS7bb+Zoa+BjGcKxFGW2jkjkt6t90DPDcY9Hs1W6ntv66Cmum
 7ufggJktlTDcaTd3mJdDtwsxQwRlzRqCw/utWxf6y6hbNQ3Tur7LXbkyYWs1cDS1BYCo
 4tDrnchdG/xM4YOSnemu2OAMnG0QgPaSVRmeHAbgAmQVQv9VnRDCHS0N6RZ2L6QUZK/h
 iqo1Hs4Jo4jrjAY9/axMF1056ncIhE1uCFChy19WXdzno+rN+T9Mo9g29Z5UdcFom6Yu
 T9fqjmbdmjx9JDZxt+RVnjmZuKBzaKbBlSPCV77qBtr1mL4Fw55yoGWDyJUp68byhXGI
 GHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2tr3A4Jv4+csKvCmmABWCd0dmQirkYFmlJUELoBzzRM=;
 b=1quafhDS7/NK22X7RGbRbjiUcOQlyxNJowgYSjl+5ZEgo8/rHTmnLj04xwWaL50huU
 5HinYksL+yBiHOsNNDgMzb1IiZcBrQpoWZXJ+O7/OEAAUwKfHmGw7woJS1C32O3eoeMf
 tsRikNGLELsdYw0RM/by/GAuk+iUhPzkmMOgp3hKMUDff5lFxs3rbcC6FoTDp6SFhRB/
 DhED2DYbX29WvU38rFOcALxXQza4RkxaN9//AAIzhs/L+IFuiKY0qAk/dqlcX73fL9A0
 fs+yXQUy3DSQPScw0A6QTw2U5T4gEBqG1wkALlMSNL9Bzdw0K/0QvhmVtOJvndQ7rW1z
 +94g==
X-Gm-Message-State: AOAM531dz+2N8Xzwgoy2xCeCmG1qQN3MP86u7fLQ3QefAsYW4uoMGXIH
 WdffcSNsDFHgP4DFrLcUBt9LO0SLj38=
X-Google-Smtp-Source: ABdhPJxHt2xqQAVvLzVasm9c1drrvPo7kuN+X4P2U5bvmQBLg9/tHmCIcMklIAA1w7AqyFQMf2uZKg==
X-Received: by 2002:a17:906:72db:: with SMTP id
 m27mr829884ejl.217.1644393553393; 
 Tue, 08 Feb 2022 23:59:13 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa?
 ([2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa])
 by smtp.gmail.com with ESMTPSA id u19sm5801570ejy.171.2022.02.08.23.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 23:59:13 -0800 (PST)
Message-ID: <248eba12-d2f3-2a7f-0cf1-7991abb28e49@gmail.com>
Date: Wed, 9 Feb 2022 08:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v4 08/11] drm/amdgpu: Move reset sem into reset_domain
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
 <20220209002320.6077-9-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220209002320.6077-9-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com, daniel@ffwll.ch,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 09.02.22 um 01:23 schrieb Andrey Grodzovsky:
> We want single instance of reset sem across all
> reset clients because in case of XGMI we should stop
> access cross device MMIO because any of them could be
> in a reset in the moment.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  1 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 10 ++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 23 +++++++++----------
>   .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    | 18 ++++++++-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     |  2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h     |  1 +
>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |  6 +++--
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         | 14 ++++++-----
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c         |  4 ++--
>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c         |  4 ++--
>   10 files changed, 46 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index cb9764513df8..ddfbcc8fd3d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1058,7 +1058,6 @@ struct amdgpu_device {
>   
>   	atomic_t 			in_gpu_reset;
>   	enum pp_mp1_state               mp1_state;
> -	struct rw_semaphore reset_sem;
>   	struct amdgpu_doorbell_index doorbell_index;
>   
>   	struct mutex			notifier_lock;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index 25e2e5bf90eb..c3728061d65a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -37,6 +37,8 @@
>   #include "amdgpu_fw_attestation.h"
>   #include "amdgpu_umr.h"
>   
> +#include "amdgpu_reset.h"
> +
>   #if defined(CONFIG_DEBUG_FS)
>   
>   /**
> @@ -1279,7 +1281,7 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
>   	}
>   
>   	/* Avoid accidently unparking the sched thread during GPU reset */
> -	r = down_write_killable(&adev->reset_sem);
> +	r = down_write_killable(&adev->reset_domain->sem);
>   	if (r)
>   		return r;
>   
> @@ -1308,7 +1310,7 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
>   		kthread_unpark(ring->sched.thread);
>   	}
>   
> -	up_write(&adev->reset_sem);
> +	up_write(&adev->reset_domain->sem);
>   
>   	pm_runtime_mark_last_busy(dev->dev);
>   	pm_runtime_put_autosuspend(dev->dev);
> @@ -1517,7 +1519,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
>   		return -ENOMEM;
>   
>   	/* Avoid accidently unparking the sched thread during GPU reset */
> -	r = down_read_killable(&adev->reset_sem);
> +	r = down_read_killable(&adev->reset_domain->sem);
>   	if (r)
>   		goto pro_end;
>   
> @@ -1560,7 +1562,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
>   	/* restart the scheduler */
>   	kthread_unpark(ring->sched.thread);
>   
> -	up_read(&adev->reset_sem);
> +	up_read(&adev->reset_domain->sem);
>   
>   	ttm_bo_unlock_delayed_workqueue(&adev->mman.bdev, resched);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index d61bc0a0457c..dcbb175d336f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -424,10 +424,10 @@ bool amdgpu_device_skip_hw_access(struct amdgpu_device *adev)
>   	 * the lock.
>   	 */
>   	if (in_task()) {
> -		if (down_read_trylock(&adev->reset_sem))
> -			up_read(&adev->reset_sem);
> +		if (down_read_trylock(&adev->reset_domain->sem))
> +			up_read(&adev->reset_domain->sem);
>   		else
> -			lockdep_assert_held(&adev->reset_sem);
> +			lockdep_assert_held(&adev->reset_domain->sem);
>   	}
>   #endif
>   	return false;
> @@ -453,9 +453,9 @@ uint32_t amdgpu_device_rreg(struct amdgpu_device *adev,
>   	if ((reg * 4) < adev->rmmio_size) {
>   		if (!(acc_flags & AMDGPU_REGS_NO_KIQ) &&
>   		    amdgpu_sriov_runtime(adev) &&
> -		    down_read_trylock(&adev->reset_sem)) {
> +		    down_read_trylock(&adev->reset_domain->sem)) {
>   			ret = amdgpu_kiq_rreg(adev, reg);
> -			up_read(&adev->reset_sem);
> +			up_read(&adev->reset_domain->sem);
>   		} else {
>   			ret = readl(((void __iomem *)adev->rmmio) + (reg * 4));
>   		}
> @@ -538,9 +538,9 @@ void amdgpu_device_wreg(struct amdgpu_device *adev,
>   	if ((reg * 4) < adev->rmmio_size) {
>   		if (!(acc_flags & AMDGPU_REGS_NO_KIQ) &&
>   		    amdgpu_sriov_runtime(adev) &&
> -		    down_read_trylock(&adev->reset_sem)) {
> +		    down_read_trylock(&adev->reset_domain->sem)) {
>   			amdgpu_kiq_wreg(adev, reg, v);
> -			up_read(&adev->reset_sem);
> +			up_read(&adev->reset_domain->sem);
>   		} else {
>   			writel(v, ((void __iomem *)adev->rmmio) + (reg * 4));
>   		}
> @@ -3555,7 +3555,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	mutex_init(&adev->virt.vf_errors.lock);
>   	hash_init(adev->mn_hash);
>   	atomic_set(&adev->in_gpu_reset, 0);
> -	init_rwsem(&adev->reset_sem);
>   	mutex_init(&adev->psp.mutex);
>   	mutex_init(&adev->notifier_lock);
>   
> @@ -4833,9 +4832,9 @@ static void amdgpu_device_lock_adev(struct amdgpu_device *adev,
>   	atomic_set(&adev->in_gpu_reset, 1);
>   
>   	if (hive) {
> -		down_write_nest_lock(&adev->reset_sem, &hive->hive_lock);
> +		down_write_nest_lock(&adev->reset_domain->sem, &hive->hive_lock);
>   	} else {
> -		down_write(&adev->reset_sem);
> +		down_write(&adev->reset_domain->sem);
>   	}
>   
>   	switch (amdgpu_asic_reset_method(adev)) {
> @@ -4856,7 +4855,7 @@ static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
>   	amdgpu_vf_error_trans_all(adev);
>   	adev->mp1_state = PP_MP1_STATE_NONE;
>   	atomic_set(&adev->in_gpu_reset, 0);
> -	up_write(&adev->reset_sem);
> +	up_write(&adev->reset_domain->sem);
>   }
>   
>   static void amdgpu_device_resume_display_audio(struct amdgpu_device *adev)
> @@ -5476,7 +5475,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
>   	/* Fatal error, prepare for slot reset */
>   	case pci_channel_io_frozen:
>   		/*
> -		 * Locking adev->reset_sem will prevent any external access
> +		 * Locking adev->reset_domain->sem will prevent any external access
>   		 * to GPU during PCI error recovery
>   		 */
>   		amdgpu_device_lock_adev(adev, NULL);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> index 05117eda105b..d3e055314804 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> @@ -31,6 +31,8 @@
>   #include <linux/debugfs.h>
>   #include <linux/uaccess.h>
>   
> +#include "amdgpu_reset.h"
> +
>   #define EEPROM_I2C_MADDR_VEGA20         0x0
>   #define EEPROM_I2C_MADDR_ARCTURUS       0x40000
>   #define EEPROM_I2C_MADDR_ARCTURUS_D342  0x0
> @@ -193,12 +195,12 @@ static int __write_table_header(struct amdgpu_ras_eeprom_control *control)
>   	__encode_table_header_to_buf(&control->tbl_hdr, buf);
>   
>   	/* i2c may be unstable in gpu reset */
> -	down_read(&adev->reset_sem);
> +	down_read(&adev->reset_domain->sem);
>   	res = amdgpu_eeprom_write(&adev->pm.smu_i2c,
>   				  control->i2c_address +
>   				  control->ras_header_offset,
>   				  buf, RAS_TABLE_HEADER_SIZE);
> -	up_read(&adev->reset_sem);
> +	up_read(&adev->reset_domain->sem);
>   
>   	if (res < 0) {
>   		DRM_ERROR("Failed to write EEPROM table header:%d", res);
> @@ -387,13 +389,13 @@ static int __amdgpu_ras_eeprom_write(struct amdgpu_ras_eeprom_control *control,
>   	int res;
>   
>   	/* i2c may be unstable in gpu reset */
> -	down_read(&adev->reset_sem);
> +	down_read(&adev->reset_domain->sem);
>   	buf_size = num * RAS_TABLE_RECORD_SIZE;
>   	res = amdgpu_eeprom_write(&adev->pm.smu_i2c,
>   				  control->i2c_address +
>   				  RAS_INDEX_TO_OFFSET(control, fri),
>   				  buf, buf_size);
> -	up_read(&adev->reset_sem);
> +	up_read(&adev->reset_domain->sem);
>   	if (res < 0) {
>   		DRM_ERROR("Writing %d EEPROM table records error:%d",
>   			  num, res);
> @@ -547,12 +549,12 @@ amdgpu_ras_eeprom_update_header(struct amdgpu_ras_eeprom_control *control)
>   		goto Out;
>   	}
>   
> -	down_read(&adev->reset_sem);
> +	down_read(&adev->reset_domain->sem);
>   	res = amdgpu_eeprom_read(&adev->pm.smu_i2c,
>   				 control->i2c_address +
>   				 control->ras_record_offset,
>   				 buf, buf_size);
> -	up_read(&adev->reset_sem);
> +	up_read(&adev->reset_domain->sem);
>   	if (res < 0) {
>   		DRM_ERROR("EEPROM failed reading records:%d\n",
>   			  res);
> @@ -642,13 +644,13 @@ static int __amdgpu_ras_eeprom_read(struct amdgpu_ras_eeprom_control *control,
>   	int res;
>   
>   	/* i2c may be unstable in gpu reset */
> -	down_read(&adev->reset_sem);
> +	down_read(&adev->reset_domain->sem);
>   	buf_size = num * RAS_TABLE_RECORD_SIZE;
>   	res = amdgpu_eeprom_read(&adev->pm.smu_i2c,
>   				 control->i2c_address +
>   				 RAS_INDEX_TO_OFFSET(control, fri),
>   				 buf, buf_size);
> -	up_read(&adev->reset_sem);
> +	up_read(&adev->reset_domain->sem);
>   	if (res < 0) {
>   		DRM_ERROR("Reading %d EEPROM table records error:%d",
>   			  num, res);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 91864947063f..c0988c804459 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -131,6 +131,8 @@ struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum amdgpu_reset_d
>   
>   	}
>   
> +	init_rwsem(&reset_domain->sem);
> +
>   	return reset_domain;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index cc625e441fa0..80f918e87d4f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -80,6 +80,7 @@ struct amdgpu_reset_domain {
>   	struct kref refcount;
>   	struct workqueue_struct *wq;
>   	enum amdgpu_reset_domain_type type;
> +	struct rw_semaphore sem;
>   };
>   
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> index 38bb42727715..222b1da9d601 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -48,6 +48,8 @@
>   #include "athub_v2_0.h"
>   #include "athub_v2_1.h"
>   
> +#include "amdgpu_reset.h"
> +
>   #if 0
>   static const struct soc15_reg_golden golden_settings_navi10_hdp[] =
>   {
> @@ -328,7 +330,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   	 */
>   	if (adev->gfx.kiq.ring.sched.ready &&
>   	    (amdgpu_sriov_runtime(adev) || !amdgpu_sriov_vf(adev)) &&
> -	    down_read_trylock(&adev->reset_sem)) {
> +	    down_read_trylock(&adev->reset_domain->sem)) {
>   		struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
>   		const unsigned eng = 17;
>   		u32 inv_req = hub->vmhub_funcs->get_invalidate_req(vmid, flush_type);
> @@ -338,7 +340,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   		amdgpu_virt_kiq_reg_write_reg_wait(adev, req, ack, inv_req,
>   				1 << vmid);
>   
> -		up_read(&adev->reset_sem);
> +		up_read(&adev->reset_domain->sem);
>   		return;
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index 88c1eb9ad068..3a5efe969735 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -62,6 +62,8 @@
>   #include "amdgpu_ras.h"
>   #include "amdgpu_xgmi.h"
>   
> +#include "amdgpu_reset.h"
> +
>   /* add these here since we already include dce12 headers and these are for DCN */
>   #define mmHUBP0_DCSURF_PRI_VIEWPORT_DIMENSION                                                          0x055d
>   #define mmHUBP0_DCSURF_PRI_VIEWPORT_DIMENSION_BASE_IDX                                                 2
> @@ -787,13 +789,13 @@ static void gmc_v9_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   	 */
>   	if (adev->gfx.kiq.ring.sched.ready &&
>   	    (amdgpu_sriov_runtime(adev) || !amdgpu_sriov_vf(adev)) &&
> -	    down_read_trylock(&adev->reset_sem)) {
> +	    down_read_trylock(&adev->reset_domain->sem)) {
>   		uint32_t req = hub->vm_inv_eng0_req + hub->eng_distance * eng;
>   		uint32_t ack = hub->vm_inv_eng0_ack + hub->eng_distance * eng;
>   
>   		amdgpu_virt_kiq_reg_write_reg_wait(adev, req, ack, inv_req,
>   						   1 << vmid);
> -		up_read(&adev->reset_sem);
> +		up_read(&adev->reset_domain->sem);
>   		return;
>   	}
>   
> @@ -900,7 +902,7 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
>   	if (amdgpu_in_reset(adev))
>   		return -EIO;
>   
> -	if (ring->sched.ready && down_read_trylock(&adev->reset_sem)) {
> +	if (ring->sched.ready && down_read_trylock(&adev->reset_domain->sem)) {
>   		/* Vega20+XGMI caches PTEs in TC and TLB. Add a
>   		 * heavy-weight TLB flush (type 2), which flushes
>   		 * both. Due to a race condition with concurrent
> @@ -927,7 +929,7 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
>   		if (r) {
>   			amdgpu_ring_undo(ring);
>   			spin_unlock(&adev->gfx.kiq.ring_lock);
> -			up_read(&adev->reset_sem);
> +			up_read(&adev->reset_domain->sem);
>   			return -ETIME;
>   		}
>   
> @@ -936,10 +938,10 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
>   		r = amdgpu_fence_wait_polling(ring, seq, adev->usec_timeout);
>   		if (r < 1) {
>   			dev_err(adev->dev, "wait for kiq fence error: %ld.\n", r);
> -			up_read(&adev->reset_sem);
> +			up_read(&adev->reset_domain->sem);
>   			return -ETIME;
>   		}
> -		up_read(&adev->reset_sem);
> +		up_read(&adev->reset_domain->sem);
>   		return 0;
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> index 6740eef84ee1..4e23c29e665c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> @@ -262,7 +262,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
>   	if (atomic_cmpxchg(&adev->in_gpu_reset, 0, 1) != 0)
>   		return;
>   
> -	down_write(&adev->reset_sem);
> +	down_write(&adev->reset_domain->sem);
>   
>   	amdgpu_virt_fini_data_exchange(adev);
>   
> @@ -278,7 +278,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
>   
>   flr_done:
>   	atomic_set(&adev->in_gpu_reset, 0);
> -	up_write(&adev->reset_sem);
> +	up_write(&adev->reset_domain->sem);
>   
>   	/* Trigger recovery for world switch failure if no TDR */
>   	if (amdgpu_device_should_recover_gpu(adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> index e967d61c7134..f715780f7d20 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> @@ -286,7 +286,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
>   	if (atomic_cmpxchg(&adev->in_gpu_reset, 0, 1) != 0)
>   		return;
>   
> -	down_write(&adev->reset_sem);
> +	down_write(&adev->reset_domain->sem);
>   
>   	amdgpu_virt_fini_data_exchange(adev);
>   
> @@ -302,7 +302,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
>   
>   flr_done:
>   	atomic_set(&adev->in_gpu_reset, 0);
> -	up_write(&adev->reset_sem);
> +	up_write(&adev->reset_domain->sem);
>   
>   	/* Trigger recovery for world switch failure if no TDR */
>   	if (amdgpu_device_should_recover_gpu(adev)

