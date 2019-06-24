Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FD750C4E
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 15:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F95389548;
	Mon, 24 Jun 2019 13:48:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760073.outbound.protection.outlook.com [40.107.76.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4375489548
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 13:48:20 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1602.namprd12.prod.outlook.com (10.172.20.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 13:48:16 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 13:48:16 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "Russell, Kent" <Kent.Russell@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: no memory activity support on Vega10
Thread-Topic: [PATCH] drm/amd/powerplay: no memory activity support on Vega10
Thread-Index: AQHVJ9YWZR5/JxMFs0SdKyQ3qd7J8KamHkJvgAADwwCAAAapHIAESpsAgABj8Rc=
Date: Mon, 24 Jun 2019 13:48:16 +0000
Message-ID: <BN6PR12MB1809BF229F762DA014DE789CF7E00@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190621020709.24778-1-evan.quan@amd.com>
 <BN6PR12MB1809E4116699CD2B418B0763F7E70@BN6PR12MB1809.namprd12.prod.outlook.com>,
 <BN6PR12MB16181A32A5AA5FCCC1972B1E85E70@BN6PR12MB1618.namprd12.prod.outlook.com>
 <BN6PR12MB1809B49FC5D6A613D7CEFA0BF7E70@BN6PR12MB1809.namprd12.prod.outlook.com>,
 <MN2PR12MB3344C751E8710AF18A2A1DA3E4E00@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344C751E8710AF18A2A1DA3E4E00@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.5.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19d29b8e-5a16-4429-49f8-08d6f8aa9c31
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1602; 
x-ms-traffictypediagnostic: BN6PR12MB1602:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB16026E9F5670B36D1E6E20BCF7E00@BN6PR12MB1602.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(39860400002)(346002)(396003)(366004)(199004)(189003)(2906002)(236005)(33656002)(76176011)(2501003)(53936002)(478600001)(99286004)(11346002)(446003)(7696005)(105004)(6436002)(316002)(54896002)(6306002)(14454004)(6246003)(74316002)(19627235002)(9686003)(55016002)(3846002)(6116002)(68736007)(66066001)(25786009)(606006)(76116006)(966005)(72206003)(86362001)(476003)(486006)(110136005)(8936002)(256004)(81156014)(81166006)(73956011)(26005)(19627405001)(5660300002)(66476007)(186003)(66946007)(7736002)(71200400001)(229853002)(6506007)(53546011)(8676002)(52536014)(66446008)(64756008)(71190400001)(66556008)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1602;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r68ogE6fdFqhzvrfwsXCbK14jQ0OjcyWnmxhSZb+3txZ6QRmUJJYPA5NotwPfcHk7zxyRjj80IO8KAYqYc0ALkOVk+DsnLirlr2ZHdO6Kq8JCqnvYJQLEGBRSL9DkFn8gb89VgCQVecFc7vkqSis1z51KmzjXWI4svPc92S+D+DlocyhcZUTKCf5WPJnCTDLBu8P7qaZKLJm5WFSqIFg2kX097ZCRluntDFMeRiDtv26Yk+ApVGRbjzcukywu3wxzztxX8DId/kgu1SvvpmErimlqbjiHRsSLEgbr0Hfj8RoCGfosO9F3RvJrdQUSQMwu0zTEPI7VPr+tbasUQc2ucjIuIzivBdYlWbI3RekIBmZ79fPdbTCofXE9sbbC+lfz3HhnF34DV3FEYl+tTYG2pAUzvh6Zq9ft60ohTuKM8Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d29b8e-5a16-4429-49f8-08d6f8aa9c31
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 13:48:16.6347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1602
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICL5kqW2bzd/SgQ1kprZjSwtC7dGQ2UiH7d1z0GoDXo=;
 b=jSWr1iO4FpPlfgrj5FwbkhS9U/UfS2232bzsLwI6AtRFlgi2RSDMQREK5XE1k8jPP3cP+jlQTHEN00U1VfjANYZVprHl9mk87fdHczkftiaW0kSR1nYNVYzK+E2+TK7jL0F06GaV1mOheHiX2SGZ20n3kHHAO/YXJ7mv0TJsR4w=
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
Content-Type: multipart/mixed; boundary="===============0949941547=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0949941547==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809BF229F762DA014DE789CF7E00BN6PR12MB1809namp_"

--_000_BN6PR12MB1809BF229F762DA014DE789CF7E00BN6PR12MB1809namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Sounds good.  Thanks for confirming.

Alex
________________________________
From: Quan, Evan
Sent: Monday, June 24, 2019 3:50 AM
To: Deucher, Alexander; Russell, Kent; amd-gfx@lists.freedesktop.org
Subject: RE: [PATCH] drm/amd/powerplay: no memory activity support on Vega1=
0




Smu7 ASICs support memory activity report also by reading register directly=
.

But for Vega10, there is not any SMC message and metrics table for that.  A=
nd there is no information about any register related with that.

So, we cannot get the memory activity on Vega10. It=92s not a regression.



Regards,

Evan

From: Deucher, Alexander <Alexander.Deucher@amd.com>
Sent: Friday, June 21, 2019 10:19 PM
To: Russell, Kent <Kent.Russell@amd.com>; Quan, Evan <Evan.Quan@amd.com>; a=
md-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/amd/powerplay: no memory activity support on Vega1=
0



Maybe it's dependent on the SMU firwmare version?



Alex

________________________________

From: Russell, Kent
Sent: Friday, June 21, 2019 9:54 AM
To: Deucher, Alexander; Quan, Evan; amd-gfx@lists.freedesktop.org<mailto:am=
d-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: no memory activity support on Vega1=
0



It works on my Fiji card. Maybe Vega10 functionality is just broken in this=
 regard?



Kent



From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> On Behalf Of Deucher, Alexander
Sent: Friday, June 21, 2019 9:42 AM
To: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>; amd-gfx@lists=
.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: no memory activity support on Vega1=
0



Is this supported on smu7 parts as well?  Might be better to just enable it=
 on the specific asics that support it.  I think it might just be vega20.



Alex

________________________________

From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Evan Quan <evan.quan@amd.com<mailto:e=
van.quan@amd.com>>
Sent: Thursday, June 20, 2019 10:07 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Cc: Quan, Evan
Subject: [PATCH] drm/amd/powerplay: no memory activity support on Vega10



Make mem_busy_percent sysfs interface invisible on Vega10.

Change-Id: Ie39c3217b497a110b0b16e1b08033029bdcf2fc8
Signed-off-by: Evan Quan <evan.quan@amd.com<mailto:evan.quan@amd.com>>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_pm.c
index 7ed84736ccc9..bcf6e089dc2e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
@@ -2945,7 +2945,8 @@ int amdgpu_pm_sysfs_init(struct amdgpu_device *adev)
                 return ret;
         }
         /* APU does not have its own dedicated memory */
-       if (!(adev->flags & AMD_IS_APU)) {
+       if (!(adev->flags & AMD_IS_APU) &&
+            (adev->asic_type !=3D CHIP_VEGA10)) {
                 ret =3D device_create_file(adev->dev,
                                 &dev_attr_mem_busy_percent);
                 if (ret) {
@@ -3025,7 +3026,8 @@ void amdgpu_pm_sysfs_fini(struct amdgpu_device *adev)
                 device_remove_file(adev->dev,
                                 &dev_attr_pp_od_clk_voltage);
         device_remove_file(adev->dev, &dev_attr_gpu_busy_percent);
-       if (!(adev->flags & AMD_IS_APU))
+       if (!(adev->flags & AMD_IS_APU) &&
+            (adev->asic_type !=3D CHIP_VEGA10))
                 device_remove_file(adev->dev, &dev_attr_mem_busy_percent);
         if (!(adev->flags & AMD_IS_APU))
                 device_remove_file(adev->dev, &dev_attr_pcie_bw);
--
2.21.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809BF229F762DA014DE789CF7E00BN6PR12MB1809namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Sounds good.&nbsp; Thanks for confirming.</div>
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
<b>Sent:</b> Monday, June 24, 2019 3:50 AM<br>
<b>To:</b> Deucher, Alexander; Russell, Kent; amd-gfx@lists.freedesktop.org=
<br>
<b>Subject:</b> RE: [PATCH] drm/amd/powerplay: no memory activity support o=
n Vega10</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:SimSun}
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
@font-face
	{font-family:SimSun}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
a:link, span.x_MsoHyperlink
	{color:blue;
	text-decoration:underline}
a:visited, span.x_MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline}
p.x_msonormal0, li.x_msonormal0, div.x_msonormal0
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
p.x_xmsonormal, li.x_xmsonormal, div.x_xmsonormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
p.x_xmsonormal0, li.x_xmsonormal0, div.x_xmsonormal0
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
p.x_xmsochpdefault, li.x_xmsochpdefault, div.x_xmsochpdefault
	{margin-right:0in;
	margin-left:0in;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif}
span.x_xmsohyperlink
	{color:blue;
	text-decoration:underline}
span.x_xmsohyperlinkfollowed
	{color:purple;
	text-decoration:underline}
span.x_xemailstyle20
	{font-family:"Calibri",sans-serif;
	color:windowtext}
span.x_EmailStyle26
	{font-family:"Calibri",sans-serif;
	color:windowtext}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.25in 1.0in 1.25in}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Smu7 ASICs support memory activity report also by =
reading register directly.</p>
<p class=3D"x_MsoNormal">But for Vega10, there is not any SMC message and m=
etrics table for that. &nbsp;And there is no information about any register=
 related with that.</p>
<p class=3D"x_MsoNormal">So, we cannot get the memory activity on Vega10. I=
t=92s not a regression.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Regards,</p>
<p class=3D"x_MsoNormal">Evan</p>
<div style=3D"border:none; border-left:solid blue 1.5pt; padding:0in 0in 0i=
n 4.0pt">
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal"><b>From:</b> Deucher, Alexander &lt;Alexander.Deuc=
her@amd.com&gt;
<br>
<b>Sent:</b> Friday, June 21, 2019 10:19 PM<br>
<b>To:</b> Russell, Kent &lt;Kent.Russell@amd.com&gt;; Quan, Evan &lt;Evan.=
Quan@amd.com&gt;; amd-gfx@lists.freedesktop.org<br>
<b>Subject:</b> Re: [PATCH] drm/amd/powerplay: no memory activity support o=
n Vega10</p>
</div>
</div>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Mayb=
e it's dependent on the SMU firwmare version?</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Alex=
</span></p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"x_MsoNormal"><b><span style=3D"color:black">From:</span></b><sp=
an style=3D"color:black"> Russell, Kent<br>
<b>Sent:</b> Friday, June 21, 2019 9:54 AM<br>
<b>To:</b> Deucher, Alexander; Quan, Evan; <a href=3D"mailto:amd-gfx@lists.=
freedesktop.org">
amd-gfx@lists.freedesktop.org</a><br>
<b>Subject:</b> RE: [PATCH] drm/amd/powerplay: no memory activity support o=
n Vega10</span>
</p>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_xmsonormal">It works on my Fiji card. Maybe Vega10 functional=
ity is just broken in this regard?</p>
<p class=3D"x_xmsonormal">&nbsp;</p>
<p class=3D"x_xmsonormal">Kent</p>
<p class=3D"x_xmsonormal">&nbsp;</p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_xmsonormal"><b>From:</b> amd-gfx &lt;<a href=3D"mailto:amd-gf=
x-bounces@lists.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&=
gt;
<b>On Behalf Of </b>Deucher, Alexander<br>
<b>Sent:</b> Friday, June 21, 2019 9:42 AM<br>
<b>To:</b> Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@am=
d.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<b>Subject:</b> Re: [PATCH] drm/amd/powerplay: no memory activity support o=
n Vega10</p>
</div>
</div>
<p class=3D"x_xmsonormal">&nbsp;</p>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">Is =
this supported on smu7 parts as well?&nbsp; Might be better to just enable =
it on the specific asics that support it.&nbsp; I think it might just be ve=
ga20.</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">&nb=
sp;</span></p>
</div>
<div>
<p class=3D"x_xmsonormal"><span style=3D"font-size:12.0pt; color:black">Ale=
x</span></p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_x_divRplyFwdMsg">
<p class=3D"x_xmsonormal"><b><span style=3D"color:black">From:</span></b><s=
pan style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@li=
sts.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behal=
f of Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.quan@amd.com</=
a>&gt;<br>
<b>Sent:</b> Thursday, June 20, 2019 10:07 PM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a><br>
<b>Cc:</b> Quan, Evan<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: no memory activity support on Ve=
ga10</span>
</p>
<div>
<p class=3D"x_xmsonormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_xmsonormal">Make mem_busy_percent sysfs interface invisible o=
n Vega10.<br>
<br>
Change-Id: Ie39c3217b497a110b0b16e1b08033029bdcf2fc8<br>
Signed-off-by: Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.quan=
@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 6 &#43;&#43;&#43;&#43;--<br>
&nbsp;1 file changed, 4 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_pm.c<br>
index 7ed84736ccc9..bcf6e089dc2e 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
@@ -2945,7 &#43;2945,8 @@ int amdgpu_pm_sysfs_init(struct amdgpu_device *ad=
ev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* APU does not have its o=
wn dedicated memory */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(adev-&gt;flags &amp; AMD_IS_APU=
)) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(adev-&gt;flags &amp; AMD_IS=
_APU) &amp;&amp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (ad=
ev-&gt;asic_type !=3D CHIP_VEGA10)) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D device_create_file(adev-&gt;dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;dev_attr_mem_busy_percent);=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
@@ -3025,7 &#43;3026,8 @@ void amdgpu_pm_sysfs_fini(struct amdgpu_device *a=
dev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; device_remove_file(adev-&gt;dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;dev_attr_pp_od_clk_voltage)=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_remove_file(adev-&g=
t;dev, &amp;dev_attr_gpu_busy_percent);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(adev-&gt;flags &amp; AMD_IS_APU=
))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(adev-&gt;flags &amp; AMD_IS=
_APU) &amp;&amp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (ad=
ev-&gt;asic_type !=3D CHIP_VEGA10))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; device_remove_file(adev-&gt;dev, &amp;dev_attr_mem_bu=
sy_percent);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(adev-&gt;flags &amp;=
 AMD_IS_APU))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; device_remove_file(adev-&gt;dev, &amp;dev_attr_pcie_b=
w);<br>
-- <br>
2.21.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_BN6PR12MB1809BF229F762DA014DE789CF7E00BN6PR12MB1809namp_--

--===============0949941547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0949941547==--
