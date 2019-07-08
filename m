Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6487D61A86
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 08:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C57899DB;
	Mon,  8 Jul 2019 06:05:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760047.outbound.protection.outlook.com [40.107.76.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B87899DB
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 06:05:34 +0000 (UTC)
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3359.namprd12.prod.outlook.com (20.178.241.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 06:05:33 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 06:05:32 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: add temperature sensor support for
 navi10
Thread-Topic: [PATCH] drm/amd/powerplay: add temperature sensor support for
 navi10
Thread-Index: AQHVMhTiewEBneOXl0qVaHyaOFX/66a8hr8AgAO63Rk=
Date: Mon, 8 Jul 2019 06:05:32 +0000
Message-ID: <MN2PR12MB3296122EC6328742E550406EA2F60@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190704030151.6934-1-kevin1.wang@amd.com>,
 <CADnq5_PemR-+hFMou8DwFgSSx9mUR0cOwdP+jHkmpgnNcSo0Qg@mail.gmail.com>
In-Reply-To: <CADnq5_PemR-+hFMou8DwFgSSx9mUR0cOwdP+jHkmpgnNcSo0Qg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 195e8cde-bcd3-4347-46fd-08d7036a4971
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3359; 
x-ms-traffictypediagnostic: MN2PR12MB3359:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3359E58D59FDE812DF81D189A2F60@MN2PR12MB3359.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(189003)(199004)(4326008)(316002)(478600001)(76176011)(3846002)(6116002)(68736007)(966005)(7696005)(2906002)(72206003)(64756008)(55016002)(73956011)(52536014)(6246003)(76116006)(66446008)(66946007)(6306002)(9686003)(66476007)(54896002)(236005)(66556008)(6916009)(6606003)(6436002)(53936002)(256004)(25786009)(33656002)(1411001)(99286004)(229853002)(66066001)(7736002)(606006)(14444005)(446003)(19627235002)(11346002)(486006)(476003)(74316002)(26005)(71190400001)(71200400001)(5660300002)(186003)(54906003)(53546011)(6506007)(102836004)(19627405001)(8676002)(86362001)(1015004)(81166006)(14454004)(81156014)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3359;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: q+mvk6AfFc6232OI5WByI+nmrmRO/g4PE8Z00wjvIjkYsxcELJ6ZmS13tfUaNjU3nCZ3klozS6s+FHgUwKh79ElKkFwok3jMuJiwmlW47pzIGNerG5djeNGdm9kNBiolHQRH33uYlPhXPzrf6zx0iHlkVDzIsHnWVeZEA+erQFlAfRLyFPmOnvbRB3A6G6i7EZ6E8h6pBISNg/8GWoXSS9HaB9pQsNJFfqCnljP9PX5g5xdtHeZxxgRl++E4+4K66Tfa9YINoY0pVdIf9Pz8B72ZTiDZq/eqUbMbUMPUwZ+dfo+zfZTvDWNMokTh/6AGR+yMcuf80q3PJN7Mogs692Zx7UX5xzz1NXbJt+zAo7Ceu2AQ/8GNwemV5cuDO/xxBhysCBadVmKmqVJWE6DSlyDdIsqF7Gw1ZVcsqwkmoAE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195e8cde-bcd3-4347-46fd-08d7036a4971
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 06:05:32.7982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3359
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMDeQqrFr/Br5Vjrc7kkvrDjLfgRCcU1LU5rSEBOrb8=;
 b=cYI2bnEIPu9I0YizvXZFb+Td3PYjuy4ohtZS4gwT/Imn/dUNpXZBtfyAYeFh4xyJNZVu14eCuH9e5MRNaZwqBxD8RaHPB6Ibyc/EnY1se30P6A/K1v5bZDk1l2vwV7lu39+GiGffJ6z+oCZVRnqwLdS6NPTA4h8Egw03zOm5UqI=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1226957069=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1226957069==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296122EC6328742E550406EA2F60MN2PR12MB3296namp_"

--_000_MN2PR12MB3296122EC6328742E550406EA2F60MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: Saturday, July 6, 2019 5:06 AM
To: Wang, Kevin(Yang)
Cc: amd-gfx@lists.freedesktop.org; Xiao, Jack; Kenenth.Feng@amd.com; Zhang,=
 Hawking
Subject: Re: [PATCH] drm/amd/powerplay: add temperature sensor support for =
navi10

On Wed, Jul 3, 2019 at 11:02 PM Wang, Kevin(Yang) <Kevin1.Wang@amd.com> wro=
te:
>
> the hwmon interface need temperature sensor type support.
> 1. SENSOR_HOTSPOT_TEMP
> 2. SENSOR_EDGE_TEMP(SENSOR_GPU_TEMP)
> 3. SENSOR_MEM_TEMP
>
> Change-Id: I3db762e4032072fae67c95b7ba6d62e20ae5bead
> Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm=
/amd/powerplay/navi10_ppt.c
> index 7574a02350c6..d5876c2393e7 100644
> --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -1255,6 +1255,42 @@ static int navi10_set_watermarks_table(struct smu_=
context *smu,
>         return 0;
>  }
>
> +static int navi10_thermal_get_temperature(struct smu_context *smu,
> +                                            enum amd_pp_sensors sensor,
> +                                            uint32_t *value)
> +{
> +       SmuMetrics_t metrics;
> +       int ret =3D 0;
> +
> +       if (!value)
> +               return -EINVAL;
> +
> +       ret =3D smu_update_table(smu, SMU_TABLE_SMU_METRICS, (void *)&met=
rics, false);
> +       if (ret)
> +               return ret;
> +
> +       switch (sensor) {
> +       case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
> +               *value =3D metrics.TemperatureHotspot *
> +                       SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
> +               break;
> +       case AMDGPU_PP_SENSOR_GPU_TEMP:
> +       case AMDGPU_PP_SENSOR_EDGE_TEMP:
> +               *value =3D metrics.TemperatureEdge *
> +                       SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
> +               break;
> +       case AMDGPU_PP_SENSOR_MEM_TEMP:
> +               *value =3D metrics.TemperatureVrMem0 *

We should check with the SMU team.  this might be the memory voltage
regulator rather than the memory itself.

Alex

[kevin]:
sure, you are right, we should use TemperatureMem, the TemperatureVrMem0 is=
 memory voltage regular temperature.
thanks.

> +                       SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
> +               break;
> +       default:
> +               pr_err("Invalid sensor for retrieving temp\n");
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
>  static int navi10_read_sensor(struct smu_context *smu,
>                                  enum amd_pp_sensors sensor,
>                                  void *data, uint32_t *size)
> @@ -1276,6 +1312,12 @@ static int navi10_read_sensor(struct smu_context *=
smu,
>                 ret =3D navi10_get_gpu_power(smu, (uint32_t *)data);
>                 *size =3D 4;
>                 break;
> +       case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
> +       case AMDGPU_PP_SENSOR_EDGE_TEMP:
> +       case AMDGPU_PP_SENSOR_MEM_TEMP:
> +               ret =3D navi10_thermal_get_temperature(smu, sensor, (uint=
32_t *)data);
> +               *size =3D 4;
> +               break;
>         default:
>                 return -EINVAL;
>         }
> --
> 2.22.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296122EC6328742E550406EA2F60MN2PR12MB3296namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI=
 Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<div style=3D"color: rgb(0, 0, 0);">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> Saturday, July 6, 2019 5:06 AM<br>
<b>To:</b> Wang, Kevin(Yang)<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org; Xiao, Jack; Kenenth.Feng@amd.com;=
 Zhang, Hawking<br>
<b>Subject:</b> Re: [PATCH] drm/amd/powerplay: add temperature sensor suppo=
rt for navi10</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, Jul 3, 2019 at 11:02 PM Wang, Kevin(Yang) =
&lt;Kevin1.Wang@amd.com&gt; wrote:<br>
&gt;<br>
&gt; the hwmon interface need temperature sensor type support.<br>
&gt; 1. SENSOR_HOTSPOT_TEMP<br>
&gt; 2. SENSOR_EDGE_TEMP(SENSOR_GPU_TEMP)<br>
&gt; 3. SENSOR_MEM_TEMP<br>
&gt;<br>
&gt; Change-Id: I3db762e4032072fae67c95b7ba6d62e20ae5bead<br>
&gt; Signed-off-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 42 &#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;<br>
&gt;&nbsp; 1 file changed, 42 insertions(&#43;)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/=
drm/amd/powerplay/navi10_ppt.c<br>
&gt; index 7574a02350c6..d5876c2393e7 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; @@ -1255,6 &#43;1255,42 @@ static int navi10_set_watermarks_table(stru=
ct smu_context *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt; &#43;static int navi10_thermal_get_temperature(struct smu_context *smu=
,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_pp_sensors sensor,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *value)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SmuMetrics_t metrics;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!value)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_update_table(smu=
, SMU_TABLE_SMU_METRICS, (void *)&amp;metrics, false);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_HOTSPO=
T_TEMP:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; *value =3D metrics.TemperatureHotspot *<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMU_TEM=
PERATURE_UNITS_PER_CENTIGRADES;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GPU_TE=
MP:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE_T=
EMP:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; *value =3D metrics.TemperatureEdge *<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMU_TEM=
PERATURE_UNITS_PER_CENTIGRADES;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_MEM_TE=
MP:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; *value =3D metrics.TemperatureVrMem0 *<br>
<br>
We should check with the SMU team.&nbsp; this might be the memory voltage<b=
r>
regulator rather than the memory itself.<br>
<br>
Alex</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">[kevin]:</div>
<div class=3D"PlainText"><span style=3D"font-size: 11pt;">sure,&nbsp;you ar=
e right, we should use TemperatureMem, the TemperatureVrMem0 is memory volt=
age regular temperature.</span><br>
</div>
<div class=3D"PlainText">thanks.</div>
<div class=3D"PlainText"><br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMU_TEM=
PERATURE_UNITS_PER_CENTIGRADES;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; pr_err(&quot;Invalid sensor for retrieving temp\n&quot;=
);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp; static int navi10_read_sensor(struct smu_context *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_pp_sensors se=
nsor,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *data, uint32_t *=
size)<br>
&gt; @@ -1276,6 &#43;1312,12 @@ static int navi10_read_sensor(struct smu_co=
ntext *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D navi10_get_gpu_power(smu, (uint32_t *)dat=
a);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_HOTSPO=
T_TEMP:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE_T=
EMP:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_MEM_TE=
MP:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D navi10_thermal_get_temperature(smu, sensor, (ui=
nt32_t *)data);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; --<br>
&gt; 2.22.0<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; amd-gfx@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" id=
=3D"LPlnk244494" class=3D"OWAAutoLink" previewremoved=3D"true">
https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB3296122EC6328742E550406EA2F60MN2PR12MB3296namp_--

--===============1226957069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1226957069==--
