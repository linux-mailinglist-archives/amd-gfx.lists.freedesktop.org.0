Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16786956509
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2024 09:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEBB10E1E0;
	Mon, 19 Aug 2024 07:54:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA2F10E1E0
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2024 07:54:00 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-428163f7635so35076955e9.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2024 00:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724054038; x=1724658838;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FlZwT6pjnvc9A8xGJk3o0Yg5cdbBO3XgHnFjzhYbPO4=;
 b=q3ed2yPUbO0ry9eDt1wDrdwfKbQ1NSb+mRRe8VFDsotb8DWYZD1h9jBwgtmdJbhCgY
 d+ZoLQ62N7DWmoRoSgivIE8hvwQduZkzESHXC4mG3Ilyd8dRgeTWq18QjnYeTxnMXZG4
 RbOwfv3RzVyiaNP6B8ocAYvzD4Z9TPvGSZxBQhd45zJ5bfxxVBQQVdJ+3aMMVx3FnhPB
 NCt/XZtlbDlKLzs+Ub0cb+/88PK1Di4o95sxfabQMidYVr+7Ff/dChW3M6qFlebrdWBM
 NkjOnJ/w1uxyRdlRGRGSO7ok2usclUK7pPQ9tRQ9nGnQwz0RT/stzRIrJnWfFEmqGGMU
 RN/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuh+LqJV7zss3DF8/EaJl4MIIdpbo4I1jfK00fDQlwzAQ4sFwm00mGdoUEDEzWMzrpU9H+nAI4QPGFC+F2TtyeUv7rOyPNgxPrwSzRyQ==
X-Gm-Message-State: AOJu0YxueF9sSKuKrVhCf+Sn+RZWwnf5Wig2H/tBeblviXL0GbyjpJxz
 KXI/TbVKaUDyTHTb+B1ft43oXMxH1zTyX9R+6Eon4Cw6UpJnXvmK
X-Google-Smtp-Source: AGHT+IGEgc7+JflSiRqI8UnzUT+yjtcH73j7nJZgkYF/IrNv0YcfWciwBp2bAjhFSET5NcGSFS+zPA==
X-Received: by 2002:a05:600c:1c25:b0:429:a0d:b710 with SMTP id
 5b1f17b1804b1-429ed79c76fmr61397605e9.12.1724054038179; 
 Mon, 19 Aug 2024 00:53:58 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:69? ([2a0b:e7c0:0:107::aaaa:69])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded287d0sm154144485e9.12.2024.08.19.00.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 00:53:57 -0700 (PDT)
Message-ID: <0155b806-628b-4db7-ac87-7ba21013aefd@kernel.org>
Date: Mon, 19 Aug 2024 09:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.10 090/263] drm/amdgpu/pm: Fix the param type of
 set_power_profile_mode
From: Jiri Slaby <jirislaby@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Xinhui.Pan@amd.com,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20240812160146.517184156@linuxfoundation.org>
 <20240812160149.990704280@linuxfoundation.org>
 <ecca67e7-4c71-4b51-a271-5066cb77a601@kernel.org>
Content-Language: en-US
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <ecca67e7-4c71-4b51-a271-5066cb77a601@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

FTR:
Delivery has failed to these recipients or groups:
Ma Jun (Jun.Ma2@amd.com)
The email address you entered couldn't be found

So the author of the patch CANNOT respond. Anyone else?

