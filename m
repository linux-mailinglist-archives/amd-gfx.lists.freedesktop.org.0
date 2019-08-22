Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEBE99402
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 14:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2369C6EB12;
	Thu, 22 Aug 2019 12:41:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700082.outbound.protection.outlook.com [40.107.70.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6B96EB12
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 12:41:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uj25r2OYtKDYmOeW8rsizcD1aERPY6pYjXNOxD+DMEnICZHclorykgB4QVMxP8Y5vPStNZiJd7RI/wV0F1ctwSSTxXtj9/IxT/e6AtgddL62ky6l2WgfZsCZQlvoKAwmmH4lTi4Cr9ssW7CHSYYtIF7MN9DSPjk7Fj7oPZPnh7yhjV7DuiIM2rrWtfZ++CTRqLVPd/wE/5J6hO/wFVipz8ZexNMr0HAfdcU0oArWqeY1El50UjvToFi6lYbop1zAlUEnL2tvLVb5dbwyd5hIGEuujZ1K4Cy4Im+McTSsgqU9UoMHoaFqq3k7iGr52wwZv8tXLP3/ES4fNuBQ+oXCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlGNpYifJIFu6ExYIB2eiXbnJP68c0+ROcYhRgzu3HU=;
 b=Hm0Q3SWcS8WMLZVeJYi5h1GCo5I2QZrUGau9Em6BiUXWrJJPy5cpmHy/VL+5cTVa9LdaXWUXnT3p858WVY32cEuI3ulGgxqHKLu/MqSQrcZy+63EEJl1lKsELL7WUTttdd1NR1AYSIiIcRZKQUdiTHObE9w3FcvKSvUi7jV3+zJQjDNYLHlZAhT6eIA9rTo8fW+CQlOCn6MA7BqRzpsNTM5P1J2hL92wCk0QmSxeZ8qh56VS+Z2fRnUCMtwZKqZ1VowffdtCS0UYo4uU/M0EJaW7PijxmMnRylVD2rva8EoUAjJMJwG3FFxq8rWsdbcqvhLRpYcGcSp2UNF5BOiY3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1139.namprd12.prod.outlook.com (10.168.227.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 12:41:28 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 12:41:28 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Min, Frank" <Frank.Min@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] amd/amdkfd: add Arcturus vf DID support
Thread-Topic: [PATCH 2/3] amd/amdkfd: add Arcturus vf DID support
Thread-Index: AQHVVBDyOy6RVFHLcU+PgvDtNa+aI6cG3gqAgABHmDM=
Date: Thu, 22 Aug 2019 12:41:27 +0000
Message-ID: <BN6PR12MB1809478247396382A9C3D154F7A50@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1565945960-21236-1-git-send-email-Frank.Min@amd.com>
 <1565945960-21236-2-git-send-email-Frank.Min@amd.com>,
 <CH2PR12MB371826317E0F21E4640E6E85E9A50@CH2PR12MB3718.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB371826317E0F21E4640E6E85E9A50@CH2PR12MB3718.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03de0730-a2ae-4acc-bd25-08d726fe0d38
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1139; 
x-ms-traffictypediagnostic: BN6PR12MB1139:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1139B74C07BDD6A50543778DF7A50@BN6PR12MB1139.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:486;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(199004)(189003)(256004)(53546011)(6506007)(7736002)(6116002)(3846002)(316002)(110136005)(102836004)(54896002)(8936002)(6436002)(8676002)(186003)(26005)(9686003)(81166006)(86362001)(2501003)(99286004)(105004)(81156014)(6246003)(25786009)(19627405001)(55016002)(478600001)(71200400001)(66946007)(66476007)(33656002)(14454004)(66446008)(52536014)(11346002)(446003)(64756008)(66556008)(71190400001)(74316002)(66066001)(76176011)(5660300002)(7696005)(486006)(229853002)(53936002)(76116006)(2906002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1139;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TEMnLyEQp11A4wCrlus7ENtYuU9tM9RYrcHtwKKlEWxTylKuaEcl8xQ3ggDQhSjmFlj8uqvepSIcHZVTQnLTb6VnBrHys/UxXFMZTcU61y0opOJXmtubjHmYg7mn3Riqrnf7IOm7RztFTtl9EYIcKHNb/khkfGiZddxQVh3F3f0tupxNmbhmIEi2yKkEkbFS4UKGd+3bvChrOY2OLhDEQUI5xVwtPWqLxlxwIw94wUOTIkl2nWcWTJHxUIiZxTh2D5IrLloxIvtIu1mMMAe8XAXG2uSmRGIYoPEg2jFPlFFi6JKGPtjtDKRKFQm6l4BJCFaNSQ1nQidZZa29QBsoxgkzOoFrKBJcE0z3KZfBgXDiDEHhgVQpLYDwSMNQxxuTB8WQFB3xV2xqkYjmxhLoyVxTtupN9WOCpw87GHg83mQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03de0730-a2ae-4acc-bd25-08d726fe0d38
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 12:41:27.9186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FLuyVOnzeK+Ezg0hTGNoUUlJWRBXr73DUVteBbh+EUrJA52+zlw9ojFY9BbQBZbGMYcNDV9DgfXFIoAHEdSjNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1139
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlGNpYifJIFu6ExYIB2eiXbnJP68c0+ROcYhRgzu3HU=;
 b=omiC2Bl5q872JS9l4KuwGBzToVqgpMosrbUpOAaxrhfFI5N5d17ZGT61Lz+0CEyBfVIgkCyJchmk0lYNJCP3tCqMKZL5Y/lYHW+QShvT2YyMa8k/pBNW28HkNSCENmRYewOVw3XJ9OVfptW5dye5yy06xwGeTczWiPkFlSMj5Dw=
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
Content-Type: multipart/mixed; boundary="===============0381896858=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0381896858==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809478247396382A9C3D154F7A50BN6PR12MB1809namp_"

--_000_BN6PR12MB1809478247396382A9C3D154F7A50BN6PR12MB1809namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

UmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpGcm9tOiBNaW4sIEZyYW5rIDxGcmFuay5N
aW5AYW1kLmNvbT4NClNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMjIsIDIwMTkgNDoyNCBBTQ0KVG86
IFplbmcsIE9hayA8T2FrLlplbmdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnIDxhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IERldWNoZXIsIEFsZXhhbmRlciA8
QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NClN1YmplY3Q6ILTwuLQ6IFtQQVRDSCAyLzNdIGFt
ZC9hbWRrZmQ6IGFkZCBBcmN0dXJ1cyB2ZiBESUQgc3VwcG9ydA0KDQpIaSBBbGV4LA0KV291bGQg
eW91IHBsZWFzZSBoZWxwIHRvIHJldmlldyB0aGUga2ZkIGRpZCBhZGQgcGF0Y2g/DQoNCkJlc3Qg
UmVnYXJkcywNCkZyYW5rDQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBGcmFuay5NaW4g
PEZyYW5rLk1pbkBhbWQuY29tPg0Kt6LLzcqxvOQ6IDIwMTnE6jjUwjE2yNUgMTY6NTkNCsrVvP7I
yzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCrOty806IE1pbiwgRnJhbmsgPEZyYW5r
Lk1pbkBhbWQuY29tPg0K1vfM4jogW1BBVENIIDIvM10gYW1kL2FtZGtmZDogYWRkIEFyY3R1cnVz
IHZmIERJRCBzdXBwb3J0DQoNCkNoYW5nZS1JZDogSTg0MmNjMzFhYjA0MGIxN2RjYzU3NjVlMjc1
ZTU0MDJkZjc4NWIzNGENClNpZ25lZC1vZmYtYnk6IEZyYW5rLk1pbiA8RnJhbmsuTWluQGFtZC5j
b20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgfCAxICsN
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2UuYw0KaW5kZXggM2I5ZmU2Mi4uMzJiMWNmYSAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jDQpAQCAtNDcyLDYgKzQ3Miw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qga2ZkX2RldmljZWlkIHN1cHBvcnRlZF9kZXZpY2VzW10gPSB7DQogICAgICAg
ICB7IDB4NzM4QywgJmFyY3R1cnVzX2RldmljZV9pbmZvIH0sICAgICAgLyogQXJjdHVydXMgKi8N
CiAgICAgICAgIHsgMHg3Mzg4LCAmYXJjdHVydXNfZGV2aWNlX2luZm8gfSwgICAgICAvKiBBcmN0
dXJ1cyAqLw0KICAgICAgICAgeyAweDczOEUsICZhcmN0dXJ1c19kZXZpY2VfaW5mbyB9LCAgICAg
IC8qIEFyY3R1cnVzICovDQorICAgICAgIHsgMHg3MzkwLCAmYXJjdHVydXNfZGV2aWNlX2luZm8g
fSwgICAgICAvKiBBcmN0dXJ1cyB2ZiAqLw0KICAgICAgICAgeyAweDczMTAsICZuYXZpMTBfZGV2
aWNlX2luZm8gfSwgICAgICAgIC8qIE5hdmkxMCAqLw0KICAgICAgICAgeyAweDczMTIsICZuYXZp
MTBfZGV2aWNlX2luZm8gfSwgICAgICAgIC8qIE5hdmkxMCAqLw0KICAgICAgICAgeyAweDczMTgs
ICZuYXZpMTBfZGV2aWNlX2luZm8gfSwgICAgICAgIC8qIE5hdmkxMCAqLw0KLS0NCjIuNy40DQoN
Cg==

--_000_BN6PR12MB1809478247396382A9C3D154F7A50BN6PR12MB1809namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Min, Frank &lt;Frank.=
Min@amd.com&gt;<br>
<b>Sent:</b> Thursday, August 22, 2019 4:24 AM<br>
<b>To:</b> Zeng, Oak &lt;Oak.Zeng@amd.com&gt;; amd-gfx@lists.freedesktop.or=
g &lt;amd-gfx@lists.freedesktop.org&gt;; Deucher, Alexander &lt;Alexander.D=
eucher@amd.com&gt;<br>
<b>Subject:</b> =B4=F0=B8=B4: [PATCH 2/3] amd/amdkfd: add Arcturus vf DID s=
upport</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Alex,<br>
Would you please help to review the kfd did add patch?<br>
<br>
Best Regards,<br>
Frank<br>
<br>
-----=D3=CA=BC=FE=D4=AD=BC=FE-----<br>
=B7=A2=BC=FE=C8=CB: Frank.Min &lt;Frank.Min@amd.com&gt; <br>
=B7=A2=CB=CD=CA=B1=BC=E4: 2019=C4=EA8=D4=C216=C8=D5 16:59<br>
=CA=D5=BC=FE=C8=CB: amd-gfx@lists.freedesktop.org<br>
=B3=AD=CB=CD: Min, Frank &lt;Frank.Min@amd.com&gt;<br>
=D6=F7=CC=E2: [PATCH 2/3] amd/amdkfd: add Arcturus vf DID support<br>
<br>
Change-Id: I842cc31ab040b17dcc5765e275e5402df785b34a<br>
Signed-off-by: Frank.Min &lt;Frank.Min@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_device.c | 1 &#43;<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/=
amdkfd/kfd_device.c<br>
index 3b9fe62..32b1cfa 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_device.c<br>
@@ -472,6 &#43;472,7 @@ static const struct kfd_deviceid supported_devices[=
] =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 0x738C, &amp;arcturus_de=
vice_info },&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Arcturus */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 0x7388, &amp;arcturus_de=
vice_info },&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Arcturus */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 0x738E, &amp;arcturus_de=
vice_info },&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Arcturus */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 0x7390, &amp;arcturus_device_in=
fo },&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Arcturus vf */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 0x7310, &amp;navi10_devi=
ce_info },&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Navi10 */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 0x7312, &amp;navi10_devi=
ce_info },&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Navi10 */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 0x7318, &amp;navi10_devi=
ce_info },&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Navi10 */<br>
-- <br>
2.7.4<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809478247396382A9C3D154F7A50BN6PR12MB1809namp_--

--===============0381896858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0381896858==--
