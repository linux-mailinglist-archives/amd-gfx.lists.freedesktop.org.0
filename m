Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8B6240AB0
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Aug 2020 17:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574F36E03B;
	Mon, 10 Aug 2020 15:44:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE9D6E03B
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Aug 2020 15:44:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c15so8619094wrs.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Aug 2020 08:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PMYWkYTjaYuUxJD4TMCcOPHTGoX9dLNtOmcnno7KzvM=;
 b=dfSM0PWEIxSZsF/xMg9ViBcbN0u9g4fmxyaaLzptQG+I7UbJqmLIoE3dT23nDTKE3Y
 s59Yo831dt8/6U+EGtPwIxxIRJETg6lLo32sbYl2cnM+wkc+OZum4wnilUQ+pcFAM7f/
 JuIXFJE14dr4k3VY4b0faNWJDAj/xs1mszGvOGNvlxFi74bESAJzyFdxA4CBQkrBg6rs
 f6ts/7V7JupOUTmeQI5bJ1LVBAacNNw6RY97zLvyzpobPmPfSIreArFtjMpfce9FrW3a
 BhfUkDss65bh1nzda6kKLQDKRdlVfkSGDlE5zsLYkBmuQU0FHHir7wZ2nYM9GmH2YNDO
 EyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PMYWkYTjaYuUxJD4TMCcOPHTGoX9dLNtOmcnno7KzvM=;
 b=GPR01aa0lnvh3OPckd/WrX9BBGAe4mw6W7fH4GEXNRvjXf1Lf16/SQlvsXTN91bZm+
 7ta1hVTuzp1UXkw0+8+N8a6/D5DiMibIv1z//+ya4Qs888gGy8LFcUk7IjJV3m/bWu3n
 1GZarXjeCovjT6NxHEJBuC+35TLLqHYFFW/4dDIEuWsozuXQm/2MRBucP5N8qli08ofl
 UOviARk4axmwlu+cYZkRXcvenpt7eOsw97ots6jPKoFX5JkCqumvXwqEjZarvOPiaxTW
 6Dixi25weH0bwoxlJFzvYOIvuoB9mpk0upMnU6moVCOFIy5+P2dicN+a0GprJSl6gSSo
 rUpQ==
X-Gm-Message-State: AOAM530IC98evBrs6Lvapp9bKBi/Lwrf06kTBwZWYP0CWETX+n8szFty
 Xd2Ts0MbjR+49xMERLEdxV71MUqmuK0SEYpDnwTn4w==
X-Google-Smtp-Source: ABdhPJzRj26aNgez5wvE9MBJga2M+zxdmiuMNjnF/yphZQ4dRwJuY1PgJLUurbS7L6pmpZY1GPdRWG/zMd2ZeADsEJ8=
X-Received: by 2002:adf:fd41:: with SMTP id h1mr26941448wrs.124.1597074254801; 
 Mon, 10 Aug 2020 08:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200808204458.12482-1-daniel@octaforge.org>
In-Reply-To: <20200808204458.12482-1-daniel@octaforge.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Aug 2020 11:44:03 -0400
Message-ID: <CADnq5_O7oNTkjH65BBjKFnAEr7S6tBWVKqnscfqAL6cWdKnqiA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: add DCN support for aarch64
To: Daniel Kolesa <daniel@octaforge.org>
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

Applied.  Thanks!

Alex

