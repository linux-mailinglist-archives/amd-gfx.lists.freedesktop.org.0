Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6599BF8D1
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 20:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B5F6ECEE;
	Thu, 26 Sep 2019 18:07:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790081.outbound.protection.outlook.com [40.107.79.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612506ECEE
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 18:07:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeJt8v7lu0TeTF+XklyNgvXaFTL6gn2V4jEmpioHkMYfMBxiFenL2pJfPVg3X3jh/4qSpAVCg5wWQGawifHfCRyfLBbuzTevp80jptlgqATKIe8OvkteK7XxwvCFBqdgD5L5TSHKFmfHh2ZZR+az9e1o+xNGG8REOq0B4yyKS+4etVIJsdPuVDgHzXsuQqWpNI9nBRxAd+c8EiADrhk/6/8CHXpMjrWZcsI9KZJRH8jeojer9dnk9n6ElmHnyWdKmUkU++xtq6SWanxJc1Cz+gla8LoJAdBcYtRoQTTXCXTf9nufBs3ZdwmoUM/aWda1JRdXG0vpfgf/wJUhA2vz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/tVbQ8e2SvxcAy7IODY5mhicBI2f2lQKUPvCaF69fE=;
 b=Lypp9CHfuN7fKnNOvXkq12ZsHlawsEROMiqt+wJobnpe1TS5gZhPNVGc4aCeZ/fh/062NcveZ4oRowbU9l7IzXaMbrkUQBsS50Hb4ACMnp7McRsYCdqAuXlOaYoQbuC4fxOGxXFzeKsFG8uc6dmmxiExlY0NPkhEuHzGVcw0u2Xsnm/SOBhA08Uy/+u8/QNmfrUMYS+A2ZKW4zNu5sR/FRsnWVE9qqCliNmTv4ozYW9uIXScuzfDFf8VAsqBZnfpdNgzpxNIlo70GNJqT0e/ZCu166OwB0IUBVTiaQOg6/N2FtEhv5krSnVH4MnWzaFJX3f9MLPKJqFnvgRSkgitWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1121.namprd12.prod.outlook.com (10.168.227.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 26 Sep 2019 18:07:17 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c%12]) with mapi id 15.20.2284.023; Thu, 26 Sep
 2019 18:07:17 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Yuan, Xiaojie"
 <Xiaojie.Yuan@amd.com>
Subject: Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Topic: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Index: AQHVdHV7HvevlndjS0WtCjpuZ5J8mac+ODorgAAH8xKAAAAong==
Date: Thu, 26 Sep 2019 18:07:17 +0000
Message-ID: <BN6PR12MB1809EBBAFA1BB6FA8A241641F7860@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <93f9508c-2871-4d48-9407-a0c3a6525bab@email.android.com>,
 <BN8PR12MB3602A7F8546E1C581D47B38B89860@BN8PR12MB3602.namprd12.prod.outlook.com>,
 <6c2ee5a6-8283-4b36-9177-36ddb22a60ad@email.android.com>
