Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54766C820
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 05:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474F76E2F3;
	Thu, 18 Jul 2019 03:47:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810079.outbound.protection.outlook.com [40.107.81.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575206E2F3
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 03:47:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gziviC3XfAQ5Zs/3HXx5KN1HbBDDhueBxi6TP2dUO0/82kai2HtEqk92HBPqRoDSEfzEVetUklAPHioPvsSUP5bcVCx59FAufHV0FRpk/pRZMfsCWrKXLXFBSqF8gXl4lbo+IADYf1SEoKms3C3YfglC5AldEpX2LPlMDqgdYFERYKS7HzGyvA6M2j/SeXA/3I35rK2cAdmhLtJiPOnA3vR2rQZvt0kUTcd0m+oVsIAMaeD4BmyfnUp8D44F7uFtfLnsV3bXO/7NURp5THW9/mYJAWpWVwP0pT2DH8uB4cUAspme87su138mVcNgBVUyVmfmuUxzCKA3scXwAfFjSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xrv1FN0v7ERl/ffahPJrc4RcKQhYRvR6Bxn3wpsLwi4=;
 b=XmLGzcgvZ2p2tM+E9emwtSrbQfyhnGESEr1H1ffcJUuIxhlN05+bqNS5/+WdejCDruKPMX9Vf73iY0fiOZGj7l4uYF+KjH6iznvyUn0ryQSXOR/96Y0DfVmcE9QR4tmK6TamIPF7XG+8ji6DucjOC7p9Vw9xc2iEP0Uof8wP+YdYGLDg4KXPU/TZlHnHM6TP7DTm8sXkWo72W96AgAcNAxN/77RRUQNQqvBDmNZkRxUm5UKLSKy958vr9VqjqIHrUj5v9ecTVcThZE6p8z2+zwlgnWXFtAkKk+7DQkOc21lRn15C92QHSqsCn06qkU+yCLxg8f+s8+xZ9/f4kasu9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1377.namprd12.prod.outlook.com (10.168.227.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 03:47:55 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c%4]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 03:47:55 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, Alex Deucher <alexdeucher@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: add sclk/uclk sensor support for vega20
Thread-Topic: [PATCH 2/2] drm/amdgpu: add sclk/uclk sensor support for vega20
Thread-Index: AQHVPKzyDAM7Q7tu0UCRzVEh16NhrKbPjoEAgAAvB2M=
Date: Thu, 18 Jul 2019 03:47:55 +0000
Message-ID: <BN6PR12MB180992420807D62D015ED4C4F7C80@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190717143540.30090-1-alexander.deucher@amd.com>
 <20190717143540.30090-2-alexander.deucher@amd.com>,
 <MN2PR12MB3344577E7EAD4F9B9E267846E4C80@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344577E7EAD4F9B9E267846E4C80@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.160.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c8b3285-c3d4-4587-357d-08d70b32b7d4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1377; 
x-ms-traffictypediagnostic: BN6PR12MB1377:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB13779125138C5BF1FD80E9CBF7C80@BN6PR12MB1377.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(199004)(189003)(13464003)(3846002)(5660300002)(14454004)(66066001)(6116002)(74316002)(25786009)(64756008)(68736007)(256004)(14444005)(11346002)(76116006)(66476007)(446003)(19627405001)(66946007)(7736002)(606006)(66556008)(966005)(66446008)(6506007)(53546011)(102836004)(110136005)(229853002)(33656002)(6436002)(52536014)(2906002)(186003)(105004)(26005)(6306002)(7696005)(81166006)(2501003)(9686003)(478600001)(8936002)(81156014)(54896002)(53936002)(236005)(71190400001)(76176011)(71200400001)(316002)(476003)(6246003)(86362001)(99286004)(8676002)(486006)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1377;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: q6jG68nMr3470i9F2E5kpMHavHrAjrhzfpq7WpRrRvzCJQ4/TnFbN+aBXYvxRmvjRRPujgyFTkSuYye91oGZUPmy6ZPcI1QFdYIECkTv+WocU2EuWO5c/82obI/WryxD54+WLLbD6L/aqdGghRPFUfau+iBLTO9wjOqnHQ+lbu9pDx5gpLhgfg3iw3FtlufdTOX0+9ckMtkeD8lEdVwuUmTjIK1Wr1amREMQTYUIpSL840I6rtEgKYC78Y6iVRJv9Z6jstZMHd5d5FXgvrddu0Eelk4h//Io2MFOdlf1ywEmKG9mBY0kvXOD9rXTXSu6Jk9JwlD4wl0fCewg3CpsF4fv74NPgwOhlZTgq5IOcJVP+5MOsoVa7/x1u1hYWqJye+NCkPyal+Up+4JtuLvTD1AruNnY2s0Il0xICX9Ofxs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8b3285-c3d4-4587-357d-08d70b32b7d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 03:47:55.4743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1377
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xrv1FN0v7ERl/ffahPJrc4RcKQhYRvR6Bxn3wpsLwi4=;
 b=LaH0zKKahPuzRgXH2Zbjo/+uBYT4LJM7QJc+pYq8ozBr9uUhMY3XnFURcT37+vpACX/QOvCdKD4sUhH9xDwFqJjyP1xzPFjOogB0sptnQNdCgvDJX9b/XHMhfFgEQHfwDSE9As21pdBqnPBtXFZSC3meUeZdMEdILEy9DQD6sQg=
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
Content-Type: multipart/mixed; boundary="===============1234995312=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1234995312==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB180992420807D62D015ED4C4F7C80BN6PR12MB1809namp_"

--_000_BN6PR12MB180992420807D62D015ED4C4F7C80BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ah, I missed that they were already handled in smu_v11_0.c.  In that case, =
I think I can drop these patches.

Alex
________________________________
From: Quan, Evan
Sent: Wednesday, July 17, 2019 8:58 PM
To: Alex Deucher; amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander
Subject: RE: [PATCH 2/2] drm/amdgpu: add sclk/uclk sensor support for vega2=
0

I think the AMDGPU_PP_SENSOR_GFX_SCLK and AMDGPU_PP_SENSOR_GFX_MCLK request=
s are handled in smu_v11_0_read_sensor.
It means it cannot reach navi10_ppt.c and vega20_ppt.c.
Maybe this should be fixed in smu_v11_0_read_sensor.

Regards,
Evan
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex
> Deucher
> Sent: Wednesday, July 17, 2019 10:36 PM
> To: amd-gfx@lists.freedesktop.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
> Subject: [PATCH 2/2] drm/amdgpu: add sclk/uclk sensor support for vega20
>
> Query the metrics table to get the average sclk and uclk.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/vega20_ppt.c | 35
> ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> index 9204e4e50d09..763d73af6cd1 100644
> --- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> @@ -3117,6 +3117,36 @@ static int vega20_thermal_get_temperature(struct
> smu_context *smu,
>
>        return 0;
>  }
> +
> +static int vega20_get_avg_clocks(struct smu_context *smu,
> +                              enum amd_pp_sensors sensor,
> +                              uint32_t *value)
> +{
> +     SmuMetrics_t metrics;
> +     int ret =3D 0;
> +
> +     if (!value)
> +             return -EINVAL;
> +
> +     ret =3D smu_update_table(smu, SMU_TABLE_SMU_METRICS, (void
> *)&metrics, false);
> +     if (ret)
> +             return ret;
> +
> +     switch (sensor) {
> +     case AMDGPU_PP_SENSOR_GFX_SCLK:
> +             *value =3D metrics.AverageGfxclkFrequency * 100;
> +             break;
> +     case AMDGPU_PP_SENSOR_GFX_MCLK:
> +             *value =3D metrics.AverageUclkFrequency * 100;
> +             break;
> +     default:
> +             pr_err("Invalid sensor for retrieving avg clock\n");
> +             return -EINVAL;
> +     }
> +
> +     return 0;
> +}
> +
>  static int vega20_read_sensor(struct smu_context *smu,
>                                 enum amd_pp_sensors sensor,
>                                 void *data, uint32_t *size)
> @@ -3147,6 +3177,11 @@ static int vega20_read_sensor(struct smu_context
> *smu,
>                ret =3D vega20_thermal_get_temperature(smu, sensor,
> (uint32_t *)data);
>                *size =3D 4;
>                break;
> +     case AMDGPU_PP_SENSOR_GFX_SCLK:
> +     case AMDGPU_PP_SENSOR_GFX_MCLK:
> +             ret =3D vega20_get_avg_clocks(smu, sensor, (uint32_t *)data=
);
> +             *size =3D 4;
> +             break;
>        default:
>                return -EINVAL;
>        }
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB180992420807D62D015ED4C4F7C80BN6PR12MB1809namp_
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
Ah, I missed that they were already handled in smu_v11_0.c.&nbsp; In that c=
ase, I think I can drop these patches.</div>
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
<b>Sent:</b> Wednesday, July 17, 2019 8:58 PM<br>
<b>To:</b> Alex Deucher; amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Deucher, Alexander<br>
<b>Subject:</b> RE: [PATCH 2/2] drm/amdgpu: add sclk/uclk sensor support fo=
r vega20</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">I think the AMDGPU_PP_SENSOR_GFX_SCLK and AMDGPU_P=
P_SENSOR_GFX_MCLK requests are handled in smu_v11_0_read_sensor.<br>
It means it cannot reach navi10_ppt.c and vega20_ppt.c.<br>
Maybe this should be fixed in smu_v11_0_read_sensor.<br>
<br>
Regards,<br>
Evan<br>
&gt; -----Original Message-----<br>
&gt; From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; On Behalf =
Of Alex<br>
&gt; Deucher<br>
&gt; Sent: Wednesday, July 17, 2019 10:36 PM<br>
&gt; To: amd-gfx@lists.freedesktop.org<br>
&gt; Cc: Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
&gt; Subject: [PATCH 2/2] drm/amdgpu: add sclk/uclk sensor support for vega=
20<br>
&gt; <br>
&gt; Query the metrics table to get the average sclk and uclk.<br>
&gt; <br>
&gt; Signed-off-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/vega20_ppt.c | 35<br>
&gt; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; 1 file changed, 35 insertions(&#43;)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&gt; index 9204e4e50d09..763d73af6cd1 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&gt; @@ -3117,6 &#43;3117,36 @@ static int vega20_thermal_get_temperature(s=
truct<br>
&gt; smu_context *smu,<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;static int vega20_get_avg_clocks(struct smu_context *smu,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_pp_sensors sensor,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *value)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; SmuMetrics_t metrics;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!value)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return -EINVAL;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_update_table(smu, SMU_TABLE_=
SMU_METRICS, (void<br>
&gt; *)&amp;metrics, false);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return ret;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GFX_SCLK:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; *value =3D metrics.AverageGfxclkFrequency * 100;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GFX_MCLK:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; *value =3D metrics.AverageUclkFrequency * 100;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; pr_err(&quot;Invalid sensor for retrieving avg clock\n&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return -EINVAL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp; static int vega20_read_sensor(struct smu_context *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_pp_sensors sensor,<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *data, uint32_t *size)<=
br>
&gt; @@ -3147,6 &#43;3177,11 @@ static int vega20_read_sensor(struct smu_co=
ntext<br>
&gt; *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D vega20_thermal_get_temperature(smu, sensor,<br>
&gt; (uint32_t *)data);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GFX_SCLK:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GFX_MCLK:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D vega20_get_avg_clocks(smu, sensor, (uint32_t *)data);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; *size =3D 4;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; amd-gfx@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">htt=
ps://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB180992420807D62D015ED4C4F7C80BN6PR12MB1809namp_--

--===============1234995312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1234995312==--
