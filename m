Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E14279827B
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 20:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429466E357;
	Wed, 21 Aug 2019 18:14:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680088.outbound.protection.outlook.com [40.107.68.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322366E357;
 Wed, 21 Aug 2019 18:14:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iASfyvzX7Dyk6v2NBfEHebrEiK4J8TIukIWmxkWBq5u/NzxYCxdG7d+X3dfmnQwmzot7qE2hm4RLH9c77elsbEqEkSJKhzW0m3gpkLfpkCgT02scewfpDtbj8C0f40zZ7IYEL+Wz/s20M9r5iGacTgtAUVFN9jnHYNQ14kI3k2Jo7wCQArWxuLYmWcv/PDC0tv21fwM6cz8BLAGqaismHcyg5AalHs5fLbHTOQ8scH+/6yQAUSA3t281Xi3g5Jw6tvPHwG5YPpxuSuNlAMVL7vEEgPKQ66IN+xngH0K6cpRFROUyCjJ7QKFNXOaGrKC15Qd5+VDbJswQwr7vNuFUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRpLVp+h785yH6XrJ7V8OujbvRp3URO4J3oTdvUG7fw=;
 b=dIx4Qy0AQIxM+iaBVEsZfew83MyGL5AOg+hdNiYw57LDjVRtMdEItxTY9CXnwRTw/SisT9tEOeRlEcN3e1yMNUBVYtNyn1oIkMTkJEXqpgCfiCQIaOz6f+TLcIoW2lRS6oyw2u/0pRYngNm9x3BJ0kE7PmWDvpnvwjsEVQIEzz4fAvoyrGmfShsLgH9e3uh7tY+0Exr6kDjQ547S8CkjNx5z8K/J5l/hi+LIloMrE/IH7TGwJsUrow7RsWUU2rLkom4Pfp5xtHSlT+5IMieNboTEpjtHFxML4BStvG6yGyLG72Qyz9wfLa6aOtnXnbUgMfYsnVV981X/NcosyEg+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3000.namprd12.prod.outlook.com (20.178.53.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Wed, 21 Aug 2019 18:14:41 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82%5]) with mapi id 15.20.2178.018; Wed, 21 Aug 2019
 18:14:41 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Francis, David" <David.Francis@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 11/14] drm/amd/display: Validate DSC caps on MST
 endpoints
Thread-Topic: [PATCH v2 11/14] drm/amd/display: Validate DSC caps on MST
 endpoints
Thread-Index: AQHVV4tDn/aNlvYBLECdmvysWXwzeacF6X6A
Date: Wed, 21 Aug 2019 18:14:40 +0000
Message-ID: <c34b863a-8f36-7ee3-ed54-99989958d9bc@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
 <20190820191203.25807-12-David.Francis@amd.com>
In-Reply-To: <20190820191203.25807-12-David.Francis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::37)
 To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a32bb0c-2c20-47af-46d0-08d726636ea3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3000; 
