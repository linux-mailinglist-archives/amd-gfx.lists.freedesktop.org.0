Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 929BDA1280
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 09:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A37189FC3;
	Thu, 29 Aug 2019 07:22:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D2D89FC3
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 07:22:05 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r17so3458719wme.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 00:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=2ABIAR7WvdAEgN3rnTkDGKGVg0rtc9E8yzRcbRNsVww=;
 b=W7cpqORXASSobZlz7vxWf/v7rycIqyBh2n2ZVCcSDuP9Rv5umhW6kzFHvbYbPaz5np
 xJO/xOyLJh3Ir3wLN7h6mFwjUkjCtEktddm7bYTd+lJTV+OTSeL3xAaEz0V5uzmfkE2f
 Y8X1PC4JZydN1K7QP9knFfMVQ5LBQzXXzmR6GKZIbzbfxDyB8IHNhXEoSTwVV3mn7gqy
 s/hcMhDWZqS+tMdz9jrnT1Q8g6SNkJ+ILVcZUW54JTr8NlDDOkEEXuCQ5u0otRlAGdvx
 5d/sfBEQMJyV3nBBUGQVJThYV07uMy8YPhEik3G+lvDfDVfR0o/KKn0dhirsJf/jpYWI
 Krhg==
X-Gm-Message-State: APjAAAVrM7q3E0VKER7pXnZuVa0FEVC94E/7f7yACYyHVfVFTI6PFY4O
 PJkQjb0C4DEzCHsYncl19xBauZQk
X-Google-Smtp-Source: APXvYqz1zOq5infg2P9lz4ngQ2JkINcGatuo38KziBJL3KezI+1QEjELkS4lRXMmrHxl8TnFFmTdzg==
X-Received: by 2002:a1c:720e:: with SMTP id n14mr1454641wmc.54.1567063323626; 
 Thu, 29 Aug 2019 00:22:03 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f192sm1567425wmg.30.2019.08.29.00.22.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Aug 2019 00:22:03 -0700 (PDT)
Subject: Re: [PATCH v2] drm/amdgpu: Default disable GDS for compute+gfx
To: zhoucm1 <zhoucm1@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <maraeo@gmail.com>
References: <7002f783-2223-a524-2c60-03447377bd28@amd.com>
 <20190722153350.29339-1-Joseph.Greathouse@amd.com>
 <c4856ea0-3cd3-1628-54e9-9660be334054@gmail.com>
 <36885047-8915-fb90-fcaa-04f98b4519b1@amd.com>
 <CAAxE2A5MgKswdeHg1YrDs_G7hCuoZAVFuPyoHoA+DbUjA32eHg@mail.gmail.com>
 <bdb61ac5-e1ab-725c-56cf-475d7b41ebc2@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <293feae7-bda5-d8af-2dca-6f2025dc3fba@gmail.com>
Date: Thu, 29 Aug 2019 09:22:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bdb61ac5-e1ab-725c-56cf-475d7b41ebc2@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=2ABIAR7WvdAEgN3rnTkDGKGVg0rtc9E8yzRcbRNsVww=;
 b=N2X9dvZaUhSzllSfreJ/a/nrxB7XYyhDmab90YbSaO4xS0ORmoLAPXJgKM1kPBHcxo
 8c5yywvUpMYBqYExg5rv0XkRbqtaKl1ZQkAHuXKXjEP4bPOgc/8kbbYz7tdEsk2njjyI
 K4lcXmyabwHHvjAauF3mNHwfjORo9mKbimoHDqk71oHN11v8DMlNjv54GBDACtg4qxTi
 TTBexM72sj9A0P3GCMwe6+QjfHkcqq0OjdSgF6jKuucpfNBuoKVce01Z2ptw9JYq3w3M
 u0pn3hsrQJtswW9O2XBb4uh+LEw6zkQCRCeuLVuy6wVtqBmN97d+KYRVnW1Ec6ooHvmd
 jjFw==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: christian.koenig@amd.com
Cc: "Greathouse, Joseph" <Joseph.Greathouse@amd.com>, "Qiao,
 Ken" <Ken.Qiao@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0527303306=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0527303306==
Content-Type: multipart/alternative;
 boundary="------------B397B751DB38838C65644241"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B397B751DB38838C65644241
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 29.08.19 um 07:55 schrieb zhoucm1:
>
>
> On 2019/8/29 上午1:08, Marek Olšák wrote:
>> It can't break an older driver, because there is no older driver that 
>> requires the static allocation.
>>
>> Note that closed source drivers don't count, because they don't need 
>> backward compatibility.
>
> Yes, I agree, we don't need take care of closed source stack.
>
> But AMDVLK is indeed an open source stack, many fans are using it, we 
> need keep its compatibility, don't we?
>

