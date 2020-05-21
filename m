Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 257D41DD97E
	for <lists+amd-gfx@lfdr.de>; Thu, 21 May 2020 23:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05686E960;
	Thu, 21 May 2020 21:32:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552DD6E960
 for <amd-gfx@lists.freedesktop.org>; Thu, 21 May 2020 21:32:40 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h4so6811447wmb.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 21 May 2020 14:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4urXaT6LD3WPw3YXjwTt5fy/LrMBTn7Rru1CNByaRf8=;
 b=kkbQTEVm8zmT1xQiRDoZir24wrOoPKGXWLCsG+TQLuruLgbGeFEPcvOVC/tVD2Tw+R
 GKQw4/PHqXMwTV3kdL/LPFGTpaBQYXtyuaiyMRF4tKYCRORmjY6RVQPG3ebG0o0X6GYc
 wW9g3+rZvA435uX3FI5LfGJ7MuYDkKAlvTtijFoCXU4Dvs/H49Sl3/b7u86l9flo41HG
 uzdTtANH41dDkvskmUEvhRbPBNEQ54Y9Go/tv4b6zMy04TlnFLitjQvxOoXWhz9X2NvD
 RautCo1xQRq3ElZ3jitj6iDkp6qtqKyYVbGn0Q4AbLZasRj4T2BLuN0xHzi1tinlkBFq
 jYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4urXaT6LD3WPw3YXjwTt5fy/LrMBTn7Rru1CNByaRf8=;
 b=E2xSlEnohsNBeJBvglxs1UU2ZsARuHj4M3EkbTLyxU7Ildz29Ze0EmbFWh/k/MSmom
 Q6Tc/vtS+LBlk+dWb5jZ/BEr/sDnUof8aLmAt8PLDTwF8t1EDv+Ds9o68z7ESFlzmEGY
 MMGuiUy7J2Fk/DtW741SdeI6+bO7JlmadadZu1u3IzP0p5yAEjtM2QrXyJGyDZrOLf1v
 Ji65cUC5uRFaLKk4PJUgpFoYvtDrJ5ZfSh7gzM+lI1UuRVmZlPfoS/WJ0jPZAIFEixrk
 sNjJSU5M2qh90yQUTGGcOPjZdb03CFvSUTyzZw2khVNT1L7gOYLDQWhTnA4i2w7J9Q6J
 EI1A==
X-Gm-Message-State: AOAM533b6iX6Zvb/tMFsvug7NfMwWVsTMERG4r5FmyUoKLKqR7z7luSu
 gt9jwORCwoZslr1a1gkglOUJz51DepC6cLXj3NM=
X-Google-Smtp-Source: ABdhPJyHY7NXv6X75Ru6/s8NShAeLNiB8q7vEdwJJ13MfyNkBCBq7vRCseU45YL/padO73yct9fx4KGkSx7jX4T21fQ=
X-Received: by 2002:a1c:9d50:: with SMTP id g77mr10579732wme.56.1590096759047; 
 Thu, 21 May 2020 14:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200521202931.15726-1-reiver@improbability.net>
 <20200521202931.15726-2-reiver@improbability.net>
In-Reply-To: <20200521202931.15726-2-reiver@improbability.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 May 2020 17:32:28 -0400
Message-ID: <CADnq5_NAhJvZYfmHpCRSPR0zv_6pXoR=2ZQgFWhgpfrT8ebcUQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: Advise if unable to resize BAR
To: Alan Swanson <reiver@improbability.net>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, May 21, 2020 at 4:45 PM Alan Swanson <reiver@improbability.net> wrote:
>
> Even with the "Above 4G decoding" (or similar) BIOS option enabled,
> many BIOS do not assign the PCI root bus a 64-bit address space.
>
> If available, "MMIOH Base" and "MMIO High Size" (or similar) BIOS
> options should allow mapping to the desired address spaces.
>
> Signed-off-by: Alan Swanson <reiver@improbability.net>
> ---
> Useful to know why bar resizing isn't happening.

This will spam a lot of people and probably cause confusion.  I'd
prefer to drop this one.

Alex


>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 2f0e8da7b..39a7f7212 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -919,8 +919,10 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
>         }
>
>         /* Trying to resize is pointless without a root hub window above 4GB */
> -       if (!res)
> +       if (!res) {
> +               DRM_INFO("Unable to resize BAR as PCI bus address space below 4GB.");
>                 return 0;
> +       }
>
>         /* Disable memory decoding while we change the BAR addresses and size */
>         pci_read_config_word(adev->pdev, PCI_COMMAND, &cmd);
> --
> 2.26.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
