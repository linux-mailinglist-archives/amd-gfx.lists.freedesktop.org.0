Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83301AD927A
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Jun 2025 18:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAE310EA32;
	Fri, 13 Jun 2025 16:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="R7UYCCYF";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A8F10E197
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Jun 2025 21:10:03 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2352e3db62cso13913385ad.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Jun 2025 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749762603; x=1750367403;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=PexcpAOOtkiKpS0ImSN7hb8qJkrQBZztkR4qfhcbAPg=;
 b=R7UYCCYFfvCkQ/ml4js/PSnokZww2KrRGIa0ATp4DH8N9yqbDU0BhrvEODmvVY7tlH
 KMmmnZ/O2/afURIRguHteSWvIBiylv3QbEmDjo51EEm+nm6qvDW5+szJEIcUB6qxbtJQ
 mu1kyBHh6ZsVREHDiMr8Uv+UK0Msk2Sf8mhYPo6aaEPeL2dedZKDW1VgqwXL3EmuPGVW
 PzGcL2FLFD615Su53rIRWDfK1J+hgGeGlh2GkUM4zX/JFo/Tg/IVBqXDADF1oPJyoFcO
 citT1E5BdmmNNGqmiZH8Wnl1ddJjQ5wqT7K4lfq2+ECDhNFo4P0MWhsXbmeO3uW1Fnu9
 nW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749762603; x=1750367403;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PexcpAOOtkiKpS0ImSN7hb8qJkrQBZztkR4qfhcbAPg=;
 b=a+ZBFBgLBoqkT2nCo7QisOhQhzmpuu1hOGkGA6jCgqyDISOqnyYcNO2YKc+XqVfKuh
 XMkIGyo9Fi31hjpHKrqcDPTmwZwlHVNVM79f4I3eC3gcl8Qj2/LzeO3fPZJoLU4m0tfV
 BNYdezMeWxsIRwuS6vdMIFJRSRchgMxgo5yfCecvN+mKx+F10gseT43rL4x54Qo8VVp1
 YRsAYOcYR2YPfNQP7d/jwQKmeEeP6psEqStRYDy74L+bUnH8rGCe1mkSH9ZFbo8h1r4p
 hjbYc1q3RdEHuqRGfHPDLosi9EKjJbfOHMuhqhV7ll+nTtiDVqpweYIwegLHnh5ECvd3
 zyHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeq9WdTOQelBUgwbSL+q8QwsN0vFTtEAZzs2aqj8Qh1BSBkIg5oY2QZiP4tpUdCFYJoXcfgmwp@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yylp5AFiZDu25qS2+mJKAGqLjkm2uE6waXxTk4DxmCqSn5FxxCG
 X5F4PqPfcuso3m44kLLtEW4+sb1+2ckVbUvuf0ShXoGYP84sfLpXOfWWFzcSRtr1r9c=
X-Gm-Gg: ASbGncurOIRV1z7htWhP1vokO8+dvYoU49s9+UrfASSPh9aEdOJECw22XAI9a6ieneV
 XWbvDZJlbluxH5g5db9DJgiTSz0JIG+0KN+C5EvXlPutFpe7kYngmkPemnuGFFshS8kQ9TBBdGL
 nQEiSQdijGIX4S0hg4nSnhGIy3MiR6S5IPRiNIYtm7/MMftNX5pFNgV6tCHDTlfBq0REDxkfNhq
 XMZ7I2tiv8HBjSsw5IK2h5lKcrzi2bMWLqxX5rJfRqaX3NR0E1Ojup+SxinOw5oZQlSX9QtG8YW
 /wl6M4J1En8K/78Mb8DMQHlBp/ZVQYlIsZ56Z3OPLo/SbjObzeKkWWyrrBS1ny/8w7ezsuY=
X-Google-Smtp-Source: AGHT+IGL4tPRfvomS0QOENtAAhRSPdcbA0I2fW+JHeZhytSPqTuXvc5dEq7vCmd0bf7++ELPpHr/nQ==
X-Received: by 2002:a17:902:ce87:b0:231:9902:1519 with SMTP id
 d9443c01a7336-2365dc2fde1mr7281095ad.39.1749762602989; 
 Thu, 12 Jun 2025 14:10:02 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-2365decb5f9sm1602845ad.194.2025.06.12.14.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 14:10:02 -0700 (PDT)
