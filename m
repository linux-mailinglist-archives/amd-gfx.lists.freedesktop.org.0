Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 262991303B2
	for <lists+amd-gfx@lfdr.de>; Sat,  4 Jan 2020 17:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414C16E03D;
	Sat,  4 Jan 2020 16:57:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6516E03D
 for <amd-gfx@lists.freedesktop.org>; Sat,  4 Jan 2020 16:57:14 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t2so45181663wrr.1
 for <amd-gfx@lists.freedesktop.org>; Sat, 04 Jan 2020 08:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vphjvCp0H61tr+Wvd3PcDp/pW9hNmjhCepPVI2MRC58=;
 b=CNqg0JMnJXA9KZfcL+w01+BHTADuEx8g81q+FuHSIDICizUoaKq8je3J/WgOi5kv71
 1bTUgrqD2FJ2hYLtSF6KTQrtYfnb9IDPgZ59y53hVmO7Kcz9bnaubfO3AOMGEb/lwak0
 KHvxNx3twtSSV7rO6X33U2K1RiST3uMbzoeJmDGtvNzjbJ1rpeiSSP1Pu1cDEEv6IHy4
 LyYT3uEtYEVZDEDj9ledubGqed12XqSkzYh4m3lUEkmwMDNc4l5CW8WeGXB5uR+LgEsi
 s2NLsFyb8FA/eKQVTJT64z2xTGqJBjyEqQhhKPc+4NSLh9AheZOL0tGMI2WlDgUxRC6+
 yAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vphjvCp0H61tr+Wvd3PcDp/pW9hNmjhCepPVI2MRC58=;
 b=Pe7xU6UQ9pd5A7XiLx5qgBEKqLJ/j8YiHtSDnf2cDV0WyXyIlESaU2hy+h9fV/cfyy
 I+c9BXC7+6OeOKwCwbZJeUylKTPfB6m2K2EE2hPd1LP8fpjqV8FyJKqqposIsOegpvmP
 rN8L+Kq/rnqU2cVboltu6HZs7/RrvDUMoEd7PnuZBqChXWLYMtfdWV5F1MUKK0/0OEZ0
 uWn6ExQ7j5K2MecWIE6lSfwBAkPHWWET/yPhIXGwg4+3lOEHWstryXMqRN2+xsJz5F8s
 hLRdgCb3g30zIoMFSL5qWKwL49JLlMlBetKnePH9Srxe0/1mEWEWCIFd79tqHJbg4b5N
 rgyw==
X-Gm-Message-State: APjAAAX1YZddGs0ZL1ZY34pBQZxANCkgM4LfVo5Ix3w6/iT8M1wMS2VR
 2STfyngz7fElm+KKt22aW/IbuXx9KzHAtNL+8pfb/A==
X-Google-Smtp-Source: APXvYqyTX9QLIQf8i4xe2bZMcR6mmR0oQASlbn3XNedHN9mnGO4Rxlh5gaFNooUIigSHYRY/Ha+OrKfjMmvNTRON4ds=
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr95503865wrn.50.1578157033417; 
 Sat, 04 Jan 2020 08:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20200102023943.11555-1-evan.quan@amd.com>
