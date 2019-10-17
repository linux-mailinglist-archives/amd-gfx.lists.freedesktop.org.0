Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8BBDB8B0
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 22:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E005A89E36;
	Thu, 17 Oct 2019 20:53:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810079.outbound.protection.outlook.com [40.107.81.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7CA89E36
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 20:53:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyxLThp42Rqrbpc01LvURTd1W9kpO0TffuXF5lKGodnQ5oHxFaO6Iz62l3ZyI09eM5T+O3cUfHx2O/6dyql3QsdZb+mib3ktLpzQty8vZfYLH7uhSmk1Cx1JDor5QskWFOZbYE1NEQMU8SyoCODTwt21dl9nUIzPdtLrcvWFMzZzFQ+TemR3297P0mXetA3YbQcV2FurW3Z4+JE1uSa4XvMZONQ5J84hLVxUQXdwQhm1YcI0Avp6NegppBlRiEduz+lz28u03sFIh7rWmMQVJM8df+1EjMNk62LQqNyPVd6BbmVXYG0zqtBIadPtzJBcLJf42zh4XX4K1f7FJbss1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQdiqcH90Zx7rJ2ExhCuIDxF9CvV+WlM2zMa9aT6UkQ=;
 b=gnG48Irh30hzIXLZ+7+pGhkRX5Q2KFsbKs7tofm9s9zkb9TIYMYqwCys99Wy/in2cGjcJzQdPvhCUQK20M/Ha5BpQO+gDo4++hz5krEC1lKWqJBZ0ocaaspX/PwU1H0yuBoS9xxwQqCHhcvUopDfTLtsg07mvQwBvITQ49EYzJ7iXcWWthACgywwZ/Ot5zPNL8+ZOWr41pM4f29bO6NHONykQ+wUvljGCdSl7x+mOjueUq5jDDbKrDtWLft2VdWAgLzd13Qko1a0Xhb6J8sxX7Iph9N0FoKNF4mHQiBbdiuWljAKM0iSxm2qqLO+3rGVBL3HMZ3jKwYoipKBUStzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) by
 DM6PR12MB3993.namprd12.prod.outlook.com (10.255.175.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Thu, 17 Oct 2019 20:53:32 +0000
Received: from DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::b5f1:6693:1573:ab1e]) by DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::b5f1:6693:1573:ab1e%6]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 20:53:32 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/amd/display: Modify display link stream setup
 sequence.
Thread-Topic: [PATCH v2] drm/amd/display: Modify display link stream setup
 sequence.
