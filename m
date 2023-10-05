Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 126687BA05D
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Oct 2023 16:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F8B10E415;
	Thu,  5 Oct 2023 14:39:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9975E10E416
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Oct 2023 14:39:29 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40684f53d11so10172825e9.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 05 Oct 2023 07:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696516768; x=1697121568; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=61NIDPIHJyV4F4bl9fgCpQR8eyCGl8s76/2KTmY/QMI=;
 b=VFhQBjY6Haqd7CKJjw5UcMhEsd2zqBLy3F/zMmnKbcu3XcZDGXChnU4z1krRUD0P54
 vyTyfSUjamHg/WZUijDnoFcYf6t4ACpvvqYWAzm7rlSx+lTXJd6Sek1rkPn8tD5uHB1t
 Id6zdjMTEXvcUnz6V51+/9HtZil4mvq+d7uARxSVoKiMrhFJPflOyC4MDd8CHP6Kqugh
 0a59By4UFFBA5hH+EA6mRT8Swz0IydxQkXNh6duxbz2eFqR1LKE4aXjUNkEbDiiAsVeo
 sHypl1W8IL5+SDYRns9fcEuhnBbamV6Iei/9HI11RUVItaGlGy7or6KlF2cbghh1kdL4
 rgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696516768; x=1697121568;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=61NIDPIHJyV4F4bl9fgCpQR8eyCGl8s76/2KTmY/QMI=;
 b=DpgYtmkvdpIo/I8Vg4k7tXIXoarmNooEV64inYqHbHt7JoyYxeMkA6Q2ODOpfpGJVA
 ctmo4ShVpbljTNNotKMtVp+OXOzo1kFdsSeOvVAi4omRD368QCC3dwiNyrEIFDcygy9E
 eD71kF4bX66dX/+hCzBqet2A2t2f4NuSf8Uc7C/WVbpISrkT98AvNBjZsQE5jliQ11s3
 nhZvXNu/+Kk/QjlOLc1O9UrDTtjo2svASXoVWp5vgsJ5So2oNOU9no9TwCYye5/zu/MV
 RlUJvuOSO6RALQ20sOD74RVQJMyH4jMoo9t5qUXW9QRIb7aD2+XBjA8vk2t6A+IzcIQH
 pc2w==
X-Gm-Message-State: AOJu0Ywn6EfChyZxBR9M3v48EIrh/xGcma2+cMhZ6rt3i2igqsOCWXLk
 EVx7BHH1UxwDW5GXDGGyzsI=
X-Google-Smtp-Source: AGHT+IFYD1GgKGSX1y9kGB9dFUlqiGCccpme4ZfLuKzGU6ouVz8Tb29H6/IMVroXsG1ySaZ3yjvuOw==
X-Received: by 2002:a7b:cd11:0:b0:405:40ec:415d with SMTP id
 f17-20020a7bcd11000000b0040540ec415dmr5010664wmj.39.1696516767439; 
 Thu, 05 Oct 2023 07:39:27 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 n1-20020adffe01000000b0031ae8d86af4sm1917540wrr.103.2023.10.05.07.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 07:39:26 -0700 (PDT)
Message-ID: <12e15ad4-cfa5-4ce9-89a4-f8d1718cb256@gmail.com>
Date: Thu, 5 Oct 2023 16:39:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/amd: Evict resources during PM ops prepare()
 callback
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20231004171838.168215-1-mario.limonciello@amd.com>
 <20231004171838.168215-2-mario.limonciello@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20231004171838.168215-2-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Harry.Wentland@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 04.10.23 um 19:18 schrieb Mario Limonciello:
> Linux PM core has a prepare() callback run before suspend.
>
> If the system is under high memory pressure, the resources may need
> to be evicted into swap instead.  If the storage backing for swap
> is offlined during the suspend() step then such a call may fail.
>
> So duplicate this step into prepare() to move evict majority of
> resources while leaving all existing steps that put the GPU into a
> low power state in suspend().
>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2362
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26 +++++++++++++++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  7 +++---
>   3 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index d23fb4b5ad95..6643d0ed6b1b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1413,6 +1413,7 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
>   void amdgpu_driver_release_kms(struct drm_device *dev);
>   
>   int amdgpu_device_ip_suspend(struct amdgpu_device *adev);
> +int amdgpu_device_prepare(struct drm_device *dev);
>   int amdgpu_device_suspend(struct drm_device *dev, bool fbcon);
>   int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
>   u32 amdgpu_get_vblank_counter_kms(struct drm_crtc *crtc);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index bad2b5577e96..67acee569c08 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4259,6 +4259,31 @@ static int amdgpu_device_evict_resources(struct amdgpu_device *adev)
>   /*
>    * Suspend & resume.
>    */
> +/**
> + * amdgpu_device_prepare - prepare for device suspend
> + *
> + * @dev: drm dev pointer
> + *
> + * Prepare to put the hw in the suspend state (all asics).
> + * Returns 0 for success or an error on failure.
> + * Called at driver suspend.
> + */
> +int amdgpu_device_prepare(struct drm_device *dev)
> +{
> +	struct amdgpu_device *adev = drm_to_adev(dev);
> +	int r;
> +
> +	if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
> +		return 0;
> +
> +	/* Evict the majority of BOs before starting suspend sequence */
> +	r = amdgpu_device_evict_resources(adev);
> +	if (r)
> +		return r;
> +
> +	return 0;
> +}
> +
>   /**
>    * amdgpu_device_suspend - initiate device suspend
>    *
> @@ -4279,7 +4304,6 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
>   
>   	adev->in_suspend = true;
>   
> -	/* Evict the majority of BOs before grabbing the full access */
>   	r = amdgpu_device_evict_resources(adev);
>   	if (r)
>   		return r;

I would just completely drop this extra amdgpu_device_evict_resources() 
call now.

We have a second call which is used to evacuate firmware etc... after 
the hw has been shut down. That one can't move, but also shouldn't 
allocate that much memory.

Regards,
Christian.

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index e3471293846f..175167582db0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2425,8 +2425,9 @@ static int amdgpu_pmops_prepare(struct device *dev)
>   	/* Return a positive number here so
>   	 * DPM_FLAG_SMART_SUSPEND works properly
>   	 */
> -	if (amdgpu_device_supports_boco(drm_dev))
> -		return pm_runtime_suspended(dev);
> +	if (amdgpu_device_supports_boco(drm_dev) &&
> +	    pm_runtime_suspended(dev))
> +		return 1;
>   
>   	/* if we will not support s3 or s2i for the device
>   	 *  then skip suspend
> @@ -2435,7 +2436,7 @@ static int amdgpu_pmops_prepare(struct device *dev)
>   	    !amdgpu_acpi_is_s3_active(adev))
>   		return 1;
>   
> -	return 0;
> +	return amdgpu_device_prepare(drm_dev);
>   }
>   
>   static void amdgpu_pmops_complete(struct device *dev)

