Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F1B6FAE8
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 10:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64017892D6;
	Mon, 22 Jul 2019 08:06:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740040.outbound.protection.outlook.com [40.107.74.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75844892D6
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 08:06:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OL3UiNQwU0GKbeBmEQouUaaxNeu1J+bbUR1VbCVMbx8XpFtoq8dNbxXtesBVrs4SfJ55dr9V/qZ36fQ3ouonBSPk97tRErsSrgORMCj2v1kmRUhcXGg3giuoEnpBH8sa1EUODbUL70Ni6XuF0DHdImTIqvrEI1RgrNsdWpDtVq4g11q1HmpwNLh1xI0CQe38kP//7ZgvNwlftDU9W7TMT2H//7YuA3Ae4FeTjrx3B5cV4HIa0L2u9jIWhmdJW4EArh9QFuulFyrh3BLT+aVOq/E6iGfinBY0fUS+CSeiFfAQ7+4fr1jKZ3q0nQFYypja/96LHrPFB6bIGLt5wmEI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6wTzGg0JR5MTunXk/1RsXhNw8GcGhwtpuJ0tmIiYME=;
 b=XpbkxZRg8ll8ngmaTSq2xn18oegsUVQjDQ8W0hkT1UR8l68OSGt3fBeOMGJwU653nfzI7ab341/8Hk7Pq3VWdIitHEWIgtSwsV1+etKIHbZV7HEiup0J678qBjRjyubsmY/Xs/8zgqEMO3Dq36ucJ4peioLqL4LsaXMYQwmvVgCovkqTuEdEgiyHcEpO8yIDGGHUO2UQFmJKA0YtObTTjBTiDALYochrZP6X/Ddv5sKBg84xbR469shucqPQCcAmKBzQmkvK/+Jbup5FXNqmEMIg2nrVUvPYn2OUNDQhDSKs0uUjFw/l5j8VAU287+HwJYkZsQzjTH/m8W/IIlec6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3904.namprd12.prod.outlook.com (10.255.238.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 08:06:33 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b475:24f4:8515:731]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b475:24f4:8515:731%4]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 08:06:33 +0000
From: "Cui, Flora" <Flora.Cui@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH libdrm 1/1] tests/amdgpu: divide dispatch test into
 compute and gfx
Thread-Topic: [PATCH libdrm 1/1] tests/amdgpu: divide dispatch test into
 compute and gfx
