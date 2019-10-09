Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CAED060E
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 05:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E646E8CF;
	Wed,  9 Oct 2019 03:26:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810059.outbound.protection.outlook.com [40.107.81.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC316E8CF
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 03:26:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HonFR/S5UfZytT1WdeBlmTAix62gWzTCQM/16icBkyXAieuMLXMsZrCFvoqkWTO6yIhdz9oZ21upMfCTY9y7iy0DCSBggNWUlLvxwivul33IzpAljnAsfm7mLwwAsOKnqvb5GLkacr+SXdY4ABAKs67tvEU2etfgMLcrCex7ESoRK+pYIGecbVqlQi1+0omu6h7nTvprSbCimnKtoQkzzCIWu/FEAPZ5JvKVCSNbyN6XQhAX/BU5Ei/TliOZmNTo0Dut/o4B+/5DDQrTO4smjL/3LV7d4GQsROxkqrs3enP2Q8wRVktjsvfhfqoEUfQCpH6sERMFRtTPfVZ1/rZCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cy2oEOtQGB86AAoBDnYCYbFec+2CUQrIGPRK+uW3uv8=;
 b=O6DeHTwPJHwqeeH4TKBN74KmX3cKMvQQiGLE86onj5JtZ3idayRRiLW9s/xMA4lNC9PN8GcQSPA/VEiYpseJwKpASDa++ZiTQPiiE7SoAYLfOgtClw+8IA1nMrYbkV3kgsCpSz/p+S8dFRPOo+crE7O+AA/zxMycphcQerW5dpvlz2FEzFcTcutqE4p4ik6dOeOcLaWpZrDxhJSaLdKKMkDQ+TKE6p1p2TGNT7DklWNP92nq+pFsiZrpCqJB5pBNOGneh5T+5r1vr7GVPsHfjDLRCbZa8QW+LLRcmPuZg1a8pSwWbs5OP3s12sh8lhlPpyO9IDriEVeCzpW9M51ywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB4152.namprd12.prod.outlook.com (20.180.6.72) by
 CH2PR12MB4183.namprd12.prod.outlook.com (20.180.17.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 03:26:12 +0000
Received: from CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::80b1:7ed1:2bd5:4bd4]) by CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::80b1:7ed1:2bd5:4bd4%3]) with mapi id 15.20.2327.026; Wed, 9 Oct 2019
 03:26:12 +0000
From: "Tuikov, Luben" <Luben.Tuikov@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/8] drm/amdgpu: update atomfirmware header with memory
 training related members
Thread-Topic: [PATCH 4/8] drm/amdgpu: update atomfirmware header with memory
 training related members
Thread-Index: AQHVfg7CgWr/kuaotUCIM0x5baJnv6dRpnqA
Date: Wed, 9 Oct 2019 03:26:12 +0000
Message-ID: <7d638d91-3af1-10f3-67e5-443dbb105692@amd.com>
References: <20191008192934.5481-1-alexander.deucher@amd.com>
 <20191008192934.5481-5-alexander.deucher@amd.com>
