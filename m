Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 401D7981A2
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 19:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B247C6E36D;
	Wed, 21 Aug 2019 17:43:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780078.outbound.protection.outlook.com [40.107.78.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A63E6E36D
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 17:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZIP6MBq4BgCNLwOTq5XfdEHemaHnae029Bi5F1RF/5dX8fbEG3D/NPxHL8zd6poVRxC5HEZUFretPEiCPbq7VO6WLJC2zP/wE1OEFxBL/ijQsM4wz+cOp90amHpGRgaZRLaBiaqa0cZtW7lwziPPTBUyoM8fD/N1cAJW9oZ2cqVj91ALsRXWqrNRURs77kRYgxl83a9XhKq+F8Exj18FbfbcOgqe8DLfj/iNMPHHyw8yaDRVObgcy4GY+2Q+qtsA83wE4wCBcHyXRnTcuuYC9zTlttpp2vymftaxfahtrmldPXvs8gIydnwUecGYjf7sFSwP1ASm/V6G4RYDrD6sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLXGrHh1ycO3SPZLy/8sFBXSN+KKsQL7nFwY/xYSqEE=;
 b=UcntIaGcOthE8bdr5901u/eap98pxcsBe6o/cZhpLWSH4CrJlEdB5yQSw8KUgySMUi82JrNS24MoGY9KZThMMJ/xgye3D/iQUFBgoehVAaACb5oL8OrTWtXUGFQ1qWh/EXZWtPtKpxFnZPUOD+Hs8tbMqmQKaEi22Ai8XGO5Dik7cHfA9UEgz+Ch842FSFuCR+3LKJRIAEh9Ex3qBOLzAVEqNuy8vCvTzJqtDsfbqjb92j0ktRWm7bDKuNttyJlHhi3hb1JjCGhqKe4fy/7Xivx7/eVKLenSbFzEdlQZxOfRKHl7/DlOQQYSKtrSRBbi0hpDtro6OCtSrYWqQh1Z5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1442.namprd12.prod.outlook.com (10.172.23.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 17:43:19 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2178.018; Wed, 21 Aug 2019
 17:43:19 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/sdma5: fix number of sdma5 trap irq types for
 navi1x
Thread-Topic: [PATCH] drm/amdgpu/sdma5: fix number of sdma5 trap irq types for
 navi1x
Thread-Index: AQHVWCezWij0Zb7cGU+M6XDBxgPMUqcF32m6
Date: Wed, 21 Aug 2019 17:43:19 +0000
Message-ID: <BN6PR12MB18092E70EEF7E6DEB2A2C3CEF7AA0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190821135226.16967-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190821135226.16967-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 988dacd2-787e-4b33-fa2a-08d7265f0ddf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1442; 
x-ms-traffictypediagnostic: BN6PR12MB1442:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1442800A84FCEAE83FAEDE54F7AA0@BN6PR12MB1442.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:327;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(189003)(199004)(11346002)(66066001)(6436002)(606006)(4326008)(33656002)(53546011)(6506007)(229853002)(102836004)(256004)(14444005)(2906002)(478600001)(71190400001)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(99286004)(6246003)(74316002)(5660300002)(52536014)(8676002)(446003)(110136005)(53936002)(7696005)(54906003)(316002)(76176011)(71200400001)(9686003)(55016002)(19627405001)(54896002)(6306002)(105004)(486006)(3846002)(186003)(86362001)(8936002)(14454004)(26005)(6116002)(476003)(7736002)(2501003)(25786009)(966005)(81166006)(81156014)(236005)(32563001)(357404004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1442;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iB+ahb5NxakDy8SfHigGvU1DQZjLM4pCHyM+/pvbw2MVw5xqvSD7FQ/gXEANGoMghqo4deKzRQOP3OfmNvqOc3LkK6dey5WqcWvQh7SipCSnp79yQqlOaFmOucrddPEUpLYud+FPv9OPGle6SiqAhgtWIdndqsZB3fN4adY1frk2cqtPjpgcKkCNDmG7LkkDtWgWgw567FeVwMID09Xv8tSCKY9S3EVic0Prj8Q8U07d9Iv8DRHD84smP7JkjlDaL4Jq2Uszi5vJ5+sbCgo3tSP8o1wYUpYYsCruC1CqcuEORfrk7+KAZlWd+dWimwv5T1lA/5MrFqR6UxNaxn1Kvy48AwTE40B6J0fRNtW+AHS9pV2yHVjhY0FJDHd22fNEeRm2laRoOIAR0jciXuWGLQ9aZVGx0xiMaFGkM0Oljsw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 988dacd2-787e-4b33-fa2a-08d7265f0ddf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 17:43:19.1036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d/nY6zdYVbKSWrPC/rqIsHN9wzm5nxrlvuyAeonJrI2BvlrtWr9m0jVX0uNg+3ESeKm4mSrWToYSeX3+u3WHzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1442
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLXGrHh1ycO3SPZLy/8sFBXSN+KKsQL7nFwY/xYSqEE=;
 b=15snRR4S3KY3ni7MaIuhro7tawnE8JmvrPYHbo+/jno5Ufjmk7EjRAXMgsJyzV5ml0CWIx5zRVabdEXFSAsb8VMS30+EwAERDHqQ3EHVEeJb4nbQ4HCDj5TbACh8ZqzqCVRbYM7HgW2XA01a5/Yuu5fkKtF2pK7P8asRjbTbgnI=
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "Xiao,
 Jack" <Jack.Xiao@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0685397713=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0685397713==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18092E70EEF7E6DEB2A2C3CEF7AA0BN6PR12MB1809namp_"

--_000_BN6PR12MB18092E70EEF7E6DEB2A2C3CEF7AA0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Yuan, Xi=
aojie <Xiaojie.Yuan@amd.com>
Sent: Wednesday, August 21, 2019 9:52 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: alexdeucher@gmail.com <alexdeucher@gmail.com>; Xiao, Jack <Jack.Xiao@am=
d.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com>; Zhang, Hawking <Hawking.Zhang=
@amd.com>
Subject: [PATCH] drm/amdgpu/sdma5: fix number of sdma5 trap irq types for n=
avi1x

v2: set num_types based on num_instances

navi1x has 2 sdma engines but commit
"e7b58d03b678 drm/amdgpu: reorganize sdma v4 code to support more instances=
"
changes the max number of sdma irq types (AMDGPU_SDMA_IRQ_LAST) from 2 to 8
which causes amdgpu_irq_gpu_reset_resume_helper() to recover irq of sdma
engines with following logic:

(enable irq for sdma0) * 1 time
(enable irq for sdma1) * 1 time
(disable irq for sdma1) * 6 times

as a result, after gpu reset, interrupt for sdma1 is lost.

Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/a=
mdgpu/sdma_v5_0.c
index 41932d8b88c3..89174e778d2f 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -1625,7 +1625,8 @@ static const struct amdgpu_irq_src_funcs sdma_v5_0_il=
legal_inst_irq_funcs =3D {

 static void sdma_v5_0_set_irq_funcs(struct amdgpu_device *adev)
 {
-       adev->sdma.trap_irq.num_types =3D AMDGPU_SDMA_IRQ_LAST;
+       adev->sdma.trap_irq.num_types =3D AMDGPU_SDMA_IRQ_INSTANCE0 +
+                                       adev->sdma.num_instances;
         adev->sdma.trap_irq.funcs =3D &sdma_v5_0_trap_irq_funcs;
         adev->sdma.illegal_inst_irq.funcs =3D &sdma_v5_0_illegal_inst_irq_=
funcs;
 }
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18092E70EEF7E6DEB2A2C3CEF7AA0BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Yuan, Xiaojie &lt;Xiaojie.Yua=
n@amd.com&gt;<br>
<b>Sent:</b> Wednesday, August 21, 2019 9:52 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> alexdeucher@gmail.com &lt;alexdeucher@gmail.com&gt;; Xiao, Jack =
&lt;Jack.Xiao@amd.com&gt;; Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;; Zhan=
g, Hawking &lt;Hawking.Zhang@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu/sdma5: fix number of sdma5 trap irq type=
s for navi1x</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">v2: set num_types based on num_instances<br>
<br>
navi1x has 2 sdma engines but commit<br>
&quot;e7b58d03b678 drm/amdgpu: reorganize sdma v4 code to support more inst=
ances&quot;<br>
changes the max number of sdma irq types (AMDGPU_SDMA_IRQ_LAST) from 2 to 8=
<br>
which causes amdgpu_irq_gpu_reset_resume_helper() to recover irq of sdma<br=
>
engines with following logic:<br>
<br>
(enable irq for sdma0) * 1 time<br>
(enable irq for sdma1) * 1 time<br>
(disable irq for sdma1) * 6 times<br>
<br>
as a result, after gpu reset, interrupt for sdma1 is lost.<br>
<br>
Signed-off-by: Xiaojie Yuan &lt;xiaojie.yuan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 3 &#43;&#43;-<br>
&nbsp;1 file changed, 2 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/a=
mdgpu/sdma_v5_0.c<br>
index 41932d8b88c3..89174e778d2f 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c<br>
@@ -1625,7 &#43;1625,8 @@ static const struct amdgpu_irq_src_funcs sdma_v5_=
0_illegal_inst_irq_funcs =3D {<br>
&nbsp;<br>
&nbsp;static void sdma_v5_0_set_irq_funcs(struct amdgpu_device *adev)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;sdma.trap_irq.num_types =3D =
AMDGPU_SDMA_IRQ_LAST;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;sdma.trap_irq.num_types =
=3D AMDGPU_SDMA_IRQ_INSTANCE0 &#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; adev-&gt;sdma.num_instances;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;sdma.trap_irq.fun=
cs =3D &amp;sdma_v5_0_trap_irq_funcs;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;sdma.illegal_inst=
_irq.funcs =3D &amp;sdma_v5_0_illegal_inst_irq_funcs;<br>
&nbsp;}<br>
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

--_000_BN6PR12MB18092E70EEF7E6DEB2A2C3CEF7AA0BN6PR12MB1809namp_--

--===============0685397713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0685397713==--
