Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E555A9B212
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Aug 2019 16:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1A689CDE;
	Fri, 23 Aug 2019 14:34:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820082.outbound.protection.outlook.com [40.107.82.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1EA89CDE
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 14:34:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMreUtfYX2B4+iXDvOQrHwn+x+NNPiseqszn4/qbJGge1Wrcii/SchaFI+RIXAma4saoMEkXB3PXo5aE3H24qASHnAMxoBB3xuokoSeb7WoWiqv7hI0QosyWECVs3rkuvOGEHXPPnc01TWX18Go8kZh7ATVEmBVVKCo+2wqtiC6q8+1qGD2niJn7lQoH7MCctFU0x8cJmVxQftpC5GadHKf9GMiRr/Ikx+3fakJAGlvaKMkv+UNFFzbSKTjQqVPQFnu1YT8w/rw6gOVWB+x4CKkPEMd0oJmnauf3Uwp7nof35Oq+5sskMM9FXPhhM03pX8Xxn31jezpXpp9A35rYgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cA5OZTaEdhgl8tvr0vWFCr0h5YawYUr4tnwd3WTzRU=;
 b=DHjrHcb/mf1giYW1Okv0JjgnIZ9Tn0Owt3GGK/etbKkD1YT9QqU7uTvAix8II2uCTNKxkFqvt8xxdgSvahWhGRWiQuy1lzlHQotOQgrbBV1aId6Wr7hpV3cFlwtl6qEnBxbuVDqvPYvg3sIg4BglwoGxsry9ge7Wz0SZ8jpcoHq7u9KREcdhJgioZR4xXJlwVwHd+yp23/5Fsb3vM+5iCy4EMsOZ5ZgEQ9sl810NyMxjoZokmBlTZ1y/b7l05AH2Q+zLzxvRTVrboVrWwge6H0eWTbAW1ZEzmZZhKD9fiE12e0bwz9tnYHFQ4BHPUWa96tTiOErb2420y1pTKJGe8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1665.namprd12.prod.outlook.com (10.172.19.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 14:34:11 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 14:34:11 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu, Monk"
 <Monk.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: introduce vram lost paramter for reset
 function
Thread-Topic: [PATCH] drm/amdgpu: introduce vram lost paramter for reset
 function
Thread-Index: AQHVWWOqnu8s5wW8eU+EHGEe8AQI56cIZkIAgAABcgCAAACkAIAABnUAgABAJYCAAB10hQ==
Date: Fri, 23 Aug 2019 14:34:11 +0000
Message-ID: <BN6PR12MB1809D6CB333C3A473C71F2FCF7A40@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1566531249-1396-1-git-send-email-Monk.Liu@amd.com>
 <15d22497-cf4d-0d15-236c-5bc2b65eb656@gmail.com>
 <MN2PR12MB393366D270445A63B053DA3184A40@MN2PR12MB3933.namprd12.prod.outlook.com>
 <82e98a1b-a624-1e54-aae7-1a6ff9dda7f2@amd.com>
 <MN2PR12MB393324F969E3F29F76A0DA8384A40@MN2PR12MB3933.namprd12.prod.outlook.com>,
 <3920ef0e-857a-44ff-085e-e121c39e0420@amd.com>
In-Reply-To: <3920ef0e-857a-44ff-085e-e121c39e0420@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e3464cd-4b69-4a58-3cf2-08d727d6f70e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1665; 
x-ms-traffictypediagnostic: BN6PR12MB1665:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1665DA9A912A67B061E6088AF7A40@BN6PR12MB1665.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(13464003)(189003)(199004)(6506007)(53936002)(53546011)(25786009)(102836004)(606006)(66574012)(316002)(2501003)(3846002)(5660300002)(26005)(6246003)(66946007)(66476007)(66556008)(64756008)(66446008)(2906002)(33656002)(14444005)(110136005)(6116002)(105004)(256004)(76116006)(186003)(486006)(19627405001)(476003)(6436002)(86362001)(8676002)(30864003)(99286004)(478600001)(74316002)(71190400001)(71200400001)(54896002)(446003)(966005)(11346002)(6306002)(55016002)(9686003)(236005)(7696005)(7736002)(76176011)(229853002)(81156014)(81166006)(66066001)(14454004)(8936002)(52536014)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1665;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fxMDBxX7OMi7YFdWvtyYoTHj0eWVWHhKcS64bQYmOEBzuukQiBdQAQ1BZ7TE3F8AZtzKXfS6hZE+Nuh1PE+rLLemNCfa7dP0SDBvoXA3ZXafj2fdx7yYXcMmiRifu2ZVEa53x9/IEHAKbWlEp0YvnC/3V3eojPh8pj1oSPcN9w5AUfBLd+A+uOrwQ6OyHDUvKFvd1VBvgx0Akkvm66K73rfsGrbaTvf71HQbZHUXmgCbJPIioduPto0hKXlMqdnlikdmg2njzP5MC9p7uXJ3T/oCvL4YkqgHSxAiU7o0fnundjTORcY5WIHO4mIB8d6TJ7PfV8zD2jMqlsSjGk9ynlA1YY15N9KTVeHKRZ/5Htzu8JJ8/iE301qNEsG5InAG8E0qNUQS7Qedy41I1XnTcmm8ZS2WwpfEmu13l5qdv08=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3464cd-4b69-4a58-3cf2-08d727d6f70e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 14:34:11.6297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nNrVgiBYtZaYOqMrzc2YAX093LqNdPr6b+pAgjWBhd3nxVZPJ+udIK6n0AqWhDRcxAeAE3r/onczI5v/hHXkcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1665
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cA5OZTaEdhgl8tvr0vWFCr0h5YawYUr4tnwd3WTzRU=;
 b=gOPAzlp8dj2BRzyhK5VkHUwiAmWk3QfEAxRJD4BfFAH5T2cBPYPlS06tBOqWsnY6cC+07fK/6s6JuMs+O2GjLPLrmg+3UDAZy/bThx0okZebdmsFfZsGJZGKNuXoH5FzGHGl1oYv+fks53ZivyxkFYD2Ij9+PzeSzy2HQVg9neU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1514681795=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1514681795==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809D6CB333C3A473C71F2FCF7A40BN6PR12MB1809namp_"

--_000_BN6PR12MB1809D6CB333C3A473C71F2FCF7A40BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

for mode1 and BACO, I think we can assume vram is lost because the UMC gets=
 reset in that case.  Some of the data may still look valid, but it's not n=
ecessarily reliable.  For mode2, vram should be fine because the UMC doesn'=
t get reset.

Alex

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Koenig, =
Christian <Christian.Koenig@amd.com>
Sent: Friday, August 23, 2019 8:47 AM
To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@li=
sts.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: introduce vram lost paramter for reset fun=
ction

Am 23.08.19 um 10:57 schrieb Liu, Monk:
>>> vram_lost =3D amdgpu_device_check_vram_lost(tmp_adev);
>>>                              if (vram_lost) {
>>>                                      DRM_INFO("VRAM is lost due to GPU =
reset!\n");
>>>                                      atomic_inc(&tmp_adev->vram_lost_co=
unter);
> Above is the original logic, if we increment the counter in BACO reset ro=
utine, we would potentially
> Have another counter increasement if by coincidence the "amdgpu_device_ch=
eck_vram_lost" successfully detected the vram lost (although right now it d=
idn't ..)

Yeah, but would increment it twice be a problem? I don't think so.

> Do you mean we remove the amdgpu_device_check_vram_lost(tmp_adev) in devi=
ce_recovery() routine ?

Please no, that thing certainly proved to be useful. Maybe we could
investigate why it failed to auto detect the lost VRAM.

Christian.

> _____________________________________
> Monk Liu|GPU Virtualization Team |AMD
>
>
> -----Original Message-----
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Friday, August 23, 2019 4:34 PM
> To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org
> Subject: Re: [PATCH] drm/amdgpu: introduce vram lost paramter for reset f=
unction
>
> I thought in the BACO reset function.
>
> The top level reset function doesn't do much more than increment the vram=
_lost_counter either.
>
> Christian.
>
> Am 23.08.19 um 10:32 schrieb Liu, Monk:
>>>> On the other hand wouldn't it be simpler to just increment vram_lost_c=
ounter?
>> In where ? if you mean in amdgpu_device_recover routine I won't do that =
since the reset() can do any kind of reset like:
>> 1) PF FLR
>> 2) mode1/2 reset
>> 3) magic reset through config space
>> 4) BACO reset
>>
>> PF FLR won't cause VRAM lost, mode_1/2 is not clear to me, only BACO
>> reset is definitely a vram lost reset
>>
>> If you increase the counter in general function that will be not
>> accurate _____________________________________
>> Monk Liu|GPU Virtualization Team |AMD
>>
>>
>> -----Original Message-----
>> From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
>> Sent: Friday, August 23, 2019 4:27 PM
>> To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org
>> Subject: Re: [PATCH] drm/amdgpu: introduce vram lost paramter for
>> reset function
>>
>> Am 23.08.19 um 05:34 schrieb Monk Liu:
>>> for SOC15/vega10 the BACO reset would introduce vram lost in the high
>>> end address range and current kmd's vram lost checking cannot catch
>>> it since it only check visible frame buffer
>>>
>>> TODO:
>>> to confirm if mode1/2 reset would introduce vram lost
>> Looks good in general, but I would make the value mandatory or maybe use=
 a special return code instead.
