Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181F6D164
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 17:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0B16E420;
	Thu, 18 Jul 2019 15:51:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680061.outbound.protection.outlook.com [40.107.68.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54C96E420
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 15:51:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a30x/j82W234vKRcXptR9q0HVvG3vfguyLjXDXgv4E37iWtT8ou6SIItelhmIZNgv1DpGiKWTPQUvIZBcsEp5KrQcz2np4LQNf0avTFm0Ki3uqDjvZbj9cTKt7TOxVzuzuh6YbGzI9nH0i+MQTL5j6EcC/1Y8RViY0TMntxI3QeP4H+g6PiyLgmeJs01vJNrSXrATIph3HPejRgfZCRFxEQbcENGODCyMP4Q/6/f6ahfKm9XgRW6vaHWOwPHZjrGt6KwP1+O1aCBHLqQCTudrD/0MEuqtcyL6KR1AjCBvSv7vjiN/G6KIIw1CvV4pqXFtbzf8Me1eEa3pP3m4K1nBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJTPLlRLMyUQA+jebGp/6cQBT4rOhuF68s8ycWsTsSw=;
 b=OYGrX+qaVyZfJ+1cLMoaEteZJhg6Zrbl6IyblKZYcQubZKpwKXvjrLzSEsdXDlOYli2sFyC5BLyYCnQwlbQB/C96hKvKWRtjGBK51mHqRRyZD/jJR9d2DfxzY314hWjdroFwZKq6QIwnTD+SY5K47bWHI0GcMOJKIItwkI7qLoSSG6t/YPp4hdf3uo/CvDdfPAa5Mq3Jk2i3d9yVn/RSKmGiR3L7SecM2Tue6yGniO44kQup6erqfuAsiXq9Aras6Nj2p703GGElmbn6q6StWtu+gudGsUCsa3MMvHyxjCa7N8uL+KvFQ2L7gcMji3gAFiF2KOd/7xvEmTGeJDoaOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1332.namprd12.prod.outlook.com (10.168.223.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 15:51:01 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c%4]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 15:51:01 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Liu, Leo" <Leo.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/: use VCN firmware offset for cache window
Thread-Topic: [PATCH] drm/amdgpu/: use VCN firmware offset for cache window
Thread-Index: AQHVPYAIY2DyjDQpR0yOJu+nufuNTabQhiHI
Date: Thu, 18 Jul 2019 15:51:01 +0000
Message-ID: <BN6PR12MB180932472127F74480B34989F7C80@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190718154616.14841-1-leo.liu@amd.com>
In-Reply-To: <20190718154616.14841-1-leo.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.160.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1ef279d-c1ba-4798-d8c0-08d70b97bbc5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1332; 
x-ms-traffictypediagnostic: BN6PR12MB1332:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1332512BE8561DFF58AC74F3F7C80@BN6PR12MB1332.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(1496009)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(199004)(189003)(7736002)(966005)(25786009)(55016002)(11346002)(7696005)(99286004)(9686003)(6246003)(68736007)(446003)(53936002)(102836004)(76176011)(478600001)(74316002)(476003)(53546011)(6506007)(6306002)(14454004)(8676002)(316002)(236005)(229853002)(86362001)(2906002)(6436002)(105004)(110136005)(33656002)(486006)(66066001)(66946007)(81156014)(54896002)(6116002)(26005)(71200400001)(52536014)(3846002)(71190400001)(186003)(5660300002)(66476007)(66446008)(76116006)(8936002)(606006)(19627405001)(2501003)(64756008)(66556008)(256004)(81166006)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1332;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qRnIgiWX3rbKG+7sI6AtYoztuiwDdqS6u8sBntMH1/nW5iythDmDTKmFTTz1V42kRRjoZKEHicirbnwP24/1K4tWBDK7urTzRv35kMNAKTlk3x8HOHQ9heWK7D14bxxE2byHFA/F1bLjOTCck5jmqEalpu0DuPDpjtLTWCZ05v004pxTwuxgDpqrdfg0Nf2XnbUbylg4DyJHHjRWX8zvdHdZi3AJx2YsCibJIG/73gFsiTzDcrHSr2yJ7wjEov3PwKrju/V9X9qk+1LdPyuhfbX6NO2wZz//SKpZPNoa3DZV3zx3wnAp77bCbSanEBDh/vFH82oKcXh3+NWIMlGhqQ/gumgFZUxy9yk60G27BvcK40AZ5Bgsdq0Wd+j01rKQEa9lkZkRNbVTnkzq8xwwe+0u6Tcv8aRNKdWLUUMrCFw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ef279d-c1ba-4798-d8c0-08d70b97bbc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 15:51:01.3427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1332
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJTPLlRLMyUQA+jebGp/6cQBT4rOhuF68s8ycWsTsSw=;
 b=owlJx8KBqk2I3sXIz1IHRxu0NeYfal4Ts/gYmqqIM8yGDQtIr3VkHK1lsdxG7t8bNevA124lLZsunwiUXdSOQm8vyqL/7oqKUCrthctVx9T7wT6IiAfJTrF3F8LiOfO40GKHLSjJNkDLUQv04QylsuJ0I22bR5mXMzay4Pf7j+M=
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
Content-Type: multipart/mixed; boundary="===============0808189205=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0808189205==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB180932472127F74480B34989F7C80BN6PR12MB1809namp_"

--_000_BN6PR12MB180932472127F74480B34989F7C80BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Liu, Leo=
 <Leo.Liu@amd.com>
Sent: Thursday, July 18, 2019 11:46 AM
To: amd-gfx@lists.freedesktop.org
Cc: Liu, Leo
Subject: [PATCH] drm/amdgpu/: use VCN firmware offset for cache window

Since we are using the signed FW now, and also using PSP firmware loading,
but it's still potential to break driver when loading FW directly
instead of PSP, so we should add offset.

Signed-off-by: Leo Liu <leo.liu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/am=
dgpu/vcn_v2_0.c
index 3cb62e448a37..88e3dedcf926 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -379,11 +379,8 @@ static void vcn_v2_0_mc_resume(struct amdgpu_device *a=
dev)
                 WREG32_SOC15(UVD, 0, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
                         upper_32_bits(adev->vcn.inst->gpu_addr));
                 offset =3D size;
-               /* No signed header for now from firmware
                 WREG32_SOC15(UVD, 0, mmUVD_VCPU_CACHE_OFFSET0,
                         AMDGPU_UVD_FIRMWARE_OFFSET >> 3);
-               */
-               WREG32_SOC15(UVD, 0, mmUVD_VCPU_CACHE_OFFSET0, 0);
         }

         WREG32_SOC15(UVD, 0, mmUVD_VCPU_CACHE_SIZE0, size);
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB180932472127F74480B34989F7C80BN6PR12MB1809namp_
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Liu, Leo &lt;Leo.Liu@amd.com&=
gt;<br>
<b>Sent:</b> Thursday, July 18, 2019 11:46 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Liu, Leo<br>
<b>Subject:</b> [PATCH] drm/amdgpu/: use VCN firmware offset for cache wind=
ow</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Since we are using the signed FW now, and also usi=
ng PSP firmware loading,<br>
but it's still potential to break driver when loading FW directly<br>
instead of PSP, so we should add offset.<br>
<br>
Signed-off-by: Leo Liu &lt;leo.liu@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c | 3 ---<br>
&nbsp;1 file changed, 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/am=
dgpu/vcn_v2_0.c<br>
index 3cb62e448a37..88e3dedcf926 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c<br>
@@ -379,11 &#43;379,8 @@ static void vcn_v2_0_mc_resume(struct amdgpu_devic=
e *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(UVD, 0, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_H=
IGH,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; upper=
_32_bits(adev-&gt;vcn.inst-&gt;gpu_addr));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; offset =3D size;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* No signed header for now from firmware<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(UVD, 0, mmUVD_VCPU_CACHE_OFFSET0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGP=
U_UVD_FIRMWARE_OFFSET &gt;&gt; 3);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; WREG32_SOC15(UVD, 0, mmUVD_VCPU_CACHE_OFFSET0, 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(UVD, 0, mmUVD=
_VCPU_CACHE_SIZE0, size);<br>
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

--_000_BN6PR12MB180932472127F74480B34989F7C80BN6PR12MB1809namp_--

--===============0808189205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0808189205==--