In-Reply-To: <6c2ee5a6-8283-4b36-9177-36ddb22a60ad@email.android.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18a6c221-5acc-4258-57fa-08d742ac5df0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1121; 
x-ms-traffictypediagnostic: BN6PR12MB1121:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1121598BB453543485B690C6F7860@BN6PR12MB1121.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(199004)(189003)(6246003)(19627405001)(105004)(66476007)(66946007)(54906003)(14444005)(66446008)(66556008)(2906002)(256004)(606006)(110136005)(64756008)(55016002)(71200400001)(86362001)(316002)(76116006)(71190400001)(5660300002)(52536014)(102836004)(81156014)(76176011)(9686003)(8676002)(81166006)(99286004)(14454004)(6306002)(54896002)(7696005)(8936002)(236005)(26005)(229853002)(4326008)(33656002)(7736002)(6506007)(53546011)(186003)(74316002)(25786009)(478600001)(966005)(66574012)(6636002)(6436002)(6116002)(66066001)(3846002)(11346002)(446003)(476003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1121;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hcto43SszFVd8fWZ9BVIal12+wTrW+vYJoojQVWwzfgLKAVVdLbGNvLB22eXuTD/XF5TaCJsL98sU+FPiSecTzGmGcHWVTtHE8mvgdoWWGTDu3foXLJH4L1AdPdjIIuVXj1ZEXqUNb8tDtdsnos47QWptn2GfFLLB1xKQaoSCUV/ekTvqnK4ktUqiyqSx8/8gC/ulsx85nJ3+Mv62tugeyUQZyUwSC5MHIxtouScnKrjQFt0BYfhXPT+P6gJvV3vukHomd4dl+uxDMT7ggJuiy4Dv0rDK1qT0CbACAa98UiwzJv05hXpclxc+q/zsHo2Bs7HxzMrRfJ0Qt8Q0fIGODRZTAsIagiISdJZRxwd8slTzKnRyaYoNAJGabD+5dTJkHTkIdYnI2Nw+/APoE8cPcISTRVhbZvnN7Pq1d/uuQ06OjRlsIIcj3xo8FXEYFPYwt2UNvUQEqPB69VYrawaaQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a6c221-5acc-4258-57fa-08d742ac5df0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 18:07:17.1995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dSbTr9BAdLsyBRxqFDVyPV6iKsgfTift9wq6cMQ5/3c8e81Zc5ZxkYvZHhlvzGe6LA1MmQe0+oQ61CZMwWNJPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1121
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/tVbQ8e2SvxcAy7IODY5mhicBI2f2lQKUPvCaF69fE=;
 b=qi/i45IG4WiO/BxlI3ur0j0wQWdLg+OvbeUHCcNVfVjShwm2j3l+PSRL2j7Bu1VdM0/xEIScfx2SqKEtRHiWMmlxOj3MBzCqpA1XbBtvN2EsHzgOtiVRcTT/CYVQQS5UlOrWQJba+fWLRbDv2y0URsooCGT6oCMYDBMRgE+bI50=
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
Cc: Alex Deucher <alexdeucher@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1435880960=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1435880960==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809EBBAFA1BB6FA8A241641F7860BN6PR12MB1809namp_"

--_000_BN6PR12MB1809EBBAFA1BB6FA8A241641F7860BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Maybe I'm mixing up issues.  The navi10/14 issue that was fixed on navi12 w=
as fixed in amdgpu_ids.c in

commit a2bd77bbde791202267c25478bbcbe71bb4ecdd5
Author: Christian K=F6nig <christian.koenig@amd.com>
Date:   Thu Feb 7 12:10:29 2019 +0100

    drm/amdgpu: disable concurrent flushes for Navi10 v2

    Navi10 have a bug in the SDMA which can theoretically cause memory
    corruption with concurrent VMID flushes

    v2: explicitely check Navi10

    Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
    Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

This is a different issue and may apply to all navi parts.  so maybe the pa=
tch is fine as is.

Alex

________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Thursday, September 26, 2019 2:02 PM
To: Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>; Deucher, Alexander <Alexander.Deu=
cher@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org=
>
Subject: Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma' w=
orkaround for navi

Well then you didn't figured out the root cause correctly.

This is to avoid data corruption with the SDMA on Navi 10/14 and should def=
initely not applied to Navi 12.

The hardware team went through quite some work to avoid this.

Christian.

Am 26.09.2019 19:38 schrieb "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>:
 Hi Alex / Christian,

When gfxoff is enabled for Navi12, I observed sdma0 hang while launching de=
sktop. When this workaround is applied, the issue fades away.
That's why I included this workaround for Navi12 as well.

BR,
Xiaojie
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Thursday, September 26, 2019 10:20 PM
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Yuan, Xiaojie <Xiaojie.=
Yuan@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org=
>
Subject: Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma' w=
orkaround for navi



Am 26.09.2019 15:51 schrieb Alex Deucher <alexdeucher@gmail.com>:
On Thu, Sep 26, 2019 at 9:47 AM Koenig, Christian
<Christian.Koenig@amd.com> wrote:
>
> Am 26.09.19 um 15:40 schrieb Alex Deucher:
> > On Thu, Sep 26, 2019 at 8:29 AM Christian K=F6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Stop, wait a second guys!
> >>
> >> This will disable the workaround for Navi10 and that is certainly not =
correct:
> >>
> >> !(adev->asic_type >=3D CHIP_NAVI10 && adev->asic_type <=3D CHIP_NAVI12=
)
> >>
> > Actually, I think it's correct. When I merged the baco patch, I
> > accidentally dropped the navi checks.  E.g.,
> > @@ -245,8 +245,9 @@ static void gmc_v10_0_flush_gpu_tlb(struct
> > amdgpu_device *adev,
> >          mutex_lock(&adev->mman.gtt_window_lock);
> >
> >          gmc_v10_0_flush_vm_hub(adev, vmid, AMDGPU_MMHUB, 0);
> > -       if (!adev->mman.buffer_funcs_enabled || !adev->ib_pool_ready ||
> > -           adev->asic_type !=3D CHIP_NAVI10) {
> > +       if (!adev->mman.buffer_funcs_enabled ||
> > +           !adev->ib_pool_ready ||
> > +           adev->in_gpu_reset) {
> >                  gmc_v10_0_flush_vm_hub(adev, vmid, AMDGPU_GFXHUB, 0);
> >                  mutex_unlock(&adev->mman.gtt_window_lock);
> >                  return;
> > I think it should have been
> > adev->asic_type !=3D CHIP_NAVI10 && adev->asic_type !=3D CHIP_NAVI14 &&
> > adev->asic_type !=3D CHIP_NAVI12
>
> My last status is that Navi12 is not supposed to need that workaround,
> that's why we checked Navi10 and later Navi14 separately.
>
> It's possible that I miss-read the !(adev->asic_type >=3D CHIP_NAVI10 &&
> adev->asic_type <=3D CHIP_NAVI12) check here, but either way that looks t=
o
> complicated to me.
>
> We should rather mention every affected asic type separately here.

Good point.  navi12 should be dropped from the check.  How about the follow=
ing?

I would rather test explicitly for Navi 10 and 14, cause we can't be sure i=
f there won't be another variant in the future.

Christian.


diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 241a4e57cf4a..280bbd7ca8a0 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -292,7 +292,8 @@ static void gmc_v10_0_flush_gpu_tlb(struct
amdgpu_device *adev, uint32_t vmid,

        if (!adev->mman.buffer_funcs_enabled ||
            !adev->ib_pool_ready ||
-           adev->in_gpu_reset) {
+           adev->in_gpu_reset ||
+           (adev->asic_type =3D=3D CHIP_NAVI12)) {
                gmc_v10_0_flush_vm_hub(adev, vmid, AMDGPU_GFXHUB_0, 0);
                mutex_unlock(&adev->mman.gtt_window_lock);
                return;

Alex

>
> Regards,
> Christian.
>
> >
> > Alex
> >
> >> Christian.
> >>
> >>
> >> Am 26.09.19 um 14:26 schrieb Deucher, Alexander:
> >>
> >> Please add a patch description.  With that fixed:
> >> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> >> ________________________________
> >> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Yua=
n, Xiaojie <Xiaojie.Yuan@amd.com>
> >> Sent: Thursday, September 26, 2019 4:09 AM
> >> To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
> >> Cc: alexdeucher@gmail.com <alexdeucher@gmail.com>
> >> Subject: Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sd=
ma' workaround for navi
> >>
> >> Hi Alex,
> >>
> >> This patch is to add the asic_type check which is missing after drm-ne=
xt branch rebase.
> >>
> >> BR,
> >> Xiaojie
> >> ________________________________
> >> From: Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
> >> Sent: Thursday, September 26, 2019 4:08 PM
> >> To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
> >> Cc: alexdeucher@gmail.com <alexdeucher@gmail.com>; Yuan, Xiaojie <Xiao=
jie.Yuan@amd.com>
> >> Subject: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma' =
workaround for navi
> >>
> >> Fixes: 767acabdac81 ("drm/amd/powerplay: add baco smu reset function f=
or smu11")
> >> Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/=
amd/amdgpu/gmc_v10_0.c
> >> index cb3f61873baa..dc2e68e019eb 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >> @@ -292,6 +292,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_=
device *adev, uint32_t vmid,
> >>
> >>           if (!adev->mman.buffer_funcs_enabled ||
> >>               !adev->ib_pool_ready ||
> >> +           !(adev->asic_type >=3D CHIP_NAVI10 && adev->asic_type <=3D=
 CHIP_NAVI12) ||
> >>               adev->in_gpu_reset) {
> >>                   gmc_v10_0_flush_vm_hub(adev, vmid, AMDGPU_GFXHUB_0, =
0);
> >>                   mutex_unlock(&adev->mman.gtt_window_lock);
> >> --
> >> 2.20.1
> >>
> >>
> >> _______________________________________________
> >> amd-gfx mailing list
> >> amd-gfx@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> >>
> >>
>


--_000_BN6PR12MB1809EBBAFA1BB6FA8A241641F7860BN6PR12MB1809namp_
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
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Maybe I'm mixing up issues.&nbsp; The navi10/14 issue that was fixed on nav=
i12 was fixed in amdgpu_ids.c in</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>commit a2bd77bbde791202267c25478bbcbe71bb4ecdd5<br>
</span>
<div>Author: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
</div>
<div>Date: &nbsp; Thu Feb 7 12:10:29 2019 &#43;0100<br>
</div>
<div><br>
</div>
<div>&nbsp; &nbsp; drm/amdgpu: disable concurrent flushes for Navi10 v2<br>
</div>
<div>&nbsp; &nbsp; <br>
</div>
<div>&nbsp; &nbsp; Navi10 have a bug in the SDMA which can theoretically ca=
use memory<br>
</div>
<div>&nbsp; &nbsp; corruption with concurrent VMID flushes<br>
</div>
<div>&nbsp; &nbsp; <br>
</div>
<div>&nbsp; &nbsp; v2: explicitely check Navi10<br>
</div>
<div>&nbsp; &nbsp; <br>
</div>
<div>&nbsp; &nbsp; Signed-off-by: Christian K=F6nig &lt;christian.koenig@am=
d.com&gt;<br>
</div>
<div>&nbsp; &nbsp; Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&=
gt;<br>
</div>
<div>&nbsp; &nbsp; Signed-off-by: Alex Deucher &lt;alexander.deucher@amd.co=
m&gt;<br>
</div>
<span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
This is a different issue and may apply to all navi parts.&nbsp; so maybe t=
he patch is fine as is.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Thursday, September 26, 2019 2:02 PM<br>
<b>To:</b> Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;<br>
<b>Cc:</b> Alex Deucher &lt;alexdeucher@gmail.com&gt;; Deucher, Alexander &=
lt;Alexander.Deucher@amd.com&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx=
@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from =
sdma' workaround for navi</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div dir=3D"auto">Well then you didn't figured out the root cause correctly=
.
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">This is to avoid data corruption with the SDMA on Navi 10=
/14 and should definitely not applied to Navi 12.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">The hardware team went through quite some work to avoid t=
his.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Christian.</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">Am 26.09.2019 19:38 schrieb &quot;Yuan, Xiaoji=
e&quot; &lt;Xiaojie.Yuan@amd.com&gt;:<br type=3D"attribution">
</div>
</div>
<div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
&nbsp;Hi Alex / Christian,</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
When gfxoff is enabled for Navi12, I observed sdma0 hang while launching de=
sktop. When this workaround is applied, the issue fades away.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
That's why I included this workaround for Navi12 as well.<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
BR,</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
Xiaojie<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Koenig, Christian &=
lt;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Thursday, September 26, 2019 10:20 PM<br>
<b>To:</b> Alex Deucher &lt;alexdeucher@gmail.com&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Yuan, Xiao=
jie &lt;Xiaojie.Yuan@amd.com&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx=
@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from =
sdma' workaround for navi</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"auto">
<div><br>
<div class=3D"x_x_gmail_extra"><br>
<div class=3D"x_x_gmail_quote">Am 26.09.2019 15:51 schrieb Alex Deucher &lt=
;alexdeucher@gmail.com&gt;:<br type=3D"attribution">
<blockquote class=3D"x_x_quote" style=3D"margin:0 0 0 .8ex; border-left:1px=
 #ccc solid; padding-left:1ex">
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>On Thu, Sep 26, 2019 at 9:47 AM Koenig, Christian<br>
&lt;Christian.Koenig@amd.com&gt; wrote:<br>
&gt;<br>
&gt; Am 26.09.19 um 15:40 schrieb Alex Deucher:<br>
&gt; &gt; On Thu, Sep 26, 2019 at 8:29 AM Christian K=F6nig<br>
&gt; &gt; &lt;ckoenig.leichtzumerken@gmail.com&gt; wrote:<br>
&gt; &gt;&gt; Stop, wait a second guys!<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This will disable the workaround for Navi10 and that is certa=
inly not correct:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; !(adev-&gt;asic_type &gt;=3D CHIP_NAVI10 &amp;&amp; adev-&gt;=
asic_type &lt;=3D CHIP_NAVI12)<br>
&gt; &gt;&gt;<br>
&gt; &gt; Actually, I think it's correct. When I merged the baco patch, I<b=
r>
&gt; &gt; accidentally dropped the navi checks.&nbsp; E.g.,<br>
&gt; &gt; @@ -245,8 &#43;245,9 @@ static void gmc_v10_0_flush_gpu_tlb(struc=
t<br>
&gt; &gt; amdgpu_device *adev,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(=
&amp;adev-&gt;mman.gtt_window_lock);<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gmc_v10_0_f=
lush_vm_hub(adev, vmid, AMDGPU_MMHUB, 0);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!adev-&gt;mman.buffer_f=
uncs_enabled || !adev-&gt;ib_pool_ready ||<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;asic_type !=3D CHIP_NAVI10) {<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!adev-&gt;mman.buff=
er_funcs_enabled ||<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 !adev-&gt;ib_pool_ready ||<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 adev-&gt;in_gpu_reset) {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gmc_v10_0_flush_vm_hub(adev, vmid, AMD=
GPU_GFXHUB, 0);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;adev-&gt;mman.gtt_wi=
ndow_lock);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; &gt; I think it should have been<br>
&gt; &gt; adev-&gt;asic_type !=3D CHIP_NAVI10 &amp;&amp; adev-&gt;asic_type=
 !=3D CHIP_NAVI14 &amp;&amp;<br>
&gt; &gt; adev-&gt;asic_type !=3D CHIP_NAVI12<br>
&gt;<br>
&gt; My last status is that Navi12 is not supposed to need that workaround,=
<br>
&gt; that's why we checked Navi10 and later Navi14 separately.<br>
&gt;<br>
&gt; It's possible that I miss-read the !(adev-&gt;asic_type &gt;=3D CHIP_N=
AVI10 &amp;&amp;<br>
&gt; adev-&gt;asic_type &lt;=3D CHIP_NAVI12) check here, but either way tha=
t looks to<br>
&gt; complicated to me.<br>
&gt;<br>
&gt; We should rather mention every affected asic type separately here.<br>
<br>
Good point.&nbsp; navi12 should be dropped from the check.&nbsp; How about =
the following?<br>
</div>
</span></font></div>
</blockquote>
</div>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">I would rather test explicitly for Navi 10 and 14, cause =
we can't be sure if there won't be another variant in the future.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Christian.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">
<div class=3D"x_x_gmail_extra">
<div class=3D"x_x_gmail_quote">
<blockquote class=3D"x_x_quote" style=3D"margin:0 0 0 .8ex; border-left:1px=
 #ccc solid; padding-left:1ex">
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div><br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
index 241a4e57cf4a..280bbd7ca8a0 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
@@ -292,7 &#43;292,8 @@ static void gmc_v10_0_flush_gpu_tlb(struct<br>
amdgpu_device *adev, uint32_t vmid,<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!adev-&gt;mman.buffer_funcs_=
enabled ||<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !adev-&g=
t;ib_pool_ready ||<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;in_g=
pu_reset) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;=
in_gpu_reset ||<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (adev-&gt=
;asic_type =3D=3D CHIP_NAVI12)) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; gmc_v10_0_flush_vm_hub(adev, vmid, AMDGPU_GFXHUB_0, 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; mutex_unlock(&amp;adev-&gt;mman.gtt_window_lock);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return;<br>
<br>
Alex<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Christian.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Alex<br>
&gt; &gt;<br>
&gt; &gt;&gt; Christian.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Am 26.09.19 um 14:26 schrieb Deucher, Alexander:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Please add a patch description.&nbsp; With that fixed:<br>
&gt; &gt;&gt; Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<b=
r>
&gt; &gt;&gt; ________________________________<br>
&gt; &gt;&gt; From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; o=
n behalf of Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;<br>
&gt; &gt;&gt; Sent: Thursday, September 26, 2019 4:09 AM<br>
&gt; &gt;&gt; To: amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedeskt=
op.org&gt;<br>
&gt; &gt;&gt; Cc: alexdeucher@gmail.com &lt;alexdeucher@gmail.com&gt;<br>
&gt; &gt;&gt; Subject: Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidatio=
n from sdma' workaround for navi<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Hi Alex,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This patch is to add the asic_type check which is missing aft=
er drm-next branch rebase.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; BR,<br>
&gt; &gt;&gt; Xiaojie<br>
&gt; &gt;&gt; ________________________________<br>
&gt; &gt;&gt; From: Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;<br>
&gt; &gt;&gt; Sent: Thursday, September 26, 2019 4:08 PM<br>
&gt; &gt;&gt; To: amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedeskt=
op.org&gt;<br>
&gt; &gt;&gt; Cc: alexdeucher@gmail.com &lt;alexdeucher@gmail.com&gt;; Yuan=
, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;<br>
&gt; &gt;&gt; Subject: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation fr=
om sdma' workaround for navi<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Fixes: 767acabdac81 (&quot;drm/amd/powerplay: add baco smu re=
set function for smu11&quot;)<br>
&gt; &gt;&gt; Signed-off-by: Xiaojie Yuan &lt;xiaojie.yuan@amd.com&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 1 &#43;<=
br>
&gt; &gt;&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(&#43;)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers=
/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
&gt; &gt;&gt; index cb3f61873baa..dc2e68e019eb 100644<br>
&gt; &gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
&gt; &gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
&gt; &gt;&gt; @@ -292,6 &#43;292,7 @@ static void gmc_v10_0_flush_gpu_tlb(s=
truct amdgpu_device *adev, uint32_t vmid,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (!adev-&gt;mman.buffer_funcs_enabled ||<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; !adev-&gt;ib_pool_ready ||<br>
&gt; &gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; !(adev-&gt;asic_type &gt;=3D CHIP_NAVI10 &amp;&amp; adev-&gt;asic_type=
 &lt;=3D CHIP_NAVI12) ||<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; adev-&gt;in_gpu_reset) {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gmc_v10_0_flush_vm_hub(adev,=
 vmid, AMDGPU_GFXHUB_0, 0);<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;adev-&gt;m=
man.gtt_window_lock);<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.20.1<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; _______________________________________________<br>
&gt; &gt;&gt; amd-gfx mailing list<br>
&gt; &gt;&gt; amd-gfx@lists.freedesktop.org<br>
&gt; &gt;&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd=
-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt;<br>
</div>
</span></font></div>
</blockquote>
</div>
<br>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_BN6PR12MB1809EBBAFA1BB6FA8A241641F7860BN6PR12MB1809namp_--

--===============1435880960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1435880960==--
