Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C167AD116
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 00:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E0389700;
	Sun,  8 Sep 2019 22:52:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730045.outbound.protection.outlook.com [40.107.73.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52BF89700
 for <amd-gfx@lists.freedesktop.org>; Sun,  8 Sep 2019 22:52:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaGrlZflyM7rxlzqiVbvwGP8WMZ2y/l5f7AoHBlEqXz3DCLjSAa+cGQVnOSFJiBk830wOrxlKxHX7Ybw9YA2lM0uSRrO63SucsgfxRAeLRdTUCvhOi2jiP2cnS18eBWouuwQ76Xf3H5wgkBuQCFMUn/EMSM93XG2oxt4gH/Z/4ss4WTGeKp3dv9yRxnQJBpVI0ooXH6RIEHShJnb6XDVbDL5/uOPvjZZsVwfBBcIipo9jrfuTk9riITdjAAK1RQmrYC6u9wBF+IO80sSWFXLreMlj/bVEyYzSm6J64Teje51VT3vOnyUizqPSmBNfzeQR0Q4Ch7zfkOjQ+3C1QD4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3Unt720unnNrn6cx3DOgzI4InYNqbJemZSJ5K8hvMk=;
 b=nJ1LIylELkww5ducKW0al6S99ngLxm1zqQCzfjSvhHCScfE943NtpZAmE8pn8lHB3X22VzMIGkvrXrqTd0E14XaGjVcyhPZdlhDC1g318ZbgUSmpbSFft897KICEfBtkJebF2Pg1AwzSF2Snm+vnBlMqRmzIumcSqnvKJjCQQG9mliX0F5Qw9HEWJ6myQKfM7X1TQPRB7W/ezRWY9PZ7Vh+5ybIZQ80P1ISZKZ1WgoqB1Ea7Ht1dGFgBYrJ9qaJWIvC9tzXkm4a5ndsKTD8O3A5dmTbLiGlL1o01mf3aErDN2DjVdy72hjFEz6Qciqe+gx6n4iwU0aAsmEoivO9VIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1298.namprd12.prod.outlook.com (10.168.224.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Sun, 8 Sep 2019 22:52:33 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f0e0:63fb:5af:5e1f]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f0e0:63fb:5af:5e1f%8]) with mapi id 15.20.2241.018; Sun, 8 Sep 2019
 22:52:33 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Dave Airlie <airlied@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] radeon: add option so DVI always respect HPD over DDC
Thread-Topic: [PATCH] radeon: add option so DVI always respect HPD over DDC
Thread-Index: AQHVYTvRzN2k4RNHx06rXqN0xxk5TKcibMEA
Date: Sun, 8 Sep 2019 22:52:33 +0000
Message-ID: <BN6PR12MB1809BC6D87E3E4C564CB0CB8F7B40@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190902030915.20116-1-airlied@gmail.com>
In-Reply-To: <20190902030915.20116-1-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [50.77.73.169]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a08a9b66-6a03-41e1-98a7-08d734af3c77
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1298; 
x-ms-traffictypediagnostic: BN6PR12MB1298:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB129826B6E6880E3D915ABBC4F7B40@BN6PR12MB1298.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0154C61618
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(189003)(199004)(13464003)(6306002)(55016002)(76176011)(76116006)(9686003)(6246003)(486006)(11346002)(25786009)(8676002)(81156014)(81166006)(6116002)(66066001)(8936002)(2906002)(446003)(64756008)(66946007)(7736002)(476003)(53936002)(14444005)(256004)(66476007)(66556008)(305945005)(3846002)(102836004)(6506007)(53546011)(186003)(52536014)(74316002)(66446008)(71190400001)(5660300002)(26005)(71200400001)(2501003)(99286004)(86362001)(110136005)(14454004)(6436002)(229853002)(316002)(7696005)(478600001)(966005)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1298;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: D1rm2dVnaxn4sT7Up1CD2/WFlBdRyVEmQ+jPPOwpjGBOApYp7vdFsKnsecSKcWFScedMMBGGLhLRbVjsnFvGi0Td04gMJyWROi4KLKTfTRvTuoEAic5WExbIxvooW9CK6Z6LmlCJvjXSZcs7MBirCaYTeU66XU/7cw41vhqo8r/0zPL9WWYxgLyRje5+V537IcinPLofeVW49KaMsg/B4I6E1wLgr2DV2p6/uWydbIuhvkI2KnaAr+/636wxBJPGV+drm03vI/tEYbxOzXSGjKof4YoD0e91RqawJGU9OCTHaayQu24RNPMhrkZv6o/S584UO04PE3CghxeRZ/tjWR+3qjFSPxvT/u8AXr+yZ6mNxGPK7VwQOSKeBxmwH9lJ+SyjxBprlnGVTXySZVp+9glYUvejldo3IKAEIz9gTWY=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a08a9b66-6a03-41e1-98a7-08d734af3c77
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2019 22:52:33.2847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vjoLoTqMQCsvYeXtD+KioaUPcb8utPV9V/S/XLsfmEq0KjeqDsVdDxT+HgM8MQ0z6hwy5ZrqsviJknT6EWjGnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1298
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3Unt720unnNrn6cx3DOgzI4InYNqbJemZSJ5K8hvMk=;
 b=ZsQzHkJNsXV/cnw77BvDXWLGFEmcg5/Zdc/3Lv54dsFREuVR6A0qwmerlQbiER2L+U+mqqJGjkUnPe3H5v3hPMGuVWDunzxFp1u6VqXIZb1AbOSM3U6R3ZsSTk4QsaqoD9+o+pw+KiyuuAj1ff/87IQewhaQH6KXqOn9HPh/Qx8=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gRGF2ZSBBaXJsaWUN
