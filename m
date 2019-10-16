Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA99D9145
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 14:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4383E6E96C;
	Wed, 16 Oct 2019 12:45:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810050.outbound.protection.outlook.com [40.107.81.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F127A6E96C
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 12:45:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrnWD0QE2hCxecuTnLG7vIIcSoHA7JmSoHBQv/nvgJeL1jVoPYWdzUY2ARiUS0dcRUbJ3fxUyoEF5nuWfWh2DmLLQBn9/zCiM0GcCnzH9OrfhJxYVSvK9x1688FULP8awqdM4PhSSoHzMvTao2kEgOSLGdVjaYjwtiOn8TPcYwK25fWcwhY5ZUQGa4KaQfHh6XwnZyELyhUzjOtRW7K5rfXuzkIoiH1MyWDPYdUa2skwQnC9WOsZU2iaWTptsUrnEFToLwQOTuvJUehvaBLB1SgyCe9zw1FoTDqixrS3wOjNwpM35v07qDBJ3jMqZToadFpESF6W4eaYRK4a+i2vlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArhE3zW3jJV9xPhmIEVkfQXU5Y02/Yw+YAYS9GajcIE=;
 b=LAqRhT3VlHj2tb/6jhmUY9uuGPkAZxwBUd3tYlQy8M9lIeefoKEFH/kjDZwky5laSjcrmbqc3KS5VuY2QgmqlpYxsY8u3yErKoGar+DcLyy4iWr/62zwIqX8Xh+6auuCQv7GL7HkmX7/fOxHQet7VUI1VwzJ0QMY9IBCySek3IYex0BWl7RFKbNpzP98Klaj4PuRAAc9Vp1TYHzFvoaXUNrH3cJqfifeYmruO55mG40IcDfTfPjHiVIgOcNXVKNJi9ptHAMYRZ9xfIVAopsoXUej9Homn7ssFungE44nE99rMW9ecB4JlfMP8iACqe1DYDhx5pjXJNV40IAV4BGOBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1137.namprd12.prod.outlook.com (10.168.227.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Wed, 16 Oct 2019 12:45:01 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554%12]) with mapi id 15.20.2347.023; Wed, 16 Oct
 2019 12:45:01 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Gong, Curry" <Curry.Gong@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/psp: declare PSP TA firmware
Thread-Topic: [PATCH] drm/amdgpu/psp: declare PSP TA firmware
Thread-Index: AQHVg8w8mcuE8vPOHEWmQQxGWCkFxaddN2VP
Date: Wed, 16 Oct 2019 12:45:01 +0000
Message-ID: <BN6PR12MB180987D3A7CD9D402B8997F3F7920@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1571194113-22696-1-git-send-email-curry.gong@amd.com>
In-Reply-To: <1571194113-22696-1-git-send-email-curry.gong@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.171.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 174b816d-56be-4120-7736-08d75236a92d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1137:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1137A7B8588B6458039E9EC9F7920@BN6PR12MB1137.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(189003)(199004)(5660300002)(99286004)(4326008)(19627405001)(256004)(2906002)(14454004)(66066001)(966005)(2501003)(8936002)(25786009)(52536014)(476003)(606006)(6436002)(71190400001)(71200400001)(478600001)(33656002)(236005)(6306002)(81156014)(66556008)(86362001)(6116002)(7696005)(110136005)(55016002)(9686003)(8676002)(316002)(486006)(54896002)(6246003)(6506007)(64756008)(81166006)(446003)(53546011)(74316002)(7736002)(229853002)(11346002)(76176011)(26005)(3846002)(186003)(102836004)(66476007)(105004)(66446008)(66946007)(76116006)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1137;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DN9dij9SpiuL/tW5tT01nllo8/IDV6CH/0/ZOxVO7EvOEt7/fNfqJ24mJ3PMDGQGwyEVtpaL2L/cZ3cTKzKePhF7cc6cIrtd9S6E7CN2oYCD4Xbr8v2bGHE+UTW4CRWolIzRlMC3q28kSRPptBqrI0IUkM6p/WHER9gBvtxIp+VyDFPMgR4t0hf698uVz68vG/ehbdm74y0czL1S+LGStxv9onTdPWy96v3Jz1juHlkZVOjjtVdZycXo+k7tf21TTzEk34JwqG2JqVcUgQuTrZJZtv0uY6VK+NWFzY2IpDz8TbKmfhkKrICu7GNCaY1nxaIc8ippgAX4L1v6yEXPwFzwRfa177/DJEcvNqJsmk/ma/hj6oaQByfnDSxwja+TH0yZevBb3G0hfqSv+EVFz4o34AvvjL+TDkcyRIJFYU0y0jRvO49ePwKjuntfQzYPrLMmbX3rfwf3kNFQmxpX3A==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 174b816d-56be-4120-7736-08d75236a92d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 12:45:01.3156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BChKvE9XcUaetnNfZWjTTAqysTDUTjNmo3iQE3R9ArCg3lK+8LI64BjeWi3xrN0VOgoa3LPvJdoWOqa21xnGKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1137
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArhE3zW3jJV9xPhmIEVkfQXU5Y02/Yw+YAYS9GajcIE=;
 b=iz80BB6hZiDx7sZ1vXj5AWjd/epEHF5f5wPtf7tR9KnUWKbHGEGIVSymbS6jgU63E/7Vxm3gxTHIVKFHSCZjXWdZvHMSlNGrUd8ggLjBMzRqkbxwmsWTwHek11oSA2WdrgCsMQiaXiJdOIY2dtyh1FmkSUq7VTpS552gRs5EBGE=
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
Cc: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
Content-Type: multipart/mixed; boundary="===============1417797008=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1417797008==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB180987D3A7CD9D402B8997F3F7920BN6PR12MB1809namp_"

