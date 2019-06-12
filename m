Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC3E42E41
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 20:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892A889807;
	Wed, 12 Jun 2019 18:02:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90C689807
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 18:02:32 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3450.namprd12.prod.outlook.com (20.178.198.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Wed, 12 Jun 2019 18:02:31 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.010; Wed, 12 Jun 2019
 18:02:31 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "StDenis, Tom" <Tom.StDenis@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/amdgpu: Bail out of BO node creation if not
 enough VRAM (v3)
Thread-Topic: [PATCH] drm/amd/amdgpu: Bail out of BO node creation if not
 enough VRAM (v3)
Thread-Index: AQHVIQ8v8WYAxqy6jEqFOOuLiEco1qaYT+AA
Date: Wed, 12 Jun 2019 18:02:31 +0000
Message-ID: <977f7a62-9d5c-ded8-8c03-7950e095bde3@amd.com>
References: <20190612110829.4699-1-tom.stdenis@amd.com>
In-Reply-To: <20190612110829.4699-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.53.123]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: BYAPR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:74::21) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe93401a-1680-43d3-048e-08d6ef602383
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3450; 
x-ms-traffictypediagnostic: DM6PR12MB3450:
x-microsoft-antispam-prvs: <DM6PR12MB345089C8F33D99D42DC0817D92EC0@DM6PR12MB3450.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(136003)(366004)(396003)(376002)(39860400002)(346002)(189003)(199004)(64126003)(99286004)(11346002)(2616005)(53936002)(25786009)(31686004)(66946007)(68736007)(66066001)(2906002)(6246003)(65806001)(65956001)(31696002)(66476007)(86362001)(229853002)(66556008)(5660300002)(26005)(446003)(71200400001)(186003)(102836004)(64756008)(8676002)(71190400001)(65826007)(486006)(81156014)(81166006)(6512007)(476003)(8936002)(66446008)(6486002)(6436002)(6116002)(73956011)(3846002)(58126008)(6506007)(14454004)(72206003)(478600001)(36756003)(7736002)(14444005)(76176011)(316002)(2501003)(110136005)(52116002)(53546011)(305945005)(256004)(386003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3450;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QUvRgcJZujVCw0KzICvrp59otAgfLIIup7BQnLqqiReX8/GCQV4XvSkp0GUdxYO1joqUHOZ01OLTHuAjSw6x+aJ+YXZSQf8Dn3HyeEfa9097ID+HACLmUGGYURM0FYDF2AE2m0zFI+lkqJKqd5h0MxCGBre1DFtpVtTcnmMIKzI8lxOv7b/jbvZ4YRT80osrm4W5LpRAFVfgiTG4gxnsfmDpkQWd6/c8XQi0SeASebNddt6M4h2v0vOIwnrxOTYJJAOJ1SYG/thOfUyhaDSnCpWDIA/0TOuJuHcmzzPH8tLu+hL/q4qQhRPpmFX5u6K828r1rihUfbRL0/CQZ0D0Z6xPsurRyOpiXoPb6YcGQJB6QVFDvyt7OIJr5YjoVpe68nNOkAqb46vgRG8y21QzTjUCVYn9U3psnQPUsehATeE=
Content-ID: <2900175B99CEFD4883B99B68C39D9544@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe93401a-1680-43d3-048e-08d6ef602383
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 18:02:31.3980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3450
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vP+4NsRi0VHuDEYqie50haM6dPe/8ajhHGC9u6n1wkk=;
 b=QZHJ3Ep/o/dDwEBpJoddldrbt4wJvrEGgSrvow9zVtEUvtq9Db/yPLq2OUD1jOdE7G2x3Sx1BHlttapK4m0TyDc/03HxHH5NomM0r7pDele94PKl8fQppk5evDCdqJlNlGjjSJ9U3Lec0fQIgGoW/UpwyW5byS+nvlJP4jiaiX0=
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

T24gMjAxOS0wNi0xMiA0OjA4LCBTdERlbmlzLCBUb20gd3JvdGU6DQo+ICh2Mik6IFJldHVybiAw
IGFuZCBzZXQgbWVtLT5tbV9ub2RlIHRvIE5VTEwuDQo+ICh2Myk6IFVzZSBhdG9taWM2NF9hZGRf
cmV0dXJuIGluc3RlYWQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFRvbSBTdCBEZW5pcyA8dG9tLnN0
ZGVuaXNAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZyYW1fbWdyLmMgfCAxNyArKysrKysrKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYw0KPiBpbmRleCA4YWVhMmYyMWIyMDIuLmM5
NjNhZDg2MDcyZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZyYW1fbWdyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZyYW1fbWdyLmMNCj4gQEAgLTI3Niw3ICsyNzYsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFt
X21ncl9uZXcoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sDQo+ICAgCXN0cnVjdCBk
cm1fbW1fbm9kZSAqbm9kZXM7DQo+ICAgCWVudW0gZHJtX21tX2luc2VydF9tb2RlIG1vZGU7DQo+
ICAgCXVuc2lnbmVkIGxvbmcgbHBmbiwgbnVtX25vZGVzLCBwYWdlc19wZXJfbm9kZSwgcGFnZXNf
bGVmdDsNCj4gLQl1aW50NjRfdCB1c2FnZSA9IDAsIHZpc191c2FnZSA9IDA7DQo+ICsJdWludDY0
X3QgdmlzX3VzYWdlID0gMDsNCj4gICAJdW5zaWduZWQgaTsNCj4gICAJaW50IHI7DQo+ICAgDQo+
IEBAIC0yODQsNiArMjg0LDEzIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1
Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwNCj4gICAJaWYgKCFscGZuKQ0KPiAgIAkJbHBm
biA9IG1hbi0+c2l6ZTsNCj4gICANCj4gKwkvKiBiYWlsIG91dCBxdWlja2x5IGlmIHRoZXJlJ3Mg
bGlrZWx5IG5vdCBlbm91Z2ggVlJBTSBmb3IgdGhpcyBCTyAqLw0KPiArCWlmIChhdG9taWM2NF9h
ZGRfcmV0dXJuKG1lbS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsICZtZ3ItPnVzYWdlKSA+IGFk
ZXYtPmdtYy5tY192cmFtX3NpemUpIHsNCj4gKwkJYXRvbWljNjRfc3ViKG1lbS0+bnVtX3BhZ2Vz
IDw8IFBBR0VfU0hJRlQsICZtZ3ItPnVzYWdlKTsNCg0KT24gMzItYml0IHN5c3RlbXMgbWVtLT5u
dW1fcGFnZXMgaXMgb25seSAzMi1iaXQgKHVuc2lnbmVkIGxvbmcpIGFuZCB0aGUgDQo8PCBQQUdF
X1NISUZUIG1heSBvdmVyZmxvdy4gWW91IHByb2JhYmx5IHdhbnQgdG8gY2FzdCB0aGlzIHRvIHU2
NCANCmV4cGxpY2l0bHkgYmVmb3JlIHRoZSBzaGlmdC4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0K
DQoNCj4gKwkJbWVtLT5tbV9ub2RlID0gTlVMTDsNCj4gKwkJcmV0dXJuIDA7DQo+ICsJfQ0KPiAr
DQo+ICAgCWlmIChwbGFjZS0+ZmxhZ3MgJiBUVE1fUExfRkxBR19DT05USUdVT1VTKSB7DQo+ICAg
CQlwYWdlc19wZXJfbm9kZSA9IH4wdWw7DQo+ICAgCQludW1fbm9kZXMgPSAxOw0KPiBAQCAtMzAw
LDggKzMwNywxMCBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21ncl9uZXcoc3RydWN0IHR0bV9t
ZW1fdHlwZV9tYW5hZ2VyICptYW4sDQo+ICAgDQo+ICAgCW5vZGVzID0ga3ZtYWxsb2NfYXJyYXko
KHVpbnQzMl90KW51bV9ub2Rlcywgc2l6ZW9mKCpub2RlcyksDQo+ICAgCQkJICAgICAgIEdGUF9L
RVJORUwgfCBfX0dGUF9aRVJPKTsNCj4gLQlpZiAoIW5vZGVzKQ0KPiArCWlmICghbm9kZXMpIHsN
Cj4gKwkJYXRvbWljNjRfc3ViKG1lbS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsICZtZ3ItPnVz
YWdlKTsNCj4gICAJCXJldHVybiAtRU5PTUVNOw0KPiArCX0NCj4gICANCj4gICAJbW9kZSA9IERS
TV9NTV9JTlNFUlRfQkVTVDsNCj4gICAJaWYgKHBsYWNlLT5mbGFncyAmIFRUTV9QTF9GTEFHX1RP
UERPV04pDQo+IEBAIC0zMjEsNyArMzMwLDYgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3Jf
bmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLA0KPiAgIAkJaWYgKHVubGlrZWx5
KHIpKQ0KPiAgIAkJCWJyZWFrOw0KPiAgIA0KPiAtCQl1c2FnZSArPSBub2Rlc1tpXS5zaXplIDw8
IFBBR0VfU0hJRlQ7DQo+ICAgCQl2aXNfdXNhZ2UgKz0gYW1kZ3B1X3ZyYW1fbWdyX3Zpc19zaXpl
KGFkZXYsICZub2Rlc1tpXSk7DQo+ICAgCQlhbWRncHVfdnJhbV9tZ3JfdmlydF9zdGFydChtZW0s
ICZub2Rlc1tpXSk7DQo+ICAgCQlwYWdlc19sZWZ0IC09IHBhZ2VzOw0KPiBAQCAtMzQxLDE0ICsz
NDksMTIgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5
cGVfbWFuYWdlciAqbWFuLA0KPiAgIAkJaWYgKHVubGlrZWx5KHIpKQ0KPiAgIAkJCWdvdG8gZXJy
b3I7DQo+ICAgDQo+IC0JCXVzYWdlICs9IG5vZGVzW2ldLnNpemUgPDwgUEFHRV9TSElGVDsNCj4g
ICAJCXZpc191c2FnZSArPSBhbWRncHVfdnJhbV9tZ3JfdmlzX3NpemUoYWRldiwgJm5vZGVzW2ld
KTsNCj4gICAJCWFtZGdwdV92cmFtX21ncl92aXJ0X3N0YXJ0KG1lbSwgJm5vZGVzW2ldKTsNCj4g
ICAJCXBhZ2VzX2xlZnQgLT0gcGFnZXM7DQo+ICAgCX0NCj4gICAJc3Bpbl91bmxvY2soJm1nci0+
bG9jayk7DQo+ICAgDQo+IC0JYXRvbWljNjRfYWRkKHVzYWdlLCAmbWdyLT51c2FnZSk7DQo+ICAg
CWF0b21pYzY0X2FkZCh2aXNfdXNhZ2UsICZtZ3ItPnZpc191c2FnZSk7DQo+ICAgDQo+ICAgCW1l
bS0+bW1fbm9kZSA9IG5vZGVzOw0KPiBAQCAtMzU5LDYgKzM2NSw3IEBAIHN0YXRpYyBpbnQgYW1k
Z3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwNCj4gICAJ
d2hpbGUgKGktLSkNCj4gICAJCWRybV9tbV9yZW1vdmVfbm9kZSgmbm9kZXNbaV0pOw0KPiAgIAlz
cGluX3VubG9jaygmbWdyLT5sb2NrKTsNCj4gKwlhdG9taWM2NF9zdWIobWVtLT5udW1fcGFnZXMg
PDwgUEFHRV9TSElGVCwgJm1nci0+dXNhZ2UpOw0KPiAgIA0KPiAgIAlrdmZyZWUobm9kZXMpOw0K
PiAgIAlyZXR1cm4gciA9PSAtRU5PU1BDID8gMCA6IHI7DQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
