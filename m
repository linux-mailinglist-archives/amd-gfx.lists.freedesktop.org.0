Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D9DAD925B
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Jun 2025 18:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCD610E25E;
	Fri, 13 Jun 2025 16:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kg480kVE";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250A510E204
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Jun 2025 16:03:22 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-235db423abdso1899935ad.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Jun 2025 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749830602; x=1750435402; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RWNsGZDE9JoxY+f8eFyYpSBnMiZ2g9IZPIa7iPAsA8Q=;
 b=kg480kVEXJcxYXkFE+RMhnJF+8g9r7rY1p+lfKq22GnIIPzy2IfP41TfpF0MFk8iNC
 2zulJZhpcwqBgXrtHu2hKHErJ2ppyURMXZmcctcxPJ8+PRxX6dw6BXBEXjGaFiHFykX3
 wKjnkpkXDbEDfE987dxp4T94Rmp7vSDWJowHK6b/QOnpacOY4zmpUx4xkxoGLxbotQJS
 3qbBG95kD4uwhnbBo+I9kh8Ab4T+2UCqiQzw0+xfCGR8mWZQI5IXHfFwpOlKHovypiWM
 PwJxsJ8yqVXEsQtgSiqtNT0kNSfaxE16ie0J5WgsU/Fp/HTOU81oWVazaRjIqAgGUg4+
 TvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749830602; x=1750435402;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RWNsGZDE9JoxY+f8eFyYpSBnMiZ2g9IZPIa7iPAsA8Q=;
 b=Q7jcdAVNNftyEwTxhoUGmrF+NZ9h2rjhOfpdv78pDNkPKnJXyuKlxP1jO/MHDUlC34
 rDocbK60jB3v1yQgnA2kCda/3vJBe+R5QprkjGvbeRNqB/hhajwSnR+h1bgoP6qBgrGw
 oTkbd3l7jjvRYS/xZFx6eE3p22OQnhEEgePSP94wQlw45tasUz/y3xH3ZOCDlOQKZeFG
 4uhnU+S8sf4in/WAWPKPzbaDmObM7fYTKCqJNn/tjHOl39clAljr2dEwDrRXBXzytISb
 4NRRTleKIQ0snHPsHuK5P94vw8xV/X1A6ZMt/H23b15wvZ97MRzt67X3MCVyO0vaIv8r
 sa1Q==
X-Gm-Message-State: AOJu0Yw81Bi0930xF3jGi4MdjBKava0ojHv+rAqPDD/x7nVr8CObobPi
 uFP5L8A3lpOxFsepO2iAxreGtPO6clXIEj7akPqg83bVhd65hg8Xxo4Gil0XFOKeomb7IDvxHcs
 laSpQSRAKpEqg4AW3Fvi/U7cnAfVrflgzOQ==
X-Gm-Gg: ASbGncvwGssg8RKCbfdKcElYseeIEyS/UEuzRdj+3smKgOnWn4HBGNDMNiYesLADBk8
 DJbwF36RhXlS6bz8UMNeukXkUpuzBwH6jOxczDDPNFxtuTOMmu/QpBVIdKepNOh8yBYn+Zv57hG
 2G2IARhiQID353zyiwFkfWDWHcAdoGpA2I3pB4RwUxPG58a1o+Icm8lNY=
X-Google-Smtp-Source: AGHT+IFq4oJW4oxxtdTQr6GQcevAwBEhDg1F3GRrwjm0yzVtwMk7OZuVqt4mNuWyFR2BhpMwdSYbrHcjxNt49cqwEA8=
X-Received: by 2002:a17:902:d4c9:b0:223:5124:ee7f with SMTP id
 d9443c01a7336-2366b14f811mr500575ad.12.1749830601623; Fri, 13 Jun 2025
 09:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250613144203.441129-1-kenneth.feng@amd.com>
 <20250613144203.441129-2-kenneth.feng@amd.com>