Thread-Index: AQHVhR1bdUiBxSuwH0WEjqoIXDrvFadfSs6igAAEZWA=
Date: Thu, 17 Oct 2019 20:53:31 +0000
Message-ID: <DM6PR12MB3466ECB8AA076B5344C2D6619E6D0@DM6PR12MB3466.namprd12.prod.outlook.com>
References: <DM6PR12MB3466E0D0DADF7599F877F0859E6D0@DM6PR12MB3466.namprd12.prod.outlook.com>
 <BYAPR12MB35608C9F6518E2E0ECF8FB91EC6D0@BYAPR12MB3560.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB35608C9F6518E2E0ECF8FB91EC6D0@BYAPR12MB3560.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aadb62d4-31e7-4322-65fe-08d753441205
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3993:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3993CEA8AD7C24A72484E1C19E6D0@DM6PR12MB3993.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(199004)(189003)(71190400001)(110136005)(76116006)(25786009)(71200400001)(33656002)(86362001)(229853002)(256004)(966005)(486006)(606006)(8936002)(14454004)(8676002)(66476007)(66446008)(66556008)(476003)(64756008)(66946007)(81156014)(66066001)(478600001)(81166006)(316002)(6506007)(6246003)(7696005)(76176011)(7736002)(3846002)(53546011)(446003)(99286004)(2501003)(6436002)(2906002)(102836004)(186003)(790700001)(11346002)(74316002)(236005)(54896002)(55016002)(5660300002)(52536014)(6306002)(26005)(6116002)(9686003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3993;
 H:DM6PR12MB3466.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jNLsuKc3C2NcNKGVQeWlpUSsLELDQvS9ao/W4mcRIqlH1ML/a3GYNLrd518dZcBNg+E6rQpon+tRhcomcNec9bJLAZTgBgdKk2g1udyxYVxkyExex+/QYESqGO6NiklvzaI2+MQCXHJbwc6QauTfnDFNWIKnD1q4es9dTL3T/NaoYRbn5JMNBbTfH0/xhAhfhNLI795h6f7cQXoAyAYhzI2Np1B/qGjbXtKc6hqk0ond2tJ0fKcrukieWc3GdtWLf+1QOEaJKRgH6UTC4fkAkfqityBm72RBTBbk9EoNYlDvSHE2QHdKzW+9sW2SGDCdTJp9oEsdFFeSKSX0R1mN0VZ/i6KArU9O94K4ymConBXCzu4ZmpEbP7lk45hZlQOgrwaJnKw702M/OBF1A77eYG8ay8Jb5+Qpv1czTEd96VECQVoVDZpEU6yKSMR46TKYi9IIsXA11pGuhSKB9BwcTA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aadb62d4-31e7-4322-65fe-08d753441205
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 20:53:31.9710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HOYUJ2se1N40lycAO4LJZbY5C+LwUnfKQPL0S60eC3yBjoZDEyojyoNCkTPi/XPu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3993
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQdiqcH90Zx7rJ2ExhCuIDxF9CvV+WlM2zMa9aT6UkQ=;
 b=IOEzbaRSIoAEVgGtLOtt0GDh5CVUzZtGLvHt25Y5MltAREJAdJ378fNRdh8LkD8e7q/BVrO6/V0/SP1ffAWZq0Kj/TPb1Av72C/1Kyd1CbJLu0a+mxFYdwbVobHuaQh54lCMXnf89m18JQ+ZXS5/6Vcm/iROC8UinIB8oY1TKLQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0527424165=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0527424165==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB3466ECB8AA076B5344C2D6619E6D0DM6PR12MB3466namp_"

--_000_DM6PR12MB3466ECB8AA076B5344C2D6619E6D0DM6PR12MB3466namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thx! Will do it.

Zhan

From: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
Sent: 2019/October/17, Thursday 4:51 PM
To: Liu, Zhan <Zhan.Liu@amd.com>; amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/amd/display: Modify display link stream setup s=
equence.

This is actually setting DIG mode a second time, right? I don't think this =
is what sets GC_SEND.

Please mention that this is setting the DIG_MODE to the correct value after=
 having been overridden by the call to transmitter control in your patch de=
scription. Also correct the HACK comment to mention that this second call i=
s needed to reconfigure the DIG as a workaround for the incorrect value bei=
ng applied from transmitter control. Specifics help in source.

I don't think there is a case where we'd want HDMI changed to DVI so it's p=
robably fine to leave this as is for now...

With those fixed, you can add my:

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com<mailto:nichol=
as.kazlauskas@amd.com>>

Thanks,

Nicholas Kazlauskas

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Liu, Zhan <Zhan.Liu@amd.com<mailto:Zh=
an.Liu@amd.com>>
Sent: Thursday, October 17, 2019, 3:04 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; Li=
u, Zhan
Subject: [PATCH v2] drm/amd/display: Modify display link stream setup seque=
nce.


[Why]
This patch is for fixing Navi14 pink screen issue. With this
patch, stream->link->link_enc->funcs->setup will be called
twice: this will make sure GC_SEND is set to 1. Though we
still need to look into why the issue only happens on
Linux, but not on Windows side.

[How]
Call stream->link->link_enc->funcs->setup twice.

Signed-off-by: Zhan liu <zhan.liu@amd.com<mailto:zhan.liu@amd.com>>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/dr=
m/amd/display/dc/core/dc_link.c
index 935053664160..8683e8613ec2 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -2842,6 +2842,12 @@ void core_link_enable_stream(
                                        CONTROLLER_DP_TEST_PATTERN_VIDEOMOD=
E,
                                        COLOR_DEPTH_UNDEFINED);

+               /* Hack on Navi14: fixes Navi14 HDMI pink screen issue */
+               if (!dc_is_virtual_signal(pipe_ctx->stream->signal))
+                       stream->link->link_enc->funcs->setup(
+                               stream->link->link_enc,
+                               pipe_ctx->stream->signal);
+
 #ifdef CONFIG_DRM_AMD_DC_DSC_SUPPORT
                if (pipe_ctx->stream->timing.flags.DSC) {
                        if (dc_is_dp_signal(pipe_ctx->stream->signal) ||
--
2.17.0
_______________________________________________
amd-gfx mailing list
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--_000_DM6PR12MB3466ECB8AA076B5344C2D6619E6D0DM6PR12MB3466namp_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
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
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.emailquote, li.emailquote, div.emailquote
	{mso-style-name:emailquote;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:1.0pt;
	border:none;
	padding:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle21
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
<p class=3D"MsoNormal">Thx! Will do it.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Zhan<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Kazlauskas, Nicholas &lt;Nicholas.Kazla=
uskas@amd.com&gt;
<br>
<b>Sent:</b> 2019/October/17, Thursday 4:51 PM<br>
<b>To:</b> Liu, Zhan &lt;Zhan.Liu@amd.com&gt;; amd-gfx@lists.freedesktop.or=
g<br>
<b>Subject:</b> Re: [PATCH v2] drm/amd/display: Modify display link stream =
setup sequence.<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"color:#212=
121">This is actually setting DIG mode a second time, right? I don't think =
this is what sets GC_SEND.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"color:#212=
121"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"color:#212=
121">Please mention that this is setting the DIG_MODE to the correct value =
after having been overridden by the call to transmitter control in your pat=
ch description. Also correct the HACK
 comment to mention that this second call is needed to reconfigure the DIG =
as a workaround for the incorrect value being applied from transmitter cont=
rol. Specifics help in source.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"color:#212=
121"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"color:#212=
121">I don't think there is a case where we'd want HDMI changed to DVI so i=
t's probably fine to leave this as is for now...<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"color:#212=
121"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"color:#212=
121">With those fixed, you can add my:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"color:#212=
121"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"color:#212=
121">Reviewed-by: Nicholas Kazlauskas &lt;<a href=3D"mailto:nicholas.kazlau=
skas@amd.com">nicholas.kazlauskas@amd.com</a>&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"color:#212=
121"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"color:#212=
121">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"color:#212=
121"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"color:#212=
121">Nicholas Kazlauskas<o:p></o:p></span></p>
<div id=3D"id-77342fb2-e4ed-464c-97e1-4a1a620e36e9">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><strong><span style=3D"font-family:&quot;Calibri&quo=
t;,sans-serif">From:</span></strong> amd-gfx &lt;<a href=3D"mailto:amd-gfx-=
bounces@lists.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt=
; on behalf of Liu, Zhan &lt;<a href=3D"mailto:Zhan.Liu@amd.com">Zhan.Liu@a=
md.com</a>&gt;<br>
<strong><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">Sent:</s=
pan></strong> Thursday, October 17, 2019, 3:04 PM<br>
<strong><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">To:</spa=
n></strong> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a>; Liu, Zhan<br>
<strong><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">Subject:=
</span></strong> [PATCH v2] drm/amd/display: Modify display link stream set=
up sequence.<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><br>
<br>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">[Why]<br>
This patch is for fixing Navi14 pink screen issue. With this<br>
patch, stream-&gt;link-&gt;link_enc-&gt;funcs-&gt;setup will be called<br>
twice: this will make sure GC_SEND is set to 1. Though we<br>
still need to look into why the issue only happens on<br>
Linux, but not on Windows side.<br>
<br>
[How]<br>
Call stream-&gt;link-&gt;link_enc-&gt;funcs-&gt;setup twice.<br>
<br>
Signed-off-by: Zhan liu &lt;<a href=3D"mailto:zhan.liu@amd.com">zhan.liu@am=
d.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/dc/core/dc_link.c | 6 &#43;&#43;&#43;&#43=
;&#43;&#43;<br>
&nbsp;1 file changed, 6 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/dr=
m/amd/display/dc/core/dc_link.c<br>
index 935053664160..8683e8613ec2 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/dc/core/dc_link.c<br>
@@ -2842,6 &#43;2842,12 @@ void core_link_enable_stream(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; CONTROLLER_DP_TEST_PATTERN_VIDEOMODE,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; COLOR_DEPTH_UNDEFINED);<br>
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; /* Hack on Navi14: fixes Navi14 HDMI pink screen issue */<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (!dc_is_virtual_signal(pipe_ctx-&gt;stream-&gt;signal))<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stream-&gt;l=
ink-&gt;link_enc-&gt;funcs-&gt;setup(<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stream-&gt;link-&gt;link_enc,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_ctx-&gt;stream-&gt;signal);<br>
&#43;<br>
&nbsp;#ifdef CONFIG_DRM_AMD_DC_DSC_SUPPORT<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (pipe_ctx-&gt;stream-&gt;timing.flags.DSC) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dc_is_d=
p_signal(pipe_ctx-&gt;stream-&gt;signal) ||<br>
--<br>
2.17.0<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DM6PR12MB3466ECB8AA076B5344C2D6619E6D0DM6PR12MB3466namp_--

--===============0527424165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0527424165==--
