Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CF576AB11
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Aug 2023 10:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D852A10E364;
	Tue,  1 Aug 2023 08:28:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A6B10E2ED;
 Tue,  1 Aug 2023 01:26:52 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RFHS1078mztRkt;
 Tue,  1 Aug 2023 09:23:28 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 09:26:47 +0800
Message-ID: <7fcfcbe3-6d84-66fa-afa5-bd7b94660343@huawei.com>
Date: Tue, 1 Aug 2023 09:26:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] drm/amdgpu: Remove a lot of unnecessary ternary
 operators
Content-Language: en-US
To: "Limonciello, Mario" <mario.limonciello@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <evan.quan@amd.com>, <srinivasan.shanmugam@amd.com>,
 <wangxiongfeng2@huawei.com>, <Hawking.Zhang@amd.com>, <James.Zhu@amd.com>,
 <Veerabadhran.Gopalakrishnan@amd.com>, <saleemkhan.jamadar@amd.com>,
 <le.ma@amd.com>, <tao.zhou1@amd.com>, <Jane.Jian@amd.com>,
 <Hongkun.Zhang@amd.com>, <leo.liu@amd.com>, <lijo.lazar@amd.com>,
 <Lang.Yu@amd.com>, <ruijing.dong@amd.com>, <trix@redhat.com>,
 <Suresh.Guttula@amd.com>, <David.Wu3@amd.com>, <sonny.jiang@amd.com>,
 <wenjing.liu@amd.com>, <Jun.Lei@amd.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <drv@mailo.com>, <Shiwu.Zhang@amd.com>,
 <aleksei.kodanev@bell-sw.com>, <ye.xingchen@zte.com.cn>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230731132610.2675314-1-ruanjinjie@huawei.com>
 <75d409e6-5ab8-97e8-44c3-a71e5ff1724d@amd.com>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <75d409e6-5ab8-97e8-44c3-a71e5ff1724d@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 01 Aug 2023 08:27:46 +0000
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



On 2023/8/1 0:14, Limonciello, Mario wrote:
> 
> 
> On 7/31/2023 8:26 AM, Ruan Jinjie wrote:
>> Ther are many ternary operators, the true or false judgement
>> of which is unnecessary in C language semantics.
> s/Ther/There/
> 
> Unnecessary; sure.  But don't they improve the readability quite a bit?

The benevolent people have different opinions, it's redundant in my
opinion. And there are many same operation such as “state ==
AMD_CG_STATE_GATE", which can be encapsulated into a helper.

