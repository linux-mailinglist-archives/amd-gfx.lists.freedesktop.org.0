Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F814CD50
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 14:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0986E42F;
	Thu, 20 Jun 2019 12:00:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693726E42F
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 12:00:24 +0000 (UTC)
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB4029.namprd12.prod.outlook.com (10.255.239.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 20 Jun 2019 12:00:22 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::2025:cd1a:7ac0:edd9]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::2025:cd1a:7ac0:edd9%7]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 12:00:22 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: =?utf-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdgpu: fix transform feedback GDS hang on gfx10
Thread-Topic: [PATCH 1/2] drm/amdgpu: fix transform feedback GDS hang on gfx10
Thread-Index: AQHVJvtzT/Iqo8YIAkykUrVfd7fqUqakcXkA
Date: Thu, 20 Jun 2019 12:00:22 +0000
Message-ID: <0b67ef66-3b00-48c3-ba82-d68034c80346@amd.com>
References: <20190620000216.14272-1-maraeo@gmail.com>
In-Reply-To: <20190620000216.14272-1-maraeo@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0053.apcprd03.prod.outlook.com
 (2603:1096:203:52::17) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [101.86.234.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68cc2f78-49b1-42b9-7b9a-08d6f576df03
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4029; 
x-ms-traffictypediagnostic: MN2PR12MB4029:
x-microsoft-antispam-prvs: <MN2PR12MB40297AD598C7D259D12558C3B4E40@MN2PR12MB4029.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(396003)(346002)(376002)(136003)(43544003)(189003)(199004)(2501003)(110136005)(72206003)(5660300002)(66556008)(66946007)(68736007)(2906002)(305945005)(7736002)(71190400001)(6116002)(486006)(3846002)(66446008)(386003)(2616005)(478600001)(31696002)(11346002)(14454004)(66066001)(6506007)(76176011)(102836004)(256004)(6436002)(52116002)(99286004)(8936002)(229853002)(53936002)(26005)(446003)(71200400001)(186003)(476003)(81156014)(31686004)(6246003)(73956011)(66476007)(6486002)(25786009)(316002)(64756008)(81166006)(36756003)(8676002)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4029;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JznxQczVp+gH/4EppB1Yn3IjDPI0h2VcYGOrb/NMacds0L9PbbNGvst034W1d+VJAQ3vyrrjXaA80DqKfH55jvqOpeJnMAQDWt2ylZiUIRT4r1gZEoXYPw8mcqyEsdsWAWqYuc/S2mL5KVRFTbUIbDfwVa4v7Q9yVCwwEhpDnkw5JUwVFRvLsl4/K8OxAQFrMPP9imjOvt/4TVnC1eC9GL7hFl0EeW/BZLW1/H5k2CJT4r8d1yueONVN9kBW6P8MNMQTn6o+XxKDF49Ij55pRw0AvXw8rIYXLHXiaGfXxIvEmwp66AuMoD2FcVspwpxo4R35Dm/znZC72DsL3vsy6V3j+2BllBtTt4Q2jhBIUhQIZAqiM98Flj8xVthDNAqQ5/zoiwbeFzbspekKum+KPUvfs1P+WoGQoZUIWeO5VVM=
Content-ID: <FB25F4B962FEE44A8BC0DD9EDE9C75CE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68cc2f78-49b1-42b9-7b9a-08d6f576df03
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 12:00:22.2053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4029
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4IpRgNnjFzuqQmUhhIEvK5FPp0GMuTURvhIqMKO7cw=;
 b=h1yZa81zZktDyrkK3tqtRkE/s/Dzlsu6Gp59lt6UzBV8HYzfQPPDXSly99kPZPpkxCo4s1r4IyYRe8wRDfDBwVLoTOE4XyWKOWhutkOaocFoFWrTGmGtMtm4l3yYoayuSaRK+m1lU02Hiz077VG9nTQpE2kXXLqQIpdHYOVwXSY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

cGxlYXNlIHRha2UgY2FyZSBvZiAuZW1pdF9pYl9zaXplIG1lbWJlciwgb3RoZXJ3aXNlIGl0IGxv
b2tzIG9rIHRvIG1lLg0KDQotRGF2aWQNCg0K5ZyoIDIwMTkvNi8yMCA4OjAyLCBNYXJlayBPbMWh
w6FrIOWGmemBkzoNCj4gRnJvbTogTWFyZWsgT2zFocOhayA8bWFyZWsub2xzYWtAYW1kLmNvbT4N
Cj4NCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgT2zFocOhayA8bWFyZWsub2xzYWtAYW1kLmNvbT4N
Cj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dkcy5oIHwgIDMg
KystDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgIHwgMTIgKysr
KysrKysrKy0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dkcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dkcy5oDQo+IGlu
ZGV4IGRhZDIxODZmNGVkNS4uZGY4YTIzNTU0ODMxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2RzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dkcy5oDQo+IEBAIC0yNCwyMSArMjQsMjIgQEANCj4gICAjaWZuZGVm
IF9fQU1ER1BVX0dEU19IX18NCj4gICAjZGVmaW5lIF9fQU1ER1BVX0dEU19IX18NCj4gICANCj4g
ICBzdHJ1Y3QgYW1kZ3B1X3Jpbmc7DQo+ICAgc3RydWN0IGFtZGdwdV9ibzsNCj4gICANCj4gICBz
dHJ1Y3QgYW1kZ3B1X2dkcyB7DQo+ICAgCXVpbnQzMl90IGdkc19zaXplOw0KPiAgIAl1aW50MzJf
dCBnd3Nfc2l6ZTsNCj4gICAJdWludDMyX3Qgb2Ffc2l6ZTsNCj4gLQl1aW50MzJfdAkJCWdkc19j
b21wdXRlX21heF93YXZlX2lkOw0KPiArCXVpbnQzMl90IGdkc19jb21wdXRlX21heF93YXZlX2lk
Ow0KPiArCXVpbnQzMl90IHZndF9nc19tYXhfd2F2ZV9pZDsNCj4gICB9Ow0KPiAgIA0KPiAgIHN0
cnVjdCBhbWRncHVfZ2RzX3JlZ19vZmZzZXQgew0KPiAgIAl1aW50MzJfdAltZW1fYmFzZTsNCj4g
ICAJdWludDMyX3QJbWVtX3NpemU7DQo+ICAgCXVpbnQzMl90CWd3czsNCj4gICAJdWludDMyX3QJ
b2E7DQo+ICAgfTsNCj4gICANCj4gICAjZW5kaWYgLyogX19BTURHUFVfR0RTX0hfXyAqLw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYw0KPiBpbmRleCAwMDkwY2JhMmQyNGQu
Ljc1YTM0Nzc5YTU3YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3YxMF8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8w
LmMNCj4gQEAgLTQyMTMsMjAgKzQyMTMsMjkgQEAgc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3Jpbmdf
ZW1pdF9oZHBfZmx1c2goc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQ0KPiAgIH0NCj4gICANCj4g
ICBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfcmluZ19lbWl0X2liX2dmeChzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcsDQo+ICAgCQkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2pvYiAqam9iLA0KPiAgIAkJ
CQkgICAgICAgc3RydWN0IGFtZGdwdV9pYiAqaWIsDQo+ICAgCQkJCSAgICAgICB1aW50MzJfdCBm
bGFncykNCj4gICB7DQo+ICAgCXVuc2lnbmVkIHZtaWQgPSBBTURHUFVfSk9CX0dFVF9WTUlEKGpv
Yik7DQo+ICAgCXUzMiBoZWFkZXIsIGNvbnRyb2wgPSAwOw0KPiAgIA0KPiArCS8qIFByZXZlbnQg
YSBodyBkZWFkbG9jayBkdWUgdG8gYSB3YXZlIElEIG1pc21hdGNoIGJldHdlZW4gTUUgYW5kIEdE
Uy4NCj4gKwkgKiBUaGlzIHJlc2V0cyB0aGUgd2F2ZSBJRCBjb3VudGVycy4gKG5lZWRlZCBieSB0
cmFuc2Zvcm0gZmVlZGJhY2spDQo+ICsJICogVE9ETzogVGhpcyBtaWdodCBvbmx5IGJlIG5lZWRl
ZCBvbiBhIFZNSUQgc3dpdGNoIHdoZW4gd2UgY2hhbmdlDQo+ICsJICogICAgICAgdGhlIEdEUyBP
QSBtYXBwaW5nLCBub3Qgc3VyZS4NCj4gKwkgKi8NCj4gKwlhbWRncHVfcmluZ193cml0ZShyaW5n
LCBQQUNLRVQzKFBBQ0tFVDNfU0VUX0NPTkZJR19SRUcsIDEpKTsNCj4gKwlhbWRncHVfcmluZ193
cml0ZShyaW5nLCBtbVZHVF9HU19NQVhfV0FWRV9JRCk7DQo+ICsJYW1kZ3B1X3Jpbmdfd3JpdGUo
cmluZywgcmluZy0+YWRldi0+Z2RzLnZndF9nc19tYXhfd2F2ZV9pZCk7DQo+ICsNCj4gICAJaWYg
KGliLT5mbGFncyAmIEFNREdQVV9JQl9GTEFHX0NFKQ0KPiAgIAkJaGVhZGVyID0gUEFDS0VUMyhQ
QUNLRVQzX0lORElSRUNUX0JVRkZFUl9DTlNULCAyKTsNCj4gICAJZWxzZQ0KPiAgIAkJaGVhZGVy
ID0gUEFDS0VUMyhQQUNLRVQzX0lORElSRUNUX0JVRkZFUiwgMik7DQo+ICAgDQo+ICAgCWNvbnRy
b2wgfD0gaWItPmxlbmd0aF9kdyB8ICh2bWlkIDw8IDI0KTsNCj4gICANCj4gICAJaWYgKGFtZGdw
dV9tY2JwICYmIChpYi0+ZmxhZ3MgJiBBTURHUFVfSUJfRkxBR19QUkVFTVBUKSkgew0KPiAgIAkJ
Y29udHJvbCB8PSBJTkRJUkVDVF9CVUZGRVJfUFJFX0VOQigxKTsNCj4gICANCj4gQEAgLTUwOTQs
MjQgKzUxMDMsMjMgQEAgc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3NldF9ybGNfZnVuY3Moc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAgCWRlZmF1bHQ6DQo+ICAgCQlicmVhazsNCj4gICAJ
fQ0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfc2V0X2dkc19pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIHsNCj4gICAJLyogaW5pdCBhc2ljIGdkcyBp
bmZvICovDQo+ICAgCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7DQo+ICAgCWNhc2UgQ0hJUF9O
QVZJMTA6DQo+IC0JCWFkZXYtPmdkcy5nZHNfc2l6ZSA9IDB4MTAwMDA7DQo+IC0JCWJyZWFrOw0K
PiAgIAlkZWZhdWx0Og0KPiAgIAkJYWRldi0+Z2RzLmdkc19zaXplID0gMHgxMDAwMDsNCj4gKwkJ
YWRldi0+Z2RzLnZndF9nc19tYXhfd2F2ZV9pZCA9IDB4M2ZmOw0KPiAgIAkJYnJlYWs7DQo+ICAg
CX0NCj4gICANCj4gICAJYWRldi0+Z2RzLmd3c19zaXplID0gNjQ7DQo+ICAgCWFkZXYtPmdkcy5v
YV9zaXplID0gMTY7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9zZXRf
dXNlcl93Z3BfaW5hY3RpdmVfYml0bWFwX3Blcl9zaChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwNCj4gICAJCQkJCQkJICB1MzIgYml0bWFwKQ0KPiAgIHsNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
