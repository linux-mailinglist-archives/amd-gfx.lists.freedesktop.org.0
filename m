Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854E9BB180
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 11:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5066E290;
	Mon, 23 Sep 2019 09:34:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820071.outbound.protection.outlook.com [40.107.82.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2132E6E290
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 09:34:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoYDU5fd4Rq+9T3AvfMH4Ejy554u8LHf6Pbt3Nr76TR+HjxuDronN1fjIbyHGMrMB2G91iDwkYjyMn03tiTfZJ6h9xD3vM39kIaR9V3KzDI4MQ+9OtLYaeOJcMDudIJ4uVJfddF+4utE632ZhoDw9KSlaWO3PpIxJY7KLhJ88wsC4uO45M34bM8RALxj2Jug3cnx1vbLr0wHSN2PSQbn3/f2cDU+SwPKsDpMyL/1LlM4mQUsV1AtZlnr0AofhTe9jIrECn9FJJcGujfLE6aGaqjP7xePmXXZWQqNf8t5yIIzbbxWjSyEFpwvstuCUmgzPYZNsPhmA3ecJ3Z/X8cxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1oy6CF6uu/9qAZJoRt+cvPPNCHUldz/34wYT98+TZo=;
 b=LC6kExxOhiEEaWLkwXFO2MVTRnAzCdJCdSqrTH1IseR3ULmEe8F7JZtLmMvYz9fIPTdyri+OyLv/k0gw5IEksOtN3M1MdCBykSfGqH6bYk2Atd6RsTJg3VTlXmpLW8ecTALWdVlTi/ubEPjwGs375LkAPWMt7EdYenQpsIfnYmT2Rp1jI0N6AFgQ2diKwceGSC63yxprRoPw+tMnVy4MhF2xvGJZDne+l9zCCgj0haaICxldI+Y2aGIQc3FPZf2ne5oAlgf1drh5gJNye0u17CgXNTRNpoC+NOUwdvUhGY904r1Cg0er1G8nXoFRWg2lGG5xDJHikva6E+XsQnHIKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3229.namprd12.prod.outlook.com (20.179.82.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Mon, 23 Sep 2019 09:34:37 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 09:34:36 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/amd/powerplay: implement interface
 set_power_profile_mode()
Thread-Topic: [PATCH 5/5] drm/amd/powerplay: implement interface
 set_power_profile_mode()
Thread-Index: AQHVcer2rKh03xjD40aei7zEFQqWXqc4/vwu
Date: Mon, 23 Sep 2019 09:34:36 +0000
Message-ID: <MN2PR12MB329609FC8076F52C45455738A2850@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>,
 <1569228167-3120-5-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569228167-3120-5-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38df27f3-2283-4a51-1657-08d74009400d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3229; 
x-ms-traffictypediagnostic: MN2PR12MB3229:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB322976D65FEE597D0BABDC04A2850@MN2PR12MB3229.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(199004)(189003)(19627405001)(71200400001)(7696005)(76176011)(71190400001)(105004)(7736002)(99286004)(6436002)(229853002)(486006)(966005)(476003)(5660300002)(6506007)(14454004)(53546011)(81166006)(52536014)(8676002)(91956017)(66476007)(81156014)(66556008)(66446008)(64756008)(186003)(26005)(446003)(102836004)(478600001)(8936002)(76116006)(11346002)(66946007)(25786009)(6116002)(3846002)(54906003)(110136005)(316002)(2906002)(66066001)(606006)(86362001)(6246003)(74316002)(256004)(4326008)(33656002)(2501003)(55016002)(6306002)(54896002)(236005)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3229;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nqO/ENweATuREj5JrCKlguMgL42AzwiP8vGtznZ4nHNQ6YCTlKMO/gqXNE3s8AkGG+ZVGHQmoRwwYeWnIXSaTgK5AiqyMsH16z1227MV6XXz6dx64uDfGY+kxmKlmAPX9Tg6rq2muhUoF4/94ymXs6OAWTcbrLuDvueRz3p3DL34p9KfC0jJCtOVJw4b3SSW+cLf2JOHUpLkyz8fPF2r8+HLWEkKiI7Gxs6Sp0iTyOxeL5Ou5jUW0jad16T/rGVn1ymnF7OVZF6R1rPZ8o1kTSFwm94Vzdc5fjfmct9abTy4u6C1BCu/fJwE8FBoHEsnBSL+GNBrPWs8DRgnhBh3yUgsNXIh4kEMTys0+tw3w4Fs2y1iRPTOygMQ7kZwh07j8FS3T1pu9HRtYkLGQDVqkt6TXbyzdxpCNJ3AAVK2HJE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38df27f3-2283-4a51-1657-08d74009400d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 09:34:36.9137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m2Qvxim8VZylEsdFF/fDsIm+9Z3qVMUnFE3ZCvjSswr+cAo61OnV7YOg8kHeXMBP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3229
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1oy6CF6uu/9qAZJoRt+cvPPNCHUldz/34wYT98+TZo=;
 b=uDOD4f9yhJ0WPONLKxIYN94fheJUK11azr8bom6ZlJttPU4wt89RNZ5qDG/lKJLW7qmYwOgKEGt2GaJtXRgNogPYxAETfOvQ4f0C8+LnVQmWVdCnKwb7gvZQSBqb9g5GYwGf9RbRxOCDifqggCD29yZJ7IWd7VeFT0yXe81hM/Y=
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
Cc: "arron.liu@amd.com" <arron.liu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: multipart/mixed; boundary="===============0372170809=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0372170809==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB329609FC8076F52C45455738A2850MN2PR12MB3296namp_"

--_000_MN2PR12MB329609FC8076F52C45455738A2850MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

comment inline.
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Liang, P=
rike <Prike.Liang@amd.com>
Sent: Monday, September 23, 2019 4:43 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: arron.liu@amd.com <arron.liu@amd.com>; Huang, Ray <Ray.Huang@amd.com>; =
Liang, Prike <Prike.Liang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Feng, K=
enneth <Kenneth.Feng@amd.com>
Subject: [PATCH 5/5] drm/amd/powerplay: implement interface set_power_profi=
le_mode()

Add set_power_profile_mode() for none manual dpm level case setting power p=
rofile mode.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c
index c6aae1c..6819514 100644
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
@@ -473,6 +473,30 @@ static int renoir_force_clk_levels(struct smu_context =
*smu,
         return ret;
 }

+static int renoir_set_power_profile_mode(struct smu_context *smu, long *in=
put, uint32_t size)
+{
+       int workload_type;
+
+       smu->power_profile_mode =3D input[size];
+
+       if (smu->power_profile_mode > PP_SMC_POWER_PROFILE_CUSTOM) {
+               pr_err("Invalid power profile mode %d\n", smu->power_profil=
e_mode);
+               return -EINVAL;
+       }
+
+       if (smu->power_profile_mode =3D=3D PP_SMC_POWER_PROFILE_CUSTOM) {
+               if (size < 0)
+                       return -EINVAL;
+
+       /* conv PP_SMC_POWER_PROFILE* to WORKLOAD_PPLIB_*_BIT */
+       workload_type =3D smu_workload_get_type(smu, smu->power_profile_mod=
e);
[kevin]:
you'd better check the return value, when this workload is unmapped, it wil=
l return -EINVAL.
+       smu_send_smc_msg_with_param(smu, SMU_MSG_SetWorkloadMask,
+                                   1 << workload_type);
[kevin]:
please check return value in smu driver every time.
after fixed:
Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
+       }
+       return 0;
+}
+
+
 static const struct pptable_funcs renoir_ppt_funcs =3D {
         .get_smu_msg_index =3D renoir_get_smu_msg_index,
         .get_smu_table_index =3D renoir_get_smu_table_index,
@@ -487,6 +511,7 @@ static const struct pptable_funcs renoir_ppt_funcs =3D =
{
         .get_workload_type =3D renoir_get_workload_type,
         .get_profiling_clk_mask =3D renoir_get_profiling_clk_mask,
         .force_clk_levels =3D renoir_force_clk_levels,
+       .set_power_profile_mode =3D renoir_set_power_profile_mode,
 };

 void renoir_set_ppt_funcs(struct smu_context *smu)
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB329609FC8076F52C45455738A2850MN2PR12MB3296namp_
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
comment inline.</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Liang, Prike &lt;Prike.Liang@=
amd.com&gt;<br>
<b>Sent:</b> Monday, September 23, 2019 4:43 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> arron.liu@amd.com &lt;arron.liu@amd.com&gt;; Huang, Ray &lt;Ray.=
Huang@amd.com&gt;; Liang, Prike &lt;Prike.Liang@amd.com&gt;; Quan, Evan &lt=
;Evan.Quan@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;<br>
<b>Subject:</b> [PATCH 5/5] drm/amd/powerplay: implement interface set_powe=
r_profile_mode()</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Add set_power_profile_mode() for none manual dpm l=
evel case setting power profile mode.<br>
<br>
Signed-off-by: Prike Liang &lt;Prike.Liang@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 25 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 25 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c<br>
index c6aae1c..6819514 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
@@ -473,6 &#43;473,30 @@ static int renoir_force_clk_levels(struct smu_cont=
ext *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static int renoir_set_power_profile_mode(struct smu_context *smu, long=
 *input, uint32_t size)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int workload_type;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;power_profile_mode =3D in=
put[size];<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu-&gt;power_profile_mode &g=
t; PP_SMC_POWER_PROFILE_CUSTOM) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pr_err(&quot;Invalid power profile mode %d\n&quot;, smu-&gt;=
power_profile_mode);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EINVAL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu-&gt;power_profile_mode =
=3D=3D PP_SMC_POWER_PROFILE_CUSTOM) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (size &lt; 0)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINV=
AL;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* conv PP_SMC_POWER_PROFILE* to =
WORKLOAD_PPLIB_*_BIT */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; workload_type =3D smu_workload_ge=
t_type(smu, smu-&gt;power_profile_mode);</div>
<div class=3D"PlainText">[kevin]:</div>
<div class=3D"PlainText">you'd better check the return value, when this wor=
kload is unmapped, it will return -EINVAL.</div>
<div class=3D"PlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_send=
_smc_msg_with_param(smu, SMU_MSG_SetWorkloadMask,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 &lt;&lt; work=
load_type);</div>
<div class=3D"PlainText">[kevin]:</div>
<div class=3D"PlainText">please check return value in smu driver every time=
.</div>
<div class=3D"PlainText">after fixed:</div>
<div class=3D"PlainText">Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt=
;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&#43;}<br>
&#43;<br>
&#43;<br>
&nbsp;static const struct pptable_funcs renoir_ppt_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_msg_index =3D ren=
oir_get_smu_msg_index,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_table_index =3D r=
enoir_get_smu_table_index,<br>
@@ -487,6 &#43;511,7 @@ static const struct pptable_funcs renoir_ppt_funcs =
=3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_workload_type =3D ren=
oir_get_workload_type,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_profiling_clk_mask =
=3D renoir_get_profiling_clk_mask,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .force_clk_levels =3D reno=
ir_force_clk_levels,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_power_profile_mode =3D renoi=
r_set_power_profile_mode,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;void renoir_set_ppt_funcs(struct smu_context *smu)<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB329609FC8076F52C45455738A2850MN2PR12MB3296namp_--

--===============0372170809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0372170809==--