> 
>>
>> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c       |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c         |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c         |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c       |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c          |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c          |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c        |  2 +-
>>   .../drm/amd/display/dc/dce/dce_link_encoder.c  |  4 +---
>>   .../drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  6 +++---
>>   .../amd/pm/powerplay/hwmgr/smu7_powertune.c    |  2 +-
>>   .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  | 18 +++++++-----------
>>   .../amd/pm/powerplay/smumgr/polaris10_smumgr.c |  2 +-
>>   .../drm/amd/pm/powerplay/smumgr/vegam_smumgr.c |  7 +++----
>>   13 files changed, 23 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
>> index b582b83c4984..38ccec913f00 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
>> @@ -460,7 +460,7 @@ bool amdgpu_get_bios(struct amdgpu_device *adev)
>>       return false;
>>     success:
>> -    adev->is_atom_fw = (adev->asic_type >= CHIP_VEGA10) ? true : false;
>> +    adev->is_atom_fw = adev->asic_type >= CHIP_VEGA10;
>>       return true;
>>   }
>>   diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
>> index 79791379fc2b..df4440c21bbf 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
>> @@ -479,7 +479,7 @@ static int jpeg_v3_0_set_clockgating_state(void
>> *handle,
>>                         enum amd_clockgating_state state)
>>   {
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -    bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
>> +    bool enable = state == AMD_CG_STATE_GATE;
>>         if (enable) {
>>           if (!jpeg_v3_0_is_idle(handle))
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
>> index a707d407fbd0..3eb3dcd56b57 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
>> @@ -626,7 +626,7 @@ static int jpeg_v4_0_set_clockgating_state(void
>> *handle,
>>                         enum amd_clockgating_state state)
>>   {
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -    bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
>> +    bool enable = state == AMD_CG_STATE_GATE;
>>         if (enable) {
>>           if (!jpeg_v4_0_is_idle(handle))
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
>> index ce2b22f7e4e4..153731d6ce8b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
>> @@ -785,7 +785,7 @@ static int jpeg_v4_0_3_set_clockgating_state(void
>> *handle,
>>                         enum amd_clockgating_state state)
>>   {
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -    bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
>> +    bool enable = state == AMD_CG_STATE_GATE;
>>       int i;
>>         for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> index b76ba21b5a89..9b662b105cc1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> @@ -2095,7 +2095,7 @@ static int vcn_v3_0_set_clockgating_state(void
>> *handle,
>>                         enum amd_clockgating_state state)
>>   {
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -    bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
>> +    bool enable = state == AMD_CG_STATE_GATE;
>>       int i;
>>         for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>> index 6089c7deba8a..7c486745bece 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>> @@ -1918,7 +1918,7 @@ static int vcn_v4_0_wait_for_idle(void *handle)
>>   static int vcn_v4_0_set_clockgating_state(void *handle, enum
>> amd_clockgating_state state)
>>   {
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -    bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
>> +    bool enable = state == AMD_CG_STATE_GATE;
>>       int i;
>>         for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>> index 550ac040b4be..e62472e6e7b3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>> @@ -1287,7 +1287,7 @@ static int vcn_v4_0_3_set_clockgating_state(void
>> *handle,
>>                         enum amd_clockgating_state state)
>>   {
>>       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -    bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
>> +    bool enable = state == AMD_CG_STATE_GATE;
>>       int i;
>>         for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
>> b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
>> index fa314493ffc5..e4d65de2d0bb 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
>> @@ -941,9 +941,7 @@ bool dce110_link_encoder_validate_output_with_stream(
>>       break;
>>       case SIGNAL_TYPE_EDP:
>>       case SIGNAL_TYPE_LVDS:
>> -        is_valid =
>> -            (stream->timing.
>> -                pixel_encoding == PIXEL_ENCODING_RGB) ? true : false;
>> +        is_valid = stream->timing.pixel_encoding == PIXEL_ENCODING_RGB;
>>       break;
>>       case SIGNAL_TYPE_VIRTUAL:
>>           is_valid = true;
>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
>> b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
>> index 1cb402264497..8c73016d2d17 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
>> @@ -904,7 +904,7 @@ static int smu7_setup_dpm_tables_v1(struct
>> pp_hwmgr *hwmgr)
>>                       dep_sclk_table->entries[i].clk;
>>                
>> data->dpm_table.sclk_table.dpm_levels[data->dpm_table.sclk_table.count].enabled =
>> -                    (i == 0) ? true : false;
>> +                    i == 0;
>>               data->dpm_table.sclk_table.count++;
>>           }
>>       }
>> @@ -919,7 +919,7 @@ static int smu7_setup_dpm_tables_v1(struct
>> pp_hwmgr *hwmgr)
>>              
>> data->dpm_table.mclk_table.dpm_levels[data->dpm_table.mclk_table.count].value =
>>                               dep_mclk_table->entries[i].clk;
>>              
>> data->dpm_table.mclk_table.dpm_levels[data->dpm_table.mclk_table.count].enabled =
>> -                            (i == 0) ? true : false;
>> +                            i == 0;
>>               data->dpm_table.mclk_table.count++;
>>           }
>>       }
>> @@ -1833,7 +1833,7 @@ static void smu7_init_dpm_defaults(struct
>> pp_hwmgr *hwmgr)
>>       data->enable_tdc_limit_feature = true;
>>       data->enable_pkg_pwr_tracking_feature = true;
>>       data->force_pcie_gen = PP_PCIEGenInvalid;
>> -    data->ulv_supported = hwmgr->feature_mask & PP_ULV_MASK ? true :
>> false;
>> +    data->ulv_supported = hwmgr->feature_mask & PP_ULV_MASK;
>>       data->current_profile_setting.bupdate_sclk = 1;
>>       data->current_profile_setting.sclk_up_hyst = 0;
>>       data->current_profile_setting.sclk_down_hyst = 100;
>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
>> b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
>> index 21be23ec3c79..d6eeef3c58f7 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
>> @@ -1103,7 +1103,7 @@ int smu7_enable_smc_cac(struct pp_hwmgr *hwmgr)
>>           PP_ASSERT_WITH_CODE((0 == smc_result),
>>                   "Failed to enable CAC in SMC.", result = -1);
>>   -        data->cac_enabled = (0 == smc_result) ? true : false;
>> +        data->cac_enabled = smc_result == 0;
>>       }
>>       return result;
>>   }
>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
>> b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
>> index c51dd4c74fe9..dfb9573e3f55 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
>> @@ -135,13 +135,12 @@ static void
>> vega10_set_default_registry_data(struct pp_hwmgr *hwmgr)
>>       }
>>         data->registry_data.clock_stretcher_support =
>> -            hwmgr->feature_mask & PP_CLOCK_STRETCH_MASK ? true : false;
>> +            hwmgr->feature_mask & PP_CLOCK_STRETCH_MASK;
>>   -    data->registry_data.ulv_support =
>> -            hwmgr->feature_mask & PP_ULV_MASK ? true : false;
>> +    data->registry_data.ulv_support = hwmgr->feature_mask & PP_ULV_MASK;
>>         data->registry_data.sclk_deep_sleep_support =
>> -            hwmgr->feature_mask & PP_SCLK_DEEP_SLEEP_MASK ? true :
>> false;
>> +            hwmgr->feature_mask & PP_SCLK_DEEP_SLEEP_MASK;
>>         data->registry_data.disable_water_mark = 0;
>>   @@ -150,7 +149,7 @@ static void
>> vega10_set_default_registry_data(struct pp_hwmgr *hwmgr)
>>       data->registry_data.fw_ctf_enabled = 1;
>>         data->registry_data.avfs_support =
>> -        hwmgr->feature_mask & PP_AVFS_MASK ? true : false;
>> +        hwmgr->feature_mask & PP_AVFS_MASK;
>>       data->registry_data.led_dpm_enabled = 1;
>>         data->registry_data.vr0hot_enabled = 1;
>> @@ -1375,8 +1374,7 @@ static int
>> vega10_setup_default_dpm_tables(struct pp_hwmgr *hwmgr)
>>                           dep_mm_table->entries[i].eclk) {
>>               dpm_table->dpm_levels[dpm_table->count].value =
>>                       dep_mm_table->entries[i].eclk;
>> -            dpm_table->dpm_levels[dpm_table->count].enabled =
>> -                    (i == 0) ? true : false;
>> +            dpm_table->dpm_levels[dpm_table->count].enabled = i == 0;
>>               dpm_table->count++;
>>           }
>>       }
>> @@ -1391,8 +1389,7 @@ static int
>> vega10_setup_default_dpm_tables(struct pp_hwmgr *hwmgr)
>>                           dep_mm_table->entries[i].vclk) {
>>               dpm_table->dpm_levels[dpm_table->count].value =
>>                       dep_mm_table->entries[i].vclk;
>> -            dpm_table->dpm_levels[dpm_table->count].enabled =
>> -                    (i == 0) ? true : false;
>> +            dpm_table->dpm_levels[dpm_table->count].enabled = i == 0;
>>               dpm_table->count++;
>>           }
>>       }
>> @@ -1405,8 +1402,7 @@ static int
>> vega10_setup_default_dpm_tables(struct pp_hwmgr *hwmgr)
>>                           dep_mm_table->entries[i].dclk) {
>>               dpm_table->dpm_levels[dpm_table->count].value =
>>                       dep_mm_table->entries[i].dclk;
>> -            dpm_table->dpm_levels[dpm_table->count].enabled =
>> -                    (i == 0) ? true : false;
>> +            dpm_table->dpm_levels[dpm_table->count].enabled = i == 0;
>>               dpm_table->count++;
>>           }
>>       }
>> diff --git
>> a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
>> b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
>> index e7ed2a7adf8f..ff6b563ecbf5 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
>> @@ -1888,7 +1888,7 @@ static int
>> polaris10_populate_avfs_parameters(struct pp_hwmgr *hwmgr)
>>                           (avfs_params.ucEnableGB_VDROOP_TABLE_CKSOFF
>> << BTCGB1_Vdroop_Enable_SHIFT) |
>>                           (avfs_params.ucEnableGB_FUSE_TABLE_CKSON <<
>> AVFSGB0_Vdroop_Enable_SHIFT) |
>>                           (avfs_params.ucEnableGB_FUSE_TABLE_CKSOFF <<
>> AVFSGB1_Vdroop_Enable_SHIFT);
>> -        data->apply_avfs_cks_off_voltage =
>> (avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1) ? true : false;
>> +        data->apply_avfs_cks_off_voltage =
>> avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1;
>>       }
>>       return result;
>>   }
>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
>> b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
>> index 7d024d3facef..34c9f59b889a 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
>> @@ -295,9 +295,8 @@ static int vegam_process_firmware_header(struct
>> pp_hwmgr *hwmgr)
>>     static bool vegam_is_dpm_running(struct pp_hwmgr *hwmgr)
>>   {
>> -    return (1 == PHM_READ_INDIRECT_FIELD(hwmgr->device,
>> -            CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON))
>> -            ? true : false;
>> +    return 1 == PHM_READ_INDIRECT_FIELD(hwmgr->device,
>> +            CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON);
>>   }
>>     static uint32_t vegam_get_mac_definition(uint32_t value)
>> @@ -1660,7 +1659,7 @@ static int vegam_populate_avfs_parameters(struct
>> pp_hwmgr *hwmgr)
>>                   (avfs_params.ucEnableGB_FUSE_TABLE_CKSON <<
>> AVFSGB0_Vdroop_Enable_SHIFT) |
>>                   (avfs_params.ucEnableGB_FUSE_TABLE_CKSOFF <<
>> AVFSGB1_Vdroop_Enable_SHIFT);
>>           data->apply_avfs_cks_off_voltage =
>> -                (avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1)
>> ? true : false;
>> +                avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1;
>>       }
>>       return result;
>>   }
