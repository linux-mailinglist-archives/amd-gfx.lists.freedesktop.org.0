Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB075F1B5
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 05:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCCC6E248;
	Thu,  4 Jul 2019 03:08:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750055.outbound.protection.outlook.com [40.107.75.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F0F6E21B
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 03:08:42 +0000 (UTC)
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3695.namprd12.prod.outlook.com (10.255.86.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 03:08:40 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 03:08:40 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu/navi10: add thermal sensor support for
 navi10
Thread-Topic: [PATCH 2/2] drm/amdgpu/navi10: add thermal sensor support for
 navi10
Thread-Index: AQHVMhRg/dWML5Nv7k6aNVEgD+Lkq6a5xfZy
Date: Thu, 4 Jul 2019 03:08:40 +0000
Message-ID: <MN2PR12MB32963703BFA4EF02F35864E8A2FA0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190704025822.18970-1-alexander.deucher@amd.com>,
 <20190704025822.18970-2-alexander.deucher@amd.com>
In-Reply-To: <20190704025822.18970-2-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c312d6b-bb2e-431a-57bb-08d7002cea80
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3695; 
x-ms-traffictypediagnostic: MN2PR12MB3695:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3695D5E2D16892254F52B7D3A2FA0@MN2PR12MB3695.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(199004)(189003)(53936002)(54896002)(102836004)(229853002)(9686003)(68736007)(33656002)(7696005)(72206003)(186003)(8936002)(236005)(966005)(316002)(14454004)(81166006)(74316002)(3846002)(53546011)(81156014)(606006)(26005)(8676002)(6306002)(55016002)(6506007)(2501003)(6436002)(76176011)(73956011)(66446008)(110136005)(71190400001)(64756008)(99286004)(7736002)(4326008)(486006)(256004)(446003)(11346002)(66066001)(2906002)(19627405001)(476003)(52536014)(6246003)(66476007)(5660300002)(25786009)(71200400001)(1015004)(6606003)(478600001)(66946007)(76116006)(66556008)(14444005)(6116002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3695;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OxdTl5byGIe1VTQ3KGjNOesHqamXqhW9HBCU+dfJ6TUajS25IkkO6HP02gDM//mBpdlkxfUvcl2NT0hWb561XjOL4gPk6rc7rPy89gpnt2Py2YR5JIwHMrxJwTpLp02AYUVPR4bSWEEpd+9Yovgf6Nwai1xakL9U/q8h5rNJ9IjISzOckRIge3cLzMpHNaByt1I74ScTGvToPGnT616vXiOzzYjAeGJj6uC7Sh52VTLWxEb7sEKKzZPhH+Wk45Xz+TIc9mb0T78MYaGE7QP2LWA3Fzqy8aRj8T1Xz4P5YZdq106fC2Pnv+9Oj+vosLr2w8zr02ivn0kk8lu82WUm3mwnxApcf0Z9cR2JwH4PYCeH47rWEuufqBz5ZVFB3ZKU7Jxr2lLGpu6SI4Zx7JwcNWRRNVDBikpWgb1Xop8vhbM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c312d6b-bb2e-431a-57bb-08d7002cea80
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 03:08:40.7486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3695
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7qH759SZwFEjrh5u8FOAqv3d72E7XvCM2KEmP86HMQ=;
 b=1O5jTV1p6L2gF+j0Cd7x7aPf19OVydnjaM0Xm9KeA86ZWE1C8N4tjO9nkzAEKF6+Yliep4RhYm4yjWP6wp0wWVLFef7L1JnBJlKni3svjc5gwAz1D1UBEAigv4ayzM1319RtnLiUl74LWWPxueXlwN4kA89wffgnwDOtVrMxbus=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============0777942423=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0777942423==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32963703BFA4EF02F35864E8A2FA0MN2PR12MB3296namp_"

--_000_MN2PR12MB32963703BFA4EF02F35864E8A2FA0MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Alex Deu=
cher <alexdeucher@gmail.com>
Sent: Thursday, July 4, 2019 10:58:22 AM
To: amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander
Subject: [PATCH 2/2] drm/amdgpu/navi10: add thermal sensor support for navi=
10

This was dropped when the code was refactored.  Re-add it
for navi10.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index 5794f7cef1c8..34fbc4be224c 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -900,6 +900,42 @@ static int navi10_get_current_activity_percent(struct =
smu_context *smu,
         return 0;
 }

+static int navi10_thermal_get_temperature(struct smu_context *smu,
+                                         enum amd_pp_sensors sensor,
+                                         uint32_t *value)
+{
+       int ret =3D 0;
+       SmuMetrics_t metrics;
+
+       if (!value)
+               return -EINVAL;
+
+       ret =3D smu_update_table(smu, SMU_TABLE_SMU_METRICS, (void *)&metri=
cs,
+                              false);
+       if (ret)
+               return ret;
+
+       switch (sensor) {
+       case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
+               *value =3D metrics.TemperatureHotspot *
+                       SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+               break;
+       case AMDGPU_PP_SENSOR_EDGE_TEMP:
+               *value =3D metrics.TemperatureEdge *
+                       SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+               break;
+       case AMDGPU_PP_SENSOR_MEM_TEMP:
+               *value =3D metrics.TemperatureMem *
+                       SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
[kevin]:
the TemperatureMem is not valid for navi10, (it always return 0, it maybe w=
ork on HBM type of Memmory, but navi10 is DDR6),
and we can use TemperatureVrMem0 to replace it , and it is verify on my loc=
al side.

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

+               break;
+       default:
+               pr_err("Invalid sensor for retrieving temp\n");
+               return -EINVAL;
+       }
+
+       return 0;
+}
+
 static bool navi10_is_dpm_running(struct smu_context *smu)
 {
         int ret =3D 0;
@@ -1280,6 +1316,12 @@ static int navi10_read_sensor(struct smu_context *sm=
u,
                 ret =3D navi10_get_gpu_power(smu, (uint32_t *)data);
                 *size =3D 4;
                 break;
+       case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
+       case AMDGPU_PP_SENSOR_EDGE_TEMP:
+       case AMDGPU_PP_SENSOR_MEM_TEMP:
+               ret =3D navi10_thermal_get_temperature(smu, sensor, (uint32=
_t *)data);
+               *size =3D 4;
+               break;
         default:
                 return -EINVAL;
         }
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
amd-gfx Info Page - freedesktop.org<https://lists.freedesktop.org/mailman/l=
istinfo/amd-gfx>
lists.freedesktop.org
To see the collection of prior postings to the list, visit the amd-gfx Arch=
ives.. Using amd-gfx: To post a message to all the list members, send email=
 to amd-gfx@lists.freedesktop.org. You can subscribe to the list, or change=
 your existing subscription, in the sections below.


--_000_MN2PR12MB32963703BFA4EF02F35864E8A2FA0MN2PR12MB3296namp_
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
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
<p style=3D"margin-top:0; margin-bottom:0"></p>
</div>
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Alex Deucher &lt;alexdeucher@=
gmail.com&gt;<br>
<b>Sent:</b> Thursday, July 4, 2019 10:58:22 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Deucher, Alexander<br>
<b>Subject:</b> [PATCH 2/2] drm/amdgpu/navi10: add thermal sensor support f=
or navi10</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">This was dropped when the code was refactored.&nbs=
p; Re-add it<br>
for navi10.<br>
<br>
Signed-off-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 42 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;<br>
&nbsp;1 file changed, 42 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index 5794f7cef1c8..34fbc4be224c 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -900,6 &#43;900,42 @@ static int navi10_get_current_activity_percent(str=
uct smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static int navi10_thermal_get_temperature(struct smu_context *smu,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; enum amd_pp_sensors sensor,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; uint32_t *value)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SmuMetrics_t metrics;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!value)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EINVAL;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_update_table(smu, SMU=
_TABLE_SMU_METRICS, (void *)&amp;metrics,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; false);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return ret;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_HOTSPOT_TEM=
P:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *value =3D metrics.TemperatureHotspot *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMU_TEMPERAT=
URE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE_TEMP:<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *value =3D metrics.TemperatureEdge *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMU_TEMPERAT=
URE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_MEM_TEMP:<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *value =3D metrics.TemperatureMem *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMU_TEMPERAT=
URE_UNITS_PER_CENTIGRADES;</div>
<div class=3D"PlainText">[kevin]:</div>
<div class=3D"PlainText">the TemperatureMem is not valid for navi10, (it al=
ways return 0,&nbsp;it maybe work on HBM type of Memmory, but navi10 is DDR=
6),&nbsp;</div>
<div class=3D"PlainText">and&nbsp;we can use TemperatureVrMem0 to replace i=
t ,&nbsp;<span style=3D"font-size: 11pt;">and it is verify on my local side=
.</span></div>
<div class=3D"PlainText"><span style=3D"font-size: 11pt;"><br>
</span></div>
<div class=3D"PlainText"><span style=3D"font-size: 11pt;">Reviewed-by: Kevi=
n Wang &lt;kevin1.wang@amd.com&gt;</span></div>
<div class=3D"PlainText"><span style=3D"font-size: 11pt;"><br>
</span></div>
<div class=3D"PlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pr_err(&quot;Invalid sensor for retrieving temp\n&quot;);<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EINVAL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&#43;}<br>
&#43;<br>
&nbsp;static bool navi10_is_dpm_running(struct smu_context *smu)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
@@ -1280,6 &#43;1316,12 @@ static int navi10_read_sensor(struct smu_context=
 *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D navi10_get_gpu_power(smu, (uint32_t *)data);<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_HOTSPOT_TEM=
P:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE_TEMP:<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_MEM_TEMP:<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D navi10_thermal_get_temperature(smu, sensor, (uint32_=
t *)data);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *size =3D 4;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" id=3D"LP=
lnk805217" class=3D"OWAAutoLink" previewremoved=3D"true">https://lists.free=
desktop.org/mailman/listinfo/amd-gfx</a></div>
<div id=3D"LPBorder_GT_15622094299570.11102941130760224" style=3D"margin-bo=
ttom: 20px; overflow: auto; width: 100%; text-indent: 0px;">
<table id=3D"LPContainer_15622094299540.2215000847637547" role=3D"presentat=
ion" cellspacing=3D"0" style=3D"width: 90%; background-color: rgb(255, 255,=
 255); position: relative; overflow: auto; padding-top: 20px; padding-botto=
m: 20px; margin-top: 20px; border-top: 1px dotted rgb(200, 200, 200); borde=
r-bottom: 1px dotted rgb(200, 200, 200);">
<tbody>
<tr valign=3D"top" style=3D"border-spacing: 0px;">
<td id=3D"TextCell_15622094299550.3524786187650355" colspan=3D"2" style=3D"=
vertical-align: top; position: relative; padding: 0px; display: table-cell;=
">
<div id=3D"LPRemovePreviewContainer_15622094299550.24225763815885237"></div=
>
<div id=3D"LPTitle_15622094299550.8314314712189494" style=3D"top: 0px; colo=
r: rgb(0, 120, 215); font-weight: 400; font-size: 21px; font-family: wf_seg=
oe-ui_light, &quot;Segoe UI Light&quot;, &quot;Segoe WP Light&quot;, &quot;=
Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif; line-heigh=
t: 21px;">
<a id=3D"LPUrlAnchor_15622094299550.7160588938640886" href=3D"https://lists=
.freedesktop.org/mailman/listinfo/amd-gfx" target=3D"_blank" style=3D"text-=
decoration: none;">amd-gfx Info Page - freedesktop.org</a></div>
<div id=3D"LPMetadata_15622094299560.8015893318876648" style=3D"margin: 10p=
x 0px 16px; color: rgb(102, 102, 102); font-weight: 400; font-family: wf_se=
goe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, s=
ans-serif; font-size: 14px; line-height: 14px;">
lists.freedesktop.org</div>
<div id=3D"LPDescription_15622094299570.8921265146219484" style=3D"display:=
 block; color: rgb(102, 102, 102); font-weight: 400; font-family: wf_segoe-=
ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-=
serif; font-size: 14px; line-height: 20px; max-height: 100px; overflow: hid=
den;">
To see the collection of prior postings to the list, visit the amd-gfx Arch=
ives.. Using amd-gfx: To post a message to all the list members, send email=
 to amd-gfx@lists.freedesktop.org. You can subscribe to the list, or change=
 your existing subscription, in
 the sections below.</div>
</td>
</tr>
</tbody>
</table>
</div>
<br>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB32963703BFA4EF02F35864E8A2FA0MN2PR12MB3296namp_--

--===============0777942423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0777942423==--
