Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D840822F69
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Jan 2024 15:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B977210E299;
	Wed,  3 Jan 2024 14:28:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EFF10E299
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jan 2024 14:27:59 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6dc6b99f215so673867a34.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 03 Jan 2024 06:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704292078; x=1704896878; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a349tfFo0Tz6+yladu1vGz3cOOaSViS9QyeDAzXiKtI=;
 b=L2Zkvuh3j3vdQYPPPEkuZCQU93qdpprJqxmLWUxVe2Iuw15in6NSjIdSrsj+m7sSPO
 SMcdQPiH0mRVHULtRBkZsjYkfvdjfD02zaZbqMmUCkpQ/U2ica/Soq/wb8pYC5SqUeCq
 UXUaZR5oJz2WsNtzhJI+/ZgLeFqldD7hdlRxWf6O16gJOIrSyQ7r9kAxT18ZImf9ZJHz
 hewrFewZJOSZvhGsodizh5gdDrfgGG9zdn5518jsSfRljcIKR65QSk5lcKzamUXooCdC
 Kr5ENYMjbugyjFzIPWXJFg1DahUytAf6Uk7rR7E7oEVLcNLJSvbs71bSry2NAlFO3QuQ
 m11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704292078; x=1704896878;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a349tfFo0Tz6+yladu1vGz3cOOaSViS9QyeDAzXiKtI=;
 b=bA9scvrgXWSiN/oQ9DVozrRTjLGBIQBqt7f2FQDDpKhpkbRQ5AOEedgHO/kad6wZ6i
 Mbo/J1BZ0rZHnDDQ23jno3PskpXiBeoBJT8qAalkNCeWOCOCdF+i5cQc1FULhPBRcQLj
 VJk+53N8BCpTZLxGewv2QnNZYaSrgz1FePx9T5w3/uXxni89iG0xfoq2Oy90EmBTb212
 2d/UIOwddGoZS/98vi5nHBYY+b+XDkEuwV2WTD5o8OcWpbF7cdIPteD5b29g9crowpUo
 VSVh+Y6nhUVsXr0/Iy7CM6QAXBvoP1zKQNnp+/CaKg+ZE2Ia/SxAxwhzChZ3Tn2gHiH+
 wPsQ==
X-Gm-Message-State: AOJu0YwD6BoTLu2IqlT5UTYi8hRhi5XiLpB4etO3AszivOWnRsEU62k6
 /6YsZoPNQPAqV4n1iZSuC/oiFWt8fHUaCDYLnsI=
X-Google-Smtp-Source: AGHT+IHjuxm+WsGold4msvLzUcwvASXsLbNWaImZQEtNmF+UM28LD4T6ctfH3u7LonFz90aecPkvdKH3c/Z8VWiEa/Q=
X-Received: by 2002:a05:6871:2b02:b0:204:32f7:6668 with SMTP id
 dr2-20020a0568712b0200b0020432f76668mr8870200oac.34.1704292078704; Wed, 03
 Jan 2024 06:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Jan 2024 09:27:47 -0500