In-Reply-To: <20191008192934.5481-5-alexander.deucher@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::44) To CH2PR12MB4152.namprd12.prod.outlook.com
 (2603:10b6:610:a7::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8b5163c-3f0c-4a43-ebc7-08d74c686f69
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB4183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4183145A0831661FA3E26D5E99950@CH2PR12MB4183.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(199004)(189003)(4326008)(14454004)(71190400001)(6116002)(52116002)(6506007)(3846002)(76176011)(386003)(53546011)(36756003)(316002)(110136005)(54906003)(31686004)(71200400001)(478600001)(25786009)(256004)(186003)(64756008)(66476007)(66446008)(66556008)(66946007)(86362001)(8936002)(81156014)(305945005)(6512007)(6436002)(2906002)(476003)(7736002)(8676002)(81166006)(31696002)(2501003)(66066001)(26005)(6246003)(2616005)(102836004)(99286004)(11346002)(446003)(229853002)(486006)(6486002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4183;
 H:CH2PR12MB4152.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eKnFMYhFn0g3w6ApJjViQjeCFIDqsPKW4V5MLHzOv7dQbNkzN4Hv4H4EXvIg2ATASDSJAvzanqQcpvR7aFt0UCJ7dE2WVC2nLzUWD8H8GAd8znOJANh0jTjm1Rsadb9+qKNKLkugYFcCJ+xwuor8KVpfpldEvjrFPhHIml4dQDR8ZYXsrTP37/Chb9K4lzWJh32hx+ByK+o40oJKW+w7bNTef+Qwu63NOmDDZ1uyyvBJ/Jjm1QFQTiIY/xroOmxN1tsrUvlpnXWTk/B85mLPD2LnH0cAg+1OOO8qHNTpn6KHnLMoXtnzhi2RzJ3gosxSxwceSyxb+BvtF8/YbD4r8W8/d6dR+RbHebdmkZq6hUgZmFhUsoIZq93TOzJJxvZcY+lp8522cL3SSi32I0Vcjn4sIgqcnB+4fRzMHqWIEtM=
Content-ID: <10EC64EB5F1F0A439B6092E04096F3F3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b5163c-3f0c-4a43-ebc7-08d74c686f69
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 03:26:12.7107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a9x9SoDZHC/3iBSEit8UCcRvIzkLwfPINMmqISHUzr+g9GgwDbMQgxqwy+NoMKS0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4183
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cy2oEOtQGB86AAoBDnYCYbFec+2CUQrIGPRK+uW3uv8=;
 b=pyycO3QWUHN6HlJJwvpIoJAh2/3Ng91k7XvzQ2pHYfVANZ6SDJ17mTcKtjpWPoYHrJujR3hIYLQJ/Q7fqfaFiM9c2rG3uar5tixaiHNCqconMudDyBxEjxF0eNBPZHgz6hxowZmkwQb2QqT/OKSYrVSIINrDsx4W/xwtZHX176Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wOCAzOjI5IHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gRnJvbTogIlRp
YW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+DQo+IA0KPiBhZGQgbmV3IHZyYW1fcmVzZXJ2
ZV9ibG9jayBzdHJ1Y3R1cmUgYW5kIGF0b21maXJtd2FyZV9pbnRlcm5hbF9jb25zdGFudHMgZW51
bWVyYXRpb24NCj4gDQo+IENoYW5nZS1JZDogSTZiYTY0MmVjZDdhZDk0MjUwMTYyYWU1YzMyMmVk
OGQ4NWRlOWMzNWENCj4gUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogVGlhbmNpLllpbiA8dGlhbmNpLnlpbkBhbWQu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hdG9tZmlybXdhcmUu
aCB8IDE1ICsrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMo
KykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXRvbWZp
cm13YXJlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXRvbWZpcm13YXJlLmgNCj4g
aW5kZXggZTg4NTQxZDY3YWEwLi41MTk2Yjk0MDk3ZjUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvaW5jbHVkZS9hdG9tZmlybXdhcmUuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2luY2x1ZGUvYXRvbWZpcm13YXJlLmgNCj4gQEAgLTQ5OCw2ICs0OTgsNyBAQCBlbnVt
IGF0b21iaW9zX2Zpcm13YXJlX2NhcGFiaWxpdHkNCj4gICAgQVRPTV9GSVJNV0FSRV9DQVBfSFdF
TVVfRU5BQkxFICA9IDB4MDAwMDAwODAsDQo+ICAgIEFUT01fRklSTVdBUkVfQ0FQX0hXRU1VX1VN
Q19DRkcgPSAweDAwMDAwMTAwLA0KPiAgICBBVE9NX0ZJUk1XQVJFX0NBUF9TUkFNX0VDQyAgICAg
ID0gMHgwMDAwMDIwMCwNCj4gKyAgQVRPTV9GSVJNV0FSRV9DQVBfRU5BQkxFXzJTVEFHRV9CSVNU
X1RSQUlOSU5HICA9IDB4MDAwMDA0MDAsDQo+ICB9Ow0KDQpJbmRlbnRhdGlvbiBzZWVtcyBvZmYg
aW4gdGhlIGFkZGVkIGxpbmUuDQoNCj4gIA0KPiAgZW51bSBhdG9tX2Nvb2xpbmdfc29sdXRpb25f
aWR7DQo+IEBAIC02NzEsNiArNjcyLDIwIEBAIHN0cnVjdCB2cmFtX3VzYWdlYnlmaXJtd2FyZV92
Ml8xDQo+ICAgIHVpbnQxNl90ICB1c2VkX2J5X2RyaXZlcl9pbl9rYjsgDQo+ICB9Ow0KPiAgDQo+
ICsvKiBUaGlzIGlzIHBhcnQgb2YgdnJhbV91c2FnZWJ5ZmlybXdhcmVfdjJfMSAqLw0KPiArc3Ry
dWN0IHZyYW1fcmVzZXJ2ZV9ibG9jaw0KPiArew0KPiArICAgIHVpbnQzMl90ICBzdGFydF9hZGRy
ZXNzX2luX2tiOw0KPiArICAgIHVpbnQxNl90ICB1c2VkX2J5X2Zpcm13YXJlX2luX2tiOw0KPiAr
ICAgIHVpbnQxNl90ICB1c2VkX2J5X2RyaXZlcl9pbl9rYjsNCj4gK307DQo+ICsNCj4gKy8qIERl
ZmluaXRpb25zIGZvciBjb25zdGFuY2UgKi8NCj4gK2VudW0gYXRvbWZpcm13YXJlX2ludGVybmFs
X2NvbnN0YW50cyB7DQo+ICsgICAgT05FX0sJPSAweDQwMCwNCj4gKyAgICBPTkVfTUVHCT0gMHgx
MDAwMDAsDQo+ICsgICAgT05FX0cJPSAweDQwMDAwMDAwLA0KPiArfTsNCg0KSW5kZW50IGFjY29y
ZGluZyB0byBMS0NTOiBsZWFkaW5nLXRhYnMgb25seSAoVEFCUyBhcmUgbm90IGFsbG93ZWQgYW55
d2hlcmUgZWxzZSksIGhhcmQtdGFicyAoaW5kZW50IHVzaW5nIFRBQiBjaGFyKS4NCihFbWFjcyBu
YXR1cmFsbHkgZG9lcyB0aGlzIGZvciB5b3UuIFRBQiBrZXkgb25seSBpbmRlbnRzIGFjY29yZGlu
ZyB0byBtb2RlLCBhbmQgaWYgdGhlIGxpbmUgaXMgYWxyZWFkeSBpbmRlbnRlZCwNCm5vdGhpbmcg
aGFwcGVucyAobm90aGluZyBpcyBpbnNlcnRlZCkuKQ0KDQpSZWdhcmRzLA0KTHViZW4NCg0KPiAg
DQo+ICAvKiANCj4gICAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+IA0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
