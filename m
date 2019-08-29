Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A13A1453
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 11:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2AD89EFF;
	Thu, 29 Aug 2019 09:06:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680067.outbound.protection.outlook.com [40.107.68.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B13989EFF
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 09:06:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAgt2H/nPP484/YPr+XUvHzYdqU/t7TXjTYRHzFVcl4Q1NPh59VjFMYy928qwFaXdGzVg40YgQX60fse+ZlAjvCK3UuleYQYiGGB19bRkdP9FStMiiSVjHKU6ZYV3Lxi/K9VBLDob68ZBqOVI8im5mbS+wBMEfLOZfX8YOezOSmwn/2zEIFusy+oa/8IpDapO8WKY1vFwZ1OYW0HgGcK9kmjhNIADLYvtzMQysVsPVQYgwPh/gBVfxmhAOxyOxGsxwEJfV511Ctm17vMVOFoWWVptnyT3pKSNq0FaxfL9T9H7xEII/Fer+SVvzaOWgXM5zvORfDCLCCPMTSM7bPbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv1iE+gU2TPphCy0WGaIdWcHkVncI8VCQgoXLJGEtfY=;
 b=MPof4JSysVimTXmq+pTB8Bpc+MF/8mw/7TH64WHlU/Jqq+7UgcJ1rqs8yLp+fMLkxNvrRI22N8AyrrO56Jztu9GpFbsa8MC29Wnn6EHqRZKqLVfIZXh/2tNkRtfs2gdNxoanzegASgUvKJWB2UshGOkNOzk/5x5qDR9iK8av8bpTZxISiSVx7GyX74CAYmXHKYQtz/YnH1JWqsz412VRYzuxvZwplOf/y33usR9p2E+Du8+LUMKVSuAbK2qCcPBv3lP9OkRGSJsLsgMbwuJe1Rnj/yhd+Cjpc79BwXH2YE/wpW0F/LjKfO1ilrz1OTa5v05Fp0ghfKZYjn0vJDiVpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0002.namprd12.prod.outlook.com
 (2603:10b6:910:16::12) by DM6PR12MB2715.namprd12.prod.outlook.com
 (2603:10b6:5:4a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Thu, 29 Aug
 2019 09:06:08 +0000
Received: from BY2NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by CY4PR1201CA0002.outlook.office365.com
 (2603:10b6:910:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19 via Frontend
 Transport; Thu, 29 Aug 2019 09:06:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT061.mail.protection.outlook.com (10.152.85.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 09:06:07 +0000
Received: from [10.65.99.155] (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 29 Aug
 2019 04:06:05 -0500
Subject: Re: [PATCH v2] drm/amdgpu: Default disable GDS for compute+gfx
To: <christian.koenig@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <maraeo@gmail.com>
References: <7002f783-2223-a524-2c60-03447377bd28@amd.com>
 <20190722153350.29339-1-Joseph.Greathouse@amd.com>
 <c4856ea0-3cd3-1628-54e9-9660be334054@gmail.com>
 <36885047-8915-fb90-fcaa-04f98b4519b1@amd.com>
 <CAAxE2A5MgKswdeHg1YrDs_G7hCuoZAVFuPyoHoA+DbUjA32eHg@mail.gmail.com>
 <bdb61ac5-e1ab-725c-56cf-475d7b41ebc2@amd.com>
 <293feae7-bda5-d8af-2dca-6f2025dc3fba@gmail.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <148e2050-558c-eee6-bb74-3f7f9a341f98@amd.com>
Date: Thu, 29 Aug 2019 17:06:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <293feae7-bda5-d8af-2dca-6f2025dc3fba@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(2980300002)(428003)(199004)(189003)(43544003)(66574012)(37036004)(6666004)(53946003)(71190400001)(65956001)(5660300002)(31696002)(65806001)(6116002)(966005)(11346002)(3846002)(478600001)(7736002)(2616005)(16526019)(186003)(36756003)(26005)(336012)(70586007)(81166006)(476003)(126002)(81156014)(356004)(70206006)(486006)(16576012)(31686004)(76176011)(58126008)(54896002)(229853002)(446003)(426003)(2906002)(8936002)(4326008)(316002)(33964004)(30864003)(54906003)(14444005)(6306002)(53546011)(236005)(16586007)(53936002)(8676002)(606006)(6246003)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2715; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f3c4710-1b43-4957-f6b2-08d72c6020fd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2715; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2715:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <DM6PR12MB271529FC7A8EB4B6DAF52A2AB4A20@DM6PR12MB2715.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: MJYzSf+gBYyrG/dYjFL75tMRXmI5nny5V3poA2pZjt/uh5eEx6x1VGvjnj8f+ZpOVbu9cLYp+eR22HMe3dbLFmCDEQBUIUoHPXuJG8h8iAsW/gBHh1mVnJRFyAZtOT1pbn7dC24hySXBzdElEFR9aon8XMHYuo++uo8G9z8LkphXmYhZ7EwYfW2/mbhcA/owcdUG9x9Ekj8JCYR26mFDEedR+SaBa2YficFHVYKp0tSmpCekg5jujWFXVz3MKOoHzAXiZ7Dh5YYt8Orw5L7SKkC5vG+N0TVpLhvivN+WHgwVJLatKNor+dcZNunzut5U7I1pbTV1rvNfU8s3wXLKvbRKyPCEnJb1yLaeZiMGvJM+NV67NkszOAGDdOBNYbPPRkFO1Uw01PDw1z7KcYmqE+xNyZQIw7UXbqwGXgmZeZw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 09:06:07.5703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3c4710-1b43-4957-f6b2-08d72c6020fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2715
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv1iE+gU2TPphCy0WGaIdWcHkVncI8VCQgoXLJGEtfY=;
 b=rKsYrpTeAD0xHUrPMXRDkDrhDkjwLw7Z/NrJjA71GsZhKlVZoWuEo2oV2JbDbDu0WP6o1p7Ui25YqTeSlCttju4fNe9N2P/z/Khmyo5C9MD3ag6cj8/3xk6LCH1rI34pkFJrZX+BGMNeFM1DlWkorbVKTKG0x6HFErWPAB8wHME=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: "Qiao, Ken" <Ken.Qiao@amd.com>, "Greathouse,
 Joseph" <Joseph.Greathouse@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0989227854=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0989227854==
Content-Type: multipart/alternative;
	boundary="------------7D7A78475667B6636281DB2F"
Content-Language: en-US

--------------7D7A78475667B6636281DB2F
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 2019/8/29 下午3:22, Christian König wrote:
> Am 29.08.19 um 07:55 schrieb zhoucm1:
>>
>>
>> On 2019/8/29 上午1:08, Marek Olšák wrote:
>>> It can't break an older driver, because there is no older driver 
>>> that requires the static allocation.
>>>
>>> Note that closed source drivers don't count, because they don't need 
>>> backward compatibility.
>>
>> Yes, I agree, we don't need take care of closed source stack.
>>
>> But AMDVLK is indeed an open source stack, many fans are using it, we 
>> need keep its compatibility, don't we?
>>
>
> Actually that is still under discussion.
>
> But AMDVLK should have never ever used the static GDS space in the 
> first place. We only added that for a transition time for old OpenGL 
> and it shouldn't have leaked into the upstream driver.
>
> Not sure what's the best approach here. We could revert "[PATCH] 
> drm/amdgpu: remove static GDS, GWS and OA", but that would break KFD. 
> So we can only choose between two evils here.
>
> Only alternative I can see which would work for both would be to still 
> allocate the static GDS, GWS and OA space, but make it somehow dynamic 
> so that the KFD can swap it out again.

Agree with you.

-David

>
> Christian.
>
>> -David
>>
>>>
>>> Marek
>>>
>>> On Wed, Aug 28, 2019 at 2:44 AM zhoucm1 <zhoucm1@amd.com 
>>> <mailto:zhoucm1@amd.com>> wrote:
>>>
>>>
>>>     On 2019/7/23 上午3:08, Christian König wrote:
>>>     > Am 22.07.19 um 17:34 schrieb Greathouse, Joseph:
>>>     >> Units in the GDS block default to allowing all VMIDs access
>>>     to all
>>>     >> entries. Disable shader access to the GDS, GWS, and OA blocks
>>>     from all
>>>     >> compute and gfx VMIDs by default. For compute, HWS firmware
>>>     will set
>>>     >> up the access bits for the appropriate VMID when a compute queue
>>>     >> requires access to these blocks.
>>>     >> The driver will handle enabling access on-demand for graphics
>>>     VMIDs.
>>>
>>>     gds_switch is depending on job->gds/gws/oa/_base/size.
>>>
>>>     "[PATCH] drm/amdgpu: remove static GDS, GWS and OA allocation", the
>>>     default allocations in kernel were removed. If some UMD stacks
>>>     don't
>>>     pass gds/gws/oa allocation to bo_list, then kernel will not enable
>>>     access of them, that will break previous driver.
>>>
>>>     do we need revert "[PATCH] drm/amdgpu: remove static GDS, GWS
>>>     and OA
>>>     allocation" ?
>>>
>>>     -David
>>>
>>>     >>
>>>     >> Leaving VMID0 with full access because otherwise HWS cannot
>>>     save or
>>>     >> restore values during task switch.
>>>     >>
>>>     >> v2: Fixed code and comment styling.
>>>     >>
>>>     >> Change-Id: I3d768a96935d2ed1dff09b02c995090f4fbfa539
>>>     >> Signed-off-by: Joseph Greathouse <Joseph.Greathouse@amd.com
>>>     <mailto:Joseph.Greathouse@amd.com>>
>>>     >
>>>     > Reviewed-by: Christian König <christian.koenig@amd.com
>>>     <mailto:christian.koenig@amd.com>>
>>>     >
>>>     >> ---
>>>     >>   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 25
>>>     ++++++++++++++++++-------
>>>     >>   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c  | 24
>>>     +++++++++++++++++-------
>>>     >>   drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c  | 24
>>>     +++++++++++++++++-------
>>>     >>   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 24
>>>     +++++++++++++++++-------
>>>     >>   4 files changed, 69 insertions(+), 28 deletions(-)
>>>     >>
>>>     >> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>>>     >> b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>>>     >> index 73dcb632a3ce..2a9692bc34b4 100644
>>>     >> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>>>     >> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>>>     >> @@ -1516,17 +1516,27 @@ static void
>>>     >> gfx_v10_0_init_compute_vmid(struct amdgpu_device *adev)
>>>     >>       }
>>>     >>       nv_grbm_select(adev, 0, 0, 0, 0);
>>>     >>       mutex_unlock(&adev->srbm_mutex);
>>>     >> +}
>>>     >>   -    /* Initialize all compute VMIDs to have no GDS, GWS, or OA
>>>     >> -       acccess. These should be enabled by FW for target
>>>     VMIDs. */
>>>     >> -    for (i = FIRST_COMPUTE_VMID; i < LAST_COMPUTE_VMID; i++) {
>>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_BASE, 2 * i, 0);
>>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_SIZE, 2 * i, 0);
>>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_GWS_VMID0, i, 0);
>>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0, i, 0);
>>>     >> +static void gfx_v10_0_init_gds_vmid(struct amdgpu_device *adev)
>>>     >> +{
>>>     >> +    int vmid;
>>>     >> +
>>>     >> +    /*
>>>     >> +     * Initialize all compute and user-gfx VMIDs to have no
>>>     GDS,
>>>     >> GWS, or OA
>>>     >> +     * access. Compute VMIDs should be enabled by FW for
>>>     target VMIDs,
>>>     >> +     * the driver can enable them for graphics. VMID0 should
>>>     maintain
>>>     >> +     * access so that HWS firmware can save/restore entries.
>>>     >> +     */
>>>     >> +    for (vmid = 1; vmid < 16; vmid++) {
>>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_BASE, 2 *
>>>     vmid, 0);
>>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_SIZE, 2 *
>>>     vmid, 0);
>>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_GWS_VMID0, vmid, 0);
>>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0, vmid, 0);
>>>     >>       }
>>>     >>   }
>>>     >>   +
>>>     >>   static void gfx_v10_0_tcp_harvest(struct amdgpu_device *adev)
>>>     >>   {
>>>     >>       int i, j, k;
>>>     >> @@ -1629,6 +1639,7 @@ static void
>>>     gfx_v10_0_constants_init(struct
>>>     >> amdgpu_device *adev)
>>>     >>       mutex_unlock(&adev->srbm_mutex);
>>>     >>         gfx_v10_0_init_compute_vmid(adev);
>>>     >> +    gfx_v10_0_init_gds_vmid(adev);
>>>     >>     }
>>>     >>   diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>>     >> b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>>     >> index 3f98624772a4..48796b6824cf 100644
>>>     >> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>>     >> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>>     >> @@ -1877,14 +1877,23 @@ static void
>>>     gfx_v7_0_init_compute_vmid(struct
>>>     >> amdgpu_device *adev)
>>>     >>       }
>>>     >>       cik_srbm_select(adev, 0, 0, 0, 0);
>>>     >>       mutex_unlock(&adev->srbm_mutex);
>>>     >> +}
>>>     >>   -    /* Initialize all compute VMIDs to have no GDS, GWS, or OA
>>>     >> -       acccess. These should be enabled by FW for target
>>>     VMIDs. */
>>>     >> -    for (i = FIRST_COMPUTE_VMID; i < LAST_COMPUTE_VMID; i++) {
>>>     >> - WREG32(amdgpu_gds_reg_offset[i].mem_base, 0);
>>>     >> - WREG32(amdgpu_gds_reg_offset[i].mem_size, 0);
>>>     >> -        WREG32(amdgpu_gds_reg_offset[i].gws, 0);
>>>     >> -        WREG32(amdgpu_gds_reg_offset[i].oa, 0);
>>>     >> +static void gfx_v7_0_init_gds_vmid(struct amdgpu_device *adev)
>>>     >> +{
>>>     >> +    int vmid;
>>>     >> +
>>>     >> +    /*
>>>     >> +     * Initialize all compute and user-gfx VMIDs to have no
>>>     GDS,
>>>     >> GWS, or OA
>>>     >> +     * access. Compute VMIDs should be enabled by FW for
>>>     target VMIDs,
>>>     >> +     * the driver can enable them for graphics. VMID0 should
>>>     maintain
>>>     >> +     * access so that HWS firmware can save/restore entries.
>>>     >> +     */
>>>     >> +    for (vmid = 1; vmid < 16; vmid++) {
>>>     >> + WREG32(amdgpu_gds_reg_offset[vmid].mem_base, 0);
>>>     >> + WREG32(amdgpu_gds_reg_offset[vmid].mem_size, 0);
>>>     >> +        WREG32(amdgpu_gds_reg_offset[vmid].gws, 0);
>>>     >> +        WREG32(amdgpu_gds_reg_offset[vmid].oa, 0);
>>>     >>       }
>>>     >>   }
>>>     >>   @@ -1966,6 +1975,7 @@ static void
>>>     gfx_v7_0_constants_init(struct
>>>     >> amdgpu_device *adev)
>>>     >>       mutex_unlock(&adev->srbm_mutex);
>>>     >>         gfx_v7_0_init_compute_vmid(adev);
>>>     >> +    gfx_v7_0_init_gds_vmid(adev);
>>>     >>         WREG32(mmSX_DEBUG_1, 0x20);
>>>     >>   diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>>     >> b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>>     >> index e4028d54f8f7..d2907186bb24 100644
>>>     >> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>>     >> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>>     >> @@ -3702,14 +3702,23 @@ static void
>>>     gfx_v8_0_init_compute_vmid(struct
>>>     >> amdgpu_device *adev)
>>>     >>       }
>>>     >>       vi_srbm_select(adev, 0, 0, 0, 0);
>>>     >>       mutex_unlock(&adev->srbm_mutex);
>>>     >> +}
>>>     >>   -    /* Initialize all compute VMIDs to have no GDS, GWS, or OA
>>>     >> -       acccess. These should be enabled by FW for target
>>>     VMIDs. */
>>>     >> -    for (i = FIRST_COMPUTE_VMID; i < LAST_COMPUTE_VMID; i++) {
>>>     >> - WREG32(amdgpu_gds_reg_offset[i].mem_base, 0);
>>>     >> - WREG32(amdgpu_gds_reg_offset[i].mem_size, 0);
>>>     >> -        WREG32(amdgpu_gds_reg_offset[i].gws, 0);
>>>     >> -        WREG32(amdgpu_gds_reg_offset[i].oa, 0);
>>>     >> +static void gfx_v8_0_init_gds_vmid(struct amdgpu_device *adev)
>>>     >> +{
>>>     >> +    int vmid;
>>>     >> +
>>>     >> +    /*
>>>     >> +     * Initialize all compute and user-gfx VMIDs to have no
>>>     GDS,
>>>     >> GWS, or OA
>>>     >> +     * access. Compute VMIDs should be enabled by FW for
>>>     target VMIDs,
>>>     >> +     * the driver can enable them for graphics. VMID0 should
>>>     maintain
>>>     >> +     * access so that HWS firmware can save/restore entries.
>>>     >> +     */
>>>     >> +    for (vmid = 1; vmid < 16; vmid++) {
>>>     >> + WREG32(amdgpu_gds_reg_offset[vmid].mem_base, 0);
>>>     >> + WREG32(amdgpu_gds_reg_offset[vmid].mem_size, 0);
>>>     >> +        WREG32(amdgpu_gds_reg_offset[vmid].gws, 0);
>>>     >> +        WREG32(amdgpu_gds_reg_offset[vmid].oa, 0);
>>>     >>       }
>>>     >>   }
>>>     >>   @@ -3779,6 +3788,7 @@ static void
>>>     gfx_v8_0_constants_init(struct
>>>     >> amdgpu_device *adev)
>>>     >>       mutex_unlock(&adev->srbm_mutex);
>>>     >>         gfx_v8_0_init_compute_vmid(adev);
>>>     >> +    gfx_v8_0_init_gds_vmid(adev);
>>>     >>         mutex_lock(&adev->grbm_idx_mutex);
>>>     >>       /*
>>>     >> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>>>     >> b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>>>     >> index 259a35395fec..bd7f431a24d9 100644
>>>     >> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>>>     >> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>>>     >> @@ -2025,14 +2025,23 @@ static void
>>>     gfx_v9_0_init_compute_vmid(struct
>>>     >> amdgpu_device *adev)
>>>     >>       }
>>>     >>       soc15_grbm_select(adev, 0, 0, 0, 0);
>>>     >>       mutex_unlock(&adev->srbm_mutex);
>>>     >> +}
>>>     >>   -    /* Initialize all compute VMIDs to have no GDS, GWS, or OA
>>>     >> -       acccess. These should be enabled by FW for target
>>>     VMIDs. */
>>>     >> -    for (i = FIRST_COMPUTE_VMID; i < LAST_COMPUTE_VMID; i++) {
>>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_BASE, 2 * i, 0);
>>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_SIZE, 2 * i, 0);
>>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_GWS_VMID0, i, 0);
>>>     >> -        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0, i, 0);
>>>     >> +static void gfx_v9_0_init_gds_vmid(struct amdgpu_device *adev)
>>>     >> +{
>>>     >> +    int vmid;
>>>     >> +
>>>     >> +    /*
>>>     >> +     * Initialize all compute and user-gfx VMIDs to have no
>>>     GDS,
>>>     >> GWS, or OA
>>>     >> +     * access. Compute VMIDs should be enabled by FW for
>>>     target VMIDs,
>>>     >> +     * the driver can enable them for graphics. VMID0 should
>>>     maintain
>>>     >> +     * access so that HWS firmware can save/restore entries.
>>>     >> +     */
>>>     >> +    for (vmid = 1; vmid < 16; vmid++) {
>>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_BASE, 2 *
>>>     vmid, 0);
>>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_SIZE, 2 *
>>>     vmid, 0);
>>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_GWS_VMID0, vmid, 0);
>>>     >> +        WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0, vmid, 0);
>>>     >>       }
>>>     >>   }
>>>     >>   @@ -2080,6 +2089,7 @@ static void
>>>     gfx_v9_0_constants_init(struct
>>>     >> amdgpu_device *adev)
>>>     >>       mutex_unlock(&adev->srbm_mutex);
>>>     >>         gfx_v9_0_init_compute_vmid(adev);
>>>     >> +    gfx_v9_0_init_gds_vmid(adev);
>>>     >>   }
>>>     >>     static void gfx_v9_0_wait_for_rlc_serdes(struct
>>>     amdgpu_device *adev)
>>>     >
>>>     > _______________________________________________
>>>     > amd-gfx mailing list
>>>     > amd-gfx@lists.freedesktop.org
>>>     <mailto:amd-gfx@lists.freedesktop.org>
>>>     > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>>>     _______________________________________________
>>>     amd-gfx mailing list
>>>     amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org>
>>>     https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>>>
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>

