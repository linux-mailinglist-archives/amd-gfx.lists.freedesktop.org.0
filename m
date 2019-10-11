Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A86D47D6
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 20:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6756EC87;
	Fri, 11 Oct 2019 18:48:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E396EC87
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 18:48:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVsxVSU8Vw82L9jckchsRpp713xcDlONKeblV8Y3fAW47ElJHmVvNbnDUiBxCA1OM/XRrqOARn1g/Og+dwmm8RXPHScluHuTg0xQoGq2PwR2kSEb4wAWjhgPWJuptEcEpENWqNAvqMv5ppy7GySYGwIBOhGN+O5ie7kuXhBbRRXs08VCNlIiu7+rxHcA9ewVxOshDiPyv9CIca2AruPPVkJUmPRZwLfDPPImW9NsxJfBHFD1OzIzTSk22VlevIptCwuHhUgyX6Q5kRccZ4/Kthru2zuEqhwElgidMGcMrUAO2A1IrFBzrMdv/fEsQQDts0RrLAmxY6oleGV6MZiM8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8pmcHhggLsNif1ddpJjdZTljgZop8KA4FXl9Hq8NRI=;
 b=fvIpAYo6lbUHJXhwiB9AVrs9X5Z9LDjbOH4VogSvlsR7BtkCNbvoKvsbEINoWtvM/ULfXqTn7Or+arQpTEoD019hSqfQd3eOctmrbGsfoVaQTUn0tGerLHe0DMk0l2gsS9rsc2JjATpbHxI88GPPO7W2ExR/tKSBwKmg1/WdY3Qr8wkjXoF/QbqwZ8d94cXRggZFbV3yyRSp1OtXbk3uY0BqH2B2UP8+I8iYoCCzOfj31u/rYb1qg1lN7DrNamHwXkl2FeCXyuxdVkvKF+pAdt6BlcWAGMaopUEkV3pdlyoHnE2dXYZQ/8QOeAvIS+4yLThNU+yaeT8msV+4P82dQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1374.namprd12.prod.outlook.com (10.169.206.9) by
 MWHSPR00MB09.namprd12.prod.outlook.com (10.175.142.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 18:47:59 +0000
Received: from MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::b99b:3d36:80fa:1192]) by MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::b99b:3d36:80fa:1192%7]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 18:47:59 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "thejoe@gmail.com" <thejoe@gmail.com>
Subject: Re: [PATCH v3] drm/amdgpu: user pages array memory leak fix
Thread-Topic: [PATCH v3] drm/amdgpu: user pages array memory leak fix
Thread-Index: AQHVgEFTkdALhneXtEiXdTXz5Xf4Y6dVs4IAgAAUxoA=
Date: Fri, 11 Oct 2019 18:47:59 +0000
Message-ID: <81ef18d9-ae50-6b06-d5b3-5f90a6d35487@amd.com>
References: <20191011143620.8785-1-Philip.Yang@amd.com>
 <9abf4c92-a30c-ae3d-5544-6428c3aec2ce@amd.com>
