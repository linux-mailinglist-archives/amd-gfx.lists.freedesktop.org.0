Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DF519DA51
	for <lists+amd-gfx@lfdr.de>; Fri,  3 Apr 2020 17:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B666EC13;
	Fri,  3 Apr 2020 15:37:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273C26EC13
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 Apr 2020 15:37:30 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id i19so8225670wmb.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 03 Apr 2020 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9zTtf91Ecf9g6VT1CFgFfsMJUQhMbJfgtLEHGxRwQpc=;
 b=qHIFLwMLE3r80/JNwc/1u1CFEhXzsjXxe7KQKxwxCKiUBanQYoIz/Ut0hBRrpwInaT
 d9yjy6K1CynbeWAoef5OpnKDdCdgfg6077BZL6vLIRg9C1tmN8p25sB6+2ebyRqXOZNS
 c+UeeDTJYIJnel2wqLfft1kWAYfHOQ4xCPwDoWgM4Sxh0GT2RNLwTeTcDDf28pC3mXIg
 NW/CemlAmJ42Fg3CetIjlFZ7Shp2JgbtRt5j5SDivtd+fuiL+pyP8hDJGMZn3QPBJyJ3
 hykDg/DpFrtgwOjtVsr7IzYCCmCEbmeknoecTGt0voXn0uhx9MKTKqNQAAsQpo6HQnCP
 FFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9zTtf91Ecf9g6VT1CFgFfsMJUQhMbJfgtLEHGxRwQpc=;
 b=tCrM25pzjxigpjZCLRlxeCdfJXvrFzo5Fy/4CnEOtjGDN5ylN4C9hMOwVF4+KhCaNx
 iRe8SnYKvaJJttXwx8GQmd1aK4dZ56JYjpdkFMXDsb4ItyylY+46Dyf6tmip02TOm/5Q
 AJBAxOwf8ryt1xXAR8p3sKB1zVP/2Bt+BoNLQ3AFs7l+hN0u7lJt763vAYlxDkJQGvm5
 0QEIBTFUy9Lqcy/c/NFVRqkoCTVMWH8s51xyjpr8LsCQDAMkb/RNs1zj4DCpmg4dIycV
 VBRJ62DC9UItI1HKei3Mfx6BxOjgcBNogUmkqk+v/aJTS/eQJOB//Mou+Vn0Jgouexcv
 lgPA==
X-Gm-Message-State: AGi0Pubn2uQMJZsvlSkcawY5mdMzyw6id1FoqG6TgJR8X88lyuXKChWM
 pguZAQGT4J0E/f3A4KZhGvxY8WwjWKvuE2OYZA/YBw==
X-Google-Smtp-Source: APiQypIdh5NzbYBB71u8dvIGysbiB4YlyqCcaZWm3FfBn6t9QwAJlDxhCToofw/Zo6MMJZb/MU1HUlSA0mzuhh5Jy4M=
X-Received: by 2002:a05:600c:3d1:: with SMTP id
 z17mr9434191wmd.56.1585928248845; 
 Fri, 03 Apr 2020 08:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <1585918324-16780-1-git-send-email-James.Zhu@amd.com>
In-Reply-To: <1585918324-16780-1-git-send-email-James.Zhu@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 3 Apr 2020 11:37:17 -0400
Message-ID: <CADnq5_OwEiyjtfoy4ri+wMt9KTL7cZirrKJFhsQmYncPHSeH-g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/vcn: add shared menory restore after wake up
 from sleep.
To: James Zhu <James.Zhu@amd.com>
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
Cc: "Li, Pauline" <Pauline.Li@amd.com>, James Zhu <jamesz@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 8:52 AM James Zhu <James.Zhu@amd.com> wrote:
>
> VCN shared memory needs restore after wake up during S3 test.

How big is the shared memory?  It might be better to allocate the
memory once at sw_init and then free it in sw_fini rather than
allocating and freeing in every suspend/resume.

Alex

>
> Signed-off-by: James Zhu <James.Zhu@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |  1 +
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index d653a18..5891390 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -205,6 +205,7 @@ int amdgpu_vcn_sw_fini(struct amdgpu_device *adev)
>                 if (adev->vcn.harvest_config & (1 << j))
>                         continue;
>
> +               kvfree(adev->vcn.inst[j].saved_shm_bo);
>                 amdgpu_bo_free_kernel(&adev->vcn.inst[j].fw_shared_bo,
>                                           &adev->vcn.inst[j].fw_shared_gpu_addr,
>                                           (void **)&adev->vcn.inst[j].fw_shared_cpu_addr);
> @@ -254,6 +255,18 @@ int amdgpu_vcn_suspend(struct amdgpu_device *adev)
>                         return -ENOMEM;
>
>                 memcpy_fromio(adev->vcn.inst[i].saved_bo, ptr, size);
> +
> +               if (adev->vcn.inst[i].fw_shared_bo == NULL)
> +                       return 0;
> +
> +               size = amdgpu_bo_size(adev->vcn.inst[i].fw_shared_bo);
> +               ptr = adev->vcn.inst[i].fw_shared_cpu_addr;
> +
> +               adev->vcn.inst[i].saved_shm_bo = kvmalloc(size, GFP_KERNEL);
> +               if (!adev->vcn.inst[i].saved_shm_bo)
> +                       return -ENOMEM;
> +
> +               memcpy_fromio(adev->vcn.inst[i].saved_shm_bo, ptr, size);
>         }
>         return 0;
>  }
> @@ -291,6 +304,19 @@ int amdgpu_vcn_resume(struct amdgpu_device *adev)
>                         }
>                         memset_io(ptr, 0, size);
>                 }
> +
> +               if (adev->vcn.inst[i].fw_shared_bo == NULL)
> +                       return -EINVAL;
> +
> +               size = amdgpu_bo_size(adev->vcn.inst[i].fw_shared_bo);
> +               ptr = adev->vcn.inst[i].fw_shared_cpu_addr;
> +
> +               if (adev->vcn.inst[i].saved_shm_bo != NULL) {
> +                       memcpy_toio(ptr, adev->vcn.inst[i].saved_shm_bo, size);
> +                       kvfree(adev->vcn.inst[i].saved_shm_bo);
> +                       adev->vcn.inst[i].saved_shm_bo = NULL;
> +               } else
> +                       memset_io(ptr, 0, size);
>         }
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> index f739e1a..bd77dae 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> @@ -194,6 +194,7 @@ struct amdgpu_vcn_inst {
>         atomic_t                dpg_enc_submission_cnt;
>         void                    *fw_shared_cpu_addr;
>         uint64_t                fw_shared_gpu_addr;
> +       void                    *saved_shm_bo;
>  };
>
>  struct amdgpu_vcn {
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
