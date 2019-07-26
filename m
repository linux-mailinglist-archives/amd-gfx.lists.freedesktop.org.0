Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A3375D91
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 05:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1F66E875;
	Fri, 26 Jul 2019 03:59:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750053.outbound.protection.outlook.com [40.107.75.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225996E875
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 03:59:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHA9nNqErBMovMo+FnSycRJStZosEyRFyG1jklEojSzQ+hNZpDJHar+jJ32QIRTDTeIwTF73ZMSLBBW2czOtxFZvbBpczcrMqm/kMzmiWOZ5EICCAPiZRVI+oZ3LueAeY3sSea9Ls+MzCtuROEw7/Lv0+D4pAOoT9UnzfYRBtqXPuhWBsaqdLTtRAxf+XGR6QsINjLepSH0jJeDITzsQoTYV0o4mLDOrZXcBeJzo8HAI1nH2agdmhvd2GPmwNt7UXgrIwKC2WshvtOFdCcj4h4hQr9eyBSGXShedMcTFObyBsW4lg85JwsYN5VcjX2kceBDkg0yTEWOI4Oopyj8EhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+u7NwnM7j4P6W4B1ZoF76dYYTY1Fg3ewoOUOvDhH74=;
 b=C+jxe7EBvxZzL1EpjKEHQAPzHk6LMgr7I3TvUACNbH6leIa2ZRd29jH+vL9o5StXO1R5Ft++IOk03gbjgIHW1NOkMS8dDZQoE8iY9yNIVeFjO/UHOs1vLKA7n//Js9U9sqfHX/JlOz9uyhp7jAdIoxslLM9lglAIlNOpfenHVof6lqakEPu0DTaXj40z6nz0c1HdklL1S1IeqiTlaBLbv+zoe0mCAvNi3LV7M+5fFwZQoN7cE+3xZ9uJ0KE/TI1JH0VbrXIdJRr8upnoGr9qWYNYQUE2KQBnf1+exKAWa3EJajHf75UCbxcE1tMwzZP9C8u3SObORdz9n9Hs3IgYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3263.namprd12.prod.outlook.com (20.179.80.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.15; Fri, 26 Jul 2019 03:59:51 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5%7]) with mapi id 15.20.2094.017; Fri, 26 Jul 2019
 03:59:51 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "Wang, Kevin(Yang)"
 <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset functionality
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset functionality
Thread-Index: AQHVQpI8vpdUJXv4uEOZjIbVqp2dW6bbTu6AgADH6gCAADD3EA==
Date: Fri, 26 Jul 2019 03:59:50 +0000
Message-ID: <MN2PR12MB3598E9501B1D6276BE45CEBF8EC00@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190725023930.22521-1-evan.quan@amd.com>,
 <20190725023930.22521-2-evan.quan@amd.com>
 <MN2PR12MB3296605E0E8E85F415368D46A2C10@MN2PR12MB3296.namprd12.prod.outlook.com>
 <MN2PR12MB33446FE3CFFC12443A9FFB9CE4C00@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB33446FE3CFFC12443A9FFB9CE4C00@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69f529a6-2f9b-412a-2393-08d7117db58a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3263; 
x-ms-traffictypediagnostic: MN2PR12MB3263:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MN2PR12MB32636B7BBBA2AA7A3B4490568EC00@MN2PR12MB3263.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(51444003)(189003)(199004)(966005)(476003)(3846002)(5660300002)(76116006)(316002)(71190400001)(14454004)(2906002)(110136005)(71200400001)(6116002)(229853002)(86362001)(66446008)(52536014)(446003)(26005)(6246003)(606006)(66556008)(66476007)(66946007)(33656002)(64756008)(53936002)(256004)(478600001)(236005)(8676002)(2501003)(6506007)(6436002)(74316002)(7736002)(9686003)(25786009)(54896002)(53546011)(76176011)(81156014)(8936002)(186003)(66066001)(68736007)(486006)(99286004)(102836004)(81166006)(7696005)(790700001)(55016002)(6306002)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3263;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /UBId84KHzOJbFWaTmR0obXGKzSojlrViipOS+KfoT2k8KcGFtPd/VbtazL4ie9Ef+QgtjwBQGxoaH6gH/DGc22VARUhByNrfAx54Dr+dRktpIWo6XVSYfZ8EvzlEv5jhgn/lJo25RLt3i+Nf5WyqRE8QDtyN6pxz1bkKWh68shr+iL1vsJacaObpJHIniW1qSFKFb1akuBMtDXCe7pCSiRRNf9A40+hkPhp4CZyHAgcrvqiuAS4nJEgmCLn+0xbInb4Ret9Giryj4y30XGsaUiaosHRQV+zYLUjNV37geMV5ZRFVpJHIY31v9dqh+QsVM2mGqRw2KxV67FTGvJejEafNjRhZcdYpfjtlx55eKG52x61m79qg0m9UzUHF06qDHbxGKjjolcrSWdUkpVs/NQdBdioEnOuC/dTN9fI4Ls=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f529a6-2f9b-412a-2393-08d7117db58a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 03:59:50.9418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyfeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3263
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+u7NwnM7j4P6W4B1ZoF76dYYTY1Fg3ewoOUOvDhH74=;
 b=wKMRKqme9qpokxP/VEY7BJfX8/v0tf9tQGb+4pM5hzpohgjHaIge9gaQyrQpcMhv4trcTenAttiSC1jfUnWxIkAzYjPHy8B3YrwJCJnnREoI+H1Sdp2Iwj2eOX5l9MQN6+VE4xCLBGMktjFOfZe8zfXY7g8ydlvBjGQYi5tHVxc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0406893629=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0406893629==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3598E9501B1D6276BE45CEBF8EC00MN2PR12MB3598namp_"

--_000_MN2PR12MB3598E9501B1D6276BE45CEBF8EC00MN2PR12MB3598namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I think that's ok to put in sw_init.

Reviewed-by: Kenneth Feng <kenneth.feng@amd.com<mailto:kenneth.feng@amd.com=
>>


From: amd-gfx [mailto:amd-gfx-bounces@lists.freedesktop.org] On Behalf Of Q=
uan, Evan
Sent: Friday, July 26, 2019 9:04 AM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; amd-gfx@lists.freedesktop.org
Subject: RE: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset functionali=
ty

[CAUTION: External Email]
It's a bug fix for uploading new pptable from sysfs.
And it's not hardware involved. The real hardware operation involved with t=
his is in smu_v11_0_enable_thermal_alert.
And in old powerplay routine, this is also put in sw_init and we do not fin=
d any problem with that until now.

Regards,
Evan
From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com<mailto:Kevin1.Wang@amd.com>>
Sent: Thursday, July 25, 2019 9:08 PM
To: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>; amd-gfx@lists=
.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset functionali=
ty

I don't recommend that, because obviously this is a hardware operation, so =
why need to move it  into sw init?
Is this a workaround solution, or is it specific to which asic?
and set pptable from sysfs and do baco reset operation need to call these f=
unctions, have you test it?
the function in amdgpu_smu.c and smu_v11_0.c need work correctly in all asi=
c,
it needs to be done carefully, unless there is a good reason.

Best Regards,
Kevin

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Evan Quan <evan.quan@amd.com<mailto:e=
van.quan@amd.com>>
Sent: Thursday, July 25, 2019 10:39 AM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>
Subject: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset functionality

Move SMU irq handler register to sw_init as that's totally
software related. Otherwise, it will prevent SMU reset working.

Change-Id: Ibd3e48ae9a90ab57f42b3f2ddbb736deeebc8715
Signed-off-by: Evan Quan <evan.quan@amd.com<mailto:evan.quan@amd.com>>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 6935a00cd389..a5079b93caa3 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -741,6 +741,12 @@ static int smu_sw_init(void *handle)
                 return ret;
         }

