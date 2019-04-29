Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F485E415
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2019 15:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD64891AC;
	Mon, 29 Apr 2019 13:58:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750075.outbound.protection.outlook.com [40.107.75.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D55891AC
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 13:58:17 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1698.namprd12.prod.outlook.com (10.175.101.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Mon, 29 Apr 2019 13:58:12 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853%12]) with mapi id 15.20.1835.018; Mon, 29 Apr
 2019 13:58:12 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: enable ppfeaturemask module parameter
 support on Vega20
Thread-Topic: [PATCH] drm/amd/powerplay: enable ppfeaturemask module parameter
 support on Vega20
Thread-Index: AQHU/mlppA+ID7lGGkOIZ25pfPt5uaZTKkfy
Date: Mon, 29 Apr 2019 13:58:12 +0000
Message-ID: <BN6PR12MB180930F6C8AB56ED967CD9A4F7390@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190429085603.15659-1-evan.quan@amd.com>
In-Reply-To: <20190429085603.15659-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.84.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 584ddd9f-ebca-47cf-480a-08d6ccaab839
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1698; 
x-ms-traffictypediagnostic: BN6PR12MB1698:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB16986438796A9A1B223EC722F7390@BN6PR12MB1698.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:466;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39860400002)(366004)(396003)(136003)(189003)(199004)(76116006)(52536014)(55016002)(229853002)(7696005)(66066001)(606006)(68736007)(66446008)(64756008)(66556008)(316002)(2501003)(73956011)(66946007)(74316002)(76176011)(7736002)(2906002)(66476007)(86362001)(19627405001)(256004)(5660300002)(8676002)(486006)(33656002)(3846002)(11346002)(105004)(26005)(6116002)(476003)(81156014)(6246003)(186003)(81166006)(99286004)(110136005)(71200400001)(8936002)(446003)(25786009)(14454004)(6506007)(966005)(9686003)(478600001)(54896002)(6306002)(236005)(72206003)(53936002)(97736004)(6436002)(102836004)(71190400001)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1698;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ot0Exof6EV3a4hew1MKZI4rIs/n+0dgoJ804d4DeA/Hrb0cd/G2wf46EOcZglca//BJY9H2HOkaIALEKP9hSl5WtcOtnmLyOGBm6IhVoOyqRkulxhgmxTyzalkInwmuF3DMQf7z6rAk2WixlOEL1pv8a2iO+RguJaetbxNkqCWW3g1yfvJjIRRJF+kwKHNG854fXRVA0zqCIdcwExOVsEQm+v6jrOhbHnEHPY6XPaMblNiVceB3FPOcLnieo+02W2IR1PjFAQYQLL9Kga8dwlYI3mT+F+UDPIptLWm3vgxlK1PzuDyRUk/RvuAOrPHtNH8TKlSlKGfYwiJNpIAPLRBAUY7APiXvOFU2e1uhxOitX3BKcHYPbzbplLd56W0zcNlaYRvSjIJO/Xg90Eqq4pOI6gfZCVBmA45glcl0H73k=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 584ddd9f-ebca-47cf-480a-08d6ccaab839
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 13:58:12.5701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1698
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MKGlFwLGa2AJirZ6f4uijunU5QGBqPby7zWZRrBkMM=;
 b=ypPp9jmDgvAocfoPQbC7a7GaJhuqNewklNveZxG5//Q14hdTI3xFYlncXrGSnH+rO7zkV5glHeF4qET+EyyrrtAq/TIINyuTPPIBpgfE7q1+yyq5D15l8l25WEGzHryfDbWUhvohFjrZKpmk4jzzprD2UyYgnG2vAfBFQ3qkat0=
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
Content-Type: multipart/mixed; boundary="===============1587447981=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1587447981==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB180930F6C8AB56ED967CD9A4F7390BN6PR12MB1809namp_"

--_000_BN6PR12MB180930F6C8AB56ED967CD9A4F7390BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Monday, April 29, 2019 4:56 AM
To: amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander; Quan, Evan
Subject: [PATCH] drm/amd/powerplay: enable ppfeaturemask module parameter s=
upport on Vega20

Support DPM/DS/ULV related bitmasks of ppfeaturemask module parameter.

Change-Id: I6b75becf8d39105189b30be41b58ec7d4425f356
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 .../drm/amd/powerplay/hwmgr/vega20_hwmgr.c    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
index 91e26f8b3758..d7873df484a4 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
@@ -97,6 +97,27 @@ static void vega20_set_default_registry_data(struct pp_h=
wmgr *hwmgr)
         if (hwmgr->smu_version < 0x282100)
                 data->registry_data.disallowed_features |=3D FEATURE_ECC_M=