In-Reply-To: <20250613144203.441129-2-kenneth.feng@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Jun 2025 12:03:10 -0400
X-Gm-Features: AX0GCFvEFxC7W3SezuwMXomPi0TXoqI5XahJ-G2189ZFezWmsU1svkgiiZ8qfH0
Message-ID: <CADnq5_O--6JxQW++XDnnjMbPg8AeOt-uCzLz9fJ6bNUDa_04Bw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/pm: set pcie default dpm table when updating
 pcie dpm parameters
To: Kenneth Feng <kenneth.feng@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Lijo.Lazar@amd.com
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Jun 13, 2025 at 10:42=E2=80=AFAM Kenneth Feng <kenneth.feng@amd.com=
> wrote:
>
> set pcie default dpm table when updating pcie dpm parameters

Is there a reason to integrate this with the updating?

Alex

>
> Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
> ---
>  .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  | 104 ++++++++++++++----
>  .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  | 103 +++++++++++++----
>  .../drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c  |  45 ++++----
>  3 files changed, 186 insertions(+), 66 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> index 5a9711e8cf68..257082c03865 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> @@ -572,8 +572,6 @@ static int smu_v13_0_0_set_default_dpm_table(struct s=
mu_context *smu)
>         PPTable_t *pptable =3D table_context->driver_pptable;
>         SkuTable_t *skutable =3D &pptable->SkuTable;
>         struct smu_13_0_dpm_table *dpm_table;
> -       struct smu_13_0_pcie_table *pcie_table;
> -       uint32_t link_level;
>         int ret =3D 0;
>
>         /* socclk dpm table setup */
> @@ -689,24 +687,6 @@ static int smu_v13_0_0_set_default_dpm_table(struct =
smu_context *smu)
>                 dpm_table->max =3D dpm_table->dpm_levels[0].value;
>         }
>
> -       /* lclk dpm table setup */
> -       pcie_table =3D &dpm_context->dpm_tables.pcie_table;
> -       pcie_table->num_of_link_levels =3D 0;
> -       for (link_level =3D 0; link_level < NUM_LINK_LEVELS; link_level++=
) {
> -               if (!skutable->PcieGenSpeed[link_level] &&
> -                   !skutable->PcieLaneCount[link_level] &&
> -                   !skutable->LclkFreq[link_level])
> -                       continue;
> -
> -               pcie_table->pcie_gen[pcie_table->num_of_link_levels] =3D
> -                                       skutable->PcieGenSpeed[link_level=
];
> -               pcie_table->pcie_lane[pcie_table->num_of_link_levels] =3D
> -                                       skutable->PcieLaneCount[link_leve=
l];
> -               pcie_table->clk_freq[pcie_table->num_of_link_levels] =3D
> -                                       skutable->LclkFreq[link_level];
> -               pcie_table->num_of_link_levels++;
> -       }
> -
>         /* dcefclk dpm table setup */
>         dpm_table =3D &dpm_context->dpm_tables.dcef_table;
>         if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_DCN_BIT)) {
> @@ -3150,6 +3130,88 @@ static int smu_v13_0_0_set_power_limit(struct smu_=
context *smu,
>         return 0;
>  }
>
> +static int smu_v13_0_0_update_pcie_parameters(struct smu_context *smu,
> +                                    uint8_t pcie_gen_cap,
> +                                    uint8_t pcie_width_cap)
> +{
> +       struct smu_13_0_dpm_context *dpm_context =3D smu->smu_dpm.dpm_con=
text;
> +       struct smu_13_0_pcie_table *pcie_table =3D
> +                               &dpm_context->dpm_tables.pcie_table;
> +       int num_of_levels;
> +       uint32_t smu_pcie_arg;
> +       uint32_t link_level;
> +       struct smu_table_context *table_context =3D &smu->smu_table;
> +       PPTable_t *pptable =3D table_context->driver_pptable;
> +       SkuTable_t *skutable =3D &pptable->SkuTable;
> +       int ret =3D 0;
> +       int i;
> +
> +       pcie_table->num_of_link_levels =3D 0;
> +
> +       for (link_level =3D 0; link_level < NUM_LINK_LEVELS; link_level++=
) {
> +               if (!skutable->PcieGenSpeed[link_level] &&
> +                   !skutable->PcieLaneCount[link_level] &&
> +                   !skutable->LclkFreq[link_level])
> +                       continue;
> +
> +               pcie_table->pcie_gen[pcie_table->num_of_link_levels] =3D
> +                                       skutable->PcieGenSpeed[link_level=
];
> +               pcie_table->pcie_lane[pcie_table->num_of_link_levels] =3D
> +                                       skutable->PcieLaneCount[link_leve=
l];
> +               pcie_table->clk_freq[pcie_table->num_of_link_levels] =3D
> +                                       skutable->LclkFreq[link_level];
> +               pcie_table->num_of_link_levels++;
> +       }
> +
> +       num_of_levels =3D pcie_table->num_of_link_levels;
> +       if (!num_of_levels)
> +               return 0;
> +
> +       if (!(smu->adev->pm.pp_feature & PP_PCIE_DPM_MASK)) {
> +               if (pcie_table->pcie_gen[num_of_levels - 1] < pcie_gen_ca=
p)
> +                       pcie_gen_cap =3D pcie_table->pcie_gen[num_of_leve=
ls - 1];
> +
> +               if (pcie_table->pcie_lane[num_of_levels - 1] < pcie_width=
_cap)
> +                       pcie_width_cap =3D pcie_table->pcie_lane[num_of_l=
evels - 1];
> +
> +               /* Force all levels to use the same settings */
> +               for (i =3D 0; i < num_of_levels; i++) {
> +                       pcie_table->pcie_gen[i] =3D pcie_gen_cap;
> +                       pcie_table->pcie_lane[i] =3D pcie_width_cap;
> +                       smu_pcie_arg =3D i << 16;
> +                       smu_pcie_arg |=3D pcie_table->pcie_gen[i] << 8;
> +                       smu_pcie_arg |=3D pcie_table->pcie_lane[i];
> +
> +                       ret =3D smu_cmn_send_smc_msg_with_param(smu,
> +                                                               SMU_MSG_O=
verridePcieParameters,
> +                                                               smu_pcie_=
arg,
> +                                                               NULL);
> +                       if (ret)
> +                               break;
> +               }
> +       } else {
> +               for (i =3D 0; i < num_of_levels; i++) {
> +                       if (pcie_table->pcie_gen[i] > pcie_gen_cap ||
> +                               pcie_table->pcie_lane[i] > pcie_width_cap=
) {
> +                               pcie_table->pcie_gen[i] =3D pcie_gen_cap;
> +                               pcie_table->pcie_lane[i] =3D pcie_width_c=
ap;
> +                               smu_pcie_arg =3D i << 16;
> +                               smu_pcie_arg |=3D pcie_table->pcie_gen[i]=
 << 8;
> +                               smu_pcie_arg |=3D pcie_table->pcie_lane[i=
];
> +
> +                               ret =3D smu_cmn_send_smc_msg_with_param(s=
mu,
> +                                                                       S=
MU_MSG_OverridePcieParameters,
> +                                                                       s=
mu_pcie_arg,
> +                                                                       N=
ULL);
> +                               if (ret)
> +                                       break;
> +                       }
> +               }
> +       }
> +
> +       return ret;
> +}
> +
>  static const struct pptable_funcs smu_v13_0_0_ppt_funcs =3D {
>         .get_allowed_feature_mask =3D smu_v13_0_0_get_allowed_feature_mas=
k,
>         .set_default_dpm_table =3D smu_v13_0_0_set_default_dpm_table,
> @@ -3179,7 +3241,7 @@ static const struct pptable_funcs smu_v13_0_0_ppt_f=
uncs =3D {
>         .feature_is_enabled =3D smu_cmn_feature_is_enabled,
>         .print_clk_levels =3D smu_v13_0_0_print_clk_levels,
>         .force_clk_levels =3D smu_v13_0_0_force_clk_levels,
> -       .update_pcie_parameters =3D smu_v13_0_update_pcie_parameters,
> +       .update_pcie_parameters =3D smu_v13_0_0_update_pcie_parameters,
>         .get_thermal_temperature_range =3D smu_v13_0_0_get_thermal_temper=
ature_range,
>         .register_irq_handler =3D smu_v13_0_register_irq_handler,
>         .enable_thermal_alert =3D smu_v13_0_enable_thermal_alert,
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> index c8f4f6fb4083..e96364856e74 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> @@ -579,8 +579,6 @@ static int smu_v13_0_7_set_default_dpm_table(struct s=
mu_context *smu)
>         PPTable_t *driver_ppt =3D smu->smu_table.driver_pptable;
>         SkuTable_t *skutable =3D &driver_ppt->SkuTable;
>         struct smu_13_0_dpm_table *dpm_table;
> -       struct smu_13_0_pcie_table *pcie_table;
> -       uint32_t link_level;
>         int ret =3D 0;
>
>         /* socclk dpm table setup */
> @@ -687,24 +685,6 @@ static int smu_v13_0_7_set_default_dpm_table(struct =
smu_context *smu)
>                 dpm_table->max =3D dpm_table->dpm_levels[0].value;
>         }
>
> -       /* lclk dpm table setup */
> -       pcie_table =3D &dpm_context->dpm_tables.pcie_table;
> -       pcie_table->num_of_link_levels =3D 0;
> -       for (link_level =3D 0; link_level < NUM_LINK_LEVELS; link_level++=
) {
> -               if (!skutable->PcieGenSpeed[link_level] &&
> -                   !skutable->PcieLaneCount[link_level] &&
> -                   !skutable->LclkFreq[link_level])
> -                       continue;
> -
> -               pcie_table->pcie_gen[pcie_table->num_of_link_levels] =3D
> -                                       skutable->PcieGenSpeed[link_level=
];
> -               pcie_table->pcie_lane[pcie_table->num_of_link_levels] =3D
> -                                       skutable->PcieLaneCount[link_leve=
l];
> -               pcie_table->clk_freq[pcie_table->num_of_link_levels] =3D
> -                                       skutable->LclkFreq[link_level];
> -               pcie_table->num_of_link_levels++;
> -       }
> -
>         /* dcefclk dpm table setup */
>         dpm_table =3D &dpm_context->dpm_tables.dcef_table;
>         if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_DCN_BIT)) {
> @@ -2739,6 +2719,87 @@ static int smu_v13_0_7_set_power_limit(struct smu_=
context *smu,
>         return 0;
>  }
>
> +static int smu_v13_0_7_update_pcie_parameters(struct smu_context *smu,
> +                                    uint8_t pcie_gen_cap,
> +                                    uint8_t pcie_width_cap)
> +{
> +       struct smu_13_0_dpm_context *dpm_context =3D smu->smu_dpm.dpm_con=
text;
> +       struct smu_13_0_pcie_table *pcie_table =3D
> +                               &dpm_context->dpm_tables.pcie_table;
> +       int num_of_levels;
> +       int link_level;
> +       uint32_t smu_pcie_arg;
> +       struct smu_table_context *table_context =3D &smu->smu_table;
> +       PPTable_t *pptable =3D table_context->driver_pptable;
> +       SkuTable_t *skutable =3D &pptable->SkuTable;
> +       int ret =3D 0;
> +       int i;
> +
> +       pcie_table->num_of_link_levels =3D 0;
> +       for (link_level =3D 0; link_level < NUM_LINK_LEVELS; link_level++=
) {
> +               if (!skutable->PcieGenSpeed[link_level] &&
> +                   !skutable->PcieLaneCount[link_level] &&
> +                   !skutable->LclkFreq[link_level])
> +                       continue;
> +
> +               pcie_table->pcie_gen[pcie_table->num_of_link_levels] =3D
> +                                       skutable->PcieGenSpeed[link_level=
];
> +               pcie_table->pcie_lane[pcie_table->num_of_link_levels] =3D
> +                                       skutable->PcieLaneCount[link_leve=
l];
> +               pcie_table->clk_freq[pcie_table->num_of_link_levels] =3D
> +                                       skutable->LclkFreq[link_level];
> +               pcie_table->num_of_link_levels++;
> +       }
> +
> +       num_of_levels =3D pcie_table->num_of_link_levels;
> +       if (!num_of_levels)
> +               return 0;
> +
> +       if (!(smu->adev->pm.pp_feature & PP_PCIE_DPM_MASK)) {
> +               if (pcie_table->pcie_gen[num_of_levels - 1] < pcie_gen_ca=
p)
> +                       pcie_gen_cap =3D pcie_table->pcie_gen[num_of_leve=
ls - 1];
> +
> +               if (pcie_table->pcie_lane[num_of_levels - 1] < pcie_width=
_cap)
> +                       pcie_width_cap =3D pcie_table->pcie_lane[num_of_l=
evels - 1];
> +
> +               /* Force all levels to use the same settings */
> +               for (i =3D 0; i < num_of_levels; i++) {
> +                       pcie_table->pcie_gen[i] =3D pcie_gen_cap;
> +                       pcie_table->pcie_lane[i] =3D pcie_width_cap;
> +                       smu_pcie_arg =3D i << 16;
> +                       smu_pcie_arg |=3D pcie_table->pcie_gen[i] << 8;
> +                       smu_pcie_arg |=3D pcie_table->pcie_lane[i];
> +
> +                       ret =3D smu_cmn_send_smc_msg_with_param(smu,
> +                                                               SMU_MSG_O=
verridePcieParameters,
> +                                                               smu_pcie_=
arg,
> +                                                               NULL);
> +                       if (ret)
> +                               break;
> +               }
> +       } else {
> +               for (i =3D 0; i < num_of_levels; i++) {
> +                       if (pcie_table->pcie_gen[i] > pcie_gen_cap ||
> +                               pcie_table->pcie_lane[i] > pcie_width_cap=
) {
> +                               pcie_table->pcie_gen[i] =3D pcie_gen_cap;
> +                               pcie_table->pcie_lane[i] =3D pcie_width_c=
ap;
> +                               smu_pcie_arg =3D i << 16;
> +                               smu_pcie_arg |=3D pcie_table->pcie_gen[i]=
 << 8;
> +                               smu_pcie_arg |=3D pcie_table->pcie_lane[i=
];
> +
> +                               ret =3D smu_cmn_send_smc_msg_with_param(s=
mu,
> +                                                                       S=
MU_MSG_OverridePcieParameters,
> +                                                                       s=
mu_pcie_arg,
> +                                                                       N=
ULL);
> +                               if (ret)
> +                                       break;
> +                       }
> +               }
> +       }
> +
> +       return ret;
> +}
> +
>  static const struct pptable_funcs smu_v13_0_7_ppt_funcs =3D {
>         .get_allowed_feature_mask =3D smu_v13_0_7_get_allowed_feature_mas=
k,
>         .set_default_dpm_table =3D smu_v13_0_7_set_default_dpm_table,
> @@ -2768,7 +2829,7 @@ static const struct pptable_funcs smu_v13_0_7_ppt_f=
uncs =3D {
>         .feature_is_enabled =3D smu_cmn_feature_is_enabled,
>         .print_clk_levels =3D smu_v13_0_7_print_clk_levels,
>         .force_clk_levels =3D smu_v13_0_7_force_clk_levels,
> -       .update_pcie_parameters =3D smu_v13_0_update_pcie_parameters,
> +       .update_pcie_parameters =3D smu_v13_0_7_update_pcie_parameters,
>         .get_thermal_temperature_range =3D smu_v13_0_7_get_thermal_temper=
ature_range,
>         .register_irq_handler =3D smu_v13_0_register_irq_handler,
>         .enable_thermal_alert =3D smu_v13_0_enable_thermal_alert,
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> index d5a4abd60d06..581a4e59130a 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> @@ -502,8 +502,6 @@ static int smu_v14_0_2_set_default_dpm_table(struct s=
mu_context *smu)
>         PPTable_t *pptable =3D table_context->driver_pptable;
>         SkuTable_t *skutable =3D &pptable->SkuTable;
>         struct smu_14_0_dpm_table *dpm_table;
> -       struct smu_14_0_pcie_table *pcie_table;
> -       uint32_t link_level;
>         int ret =3D 0;
>
>         /* socclk dpm table setup */
> @@ -619,27 +617,6 @@ static int smu_v14_0_2_set_default_dpm_table(struct =
smu_context *smu)
>                 dpm_table->max =3D dpm_table->dpm_levels[0].value;
>         }
>
> -       /* lclk dpm table setup */
> -       pcie_table =3D &dpm_context->dpm_tables.pcie_table;
> -       pcie_table->num_of_link_levels =3D 0;
> -       for (link_level =3D 0; link_level < NUM_LINK_LEVELS; link_level++=
) {
> -               if (!skutable->PcieGenSpeed[link_level] &&
> -                   !skutable->PcieLaneCount[link_level] &&
> -                   !skutable->LclkFreq[link_level])
> -                       continue;
> -
> -               pcie_table->pcie_gen[pcie_table->num_of_link_levels] =3D
> -                                       skutable->PcieGenSpeed[link_level=
];
> -               pcie_table->pcie_lane[pcie_table->num_of_link_levels] =3D
> -                                       skutable->PcieLaneCount[link_leve=
l];
> -               pcie_table->clk_freq[pcie_table->num_of_link_levels] =3D
> -                                       skutable->LclkFreq[link_level];
> -               pcie_table->num_of_link_levels++;
> -
> -               if (link_level =3D=3D 0)
> -                       link_level++;
> -       }
> -
>         /* dcefclk dpm table setup */
>         dpm_table =3D &dpm_context->dpm_tables.dcef_table;
>         if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_DCN_BIT)) {
> @@ -1487,11 +1464,31 @@ static int smu_v14_0_2_update_pcie_parameters(str=
uct smu_context *smu,
>         struct smu_14_0_dpm_context *dpm_context =3D smu->smu_dpm.dpm_con=
text;
>         struct smu_14_0_pcie_table *pcie_table =3D
>                                 &dpm_context->dpm_tables.pcie_table;
> -       int num_of_levels =3D pcie_table->num_of_link_levels;
> +       int num_of_levels;
>         uint32_t smu_pcie_arg;
> +       uint32_t link_level;
> +       struct smu_table_context *table_context =3D &smu->smu_table;
> +       PPTable_t *pptable =3D table_context->driver_pptable;
> +       SkuTable_t *skutable =3D &pptable->SkuTable;
>         int ret =3D 0;
>         int i;
>
> +       pcie_table->num_of_link_levels =3D 0;
> +       for (link_level =3D 0; link_level < NUM_LINK_LEVELS; link_level++=
) {
> +               if (!skutable->PcieGenSpeed[link_level] &&
> +                   !skutable->PcieLaneCount[link_level] &&
> +                   !skutable->LclkFreq[link_level])
> +                       continue;
> +
> +               pcie_table->pcie_gen[pcie_table->num_of_link_levels] =3D
> +                                       skutable->PcieGenSpeed[link_level=
];
> +               pcie_table->pcie_lane[pcie_table->num_of_link_levels] =3D
> +                                       skutable->PcieLaneCount[link_leve=
l];
> +               pcie_table->clk_freq[pcie_table->num_of_link_levels] =3D
> +                                       skutable->LclkFreq[link_level];
> +               pcie_table->num_of_link_levels++;
> +       }
> +       num_of_levels =3D pcie_table->num_of_link_levels;
>         if (!num_of_levels)
>                 return 0;
>
> --
> 2.34.1
>
