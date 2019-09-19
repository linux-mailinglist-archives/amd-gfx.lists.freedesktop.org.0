Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A689B71C4
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 05:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D967D6F7E5;
	Thu, 19 Sep 2019 03:08:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750048.outbound.protection.outlook.com [40.107.75.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16A96F7E5
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 03:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAwwiFyaRnrfCwI4SeKDWeOXle4L/fdauKMFNNXL7LJfkvo3CDvbXE2xgtotRa8IqQGkZnV/EfbPsSzdSZNpsy3R4g2rLK4YhmYZYelFCWugD6yIZg/GkZXODEWj2LV3r/KvzDTHZ7Cs0juXNNmdOk9D6Eslalt3IGDMu4aONFlMrPzzYo5eQlxmmC3gnUSppRXIjsbt41yLDtGB6Jna1CkE+hoQ0gyX1QVjE0vdYzf6oeYfYepQpf1EUEyRbOq/lada4a0S3f0EchoY4V7Sl2EZz7/Ir19jlPXraFxTZVDHN+X6xnofc63wsflZ2qYUlxQp/T4OCW94KnSe1RG7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iit7n3W1bkERqw4VkKhtxMntW+8q5AOLAmVZ7rkJQzg=;
 b=eCOOhNaKQu/whT1ftcl3+wO2qEY1Pf05qeWmcVCx2Dz7w7NPqiUojONnCa3tU0SF4wC6V6d6dq9ROqWvmE4SJFLVh13cD+8RM+oUzxu0UYMVRr8f0LTo5oxheQge2tG2HyEIY6rBa9SPvajCSg0mM7674sTl0a0LBrHctsArlMTANAbEjulgvYK6QXKW9eg4HzaaX/V4J8tZ0x4rdJGbJsijlP57KPwx9BaO1f4YMii8T0IUeZoS0RyiSaEsE0YkY26Y5zR68qspOUWhVtu8HWwaHzCFcNS6ORsSiNHaUg4zWjWMlbibg5GNi4PV8meDsOrgL4NkxP736bSgbLxpbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1298.namprd12.prod.outlook.com (10.168.224.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 19 Sep 2019 03:08:23 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c%12]) with mapi id 15.20.2263.023; Thu, 19 Sep
 2019 03:08:23 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhao, Jiange" <Jiange.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/SRIOV: add navi12 pci id for SRIOV
