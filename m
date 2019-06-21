Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B914EA6D
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Jun 2019 16:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAEA6E8C4;
	Fri, 21 Jun 2019 14:18:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760070.outbound.protection.outlook.com [40.107.76.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBF76E8C4
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Jun 2019 14:18:43 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 21 Jun 2019 14:18:41 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 14:18:41 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: no memory activity support on Vega10
Thread-Topic: [PATCH] drm/amd/powerplay: no memory activity support on Vega10
Thread-Index: AQHVJ9YWZR5/JxMFs0SdKyQ3qd7J8KamHkJvgAADwwCAAAapHA==
Date: Fri, 21 Jun 2019 14:18:41 +0000
Message-ID: <BN6PR12MB1809B49FC5D6A613D7CEFA0BF7E70@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190621020709.24778-1-evan.quan@amd.com>
 <BN6PR12MB1809E4116699CD2B418B0763F7E70@BN6PR12MB1809.namprd12.prod.outlook.com>,
 <BN6PR12MB16181A32A5AA5FCCC1972B1E85E70@BN6PR12MB1618.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB16181A32A5AA5FCCC1972B1E85E70@BN6PR12MB1618.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.5.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 641ce130-dacb-4f72-c6af-08d6f6535cb0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1809; 
x-ms-traffictypediagnostic: BN6PR12MB1809:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB18098451EDC3E41542786390F7E70@BN6PR12MB1809.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(366004)(396003)(376002)(199004)(189003)(55016002)(486006)(81166006)(72206003)(68736007)(73956011)(186003)(14454004)(25786009)(8676002)(6116002)(256004)(476003)(110136005)(7736002)(74316002)(52536014)(6506007)(66946007)(446003)(2906002)(76116006)(5660300002)(8936002)(2501003)(53936002)(66556008)(54896002)(6306002)(26005)(966005)(81156014)(76176011)(66476007)(66446008)(236005)(6436002)(9686003)(53546011)(478600001)(7696005)(6246003)(64756008)(606006)(3846002)(105004)(66066001)(229853002)(33656002)(19627235002)(99286004)(316002)(71200400001)(19627405001)(102836004)(11346002)(86362001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1809;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3FIf/S5e9hyudrGHHDCb8BlqSWA1mr3BGqjXQg538Mie/Z/gC3h60VtQkbyvnn9gpQ8sO2VHI8VIUf+CBeNLV3tX6O0wcLqUPaCget9kKM2YWnWYaJW/Fee2jLkwza5KPa+3TiH8WQ1O8JlSgJTRu0aHZqUlq0QS1vR6kFwofgnfSVQHx8OhPJq6zbKUoa8xBRRS+bKk/rd2+ogQGkRIRclO7aivn+CFVe6Gigu0C0AJ9K4DrsFOcr8GISASC4665UvlzchUZoiGfscfD2bOY5MkBouoTg/dwAtLzWplrcl0jgLa1AjW00G/C5KuCRsUVTexwnJ8jG8o6P//jfTDrsPtztAHdVgGATclgRevPkplnLJqTIvpeCoAFu7Vi27wdbXRJrcT5qdfz8CCav6I+DtM4/io1xXwBmxvPuBxAAg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 641ce130-dacb-4f72-c6af-08d6f6535cb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 14:18:41.6040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1809
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZGQNfCaEf+Y7fh96MZhF6cPOJNsR0xKjBuL0cY9TYE=;
 b=UDOMoDNQn7QUiuVlYiju4NOQP0iQE96MAcbDHtv7wlTzF8i6OnxTLzuf8Z6XlZDk8PlY0IBXbwlA92UKrQi1aJIaXxsg1p7oHuBhJLe3Pfxpx9bsTLe+HXaPVGtvv1Fj4N9GHdf2+ZjuRJypRrpNgj/rmAdW6Y/8fkp413oU1DE=
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
Content-Type: multipart/mixed; boundary="===============0814850249=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0814850249==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809B49FC5D6A613D7CEFA0BF7E70BN6PR12MB1809namp_"

--_000_BN6PR12MB1809B49FC5D6A613D7CEFA0BF7E70BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Maybe it's dependent on the SMU firwmare version?

Alex
________________________________
From: Russell, Kent
Sent: Friday, June 21, 2019 9:54 AM
To: Deucher, Alexander; Quan, Evan; amd-gfx@lists.freedesktop.org
Subject: RE: [PATCH] drm/amd/powerplay: no memory activity support on Vega1=
0


It works on my Fiji card. Maybe Vega10 functionality is just broken in this=
 regard?



Kent



From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Deucher,=
 Alexander
Sent: Friday, June 21, 2019 9:42 AM
To: Quan, Evan <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org
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

--_000_BN6PR12MB1809B49FC5D6A613D7CEFA0BF7E70BN6PR12MB1809namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Maybe it's dependent on the SMU firwmare version?</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Russell, Kent<br>
<b>Sent:</b> Friday, June 21, 2019 9:54 AM<br>
<b>To:</b> Deucher, Alexander; Quan, Evan; amd-gfx@lists.freedesktop.org<br=
>
<b>Subject:</b> RE: [PATCH] drm/amd/powerplay: no memory activity support o=
n Vega10</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
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
span.x_EmailStyle20
	{font-family:"Calibri",sans-serif;
	color:windowtext}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal">It works on my Fiji card. Maybe Vega10 functionali=
ty is just broken in this regard?</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Kent</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal"><b>From:</b> amd-gfx &lt;amd-gfx-bounces@lists.fre=
edesktop.org&gt;
<b>On Behalf Of </b>Deucher, Alexander<br>
<b>Sent:</b> Friday, June 21, 2019 9:42 AM<br>
<b>To:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.=
org<br>
<b>Subject:</b> Re: [PATCH] drm/amd/powerplay: no memory activity support o=
n Vega10</p>
</div>
</div>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Is t=
his supported on smu7 parts as well?&nbsp; Might be better to just enable i=
t on the specific asics that support it.&nbsp; I think it might just be veg=
a20.</span></p>
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
an style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lis=
ts.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf=
 of Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.quan@amd.com</a=
>&gt;<br>
<b>Sent:</b> Thursday, June 20, 2019 10:07 PM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a><br>
<b>Cc:</b> Quan, Evan<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: no memory activity support on Ve=
ga10</span>
</p>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_MsoNormal">Make mem_busy_percent sysfs interface invisible on=
 Vega10.<br>
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
</body>
</html>

--_000_BN6PR12MB1809B49FC5D6A613D7CEFA0BF7E70BN6PR12MB1809namp_--

--===============0814850249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0814850249==--
