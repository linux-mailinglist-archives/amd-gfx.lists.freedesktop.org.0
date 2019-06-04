Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9425533E75
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 07:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9857891B4;
	Tue,  4 Jun 2019 05:37:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710053.outbound.protection.outlook.com [40.107.71.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C152F891B4
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 05:37:40 +0000 (UTC)
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3583.namprd12.prod.outlook.com (20.178.241.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 05:37:39 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::5558:8fd7:ffbc:262b]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::5558:8fd7:ffbc:262b%4]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 05:37:39 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Xiao, Jack" <Jack.Xiao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH] drm/amd/powerplay: add smu message mutex
Thread-Topic: [PATCH] drm/amd/powerplay: add smu message mutex
Thread-Index: AQHVGdpNyariAW2pAEidv/SPPPYxAaaK4INA
Date: Tue, 4 Jun 2019 05:37:38 +0000
Message-ID: <MN2PR12MB3309583D02AAF94151906292EC150@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1559545315-25728-1-git-send-email-Jack.Xiao@amd.com>
In-Reply-To: <1559545315-25728-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e2bc288-5b74-4458-9a84-08d6e8aec1b9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3583; 
x-ms-traffictypediagnostic: MN2PR12MB3583:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB35830D864C871D3260A1E92FEC150@MN2PR12MB3583.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(136003)(346002)(39860400002)(199004)(13464003)(189003)(14454004)(15650500001)(966005)(6116002)(3846002)(9686003)(6636002)(229853002)(74316002)(6436002)(6306002)(6246003)(71200400001)(4326008)(72206003)(478600001)(71190400001)(68736007)(53936002)(81156014)(7736002)(316002)(86362001)(6506007)(53546011)(25786009)(14444005)(52536014)(256004)(55016002)(8936002)(81166006)(5660300002)(7696005)(2906002)(102836004)(8676002)(305945005)(2501003)(33656002)(186003)(486006)(99286004)(26005)(76176011)(446003)(66066001)(64756008)(54906003)(476003)(66476007)(66946007)(66556008)(11346002)(73956011)(66446008)(110136005)(76116006)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3583;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tuNZkiQ/MnSDMPoZ7NfBrE+Z5w364FUKwl8eczgfVV4XI0nfwLTDCeQ5JYVmSZ2PBiPjQcqkwWB1rTZTsqPiV/fk2Tfckh7xGGprBZDAHg+Gv+tpHGZasa4BvPeWZNypKhKlrinJl8JCbc/ijYBy4O6RSFtBSA9afMoHeJ55b39C4wcsj8KHgvBo50EJl1/wW0XHfiZksD1ob9D0xQjO/FkB3m/GBeZAP5H1A672J5ZMUOs6R8q2t57We9E+kHdcBrbDPDl8gZSgmTaDyCAQGu8IW8ct3g7FOZcA/6SwOqf5LymnJPicA7AtaSIRvec5M9P1P9bfjJCN72nWaSZ2HBnhyYAGlAGhTqSTesrnyQTkSgMdpwgpJAGUI1PgF4A5kWpQgqO+366AJRlK/Sb9KBOQkVftkzY6t9Lo3/82/Mw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2bc288-5b74-4458-9a84-08d6e8aec1b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 05:37:38.8955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3583
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kySkCxGqH1RCzybDJ/WBenB2/Cz6uLtoiG/GypIG90c=;
 b=A1ITV5hDboqYjVxIcIpBphmEAcg+5A7FCV97vGiJRaTy/a9qy8aCZhV/4PrSZtqeKc1T8PjW6PZtaBtomdIjlvX/bGZd9ge1GZgJ1y5V1Ldw49aCSdqyp3n5qqwrBI0GqLowM7jWAzrYzR6q8vuiofmL0tSsdY0dYFLrdigu47I=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Gao, Likun" <Likun.Gao@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Gui, Jack" <Jack.Gui@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgWGlhbywNCj4gSmFjaw0K
