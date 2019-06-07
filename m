Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91B339603
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 21:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F85889E15;
	Fri,  7 Jun 2019 19:42:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820054.outbound.protection.outlook.com [40.107.82.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4980289E15
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 19:42:09 +0000 (UTC)
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com (10.172.77.148) by
 CY4PR1201MB0103.namprd12.prod.outlook.com (10.172.75.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.20; Fri, 7 Jun 2019 19:42:07 +0000
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9]) by CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9%8]) with mapi id 15.20.1943.018; Fri, 7 Jun 2019
 19:42:07 +0000
From: James Zhu <jamesz@amd.com>
To: "Zhu, James" <James.Zhu@amd.com>, Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Add GDS clearing workaround in later init for
 gfx9
Thread-Topic: [PATCH] drm/amdgpu: Add GDS clearing workaround in later init
 for gfx9
Thread-Index: AQHVHU9fi+Ptg8J/EEmosJ0MSRUp9KaQf4CAgAAP5oCAAAgmgA==
Date: Fri, 7 Jun 2019 19:42:07 +0000
Message-ID: <65266293-ac7a-c3ef-752b-1691299b1f28@amd.com>
References: <1559925472-20077-1-git-send-email-James.Zhu@amd.com>
 <CADnq5_NBWcUtXsBbQP5uBvaOFgWXw3Lhj=ZOisVyTctqZph=xQ@mail.gmail.com>
 <19203faa-970e-732b-a0e0-d2d1fe69ce30@amd.com>
In-Reply-To: <19203faa-970e-732b-a0e0-d2d1fe69ce30@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::45)
 To CY4PR1201MB0102.namprd12.prod.outlook.com
 (2603:10b6:910:1b::20)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bda81153-d915-4fa9-1100-08d6eb803972
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0103; 
x-ms-traffictypediagnostic: CY4PR1201MB0103:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR1201MB0103FDEF01BEE1852048F6E0E4100@CY4PR1201MB0103.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(366004)(39860400002)(346002)(136003)(199004)(189003)(486006)(4326008)(476003)(6246003)(81156014)(8936002)(8676002)(2906002)(14454004)(64756008)(6116002)(66476007)(36756003)(102836004)(14444005)(256004)(81166006)(73956011)(5660300002)(386003)(66556008)(53546011)(31696002)(26005)(6506007)(3846002)(66446008)(31686004)(110136005)(316002)(305945005)(7736002)(76176011)(52116002)(186003)(6436002)(99286004)(53936002)(11346002)(478600001)(446003)(2616005)(71190400001)(71200400001)(25786009)(6306002)(54906003)(229853002)(966005)(66066001)(72206003)(6486002)(68736007)(6512007)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0103;
 H:CY4PR1201MB0102.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fLsYTVPlfMI7gtiicIKvYU29HUfy2up+jPlf+E7A61NJfF4ujHXxJbu+zSQJdzPyh0PLDAxHLnf/XMZFdDQRC911ByRuWMO3fRDRyDeJnGZKO8ME3l6s+92iyTFyZRBZtHz0EnFglTTW/T4su6mBxBNuht29AvndA5BMhI4aTBnAYMS33menbrELDPDy1qmxJcGIzC4IXd72vfoUW78KaijO2/frRtq6YsLEhhPIdnJOuGHDnzji0KmkOo3B9r9EwaKy2LBrxib83NrRsABySYTT416X4ZaTcevn6UEaBF9pJzHnX26yuWp0P+biY1Pn2fP92HZX3jMshx5T6K462x9pY7JLHGo1vlQH9eZlO/DXYWSEcwE/i4T8uCCuHgTy/Z7U62yrgyJ1CHKXAPr1TXhK18rMWB8F2JVHP3IHeY8=
Content-ID: <0EB49C78926DAF46A70D74A158A331CD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda81153-d915-4fa9-1100-08d6eb803972
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 19:42:07.5535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jamesz@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0103
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0i+ceBMmXoKmGTjo6wM8l8w2TX/h+a75QJx3ZFxkTCg=;
 b=a7lQgTnx/yWj3PxMMXbXMyxVwV2hbsYM0BFcwFgetcBDjyE97EXmATIdEO7doexl7jUTPbJfpB5X3/KrayAqwLOcQMSH7ydjYAM7PZQmPJ4jgUU2UYJCvUSb8BO/XhJBmMPTDI+TYrJEFZTYhSWfXtkJwzailgEc8Ss8mNGWWFg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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
