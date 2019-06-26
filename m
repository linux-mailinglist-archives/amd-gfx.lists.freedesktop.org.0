Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0677056D99
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 17:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914F16E47B;
	Wed, 26 Jun 2019 15:26:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700060.outbound.protection.outlook.com [40.107.70.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1ABB6E47B
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 15:26:12 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1220.namprd12.prod.outlook.com (10.168.228.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 15:26:11 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.2008.017; Wed, 26 Jun 2019
 15:26:11 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Set queue_preemption_timeout_ms default value
Thread-Topic: [PATCH] drm/amdgpu: Set queue_preemption_timeout_ms default value
Thread-Index: AQHVLDMGOXB306YnLk+9PYZ8IHgni6auDn3i
Date: Wed, 26 Jun 2019 15:26:11 +0000
Message-ID: <BN6PR12MB1809A633887862F6746B0E63F7E20@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1561562565-24858-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1561562565-24858-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.5.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8517e4d9-2cf7-4b79-66de-08d6fa4a9e81
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1220; 
x-ms-traffictypediagnostic: BN6PR12MB1220:
x-microsoft-antispam-prvs: <BN6PR12MB12204ED7B3279A944B34FAE2F7E20@BN6PR12MB1220.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(366004)(199004)(189003)(66446008)(66946007)(66476007)(66556008)(2906002)(54896002)(55016002)(73956011)(64756008)(9686003)(5660300002)(76176011)(7696005)(8936002)(25786009)(6116002)(76116006)(3846002)(6436002)(8676002)(66066001)(72206003)(68736007)(52536014)(14454004)(86362001)(81166006)(81156014)(54906003)(7736002)(26005)(33656002)(229853002)(110136005)(14444005)(71190400001)(256004)(2501003)(186003)(4326008)(19627405001)(53546011)(6506007)(102836004)(53936002)(74316002)(486006)(11346002)(446003)(478600001)(316002)(105004)(476003)(71200400001)(6246003)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1220;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AGM8eZnCIeXgw1pm4eAZWtaFR0ylOk9pdPf7W3gKmzuqlUoe0wRKoU91uhlIqZx0G/0OSTEBJtQFGWN9/jy0Rx45A4WrSLiTG8X5j+XLZHSYVQNOsxK8TryuMPx5bTqg/GaOlkTYJTmh3aLooEFupetSN5kaSQ54uqmX0VXZID4v48gCH1mb2hnnwQ6WJWREiTmISY77L7hZJFz4NCKOy5A7mgG11m9RCRdsAzGSkzd99vy3mOySBhFdgTPHtfYsZxAERw4FywTYToI9yLPw75BhkfUqFl6XXwLflXrirgvBsi829lLxf0Mdiy0k5V/ZNmlZ4R1Byes/zJZzRZqkmAuw16cMDzFTv6helFg/t6tTXfmgh2lzLLnJZdTMzt5ZnztCf94MyIsnl959xpe79k3o93sEtAYIonRKKRwFg5I=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8517e4d9-2cf7-4b79-66de-08d6fa4a9e81
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 15:26:11.1817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1220
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Js0WR7eoo1+2T+UkW0FCjMCFNmSZ+EdDoMFB2q9Q/d0=;
 b=mXLwdQlzCuFoeWWZ+TOX9muFh+0YwhsKmA+qSzMHP+PGUMYrZ9WysNpcoLmBojuc/kmUsT4bULCEaeoXwKeWKIjGHMjBOlMsQq3dY9hirej89b+00S086sRHQgX+yDr5c4Y6UOL0rngZmEzOjcQWS4smNPbefFftpEd95dnl6Nc=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Li,
 Candice" <Candice.Li@amd.com>
Content-Type: multipart/mixed; boundary="===============1270146162=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1270146162==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809A633887862F6746B0E63F7E20BN6PR12MB1809namp_"

--_000_BN6PR12MB1809A633887862F6746B0E63F7E20BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: Zeng, Oak
Sent: Wednesday, June 26, 2019 11:22 AM
To: amd-gfx@lists.freedesktop.org
Cc: Kuehling, Felix; Deucher, Alexander; Li, Candice; Zeng, Oak
Subject: [PATCH] drm/amdgpu: Set queue_preemption_timeout_ms default value

Set default value of this kernel parameter to 9000

Change-Id: If91db4d2c2ac08e25d7728d49629cbaec0d6c773
Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c
index 7cf6ab0..e74a175 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -700,7 +700,7 @@ MODULE_PARM_DESC(hws_gws_support, "MEC FW support gws b=
arriers (false =3D not supp
   * DOC: queue_preemption_timeout_ms (int)
   * queue preemption timeout in ms (1 =3D Minimum, 9000 =3D default)
   */
-int queue_preemption_timeout_ms;
+int queue_preemption_timeout_ms =3D 9000;
 module_param(queue_preemption_timeout_ms, int, 0644);
 MODULE_PARM_DESC(queue_preemption_timeout_ms, "queue preemption timeout in=
 ms (1 =3D Minimum, 9000 =3D default)");
 #endif
--
2.7.4


--_000_BN6PR12MB1809A633887862F6746B0E63F7E20BN6PR12MB1809namp_
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
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Zeng, Oak<br>
<b>Sent:</b> Wednesday, June 26, 2019 11:22 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Kuehling, Felix; Deucher, Alexander; Li, Candice; Zeng, Oak<br>
<b>Subject:</b> [PATCH] drm/amdgpu: Set queue_preemption_timeout_ms default=
 value</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Set default value of this kernel parameter to 9000=
<br>
<br>
Change-Id: If91db4d2c2ac08e25d7728d49629cbaec0d6c773<br>
Signed-off-by: Oak Zeng &lt;Oak.Zeng@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 7cf6ab0..e74a175 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -700,7 &#43;700,7 @@ MODULE_PARM_DESC(hws_gws_support, &quot;MEC FW supp=
ort gws barriers (false =3D not supp<br>
&nbsp;&nbsp; * DOC: queue_preemption_timeout_ms (int)<br>
&nbsp;&nbsp; * queue preemption timeout in ms (1 =3D Minimum, 9000 =3D defa=
ult)<br>
&nbsp;&nbsp; */<br>
-int queue_preemption_timeout_ms;<br>
&#43;int queue_preemption_timeout_ms =3D 9000;<br>
&nbsp;module_param(queue_preemption_timeout_ms, int, 0644);<br>
&nbsp;MODULE_PARM_DESC(queue_preemption_timeout_ms, &quot;queue preemption =
timeout in ms (1 =3D Minimum, 9000 =3D default)&quot;);<br>
&nbsp;#endif<br>
-- <br>
2.7.4<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809A633887862F6746B0E63F7E20BN6PR12MB1809namp_--

--===============1270146162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1270146162==--
