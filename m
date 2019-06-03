Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE04532F75
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 14:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599E589268;
	Mon,  3 Jun 2019 12:21:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBD889267
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 12:21:48 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3504.namprd12.prod.outlook.com (20.178.244.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.20; Mon, 3 Jun 2019 12:21:46 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::18c6:70fa:9f7e:7018]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::18c6:70fa:9f7e:7018%2]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 12:21:46 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amd/powerplay: add set_power_profile_mode for
 raven1_refresh
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: add set_power_profile_mode for
 raven1_refresh
Thread-Index: AQHVF7JMiZ3oxUPmKEe5Uex267EZgaaJ3kbw
Date: Mon, 3 Jun 2019 12:21:46 +0000
Message-ID: <MN2PR12MB3344844C76C048FE353C32D5E4140@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1559308246-11211-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1559308246-11211-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [116.227.110.81]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74755f86-4368-44f8-c503-08d6e81e0c08
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3504; 
x-ms-traffictypediagnostic: MN2PR12MB3504:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3504DB7877D8E9451CF2ADB6E4140@MN2PR12MB3504.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(13464003)(446003)(110136005)(54906003)(2906002)(6506007)(86362001)(53936002)(53546011)(76176011)(14454004)(102836004)(6246003)(66446008)(64756008)(66556008)(66476007)(478600001)(73956011)(99286004)(7696005)(486006)(25786009)(71200400001)(71190400001)(316002)(966005)(6116002)(3846002)(11346002)(72206003)(476003)(76116006)(66946007)(2501003)(6436002)(7736002)(66066001)(305945005)(33656002)(8936002)(68736007)(186003)(26005)(229853002)(8676002)(81166006)(81156014)(74316002)(6306002)(9686003)(5660300002)(52536014)(256004)(4326008)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3504;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Fq1Y/coUQrIS0Dm4tA0Vs90t56+h6P0uEv8NzEEERnCWh1OGP09UT6QktZWKZsjrnNqlEN0JXCGOCEINcWJ6QRbyORnp6wD1BkHNjUATL/9uXPI+bw3Av195NPYALwZtr2/m9suBQu0cY2wF7JlbeNZLNCNeqytNKDVC2h9GvmcqoTn2ViFwvu9ZbfdGz8fHTjMQvfrRda3RPZbPehQmUIcudNZc9I/yvEjHdT3A160Avnbu5uZOHVxN2FIfhg1rfuSEnK95E2ZxJFefYOBbh0XIn6H7vXFa/g2b3H1Tg+akOy4W5Ro2m873PE/v/z8jUkcnizyhifPVe5Ztp+d168aEUGPAcFW2EijdCIi/3PL5zS5/R83/L61wiPx38xFxfHtWn/cOgbJdQTL7qVS8kPaxAZ69S9UUTpGQnxdC4uA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74755f86-4368-44f8-c503-08d6e81e0c08
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 12:21:46.6329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3504
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQZnV7m7LIqpDxEPjrnm93JvzQ5UFa8s2j8oWmswrU8=;
 b=BcXK8zB9J36A1X91zHrJ2sYNuWHpzZ1V8D5qygpSe8bsCQkLo6dAl1PNbtUGjSyX7oCXSSZPfOsEawM2PWttWBnEYXxIG5AzmKvZ/y7E9nUoTndNZjYgmQdzUw82IswCuReyF7BQpV4PwdVHfpsTZuS/q+8LzWWsi+WY5TxUDg0=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Gui, Jack" <Jack.Gui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IFByaWtlIExpYW5nDQo+IFNlbnQ6IDIw
