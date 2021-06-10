Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9183A34CA
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Jun 2021 22:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1C16EDD6;
	Thu, 10 Jun 2021 20:26:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040626EDD6
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Jun 2021 20:26:18 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id r17so3480784oic.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Jun 2021 13:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oiiy44tx6UvIpGu7+s1ovVJdOCp2amgVtM4HYv6jA5A=;
 b=MPOy2ViSlvYmgjL5FmLShoBjoCjV76mAhFu3wj3XZdiedLkf5RbCSvUvYXcIMJhRL5
 Hlsq47iLbGJeLYdjXqJ9GNVFCjhBPKIBJKS1zJpe2CQ1hK+GaPLnSYYH7AXhQ1slj3Ak
 23FOrlUh2rGSC/O2esyarupF8nAcPZyf5YF6fLmH3RRIHCf27EMbErYanCd0bp7S+Tgk
 zT9u2fKdjtZfqTWBHICf7fXHaYP316JUvlqT6ICe9nwlWVpYPpm/gfcxmxg25kX/m5OT
 0hlYvL6BVzdzHBbH8+xsbny/1FF5ADWv3DzlBcs6bTTmV+am9ncqIIEv+7aqcUnamuvl
 +A8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oiiy44tx6UvIpGu7+s1ovVJdOCp2amgVtM4HYv6jA5A=;
 b=uiGN9PgPUDG7zjY+caDzF9U451A5zwvjU6Kq5F3S/ym7XkUoNr2bPTzvIxqLQYgz2E
 nA8JOQwcwc+bRKIxIBiT6R5ECpJ/JEz3ruvrIwcsKGE6XTlJvssF/7AMWosqyiD1wn9S
 7QKXOFH/CNXLVscp1Yv89oWqrt64DpP4kfjbYrtAJdxaVsmSVl767ymUFYbrKm3Z3ALj
 RCTEVLxVfA1UyxjrErZUMj50cneQ1ILcCLeXVAYsF5rcLmT/yztU9CYSayU+ggvK/QwP
 bqg41i1tn+Y2SvgGdcsd0O7xmbJBK3dnmvNk/6bpViqgJ1xgjexRbd8eSE93d63wfdYv
 /hIA==
X-Gm-Message-State: AOAM530YLwFtHVCaj+9eHH1y+4EG95nBOg/HGle+bf58jgaevcHr+R2g
 hd9RSji0eTkepbIyscyNUUXG0yO85XMOkzFHbj62EHex3Y8=
X-Google-Smtp-Source: ABdhPJyRIhupEiNb4lRXrbuVrGkvJ9W7HWCSdxzV1NvbZWLk+n8ze5iRxn9R3OrKx7LE/tB3ZXlf0V4/v8KWXn3Ip/k=
X-Received: by 2002:a05:6808:999:: with SMTP id
 a25mr174008oic.123.1623356777468; 
 Thu, 10 Jun 2021 13:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210608213954.5517-1-luben.tuikov@amd.com>
 <20210608213954.5517-18-luben.tuikov@amd.com>
In-Reply-To: <20210608213954.5517-18-luben.tuikov@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Jun 2021 16:26:06 -0400
Message-ID: <CADnq5_NqX866Feg6DzvuwbJbFfAhNipNt6dNzYcymLLjQYxOUg@mail.gmail.com>
Subject: Re: [PATCH 17/40] drm/amdgpu/pm: ADD I2C quirk adapter table
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lijo Lazar <Lijo.Lazar@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Stanley Yang <Stanley.Yang@amd.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, Jean Delvare <jdelvare@suse.de>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Jun 8, 2021 at 5:40 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>
> To be used by kernel clients of the adapter.
>
> Cc: Jean Delvare <jdelvare@suse.de>
> Cc: Alexander Deucher <Alexander.Deucher@amd.com>
> Cc: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
> Cc: Lijo Lazar <Lijo.Lazar@amd.com>
> Cc: Stanley Yang <Stanley.Yang@amd.com>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Suggested-by: Lazar Lijo <Lijo.Lazar@amd.com>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c       | 7 +++++++
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c         | 6 ++++++
>  drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 6 ++++++
>  3 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> index 409299a608e1b3..c2d6d7c8129593 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> @@ -2004,6 +2004,12 @@ static const struct i2c_algorithm arcturus_i2c_algo = {
>         .functionality = arcturus_i2c_func,
>  };
>
> +
> +static const struct i2c_adapter_quirks arcturus_i2c_control_quirks = {
> +       .max_read_len = MAX_SW_I2C_COMMANDS,
> +       .max_write_len = MAX_SW_I2C_COMMANDS,
> +};
> +
>  static int arcturus_i2c_control_init(struct smu_context *smu, struct i2c_adapter *control)
>  {
>         struct amdgpu_device *adev = to_amdgpu_device(control);
> @@ -2013,6 +2019,7 @@ static int arcturus_i2c_control_init(struct smu_context *smu, struct i2c_adapter
>         control->class = I2C_CLASS_SPD | I2C_CLASS_HWMON;
>         control->dev.parent = &adev->pdev->dev;
>         control->algo = &arcturus_i2c_algo;
> +       control->quirks = &arcturus_i2c_control_quirks;
>         snprintf(control->name, sizeof(control->name), "AMDGPU SMU");
>
>         res = i2c_add_adapter(control);
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index 4010b891f25678..56000463f64e45 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> @@ -2799,6 +2799,11 @@ static const struct i2c_algorithm navi10_i2c_algo = {
>         .functionality = navi10_i2c_func,
>  };
>
> +static const struct i2c_adapter_quirks navi10_i2c_control_quirks = {
> +       .max_read_len = MAX_SW_I2C_COMMANDS,
> +       .max_write_len = MAX_SW_I2C_COMMANDS,
> +};
> +
>  static int navi10_i2c_control_init(struct smu_context *smu, struct i2c_adapter *control)
>  {
>         struct amdgpu_device *adev = to_amdgpu_device(control);
> @@ -2809,6 +2814,7 @@ static int navi10_i2c_control_init(struct smu_context *smu, struct i2c_adapter *
>         control->dev.parent = &adev->pdev->dev;
>         control->algo = &navi10_i2c_algo;
>         snprintf(control->name, sizeof(control->name), "AMDGPU SMU");
> +       control->quirks = &navi10_i2c_control_quirks;
>
>         res = i2c_add_adapter(control);
>         if (res)
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> index d5b750d84112fa..86804f3b0a951b 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> @@ -3487,6 +3487,11 @@ static const struct i2c_algorithm sienna_cichlid_i2c_algo = {
>         .functionality = sienna_cichlid_i2c_func,
>  };
>
> +static const struct i2c_adapter_quirks sienna_cichlid_i2c_control_quirks = {
> +       .max_read_len = MAX_SW_I2C_COMMANDS,
> +       .max_write_len = MAX_SW_I2C_COMMANDS,
> +};
> +
>  static int sienna_cichlid_i2c_control_init(struct smu_context *smu, struct i2c_adapter *control)
>  {
>         struct amdgpu_device *adev = to_amdgpu_device(control);
> @@ -3497,6 +3502,7 @@ static int sienna_cichlid_i2c_control_init(struct smu_context *smu, struct i2c_a
>         control->dev.parent = &adev->pdev->dev;
>         control->algo = &sienna_cichlid_i2c_algo;
>         snprintf(control->name, sizeof(control->name), "AMDGPU SMU");
> +       control->quirks = &sienna_cichlid_i2c_control_quirks;
>
>         res = i2c_add_adapter(control);
>         if (res)
> --
> 2.32.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
