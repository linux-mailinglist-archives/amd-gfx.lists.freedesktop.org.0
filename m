Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A06CCCE
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 12:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EFC6E370;
	Thu, 18 Jul 2019 10:35:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680076.outbound.protection.outlook.com [40.107.68.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867F66E370
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 10:35:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFLfTxlIMps03pt5cFEAkF5qMp3TIg1JIi92tfzg4dqcSoQkWQyl9Daz/qf2UaQfi0sjA5NBrOd2m8sJILwsOqdIvJ/5hFycvSZrlicVvsUmQVpURaXIww1BJu5eTBU3fGMbLtyHJd38cI6neAKKt2fEAwaVgTwthViFO0KfpH9kIZbX2+pR/cZusSmEncODpuFIKqW3SQWqK+T4chFt9nvAPB5OEDugcXK7HQDBB9OLJ3/uXya2K1N68RG5XafFTFkhQDLylTe+yatDVXc0HjMT4rgfHVHw+76z0B38t73t71ULxC4XxxKZDQLVifdMU9W5bk2lcg00/Sx2x7Ilpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7fPnWK8mfZVDNwPN7bXmLho8hlUTJYtwhJFGBr+WWw=;
 b=kFxwoyW3mQ1LCy0od3OOB9ZnZuyj8FB5MmVeAlpZrk6GUdxRXHrFnZ3tdWycKwmM/94MqvUIa/pAGEtduAucjYg5CYdBRVr9NEyD+MLh3o1aVEERAj8qom4mCN2A7oD/qPswTFzig9DMhtelZFLUaJOedfsmcVL14St3tv7Axvvct2i1ASrvIf482VdA80Z4QwOWl2jqDkDgdqgcSZS6GpV0cOg4rzmoaqJ4PKPwqSmWmRPrRDuPvCPpTYOakZkk0uxnJ+N56e6eR0PefwLlEJOi3aF69fDYdkky+M/aU+S/vw3KDDozf2c76KyUkkohgWNBor9/SaNyEqz/GgBA1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3136.namprd12.prod.outlook.com (20.178.244.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 10:35:34 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2094.011; Thu, 18 Jul 2019
 10:35:34 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Gui, Jack" <Jack.Gui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/amd/powerplay: remove mutex lock for
 smu_handle_task when smu late init
Thread-Topic: [PATCH 1/3] drm/amd/powerplay: remove mutex lock for
 smu_handle_task when smu late init
Thread-Index: AQHVPU/9IaGigLXsfEWhKGY2W6WbuqbQLbOF
Date: Thu, 18 Jul 2019 10:35:34 +0000
Message-ID: <MN2PR12MB3344F0DFB162D49F9BDD19CCE4C80@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1563444138-23948-1-git-send-email-Jack.Gui@amd.com>
In-Reply-To: <1563444138-23948-1-git-send-email-Jack.Gui@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [114.87.102.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46e65e92-68cf-4aac-a92c-08d70b6baa8d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3136; 
x-ms-traffictypediagnostic: MN2PR12MB3136:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB313669095473A04E60935657E4C80@MN2PR12MB3136.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(7696005)(76116006)(476003)(8936002)(11346002)(66066001)(81166006)(25786009)(6306002)(81156014)(256004)(229853002)(14444005)(54896002)(55016002)(66946007)(86362001)(606006)(71200400001)(9686003)(76176011)(74316002)(66476007)(2906002)(4326008)(66556008)(71190400001)(66446008)(2501003)(6116002)(3846002)(6506007)(6246003)(5660300002)(236005)(14454004)(102836004)(91956017)(64756008)(8676002)(6436002)(478600001)(52536014)(33656002)(99286004)(966005)(68736007)(7736002)(110136005)(186003)(316002)(53936002)(26005)(486006)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3136;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zqCoKEUnN4mN8PgxnSRDMaXuWL6NA3pBpCr4BB75DufHg05whBOZNP/beiJbWCFwh+3UK8rX0w9LYm+ygLQG4kAXDjB60O0AGDZW9y+7mTvX7uvdY1z7lxxZ52QnPSB1nZ5U9oGqdHJok8Zmv5Cosi/KQzircO9Dd1WIK3UQUksyvFekKAAGzwlYELdxtFcRg3Wh8Q1W6QQ7S9s9tQo9quTC0zBCtHMDgnb1pPPc9/hSFMziKuF+AhYdQg2SmYeuFOFLprPJkOvYhZ/XsPEA1Sonf8tGuWobhHrsb3JTtQQeHijIZ9otfieRZ2LMuYt95P8Yk3zJ19aOX7+xqsbUCpp1ILjmmrPcdhDM/CoXLBoaxWOaxESfvNETniFoapH3IjqQx8LK5R6S92tPzbvufFjkLllr8WjyL2xE5XIr6bw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e65e92-68cf-4aac-a92c-08d70b6baa8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 10:35:34.5632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3136
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7fPnWK8mfZVDNwPN7bXmLho8hlUTJYtwhJFGBr+WWw=;
 b=nIQjHNAOA8M1EMOXuGw5vNTP2kHeahLF4egw4GkMQS7NFz+L7O0/jdOUuzpdQnqi0tj9l3/js5lVR82bR6OFQaZM9m+8xR0fHhWmtUNspt+9zFqswBs6BZXzfgH3cOznO3oJ+OSk9zdJDrDc2/VSmte1OjrlrEFPdiZ8+M8tZaI=
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
Cc: "Gui, Jack" <Jack.Gui@amd.com>
Content-Type: multipart/mixed; boundary="===============0224442291=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0224442291==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3344F0DFB162D49F9BDD19CCE4C80MN2PR12MB3344namp_"

--_000_MN2PR12MB3344F0DFB162D49F9BDD19CCE4C80MN2PR12MB3344namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGxlYXNlIGhvbGQgb24gdGhlIG11dGV4IGNoYW5nZXMgb2YgcGF0Y2gxIGFuZCBwYXRjaDMuIFdl
IG5lZWQgYW4gb3ZlcmFsbCB0aG91Z2h0IG92ZXIgdGhlIHNtdSBtdXRleCBtYWNoaW5zaW0uIExl
dCB1cyBoYXZlIHNvbWUgaW50ZXJuYWwgZGlzY3Vzc2lvbnMgZmlyc3QuDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmc+ILT6se0gQ2hlbmdtaW5nIEd1aSA8SmFjay5HdWlAYW1kLmNv
bT4NCreiy83KsbzkOiBUaHVyc2RheSwgSnVseSAxOCwgMjAxOSA2OjAyOjE2IFBNDQrK1bz+yMs6
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZz4NCrOty806IEd1aSwgSmFjayA8SmFjay5HdWlAYW1kLmNvbT4NCtb3zOI6IFtQQVRDSCAx
LzNdIGRybS9hbWQvcG93ZXJwbGF5OiByZW1vdmUgbXV0ZXggbG9jayBmb3Igc211X2hhbmRsZV90
YXNrIHdoZW4gc211IGxhdGUgaW5pdA0KDQpyZW1vdmUgbXV0ZXggbG9jayB3aGVuIHNtdSBsYXRl
IGluaXQgdG8gY2FsbCBzbXVfaGFuZGxlX3Rhc2sNCg0KU2lnbmVkLW9mZi1ieTogQ2hlbmdtaW5n
IEd1aSA8SmFjay5HdWlAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2FtZGdwdV9zbXUuYyB8IDIgLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KaW5kZXggN2Qx
YmQwOS4uMTIyOTg1YyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FtZGdwdV9zbXUuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1
X3NtdS5jDQpAQCAtNTY5LDExICs1NjksOSBAQCBzdGF0aWMgaW50IHNtdV9sYXRlX2luaXQodm9p
ZCAqaGFuZGxlKQ0KDQogICAgICAgICBpZiAoIXNtdS0+cG1fZW5hYmxlZCkNCiAgICAgICAgICAg
ICAgICAgcmV0dXJuIDA7DQotICAgICAgIG11dGV4X2xvY2soJnNtdS0+bXV0ZXgpOw0KICAgICAg
ICAgc211X2hhbmRsZV90YXNrKCZhZGV2LT5zbXUsDQogICAgICAgICAgICAgICAgICAgICAgICAg
c211LT5zbXVfZHBtLmRwbV9sZXZlbCwNCiAgICAgICAgICAgICAgICAgICAgICAgICBBTURfUFBf
VEFTS19DT01QTEVURV9JTklUKTsNCi0gICAgICAgbXV0ZXhfdW5sb2NrKCZzbXUtPm11dGV4KTsN
Cg0KICAgICAgICAgcmV0dXJuIDA7DQogfQ0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0K

--_000_MN2PR12MB3344F0DFB162D49F9BDD19CCE4C80MN2PR12MB3344namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div>
<div>
<div style=3D"direction:ltr">please hold on the mutex changes of patch1 and=
 patch3. We need an overall thought over the smu mutex machinsim. Let us ha=
ve some internal discussions first.</div>
</div>
<div><br>
</div>
<div class=3D"x_ms-outlook-ios-signature"></div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> amd-g=
fx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; =B4=FA=B1=ED Chengming Gui=
 &lt;Jack.Gui@amd.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> Thursday, July 18, 2019 6:02:16 PM<br>
<b>=CA=D5=BC=FE=C8=CB:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.=
freedesktop.org&gt;<br>
<b>=B3=AD=CB=CD:</b> Gui, Jack &lt;Jack.Gui@amd.com&gt;<br>
<b>=D6=F7=CC=E2:</b> [PATCH 1/3] drm/amd/powerplay: remove mutex lock for s=
mu_handle_task when smu late init</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">remove mutex lock when smu late init to call smu_h=
andle_task<br>
<br>
Signed-off-by: Chengming Gui &lt;Jack.Gui@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 2 --<br>
&nbsp;1 file changed, 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 7d1bd09..122985c 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -569,11 &#43;569,9 @@ static int smu_late_init(void *handle)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;pm_enabled)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;smu-&gt;mutex);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_handle_task(&amp;adev-=
&gt;smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&=
gt;smu_dpm.dpm_level,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_P=
P_TASK_COMPLETE_INIT);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;smu-&gt;mutex);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font>
</body>
</html>

--_000_MN2PR12MB3344F0DFB162D49F9BDD19CCE4C80MN2PR12MB3344namp_--

--===============0224442291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0224442291==--
