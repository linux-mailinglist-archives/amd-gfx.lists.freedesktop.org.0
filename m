Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6319029A66
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 16:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C24C6E0DF;
	Fri, 24 May 2019 14:53:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820081.outbound.protection.outlook.com [40.107.82.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537026E0DF
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 14:53:52 +0000 (UTC)
Received: from MWHPR12MB1422.namprd12.prod.outlook.com (10.169.205.8) by
 MWHPR12MB1725.namprd12.prod.outlook.com (10.175.55.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Fri, 24 May 2019 14:53:49 +0000
Received: from MWHPR12MB1422.namprd12.prod.outlook.com
 ([fe80::1810:5dae:1b14:78fd]) by MWHPR12MB1422.namprd12.prod.outlook.com
 ([fe80::1810:5dae:1b14:78fd%2]) with mapi id 15.20.1922.019; Fri, 24 May 2019
 14:53:49 +0000
From: "Abramov, Slava" <Slava.Abramov@amd.com>
To: "StDenis, Tom" <Tom.StDenis@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/doc: Add RAS documentation to guide
Thread-Topic: [PATCH 2/2] drm/amd/doc: Add RAS documentation to guide
Thread-Index: AQHVEjPsPODRmSvPb0GbUupz1Uy4DaZ6XF5j
Date: Fri, 24 May 2019 14:53:49 +0000
Message-ID: <MWHPR12MB1422924B7883984E43287288FE020@MWHPR12MB1422.namprd12.prod.outlook.com>
References: <20190524132326.7436-1-tom.stdenis@amd.com>,
 <20190524132326.7436-2-tom.stdenis@amd.com>
In-Reply-To: <20190524132326.7436-2-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4918bc68-d630-4352-6407-08d6e057a16f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1725; 
x-ms-traffictypediagnostic: MWHPR12MB1725:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR12MB172596E7934B8A2A499207DFFE020@MWHPR12MB1725.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(366004)(136003)(39860400002)(346002)(199004)(189003)(72206003)(55016002)(66066001)(8676002)(9686003)(110136005)(478600001)(606006)(966005)(68736007)(99286004)(66476007)(66556008)(64756008)(66446008)(76116006)(7696005)(76176011)(73956011)(316002)(66946007)(91956017)(5660300002)(229853002)(256004)(86362001)(6606003)(6436002)(71190400001)(71200400001)(25786009)(14454004)(2501003)(6306002)(33656002)(19627405001)(54896002)(81156014)(81166006)(236005)(8936002)(53936002)(6246003)(53546011)(102836004)(74316002)(186003)(6506007)(6116002)(486006)(52536014)(476003)(3846002)(446003)(7736002)(11346002)(26005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1725;
 H:MWHPR12MB1422.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: snlSXd1sxsmbGtRO/TFlGWUOmettZ9SabLFMvLbFEYTFzW0b0Am4BBdt5ccMpUrQpV8laeMHNwkJUBsoQkUVawGfMQd6TVtzAtR4OsQ+QsA226bLcho66QbANr9v5ikJmb6qeO6RuaXy15tfzcl/wDGHEX21mnjGH3DiPvHtT2Q4YszbVmLlFmJZ+naXUrZN+edl+LWv0x8JaG6w3XNas80wanCz9djDHx3cpYB9jkYiO+Ccfj4N6uPPUAKcr+kdLO3zvzgECI/2ehP6qiVQXdq0Yq+sHWaUoRaUnNh+Xoi07ttD3XwBzzvcai/iH+zaxUDiht3PIisErpeGoGWzRlDrTpdiFMxXKw5+j+LsBCf5VVzg2EEQPoDuant4EWzh7P/fueIps8FeeZyGMgOnI/BNCwiSR86aFvhL2y2RRMA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4918bc68-d630-4352-6407-08d6e057a16f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 14:53:49.3070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sabramov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1725
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPlr6t/Ntoso7LEwoRhnVDZBG3WmrxoPkP2ri3wF9xw=;
 b=i3z8iJjWt6prtB83CFgPFscInrmWTnZBcifzyHhSLV6G5vCfvUSIeAvb70qWMsXYnohskyCRkH2s8mMKk/NzX+2rPUX7EqRVMurp/VzzBQz27xcxYY1p3Xtk6yb4p5pwTlLa7ILLy0sZpLns1LFinXjvLVel60+mTbsscCIg5Xs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Slava.Abramov@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0200010459=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0200010459==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MWHPR12MB1422924B7883984E43287288FE020MWHPR12MB1422namp_"

--_000_MWHPR12MB1422924B7883984E43287288FE020MWHPR12MB1422namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Slava Abramov <slava.abramov@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of StDenis,=
 Tom <Tom.StDenis@amd.com>
Sent: Friday, May 24, 2019 9:23:50 AM
To: amd-gfx@lists.freedesktop.org
Cc: StDenis, Tom
Subject: [PATCH 2/2] drm/amd/doc: Add RAS documentation to guide

[CAUTION: External Email]

Signed-off-by: Tom St Denis <tom.stdenis@amd.com>
---
 Documentation/gpu/amdgpu.rst            | 11 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c |  4 ++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu.rst
index cacfcfad2356..86138798128f 100644
--- a/Documentation/gpu/amdgpu.rst
+++ b/Documentation/gpu/amdgpu.rst
@@ -79,6 +79,17 @@ AMDGPU XGMI Support
 .. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
    :internal:

+AMDGPU RAS debugfs control interface
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+   :doc: AMDGPU RAS debugfs control interface
+
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+   :internal:
+
+
 GPU Power/Thermal Controls and Monitoring
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.c
index d5719b0fb82c..7c8a4aedf07c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -244,8 +244,8 @@ static int amdgpu_ras_debugfs_ctrl_parse_data(struct fi=
le *f,

        return 0;
 }
-/*
- * DOC: ras debugfs control interface
+/**
+ * DOC: AMDGPU RAS debugfs control interface
  *
  * It accepts struct ras_debug_if who has two members.
  *
--
2.21.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MWHPR12MB1422924B7883984E43287288FE020MWHPR12MB1422namp_
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
<p style=3D"margin-top:0;margin-bottom:0">Acked-by: Slava Abramov &lt;slava=
.abramov@amd.com&gt;</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of StDenis, Tom &lt;Tom.StDenis@=
amd.com&gt;<br>
<b>Sent:</b> Friday, May 24, 2019 9:23:50 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> StDenis, Tom<br>
<b>Subject:</b> [PATCH 2/2] drm/amd/doc: Add RAS documentation to guide</fo=
nt>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
Signed-off-by: Tom St Denis &lt;tom.stdenis@amd.com&gt;<br>
---<br>
&nbsp;Documentation/gpu/amdgpu.rst&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 11 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c |&nbsp; 4 &#43;&#43;--<br>
&nbsp;2 files changed, 13 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu.rst<br=
>
index cacfcfad2356..86138798128f 100644<br>
--- a/Documentation/gpu/amdgpu.rst<br>
&#43;&#43;&#43; b/Documentation/gpu/amdgpu.rst<br>
@@ -79,6 &#43;79,17 @@ AMDGPU XGMI Support<br>
&nbsp;.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c<br>
&nbsp;&nbsp;&nbsp; :internal:<br>
<br>
&#43;AMDGPU RAS debugfs control interface<br>
&#43;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&#43;<br>
&#43;.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c<br>
&#43;&nbsp;&nbsp; :doc: AMDGPU RAS debugfs control interface<br>
&#43;<br>
&#43;<br>
&#43;.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c<br>
&#43;&nbsp;&nbsp; :internal:<br>
&#43;<br>
&#43;<br>
&nbsp;GPU Power/Thermal Controls and Monitoring<br>
&nbsp;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.c<br>
index d5719b0fb82c..7c8a4aedf07c 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c<br>
@@ -244,8 &#43;244,8 @@ static int amdgpu_ras_debugfs_ctrl_parse_data(struc=
t file *f,<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
-/*<br>
- * DOC: ras debugfs control interface<br>
&#43;/**<br>
&#43; * DOC: AMDGPU RAS debugfs control interface<br>
&nbsp; *<br>
&nbsp; * It accepts struct ras_debug_if who has two members.<br>
&nbsp; *<br>
--<br>
2.21.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_MWHPR12MB1422924B7883984E43287288FE020MWHPR12MB1422namp_--

--===============0200010459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0200010459==--
