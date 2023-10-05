Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9637BA058
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Oct 2023 16:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDF010E079;
	Thu,  5 Oct 2023 14:36:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF8E10E079
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Oct 2023 14:36:44 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4054f790190so10066935e9.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 05 Oct 2023 07:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696516603; x=1697121403; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e8TV6QJsTS6z9lMh0FypLyUznrqJ68GQo0/EK4OU034=;
 b=ihvuIam/BbKBmfvPwomVR6HxSbqA0biUxrY0Sv2C7hV4NkjbTRYAoPyIm13aMg2ILO
 N/5MEQttdRl/iN10B3WwKpjUagnqZAVY3jM/7k90Hd+7rXtpKnNnVzpvcyKsnoDG0C8y
 21FVlfvGsj/I8MkWjQEdYiXXLlVKIQ1SlgsKopPAWucV7LE+jyiI6fruSGTQFn0m3JeM
 mn+ISwvBBQhgIUfCRyLU6xRLP4QHs9V3Ru04nEytNT3bAC7vmAOe2RL/rqhuhOUOoeG5
 G8a368Z8zN2TD6MHFAoe44aG+CYi47EpAMcnLPuZTLNF/wu3VvcZAZYRMWdEBVbx1y/Q
 tQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696516603; x=1697121403;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e8TV6QJsTS6z9lMh0FypLyUznrqJ68GQo0/EK4OU034=;
 b=oNkyZVEZyuaCeZYDZsHDY8tKf8atJLXEgQMz+7fS6SbrlVj707tkB/mpXBzwPkve4a
 3IsCs/V66y5Qm4BPS7s7fQMmdzvCd8UHav0qRfU8oLV8SP9iqzAWiJpf0Jq5dkw+gzHC
 JljoQgsoC2QqrnK6/oZQE6InM32MFU3RYVIm4jltO77mF87+FqwEupA/hEptpQXwZmh5
 q/VLZTXceT7JBQX40q042NalWzCWLS+m+jWMJbcNLwYOnKkn1bpIY1nCIyzALmwGzPAR
 qAvKS0eIsLgpZMdAxuA7a+d6dx/OlZh5vZgXugY4MDWGrrzWmTWPUV5lyiIOrkkqO6K9
 pQKw==
X-Gm-Message-State: AOJu0Yw8Dk9xdAghn0MLicRrDU2PjpQwiipGmqDFPfNrgJxdQ9GlSmre
 11mifReUXDzDQedVmTuOQrBKpcU7X6A=
X-Google-Smtp-Source: AGHT+IH1fsA6wJmRVqmRnpF8LqhzCIbSi+/EEnzX9gl0ppzMKJpvDLyaPx7VonaozcZz03e7PW72WQ==
X-Received: by 2002:adf:f804:0:b0:324:647e:a8b3 with SMTP id
 s4-20020adff804000000b00324647ea8b3mr5071531wrp.14.1696516602859; 
 Thu, 05 Oct 2023 07:36:42 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a056000018e00b0031984b370f2sm1940757wrx.47.2023.10.05.07.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 07:36:42 -0700 (PDT)
Message-ID: <42eb5748-0a1c-4044-b670-95ab08c0c10a@gmail.com>
Date: Thu, 5 Oct 2023 16:36:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: update ib start and size alignment
Content-Language: en-US
To: boyuan.zhang@amd.com, amd-gfx@lists.freedesktop.org
References: <20231005134906.58141-1-boyuan.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20231005134906.58141-1-boyuan.zhang@amd.com>
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 05.10.23 um 15:49 schrieb boyuan.zhang@amd.com:
> From: Boyuan Zhang <boyuan.zhang@amd.com>
>
> Update IB starting address alignment and size alignment with correct values
> for decode and encode IPs.
>
> Decode IB starting address alignment: 256 bytes
> Decode IB size alignment: 64 bytes
> Encode IB starting address alignment: 256 bytes
> Encode IB size alignment: 4 bytes
>
> Also bump amdgpu driver version for this update.
>
> Signed-off-by: Boyuan Zhang <boyuan.zhang@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 22 +++++++++++-----------
>   2 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index e3471293846f..9e345d503a47 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -113,9 +113,10 @@
>    *            gl1c_cache_size, gl2c_cache_size, mall_size, enabled_rb_pipes_mask_hi
>    *   3.53.0 - Support for GFX11 CP GFX shadowing
>    *   3.54.0 - Add AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS support
> + *   3.55.0 - Update IB start address and size alignment for decode and encode
>    */
>   #define KMS_DRIVER_MAJOR	3
> -#define KMS_DRIVER_MINOR	54
> +#define KMS_DRIVER_MINOR	55
>   #define KMS_DRIVER_PATCHLEVEL	0
>   
>   /*
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 081bd28e2443..96db51765a6c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -447,7 +447,7 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
>   			if (adev->uvd.inst[i].ring.sched.ready)
>   				++num_rings;
>   		}
> -		ib_start_alignment = 64;
> +		ib_start_alignment = 256;
>   		ib_size_alignment = 64;
>   		break;
>   	case AMDGPU_HW_IP_VCE:
> @@ -455,8 +455,8 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
>   		for (i = 0; i < adev->vce.num_rings; i++)
>   			if (adev->vce.ring[i].sched.ready)
>   				++num_rings;
> -		ib_start_alignment = 4;
> -		ib_size_alignment = 1;
> +		ib_start_alignment = 256;
> +		ib_size_alignment = 4;
>   		break;
>   	case AMDGPU_HW_IP_UVD_ENC:
>   		type = AMD_IP_BLOCK_TYPE_UVD;
> @@ -468,8 +468,8 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
>   				if (adev->uvd.inst[i].ring_enc[j].sched.ready)
>   					++num_rings;
>   		}
> -		ib_start_alignment = 64;
> -		ib_size_alignment = 64;
> +		ib_start_alignment = 256;
> +		ib_size_alignment = 4;
>   		break;
>   	case AMDGPU_HW_IP_VCN_DEC:
>   		type = AMD_IP_BLOCK_TYPE_VCN;
> @@ -480,8 +480,8 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
>   			if (adev->vcn.inst[i].ring_dec.sched.ready)
>   				++num_rings;
>   		}
> -		ib_start_alignment = 16;
> -		ib_size_alignment = 16;
> +		ib_start_alignment = 256;
> +		ib_size_alignment = 64;
>   		break;
>   	case AMDGPU_HW_IP_VCN_ENC:
>   		type = AMD_IP_BLOCK_TYPE_VCN;
> @@ -493,8 +493,8 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
>   				if (adev->vcn.inst[i].ring_enc[j].sched.ready)
>   					++num_rings;
>   		}
> -		ib_start_alignment = 64;
> -		ib_size_alignment = 1;
> +		ib_start_alignment = 256;
> +		ib_size_alignment = 4;
>   		break;
>   	case AMDGPU_HW_IP_VCN_JPEG:
>   		type = (amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_JPEG)) ?
> @@ -508,8 +508,8 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
>   				if (adev->jpeg.inst[i].ring_dec[j].sched.ready)
>   					++num_rings;
>   		}
> -		ib_start_alignment = 16;
> -		ib_size_alignment = 16;
> +		ib_start_alignment = 256;
> +		ib_size_alignment = 64;
>   		break;
>   	case AMDGPU_HW_IP_VPE:
>   		type = AMD_IP_BLOCK_TYPE_VPE;