>>
>> On the other hand wouldn't it be simpler to just increment vram_lost_cou=
nter?
>>
>> Christian.
>>
>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>> ---
>>>     drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  4 ++--
>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 12 +++++++-----
>>>     drivers/gpu/drm/amd/amdgpu/cik.c           |  2 +-
>>>     drivers/gpu/drm/amd/amdgpu/nv.c            | 10 +++++++---
>>>     drivers/gpu/drm/amd/amdgpu/si.c            |  2 +-
>>>     drivers/gpu/drm/amd/amdgpu/soc15.c         |  4 +++-
>>>     drivers/gpu/drm/amd/amdgpu/vi.c            |  2 +-
>>>     7 files changed, 22 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index f6ae565..1fe3756 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -552,7 +552,7 @@ struct amdgpu_asic_funcs {
>>>      int (*read_register)(struct amdgpu_device *adev, u32 se_num,
>>>                           u32 sh_num, u32 reg_offset, u32 *value);
>>>      void (*set_vga_state)(struct amdgpu_device *adev, bool state);
>>> -   int (*reset)(struct amdgpu_device *adev);
>>> +   int (*reset)(struct amdgpu_device *adev, bool *lost);
>>>      enum amd_reset_method (*reset_method)(struct amdgpu_device *adev);
>>>      /* get the reference clock */
>>>      u32 (*get_xclk)(struct amdgpu_device *adev); @@ -1136,7 +1136,7
>>> @@ int emu_soc_asic_init(struct amdgpu_device *adev);
>>>      * ASICs macro.
>>>      */
>>>     #define amdgpu_asic_set_vga_state(adev, state)
>>> (adev)->asic_funcs->set_vga_state((adev), (state)) -#define
>>> amdgpu_asic_reset(adev) (adev)->asic_funcs->reset((adev))
>>> +#define amdgpu_asic_reset(adev, lost)
>>> +(adev)->asic_funcs->reset((adev), (lost))
>>>     #define amdgpu_asic_reset_method(adev) (adev)->asic_funcs->reset_me=
thod((adev))
>>>     #define amdgpu_asic_get_xclk(adev) (adev)->asic_funcs->get_xclk((ad=
ev))
>>>     #define amdgpu_asic_set_uvd_clocks(adev, v, d)
>>> (adev)->asic_funcs->set_uvd_clocks((adev), (v), (d)) diff --git
>>> a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index 02b3e7d..8668cb8 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -2546,7 +2546,7 @@ static void amdgpu_device_xgmi_reset_func(struct =
work_struct *__work)
>>>      struct amdgpu_device *adev =3D
>>>              container_of(__work, struct amdgpu_device, xgmi_reset_work=
);
>>>
>>> -   adev->asic_reset_res =3D  amdgpu_asic_reset(adev);
>>> +   adev->asic_reset_res =3D  amdgpu_asic_reset(adev, NULL);
>>>      if (adev->asic_reset_res)
>>>              DRM_WARN("ASIC reset failed with error, %d for drm dev, %s=
",
>>>                       adev->asic_reset_res, adev->ddev->unique); @@ -27=
51,7 +2751,7
>>> @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>>       *  E.g., driver was not cleanly unloaded previously, etc.
>>>       */
>>>      if (!amdgpu_sriov_vf(adev) && amdgpu_asic_need_reset_on_init(adev)=
) {
>>> -           r =3D amdgpu_asic_reset(adev);
>>> +           r =3D amdgpu_asic_reset(adev, NULL);
>>>              if (r) {
>>>                      dev_err(adev->dev, "asic reset on init failed\n");
>>>                      goto failed;
>>> @@ -3084,7 +3084,7 @@ int amdgpu_device_suspend(struct drm_device *dev,=
 bool suspend, bool fbcon)
>>>              pci_disable_device(dev->pdev);
>>>              pci_set_power_state(dev->pdev, PCI_D3hot);
>>>      } else {
>>> -           r =3D amdgpu_asic_reset(adev);
>>> +           r =3D amdgpu_asic_reset(adev, NULL);
>>>              if (r)
>>>                      DRM_ERROR("amdgpu asic reset failed\n");
>>>      }
>>> @@ -3604,7 +3604,7 @@ static int amdgpu_do_asic_reset(struct amdgpu_hiv=
e_info *hive,
>>>                              if (!queue_work(system_highpri_wq, &tmp_ad=
ev->xgmi_reset_work))
>>>                                      r =3D -EALREADY;
>>>                      } else
>>> -                           r =3D amdgpu_asic_reset(tmp_adev);
>>> +                           r =3D amdgpu_asic_reset(tmp_adev, &vram_los=
t);
>>>
>>>                      if (r) {
>>>                              DRM_ERROR("ASIC reset failed with error, %=
d for drm dev, %s",
>>> @@
>>> -3645,7 +3645,9 @@ static int amdgpu_do_asic_reset(struct amdgpu_hive_i=
nfo *hive,
>>>                              if (r)
>>>                                      goto out;
>>>
>>> -                           vram_lost =3D amdgpu_device_check_vram_lost=
(tmp_adev);
>>> +                           if (!vram_lost)
>>> +                                   vram_lost =3D amdgpu_device_check_v=
ram_lost(tmp_adev);
>>> +
>>>                              if (vram_lost) {
>>>                                      DRM_INFO("VRAM is lost due to GPU =
reset!\n");
>>>                                      atomic_inc(&tmp_adev->vram_lost_co=
unter);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c
>>> b/drivers/gpu/drm/amd/amdgpu/cik.c
>>> index 7b63d7a..0f25b82 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/cik.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/cik.c
>>> @@ -1277,7 +1277,7 @@ static int cik_gpu_pci_config_reset(struct amdgpu=
_device *adev)
>>>      * to reset them.
>>>      * Returns 0 for success.
>>>      */
>>> -static int cik_asic_reset(struct amdgpu_device *adev)
>>> +static int cik_asic_reset(struct amdgpu_device *adev, bool
>>> +*vramlost)
>>>     {
>>>      int r;
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c
>>> b/drivers/gpu/drm/amd/amdgpu/nv.c index a3d99f2..53de7a6 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
>>> @@ -301,7 +301,7 @@ nv_asic_reset_method(struct amdgpu_device *adev)
>>>              return AMD_RESET_METHOD_MODE1;
>>>     }
>>>
>>> -static int nv_asic_reset(struct amdgpu_device *adev)
>>> +static int nv_asic_reset(struct amdgpu_device *adev, bool *vramlost)
>>>     {
>>>
>>>      /* FIXME: it doesn't work since vega10 */ @@ -315,10 +315,14 @@
>>> static int nv_asic_reset(struct amdgpu_device *adev)
>>>      int ret =3D 0;
>>>      struct smu_context *smu =3D &adev->smu;
>>>
>>> -   if (nv_asic_reset_method(adev) =3D=3D AMD_RESET_METHOD_BACO)
>>> +   if (nv_asic_reset_method(adev) =3D=3D AMD_RESET_METHOD_BACO) {
>>> +           if (vramlost)
>>> +                   *vramlost =3D true;
>>>              ret =3D smu_baco_reset(smu);
>>> -   else
>>> +   }
>>> +   else {
>>>              ret =3D nv_asic_mode1_reset(adev);
>>> +   }
>>>
>>>      return ret;
>>>     }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/si.c
>>> b/drivers/gpu/drm/amd/amdgpu/si.c index 9043614..f324099 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/si.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/si.c
>>> @@ -1180,7 +1180,7 @@ static bool si_read_bios_from_rom(struct amdgpu_d=
evice *adev,
>>>     }
>>>
>>>     //xxx: not implemented
>>> -static int si_asic_reset(struct amdgpu_device *adev)
>>> +static int si_asic_reset(struct amdgpu_device *adev, bool *vramlost)
>>>     {
>>>      return 0;
>>>     }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c
>>> b/drivers/gpu/drm/amd/amdgpu/soc15.c
>>> index fe2212df..12b2966 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/soc15.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
>>> @@ -553,10 +553,12 @@ soc15_asic_reset_method(struct amdgpu_device *ade=
v)
>>>              return AMD_RESET_METHOD_MODE1;
>>>     }
>>>
>>> -static int soc15_asic_reset(struct amdgpu_device *adev)
>>> +static int soc15_asic_reset(struct amdgpu_device *adev, bool
>>> +*vramlost)
>>>     {
>>>      switch (soc15_asic_reset_method(adev)) {
>>>              case AMD_RESET_METHOD_BACO:
>>> +                   if (vramlost)
>>> +                           *vramlost =3D true;
>>>                      return soc15_asic_baco_reset(adev);
>>>              case AMD_RESET_METHOD_MODE2:
>>>                      return soc15_mode2_reset(adev); diff --git
>>> a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
>>> index 56c882b..8eceb00 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
>>> @@ -696,7 +696,7 @@ static int vi_gpu_pci_config_reset(struct amdgpu_de=
vice *adev)
>>>      * to reset them.
>>>      * Returns 0 for success.
>>>      */
>>> -static int vi_asic_reset(struct amdgpu_device *adev)
>>> +static int vi_asic_reset(struct amdgpu_device *adev, bool *vramlost)
>>>     {
>>>      int r;
>>>

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809D6CB333C3A473C71F2FCF7A40BN6PR12MB1809namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
for mode1 and BACO, I think we can assume vram is lost because the UMC gets=
 reset in that case.&nbsp; Some of the data may still look valid, but it's =
not necessarily reliable.&nbsp; For mode2, vram should be fine because the =
UMC doesn't get reset.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Koenig, Christian &lt;Chris=
tian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Friday, August 23, 2019 8:47 AM<br>
<b>To:</b> Liu, Monk &lt;Monk.Liu@amd.com&gt;; amd-gfx@lists.freedesktop.or=
g &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: introduce vram lost paramter for re=
set function</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Am 23.08.19 um 10:57 schrieb Liu, Monk:<br>
&gt;&gt;&gt; vram_lost =3D amdgpu_device_check_vram_lost(tmp_adev);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vram_lost) {<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; DRM_INFO(&quot;VRAM is lost due to GPU reset!\n&quot;);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; atomic_inc(&amp;tmp_adev-&gt;vram_lost_counter);<br>
&gt; Above is the original logic, if we increment the counter in BACO reset=
 routine, we would potentially<br>
&gt; Have another counter increasement if by coincidence the &quot;amdgpu_d=
evice_check_vram_lost&quot; successfully detected the vram lost (although r=
ight now it didn't ..)<br>
<br>
Yeah, but would increment it twice be a problem? I don't think so.<br>
<br>
&gt; Do you mean we remove the amdgpu_device_check_vram_lost(tmp_adev) in d=
evice_recovery() routine ?<br>
<br>
Please no, that thing certainly proved to be useful. Maybe we could <br>
investigate why it failed to auto detect the lost VRAM.<br>
<br>
Christian.<br>
<br>
&gt; _____________________________________<br>
&gt; Monk Liu|GPU Virtualization Team |AMD<br>
&gt;<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: Koenig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
&gt; Sent: Friday, August 23, 2019 4:34 PM<br>
&gt; To: Liu, Monk &lt;Monk.Liu@amd.com&gt;; amd-gfx@lists.freedesktop.org<=
br>
&gt; Subject: Re: [PATCH] drm/amdgpu: introduce vram lost paramter for rese=
t function<br>
&gt;<br>
&gt; I thought in the BACO reset function.<br>
&gt;<br>
&gt; The top level reset function doesn't do much more than increment the v=
ram_lost_counter either.<br>
&gt;<br>
&gt; Christian.<br>
&gt;<br>
&gt; Am 23.08.19 um 10:32 schrieb Liu, Monk:<br>
&gt;&gt;&gt;&gt; On the other hand wouldn't it be simpler to just increment=
 vram_lost_counter?<br>
&gt;&gt; In where ? if you mean in amdgpu_device_recover routine I won't do=
 that since the reset() can do any kind of reset like:<br>
&gt;&gt; 1) PF FLR<br>
&gt;&gt; 2) mode1/2 reset<br>
&gt;&gt; 3) magic reset through config space<br>
&gt;&gt; 4) BACO reset<br>
&gt;&gt;<br>
&gt;&gt; PF FLR won't cause VRAM lost, mode_1/2 is not clear to me, only BA=
CO<br>
&gt;&gt; reset is definitely a vram lost reset<br>
&gt;&gt;<br>
&gt;&gt; If you increase the counter in general function that will be not<b=
r>
&gt;&gt; accurate _____________________________________<br>
&gt;&gt; Monk Liu|GPU Virtualization Team |AMD<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: Christian K=F6nig &lt;ckoenig.leichtzumerken@gmail.com&gt;<b=
r>
&gt;&gt; Sent: Friday, August 23, 2019 4:27 PM<br>
&gt;&gt; To: Liu, Monk &lt;Monk.Liu@amd.com&gt;; amd-gfx@lists.freedesktop.=
org<br>
&gt;&gt; Subject: Re: [PATCH] drm/amdgpu: introduce vram lost paramter for<=
br>
&gt;&gt; reset function<br>
&gt;&gt;<br>
&gt;&gt; Am 23.08.19 um 05:34 schrieb Monk Liu:<br>
&gt;&gt;&gt; for SOC15/vega10 the BACO reset would introduce vram lost in t=
he high<br>
&gt;&gt;&gt; end address range and current kmd's vram lost checking cannot =
catch<br>
&gt;&gt;&gt; it since it only check visible frame buffer<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; TODO:<br>
&gt;&gt;&gt; to confirm if mode1/2 reset would introduce vram lost<br>
&gt;&gt; Looks good in general, but I would make the value mandatory or may=
be use a special return code instead.<br>
&gt;&gt;<br>
&gt;&gt; On the other hand wouldn't it be simpler to just increment vram_lo=
st_counter?<br>
&gt;&gt;<br>
&gt;&gt; Christian.<br>
&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Monk Liu &lt;Monk.Liu@amd.com&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu.h&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 &#43;&#43;--<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_devi=
ce.c | 12 &#43;&#43;&#43;&#43;&#43;&#43;&#43;-----<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/cik.c&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 &#43;-<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/nv.c&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 10 &#43;&#43;=
&#43;&#43;&#43;&#43;&#43;---<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/si.c&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 &#43;=
-<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/soc15.c&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 &#43;&#43;&#43;-<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/vi.c&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 &#43;=
-<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; 7 files changed, 22 insertions(&#43;),=
 14 deletions(-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt;&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt;&gt;&gt; index f6ae565..1fe3756 100644<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt;&gt;&gt; @@ -552,7 &#43;552,7 @@ struct amdgpu_asic_funcs {<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*read_register)(struct amdg=
pu_device *adev, u32 se_num,<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; u32 sh_num, u32 reg_offset, u32 *value);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*set_vga_state)(struct amd=
gpu_device *adev, bool state);<br>
&gt;&gt;&gt; -&nbsp;&nbsp; int (*reset)(struct amdgpu_device *adev);<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp; int (*reset)(struct amdgpu_device *adev, boo=
l *lost);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_reset_method (*reset_me=
thod)(struct amdgpu_device *adev);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* get the reference clock */<br=
>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 (*get_xclk)(struct amdgpu_de=
vice *adev); @@ -1136,7 &#43;1136,7<br>
&gt;&gt;&gt; @@ int emu_soc_asic_init(struct amdgpu_device *adev);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * ASICs macro.<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; #define amdgpu_asic_set_vga_state(adev=
, state)<br>
&gt;&gt;&gt; (adev)-&gt;asic_funcs-&gt;set_vga_state((adev), (state)) -#def=
ine<br>
&gt;&gt;&gt; amdgpu_asic_reset(adev) (adev)-&gt;asic_funcs-&gt;reset((adev)=
)<br>
&gt;&gt;&gt; &#43;#define amdgpu_asic_reset(adev, lost)<br>
&gt;&gt;&gt; &#43;(adev)-&gt;asic_funcs-&gt;reset((adev), (lost))<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; #define amdgpu_asic_reset_method(adev)=
 (adev)-&gt;asic_funcs-&gt;reset_method((adev))<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; #define amdgpu_asic_get_xclk(adev) (ad=
ev)-&gt;asic_funcs-&gt;get_xclk((adev))<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; #define amdgpu_asic_set_uvd_clocks(ade=
v, v, d)<br>
&gt;&gt;&gt; (adev)-&gt;asic_funcs-&gt;set_uvd_clocks((adev), (v), (d)) dif=
f --git<br>
&gt;&gt;&gt; a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt;&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt;&gt;&gt; index 02b3e7d..8668cb8 100644<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<b=
r>
&gt;&gt;&gt; @@ -2546,7 &#43;2546,7 @@ static void amdgpu_device_xgmi_reset=
_func(struct work_struct *__work)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D<b=
r>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; container_of(__work, struct amdgpu_device, xgmi_reset_work)=
;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&gt; -&nbsp;&nbsp; adev-&gt;asic_reset_res =3D&nbsp; amdgpu_asic_re=
set(adev);<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp; adev-&gt;asic_reset_res =3D&nbsp; amdgpu_asi=
c_reset(adev, NULL);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;asic_reset_res)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; DRM_WARN(&quot;ASIC reset failed with error, %d for drm dev=
, %s&quot;,<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-=
&gt;asic_reset_res, adev-&gt;ddev-&gt;unique); @@ -2751,7 &#43;2751,7<br>
&gt;&gt;&gt; @@ int amdgpu_device_init(struct amdgpu_device *adev,<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp; E.g., driver was n=
ot cleanly unloaded previously, etc.<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_vf(adev) &amp;=
&amp; amdgpu_asic_need_reset_on_init(adev)) {<br>
&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
r =3D amdgpu_asic_reset(adev);<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; r =3D amdgpu_asic_reset(adev, NULL);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (r) {<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_err(ade=
v-&gt;dev, &quot;asic reset on init failed\n&quot;);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto failed=
;<br>
&gt;&gt;&gt; @@ -3084,7 &#43;3084,7 @@ int amdgpu_device_suspend(struct drm=
_device *dev, bool suspend, bool fbcon)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; pci_disable_device(dev-&gt;pdev);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; pci_set_power_state(dev-&gt;pdev, PCI_D3hot);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
r =3D amdgpu_asic_reset(adev);<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; r =3D amdgpu_asic_reset(adev, NULL);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (r)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&=
quot;amdgpu asic reset failed\n&quot;);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt; @@ -3604,7 &#43;3604,7 @@ static int amdgpu_do_asic_reset(stru=
ct amdgpu_hive_info *hive,<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!queue_work(system_highpri_wq, &am=
p;tmp_adev-&gt;xgmi_reset_work))<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; r =3D -EALREADY;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; r =3D amdgpu_asic_reset(tmp_adev);<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_asic_reset(tmp_adev, &amp;vram_lost);=
<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r) {<br=
>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;ASIC reset failed with=
 error, %d for drm dev, %s&quot;,<br>
&gt;&gt;&gt; @@<br>
&gt;&gt;&gt; -3645,7 &#43;3645,9 @@ static int amdgpu_do_asic_reset(struct =
amdgpu_hive_info *hive,<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; goto out;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; vram_lost =3D amdgpu_device_check_vram_lost(tmp_adev);=
<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; if (!vram_lost)<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vr=
am_lost =3D amdgpu_device_check_vram_lost(tmp_adev);<br>
&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vram_lost) {<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; DRM_INFO(&quot;VRAM is lost due to GPU reset!\n&quot;);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; atomic_inc(&amp;tmp_adev-&gt;vram_lost_counter);<br>
&gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c<br>
&gt;&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/cik.c<br>
&gt;&gt;&gt; index 7b63d7a..0f25b82 100644<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/cik.c<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/cik.c<br>
&gt;&gt;&gt; @@ -1277,7 &#43;1277,7 @@ static int cik_gpu_pci_config_reset(=
struct amdgpu_device *adev)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to reset them.<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Returns 0 for success.<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&gt;&gt; -static int cik_asic_reset(struct amdgpu_device *adev)<br>
&gt;&gt;&gt; &#43;static int cik_asic_reset(struct amdgpu_device *adev, boo=
l<br>
&gt;&gt;&gt; &#43;*vramlost)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c<br>
&gt;&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/nv.c index a3d99f2..53de7a6 10064=
4<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/nv.c<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/nv.c<br>
&gt;&gt;&gt; @@ -301,7 &#43;301,7 @@ nv_asic_reset_method(struct amdgpu_dev=
ice *adev)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return AMD_RESET_METHOD_MODE1;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&gt; -static int nv_asic_reset(struct amdgpu_device *adev)<br>
&gt;&gt;&gt; &#43;static int nv_asic_reset(struct amdgpu_device *adev, bool=
 *vramlost)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* FIXME: it doesn't work since =
