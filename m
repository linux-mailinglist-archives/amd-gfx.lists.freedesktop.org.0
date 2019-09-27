Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F695C01BB
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 11:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6236EEC0;
	Fri, 27 Sep 2019 09:05:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B5F6EEC0
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 09:05:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYr2rBffWWErEqLkk5JwNCgpinv+p6y6opynCyklI9+7/WNaQ0SlDgEq9w4XPSYls9FFt0xHsYXOrSEiU8AFty/C8pbDcYDTocghqRNPqRnL9Ar6L+Hy/DSO7vQm7B+d7XU6okwwRmQIEojxeq0eg/QrEf93CxlOxiEuaaDtu8U4VaTcqo6ClpWC4DzLmnO16IXQWI3UQjrHuRjTMFc8ZTTNMRuoYe6LsdKB/AyMMB7XSw5MC5g8TFIUoc7ntoLS+MSB0KWeBvQF6aXgZbRxsZ5X06ulZN3hQyssnM/15Tzu6yguMlZsJ2Ht/18zU+cufNBXi9RB5NJ4s73hhhZ4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVWjsjUgyAX2efP81T8bfPPhckGcTqV0rpyQ7/JxJug=;
 b=dfUrzBl/126Z+Nc+iQY4Jn3xZA5WWeIIMhelFP7UmSS/PjSd76jS2IwPjqIw33Lg7dGmdxa0j/Yu2+5L67gLfAlc2AfuV+drqaF1xF1NPPWSpBxm/s6G6PJgCY+gx1fh3QIWQe6VZO31HujQOEh9CY4kYE/2c0fKPsHLK/ug6Xpl0rI/ZSMIkQLxzCm0AO69mY25iazn4qMtIkKG6eW0C33jEGD9m6gzrfh5OYybHJ+wI7aN9yu4Ih8nps5KAFez58lf6YtC0UCPjkOPuld79/yv0QouJq2qdOToBHnzvbORHVpHSMXsm+25bs/ANfE+UkC1xkGPXjc4jVEvFZrRQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4272.namprd12.prod.outlook.com (52.135.51.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 27 Sep 2019 09:05:01 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.028; Fri, 27 Sep 2019
 09:05:01 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: initlialize smu->is_apu is false by
 default
Thread-Topic: [PATCH] drm/amd/powerplay: initlialize smu->is_apu is false by
 default
Thread-Index: AQHVdQDkhkSWJCcgM0qXIIQnUawYFqc/MUhAgAAJPjE=
Date: Fri, 27 Sep 2019 09:05:00 +0000
Message-ID: <MN2PR12MB329616541147F2B0A31DA62AA2810@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190927065727.22272-1-kevin1.wang@amd.com>,
 <MN2PR12MB3536BA16A58AE0E5E6424063FB810@MN2PR12MB3536.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3536BA16A58AE0E5E6424063FB810@MN2PR12MB3536.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc2dcd6d-3517-4777-d439-08d74329c731
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB4272:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4272C08AD0FF6A6BD78F5C98A2810@MN2PR12MB4272.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(13464003)(199004)(189003)(52314003)(229853002)(74316002)(7696005)(99286004)(52536014)(26005)(7736002)(66556008)(316002)(64756008)(476003)(66446008)(66476007)(4326008)(102836004)(76176011)(33656002)(53546011)(478600001)(186003)(6246003)(6506007)(81166006)(14454004)(8936002)(8676002)(6436002)(110136005)(2906002)(5660300002)(105004)(54906003)(66066001)(6116002)(446003)(19627405001)(9686003)(54896002)(86362001)(66946007)(76116006)(71190400001)(71200400001)(81156014)(2501003)(486006)(25786009)(91956017)(55016002)(256004)(11346002)(3846002)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4272;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c5AFrmLyjOkbOkn5WIDkGIwXYSVvMAT2+1oznlZ1tH08tWYKXfJPLz/l+PF/BP1lm84nlpa1WxKeyp93dOjHoVtURMqGd14xLIrFKZf3OV/t4XKcJkjUwJXDEwDKzbfBSR4bA7s7+kHbQrwi0UkSnvDeP4SNylbWUa5sKk9xqtLkXzaUoI4pBrjhwxdYjNb/zMdhbnzcTmvLXzTjeVKE0CvVU8kI+9AYv6bnZBESWwtiWmroZgLkVU7tNmQRFtd4hHze5kFICJFwCF6bffPFGqPyqnjBpb8WXGWfKj0LWrZcXvE5Z6oWtvJZG+Zz0aO4gEp3OnCDylrHuun4lzDw5ggyJVqI0sUe93qIsaHfaoAoiEYq6FaONnfSHEYUa12p52jQQzEt3jfr7WRZC1YBCx+fW8dpxiMeh44ykGHrVgk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2dcd6d-3517-4777-d439-08d74329c731
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 09:05:00.9626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nU/vFUtOdtyaEq8gXrM0jy0/f/xN9q6QZMsWnLMg0HKX0nqtIzL64R93R5QQUtGd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVWjsjUgyAX2efP81T8bfPPhckGcTqV0rpyQ7/JxJug=;
 b=OV7GilSqyDumx6tw7yN+L7EU9H7ZyjRp422TdgBeIrqGOvFReyYiRrwAh0+r/wJyVOe2fjHvtdsUOJS08Z3yYGXSUm7n84L/VVX9UC6sNyZCm8r/7Kic0XZRrDkhjUlMk+bgHxYqRMtpe5zMRTEDFSDEBfFh9CJfR5nK7TXkBF8=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: multipart/mixed; boundary="===============0121235172=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0121235172==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB329616541147F2B0A31DA62AA2810MN2PR12MB3296namp_"

--_000_MN2PR12MB329616541147F2B0A31DA62AA2810MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

this member should be initialize in smu driver.
by default should be set "false".

Best Regards,
Kevin
________________________________
From: Liang, Prike <Prike.Liang@amd.com>
Sent: Friday, September 27, 2019 4:37 PM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Cc: Huang, Ray <Ray.Huang@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com>
Subject: RE: [PATCH] drm/amd/powerplay: initlialize smu->is_apu is false by=
 default

Does use the default value (false) for the Boolean variable of is_apu not e=
nough for identifying DGPU?
Anyway, initialize the is_apu during smu early initialize also fine and the=
 patch is

Reviewed-by: Prike Liang <Prike.Liang@amd.com>

Thanks,
Prike
> -----Original Message-----
> From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
> Sent: Friday, September 27, 2019 2:58 PM
> To: amd-gfx@lists.freedesktop.org
> Cc: Huang, Ray <Ray.Huang@amd.com>; Feng, Kenneth
> <Kenneth.Feng@amd.com>; Liang, Prike <Prike.Liang@amd.com>; Wang,
> Kevin(Yang) <Kevin1.Wang@amd.com>
> Subject: [PATCH] drm/amd/powerplay: initlialize smu->is_apu is false by
> default
>
> the member of is_apu in smu_context need to initlialize by default.
>
> set default value is false (dGPU)
>
> for patch:
>        drm/amd/powerplay: bypass dpm_context null pointer check guard
>        for some smu series
>
> Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> index 7b995b0834eb..6a64f765fcd4 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -712,6 +712,7 @@ static int smu_early_init(void *handle)
>
>        smu->adev =3D adev;
>        smu->pm_enabled =3D !!amdgpu_dpm;
> +     smu->is_apu =3D false;
>        mutex_init(&smu->mutex);
>
>        return smu_set_funcs(adev);
> --
> 2.17.1


--_000_MN2PR12MB329616541147F2B0A31DA62AA2810MN2PR12MB3296namp_
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
this member should be initialize in smu driver.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">by default should be set &quot;false&quot;.<=
/span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,<br>
Kevin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Liang, Prike &lt;Prik=
e.Liang@amd.com&gt;<br>
<b>Sent:</b> Friday, September 27, 2019 4:37 PM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Huang, Ray &lt;Ray.Huang@amd.com&gt;; Feng, Kenneth &lt;Kenneth.=
Feng@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amd/powerplay: initlialize smu-&gt;is_apu i=
s false by default</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Does use the default value (false) for the Boolean=
 variable of is_apu not enough for identifying DGPU?&nbsp;&nbsp;
<br>
Anyway, initialize the is_apu during smu early initialize also fine and the=
 patch is
<br>
<br>
Reviewed-by: Prike Liang &lt;Prike.Liang@amd.com&gt;<br>
<br>
Thanks,<br>
Prike<br>
&gt; -----Original Message-----<br>
&gt; From: Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
&gt; Sent: Friday, September 27, 2019 2:58 PM<br>
&gt; To: amd-gfx@lists.freedesktop.org<br>
&gt; Cc: Huang, Ray &lt;Ray.Huang@amd.com&gt;; Feng, Kenneth<br>
&gt; &lt;Kenneth.Feng@amd.com&gt;; Liang, Prike &lt;Prike.Liang@amd.com&gt;=
; Wang,<br>
&gt; Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
&gt; Subject: [PATCH] drm/amd/powerplay: initlialize smu-&gt;is_apu is fals=
e by<br>
&gt; default<br>
&gt; <br>
&gt; the member of is_apu in smu_context need to initlialize by default.<br=
>
&gt; <br>
&gt; set default value is false (dGPU)<br>
&gt; <br>
&gt; for patch:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm/amd/powerplay: bypass dp=
m_context null pointer check guard<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for some smu series<br>
&gt; <br>
&gt; Signed-off-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 1 &#43;<br>
&gt;&nbsp; 1 file changed, 1 insertion(&#43;)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; index 7b995b0834eb..6a64f765fcd4 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; @@ -712,6 &#43;712,7 @@ static int smu_early_init(void *handle)<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;adev =3D adev;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;pm_enabled =3D !!amd=
gpu_dpm;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;is_apu =3D false;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_init(&amp;smu-&gt;mute=
x);<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return smu_set_funcs(adev);<=
br>
&gt; --<br>
&gt; 2.17.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB329616541147F2B0A31DA62AA2810MN2PR12MB3296namp_--

--===============0121235172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0121235172==--
