Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D80A0FE8
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 05:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27F989A83;
	Thu, 29 Aug 2019 03:26:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690060.outbound.protection.outlook.com [40.107.69.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71A589A83
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 03:26:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWGtFMgwmdGFmotDoNBH8iwoS4jFbu8/XjimTT+zkqIZITV+bCnxzMP+ap+Xy9k/GAKi4/4qQMQRck+B3qj2/PgSIila7CVawJktO1tIl5yf5Jji9HpSfrj0aUOH0Z8RXgF1lLHFy6aZdPmtygju4FjJ2oKYGJoGkrhkbszI6MTYcpML+itlLDE7scxW+Itrxyhay4eVjPdy23pNjXHOTtryUppPssfMwTaeQxLXd+FkiTaONf9dDZnw2miz3JbAMtpCt39hzL0uCsnsH3rYA74T5Q+s+6hJuXqZnwPVTehSNP/+T4o+kILXG35HVi7v0oYLbtMa/AEng10xMXW69A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxrtrG3oC6x/UpgPt2BYV88oOShOJDFrhH0ZuN3Gz9A=;
 b=Impi11JQVh6Cjq819Jg3FDCIXyc4+HK+zInIEin5iryoVL7vaRSNhbiEEOJpdr04rXizJ68OrTWR5BHpQf2kbtSFbKRnzPPbzz1LiWyODdBE4BDAZLD/+kcv7iYfAF5f8DoEbVOTxyzUOS2EiR1Sqi40IB1xfXtPp8NMKkS903mTuN6cNZKh1k+v6gRu0qs2Zg23ETcXu+kSMuGAmnUNC0nnLcRFW2BJE4uRxP3UakPpHtL5ZXNuQI/KOfaP3oqhk+/VYRJEL7js2aFUL7A8pUQph2bljICrWH+g2Mx6W6kYWDqRqTp14+MMhrPjDbODDiNRwhkF0mHmmtSTTkZW/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3840.namprd12.prod.outlook.com (10.255.237.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Thu, 29 Aug 2019 03:26:00 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 03:26:00 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 2/7] drm/amdgpu: switch to amdgpu_ras_late_init for gfx v9
 block
Thread-Topic: [PATCH 2/7] drm/amdgpu: switch to amdgpu_ras_late_init for gfx
 v9 block
Thread-Index: AQHVXaEARgFi2YhpbEuAiMjBwvaqz6cRdumQ
Date: Thu, 29 Aug 2019 03:26:00 +0000
Message-ID: <MN2PR12MB30546933E4F140680B35FDECB0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
 <1566997395-7185-2-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1566997395-7185-2-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3d56d58-fadc-45e0-3c6e-08d72c309d80
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3840; 
x-ms-traffictypediagnostic: MN2PR12MB3840:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3840D428AAC0443088A43A10B0A20@MN2PR12MB3840.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(13464003)(199004)(189003)(966005)(55016002)(64756008)(6436002)(52536014)(66446008)(7696005)(486006)(5660300002)(66556008)(53936002)(33656002)(71200400001)(71190400001)(86362001)(26005)(14454004)(478600001)(76116006)(4326008)(66476007)(6246003)(316002)(66946007)(110136005)(14444005)(256004)(66066001)(2501003)(6306002)(25786009)(8676002)(9686003)(6636002)(99286004)(2906002)(102836004)(74316002)(305945005)(81166006)(81156014)(6116002)(186003)(3846002)(76176011)(229853002)(446003)(8936002)(7736002)(6506007)(11346002)(476003)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3840;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q0xtNcjNwqCMINRQCIesU82yyNM4livkxE37BtfXwJ3V/phbsFdCxqv42zJ4aytvCzWrCB+G92UgvzIYQAocwEaj9TEjr4Ej+3ionx4LS+sgM+X9zSudo5kLJb3zD365fIRFWTgotmlpxzGv8SB3qwIJu98JQiDbG6p+EnULp0Ldy4funckFpYogl7BKiLPjREVZH+8Z9NYwa7l0C6QUQjmDUl1MbC68FYSJ3SVASxS1NMWuHkyQafqmj+S4Nz1OmljiKIzT/V4E3Z9kURYDDFw5VjZBmxe/aRb8J2kl2AvyJWeF9CDZwkUvuTRTEbSt81Bb6qvWsvxEGDS4ha2WIUuXH4mPF9NqDGQQYahLpKa75mj1OpbRK7txW8E7WwTnfVjIITHIXICKfil9RwZPqvTF+HhgX/w+SbeHYWCfDsQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d56d58-fadc-45e0-3c6e-08d72c309d80
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 03:26:00.7664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mfRgUl8I1ok9OMNJv7bH7+3n3qfNeJFpYWZHlTXwKd60rmnNZQN2EFpo9XsO8mZH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3840
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxrtrG3oC6x/UpgPt2BYV88oOShOJDFrhH0ZuN3Gz9A=;
 b=oJuhySBrrUEc6vXF3zOHLEvk83O9b5RLVmCe4AnJGCBUB2c7b6Fv1EoK8/V17aSRefxTMZKC202R+XI9eOOitYY3Prft3VRBJ4ggzfeYvMmhbjHI+7slFXScI450UJLBPnXYLRDfSYm0BSVfmaD5RohH8HsE9uBNWDeMevkzCXI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IEhhd2tpbmcg
WmhhbmcNCj4gU2VudDogMjAxOeW5tDjmnIgyOOaXpSAyMTowMw0KPiBUbzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsNCj4gRGV1
Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KPiBDYzogWmhhbmcs
IEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDIvN10g
ZHJtL2FtZGdwdTogc3dpdGNoIHRvIGFtZGdwdV9yYXNfbGF0ZV9pbml0IGZvciBnZnggdjkNCj4g
YmxvY2sNCj4gDQo+IGNhbGwgaGVscGVyIGZ1bmN0aW9uIGluIGxhdGUgaW5pdCBwaGFzZSB0byBo
YW5kbGUgcmFzIGluaXQgZm9yIGdmeCBpcCBibG9jaw0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGF3
a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCA5MCArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiAtLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA3MSBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjlfMC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0K
PiBpbmRleCBhNmJjYmRlLi42MmVjNDUxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92OV8wLmMNCj4gQEAgLTQzODksNyArNDM4OSw2IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBf
cHJvY2Vzc19yYXNfZGF0YV9jYihzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwgIHN0YXRp
YyBpbnQgZ2Z4X3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpICB7DQo+ICAJc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7DQo+
IC0Jc3RydWN0IHJhc19jb21tb25faWYgKipyYXNfaWYgPSAmYWRldi0+Z2Z4LnJhc19pZjsNCj4g
IAlzdHJ1Y3QgcmFzX2loX2lmIGloX2luZm8gPSB7DQo+ICAJCS5jYiA9IGdmeF92OV8wX3Byb2Nl
c3NfcmFzX2RhdGFfY2IsDQo+ICAJfTsNCj4gQEAgLTQzOTcsMTggKzQzOTYsMTggQEAgc3RhdGlj
IGludCBnZnhfdjlfMF9lY2NfbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkNCj4gIAkJLnN5c2ZzX25h
bWUgPSAiZ2Z4X2Vycl9jb3VudCIsDQo+ICAJCS5kZWJ1Z2ZzX25hbWUgPSAiZ2Z4X2Vycl9pbmpl
Y3QiLA0KPiAgCX07DQo+IC0Jc3RydWN0IHJhc19jb21tb25faWYgcmFzX2Jsb2NrID0gew0KPiAt
CQkuYmxvY2sgPSBBTURHUFVfUkFTX0JMT0NLX19HRlgsDQo+IC0JCS50eXBlID0gQU1ER1BVX1JB
U19FUlJPUl9fTVVMVElfVU5DT1JSRUNUQUJMRSwNCj4gLQkJLnN1Yl9ibG9ja19pbmRleCA9IDAs
DQo+IC0JCS5uYW1lID0gImdmeCIsDQo+IC0JfTsNCj4gIAlpbnQgcjsNCj4gDQo+IC0JaWYgKCFh
bWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBBTURHUFVfUkFTX0JMT0NLX19HRlgpKSB7DQo+
IC0JCWFtZGdwdV9yYXNfZmVhdHVyZV9lbmFibGVfb25fYm9vdChhZGV2LCAmcmFzX2Jsb2NrLCAw
KTsNCj4gLQkJcmV0dXJuIDA7DQo+ICsJaWYgKCFhZGV2LT5nZngucmFzX2lmKSB7DQo+ICsJCWFk
ZXYtPmdmeC5yYXNfaWYgPSBrbWFsbG9jKHNpemVvZihzdHJ1Y3QgcmFzX2NvbW1vbl9pZiksDQo+
IEdGUF9LRVJORUwpOw0KPiArCQlpZiAoIWFkZXYtPmdmeC5yYXNfaWYpDQo+ICsJCQlyZXR1cm4g
LUVOT01FTTsNCj4gKwkJYWRldi0+Z2Z4LnJhc19pZi0+YmxvY2sgPSBBTURHUFVfUkFTX0JMT0NL
X19HRlg7DQo+ICsJCWFkZXYtPmdmeC5yYXNfaWYtPnR5cGUgPQ0KPiBBTURHUFVfUkFTX0VSUk9S
X19NVUxUSV9VTkNPUlJFQ1RBQkxFOw0KPiArCQlhZGV2LT5nZngucmFzX2lmLT5zdWJfYmxvY2tf
aW5kZXggPSAwOw0KPiArCQlzdHJjcHkoYWRldi0+Z2Z4LnJhc19pZi0+bmFtZSwgImdmeCIpOw0K
PiAgCX0NCj4gKwlmc19pbmZvLmhlYWQgPSBpaF9pbmZvLmhlYWQgPSAqYWRldi0+Z2Z4LnJhc19p
ZjsNCj4gDQo+ICAJciA9IGdmeF92OV8wX2RvX2VkY19nZHNfd29ya2Fyb3VuZHMoYWRldik7DQo+
ICAJaWYgKHIpDQo+IEBAIC00NDE5LDcxICs0NDE4LDIwIEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBf
ZWNjX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpDQo+ICAJaWYgKHIpDQo+ICAJCXJldHVybiByOw0K
PiANCj4gLQkvKiBoYW5kbGUgcmVzdW1lIHBhdGguICovDQo+IC0JaWYgKCpyYXNfaWYpIHsNCj4g
LQkJLyogcmVzZW5kIHJhcyBUQSBlbmFibGUgY21kIGR1cmluZyByZXN1bWUuDQo+IC0JCSAqIHBy
ZXBhcmUgdG8gaGFuZGxlIGZhaWx1cmUuDQo+IC0JCSAqLw0KPiAtCQlpaF9pbmZvLmhlYWQgPSAq
KnJhc19pZjsNCj4gLQkJciA9IGFtZGdwdV9yYXNfZmVhdHVyZV9lbmFibGVfb25fYm9vdChhZGV2
LCAqcmFzX2lmLCAxKTsNCj4gLQkJaWYgKHIpIHsNCj4gLQkJCWlmIChyID09IC1FQUdBSU4pIHsN
Cj4gLQkJCQkvKiByZXF1ZXN0IGEgZ3B1IHJlc2V0LiB3aWxsIHJ1biBhZ2Fpbi4gKi8NCj4gLQkJ
CQlhbWRncHVfcmFzX3JlcXVlc3RfcmVzZXRfb25fYm9vdChhZGV2LA0KPiAtCQkJCQkJQU1ER1BV
X1JBU19CTE9DS19fR0ZYKTsNCj4gLQkJCQlyZXR1cm4gMDsNCj4gLQkJCX0NCj4gLQkJCS8qIGZh
aWwgdG8gZW5hYmxlIHJhcywgY2xlYW51cCBhbGwuICovDQo+IC0JCQlnb3RvIGlycTsNCj4gLQkJ
fQ0KPiAtCQkvKiBlbmFibGUgc3VjY2Vzc2Z1bGx5LiBjb250aW51ZS4gKi8NCj4gLQkJZ290byBy
ZXN1bWU7DQo+IC0JfQ0KPiAtDQo+IC0JKnJhc19pZiA9IGttYWxsb2Moc2l6ZW9mKCoqcmFzX2lm
KSwgR0ZQX0tFUk5FTCk7DQo+IC0JaWYgKCEqcmFzX2lmKQ0KPiAtCQlyZXR1cm4gLUVOT01FTTsN
Cj4gLQ0KPiAtCSoqcmFzX2lmID0gcmFzX2Jsb2NrOw0KPiAtDQo+IC0JciA9IGFtZGdwdV9yYXNf
ZmVhdHVyZV9lbmFibGVfb25fYm9vdChhZGV2LCAqcmFzX2lmLCAxKTsNCj4gLQlpZiAocikgew0K
PiAtCQlpZiAociA9PSAtRUFHQUlOKSB7DQo+IC0JCQlhbWRncHVfcmFzX3JlcXVlc3RfcmVzZXRf
b25fYm9vdChhZGV2LA0KPiAtCQkJCQlBTURHUFVfUkFTX0JMT0NLX19HRlgpOw0KPiAtCQkJciA9
IDA7DQo+IC0JCX0NCj4gLQkJZ290byBmZWF0dXJlOw0KPiAtCX0NCj4gLQ0KPiAtCWloX2luZm8u
aGVhZCA9ICoqcmFzX2lmOw0KPiAtCWZzX2luZm8uaGVhZCA9ICoqcmFzX2lmOw0KPiAtDQo+IC0J
ciA9IGFtZGdwdV9yYXNfaW50ZXJydXB0X2FkZF9oYW5kbGVyKGFkZXYsICZpaF9pbmZvKTsNCj4g
KwlyID0gYW1kZ3B1X3Jhc19sYXRlX2luaXQoYWRldiwgYWRldi0+Z2Z4LnJhc19pZiwNCj4gKwkJ
CQkgJmZzX2luZm8sICZpaF9pbmZvKTsNCj4gIAlpZiAocikNCj4gLQkJZ290byBpbnRlcnJ1cHQ7
DQo+ICsJCWdvdG8gZnJlZTsNCj4gDQo+IC0JYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2NyZWF0ZShhZGV2
LCAmZnNfaW5mbyk7DQo+IC0NCj4gLQlyID0gYW1kZ3B1X3Jhc19zeXNmc19jcmVhdGUoYWRldiwg
JmZzX2luZm8pOw0KPiAtCWlmIChyKQ0KPiAtCQlnb3RvIHN5c2ZzOw0KPiAtcmVzdW1lOg0KPiAt
CXIgPSBhbWRncHVfaXJxX2dldChhZGV2LCAmYWRldi0+Z2Z4LmNwX2VjY19lcnJvcl9pcnEsIDAp
Ow0KPiAtCWlmIChyKQ0KPiAtCQlnb3RvIGlycTsNCltUYW9dIElzIGl0IG5lY2Vzc2FyeSB0byBh
ZGQgYSBhbWRncHVfcmFzX2xhdGVfZmluaSB0byBmcmVlIGFsbCB0aGUgcmVzb3VyY2VzIGFsbG9j
YXRlZCBieSByYXNfbGF0ZV9pbml0IGluIGZhaWxlZCBwYXRoPw0KDQo+ICsJaWYgKGFtZGdwdV9y
YXNfaXNfc3VwcG9ydGVkKGFkZXYsIGFkZXYtPmdmeC5yYXNfaWYtPmJsb2NrKSkgew0KPiArCQly
ID0gYW1kZ3B1X2lycV9nZXQoYWRldiwgJmFkZXYtPmdmeC5jcF9lY2NfZXJyb3JfaXJxLCAwKTsN
Cj4gKwkJaWYgKHIpDQo+ICsJCQlnb3RvIGZyZWU7DQo+ICsJfQ0KPiANCj4gIAlyZXR1cm4gMDsN
Cj4gLWlycToNCj4gLQlhbWRncHVfcmFzX3N5c2ZzX3JlbW92ZShhZGV2LCAqcmFzX2lmKTsNCj4g
LXN5c2ZzOg0KPiAtCWFtZGdwdV9yYXNfZGVidWdmc19yZW1vdmUoYWRldiwgKnJhc19pZik7DQo+
IC0JYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfcmVtb3ZlX2hhbmRsZXIoYWRldiwgJmloX2luZm8pOw0K
PiAtaW50ZXJydXB0Og0KPiAtCWFtZGdwdV9yYXNfZmVhdHVyZV9lbmFibGUoYWRldiwgKnJhc19p
ZiwgMCk7DQo+IC1mZWF0dXJlOg0KPiAtCWtmcmVlKCpyYXNfaWYpOw0KPiAtCSpyYXNfaWYgPSBO
VUxMOw0KPiArZnJlZToNCj4gKwlrZnJlZShhZGV2LT5nZngucmFzX2lmKTsNCj4gIAlyZXR1cm4g
cjsNCj4gIH0NCj4gDQo+IC0tDQo+IDIuNy40DQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
