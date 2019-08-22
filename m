Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 976599941D
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 14:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A7089B3C;
	Thu, 22 Aug 2019 12:45:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700062.outbound.protection.outlook.com [40.107.70.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F64289B3C
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 12:45:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpuPIJeq+ww65UqJVMA3qYYQOBniwR05X7w98uyKfmZubkTewv6O9zr4d/NH/6dV3odEvlKY40uMCBr+WN6rP3v4uHCEtrSmw9yZmLYLdSGS0WP4s3Ji0f0wvdpFSdD4QhHKjAfhfnM/09kQk0Fhvj9nal8HaRYc5yNo1eJQ7by9a5VLX62JWQSPlW+umzKzVDtp5i9rsTuVl54UNgpKbj8+xADIzmHyY/r2Bw1vkGAyOxbSUO6z5IT5W4e/tF51qX8vxbDo85fHbElyjKfRTrcQFf2l14AtxVgh04WZx0cd6/05Go9j5kli7062Kdc3jabYUlFGn+fn6kKJ/vMaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NIM8sc+s+3EwbadE5u+mPGQYLbxmRnyW5bYqVZrDis=;
 b=BvBiRAn4dZ2HPoQRWolJjmFH0WtNzuLXZfGcA5emvhDW2DuayUKcml3D6Hv9YUgSq5k3cZKns3LFggrL8vJ+TyAUhoO3+oh87IGZufih0e/nselG9kngTlWMgX8829sgd1rLgjW4JvMSqqo5l0/3esXL39b69kVHRvTA7FYHkuLEjZdZMuUesxADETWOctq/f2oFLem9uNl39qRoBI7GFuWvYMq/ncNJ0w7/5viLE5HuN4Hy6Zh/ndA+b1E6EzR/Kv2IW7R98VWdYHg0fWVHJii39FjZYuqktBLb6mQ3Cb16zH5xqbRUK76Z1ZX5QBY1s+t+6K3yuQe7kMDjnEnmEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1681.namprd12.prod.outlook.com (10.172.19.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 12:45:43 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 12:45:43 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Clemens Eisserer <linuxhippy@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: atombios stuck executing D850 when trying to switch to 4k@60Hz on
 Polaris10
Thread-Topic: atombios stuck executing D850 when trying to switch to 4k@60Hz
 on Polaris10
Thread-Index: AQHVWMUf7Fq8d0XhOUqsm+91A9jV7qcHHU3y
Date: Thu, 22 Aug 2019 12:45:43 +0000
Message-ID: <BN6PR12MB1809DE32DBA7017A974E8BDAF7A50@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <CAFvQSYT+Qd8_tE7yvnjLt8RAduAEwUOuh3rvh0X7e3--LqQ78w@mail.gmail.com>
In-Reply-To: <CAFvQSYT+Qd8_tE7yvnjLt8RAduAEwUOuh3rvh0X7e3--LqQ78w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d6eef19-02e3-48e2-bcdd-08d726fea563
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1681; 
x-ms-traffictypediagnostic: BN6PR12MB1681:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BN6PR12MB1681F30C8CE75A290D3FD04DF7A50@BN6PR12MB1681.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(189003)(199004)(71190400001)(71200400001)(9686003)(105004)(236005)(6306002)(55016002)(66946007)(966005)(25786009)(478600001)(19627405001)(66556008)(76116006)(66476007)(64756008)(54896002)(316002)(66066001)(33656002)(52536014)(2906002)(446003)(8676002)(110136005)(11346002)(476003)(486006)(5660300002)(86362001)(81156014)(81166006)(229853002)(102836004)(606006)(8936002)(14444005)(7736002)(66446008)(2501003)(14454004)(3846002)(186003)(26005)(7696005)(6116002)(6246003)(6506007)(53546011)(76176011)(74316002)(6436002)(256004)(99286004)(53936002)(10126625002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1681;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tEkhsq1cB2VXY3IzwU8RY1heeyKcj4zZLqr63KYy2p8XKrRHfb9uAdIIheNSnJD+etgw56WSYaklcyCejC+qMjz2NAnUSgSeEFFaLgpGxh7Frd0ybrk7T/YBYvRlDAlm8wtEy4+i7hd3JxRB2beKGVg3pyiJM+zqfyKc0iEwLgG2bP34lieSpOLNmubH1opYxoEC6nD7iZ108qXaW65aBlPfv+j6cv55oer+NALkBB1h/k0d5C1sXnW/l8flu2/StTCyD7T5mrPiMO8MRgRdRVsOFMFWikvNkQqCjgftPlrQ41n8GoD/TMU8AcZ7gcLD85WY6Z6JufR+CKax9u3IqzD72f9mtuDGaeEJ4dC+Zx1l5uz5Lyg7ao+BIrJFNbbGbtWIevDDh1zHXfA3ekFeQ2I1oVO4J9LXS2Gn9ZS65G0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6eef19-02e3-48e2-bcdd-08d726fea563
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 12:45:43.2611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bVv7KP5pWBRkmDQQPN5LP7WuOc+suETTe4EzlJSEM7+dB2JPSBitQAnerV6I9I3lbr/s2B/K0xUubd+xB4sUiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1681
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NIM8sc+s+3EwbadE5u+mPGQYLbxmRnyW5bYqVZrDis=;
 b=s4q5GH7iVVRwyHyWl/N0IYocX1nvXBpTgxFG+wSD0QARJGb4EdiqjbsHd3ziAJgDwKFQw3bfALyLBf0sdVXc8dNZG9WGTRv0QX+5tH776nOhLcrbrI0FivQg3ntl3Pd072aPEEyUL9FK1Rds9GuhvA+ZZyuihXESYWQ9vWnN1hY=
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
Content-Type: multipart/mixed; boundary="===============1689185196=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1689185196==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809DE32DBA7017A974E8BDAF7A50BN6PR12MB1809namp_"

--_000_BN6PR12MB1809DE32DBA7017A974E8BDAF7A50BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

You need to use dc to support 4k@60.  Remove amdgpu.dc=3D0 from the kernel =
command line in grub.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Clemens =
Eisserer <linuxhippy@gmail.com>
Sent: Thursday, August 22, 2019 4:39 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Subject: atombios stuck executing D850 when trying to switch to 4k@60Hz on =
Polaris10

Hi there,

I am trying to connect a LG 32UD59 UHD monitor to a MSI Armor RX570 4G
card via a HDMI2 (cheap) certified cable.
Unfourtunatly the setup only runs at 30Hz, whereas when booting
Windows it automatically selects 3840x2160@59Hz.

I played a bit with adding the modelines manually, however when
enabling those new modes the screen goes black and in syslog I find
the following entries:

[  571.174813] [drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in
loop for more than 5secs aborting
[  571.174862] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR*
atombios stuck executing D850 (len 824, WS 0, PS 0) @ 0xD992
[  571.174908] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR*
atombios stuck executing D70A (len 326, WS 0, PS 0) @ 0xD7A6

Xorg.0.log: https://pastebin.com/LmZ0bvyL
kernel log: https://pastebin.com/rXGVMTnV

Help would be really appreciated - I am rather latency sensitive and
those 30Hz are driving me nuts ;)

Best regards, Clemens
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809DE32DBA7017A974E8BDAF7A50BN6PR12MB1809namp_
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
You need to use dc to support 4k@60.&nbsp; Remove amdgpu.dc=3D0 from the ke=
rnel command line in grub.</div>
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
ounces@lists.freedesktop.org&gt; on behalf of Clemens Eisserer &lt;linuxhip=
py@gmail.com&gt;<br>
<b>Sent:</b> Thursday, August 22, 2019 4:39 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Subject:</b> atombios stuck executing D850 when trying to switch to 4k@6=
0Hz on Polaris10</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi there,<br>
<br>
I am trying to connect a LG 32UD59 UHD monitor to a MSI Armor RX570 4G<br>
card via a HDMI2 (cheap) certified cable.<br>
Unfourtunatly the setup only runs at 30Hz, whereas when booting<br>
Windows it automatically selects 3840x2160@59Hz.<br>
<br>
I played a bit with adding the modelines manually, however when<br>
enabling those new modes the screen goes black and in syslog I find<br>
the following entries:<br>
<br>
[&nbsp; 571.174813] [drm:atom_op_jump [amdgpu]] *ERROR* atombios stuck in<b=
r>
loop for more than 5secs aborting<br>
[&nbsp; 571.174862] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR*=
<br>
atombios stuck executing D850 (len 824, WS 0, PS 0) @ 0xD992<br>
[&nbsp; 571.174908] [drm:amdgpu_atom_execute_table_locked [amdgpu]] *ERROR*=
<br>
atombios stuck executing D70A (len 326, WS 0, PS 0) @ 0xD7A6<br>
<br>
Xorg.0.log: <a href=3D"https://pastebin.com/LmZ0bvyL">https://pastebin.com/=
LmZ0bvyL</a><br>
kernel log: <a href=3D"https://pastebin.com/rXGVMTnV">https://pastebin.com/=
rXGVMTnV</a><br>
<br>
Help would be really appreciated - I am rather latency sensitive and<br>
those 30Hz are driving me nuts ;)<br>
<br>
Best regards, Clemens<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809DE32DBA7017A974E8BDAF7A50BN6PR12MB1809namp_--

--===============1689185196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1689185196==--
