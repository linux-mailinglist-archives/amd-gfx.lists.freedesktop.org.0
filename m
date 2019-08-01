Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0267D3CC
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 05:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE286E332;
	Thu,  1 Aug 2019 03:43:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740089.outbound.protection.outlook.com [40.107.74.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C766E332
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 03:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhNsPpgPXYRVu//1SSLIwrxL3GomVxLjosT7vt9zBRvLOV+f71qPh6OkZPR2vFDW8SD0Z6BOwm7s8mCRJNBOydoOYPky56KI2L4U/cAB8AMTAaCoOLxKRbRn4F25vuZ2n+FQaOMCruJDA4vWSx+wGOIJrFW2yw9z+rpciDdL0YmMZ0o7FKZQ/Jpi/gRrhzDQMCKqPRLXa79ZlIv93w7+IYyYWBonvBLDorWcpTcXB35saZththGlUo29Sc3U/B+JpwqR87lP3iNN9ClLguhAts7ieSziYbgjzw9/Cj9aYGNaQdbykk1xVfK7cXvIoI81dV8hS59bCUdoj4RJIvsxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+DRKH5ZgFP9xssfmJROLoOqwjYE31hgjcZKtG/i+qU=;
 b=PsguyTJepaRcL1dEkrxAtTK8cq1U1roxci81IaBltOUJP1ZUbeJgpOXUBceVmohWBOnPGET8u09gM2Qz3W3H+RnGObxTU4ue20lTTO8rBLqLLkBah1ph/gk1awJOAzcWOc5RRi2pTStO1cX6vtNPF5ONpG79AHOjZkww8JYeTE5u7BwKesRixYh9gU9QHSB/EzehBnwZb8c8k4/FbfQb2ZveGGfH1JG1Zoch7ruM+yRvlcSS5EjRq9Xzv/biH2WlU8qVp+FxxTN2/gm100wMeJoIx7kmtKThH0AGk8oRBIL1qpJ3/XEZZAtkYcb7SSvBmi5KuamEsf5Bf4iCceSHKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3502.namprd12.prod.outlook.com (20.178.242.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Thu, 1 Aug 2019 03:43:51 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5%7]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 03:43:51 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: sort feature status index by asic
 feature id for smu
Thread-Topic: [PATCH] drm/amd/powerplay: sort feature status index by asic
 feature id for smu
Thread-Index: AQHVR3S9HSKUfYSP8k2n/AI0gRxY4qbllviAgAAK+bA=
Date: Thu, 1 Aug 2019 03:43:51 +0000
Message-ID: <MN2PR12MB35982DDD957F3AEA93D6F2358EDE0@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190731075035.32068-1-kevin1.wang@amd.com>
 <2ad27a68-2b1c-ad70-d1e7-330e6f3c2496@amd.com>
In-Reply-To: <2ad27a68-2b1c-ad70-d1e7-330e6f3c2496@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 864943c2-92a3-4c6c-e683-08d7163277dc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3502; 
x-ms-traffictypediagnostic: MN2PR12MB3502:
x-microsoft-antispam-prvs: <MN2PR12MB3502CAAE6743805DB98A89538EDE0@MN2PR12MB3502.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(199004)(189003)(13464003)(478600001)(14454004)(66946007)(14444005)(64756008)(66556008)(66476007)(68736007)(66446008)(9686003)(2501003)(53546011)(99286004)(74316002)(316002)(54906003)(256004)(6506007)(186003)(110136005)(55016002)(76116006)(7696005)(4326008)(6246003)(76176011)(33656002)(2906002)(6116002)(486006)(3846002)(52536014)(6436002)(81166006)(81156014)(476003)(446003)(8936002)(26005)(8676002)(11346002)(53936002)(66066001)(86362001)(5660300002)(71190400001)(71200400001)(7736002)(305945005)(25786009)(229853002)(102836004)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3502;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: APcq5WjXG+y/pvH9fgaDXnkATJr9gdzfFXCBJmdvc47OdynkbOQ661XCZIsSfxtolhDlkM2DBN0U61Rn0E3xnXOuJRZ8ZtyO4F04te2SYYAeDa6qXgJfsX2wLKbmLCPq4Gl+2Ap+Vi1CBoulEBziBT4/gpX201Q7FLmrNp97UdO2kb/9JmJqEbocI/OTFfVEXpOaBnmf/KC/EAPnwECiT9TR5jtRikIrK3Rhxrb4Slmtcza9Mn8hBInL6SpkJAotLN6a2DE+Dy4Q0eDdKW+BaJtq/NHsGd5pMA6wxhWxcS4UkKvUcdY8FTLZmgBKKtaQ5x+MHymUdrtrKOe6BOAm/yfL9L9/GnuC+zdCAm2MsY23VP8JTc7ZlITL6nAgMsEDtFjy4kAZFwUpzwvsDq+bvPbd8BZh1JvY3l8uLW6Etv4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 864943c2-92a3-4c6c-e683-08d7163277dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 03:43:51.0436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyfeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3502
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+DRKH5ZgFP9xssfmJROLoOqwjYE31hgjcZKtG/i+qU=;
 b=k0N8N1l6+FWld1vlckZRQgIbeTVLRn/62juxyxOv6PfCpCnIi50PD9zYcMZxx+5I3Hmmyfcrbwts/5v1Y2G2WC50q8Cy3Ayi/9c8adL7JD0oO2cK2YqaOzDTCrXbYBSsySRMzq4Q9TauXI12MNceiRHABtcDrYWUgwoUuBHKg1I=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhbmcsIEtldmluKFlhbmcpIA0KU2VudDog
VGh1cnNkYXksIEF1Z3VzdCAwMSwgMjAxOSAxMDo0NCBBTQ0KVG86IFdhbmcsIEtldmluKFlhbmcp
IDxLZXZpbjEuV2FuZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNj
OiBGZW5nLCBLZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT47IEh1YW5nLCBSYXkgPFJheS5I
dWFuZ0BhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQu
Y29tPg0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IHNvcnQgZmVhdHVy
ZSBzdGF0dXMgaW5kZXggYnkgYXNpYyBmZWF0dXJlIGlkIGZvciBzbXUNCg0KcGluZy4uLg0KDQpw
bGVhc2UgaGVscCBtZSByZXZpZXcgaXQgLCB0aGFua3MuDQoNCkJSDQpLZXZpbg0KDQpPbiA3LzMx
LzE5IDM6NTEgUE0sIFdhbmcsIEtldmluKFlhbmcpIHdyb3RlOg0KPiBiZWZvcmUgdGhpcyBjaGFu
Z2UsIHRoZSBwcF9mZWF0dXJlIHN5c2ZzIHNob3cgZmVhdHVyZSBlbmFibGUgc3RhdGUgYnkgDQo+
IGxvZ2ljIGZlYXR1cmUgaWQsIGl0IGlzIG5vdCBlYXN5IHRvIHJlYWQuDQo+IHRoaXMgY2hhbmdl
IHdpbGwgc29ydCBwcF9mZWF0dXJlcyBzaG93IGluZGV4IGJ5IGFzaWMgZmVhdHVyZSBpZC4NCj4N
Cj4gYmVmb3JlOg0KPiBmZWF0dXJlcyBoaWdoOiAweDAwMDAwNjIzIGxvdzogMHhiM2NkYWZmYg0K
PiAwMC4gRFBNX1BSRUZFVENIRVIgICAgICAgKCAwKSA6IGVuYWJlbGQNCj4gMDEuIERQTV9HRlhD
TEsgICAgICAgICAgICggMSkgOiBlbmFiZWxkDQo+IDAyLiBEUE1fVUNMSyAgICAgICAgICAgICAo
IDMpIDogZW5hYmVsZA0KPiAwMy4gRFBNX1NPQ0NMSyAgICAgICAgICAgKCA0KSA6IGVuYWJlbGQN
Cj4gMDQuIERQTV9NUDBDTEsgICAgICAgICAgICggNSkgOiBlbmFiZWxkDQo+IDA1LiBEUE1fTElO
SyAgICAgICAgICAgICAoIDYpIDogZW5hYmVsZA0KPiAwNi4gRFBNX0RDRUZDTEsgICAgICAgICAg
KCA3KSA6IGVuYWJlbGQNCj4gMDcuIERTX0dGWENMSyAgICAgICAgICAgICgxMCkgOiBlbmFiZWxk
DQo+IDA4LiBEU19TT0NDTEsgICAgICAgICAgICAoMTEpIDogZW5hYmVsZA0KPiAwOS4gRFNfTENM
SyAgICAgICAgICAgICAgKDEyKSA6IGRpc2FibGVkDQo+IDEwLiBQUFQgICAgICAgICAgICAgICAg
ICAoMjMpIDogZW5hYmVsZA0KPiAxMS4gVERDICAgICAgICAgICAgICAgICAgKDI0KSA6IGVuYWJl
bGQNCj4gMTIuIFRIRVJNQUwgICAgICAgICAgICAgICgzMykgOiBlbmFiZWxkDQo+IDEzLiBSTSAg
ICAgICAgICAgICAgICAgICAoMzUpIDogZGlzYWJsZWQNCj4gLi4uLi4uDQo+DQo+IGFmdGVyOg0K
PiBmZWF0dXJlcyBoaWdoOiAweDAwMDAwNjIzIGxvdzogMHhiM2NkYWZmYg0KPiAwMC4gRFBNX1BS
RUZFVENIRVIgICAgICAgKCAwKSA6IGVuYWJlbGQNCj4gMDEuIERQTV9HRlhDTEsgICAgICAgICAg
ICggMSkgOiBlbmFiZWxkDQo+IDAyLiBEUE1fR0ZYX1BBQ0UgICAgICAgICAoIDIpIDogZGlzYWJs
ZWQNCj4gMDMuIERQTV9VQ0xLICAgICAgICAgICAgICggMykgOiBlbmFiZWxkDQo+IDA0LiBEUE1f
U09DQ0xLICAgICAgICAgICAoIDQpIDogZW5hYmVsZA0KPiAwNS4gRFBNX01QMENMSyAgICAgICAg
ICAgKCA1KSA6IGVuYWJlbGQNCj4gMDYuIERQTV9MSU5LICAgICAgICAgICAgICggNikgOiBlbmFi
ZWxkDQo+IDA3LiBEUE1fRENFRkNMSyAgICAgICAgICAoIDcpIDogZW5hYmVsZA0KPiAwOC4gTUVN
X1ZERENJX1NDQUxJTkcgICAgKCA4KSA6IGVuYWJlbGQNCj4gMDkuIE1FTV9NVkREX1NDQUxJTkcg
ICAgICggOSkgOiBlbmFiZWxkDQo+IDEwLiBEU19HRlhDTEsgICAgICAgICAgICAoMTApIDogZW5h
YmVsZA0KPiAxMS4gRFNfU09DQ0xLICAgICAgICAgICAgKDExKSA6IGVuYWJlbGQNCj4gMTIuIERT
X0xDTEsgICAgICAgICAgICAgICgxMikgOiBkaXNhYmxlZA0KPiAxMy4gRFNfRENFRkNMSyAgICAg
ICAgICAgKDEzKSA6IGVuYWJlbGQNCj4gLi4uLi4uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEtldmlu
IFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDE0ICsrKysrKysrKysrLS0tDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQo+IGluZGV4IGVhYmU4YTZk
MGViNy4uOWUyNTZhYTNiMzU3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hbWRncHVfc211LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYW1kZ3B1X3NtdS5jDQo+IEBAIC02Miw2ICs2Miw4IEBAIHNpemVfdCBzbXVfc3lzX2dldF9w
cF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGNoYXIgKmJ1ZikNCj4gICAJ
dWludDMyX3QgZmVhdHVyZV9tYXNrWzJdID0geyAwIH07DQo+ICAgCWludDMyX3QgZmVhdHVyZV9p
bmRleCA9IDA7DQo+ICAgCXVpbnQzMl90IGNvdW50ID0gMDsNCj4gKwl1aW50MzJfdCBzb3J0X2Zl
YXR1cmVbU01VX0ZFQVRVUkVfQ09VTlRdOw0KPiArCXVpbnQ2NF90IGh3X2ZlYXR1cmVfY291bnQg
PSAwOw0KPiAgIA0KPiAgIAlyZXQgPSBzbXVfZmVhdHVyZV9nZXRfZW5hYmxlZF9tYXNrKHNtdSwg
ZmVhdHVyZV9tYXNrLCAyKTsNCj4gICAJaWYgKHJldCkNCj4gQEAgLTc0LDExICs3NiwxNyBAQCBz
aXplX3Qgc211X3N5c19nZXRfcHBfZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211
LCBjaGFyICpidWYpDQo+ICAgCQlmZWF0dXJlX2luZGV4ID0gc211X2ZlYXR1cmVfZ2V0X2luZGV4
KHNtdSwgaSk7DQo+ICAgCQlpZiAoZmVhdHVyZV9pbmRleCA8IDApDQo+ICAgCQkJY29udGludWU7
DQo+ICsJCXNvcnRfZmVhdHVyZVtmZWF0dXJlX2luZGV4XSA9IGk7DQo+ICsJCWh3X2ZlYXR1cmVf
Y291bnQrKzsNCj4gKwl9DQo+ICsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgaHdfZmVhdHVyZV9jb3Vu
dDsgaSsrKSB7DQo+ICAgCQlzaXplICs9IHNwcmludGYoYnVmICsgc2l6ZSwgIiUwMmQuICUtMjBz
ICglMmQpIDogJXNcbiIsDQo+ICAgCQkJICAgICAgIGNvdW50KyssDQo+IC0JCQkgICAgICAgc211
X2dldF9mZWF0dXJlX25hbWUoc211LCBpKSwNCj4gLQkJCSAgICAgICBmZWF0dXJlX2luZGV4LA0K
PiAtCQkJICAgICAgICEhc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIGkpID8gImVuYWJlbGQi
IDogImRpc2FibGVkIik7DQo+ICsJCQkgICAgICAgc211X2dldF9mZWF0dXJlX25hbWUoc211LCBz
b3J0X2ZlYXR1cmVbaV0pLA0KPiArCQkJICAgICAgIGksDQo+ICsJCQkgICAgICAgISFzbXVfZmVh
dHVyZV9pc19lbmFibGVkKHNtdSwgc29ydF9mZWF0dXJlW2ldKSA/DQo+ICsJCQkgICAgICAgImVu
YWJlbGQiIDogImRpc2FibGVkIik7DQo+ICAgCX0NCj4gICANCj4gICBmYWlsZWQ6DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
