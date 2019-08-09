Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62B187867
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 13:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDAA8909C;
	Fri,  9 Aug 2019 11:29:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam01on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe42::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767BB6ED9E
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 11:29:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4JyfR9bV4JVIrx3synFMGnoJ8hvE2NL83tHAQaFKYKBMS7OkPO7aPhQwVbejDfNnQp1zGLs0XKIUrfwPYCx4blw3nQ7rTsKFXy+VRfbyZ7ebbQuHzvqdqg2DmjZc9sTrLsdhfu7BcOKwHVeSIwnUEWuuGwWcKhSJG+rVXVFBDAHuEKAy117M1Ru4hTpbbEy/BAjZtFpgTb0gjsY7SdvzJbr0qtfOz7nCiFKxPpWIW+hmA21JHqqcSgg9hM3Z3WUYxYp2lGFTTW81pTpMWlpbUf3KmrzBp1lfzht7+xAS2EKNxxfbaKwTsms1zoSrtSKdvSABqeT6jKZ/McYPl5Afg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSAMb++yu4YOCYNY2zz3WJVKiZzINpRbOHCfz0QvWn8=;
 b=bR4bqo1wM+wFZ2lTEEvxCwu/JjLqggsgLCMbJm9RgyOkfefsmiBJT+7v9U/MoGVwJtNLmwzltFrMeiP327mcPy7CouIAIuJyXV0e1hCUCwlooHfRB8Ko5Hi2xzTJT1plVTTjvFZ3oCigx6G/pRj4SpDrsCH3CcESYJe+byqMDF48YKpMU4uMhV2t+PQ+EYt2mlPVtxAlx41eBrDDn5l8betxipXrdx3dYNPWTXWggaxCjISFQBzBIUDckHShgsxP9akubIQ9JNrzQe018gQ/IoNAJTwT7BSld26c6Sx/SukUYD6GM/FbkT52W8e1bftESduXnII4DbRZT717vDzwIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB2911.namprd12.prod.outlook.com (20.179.80.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 11:29:23 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2157.011; Fri, 9 Aug 2019
 11:29:23 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/amdgpu: add GFX_CP_LS flag to Arcturus
Thread-Topic: [PATCH 1/4] drm/amdgpu: add GFX_CP_LS flag to Arcturus
Thread-Index: AQHVTqVi/caRx8fhj0O6Ezgf12C/Yqbyrgli
Date: Fri, 9 Aug 2019 11:29:23 +0000
Message-ID: <MN2PR12MB3296A341FF8A18786D197368A2D60@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1565350016-7071-1-git-send-email-le.ma@amd.com>
In-Reply-To: <1565350016-7071-1-git-send-email-le.ma@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9193bf55-ad52-46e3-4e63-08d71cbcd409
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2911; 
x-ms-traffictypediagnostic: MN2PR12MB2911:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2911DA71712F395DEBA1F640A2D60@MN2PR12MB2911.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:196;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(189003)(199004)(81156014)(53936002)(486006)(6306002)(86362001)(9686003)(236005)(54896002)(105004)(6116002)(966005)(52536014)(5660300002)(8676002)(81166006)(8936002)(14454004)(19627405001)(446003)(11346002)(2501003)(476003)(33656002)(66066001)(102836004)(186003)(55016002)(2906002)(256004)(26005)(6246003)(7736002)(6506007)(76176011)(478600001)(7696005)(74316002)(99286004)(25786009)(71200400001)(71190400001)(53546011)(606006)(110136005)(316002)(3846002)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(6436002)(229853002)(357404004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2911;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BwMyepnQ02Qnjb8LHfuEMKyZvsJVGQQ+aHupIJpTpz6fkZkC2tL+yhrOdYNYD/N74oImz6C8X0cGXUCifpE5YyKcrEjs+nA6kAvTD+B6mG00RDzaQF5Yo1AHV6ByInOX1bdACS3uZsGAH+diLrkO4z9pKg0URxC7GkNDqLOtiO6Fa/Q5aZPEQDqpCOhVhS5mL/8dBVX10z3KTueALu6EbaMth+DL3tdIztwuHIjltTDPYBjCptXWC4GUVVxR6DhLbfqu7guI4zsvCp4Bm6UGtMQ+gGtpxBLvN2BsjMZ9q6GplJuHllnWCiAcosY4IqFx04EmQgu5urz8Fw+shPUTCrjydfNSbrbUyijPgDyyFMHwGyXzIwGsMy9tPRRVN86Ztu363+aoxKRnBKNq9BZkuJB/QZxqOjIzktK5hphdpuc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9193bf55-ad52-46e3-4e63-08d71cbcd409
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 11:29:23.0804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kmsm8edHpL2Ggg+qKJEhH4axRFRco4ivnFqDZALbvpSIUO/4YGnql/XCmnEb/7to
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2911
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSAMb++yu4YOCYNY2zz3WJVKiZzINpRbOHCfz0QvWn8=;
 b=tke2wM7X4+azH7wCF2nvHdyGrE9rQ2kFa6LnMfGuD+6OCpNQDFQORSWLQSReV8pt/LwMe6ARmoFsR3pfEVSp9ksIOit47v9oitebLDNetVXURRJg28oI3fxLjMPxSinM2AXx9xDmJwmlB8MV8t/NlhnBcJ1B48jRnU8hdB3wylw=
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
Content-Type: multipart/mixed; boundary="===============1556799105=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1556799105==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296A341FF8A18786D197368A2D60MN2PR12MB3296namp_"

--_000_MN2PR12MB3296A341FF8A18786D197368A2D60MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Le Ma <l=
e.ma@amd.com>
Sent: Friday, August 9, 2019 7:26 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Ma, Le <Le.Ma@amd.com>
Subject: [PATCH 1/4] drm/amdgpu: add GFX_CP_LS flag to Arcturus

Missed AMD_CG_SUPPORT_GFX_CP_LS accidently when commit patch before
    drm/amdgpu: enable gfx clock gating for Arcturus

Change-Id: I9d70319dd07f7d642416cb260f9f5b3342b6f3f2
Signed-off-by: Le Ma <le.ma@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/soc15.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c
index 261493a..aecba1c 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1122,6 +1122,7 @@ static int soc15_common_early_init(void *handle)
                         AMD_CG_SUPPORT_GFX_MGLS |
                         AMD_CG_SUPPORT_GFX_CGCG |
                         AMD_CG_SUPPORT_GFX_CGLS |
+                       AMD_CG_SUPPORT_GFX_CP_LS |
                         AMD_CG_SUPPORT_HDP_MGCG |
                         AMD_CG_SUPPORT_HDP_LS |
                         AMD_CG_SUPPORT_SDMA_MGCG |
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296A341FF8A18786D197368A2D60MN2PR12MB3296namp_
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
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
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
<b>Subject:</b> [PATCH 1/4] drm/amdgpu: add GFX_CP_LS flag to Arcturus</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Missed AMD_CG_SUPPORT_GFX_CP_LS accidently when co=
mmit patch before<br>
&nbsp;&nbsp;&nbsp; drm/amdgpu: enable gfx clock gating for Arcturus<br>
<br>
Change-Id: I9d70319dd07f7d642416cb260f9f5b3342b6f3f2<br>
Signed-off-by: Le Ma &lt;le.ma@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/soc15.c | 1 &#43;<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c<br>
index 261493a..aecba1c 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
@@ -1122,6 &#43;1122,7 @@ static int soc15_common_early_init(void *handle)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_C=
G_SUPPORT_GFX_MGLS |<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_C=
G_SUPPORT_GFX_CGCG |<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_C=
G_SUPPORT_GFX_CGLS |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_CG_SUPPO=
RT_GFX_CP_LS |<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_C=
G_SUPPORT_HDP_MGCG |<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_C=
G_SUPPORT_HDP_LS |<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_C=
G_SUPPORT_SDMA_MGCG |<br>
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

--_000_MN2PR12MB3296A341FF8A18786D197368A2D60MN2PR12MB3296namp_--

--===============1556799105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1556799105==--
