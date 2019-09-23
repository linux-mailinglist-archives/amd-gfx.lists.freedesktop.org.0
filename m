Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B3EBB158
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 11:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1996E290;
	Mon, 23 Sep 2019 09:25:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740050.outbound.protection.outlook.com [40.107.74.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002C56E290
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 09:25:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWqo8gzTNFK+RNSuEZDs/xjsChYC7TMI8bhL4ctxyUEVA2e64CmgtKbkwgKbbK1LHbWEEB1nddczLfrx22KtB7HlFepd6wMfHkvfUO853iL0lMnRnNxvFN5Wl0QJU8DPkJMz4n4eKU+CO56Z5w62IX46uqJ9N6AG4qqmm9PON+vldzho6B9LX488gcLt3NqXIMJ8iDrG9IuwDco2Pqm849+D/k/UNKFvq/RoSpQVn03PN1+yUs5GJJQvGwMumDTDKij2B5J08RV7V2bEwN9HQ7jg4aKHXty8ImbMyDlhWfx2QtBies3l0s0ErKXlhpQZFCOdotDRi9WcRleoQFAhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIBMoEhUWhiH4OpFm4O0Jl84FThcsUlezcUThJ8D8bg=;
 b=fUTv1hS8ivpJPRRaLCoIwPJPZNS0NjWXllCf0CKhkodJJCfMllqtbHTXDHPXYuOgxmRYc9kS82LQJ/cAUg9M4GYLfCHsLmbIe6elQfzzgu2cGbGUzK1ztns4/ye0v2HsJ1t80qLQ4l1w1LJwtkBMclbfzqlxxdKYbwJFYbKEl32jyCKBtNIy/U2XjLB3tqtgJreLLk4+UYwydy18xPpiF2LGOo3xgsl7GJokqCP0d9FYUBF0RhV4RYzEpADpMUIcGktuTOysQSW1lvfgSmx8ZebnjWfqOs2a+Kb3g0rVT25Mc806aayDzi5cgfYdZI6OUUJG69Qppiz73IfsocM8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB2864.namprd12.prod.outlook.com (20.179.81.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Mon, 23 Sep 2019 09:25:09 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 09:25:09 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/amd/powerplay: add interface for getting workload
 type
Thread-Topic: [PATCH 3/5] drm/amd/powerplay: add interface for getting
 workload type
Thread-Index: AQHVcerzI373Iug9hkWDPNh044+Ztac4/aue
Date: Mon, 23 Sep 2019 09:25:09 +0000
Message-ID: <MN2PR12MB3296E79B53B6AE2974C534CCA2850@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>,
 <1569228167-3120-3-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569228167-3120-3-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d868fa6c-296b-4908-4201-08d74007edbf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2864; 
x-ms-traffictypediagnostic: MN2PR12MB2864:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2864896FE8FD66139BDD49B3A2850@MN2PR12MB2864.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(199004)(189003)(3846002)(26005)(6436002)(236005)(53546011)(6506007)(52536014)(8936002)(99286004)(25786009)(76176011)(7696005)(5660300002)(478600001)(229853002)(486006)(14454004)(19627405001)(476003)(81166006)(8676002)(81156014)(102836004)(446003)(11346002)(2906002)(186003)(33656002)(66066001)(54906003)(66556008)(110136005)(316002)(66476007)(6246003)(64756008)(66446008)(2501003)(966005)(4326008)(74316002)(7736002)(14444005)(256004)(86362001)(76116006)(105004)(71190400001)(9686003)(91956017)(71200400001)(6306002)(6116002)(66946007)(55016002)(54896002)(606006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2864;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NVxHJfw5jtnPp/LpMsmHMam+mVK4fdJcqtBcJnsemwcGQuKbUV95/AjdCRVl9mCMGs7Q7dplvanlZ5y7Cb4mJyjtsESfoz6fzn2FOf7cF0nuJx/royYi3vH0QcSP52MuWypPX5rgvbpbzK8fSAMbjyl4gzsozGrt/3Fr/m7nRciw/E69cYxPhT5xhWfqqeS6a75c60bMs2sHN8z8TkSjUembgzasYX7sG1MA2sOIXNiOqLy7CxkmxCdcKGndaCplBFQq0B1Z+Fr1VX0fG5vR2uC8dYgyffN7+RTQB/rmPpVbXWzzXm7ulnzj9+jyXQcd/sgqRsCnw+d91WG7EaK1GE2ljh0/NBuXs1DbpK9Smfk+z/wx124lyUKvjG9u34We1lk6JnCGcGLu3k8jGNmK2RJ4WDDIPqsxbKHliUOoYNM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d868fa6c-296b-4908-4201-08d74007edbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 09:25:09.1469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vm76rmMxMfG3ZEKboKsdhBDeWkLco1d1MMDiMbq+v1mR0KLsqBARulIPU7VlQBC+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2864
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIBMoEhUWhiH4OpFm4O0Jl84FThcsUlezcUThJ8D8bg=;
 b=lKPetrzhmfLiRCWa2yXOzTcH1TtPLoDuVhyLuDzYn3ykomergg+fbbMU7gp7XczO0W0cM1bEtljTuSkY5BkNcXCZkRaqYwbKeXYxVU4erHI+MvnJHgDhYCsbY6S3r5lDmeYUc09H+hFPk82pKky7SKoPdIPTzHy2y5X/iv+7BOE=
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
Content-Type: multipart/mixed; boundary="===============0450155697=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0450155697==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296E79B53B6AE2974C534CCA2850MN2PR12MB3296namp_"

--_000_MN2PR12MB3296E79B53B6AE2974C534CCA2850MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Liang, P=
rike <Prike.Liang@amd.com>
Sent: Monday, September 23, 2019 4:43 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: arron.liu@amd.com <arron.liu@amd.com>; Huang, Ray <Ray.Huang@amd.com>; =
Liang, Prike <Prike.Liang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Feng, K=
enneth <Kenneth.Feng@amd.com>
Subject: [PATCH 3/5] drm/amd/powerplay: add interface for getting workload =
type

The workload type was got from the input of power profile mode.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 29 ++++++++++++++++++++++++++=
+++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c
index 4bb7e1c..f87aa56 100644
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
@@ -364,6 +364,34 @@ static int renoir_unforce_dpm_levels(struct smu_contex=
t *smu) {
         return ret;
 }

+static int renoir_get_workload_type(struct smu_context *smu, uint32_t prof=
ile)
+{
+
+       uint32_t  pplib_workload =3D 0;
+
+       switch (profile) {
+       case PP_SMC_POWER_PROFILE_FULLSCREEN3D:
+               pplib_workload =3D WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT;
+               break;
+       case PP_SMC_POWER_PROFILE_CUSTOM:
+               pplib_workload =3D WORKLOAD_PPLIB_COUNT;
+               break;
+       case PP_SMC_POWER_PROFILE_VIDEO:
+               pplib_workload =3D WORKLOAD_PPLIB_VIDEO_BIT;
+               break;
+       case PP_SMC_POWER_PROFILE_VR:
+               pplib_workload =3D WORKLOAD_PPLIB_VR_BIT;
+               break;
+       case PP_SMC_POWER_PROFILE_COMPUTE:
+               pplib_workload =3D WORKLOAD_PPLIB_COMPUTE_BIT;
+               break;
+       default:
+               return -EINVAL;
+       }
+
+       return pplib_workload;
+}
+
 static const struct pptable_funcs renoir_ppt_funcs =3D {
         .get_smu_msg_index =3D renoir_get_smu_msg_index,
         .get_smu_table_index =3D renoir_get_smu_table_index,
@@ -375,6 +403,7 @@ static const struct pptable_funcs renoir_ppt_funcs =3D =
{
         .dpm_set_uvd_enable =3D renoir_dpm_set_uvd_enable,
         .force_dpm_limit_value =3D renoir_force_dpm_limit_value,
         .unforce_dpm_levels =3D renoir_unforce_dpm_levels,
+       .get_workload_type =3D renoir_get_workload_type,
 };

 void renoir_set_ppt_funcs(struct smu_context *smu)
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296E79B53B6AE2974C534CCA2850MN2PR12MB3296namp_
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
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.=
com&gt;</span><br>
</div>
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
<b>Subject:</b> [PATCH 3/5] drm/amd/powerplay: add interface for getting wo=
rkload type</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">The workload type was got from the input of power =
profile mode.<br>
<br>
Signed-off-by: Prike Liang &lt;Prike.Liang@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 29 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 29 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c<br>
index 4bb7e1c..f87aa56 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
@@ -364,6 &#43;364,34 @@ static int renoir_unforce_dpm_levels(struct smu_co=
ntext *smu) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static int renoir_get_workload_type(struct smu_context *smu, uint32_t =
profile)<br>
&#43;{<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t&nbsp; pplib_workload =3D=
 0;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (profile) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_SMC_POWER_PROFILE_FULLSCR=
EEN3D:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pplib_workload =3D WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_SMC_POWER_PROFILE_CUSTOM:=
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pplib_workload =3D WORKLOAD_PPLIB_COUNT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_SMC_POWER_PROFILE_VIDEO:<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pplib_workload =3D WORKLOAD_PPLIB_VIDEO_BIT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_SMC_POWER_PROFILE_VR:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pplib_workload =3D WORKLOAD_PPLIB_VR_BIT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_SMC_POWER_PROFILE_COMPUTE=
:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pplib_workload =3D WORKLOAD_PPLIB_COMPUTE_BIT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EINVAL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return pplib_workload;<br>
&#43;}<br>
&#43;<br>
&nbsp;static const struct pptable_funcs renoir_ppt_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_msg_index =3D ren=
oir_get_smu_msg_index,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_table_index =3D r=
enoir_get_smu_table_index,<br>
@@ -375,6 &#43;403,7 @@ static const struct pptable_funcs renoir_ppt_funcs =
=3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dpm_set_uvd_enable =3D re=
noir_dpm_set_uvd_enable,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .force_dpm_limit_value =3D=
 renoir_force_dpm_limit_value,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .unforce_dpm_levels =3D re=
noir_unforce_dpm_levels,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_workload_type =3D renoir_get=
_workload_type,<br>
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

--_000_MN2PR12MB3296E79B53B6AE2974C534CCA2850MN2PR12MB3296namp_--

--===============0450155697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0450155697==--