--------------7D7A78475667B6636281DB2F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2019/8/29 下午3:22, Christian König
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:293feae7-bda5-d8af-2dca-6f2025dc3fba@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div class="moz-cite-prefix">Am 29.08.19 um 07:55 schrieb zhoucm1:<br>
      </div>
      <blockquote type="cite"
        cite="mid:bdb61ac5-e1ab-725c-56cf-475d7b41ebc2@amd.com">
        <p><br>
        </p>
        <div class="moz-cite-prefix">On 2019/8/29 上午1:08, Marek Olšák
          wrote:<br>
        </div>
        <blockquote type="cite"
cite="mid:CAAxE2A5MgKswdeHg1YrDs_G7hCuoZAVFuPyoHoA+DbUjA32eHg@mail.gmail.com">
          <div dir="ltr">
            <div>It can't break an older driver, because there is no
              older driver that requires the static allocation.</div>
            <div><br>
            </div>
            <div>Note that closed source drivers don't count, because
              they don't need backward compatibility.</div>
          </div>
        </blockquote>
        <p>Yes, I agree, we don't need take care of closed source stack.</p>
        <p>But AMDVLK is indeed an open source stack, many fans are
          using it, we need keep its compatibility, don't we?</p>
      </blockquote>
      <br>
      Actually that is still under discussion.<br>
      <br>
      But AMDVLK should have never ever used the static GDS space in the
      first place. We only added that for a transition time for old
      OpenGL and it shouldn't have leaked into the upstream driver.<br>
      <br>
      Not sure what's the best approach here. We could revert "[PATCH]
      drm/amdgpu: remove static GDS, GWS and OA", but that would break
      KFD. So we can only choose between two evils here.<br>
      <br>
      Only alternative I can see which would work for both would be to
      still allocate the static GDS, GWS and OA space, but make it
      somehow dynamic so that the KFD can swap it out again.<br>
    </blockquote>
    <p>Agree with you.</p>
    <p>-David<br>
    </p>
    <blockquote type="cite"
      cite="mid:293feae7-bda5-d8af-2dca-6f2025dc3fba@gmail.com"> <br>
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
            <div dir="ltr" class="gmail_attr">On Wed, Aug 28, 2019 at
              2:44 AM zhoucm1 &lt;<a href="mailto:zhoucm1@amd.com"
                moz-do-not-send="true">zhoucm1@amd.com</a>&gt; wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex"><br>
              On 2019/7/23 上午3:08, Christian König wrote:<br>
              &gt; Am 22.07.19 um 17:34 schrieb Greathouse, Joseph:<br>
              &gt;&gt; Units in the GDS block default to allowing all
              VMIDs access to all<br>
              &gt;&gt; entries. Disable shader access to the GDS, GWS,
              and OA blocks from all<br>
              &gt;&gt; compute and gfx VMIDs by default. For compute,
              HWS firmware will set<br>
              &gt;&gt; up the access bits for the appropriate VMID when
              a compute queue<br>
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
              pass gds/gws/oa allocation to bo_list, then kernel will
              not enable <br>
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
              &gt;&gt; diff --git
              a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c <br>
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
              &gt;&gt; -       acccess. These should be enabled by FW
              for target VMIDs. */<br>
              &gt;&gt; -    for (i = FIRST_COMPUTE_VMID; i &lt;
              LAST_COMPUTE_VMID; i++) {<br>
              &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0,
              mmGDS_VMID0_BASE, 2 * i, 0);<br>
              &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0,
              mmGDS_VMID0_SIZE, 2 * i, 0);<br>
              &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0,
              mmGDS_GWS_VMID0, i, 0);<br>
              &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0,
              mmGDS_OA_VMID0, i, 0);<br>
              &gt;&gt; +static void gfx_v10_0_init_gds_vmid(struct
              amdgpu_device *adev)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +    int vmid;<br>
              &gt;&gt; +<br>
              &gt;&gt; +    /*<br>
              &gt;&gt; +     * Initialize all compute and user-gfx VMIDs
              to have no GDS, <br>
              &gt;&gt; GWS, or OA<br>
              &gt;&gt; +     * access. Compute VMIDs should be enabled
              by FW for target VMIDs,<br>
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
              &gt;&gt; +        WREG32_SOC15_OFFSET(GC, 0,
              mmGDS_OA_VMID0, vmid, 0);<br>
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
              &gt;&gt; -       acccess. These should be enabled by FW
              for target VMIDs. */<br>
              &gt;&gt; -    for (i = FIRST_COMPUTE_VMID; i &lt;
              LAST_COMPUTE_VMID; i++) {<br>
              &gt;&gt; -       
              WREG32(amdgpu_gds_reg_offset[i].mem_base, 0);<br>
              &gt;&gt; -       
              WREG32(amdgpu_gds_reg_offset[i].mem_size, 0);<br>
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
              &gt;&gt; +     * access. Compute VMIDs should be enabled
              by FW for target VMIDs,<br>
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
              &gt;&gt; +        WREG32(amdgpu_gds_reg_offset[vmid].oa,
              0);<br>
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
              &gt;&gt; -       acccess. These should be enabled by FW
              for target VMIDs. */<br>
              &gt;&gt; -    for (i = FIRST_COMPUTE_VMID; i &lt;
              LAST_COMPUTE_VMID; i++) {<br>
              &gt;&gt; -       
              WREG32(amdgpu_gds_reg_offset[i].mem_base, 0);<br>
              &gt;&gt; -       
              WREG32(amdgpu_gds_reg_offset[i].mem_size, 0);<br>
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
              &gt;&gt; +     * access. Compute VMIDs should be enabled
              by FW for target VMIDs,<br>
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
              &gt;&gt; +        WREG32(amdgpu_gds_reg_offset[vmid].oa,
              0);<br>
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
              &gt;&gt; diff --git
              a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c <br>
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
              &gt;&gt; -       acccess. These should be enabled by FW
              for target VMIDs. */<br>
              &gt;&gt; -    for (i = FIRST_COMPUTE_VMID; i &lt;
              LAST_COMPUTE_VMID; i++) {<br>
              &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0,
              mmGDS_VMID0_BASE, 2 * i, 0);<br>
              &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0,
              mmGDS_VMID0_SIZE, 2 * i, 0);<br>
              &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0,
              mmGDS_GWS_VMID0, i, 0);<br>
              &gt;&gt; -        WREG32_SOC15_OFFSET(GC, 0,
              mmGDS_OA_VMID0, i, 0);<br>
              &gt;&gt; +static void gfx_v9_0_init_gds_vmid(struct
              amdgpu_device *adev)<br>
              &gt;&gt; +{<br>
              &gt;&gt; +    int vmid;<br>
              &gt;&gt; +<br>
              &gt;&gt; +    /*<br>
              &gt;&gt; +     * Initialize all compute and user-gfx VMIDs
              to have no GDS, <br>
              &gt;&gt; GWS, or OA<br>
              &gt;&gt; +     * access. Compute VMIDs should be enabled
              by FW for target VMIDs,<br>
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
              &gt;&gt; +        WREG32_SOC15_OFFSET(GC, 0,
              mmGDS_OA_VMID0, vmid, 0);<br>
              &gt;&gt;       }<br>
              &gt;&gt;   }<br>
              &gt;&gt;   @@ -2080,6 +2089,7 @@ static void
              gfx_v9_0_constants_init(struct <br>
              &gt;&gt; amdgpu_device *adev)<br>
              &gt;&gt;       mutex_unlock(&amp;adev-&gt;srbm_mutex);<br>
              &gt;&gt;         gfx_v9_0_init_compute_vmid(adev);<br>
              &gt;&gt; +    gfx_v9_0_init_gds_vmid(adev);<br>
              &gt;&gt;   }<br>
              &gt;&gt;     static void
              gfx_v9_0_wait_for_rlc_serdes(struct amdgpu_device *adev)<br>
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
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx" moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></pre>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------7D7A78475667B6636281DB2F--

--===============0989227854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0989227854==--
