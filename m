Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308FA9944D
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 14:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE35589BCD;
	Thu, 22 Aug 2019 12:54:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740080.outbound.protection.outlook.com [40.107.74.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FC589BCD
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 12:54:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eerOswFIe3fmXinLJwhTVwfie+5FcqiCZwORIdHzbj77lxosqFgwPViSP4MGfFLqChL0rn1+wqLIWUYx8XHdofeneiInneYez2agOe1bLWUJQzyjkGKlcIxANtBu/MVKsDR4IHufgYDt637Xg185jHzoOEeZubAPFSI/n2Y7C6Khpd+0FpYdn3gaGFQrHHZaF4JaH2EgAlWeVRZVPkr5C7/boHK6v3g6nlJJTZJOhuKfHTw0UeJyMQWggZu37DlEnhNYOz6fVttzBJaUrofmRzl/q9eUEGJiXmtvfUJtjAdpzTty+5YuG9w2p6t7umYR/SXWQsDrKNkTNcK892RtbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRj0kEqs9Xvld/vaQkKu7qXywzDSLYC0930LvJl6o2A=;
 b=EWWCLyay9AqzqxNUDv/SuSpCKO3D5UZMzxMuvTCfi00qAcs86DXDwA5oHmqSnnRpvlbs3G6KJKO0U6X+/KK3gvLDAjr1RFjnQBaVOfIFaGOdlqXNEVpn0Y7fdMbbrhbx5HOsOooA5VethNE1xmncUn77gdiVP4zUbyEHBPylGHeEm6EEugbOvDFPtJ7GKt3lO8gzVLNpeFOVaHW0TDb7G55u/Wk9Mzco0KOVQGI4a/6n7/1Q305D5v+bHXNYY3b0z63ceBVCLU6xx9R8lkRweNiqkMNYVft+EGAyMHieOPLfUTd5oMVW1LXKgLe7+D22SET7Ae66sFIR/SzIZQapYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1588.namprd12.prod.outlook.com (10.172.19.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 12:54:36 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::4d5d:1a87:aac9:d7b2]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::4d5d:1a87:aac9:d7b2%10]) with mapi id 15.20.2178.020; Thu, 22 Aug
 2019 12:54:36 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Fix Vega20 Average Power value
Thread-Topic: [PATCH] drm/amdgpu: Fix Vega20 Average Power value
Thread-Index: AQHVWOPefElQedQbPkSP96p3P9pH+KcHHz4VgAAAYEA=
Date: Thu, 22 Aug 2019 12:54:36 +0000
Message-ID: <BN6PR12MB16183CDF13CBEEC00240CC9B85A50@BN6PR12MB1618.namprd12.prod.outlook.com>
References: <20190822121927.32609-1-kent.russell@amd.com>
 <BN6PR12MB1809FB98DA053EC712C6375CF7A50@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB1809FB98DA053EC712C6375CF7A50@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dc930d3-3b9e-4ef9-b0c6-08d726ffe2f4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1588; 
