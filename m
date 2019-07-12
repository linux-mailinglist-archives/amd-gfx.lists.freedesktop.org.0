Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC88D66476
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 04:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DECE6E2A3;
	Fri, 12 Jul 2019 02:36:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780081.outbound.protection.outlook.com [40.107.78.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482046E2A2
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 02:36:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsIokx8UhbyNCoIb6PC7oUjapIrgBKW2I1tz2CcznPSUK9lA6j1zZKcA42iRWbehHSjpwE3C7hi1Z1oGEYOpNfb8McHhIFezaTjsn7X2f9gMN+VG8iPhUrAS/OwOneJi9cDRlM7EnVedrwNmoJtU4LFTH7phG4ntu0uxG1iDvSK0kd5FUDE/HBR3Ix1f2xj4T0JZnVROTEpFKMPfDoSb0Rr06ErtBt6wF4zBCD6Jsc3KcHPaWFXM+CBz12fV7Gll0Orvt7XL8zZR46++e1Wa6T/3ojL03iGOp+DlpJ4Lbx5O0gJggKWwzkI/wFap+BetW9rc+d0SNKMkbLBR0Il0ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7l4pLV2Xr+Siim0wzFlKn4Hu5PWUbv9aI6m6JM/29I=;
 b=CIk7e7dCpP/ok1fBZuitZNyTrQsqzWThg1lDkc9TJshPkhvqFHXzhVaxeeeCibOznu5JyjqY1wBI2DN7G4fv7ny4g8Tbv6BMyFFncMXOq8e+h0qaAPDmrbDl8pFiVd84+fW3XN1hV3AnQgyCvRJkk8IA9NgQncx2aRdXGo+c4DCGFWkZ9UYUPotySypF/KxBlVsWVDrLjhAyAcp9YagS6rOqAfK91k8xo+2m/K4yniiZl2k6cD9vYOXrtaRyeqZH6SM8lk9uNe9pBVPWU53Gl8Cfa/GpPhGnqDvSpSTCrdOWpPEOxyd5xZhzdyMACXfMcYr1UohHWGdlyuU6GqVJLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3661.namprd12.prod.outlook.com (10.255.86.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 12 Jul 2019 02:36:51 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2052.020; Fri, 12 Jul 2019
 02:36:51 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: fix memory allocation failure check
Thread-Topic: [PATCH] drm/amd/powerplay: fix memory allocation failure check
Thread-Index: AQHVOFpoB3Tmz/DMuk+J1bqvr0fucqbGRInT
Date: Fri, 12 Jul 2019 02:36:51 +0000
Message-ID: <MN2PR12MB3296448DA6C09735C3DDD21CA2F20@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190712023446.8758-1-evan.quan@amd.com>
In-Reply-To: <20190712023446.8758-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cdc96db-6e7b-4071-7bcf-08d70671cbbc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3661; 
x-ms-traffictypediagnostic: MN2PR12MB3661:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3661FC1381A9A8224CF4B137A2F20@MN2PR12MB3661.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:191;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(189003)(199004)(6606003)(74316002)(33656002)(14454004)(478600001)(68736007)(25786009)(229853002)(8676002)(6116002)(3846002)(86362001)(966005)(81156014)(81166006)(8936002)(7736002)(66066001)(2906002)(476003)(11346002)(316002)(446003)(52536014)(5660300002)(110136005)(7696005)(76176011)(102836004)(26005)(186003)(53546011)(6506007)(486006)(2501003)(14444005)(66446008)(76116006)(66946007)(66476007)(66556008)(64756008)(256004)(99286004)(236005)(55016002)(9686003)(54896002)(6306002)(53936002)(6246003)(6436002)(19627405001)(71190400001)(606006)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3661;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PK4Dyk46mL7SLETXmZbVid8ZYvWf1fTzul28MZ3sDktL1LEA+ndFcbm6WnHUZIlfUiJL4aTVagh7Z7/AUK0YhNHD0Y9V54Ml0lD97f7gLZx4nQO8hmW5wIiN9UVt4xOOo7rFOzdijPd8FCVonkNo7T6F0jPuIO3MU+x/Kl4TAfrBeUcOGCfA0Kkib1v9TOlW6X/ztM+g8ZZXe4XLoXgFc7TTSWCher+qBB29vtSLMElQvX8ut0o50rzo7wKC6Fd65Mm4Ox1Aukk1byQawIXKhxU6EQP7W4AyESHepcPPwpAJB5QKZTxdLHEJOmt4+zQsygk4Tp9hF/9uvYN0g9qhRYP4NbtL0SK2b8vEks5T+8jbpsLct9hZraIvtZJEYlftEdPVeEiEBFJF1yQ1yoHBcD0ZBQ1z+nCe4iF8u+o2XLs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cdc96db-6e7b-4071-7bcf-08d70671cbbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 02:36:51.3524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3661
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7l4pLV2Xr+Siim0wzFlKn4Hu5PWUbv9aI6m6JM/29I=;
 b=ughbjlbb5hhf8T/B64n04Zg6qa+9kh5LRdHuSDCsrBoEOIiE/Cqj2RFcEXSpmTO4RoGmztO5vzMvZE2rYuBNtFtYl90jZGAzGddNQTXtCTiRcU8NhmVCOVPRl4CD4oD5/AVPZOHsUsmbsevxgNCVNAAGAEtyzdFbmKk3fOj+T+g=
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
Content-Type: multipart/mixed; boundary="===============0794777816=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0794777816==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296448DA6C09735C3DDD21CA2F20MN2PR12MB3296namp_"

--_000_MN2PR12MB3296448DA6C09735C3DDD21CA2F20MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>


Best Regards,

Kevin

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Friday, July 12, 2019 10:34:46 AM
To: amd-gfx@lists.freedesktop.org
Cc: Quan, Evan
Subject: [PATCH] drm/amd/powerplay: fix memory allocation failure check

Fix memory allocation failure check.

Change-Id: I012b082a7a2b92973a76db8029897fb4a3441694
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c
index 1fc367307ac0..9e3e737926aa 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -319,7 +319,7 @@ static int vega20_tables_init(struct smu_context *smu, =
struct smu_table *tables)
                        AMDGPU_GEM_DOMAIN_VRAM);

         smu_table->metrics_table =3D kzalloc(sizeof(SmuMetrics_t), GFP_KER=
NEL);
-       if (smu_table->metrics_table)
+       if (!smu_table->metrics_table)
                 return -ENOMEM;
         smu_table->metrics_time =3D 0;

--
2.21.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296448DA6C09735C3DDD21CA2F20MN2PR12MB3296namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Reviewed-by: Kevin Wang &lt;kevin=
1.wang@amd.com&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Best Regards,</p>
<p style=3D"margin-top:0;margin-bottom:0">Kevin</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Friday, July 12, 2019 10:34:46 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Quan, Evan<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: fix memory allocation failure ch=
eck</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Fix memory allocation failure check.<br>
<br>
Change-Id: I012b082a7a2b92973a76db8029897fb4a3441694<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/vega20_ppt.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c<br>
index 1fc367307ac0..9e3e737926aa 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
@@ -319,7 &#43;319,7 @@ static int vega20_tables_init(struct smu_context *s=
mu, struct smu_table *tables)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_GEM_=
DOMAIN_VRAM);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_table-&gt;metrics_tabl=
e =3D kzalloc(sizeof(SmuMetrics_t), GFP_KERNEL);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu_table-&gt;metrics_table)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu_table-&gt;metrics_table)=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_table-&gt;metrics_time=
 =3D 0;<br>
&nbsp;<br>
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

--_000_MN2PR12MB3296448DA6C09735C3DDD21CA2F20MN2PR12MB3296namp_--

--===============0794777816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0794777816==--