--_000_BN6PR12MB180987D3A7CD9D402B8997F3F7920BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of chen gon=
g <curry.gong@amd.com>
Sent: Tuesday, October 15, 2019 10:48 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Gong, Curry <Curry.Gong=
@amd.com>
Subject: [PATCH] drm/amdgpu/psp: declare PSP TA firmware

Add PSP TA firmware declaration for raven raven2 picasso

Signed-off-by: chen gong <curry.gong@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/psp_v10_0.c
index b96484a..b345e69 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
@@ -40,6 +40,9 @@
 MODULE_FIRMWARE("amdgpu/raven_asd.bin");
 MODULE_FIRMWARE("amdgpu/picasso_asd.bin");
 MODULE_FIRMWARE("amdgpu/raven2_asd.bin");
+MODULE_FIRMWARE("amdgpu/picasso_ta.bin");
+MODULE_FIRMWARE("amdgpu/raven2_ta.bin");
+MODULE_FIRMWARE("amdgpu/raven_ta.bin");

 static int psp_v10_0_init_microcode(struct psp_context *psp)
 {
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB180987D3A7CD9D402B8997F3F7920BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of chen gong &lt;curry.gong@amd.=
com&gt;<br>
<b>Sent:</b> Tuesday, October 15, 2019 10:48 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Lakha, Bhawanpreet &lt;Bhawanpreet.Lakha@amd.com&gt;; Gong, Curr=
y &lt;Curry.Gong@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu/psp: declare PSP TA firmware</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Add PSP TA firmware declaration for raven raven2 p=
icasso<br>
<br>
Signed-off-by: chen gong &lt;curry.gong@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/psp_v10_0.c | 3 &#43;&#43;&#43;<br>
&nbsp;1 file changed, 3 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/psp_v10_0.c<br>
index b96484a..b345e69 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c<br>
@@ -40,6 &#43;40,9 @@<br>
&nbsp;MODULE_FIRMWARE(&quot;amdgpu/raven_asd.bin&quot;);<br>
&nbsp;MODULE_FIRMWARE(&quot;amdgpu/picasso_asd.bin&quot;);<br>
&nbsp;MODULE_FIRMWARE(&quot;amdgpu/raven2_asd.bin&quot;);<br>
&#43;MODULE_FIRMWARE(&quot;amdgpu/picasso_ta.bin&quot;);<br>
&#43;MODULE_FIRMWARE(&quot;amdgpu/raven2_ta.bin&quot;);<br>
&#43;MODULE_FIRMWARE(&quot;amdgpu/raven_ta.bin&quot;);<br>
&nbsp;<br>
&nbsp;static int psp_v10_0_init_microcode(struct psp_context *psp)<br>
&nbsp;{<br>
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

--_000_BN6PR12MB180987D3A7CD9D402B8997F3F7920BN6PR12MB1809namp_--

--===============1417797008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1417797008==--
