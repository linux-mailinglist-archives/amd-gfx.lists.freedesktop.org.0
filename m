Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0960BF8A1
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 20:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB136ECEE;
	Thu, 26 Sep 2019 18:02:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700074.outbound.protection.outlook.com [40.107.70.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372A66ECEE
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 18:02:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+TXtF6BLAPtfGLhvTJWI/KU3hO6jGHYeot+BCiID0UKuvN3XrYsL4d9mpPH6nytWvx5SJxs64E20jY1j0whHaCYjIMmiz/jJMHbioViJhDIFXKaDv3wiUzS3nlgIV8XV710qTNZuzyoWG1Cjr3zec7KD3Bs/xsoCINPaGzIOk9DD833RJT8Zkum3fYtaZtHHQXAETG71i3tryGY8leiK7m6xVFRepGP4z4LsoR/4uACAKf9zWWEWPLesjK1i3u9TaZHcm92uzT6lW70BgKLeWPfmWgSt5O1QOjU+hw6XngDUskPubblpiD6gP2nCY4fFjn8HC2OBwP1uaajqMDGbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pb+BaBtLVsBUzLJOUdoi2VoOelL277mGun9dR6miw8=;
 b=OcuNmolf+HoSlryioA0036lLL3VPsLIwzEekL82pPrSFx/WM/4OmU/b6BwD4GaNsapsdi6Sl61X1hVTqVQF15DYXEvHOx+/4e0C8N512SkXlYIGGNso41EAcmv9kY0T5JlQ3I0SQKTJVT8yLx8RB9QJn3jitjmoohzrMn4OHMeDvoy+AmMuoHAZSIWmWF4QOy84pVUfZ3x2K8Vp+VvbLVf2POPQp1OCSVahsHMU5BDH8OjuPf8TsfGg3NGwgVymmLJzsAr5kcw6JXOnHbt6+b6M/ldxAJuPkW6+4vECUilnhNKfpSGRfWjYZLEW4bziOmBRmRUM5fXCmKT6B+Re3dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2358.namprd12.prod.outlook.com (52.132.140.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Thu, 26 Sep 2019 18:02:23 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 18:02:23 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Subject: Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Topic: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Index: AQHVdHV7HvevlndjS0WtCjpuZ5J8mac+ODorgAAH8xI=
Date: Thu, 26 Sep 2019 18:02:23 +0000
Message-ID: <6c2ee5a6-8283-4b36-9177-36ddb22a60ad@email.android.com>
References: <93f9508c-2871-4d48-9407-a0c3a6525bab@email.android.com>,
 <BN8PR12MB3602A7F8546E1C581D47B38B89860@BN8PR12MB3602.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3602A7F8546E1C581D47B38B89860@BN8PR12MB3602.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a02:908:1252:fb60:1d5b:5f2f:1b40:60cc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 391dc19a-3a42-4be9-f0e5-08d742abaebb
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB2358:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB235875F0FD5745E930A2CBD083860@DM5PR12MB2358.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(199004)(189003)(8936002)(478600001)(25786009)(11346002)(4326008)(76176011)(46003)(31686004)(316002)(2906002)(446003)(54906003)(476003)(966005)(6246003)(186003)(91956017)(81166006)(76116006)(606006)(71190400001)(6116002)(71200400001)(64756008)(66476007)(66446008)(6506007)(53546011)(486006)(6862004)(14454004)(6436002)(19627405001)(66556008)(66946007)(6486002)(6306002)(236005)(9686003)(6512007)(54896002)(86362001)(102836004)(229853002)(31696002)(81156014)(8676002)(6636002)(99286004)(7736002)(256004)(5660300002)(66574012)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2358;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jb9WNEirkdC1OUCL00VvgytsCZ2vAF7H9JDA5zORcftKBMyDAxB1+Xd56YdwzRmLkbxZrWCm2Kcztb4yvRpyCxY/0trb3hk9jfs/feoWu/x5GTBRMFeRRzYuuSXoAlyRfqkNekqIwIN7Nj1ccUmpnKYXw/HlODgMTBU25z/2bG2VczMCdcnZPJa32HHx53f8HqWsoNeXwo/8qcqkQ75KRQ/1tLdmpwhnLVYxqmaFKdsz8juq2yhxuf/shcfwjDBGfIc6/uPrcKGGGD/PoUti63D2AxO9CWLB4djGuF43yH82cMNRDHwGF+6DsqLNyDdXQWh9lIItVeiuTQ88SWIHC7lx6R+dSZyD75UNWn7OUOZBJMZ+Vd9Fteim+H5vH8xRJzwusdUrPr/Uh0ewcFexCiWHtuZLFN7EX8i2wDQorN55PZ9zfrw/EsQq8uGsjcniaK3aEzVfN3Imt/MdT+/33w==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 391dc19a-3a42-4be9-f0e5-08d742abaebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 18:02:23.2408 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6pg5xl/BOc9QpiSNmRF5NPTAfirZwL6TjVcjgE+hNKgkOScPlNATUH6yKNFf17qW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2358
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pb+BaBtLVsBUzLJOUdoi2VoOelL277mGun9dR6miw8=;
 b=2u17bJYdVAfjyW0YdhDZ9qT88AVdeIs3icSufBMqciNNG1CAlY8E89Lpt5XzNJXIdM7HWt3DEqsFlMzkcdNXrL2jTwS8OYrXdsAPzXFc/4zN8P3C6y9A6mSFD13jfaA6S+4bguWECKrTDTi3IWs/lTSwYmRjej5OonYd1Nvp8EI=
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
Cc: Alex Deucher <alexdeucher@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1396212037=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1396212037==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_6c2ee5a682834b36917736ddb22a60ademailandroidcom_"

--_000_6c2ee5a682834b36917736ddb22a60ademailandroidcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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


--_000_6c2ee5a682834b36917736ddb22a60ademailandroidcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta content=3D"text/html; charset=3Diso-8859-1">
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
</head>
<body dir=3D"ltr">
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
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">Am 26.09.2019 19:38 schrieb &quot;Yuan, Xiaojie&=
quot; &lt;Xiaojie.Yuan@amd.com&gt;:<br type=3D"attribution">
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
<div id=3D"appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
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
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">Am 26.09.2019 15:51 schrieb Alex Deucher &lt;a=
lexdeucher@gmail.com&gt;:<br type=3D"attribution">
<blockquote class=3D"x_quote" style=3D"margin:0 0 0 .8ex; border-left:1px #=
ccc solid; padding-left:1ex">
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
<div class=3D"x_gmail_extra">
<div class=3D"x_gmail_quote">
<blockquote class=3D"x_quote" style=3D"margin:0 0 0 .8ex; border-left:1px #=
ccc solid; padding-left:1ex">
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
</body>
</html>

--_000_6c2ee5a682834b36917736ddb22a60ademailandroidcom_--

--===============1396212037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1396212037==--