Cc: "Shamis,
 Leonid" <Leonid.Shamis@amd.com>, "Gabra, Maroun" <Maroun.Gabra@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiAyMDE5LTA2LTA3IDM6MTIgcC5tLiwgWmh1LCBKYW1lcyB3cm90ZToNCj4gT24gMjAxOS0w
Ni0wNyAyOjE2IHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4+IE9uIEZyaSwgSnVuIDcsIDIw
MTkgYXQgMTI6MzggUE0gWmh1LCBKYW1lcyA8SmFtZXMuWmh1QGFtZC5jb20+IHdyb3RlOg0KPj4+
IFNpbmNlIEhhcmR3YXJlIGJ1ZywgR0RTIGV4aXN0IEVDQyBlcnJvciBhZnRlciBjb2xkIGJvb3Qg
dXAsDQo+Pj4gYWRkaW5nIEdEUyBjbGVhcmluZyB3b3JrYXJvdW5kIGluIGxhdGVyIGluaXQgZm9y
IGdmeDkuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBaaHUgPEphbWVzLlpodUBhbWQu
Y29tPg0KPj4+IC0tLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8w
LmMgfCA0OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92OV8wLmMNCj4+PiBpbmRleCA3NjcyMmZjLi44MWY2YmE4IDEwMDY0NA0KPj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+Pj4gQEAgLTM2MzQsNiArMzYzNCw1
MCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19lbnRyeSBzZWNfZGVkX2NvdW50ZXJf
cmVnaXN0ZXJzW10gPSB7DQo+Pj4gICAgICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1tU1FD
X0VEQ19DTlQzKSwgMCwgNCwgNn0sDQo+Pj4gICAgfTsNCj4+Pg0KPj4+ICsNCj4+PiArc3RhdGlj
IGludCBnZnhfdjlfMF9kb19lZGNfZ2RzX3dvcmthcm91bmRzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQ0KPj4+ICt7DQo+Pj4gKyAgICAgICBzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSAm
YWRldi0+Z2Z4LmNvbXB1dGVfcmluZ1swXTsNCj4+PiArICAgICAgIGludCByOw0KPj4+ICsNCj4+
PiArICAgICAgIHIgPSBhbWRncHVfcmluZ19hbGxvYyhyaW5nLCAxNyk7DQo+Pj4gKyAgICAgICBp
ZiAocikgew0KPj4+ICsgICAgICAgICAgICAgICBEUk1fRVJST1IoImFtZGdwdTogR0RTIHdvcmth
cm91bmRzIGZhaWxlZCB0byBsb2NrIHJpbmcgJXMgKCVkKS5cbiIsDQo+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcmluZy0+bmFtZSwgcik7DQo+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiBy
Ow0KPj4+ICsgICAgICAgfQ0KPj4+ICsNCj4+PiArICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJp
bmcsIFBBQ0tFVDMoUEFDS0VUM19XUklURV9EQVRBLCAzKSk7DQo+Pj4gKyAgICAgICBhbWRncHVf
cmluZ193cml0ZShyaW5nLCBXUklURV9EQVRBX0VOR0lORV9TRUwoMCkgfA0KPj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgIFdSSVRFX0RBVEFfRFNUX1NFTCgwKSk7DQo+Pj4gKyAgICAgICBh
bWRncHVfcmluZ193cml0ZShyaW5nLCBTT0MxNV9SRUdfT0ZGU0VUKEdDLCAwLCBtbUdEU19WTUlE
MF9TSVpFKSk7DQo+Pj4gKyAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCj4+PiAr
ICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDB4MTAwMDApOw0KPj4gaGFyZGNvZGVkIHNp
emUsIHBsZWFzZSB1c2UgdGhlIHNpemUgZnJvbSB0aGUgZHJpdmVyLg0KPj4NCj4+PiArDQo+Pj4g
KyAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQzKFBBQ0tFVDNfRE1BX0RBVEEs
IDUpKTsNCj4+PiArICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIChQQUNLRVQzX0RNQV9E
QVRBX0NQX1NZTkMgfA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFDS0VU
M19ETUFfREFUQV9EU1RfU0VMKDEpIHwNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFBBQ0tFVDNfRE1BX0RBVEFfU1JDX1NFTCgyKSB8DQo+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBQQUNLRVQzX0RNQV9EQVRBX0VOR0lORSgwKSkpOw0KPj4+ICsgICAgICAg
YW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMCk7DQo+Pj4gKyAgICAgICBhbWRncHVfcmluZ193cml0
ZShyaW5nLCAwKTsNCj4+PiArICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDApOw0KPj4+
ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMCk7DQo+Pj4gKyAgICAgICBhbWRncHVf
cmluZ193cml0ZShyaW5nLCBQQUNLRVQzX0RNQV9EQVRBX0NNRF9SQVdfV0FJVCB8IDB4MTAwMDAp
Ow0KPj4gSW5zdGVhZCBvZiBoYXJkY29kaW5nIHRoZSBzaXplLCBjYW4geW91IHVzZSB0aGUgZ2Rz
IHNpemUgZnJvbSB0aGUNCj4+IGRyaXZlciAoYWRldi0+Z2RzLmdkc19zaXplKS4NCj4gSGkgQWxl
eCwNCj4NCj4gRG8geW91IG1lYW4gYWRldi0+Z2RzLm1lbS50b3RhbF9zaXplPw0KPg0KPiBCdXQg
SSBzZWUgYmVsb3cgb3BlcmF0aW9uIGluIGdmeF92OV8wX25nZ19pbml0Lg0KPg0KPiBhZGV2LT5n
ZHMubWVtLnRvdGFsX3NpemUgLT0gLi4uLg0KPg0KPiBPciB5b3Ugd2FudCBtZSB0byBhZGQgZ2Rz
X3NpemUgaW4gc3RydWN0IGFtZGdwdV9nZHM/DQo+DQo+IEphbWVzDQoNClllYWgsIFRoZSBhbWQt
c3RhZ2luZy1kcm0tbmV4dCBicmFuY2ggaGFzIGFkZXYtPmdkcy5nZHNfc2l6ZS4NCg0KSmFtZXMN
Cg0KPg0KPj4gV2l0aCB0aGF0IGZpeGVkOg0KPj4gUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4+DQo+Pj4gKw0KPj4+ICsgICAgICAgYW1kZ3B1
X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUMyhQQUNLRVQzX1dSSVRFX0RBVEEsIDMpKTsNCj4+PiAr
ICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFdSSVRFX0RBVEFfRU5HSU5FX1NFTCgwKSB8
DQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBXUklURV9EQVRBX0RTVF9TRUwo
MCkpOw0KPj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgU09DMTVfUkVHX09GRlNF
VChHQywgMCwgbW1HRFNfVk1JRDBfU0laRSkpOw0KPj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3Jp
dGUocmluZywgMCk7DQo+Pj4gKyAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCAweDApOw0K
Pj4+ICsNCj4+PiArICAgICAgIGFtZGdwdV9yaW5nX2NvbW1pdChyaW5nKTsNCj4+PiArDQo+Pj4g
KyAgICAgICByZXR1cm4gMDsNCj4+PiArfQ0KPj4+ICsNCj4+PiArDQo+Pj4gICAgc3RhdGljIGlu
dCBnZnhfdjlfMF9kb19lZGNfZ3ByX3dvcmthcm91bmRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQ0KPj4+ICAgIHsNCj4+PiAgICAgICAgICAgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0g
JmFkZXYtPmdmeC5jb21wdXRlX3JpbmdbMF07DQo+Pj4gQEAgLTM4MTAsNiArMzg1NCwxMCBAQCBz
dGF0aWMgaW50IGdmeF92OV8wX2VjY19sYXRlX2luaXQodm9pZCAqaGFuZGxlKQ0KPj4+ICAgICAg
ICAgICAgICAgICAgIHJldHVybiAwOw0KPj4+ICAgICAgICAgICB9DQo+Pj4NCj4+PiArICAgICAg
IHIgPSBnZnhfdjlfMF9kb19lZGNfZ2RzX3dvcmthcm91bmRzKGFkZXYpOw0KPj4+ICsgICAgICAg
aWYgKHIpDQo+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiByOw0KPj4+ICsNCj4+PiAgICAgICAg
ICAgLyogcmVxdWlyZXMgSUJzIHNvIGRvIGluIGxhdGUgaW5pdCBhZnRlciBJQiBwb29sIGlzIGlu
aXRpYWxpemVkICovDQo+Pj4gICAgICAgICAgIHIgPSBnZnhfdjlfMF9kb19lZGNfZ3ByX3dvcmth
cm91bmRzKGFkZXYpOw0KPj4+ICAgICAgICAgICBpZiAocikNCj4+PiAtLQ0KPj4+IDIuNy40DQo+
Pj4NCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
Pj4+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