MTnlubQ15pyIMzHml6UgMjE6MTENCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBI
dWFuZywgUmF5DQo+IDxSYXkuSHVhbmdAYW1kLmNvbT47IEd1aSwgSmFjayA8SmFjay5HdWlAYW1k
LmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDEvMl0gZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBzZXRf
cG93ZXJfcHJvZmlsZV9tb2RlDQo+IGZvciByYXZlbjFfcmVmcmVzaA0KPiANCj4gRnJvbTogQ2hl
bmdtaW5nIEd1aSA8SmFjay5HdWlAYW1kLmNvbT4NCj4gDQo+IGFkZCBnZnhvZmZfc3RhdGVfY2hh
bmdlZF9ieV93b3JrbG9hZCB0byBjb250cm9sIGdmeG9mZiB3aGVuIHNldA0KPiBwb3dlcl9wcm9m
aWxlX21vZGUNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENoZW5nbWluZyBHdWkgPEphY2suR3VpQGFt
ZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvaHdt
Z3IuYyAgICAgICB8ICAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdy
L3NtdTEwX2h3bWdyLmMgfCAzMQ0KPiArKysrKysrKysrKysrKysrKysrKy0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2h3bWdyLmggICAgICAgICB8ICAxICsNCj4gIDMg
ZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9od21nci5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYw0KPiBpbmRleCA2
Y2Q2NDk3Li5mMWQzMjZjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci9od21nci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2h3bWdyL2h3bWdyLmMNCj4gQEAgLTkyLDYgKzkyLDcgQEAgaW50IGh3bWdyX2Vhcmx5X2luaXQo
c3RydWN0IHBwX2h3bWdyICpod21ncikNCj4gIAlod21ncl9zZXRfdXNlcl9zcGVjaWZ5X2NhcHMo
aHdtZ3IpOw0KPiAgCWh3bWdyLT5mYW5fY3RybF9pc19pbl9kZWZhdWx0X21vZGUgPSB0cnVlOw0K
PiAgCWh3bWdyX2luaXRfd29ya2xvYWRfcHJvcml0eShod21ncik7DQo+ICsJaHdtZ3ItPmdmeG9m
Zl9zdGF0ZV9jaGFuZ2VkX2J5X3dvcmtsb2FkID0gZmFsc2U7DQo+IA0KPiAgCXN3aXRjaCAoaHdt
Z3ItPmNoaXBfZmFtaWx5KSB7DQo+ICAJY2FzZSBBTURHUFVfRkFNSUxZX0NJOg0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211MTBfaHdtZ3IuYw0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmMNCj4g
aW5kZXggOWE1OTVmNy4uZTMyYWU5ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaHdtZ3Ivc211MTBfaHdtZ3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5jDQo+IEBAIC0xMjU4LDIxICsxMjU4LDQ2
IEBAIHN0YXRpYyBpbnQNCj4gc211MTBfZ2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZShzdHJ1Y3QgcHBf
aHdtZ3IgKmh3bWdyLCBjaGFyICpidWYpDQo+ICAJcmV0dXJuIHNpemU7DQo+ICB9DQo+IA0KPiAr
c3RhdGljIGJvb2wgc211MTBfaXNfcmF2ZW4xX3JlZnJlc2goc3RydWN0IHBwX2h3bWdyICpod21n
cikgew0KPiArCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gaHdtZ3ItPmFkZXY7DQo+ICsJ
aWYgKChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SQVZFTikgJiYNCj4gKwkgICAgKGFkZXYtPnJl
dl9pZCAhPSAweDE1ZDgpICYmDQo+ICsJICAgIChod21nci0+c211X3ZlcnNpb24gPj0gMHg0MWUy
YikpDQo+ICsJCXJldHVybiB0cnVlOw0KPiArCWVsc2UNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiAr
fQ0KPiArDQo+ICBzdGF0aWMgaW50IHNtdTEwX3NldF9wb3dlcl9wcm9maWxlX21vZGUoc3RydWN0
IHBwX2h3bWdyICpod21nciwgbG9uZw0KPiAqaW5wdXQsIHVpbnQzMl90IHNpemUpICB7DQo+ICAJ
aW50IHdvcmtsb2FkX3R5cGUgPSAwOw0KPiArCWludCByZXN1bHQgPSAwOw0KPiANCj4gIAlpZiAo
aW5wdXRbc2l6ZV0gPiBQUF9TTUNfUE9XRVJfUFJPRklMRV9DT01QVVRFKSB7DQo+ICAJCXByX2Vy
cigiSW52YWxpZCBwb3dlciBwcm9maWxlIG1vZGUgJWxkXG4iLCBpbnB1dFtzaXplXSk7DQo+ICAJ
CXJldHVybiAtRUlOVkFMOw0KPiAgCX0NCj4gLQlod21nci0+cG93ZXJfcHJvZmlsZV9tb2RlID0g
aW5wdXRbc2l6ZV07DQo+ICsJaWYgKGh3bWdyLT5wb3dlcl9wcm9maWxlX21vZGUgPT0gaW5wdXRb
c2l6ZV0pDQo+ICsJCXJldHVybiAwOw0KPiANCj4gIAkvKiBjb252IFBQX1NNQ19QT1dFUl9QUk9G
SUxFKiB0byBXT1JLTE9BRF9QUExJQl8qX0JJVCAqLw0KPiAgCXdvcmtsb2FkX3R5cGUgPQ0KPiAt
CQljb252X3Bvd2VyX3Byb2ZpbGVfdG9fcHBsaWJfd29ya2xvYWQoaHdtZ3ItDQo+ID5wb3dlcl9w
cm9maWxlX21vZGUpOw0KPiAtCXNtdW1fc2VuZF9tc2dfdG9fc21jX3dpdGhfcGFyYW1ldGVyKGh3
bWdyLA0KPiBQUFNNQ19NU0dfQWN0aXZlUHJvY2Vzc05vdGlmeSwNCj4gKwkJY29udl9wb3dlcl9w
cm9maWxlX3RvX3BwbGliX3dvcmtsb2FkKGlucHV0W3NpemVdKTsNCj4gKwlpZiAod29ya2xvYWRf
dHlwZSAmJg0KPiArCSAgICBzbXUxMF9pc19yYXZlbjFfcmVmcmVzaChod21ncikgJiYNCj4gKwkg
ICAgIWh3bWdyLT5nZnhvZmZfc3RhdGVfY2hhbmdlZF9ieV93b3JrbG9hZCkgew0KPiArCQlzbXUx
MF9nZnhfb2ZmX2NvbnRyb2woaHdtZ3IsIGZhbHNlKTsNCj4gKwkJaHdtZ3ItPmdmeG9mZl9zdGF0
ZV9jaGFuZ2VkX2J5X3dvcmtsb2FkID0gdHJ1ZTsNCj4gKwl9DQo+ICsJcmVzdWx0ID0gc211bV9z
ZW5kX21zZ190b19zbWNfd2l0aF9wYXJhbWV0ZXIoaHdtZ3IsDQo+ICtQUFNNQ19NU0dfQWN0aXZl
UHJvY2Vzc05vdGlmeSwNCj4gIAkJCQkJCTEgPDwgd29ya2xvYWRfdHlwZSk7DQo+ICsJaWYgKCFy
ZXN1bHQpDQo+ICsJCWh3bWdyLT5wb3dlcl9wcm9maWxlX21vZGUgPSBpbnB1dFtzaXplXTsNCj4g
KwlpZiAod29ya2xvYWRfdHlwZSAmJiBod21nci0+Z2Z4b2ZmX3N0YXRlX2NoYW5nZWRfYnlfd29y
a2xvYWQpDQo+IHsNCj4gKwkJc211MTBfZ2Z4X29mZl9jb250cm9sKGh3bWdyLCB0cnVlKTsNCj4g
KwkJaHdtZ3ItPmdmeG9mZl9zdGF0ZV9jaGFuZ2VkX2J5X3dvcmtsb2FkID0gZmFsc2U7DQo+ICsJ
fQ0KPiANCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9od21nci5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaW5jL2h3bWdyLmgNCj4gaW5kZXggYmFjM2Q4NS4uYzkyOTk5YSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2h3bWdyLmgNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2h3bWdyLmgNCj4gQEAgLTc4Miw2ICs3ODIs
NyBAQCBzdHJ1Y3QgcHBfaHdtZ3Igew0KPiAgCXVpbnQzMl90IHdvcmtsb2FkX21hc2s7DQo+ICAJ
dWludDMyX3Qgd29ya2xvYWRfcHJvcml0eVtXb3JrbG9hZF9Qb2xpY3lfTWF4XTsNCj4gIAl1aW50
MzJfdCB3b3JrbG9hZF9zZXR0aW5nW1dvcmtsb2FkX1BvbGljeV9NYXhdOw0KPiArCWJvb2wgZ2Z4
b2ZmX3N0YXRlX2NoYW5nZWRfYnlfd29ya2xvYWQ7DQo+ICB9Ow0KPiANCj4gIGludCBod21ncl9l
YXJseV9pbml0KHN0cnVjdCBwcF9od21nciAqaHdtZ3IpOw0KPiAtLQ0KPiAyLjcuNA0KPiANCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdm
eCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