Message-ID: <CADnq5_Pub0UULb6UqO2g+Eo6RCy=gqtWLN9txjEyp2Gmw9idww@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Unified cross-architecture kernel-mode FPU API
To: Samuel Holland <samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Dec 28, 2023 at 5:11=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> This series unifies the kernel-mode FPU API across several architectures
> by wrapping the existing functions (where needed) in consistently-named
> functions placed in a consistent header location, with mostly the same
> semantics: they can be called from preemptible or non-preemptible task
> context, and are not assumed to be reentrant. Architectures are also
> expected to provide CFLAGS adjustments for compiling FPU-dependent code.
> For the moment, SIMD/vector units are out of scope for this common API.
>
> This allows us to remove the ifdeffery and duplicated Makefile logic at
> each FPU user. It then implements the common API on RISC-V, and converts
> a couple of users to the new API: the AMDGPU DRM driver, and the FPU
> self test.
>
> The underlying goal of this series is to allow using newer AMD GPUs
> (e.g. Navi) on RISC-V boards such as SiFive's HiFive Unmatched. Those
> GPUs need CONFIG_DRM_AMD_DC_FP to initialize, which requires kernel-mode
> FPU support.

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> Previous versions:
> v1: https://lore.kernel.org/linux-kernel/20231208055501.2916202-1-samuel.=
holland@sifive.com/
> v0: https://lore.kernel.org/linux-kernel/20231122030621.3759313-1-samuel.=
holland@sifive.com/
>
> Changes in v2:
>  - Add documentation explaining the built-time and runtime APIs
>  - Add a linux/fpu.h header for generic isolation enforcement
>  - Remove file name from header comment
>  - Clean up arch/arm64/lib/Makefile, like for arch/arm
>  - Remove RISC-V architecture-specific preprocessor check
>  - Split altivec removal to a separate patch
>  - Use linux/fpu.h instead of asm/fpu.h in consumers
>  - Declare test_fpu() in a header
>
> Michael Ellerman (1):
>   drm/amd/display: Only use hard-float, not altivec on powerpc
>
> Samuel Holland (13):
>   arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
>   ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>   ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
>   arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>   arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
>   lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
>   LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>   powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>   x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>   riscv: Add support for kernel-mode FPU
>   drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
>   selftests/fpu: Move FP code to a separate translation unit
>   selftests/fpu: Allow building on other architectures
>
>  Documentation/core-api/floating-point.rst     | 78 +++++++++++++++++++
>  Documentation/core-api/index.rst              |  1 +
>  Makefile                                      |  5 ++
>  arch/Kconfig                                  |  6 ++
>  arch/arm/Kconfig                              |  1 +
>  arch/arm/Makefile                             |  7 ++
>  arch/arm/include/asm/fpu.h                    | 15 ++++
>  arch/arm/lib/Makefile                         |  3 +-
>  arch/arm64/Kconfig                            |  1 +
>  arch/arm64/Makefile                           |  9 ++-
>  arch/arm64/include/asm/fpu.h                  | 15 ++++
>  arch/arm64/lib/Makefile                       |  6 +-
>  arch/loongarch/Kconfig                        |  1 +
>  arch/loongarch/Makefile                       |  5 +-
>  arch/loongarch/include/asm/fpu.h              |  1 +
>  arch/powerpc/Kconfig                          |  1 +
>  arch/powerpc/Makefile                         |  5 +-
>  arch/powerpc/include/asm/fpu.h                | 28 +++++++
>  arch/riscv/Kconfig                            |  1 +
>  arch/riscv/Makefile                           |  3 +
>  arch/riscv/include/asm/fpu.h                  | 16 ++++
>  arch/riscv/kernel/Makefile                    |  1 +
>  arch/riscv/kernel/kernel_mode_fpu.c           | 28 +++++++
>  arch/x86/Kconfig                              |  1 +
>  arch/x86/Makefile                             | 20 +++++
>  arch/x86/include/asm/fpu.h                    | 13 ++++
>  drivers/gpu/drm/amd/display/Kconfig           |  2 +-
>  .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 35 +--------
>  drivers/gpu/drm/amd/display/dc/dml/Makefile   | 36 +--------
>  drivers/gpu/drm/amd/display/dc/dml2/Makefile  | 36 +--------
>  include/linux/fpu.h                           | 12 +++
>  lib/Kconfig.debug                             |  2 +-
>  lib/Makefile                                  | 26 +------
>  lib/raid6/Makefile                            | 31 ++------
>  lib/test_fpu.h                                |  8 ++
>  lib/{test_fpu.c =3D> test_fpu_glue.c}           | 37 ++-------
>  lib/test_fpu_impl.c                           | 37 +++++++++
>  37 files changed, 343 insertions(+), 190 deletions(-)
>  create mode 100644 Documentation/core-api/floating-point.rst
>  create mode 100644 arch/arm/include/asm/fpu.h
>  create mode 100644 arch/arm64/include/asm/fpu.h
>  create mode 100644 arch/powerpc/include/asm/fpu.h
>  create mode 100644 arch/riscv/include/asm/fpu.h
>  create mode 100644 arch/riscv/kernel/kernel_mode_fpu.c
>  create mode 100644 arch/x86/include/asm/fpu.h
>  create mode 100644 include/linux/fpu.h
>  create mode 100644 lib/test_fpu.h
>  rename lib/{test_fpu.c =3D> test_fpu_glue.c} (71%)
>  create mode 100644 lib/test_fpu_impl.c
>
> --
> 2.42.0
>
