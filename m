Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F891351C9
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Jan 2020 04:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277506E384;
	Thu,  9 Jan 2020 03:15:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244DE6E384
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Jan 2020 03:15:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5Iu8Rv1vOtHGx8Nk7+mTLGFWtsZhrer8Db7GDZ5aZsLkPrREmwJ91nIGNgmantuq0tbzDJgLwYj0bAE8gPMH95AtohH67SDtNPI2Iao87HywjhASUdhs/btRV7rlr1e5gUV/ipg6r/o2V9quctdCgLid/J3hQPNAujTJGkSnFTrjCiNwKeJhyQmsg3x8DxZMWud3Zy085XSG0ZOXPLqPUQXGQBEneBNwUXJeTF+92LeXCKje7uor5qL1d7wCFHykHVMN6tz7p3/HeMWX58GpHV1qfdXIuH0I7j3e71xH9lXtWixuO+IjJUXwv+7P+OA35rFSJLEKMnS6QJmqUn/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0OZfThBGrQHrTc8XSb8UUyx3mR8GckIOlsNi9p8fD0=;
 b=NEQvpCSFH4gDGAFG0aIe6gZ79waTndUS7Jd+ygEFp3woEAllNhwetfUwKfwkPBcA4sYUmP4oetiVR1C5z1VaMyHJco3HdnDrE06dF5wWR1xjhtKD9j8CbeblJOK+ZvDwNzDa3kI9dmteX7xcfxwlu+VGkXjwEhR4VD7/M16t6XkihPQTovkWW3jm/5mTHfXoS90H8Eovsga9temFeXo/xsMg5g9QEdtzTPr/p686zUtVtz+S9f7NUvhooq86sijymlaPd+lttwDZhIIxKlhSmVKPCat5CzMeblOh8Iu7vPU8y9hr30oyqBJ1hOna+QwviweTUK4zwoZjRFPUC9aPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0OZfThBGrQHrTc8XSb8UUyx3mR8GckIOlsNi9p8fD0=;
 b=ADD5PupPk0VKPPTXctlXkqFoLRb0RpdmYimiWAgJdaRgNg7diUey/EC0bF+BO4S3BXk5TQOXkP4pIh7ykft+PxsWupQ1xmFjmpyuV5HbVkS6pEKc+OAGAVEGSf9OLJucJHzXAXKAss81/jivWaiOU1l5beTvSC86cPGH98lmdmg=
