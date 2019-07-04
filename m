Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C131A5F351
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 09:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75598976D;
	Thu,  4 Jul 2019 07:14:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710087.outbound.protection.outlook.com [40.107.71.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267E28976D
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 07:14:40 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1819.namprd12.prod.outlook.com (10.175.91.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 07:14:38 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 07:14:38 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Yang, Philip" <Philip.Yang@amd.com>
Subject: Re: [PATCH 1/1] drm/amdkfd: Consistently apply noretry setting
Thread-Topic: [PATCH 1/1] drm/amdkfd: Consistently apply noretry setting
Thread-Index: AQHVKJBNQEMnb8jF3Uq9ShlXitOFVqa3wP4AgAHInYCAAJWMPA==
Date: Thu, 4 Jul 2019 07:14:38 +0000
Message-ID: <be9a4b8c-cd48-443f-9f55-09b41c91e263@email.android.com>
References: <20190622001959.32290-1-Felix.Kuehling@amd.com>
 <953e3a92-2d3b-0275-2a05-253570ab6277@amd.com>,
 <5edef671-8986-e513-f03b-15066b8ab0d6@amd.com>
In-Reply-To: <5edef671-8986-e513-f03b-15066b8ab0d6@amd.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a02:8109:500:e1c:b9dc:4e18:6df7:24d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 680f626d-ab9b-4f7a-9f62-08d7004f46ad
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1819; 
x-ms-traffictypediagnostic: DM5PR12MB1819:
x-microsoft-antispam-prvs: <DM5PR12MB1819BDDE9F1251DB1370ACF783FA0@DM5PR12MB1819.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(199004)(189003)(54896002)(6512007)(186003)(71190400001)(9686003)(6486002)(72206003)(229853002)(71200400001)(76176011)(5660300002)(6436002)(4326008)(76116006)(53546011)(2906002)(66946007)(14454004)(256004)(66446008)(66476007)(66556008)(91956017)(73956011)(7736002)(14444005)(64756008)(8936002)(81166006)(8676002)(46003)(11346002)(6636002)(81156014)(476003)(54906003)(446003)(102836004)(31686004)(6116002)(53936002)(316002)(86362001)(6506007)(66574012)(6246003)(6862004)(99286004)(68736007)(478600001)(31696002)(25786009)(486006)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1819;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eHMPZwkj6DvQCqQhbvPA1oSbO2X706JHj9XpUGsaGi4+utcGwVHuAzaF02hXF1bos0otv+73QTj5oJwpPe6bjsLmTfedgAzVC72Ay4HAJi+p3OC+HYA4USHY9ITXAuq/TbvrEuqDKldZh/bpLWWMeJNGB7E5NQaXr2V+7Fh+/xbcB1f2Vy/tymu5+g1TJ5jI1k769gxF57Y/QbfDqVX4+BQa5D1/97BFh6ZxLGBZRWgmAm7FMiqOCAUqDaW1wicDeOI3k9iGeIxybfcc7DGPhx26EmirNmjw95nQE5mpnEnJw473CIAtPDKvmdR2rrJneckOTXGP0uym5iL4Uh6Rip13GFtHuawMz2pID9c5MjgjTa4D36cUDcL/8hBgavVXEmlBqHeRT2zdPHA5atf+BvNbKWBfa51oSkBcxf2LBqs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 680f626d-ab9b-4f7a-9f62-08d7004f46ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 07:14:38.2292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1819
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/DzfTitkDL5S22lKt1AyRcc8/oOOvr51h54EDnaMSo=;
 b=QPsbGF2mQ1DHpoe3A2bLkp8azyQ4qUrLUB/NGXt+I2oteDlVpACk7P056DRxmoSK6CQQIcwbqHnRGj5VKlnA9MbM9ptoBpIz6I6dhDlTgrEaQrTJs6gQnizGxw1kTiXu/JXHpVlE5wEl7loaMx3IBxKXnkkz/Jl5xOsyx+XRJUk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1522252846=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1522252846==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_be9a4b8ccd48443f9f5509b41c91e263emailandroidcom_"

--_000_be9a4b8ccd48443f9f5509b41c91e263emailandroidcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Patches to silent retry faults are already on the mailing list.

But I need to get back from vacation to take a closer look at this once mor=
e.

Christian.

Am 04.07.2019 00:19 schrieb "Yang, Philip" <Philip.Yang@amd.com>:
amdgpu_noretry default value is 0, this will generate VM fault storm
because the vm fault is not recovered. It may slow down the machine and
need reboot after application VM fault. Maybe change default value to 1?

Other than that, this is reviewed by Philip Yang <Philip.Yang@amd.com>

On 2019-07-02 3:05 p.m., Kuehling, Felix wrote:
> Ping.
>
> Christian, Philip, any opinion about this patch?
>
> On 2019-06-21 8:20 p.m., Kuehling, Felix wrote:
>> Apply the same setting to SH_MEM_CONFIG and VM_CONTEXT1_CNTL. This
>> makes the noretry param no longer KFD-specific. On GFX10 I'm not
>> changing SH_MEM_CONFIG in this commit because GFX10 has different
>> retry behaviour in the SQ and I don't have a way to test it at the
>> moment.
>>
>> Suggested-by: Christian K=F6nig <Christian.Koenig@amd.com>
>> CC: Philip Yang <Philip.Yang@amd.com>
>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> ---
>>    drivers/gpu/drm/amd/amdgpu/amdgpu.h              |  1 +
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c          | 16 +++++----------=
-
>>    drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c            |  4 ++++
>>    drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c         |  3 ++-
>>    drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c         |  3 ++-
>>    drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c          |  3 ++-
>>    drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c          |  3 ++-
>>    .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c |  2 +-
>>    drivers/gpu/drm/amd/amdkfd/kfd_priv.h            |  2 +-
>>    9 files changed, 20 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu.h
>> index 9b1efdf94bdf..05875279c09e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -164,6 +164,7 @@ extern int amdgpu_async_gfx_ring;
>>    extern int amdgpu_mcbp;
>>    extern int amdgpu_discovery;
>>    extern int amdgpu_mes;
>> +extern int amdgpu_noretry;
>>
>>    #ifdef CONFIG_DRM_AMDGPU_SI
>>    extern int amdgpu_si_support;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_drv.c
>> index 7cf6ab07b113..0d578d95be93 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -140,6 +140,7 @@ int amdgpu_async_gfx_ring =3D 1;
>>    int amdgpu_mcbp =3D 0;
>>    int amdgpu_discovery =3D 0;
>>    int amdgpu_mes =3D 0;
>> +int amdgpu_noretry;
>>
>>    struct amdgpu_mgpu_info mgpu_info =3D {
>>       .mutex =3D __MUTEX_INITIALIZER(mgpu_info.mutex),
>> @@ -591,6 +592,10 @@ MODULE_PARM_DESC(mes,
>>       "Enable Micro Engine Scheduler (0 =3D disabled (default), 1 =3D en=
abled)");
>>    module_param_named(mes, amdgpu_mes, int, 0444);
>>
>> +MODULE_PARM_DESC(noretry,
>> +    "Disable retry faults (0 =3D retry enabled (default), 1 =3D retry d=
isabled)");
>> +module_param_named(noretry, amdgpu_noretry, int, 0644);
>> +
>>    #ifdef CONFIG_HSA_AMD
>>    /**
>>     * DOC: sched_policy (int)
>> @@ -666,17 +671,6 @@ module_param(ignore_crat, int, 0444);
>>    MODULE_PARM_DESC(ignore_crat,
>>       "Ignore CRAT table during KFD initialization (0 =3D use CRAT (defa=
ult), 1 =3D ignore CRAT)");
>>
>> -/**
>> - * DOC: noretry (int)
>> - * This parameter sets sh_mem_config.retry_disable. Default value, 0, e=
nables retry.
>> - * Setting 1 disables retry.
>> - * Retry is needed for recoverable page faults.
>> - */
>> -int noretry;
>> -module_param(noretry, int, 0644);
>> -MODULE_PARM_DESC(noretry,
>> -    "Set sh_mem_config.retry_disable on Vega10 (0 =3D retry enabled (de=
fault), 1 =3D retry disabled)");
>> -
>>    /**
>>     * DOC: halt_if_hws_hang (int)
>>     * Halt if HWS hang is detected. Default value, 0, disables the halt =
on hang.
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v9_0.c
>> index e0f3014e76ea..c4e715170bfe 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>> @@ -1938,11 +1938,15 @@ static void gfx_v9_0_constants_init(struct amdgp=
u_device *adev)
>>               if (i =3D=3D 0) {
>>                       tmp =3D REG_SET_FIELD(0, SH_MEM_CONFIG, ALIGNMENT_=
MODE,
>>                                           SH_MEM_ALIGNMENT_MODE_UNALIGNE=
D);
>> +                    tmp =3D REG_SET_FIELD(tmp, SH_MEM_CONFIG, RETRY_DIS=
ABLE,
>> +                                        !!amdgpu_noretry);
>>                       WREG32_SOC15_RLC(GC, 0, mmSH_MEM_CONFIG, tmp);
>>                       WREG32_SOC15_RLC(GC, 0, mmSH_MEM_BASES, 0);
>>               } else {
>>                       tmp =3D REG_SET_FIELD(0, SH_MEM_CONFIG, ALIGNMENT_=
MODE,
>>                                           SH_MEM_ALIGNMENT_MODE_UNALIGNE=
D);
>> +                    tmp =3D REG_SET_FIELD(tmp, SH_MEM_CONFIG, RETRY_DIS=
ABLE,
>> +                                        !!amdgpu_noretry);
>>                       WREG32_SOC15_RLC(GC, 0, mmSH_MEM_CONFIG, tmp);
>>                       tmp =3D REG_SET_FIELD(0, SH_MEM_BASES, PRIVATE_BAS=
E,
>>                               (adev->gmc.private_aperture_start >> 48));
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c b/drivers/gpu/drm/=
amd/amdgpu/gfxhub_v1_0.c
>> index 9f0f189fc111..15986748f59f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
>> @@ -236,7 +236,8 @@ static void gfxhub_v1_0_setup_vmid_config(struct amd=
gpu_device *adev)
>>                                   block_size);
>>               /* Send no-retry XNACK on fault to suppress VM fault storm=
. */
>>               tmp =3D REG_SET_FIELD(tmp, VM_CONTEXT1_CNTL,
>> -                                RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,=
 1);
>> +                                RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,
>> +                                !amdgpu_noretry);
>>               WREG32_SOC15_OFFSET(GC, 0, mmVM_CONTEXT1_CNTL, i, tmp);
>>               WREG32_SOC15_OFFSET(GC, 0, mmVM_CONTEXT1_PAGE_TABLE_START_=
ADDR_LO32, i*2, 0);
>>               WREG32_SOC15_OFFSET(GC, 0, mmVM_CONTEXT1_PAGE_TABLE_START_=
ADDR_HI32, i*2, 0);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c b/drivers/gpu/drm/=
amd/amdgpu/gfxhub_v2_0.c
>> index b7de60a15623..d605b4963f8a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c
>> @@ -215,7 +215,8 @@ static void gfxhub_v2_0_setup_vmid_config(struct amd=
gpu_device *adev)
>>                               adev->vm_manager.block_size - 9);
>>               /* Send no-retry XNACK on fault to suppress VM fault storm=
. */
>>               tmp =3D REG_SET_FIELD(tmp, GCVM_CONTEXT1_CNTL,
>> -                                RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,=
 0);
