Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0033C8788F
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 13:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959FD6EDA1;
	Fri,  9 Aug 2019 11:30:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810079.outbound.protection.outlook.com [40.107.81.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B276EDA1
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 11:30:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFQTx7ye5MC9XS5YUKsF0oH6DPasta36NeE3mqOwKIty3GfVvj+wuconUJLdBgP2ZgoOIKvEOQITIOVTaaUZLYZpEcROA78gs0FuvtT3bOD+SHJELAetOo5GpklLcw8Wq/gzZbcCXRrALoyEVe9WamHu+zwfVDiM56L+Wvkuc5zQTWtyiPb5+ty+gugdn8DI3Bqg4y6IPjcyZcUem0bosiywhB1yi/l+kiPVz51HXW3q22VbbiHT/uMbL/QAt7BsCF5M62NchAPePy9CW4DfB0oxArShZOK96q9rVbuhFF5nevvRJhLk9a8A7JLWD5TfYjF1SGBRAkw2vnMffw6sXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yc3wpy7OOnt5QkcdZOyhVKUudIw7KllWx/5Trm6ZUig=;
 b=nsIUchZAKcl+8O1HZQjxVSi0dpNgiZs/5qyVf59mCh4kNd+hzaPfcodqepx37v4MyUwO8TD7yUUbEP5Mt3wL5W+ahLDRmJRBm9fsaTrcQT6a8vcKv7MrBl4dhpeAKxXAxgbIAEldJoH5MaSeiZ+FPL9KFF7dyalg5aDIDLsmkbsC/lacN4damxnj0R8RLFix/hyTIRZHAI1RQ1GNq6UMFVYs/+AMd1VduxmDi+1jWMcm66liwYlAlQsTXXM4hUCoreOv6fjDWnFIuXNPJmG6GSRVmh1ovN+m1ElPdxRFAAAnxKYpchqbT0sdOpgo2y1C35Pnws+nBj3r8+tLraZp9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB2911.namprd12.prod.outlook.com (20.179.80.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 11:30:09 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2157.011; Fri, 9 Aug 2019
 11:30:09 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/amdgpu: enable mmhub clock gating for Arcturus
Thread-Topic: [PATCH 4/4] drm/amdgpu: enable mmhub clock gating for Arcturus
Thread-Index: AQHVTqVu4N9yllXLqUWA+Kh2boG1rabyrj9U
Date: Fri, 9 Aug 2019 11:30:09 +0000
Message-ID: <MN2PR12MB32964418478AEB81F9F9C7DDA2D60@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1565350016-7071-1-git-send-email-le.ma@amd.com>,
 <1565350016-7071-4-git-send-email-le.ma@amd.com>
In-Reply-To: <1565350016-7071-4-git-send-email-le.ma@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 221fec69-7223-4582-404f-08d71cbcefbf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2911; 
x-ms-traffictypediagnostic: MN2PR12MB2911:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB29113689A0470D4971138280A2D60@MN2PR12MB2911.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(189003)(199004)(81156014)(53936002)(486006)(6306002)(86362001)(9686003)(236005)(54896002)(105004)(6116002)(966005)(52536014)(5660300002)(8676002)(81166006)(8936002)(14454004)(19627405001)(446003)(11346002)(2501003)(476003)(33656002)(66066001)(102836004)(186003)(55016002)(2906002)(256004)(26005)(6246003)(7736002)(6506007)(76176011)(478600001)(7696005)(74316002)(99286004)(25786009)(71200400001)(71190400001)(53546011)(606006)(110136005)(316002)(3846002)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(6436002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2911;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HqQyIai/bN2GSYfP3QyuReHhShYOhyOcc9E9rawaTiql4r2xLDo5qSg8NrTfHQHrltEAR808cOsdo6QHghhxkO0BCaTqU+7qXaCF7ZeFCIFN0DoR3qN171GlIIZVx7F64XEeLKv1HWs9/s1ln9NHBlJ73iMqflqfIVawyNPHskP4ik9ynJkAwBsXvOcXbc5Wd/xHdTYNdSQZHfQCQ6A9st3ejJRZkcJGkyFmBYtN/juCF5mxDlirSjkh0LyM7hE5w6jB5CzSs84zzUN3R17+K3iY6XLXQABHE4RFIsb4cayXdr9O6yl4IIwlZeDCem3ias4EKjlr/SHujtLn9GBc8NaO6U1KbX+1ZQtqXCrT17e8Wn6LQFsVtS59jf7gywwzQCxaP123ky85qUjFxqL9E8n+wq3UcOFq6UsEEBEIpmg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221fec69-7223-4582-404f-08d71cbcefbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 11:30:09.5773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h7CdYyN/yAh4AlZnROAXQJhTuaEexPLI70ylqdVhrNXac5RPDkIswAa8dym5+/bM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2911
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yc3wpy7OOnt5QkcdZOyhVKUudIw7KllWx/5Trm6ZUig=;
 b=iJrLcJc9C0kDa8Twi968+xMnjWt/4d3x6bNeATtmSlrGhyw+uYyUSPN3qUmaDSqed5t+HGC6M2urLngf2XIlRrkbOWF6X3lceswTRqJwH6bNFZQ0J2kFi1kGuFBSV451EVJnB3XbHGGJKPNU1mq7tAO13XldQ6yyB7w7WmpyTdI=
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
Content-Type: multipart/mixed; boundary="===============0645978981=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0645978981==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32964418478AEB81F9F9C7DDA2D60MN2PR12MB3296namp_"

--_000_MN2PR12MB32964418478AEB81F9F9C7DDA2D60MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Le Ma <l=
e.ma@amd.com>
Sent: Friday, August 9, 2019 7:26 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Ma, Le <Le.Ma@amd.com>
Subject: [PATCH 4/4] drm/amdgpu: enable mmhub clock gating for Arcturus

Init MC_MGCG/LS flag. Also apply to athub CG.

Change-Id: Ic00cb8e6d69eb75dd32f34f778352cee93063ee0
Signed-off-by: Le Ma <le.ma@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c | 1 -
 drivers/gpu/drm/amd/amdgpu/soc15.c      | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c b/drivers/gpu/drm/amd/=
amdgpu/mmhub_v9_4.c
index e52e4d1..0cf7ef4 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
@@ -615,7 +615,6 @@ int mmhub_v9_4_set_clockgating(struct amdgpu_device *ad=
ev,
         return 0;
 }

-/* TODO: get 2 mmhub instances CG state */
 void mmhub_v9_4_get_clockgating(struct amdgpu_device *adev, u32 *flags)
 {
         int data, data1;
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c
index aecba1c..235cb5b 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1126,7 +1126,9 @@ static int soc15_common_early_init(void *handle)
                         AMD_CG_SUPPORT_HDP_MGCG |
                         AMD_CG_SUPPORT_HDP_LS |
                         AMD_CG_SUPPORT_SDMA_MGCG |
-                       AMD_CG_SUPPORT_SDMA_LS;
+                       AMD_CG_SUPPORT_SDMA_LS |
+                       AMD_CG_SUPPORT_MC_MGCG |
+                       AMD_CG_SUPPORT_MC_LS;
                 adev->pg_flags =3D 0;
                 adev->external_rev_id =3D adev->rev_id + 0x32;
                 break;
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB32964418478AEB81F9F9C7DDA2D60MN2PR12MB3296namp_
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
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important">Reviewed-by: Kevi=
n Wang &lt;kevin1.wang@amd.com&gt;</span><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Le Ma &lt;le.ma@amd.com&gt;<b=
r>
<b>Sent:</b> Friday, August 9, 2019 7:26 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Ma, Le &lt;Le.Ma@amd.com&gt;<br>
<b>Subject:</b> [PATCH 4/4] drm/amdgpu: enable mmhub clock gating for Arctu=
rus</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Init MC_MGCG/LS flag. Also apply to athub CG.<br>
<br>
Change-Id: Ic00cb8e6d69eb75dd32f34f778352cee93063ee0<br>
Signed-off-by: Le Ma &lt;le.ma@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c | 1 -<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/soc15.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 =
&#43;&#43;&#43;-<br>
&nbsp;2 files changed, 3 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c b/drivers/gpu/drm/amd/=
amdgpu/mmhub_v9_4.c<br>
index e52e4d1..0cf7ef4 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c<br>
@@ -615,7 &#43;615,6 @@ int mmhub_v9_4_set_clockgating(struct amdgpu_device=
 *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
-/* TODO: get 2 mmhub instances CG state */<br>
&nbsp;void mmhub_v9_4_get_clockgating(struct amdgpu_device *adev, u32 *flag=
s)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int data, data1;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c<br>
index aecba1c..235cb5b 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
@@ -1126,7 &#43;1126,9 @@ static int soc15_common_early_init(void *handle)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_C=
G_SUPPORT_HDP_MGCG |<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_C=
G_SUPPORT_HDP_LS |<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_C=
G_SUPPORT_SDMA_MGCG |<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_CG_SUPPORT_S=
DMA_LS;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_CG_SUPPO=
RT_SDMA_LS |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_CG_SUPPO=
RT_MC_MGCG |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_CG_SUPPO=
RT_MC_LS;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; adev-&gt;pg_flags =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; adev-&gt;external_rev_id =3D adev-&gt;rev_id &#43; 0x=
32;<br>
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

--_000_MN2PR12MB32964418478AEB81F9F9C7DDA2D60MN2PR12MB3296namp_--

--===============0645978981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0645978981==--
