Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15210D704F
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 09:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AABB89BAE;
	Tue, 15 Oct 2019 07:40:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710081.outbound.protection.outlook.com [40.107.71.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8497789B97
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 07:40:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTNVHI3D+hrZOqeBO5RRTrWxeip4qo3tTc4yyx/zS6If7eCxxkBUAtoPrj16AKxTnXsLLaNVc+6NDb5h6xVrrKgG1ux2eWFwFqaR3kbMvChtApGfLnBCQjmJETD4TIHx3awxrTSJhJH3DB6LXFc2/nJp1+5o05BN93BBT9Ge3dRWCeJ8oTOeL5T6OHh2C3hq/MIx4R6/hlv/0rdh8pgJojRkOGKEkZRqsxJchfhwUkNqwgc6TtblbDEvQXsUYJOw7JTYATWfNX46Uu7Lsx2uKfBEEMD7qCKAgpfiZkGxi7puU0U6Fq6OdsUY+l4M/yVupc7PIuh0sHhx3MOGiZItxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D54TAtulVcUj0fpPJu9Eeuiq8DoEIAfEnncrHCxwN1I=;
 b=WcM2g004HltvNKYblWZj7Y0XgRFYGjPrAHHs/bMM9jaGlFA2J1ZcQ5vFs1m1b8S/sRDCdRzzo9arq8PmODVi/BpSJKFR992YpWxVJg1oLVMQf2Yy6CQraJFmc2wtBZHkakVptyV0JzYAjtgWLQhQZWhGABmA1kvrbna6mPQvKX4m9KRQVLo97+C0jwFCwuoSrp87BZPnr/o0v4SDbkyPBvDfsZsHj8ab63clpoZFpG3ftigM/p3RoEwxu42EnsidbSkhF21IF2p2/pSXufqm6jWP7nE6xyr3TR26hdXtUWL42rgTnt35mJm59fNs/zZSeikoXGNiPzGERXaBut0a3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB2896.namprd12.prod.outlook.com (20.179.80.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Tue, 15 Oct 2019 07:40:24 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9%6]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 07:40:24 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Gong, Curry" <Curry.Gong@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: No need to check gfxoff status after enable
 gfxoff feature
Thread-Topic: [PATCH] drm/amdgpu: No need to check gfxoff status after enable
 gfxoff feature
Thread-Index: AQHVgjsqAFqHSFR3oEqw4mXRvIpz36dbUmoD
Date: Tue, 15 Oct 2019 07:40:24 +0000
Message-ID: <MN2PR12MB32969E453B7437EBB06EE930A2930@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1571021854-25722-1-git-send-email-curry.gong@amd.com>
In-Reply-To: <1571021854-25722-1-git-send-email-curry.gong@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fae8175-64ab-48ce-74a7-08d75142f0c0
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB2896:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB28962297096DB1744632EB9AA2930@MN2PR12MB2896.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(189003)(199004)(66066001)(236005)(26005)(606006)(74316002)(76116006)(478600001)(7736002)(8676002)(91956017)(5660300002)(6306002)(71190400001)(71200400001)(66946007)(9686003)(229853002)(256004)(54896002)(14444005)(66476007)(66446008)(64756008)(66556008)(966005)(2906002)(52536014)(6506007)(86362001)(53546011)(102836004)(110136005)(25786009)(11346002)(186003)(7696005)(76176011)(446003)(486006)(14454004)(33656002)(55016002)(99286004)(316002)(3846002)(105004)(19627405001)(8936002)(6246003)(6436002)(476003)(6116002)(81166006)(2501003)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2896;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3UcScsGG4GefL52o5DG1l6tl1m0LO5Bj6jxBNCJQz0ai8BfZ13Z8N3QPyQ7uoZbTea4MIXEkp6/MMwmOM3NaRaVIkc0256SrWx6O5nc1gq19PgwS4lir0r+eK+pfchBihc8BK/jDEiZs4RwHxpMDJFhYn/Ggs/csW7xO9KMRucM+/QPsNywdFKu/3OyQ+H9KYDMi+sdGufDt6b2Sr5Y/H7x9jfCyp7ttS9kMacDBJ6hDvdC4qpgtYPMH4tU3AB2LvZgdWbJ2XUk7sLnYLub5jdXT9YmCZilCbw4QE2rrTs5V95YDpIJnOXstUeRYyEf5seXRBfZhsUPoAeYZaOpPOG4uNOWz4MVt5LONiDQepmBTD6wwKn0OF/6pdYdLXDb5oTTzFupGJrz+AzAPC7uCH3x5lc+r2TOfArbeJCaZ5vyC6vAew5UvZpUUqWd6p7pkXKN5eCJQJS8DHWLZP92RKg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fae8175-64ab-48ce-74a7-08d75142f0c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 07:40:24.3811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pTD8EiXg2sQTOeLtRuyPQy9o6u3GJBTXa9TUUZ//ce342RSaq5Bdy4hB7yTARGKP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2896
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D54TAtulVcUj0fpPJu9Eeuiq8DoEIAfEnncrHCxwN1I=;
 b=0GGQxDWpbVRIbXR+ngtSIHumyoEsS683XUaHfW5eZVkOQnUhX+d5D+M42UwuSQVHtN4jh/fiQtA24IPE5t/wzV1EZkuB5FQZgR8AvAfj3V24NlU01nzt++7sIsIL0Z52vR3UIRfhBMbJmv9o6haaZFrW/EwHYtVb37d8k9pbMxA=
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
Content-Type: multipart/mixed; boundary="===============1415436370=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1415436370==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32969E453B7437EBB06EE930A2930MN2PR12MB3296namp_"

--_000_MN2PR12MB32969E453B7437EBB06EE930A2930MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

comment inline.
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of chen gon=
g <curry.gong@amd.com>
Sent: Monday, October 14, 2019 10:57 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Gong, Curry <Curry.Gong@amd.com>
Subject: [PATCH] drm/amdgpu: No need to check gfxoff status after enable gf=
xoff feature

smu_send_smc_msg(smu, SMU_MSG_AllowGfxOff) Just turn on a switch.

As to when GPU get into "GFXoff" will be up to drawing load.

So we can not sure which state GPU should be in after enable gfxoff
feature.

Signed-off-by: chen gong <curry.gong@amd.com>
---
 drivers/gpu/drm/amd/powerplay/smu_v12_0.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/smu_v12_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v12_0.c
index c9691d0..cac4269 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v12_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v12_0.c
@@ -244,15 +244,6 @@ static int smu_v12_0_gfx_off_control(struct smu_contex=
t *smu, bool enable)
         if (enable) {
                 ret =3D smu_send_smc_msg(smu, SMU_MSG_AllowGfxOff);

-               /* confirm gfx is back to "off" state, timeout is 5 seconds=
 */
-               while (!(smu_v12_0_get_gfxoff_status(smu) =3D=3D 0)) {
-                       msleep(10);
-                       timeout--;
[kevin]:
the varible of "timeout" is not used after this patch, please remove it tog=
ether.
after fixed.
Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

-                       if (timeout =3D=3D 0) {
-                               DRM_ERROR("enable gfxoff timeout and failed=
!\n");
-                               break;
-                       }
-               }
         } else {
                 ret =3D smu_send_smc_msg(smu, SMU_MSG_DisallowGfxOff);

--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB32969E453B7437EBB06EE930A2930MN2PR12MB3296namp_
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
ounces@lists.freedesktop.org&gt; on behalf of chen gong &lt;curry.gong@amd.=
com&gt;<br>
<b>Sent:</b> Monday, October 14, 2019 10:57 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Gong, Curry &lt;Curry.Gong@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: No need to check gfxoff status after en=
able gfxoff feature</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">smu_send_smc_msg(smu, SMU_MSG_AllowGfxOff) Just tu=
rn on a switch.<br>
<br>
As to when GPU get into &quot;GFXoff&quot; will be up to drawing load.<br>
<br>
So we can not sure which state GPU should be in after enable gfxoff<br>
feature.<br>
<br>
Signed-off-by: chen gong &lt;curry.gong@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smu_v12_0.c | 9 ---------<br>
&nbsp;1 file changed, 9 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v12_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v12_0.c<br>
index c9691d0..cac4269 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smu_v12_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smu_v12_0.c<br>
@@ -244,15 &#43;244,6 @@ static int smu_v12_0_gfx_off_control(struct smu_co=
ntext *smu, bool enable)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (enable) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D smu_send_smc_msg(smu, SMU_MSG_AllowGfxOff);<b=
r>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* confirm gfx is back to &quot;off&quot; state, timeout is 5 se=
conds */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; while (!(smu_v12_0_get_gfxoff_status(smu) =3D=3D 0)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msleep(10);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout--;</div>
<div class=3D"PlainText">[kevin]:</div>
<div class=3D"PlainText">the varible of &quot;timeout&quot; is not used aft=
er this patch, please remove it together.</div>
<div class=3D"PlainText">after fixed.</div>
<div class=3D"PlainText">Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt=
;</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; if (timeout =3D=3D 0) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;enable gfxoff timeout and f=
ailed!\n&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D smu_send_smc_msg(smu, SMU_MSG_DisallowGfxOff)=
;<br>
&nbsp;<br>
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

--_000_MN2PR12MB32969E453B7437EBB06EE930A2930MN2PR12MB3296namp_--

--===============1415436370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1415436370==--
