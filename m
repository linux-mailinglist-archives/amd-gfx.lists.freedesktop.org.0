Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC3E718914
	for <lists+amd-gfx@lfdr.de>; Wed, 31 May 2023 20:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEAB10E1DA;
	Wed, 31 May 2023 18:12:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE7410E1DA
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 May 2023 18:12:00 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5585f2f070bso11718eaf.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 May 2023 11:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685556719; x=1688148719;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kU3lmllafaK2E4h/gONUouKB/mXxOkIOAkjW5WzTAOU=;
 b=LrijtyocpeRVq7fgunWHIyTvFdMaRjt6/4n623QTmww6t9zkRQRdN0E3S9S8+QZvTl
 egmGPRSodOOCPvaIWQoKkVDM48wJxXtR5v+pvuQtflM3/BY0Xke4aDlgv7vo4CP8EZOz
 vCWiHbPP4++QbtBoQCi2FM2dI/YyHkC9e60xlxGBTLsiHZteEw6yjwFZK+rVRt+8huGF
 3z4EfPF/Gw1H1HxIYoYllQZywUrCQ7/yXu2dtQ/mrqNVhRlMb3vSz+Or6PvZNxMnU2sT
 wdViuZBUiQiEn0YgjoKd+Za0rbux6AlaNbSFBgFZerZKYVdS8W3hCHugdSE9/eABldqe
 lbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685556719; x=1688148719;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kU3lmllafaK2E4h/gONUouKB/mXxOkIOAkjW5WzTAOU=;
 b=jfrz3oA3+1Ei3SF+pvLac/O9YaR25ioBGRQZg1vP5Nq825NhpuzInoFpom38ATmLKp
 gzoizKA5d9lgnI7b0QaRHCqhnaKKfYL1PksTDaiI3Z1UTDEHi3+auWXxDnYnp2xyn9Pm
 toCeJ3lbsCYfHSG3Oc/FMXA3ODbFQzq5jt9yATqvWv7a7r96KEzXavMr10aBwLc1bF0V
 9BqpSUaOzOB7/kvHLBNd0E24vfTCvI2Sp+aOltyIQ/+r2P7TL1JoHdwvMMKrAyi8f/R1
 Py1uFpihFKW2TrXcURVd2nMIeS1oYKLUVo90u2sPA8dRJh+xpHdy3rjg1eTyLyIIZQaU
 TKPA==
X-Gm-Message-State: AC+VfDw6ElcIMXeFxx1HLPWCFzFjWFl42cV7Gog1puRUY0TFv9EMBLVz
 +aP6ICCXTyTAYAI9otNRLy2WwTOGlWbUZ4RI7yn0WyDuiU8=
X-Google-Smtp-Source: ACHHUZ6N/GRS5lvn+r4g9PmmHVOBNyerDfIDWFDjU77RPXJjdllj4dDF1xe2P/FylXFLkk0EU31MBWwFG+dJMjpw4G8=
X-Received: by 2002:a4a:4146:0:b0:54f:49ad:1c93 with SMTP id
 x67-20020a4a4146000000b0054f49ad1c93mr3377720ooa.0.1685556718699; Wed, 31 May
 2023 11:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230525172846.818521-1-srinivasan.shanmugam@amd.com>
In-Reply-To: <20230525172846.818521-1-srinivasan.shanmugam@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 31 May 2023 14:11:47 -0400
Message-ID: <CADnq5_NQJcEeTszavOf6FpjKHduoDZ1CFhbTu5O3fJRd5mwTGA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix up kdoc in amdgpu_device.c
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

On Thu, May 25, 2023 at 1:29=E2=80=AFPM Srinivasan Shanmugam
<srinivasan.shanmugam@amd.com> wrote:
>
> Fix these warnings by deleting the deviant arguments.
>
> gcc with W=3D1
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:799: warning: Excess function =
parameter 'pcie_index' description in 'amdgpu_device_indirect_wreg'
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:799: warning: Excess function =
parameter 'pcie_data' description in 'amdgpu_device_indirect_wreg'
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:870: warning: Excess function =
parameter 'pcie_index' description in 'amdgpu_device_indirect_wreg64'
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:870: warning: Excess function =
parameter 'pcie_data' description in 'amdgpu_device_indirect_wreg64'
>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index c1e9ed26b7bf..301abfb7a0d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -788,8 +788,6 @@ u64 amdgpu_device_indirect_rreg64(struct amdgpu_devic=
e *adev,
>   * amdgpu_device_indirect_wreg - write an indirect register address
>   *
>   * @adev: amdgpu_device pointer
> - * @pcie_index: mmio register offset
> - * @pcie_data: mmio register offset
>   * @reg_addr: indirect register offset
>   * @reg_data: indirect register data
>   *
> @@ -859,8 +857,6 @@ void amdgpu_device_indirect_wreg_ext(struct amdgpu_de=
vice *adev,
>   * amdgpu_device_indirect_wreg64 - write a 64bits indirect register addr=
ess
>   *
>   * @adev: amdgpu_device pointer
> - * @pcie_index: mmio register offset
> - * @pcie_data: mmio register offset
>   * @reg_addr: indirect register offset
>   * @reg_data: indirect register data
>   *
> --
> 2.25.1
>