x-ms-traffictypediagnostic: BYAPR12MB3000:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB30005718D95EF98CD8704E8CECAA0@BYAPR12MB3000.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(189003)(199004)(25584004)(2616005)(86362001)(2201001)(76176011)(6246003)(25786009)(5660300002)(450100002)(6436002)(66946007)(110136005)(53546011)(478600001)(14454004)(386003)(6506007)(8676002)(7736002)(66066001)(256004)(52116002)(8936002)(81156014)(71200400001)(15650500001)(71190400001)(102836004)(4326008)(6512007)(11346002)(486006)(64756008)(66476007)(54906003)(476003)(26005)(14444005)(305945005)(186003)(5024004)(316002)(66446008)(6116002)(99286004)(3846002)(2501003)(31686004)(446003)(53936002)(31696002)(36756003)(81166006)(229853002)(2906002)(66556008)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3000;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uGSZyV+uzLSeg7lx/OBg4296HsG7RujaRUhiQcaFTgVXdfiR4gPO0qsAF+DdW+zjttr/icjVN+IzPl2EDSFuoaVyB4Taxgi/NBvzm9uZamjODoqqPiXjHFs6sZxbt9xMbmhnXqAWw6uqc6hymiivMcA5rwrDhM1wZR7zxEMas40jKuZnV+eL4MO5SW42lqOdFCMm6g6nUub4w4vUFQ4K5BZhv/h0Zj5LyYQrlbJF3IukopR0u4wCnI/uXaEV1u/p18KIeW2i0jaL0Dp5OZU2kn8j1kq5vDoV0H4xqAhcDZAFMQ5a162SMXa3bDzMeTYQX3jdHC73P5wHqUuPQzTzequvFgv3ky0SgCkByZUXg1hpcFb83uauxbi5WwsmLP17ifY/QNHbTLK466Z2mmWGBABsBarB1nPHLAisdambwCU=
Content-ID: <850FF1159BB6C34C81EEBEFB68068DD1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a32bb0c-2c20-47af-46d0-08d726636ea3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 18:14:40.8589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jz5duaBxnRD4ZfUddjvdQOK6Y8AL6eTM6VmkyyNkU6JnmhEPXGKtlSLf3gEM0uzQmM+TCNi2bSG4KUGDA3CpYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRpLVp+h785yH6XrJ7V8OujbvRp3URO4J3oTdvUG7fw=;
 b=sbhIrgMu1HAQ49yQOJHZF0OzbN98zujZ+cidiEBqvKpgzF9wOK3PhHx3id9mdCSfkUYdFqUug1pHCPDxKMbNz+ZszHAmL5P6U3I04ZYRRTzNNhK7ZN/dvRUUCQTgqe6WBNg6YiEkn23qLRW95w2LEGimynpDjBsQxN+no4W6FfQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Liu, Wenjing" <Wenjing.Liu@amd.com>, "Cornij,
 Nikola" <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gOC8yMC8xOSAzOjEyIFBNLCBEYXZpZCBGcmFuY2lzIHdyb3RlOg0KPiBUaGUgZmlyc3Qgc3Rl