ASK;

+       if (!(hwmgr->feature_mask & PP_PCIE_DPM_MASK))
+               data->registry_data.disallowed_features |=3D FEATURE_DPM_LI=
NK_MASK;
+
+       if (!(hwmgr->feature_mask & PP_SCLK_DPM_MASK))
+               data->registry_data.disallowed_features |=3D FEATURE_DPM_GF=
XCLK_MASK;
+
+       if (!(hwmgr->feature_mask & PP_SOCCLK_DPM_MASK))
+               data->registry_data.disallowed_features |=3D FEATURE_DPM_SO=
CCLK_MASK;
+
+       if (!(hwmgr->feature_mask & PP_MCLK_DPM_MASK))
+               data->registry_data.disallowed_features |=3D FEATURE_DPM_UC=
LK_MASK;
+
+       if (!(hwmgr->feature_mask & PP_DCEFCLK_DPM_MASK))
+               data->registry_data.disallowed_features |=3D FEATURE_DPM_DC=
EFCLK_MASK;
+
+       if (!(hwmgr->feature_mask & PP_ULV_MASK))
+               data->registry_data.disallowed_features |=3D FEATURE_ULV_MA=
SK;
+
+       if (!(hwmgr->feature_mask & PP_SCLK_DEEP_SLEEP_MASK))
+               data->registry_data.disallowed_features |=3D FEATURE_DS_GFX=
CLK_MASK;
+
         data->registry_data.od_state_in_dc_support =3D 0;
         data->registry_data.thermal_support =3D 1;
         data->registry_data.skip_baco_hardware =3D 0;
--
2.21.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB180930F6C8AB56ED967CD9A4F7390BN6PR12MB1809namp_
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
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Monday, April 29, 2019 4:56 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Deucher, Alexander; Quan, Evan<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: enable ppfeaturemask module para=
meter support on Vega20</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Support DPM/DS/ULV related bitmasks of ppfeaturema=
sk module parameter.<br>
<br>
Change-Id: I6b75becf8d39105189b30be41b58ec7d4425f356<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;.../drm/amd/powerplay/hwmgr/vega20_hwmgr.c&nbsp;&nbsp;&nbsp; | 21 &#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 21 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
index 91e26f8b3758..d7873df484a4 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
@@ -97,6 &#43;97,27 @@ static void vega20_set_default_registry_data(struct =
pp_hwmgr *hwmgr)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (hwmgr-&gt;smu_version =
&lt; 0x282100)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; data-&gt;registry_data.disallowed_features |=3D FEATU=
RE_ECC_MASK;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(hwmgr-&gt;feature_mask &amp=
; PP_PCIE_DPM_MASK))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; data-&gt;registry_data.disallowed_features |=3D FEATURE_DPM_=
LINK_MASK;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(hwmgr-&gt;feature_mask &amp=
; PP_SCLK_DPM_MASK))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; data-&gt;registry_data.disallowed_features |=3D FEATURE_DPM_=
GFXCLK_MASK;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(hwmgr-&gt;feature_mask &amp=
; PP_SOCCLK_DPM_MASK))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; data-&gt;registry_data.disallowed_features |=3D FEATURE_DPM_=
SOCCLK_MASK;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(hwmgr-&gt;feature_mask &amp=
; PP_MCLK_DPM_MASK))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; data-&gt;registry_data.disallowed_features |=3D FEATURE_DPM_=
UCLK_MASK;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(hwmgr-&gt;feature_mask &amp=
; PP_DCEFCLK_DPM_MASK))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; data-&gt;registry_data.disallowed_features |=3D FEATURE_DPM_=
DCEFCLK_MASK;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(hwmgr-&gt;feature_mask &amp=
; PP_ULV_MASK))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; data-&gt;registry_data.disallowed_features |=3D FEATURE_ULV_=
MASK;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(hwmgr-&gt;feature_mask &amp=
; PP_SCLK_DEEP_SLEEP_MASK))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; data-&gt;registry_data.disallowed_features |=3D FEATURE_DS_G=
FXCLK_MASK;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;registry_data.od_=
state_in_dc_support =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;registry_data.the=
rmal_support =3D 1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;registry_data.ski=
p_baco_hardware =3D 0;<br>
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

--_000_BN6PR12MB180930F6C8AB56ED967CD9A4F7390BN6PR12MB1809namp_--

--===============1587447981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1587447981==--
