Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D0C63EE1
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 03:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D804898CE;
	Wed, 10 Jul 2019 01:17:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770082.outbound.protection.outlook.com [40.107.77.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E29E898CE
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 01:17:02 +0000 (UTC)
Received: from BN8PR12MB3329.namprd12.prod.outlook.com (20.178.210.206) by
 BN8PR12MB2962.namprd12.prod.outlook.com (20.178.208.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 10 Jul 2019 01:16:59 +0000
Received: from BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::347f:8a8d:c0d4:823c]) by BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::347f:8a8d:c0d4:823c%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 01:16:59 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: increase the SMU msg response waiting
 time
Thread-Topic: [PATCH] drm/amd/powerplay: increase the SMU msg response waiting
 time
Thread-Index: AQHVNhkB8fKrHx6yIkyZsQjQB3y7vqbCOtmAgADQoJA=
Date: Wed, 10 Jul 2019 01:16:59 +0000
Message-ID: <BN8PR12MB33290CA144CF8883E42E8E0FE4F00@BN8PR12MB3329.namprd12.prod.outlook.com>
References: <20190709054111.11433-1-evan.quan@amd.com>
 <BN6PR12MB180934CC91BC9A2A3C393AC2F7F10@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB180934CC91BC9A2A3C393AC2F7F10@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 179ff0b7-3566-4995-5f57-08d704d44ed5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB2962; 
