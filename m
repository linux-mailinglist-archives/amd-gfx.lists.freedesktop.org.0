Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C91095A12
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 10:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9846E61B;
	Tue, 20 Aug 2019 07:38:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780048.outbound.protection.outlook.com [40.107.78.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19076E61B
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 07:38:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5vw09yO70WospQZHRvT66nVOscnaprzrd5gmD9etPLebcq0j5NA6W5x7JTHvIpKIIcimBbzW8FQDS9DQ46fi1m8CufL8B5J0YKDdB8almmbOCuRgaUCcX4Jj+xT42Mj4Gtozk+3fjTnl1jBvyl7XJU7kHKke8E6Wk0HCxvt2RjzNo6KCtylBK1YdWhGJaky+n6WHHuNx5yY0J8xBu2oedTB5l6wzg1ebSTx+Z/K3RUUxBPd4YAnPuy5lJdPh0AC7ZSgNL2QPcwz3jDd1vYEw3cvGbzM1DcnBO/kLRfUIhtKzZqmA1yUHZkbg0fIXc5eXy05H3vnuNaDw76X3Pnnqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZPhyga/xBiANMDjDqctXUjZ3iF5LJoHWHCC1aG2TRg=;
 b=Gd+NcO51LS/LF+4lAm7YYPWha3dZnSu31sG4vV3fBBUE/USvlI8DJCdO3ZeCcRLF98ua7d6Th/XAbKm/QerRcIbEMxQ0tjJTF1mi8WbgkNN41X2hjUE2x2yNdRPmy/sL+1hCo/SEbJZKmC44w4kJULAVANOHd7iOTAkxtt/4OahOkslPk6LtftWSi6SvwbJkffQDO3/xD6U7XRFki+wPlUFVmIDHAoHGxUqwqyaC6M2iMa+qby7DiCCmXVbGIcluIT5uMlOL4EoiG2Ehna0jmXnUso8hDIBRxJONGLbNb+N+FyJhoCJ22a8byF47g+BB3jm0PW07EYTFibuzRVPbfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3728.namprd12.prod.outlook.com (10.255.236.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 20 Aug 2019 07:38:39 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.016; Tue, 20 Aug 2019
 07:38:39 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amd/amdgpu: disable MMHUB PG for navi10
Thread-Topic: [PATCH v2] drm/amd/amdgpu: disable MMHUB PG for navi10
Thread-Index: AQHVVydWKpoUd8G60UOY1h584JanLKcDpi2H
Date: Tue, 20 Aug 2019 07:38:39 +0000
Message-ID: <MN2PR12MB32965A42CA8E6609A7BA8FC7A2AB0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1566285434-12651-1-git-send-email-kenneth.feng@amd.com>
In-Reply-To: <1566285434-12651-1-git-send-email-kenneth.feng@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35c01b6c-af09-41be-d2a8-08d725416afb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3728; 
x-ms-traffictypediagnostic: MN2PR12MB3728:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB37288630AD3F5A8F3B0C2792A2AB0@MN2PR12MB3728.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(189003)(199004)(86362001)(74316002)(606006)(8936002)(76116006)(91956017)(71190400001)(66446008)(66946007)(64756008)(66556008)(19627405001)(105004)(66476007)(316002)(81156014)(71200400001)(14454004)(2501003)(8676002)(81166006)(186003)(5660300002)(9686003)(6246003)(54896002)(6436002)(52536014)(256004)(966005)(99286004)(55016002)(33656002)(102836004)(14444005)(486006)(26005)(2906002)(76176011)(53936002)(236005)(446003)(229853002)(476003)(7736002)(66066001)(53546011)(3846002)(6116002)(11346002)(110136005)(478600001)(6306002)(6506007)(7696005)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3728;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jtBs0N/HEWScLRZbPJGqMqT7mZpFSDbKEKXowACYZcT8p8lFPUQw//kYS6DDnSoG/FhunXrMSdeH0f/eBc5MdDiyqggA+vgTihAiCKO1mqIdB7yjuHMm2SqOO/XBOjcYjBVZnetvUW0TvoCYl4XkuCLyasXdzlqdsHsuEkzLpsspQCaS6DIksqP9r6trgKbxhklsXbW8o632wbhv6aAbNKS8R/HbyrrD4PHXX/7ZR8nVY3ZbzpiAAwuSl20ZlrV8JJD7vsmUbpJDyIDpeGrltJk0A46fy8LrMAAR12mMuG7uuOPSKtnH6q6FmgphlcDILIhQP4/Mx7xKFtf2NluSi7wD5t8VPm6BwmNLiBZt/eZEj5pi9Bn2WjIMhM6e1x/wf+CQC3O6CXYBlgNinJHHoxGa6f98Xe6prgQoLu0syNw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c01b6c-af09-41be-d2a8-08d725416afb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 07:38:39.3155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s5C2zuF2zF1mjdTjxC2w95BVT4wBOZFPguzeWeJv4IVgbXOb/WVfWQMsXH+E3Wlk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3728
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZPhyga/xBiANMDjDqctXUjZ3iF5LJoHWHCC1aG2TRg=;
 b=kdG7ctN0uWFqaW93kVdFJgJDOvCDGnOdileV4EgCCp1yMAXJHTa7dT+N2TIg0MS9RH4FwPMte27WuoFNl4+J6svzgeBsYQtOpN1J/z5GgoZ/gDzbYXn23Gl68wvIxvCnRRm3Mf0XZylL/bjOCj8V0CacHfj3qbIOS9bEGJUbprU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0870246884=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0870246884==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32965A42CA8E6609A7BA8FC7A2AB0MN2PR12MB3296namp_"

--_000_MN2PR12MB32965A42CA8E6609A7BA8FC7A2AB0MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Kenneth =
Feng <kenneth.feng@amd.com>
Sent: Tuesday, August 20, 2019 3:17 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Feng, Kenneth <Kenneth.Feng@amd.com>
Subject: [PATCH v2] drm/amd/amdgpu: disable MMHUB PG for navi10

Disable MMHUB PG for navi10 according to the production requirement.

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/n=
v.c
index d4a2012..46f402a 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -616,7 +616,6 @@ static int nv_common_early_init(void *handle)
                         AMD_CG_SUPPORT_BIF_LS;
                 adev->pg_flags =3D AMD_PG_SUPPORT_VCN |
                         AMD_PG_SUPPORT_VCN_DPG |
-                       AMD_PG_SUPPORT_MMHUB |
                         AMD_PG_SUPPORT_ATHUB;
                 adev->external_rev_id =3D adev->rev_id + 0x1;
                 break;
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB32965A42CA8E6609A7BA8FC7A2AB0MN2PR12MB3296namp_
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
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Kevin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Kenneth Feng &lt;kenneth.feng=
@amd.com&gt;<br>
<b>Sent:</b> Tuesday, August 20, 2019 3:17 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;<br>
<b>Subject:</b> [PATCH v2] drm/amd/amdgpu: disable MMHUB PG for navi10</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Disable MMHUB PG for navi10 according to the produ=
ction requirement.<br>
<br>
Signed-off-by: Kenneth Feng &lt;kenneth.feng@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/nv.c | 1 -<br>
&nbsp;1 file changed, 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/n=
v.c<br>
index d4a2012..46f402a 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/nv.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/nv.c<br>
@@ -616,7 &#43;616,6 @@ static int nv_common_early_init(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_C=
G_SUPPORT_BIF_LS;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; adev-&gt;pg_flags =3D AMD_PG_SUPPORT_VCN |<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_P=
G_SUPPORT_VCN_DPG |<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_PG_SUPPORT_M=
MHUB |<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_P=
G_SUPPORT_ATHUB;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; adev-&gt;external_rev_id =3D adev-&gt;rev_id &#43; 0x=
1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB32965A42CA8E6609A7BA8FC7A2AB0MN2PR12MB3296namp_--

--===============0870246884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0870246884==--
