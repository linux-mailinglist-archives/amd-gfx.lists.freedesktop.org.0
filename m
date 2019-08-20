Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BA69549A
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 04:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AEE6E5BC;
	Tue, 20 Aug 2019 02:50:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810040.outbound.protection.outlook.com [40.107.81.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023E96E5BC
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 02:49:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4yVbbKNMMbj4mb+Bj09adwTYRza3AKzuuUdcaYe/jBBN//fFFzgTnMEa+Pt7FdoZf+S6DNJJrOAaU1fHXAYgILMRjXHVMRV5ujq3nlf8DOzZeZ33xqXU2itV2UqfnZ0NBFZTadb/lAHm5if75PK52rRn6kfaJlOrIb7Uu3CezqjJaBOnPf4KIjy3nLu6Bw6nUsYsdsxOT7wHuyKBcp8h5dtw76/pbE0kxY6ZqG6p4qg/frh/m9N0BPmZOjE2Wl6WTUPL+ROEAxv+RCdzfoI9Y+czQpJBrDNFkKokOI6PsfhIj45utDHF05TdATm3Qdk1vBGH156u0C5QpsOjiydhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSOhA8hcWfhpU7loI6YiDjFeKFdorfPAkxOTDMH7b+s=;
 b=YYLpaPYP3mUrkw5/51ht66ez1MuDfBzcJFiDA9NdEnhmLFre7DtO5WvjjZc1ekwYw7qQMbX0wNZnjc+n0h7Ctzwc/A9tSuLQwFV8LPXauwA9FO9ILurOhcue2bszWsrsX/voKkAoscBpRbQWXH4X3ju1RLiXH/9NAZxEk7rE2A2t/oiO1m1wy8RoZG3XDuumZfqChbM+GGwnWbHr2QIMxQY+40qCNv5SB8/an84EOmmR1ybfOtoPtQn85uvoqtN39StcR1CFoxFKCm5PLR8ZHJ12itFYom226XTnWwaWUn1wdeeQ5RlqIwuAr2K9YEAZtgvyQw7eeXS0LRVmEokc4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4240.namprd12.prod.outlook.com (52.135.48.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 20 Aug 2019 02:49:56 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.016; Tue, 20 Aug 2019
 02:49:56 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: add smu_smc_read_sensor support for
 arcturus
Thread-Topic: [PATCH] drm/amd/powerplay: add smu_smc_read_sensor support for
 arcturus
Thread-Index: AQHVVANX9qrnAkbKrEyyuQuMRJcat6cCnuaAgAC8yIA=
Date: Tue, 20 Aug 2019 02:49:56 +0000
Message-ID: <MN2PR12MB32964525EC399DBB51B85639A2AB0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190816072200.21833-1-kevin1.wang@amd.com>,
 <CADnq5_OF7RKb8DdqjGLBfgk+xF2t3S=rAmERP_zh2QSx7-Ww=A@mail.gmail.com>
In-Reply-To: <CADnq5_OF7RKb8DdqjGLBfgk+xF2t3S=rAmERP_zh2QSx7-Ww=A@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4a7e3a7-919d-4e3c-9755-08d7251915e9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4240; 
x-ms-traffictypediagnostic: MN2PR12MB4240:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB42405F61393C08BBFA364799A2AB0@MN2PR12MB4240.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(199004)(189003)(6436002)(66446008)(66556008)(64756008)(66476007)(91956017)(71190400001)(71200400001)(66946007)(446003)(99286004)(1411001)(53546011)(11346002)(14454004)(186003)(102836004)(26005)(606006)(105004)(76176011)(19627405001)(476003)(66066001)(316002)(54906003)(486006)(478600001)(229853002)(6306002)(54896002)(55016002)(25786009)(236005)(9686003)(76116006)(7696005)(6506007)(53936002)(966005)(6246003)(81166006)(33656002)(6916009)(2906002)(74316002)(3846002)(6116002)(8936002)(86362001)(5660300002)(7736002)(8676002)(81156014)(256004)(52536014)(14444005)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4240;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LjPe3DUFXPo2EW7gOJJvutTunTGrJwPrezjObhEeMSvlXBW0R3BgDN4NgzKzR7m/PQQX23DIYsTFeab8P2pFngZQWLlM/j1Amn+5xZcE/akr/wIns2uI2iHb3b/0kALOm6gzoDXFRmFsoDzgtDkH0F50rS6LJ02ZxPOf4KCXF/51ns74NXAzp9R2VbauCtGjeurXHmcgqxEihp+hY1/AKBBXlb5Y0sJamAk8V+ZwzZvIDrc+HHDTILpdYxzGd0MDVwEE6PoSzyNxchiC5wLfwdESdipNpfNxBUh7fxXoV+2G8C1BgaUTEeMI2NxNA3DOi5PQLJT1LMZjdXiCcpGn1WEq+fCz26vgt/ddXTRQUlYby9ZvnJTR1xug5S9qVtefcTmOnAeL8nlL0awFn5APehzMjcPDuOKRaxXQpCnXEE0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a7e3a7-919d-4e3c-9755-08d7251915e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 02:49:56.6605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 73rEubQnfiMldmD7+E+hNggePv8ZLgh6KSXv7pqDQx1CBn3lN7/SKv095QMA5GBl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4240
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSOhA8hcWfhpU7loI6YiDjFeKFdorfPAkxOTDMH7b+s=;
 b=Sbd5O0d3qTB0vhGrrucEruu4PtBobufIBQM1xBrAD0rtu8JxIbZbfM4dsa2NGtxZwQXFoe+Z1ywkfC55DPiH6HovebzkHkLhNfa1/Mh/QQ47LgV8AKCFJw8fQIQTYPeVozFXnUHKp1Pti3VZvhYdVAQvUska8KOoLu/1BqTnZl4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1580681649=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1580681649==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32964525EC399DBB51B85639A2AB0MN2PR12MB3296namp_"

--_000_MN2PR12MB32964525EC399DBB51B85639A2AB0MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: Monday, August 19, 2019 11:33 PM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Feng, Ke=
nneth <Kenneth.Feng@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Huang, Ray <R=
ay.Huang@amd.com>
Subject: Re: [PATCH] drm/amd/powerplay: add smu_smc_read_sensor support for=
 arcturus

On Fri, Aug 16, 2019 at 3:22 AM Wang, Kevin(Yang) <Kevin1.Wang@amd.com> wro=
te:
>
> the bellow patch refine the sensor read sequence,
> but missed to add arcuturs support. (arcuturs_ppt.c)
>
> drm/amd/powerplay: change smu_read_sensor sequence in smu
>
> Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/d=
rm/amd/powerplay/arcturus_ppt.c
> index fcf623cf5d2c..850b2a1ef329 100644
> --- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> @@ -1012,6 +1012,9 @@ static int arcturus_read_sensor(struct smu_context =
*smu,
>         PPTable_t *pptable =3D table_context->driver_pptable;
>         int ret =3D 0;
>
> +       if(!data || !size)

Please add a space between if the if and the (.  E.g.,
if (!data || !size)

Alex

[kevin]:
thanks, i will correct it.

> +               return -EINVAL;
> +
>         switch (sensor) {
>         case AMDGPU_PP_SENSOR_MAX_FAN_RPM:
>                 *(uint32_t *)data =3D pptable->FanMaximumRpm;
> @@ -1036,7 +1039,7 @@ static int arcturus_read_sensor(struct smu_context =
*smu,
>                 *size =3D 4;
>                 break;
>         default:
> -               return -EINVAL;
> +               ret =3D smu_smc_read_sensor(smu, sensor, data, size);
>         }
>
>         return ret;
> --
> 2.22.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB32964525EC399DBB51B85639A2AB0MN2PR12MB3296namp_
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
<div id=3D"appendonsend" style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> Monday, August 19, 2019 11:33 PM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Quan, Evan &lt;Evan.Quan@a=
md.com&gt;; Huang, Ray &lt;Ray.Huang@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amd/powerplay: add smu_smc_read_sensor supp=
ort for arcturus</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Fri, Aug 16, 2019 at 3:22 AM Wang, Kevin(Yang) =
&lt;Kevin1.Wang@amd.com&gt; wrote:<br>
&gt;<br>
&gt; the bellow patch refine the sensor read sequence,<br>
&gt; but missed to add arcuturs support. (arcuturs_ppt.c)<br>
&gt;<br>
&gt; drm/amd/powerplay: change smu_read_sensor sequence in smu<br>
&gt;<br>
&gt; Signed-off-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 5 &#43;&#43;&#43;=
&#43;-<br>
&gt;&nbsp; 1 file changed, 4 insertions(&#43;), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gp=
u/drm/amd/powerplay/arcturus_ppt.c<br>
&gt; index fcf623cf5d2c..850b2a1ef329 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&gt; @@ -1012,6 &#43;1012,9 @@ static int arcturus_read_sensor(struct smu_c=
ontext *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PPTable_t *pptable =3D=
 table_context-&gt;driver_pptable;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!data || !size)<br>
<br>
Please add a space between if the if and the (.&nbsp; E.g.,<br>
if (!data || !size)<br>
<br>
Alex</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">[kevin]:</div>
<div class=3D"PlainText">thanks, i will correct it.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_=
MAX_FAN_RPM:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *(uint32_t *)data =3D pptable-&gt;FanMaximumRpm;<=
br>
&gt; @@ -1036,7 &#43;1039,7 @@ static int arcturus_read_sensor(struct smu_c=
ontext *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D smu_smc_read_sensor(smu, sensor, data, size);<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; --<br>
&gt; 2.22.0<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; amd-gfx@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">htt=
ps://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB32964525EC399DBB51B85639A2AB0MN2PR12MB3296namp_--

--===============1580681649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1580681649==--