x-ms-traffictypediagnostic: BN6PR12MB1588:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1588E28542A3BC6AE4E9362B85A50@BN6PR12MB1588.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(199004)(189003)(86362001)(55016002)(7736002)(66066001)(446003)(14454004)(53936002)(478600001)(476003)(11346002)(74316002)(966005)(5660300002)(102836004)(53546011)(33656002)(316002)(6506007)(52536014)(186003)(486006)(110136005)(6246003)(256004)(6436002)(229853002)(25786009)(606006)(76176011)(2501003)(66446008)(6116002)(76116006)(66946007)(71200400001)(66476007)(81166006)(71190400001)(66556008)(64756008)(8676002)(81156014)(6306002)(790700001)(8936002)(26005)(54896002)(7696005)(2906002)(99286004)(236005)(3846002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1588;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gA4fiIRUf8m2z998zObt+wblJkYHdKdVMY2YmEEaYWctyibdGE6sWxAXzuFAzCESzcVB3mLVhFr8Gk+9UJCgJAb9Dvr4HbNvJpIwbS811g8TsQqd2kPZv2Vs02hsykh9LfovrblVIaYLyMCPY/EL0WRmC8nVBHNFUkI2nrXvcqMUNd3YBSvq8udv4k2j956MmN/XORd5GJIaAqAGucoJyrSHtrv51qrSULAnvUySktVYbMrjtkJ+7SzluNlMplV/UqI8BUEznC9QEbWCBBRtE2DF+wRZIBhgxpLn3ffiK6vD669DpB1MNrj1hjTmLv/wOrrriSerna13n8RXqCCd9lqh3GYiURnDUh66Vi8D33HF4z6EqEkZGMNbIV1+hpIK0RUFgdcXNsA1ArYgp09r803O1wxPY+3/HHYin0xUFI8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc930d3-3b9e-4ef9-b0c6-08d726ffe2f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 12:54:36.1327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jeHrbfn6HRmeGUBYmYHDIJAw3nxU3/B7W/hlWPA+lScG6h/H6zOZUlQuvmlccOaSYXsR/phswgrZwJD9dTv0QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1588
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRj0kEqs9Xvld/vaQkKu7qXywzDSLYC0930LvJl6o2A=;
 b=wGbjhEKJ6Wq5VhH804vvdrOCo/TGJ6E2LXYVLfyf7q8PBinGALstDj+8d5zSqpySpRQv08BSDO4GwYWPNI3wib2MeiPhUmzzgrYPqVHuHvvjZkvRcFRthrNmYofmx1kOCeE1JBSb18Na6sLXR6Z3T9fXaAIjtCwbEdi811/nwKY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0181051242=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0181051242==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB16183CDF13CBEEC00240CC9B85A50BN6PR12MB1618namp_"

--_000_BN6PR12MB16183CDF13CBEEC00240CC9B85A50BN6PR12MB1618namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Good point, I'll double-check that.

Kent

From: Deucher, Alexander <Alexander.Deucher@amd.com>
Sent: Thursday, August 22, 2019 8:54 AM
To: Russell, Kent <Kent.Russell@amd.com>; amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/amdgpu: Fix Vega20 Average Power value

Do we need an smu version check?  Will AverageSocketPower report correctly =
on older versions of smu firmware?  Assuming that is ok, patch is:
Acked-by: Alex Deucher <alexander.deucher@amd.com<mailto:alexander.deucher@=
amd.com>>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Russell, Kent <Kent.Russell@amd.com<m=
ailto:Kent.Russell@amd.com>>
Sent: Thursday, August 22, 2019 8:19 AM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Russell, Kent <Kent.Russell@amd.com<mailto:Kent.Russell@amd.com>>
Subject: [PATCH] drm/amdgpu: Fix Vega20 Average Power value

The SMU changed reading from CurrSocketPower to AverageSocketPower, so
reflect this accordingly. This fixes the issue where Average Power
Consumption was being reported as 0 from SMU 40.46-onward

Change-Id: I471f93316820f1401cb497eefe29da68376a4bb9
Signed-off-by: Kent Russell <kent.russell@amd.com<mailto:kent.russell@amd.c=
om>>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c | 2 +-
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
index 0516c294b377..1820133f0ceb 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
@@ -2101,7 +2101,7 @@ static int vega20_get_gpu_power(struct pp_hwmgr *hwmg=
r,
         if (ret)
                 return ret;

-       *query =3D metrics_table.CurrSocketPower << 8;
+       *query =3D metrics_table.AverageSocketPower << 8;

         return ret;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c
index e14363182691..17af12ee9e78 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -2927,7 +2927,7 @@ static int vega20_get_gpu_power(struct smu_context *s=
mu, uint32_t *value)
         if (ret)
                 return ret;

-       *value =3D metrics.CurrSocketPower << 8;
+       *value =3D metrics.AverageSocketPower << 8;

         return 0;
 }
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB16183CDF13CBEEC00240CC9B85A50BN6PR12MB1618namp_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
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
<p class=3D"MsoNormal">Good point, I&#8217;ll double-check that. <o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Kent<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Deucher, Alexander &lt;Alexander.Deuche=
r@amd.com&gt; <br>
<b>Sent:</b> Thursday, August 22, 2019 8:54 AM<br>
<b>To:</b> Russell, Kent &lt;Kent.Russell@amd.com&gt;; amd-gfx@lists.freede=
sktop.org<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: Fix Vega20 Average Power value<o:p>=
</o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Do we n=
eed an smu version check?&nbsp; Will
</span><span style=3D"color:black">AverageSocketPower</span><span style=3D"=
font-size:12.0pt;color:black"> report correctly on older versions of smu fi=
rmware?&nbsp; Assuming that is ok, patch is:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Acked-b=
y: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com">alexander.=
deucher@amd.com</a>&gt;<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lists=
.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf o=
f Russell, Kent &lt;<a href=3D"mailto:Kent.Russell@amd.com">Kent.Russell@am=
d.com</a>&gt;<br>
<b>Sent:</b> Thursday, August 22, 2019 8:19 AM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> Russell, Kent &lt;<a href=3D"mailto:Kent.Russell@amd.com">Kent.R=
ussell@amd.com</a>&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: Fix Vega20 Average Power value</span> <=
o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">The SMU changed reading from CurrSocketPower to Aver=
ageSocketPower, so<br>
reflect this accordingly. This fixes the issue where Average Power<br>
Consumption was being reported as 0 from SMU 40.46-onward<br>
<br>
Change-Id: I471f93316820f1401cb497eefe29da68376a4bb9<br>
Signed-off-by: Kent Russell &lt;<a href=3D"mailto:kent.russell@amd.com">ken=
t.russell@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c | 2 &#43;-<br>
&nbsp;drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 2 &#43;-<br>
&nbsp;2 files changed, 2 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
index 0516c294b377..1820133f0ceb 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
@@ -2101,7 &#43;2101,7 @@ static int vega20_get_gpu_power(struct pp_hwmgr *=
hwmgr,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *query =3D metrics_table.CurrSocketPo=
wer &lt;&lt; 8;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *query =3D metrics_table.AverageS=
ocketPower &lt;&lt; 8;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c<br>
index e14363182691..17af12ee9e78 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
@@ -2927,7 &#43;2927,7 @@ static int vega20_get_gpu_power(struct smu_contex=
t *smu, uint32_t *value)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value =3D metrics.CurrSocketPower &l=
t;&lt; 8;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value =3D metrics.AverageSocketP=
ower &lt;&lt; 8;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
-- <br>
2.17.1<br>
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
</body>
</html>

--_000_BN6PR12MB16183CDF13CBEEC00240CC9B85A50BN6PR12MB1618namp_--

--===============0181051242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0181051242==--
