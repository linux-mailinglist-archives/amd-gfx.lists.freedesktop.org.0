Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCA2A7E90
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 10:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FF889150;
	Wed,  4 Sep 2019 08:56:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790057.outbound.protection.outlook.com [40.107.79.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C51189150
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 08:56:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBUqxd7I+fgkzjn6H7PH0uIUK66v3RRLmjr8G7GAdgBQknDDXZy9av97e1UwTj1lUFbv4lN0YAhDIkgP/v7tmwRZhuchPSjPQeeDIhMEy1Ni8pgvYmnMDGHDy1AQQW0QpM8mLEMrSUfhzvPWN8k5ZyGKvhVyeUdo2oKRuUMtkVC0ODwxl6GB6bcwiNnkP3WwOWp7iJgIsR/igPMe5LOQHFYpyWigB9Yk5mbtOyxk9G4YCqw3cjrVesaJaoHXrxX4Q2RhjPkqsHkUDno3fYs4Pjmxg3B3qgTKlftSTl1f5KwQo2QiWzUCzyatVst1zs3iMrWlX5q/69+awP2BuRUqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDMjFzCP7PX0dYCk+mbJpaRPZqhpXM0jbiHTrn7WSIo=;
 b=HeddLBJWJWZGwP8WqFzfPfb3A4uJLVcnXghccAUdZwFW5R3Ct5A68PFuJnqfFh7YbSIYlN1WG/QFU2Yc//8nNXIQ7DMJOx8VuF6OOggetlnyN9RmnqwEQEIrLzxwVVbcBzqQp7MlNHRGZ3N2yYDaSujapZT/yLJscCb62BFWoAhpw5Fyn9RvgHX0XefM4cnYrePLxE/giwNsnKCdpeEie37sMMJs1cjJOtfA50RPUDuijAOe0c0kdFPVrxdh4SjqbfgKYNHy179L7Yyl7cGvHY9U1/IFHRsB3WGTmGiAb7g+twTnFppvvK1OSyQY7ULrH3auU3VVhZO8mQ4FjerxzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 08:56:22 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 08:56:22 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amd/powerplay: Add UMD PState Renoir Msg
 Parameters
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: Add UMD PState Renoir Msg
 Parameters
Thread-Index: AQHVYuY1zl6E+ns+R0GkmmmDplyMYKcbDjsCgAAjuCA=
Date: Wed, 4 Sep 2019 08:56:22 +0000
Message-ID: <MN2PR12MB35369B63693643B38A9F0669FBB80@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <1567576882-13685-1-git-send-email-Prike.Liang@amd.com>
 <MN2PR12MB3296B324AFCAABE3E7E63ECEA2B80@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3296B324AFCAABE3E7E63ECEA2B80@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d1cdb93-d268-48ea-e431-08d73115c2dd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3054; 
x-ms-traffictypediagnostic: MN2PR12MB3054:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB30540AC01342C72D5138F8ECFBB80@MN2PR12MB3054.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(189003)(199004)(66066001)(11346002)(110136005)(4326008)(446003)(6436002)(2501003)(316002)(476003)(55016002)(6306002)(486006)(81166006)(81156014)(8936002)(25786009)(236005)(54896002)(9686003)(6246003)(478600001)(76176011)(71200400001)(8676002)(966005)(71190400001)(66446008)(76116006)(66556008)(64756008)(66476007)(6506007)(99286004)(14454004)(2906002)(790700001)(6116002)(66946007)(7696005)(3846002)(53546011)(74316002)(52536014)(102836004)(606006)(7736002)(256004)(14444005)(33656002)(26005)(53936002)(5660300002)(86362001)(186003)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3054;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yv5ZEtaG1S8IAf4fWsGLzpUHcsfJ4lbG3xCP3LeEVPmTseoEvnfMVmQ5fP3g8jv0chVcGT/P4ebuDjkT2jlp28S2J4tnf0XgfWzt7WH8dCLzWBRwJI+BZfs4v81xx3WcI+k1B0R49YxYike5plXmFY0K78Lskz0Hugm2FkS9znCHVnYCdoZWYdaNY3GSFDPo/XaZ7VoIcoTFFq8JO4K4ZGG4rw9fX4V4fp75kZGVR1D7VmAXEruUMpaFbs7KZ1s35/PQV3xOC9yzKXnCvLHMgeXCfIcLswJIfndLLQ0Tcx7JrfeF9m0KWkbfpQPFra4dkAa6w2+ScE49epqPJvfdrrmCtmyTsT9TIw4Fflsgha3cpeesyP6HXYvD/5SegGsD/RAHffUIuh/IeNBij5lHEIzBNS1hmLFUrlfPiEit2HU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1cdb93-d268-48ea-e431-08d73115c2dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 08:56:22.7581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9EZUE+FqLAaF9M4od4MvX1dSZI81diyjSokNsYOiPpxB4sMsXNJwBnCLLtw7148O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3054
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDMjFzCP7PX0dYCk+mbJpaRPZqhpXM0jbiHTrn7WSIo=;
 b=mElaRBs4HSmmrDvDg4dGImY8YI+NoBCnL8sULfOZfQOKpcc24iVxNAhFjec0VxYY3z2VlcbAZ0aAcQhWTzGj+ptoueZFycHRyL2OBopMlLS5FBlW0SLzsJALmoN/iWetoYGFlJi/rKjIrZs7PACrHB50W1IeRJQyFlRLOgEjNI0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1092164130=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1092164130==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB35369B63693643B38A9F0669FBB80MN2PR12MB3536namp_"

--_000_MN2PR12MB35369B63693643B38A9F0669FBB80MN2PR12MB3536namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks review .

Initial thoughts use this patch for overall initializing the UMD_PSATET_* a=
ssignment and
some Pstate definitions are not used for patch#2. But combine those two pat=
ches also seems well.

Thanks,
Prike
From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
Sent: Wednesday, September 4, 2019 2:32 PM
To: Liang, Prike <Prike.Liang@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 1/2] drm/amd/powerplay: Add UMD PState Renoir Msg Param=
eters