Cj4gU2VudDogU3VuZGF5LCBTZXB0ZW1iZXIgMSwgMjAxOSAxMTowOSBQTQ0KPiBUbzogYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW1BBVENIXSByYWRlb246IGFkZCBv
cHRpb24gc28gRFZJIGFsd2F5cyByZXNwZWN0IEhQRCBvdmVyIEREQw0KPiANCj4gRnJvbTogRGF2
ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4NCj4gDQo+IFB1cmVsaW5rIEZYLUQxMjAgKERW
SSBvdmVyIGZpYnJlIGV4dGVuZGVkZXJzKSBkcml2ZSB0aGUgSFBEIGxpbmUgbG93IG9uIHRoZQ0K
PiBHUFUgc2lkZSB3aGVuIHRoZSBtb25pdG9yIHNpZGUgZGV2aWNlIGlzIHVucGx1Z2dlZCBvciBs
b3NlcyB0aGUgY29ubmVjdGlvbi4NCj4gSG93ZXZlciB0aGUgR1BVIHNpZGUgZGV2aWNlIHNlZW1z
IHRvIGNhY2hlIEVESUQgaW4gdGhpcyBjYXNlLiBQZXIgRFZJIHNwZWMNCj4gdGhlIEhQRCBsaW5l
IG11c3QgYmUgZHJpdmVuIGluIG9yZGVyIGZvciBFRElEIHRvIGJlIGRvbmUsIGJ1dCB3ZSd2ZSBt
ZXQNCj4gZW5vdWdoIGJyb2tlbiBkZXZpY2VzIChtYWlubHkNCj4gVkdBLT5EVkkgY29udmVydG9y
cykgdGhhdCBkbyB0aGUgd3JvbmcgdGhpbmcgd2l0aCBIUEQgdGhhdCB3ZSBpZ25vcmUNCj4gaXQg
aWYgYSBEREMgcHJvYmUgc3VjY2VlZHMuDQo+IA0KPiBUaGlzIHBhdGNoIGFkZHMgYW4gb3B0aW9u
IHRvIHRoZSByYWRlb24gZHJpdmVyIHRvIGFsd2F5cyByZXNwZWN0IEhQRCBvbiBEVkkNCj4gY29u
bmVjdG9ycyBzdWNoIHRoYXQgaWYgdGhlIEhQRCBsaW5lIGlzbid0IGRyaXZlbiB0aGVuIEVESUQg
aXNuJ3QgcHJvYmVkLg0KDQpQcm9iYWJseSBjbGVhbmVyIHRvIG1ha2UgdGhpcyBhIGNvbm5lY3Rv
ciBwcm9wZXJ0eSByYXRoZXIgdGhhbiBhIGdsb2JhbCBlbmFibGUsIGJ1dCBJJ20gbm90IHRvbyBw
cmVzc2VkIGVpdGhlciB3YXkuDQoNCkFsZXgNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBB
aXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbi5oICAgICAgICAgICAgfCAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX2Nvbm5lY3RvcnMuYyB8IDcgKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fZHJ2LmMgICAgICAgIHwgNCArKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbi5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaCBpbmRleCAzMjgwOGU1
MGJlMTIuLmQ1NzJlOGRlZDliOQ0KPiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb24uaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oDQo+
IEBAIC0xMTcsNiArMTE3LDcgQEAgZXh0ZXJuIGludCByYWRlb25fdXZkOyAgZXh0ZXJuIGludCBy
YWRlb25fdmNlOw0KPiBleHRlcm4gaW50IHJhZGVvbl9zaV9zdXBwb3J0OyAgZXh0ZXJuIGludCBy
YWRlb25fY2lrX3N1cHBvcnQ7DQo+ICtleHRlcm4gaW50IHJhZGVvbl9yZXNwZWN0X2hwZDsNCj4g
DQo+ICAvKg0KPiAgICogQ29weSBmcm9tIHJhZGVvbl9kcnYuaCBzbyB3ZSBkb24ndCBoYXZlIHRv
IGluY2x1ZGUgYm90aCBhbmQgaGF2ZQ0KPiBjb25mbGljdGluZyBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fY29ubmVjdG9ycy5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fY29ubmVjdG9ycy5jDQo+IGluZGV4IGM2MGQxYTQ0ZDIyYS4uZTliMzky
NGRmMDZlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25u
ZWN0b3JzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fY29ubmVjdG9y
cy5jDQo+IEBAIC0xMjY1LDYgKzEyNjUsMTMgQEAgcmFkZW9uX2R2aV9kZXRlY3Qoc3RydWN0IGRy
bV9jb25uZWN0b3INCj4gKmNvbm5lY3RvciwgYm9vbCBmb3JjZSkNCj4gIAkJZ290byBleGl0Ow0K
PiAgCX0NCj4gDQo+ICsJaWYgKHJhZGVvbl9yZXNwZWN0X2hwZCAmJiByYWRlb25fY29ubmVjdG9y
LT5ocGQuaHBkICE9DQo+IFJBREVPTl9IUERfTk9ORSkgew0KPiArCQlpZiAoIXJhZGVvbl9ocGRf
c2Vuc2UocmRldiwgcmFkZW9uX2Nvbm5lY3Rvci0+aHBkLmhwZCkpDQo+IHsNCj4gKwkJCXJldCA9
IGNvbm5lY3Rvcl9zdGF0dXNfZGlzY29ubmVjdGVkOw0KPiArCQkJZ290byBleGl0Ow0KPiArCQl9
DQo+ICsJfQ0KPiArDQo+ICAJaWYgKHJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMpIHsNCj4gIAkJ
ZHJldCA9IHJhZGVvbl9kZGNfcHJvYmUocmFkZW9uX2Nvbm5lY3RvciwgZmFsc2UpOw0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jDQo+IGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMNCj4gaW5kZXggYTZjYmUxMWY3OWM2Li41
NTZhZTM4MWVhODYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jDQo+IEBA
IC0yMDcsNiArMjA3LDcgQEAgaW50IHJhZGVvbl9hdXhjaCA9IC0xOyAgaW50IHJhZGVvbl9tc3Qg
PSAwOyAgaW50DQo+IHJhZGVvbl91dmQgPSAxOyAgaW50IHJhZGVvbl92Y2UgPSAxOw0KPiAraW50
IHJhZGVvbl9yZXNwZWN0X2hwZCA9IDA7DQo+IA0KPiAgTU9EVUxFX1BBUk1fREVTQyhub193Yiwg
IkRpc2FibGUgQUdQIHdyaXRlYmFjayBmb3Igc2NyYXRjaA0KPiByZWdpc3RlcnMiKTsgIG1vZHVs
ZV9wYXJhbV9uYW1lZChub193YiwgcmFkZW9uX25vX3diLCBpbnQsIDA0NDQpOyBAQA0KPiAtMzEy
LDYgKzMxMyw5IEBAIGludCByYWRlb25fY2lrX3N1cHBvcnQgPSAxOw0KPiBNT0RVTEVfUEFSTV9E
RVNDKGNpa19zdXBwb3J0LCAiQ0lLIHN1cHBvcnQgKDEgPSBlbmFibGVkIChkZWZhdWx0KSwgMCA9
DQo+IGRpc2FibGVkKSIpOyAgbW9kdWxlX3BhcmFtX25hbWVkKGNpa19zdXBwb3J0LCByYWRlb25f
Y2lrX3N1cHBvcnQsIGludCwNCj4gMDQ0NCk7DQo+IA0KPiArTU9EVUxFX1BBUk1fREVTQyhyZXNw
ZWN0X2hwZCwgIkZvciBEVkkgYWx3YXlzIGJlbGlldmUgSFBEIik7DQo+ICttb2R1bGVfcGFyYW1f
bmFtZWQocmVzcGVjdF9ocGQsIHJhZGVvbl9yZXNwZWN0X2hwZCwgaW50LCAwNjQ0KTsNCj4gKw0K
PiAgc3RhdGljIHN0cnVjdCBwY2lfZGV2aWNlX2lkIHBjaWlkbGlzdFtdID0gew0KPiAgCXJhZGVv
bl9QQ0lfSURTDQo+ICB9Ow0KPiAtLQ0KPiAyLjIwLjENCj4gDQo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