>> +                                RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,
>> +                                !amdgpu_noretry);
>>               WREG32_SOC15_OFFSET(GC, 0, mmGCVM_CONTEXT1_CNTL, i, tmp);
>>               WREG32_SOC15_OFFSET(GC, 0, mmGCVM_CONTEXT1_PAGE_TABLE_STAR=
T_ADDR_LO32, i*2, 0);
>>               WREG32_SOC15_OFFSET(GC, 0, mmGCVM_CONTEXT1_PAGE_TABLE_STAR=
T_ADDR_HI32, i*2, 0);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c b/drivers/gpu/drm/a=
md/amdgpu/mmhub_v1_0.c
>> index 05d1d448c8f5..dc5ce03034d3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
>> @@ -265,7 +265,8 @@ static void mmhub_v1_0_setup_vmid_config(struct amdg=
pu_device *adev)
>>                                   block_size);
>>               /* Send no-retry XNACK on fault to suppress VM fault storm=
. */
>>               tmp =3D REG_SET_FIELD(tmp, VM_CONTEXT1_CNTL,
>> -                                RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,=
 1);
>> +                                RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,
>> +                                !amdgpu_noretry);
>>               WREG32_SOC15_OFFSET(MMHUB, 0, mmVM_CONTEXT1_CNTL, i, tmp);
>>               WREG32_SOC15_OFFSET(MMHUB, 0, mmVM_CONTEXT1_PAGE_TABLE_STA=
RT_ADDR_LO32, i*2, 0);
>>               WREG32_SOC15_OFFSET(MMHUB, 0, mmVM_CONTEXT1_PAGE_TABLE_STA=
RT_ADDR_HI32, i*2, 0);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c b/drivers/gpu/drm/a=
md/amdgpu/mmhub_v2_0.c
>> index 37a1a318ae63..0f9549f19ade 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
>> @@ -205,7 +205,8 @@ static void mmhub_v2_0_setup_vmid_config(struct amdg=
pu_device *adev)
>>                                   adev->vm_manager.block_size - 9);
>>               /* Send no-retry XNACK on fault to suppress VM fault storm=
. */
>>               tmp =3D REG_SET_FIELD(tmp, MMVM_CONTEXT1_CNTL,
>> -                                RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,=
 0);