x-ms-traffictypediagnostic: BN8PR12MB2962:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BN8PR12MB2962E87A119110E56A4B0D3DE4F00@BN8PR12MB2962.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(189003)(199004)(14444005)(2501003)(52536014)(486006)(74316002)(256004)(25786009)(5660300002)(6436002)(9326002)(478600001)(68736007)(7736002)(33656002)(66066001)(966005)(186003)(446003)(53936002)(26005)(11346002)(86362001)(476003)(99286004)(81166006)(81156014)(8676002)(236005)(76176011)(102836004)(6246003)(6506007)(53546011)(64756008)(71190400001)(66446008)(2906002)(66946007)(14454004)(9686003)(66556008)(229853002)(66476007)(4326008)(606006)(7696005)(76116006)(71200400001)(6306002)(55016002)(54906003)(6116002)(3846002)(54896002)(110136005)(790700001)(8936002)(316002)(69900200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2962;
 H:BN8PR12MB3329.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lcBbixx7SEW/UyZx5HnHWWXRFBJPz/+CwjZQJaZFd0D4odUU+8yxluKC2SI+k/My4uHZswjBtSyILQrIz60O3dKATCzP9/fmcJ3nMOLiNyKj1tRDAueNXh+y79zyGsPX8Z2Y3Hnz8xbjDRdRBXUDbiASILjRpdhnGpzMNexZ+Zk5PGxVvao27JVUD7s8VlIu3IxqmfOgstpGSsGuclGxvC+QWaKs7UIj/NTCJLhiFHP3sa+WRRyoibucjOmcnJoxeSsRUEQ91pElAXJQCa9DWIFL40YlGIl5UGuYWFQLekBVqsl/UluklCKe7KxSVL4HrBgbkk8FpNSit2u5l4ezSJaJ4aIf4BZZZ+GDFToYDZRwSi7dJgjSecpSh0NUyZ6kamMat3hyzzpx+ZBVV88p7GKCf9yUQIgK420CyH7uLA8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 179ff0b7-3566-4995-5f57-08d704d44ed5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 01:16:59.7379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2962
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ex1tNKdhszn9LK2dmT968B+srdAv3m2zL/+1RajZ0kE=;
 b=G6yNMJVZMI65zMRtuNSM0tSrnI2TbxBLD9zwCbaKbF3QgUk7gRdOWmg9w27+pWneZ3V99EsBHF0UDzcOXSkhPSzGFKiKaVc880G54vQ4REXl5ADYVIaptwFCRTlbOxS+YYcb7xY9FyjUQcuQC5+chcKMuQdQ9MJ4+1+bOwfc7vY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Wu,
 Xiaowei" <Xiaowei.Wu@amd.com>
Content-Type: multipart/mixed; boundary="===============1805878101=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1805878101==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB33290CA144CF8883E42E8E0FE4F00BN8PR12MB3329namp_"

--_000_BN8PR12MB33290CA144CF8883E42E8E0FE4F00BN8PR12MB3329namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

There are actually two MAX_USEC_TIMEOUT related macros.
AMD_MAX_USEC_TIMEOUT is used for SMU and AMDGPU_MAX_USEC_TIMEOUT is used wi=
dely in other parts.
Maybe you mistreated it as  AMDGPU_MAX_USEC_TIMEOUT. I was confused by them=
 too.

drivers/gpu/drm/amd/include/amd_shared.h:29:#define AMD_MAX_USEC_TIMEOUT   =
             200000  /* 200 ms */
drivers/gpu/drm/amd/amdgpu/amdgpu.h:179:#define AMDGPU_MAX_USEC_TIMEOUT    =
             100000  /* 100 ms */

I'm considering to sort these timeout settings up later. Maybe to combine t=
hem as one or give them differentiated names.

Regards,
Evan
From: Deucher, Alexander <Alexander.Deucher@amd.com>
Sent: Tuesday, July 09, 2019 8:41 PM
To: Quan, Evan <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Wu, Xiaowei <Xiaowei.Wu=
@amd.com>
Subject: Re: [PATCH] drm/amd/powerplay: increase the SMU msg response waiti=
ng time

If this is just for the SMU, maybe it would be better to add a separate tim=
eout for the SMU since this will increase the timeout for lots of things, u=
nless we need an overall timeout increase for mode1 reset.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Evan Quan <evan.quan@amd.com<mailto:e=
van.quan@amd.com>>
Sent: Tuesday, July 9, 2019 1:41 AM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander; Grodzovsky, Andrey; Quan, Evan; Wu, Xiaowei
Subject: [PATCH] drm/amd/powerplay: increase the SMU msg response waiting t=
ime

Increase the waiting time to 1s from 200ms. This is expected
to fix some mode1 reset failures.

Change-Id: I4c11996628cd40d559c6edea97d092f397122d78
Signed-off-by: Evan Quan <evan.quan@amd.com<mailto:evan.quan@amd.com>>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd=
/include/amd_shared.h
index 447bc4d..779c9e7 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -28,7 +28,7 @@
 #endif


-#define AMD_MAX_USEC_TIMEOUT           200000  /* 200 ms */
+#define AMD_MAX_USEC_TIMEOUT           1000000  /* 1000 ms */

 /*
  * Chip flags
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN8PR12MB33290CA144CF8883E42E8E0FE4F00BN8PR12MB3329namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Alex,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">There are actually two MAX_USEC_TIMEOUT related macr=
os.<o:p></o:p></p>
<p class=3D"MsoNormal">AMD_MAX_USEC_TIMEOUT is used for SMU and AMDGPU_MAX_=
USEC_TIMEOUT is used widely in other parts.<o:p></o:p></p>
<p class=3D"MsoNormal">Maybe you mistreated it as &nbsp;AMDGPU_MAX_USEC_TIM=
EOUT. I was confused by them too.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">drivers/gpu/drm/amd/include/amd_shared.h:29:#define =
AMD_MAX_USEC_TIMEOUT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 200000&nbsp; /* 200 ms */<o:p></o:p></p=
>
<p class=3D"MsoNormal">drivers/gpu/drm/amd/amdgpu/amdgpu.h:179:#define AMDG=
PU_MAX_USEC_TIMEOUT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 100000&nbsp; /* 100 ms */<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m considering to sort these timeout settings=
 up later. Maybe to combine them as one or give them differentiated names.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Evan<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Deucher, Alexander &lt;Alexander.Deuche=
r@amd.com&gt; <br>
<b>Sent:</b> Tuesday, July 09, 2019 8:41 PM<br>
<b>To:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.=
org<br>
<b>Cc:</b> Grodzovsky, Andrey &lt;Andrey.Grodzovsky@amd.com&gt;; Wu, Xiaowe=
i &lt;Xiaowei.Wu@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amd/powerplay: increase the SMU msg respons=
e waiting time<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">If this=
 is just for the SMU, maybe it would be better to add a separate timeout fo=
r the SMU since this will increase the timeout for lots of things, unless w=
e need an overall timeout increase for
 mode1 reset.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Alex<o:=
p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lists=
.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf o=
f Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.quan@amd.com</a>&=
gt;<br>
<b>Sent:</b> Tuesday, July 9, 2019 1:41 AM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a><br>
<b>Cc:</b> Deucher, Alexander; Grodzovsky, Andrey; Quan, Evan; Wu, Xiaowei<=
br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: increase the SMU msg response wa=
iting time</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">Increase the waiting time to 1s from 200ms. This is =
expected<br>
to fix some mode1 reset failures.<br>
<br>
Change-Id: I4c11996628cd40d559c6edea97d092f397122d78<br>
Signed-off-by: Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.quan=
@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/include/amd_shared.h | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd=
/include/amd_shared.h<br>
index 447bc4d..779c9e7 100644<br>
--- a/drivers/gpu/drm/amd/include/amd_shared.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/include/amd_shared.h<br>
@@ -28,7 &#43;28,7 @@<br>
&nbsp;#endif<br>
&nbsp;<br>
&nbsp;<br>
-#define AMD_MAX_USEC_TIMEOUT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 200000&nbsp; /* 200 ms */<br>
&#43;#define AMD_MAX_USEC_TIMEOUT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 1000000&nbsp; /* 1000 ms */<br>
&nbsp;<br>
&nbsp;/*<br>
&nbsp; * Chip flags<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_BN8PR12MB33290CA144CF8883E42E8E0FE4F00BN8PR12MB3329namp_--

--===============1805878101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1805878101==--