In-Reply-To: <20200102023943.11555-1-evan.quan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sat, 4 Jan 2020 11:57:01 -0500
Message-ID: <CADnq5_MOpGfsJ+gxNi0KZP5E=Ake-jzTJCSZS7Pz2cnD42T8Mg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: unified VRAM address for driver table
 interaction with SMU V2
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Jan 1, 2020 at 9:40 PM Evan Quan <evan.quan@amd.com> wrote:
>
> By this, we can avoid to pass in the VRAM address on every table
> transferring. That puts extra unnecessary traffics on SMU on
> some cases(e.g. polling the amdgpu_pm_info sysfs interface).
>
> V2: document what the driver table is for and how it works
>
> Change-Id: Ifb74d9cd89790b301e88d472b29cdb9b0365b65a
> Signed-off-by: Evan Quan <evan.quan@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c    | 98 ++++++++++++-------
>  drivers/gpu/drm/amd/powerplay/arcturus_ppt.c  |  3 +-
>  .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h    | 10 ++
>  drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h |  2 +
>  drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h |  2 +
>  drivers/gpu/drm/amd/powerplay/navi10_ppt.c    |  1 +
>  drivers/gpu/drm/amd/powerplay/renoir_ppt.c    |  1 +
>  drivers/gpu/drm/amd/powerplay/smu_internal.h  |  2 +
>  drivers/gpu/drm/amd/powerplay/smu_v11_0.c     | 18 ++++
>  drivers/gpu/drm/amd/powerplay/smu_v12_0.c     | 26 +++--
>  drivers/gpu/drm/amd/powerplay/vega20_ppt.c    |  1 +
>  11 files changed, 117 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> index 95238ad38de8..beea4d9e82d4 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -519,26 +519,19 @@ int smu_update_table(struct smu_context *smu, enum smu_table_id table_index, int
>  {
>         struct smu_table_context *smu_table = &smu->smu_table;
>         struct amdgpu_device *adev = smu->adev;
> -       struct smu_table *table = NULL;
> -       int ret = 0;
> +       struct smu_table *table = &smu_table->driver_table;
>         int table_id = smu_table_get_index(smu, table_index);
> +       uint32_t table_size;
> +       int ret = 0;
>
>         if (!table_data || table_id >= SMU_TABLE_COUNT || table_id < 0)
>                 return -EINVAL;
>
> -       table = &smu_table->tables[table_index];
> +       table_size = smu_table->tables[table_index].size;
>
>         if (drv2smu)
> -               memcpy(table->cpu_addr, table_data, table->size);
> +               memcpy(table->cpu_addr, table_data, table_size);
>
> -       ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetDriverDramAddrHigh,
> -                                         upper_32_bits(table->mc_address));
> -       if (ret)
> -               return ret;
> -       ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetDriverDramAddrLow,
> -                                         lower_32_bits(table->mc_address));
> -       if (ret)
> -               return ret;
>         ret = smu_send_smc_msg_with_param(smu, drv2smu ?
>                                           SMU_MSG_TransferTableDram2Smu :
>                                           SMU_MSG_TransferTableSmu2Dram,
> @@ -550,7 +543,7 @@ int smu_update_table(struct smu_context *smu, enum smu_table_id table_index, int
>         adev->nbio.funcs->hdp_flush(adev, NULL);
>
>         if (!drv2smu)
> -               memcpy(table_data, table->cpu_addr, table->size);
> +               memcpy(table_data, table->cpu_addr, table_size);
>
>         return ret;
>  }
> @@ -976,32 +969,56 @@ static int smu_init_fb_allocations(struct smu_context *smu)
>         struct amdgpu_device *adev = smu->adev;
>         struct smu_table_context *smu_table = &smu->smu_table;
>         struct smu_table *tables = smu_table->tables;
> +       struct smu_table *driver_table = &(smu_table->driver_table);
> +       uint32_t max_table_size = 0;
>         int ret, i;
>
> -       for (i = 0; i < SMU_TABLE_COUNT; i++) {
> -               if (tables[i].size == 0)
> -                       continue;
> +       /* VRAM allocation for tool table */
> +       if (tables[SMU_TABLE_PMSTATUSLOG].size) {
>                 ret = amdgpu_bo_create_kernel(adev,
> -                                             tables[i].size,
> -                                             tables[i].align,
> -                                             tables[i].domain,
> -                                             &tables[i].bo,
> -                                             &tables[i].mc_address,
> -                                             &tables[i].cpu_addr);
> -               if (ret)
> -                       goto failed;
> +                                             tables[SMU_TABLE_PMSTATUSLOG].size,
> +                                             tables[SMU_TABLE_PMSTATUSLOG].align,
> +                                             tables[SMU_TABLE_PMSTATUSLOG].domain,
> +                                             &tables[SMU_TABLE_PMSTATUSLOG].bo,
> +                                             &tables[SMU_TABLE_PMSTATUSLOG].mc_address,
> +                                             &tables[SMU_TABLE_PMSTATUSLOG].cpu_addr);
> +               if (ret) {
> +                       pr_err("VRAM allocation for tool table failed!\n");
> +                       return ret;
> +               }
>         }
>
> -       return 0;
> -failed:
> -       while (--i >= 0) {
> +       /* VRAM allocation for driver table */
> +       for (i = 0; i < SMU_TABLE_COUNT; i++) {
>                 if (tables[i].size == 0)
>                         continue;
> -               amdgpu_bo_free_kernel(&tables[i].bo,
> -                                     &tables[i].mc_address,
> -                                     &tables[i].cpu_addr);
>
> +               if (i == SMU_TABLE_PMSTATUSLOG)
> +                       continue;
> +
> +               if (max_table_size < tables[i].size)
> +                       max_table_size = tables[i].size;
> +       }
> +
> +       driver_table->size = max_table_size;
> +       driver_table->align = PAGE_SIZE;
> +       driver_table->domain = AMDGPU_GEM_DOMAIN_VRAM;
> +
> +       ret = amdgpu_bo_create_kernel(adev,
> +                                     driver_table->size,
> +                                     driver_table->align,
> +                                     driver_table->domain,
> +                                     &driver_table->bo,
> +                                     &driver_table->mc_address,
> +                                     &driver_table->cpu_addr);
> +       if (ret) {
> +               pr_err("VRAM allocation for driver table failed!\n");
> +               if (tables[SMU_TABLE_PMSTATUSLOG].mc_address)
> +                       amdgpu_bo_free_kernel(&tables[SMU_TABLE_PMSTATUSLOG].bo,
> +                                             &tables[SMU_TABLE_PMSTATUSLOG].mc_address,
> +                                             &tables[SMU_TABLE_PMSTATUSLOG].cpu_addr);
>         }
> +
>         return ret;
>  }
>
> @@ -1009,18 +1026,19 @@ static int smu_fini_fb_allocations(struct smu_context *smu)
>  {
>         struct smu_table_context *smu_table = &smu->smu_table;
>         struct smu_table *tables = smu_table->tables;
> -       uint32_t i = 0;
> +       struct smu_table *driver_table = &(smu_table->driver_table);
>
>         if (!tables)
>                 return 0;
>
> -       for (i = 0; i < SMU_TABLE_COUNT; i++) {
> -               if (tables[i].size == 0)
> -                       continue;
> -               amdgpu_bo_free_kernel(&tables[i].bo,
> -                                     &tables[i].mc_address,
> -                                     &tables[i].cpu_addr);
> -       }
> +       if (tables[SMU_TABLE_PMSTATUSLOG].mc_address)
> +               amdgpu_bo_free_kernel(&tables[SMU_TABLE_PMSTATUSLOG].bo,
> +                                     &tables[SMU_TABLE_PMSTATUSLOG].mc_address,
> +                                     &tables[SMU_TABLE_PMSTATUSLOG].cpu_addr);
> +
> +       amdgpu_bo_free_kernel(&driver_table->bo,
> +                             &driver_table->mc_address,
> +                             &driver_table->cpu_addr);
>
>         return 0;
>  }
> @@ -1091,6 +1109,10 @@ static int smu_smc_table_hw_init(struct smu_context *smu,
>
>         /* smu_dump_pptable(smu); */
>
> +       ret = smu_set_driver_table_location(smu);
> +       if (ret)
> +               return ret;
> +
>         /*
>          * Copy pptable bo in the vram to smc with SMU MSGs such as
>          * SetDriverDramAddr and TransferTableDram2Smu.
> diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> index 50b317f4b1e6..064b5201a8a7 100644
> --- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> @@ -2022,7 +2022,7 @@ static int arcturus_i2c_eeprom_read_data(struct i2c_adapter *control,
>         SwI2cRequest_t req;
>         struct amdgpu_device *adev = to_amdgpu_device(control);
>         struct smu_table_context *smu_table = &adev->smu.smu_table;
> -       struct smu_table *table = &smu_table->tables[SMU_TABLE_I2C_COMMANDS];
> +       struct smu_table *table = &smu_table->driver_table;
>
>         memset(&req, 0, sizeof(req));
>         arcturus_fill_eeprom_i2c_req(&req, false, address, numbytes, data);
> @@ -2261,6 +2261,7 @@ static const struct pptable_funcs arcturus_ppt_funcs = {
>         .check_fw_version = smu_v11_0_check_fw_version,
>         .write_pptable = smu_v11_0_write_pptable,
>         .set_min_dcef_deep_sleep = smu_v11_0_set_min_dcef_deep_sleep,
> +       .set_driver_table_location = smu_v11_0_set_driver_table_location,
>         .set_tool_table_location = smu_v11_0_set_tool_table_location,
>         .notify_memory_pool_location = smu_v11_0_notify_memory_pool_location,
>         .system_features_control = smu_v11_0_system_features_control,
> diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> index 02d33b50e735..b0591a8dda41 100644
> --- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> @@ -260,6 +260,15 @@ struct smu_table_context
>         struct smu_bios_boot_up_values  boot_values;
>         void                            *driver_pptable;
>         struct smu_table                *tables;
> +       /*
> +        * The driver table is just a staging buffer for
> +        * uploading/downloading content from the SMU.
> +        *
> +        * And the table_id for SMU_MSG_TransferTableSmu2Dram/
> +        * SMU_MSG_TransferTableDram2Smu instructs SMU
> +        * which content driver is interested.
> +        */
> +       struct smu_table                driver_table;
>         struct smu_table                memory_pool;
>         uint8_t                         thermal_controller_type;
>
> @@ -498,6 +507,7 @@ struct pptable_funcs {
>         int (*set_gfx_cgpg)(struct smu_context *smu, bool enable);
>         int (*write_pptable)(struct smu_context *smu);
>         int (*set_min_dcef_deep_sleep)(struct smu_context *smu);
> +       int (*set_driver_table_location)(struct smu_context *smu);
>         int (*set_tool_table_location)(struct smu_context *smu);
>         int (*notify_memory_pool_location)(struct smu_context *smu);
>         int (*set_last_dcef_min_deep_sleep_clk)(struct smu_context *smu);
> diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
> index db3f78676aeb..662989296174 100644
> --- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
> +++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
> @@ -170,6 +170,8 @@ int smu_v11_0_write_pptable(struct smu_context *smu);
>
>  int smu_v11_0_set_min_dcef_deep_sleep(struct smu_context *smu);
>
> +int smu_v11_0_set_driver_table_location(struct smu_context *smu);
> +
>  int smu_v11_0_set_tool_table_location(struct smu_context *smu);
>
>  int smu_v11_0_notify_memory_pool_location(struct smu_context *smu);
> diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h b/drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h
> index 3f1cd06e273c..d79e54b5ebf6 100644
> --- a/drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h
> +++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h
> @@ -90,4 +90,6 @@ int smu_v12_0_mode2_reset(struct smu_context *smu);
>  int smu_v12_0_set_soft_freq_limited_range(struct smu_context *smu, enum smu_clk_type clk_type,
>                             uint32_t min, uint32_t max);
>
> +int smu_v12_0_set_driver_table_location(struct smu_context *smu);
> +
>  #endif
> diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> index bb0915a6388e..a16af3a3843c 100644
> --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -2112,6 +2112,7 @@ static const struct pptable_funcs navi10_ppt_funcs = {
>         .check_fw_version = smu_v11_0_check_fw_version,
>         .write_pptable = smu_v11_0_write_pptable,
>         .set_min_dcef_deep_sleep = smu_v11_0_set_min_dcef_deep_sleep,
> +       .set_driver_table_location = smu_v11_0_set_driver_table_location,
>         .set_tool_table_location = smu_v11_0_set_tool_table_location,
>         .notify_memory_pool_location = smu_v11_0_notify_memory_pool_location,
>         .system_features_control = smu_v11_0_system_features_control,
> diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
> index 506cc6bf4bc0..861e6410363b 100644
> --- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
> @@ -920,6 +920,7 @@ static const struct pptable_funcs renoir_ppt_funcs = {
>         .get_dpm_ultimate_freq = smu_v12_0_get_dpm_ultimate_freq,
>         .mode2_reset = smu_v12_0_mode2_reset,
>         .set_soft_freq_limited_range = smu_v12_0_set_soft_freq_limited_range,
> +       .set_driver_table_location = smu_v12_0_set_driver_table_location,
>  };
>
>  void renoir_set_ppt_funcs(struct smu_context *smu)
> diff --git a/drivers/gpu/drm/amd/powerplay/smu_internal.h b/drivers/gpu/drm/amd/powerplay/smu_internal.h
> index 77864e4236c4..783319ec8bf9 100644
> --- a/drivers/gpu/drm/amd/powerplay/smu_internal.h
> +++ b/drivers/gpu/drm/amd/powerplay/smu_internal.h
> @@ -61,6 +61,8 @@
>         ((smu)->ppt_funcs->write_pptable ? (smu)->ppt_funcs->write_pptable((smu)) : 0)
>  #define smu_set_min_dcef_deep_sleep(smu) \
>         ((smu)->ppt_funcs->set_min_dcef_deep_sleep ? (smu)->ppt_funcs->set_min_dcef_deep_sleep((smu)) : 0)
> +#define smu_set_driver_table_location(smu) \
> +       ((smu)->ppt_funcs->set_driver_table_location ? (smu)->ppt_funcs->set_driver_table_location((smu)) : 0)
>  #define smu_set_tool_table_location(smu) \
>         ((smu)->ppt_funcs->set_tool_table_location ? (smu)->ppt_funcs->set_tool_table_location((smu)) : 0)
>  #define smu_notify_memory_pool_location(smu) \
> diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> index 6fb93eb6ab39..e804f9854027 100644
> --- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> +++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> @@ -776,6 +776,24 @@ int smu_v11_0_set_min_dcef_deep_sleep(struct smu_context *smu)
>         return smu_v11_0_set_deep_sleep_dcefclk(smu, table_context->boot_values.dcefclk / 100);
>  }
>
> +int smu_v11_0_set_driver_table_location(struct smu_context *smu)
> +{
> +       struct smu_table *driver_table = &smu->smu_table.driver_table;
> +       int ret = 0;
> +
> +       if (driver_table->mc_address) {
> +               ret = smu_send_smc_msg_with_param(smu,
> +                               SMU_MSG_SetDriverDramAddrHigh,
> +                               upper_32_bits(driver_table->mc_address));
> +               if (!ret)
> +                       ret = smu_send_smc_msg_with_param(smu,
> +                               SMU_MSG_SetDriverDramAddrLow,
> +                               lower_32_bits(driver_table->mc_address));
> +       }
> +
> +       return ret;
> +}
> +
>  int smu_v11_0_set_tool_table_location(struct smu_context *smu)
>  {
>         int ret = 0;
> diff --git a/drivers/gpu/drm/amd/powerplay/smu_v12_0.c b/drivers/gpu/drm/amd/powerplay/smu_v12_0.c
> index 9e27462d0f4e..870e6db2907e 100644
> --- a/drivers/gpu/drm/amd/powerplay/smu_v12_0.c
> +++ b/drivers/gpu/drm/amd/powerplay/smu_v12_0.c
> @@ -318,14 +318,6 @@ int smu_v12_0_fini_smc_tables(struct smu_context *smu)
>  int smu_v12_0_populate_smc_tables(struct smu_context *smu)
>  {
>         struct smu_table_context *smu_table = &smu->smu_table;
> -       struct smu_table *table = NULL;
> -
> -       table = &smu_table->tables[SMU_TABLE_DPMCLOCKS];
> -       if (!table)
> -               return -EINVAL;
> -
> -       if (!table->cpu_addr)
> -               return -EINVAL;
>
>         return smu_update_table(smu, SMU_TABLE_DPMCLOCKS, 0, smu_table->clocks_table, false);
>  }
> @@ -514,3 +506,21 @@ int smu_v12_0_set_soft_freq_limited_range(struct smu_context *smu, enum smu_clk_
>
>         return ret;
>  }
> +
> +int smu_v12_0_set_driver_table_location(struct smu_context *smu)
> +{
> +       struct smu_table *driver_table = &smu->smu_table.driver_table;
> +       int ret = 0;
> +
> +       if (driver_table->mc_address) {
> +               ret = smu_send_smc_msg_with_param(smu,
> +                               SMU_MSG_SetDriverDramAddrHigh,
> +                               upper_32_bits(driver_table->mc_address));
> +               if (!ret)
> +                       ret = smu_send_smc_msg_with_param(smu,
> +                               SMU_MSG_SetDriverDramAddrLow,
> +                               lower_32_bits(driver_table->mc_address));
> +       }
> +
> +       return ret;
> +}
> diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> index 27bdcdeb08d9..38febd5ca4da 100644
> --- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> @@ -3236,6 +3236,7 @@ static const struct pptable_funcs vega20_ppt_funcs = {
>         .check_fw_version = smu_v11_0_check_fw_version,
>         .write_pptable = smu_v11_0_write_pptable,
>         .set_min_dcef_deep_sleep = smu_v11_0_set_min_dcef_deep_sleep,
> +       .set_driver_table_location = smu_v11_0_set_driver_table_location,
>         .set_tool_table_location = smu_v11_0_set_tool_table_location,
>         .notify_memory_pool_location = smu_v11_0_notify_memory_pool_location,
>         .system_features_control = smu_v11_0_system_features_control,
> --
> 2.24.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
