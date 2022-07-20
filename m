Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 303B157B6BD
	for <lists+amd-gfx@lfdr.de>; Wed, 20 Jul 2022 14:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A88A8BEF1;
	Wed, 20 Jul 2022 12:48:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CB58BF03
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 Jul 2022 12:48:42 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id v5so2052454wmj.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 Jul 2022 05:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=N0NhBkqxV47ixs4cJqS9/L9EhMR2ivQoVF/AlzDACj8=;
 b=hEMZEnw1oqAXO4pwdHssK9rVg42LxkOyaR2js3MNiPk8+zvn4VEE+lplKrkF+wuS3u
 FNnppVxDOVEVQDCreOwRRznGm9xvegarv+vb4nacckyCrTRyVJlgU0UUPoUHm0N8CsWi
 xC78+Jxg/nJg/sVCLZciA4yJER8Wegq0mNgHKEhu2bHBKGKeHQDDuyoQfcU7JLKcpmY4
 0DQ7Qiab1hRA3MmBM5XTka/KXOKCZj92F/2tlYKt0PYXz6ffDtNCvHF+7TDPr+HD4sa+
 Z6MEGgmuzUeN45Hrnqf/EPb4eCAP/OT5T8sx9ksEIx6g4XsAKcWkX6E0/K/+b8ySSmJi
 sgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N0NhBkqxV47ixs4cJqS9/L9EhMR2ivQoVF/AlzDACj8=;
 b=OWItmMp8UZX/Mdm0/RXM7TnU1ihmlZTjQVSvYkzPj/VL0CGU2dYTyBrPnqqiWEYgnu
 Twck0HKNzyI40No6r2mWwqTAG5FM3NI9F1BTLP4TNq7kxCAcL7yxoXRLD8ZhfbYDi/Fx
 o/4R0WY02pFAWsv6FVRmbBCkMkvIPAwwmTdN/F6ZEOpqmSFME1zuBPFYuUiK9ybKnkl8
 6Yfgi6ooQ8hXvmVQNT+HWizw1Xai1FQGKWb8+PcnmuL0zdKnN/mxJ7Yv6h58t9wR0d5f
 tbwkVpIoM0g71cBNR4qYYQJewuWTj/29tIJidFbSs/liA/nXJrjgjKZRZjEZIl4S0upv
 8tDg==
X-Gm-Message-State: AJIora8kCZzshOVAR21HwqDUOwXiPVZEQD5nLnoAp/t2KZyTlU90jmNJ
 z7wUKYSeiUubv8kpErQrvRZfUhAUgEM=
X-Google-Smtp-Source: AGRyM1ucMg73Y/fw0SPuCJSLwKKhwc53JomPA40WvEmKeer0/KrSeOre6kW7DtpMSVvOD22sp033GA==
X-Received: by 2002:a05:600c:3ac4:b0:3a3:19c5:7cb2 with SMTP id
 d4-20020a05600c3ac400b003a319c57cb2mr3661687wms.63.1658321320985; 
 Wed, 20 Jul 2022 05:48:40 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:c3a3:a774:9c4e:7491?
 ([2a02:908:1256:79a0:c3a3:a774:9c4e:7491])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a05600c351500b003a31df6af2esm3111352wmq.1.2022.07.20.05.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 05:48:40 -0700 (PDT)
Message-ID: <4adb712e-f310-580a-bb00-7ab0cd73c104@gmail.com>
Date: Wed, 20 Jul 2022 14:48:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amdgpu: Fix the incomplete product number
Content-Language: en-US
To: Roy Sun <Roy.Sun@amd.com>, amd-gfx@lists.freedesktop.org
References: <20220720082659.49637-1-Roy.Sun@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220720082659.49637-1-Roy.Sun@amd.com>
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

Am 20.07.22 um 10:26 schrieb Roy Sun:
> The comments say that the product number is a 16-digit HEX string so the
> buffer needs to be at least 17 characters to hold the NUL terminator.
>
> Signed-off-by: Roy Sun <Roy.Sun@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 9f729a648005..187e3dae3965 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1019,7 +1019,7 @@ struct amdgpu_device {
>   	bool                            psp_sysfs_en;
>   
>   	/* Chip product information */
> -	char				product_number[16];
> +	char				product_number[20];
>   	char				product_name[AMDGPU_PRODUCT_NAME_LEN];
>   	char				serial[20];
>   

