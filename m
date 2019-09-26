Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C93BF7AB
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 19:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE2A6EDB0;
	Thu, 26 Sep 2019 17:38:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740088.outbound.protection.outlook.com [40.107.74.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70496ECEE
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 17:38:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVnnFtaHngm+KNq/WqOdhAa5y2jcCCQUVYT52h+POdYevgYK6mLPfAwqvEpY9Sk4WYLm8+S+T9nxp1j27YgDFAlLw9U9fsvv9+lExbWky5fb52LwSfAiSRCe7rWf2a6L7kngbg0VWH8lorpMe6+meNCWOgNOipyouCDIOKZvRs1SPaheFkeqyfDNk4KbJGBVR+ra8UsYn8WPEJlsgrpLXpid+LP1axAO2jYlkEx3QozV5drMTyk/8pcmff3C4ULD50jAOh6AbCVD1GmfdkHFpmpbJtnaYzvJS7G4TWjlKqW04Y1kcf5bystcl0NRfF99EvGPOq2zN+b9uRKQUbmxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+IDvc4+JOAw49YxhpfNnh84hXAQU3uTpFFL2KbORYE=;
 b=c/sfC72pBUDHz12jtgkrSes08U0mzhpvoAv8L56kUiZHCsXB95epwNxkTU1FBty052oHhuCJI7qGwAX+4gcEMcHiHxN+ocCb3zCDoG7GC6E+ct8RRNmOVn6qeG5rkuCHERZIRAi1P3lOWFL3f8VK0l8T5OjOsOHZXzOdGn6cwwRwnGlMxz6qBM9NesQE8J3+5blGNnP5p0p4pn9CocMWfyxV1iGrQdDDk7WtrZv41iTzr3z6B8zjGNGgXA9S+Fuz30QBjuvfB7bbczvcOhDeC2eg35lMPiZTo7y4KPDveLukHg+lRMbEVK2420NRYSalQ9vt9oOdaXPqnLn9L+6l+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3266.namprd12.prod.outlook.com (20.179.67.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Thu, 26 Sep 2019 17:38:17 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3%7]) with mapi id 15.20.2305.016; Thu, 26 Sep 2019
 17:38:17 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Topic: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Index: AQHVdHV7HvevlndjS0WtCjpuZ5J8mac+ODor
Date: Thu, 26 Sep 2019 17:38:16 +0000
Message-ID: <BN8PR12MB3602A7F8546E1C581D47B38B89860@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <93f9508c-2871-4d48-9407-a0c3a6525bab@email.android.com>
In-Reply-To: <93f9508c-2871-4d48-9407-a0c3a6525bab@email.android.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [112.64.61.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9240c748-2fc1-44db-3a20-08d742a850ac
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB3266:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3266960E58BADE6B34FFC8F489860@BN8PR12MB3266.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(199004)(189003)(8936002)(478600001)(316002)(76116006)(81156014)(81166006)(8676002)(66556008)(66476007)(66946007)(64756008)(91956017)(66446008)(6246003)(4326008)(966005)(54896002)(236005)(55016002)(9686003)(6436002)(6306002)(14444005)(110136005)(229853002)(256004)(105004)(19627405001)(446003)(11346002)(486006)(74316002)(71190400001)(99286004)(71200400001)(33656002)(54906003)(14454004)(76176011)(66066001)(86362001)(52536014)(606006)(5660300002)(66574012)(25786009)(476003)(7736002)(7696005)(26005)(6506007)(102836004)(186003)(53546011)(3846002)(2906002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3266;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9hgans+vRLEZX9RRdt4Ofjdp8VWjfBczoEeYHvWeiLrCxtdZhDv7/GFxFsYrh1AGAupnQ5pavtH/7bHIZ73EJnZz6MKqW+6EUc3MOudXZQpGYY3X+TOm52s9MFWJPNGrwNJHJqD5AT0HEQ9UdsVPsA4ghqmWNJ4XhhzrbSObm3IpWpnZfbKb/KZzuY1OrwXsfg0koJdSShGqtNHLTd/7uGuBKbHqF5nVK0A2RlWr8rM4PiemcROIHt5TMV5hOhwtfvik3KQ7ArTNxn1oJT0Tm0FEWBmuzuIUo9F6bWjpE3is+IYiUVh3IoyAvkheMrhM1VHw7tZPecZ6n0i2TKId5EOPfDl1cPJ02JNpOiGLkVvG2MFQKk6YIDEy3x2UUCE1u/aAlXszH266yv46CsNcw4IKOJEcEFqQW15cLHHxjjc0bQVpprNJkIsdELAWyx8TPK91tiQoacCQBsfNuRflvA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9240c748-2fc1-44db-3a20-08d742a850ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 17:38:16.8479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MKzPoKxoAggBdTKRj4bvNZXoNpI8+dTBULOEQO1Dvdnrqt1b/nxClzAeO9RCBMHB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3266
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+IDvc4+JOAw49YxhpfNnh84hXAQU3uTpFFL2KbORYE=;
 b=hx9g7EkxHsdG4OpVDfqkv3DtCP3uaRbQe9WUyI8wOZ0Kb2kU8yHRVvqb1+kG/W5YoMP/5MLB8UkPlB6xs3bviLyTAhCUGbmv2OwU+0zMaPJKIAyGZR8HhWiT1WrgIxZVGlfM5h3i6ed7tS4Mfr3iV1eHNnIuIT7XWKMG/nUo1oM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0685562371=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0685562371==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB3602A7F8546E1C581D47B38B89860BN8PR12MB3602namp_"

--_000_BN8PR12MB3602A7F8546E1C581D47B38B89860BN8PR12MB3602namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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


--_000_BN8PR12MB3602A7F8546E1C581D47B38B89860BN8PR12MB3602namp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
&nbsp;Hi Alex / Christian,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
When gfxoff is enabled for Navi12, I observed sdma0 hang while launching de=
sktop. When this workaround is applied, the issue fades away.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
That's why I included this workaround for Navi12 as well.<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
BR,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Xiaojie<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
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
</body>
</html>

--_000_BN8PR12MB3602A7F8546E1C581D47B38B89860BN8PR12MB3602namp_--

--===============0685562371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0685562371==--