Thread-Index: AQHVQGOs+3KaRDlJh0qrDdsxZxkXfKbWR8yg
Date: Mon, 22 Jul 2019 08:06:33 +0000
Message-ID: <MN2PR12MB3312F3AD6E32FE6E9587C238FAC40@MN2PR12MB3312.namprd12.prod.outlook.com>
References: <1563782474-32675-1-git-send-email-le.ma@amd.com>
In-Reply-To: <1563782474-32675-1-git-send-email-le.ma@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06b490c2-6dfc-4342-6ab0-08d70e7b8315
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3904; 
x-ms-traffictypediagnostic: MN2PR12MB3904:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3904C5C90BAFD8C05F8DEDADFAC40@MN2PR12MB3904.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(189003)(13464003)(199004)(6306002)(55016002)(66946007)(64756008)(66556008)(66476007)(9686003)(446003)(476003)(11346002)(66446008)(76116006)(6246003)(74316002)(7736002)(305945005)(8676002)(2906002)(110136005)(478600001)(68736007)(256004)(966005)(53546011)(229853002)(71190400001)(71200400001)(86362001)(6506007)(102836004)(26005)(99286004)(186003)(486006)(2501003)(4326008)(76176011)(66066001)(33656002)(316002)(25786009)(8936002)(53936002)(81166006)(81156014)(14454004)(5660300002)(7696005)(6116002)(3846002)(52536014)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3904;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K5ZQ2iEGIIq9V5c2dHCxBItUlff0RSNwd2K9YS9ysZE/dEDsaOdePIKYesH7T7U27Oz8j3+JfNuOmrCpH98JJgrfOFI9znHmuMWx+o3kFyW7q4lQUCInPClvnitAL2+pL9z26I1RwdOgWD3y+6idOTabpkpaRJ3+Buas4KEXy2y6SLfw2h68W20FrVERVA1m2ETkgCJiymdExBUoFe6ObYjYVu1do0GroxiHOlYT0tY2koXWijCYHJhRnL77NzTyqL3R08s5B1Mlm7vIrkVEQ5TejFh11xut6uyONaaCJb6GkMFBXyo1o3//OvuOheZwG6CjLWu+y4+ScbJXmMDZzXlKTBQE8YaRmNUztzn8Nu0ycjo6oes/N5r229onhxPM0CD/07Ipa+1nQhXoMJldypUZa5P6xBvADySrPW9x0b0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b490c2-6dfc-4342-6ab0-08d70e7b8315
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 08:06:33.8779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3904
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6wTzGg0JR5MTunXk/1RsXhNw8GcGhwtpuJ0tmIiYME=;
 b=I8D4kSvLt4DgAoXgI4me4AHyCUsHxcfFuny2qUnZ2+CC0Z9Rmvzf4bWMP0qtwsV2PnQZfbip3h00bRdm82eY+p4SqjK5IvwJk/9POz2Jb0yDEpvw+/9A9RVqKNIwQvehIjMmct5nga4N5fhwqsTqCqGd7z/NwIlE7nz1rONxVcA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Flora.Cui@amd.com; 
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
Cc: "Ma, Le" <Le.Ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGF0Y2ggaXMgUmV2aWV3ZWQtYnk6IEZsb3JhIEN1aSA8ZmxvcmEuY3VpQGFtZC5jb20+DQpDb3Vs
ZCB5b3UgYXBwbHkgdGhlIHNpbWlsYXIgY2hhbmdlIHRvIGRyYXcgdGVzdD8NCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBMZSBNYQ0KU2VudDogTW9uZGF5LCBKdWx5IDIy
LCAyMDE5IDQ6MDEgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IE1h
LCBMZSA8TGUuTWFAYW1kLmNvbT47IEN1aSwgRmxvcmEgPEZsb3JhLkN1aUBhbWQuY29tPg0KU3Vi
amVjdDogW1BBVENIIGxpYmRybSAxLzFdIHRlc3RzL2FtZGdwdTogZGl2aWRlIGRpc3BhdGNoIHRl
c3QgaW50byBjb21wdXRlIGFuZCBnZngNCg0KZm9yIGJldHRlciBjbGFyaWZpY2F0aW9uDQoNCkNo
YW5nZS1JZDogSTI0NWQ3NjBkNWY5ZDY0ZWIxMGIxMzdkNWNlMzc1ZWY1MmE0ZDg3M2ENClNpZ25l
ZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPg0KLS0tDQogdGVzdHMvYW1kZ3B1L2Jhc2lj
X3Rlc3RzLmMgfCAxNiArKysrKysrKysrKysrLS0tDQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS90ZXN0cy9hbWRncHUvYmFz
aWNfdGVzdHMuYyBiL3Rlc3RzL2FtZGdwdS9iYXNpY190ZXN0cy5jIGluZGV4IDkzODEwNmUuLmZh
MGY1NjggMTAwNjQ0DQotLS0gYS90ZXN0cy9hbWRncHUvYmFzaWNfdGVzdHMuYw0KKysrIGIvdGVz
dHMvYW1kZ3B1L2Jhc2ljX3Rlc3RzLmMNCkBAIC01NSw3ICs1NSw4IEBAIHN0YXRpYyB2b2lkIGFt
ZGdwdV91c2VycHRyX3Rlc3Qodm9pZCk7ICBzdGF0aWMgdm9pZCBhbWRncHVfc2VtYXBob3JlX3Rl
c3Qodm9pZCk7ICBzdGF0aWMgdm9pZCBhbWRncHVfc3luY19kZXBlbmRlbmN5X3Rlc3Qodm9pZCk7
DQogc3RhdGljIHZvaWQgYW1kZ3B1X2JvX2V2aWN0aW9uX3Rlc3Qodm9pZCk7IC1zdGF0aWMgdm9p
ZCBhbWRncHVfZGlzcGF0Y2hfdGVzdCh2b2lkKTsNCitzdGF0aWMgdm9pZCBhbWRncHVfY29tcHV0
ZV9kaXNwYXRjaF90ZXN0KHZvaWQpOw0KK3N0YXRpYyB2b2lkIGFtZGdwdV9nZnhfZGlzcGF0Y2hf
dGVzdCh2b2lkKTsNCiBzdGF0aWMgdm9pZCBhbWRncHVfZHJhd190ZXN0KHZvaWQpOw0KIHN0YXRp
YyB2b2lkIGFtZGdwdV9ncHVfcmVzZXRfdGVzdCh2b2lkKTsNCiANCkBAIC03OSw3ICs4MCw4IEBA
IENVX1Rlc3RJbmZvIGJhc2ljX3Rlc3RzW10gPSB7DQogCXsgIkNvbW1hbmQgc3VibWlzc2lvbiBU
ZXN0IChTRE1BKSIsIGFtZGdwdV9jb21tYW5kX3N1Ym1pc3Npb25fc2RtYSB9LA0KIAl7ICJTVyBz
ZW1hcGhvcmUgVGVzdCIsICBhbWRncHVfc2VtYXBob3JlX3Rlc3QgfSwNCiAJeyAiU3luYyBkZXBl
bmRlbmN5IFRlc3QiLCAgYW1kZ3B1X3N5bmNfZGVwZW5kZW5jeV90ZXN0IH0sDQotCXsgIkRpc3Bh
dGNoIFRlc3QiLCAgYW1kZ3B1X2Rpc3BhdGNoX3Rlc3QgfSwNCisJeyAiRGlzcGF0Y2ggVGVzdCAo
Q29tcHV0ZSkiLCAgYW1kZ3B1X2NvbXB1dGVfZGlzcGF0Y2hfdGVzdCB9LA0KKwl7ICJEaXNwYXRj
aCBUZXN0IChHRlgpIiwgIGFtZGdwdV9nZnhfZGlzcGF0Y2hfdGVzdCB9LA0KIAl7ICJEcmF3IFRl
c3QiLCAgYW1kZ3B1X2RyYXdfdGVzdCB9LA0KIAl7ICJHUFUgcmVzZXQgVGVzdCIsIGFtZGdwdV9n
cHVfcmVzZXRfdGVzdCB9LA0KIAlDVV9URVNUX0lORk9fTlVMTCwNCkBAIC0yNDQ4LDcgKzI0NTAs
OCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfbWVtY3B5X2Rpc3BhdGNoX3Rlc3QoYW1kZ3B1X2Rldmlj
ZV9oYW5kbGUgZGV2aWNlX2hhbmRsZSwNCiAJciA9IGFtZGdwdV9jc19jdHhfZnJlZShjb250ZXh0
X2hhbmRsZSk7DQogCUNVX0FTU0VSVF9FUVVBTChyLCAwKTsNCiB9DQotc3RhdGljIHZvaWQgYW1k
Z3B1X2Rpc3BhdGNoX3Rlc3Qodm9pZCkNCisNCitzdGF0aWMgdm9pZCBhbWRncHVfY29tcHV0ZV9k
aXNwYXRjaF90ZXN0KHZvaWQpDQogew0KIAlpbnQgcjsNCiAJc3RydWN0IGRybV9hbWRncHVfaW5m
b19od19pcCBpbmZvOw0KQEAgLTI0NjMsNiArMjQ2NiwxMyBAQCBzdGF0aWMgdm9pZCBhbWRncHVf
ZGlzcGF0Y2hfdGVzdCh2b2lkKQ0KIAkJYW1kZ3B1X21lbXNldF9kaXNwYXRjaF90ZXN0KGRldmlj
ZV9oYW5kbGUsIEFNREdQVV9IV19JUF9DT01QVVRFLCByaW5nX2lkKTsNCiAJCWFtZGdwdV9tZW1j
cHlfZGlzcGF0Y2hfdGVzdChkZXZpY2VfaGFuZGxlLCBBTURHUFVfSFdfSVBfQ09NUFVURSwgcmlu
Z19pZCk7DQogCX0NCit9DQorDQorc3RhdGljIHZvaWQgYW1kZ3B1X2dmeF9kaXNwYXRjaF90ZXN0
KHZvaWQpIHsNCisJaW50IHI7DQorCXN0cnVjdCBkcm1fYW1kZ3B1X2luZm9faHdfaXAgaW5mbzsN
CisJdWludDMyX3QgcmluZ19pZDsNCiANCiAJciA9IGFtZGdwdV9xdWVyeV9od19pcF9pbmZvKGRl
dmljZV9oYW5kbGUsIEFNREdQVV9IV19JUF9HRlgsIDAsICZpbmZvKTsNCiAJQ1VfQVNTRVJUX0VR
VUFMKHIsIDApOw0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