PiBTZW50OiBNb25kYXksIEp1bmUgMDMsIDIwMTkgMzowMiBQTQ0KPiBUbzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IERldWNoZXIsIEFsZXhhbmRlcg0KPiA8QWxleGFuZGVyLkRldWNo
ZXJAYW1kLmNvbT47IFpoYW5nLCBIYXdraW5nDQo+IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQo+
IENjOiBYaWFvLCBKYWNrIDxKYWNrLlhpYW9AYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBk
cm0vYW1kL3Bvd2VycGxheTogYWRkIHNtdSBtZXNzYWdlIG11dGV4DQo+IA0KPiBBZGQgc211IG1l
c3NhZ2UgbXV0ZXggcHJldmVudGluZyBhZ2FpbnN0IHJhY2UgY29uZGl0aW9uIGlzc3VlLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgICAgIHwgMSArDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIHwgMSArDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyAgICAgIHwgNyArKysr
KystDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KPiBp
bmRleCAzMDI2YzdlLi5kYjJiYmVjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hbWRncHVfc211LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jDQo+IEBAIC0zNTAsNiArMzUwLDcgQEAgc3RhdGljIGludCBzbXVf
ZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpDQo+ICAJc211LT5hZGV2ID0gYWRldjsNCj4gIAlzbXUt
PnBtX2VuYWJsZWQgPSAhIWFtZGdwdV9kcG07DQo+ICAJbXV0ZXhfaW5pdCgmc211LT5tdXRleCk7
DQo+ICsJbXV0ZXhfaW5pdCgmc211LT5tc2dfbXV0ZXgpOw0KDQpBcyB0YWxrZWQgd2l0aCB5b3Us
IHdlIG5lZWQgdXNlIHNtdS0+bXV0ZXggdG8gcHJvdGVjdCB0aGUgY29udGV4dCBpbiB0aGUgdGhy
ZWFkIGluc3RlYWQgb2YgaW50cm9kdWNpbmcgdGhlIHNwZWNpZmljIG11dGV4IG9mIG1lc3NhZ2Vz
LiBCZWNhdXNlIG1zZ19tdXRleCBjYW5ub3QgcHJvdGVjdCB0aGUgY2FzZSBvZiBtdWx0aS1tZXNz
YWdlIHBhaXJpbmcuIEFuZCB5ZXMsIHRoaXMgaXMgdGhlIGtleSBpc3N1ZSBvZiBzd1NNVSBzbyBm
YXIuDQoNCisgTGludXggcG93ZXIgZm9sa3MsIA0KS2V2aW4sIGNvdWxkIHlvdSBwbGVhc2UgdXNl
IHRoZSBzbXUtPm11dGV4IHRvIHByb3RlY3QgYmVsb3cgY2FsbGJhY2tzIHdoaWNoIHdpbGwgYmUg
Y2FsbGVkIGZyb20gZ3B1X2luZm8gaW9jdGwuIA0KDQphbWRncHVfZHBtX2dldF9zY2xrDQphbWRn
cHVfZHBtX2dldF9tY2xrDQoNCkFuZCB3ZSBuZWVkIHNtdS0+bXV0ZXggdG8gcHJvdGVjdCB0aGUg
c211X2RwbV9zZXRfdXZkX2VuYWJsZS8gc211X2RwbV9zZXRfdmNlX2VuYWJsZSBhcyB3ZWxsLCBi
ZWNhdXNlIHRoZXkgd2lsbCBiZSBjYWxsZWQgZHVyaW5nIFZDTiBjb21tYW5kIHN1Ym1pc3Npb25z
LiBXZSBzaG91bGQgbG9vayBvdmVyIGFsbCBpb2N0bC9zeXNmcyBpbnRlcmZhY2UgaW4gdGhlIGRy
aXZlciwgdGhleSBhbGwgbmVlZCB0aGUgbXV0ZXguDQoNClRoYW5rcywNClJheQ0KDQo+IA0KPiAg
CXJldHVybiBzbXVfc2V0X2Z1bmNzKGFkZXYpOw0KPiAgfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaA0KPiBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgNCj4gaW5kZXggM2ViMWRlOS4uNzM1
MjMzZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2Ft
ZGdwdV9zbXUuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1k
Z3B1X3NtdS5oDQo+IEBAIC0zNzQsNiArMzc0LDcgQEAgc3RydWN0IHNtdV9jb250ZXh0DQo+ICAJ
Y29uc3Qgc3RydWN0IHNtdV9mdW5jcwkJKmZ1bmNzOw0KPiAgCWNvbnN0IHN0cnVjdCBwcHRhYmxl
X2Z1bmNzCSpwcHRfZnVuY3M7DQo+ICAJc3RydWN0IG11dGV4CQkJbXV0ZXg7DQo+ICsJc3RydWN0
IG11dGV4CQkJbXNnX211dGV4Ow0KPiAgCXVpbnQ2NF90IHBvb2xfc2l6ZTsNCj4gDQo+ICAJc3Ry
dWN0IHNtdV90YWJsZV9jb250ZXh0CXNtdV90YWJsZTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4gaW5kZXggZDJlZWI2Mi4uZGU3MzdhMCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4gQEAgLTEwNCw2
ICsxMDQsOCBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9zZW5kX21zZyhzdHJ1Y3Qgc211X2NvbnRl
eHQNCj4gKnNtdSwgdWludDE2X3QgbXNnKQ0KPiAgCWlmIChpbmRleCA8IDApDQo+ICAJCXJldHVy
biBpbmRleDsNCj4gDQo+ICsJbXV0ZXhfbG9jaygmc211LT5tc2dfbXV0ZXgpOw0KPiArDQo+ICAJ
c211X3YxMV8wX3dhaXRfZm9yX3Jlc3BvbnNlKHNtdSk7DQo+IA0KPiAgCVdSRUczMl9TT0MxNShN
UDEsIDAsIG1tTVAxX1NNTl9DMlBNU0dfOTAsIDApOyBAQCAtDQo+IDExMSwxMSArMTEzLDExIEBA
IHN0YXRpYyBpbnQgc211X3YxMV8wX3NlbmRfbXNnKHN0cnVjdCBzbXVfY29udGV4dA0KPiAqc211
LCB1aW50MTZfdCBtc2cpDQo+ICAJc211X3YxMV8wX3NlbmRfbXNnX3dpdGhvdXRfd2FpdGluZyhz
bXUsICh1aW50MTZfdClpbmRleCk7DQo+IA0KPiAgCXJldCA9IHNtdV92MTFfMF93YWl0X2Zvcl9y
ZXNwb25zZShzbXUpOw0KPiAtDQo+ICAJaWYgKHJldCkNCj4gIAkJcHJfZXJyKCJGYWlsZWQgdG8g
c2VuZCBtZXNzYWdlIDB4JXgsIHJlc3BvbnNlIDB4JXhcbiIsDQo+IGluZGV4LA0KPiAgCQkgICAg
ICAgcmV0KTsNCj4gDQo+ICsJbXV0ZXhfdW5sb2NrKCZzbXUtPm1zZ19tdXRleCk7DQo+ICAJcmV0
dXJuIHJldDsNCj4gDQo+ICB9DQo+IEBAIC0xMzIsNiArMTM0LDggQEAgc3RhdGljIGludCBzbXVf
djExXzBfc2VuZF9tc2coc3RydWN0IHNtdV9jb250ZXh0DQo+ICpzbXUsIHVpbnQxNl90IG1zZykN
Cj4gIAlpZiAoaW5kZXggPCAwKQ0KPiAgCQlyZXR1cm4gaW5kZXg7DQo+IA0KPiArCW11dGV4X2xv
Y2soJnNtdS0+bXNnX211dGV4KTsNCj4gKw0KPiAgCXJldCA9IHNtdV92MTFfMF93YWl0X2Zvcl9y
ZXNwb25zZShzbXUpOw0KPiAgCWlmIChyZXQpDQo+ICAJCXByX2VycigiRmFpbGVkIHRvIHNlbmQg
bWVzc2FnZSAweCV4LCByZXNwb25zZSAweCV4LCBwYXJhbQ0KPiAweCV4XG4iLCBAQCAtMTQ4LDYg
KzE1Miw3IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX3NlbmRfbXNnKHN0cnVjdA0KPiBzbXVfY29u
dGV4dCAqc211LCB1aW50MTZfdCBtc2cpDQo+ICAJCXByX2VycigiRmFpbGVkIHRvIHNlbmQgbWVz
c2FnZSAweCV4LCByZXNwb25zZSAweCV4IHBhcmFtDQo+IDB4JXhcbiIsDQo+ICAJCSAgICAgICBp
bmRleCwgcmV0LCBwYXJhbSk7DQo+IA0KPiArCW11dGV4X3VubG9jaygmc211LT5tc2dfbXV0ZXgp
Ow0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+IA0KPiAtLQ0KPiAxLjkuMQ0KPiANCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWls
aW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