i think it's better to merge these two patches into one patch.
after fixed: Reviewed-by: Kevin Wang <kevin1.wang@amd.com<mailto:kevin1.wan=
g@amd.com>>

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Liang, Prike <Prike.Liang@amd.com<mai=
lto:Prike.Liang@amd.com>>
Sent: Wednesday, September 4, 2019 2:01 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com<mailto:Alexander.Deucher@=
amd.com>>; Liang, Prike <Prike.Liang@amd.com<mailto:Prike.Liang@amd.com>>
Subject: [PATCH 1/2] drm/amd/powerplay: Add UMD PState Renoir Msg Parameter=
s

Add UMD PState macro definition for PState update.

Signed-off-by: Prike Liang <Prike.Liang@amd.com<mailto:Prike.Liang@amd.com>=
>
reviewed-by: Evan Quan <evan.quan@amd.com<mailto:evan.quan@amd.com>>
[Kevin]: change "reviewed-by" to "Reviewed-by"
---
 drivers/gpu/drm/amd/powerplay/renoir_ppt.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.h b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.h
index e9b7237..a017a47 100644
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.h
+++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.h
@@ -25,4 +25,9 @@

 extern void renoir_set_ppt_funcs(struct smu_context *smu);

+//UMD PState Renoir Msg Parameters in MHz
+#define RENOIR_UMD_PSTATE_GFXCLK       700
+#define RENOIR_UMD_PSTATE_SOCCLK       678
+#define RENOIR_UMD_PSTATE_FCLK         800
+
 #endif
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB35369B63693643B38A9F0669FBB80MN2PR12MB3536namp_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@SimSun";
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
	margin:1.0in 1.0in 1.0in 1.0in;}
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
<p class=3D"MsoNormal">Thanks review . <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Initial thoughts use this patch for overall initiali=
zing the UMD_PSATET_* assignment and
<o:p></o:p></p>
<p class=3D"MsoNormal">some Pstate definitions are not used for patch#2. Bu=
t combine those two patches also seems well.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Prike<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.c=
om&gt; <br>
<b>Sent:</b> Wednesday, September 4, 2019 2:32 PM<br>
<b>To:</b> Liang, Prike &lt;Prike.Liang@amd.com&gt;; amd-gfx@lists.freedesk=
top.org<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 1/2] drm/amd/powerplay: Add UMD PState Renoir Ms=
g Parameters<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">i think=
 it's better to merge these two patches into one patch.<o:p></o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">after f=
ixed: Reviewed-by: Kevin Wang &lt;<a href=3D"mailto:kevin1.wang@amd.com">ke=
vin1.wang@amd.com</a>&gt;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Best Re=
gards,<br>
Kevin<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lists=
.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf o=
f Liang, Prike &lt;<a href=3D"mailto:Prike.Liang@amd.com">Prike.Liang@amd.c=
om</a>&gt;<br>
<b>Sent:</b> Wednesday, September 4, 2019 2:01 PM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;<a href=3D"mailto:Alexander.Deucher@amd.c=
om">Alexander.Deucher@amd.com</a>&gt;; Liang, Prike &lt;<a href=3D"mailto:P=
rike.Liang@amd.com">Prike.Liang@amd.com</a>&gt;<br>
<b>Subject:</b> [PATCH 1/2] drm/amd/powerplay: Add UMD PState Renoir Msg Pa=
rameters</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">Add UMD PState macro definition for PState update.<b=
r>
<br>
Signed-off-by: Prike Liang &lt;<a href=3D"mailto:Prike.Liang@amd.com">Prike=
.Liang@amd.com</a>&gt;<br>
reviewed-by: Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.quan@a=
md.com</a>&gt;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><b><i>[Kevin]: change &quot;reviewed-by&quot; to &qu=
ot;Reviewed-by&quot;</i></b><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/renoir_ppt.h | 5 &#43;&#43;&#43;&#43;&#=
43;<br>
&nbsp;1 file changed, 5 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.h b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.h<br>
index e9b7237..a017a47 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/renoir_ppt.h<br>
@@ -25,4 &#43;25,9 @@<br>
&nbsp;<br>
&nbsp;extern void renoir_set_ppt_funcs(struct smu_context *smu);<br>
&nbsp;<br>
&#43;//UMD PState Renoir Msg Parameters in MHz<br>
&#43;#define RENOIR_UMD_PSTATE_GFXCLK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7=
00<br>
&#43;#define RENOIR_UMD_PSTATE_SOCCLK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6=
78<br>
&#43;#define RENOIR_UMD_PSTATE_FCLK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 800<br>
&#43;<br>
&nbsp;#endif<br>
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

--_000_MN2PR12MB35369B63693643B38A9F0669FBB80MN2PR12MB3536namp_--

--===============1092164130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1092164130==--
