Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF36C3F1
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 02:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4436E2BF;
	Thu, 18 Jul 2019 00:58:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800088.outbound.protection.outlook.com [40.107.80.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8D06E2BF
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 00:58:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyjL7qFE7Ki5/8Uenr3T7mTGzWsgtt8yFsfvaNGgqcwYQwG6xsXVUZ1g+0jYWOd0LCVTMXzua6N580ESX3p3q1z/5MtEeJcZnNo36TsErFhyB2YIsAX2kPyMrxKeRuS1PLe3sxt8fdoumwQhGUiTGVQynxvd4EiHxOoGJFkV9ZDb4BHCMgpnYJMX5JjlfOzyFEDojlA0hN6V8+sRAfLNLNy2YD+pas4eU7vE+urzJcDUb6DUBFpQBm/51wl4lne0VtJrvMpkhnpmzsGz5R3IB/6NPM5V4a3Mi0GOCltiG37YytnOS0p58JPqxDkue2oo950ndVew+SjYdmCIh6lRXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SarxYHGi3gmfq5fPLw+J5BGgdwfK7pbxWX5KbXQbjUI=;
 b=Nsvuo+bZ/q6FjpQe5zwORZtUR7VsgNP6UKgPLFKbpv8qW6VwgdBQ6QDfrpb0vLiymzGo0R23+O9B2E8URAXwvXBhDgHcQ433Ist0b3XE+Qgol/2C4qpZ1m7XWGMFbMs5few+sAJphQQt0qJOVLQmh88BY7ORycFcsXeIHj7DwJPSSrW1ZCwWxedQXriHH4DDx1vQMWa0p5iknjcS5GVz43xXenZiDY8GmEfVubTmUTs/cf543P/l/KdDWCLDo6XaNmg1bRkLWXwDgXUkG8JqnRE2lyWunZUqF49Nez4qtpKEpnOYDJvXd4fj7WwGxWLPAaKK+O8HiohM70VF/yC2hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3152.namprd12.prod.outlook.com (20.178.242.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 00:58:36 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2094.011; Thu, 18 Jul 2019
 00:58:36 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: add sclk/uclk sensor support for vega20
Thread-Topic: [PATCH 2/2] drm/amdgpu: add sclk/uclk sensor support for vega20
Thread-Index: AQHVPKz0i6B3+B6Q2EqyDrFpv8n8/abPjdfQ
Date: Thu, 18 Jul 2019 00:58:36 +0000
Message-ID: <MN2PR12MB3344577E7EAD4F9B9E267846E4C80@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190717143540.30090-1-alexander.deucher@amd.com>
 <20190717143540.30090-2-alexander.deucher@amd.com>
In-Reply-To: <20190717143540.30090-2-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89050b19-9d5d-4283-b3fc-08d70b1b1092
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3152; 
x-ms-traffictypediagnostic: MN2PR12MB3152:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB31523E06E59119EDC39087C3E4C80@MN2PR12MB3152.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(13464003)(189003)(199004)(76116006)(66066001)(66556008)(6506007)(66476007)(66446008)(64756008)(316002)(74316002)(110136005)(305945005)(53546011)(33656002)(68736007)(53936002)(102836004)(7736002)(55016002)(2906002)(2501003)(25786009)(99286004)(6246003)(6306002)(66946007)(486006)(6436002)(7696005)(81166006)(5660300002)(86362001)(966005)(9686003)(8676002)(14454004)(71190400001)(81156014)(71200400001)(186003)(3846002)(229853002)(446003)(11346002)(4326008)(14444005)(8936002)(476003)(478600001)(76176011)(52536014)(6116002)(26005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3152;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DTvadnVHRJkZxkdr5NHF6v4S7ItUr5BNd7XhMRKWf0VNI3UEMn7Or6nOvxm5PtlhR0FeBhTeIAdyjHUxdZlRuJPZIXTSU2e86Kc+wwARetmYJxe9smHrzfiilt2Q04sa3wsRxdGJLYwUg/XecyGjhvnOFr0rYzdF95mHmEMUa321JWsTpUEim0qt14/g6dPUzJdCFO4hiYXpWE8YB76ivF0X4aaey+n3GuIRzMBYlP70ZTq3izfiTL0ET7bFwZlPmk6ld/gvatdUXE+biUcqh7cbJaRAYAI2NymB7wQ3qDCSwnqyRowthz/xu2CwaUPMovLAD7hWGAxKn+TZVBijhFwBasa5AUSdWGBO/kaAWJ6kf+0cGUxMY1Feod5FUBGmcHpE9e1LaKpSVxG6zpQpX9oSThPBah/rNhD5OP1Qdqw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89050b19-9d5d-4283-b3fc-08d70b1b1092
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 00:58:36.5117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SarxYHGi3gmfq5fPLw+J5BGgdwfK7pbxWX5KbXQbjUI=;
 b=MzVGZFCD8gpmq6m8o1nSaXlvgK8A0PsPbm1vZyZ1uw4zoUarn6vVB/TMpUJ/SaJzwe+IzCPQdoytJ1KPNVx7p3crP+B3TBdN/4bt3Vwz/sd4LtSuQ1f+vApnLFMrEGpJt5e3/UmYEmd0ah3Thjtihuxhi8kf4JAtTEWtFt4h9ZQ=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSB0aGluayB0aGUgQU1ER1BVX1BQX1NFTlNPUl9HRlhfU0NMSyBhbmQgQU1ER1BVX1BQX1NFTlNP
Ul9HRlhfTUNMSyByZXF1ZXN0cyBhcmUgaGFuZGxlZCBpbiBzbXVfdjExXzBfcmVhZF9zZW5zb3Iu
DQpJdCBtZWFucyBpdCBjYW5ub3QgcmVhY2ggbmF2aTEwX3BwdC5jIGFuZCB2ZWdhMjBfcHB0LmMu
DQpNYXliZSB0aGlzIHNob3VsZCBiZSBmaXhlZCBpbiBzbXVfdjExXzBfcmVhZF9zZW5zb3IuDQoN
ClJlZ2FyZHMsDQpFdmFuDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFt
ZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBP
ZiBBbGV4DQo+IERldWNoZXINCj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDE3LCAyMDE5IDEwOjM2
IFBNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwg
QWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0gg
Mi8yXSBkcm0vYW1kZ3B1OiBhZGQgc2Nsay91Y2xrIHNlbnNvciBzdXBwb3J0IGZvciB2ZWdhMjAN
Cj4gDQo+IFF1ZXJ5IHRoZSBtZXRyaWNzIHRhYmxlIHRvIGdldCB0aGUgYXZlcmFnZSBzY2xrIGFu
ZCB1Y2xrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Zl
Z2EyMF9wcHQuYyB8IDM1DQo+ICsrKysrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzNSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvdmVnYTIwX3BwdC5jDQo+IGluZGV4IDkyMDRlNGU1MGQwOS4uNzYzZDczYWY2Y2QxIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jDQo+IEBA
IC0zMTE3LDYgKzMxMTcsMzYgQEAgc3RhdGljIGludCB2ZWdhMjBfdGhlcm1hbF9nZXRfdGVtcGVy
YXR1cmUoc3RydWN0DQo+IHNtdV9jb250ZXh0ICpzbXUsDQo+IA0KPiAgCXJldHVybiAwOw0KPiAg
fQ0KPiArDQo+ICtzdGF0aWMgaW50IHZlZ2EyMF9nZXRfYXZnX2Nsb2NrcyhzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSwNCj4gKwkJCQkgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3IsDQo+ICsJCQkJ
IHVpbnQzMl90ICp2YWx1ZSkNCj4gK3sNCj4gKwlTbXVNZXRyaWNzX3QgbWV0cmljczsNCj4gKwlp
bnQgcmV0ID0gMDsNCj4gKw0KPiArCWlmICghdmFsdWUpDQo+ICsJCXJldHVybiAtRUlOVkFMOw0K
PiArDQo+ICsJcmV0ID0gc211X3VwZGF0ZV90YWJsZShzbXUsIFNNVV9UQUJMRV9TTVVfTUVUUklD
UywgKHZvaWQNCj4gKikmbWV0cmljcywgZmFsc2UpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVy
biByZXQ7DQo+ICsNCj4gKwlzd2l0Y2ggKHNlbnNvcikgew0KPiArCWNhc2UgQU1ER1BVX1BQX1NF
TlNPUl9HRlhfU0NMSzoNCj4gKwkJKnZhbHVlID0gbWV0cmljcy5BdmVyYWdlR2Z4Y2xrRnJlcXVl
bmN5ICogMTAwOw0KPiArCQlicmVhazsNCj4gKwljYXNlIEFNREdQVV9QUF9TRU5TT1JfR0ZYX01D
TEs6DQo+ICsJCSp2YWx1ZSA9IG1ldHJpY3MuQXZlcmFnZVVjbGtGcmVxdWVuY3kgKiAxMDA7DQo+
ICsJCWJyZWFrOw0KPiArCWRlZmF1bHQ6DQo+ICsJCXByX2VycigiSW52YWxpZCBzZW5zb3IgZm9y
IHJldHJpZXZpbmcgYXZnIGNsb2NrXG4iKTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0K
PiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyBpbnQgdmVnYTIwX3JlYWRf
c2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LA0KPiAgCQkJCSBlbnVtIGFtZF9wcF9zZW5z
b3JzIHNlbnNvciwNCj4gIAkJCQkgdm9pZCAqZGF0YSwgdWludDMyX3QgKnNpemUpDQo+IEBAIC0z
MTQ3LDYgKzMxNzcsMTEgQEAgc3RhdGljIGludCB2ZWdhMjBfcmVhZF9zZW5zb3Ioc3RydWN0IHNt
dV9jb250ZXh0DQo+ICpzbXUsDQo+ICAJCXJldCA9IHZlZ2EyMF90aGVybWFsX2dldF90ZW1wZXJh
dHVyZShzbXUsIHNlbnNvciwNCj4gKHVpbnQzMl90ICopZGF0YSk7DQo+ICAJCSpzaXplID0gNDsN
Cj4gIAkJYnJlYWs7DQo+ICsJY2FzZSBBTURHUFVfUFBfU0VOU09SX0dGWF9TQ0xLOg0KPiArCWNh
c2UgQU1ER1BVX1BQX1NFTlNPUl9HRlhfTUNMSzoNCj4gKwkJcmV0ID0gdmVnYTIwX2dldF9hdmdf
Y2xvY2tzKHNtdSwgc2Vuc29yLCAodWludDMyX3QgKilkYXRhKTsNCj4gKwkJKnNpemUgPSA0Ow0K
PiArCQlicmVhazsNCj4gIAlkZWZhdWx0Og0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gIAl9DQo+
IC0tDQo+IDIuMjAuMQ0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