+       ret =3D smu_register_irq_handler(smu);
+       if (ret) {
+               pr_err("Failed to register smc irq handler!\n");
+               return ret;
+       }
+
         return 0;
 }

@@ -750,6 +756,9 @@ static int smu_sw_fini(void *handle)
         struct smu_context *smu =3D &adev->smu;
         int ret;

+       kfree(smu->irq_source);
+       smu->irq_source =3D NULL;
+
         ret =3D smu_smc_table_sw_fini(smu);
         if (ret) {
                 pr_err("Failed to sw fini smc table!\n");
@@ -1061,10 +1070,6 @@ static int smu_hw_init(void *handle)
         if (ret)
                 goto failed;

-       ret =3D smu_register_irq_handler(smu);
-       if (ret)
-               goto failed;
-
         if (!smu->pm_enabled)
                 adev->pm.dpm_enabled =3D false;
         else
@@ -1094,9 +1099,6 @@ static int smu_hw_fini(void *handle)
         kfree(table_context->overdrive_table);
         table_context->overdrive_table =3D NULL;

-       kfree(smu->irq_source);
-       smu->irq_source =3D NULL;
-
         ret =3D smu_fini_fb_allocations(smu);
         if (ret)
                 return ret;
--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3598E9501B1D6276BE45CEBF8EC00MN2PR12MB3598namp_
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I think that&#8217;s o=
k to put in sw_init.<o:p></o:p></span></p>
<p class=3D"MsoPlainText">Reviewed-by: Kenneth Feng &lt;<a href=3D"mailto:k=
enneth.feng@amd.com">kenneth.feng@amd.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> amd-gfx [mailto:amd-gfx-bounces@lists.f=
reedesktop.org]
<b>On Behalf Of </b>Quan, Evan<br>
<b>Sent:</b> Friday, July 26, 2019 9:04 AM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org<br>
<b>Subject:</b> RE: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset func=
tionality<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif">[CAUTION: External Email]
<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal">It&#8217;s a bug fix for uploading new pptable from =
sysfs.<o:p></o:p></p>
<p class=3D"MsoNormal">And it&#8217;s not hardware involved. The real hardw=
are operation involved with this is in smu_v11_0_enable_thermal_alert.<o:p>=
</o:p></p>
<p class=3D"MsoNormal">And in old powerplay routine, this is also put in sw=
_init and we do not find any problem with that until now.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Evan<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Wang, Kevin(Yang) &lt;<a href=3D"mailto=
:Kevin1.Wang@amd.com">Kevin1.Wang@amd.com</a>&gt;
<br>
<b>Sent:</b> Thursday, July 25, 2019 9:08 PM<br>
<b>To:</b> Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@am=
d.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<b>Subject:</b> Re: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset func=
tionality<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div id=3D"appendonsend">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">I don't=
 recommend that, because obviously this is a