cCBpbiBNU1QgRFNDIGlzIGNoZWNraW5nIE1TVCBlbmRwb2ludHMNCj4gdG8gc2VlIGhvdyBEU0Mg
Y2FuIGJlIGVuYWJsZWQNCj4gDQo+IENhc2UgMTogRFAtdG8tRFAgcGVlciBkZXZpY2UNCj4gaWYg
dGhlIGJyYW5jaCBpbW1lZGlhdGVseSB1cHN0cmVhbSBoYXMNCj4gICAtIFBEVCA9IERQX1BFRVJf
REVWSUNFX0RQX01TVF9CUkFOQ0hJTkcgKDIpDQo+ICAgLSBEUENEIHJldi4gPj0gRFAgMS40DQo+
ICAgLSBFeGFjdGx5IG9uZSBpbnB1dCBhbmQgb25lIG91dHB1dA0KPiAgIC0gVGhlIG91dHB1dCBo
YXMgUERUID0gRFBfUEVFUl9ERVZJQ0VfU1NUX1NJTksgKDMpDQo+IA0KPiBJbiB0aGlzIGNhc2Us
IERTQyBjb3VsZCBiZSBwb3NzaWJsZSBlaXRoZXIgb24gdGhlIGVuZHBvaW50DQo+IG9yIHRoZSBw
ZWVyIGRldmljZS4gUHJlZmVyIHRoZSBlbmRwb2ludCwgd2hpY2ggaXMgcG9zc2libGUgaWYNCj4g
ICAtIFRoZSBlbmRwb2ludCBoYXMgRFBfRFNDX0RFQ09NUFJFU1NJT05fSVNfU1VQUE9SVEVEIGJp
dCBzZXQNCj4gICAtIFRoZSBlbmRwb2ludCBoYXMgRFBfRkVDX0NBUEFCTEUgYml0IHNldA0KPiAg
IC0gVGhlIHBlZXIgZGV2aWNlIGhhcyBEU0NfUEFTU1RIUk9VR0hfQ0FQQUJJTElUWSBiaXQgc2V0
IChmcm9tIERQIHYyLjApDQo+IA0KPiBPdGhlcndpc2UsIHVzZSB0aGUgcGVlciBkZXZpY2UNCj4g
DQo+IENhc2UgMjogRFAtdG8tSERNSSBwZWVyIGRldmljZQ0KPiBJZiB0aGUgb3V0cHV0IHBvcnQg
aGFzDQo+ICAgLSBQRFQgPSBEUF9QRUVSX0RFVklDRV9EUF9MRUdBQ1lfQ09OViAoNCkNCj4gICAt
IERQQ0QgcmV2LiA+PSBEUCAxLjQNCj4gICAtIExEUFMgPSB0cnVlDQo+ICAgLSBNQ1MgPSBmYWxz
ZQ0KPiANCj4gSW4gdGhpcyBjYXNlLCBEU0MgY2FuIG9ubHkgYmUgYXR0ZW1wdGVkIG9uIHRoZSBw
ZWVyIGRldmljZQ0KPiAodGhlIG91dHB1dCBwb3J0KQ0KPiANCj4gQ2FzZSAzOiBWaXJ0dWFsIERQ
IFNpbmsgKEludGVybmFsIERpc3BsYXkgUGFuZWwpDQo+IElmIHRoZSBvdXRwdXQgcG9ydCBoYXMN
Cj4gICAtIERQQ0QgcmV2LiA+PSBEUCAxLjQNCj4gICAtIHBvcnRfbnVtID49IDgNCj4gDQo+IElu
IHRoaXMgY2FzZSwgRFNDIGNhbiBvbmx5IGJlIGF0dGVtcHRlZCBvbiB0aGUgcGVlciBkZXZpY2UN
Cj4gKHRoZSBvdXRwdXQgcG9ydCkNCj4gDQo+IENhc2UgNDogU3luYXB0aXggV29ya2Fyb3VuZA0K
PiBJZiB0aGUgb3V0cHV0IGhhcw0KPiAgIC0gbGluayBEUENEIHJldi4gPj0gRFAgMS40DQo+ICAg
LSBsaW5rIGJyYW5jaF9kZXZfaWQgPSAweDkwQ0MyNCAoU3luYXB0aXgpDQo+ICAgLSBUaGVyZSBp
cyBleGFjdGx5IG9uZSBicmFuY2ggZGV2aWNlIGJldHdlZW4gdGhlIGxpbmsgYW5kIG91dHB1dA0K
PiANCj4gSW4gdGhpcyBjYXNlLCBEU0MgY2FuIGJlIGF0dGVtcHRlZCwgYnV0IG9ubHkgdXNpbmcg
dGhlICpsaW5rKg0KPiBhdXggZGV2aWNlJ3MgY2Fwcy4gVGhpcyBpcyBhIHF1aXJrLg0KPiANCj4g
VGVzdCBmb3IgdGhlc2UgY2FzZXMgYXMgbW9kZXMgYXJlIGVudW1lcmF0ZWQgZm9yIGFuIE1TVCBl
bmRwb2ludC4NCj4gV2UgY2Fubm90IGRvIHRoaXMgZHVyaW5nIGxpbmsgYXR0YWNoIGJlY2F1c2Ug
dGhlIGRjX3Npbmsgb2JqZWN0DQo+IHdpbGwgbm90IGhhdmUgYmVlbiBjcmVhdGVkIHlldA0KPiAN
Cj4gSWYgbm8gRFNDIGlzIGF0dGVtcHRlZCwgemVybyB0aGUgRFNDIGNhcHMNCj4gDQo+IENjOiBX
ZW5qaW5nIExpdSA8V2VuamluZy5MaXVAYW1kLmNvbT4NCj4gQ2M6IE5pa29sYSBDb3JuaWogPE5p
a29sYS5Db3JuaWpAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2
aWQuRnJhbmNpc0BhbWQuY29tPg0KDQpRdWVzdGlvbnMgYW5kIGNvbW1lbnRzIGJlbG93Li4uDQoN
Cj4gLS0tDQo+ICAgLi4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyAg
IHwgMTIzICsrKysrKysrKysrKysrKysrLQ0KPiAgIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG1fbXN0X3R5cGVzLmggICB8ICAgMyArDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMjUgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMNCj4g
aW5kZXggMTYyMThhMjAyYjU5Li41ODU3MTg0NGY2ZDUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90
eXBlcy5jDQo+IEBAIC0yNSw2ICsyNSw3IEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgPGxpbnV4L3Zl
cnNpb24uaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+DQo+ICsjaW5j
bHVkZSA8ZHJtL2RybV9kcF9tc3RfaGVscGVyLmg+DQo+ICAgI2luY2x1ZGUgImRtX3NlcnZpY2Vz
LmgiDQo+ICAgI2luY2x1ZGUgImFtZGdwdS5oIg0KPiAgICNpbmNsdWRlICJhbWRncHVfZG0uaCIN
Cj4gQEAgLTE4OSw2ICsxOTAsMTIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
cl9mdW5jcyBkbV9kcF9tc3RfY29ubmVjdG9yX2Z1bmNzID0gew0KPiAgIAkuZWFybHlfdW5yZWdp
c3RlciA9IGFtZGdwdV9kbV9tc3RfY29ubmVjdG9yX2Vhcmx5X3VucmVnaXN0ZXIsDQo+ICAgfTsN
Cj4gICANCj4gK2Jvb2wgaXNfdmlydHVhbF9kcGNkKHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBv
cnQpDQo+ICt7DQo+ICsJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqZG93bnN0cmVhbV9wb3J0Ow0K
PiArDQo+ICsJaWYgKCFwb3J0KQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsNCj4gKwlpZiAocG9y
dC0+cG9ydF9udW0gPj0gOCAmJg0KPiArCQlwb3J0LT5kcGNkX3JldiA+PSBEUF9EUENEX1JFVl8x
NCkgew0KDQpBbGwgdGhlc2UgaWYgc3RhdGVtZW50cyBzaG91bGQgYmUgYWxpZ25lZCBpZiBwb3Nz
aWJsZS4gVGhhdCdzIGp1c3QgDQpmb3JtYXR0aW5nIG5pdHBpY2tzIHRob3VnaC4NCg0KPiArCQkv
KiBWaXJ0dWFsIERQIFNpbmsgKEludGVybmFsIERpc3BsYXkgUGFuZWwpICovDQo+ICsJCXJldHVy
biB0cnVlOw0KPiArCX0gZWxzZSBpZiAocG9ydC0+cGR0ID09IERQX1BFRVJfREVWSUNFX0RQX0xF
R0FDWV9DT05WICYmDQo+ICsJCQkhcG9ydC0+bWNzICYmDQo+ICsJCQlwb3J0LT5sZHBzICYmDQo+
ICsJCQlwb3J0LT5kcGNkX3JldiA+PSBEUF9EUENEX1JFVl8xNCkgew0KPiArCQkvKiBEUC10by1I
RE1JIFByb3RvY29sIENvbnZlcnRlciAqLw0KPiArCQlyZXR1cm4gdHJ1ZTsNCj4gKwl9IGVsc2Ug
aWYgKHBvcnQtPnBkdCA9PSBEUF9QRUVSX0RFVklDRV9NU1RfQlJBTkNISU5HICYmDQo+ICsJCQlw
b3J0LT5tc3RiICYmDQo+ICsJCQlwb3J0LT5kcGNkX3JldiA+PSBEUF9EUENEX1JFVl8xNCkgew0K
PiArCQkvKiBEUC10by1EUCAqLw0KPiArCQlpZiAocG9ydC0+bXN0Yi0+bnVtX3BvcnRzID09IDIp
IHsNCg0KQ2FuIHByb2JhYmx5IG1lcmdlIHRoaXMgaWYgY29uZGl0aW9uIGludG8gdGhlIGVsc2Ug
aWYgYWJvdmUuIFdpbGwgaGVscCANCmN1dCBkb3duIG9uIGxpbmUgbGVuZ3RoIGJlbG93Lg0KDQo+
ICsJCQlsaXN0X2Zvcl9lYWNoX2VudHJ5KGRvd25zdHJlYW1fcG9ydCwgJnBvcnQtPm1zdGItPnBv
cnRzLCBuZXh0KSB7DQo+ICsJCQkJaWYgKCFkb3duc3RyZWFtX3BvcnQtPmlucHV0ICYmDQo+ICsJ
CQkJCQlkb3duc3RyZWFtX3BvcnQtPnBkdCA9PSBEUF9QRUVSX0RFVklDRV9TU1RfU0lOSykNCj4g
KwkJCQkJcmV0dXJuIHRydWU7DQo+ICsJCQl9DQo+ICsJCX0NCj4gKwl9DQo+ICsJcmV0dXJuIGZh
bHNlOw0KPiArfSA+ICsNCj4gK2Jvb2wgc3luYXB0aXhfd29ya2Fyb3VuZChzdHJ1Y3QgYW1kZ3B1
X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvcikNCg0KVGhpcyBwcm9iYWJseSBuZWVkcyBhIGJldHRl
ciBuYW1lLiBUaGlzIGlzbid0IGFwcGx5aW5nIGEgd29ya2Fyb3VuZCBmb3IgDQphIHNwZWNpZmlj
IGRldmljZSBidXQgcmV0dXJuaW5nIHRydWUgaWYgaXQgaXMgYSBzcGVjaWZpYyBkZXZpY2UuDQoN
Cj4gK3sNCj4gKwlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0ID0gYWNvbm5lY3Rvci0+cG9y
dDsNCj4gKwlzdHJ1Y3QgZGNfbGluayAqbGluayA9IGFjb25uZWN0b3ItPmRjX3NpbmstPmxpbms7
DQo+ICsJdTggZG93bl9zdHJlYW1fcG9ydF9kYXRhOw0KPiArDQo+ICsJaWYgKHBvcnQtPm1nci0+
bXN0X3ByaW1hcnkgPT0gcG9ydC0+cGFyZW50ICYmDQo+ICsJCQlsaW5rLT5kcGNkX2NhcHMuYnJh
bmNoX2Rldl9pZCA9PSAweDkwQ0MyNCAmJg0KPiArCQkJbGluay0+ZHBjZF9jYXBzLmRwY2RfcmV2
LnJhdyA+PSBEUF9EUENEX1JFVl8xNCkgew0KPiArCQlkcm1fZHBfbXN0X2RwY2RfcmVhZCgmcG9y
dC0+YXV4LCBEUF9ET1dOU1RSRUFNUE9SVF9QUkVTRU5ULCAmZG93bl9zdHJlYW1fcG9ydF9kYXRh
LCAxKTsNCj4gKwkJaWYgKChkb3duX3N0cmVhbV9wb3J0X2RhdGEgJiA3KSAhPSAzKQ0KPiArCQkJ
cmV0dXJuIHRydWU7DQo+ICsJfQ0KPiArCXJldHVybiBmYWxzZTsNCj4gK30NCj4gKw0KPiArI2lm
ZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUDQo+ICtzdGF0aWMgYm9vbCB2YWxpZGF0
ZV9kc2NfY2Fwc19vbl9jb25uZWN0b3Ioc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25u
ZWN0b3IpDQo+ICt7DQo+ICsJdTggdXBzdHJlYW1fZHNjX2NhcHNbMTZdID0geyAwIH07DQo+ICsJ
dTggZW5kcG9pbnRfZHNjX2NhcHNbMTZdID0geyAwIH07DQo+ICsJdTggZW5kcG9pbnRfZmVjX2Nh
cHMgPSAwOw0KPiArCXN0cnVjdCBkY19zaW5rICpkY19zaW5rID0gYWNvbm5lY3Rvci0+ZGNfc2lu
azsNCj4gKwlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpvdXRwdXRfcG9ydCA9IGFjb25uZWN0b3It
PnBvcnQ7DQo+ICsJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqaW1tZWRpYXRlX3Vwc3RyZWFtX3Bv
cnQ7DQo+ICsJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqZmVjX3BvcnQ7DQo+ICsNCj4gKwlpZiAo
YWNvbm5lY3Rvci0+cG9ydCAmJiBhY29ubmVjdG9yLT5wb3J0LT5wYXJlbnQpDQo+ICsJCWltbWVk
aWF0ZV91cHN0cmVhbV9wb3J0ID0gYWNvbm5lY3Rvci0+cG9ydC0+cGFyZW50LT5wb3J0X3BhcmVu
dDsNCj4gKwllbHNlDQo+ICsJCWltbWVkaWF0ZV91cHN0cmVhbV9wb3J0ID0gTlVMTDsNCj4gKw0K
PiArCWZlY19wb3J0ID0gaW1tZWRpYXRlX3Vwc3RyZWFtX3BvcnQ7DQo+ICsJd2hpbGUgKGZlY19w
b3J0KSB7DQo+ICsJCWlmICghZmVjX3BvcnQtPmZlY19jYXBhYmxlKQ0KPiArCQkJcmV0dXJuIGZh
bHNlOw0KPiArDQo+ICsJCWZlY19wb3J0ID0gZmVjX3BvcnQtPnBhcmVudC0+cG9ydF9wYXJlbnQ7
DQo+ICsJfQ0KPiArDQo+ICsJaWYgKGltbWVkaWF0ZV91cHN0cmVhbV9wb3J0KQ0KPiArCQlkcm1f
ZHBfbXN0X2RwY2RfcmVhZCgmaW1tZWRpYXRlX3Vwc3RyZWFtX3BvcnQtPmF1eCwgRFBfRFNDX1NV
UFBPUlQsIHVwc3RyZWFtX2RzY19jYXBzLCAxNik7DQo+ICsJZHJtX2RwX21zdF9kcGNkX3JlYWQo
Jm91dHB1dF9wb3J0LT5hdXgsIERQX0RTQ19TVVBQT1JULCBlbmRwb2ludF9kc2NfY2FwcywgMTYp
Ow0KPiArCWRybV9kcF9tc3RfZHBjZF9yZWFkKCZvdXRwdXRfcG9ydC0+YXV4LCBEUF9GRUNfQ0FQ
QUJJTElUWSwgJmVuZHBvaW50X2ZlY19jYXBzLCAxKTsNCj4gKw0KPiArCWlmIChpc192aXJ0dWFs
X2RwY2QoaW1tZWRpYXRlX3Vwc3RyZWFtX3BvcnQpDQo+ICsJCQkmJiAodXBzdHJlYW1fZHNjX2Nh
cHNbMF0gJiAweDIpIC8qIERTQyBwYXNzdGhyb3VnaCBjYXBhYmlsaXR5ICovDQo+ICsJCQkmJiAo
ZW5kcG9pbnRfZmVjX2NhcHMgJiBEUF9GRUNfQ0FQQUJMRSkNCj4gKwkJCSYmIChlbmRwb2ludF9k
c2NfY2Fwc1swXSAmIERQX0RTQ19ERUNPTVBSRVNTSU9OX0lTX1NVUFBPUlRFRCkpIHsNCj4gKwkJ
LyogRW5wb2ludCBkZWNvbXByZXNzaW9uIHdpdGggRFAtdG8tRFAgcGVlciBkZXZpY2UgKi8NCj4g
KwkJaWYgKCFkY19kc2NfcGFyc2VfZHNjX2RwY2QoZW5kcG9pbnRfZHNjX2NhcHMsIE5VTEwsICZk
Y19zaW5rLT5zaW5rX2RzY19jYXBzLmRzY19kZWNfY2FwcykpDQo+ICsJCQlyZXR1cm4gZmFsc2U7
DQo+ICsNCj4gKwkJZGNfc2luay0+c2lua19kc2NfY2Fwcy5pc192aXJ0dWFsX2RwY2RfZHNjID0g
ZmFsc2U7DQo+ICsJfSBlbHNlIGlmIChpc192aXJ0dWFsX2RwY2QoaW1tZWRpYXRlX3Vwc3RyZWFt
X3BvcnQpKSB7DQo+ICsJCS8qIFZpcnR1YWwgRFBDRCBkZWNvbXByZXNzaW9uIHdpdGggRFAtdG8t
RFAgcGVlciBkZXZpY2UgKi8NCj4gKwkJaWYgKCFkY19kc2NfcGFyc2VfZHNjX2RwY2QodXBzdHJl
YW1fZHNjX2NhcHMsIE5VTEwsICZkY19zaW5rLT5zaW5rX2RzY19jYXBzLmRzY19kZWNfY2Fwcykp
DQo+ICsJCQlyZXR1cm4gZmFsc2U7DQo+ICsNCj4gKwkJZGNfc2luay0+c2lua19kc2NfY2Fwcy5p
c192aXJ0dWFsX2RwY2RfZHNjID0gdHJ1ZTsNCj4gKwl9IGVsc2UgaWYgKGlzX3ZpcnR1YWxfZHBj
ZChvdXRwdXRfcG9ydCkpIHsNCj4gKwkJLyogVmlydHVhbCBEUENEIGRlY29tcHJlc3Npb24gd2l0
aCBEUC10by1IRE1JIG9yIFZpcnR1YWwgRFAgU2luayAqLw0KPiArCQlpZiAoIWRjX2RzY19wYXJz
ZV9kc2NfZHBjZChlbmRwb2ludF9kc2NfY2FwcywgTlVMTCwgJmRjX3NpbmstPnNpbmtfZHNjX2Nh
cHMuZHNjX2RlY19jYXBzKSkNCj4gKwkJCXJldHVybiBmYWxzZTsNCj4gKw0KPiArCQlkY19zaW5r
LT5zaW5rX2RzY19jYXBzLmlzX3ZpcnR1YWxfZHBjZF9kc2MgPSB0cnVlOw0KPiArCX0gZWxzZSBp
ZiAoc3luYXB0aXhfd29ya2Fyb3VuZChhY29ubmVjdG9yKSkgew0KPiArCQkvKiBTeW5hcHRpeCB3
b3JrYXJvdW5kICovDQo+ICsJCWFjb25uZWN0b3IgPSBkY19zaW5rLT5saW5rLT5wcml2Ow0KPiAr
CQlkcm1fZHBfZHBjZF9yZWFkKCZhY29ubmVjdG9yLT5kbV9kcF9hdXguYXV4LCBEUF9EU0NfU1VQ
UE9SVCwgdXBzdHJlYW1fZHNjX2NhcHMsIDE2KTsNCj4gKwkJaWYgKCFkY19kc2NfcGFyc2VfZHNj
X2RwY2QodXBzdHJlYW1fZHNjX2NhcHMsIE5VTEwsICZkY19zaW5rLT5zaW5rX2RzY19jYXBzLmRz
Y19kZWNfY2FwcykpDQo+ICsJCQlyZXR1cm4gZmFsc2U7DQo+ICsNCj4gKwkJZGNfc2luay0+c2lu
a19kc2NfY2Fwcy5pc192aXJ0dWFsX2RwY2RfZHNjID0gdHJ1ZTsNCj4gKwl9IGVsc2Ugew0KPiAr
CQlyZXR1cm4gZmFsc2U7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIHRydWU7DQo+ICt9DQo+ICsj
ZW5kaWYNCg0KU2hvdWxkIHRoaXMgYmUgY29tbW9uIGNvZGUgaW5zdGVhZCBhcyBhIGRwIG1zdCBo
ZWxwZXIgZm9yIGRldGVybWluaW5nIA0KY2Fwcz8gT3RoZXIgdGhhbiBzZXR0aW5nIHRoZSBkYyBz
aW5rIHN0dWZmIHRoZSByZXN0IGxvb2tzIGxpa2UgaXQgY291bGQgDQpiZSBjb21tb24gYnV0IEkn
bSBub3Qgb3Zlcmx5IGZhbWlsaWFyIHdpdGggdGhlIGFyY2hpdGVjdHVyZS4NCg0KPiArDQo+ICAg
c3RhdGljIGludCBkbV9kcF9tc3RfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3Rv
ciA9IHRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsNCj4gQEAgLTIzMSwxMCArMzQ2
LDE2IEBAIHN0YXRpYyBpbnQgZG1fZHBfbXN0X2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yKQ0KPiAgIAkJLyogZGNfbGlua19hZGRfcmVtb3RlX3NpbmsgcmV0dXJucyBh
IG5ldyByZWZlcmVuY2UgKi8NCj4gICAJCWFjb25uZWN0b3ItPmRjX3NpbmsgPSBkY19zaW5rOw0K
PiAgIA0KPiAtCQlpZiAoYWNvbm5lY3Rvci0+ZGNfc2luaykNCj4gKwkJaWYgKGFjb25uZWN0b3It
PmRjX3NpbmspIHsNCj4gICAJCQlhbWRncHVfZG1fdXBkYXRlX2ZyZWVzeW5jX2NhcHMoDQo+ICAg
CQkJCQljb25uZWN0b3IsIGFjb25uZWN0b3ItPmVkaWQpOw0KPiAgIA0KPiArI2lmZGVmIENPTkZJ
R19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUDQo+ICsJCQlpZiAoIXZhbGlkYXRlX2RzY19jYXBzX29u
X2Nvbm5lY3RvcihhY29ubmVjdG9yKSkNCj4gKwkJCQltZW1zZXQoJmFjb25uZWN0b3ItPmRjX3Np
bmstPnNpbmtfZHNjX2NhcHMsDQo+ICsJCQkJICAgICAgIDAsIHNpemVvZihhY29ubmVjdG9yLT5k
Y19zaW5rLT5zaW5rX2RzY19jYXBzKSk7DQo+ICsjZW5kaWYNCj4gKwkJfQ0KPiAgIAl9DQo+ICAg
DQo+ICAgCWRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVydHkoDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlw
ZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21z
dF90eXBlcy5oDQo+IGluZGV4IDJkYTg1MWI0MDA0Mi4uOGRlM2Q4YzMwZjhkIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3Rf
dHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9tc3RfdHlwZXMuaA0KPiBAQCAtMzIsNCArMzIsNyBAQCBzdHJ1Y3QgYW1kZ3B1X2Rt
X2Nvbm5lY3RvcjsNCj4gICB2b2lkIGFtZGdwdV9kbV9pbml0aWFsaXplX2RwX2Nvbm5lY3Rvcihz
dHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sDQo+ICAgCQkJCSAgICAgICBzdHJ1Y3Qg
YW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3Rvcik7DQo+ICAgDQo+ICtib29sIGlzX3ZpcnR1
YWxfZHBjZChzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0KTsNCj4gK2Jvb2wgc3luYXB0aXhf
d29ya2Fyb3VuZChzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3Rvcik7DQoNClRo
ZXNlIHNob3VsZG4ndCBiZSBkZWZpbmVkIGluIHRoZSBoZWFkZXIgaWYgdGhleSdyZSBvbmx5IGdv
aW5nIHRvIGJlIA0KdXNlZCBoZXJlLCB0aGV5IHNob3VsZCBqdXN0IGJlIHN0YXRpYy4NCg0KPiAr
DQo+ICAgI2VuZGlmDQo+IA0KDQpOaWNob2xhcyBLYXpsYXVza2FzDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
