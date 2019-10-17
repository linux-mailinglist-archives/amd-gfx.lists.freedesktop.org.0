Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB91DB8AA
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 22:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93CA89E36;
	Thu, 17 Oct 2019 20:50:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750058.outbound.protection.outlook.com [40.107.75.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D17E89E32
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 20:50:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0pZn93fh5nfFnt/ZwDy4UeCJCSohsh7K8v7cilOinjEAZfyRfPgo7A8aAsP5YQ7aXaxn76y7GeeD+LMOvMsIa5KFLC68VXtDOd0d5rIHQuodUBTKrd/dYAV6fW99DrFTYPuWcuoXzVQIgcVYgNeUpTA+apC2isn2KHCcFFJ+uxSOf9rhbI4E9lT0E4dv6F1ViCYZHErfuFNwF0HzggGhYPjX/1Of+Orpk+x76td6hT3+9+rhHPVenac2YI/dVQkP5Xno2WXzH9zLXwiG4nHlSea9Ip89WRXllHoyOFCxr1YyjqsAWdb2Q8iAX3w0hHVwgUf4B4cbHxLBo5tc/qc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBDUZGHPDn+ZmPcl2QyV/MEFYxgZEd26+CkiA53wd0A=;
 b=mP/eH/ybXOeG+rnBDu9IEn6xT6+VQn0ZrueFlo2rSqCPN544eywzrlYHMa3qVDyyRUhNJPYPS2jpdrqpyxXyLGOh7VYkbmiHre0PqpK/M70e2o+aXsB0Ug+93nQbBeWxL9ltyRPd+sNbg2ApBWTahGS1s7k72hukNJFbru55/DaUQdvSSi2dUIADnyXoy4kFVKwHv7fzM70p62lMlScXAUwLWc1mQhR/5j3yr9r8AbN1D2MYHNV33Z2RaYWzPLnUq6uGKCnBEhlpJDEtlvJbkwhqd6z3riPV56EY/sPu97Nmoy10WHXV85txmJgeXDEgOOcltRCpi2XfQq/B6FKPnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2871.namprd12.prod.outlook.com (20.179.90.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Thu, 17 Oct 2019 20:50:34 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5598:12d2:404c:5373]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5598:12d2:404c:5373%7]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 20:50:34 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Liu, Zhan" <Zhan.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amd/display: Modify display link stream setup
 sequence.
Thread-Topic: [PATCH v2] drm/amd/display: Modify display link stream setup
 sequence.
