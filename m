Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC42E21A932
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Jul 2020 22:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C4B6EB30;
	Thu,  9 Jul 2020 20:41:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBFA6EB30
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Jul 2020 20:41:08 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g75so3404214wme.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 Jul 2020 13:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lDB/OZXuq6HsOTB/+BtHZJfyuJZLgHh9i1T3RmJym9E=;
 b=DeRnRtFGzF7u2ssKlKLC9/ERETBNxvlaQwZsEeNZvvikyvbdvZ9pLf2Eyz/W6kzE9q
 0VM9w7hAUf1CtQjB2kE30J877PZB/l7M4+FVWw7x9+YM6Moznx7plCCugB66E4EO0Nx1
 K1+1WplLbgsh3wn22PGdLlhnc+Aa8VwTL30zEn5HB/lAejZQBaTM6XPxegK9Zwwtyq2t
 hJkFOfmVtkuYejQpklA+zKgeD/UzPDHEvQYaRuT5WRYI1o/M+yiZJj37zeX/ns+xOPq1
 0InWFjM9Wjcb1rluwHGYJ8WuaAPUobyxgMVu+UKvIfHVwLKqqyZztRc9V+ZWcIl5rW95
 +rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lDB/OZXuq6HsOTB/+BtHZJfyuJZLgHh9i1T3RmJym9E=;
 b=HJQsBvj0iiRDAR4C5CoOpyPI7bWMvX/bRwmb57+E6wXTZbyGXOGklUpgOY0hkVTGHM
 W/8XAZqqmReeiIZpPZV6lkRcbd8KE/6hfxHbwMDFA5B08lb8Benrx/ospDH3Ndea/b22
 ahzdYfpg/Tp8rzXziT/TlVNVuf1xTwVQAGdXf1FG+9DghlLglbkVeobZF4O5aBkuaL59
 sc8WND0EDP2GQsMJDWgqgro3VkzmEN4iI4rTFgc5aPHoxCXA7mRoGv/pEwgKfPrZRNcb
 0lvDOu9BSGz40gdhFiasITBb1+aaxxOfsI0+TiXM5u8/lJr4gTKDfu71Inc9jS5tmtjC
 UfwA==
X-Gm-Message-State: AOAM531ITaMm8UEpGmr/RnOfqF2Nli5MD+0KHBi7sJHf0cUbgrN3HGYO
 EsBr+k/iMkTzKWJWOm20fGR9Yo59SQgFSnL7torHxJRG
X-Google-Smtp-Source: ABdhPJxdUTA4OtS3HWEIPAeVIi5I2Y21lP0bzirUyALRUCwaJyU+zg9f3SJknxg0Ym1+JVqNYPRTKCR/t3jay5W/Z1U=
X-Received: by 2002:a7b:c7c2:: with SMTP id z2mr1689140wmk.39.1594327267134;
 Thu, 09 Jul 2020 13:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200703083303.478-1-evan.quan@amd.com>
 <20200703083303.478-3-evan.quan@amd.com>
In-Reply-To: <20200703083303.478-3-evan.quan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Jul 2020 16:40:55 -0400
Message-ID: <CADnq5_PG0-ZKG=5hnYwTiRuKm-p3=7e6fr_OkvB5Dg56_wY=vQ@mail.gmail.com>
Subject: Re: [PATCH 03/14] drm/amd/powerplay: update Navi10 default dpm table
 setup