Received: from MN2PR12MB2957.namprd12.prod.outlook.com (20.179.82.14) by
 MN2PR12MB3373.namprd12.prod.outlook.com (20.178.242.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Thu, 9 Jan 2020 03:15:39 +0000
Received: from MN2PR12MB2957.namprd12.prod.outlook.com
 ([fe80::2cbe:ce2:60b5:7756]) by MN2PR12MB2957.namprd12.prod.outlook.com
 ([fe80::2cbe:ce2:60b5:7756%6]) with mapi id 15.20.2623.010; Thu, 9 Jan 2020
 03:15:39 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix modprobe failure of the 2nd GPU when
 GDDR6 training enabled
Thread-Topic: [PATCH] drm/amdgpu: fix modprobe failure of the 2nd GPU when
 GDDR6 training enabled
Thread-Index: AQHVxiBU8GGBuSDCyE+2e2fHcoZQZafguKSAgAAg5YCAAAP9AIAAw+3YgAAHpICAAACnJw==
Date: Thu, 9 Jan 2020 03:15:39 +0000
Message-ID: <MN2PR12MB2957F23A709E07E481AD630B95390@MN2PR12MB2957.namprd12.prod.outlook.com>
References: <20200108123648.7422-1-tianci.yin@amd.com>
 <ba1754a0-7230-5df7-cfb3-7b0d7c892c47@amd.com>
 <CADnq5_MQ1S60QX3=U2=LYSoiYg965yViTk0Y0WbaFTRXhvNZww@mail.gmail.com>
 <aca36233-68fd-c692-1080-daa9c32efa14@gmail.com>
 <MN2PR12MB29576985DC4A61F99F96052A95390@MN2PR12MB2957.namprd12.prod.outlook.com>,
 <CADnq5_OOiV7Ku-QbY7a3MTpQF=CuSgxezq00NVhnVkNQDcBWZw@mail.gmail.com>
In-Reply-To: <CADnq5_OOiV7Ku-QbY7a3MTpQF=CuSgxezq00NVhnVkNQDcBWZw@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-01-09T03:15:38.851Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tianci.Yin@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8811a726-05c3-4f84-9db5-08d794b23410
x-ms-traffictypediagnostic: MN2PR12MB3373:|MN2PR12MB3373:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB33736A743D71910AB15214C695390@MN2PR12MB3373.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(189003)(199004)(8936002)(4326008)(2906002)(54906003)(81156014)(81166006)(966005)(9686003)(316002)(55016002)(6916009)(478600001)(33656002)(19627405001)(8676002)(45080400002)(186003)(76116006)(66574012)(64756008)(66556008)(91956017)(66446008)(66476007)(26005)(71200400001)(52536014)(5660300002)(66946007)(86362001)(6506007)(53546011)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3373;
 H:MN2PR12MB2957.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u2euV4kRSV9OmkkdjcrRvNHf2N6sSNOEemQxqckGEA4mdxiZCjJyBLO4b9JWsEVofOm1HtuKGdcoZIFhpu1s3Q4fvQtnnGg68Qx678O2AtEyRO+EOuxuIqUqxdcDJt9vRCdtWIdjcfTEf1U+bXNaV0FlezErmb6MJzj9e7VSXYa4PAbZugcWx4lYsaj9cSBuO60YBFJYgS6D3YF26JvcLFRNuuYmTMoeRuI7sORqfvaadb+8f7Xj0EyWyEiHDi9Lg8UTU7yYUrd1S3ajKCf/h/rDr+Osc4f0+K904bNHb8YoCKMs8uY/DmqplIcNWF4dL5ho2HONDBZeWwaG1DjJAotvLS7yResnvUBbSXp+lEd5cr9Of5xFNfZP17CcLb3l02ZeO69pye47w6MT8Lzo04+lI3ypZKxM4me4KzFgIlNP7w8HzWWunq2DiNIR0M87upJ2BwapLBYlelEqGtxcmWKB8vJr9kUe+8Xba6T4g8Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8811a726-05c3-4f84-9db5-08d794b23410
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 03:15:39.3718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2EQ9TS1Dq+75p9/DPRkrIjgTGB/yRcJPAI0YSeoHg7J+MFmF4Pp3xnfF02CKCCR7s3MMJVKFpFDcKTi8jyfBQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3373
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
Cc: "Long, Gang" <Gang.Long@amd.com>, "Xu, Feifei" <Feifei.Xu@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Tuikov, 
 Luben" <Luben.Tuikov@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhang, 
 Hawking" <Hawking.Zhang@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: multipart/mixed; boundary="===============0609183171=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0609183171==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB2957F23A709E07E481AD630B95390MN2PR12MB2957namp_"

--_000_MN2PR12MB2957F23A709E07E481AD630B95390MN2PR12MB2957namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Ok, thanks very much Alex!
________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: Thursday, January 9, 2020 11:12
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>
Cc: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>; Koenig, Christian=
 <Christian.Koenig@amd.com>; Long, Gang <Gang.Long@amd.com>; Wang, Kevin(Ya=
ng) <Kevin1.Wang@amd.com>; Xu, Feifei <Feifei.Xu@amd.com>; amd-gfx list <am=
d-gfx@lists.freedesktop.org>; Tuikov, Luben <Luben.Tuikov@amd.com>; Deucher=
, Alexander <Alexander.Deucher@amd.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.co=
m>; Zhang, Hawking <Hawking.Zhang@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix modprobe failure of the 2nd GPU when G=
DDR6 training enabled

On Wed, Jan 8, 2020 at 10:07 PM Yin, Tianci (Rico) <Tianci.Yin@amd.com> wro=
te:
>
> [AMD Official Use Only - Internal Distribution Only]
>
>
> Thanks Alex and Christian!
>
> Hi Christian,
>
> On ASICs with gmc v10, I find amdgpu_bo_late_init() is not invoked, so st=
olen memory never get free, on other ASICs with gmc v9/v8/v7/v6, stolen mem=
ory was freed in gmc_v*_0_late_init(). I don't know why, are there some spe=
cial reasons or just missed by coding?
>

Looks like it should be added.  Possibly got lost when we merged the
navi code from the topic branch.

Alex

> Thanks!
>
> Rico
>
> ________________________________
> From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
> Sent: Wednesday, January 8, 2020 23:04
> To: Alex Deucher <alexdeucher@gmail.com>; Koenig, Christian <Christian.Ko=
enig@amd.com>
> Cc: Long, Gang <Gang.Long@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.co=
m>; Xu, Feifei <Feifei.Xu@amd.com>; Yin, Tianci (Rico) <Tianci.Yin@amd.com>=
; amd-gfx list <amd-gfx@lists.freedesktop.org>; Tuikov, Luben <Luben.Tuikov=
@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Yuan, Xiaojie <X=
iaojie.Yuan@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
> Subject: Re: [PATCH] drm/amdgpu: fix modprobe failure of the 2nd GPU when=
 GDDR6 training enabled
>
> Am 08.01.20 um 15:49 schrieb Alex Deucher:
> > On Wed, Jan 8, 2020 at 7:52 AM Christian K=F6nig <christian.koenig@amd.=
com> wrote:
> >> Am 08.01.20 um 13:36 schrieb Tianci Yin:
> >>> From: "Tianci.Yin" <tianci.yin@amd.com>
> >>>
> >>> [why]
> >>> In dual GPUs scenario, stolen_size is assigned to zero on the 2nd GPU=
,
> >>> then the bottom region of VRAM was allocated as GTT, unfortunately
> >>> a small region of bottom VRAM was encroached by UMC firmware during
> >>> GDDR6 BIST training, this cause pagefault.
> >> What I'm missing here is why is the stolen size zero on the 2nd GPU?
> >>
> >> Maybe we need to read the stolen size after posting the GPU instead?
> > There is no stolen memory on secondary GPUs because there is no pre-OS
> > console using that memory.
>
> Ah! Yeah that makes sense.
>
> But in this case I would say we should change the patch like the followin=
g:
>
> adev->gmc.stolen_size =3D min(adev->gmc.stolen_size,
> AMDGPU_STOLEN_VGA_DEFAULT_SIZE);
>
> And in amdgpu_ttm_late_init():
>
> /* Can't free the stolen VGA memory when it might be used for memory
> training again. */
> if (!adev->fw_vram_usage.mem_train_support)
>      amdgpu_bo_free_kernel(....
>
>
> Regards,
> Christian.
>
>
> >
> > Alex
> >
> >> Regards,
> >> Christian.
> >>
> >>> [how]
> >>> Forcing stolen_size to 3MB, then the bottom region of VRAM was
> >>> allocated as stolen memory, GTT corruption avoid.
> >>> The stolen memory of the 2nd GPU will be free in late_init phase,
> >>> no memory wasted.
> >>>
> >>> Change-Id: Icd0ad7de41333282949bb1e3e676c6c307ddd081
> >>> Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
> >>> ---
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h |  6 ++++++
> >>>    drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c  | 21 +++++++++++++++++++++
> >>>    2 files changed, 27 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_gmc.h
> >>> index c91dd602d5f1..440b793316df 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
> >>> @@ -60,6 +60,11 @@
> >>>     */
> >>>    #define AMDGPU_GMC_FAULT_TIMEOUT    5000ULL
> >>>
> >>> +/*
> >>> + * Default stolen memory size, 1024 * 768 * 4
> >>> + */
> >>> +#define AMDGPU_STOLEN_VGA_DEFAULT_SIZE       0x300000
> >>> +
> >>>    struct firmware;
> >>>
> >>>    /*
> >>> @@ -192,6 +197,7 @@ struct amdgpu_gmc {
> >>>        uint32_t                srbm_soft_reset;
> >>>        bool                    prt_warning;
> >>>        uint64_t                stolen_size;
> >>> +     bool                    stolen_temp_reserved;
> >>>        /* apertures */
> >>>        u64                     shared_aperture_start;
> >>>        u64                     shared_aperture_end;
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm=
/amd/amdgpu/gmc_v10_0.c
> >>> index 7dc8c068c62a..0c96b67d6ca7 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>> @@ -566,6 +566,11 @@ static int gmc_v10_0_late_init(void *handle)
> >>>        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> >>>        int r;
> >>>
> >>> +     if (adev->gmc.stolen_temp_reserved) {
> >>> +             amdgpu_bo_late_init(adev);
> >>> +             adev->gmc.stolen_temp_reserved =3D false;
> >>> +     }
> >>> +
> >>>        r =3D amdgpu_gmc_allocate_vm_inv_eng(adev);
> >>>        if (r)
> >>>                return r;
> >>> @@ -756,6 +761,22 @@ static int gmc_v10_0_sw_init(void *handle)
> >>>                return r;
> >>>
> >>>        adev->gmc.stolen_size =3D gmc_v10_0_get_vbios_fb_size(adev);
> >>> +     /*
> >>> +      * In dual GPUs scenario, stolen_size is assigned to zero on th=
e 2nd GPU,
> >>> +      * then the bottom region of VRAM was allocated as GTT, unfortu=
nately
> >>> +      * a small region of bottom VRAM was encroached by UMC firmware=
 during
> >>> +      * GDDR6 BIST training, this cause pagefault.
> >>> +      * The page fault can be fixed by forcing stolen_size to 3MB, t=
hen the bottom
> >>> +      * region of VRAM was allocated as stolen memory, GTT corruptio=
n avoid.
> >>> +      * The stolen memory of the 2nd GPU will be free in late_init p=
hase,
> >>> +      * no memory wasted.
> >>> +      */
> >>> +     if (adev->fw_vram_usage.mem_train_support &&
> >>> +             adev->gmc.stolen_size =3D=3D 0) {
> >>> +             adev->gmc.stolen_size =3D AMDGPU_STOLEN_VGA_DEFAULT_SIZ=
E;
> >>> +             adev->gmc.stolen_temp_reserved =3D true;
> >>> +     } else
> >>> +             adev->gmc.stolen_temp_reserved =3D false;
> >>>
> >>>        /* Memory manager */
> >>>        r =3D amdgpu_bo_init(adev);
> >> _______________________________________________
> >> amd-gfx mailing list
> >> amd-gfx@lists.freedesktop.org
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fli=
sts.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01%7CTia=
nci.Yin%40amd.com%7Cb9b1622ed60e4ab36c6408d794b1d75e%7C3dd8961fe4884e608e11=
a82d994e183d%7C0%7C0%7C637141363862418597&amp;sdata=3DYT8zKlbLX0XdzqcLrZQaV=
6sKFWXS5nQTNMAMT9BMK70%3D&amp;reserved=3D0
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
ts.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01%7CTian=
ci.Yin%40amd.com%7Cb9b1622ed60e4ab36c6408d794b1d75e%7C3dd8961fe4884e608e11a=
82d994e183d%7C0%7C0%7C637141363862428589&amp;sdata=3DLLVRzFBxFKqTltpvsK%2F2=
l9CwnlUFzFKmDoPPHdO5e1I%3D&amp;reserved=3D0
>

--_000_MN2PR12MB2957F23A709E07E481AD630B95390MN2PR12MB2957namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#0078D7;margin:15pt;" al=
ign=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Ok, thanks very much Alex!<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> Thursday, January 9, 2020 11:12<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;<br>
<b>Cc:</b> Christian K=F6nig &lt;ckoenig.leichtzumerken@gmail.com&gt;; Koen=
ig, Christian &lt;Christian.Koenig@amd.com&gt;; Long, Gang &lt;Gang.Long@am=
d.com&gt;; Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; Xu, Feifei &lt;Fe=
ifei.Xu@amd.com&gt;; amd-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;;
 Tuikov, Luben &lt;Luben.Tuikov@amd.com&gt;; Deucher, Alexander &lt;Alexand=
er.Deucher@amd.com&gt;; Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;; Zhang, =
Hawking &lt;Hawking.Zhang@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: fix modprobe failure of the 2nd GPU=
 when GDDR6 training enabled</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, Jan 8, 2020 at 10:07 PM Yin, Tianci (Rico)=
 &lt;Tianci.Yin@amd.com&gt; wrote:<br>
&gt;<br>
&gt; [AMD Official Use Only - Internal Distribution Only]<br>
&gt;<br>
&gt;<br>
&gt; Thanks Alex and Christian!<br>
&gt;<br>
&gt; Hi Christian,<br>
&gt;<br>
&gt; On ASICs with gmc v10, I find amdgpu_bo_late_init() is not invoked, so=
 stolen memory never get free, on other ASICs with gmc v9/v8/v7/v6, stolen =
memory was freed in gmc_v*_0_late_init(). I don't know why, are there some =
special reasons or just missed by coding?<br>
&gt;<br>
<br>
Looks like it should be added.&nbsp; Possibly got lost when we merged the<b=
r>
navi code from the topic branch.<br>
<br>
Alex<br>
<br>
&gt; Thanks!<br>
&gt;<br>
&gt; Rico<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: Christian K=F6nig &lt;ckoenig.leichtzumerken@gmail.com&gt;<br>
&gt; Sent: Wednesday, January 8, 2020 23:04<br>
&gt; To: Alex Deucher &lt;alexdeucher@gmail.com&gt;; Koenig, Christian &lt;=
Christian.Koenig@amd.com&gt;<br>
&gt; Cc: Long, Gang &lt;Gang.Long@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevin1=
.Wang@amd.com&gt;; Xu, Feifei &lt;Feifei.Xu@amd.com&gt;; Yin, Tianci (Rico)=
 &lt;Tianci.Yin@amd.com&gt;; amd-gfx list &lt;amd-gfx@lists.freedesktop.org=
&gt;; Tuikov, Luben &lt;Luben.Tuikov@amd.com&gt;; Deucher, Alexander &lt;Al=
exander.Deucher@amd.com&gt;;
 Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zha=
ng@amd.com&gt;<br>
&gt; Subject: Re: [PATCH] drm/amdgpu: fix modprobe failure of the 2nd GPU w=
hen GDDR6 training enabled<br>
&gt;<br>
&gt; Am 08.01.20 um 15:49 schrieb Alex Deucher:<br>
&gt; &gt; On Wed, Jan 8, 2020 at 7:52 AM Christian K=F6nig &lt;christian.ko=
enig@amd.com&gt; wrote:<br>
&gt; &gt;&gt; Am 08.01.20 um 13:36 schrieb Tianci Yin:<br>
&gt; &gt;&gt;&gt; From: &quot;Tianci.Yin&quot; &lt;tianci.yin@amd.com&gt;<b=
r>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; [why]<br>
&gt; &gt;&gt;&gt; In dual GPUs scenario, stolen_size is assigned to zero on=
 the 2nd GPU,<br>
&gt; &gt;&gt;&gt; then the bottom region of VRAM was allocated as GTT, unfo=
rtunately<br>
&gt; &gt;&gt;&gt; a small region of bottom VRAM was encroached by UMC firmw=
are during<br>
&gt; &gt;&gt;&gt; GDDR6 BIST training, this cause pagefault.<br>
&gt; &gt;&gt; What I'm missing here is why is the stolen size zero on the 2=
nd GPU?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Maybe we need to read the stolen size after posting the GPU i=
nstead?<br>
&gt; &gt; There is no stolen memory on secondary GPUs because there is no p=
re-OS<br>
&gt; &gt; console using that memory.<br>
&gt;<br>
&gt; Ah! Yeah that makes sense.<br>
&gt;<br>
&gt; But in this case I would say we should change the patch like the follo=
wing:<br>
&gt;<br>
&gt; adev-&gt;gmc.stolen_size =3D min(adev-&gt;gmc.stolen_size,<br>
&gt; AMDGPU_STOLEN_VGA_DEFAULT_SIZE);<br>
&gt;<br>
&gt; And in amdgpu_ttm_late_init():<br>
&gt;<br>
&gt; /* Can't free the stolen VGA memory when it might be used for memory<b=
r>
&gt; training again. */<br>
&gt; if (!adev-&gt;fw_vram_usage.mem_train_support)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(....<br>
&gt;<br>
&gt;<br>
&gt; Regards,<br>
&gt; Christian.<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Alex<br>
&gt; &gt;<br>
&gt; &gt;&gt; Regards,<br>
&gt; &gt;&gt; Christian.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; [how]<br>
&gt; &gt;&gt;&gt; Forcing stolen_size to 3MB, then the bottom region of VRA=
M was<br>
&gt; &gt;&gt;&gt; allocated as stolen memory, GTT corruption avoid.<br>
&gt; &gt;&gt;&gt; The stolen memory of the 2nd GPU will be free in late_ini=
t phase,<br>
&gt; &gt;&gt;&gt; no memory wasted.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Change-Id: Icd0ad7de41333282949bb1e3e676c6c307ddd081<br>
&gt; &gt;&gt;&gt; Signed-off-by: Tianci.Yin &lt;tianci.yin@amd.com&gt;<br>
&gt; &gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h=
 |&nbsp; 6 &#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c&=
nbsp; | 21 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp; 2 files changed, 27 insertions(&#43;)<b=
r>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h b/dr=
ivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h<br>
&gt; &gt;&gt;&gt; index c91dd602d5f1..440b793316df 100644<br>
&gt; &gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h<br>
&gt; &gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h=
<br>
&gt; &gt;&gt;&gt; @@ -60,6 &#43;60,11 @@<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp; #define AMDGPU_GMC_FAULT_TIMEOUT&nbsp;&=
nbsp;&nbsp; 5000ULL<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; &#43;/*<br>
&gt; &gt;&gt;&gt; &#43; * Default stolen memory size, 1024 * 768 * 4<br>
&gt; &gt;&gt;&gt; &#43; */<br>
&gt; &gt;&gt;&gt; &#43;#define AMDGPU_STOLEN_VGA_DEFAULT_SIZE&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; 0x300000<br>
&gt; &gt;&gt;&gt; &#43;<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp; struct firmware;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt;&gt;&gt; @@ -192,6 &#43;197,7 @@ struct amdgpu_gmc {<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; srbm_soft_reset;<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; prt_warning;<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; stolen_size;<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; stolen_temp_reserved;<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* apertures */=
<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shared_aperture_start;<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shared_aperture_end;<br>
&gt; &gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/dri=
vers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
&gt; &gt;&gt;&gt; index 7dc8c068c62a..0c96b67d6ca7 100644<br>
&gt; &gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
&gt; &gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<=
br>
&gt; &gt;&gt;&gt; @@ -566,6 &#43;566,11 @@ static int gmc_v10_0_late_init(v=
oid *handle)<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_d=
evice *adev =3D (struct amdgpu_device *)handle;<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;gmc.stolen_tem=
p_reserved) {<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; amdgpu_bo_late_init(adev);<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; adev-&gt;gmc.stolen_temp_reserved =3D false;<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&gt;&gt; &#43;<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_gm=
c_allocate_vm_inv_eng(adev);<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; &gt;&gt;&gt; @@ -756,6 &#43;761,22 @@ static int gmc_v10_0_sw_init(voi=
d *handle)<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gmc.st=
olen_size =3D gmc_v10_0_get_vbios_fb_size(adev);<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * In dual GPUs scenar=
io, stolen_size is assigned to zero on the 2nd GPU,<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * then the bottom reg=
ion of VRAM was allocated as GTT, unfortunately<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * a small region of b=
ottom VRAM was encroached by UMC firmware during<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * GDDR6 BIST training=
, this cause pagefault.<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The page fault can =
be fixed by forcing stolen_size to 3MB, then the bottom<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * region of VRAM was =
allocated as stolen memory, GTT corruption avoid.<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The stolen memory o=
f the 2nd GPU will be free in late_init phase,<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * no memory wasted.<b=
r>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;fw_vram_usage.=
mem_train_support &amp;&amp;<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; adev-&gt;gmc.stolen_size =3D=3D 0) {<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; adev-&gt;gmc.stolen_size =3D AMDGPU_STOLEN_VGA_DEFAULT=
_SIZE;<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; adev-&gt;gmc.stolen_temp_reserved =3D true;<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
&gt; &gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; adev-&gt;gmc.stolen_temp_reserved =3D false;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Memory manag=
er */<br>
&gt; &gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo=
_init(adev);<br>
&gt; &gt;&gt; _______________________________________________<br>
&gt; &gt;&gt; amd-gfx mailing list<br>
&gt; &gt;&gt; amd-gfx@lists.freedesktop.org<br>
&gt; &gt;&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?ur=
l=3Dhttps%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;=
amp;data=3D02%7C01%7CTianci.Yin%40amd.com%7Cb9b1622ed60e4ab36c6408d794b1d75=
e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637141363862418597&amp;amp;s=
data=3DYT8zKlbLX0XdzqcLrZQaV6sKFWXS5nQTNMAMT9BMK70%3D&amp;amp;reserved=3D0"=
>
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D02%7C01%7CTian=
ci.Yin%40amd.com%7Cb9b1622ed60e4ab36c6408d794b1d75e%7C3dd8961fe4884e608e11a=
82d994e183d%7C0%7C0%7C637141363862418597&amp;amp;sdata=3DYT8zKlbLX0XdzqcLrZ=
QaV6sKFWXS5nQTNMAMT9BMK70%3D&amp;amp;reserved=3D0</a><br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; amd-gfx mailing list<br>
&gt; &gt; amd-gfx@lists.freedesktop.org<br>
&gt; &gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;=
data=3D02%7C01%7CTianci.Yin%40amd.com%7Cb9b1622ed60e4ab36c6408d794b1d75e%7C=
3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637141363862428589&amp;amp;sdata=
=3DLLVRzFBxFKqTltpvsK%2F2l9CwnlUFzFKmDoPPHdO5e1I%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D02%7C01%7CTian=
ci.Yin%40amd.com%7Cb9b1622ed60e4ab36c6408d794b1d75e%7C3dd8961fe4884e608e11a=
82d994e183d%7C0%7C0%7C637141363862428589&amp;amp;sdata=3DLLVRzFBxFKqTltpvsK=
%2F2l9CwnlUFzFKmDoPPHdO5e1I%3D&amp;amp;reserved=3D0</a><br>
&gt;<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB2957F23A709E07E481AD630B95390MN2PR12MB2957namp_--

--===============0609183171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============0609183171==--
