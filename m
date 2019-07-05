Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CBB609DD
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 18:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7A76E4F4;
	Fri,  5 Jul 2019 16:01:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770078.outbound.protection.outlook.com [40.107.77.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7263B6E4F4
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 16:01:33 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1603.namprd12.prod.outlook.com (10.172.21.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Fri, 5 Jul 2019 16:01:30 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c%4]) with mapi id 15.20.2052.010; Fri, 5 Jul 2019
 16:01:30 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>
Subject: Re: Where do I file AMDGPU bugs nowadays?
Thread-Topic: Where do I file AMDGPU bugs nowadays?
Thread-Index: AQHVMw2Kb5wn7KS+/UCTYX4VjTQRkKa8L1qJ
Date: Fri, 5 Jul 2019 16:01:30 +0000
Message-ID: <BN6PR12MB18093D3F8EA565ED95B256CEF7F50@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <F62DB80F-3151-405A-BF14-A5B04831115A@canonical.com>
In-Reply-To: <F62DB80F-3151-405A-BF14-A5B04831115A@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.77.97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96c3f5be-c9af-465d-5c70-08d701620b8d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1603; 
x-ms-traffictypediagnostic: BN6PR12MB1603:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BN6PR12MB1603506AA0D3601B65DF32B2F7F50@BN6PR12MB1603.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(54094003)(199004)(189003)(229853002)(72206003)(55016002)(6116002)(9686003)(966005)(54896002)(6306002)(486006)(11346002)(6436002)(478600001)(446003)(476003)(25786009)(110136005)(33656002)(3846002)(2906002)(316002)(68736007)(14454004)(606006)(256004)(71190400001)(71200400001)(74316002)(26005)(102836004)(66446008)(105004)(186003)(64756008)(66476007)(66556008)(76116006)(73956011)(66946007)(52536014)(4744005)(66066001)(6246003)(7696005)(53936002)(76176011)(99286004)(8676002)(19627405001)(81156014)(81166006)(86362001)(53546011)(6506007)(7736002)(236005)(8936002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1603;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Fv7EU1aaKy633NXdNa/YllnqhLQMn8Nm6qp76Rp/1Vz68G3RsQ5ul6BA3uBVTDa7ILr0ssyqIIZidMILTPqMgqOEcQVsSpeSCpxyROdSg7a5dJHW1QxrTwMUsWWP5zopYeRYgn4TXtIX4tvYGYjZI+ydcK6wngeJ1uR9HfzQbwBHRB/QNG3v5yAxAt1wp6HaMf3FvS1wOlOaz4KTNWUmEQD/jrxYQ6sMMJntTuUaA/rHBBvyMsRbe1HMil+7TRMmjt97/gXroWd35vPj/U/F1XpmzH39ufLtHua6ecXNaIYDqh1xQCUoS2qKQRoOdX/JRjQGRgsv21jGvU/mNcsd7GDnnH7FQaPiOE+1cWaoKWw2LPQueyYFLUETHBIJOdCzyHZOVKy8DMHru6jozfVzuxbxcCPJMN8/6iBv84Fnb+I=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c3f5be-c9af-465d-5c70-08d701620b8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 16:01:30.5972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1603
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSuIZ9IXXdO6phZQ6+sCLRVVNr2g8JbcrwCcGJdR3H4=;
 b=U6ZS13X0E9cV5cBzWw2kUp+JUpTCEz/Nc/fHgjLsZ79dl1l7hYvwFSUZ06OCg2cxEEl7j7lBd1RFHnJggRngADKjFEbm+lqdTZv9xamEnwKCWTYwdHsMMy65OSpX1DwxhMjoTkeKKMukUb1ZDoX6C0dLZwVqa/ju5Xy+VI5cvRU=
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
Content-Type: multipart/mixed; boundary="===============0165849242=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0165849242==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18093D3F8EA565ED95B256CEF7F50BN6PR12MB1809namp_"

--_000_BN6PR12MB18093D3F8EA565ED95B256CEF7F50BN6PR12MB1809namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

That is the correct bug tracker.

Thanks,

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Kai-Heng=
 Feng <kai.heng.feng@canonical.com>
Sent: Thursday, July 4, 2019 4:05 AM
To: amd-gfx list
Subject: Where do I file AMDGPU bugs nowadays?

Hi AMDGPU folks,

I=92ve filed a bug [1] a while back, but no response so far.
I wonder if you still use BFO? Or do you migrate to another bug tracking
system?

[1]https://bugs.freedesktop.org/show_bug.cgi?id=3D110886

Kai-Heng
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18093D3F8EA565ED95B256CEF7F50BN6PR12MB1809namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
That is the correct bug tracker.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
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
ounces@lists.freedesktop.org&gt; on behalf of Kai-Heng Feng &lt;kai.heng.fe=
ng@canonical.com&gt;<br>
<b>Sent:</b> Thursday, July 4, 2019 4:05 AM<br>
<b>To:</b> amd-gfx list<br>
<b>Subject:</b> Where do I file AMDGPU bugs nowadays?</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi AMDGPU folks,<br>
<br>
I=92ve filed a bug [1] a while back, but no response so far.<br>
I wonder if you still use BFO? Or do you migrate to another bug tracking&nb=
sp; <br>
system?<br>
<br>
[1]https://bugs.freedesktop.org/show_bug.cgi?id=3D110886<br>
<br>
Kai-Heng<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18093D3F8EA565ED95B256CEF7F50BN6PR12MB1809namp_--

--===============0165849242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0165849242==--