To: Evan Quan <evan.quan@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Jul 3, 2020 at 4:33 AM Evan Quan <evan.quan@amd.com> wrote:
>
> Cache all clocks levels for every dpm table. They are needed
> by other APIs.
>
> Change-Id: I8114cf31e6ec8c9af4578d51749eb213befdcc71
> Signed-off-by: Evan Quan <evan.quan@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 182 ++++++++++++++++++---
>  1 file changed, 158 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> index d96e8334b5e2..a022e93a487c 100644
> --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -689,41 +689,175 @@ static int navi10_allocate_dpm_context(struct smu_context *smu)
>
>  static int navi10_set_default_dpm_table(struct smu_context *smu)
>  {
> -       struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
> -       struct smu_table_context *table_context = &smu->smu_table;
> -       struct smu_11_0_dpm_context *dpm_context = smu_dpm->dpm_context;
> -       PPTable_t *driver_ppt = NULL;
> +       struct smu_11_0_dpm_context *dpm_context = smu->smu_dpm.dpm_context;
> +       PPTable_t *driver_ppt = smu->smu_table.driver_pptable;
> +       struct smu_11_0_dpm_table *dpm_table;
> +       int ret = 0;
>         int i;
>
> -       driver_ppt = table_context->driver_pptable;
> -
> -       dpm_context->dpm_tables.soc_table.min = driver_ppt->FreqTableSocclk[0];
> -       dpm_context->dpm_tables.soc_table.max = driver_ppt->FreqTableSocclk[NUM_SOCCLK_DPM_LEVELS - 1];
> +       /* socclk dpm table setup */
> +       dpm_table = &dpm_context->dpm_tables.soc_table;
> +       if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_SOCCLK_BIT)) {
> +               ret = smu_v11_0_set_single_dpm_table(smu,
> +                                                    SMU_SOCCLK,
> +                                                    dpm_table);
> +               if (ret)
> +                       return ret;
> +               dpm_table->is_fine_grained =
> +                       !driver_ppt->DpmDescriptor[PPCLK_SOCCLK].SnapToDiscrete;
> +       } else {
> +               dpm_table->count = 1;
> +               dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.socclk / 100;
> +               dpm_table->dpm_levels[0].enabled = true;
> +               dpm_table->min = dpm_table->dpm_levels[0].value;
> +               dpm_table->max = dpm_table->dpm_levels[0].value;
> +       }
>
> -       dpm_context->dpm_tables.gfx_table.min = driver_ppt->FreqTableGfx[0];
> -       dpm_context->dpm_tables.gfx_table.max = driver_ppt->FreqTableGfx[NUM_GFXCLK_DPM_LEVELS - 1];
> +       /* gfxclk dpm table setup */
> +       dpm_table = &dpm_context->dpm_tables.gfx_table;
> +       if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_GFXCLK_BIT)) {
> +               ret = smu_v11_0_set_single_dpm_table(smu,
> +                                                    SMU_GFXCLK,
> +                                                    dpm_table);
> +               if (ret)
> +                       return ret;
> +               dpm_table->is_fine_grained =
> +                       !driver_ppt->DpmDescriptor[PPCLK_GFXCLK].SnapToDiscrete;
> +       } else {
> +               dpm_table->count = 1;
> +               dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.gfxclk / 100;
> +               dpm_table->dpm_levels[0].enabled = true;
> +               dpm_table->min = dpm_table->dpm_levels[0].value;
> +               dpm_table->max = dpm_table->dpm_levels[0].value;
> +       }
>
> -       dpm_context->dpm_tables.uclk_table.min = driver_ppt->FreqTableUclk[0];
> -       dpm_context->dpm_tables.uclk_table.max = driver_ppt->FreqTableUclk[NUM_UCLK_DPM_LEVELS - 1];
> +       /* uclk dpm table setup */
> +       dpm_table = &dpm_context->dpm_tables.uclk_table;
> +       if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT)) {
> +               ret = smu_v11_0_set_single_dpm_table(smu,
> +                                                    SMU_UCLK,
> +                                                    dpm_table);
> +               if (ret)
> +                       return ret;
> +               dpm_table->is_fine_grained =
> +                       !driver_ppt->DpmDescriptor[PPCLK_UCLK].SnapToDiscrete;
> +       } else {
> +               dpm_table->count = 1;
> +               dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.uclk / 100;
> +               dpm_table->dpm_levels[0].enabled = true;
> +               dpm_table->min = dpm_table->dpm_levels[0].value;
> +               dpm_table->max = dpm_table->dpm_levels[0].value;
> +       }
>
> -       dpm_context->dpm_tables.vclk_table.min = driver_ppt->FreqTableVclk[0];
> -       dpm_context->dpm_tables.vclk_table.max = driver_ppt->FreqTableVclk[NUM_VCLK_DPM_LEVELS - 1];
> +       /* vclk dpm table setup */
> +       dpm_table = &dpm_context->dpm_tables.vclk_table;
> +       if (smu_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)) {
> +               ret = smu_v11_0_set_single_dpm_table(smu,
> +                                                    SMU_VCLK,
> +                                                    dpm_table);
> +               if (ret)
> +                       return ret;
> +               dpm_table->is_fine_grained =
> +                       !driver_ppt->DpmDescriptor[PPCLK_VCLK].SnapToDiscrete;
> +       } else {
> +               dpm_table->count = 1;
> +               dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.vclk / 100;
> +               dpm_table->dpm_levels[0].enabled = true;
> +               dpm_table->min = dpm_table->dpm_levels[0].value;
> +               dpm_table->max = dpm_table->dpm_levels[0].value;
> +       }
>
> -       dpm_context->dpm_tables.dclk_table.min = driver_ppt->FreqTableDclk[0];
> -       dpm_context->dpm_tables.dclk_table.max = driver_ppt->FreqTableDclk[NUM_DCLK_DPM_LEVELS - 1];
> +       /* dclk dpm table setup */
> +       dpm_table = &dpm_context->dpm_tables.dclk_table;
> +       if (smu_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)) {
> +               ret = smu_v11_0_set_single_dpm_table(smu,
> +                                                    SMU_DCLK,
> +                                                    dpm_table);
> +               if (ret)
> +                       return ret;
> +               dpm_table->is_fine_grained =
> +                       !driver_ppt->DpmDescriptor[PPCLK_DCLK].SnapToDiscrete;
> +       } else {
> +               dpm_table->count = 1;
> +               dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.dclk / 100;
> +               dpm_table->dpm_levels[0].enabled = true;
> +               dpm_table->min = dpm_table->dpm_levels[0].value;
> +               dpm_table->max = dpm_table->dpm_levels[0].value;
> +       }
>
> -       dpm_context->dpm_tables.dcef_table.min = driver_ppt->FreqTableDcefclk[0];
> -       dpm_context->dpm_tables.dcef_table.max = driver_ppt->FreqTableDcefclk[NUM_DCEFCLK_DPM_LEVELS - 1];
> +       /* dcefclk dpm table setup */
> +       dpm_table = &dpm_context->dpm_tables.dcef_table;
> +       if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_DCEFCLK_BIT)) {
> +               ret = smu_v11_0_set_single_dpm_table(smu,
> +                                                    SMU_DCEFCLK,
> +                                                    dpm_table);
> +               if (ret)
> +                       return ret;
> +               dpm_table->is_fine_grained =
> +                       !driver_ppt->DpmDescriptor[PPCLK_DCEFCLK].SnapToDiscrete;
> +       } else {
> +               dpm_table->count = 1;
> +               dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.dcefclk / 100;
> +               dpm_table->dpm_levels[0].enabled = true;
> +               dpm_table->min = dpm_table->dpm_levels[0].value;
> +               dpm_table->max = dpm_table->dpm_levels[0].value;
> +       }
>
> -       dpm_context->dpm_tables.pixel_table.min = driver_ppt->FreqTablePixclk[0];
> -       dpm_context->dpm_tables.pixel_table.max = driver_ppt->FreqTablePixclk[NUM_PIXCLK_DPM_LEVELS - 1];
> +       /* pixelclk dpm table setup */
> +       dpm_table = &dpm_context->dpm_tables.pixel_table;
> +       if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_DCEFCLK_BIT)) {
> +               ret = smu_v11_0_set_single_dpm_table(smu,
> +                                                    SMU_PIXCLK,
> +                                                    dpm_table);
> +               if (ret)
> +                       return ret;
> +               dpm_table->is_fine_grained =
> +                       !driver_ppt->DpmDescriptor[PPCLK_PIXCLK].SnapToDiscrete;
> +       } else {
> +               dpm_table->count = 1;
> +               dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.dcefclk / 100;
> +               dpm_table->dpm_levels[0].enabled = true;
> +               dpm_table->min = dpm_table->dpm_levels[0].value;
> +               dpm_table->max = dpm_table->dpm_levels[0].value;
> +       }
>
> -       dpm_context->dpm_tables.display_table.min = driver_ppt->FreqTableDispclk[0];
> -       dpm_context->dpm_tables.display_table.max = driver_ppt->FreqTableDispclk[NUM_DISPCLK_DPM_LEVELS - 1];
> +       /* displayclk dpm table setup */
> +       dpm_table = &dpm_context->dpm_tables.display_table;
> +       if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_DCEFCLK_BIT)) {
> +               ret = smu_v11_0_set_single_dpm_table(smu,
> +                                                    SMU_DISPCLK,
> +                                                    dpm_table);
> +               if (ret)
> +                       return ret;
> +               dpm_table->is_fine_grained =
> +                       !driver_ppt->DpmDescriptor[PPCLK_DISPCLK].SnapToDiscrete;
> +       } else {
> +               dpm_table->count = 1;
> +               dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.dcefclk / 100;
> +               dpm_table->dpm_levels[0].enabled = true;
> +               dpm_table->min = dpm_table->dpm_levels[0].value;
> +               dpm_table->max = dpm_table->dpm_levels[0].value;
> +       }
>
> -       dpm_context->dpm_tables.phy_table.min = driver_ppt->FreqTablePhyclk[0];
> -       dpm_context->dpm_tables.phy_table.max = driver_ppt->FreqTablePhyclk[NUM_PHYCLK_DPM_LEVELS - 1];
> +       /* phyclk dpm table setup */
> +       dpm_table = &dpm_context->dpm_tables.phy_table;
> +       if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_DCEFCLK_BIT)) {
> +               ret = smu_v11_0_set_single_dpm_table(smu,
> +                                                    SMU_PHYCLK,
> +                                                    dpm_table);
> +               if (ret)
> +                       return ret;
> +               dpm_table->is_fine_grained =
> +                       !driver_ppt->DpmDescriptor[PPCLK_PHYCLK].SnapToDiscrete;
> +       } else {
> +               dpm_table->count = 1;
> +               dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.dcefclk / 100;
> +               dpm_table->dpm_levels[0].enabled = true;
> +               dpm_table->min = dpm_table->dpm_levels[0].value;
> +               dpm_table->max = dpm_table->dpm_levels[0].value;
> +       }
>
> +       /* lclk dpm table setup */
>         for (i = 0; i < MAX_PCIE_CONF; i++) {
>                 dpm_context->dpm_tables.pcie_table.pcie_gen[i] = driver_ppt->PcieGenSpeed[i];
>                 dpm_context->dpm_tables.pcie_table.pcie_lane[i] = driver_ppt->PcieLaneCount[i];
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
