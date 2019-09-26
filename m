Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C7FBF2DE
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 14:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256DB6EC7A;
	Thu, 26 Sep 2019 12:24:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700086.outbound.protection.outlook.com [40.107.70.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E7D6EC7A
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 12:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VI2W+aUADBmslWYLqouNbPqA4mZT1J3MmJ5jWepo7u8EH6yRI/XbSwxwW1S6nu4kZhBiRKjjwNEwK2FDuOmw9JXasmTIek7jKQ+FUVXllE9iFRjTAxn3nYPmpfcQfu3v7OJ70O/YUiqp6JfxXT6jCXPZjcvksrl8jP6da+q/ANrqfdzYsycp3ynZfFUBx6jd+S0ArH61IGHEG9FBDZS31uwg2NCzhwMJlJ3ei9DHVh4ph1WpSYMV/MnTKM/Jzdbiyb2Q1y/SNRGo6/Iw6iASqV9kbbQE2JsRcHazS0qzqzh5EdHDEhw0urom5AEYR4nAArZdqHxV7zX+xETG1Sf4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3C0mw/g9r7xL3gKTp5SVq/9I7su4ANLzPL7BlNdBl8=;
 b=T9MPs4w7whPDzrSh7WCB/zIS37aMYhr/uRK9xrX7B1+yQEZvAujYDPEknCm/PHLFIpEYVxyBsBfi4em/4rBPOO/3VqNDHElT4M1u/AiO+SXaw80bD0qRZJHaEG+Ut4QrkbqSOfq6X3AgfNgy6tqQnFDfdr4wHbhAXIUAb2/Jt8hqSwOVbxXyrU6SjZYwcNcOmG13BOjmHwkqxSxvTeIyX8MKZIhxaROcITHckT6Mkb78pdP/58XqDDG5SEYkNwL9NFGWkQTs5cqchF8SMKDdtE+PzRxAOLN7KpBV6yyUlSBnioKWVPlM3H/E8pnnDBXmvSHqg+EJETpgV852PyxlzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4127.namprd12.prod.outlook.com (52.135.48.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 26 Sep 2019 12:24:32 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 12:24:32 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Topic: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Index: AQHVdEGHm0iocdCUOEuYheblhNg2q6c9mpfzgABHRRA=
Date: Thu, 26 Sep 2019 12:24:31 +0000
Message-ID: <MN2PR12MB3344DE303C67119711B88DB5E4860@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190926080746.20765-1-xiaojie.yuan@amd.com>
 <BN8PR12MB36027CA5662543E7F956657589860@BN8PR12MB3602.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB36027CA5662543E7F956657589860@BN8PR12MB3602.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf72ac1d-7980-4235-9486-08d7427c7c08
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4127; 
x-ms-traffictypediagnostic: MN2PR12MB4127:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB412737733875E56F0ADD7595E4860@MN2PR12MB4127.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(189003)(199004)(81166006)(6506007)(8936002)(81156014)(7736002)(486006)(229853002)(52536014)(66066001)(76116006)(55016002)(256004)(14444005)(99286004)(4326008)(478600001)(5660300002)(66946007)(14454004)(25786009)(76176011)(71200400001)(33656002)(102836004)(71190400001)(54896002)(6306002)(236005)(110136005)(6116002)(26005)(2906002)(3846002)(9686003)(790700001)(316002)(86362001)(6436002)(7696005)(6246003)(446003)(11346002)(66556008)(66476007)(66446008)(64756008)(53546011)(8676002)(476003)(74316002)(2501003)(186003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4127;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DnIOu7PCUEy3BOIO2iVipH9j2vudWheUBdk+X89iOuJJm8KL6HhFWI/+gRnDPKzZqIc0LDKrmVpx7VtqhQdqhJ6T53mK1j5ZoPbFeakAKCzwEOQKxmq06aLMEhZ7qRmfGJzlIQB+xQT/if2oU4Yxos5ZjuYwYGV6qfq/d8d7OzVFHpqiiPZ4rQ8k4OodTg9+7ssmZNJM+vR5wZkjFLEDDpoNOt9qAro3Z2/fPshv9Heb13dTpT1bXWmyS1AMq7hE+DSf6KoB7TSxI3zTdmm0H3kOoq8pvxjZp5IuJe9ip2udTt0t5+J5BfjaTV1OG9TrjxN9FuMtnTfrmyKmuCMhJHY5RyLSDL4i/baGNLSYGZjcRK0qdlNIv/4eMM9yshXgFeRM9HIgSfKtBa4UsVATLT6kYDws2+8qAsZR5O4/I6o=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf72ac1d-7980-4235-9486-08d7427c7c08
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 12:24:31.8480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lGxArlwIno+cAu3orrwu2GgoNzTnrIVOxftWXcojssIjTDXCToe7abKTvYCgFwnm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4127
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3C0mw/g9r7xL3gKTp5SVq/9I7su4ANLzPL7BlNdBl8=;
 b=R9fAe2CZvmMHsUQ9IinjW4fS039iaxS14kI9T6Mvy3U/SV68l2QNeYkbV+3QP23wjk8154B3/SevSvkcZqCzg7wBqLufdWc5kfkkMTqmLLvXxazkBOO0S6TMKGRGWd1B3Plv+fRr+V3WVYa/8uc6aegvRi5YXPKgWpke3MMF71c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>
Content-Type: multipart/mixed; boundary="===============0912493067=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0912493067==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3344DE303C67119711B88DB5E4860MN2PR12MB3344namp_"

--_000_MN2PR12MB3344DE303C67119711B88DB5E4860MN2PR12MB3344namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch was already reviewed-by. I think you can land it on the branch d=
irectly.

From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Yuan, Xi=
aojie
Sent: Thursday, September 26, 2019 4:09 PM
To: amd-gfx@lists.freedesktop.org
Cc: alexdeucher@gmail.com
Subject: Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma' w=
orkaround for navi

Hi Alex,

This patch is to add the asic_type check which is missing after drm-next br=
anch rebase.

BR,
Xiaojie
________________________________
From: Yuan, Xiaojie <Xiaojie.Yuan@amd.com<mailto:Xiaojie.Yuan@amd.com>>
Sent: Thursday, September 26, 2019 4:08 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: alexdeucher@gmail.com<mailto:alexdeucher@gmail.com> <alexdeucher@gmail.=
com<mailto:alexdeucher@gmail.com>>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com<mai=
lto:Xiaojie.Yuan@amd.com>>
Subject: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma' worka=
round for navi

Fixes: 767acabdac81 ("drm/amd/powerplay: add baco smu reset function for sm=
u11")
Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com<mailto:xiaojie.yuan@amd.c=
om>>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gmc_v10_0.c
index cb3f61873baa..dc2e68e019eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -292,6 +292,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_devic=
e *adev, uint32_t vmid,

         if (!adev->mman.buffer_funcs_enabled ||
             !adev->ib_pool_ready ||
+           !(adev->asic_type >=3D CHIP_NAVI10 && adev->asic_type <=3D CHIP=
_NAVI12) ||
             adev->in_gpu_reset) {
                 gmc_v10_0_flush_vm_hub(adev, vmid, AMDGPU_GFXHUB_0, 0);
                 mutex_unlock(&adev->mman.gtt_window_lock);
--
2.20.1

--_000_MN2PR12MB3344DE303C67119711B88DB5E4860MN2PR12MB3344namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">This patch was already reviewed-by. I think you can =
land it on the branch directly.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> amd-gfx &lt;amd-gfx-bounces@lists.freed=
esktop.org&gt;
<b>On Behalf Of </b>Yuan, Xiaojie<br>
<b>Sent:</b> Thursday, September 26, 2019 4:09 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> alexdeucher@gmail.com<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from =
sdma' workaround for navi<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Hi Alex,<o:p></o:p></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">This patch is to add the=
 asic_type check which is missing after drm-next branch rebase.<o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">BR,<o:p></o:p></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">Xiaojie<o:p></o:p></span=
></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Yuan, Xiaojie &lt;<a href=3D"mailto:Xiaojie.Yuan@am=
d.com">Xiaojie.Yuan@amd.com</a>&gt;<br>
<b>Sent:</b> Thursday, September 26, 2019 4:08 PM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:alexdeucher@gmail.com">alexdeucher@gmail.com</=
a> &lt;<a href=3D"mailto:alexdeucher@gmail.com">alexdeucher@gmail.com</a>&g=
t;; Yuan, Xiaojie &lt;<a href=3D"mailto:Xiaojie.Yuan@amd.com">Xiaojie.Yuan@=
amd.com</a>&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma=
' workaround for navi</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Fixes: 767acabdac81 (=
&quot;drm/amd/powerplay: add baco smu reset function for smu11&quot;)<br>
Signed-off-by: Xiaojie Yuan &lt;<a href=3D"mailto:xiaojie.yuan@amd.com">xia=
ojie.yuan@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 1 &#43;<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gmc_v10_0.c<br>
index cb3f61873baa..dc2e68e019eb 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
@@ -292,6 &#43;292,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_d=
evice *adev, uint32_t vmid,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!adev-&gt;mman.buffer_=
funcs_enabled ||<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !a=
dev-&gt;ib_pool_ready ||<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !(adev-&g=
t;asic_type &gt;=3D CHIP_NAVI10 &amp;&amp; adev-&gt;asic_type &lt;=3D CHIP_=
NAVI12) ||<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ad=
ev-&gt;in_gpu_reset) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; gmc_v10_0_flush_vm_hub(adev, vmid, AMDGPU_GFXHUB_0, 0=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;adev-&gt;mman.gtt_window_lock);<br>
-- <br>
2.20.1<o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB3344DE303C67119711B88DB5E4860MN2PR12MB3344namp_--

--===============0912493067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0912493067==--