<b>hardware</b> <b>operation</b>, so why need to move it&nbsp; into <b>sw</=
b> <b>init</b>?<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Is this=
 a workaround solution, or is it specific to which asic?<o:p></o:p></span><=
/p>
</div>
</div>
<div id=3D"appendonsend">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">and set=
 pptable from sysfs and do baco reset operation need to call these function=
s, have you test it?<o:p></o:p></span></p>
</div>
<div id=3D"appendonsend">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">the fun=
ction in amdgpu_smu.c and smu_v11_0.c need work correctly in all asic,<o:p>=
</o:p></span></p>
</div>
<div id=3D"appendonsend">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">it need=
s to be done carefully, unless there is a good reason.<o:p></o:p></span></p=
>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
</div>
<div id=3D"appendonsend">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Best Re=
gards,<br>
Kevin<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
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
<b>Sent:</b> Thursday, July 25, 2019 10:39 AM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@am=
d.com</a>&gt;<br>
<b>Subject:</b> [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset function=
ality</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">Move SMU irq handler register to sw_init as that's t=
otally<br>
software related. Otherwise, it will prevent SMU reset working.<br>
<br>
Change-Id: Ibd3e48ae9a90ab57f42b3f2ddbb736deeebc8715<br>
Signed-off-by: Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.quan=
@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 16 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;-------<br>
&nbsp;1 file changed, 9 insertions(&#43;), 7 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 6935a00cd389..a5079b93caa3 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -741,6 &#43;741,12 @@ static int smu_sw_init(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_register_irq_handler(=
smu);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pr_err(&quot;Failed to register smc irq handler!\n&quot;);<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return ret;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
@@ -750,6 &#43;756,9 @@ static int smu_sw_fini(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_context *smu =
=3D &amp;adev-&gt;smu;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(smu-&gt;irq_source);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;irq_source =3D NULL;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_smc_table_sw_f=
ini(smu);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pr_err(&quot;Failed to sw fini smc table!\n&quot;);<b=
r>
@@ -1061,10 &#43;1070,6 @@ static int smu_hw_init(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto failed;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_register_irq_handler(smu)=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto failed;<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;pm_enabled)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm_enabled =3D false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
@@ -1094,9 &#43;1099,6 @@ static int smu_hw_fini(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(table_context-&gt;ov=
erdrive_table);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table_context-&gt;overdriv=
e_table =3D NULL;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(smu-&gt;irq_source);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;irq_source =3D NULL;<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_fini_fb_alloca=
tions(smu);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
-- <br>
2.22.0<br>
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
</div>
</body>
</html>

--_000_MN2PR12MB3598E9501B1D6276BE45CEBF8EC00MN2PR12MB3598namp_--

--===============0406893629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0406893629==--