On Sat, Aug 8, 2020 at 4:51 PM Daniel Kolesa <daniel@octaforge.org> wrote:
>
> This adds ARM64 support into the DCN. This mainly enables support
> for Navi graphics cards. The dcn10 changes haven't been tested,
> since I don't have the relevant hardware available, but there
> is no way to conditionally disable them, so I've done them anyway.
>
> Signed-off-by: Daniel Kolesa <daniel@octaforge.org>
> ---
>  drivers/gpu/drm/amd/display/Kconfig           |  2 +-
>  drivers/gpu/drm/amd/display/dc/calcs/Makefile |  7 ++
>  .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |  7 ++
>  drivers/gpu/drm/amd/display/dc/dcn10/Makefile |  7 ++
>  .../drm/amd/display/dc/dcn10/dcn10_resource.c | 81 ++++++++++++-------
>  drivers/gpu/drm/amd/display/dc/dcn20/Makefile |  4 +
>  drivers/gpu/drm/amd/display/dc/dcn21/Makefile |  4 +
>  drivers/gpu/drm/amd/display/dc/dml/Makefile   | 13 +++
>  drivers/gpu/drm/amd/display/dc/dsc/Makefile   |  5 ++
>  drivers/gpu/drm/amd/display/dc/os_types.h     |  4 +
>  10 files changed, 102 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index 77569097a480..f24abf428534 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -6,7 +6,7 @@ config DRM_AMD_DC
>         bool "AMD DC - Enable new display engine"
>         default y
>         select SND_HDA_COMPONENT if SND_HDA_CORE
> -       select DRM_AMD_DC_DCN if (X86 || PPC64) && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
> +       select DRM_AMD_DC_DCN if (X86 || PPC64 || (ARM64 && KERNEL_MODE_NEON)) && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
>         help
>           Choose this option if you want to use the new display engine
>           support for AMDGPU. This adds required support for Vega and
> diff --git a/drivers/gpu/drm/amd/display/dc/calcs/Makefile b/drivers/gpu/drm/amd/display/dc/calcs/Makefile
> index 4674aca8f206..64f515d74410 100644
> --- a/drivers/gpu/drm/amd/display/dc/calcs/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/calcs/Makefile
> @@ -33,6 +33,10 @@ ifdef CONFIG_PPC64
>  calcs_ccflags := -mhard-float -maltivec
>  endif
>
> +ifdef CONFIG_ARM64
> +calcs_rcflags := -mgeneral-regs-only
> +endif
> +
>  ifdef CONFIG_CC_IS_GCC
>  ifeq ($(call cc-ifversion, -lt, 0701, y), y)
>  IS_OLD_GCC = 1
> @@ -53,6 +57,9 @@ endif
>  CFLAGS_$(AMDDALPATH)/dc/calcs/dcn_calcs.o := $(calcs_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/calcs/dcn_calc_auto.o := $(calcs_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/calcs/dcn_calc_math.o := $(calcs_ccflags) -Wno-tautological-compare
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/calcs/dcn_calcs.o := $(calcs_rcflags)
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/calcs/dcn_calc_auto.o := $(calcs_rcflags)
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/calcs/dcn_calc_math.o := $(calcs_rcflags)
>
>  BW_CALCS = dce_calcs.o bw_fixed.o custom_float.o
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
> index 52b1ce775a1e..1a495759a034 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
> @@ -104,6 +104,13 @@ ifdef CONFIG_PPC64
>  CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn21/rn_clk_mgr.o := $(call cc-option,-mno-gnu-attribute)
>  endif
>
> +# prevent build errors:
> +# ...: '-mgeneral-regs-only' is incompatible with the use of floating-point types
> +# this file is unused on arm64, just like on ppc64
> +ifdef CONFIG_ARM64
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/clk_mgr/dcn21/rn_clk_mgr.o := -mgeneral-regs-only
> +endif
> +
>  AMD_DAL_CLK_MGR_DCN21 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn21/,$(CLK_MGR_DCN21))
>
>  AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN21)
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/Makefile b/drivers/gpu/drm/amd/display/dc/dcn10/Makefile
> index 62ad1a11bff9..733e6e6e43bd 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/Makefile
> @@ -31,4 +31,11 @@ DCN10 = dcn10_init.o dcn10_resource.o dcn10_ipp.o dcn10_hw_sequencer.o \
>
>  AMD_DAL_DCN10 = $(addprefix $(AMDDALPATH)/dc/dcn10/,$(DCN10))
>
> +# fix:
> +# ...: '-mgeneral-regs-only' is incompatible with the use of floating-point types
> +# aarch64 does not support soft-float, so use hard-float and handle this in code
> +ifdef CONFIG_ARM64
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dcn10/dcn10_resource.o := -mgeneral-regs-only
> +endif
> +
>  AMD_DISPLAY_FILES += $(AMD_DAL_DCN10)
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> index 17d5cb422025..07571f84e0f8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> @@ -1331,6 +1331,47 @@ static uint32_t read_pipe_fuses(struct dc_context *ctx)
>         return value;
>  }
>
> +/*
> + * Some architectures don't support soft-float (e.g. aarch64), on those
> + * this function has to be called with hardfloat enabled, make sure not
> + * to inline it so whatever fp stuff is done stays inside
> + */
> +static noinline void dcn10_resource_construct_fp(
> +       struct dc *dc)
> +{
> +       if (dc->ctx->dce_version == DCN_VERSION_1_01) {
> +               struct dcn_soc_bounding_box *dcn_soc = dc->dcn_soc;
> +               struct dcn_ip_params *dcn_ip = dc->dcn_ip;
> +               struct display_mode_lib *dml = &dc->dml;
> +
> +               dml->ip.max_num_dpp = 3;
> +               /* TODO how to handle 23.84? */
> +               dcn_soc->dram_clock_change_latency = 23;
> +               dcn_ip->max_num_dpp = 3;
> +       }
> +       if (ASICREV_IS_RV1_F0(dc->ctx->asic_id.hw_internal_rev)) {
> +               dc->dcn_soc->urgent_latency = 3;
> +               dc->debug.disable_dmcu = true;
> +               dc->dcn_soc->fabric_and_dram_bandwidth_vmax0p9 = 41.60f;
> +       }
> +
> +
> +       dc->dcn_soc->number_of_channels = dc->ctx->asic_id.vram_width / ddr4_dram_width;
> +       ASSERT(dc->dcn_soc->number_of_channels < 3);
> +       if (dc->dcn_soc->number_of_channels == 0)/*old sbios bug*/
> +               dc->dcn_soc->number_of_channels = 2;
> +
> +       if (dc->dcn_soc->number_of_channels == 1) {
> +               dc->dcn_soc->fabric_and_dram_bandwidth_vmax0p9 = 19.2f;
> +               dc->dcn_soc->fabric_and_dram_bandwidth_vnom0p8 = 17.066f;
> +               dc->dcn_soc->fabric_and_dram_bandwidth_vmid0p72 = 14.933f;
> +               dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 = 12.8f;
> +               if (ASICREV_IS_RV1_F0(dc->ctx->asic_id.hw_internal_rev)) {
> +                       dc->dcn_soc->fabric_and_dram_bandwidth_vmax0p9 = 20.80f;
> +               }
> +       }
> +}
> +
>  static bool dcn10_resource_construct(
>         uint8_t num_virtual_links,
>         struct dc *dc,
> @@ -1482,37 +1523,15 @@ static bool dcn10_resource_construct(
>         memcpy(dc->dcn_ip, &dcn10_ip_defaults, sizeof(dcn10_ip_defaults));
>         memcpy(dc->dcn_soc, &dcn10_soc_defaults, sizeof(dcn10_soc_defaults));
>
> -       if (dc->ctx->dce_version == DCN_VERSION_1_01) {
> -               struct dcn_soc_bounding_box *dcn_soc = dc->dcn_soc;
> -               struct dcn_ip_params *dcn_ip = dc->dcn_ip;
> -               struct display_mode_lib *dml = &dc->dml;
> -
> -               dml->ip.max_num_dpp = 3;
> -               /* TODO how to handle 23.84? */
> -               dcn_soc->dram_clock_change_latency = 23;
> -               dcn_ip->max_num_dpp = 3;
> -       }
> -       if (ASICREV_IS_RV1_F0(dc->ctx->asic_id.hw_internal_rev)) {
> -               dc->dcn_soc->urgent_latency = 3;
> -               dc->debug.disable_dmcu = true;
> -               dc->dcn_soc->fabric_and_dram_bandwidth_vmax0p9 = 41.60f;
> -       }
> -
> -
> -       dc->dcn_soc->number_of_channels = dc->ctx->asic_id.vram_width / ddr4_dram_width;
> -       ASSERT(dc->dcn_soc->number_of_channels < 3);
> -       if (dc->dcn_soc->number_of_channels == 0)/*old sbios bug*/
> -               dc->dcn_soc->number_of_channels = 2;
> -
> -       if (dc->dcn_soc->number_of_channels == 1) {
> -               dc->dcn_soc->fabric_and_dram_bandwidth_vmax0p9 = 19.2f;
> -               dc->dcn_soc->fabric_and_dram_bandwidth_vnom0p8 = 17.066f;
> -               dc->dcn_soc->fabric_and_dram_bandwidth_vmid0p72 = 14.933f;
> -               dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 = 12.8f;
> -               if (ASICREV_IS_RV1_F0(dc->ctx->asic_id.hw_internal_rev)) {
> -                       dc->dcn_soc->fabric_and_dram_bandwidth_vmax0p9 = 20.80f;
> -               }
> -       }
> +#if defined(CONFIG_ARM64)
> +       /* Aarch64 does not support -msoft-float/-mfloat-abi=soft */
> +       DC_FP_START();
> +       dcn10_resource_construct_fp(dc);
> +       DC_FP_END();
> +#else
> +       /* Other architectures we build for build this with soft-float */
> +       dcn10_resource_construct_fp(dc);
> +#endif
>
>         pool->base.pp_smu = dcn10_pp_smu_create(ctx);
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> index 5fcaf78334ff..624cb1341ef1 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> @@ -17,6 +17,10 @@ ifdef CONFIG_PPC64
>  CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o := -mhard-float -maltivec
>  endif
>
> +ifdef CONFIG_ARM64
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o := -mgeneral-regs-only
> +endif
> +
>  ifdef CONFIG_CC_IS_GCC
>  ifeq ($(call cc-ifversion, -lt, 0701, y), y)
>  IS_OLD_GCC = 1
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/Makefile b/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
> index 07684d3e375a..51a2f3d4c194 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
> @@ -13,6 +13,10 @@ ifdef CONFIG_PPC64
>  CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o := -mhard-float -maltivec
>  endif
>
> +ifdef CONFIG_ARM64
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o := -mgeneral-regs-only
> +endif
> +
>  ifdef CONFIG_CC_IS_GCC
>  ifeq ($(call cc-ifversion, -lt, 0701, y), y)
>  IS_OLD_GCC = 1
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 417331438c30..dbc7e2abe379 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -33,6 +33,10 @@ ifdef CONFIG_PPC64
>  dml_ccflags := -mhard-float -maltivec
>  endif
>
> +ifdef CONFIG_ARM64
> +dml_rcflags := -mgeneral-regs-only
> +endif
> +
>  ifdef CONFIG_CC_IS_GCC
>  ifeq ($(call cc-ifversion, -lt, 0701, y), y)
>  IS_OLD_GCC = 1
> @@ -60,6 +64,13 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o := $(dml_ccflags)
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_rcflags)
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_rcflags)
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o := $(dml_rcflags)
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_rcflags)
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o := $(dml_rcflags)
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o := $(dml_rcflags)
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o := $(dml_rcflags)
>  endif
>  ifdef CONFIG_DRM_AMD_DC_DCN3_0
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) -Wframe-larger-than=2048
> @@ -67,6 +78,8 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_ccflags)
>  endif
>  CFLAGS_$(AMDDALPATH)/dc/dml/dml1_display_rq_dlg_calc.o := $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/display_rq_dlg_helpers.o := $(dml_ccflags)
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dml1_display_rq_dlg_calc.o := $(dml_rcflags)
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_rq_dlg_helpers.o := $(dml_rcflags)
>
>  DML = display_mode_lib.o display_rq_dlg_helpers.o dml1_display_rq_dlg_calc.o \
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dsc/Makefile b/drivers/gpu/drm/amd/display/dc/dsc/Makefile
> index ea29cf95d470..f2624a1156e5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dsc/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dsc/Makefile
> @@ -10,6 +10,10 @@ ifdef CONFIG_PPC64
>  dsc_ccflags := -mhard-float -maltivec
>  endif
>
> +ifdef CONFIG_ARM64
> +dsc_rcflags := -mgeneral-regs-only
> +endif
> +
>  ifdef CONFIG_CC_IS_GCC
>  ifeq ($(call cc-ifversion, -lt, 0701, y), y)
>  IS_OLD_GCC = 1
> @@ -28,6 +32,7 @@ endif
>  endif
>
>  CFLAGS_$(AMDDALPATH)/dc/dsc/rc_calc.o := $(dsc_ccflags)
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dsc/rc_calc.o := $(dsc_rcflags)
>
>  DSC = dc_dsc.o rc_calc.o rc_calc_dpi.o
>
> diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
> index c3bbfe397e8d..330acaaed79a 100644
> --- a/drivers/gpu/drm/amd/display/dc/os_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/os_types.h
> @@ -55,6 +55,10 @@
>  #include <asm/fpu/api.h>
>  #define DC_FP_START() kernel_fpu_begin()
>  #define DC_FP_END() kernel_fpu_end()
> +#elif defined(CONFIG_ARM64)
> +#include <asm/neon.h>
> +#define DC_FP_START() kernel_neon_begin()
> +#define DC_FP_END() kernel_neon_end()
>  #elif defined(CONFIG_PPC64)
>  #include <asm/switch_to.h>
>  #include <asm/cputable.h>
> --
> 2.28.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