Date: Thu, 12 Jun 2025 14:10:02 -0700 (PDT)
X-Google-Original-Date: Thu, 12 Jun 2025 14:09:58 PDT (-0700)
Subject: Re: [PATCH] drm/amd/pm: Avoid more large frame warnings
In-Reply-To: <c3cc254a-4018-49e1-bb6e-25b245d62f4e@amd.com>
CC: alexander.deucher@amd.com, kenneth.feng@amd.com, christian.koenig@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, asad.kamal@amd.com,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: lijo.lazar@amd.com
Message-ID: <mhng-9A9FE10C-6479-4B2F-8FE0-2467BB76681E@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Jun 2025 16:05:52 +0000
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

On Thu, 12 Jun 2025 05:29:55 PDT (-0700), lijo.lazar@amd.com wrote:
>
>
> On 6/11/2025 10:30 AM, Lazar, Lijo wrote:
>>
>>
>> On 6/11/2025 2:51 AM, Palmer Dabbelt wrote:
>>> From: Palmer Dabbelt <palmer@dabbelt.com>
>>>
>>> 9KiB frames seem pretty big, but without this I'm getting some warnings
>>> as of 6.16-rc1
>>>
>>>       CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.o
>>>     drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c: In function 'smu_v13_0_6_get_gpu_metrics':
>>>     drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:2885:1: error: the frame size of 8304 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>>>      2885 | }
>>>           | ^
>>>     cc1: all warnings being treated as errors
>>>
>>
>> Could you also provide your build environment details?
>>
>> With below in Makefile + gcc 11.4.0, stack frame size is 168 bytes.

I'm on GCC 12 on RISC-V (though looks like it showed up somewhere else, 
too).

>>
>> ccflags-y += -fstack-usage
>>
>> smu_v13_0_6_ppt.c:2667:16:smu_v13_0_6_get_gpu_metrics   168     static
>>
>> Thanks,
>> Lijo
>>
>
> Was able to see this issue in one of our systems. This patch fixed that
> -  https://patchwork.freedesktop.org/patch/658216/
>
> Please try and let me know if it works for your config.

Thanks, I just threw it at the tester.  I'll go post a Reviewed-by at 
https://lore.kernel.org/all/20250612122321.801690-1-lijo.lazar@amd.com/ 
if it works...

>
> Thanks,
> Lijo
>
>>> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
>>> ---
>>>  drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
>>> index 51f1fa9789ab..9824b7f4827f 100644
>>> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
>>> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
>>> @@ -23,9 +23,19 @@
>>>  # Makefile for the 'smu manager' sub-component of powerplay.
>>>  # It provides the smu management services for the driver.
>>>
>>> +ifneq ($(CONFIG_FRAME_WARN),0)
>>> +    frame_warn_limit := 9216
>>> +    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
>>> +        frame_warn_flag := -Wframe-larger-than=$(frame_warn_limit)
>>> +    endif
>>> +endif
>>> +
>>>  SMU13_MGR = smu_v13_0.o aldebaran_ppt.o yellow_carp_ppt.o smu_v13_0_0_ppt.o smu_v13_0_4_ppt.o \
>>>  	    smu_v13_0_5_ppt.o smu_v13_0_7_ppt.o smu_v13_0_6_ppt.o smu_v13_0_12_ppt.o
>>>
>>>  AMD_SWSMU_SMU13MGR = $(addprefix $(AMD_SWSMU_PATH)/smu13/,$(SMU13_MGR))
>>>
>>>  AMD_POWERPLAY_FILES += $(AMD_SWSMU_SMU13MGR)
>>> +
>>> +CFLAGS_$(AMD_SWSMU_PATH)/smu13/smu_v13_0_12_ppt.o := $(frame_warn_flag)
>>> +CFLAGS_$(AMD_SWSMU_PATH)/smu13/smu_v13_0_6_ppt.o := $(frame_warn_flag)
>>
