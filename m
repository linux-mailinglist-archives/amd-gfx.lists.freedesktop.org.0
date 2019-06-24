Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A2251A30
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 20:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CCB89B5F;
	Mon, 24 Jun 2019 18:00:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680041.outbound.protection.outlook.com [40.107.68.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F2889B5F
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 18:00:24 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1363.namprd12.prod.outlook.com (10.168.228.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 18:00:21 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 18:00:21 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amd/display: update infoframe after dig fe is
 turned on (v2)
Thread-Topic: [PATCH v2] drm/amd/display: update infoframe after dig fe is
 turned on (v2)
Thread-Index: AQHVKrZ+k64eX6xTVEKgmw//x/FBTKarF+F7
Date: Mon, 24 Jun 2019 18:00:21 +0000
Message-ID: <BN6PR12MB18091CE5FB4DD0A59853D849F7E00@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190624175847.26253-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190624175847.26253-1-nicholas.kazlauskas@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.5.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8520139d-76a8-4d7c-6a52-08d6f8cdd306
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1363; 
x-ms-traffictypediagnostic: BN6PR12MB1363:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1363AC6962BA77816F101658F7E00@BN6PR12MB1363.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(366004)(376002)(39860400002)(136003)(189003)(199004)(25786009)(14454004)(186003)(66476007)(4326008)(2906002)(5660300002)(15650500001)(71190400001)(53936002)(7736002)(11346002)(476003)(966005)(86362001)(236005)(6306002)(6246003)(73956011)(71200400001)(8936002)(316002)(66556008)(478600001)(76116006)(2501003)(6116002)(486006)(105004)(66066001)(26005)(66946007)(606006)(74316002)(6436002)(6506007)(53546011)(3846002)(64756008)(8676002)(229853002)(14444005)(256004)(76176011)(66446008)(54896002)(68736007)(81166006)(19627405001)(81156014)(55016002)(99286004)(33656002)(102836004)(9686003)(72206003)(446003)(52536014)(54906003)(7696005)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1363;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u+27s8uM3dqqFsLRhz0njC6UodqG33iPXdIDO8XgXnkmXXWONQHELVJh/U1OFjwYxWczWuOzcuj2TFOL5QaNodrpyB2cZsupiYYikZzZqumBifRZTapGn8wZeIY4hDNHTAamFVpylatpFPY/PicQpXNueW8pBIK980Xs4Tv/u7gdtvQNdhth95ZpIZJHT5Uj9M5+2pX2vLRT1AbipZL+h3dKpDH5Tcg1wQayPBtaMqG6cdjqcr+d30zr4bEQJkjngInqNC5C7I1jI8LA5ibOlXhqgorxBNTd/4MJ0qOSWV2EtM/AX27fCDzNH7fGWov464x0xQUcy1PeAnFpOZKBNrtl5mhTKtmBV4MTs/CtQwPm2j3ZALQGOU+NHmItvUSsokp9sPkRzw7cKA8YkMPb2hwsslGxgkq3657G+1Vfy7o=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8520139d-76a8-4d7c-6a52-08d6f8cdd306
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 18:00:21.1340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1363
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7X7Om6XM1JTMLKYZGS27zdyqY//hROV2mg0KItJ9ZsU=;
 b=KPXtEMehSYPlRO8Cx3DGWl0IMUysF6LIZsjcyDsju46UPHasPoLjDAQzw+WAQ17tWB2cLU/O8ZCoOtjOZr0nVXwfCQqoZdOv0FaOiHVdcDss5mQSV/owXM5hWRBuIaslJ875yFjpKbxluWulNNFjTpX0RTFuW0JUGDcLozkXfjk=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Li, Roman" <Roman.Li@amd.com>
Content-Type: multipart/mixed; boundary="===============0507749674=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0507749674==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18091CE5FB4DD0A59853D849F7E00BN6PR12MB1809namp_"

--_000_BN6PR12MB18091CE5FB4DD0A59853D849F7E00BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Nicholas=
 Kazlauskas <nicholas.kazlauskas@amd.com>
Sent: Monday, June 24, 2019 1:58 PM
To: amd-gfx@lists.freedesktop.org
Cc: Li, Sun peng (Leo); Wentland, Harry; Kazlauskas, Nicholas; Li, Roman
Subject: [PATCH v2] drm/amd/display: update infoframe after dig fe is turne=
d on (v2)

[Why]
The AVI infoframe is incorrectly programmed on DCN1/2 when enabling a
stream - causing the wrong pixel encoding to be used for display.

This is because the AVI infoframe is programmed before the DIG BE is
connected to the FE and turned on, so enabling the AFMT block doesn't
actually work and the registers subsequently can't be written to.

[How]
Program the infoframe *after* turning on the DIG FE. This was the
behavior previously used but it was incorrectly reverted
when adding the DCN2 HW sequencer code.

v2: Don't call update_info_frame twice

Fixes: 54ff35915948 ("drm/amd/display: Add DCN2 HW Sequencer and Resource")

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Roman Li <roman.li@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/=
drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index 940e74b7d2c6..84d90b475e2a 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -686,6 +686,7 @@ void dce110_enable_stream(struct pipe_ctx *pipe_ctx)
                                                         dmdata_dp : dmdata=
_hdmi);
         }
 #endif
+       dce110_update_info_frame(pipe_ctx);

         /* enable early control to avoid corruption on DP monitor*/
         active_total_with_borders =3D
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18091CE5FB4DD0A59853D849F7E00BN6PR12MB1809namp_
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
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Nicholas Kazlauskas &lt;nic=
holas.kazlauskas@amd.com&gt;<br>
<b>Sent:</b> Monday, June 24, 2019 1:58 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Li, Sun peng (Leo); Wentland, Harry; Kazlauskas, Nicholas; Li, R=
oman<br>
<b>Subject:</b> [PATCH v2] drm/amd/display: update infoframe after dig fe i=
s turned on (v2)</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">[Why]<br>
The AVI infoframe is incorrectly programmed on DCN1/2 when enabling a<br>
stream - causing the wrong pixel encoding to be used for display.<br>
<br>
This is because the AVI infoframe is programmed before the DIG BE is<br>
connected to the FE and turned on, so enabling the AFMT block doesn't<br>
actually work and the registers subsequently can't be written to.<br>
<br>
[How]<br>
Program the infoframe *after* turning on the DIG FE. This was the<br>
behavior previously used but it was incorrectly reverted<br>
when adding the DCN2 HW sequencer code.<br>
<br>
v2: Don't call update_info_frame twice<br>
<br>
Fixes: 54ff35915948 (&quot;drm/amd/display: Add DCN2 HW Sequencer and Resou=
rce&quot;)<br>
<br>
Cc: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
Cc: Roman Li &lt;roman.li@amd.com&gt;<br>
Cc: Leo Li &lt;sunpeng.li@amd.com&gt;<br>
Signed-off-by: Nicholas Kazlauskas &lt;nicholas.kazlauskas@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 1 &#43;=
<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/=
drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c<br>
index 940e74b7d2c6..84d90b475e2a 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer=
.c<br>
@@ -686,6 &#43;686,7 @@ void dce110_enable_stream(struct pipe_ctx *pipe_ctx=
)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dmdata_dp : dmdata_hdmi);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;#endif<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dce110_update_info_frame(pipe_ctx=
);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* enable early control to=
 avoid corruption on DP monitor*/<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active_total_with_borders =
=3D<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18091CE5FB4DD0A59853D849F7E00BN6PR12MB1809namp_--

--===============0507749674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0507749674==--