In-Reply-To: <9abf4c92-a30c-ae3d-5544-6428c3aec2ce@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::43)
 To MWHPR12MB1374.namprd12.prod.outlook.com
 (2603:10b6:300:12::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6009de43-cebf-4419-7b3a-08d74e7b89a8
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MWHSPR00MB09:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHSPR00MB09A19A3B936BF331B834D5E6970@MWHSPR00MB09.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(199004)(189003)(71200400001)(71190400001)(2906002)(305945005)(102836004)(53546011)(186003)(26005)(7736002)(6116002)(3846002)(86362001)(14454004)(4001150100001)(81156014)(2501003)(8676002)(81166006)(25786009)(110136005)(6506007)(8936002)(486006)(316002)(446003)(256004)(14444005)(2616005)(476003)(11346002)(31696002)(31686004)(478600001)(36756003)(6306002)(6486002)(6512007)(966005)(99286004)(6246003)(229853002)(66574012)(66446008)(64756008)(66476007)(66556008)(66946007)(5660300002)(66066001)(52116002)(6436002)(386003)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHSPR00MB09;
 H:MWHPR12MB1374.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Itydq5ODVDmbScNqxCBy7+q8yxFQt1BdRHt+H1WZQQBqBVq+bExgxoRHjei4tUEIBXp4wOhAGbAEjrl3HuKDA20diYmQpPPgq3A7kGxMcwosbeHIKnPw+gc/ds/PhvQQVF/KoWQinCId9vFva1Fn0O0DBb4UNowcgM0y2YndGzHPjtwC8xXZ7GnDA2SpX1xXuget/fT2/2FdHiXkLW/MhB3i2saFtssr1yoMNGWsQwDqg33ECUHFK0cqCoeMV+rCEhTPsdPOFpNwYNbHp8zP6oy1m8sPDqy52MPxBhqzvXCE0uXnmpK3k9vWTcg9JKAizm9lhCidJirnOyapzd6crQJroNZyyFPZdBu5Zf2wTBuXaQhZ0GoE1i0vXWYtpClN0iKyQ+h2fACHLVQj1jiO2qJ0vG1Q9pyJtvOMSVcvItpIQWfS6xr8fpH/N/+GZ1PNMkM/MX1lotfZ/KIJi2TaZA==
Content-ID: <F6E4D737F62CD1489ED51C8350EF26BD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6009de43-cebf-4419-7b3a-08d74e7b89a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 18:47:59.7696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BrpMdAdWGuBIOsm0JHGeK404eokvSTHGcpvY/2mprAArwSFBunwkxi+2q3UGCCiH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHSPR00MB09
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8pmcHhggLsNif1ddpJjdZTljgZop8KA4FXl9Hq8NRI=;
 b=AZT2AlWbITjbEOfrkO/qtOtIcNes5Bt/2OQY8Z7y9+N6myf0P5CpEKSLxSlYCXNhZOEd6k2nXcmbirTzTATAA/411RPF3ptqw1ZXcLGPC8MTM0cU0uKQylTNHznlkZTisr/U4BNxpeaeuhFrm6ZaW+V1Q0aZR79E7640cDMjZig=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMTAtMTEgMTozMyBwLm0uLCBLdWVobGluZywgRmVsaXggd3JvdGU6DQo+IE9u
IDIwMTktMTAtMTEgMTA6MzYgYS5tLiwgWWFuZywgUGhpbGlwIHdyb3RlOg0KPj4gdXNlcl9wYWdl
cyBhcnJheSBzaG91bGQgYWx3YXlzIGJlIGZyZWVkIGFmdGVyIHZhbGlkYXRpb24gcmVnYXJkbGVz
cyBpZg0KPj4gdXNlciBwYWdlcyBhcmUgY2hhbmdlZCBhZnRlciBibyBpcyBjcmVhdGVkIGJlY2F1
c2Ugd2l0aCBITU0gY2hhbmdlIHBhcnNlDQo+PiBibyBhbHdheXMgYWxsb2NhdGUgdXNlciBwYWdl
cyBhcnJheSB0byBnZXQgdXNlciBwYWdlcyBmb3IgdXNlcnB0ciBiby4NCj4+DQo+PiB2MjogcmVt
b3ZlIHVudXNlZCBsb2NhbCB2YXJpYWJsZSBhbmQgYW1lbmQgY29tbWl0DQo+Pg0KPj4gdjM6IGFk
ZCBiYWNrIGdldCB1c2VyIHBhZ2VzIGluIGdlbV91c2VycHRyX2lvY3RsLCB0byBkZXRlY3QgYXBw
bGljYXRpb24NCj4+IGJ1ZyB3aGVyZSBhbiB1c2VycHRyIFZNQSBpcyBub3QgYW5hbnltb3VzIG1l
bW9yeSBhbmQgcmVqZWN0IGl0Lg0KPj4NCj4+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3MubGF1bmNo
cGFkLm5ldC91YnVudHUvK3NvdXJjZS9saW51eC8rYnVnLzE4NDQ5NjINCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4NCj4+IFRlc3RlZC1ieTog
Sm9lIEJhcm5ldHQgPHRoZWpvZUBnbWFpbC5jb20+DQo+PiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPj4gLS0tDQo+PiAgICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyB8IDQgKy0tLQ0KPj4gICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+PiBpbmRleCBjMThhMTUzYjNkMmEuLmU3YjM5ZGFh
MjJmNiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9j
cy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0KPj4g
QEAgLTQ3Niw3ICs0NzYsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19saXN0X3ZhbGlkYXRlKHN0
cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLA0KPj4gICAgDQo+PiAgICAJbGlzdF9mb3JfZWFjaF9l
bnRyeShsb2JqLCB2YWxpZGF0ZWQsIHR2LmhlYWQpIHsNCj4+ICAgIAkJc3RydWN0IGFtZGdwdV9i
byAqYm8gPSB0dG1fdG9fYW1kZ3B1X2JvKGxvYmotPnR2LmJvKTsNCj4+IC0JCWJvb2wgYmluZGlu
Z191c2VycHRyID0gZmFsc2U7DQo+PiAgICAJCXN0cnVjdCBtbV9zdHJ1Y3QgKnVzZXJtbTsNCj4+
ICAgIA0KPj4gICAgCQl1c2VybW0gPSBhbWRncHVfdHRtX3R0X2dldF91c2VybW0oYm8tPnRiby50
dG0pOw0KPj4gQEAgLTQ5MywxNCArNDkyLDEzIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX2xpc3Rf
dmFsaWRhdGUoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsDQo+PiAgICANCj4+ICAgIAkJCWFt
ZGdwdV90dG1fdHRfc2V0X3VzZXJfcGFnZXMoYm8tPnRiby50dG0sDQo+PiAgICAJCQkJCQkgICAg
IGxvYmotPnVzZXJfcGFnZXMpOw0KPj4gLQkJCWJpbmRpbmdfdXNlcnB0ciA9IHRydWU7DQo+PiAg
ICAJCX0NCj4+ICAgIA0KPj4gICAgCQlyID0gYW1kZ3B1X2NzX3ZhbGlkYXRlKHAsIGJvKTsNCj4+
ICAgIAkJaWYgKHIpDQo+PiAgICAJCQlyZXR1cm4gcjsNCj4+ICAgIA0KPj4gLQkJaWYgKGJpbmRp
bmdfdXNlcnB0cikgew0KPj4gKwkJaWYgKGxvYmotPnVzZXJfcGFnZXMpIHsNCj4gDQo+IFRoaXMg
aWYgaXMgbm90IG5lZWRlZC4ga3ZmcmVlIHNob3VsZCBiZSBhYmxlIHRvIGhhbmRsZSBOVUxMIHBv
aW50ZXJzLA0KPiBhbmQgdW5jb25kaXRpb25hbGx5IHNldHRpbmcgdGhlIHBvaW50ZXIgdG8gTlVM
TCBhZnRlcndhcmRzIGlzIG5vdCBhDQo+IHByb2JsZW0gZWl0aGVyLiBXaXRoIHRoYXQgZml4ZWQs
IHRoaXMgY29tbWl0IGlzDQo+IA0KPiBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4
Lkt1ZWhsaW5nQGFtZC5jb20+DQo+IA0KPiBIb3dldmVyLCBJIGRvbid0IHRoaW5rIHRoaXMgc2hv
dWxkIGJlIHRoZSBmaW5hbCBzb2x1dGlvbi4gTXkgY29uY2Vybg0KPiB3aXRoIHRoaXMgc29sdXRp
b24gaXMsIHRoYXQgeW91IGVuZCB1cCBmcmVlaW5nIGFuZCByZWdlbmVyYXRpbmcgdGhlDQo+IHVz
ZXJfcGFnZXMgYXJyYXlzIG1vcmUgZnJlcXVlbnRseSB0aGFuIG5lY2Vzc2FyeTogT24gZXZlcnkg
Y29tbWFuZA0KPiBzdWJtaXNzaW9uLCBldmVuIGlmIHRoZXJlIHdhcyBubyBNTVUgbm90aWZpZXIg
c2luY2UgdGhlIGxhc3QgY29tbWFuZA0KPiBzdWJtaXNzaW9uLiBJIHdhcyBob3Bpbmcgd2UgY291
bGQgZ2V0IGJhY2sgdG8gYSBzb2x1dGlvbiB3aGVyZSB3ZSBjYW4NCj4gbWFpbnRhaW4gdGhlIHNh
bWUgdXNlcl9wYWdlcyBhcnJheSBhY3Jvc3MgY29tbWFuZCBzdWJtaXNzaW9ucywgc2luY2UgTU1V
DQo+IG5vdGlmaWVycyBhcmUgcmFyZS4gVGhhdCBzaG91bGQgcmVkdWNlIG92ZXJoZWFkIGZyb20g
ZG9pbmcgYWxsIHRob3MgcGFnZQ0KPiB0YWJsZSB3YWxrcyBpbiBITU0gb24gZXZlcnkgY29tbWFu
ZCBzdWJtaXNzaW9ucyB3aGVuIHVzaW5nIHVzZXJwdHJzLg0KPiANClllcywgSSB3aWxsIGhhdmUg
YW5vdGhlciBwYXRjaCB0byBhZGRyZXNzIHRoaXMgdXNpbmcgaG1tX3JhbmdlX3ZhbGlkLCANCnRo
ZSBpZGVhIGlzIHRvIGFsbG93IGhtbSByYW5nZSB0cmFja2luZyBjcm9zcyBnZW1fdXNlcnB0cl9p
b2N0bCBhbmQgDQpjc19pb2N0bC4NCg0KVGhhbmtzLA0KUGhpbGlwDQoNCj4gUmVnYXJkcywNCj4g
ICDCoCBGZWxpeA0KPiANCj4gDQo+PiAgICAJCQlrdmZyZWUobG9iai0+dXNlcl9wYWdlcyk7DQo+
PiAgICAJCQlsb2JqLT51c2VyX3BhZ2VzID0gTlVMTDsNCj4+ICAgIAkJfQ0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
