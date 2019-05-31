Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D4E316E0
	for <lists+amd-gfx@lfdr.de>; Sat,  1 Jun 2019 00:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3245892E7;
	Fri, 31 May 2019 22:01:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780071.outbound.protection.outlook.com [40.107.78.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B593892E7
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 22:01:15 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3417.namprd12.prod.outlook.com (20.178.198.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.18; Fri, 31 May 2019 22:01:14 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 22:01:14 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Yang, Philip" <Philip.Yang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: use new HMM APIs and helpers
Thread-Topic: [PATCH] drm/amdgpu: use new HMM APIs and helpers
Thread-Index: AQHVFvW7FwLiVzA03k2ytJmujZXksaaEQkeAgAE8UICAACWJgIAAHqUAgAAIBwA=
Date: Fri, 31 May 2019 22:01:14 +0000
Message-ID: <9f5f4060-5f8f-b688-2cc2-39aca92c7505@amd.com>
References: <20190530144049.1996-1-Philip.Yang@amd.com>
 <704410a5-be01-f423-11ef-01a640cd469c@amd.com>
 <bd8f1fd6-f6c4-66fc-c0b9-c8ed36cd6027@amd.com>
 <befbe7fa-0bd3-ffcf-d2eb-36f15053d1a5@amd.com>
 <9ae26883-4326-c60f-9a8e-d95d0d458e31@amd.com>
In-Reply-To: <9ae26883-4326-c60f-9a8e-d95d0d458e31@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1e8e6ce-64f3-47fe-4ef6-08d6e6137f7e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3417; 
x-ms-traffictypediagnostic: DM6PR12MB3417:
x-microsoft-antispam-prvs: <DM6PR12MB3417C4BB14DD36548A7376E992190@DM6PR12MB3417.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(366004)(39830400003)(136003)(189003)(199004)(6486002)(25786009)(6436002)(386003)(53546011)(6506007)(58126008)(73956011)(64126003)(66446008)(66476007)(68736007)(66946007)(66556008)(65806001)(64756008)(26005)(305945005)(2906002)(476003)(7736002)(186003)(256004)(14444005)(36756003)(65956001)(2616005)(66066001)(3846002)(229853002)(110136005)(486006)(8936002)(316002)(31696002)(81156014)(86362001)(8676002)(5660300002)(71190400001)(81166006)(71200400001)(14454004)(72206003)(65826007)(6512007)(31686004)(102836004)(6116002)(2501003)(53936002)(446003)(6246003)(52116002)(11346002)(99286004)(478600001)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3417;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: biOg5Y4YUFm+OmuSAYfpemCMq68G/JqcMjyhRZXNUDQiLa6Wyemu5uuF9H696n3wdKy+efGbdRycsciRLA8yCPPKcDbXcswtO47hG0usupIfdS+yCyGqdJygQJyFdNDniA7xsN8zFa6c0KXLf0Q1vKjmJPcjv6kxtLmzBFoeKfQ0CCoVPLq3Lt73yCLtxeMSlPZSZpkxv9papc1nnxqe+BUup5RAuZTcTmNdXoEhezeCRVeP0nKat2EpV9hw2jKNqp9ECpm82Jd1qYejnunJgDpS7cz8cGloob+bcy/jDTBVZlgR1b23G7Xw3I5GnVYUnEepqxrAmrnyDpEe8Tq59+UgIJEUaoTGHsFOko5ggX+ZB41D8cYkwkZV6kjAkg2Luuh0/0aWPSfJ1sPb+1Mp1p9BBTkXeE4dqvAwq8OrVh4=
Content-ID: <FC77538A8D67AA448CAF84603D8ACB5D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e8e6ce-64f3-47fe-4ef6-08d6e6137f7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 22:01:14.0593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3417
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNdQnw+xU7bGR4TSr2k7nL0Nh0M4GJYXJVNrHESSFiA=;
 b=doNzuiEDcuoGFQkBJ6QxYHNazJczn0Q7SQRNMtKHmQQj4P00wxl0z1FCSmks9895VHTGzB9dfMmMcT8M7yaSNWBIQXa0ZkqajwpmKQqJbxew3PUxGnaALgJbhN28Kv9GS1ce7ebiC+TapldatkxopWd7DsBDgBEApn6zXdy1nA4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

T24gMjAxOS0wNS0zMSA1OjMyIHAubS4sIFlhbmcsIFBoaWxpcCB3cm90ZToNCj4NCj4gT24gMjAx
OS0wNS0zMSAzOjQyIHAubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToNCj4+IE9uIDIwMTktMDUt
MzEgMToyOCBwLm0uLCBZYW5nLCBQaGlsaXAgd3JvdGU6DQo+Pj4gT24gMjAxOS0wNS0zMCA2OjM2
IHAubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToNCj4+Pj4+ICAgICAgIA0KPj4+Pj4gICAgICAg
I2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9BTURHUFVfVVNFUlBUUikNCj4+Pj4+IC0JaWYgKGd0
dC0+cmFuZ2VzICYmDQo+Pj4+PiAtCSAgICB0dG0tPnBhZ2VzWzBdID09IGhtbV9wZm5fdG9fcGFn
ZSgmZ3R0LT5yYW5nZXNbMF0sDQo+Pj4+PiAtCQkJCQkgICAgIGd0dC0+cmFuZ2VzWzBdLnBmbnNb
MF0pKQ0KPj4+Pj4gKwlpZiAoZ3R0LT5yYW5nZSAmJg0KPj4+Pj4gKwkgICAgdHRtLT5wYWdlc1sw
XSA9PSBobW1fZGV2aWNlX2VudHJ5X3RvX3BhZ2UoZ3R0LT5yYW5nZSwNCj4+Pj4+ICsJCQkJCQkg
ICAgICBndHQtPnJhbmdlLT5wZm5zWzBdKSkNCj4+Pj4gSSB0aGluayBqdXN0IGNoZWNraW5nIGd0
dC0+cmFuZ2UgaGVyZSBpcyBlbm91Z2guIElmIGd0dC0+cmFuZ2UgaXMgbm90DQo+Pj4+IE5VTEwg
aGVyZSwgd2UncmUgbGVha2luZyBtZW1vcnkuDQo+Pj4+DQo+Pj4gSWYganVzdCBjaGVja2luZyBn
dHQtPnJhbmdlLCB0aGVyZSBpcyBhIGZhbHNlIHdhcm5pbmcgaW4gYW1kZ3B1X3Rlc3QNCj4+PiB1
c2VycHRyIGNhc2UgaW4gYW1kZ3B1X2NzX2xpc3RfdmFsaWRhdGUgcGF0aC4gSWYgdXNlcnB0ciBp
cyBpbnZhbGlkYXRlZCwNCj4+PiB0aGVuIHR0bS0+cGFnZXNbMF0gaXMgb3V0ZGF0ZWQgcGFnZXMs
IGxvYmotPnVzZXJfcGFnZXMgaXMgbmV3IHBhZ2VzLCBpdA0KPj4+IGdvZXMgdG8gdHRtX3R0X3Vu
YmluZCBmaXJzdCB0byB1bnBpbiBvbGQgcGFnZXMgKHRoaXMgY2F1c2VzIGZhbHNlDQo+Pj4gd2Fy
bmluZykgdGhlbiBjYWxsIGFtZGdwdV90dG1fdHRfc2V0X3VzZXJfcGFnZXMuDQo+PiBCdXQgZG9l
c24ndCB0aGF0IG1lYW4gd2UncmUgbGVha2luZyB0aGUgZ3R0LT5yYW5nZSBzb21ld2hlcmU/DQo+
Pg0KPiB0dG1fdHRfdW5iaW5kIGlzIGNhbGxlZCBmcm9tIHR0bV90dF9kZXN0cm95IGFuZCBhbWRn
cHVfY3NfbGlzdF92YWxpZGF0ZSwNCj4gdGhlIGxhdGVyIG9uZSBjYXVzZXMgZmFsc2Ugd2Fybmlu
Zy4gdHRtX3R0bV9kZXN0b3J5IHBhdGggaXMgZmluZSB0byBvbmx5DQo+IGNoZWNrIGd0dC0+cmFu
Z2UuDQo+DQo+IERvdWJsZSBjaGVja2VkLCBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzIGFu
ZA0KPiBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzX2RvbmUgYWx3YXlzIG1hdGNoIGluIGJv
dGggcGF0aHMsIHNvIG5vIGxlYWsNCj4gZ3R0LT5yYW5nZS4NCj4NCj4gMS4gYW1kZ3B1X2dlbV91
c2VycHRyX2lvY3RsDQo+ICAgICAgICAgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcw0KPiAg
ICAgICAgICAgICB0dG0tPnBhZ2VzIGZvciB1c2VycHRyIHBhZ2VzDQo+ICAgICAgICAgYW1kZ3B1
X3R0bV90dF9nZXRfdXNlcl9wYWdlc19kb25lDQo+DQo+IDIuIGFtZGdwdV9jc19pb2N0bA0KPiAg
ICAgICAgIGFtZGdwdV9jc19wYXJzZXJfYm9zDQo+ICAgICAgICAgICAgIGFtZGdwdV90dG1fdHRf
Z2V0X3VzZXJfcGFnZXMNCj4gICAgICAgICAgICAgaWYgKHVzZXJwYWdlX2ludmFsaWRhdGVkKQ0K
PiAgICAgICAgICAgICAgICAgZS0+dXNlcl9wYWdlcyBmb3IgbmV3IHBhZ2VzDQo+ICAgICAgICAg
ICAgIGFtZGdwdV9jc19saXN0X3ZhbGlkYXRlDQo+ICAgICAgICAgICAgICAgICBpZiAodXNlcnBh
Z2VfaW52YWxpZGF0ZWQpDQo+ICAgICAgICAgICAgICAgICAgICB0dG1fdHRfdW5iaW5kIHR0bS0+
cGFnZXMgLy8gdGhpcyBjYXVzZXMgd2FybmluZw0KPiAgICAgICAgICAgICAgICAgICAgYW1kZ3B1
X3R0bV90dF9zZXRfdXNlcl9wYWdlcyh0dG0tPnBhZ2VzLCBlLT51c2VyX3BhZ2VzKQ0KDQpIbW0s
IEkgdGhpbmsgYW1kZ3B1X2NzIGlzIGRvaW5nIHNvbWV0aGluZyB3ZWlyZCB0aGVyZS4gSXQgZG9l
cyBzb21lIA0KZG91YmxlIGJvb2sta2VlcGluZyBvZiB0aGUgdXNlciBwYWdlcyBpbiB0aGUgQk8g
bGlzdCBhbmQgdGhlIFRUTSBCTy4gV2UgDQpkaWQgc29tZXRoaW5nIHNpbWlsYXIgZm9yIEtGRCBh
bmQgc2ltcGxpZmllZCBpdCB3aGVuIG1vdmluZyB0byBITU0uIEl0IA0KY291bGQgcHJvYmFibHkg
YmUgc2ltcGxpZmllZCBmb3IgYW1kZ3B1X2NzIGFzIHdlbGwuIEJ1dCBub3QgaW4gdGhpcyANCnBh
dGNoIHNlcmllcy4NCg0KSSdsbCByZXZpZXcgeW91ciB1cGRhdGVkIGNoYW5nZS4NCg0KVGhhbmtz
LA0KIMKgIEZlbGl4DQoNCg0KPiAgICAgICAgIGFtZGdwdV9jc19zdWJtaXQNCj4gICAgICAgICAg
ICAgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlc19kb25lDQo+DQo+PiBSZWdhcmRzLA0KPj4g
ICAgwqAgRmVsaXgNCj4+DQo+Pg0KPj4+IEkgd2lsbCBzdWJtaXQgcGF0Y2ggdjIsIHRvIGFkZCBy
ZXRyeSBpZiBobW1fcmFuZ2VfZmF1bHQgcmV0dXJucyAtRUFHQUlOLg0KPj4+IHVzZSBremFsbG9j
IHRvIGFsbG9jYXRlIHNtYWxsIHNpemUgcmFuZ2UuDQo+Pj4NCj4+PiBUaGFua3MsDQo+Pj4gUGhp
bGlwDQo+Pj4NCj4+Pj4gUmVnYXJkcywNCj4+Pj4gICAgICDCoCBGZWxpeA0KPj4+Pg0KPj4+Pg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