Thread-Topic: [PATCH] drm/amdgpu/SRIOV: add navi12 pci id for SRIOV
Thread-Index: AQHVbpbwDtpxLcR4KEattH4hOvmp+qcyUbPd
Date: Thu, 19 Sep 2019 03:08:22 +0000
Message-ID: <BN6PR12MB18094B71C12AC53C822CA465F7890@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190919030402.29478-1-jianzh@amd.com>
In-Reply-To: <20190919030402.29478-1-jianzh@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84a992e9-10e2-46e6-73af-08d73caea1b7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1298; 
x-ms-traffictypediagnostic: BN6PR12MB1298:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB12982F00B30AF6185971D3A9F7890@BN6PR12MB1298.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(199004)(189003)(26005)(86362001)(102836004)(66066001)(186003)(606006)(76116006)(7696005)(4326008)(76176011)(52536014)(14454004)(6246003)(229853002)(6436002)(53546011)(966005)(6506007)(316002)(7736002)(110136005)(74316002)(8936002)(66446008)(64756008)(66556008)(66476007)(66946007)(256004)(81156014)(81166006)(54906003)(8676002)(486006)(19627405001)(446003)(11346002)(71200400001)(71190400001)(2906002)(2501003)(476003)(105004)(33656002)(478600001)(9686003)(236005)(54896002)(6306002)(25786009)(55016002)(99286004)(5660300002)(6116002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1298;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZA0yDAXrIWTcIgfYhpHpkheJ/4UBmICoH48Z/v93PcV3ZmUmbboJxLmAk69RNiyI4DQFmDCtIt1NHzbkBcJwqbEqfZQ0xyzrfH0SIvxPvWC9brTof6guFFybuToP2xU8vrGU4zfIn5V4NMMlhxc6dr5mAxcNGOUfSBHDOjIiVoWW6VAsLULHmL1YH6vX/KiS0i4H1et7QHaU20iy2gfpZTGJYjvfRPbK7XnxN6lXrY1RebG/MvASz874aAfnuyMRNQhX6ASyf9Wi9K8bBDA29VEoWtZG1zG6jalzXj71Coef0ehRzimoi/UQpw122IEr91oJqLRiTsL2UZbfwfvkqXQCJlsMi/U4eSFILyAwaN+Z5Vo5GGl1psUGJGGTXKBTwhuArBbpMTOK/Q2wwivGK8/BV+vmVZw2mQ/LPThUDIg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a992e9-10e2-46e6-73af-08d73caea1b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 03:08:22.5937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zo0v9rqXZZMqZwUBT4+XUbcTaBZ+gwll5O8qpMR9FdW/9XiWiPHCnkLFieaZ/GGxUzRl4mOPhPCOEcQuxm/sow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1298
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iit7n3W1bkERqw4VkKhtxMntW+8q5AOLAmVZ7rkJQzg=;
 b=E5cKMXVqPrspp09hVSRfOyqffkoCc5G3dtrfmeydvuVDMoLpxtypgo5WO5aitBHGE57g8dGzgodGDTFN4Oo1wWw4hY8HPMiDDmbnOcpvH9Dg/2awZk3VqaYu895rr3erfZSsBF9WO1O/QCZdQ61ZLTd1Ct7Hku6f2cChXkXipS8=
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
Cc: "Zhao, Jiange" <Jiange.Zhao@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>, "Nieto, David M" <David.Nieto@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: multipart/mixed; boundary="===============1113703662=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1113703662==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18094B71C12AC53C822CA465F7890BN6PR12MB1809namp_"

--_000_BN6PR12MB18094B71C12AC53C822CA465F7890BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of jianzh@a=
md.com <jianzh@amd.com>
Sent: Wednesday, September 18, 2019 11:04 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Zhao, Jiange <Jiange.Zhao@amd.com>; Xiao, Jack <Jack.Xiao@amd.com>; Den=
g, Emily <Emily.Deng@amd.com>; Nieto, David M <David.Nieto@amd.com>; Koenig=
, Christian <Christian.Koenig@amd.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com=
>
Subject: [PATCH] drm/amdgpu/SRIOV: add navi12 pci id for SRIOV

From: Jiange Zhao <Jiange.Zhao@amd.com>

Add Navi12 PCI id support.

Signed-off-by: Jiange Zhao <Jiange.Zhao@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c
index 420888e941df..b52c7255e5e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1034,6 +1034,7 @@ static const struct pci_device_id pciidlist[] =3D {

         /* Navi12 */
         {0x1002, 0x7360, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_NAVI12},
+       {0x1002, 0x7362, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_NAVI12},

         {0, 0, 0}
 };
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18094B71C12AC53C822CA465F7890BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of jianzh@amd.com &lt;jianzh@amd=
.com&gt;<br>
<b>Sent:</b> Wednesday, September 18, 2019 11:04 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Zhao, Jiange &lt;Jiange.Zhao@amd.com&gt;; Xiao, Jack &lt;Jack.Xi=
ao@amd.com&gt;; Deng, Emily &lt;Emily.Deng@amd.com&gt;; Nieto, David M &lt;=
David.Nieto@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;=
; Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu/SRIOV: add navi12 pci id for SRIOV</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Jiange Zhao &lt;Jiange.Zhao@amd.com&gt;<br>
<br>
Add Navi12 PCI id support.<br>
<br>
Signed-off-by: Jiange Zhao &lt;Jiange.Zhao@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 1 &#43;<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 420888e941df..b52c7255e5e4 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -1034,6 &#43;1034,7 @@ static const struct pci_device_id pciidlist[] =3D=
 {<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Navi12 */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {0x1002, 0x7360, PCI_ANY_I=
D, PCI_ANY_ID, 0, 0, CHIP_NAVI12},<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {0x1002, 0x7362, PCI_ANY_ID, PCI_=
ANY_ID, 0, 0, CHIP_NAVI12},<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {0, 0, 0}<br>
&nbsp;};<br>
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18094B71C12AC53C822CA465F7890BN6PR12MB1809namp_--

--===============1113703662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1113703662==--
