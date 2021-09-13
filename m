Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBE8409A36
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Sep 2021 19:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619F76ECC9;
	Mon, 13 Sep 2021 17:00:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FE96ECC8
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Sep 2021 17:00:04 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so14242518otg.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Sep 2021 10:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s7A8g4brzka8+kVhtU8/TIqxpX5/vjOJBtpR6Mvax0I=;
 b=VLRA52/Cur/a16ltJivuqjaLTbIhNiMz+KNacKysQYX8Fv7vQTHFReFsE2aBLDv8rb
 YbCFlZ6ZjcS+tqMSJ/uH24VvqNn8sj2MA0IuY9Qd09iMLvdbT5q9dCmt0ymEGfLmdYzN
 mSym4uAKGS9FRu6/pdC4heT60DD31p/eumfcnegBE9pgfu0TFVYWhGOJ5iMoPIHhYyk7
 kHDnsr1HGbzzmtAsH6w4eD/UgXtowI1HA1JBunCqnwFvIxB6DANmJR6E2xftRuLjPgGw
 dH/ibAUrHIM47RNCe2dk4aZlODDLvjUCoNEue6rLtUEiwvXdvePpBw2ShCDZHexRPEU3
 uRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s7A8g4brzka8+kVhtU8/TIqxpX5/vjOJBtpR6Mvax0I=;
 b=cPtTmE6IDFU2arLXqQuyKvR+iAu3g9DKjv+RAdwIFYJ44AxMM3QSBFSxRm7PMDOd5M
 aRfprSOdJtm+TgToCQQSRN+ZKrhjjmJFhhjooIo3gv98FSBLcAtSJJKdz1pzBIwx8j3b
 vDsU1XrxoV6G+2hYl0MqaH+MpY67gsNyZlSl7YTnBIdExJzrIxZgRZ72CvuIQX4Zw/ua
 CB7vbNVE7Z5/kwf2hoSlQaPX6K6szDna/VOV42jOn5nVEsEsxmvKY6Bq8zj5Ha7zJ1+z
 /fWd5dgPs8JrHRGgboaRy68fG9e9XuiUr5mmC+RyxkNTGPvVthoSGslA1ihev/b1y3AF
 fm0Q==
X-Gm-Message-State: AOAM531KFyiY6ntKypxQLuwPw+CfZKJCkm4Oc9VZ4/tDtRB9Fi7OZzsV
 FPlesa4B8IzuPmzXwbxGJi+6MSepxQvGd1HXRi6kQT5Y
X-Google-Smtp-Source: ABdhPJzHXigG2r9oRXx0jO8onx1O4AxcnS71QaWbbVEg0d5VXZfjlIQvZROX+MCMd8S7AIR7ndayfnX3CXcpu1RUEz8=
X-Received: by 2002:a05:6830:2704:: with SMTP id
 j4mr10789511otu.299.1631552403315; 
 Mon, 13 Sep 2021 10:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210913165556.1970603-1-Anson.Jacob@amd.com>
In-Reply-To: <20210913165556.1970603-1-Anson.Jacob@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Sep 2021 12:59:52 -0400
Message-ID: <CADnq5_NGq1V7phA7cvCErJMNwLT44YiUFktw=uCvayEaab87+A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Add dummy function for kgd2kfd_resume_iommu
To: Anson Jacob <Anson.Jacob@amd.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

On Mon, Sep 13, 2021 at 12:56 PM Anson Jacob <Anson.Jacob@amd.com> wrote:
>
> Add dummy function when CONFIG_HSA_AMD is not enabled.
>
> Fixes: 433d2448d57c ("drm/amdkfd: separate kfd_iommu_resume from kfd_resume")
> Signed-off-by: Anson Jacob <Anson.Jacob@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index b40ed399d2cf..3bc52b2c604f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -367,6 +367,11 @@ static inline void kgd2kfd_suspend(struct kfd_dev *kfd, bool run_pm)
>  {
>  }
>
> +static int __maybe_unused kgd2kfd_resume_iommu(struct kfd_dev *kfd)
> +{
> +       return 0;
> +}
> +
>  static inline int kgd2kfd_resume(struct kfd_dev *kfd, bool run_pm)
>  {
>         return 0;
> --
> 2.25.1
>