Thread-Index: AQHVhR1bdUiBxSuwH0WEjqoIXDrvFadfSs6i
Date: Thu, 17 Oct 2019 20:50:34 +0000
Message-ID: <BYAPR12MB35608C9F6518E2E0ECF8FB91EC6D0@BYAPR12MB3560.namprd12.prod.outlook.com>
References: <DM6PR12MB3466E0D0DADF7599F877F0859E6D0@DM6PR12MB3466.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB3466E0D0DADF7599F877F0859E6D0@DM6PR12MB3466.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [72.143.193.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a393d2cf-24cc-4939-6fb6-08d75343a810
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR12MB2871:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB28714D3682B575F473D5392AEC6D0@BYAPR12MB2871.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(189003)(199004)(486006)(2501003)(476003)(7736002)(6436002)(478600001)(8936002)(81166006)(81156014)(8676002)(966005)(53546011)(99286004)(66066001)(7696005)(76176011)(26005)(6506007)(110136005)(11346002)(102836004)(186003)(446003)(316002)(55016002)(606006)(236005)(66946007)(5660300002)(86362001)(229853002)(52536014)(91956017)(6246003)(9686003)(54896002)(256004)(6306002)(25786009)(3846002)(74316002)(14454004)(6116002)(76116006)(66556008)(66476007)(2906002)(33656002)(71190400001)(66446008)(71200400001)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2871;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0HPm+9sHohPdXK+lvcfvRO3Li/0LPko/p8JNUSBdxUbQRWpZRbkaAZZvmIOOUgn+jozVDflDyUj/j0deFp4LMDd9tkWj7uBSX0lAsggUyVbws7qi2qwPbVliP7ESqf1G/CkzolcPQLtvfzbSa0E0smKpEPmvyi8sCuUS2P3d1o974SbmdzqziCDYn26SQjRyhPf095ZN34FK96RjZqD50FMRAKO9VrxWAmp0RMfrnBsZQB/wZun6XkCFUdLD/4lZOPsXBNQNe9XNZc9H2DvfeQlQR5wEa8JaPg0cBjOx833yhYuUv3oTXclnBCNRmsJ73Py68lViP+AHf6hETBnWbshZMKJKkIZQUL2BzyZOrkrkJyuW9lPjHyO89diPL52WvBy+gINnUbGndLRf02ekdtNsdfYU0ebfoSgDt6+31txI0kNNSHIH7uOy/3oEw1YNbABPbcnezamN3PcFEOzn/A==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a393d2cf-24cc-4939-6fb6-08d75343a810
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 20:50:34.1779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kMdzQimalswjnRLsf9jzVzLWH1f1aVQZRCMw+gCnzsfnUg063SaT4BMRgkFq6mZwGgbG2zTydbsLCM8VLOe1cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2871
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBDUZGHPDn+ZmPcl2QyV/MEFYxgZEd26+CkiA53wd0A=;
 b=SoUmqSQIvs84khjt0R0pRNXWWd4C7av5i0vnaChRBXivfhST4NKtSoHYrdzhtubuiTjEzaSpyMO3ZCiE8spuAEtVZSf4ck41zh1jjr5meGiydedE0RF1/LrVqiyctmhwtQClmw6xcR3Wvh+D1yecMtP0b9UEtTd07ACRO8XEKro=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0388726509=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0388726509==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BYAPR12MB35608C9F6518E2E0ECF8FB91EC6D0BYAPR12MB3560namp_"

--_000_BYAPR12MB35608C9F6518E2E0ECF8FB91EC6D0BYAPR12MB3560namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is actually setting DIG mode a second time, right? I don't think this =
is what sets GC_SEND.

Please mention that this is setting the DIG_MODE to the correct value after=
 having been overridden by the call to transmitter control in your patch de=
scription. Also correct the HACK comment to mention that this second call i=
s needed to reconfigure the DIG as a workaround for the incorrect value bei=
ng applied from transmitter control. Specifics help in source.

I don't think there is a case where we'd want HDMI changed to DVI so it's p=
robably fine to leave this as is for now...

With those fixed, you can add my:

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Thanks,

Nicholas Kazlauskas

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Liu, Zha=
n <Zhan.Liu@amd.com>
Sent: Thursday, October 17, 2019, 3:04 PM
To: amd-gfx@lists.freedesktop.org; Liu, Zhan
Subject: [PATCH v2] drm/amd/display: Modify display link stream setup seque=
nce.

[Why]
This patch is for fixing Navi14 pink screen issue. With this
patch, stream->link->link_enc->funcs->setup will be called
twice: this will make sure GC_SEND is set to 1. Though we
still need to look into why the issue only happens on
Linux, but not on Windows side.

[How]
Call stream->link->link_enc->funcs->setup twice.

Signed-off-by: Zhan liu <zhan.liu@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/dr=
m/amd/display/dc/core/dc_link.c
index 935053664160..8683e8613ec2 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -2842,6 +2842,12 @@ void core_link_enable_stream(
                                        CONTROLLER_DP_TEST_PATTERN_VIDEOMOD=
E,
                                        COLOR_DEPTH_UNDEFINED);

+               /* Hack on Navi14: fixes Navi14 HDMI pink screen issue */
+               if (!dc_is_virtual_signal(pipe_ctx->stream->signal))
+                       stream->link->link_enc->funcs->setup(
+                               stream->link->link_enc,
+                               pipe_ctx->stream->signal);
+
 #ifdef CONFIG_DRM_AMD_DC_DSC_SUPPORT
                if (pipe_ctx->stream->timing.flags.DSC) {
                        if (dc_is_dp_signal(pipe_ctx->stream->signal) ||
--
2.17.0
_______________________________________________
amd-gfx mailing list
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
amd-gfx@lists.freedesktop.org
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--_000_BYAPR12MB35608C9F6518E2E0ECF8FB91EC6D0BYAPR12MB3560namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr" text-align=3D"left">
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"ltr">
This is actually setting DIG mode a second time, right? I don't think this =
is what sets GC_SEND.</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"ltr">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"ltr">
Please mention that this is setting the DIG_MODE to the correct value after=
 having been overridden by the call to transmitter control in your patch de=
scription. Also correct the HACK comment to mention that this second call i=
s needed to reconfigure the DIG
 as a workaround for the incorrect value being applied from transmitter con=
trol. Specifics help in source.</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"ltr">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"ltr">
I don't think there is a case where we'd want HDMI changed to DVI so it's p=
robably fine to leave this as is for now...</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"ltr">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"ltr">
With those fixed, you can add my:</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"ltr">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"ltr">
Reviewed-by: Nicholas Kazlauskas &lt;nicholas.kazlauskas@amd.com&gt;</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"ltr">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"ltr">
Thanks,</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"ltr">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"ltr">
Nicholas Kazlauskas</div>
<div id=3D"id-77342fb2-e4ed-464c-97e1-4a1a620e36e9" class=3D"ms-outlook-mob=
ile-reference-message">
<div style=3D"font-family: sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;"><br>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg"><strong>From:</strong> amd-gfx &lt;amd-gfx-bounce=
s@lists.freedesktop.org&gt; on behalf of Liu, Zhan &lt;Zhan.Liu@amd.com&gt;=
<br>
<strong>Sent:</strong> Thursday, October 17, 2019, 3:04 PM<br>
<strong>To:</strong> amd-gfx@lists.freedesktop.org; Liu, Zhan<br>
<strong>Subject:</strong> [PATCH v2] drm/amd/display: Modify display link s=
tream setup sequence.<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style><font size=3D"=
2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">[Why]<br>
This patch is for fixing Navi14 pink screen issue. With this<br>
patch, stream-&gt;link-&gt;link_enc-&gt;funcs-&gt;setup will be called<br>
twice: this will make sure GC_SEND is set to 1. Though we<br>
still need to look into why the issue only happens on<br>
Linux, but not on Windows side.<br>
<br>
[How]<br>
Call stream-&gt;link-&gt;link_enc-&gt;funcs-&gt;setup twice.<br>
<br>
Signed-off-by: Zhan liu &lt;zhan.liu@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/dc/core/dc_link.c | 6 &#43;&#43;&#43;&#43=
;&#43;&#43;<br>
&nbsp;1 file changed, 6 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/dr=
m/amd/display/dc/core/dc_link.c<br>
index 935053664160..8683e8613ec2 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/dc/core/dc_link.c<br>
@@ -2842,6 &#43;2842,12 @@ void core_link_enable_stream(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; CONTROLLER_DP_TEST_PATTERN_VIDEOMODE,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; COLOR_DEPTH_UNDEFINED);<br>
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; /* Hack on Navi14: fixes Navi14 HDMI pink screen issue */<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (!dc_is_virtual_signal(pipe_ctx-&gt;stream-&gt;signal))<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stream-&gt;l=
ink-&gt;link_enc-&gt;funcs-&gt;setup(<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stream-&gt;link-&gt;link_enc,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_ctx-&gt;stream-&gt;signal);<br>
&#43;<br>
&nbsp;#ifdef CONFIG_DRM_AMD_DC_DSC_SUPPORT<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (pipe_ctx-&gt;stream-&gt;timing.flags.DSC) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dc_is_d=
p_signal(pipe_ctx-&gt;stream-&gt;signal) ||<br>
--<br>
2.17.0<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
amd-gfx@lists.freedesktop.org<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font><br>
</div>
</div>
</body>
</html>

--_000_BYAPR12MB35608C9F6518E2E0ECF8FB91EC6D0BYAPR12MB3560namp_--

--===============0388726509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0388726509==--