vega10 */ @@ -315,10 &#43;315,14 @@<br>
&gt;&gt;&gt; static int nv_asic_reset(struct amdgpu_device *adev)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_context *smu =3D &amp=
;adev-&gt;smu;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&gt; -&nbsp;&nbsp; if (nv_asic_reset_method(adev) =3D=3D AMD_RESET_=
METHOD_BACO)<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp; if (nv_asic_reset_method(adev) =3D=3D AMD_RE=
SET_METHOD_BACO) {<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (vramlost)<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *vramlost =3D true;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D smu_baco_reset(smu);<br>
&gt;&gt;&gt; -&nbsp;&nbsp; else<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp; }<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp; else {<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D nv_asic_mode1_reset(adev);<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/si.c<br>
&gt;&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/si.c index 9043614..f324099 10064=
4<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/si.c<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/si.c<br>
&gt;&gt;&gt; @@ -1180,7 &#43;1180,7 @@ static bool si_read_bios_from_rom(st=
ruct amdgpu_device *adev,<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; //xxx: not implemented<br>
&gt;&gt;&gt; -static int si_asic_reset(struct amdgpu_device *adev)<br>
&gt;&gt;&gt; &#43;static int si_asic_reset(struct amdgpu_device *adev, bool=
 *vramlost)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
