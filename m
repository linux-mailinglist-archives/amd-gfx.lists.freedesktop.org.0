Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A2463611
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 14:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CECA8916D;
	Tue,  9 Jul 2019 12:40:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710065.outbound.protection.outlook.com [40.107.71.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C1E8916D
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 12:40:45 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1377.namprd12.prod.outlook.com (10.168.227.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 12:40:43 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c%4]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 12:40:43 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: increase the SMU msg response waiting
 time
Thread-Topic: [PATCH] drm/amd/powerplay: increase the SMU msg response waiting
 time
Thread-Index: AQHVNhjzomdEpJdctE2ewElx+u8Vg6bCOmIs
Date: Tue, 9 Jul 2019 12:40:43 +0000
Message-ID: <BN6PR12MB180934CC91BC9A2A3C393AC2F7F10@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190709054111.11433-1-evan.quan@amd.com>
In-Reply-To: <20190709054111.11433-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.79.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e51ab31-6b87-4b85-39b1-08d7046aa84c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1377; 
x-ms-traffictypediagnostic: BN6PR12MB1377:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1377EB1DB0DFA12C2590E93FF7F10@BN6PR12MB1377.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(199004)(189003)(71190400001)(71200400001)(81156014)(74316002)(2906002)(5660300002)(105004)(66066001)(86362001)(606006)(68736007)(446003)(25786009)(11346002)(7696005)(8936002)(2501003)(81166006)(19627405001)(76176011)(14454004)(186003)(7736002)(4326008)(99286004)(3846002)(6116002)(53546011)(6506007)(102836004)(14444005)(54906003)(110136005)(53936002)(316002)(478600001)(66476007)(256004)(486006)(966005)(66556008)(64756008)(66446008)(66946007)(73956011)(55016002)(6246003)(33656002)(6436002)(8676002)(76116006)(54896002)(6306002)(476003)(52536014)(236005)(72206003)(9686003)(229853002)(26005)(69900200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1377;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qgglSQnmc6jR6utECZJlEDSdeHUJJbUhHV+jfeVGp9TT2wJ0cLoh+xU+R3Yt46trXETDuu9QP2B3mH6tWUzPxQOPrbV2VB3v4ZJfeg1/dMsxiMpgzb36piW7jmgDUzTEIQke2ZdmoO6sFw7O7HNqz3CLUHogR4dkAXZgUKAY7CtsvkRnFzIpKbTpLfRkDftVYTFjx5JCHOavog+9pJkA3Nup4m8Hgbw3EIDtKwON7JvuH0jpRgoDdM1eDp7hBS2nYG3K1dxJdfJknxv8dvEeobIqGGPkvw728D+jDr7lDVr5w7RysGHJhtWBIdzu1jb6AarQqiqgy2ZqKzXOEV/9mP42yddkB+WMO5zt3ZWe43ypqHl3KljfrCMo9lfCXu/hkPMk9Ov85wsFu5NWmspYIy+ZcAmjbTtYriqGE+znuzU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e51ab31-6b87-4b85-39b1-08d7046aa84c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 12:40:43.1837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1377
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MExFsRpIWE9QOVXg18sYOw8Xd5l4RQmq9bXIUb60qJc=;
 b=pafSnnlPAyEr0FE5DUUhWv+0v2FEARCaSK28/JI5kYfaYJkVMddiXFQMapNyVnwpZyxXNjc7/Or7hzocm+ttZZXcTYP7M2tCpO0KgcEDqSOfWNQHXeiuB8P2sMi1SChdl0tLTCHIBGw+Y9Lzdhi58ZNoM8718ZwbiZVnFPlc5X0=
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
Cc: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Wu,
 Xiaowei" <Xiaowei.Wu@amd.com>
Content-Type: multipart/mixed; boundary="===============2059455821=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2059455821==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB180934CC91BC9A2A3C393AC2F7F10BN6PR12MB1809namp_"

--_000_BN6PR12MB180934CC91BC9A2A3C393AC2F7F10BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If this is just for the SMU, maybe it would be better to add a separate tim=
eout for the SMU since this will increase the timeout for lots of things, u=
nless we need an overall timeout increase for mode1 reset.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Tuesday, July 9, 2019 1:41 AM
To: amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander; Grodzovsky, Andrey; Quan, Evan; Wu, Xiaowei
Subject: [PATCH] drm/amd/powerplay: increase the SMU msg response waiting t=
ime

Increase the waiting time to 1s from 200ms. This is expected
to fix some mode1 reset failures.

Change-Id: I4c11996628cd40d559c6edea97d092f397122d78
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd=
/include/amd_shared.h
index 447bc4d..779c9e7 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -28,7 +28,7 @@
 #endif


-#define AMD_MAX_USEC_TIMEOUT           200000  /* 200 ms */
+#define AMD_MAX_USEC_TIMEOUT           1000000  /* 1000 ms */

 /*
  * Chip flags
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB180934CC91BC9A2A3C393AC2F7F10BN6PR12MB1809namp_
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
If this is just for the SMU, maybe it would be better to add a separate tim=
eout for the SMU since this will increase the timeout for lots of things, u=
nless we need an overall timeout increase for mode1 reset.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Tuesday, July 9, 2019 1:41 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Deucher, Alexander; Grodzovsky, Andrey; Quan, Evan; Wu, Xiaowei<=
br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: increase the SMU msg response wa=
iting time</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Increase the waiting time to 1s from 200ms. This i=
s expected<br>
to fix some mode1 reset failures.<br>
<br>
Change-Id: I4c11996628cd40d559c6edea97d092f397122d78<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/include/amd_shared.h | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd=
/include/amd_shared.h<br>
index 447bc4d..779c9e7 100644<br>
--- a/drivers/gpu/drm/amd/include/amd_shared.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/include/amd_shared.h<br>
@@ -28,7 &#43;28,7 @@<br>
&nbsp;#endif<br>
&nbsp;<br>
&nbsp;<br>
-#define AMD_MAX_USEC_TIMEOUT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 200000&nbsp; /* 200 ms */<br>
&#43;#define AMD_MAX_USEC_TIMEOUT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 1000000&nbsp; /* 1000 ms */<br>
&nbsp;<br>
&nbsp;/*<br>
&nbsp; * Chip flags<br>
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

--_000_BN6PR12MB180934CC91BC9A2A3C393AC2F7F10BN6PR12MB1809namp_--

--===============2059455821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2059455821==--