Actually that is still under discussion.

But AMDVLK should have never ever used the static GDS space in the first 
place. We only added that for a transition time for old OpenGL and it 
shouldn't have leaked into the upstream driver.

Not sure what's the best approach here. We could revert "[PATCH] 
drm/amdgpu: remove static GDS, GWS and OA", but that would break KFD. So 
we can only choose between two evils here.

Only alternative I can see which would work for both would be to still 
allocate the static GDS, GWS and OA space, but make it somehow dynamic 
so that the KFD can swap it out again.

Christian.

> -David
>
>>
>> Marek
>>
>> On Wed, Aug 28, 2019 at 2:44 AM zhoucm1 <zhoucm1@amd.com 
>> <mailto:zhoucm1@amd.com>> wrote:
>>
>>
>>     On 2019/7/23 上午3:08, Christian König wrote:
>>     > Am 22.07.19 um 17:34 schrieb Greathouse, Joseph:
>>     >> Units in the GDS block default to allowing all VMIDs access to all
>>     >> entries. Disable shader access to the GDS, GWS, and OA blocks
>>     from all
>>     >> compute and gfx VMIDs by default. For compute, HWS firmware
>>     will set
>>     >> up the access bits for the appropriate VMID when a compute queue
>>     >> requires access to these blocks.
>>     >> The driver will handle enabling access on-demand for graphics
>>     VMIDs.
>>
>>     gds_switch is depending on job->gds/gws/oa/_base/size.
>>
>>     "[PATCH] drm/amdgpu: remove static GDS, GWS and OA allocation", the
>>     default allocations in kernel were removed. If some UMD stacks don't
>>     pass gds/gws/oa allocation to bo_list, then kernel will not enable
>>     access of them, that will break previous driver.
>>
>>     do we need revert "[PATCH] drm/amdgpu: remove static GDS, GWS and OA
>>     allocation" ?
>>
>>     -David
>>
>>     >>
>>     >> Leaving VMID0 with full access because otherwise HWS cannot
>>     save or
>>     >> restore values during task switch.
>>     >>
>>     >> v2: Fixed code and comment styling.
>>     >>
>>     >> Change-Id: I3d768a96935d2ed1dff09b02c995090f4fbfa539
>>     >> Signed-off-by: Joseph Greathouse <Joseph.Greathouse@amd.com
>>     <mailto:Joseph.Greathouse@amd.com>>
>>     >
>>     > Reviewed-by: Christian König <christian.koenig@amd.com
>>     <mailto:christian.koenig@amd.com>>
>>     >
>>     >> ---
>>     >>   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 25
>>     ++++++++++++++++++-------
>>     >>   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c  | 24
>>     +++++++++++++++++-------
>>     >>   drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c  | 24
>>     +++++++++++++++++-------
>>     >>   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 24
>>     +++++++++++++++++-------
>>     >>   4 files changed, 69 insertions(+), 28 deletions(-)
>>     >>
>>     >> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>>     >> b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>>     >> index 73dcb632a3ce..2a9692bc34b4 100644
>>     >> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>>     >> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>>     >> @@ -1516,17 +1516,27 @@ static void
>>     >> gfx_v10_0_init_compute_vmid(struct amdgpu_device *adev)
>>     >>       }
>>     >>       nv_grbm_select(adev, 0, 0, 0, 0);
>>     >>       mutex_unlock(&adev->srbm_mutex);
>>     >> +}
>>     >>   -    /* Initialize all compute VMIDs to have no GDS, GWS, or OA
>>     >> -       acccess. These should be enabled by FW for target
>>     VMIDs. */
>>     >> -    for (i = FIRST_COMPUTE_VMID; i < LAST_COMPUTE_VMID; i++) {
>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_BASE, 2 * i, 0);
>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_SIZE, 2 * i, 0);
>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_GWS_VMID0, i, 0);
>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0, i, 0);
>>     >> +static void gfx_v10_0_init_gds_vmid(struct amdgpu_device *adev)
>>     >> +{
>>     >> +    int vmid;
>>     >> +
>>     >> +    /*
>>     >> +     * Initialize all compute and user-gfx VMIDs to have no GDS,
>>     >> GWS, or OA
>>     >> +     * access. Compute VMIDs should be enabled by FW for
>>     target VMIDs,
>>     >> +     * the driver can enable them for graphics. VMID0 should
>>     maintain
>>     >> +     * access so that HWS firmware can save/restore entries.
>>     >> +     */
>>     >> +    for (vmid = 1; vmid < 16; vmid++) {
>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_BASE, 2 *
>>     vmid, 0);
>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_SIZE, 2 *
>>     vmid, 0);
>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_GWS_VMID0, vmid, 0);
>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0, vmid, 0);
>>     >>       }
>>     >>   }
>>     >>   +
>>     >>   static void gfx_v10_0_tcp_harvest(struct amdgpu_device *adev)
>>     >>   {
>>     >>       int i, j, k;
>>     >> @@ -1629,6 +1639,7 @@ static void gfx_v10_0_constants_init(struct
>>     >> amdgpu_device *adev)
>>     >>       mutex_unlock(&adev->srbm_mutex);
>>     >>         gfx_v10_0_init_compute_vmid(adev);
>>     >> +    gfx_v10_0_init_gds_vmid(adev);
>>     >>     }
>>     >>   diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>     >> b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>     >> index 3f98624772a4..48796b6824cf 100644
>>     >> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>     >> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>     >> @@ -1877,14 +1877,23 @@ static void
>>     gfx_v7_0_init_compute_vmid(struct
>>     >> amdgpu_device *adev)
>>     >>       }
>>     >>       cik_srbm_select(adev, 0, 0, 0, 0);
>>     >>       mutex_unlock(&adev->srbm_mutex);
>>     >> +}
>>     >>   -    /* Initialize all compute VMIDs to have no GDS, GWS, or OA
>>     >> -       acccess. These should be enabled by FW for target
>>     VMIDs. */
>>     >> -    for (i = FIRST_COMPUTE_VMID; i < LAST_COMPUTE_VMID; i++) {
>>     >> -        WREG32(amdgpu_gds_reg_offset[i].mem_base, 0);
>>     >> -        WREG32(amdgpu_gds_reg_offset[i].mem_size, 0);
>>     >> -        WREG32(amdgpu_gds_reg_offset[i].gws, 0);
>>     >> -        WREG32(amdgpu_gds_reg_offset[i].oa, 0);
>>     >> +static void gfx_v7_0_init_gds_vmid(struct amdgpu_device *adev)
>>     >> +{
>>     >> +    int vmid;
>>     >> +
>>     >> +    /*
>>     >> +     * Initialize all compute and user-gfx VMIDs to have no GDS,
>>     >> GWS, or OA
>>     >> +     * access. Compute VMIDs should be enabled by FW for
>>     target VMIDs,
>>     >> +     * the driver can enable them for graphics. VMID0 should
>>     maintain
>>     >> +     * access so that HWS firmware can save/restore entries.
>>     >> +     */
>>     >> +    for (vmid = 1; vmid < 16; vmid++) {
>>     >> + WREG32(amdgpu_gds_reg_offset[vmid].mem_base, 0);
>>     >> + WREG32(amdgpu_gds_reg_offset[vmid].mem_size, 0);
>>     >> +        WREG32(amdgpu_gds_reg_offset[vmid].gws, 0);
>>     >> +        WREG32(amdgpu_gds_reg_offset[vmid].oa, 0);
>>     >>       }
>>     >>   }
>>     >>   @@ -1966,6 +1975,7 @@ static void
>>     gfx_v7_0_constants_init(struct
>>     >> amdgpu_device *adev)
>>     >>       mutex_unlock(&adev->srbm_mutex);
>>     >>         gfx_v7_0_init_compute_vmid(adev);
>>     >> +    gfx_v7_0_init_gds_vmid(adev);
>>     >>         WREG32(mmSX_DEBUG_1, 0x20);
>>     >>   diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>     >> b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>     >> index e4028d54f8f7..d2907186bb24 100644
>>     >> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>     >> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>     >> @@ -3702,14 +3702,23 @@ static void
>>     gfx_v8_0_init_compute_vmid(struct
>>     >> amdgpu_device *adev)
>>     >>       }
>>     >>       vi_srbm_select(adev, 0, 0, 0, 0);
>>     >>       mutex_unlock(&adev->srbm_mutex);
>>     >> +}
>>     >>   -    /* Initialize all compute VMIDs to have no GDS, GWS, or OA
>>     >> -       acccess. These should be enabled by FW for target
>>     VMIDs. */
>>     >> -    for (i = FIRST_COMPUTE_VMID; i < LAST_COMPUTE_VMID; i++) {
>>     >> -        WREG32(amdgpu_gds_reg_offset[i].mem_base, 0);
>>     >> -        WREG32(amdgpu_gds_reg_offset[i].mem_size, 0);
>>     >> -        WREG32(amdgpu_gds_reg_offset[i].gws, 0);
>>     >> -        WREG32(amdgpu_gds_reg_offset[i].oa, 0);
>>     >> +static void gfx_v8_0_init_gds_vmid(struct amdgpu_device *adev)
>>     >> +{
>>     >> +    int vmid;
>>     >> +
>>     >> +    /*
>>     >> +     * Initialize all compute and user-gfx VMIDs to have no GDS,
>>     >> GWS, or OA
>>     >> +     * access. Compute VMIDs should be enabled by FW for
>>     target VMIDs,
>>     >> +     * the driver can enable them for graphics. VMID0 should
>>     maintain
>>     >> +     * access so that HWS firmware can save/restore entries.
>>     >> +     */
>>     >> +    for (vmid = 1; vmid < 16; vmid++) {
>>     >> + WREG32(amdgpu_gds_reg_offset[vmid].mem_base, 0);
>>     >> + WREG32(amdgpu_gds_reg_offset[vmid].mem_size, 0);
>>     >> +        WREG32(amdgpu_gds_reg_offset[vmid].gws, 0);
>>     >> +        WREG32(amdgpu_gds_reg_offset[vmid].oa, 0);
>>     >>       }
>>     >>   }
>>     >>   @@ -3779,6 +3788,7 @@ static void
>>     gfx_v8_0_constants_init(struct
>>     >> amdgpu_device *adev)
>>     >>       mutex_unlock(&adev->srbm_mutex);
>>     >>         gfx_v8_0_init_compute_vmid(adev);
>>     >> +    gfx_v8_0_init_gds_vmid(adev);
>>     >>         mutex_lock(&adev->grbm_idx_mutex);
>>     >>       /*
>>     >> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>>     >> b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>>     >> index 259a35395fec..bd7f431a24d9 100644
>>     >> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>>     >> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>>     >> @@ -2025,14 +2025,23 @@ static void
>>     gfx_v9_0_init_compute_vmid(struct
>>     >> amdgpu_device *adev)
>>     >>       }
>>     >>       soc15_grbm_select(adev, 0, 0, 0, 0);
>>     >>       mutex_unlock(&adev->srbm_mutex);
>>     >> +}
>>     >>   -    /* Initialize all compute VMIDs to have no GDS, GWS, or OA
>>     >> -       acccess. These should be enabled by FW for target
>>     VMIDs. */
>>     >> -    for (i = FIRST_COMPUTE_VMID; i < LAST_COMPUTE_VMID; i++) {
>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_BASE, 2 * i, 0);
>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_SIZE, 2 * i, 0);
>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_GWS_VMID0, i, 0);
>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0, i, 0);
>>     >> +static void gfx_v9_0_init_gds_vmid(struct amdgpu_device *adev)
>>     >> +{
>>     >> +    int vmid;
>>     >> +
>>     >> +    /*
>>     >> +     * Initialize all compute and user-gfx VMIDs to have no GDS,
>>     >> GWS, or OA
>>     >> +     * access. Compute VMIDs should be enabled by FW for
>>     target VMIDs,
>>     >> +     * the driver can enable them for graphics. VMID0 should
>>     maintain
>>     >> +     * access so that HWS firmware can save/restore entries.
>>     >> +     */
>>     >> +    for (vmid = 1; vmid < 16; vmid++) {
>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_BASE, 2 *
>>     vmid, 0);
>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_SIZE, 2 *
>>     vmid, 0);
>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_GWS_VMID0, vmid, 0);
>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0, vmid, 0);
>>     >>       }
>>     >>   }
>>     >>   @@ -2080,6 +2089,7 @@ static void
>>     gfx_v9_0_constants_init(struct
>>     >> amdgpu_device *adev)
>>     >>       mutex_unlock(&adev->srbm_mutex);
>>     >>         gfx_v9_0_init_compute_vmid(adev);
>>     >> +    gfx_v9_0_init_gds_vmid(adev);
>>     >>   }
>>     >>     static void gfx_v9_0_wait_for_rlc_serdes(struct
>>     amdgpu_device *adev)
>>     >
>>     > _______________________________________________
>>     > amd-gfx mailing list
>>     > amd-gfx@lists.freedesktop.org
>>     <mailto:amd-gfx@lists.freedesktop.org>
>>     > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>>     _______________________________________________
>>     amd-gfx mailing list
>>     amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org>
>>     https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------B397B751DB38838C65644241
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Am 29.08.19 um 07:55 schrieb zhoucm1:<br>
    </div>
    <blockquote type="cite"
      cite="mid:bdb61ac5-e1ab-725c-56cf-475d7b41ebc2@amd.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2019/8/29 上午1:08, Marek Olšák
        wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CAAxE2A5MgKswdeHg1YrDs_G7hCuoZAVFuPyoHoA+DbUjA32eHg@mail.gmail.com">
        <meta http-equiv="Content-Type" content="text/html;
          charset=UTF-8">
        <div dir="ltr">
          <div>It can't break an older driver, because there is no older
            driver that requires the static allocation.</div>
          <div><br>
          </div>
          <div>Note that closed source drivers don't count, because they
            don't need backward compatibility.</div>
        </div>
      </blockquote>
      <p>Yes, I agree, we don't need take care of closed source stack.</p>
      <p>But AMDVLK is indeed an open source stack, many fans are using
        it, we need keep its compatibility, don't we?</p>
    </blockquote>
    <br>
    Actually that is still under discussion.<br>
    <br>
    But AMDVLK should have never ever used the static GDS space in the
    first place. We only added that for a transition time for old OpenGL
    and it shouldn't have leaked into the upstream driver.<br>
    <br>
    Not sure what's the best approach here. We could revert "[PATCH]
    drm/amdgpu: remove static GDS, GWS and OA", but that would break
    KFD. So we can only choose between two evils here.<br>
    <br>
    Only alternative I can see which would work for both would be to
    still allocate the static GDS, GWS and OA space, but make it somehow
    dynamic so that the KFD can swap it out again.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite"
      cite="mid:bdb61ac5-e1ab-725c-56cf-475d7b41ebc2@amd.com">
      <p>-David<br>
      </p>
      <blockquote type="cite"