&gt;&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
&gt;&gt;&gt; index fe2212df..12b2966 100644<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
&gt;&gt;&gt; @@ -553,10 &#43;553,12 @@ soc15_asic_reset_method(struct amdgp=
u_device *adev)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return AMD_RESET_METHOD_MODE1;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&gt; -static int soc15_asic_reset(struct amdgpu_device *adev)<br>
&gt;&gt;&gt; &#43;static int soc15_asic_reset(struct amdgpu_device *adev, b=
ool<br>
&gt;&gt;&gt; &#43;*vramlost)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (soc15_asic_reset_method(=
adev)) {<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; case AMD_RESET_METHOD_BACO:<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vramlost)<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; *vramlost =3D true;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return soc1=
5_asic_baco_reset(adev);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; case AMD_RESET_METHOD_MODE2:<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return soc1=
5_mode2_reset(adev); diff --git<br>
&gt;&gt;&gt; a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu=
/vi.c<br>
&gt;&gt;&gt; index 56c882b..8eceb00 100644<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/vi.c<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/vi.c<br>
&gt;&gt;&gt; @@ -696,7 &#43;696,7 @@ static int vi_gpu_pci_config_reset(str=
uct amdgpu_device *adev)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to reset them.<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Returns 0 for success.<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&gt;&gt; -static int vi_asic_reset(struct amdgpu_device *adev)<br>
&gt;&gt;&gt; &#43;static int vi_asic_reset(struct amdgpu_device *adev, bool=
 *vramlost)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809D6CB333C3A473C71F2FCF7A40BN6PR12MB1809namp_--

--===============1514681795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1514681795==--
