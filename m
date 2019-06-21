Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255364E9A9
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Jun 2019 15:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A546E6E894;
	Fri, 21 Jun 2019 13:41:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810055.outbound.protection.outlook.com [40.107.81.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761C06E894
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Jun 2019 13:41:54 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1508.namprd12.prod.outlook.com (10.172.23.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 21 Jun 2019 13:41:53 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 13:41:52 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: no memory activity support on Vega10
Thread-Topic: [PATCH] drm/amd/powerplay: no memory activity support on Vega10
Thread-Index: AQHVJ9YWZR5/JxMFs0SdKyQ3qd7J8KamHkJv
Date: Fri, 21 Jun 2019 13:41:52 +0000
Message-ID: <BN6PR12MB1809E4116699CD2B418B0763F7E70@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190621020709.24778-1-evan.quan@amd.com>
In-Reply-To: <20190621020709.24778-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.5.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 556d8c33-f5f3-4407-9acb-08d6f64e382e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1508; 
x-ms-traffictypediagnostic: BN6PR12MB1508:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB15085286D3C0B983E7D4EF97F7E70@BN6PR12MB1508.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(346002)(376002)(39860400002)(136003)(189003)(199004)(71200400001)(66556008)(3846002)(6116002)(6436002)(66446008)(2501003)(66946007)(606006)(6306002)(236005)(73956011)(52536014)(102836004)(55016002)(25786009)(229853002)(72206003)(9686003)(64756008)(5660300002)(86362001)(54896002)(76116006)(66476007)(256004)(7696005)(105004)(186003)(26005)(446003)(110136005)(53936002)(66066001)(6246003)(476003)(11346002)(74316002)(71190400001)(76176011)(7736002)(99286004)(316002)(81166006)(81156014)(8676002)(68736007)(2906002)(966005)(6506007)(19627405001)(14454004)(8936002)(486006)(53546011)(33656002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1508;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4BgvUtrV9bJAgA6Mnw9wj42NlYHEYe9GwsqT+85WZBLe1wlIP3BSBBEPRY1PHRkvqbLLQDCTBEA6mnU8FeW8P1WtIUjCC3kjyqGx6fnMaviNO/Q+xQxCxtBWgBHcmsVhPvRYpIX6LEkKJvcHiYgefNCmum1fdHpusDyINJLHXqwgxPVrVrDHqzvKgdFyr/deDtM+n2J6k5LzE2AbSscxnyC7QYQlDKqzwMRoWnGJY76aZrR/XTyyl8vQ5A5lOMtWBTC+ECUS8z8qbNW0bFi2qkSIh5ORoiuzM9oIcZ4Cr6y/vSTzA5Dsycw5uHRGXDdn92BAt/DeCw7Rkg8xSwRBEUMtGODm26y9XTRxjpnoIcV97h70EyYfF9qNE45dBlsOnVqroCCbdIGMvJ46Cwob7Dw2QX4Pld5ZjThGs5YkxAQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 556d8c33-f5f3-4407-9acb-08d6f64e382e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 13:41:52.8983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1508
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOGa2sjw3cAZJxl3WwewVIvucat+Mgjhi4dKIrrgA74=;
 b=qH78ZePBW+R7CeBPNrXxeZnYvTeF8tdm5OoS2Noezrjo0Ka941OJbvYWmwUA6jxffzo93CBgAxAkjlmlRk5qXJbShwq9G9KoF05r2zUA8xvz9UtkzKDCQC8B1ksD/P5pvDpUEUSNpFFlU5JZjVvelN/aQDE8In4qviFJc89GTl0=
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
Content-Type: multipart/mixed; boundary="===============0167353315=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0167353315==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809E4116699CD2B418B0763F7E70BN6PR12MB1809namp_"

--_000_BN6PR12MB1809E4116699CD2B418B0763F7E70BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is this supported on smu7 parts as well?  Might be better to just enable it=
 on the specific asics that support it.  I think it might just be vega20.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Thursday, June 20, 2019 10:07 PM
To: amd-gfx@lists.freedesktop.org
Cc: Quan, Evan
Subject: [PATCH] drm/amd/powerplay: no memory activity support on Vega10

Make mem_busy_percent sysfs interface invisible on Vega10.

Change-Id: Ie39c3217b497a110b0b16e1b08033029bdcf2fc8
Signed-off-by: Evan Quan <evan.quan@amd.com>
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
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809E4116699CD2B418B0763F7E70BN6PR12MB1809namp_
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
Is this supported on smu7 parts as well?&nbsp; Might be better to just enab=
le it on the specific asics that support it.&nbsp; I think it might just be=
 vega20.<br>
</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Thursday, June 20, 2019 10:07 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Quan, Evan<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: no memory activity support on Ve=
ga10</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Make mem_busy_percent sysfs interface invisible on=
 Vega10.<br>
<br>
Change-Id: Ie39c3217b497a110b0b16e1b08033029bdcf2fc8<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
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
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809E4116699CD2B418B0763F7E70BN6PR12MB1809namp_--

--===============0167353315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0167353315==--
