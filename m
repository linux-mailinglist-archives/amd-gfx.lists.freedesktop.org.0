Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7BB6E631
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 15:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AB46E82F;
	Fri, 19 Jul 2019 13:16:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720071.outbound.protection.outlook.com [40.107.72.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0036E82F
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 13:16:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foy8hm7oBuozB+Q/vurtyrsZDLYRQRk+7P2q8P6mpltXtZbRCTTqvRAHCxYL82My9YGPR1TmD39TtKvOoNgXIxFo9PPGxysKDY+kmc8klaMEj+Zf9mB9toN2HyRU5yWuNPxusMxav6vYE6Dwxed0gY6bbUZNR8on8bgQZLFSIs3DqXGKNjlGe1mfDqNcCuMCmFYvTgyWPn3ggmNGQ3XjkiZHFxzGD+EX/g/CqWLmCxdE07iNvB1mdVgb9Rk9MxdIzkxrdKmEm6h4NmpK2GvVasU62nGDNT9sD1KKassD36hi6hnV4n9g218TgWzL8FbojUP5Tym8cgXwgyJ4BKIxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pguudQ/y1yPdWWrARSVu7WakD6dpFTVnjczR4t6DySU=;
 b=L7OkehUFj5pQMwj6yv+Y/2skRQLaAdhoMhqJx6C7NU9jvbIIRC2oNOroGDMPMCjB4hql0LE0cLcOJPgVp3saxTO0qTrt5VEbksA6GSpSCqnqnJlrrEKIvIjiqAjn3hsIs1bsBXLZO0a2Ye9k74pq3/QKzSEiEsFLTF9+o79qloe9vmXWhVoX9B91Vv0IMcJmgerVTOgMMLykuC9NTbdOIGLPyYmggsNd74NKYbSkoPsFTl+FXHvjmrkYSTB87a2u+NwArPeS/iekFjA8QSQgsT/vJ1nFtyjoQG9CljEc51AjxKJdV9l6ihs6qVk1c289VgOjE0i8xXrBmlREqt6nCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1441.namprd12.prod.outlook.com (10.172.24.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 13:16:10 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c%4]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 13:16:10 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: correct the bit mask for checking VCN
 power status
Thread-Topic: [PATCH] drm/amd/powerplay: correct the bit mask for checking VCN
 power status
Thread-Index: AQHVPg9DE0g/FZJiD0OfV7maJQaS9KbRqlSAgAAHlgCAADoSSQ==
Date: Fri, 19 Jul 2019 13:16:09 +0000
Message-ID: <BN6PR12MB1809DF29C0B6DC3D9C34900DF7CB0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190719085145.27515-1-evan.quan@amd.com>
 <MN2PR12MB3309184F93F4EF2E0353AE82ECCB0@MN2PR12MB3309.namprd12.prod.outlook.com>,
 <MN2PR12MB3344010A9F4F9108DD54ED7EE4CB0@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344010A9F4F9108DD54ED7EE4CB0@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.160.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4eb9f1e7-fff7-4003-10a0-08d70c4b441d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1441; 
x-ms-traffictypediagnostic: BN6PR12MB1441:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB144143E5D780FA29C8CA335EF7CB0@BN6PR12MB1441.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(189003)(52314003)(13464003)(199004)(9686003)(54896002)(236005)(33656002)(55016002)(6246003)(3846002)(6116002)(53936002)(478600001)(6306002)(8676002)(966005)(7696005)(14454004)(74316002)(7736002)(68736007)(6436002)(186003)(486006)(66066001)(19627405001)(64756008)(256004)(110136005)(53546011)(76116006)(6506007)(81156014)(2906002)(86362001)(66556008)(66476007)(71200400001)(2501003)(66446008)(66946007)(606006)(71190400001)(26005)(102836004)(11346002)(446003)(81166006)(316002)(476003)(76176011)(25786009)(8936002)(5660300002)(105004)(14444005)(52536014)(99286004)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1441;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: v5x8k0+rlxfPKwsKLgDmt9C6qH7iipjv4fwyZy1+OXtPEAVpWjDtk9SSGbErEKd81EhZWl59iHJmsmVJHwRCqEC0BP6GmgCZS5sg3j3N0P6rDdyURNypCKbPgZMJHrOS8v3KBNaUb1A7+V5uoAi33el3J1YvM/2HiwilVyd2AyD2KPN9M5dRtegItzK9impeAskSYIvO/0XeZGgDAHTlwQLYYdLm1WEMytNEMzVCIo3SsMQHu34xnAIl/aOOsapkfm8Mem9VS8LeLVvDyMOr4QKaX0/o8YgAzQCIXcOWk7wAZ+Uso+q3zGPhWmSZ2vXhmdYSBcx/USl4gpu+zqRAgmtX3hR5X1ISaF4RHRiC2dxiNSAB9iA3ICocWPzPTrvto4yCqauXSgftpwscgYGvDoi6nUJZ+CFUjZI1pnG7E2A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb9f1e7-fff7-4003-10a0-08d70c4b441d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 13:16:09.9731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1441
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pguudQ/y1yPdWWrARSVu7WakD6dpFTVnjczR4t6DySU=;
 b=gQoqNF7n8q0j+Y+lvw/xYhyw6bSXJI5prnr7cbOyZiO296tROfKVXYxs/ueDo37FJ9jVwPUN3TOlt+XmK4obpcBsb/m5P3BXBbfPyWus+6IlUfkLgvRzLJaFWXirEThxuKs3gp+FIhQdyLpQeO9MKIldA1FqCfVx9xlcP8m0kG4=
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
Content-Type: multipart/mixed; boundary="===============0131504660=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0131504660==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809DF29C0B6DC3D9C34900DF7CB0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809DF29C0B6DC3D9C34900DF7CB0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sure.  That makes more sense.  We should switch raven to use it as well.

Alex
________________________________
From: Quan, Evan
Sent: Friday, July 19, 2019 5:47 AM
To: amd-gfx@lists.freedesktop.org; Deucher, Alexander
Subject: RE: [PATCH] drm/amd/powerplay: correct the bit mask for checking V=
CN power status

Considering this is actually different from traditional UVD, maybe it's bet=
ter to add a new flag like AMDGPU_PP_SENSOR_VCN_POWER.
@Deucher, Alexander any comment?

Regards,
Evan
> -----Original Message-----
> From: Huang, Ray <Ray.Huang@amd.com>
> Sent: Friday, July 19, 2019 5:21 PM
> To: Quan, Evan <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org
> Cc: Quan, Evan <Evan.Quan@amd.com>
> Subject: RE: [PATCH] drm/amd/powerplay: correct the bit mask for checking
> VCN power status
>
> > -----Original Message-----
> > From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Evan Quan
> > Sent: Friday, July 19, 2019 4:52 PM
> > To: amd-gfx@lists.freedesktop.org
> > Cc: Quan, Evan <Evan.Quan@amd.com>
> > Subject: [PATCH] drm/amd/powerplay: correct the bit mask for checking
> > VCN power status
> >
> > For Navi10 or later ASICs, a different bit mask is used for checking
> > VCN power status.
> >
> > Change-Id: Iaa49e5a339c38f46e3e7124d21aeb65f6633325e
> > Signed-off-by: Evan Quan <evan.quan@amd.com>
> > ---
> >  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> > b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> > index 6e2f7df826f0..887577c47568 100644
> > --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> > +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> > @@ -271,6 +271,8 @@ int smu_get_power_num_states(struct
> smu_context
> > *smu,  int smu_common_read_sensor(struct smu_context *smu, enum
> > amd_pp_sensors sensor,
> >                         void *data, uint32_t *size)
> >  {
> > +   struct amdgpu_device *adev =3D smu->adev;
> > +   uint32_t uvd_bit_mask =3D 0xFFFFFFFF;
> >      int ret =3D 0;
> >
> >      switch (sensor) {
> > @@ -287,7 +289,11 @@ int smu_common_read_sensor(struct
> smu_context
> > *smu, enum amd_pp_sensors sensor,
> >              *size =3D 8;
> >              break;
> >      case AMDGPU_PP_SENSOR_UVD_POWER:
> > -           *(uint32_t *)data =3D smu_feature_is_enabled(smu,
> > SMU_FEATURE_DPM_UVD_BIT) ? 1 : 0;
> > +           if (adev->asic_type =3D=3D CHIP_VEGA20)
> > +                   uvd_bit_mask =3D SMU_FEATURE_DPM_UVD_BIT;
> > +           else
> > +                   uvd_bit_mask =3D SMU_FEATURE_VCN_PG_BIT;
>
> After vega20, we actually will use VCN instead of UVD. Below indicates th=
e
> design for this.
>
> uvd_bit_mask =3D (adev->asic_type > CHIP_VEGA20) ?
> SMU_FEATURE_VCN_PG_BIT : SMU_FEATURE_DPM_UVD_BIT
>
> Anyway, patch looks good for me.
> Reviewed-by: Huang Rui <ray.huang@amd.com>
>
>
> Thanks,
> Ray
>
> > +   *(uint32_t *)data =3D smu_feature_is_enabled(smu,
> > uvd_bit_mask) ? 1 :
> > +0;
> >              *size =3D 4;
> >              break;
> >      case AMDGPU_PP_SENSOR_VCE_POWER:
> > --
> > 2.22.0
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809DF29C0B6DC3D9C34900DF7CB0BN6PR12MB1809namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Sure.&nbsp; That makes more sense.&nbsp; We should switch raven to use it a=
s well.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Quan, Evan<br>
<b>Sent:</b> Friday, July 19, 2019 5:47 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org; Deucher, Alexander<br>
<b>Subject:</b> RE: [PATCH] drm/amd/powerplay: correct the bit mask for che=
cking VCN power status</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Considering this is actually different from tradit=
ional UVD, maybe it's better to add a new flag like AMDGPU_PP_SENSOR_VCN_PO=
WER.<br>
@Deucher, Alexander any comment?<br>
<br>
Regards,<br>
Evan<br>
&gt; -----Original Message-----<br>
&gt; From: Huang, Ray &lt;Ray.Huang@amd.com&gt;<br>
&gt; Sent: Friday, July 19, 2019 5:21 PM<br>
&gt; To: Quan, Evan &lt;Evan.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.or=
g<br>
&gt; Cc: Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
&gt; Subject: RE: [PATCH] drm/amd/powerplay: correct the bit mask for check=
ing<br>
&gt; VCN power status<br>
&gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; On Be=
half Of<br>
&gt; &gt; Evan Quan<br>
&gt; &gt; Sent: Friday, July 19, 2019 4:52 PM<br>
&gt; &gt; To: amd-gfx@lists.freedesktop.org<br>
&gt; &gt; Cc: Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
&gt; &gt; Subject: [PATCH] drm/amd/powerplay: correct the bit mask for chec=
king<br>
&gt; &gt; VCN power status<br>
&gt; &gt;<br>
&gt; &gt; For Navi10 or later ASICs, a different bit mask is used for check=
ing<br>
&gt; &gt; VCN power status.<br>
&gt; &gt;<br>
&gt; &gt; Change-Id: Iaa49e5a339c38f46e3e7124d21aeb65f6633325e<br>
&gt; &gt; Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 8 &#43;&#43;&#=
43;&#43;&#43;&#43;&#43;-<br>
&gt; &gt;&nbsp; 1 file changed, 7 insertions(&#43;), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; &gt; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; &gt; index 6e2f7df826f0..887577c47568 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; &gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; &gt; @@ -271,6 &#43;271,8 @@ int smu_get_power_num_states(struct<br>
&gt; smu_context<br>
&gt; &gt; *smu,&nbsp; int smu_common_read_sensor(struct smu_context *smu, e=
num<br>
&gt; &gt; amd_pp_sensors sensor,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; void *data, uint32_t *size)<br>
&gt; &gt;&nbsp; {<br>
&gt; &gt; &#43;&nbsp;&nbsp; struct amdgpu_device *adev =3D smu-&gt;adev;<br=
>
&gt; &gt; &#43;&nbsp;&nbsp; uint32_t uvd_bit_mask =3D 0xFFFFFFFF;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&gt; &gt; @@ -287,7 &#43;289,11 @@ int smu_common_read_sensor(struct<br>
&gt; smu_context<br>
&gt; &gt; *smu, enum amd_pp_sensors sensor,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; *size =3D 8;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; break;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_UVD_POWER:<br=
>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *(u=
int32_t *)data =3D smu_feature_is_enabled(smu,<br>
&gt; &gt; SMU_FEATURE_DPM_UVD_BIT) ? 1 : 0;<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 if (adev-&gt;asic_type =3D=3D CHIP_VEGA20)<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uvd_bit_mask =3D SMU_FEATU=
RE_DPM_UVD_BIT;<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 else<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uvd_bit_mask =3D SMU_FEATU=
RE_VCN_PG_BIT;<br>
&gt; <br>
&gt; After vega20, we actually will use VCN instead of UVD. Below indicates=
 the<br>
&gt; design for this.<br>
&gt; <br>
&gt; uvd_bit_mask =3D (adev-&gt;asic_type &gt; CHIP_VEGA20) ?<br>
&gt; SMU_FEATURE_VCN_PG_BIT : SMU_FEATURE_DPM_UVD_BIT<br>
&gt; <br>
&gt; Anyway, patch looks good for me.<br>
&gt; Reviewed-by: Huang Rui &lt;ray.huang@amd.com&gt;<br>
&gt; <br>
&gt; <br>
&gt; Thanks,<br>
&gt; Ray<br>
&gt; <br>
&gt; &gt; &#43;&nbsp;&nbsp; *(uint32_t *)data =3D smu_feature_is_enabled(sm=
u,<br>
&gt; &gt; uvd_bit_mask) ? 1 :<br>
&gt; &gt; &#43;0;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; *size =3D 4;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; break;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_VCE_POWER:<br=
>
&gt; &gt; --<br>
&gt; &gt; 2.22.0<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; amd-gfx mailing list<br>
&gt; &gt; amd-gfx@lists.freedesktop.org<br>
&gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx=
">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809DF29C0B6DC3D9C34900DF7CB0BN6PR12MB1809namp_--

--===============0131504660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0131504660==--