>> +                                RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,
>> +                                !amdgpu_noretry);
>>               WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT1_CNTL, i, tmp=
);
>>               WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT1_PAGE_TABLE_S=
TART_ADDR_LO32, i*2, 0);
>>               WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT1_PAGE_TABLE_S=
TART_ADDR_HI32, i*2, 0);
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c b/=
drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
>> index e9fe39382371..95a82ac455f2 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
>> @@ -61,7 +61,7 @@ static int update_qpd_v9(struct device_queue_manager *=
dqm,
>>               qpd->sh_mem_config =3D
>>                               SH_MEM_ALIGNMENT_MODE_UNALIGNED <<
>>                                       SH_MEM_CONFIG__ALIGNMENT_MODE__SHI=
FT;
>> -            if (noretry &&
>> +            if (amdgpu_noretry &&
>>                   !dqm->dev->device_info->needs_iommu_device)
>>                       qpd->sh_mem_config |=3D
>>                               1 << SH_MEM_CONFIG__RETRY_DISABLE__SHIFT;
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd=
/amdkfd/kfd_priv.h
>> index d4bba0124d29..aa7bf20d20f8 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>> @@ -157,7 +157,7 @@ extern int ignore_crat;
>>    /*
>>     * Set sh_mem_config.retry_disable on Vega10
>>     */
>> -extern int noretry;
>> +extern int amdgpu_noretry;
>>
>>    /*
>>     * Halt if HWS hang is detected

--_000_be9a4b8ccd48443f9f5509b41c91e263emailandroidcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto">Patches to silent retry faults are already on the mailing=
 list.
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">But I need to get back from vacation to take a closer loo=
k at this once more.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Christian.</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">Am 04.07.2019 00:19 schrieb &quot;Yang, Philip=
&quot; &lt;Philip.Yang@amd.com&gt;:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">amdgpu_noretry default value is 0, this will gener=
ate VM fault storm
<br>
because the vm fault is not recovered. It may slow down the machine and <br=
>
need reboot after application VM fault. Maybe change default value to 1?<br=
>
<br>
Other than that, this is reviewed by Philip Yang &lt;Philip.Yang@amd.com&gt=
;<br>
<br>
On 2019-07-02 3:05 p.m., Kuehling, Felix wrote:<br>
&gt; Ping.<br>
&gt; <br>
&gt; Christian, Philip, any opinion about this patch?<br>
&gt; <br>
&gt; On 2019-06-21 8:20 p.m., Kuehling, Felix wrote:<br>
&gt;&gt; Apply the same setting to SH_MEM_CONFIG and VM_CONTEXT1_CNTL. This=
<br>
&gt;&gt; makes the noretry param no longer KFD-specific. On GFX10 I'm not<b=
r>
&gt;&gt; changing SH_MEM_CONFIG in this commit because GFX10 has different<=
br>
&gt;&gt; retry behaviour in the SQ and I don't have a way to test it at the=
<br>
&gt;&gt; moment.<br>
&gt;&gt;<br>
&gt;&gt; Suggested-by: Christian K=F6nig &lt;Christian.Koenig@amd.com&gt;<b=
r>
&gt;&gt; CC: Philip Yang &lt;Philip.Yang@amd.com&gt;<br>
&gt;&gt; Signed-off-by: Felix Kuehling &lt;Felix.Kuehling@amd.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1=
 &#43;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 16 &#43;&#43;&#43;&#43;&#43=
;-----------<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 &#43;&#43=
;&#43;&#43;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 &#43;&#43;-<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 &#43;&#43;-<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 &#43;&#43;-<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 &#43;&#43;-<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c=
 |&nbsp; 2 &#43;-<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdkfd/kfd_priv.h&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 &#43;-<br=
>
&gt;&gt;&nbsp;&nbsp;&nbsp; 9 files changed, 20 insertions(&#43;), 17 deleti=
ons(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu.h<br>
&gt;&gt; index 9b1efdf94bdf..05875279c09e 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt;&gt; @@ -164,6 &#43;164,7 @@ extern int amdgpu_async_gfx_ring;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; extern int amdgpu_mcbp;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; extern int amdgpu_discovery;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; extern int amdgpu_mes;<br>
&gt;&gt; &#43;extern int amdgpu_noretry;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&nbsp;&nbsp;&nbsp; #ifdef CONFIG_DRM_AMDGPU_SI<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; extern int amdgpu_si_support;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt;&gt; index 7cf6ab07b113..0d578d95be93 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt;&gt; @@ -140,6 &#43;140,7 @@ int amdgpu_async_gfx_ring =3D 1;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; int amdgpu_mcbp =3D 0;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; int amdgpu_discovery =3D 0;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; int amdgpu_mes =3D 0;<br>
&gt;&gt; &#43;int amdgpu_noretry;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&nbsp;&nbsp;&nbsp; struct amdgpu_mgpu_info mgpu_info =3D {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .mutex =3D __MUTEX_INITIALIZER=
(mgpu_info.mutex),<br>
&gt;&gt; @@ -591,6 &#43;592,10 @@ MODULE_PARM_DESC(mes,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Enable Micro Engine Sche=
duler (0 =3D disabled (default), 1 =3D enabled)&quot;);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; module_param_named(mes, amdgpu_mes, int, 0444);<=
br>
&gt;&gt;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt; &#43;MODULE_PARM_DESC(noretry,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; &quot;Disable retry faults (0 =3D retry en=
abled (default), 1 =3D retry disabled)&quot;);<br>
&gt;&gt; &#43;module_param_named(noretry, amdgpu_noretry, int, 0644);<br>
&gt;&gt; &#43;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; #ifdef CONFIG_HSA_AMD<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; /**<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; * DOC: sched_policy (int)<br>
&gt;&gt; @@ -666,17 &#43;671,6 @@ module_param(ignore_crat, int, 0444);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; MODULE_PARM_DESC(ignore_crat,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Ignore CRAT table during=
 KFD initialization (0 =3D use CRAT (default), 1 =3D ignore CRAT)&quot;);<b=
r>
&gt;&gt;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt; -/**<br>
&gt;&gt; - * DOC: noretry (int)<br>
&gt;&gt; - * This parameter sets sh_mem_config.retry_disable. Default value=
, 0, enables retry.<br>
&gt;&gt; - * Setting 1 disables retry.<br>
&gt;&gt; - * Retry is needed for recoverable page faults.<br>
&gt;&gt; - */<br>
&gt;&gt; -int noretry;<br>
&gt;&gt; -module_param(noretry, int, 0644);<br>
&gt;&gt; -MODULE_PARM_DESC(noretry,<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp; &quot;Set sh_mem_config.retry_disable on Vega1=
0 (0 =3D retry enabled (default), 1 =3D retry disabled)&quot;);<br>
&gt;&gt; -<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; /**<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; * DOC: halt_if_hws_hang (int)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; * Halt if HWS hang is detected. Default va=
lue, 0, disables the halt on hang.<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/d=
rm/amd/amdgpu/gfx_v9_0.c<br>
&gt;&gt; index e0f3014e76ea..c4e715170bfe 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<br>
&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<br>
&gt;&gt; @@ -1938,11 &#43;1938,15 @@ static void gfx_v9_0_constants_init(st=
ruct amdgpu_device *adev)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (i =3D=3D 0) {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D R=
EG_SET_FIELD(0, SH_MEM_CONFIG, ALIGNMENT_MODE,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SH_MEM_ALIGNMENT_MODE_UNALIGNED);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D REG_SET_FIELD=
(tmp, SH_MEM_CONFIG, RETRY_DISABLE,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; !!amdgpu_noretry);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SO=
C15_RLC(GC, 0, mmSH_MEM_CONFIG, tmp);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SO=
C15_RLC(GC, 0, mmSH_MEM_BASES, 0);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; } else {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D R=
EG_SET_FIELD(0, SH_MEM_CONFIG, ALIGNMENT_MODE,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SH_MEM_ALIGNMENT_MODE_UNALIGNED);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D REG_SET_FIELD=
(tmp, SH_MEM_CONFIG, RETRY_DISABLE,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; !!amdgpu_noretry);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SO=
C15_RLC(GC, 0, mmSH_MEM_CONFIG, tmp);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D R=
EG_SET_FIELD(0, SH_MEM_BASES, PRIVATE_BASE,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (adev-&gt;gmc.private_aperture_start=
 &gt;&gt; 48));<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c b/drivers/gp=
u/drm/amd/amdgpu/gfxhub_v1_0.c<br>
&gt;&gt; index 9f0f189fc111..15986748f59f 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c<br>
&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c<br>
&gt;&gt; @@ -236,7 &#43;236,8 @@ static void gfxhub_v1_0_setup_vmid_config(=
struct amdgpu_device *adev)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; block_size);=
<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; /* Send no-retry XNACK on fault to suppress VM fault stor=
m. */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; tmp =3D REG_SET_FIELD(tmp, VM_CONTEXT1_CNTL,<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETRY_PERMISSION_OR_INVALID_=
PAGE_FAULT, 1);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETRY_PERMISSION_OR_INVA=
LID_PAGE_FAULT,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !amdgpu_noretry);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(GC, 0, mmVM_CONTEXT1_CNTL, i, tmp);<b=
r>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(GC, 0, mmVM_CONTEXT1_PAGE_TABLE_START=
_ADDR_LO32, i*2, 0);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(GC, 0, mmVM_CONTEXT1_PAGE_TABLE_START=
_ADDR_HI32, i*2, 0);<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c b/drivers/gp=
u/drm/amd/amdgpu/gfxhub_v2_0.c<br>
&gt;&gt; index b7de60a15623..d605b4963f8a 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c<br>
&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c<br>
&gt;&gt; @@ -215,7 &#43;215,8 @@ static void gfxhub_v2_0_setup_vmid_config(=
struct amdgpu_device *adev)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;vm_manager.block_size - 9);=
<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; /* Send no-retry XNACK on fault to suppress VM fault stor=
m. */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; tmp =3D REG_SET_FIELD(tmp, GCVM_CONTEXT1_CNTL,<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETRY_PERMISSION_OR_INVALID_=
PAGE_FAULT, 0);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETRY_PERMISSION_OR_INVA=
LID_PAGE_FAULT,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !amdgpu_noretry);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(GC, 0, mmGCVM_CONTEXT1_CNTL, i, tmp);=
<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(GC, 0, mmGCVM_CONTEXT1_PAGE_TABLE_STA=
RT_ADDR_LO32, i*2, 0);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(GC, 0, mmGCVM_CONTEXT1_PAGE_TABLE_STA=
RT_ADDR_HI32, i*2, 0);<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c b/drivers/gpu=
/drm/amd/amdgpu/mmhub_v1_0.c<br>
&gt;&gt; index 05d1d448c8f5..dc5ce03034d3 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c<br>
&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c<br>
&gt;&gt; @@ -265,7 &#43;265,8 @@ static void mmhub_v1_0_setup_vmid_config(s=
truct amdgpu_device *adev)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; block_size);=
<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; /* Send no-retry XNACK on fault to suppress VM fault stor=
m. */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; tmp =3D REG_SET_FIELD(tmp, VM_CONTEXT1_CNTL,<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETRY_PERMISSION_OR_INVALID_=
PAGE_FAULT, 1);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETRY_PERMISSION_OR_INVA=
LID_PAGE_FAULT,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !amdgpu_noretry);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(MMHUB, 0, mmVM_CONTEXT1_CNTL, i, tmp)=
;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(MMHUB, 0, mmVM_CONTEXT1_PAGE_TABLE_ST=
ART_ADDR_LO32, i*2, 0);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(MMHUB, 0, mmVM_CONTEXT1_PAGE_TABLE_ST=
ART_ADDR_HI32, i*2, 0);<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c b/drivers/gpu=
/drm/amd/amdgpu/mmhub_v2_0.c<br>
&gt;&gt; index 37a1a318ae63..0f9549f19ade 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c<br>
&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c<br>
&gt;&gt; @@ -205,7 &#43;205,8 @@ static void mmhub_v2_0_setup_vmid_config(s=
truct amdgpu_device *adev)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;vm_=
manager.block_size - 9);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; /* Send no-retry XNACK on fault to suppress VM fault stor=
m. */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; tmp =3D REG_SET_FIELD(tmp, MMVM_CONTEXT1_CNTL,<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETRY_PERMISSION_OR_INVALID_=
PAGE_FAULT, 0);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RETRY_PERMISSION_OR_INVA=
LID_PAGE_FAULT,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !amdgpu_noretry);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT1_CNTL, i, tm=
p);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT1_PAGE_TABLE_=
START_ADDR_LO32, i*2, 0);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT1_PAGE_TABLE_=
START_ADDR_HI32, i*2, 0);<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v=
9.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c<br>
&gt;&gt; index e9fe39382371..95a82ac455f2 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c<br>
&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_mana=
ger_v9.c<br>
&gt;&gt; @@ -61,7 &#43;61,7 @@ static int update_qpd_v9(struct device_queue=
_manager *dqm,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; qpd-&gt;sh_mem_config =3D<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SH_MEM_ALIGNMENT_MODE_UNALIGNED &lt;=
&lt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; if (noretry &amp;&amp;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (amdgpu_noretry &amp;&amp;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !dqm-&gt;dev-&gt;device_info-&gt;=
needs_iommu_device)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qpd-&gt;s=
h_mem_config |=3D<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 &lt;&lt; SH_MEM_CONFIG__RETRY_DISA=
BLE__SHIFT;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/d=
rm/amd/amdkfd/kfd_priv.h<br>
&gt;&gt; index d4bba0124d29..aa7bf20d20f8 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h<br>
&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h<br>
&gt;&gt; @@ -157,7 &#43;157,7 @@ extern int ignore_crat;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; * Set sh_mem_config.retry_disable on Vega1=
0<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&gt; -extern int noretry;<br>
&gt;&gt; &#43;extern int amdgpu_noretry;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; * Halt if HWS hang is detected<br>
</div>
</span></font>
</body>
</html>

--_000_be9a4b8ccd48443f9f5509b41c91e263emailandroidcom_--

--===============1522252846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1522252846==--