cite="mid:CAAxE2A5MgKswdeHg1YrDs_G7hCuoZAVFuPyoHoA+DbUjA32eHg@mail.gmail.com">
        <div dir="ltr">
          <div><br>
          </div>
          <div>Marek<br>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Aug 28, 2019 at 2:44
            AM zhoucm1 &lt;<a href="mailto:zhoucm1@amd.com"
              moz-do-not-send="true">zhoucm1@amd.com</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><br>
            On 2019/7/23 上午3:08, Christian König wrote:<br>
            &gt; Am 22.07.19 um 17:34 schrieb Greathouse, Joseph:<br>
            &gt;&gt; Units in the GDS block default to allowing all
            VMIDs access to all<br>
            &gt;&gt; entries. Disable shader access to the GDS, GWS, and
            OA blocks from all<br>
            &gt;&gt; compute and gfx VMIDs by default. For compute, HWS
            firmware will set<br>
            &gt;&gt; up the access bits for the appropriate VMID when a
            compute queue<br>
            &gt;&gt; requires access to these blocks.<br>
            &gt;&gt; The driver will handle enabling access on-demand
            for graphics VMIDs.<br>
            <br>
            gds_switch is depending on job-&gt;gds/gws/oa/_base/size.<br>
            <br>
            "[PATCH] drm/amdgpu: remove static GDS, GWS and OA
            allocation", the <br>
            default allocations in kernel were removed. If some UMD
            stacks don't <br>
            pass gds/gws/oa allocation to bo_list, then kernel will not
            enable <br>
            access of them, that will break previous driver.<br>
            <br>
            do we need revert "[PATCH] drm/amdgpu: remove static GDS,
            GWS and OA <br>
            allocation" ?<br>
            <br>
            -David<br>
            <br>
            &gt;&gt;<br>
            &gt;&gt; Leaving VMID0 with full access because otherwise
            HWS cannot save or<br>
            &gt;&gt; restore values during task switch.<br>
            &gt;&gt;<br>
            &gt;&gt; v2: Fixed code and comment styling.<br>
            &gt;&gt;<br>
            &gt;&gt; Change-Id:
            I3d768a96935d2ed1dff09b02c995090f4fbfa539<br>
            &gt;&gt; Signed-off-by: Joseph Greathouse &lt;<a
              href="mailto:Joseph.Greathouse@amd.com" target="_blank"
              moz-do-not-send="true">Joseph.Greathouse@amd.com</a>&gt;<br>
            &gt;<br>
            &gt; Reviewed-by: Christian König &lt;<a
              href="mailto:christian.koenig@amd.com" target="_blank"
              moz-do-not-send="true">christian.koenig@amd.com</a>&gt;<br>
            &gt;<br>
            &gt;&gt; ---<br>
            &gt;&gt;   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 25
            ++++++++++++++++++-------<br>
            &gt;&gt;   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c  | 24
            +++++++++++++++++-------<br>
            &gt;&gt;   drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c  | 24
            +++++++++++++++++-------<br>
            &gt;&gt;   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 24
            +++++++++++++++++-------<br>
            &gt;&gt;   4 files changed, 69 insertions(+), 28
            deletions(-)<br>
            &gt;&gt;<br>
            &gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
            <br>
            &gt;&gt; b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
            &gt;&gt; index 73dcb632a3ce..2a9692bc34b4 100644<br>
            &gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
            &gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
            &gt;&gt; @@ -1516,17 +1516,27 @@ static void <br>
            &gt;&gt; gfx_v10_0_init_compute_vmid(struct amdgpu_device
            *adev)<br>
            &gt;&gt;       }<br>
            &gt;&gt;       nv_grbm_select(adev, 0, 0, 0, 0);<br>
            &gt;&gt;       mutex_unlock(&amp;adev-&gt;srbm_mutex);<br>
            &gt;&gt; +}<br>
            &gt;&gt;   -    /* Initialize all compute VMIDs to have no
            GDS, GWS, or OA<br>
            &gt;&gt; -       acccess. These should be enabled by FW for
            target VMIDs. */<br>
            &gt;&gt; -    for (i = FIRST_COMPUTE_VMID; i &lt;
            LAST_COMPUTE_VMID; i++) {<br>
            &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0,
            mmGDS_VMID0_BASE, 2 * i, 0);<br>
            &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0,
            mmGDS_VMID0_SIZE, 2 * i, 0);<br>
            &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0,
            mmGDS_GWS_VMID0, i, 0);<br>
            &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0,
            i, 0);<br>
            &gt;&gt; +static void gfx_v10_0_init_gds_vmid(struct
            amdgpu_device *adev)<br>
            &gt;&gt; +{<br>
            &gt;&gt; +    int vmid;<br>
            &gt;&gt; +<br>
            &gt;&gt; +    /*<br>
            &gt;&gt; +     * Initialize all compute and user-gfx VMIDs
            to have no GDS, <br>
            &gt;&gt; GWS, or OA<br>
            &gt;&gt; +     * access. Compute VMIDs should be enabled by
            FW for target VMIDs,<br>
            &gt;&gt; +     * the driver can enable them for graphics.
            VMID0 should maintain<br>
            &gt;&gt; +     * access so that HWS firmware can
            save/restore entries.<br>
            &gt;&gt; +     */<br>
            &gt;&gt; +    for (vmid = 1; vmid &lt; 16; vmid++) {<br>
            &gt;&gt; +        WREG32_SOC15_OFFSET(GC, 0,
            mmGDS_VMID0_BASE, 2 * vmid, 0);<br>
            &gt;&gt; +        WREG32_SOC15_OFFSET(GC, 0,
            mmGDS_VMID0_SIZE, 2 * vmid, 0);<br>
            &gt;&gt; +        WREG32_SOC15_OFFSET(GC, 0,
            mmGDS_GWS_VMID0, vmid, 0);<br>
            &gt;&gt; +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0,
            vmid, 0);<br>
            &gt;&gt;       }<br>
            &gt;&gt;   }<br>
            &gt;&gt;   +<br>
            &gt;&gt;   static void gfx_v10_0_tcp_harvest(struct
            amdgpu_device *adev)<br>
            &gt;&gt;   {<br>
            &gt;&gt;       int i, j, k;<br>
            &gt;&gt; @@ -1629,6 +1639,7 @@ static void
            gfx_v10_0_constants_init(struct <br>
            &gt;&gt; amdgpu_device *adev)<br>
            &gt;&gt;       mutex_unlock(&amp;adev-&gt;srbm_mutex);<br>
            &gt;&gt;         gfx_v10_0_init_compute_vmid(adev);<br>
            &gt;&gt; +    gfx_v10_0_init_gds_vmid(adev);<br>
            &gt;&gt;     }<br>
            &gt;&gt;   diff --git
            a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c <br>
            &gt;&gt; b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c<br>
            &gt;&gt; index 3f98624772a4..48796b6824cf 100644<br>
            &gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c<br>
            &gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c<br>
            &gt;&gt; @@ -1877,14 +1877,23 @@ static void
            gfx_v7_0_init_compute_vmid(struct <br>
            &gt;&gt; amdgpu_device *adev)<br>
            &gt;&gt;       }<br>
            &gt;&gt;       cik_srbm_select(adev, 0, 0, 0, 0);<br>
            &gt;&gt;       mutex_unlock(&amp;adev-&gt;srbm_mutex);<br>
            &gt;&gt; +}<br>
            &gt;&gt;   -    /* Initialize all compute VMIDs to have no
            GDS, GWS, or OA<br>
            &gt;&gt; -       acccess. These should be enabled by FW for
            target VMIDs. */<br>
            &gt;&gt; -    for (i = FIRST_COMPUTE_VMID; i &lt;
            LAST_COMPUTE_VMID; i++) {<br>
            &gt;&gt; -        WREG32(amdgpu_gds_reg_offset[i].mem_base,
            0);<br>
            &gt;&gt; -        WREG32(amdgpu_gds_reg_offset[i].mem_size,
            0);<br>
            &gt;&gt; -        WREG32(amdgpu_gds_reg_offset[i].gws, 0);<br>
            &gt;&gt; -        WREG32(amdgpu_gds_reg_offset[i].oa, 0);<br>
            &gt;&gt; +static void gfx_v7_0_init_gds_vmid(struct
            amdgpu_device *adev)<br>
            &gt;&gt; +{<br>
            &gt;&gt; +    int vmid;<br>
            &gt;&gt; +<br>
            &gt;&gt; +    /*<br>
            &gt;&gt; +     * Initialize all compute and user-gfx VMIDs
            to have no GDS, <br>
            &gt;&gt; GWS, or OA<br>
            &gt;&gt; +     * access. Compute VMIDs should be enabled by
            FW for target VMIDs,<br>
            &gt;&gt; +     * the driver can enable them for graphics.
            VMID0 should maintain<br>
            &gt;&gt; +     * access so that HWS firmware can
            save/restore entries.<br>
            &gt;&gt; +     */<br>
            &gt;&gt; +    for (vmid = 1; vmid &lt; 16; vmid++) {<br>
            &gt;&gt; +       
            WREG32(amdgpu_gds_reg_offset[vmid].mem_base, 0);<br>
            &gt;&gt; +       
            WREG32(amdgpu_gds_reg_offset[vmid].mem_size, 0);<br>
            &gt;&gt; +        WREG32(amdgpu_gds_reg_offset[vmid].gws,
            0);<br>
            &gt;&gt; +        WREG32(amdgpu_gds_reg_offset[vmid].oa, 0);<br>
            &gt;&gt;       }<br>
            &gt;&gt;   }<br>
            &gt;&gt;   @@ -1966,6 +1975,7 @@ static void
            gfx_v7_0_constants_init(struct <br>
            &gt;&gt; amdgpu_device *adev)<br>
            &gt;&gt;       mutex_unlock(&amp;adev-&gt;srbm_mutex);<br>
            &gt;&gt;         gfx_v7_0_init_compute_vmid(adev);<br>
            &gt;&gt; +    gfx_v7_0_init_gds_vmid(adev);<br>
            &gt;&gt;         WREG32(mmSX_DEBUG_1, 0x20);<br>
            &gt;&gt;   diff --git
            a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c <br>
            &gt;&gt; b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c<br>
            &gt;&gt; index e4028d54f8f7..d2907186bb24 100644<br>
            &gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c<br>
            &gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c<br>
            &gt;&gt; @@ -3702,14 +3702,23 @@ static void
            gfx_v8_0_init_compute_vmid(struct <br>
            &gt;&gt; amdgpu_device *adev)<br>
            &gt;&gt;       }<br>
            &gt;&gt;       vi_srbm_select(adev, 0, 0, 0, 0);<br>
            &gt;&gt;       mutex_unlock(&amp;adev-&gt;srbm_mutex);<br>
            &gt;&gt; +}<br>
            &gt;&gt;   -    /* Initialize all compute VMIDs to have no
            GDS, GWS, or OA<br>
            &gt;&gt; -       acccess. These should be enabled by FW for
            target VMIDs. */<br>
            &gt;&gt; -    for (i = FIRST_COMPUTE_VMID; i &lt;
            LAST_COMPUTE_VMID; i++) {<br>
            &gt;&gt; -        WREG32(amdgpu_gds_reg_offset[i].mem_base,
            0);<br>
            &gt;&gt; -        WREG32(amdgpu_gds_reg_offset[i].mem_size,
            0);<br>
            &gt;&gt; -        WREG32(amdgpu_gds_reg_offset[i].gws, 0);<br>
            &gt;&gt; -        WREG32(amdgpu_gds_reg_offset[i].oa, 0);<br>
            &gt;&gt; +static void gfx_v8_0_init_gds_vmid(struct
            amdgpu_device *adev)<br>
            &gt;&gt; +{<br>
            &gt;&gt; +    int vmid;<br>
            &gt;&gt; +<br>
            &gt;&gt; +    /*<br>
            &gt;&gt; +     * Initialize all compute and user-gfx VMIDs
            to have no GDS, <br>
            &gt;&gt; GWS, or OA<br>
            &gt;&gt; +     * access. Compute VMIDs should be enabled by
            FW for target VMIDs,<br>
            &gt;&gt; +     * the driver can enable them for graphics.
            VMID0 should maintain<br>
            &gt;&gt; +     * access so that HWS firmware can
            save/restore entries.<br>
            &gt;&gt; +     */<br>
            &gt;&gt; +    for (vmid = 1; vmid &lt; 16; vmid++) {<br>
            &gt;&gt; +       
            WREG32(amdgpu_gds_reg_offset[vmid].mem_base, 0);<br>
            &gt;&gt; +       
            WREG32(amdgpu_gds_reg_offset[vmid].mem_size, 0);<br>
            &gt;&gt; +        WREG32(amdgpu_gds_reg_offset[vmid].gws,
            0);<br>
            &gt;&gt; +        WREG32(amdgpu_gds_reg_offset[vmid].oa, 0);<br>
            &gt;&gt;       }<br>
            &gt;&gt;   }<br>
            &gt;&gt;   @@ -3779,6 +3788,7 @@ static void
            gfx_v8_0_constants_init(struct <br>
            &gt;&gt; amdgpu_device *adev)<br>
            &gt;&gt;       mutex_unlock(&amp;adev-&gt;srbm_mutex);<br>
            &gt;&gt;         gfx_v8_0_init_compute_vmid(adev);<br>
            &gt;&gt; +    gfx_v8_0_init_gds_vmid(adev);<br>
            &gt;&gt;         mutex_lock(&amp;adev-&gt;grbm_idx_mutex);<br>
            &gt;&gt;       /*<br>
            &gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
            <br>
            &gt;&gt; b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<br>
            &gt;&gt; index 259a35395fec..bd7f431a24d9 100644<br>
            &gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<br>
            &gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<br>
            &gt;&gt; @@ -2025,14 +2025,23 @@ static void
            gfx_v9_0_init_compute_vmid(struct <br>
            &gt;&gt; amdgpu_device *adev)<br>
            &gt;&gt;       }<br>
            &gt;&gt;       soc15_grbm_select(adev, 0, 0, 0, 0);<br>
            &gt;&gt;       mutex_unlock(&amp;adev-&gt;srbm_mutex);<br>
            &gt;&gt; +}<br>
            &gt;&gt;   -    /* Initialize all compute VMIDs to have no
            GDS, GWS, or OA<br>
            &gt;&gt; -       acccess. These should be enabled by FW for
            target VMIDs. */<br>
            &gt;&gt; -    for (i = FIRST_COMPUTE_VMID; i &lt;
            LAST_COMPUTE_VMID; i++) {<br>
            &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0,
            mmGDS_VMID0_BASE, 2 * i, 0);<br>
            &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0,
            mmGDS_VMID0_SIZE, 2 * i, 0);<br>
            &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0,
            mmGDS_GWS_VMID0, i, 0);<br>
            &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0,
            i, 0);<br>
            &gt;&gt; +static void gfx_v9_0_init_gds_vmid(struct
            amdgpu_device *adev)<br>
            &gt;&gt; +{<br>
            &gt;&gt; +    int vmid;<br>
            &gt;&gt; +<br>
            &gt;&gt; +    /*<br>
            &gt;&gt; +     * Initialize all compute and user-gfx VMIDs
            to have no GDS, <br>
            &gt;&gt; GWS, or OA<br>
            &gt;&gt; +     * access. Compute VMIDs should be enabled by
            FW for target VMIDs,<br>
            &gt;&gt; +     * the driver can enable them for graphics.
            VMID0 should maintain<br>
            &gt;&gt; +     * access so that HWS firmware can
            save/restore entries.<br>
            &gt;&gt; +     */<br>
            &gt;&gt; +    for (vmid = 1; vmid &lt; 16; vmid++) {<br>
            &gt;&gt; +        WREG32_SOC15_OFFSET(GC, 0,
            mmGDS_VMID0_BASE, 2 * vmid, 0);<br>
            &gt;&gt; +        WREG32_SOC15_OFFSET(GC, 0,
            mmGDS_VMID0_SIZE, 2 * vmid, 0);<br>
            &gt;&gt; +        WREG32_SOC15_OFFSET(GC, 0,
            mmGDS_GWS_VMID0, vmid, 0);<br>
            &gt;&gt; +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0,
            vmid, 0);<br>
            &gt;&gt;       }<br>
            &gt;&gt;   }<br>
            &gt;&gt;   @@ -2080,6 +2089,7 @@ static void
            gfx_v9_0_constants_init(struct <br>
            &gt;&gt; amdgpu_device *adev)<br>
            &gt;&gt;       mutex_unlock(&amp;adev-&gt;srbm_mutex);<br>
            &gt;&gt;         gfx_v9_0_init_compute_vmid(adev);<br>
            &gt;&gt; +    gfx_v9_0_init_gds_vmid(adev);<br>
            &gt;&gt;   }<br>
            &gt;&gt;     static void gfx_v9_0_wait_for_rlc_serdes(struct
            amdgpu_device *adev)<br>
            &gt;<br>
            &gt; _______________________________________________<br>
            &gt; amd-gfx mailing list<br>
            &gt; <a href="mailto:amd-gfx@lists.freedesktop.org"
              target="_blank" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
            &gt; <a
              href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
            _______________________________________________<br>
            amd-gfx mailing list<br>
            <a href="mailto:amd-gfx@lists.freedesktop.org"
              target="_blank" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
            <a
              href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></blockquote>
        </div>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------B397B751DB38838C65644241--

--===============0527303306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0527303306==--