On 19. 08. 24, 9:49, Jiri Slaby wrote:
> On 12. 08. 24, 18:01, Greg Kroah-Hartman wrote:
>> 6.10-stable review patch.  If anyone has any objections, please let me 
>> know.
>>
>> ------------------
>>
>> From: Ma Jun <Jun.Ma2@amd.com>
>>
>> [ Upstream commit f683f24093dd94a831085fe0ea8e9dc4c6c1a2d1 ]
>>
>> Function .set_power_profile_mode need an array as input
>> parameter.
> 
> Which one and why?
> 
> static int smu_bump_power_profile_mode(struct smu_context *smu,
>                                             long *param,
>                                             uint32_t param_size)
> 
>    int (*set_power_profile_mode)(struct smu_context *smu, long *input, 
> uint32_t size);
> 
> static int pp_set_power_profile_mode(void *handle, long *input, uint32_t 
> size)
> 
>    int (*set_power_profile_mode)(struct pp_hwmgr *hwmgr, long *input, 
> uint32_t size);
> 
> static int smu10_set_power_profile_mode(struct pp_hwmgr *hwmgr, long 
> *input, uint32_t size)
> {
>          int workload_type = 0;
>          int result = 0;
> 
>          if (input[size] > PP_SMC_POWER_PROFILE_COMPUTE) {
> 
> 
> There is absolutely no problem doing input[0] when a pointer to a local 
> non-array variable is passed, is it?
> 
>> So define variable workload as an array to fix
>> the below coverity warning.
> 
> This very much looks like one of many Coverity false positives.
> 
>> "Passing &workload to function hwmgr->hwmgr_func->set_power_profile_mode
>> which uses it as an array. This might corrupt or misinterpret adjacent
>> memory locations"
> 
> Care to explain how this fixes anything but a Coverity false positive? 
> Why was this included in a stable tree at all?
> 
>> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ...
>> --- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
>> @@ -929,7 +929,7 @@ static int pp_dpm_switch_power_profile(void *handle,
>>           enum PP_SMC_POWER_PROFILE type, bool en)
>>   {
>>       struct pp_hwmgr *hwmgr = handle;
>> -    long workload;
>> +    long workload[1];
> 
> This only obfuscates the code. So please revert this if you cannot 
> explain what real issue this actually fixes.
> 
>>       uint32_t index;
>>       if (!hwmgr || !hwmgr->pm_en)
>> @@ -947,12 +947,12 @@ static int pp_dpm_switch_power_profile(void 
>> *handle,
>>           hwmgr->workload_mask &= ~(1 << hwmgr->workload_prority[type]);
>>           index = fls(hwmgr->workload_mask);
>>           index = index > 0 && index <= Workload_Policy_Max ? index - 
>> 1 : 0;
>> -        workload = hwmgr->workload_setting[index];
>> +        workload[0] = hwmgr->workload_setting[index];
>>       } else {
>>           hwmgr->workload_mask |= (1 << hwmgr->workload_prority[type]);
>>           index = fls(hwmgr->workload_mask);
>>           index = index <= Workload_Policy_Max ? index - 1 : 0;
>> -        workload = hwmgr->workload_setting[index];
>> +        workload[0] = hwmgr->workload_setting[index];
>>       }
>>       if (type == PP_SMC_POWER_PROFILE_COMPUTE &&
>> @@ -962,7 +962,7 @@ static int pp_dpm_switch_power_profile(void *handle,
>>       }
>>       if (hwmgr->dpm_level != AMD_DPM_FORCED_LEVEL_MANUAL)
>> -        hwmgr->hwmgr_func->set_power_profile_mode(hwmgr, &workload, 0);
>> +        hwmgr->hwmgr_func->set_power_profile_mode(hwmgr, workload, 0);
>>       return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c 
>> b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c
>> index 1d829402cd2e2..f4bd8e9357e22 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c
>> @@ -269,7 +269,7 @@ int psm_adjust_power_state_dynamic(struct pp_hwmgr 
>> *hwmgr, bool skip_display_set
>>                           struct pp_power_state *new_ps)
>>   {
>>       uint32_t index;
>> -    long workload;
>> +    long workload[1];
>>       if (hwmgr->not_vf) {
>>           if (!skip_display_settings)
>> @@ -294,10 +294,10 @@ int psm_adjust_power_state_dynamic(struct 
>> pp_hwmgr *hwmgr, bool skip_display_set
>>       if (hwmgr->dpm_level != AMD_DPM_FORCED_LEVEL_MANUAL) {
>>           index = fls(hwmgr->workload_mask);
>>           index = index > 0 && index <= Workload_Policy_Max ? index - 
>> 1 : 0;
>> -        workload = hwmgr->workload_setting[index];
>> +        workload[0] = hwmgr->workload_setting[index];
>> -        if (hwmgr->power_profile_mode != workload && 
>> hwmgr->hwmgr_func->set_power_profile_mode)
>> -            hwmgr->hwmgr_func->set_power_profile_mode(hwmgr, 
>> &workload, 0);
>> +        if (hwmgr->power_profile_mode != workload[0] && 
>> hwmgr->hwmgr_func->set_power_profile_mode)
>> +            hwmgr->hwmgr_func->set_power_profile_mode(hwmgr, 
>> workload, 0);
>>       }
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c 
>> b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> index e1796ecf9c05c..06409133b09b1 100644
>> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> @@ -2220,7 +2220,7 @@ static int smu_adjust_power_state_dynamic(struct 
>> smu_context *smu,
>>   {
>>       int ret = 0;
>>       int index = 0;
>> -    long workload;
>> +    long workload[1];
>>       struct smu_dpm_context *smu_dpm_ctx = &(smu->smu_dpm);
>>       if (!skip_display_settings) {
>> @@ -2260,10 +2260,10 @@ static int 
>> smu_adjust_power_state_dynamic(struct smu_context *smu,
>>           smu_dpm_ctx->dpm_level != 
>> AMD_DPM_FORCED_LEVEL_PERF_DETERMINISM) {
>>           index = fls(smu->workload_mask);
>>           index = index > 0 && index <= WORKLOAD_POLICY_MAX ? index - 
>> 1 : 0;
>> -        workload = smu->workload_setting[index];
>> +        workload[0] = smu->workload_setting[index];
>> -        if (smu->power_profile_mode != workload)
>> -            smu_bump_power_profile_mode(smu, &workload, 0);
>> +        if (smu->power_profile_mode != workload[0])
>> +            smu_bump_power_profile_mode(smu, workload, 0);
>>       }
>>       return ret;
>> @@ -2313,7 +2313,7 @@ static int smu_switch_power_profile(void *handle,
>>   {
>>       struct smu_context *smu = handle;
>>       struct smu_dpm_context *smu_dpm_ctx = &(smu->smu_dpm);
>> -    long workload;
>> +    long workload[1];
>>       uint32_t index;
>>       if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
>> @@ -2326,17 +2326,17 @@ static int smu_switch_power_profile(void *handle,
>>           smu->workload_mask &= ~(1 << smu->workload_prority[type]);
>>           index = fls(smu->workload_mask);
>>           index = index > 0 && index <= WORKLOAD_POLICY_MAX ? index - 
>> 1 : 0;
>> -        workload = smu->workload_setting[index];
>> +        workload[0] = smu->workload_setting[index];
>>       } else {
>>           smu->workload_mask |= (1 << smu->workload_prority[type]);
>>           index = fls(smu->workload_mask);
>>           index = index <= WORKLOAD_POLICY_MAX ? index - 1 : 0;
>> -        workload = smu->workload_setting[index];
>> +        workload[0] = smu->workload_setting[index];
>>       }
>>       if (smu_dpm_ctx->dpm_level != AMD_DPM_FORCED_LEVEL_MANUAL &&
>>           smu_dpm_ctx->dpm_level != 
>> AMD_DPM_FORCED_LEVEL_PERF_DETERMINISM)
>> -        smu_bump_power_profile_mode(smu, &workload, 0);
>> +        smu_bump_power_profile_mode(smu, workload, 0);
>>       return 0;
>>   }
> 
> thanks,

-- 
js
suse labs

