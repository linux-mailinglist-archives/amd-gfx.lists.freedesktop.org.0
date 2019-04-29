Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432FFDC9A
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2019 09:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31E589174;
	Mon, 29 Apr 2019 07:06:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710056.outbound.protection.outlook.com [40.107.71.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A2A8914A
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 07:06:12 +0000 (UTC)
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2895.namprd12.prod.outlook.com (20.179.82.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Mon, 29 Apr 2019 07:06:11 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::2918:1f51:2768:efc0]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::2918:1f51:2768:efc0%3]) with mapi id 15.20.1835.016; Mon, 29 Apr 2019
 07:06:11 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: add helper function to get smu
 firmware & if version
Thread-Topic: [PATCH] drm/amd/powerplay: add helper function to get smu
 firmware & if version
Thread-Index: AQHU/lnRs1jb37kvJUWPUZZJbNxnR6ZStz1g
Date: Mon, 29 Apr 2019 07:06:10 +0000
Message-ID: <MN2PR12MB3309302519F388563D09C8D3EC390@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190429070419.17517-1-kevin1.wang@amd.com>
In-Reply-To: <20190429070419.17517-1-kevin1.wang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 599a81c1-41a7-4abe-02e7-08d6cc7128fe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2895; 
x-ms-traffictypediagnostic: MN2PR12MB2895:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB289581A14649270ACD0C8E0CEC390@MN2PR12MB2895.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(366004)(39860400002)(136003)(346002)(13464003)(189003)(199004)(4326008)(55016002)(7736002)(305945005)(53936002)(186003)(26005)(33656002)(81156014)(102836004)(478600001)(6436002)(6116002)(8676002)(81166006)(86362001)(6506007)(53546011)(3846002)(6306002)(8936002)(229853002)(2501003)(486006)(52536014)(9686003)(68736007)(476003)(11346002)(5660300002)(25786009)(446003)(256004)(74316002)(6246003)(66066001)(99286004)(97736004)(7696005)(14454004)(966005)(316002)(76176011)(71190400001)(71200400001)(110136005)(2906002)(76116006)(66556008)(66476007)(66946007)(66446008)(72206003)(73956011)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2895;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EfY9aOVQdqexSsEKvuypnHegqxBLi5tdsam1t2CCRcTC0dewC/ZKwazCWeCQKZlwbZl6GY9aeBQhoG0drCkiG0jlK3ZSiXffgbpcdcGLrcAGQPnPkThIAr3RDm5ZtoA2G/WlkCqS6TANglsK4TqcX/KHMbUSX8+dJeGPQLg/7sA2+N1Hkky0cdZVcwu0sxx/SUvSOJ6ngkYjbCuiQpsKovcyXDsEgTuYFWgarcEOBWdfCrAYFgbhmjwMVbS+3VyQVn8VTehtgfpuyzLqoz+M+Kz1kIBw6wNtHT3UAGrfIvEZWYEOwXhxmxwkZjRrYnwSPB/LetBuZnKXVxkK9Kt9ZffQv4tCNjpIcD2bA623uN7H+IFx3H3r6bvwEwZlJEb4OOEJbBZG/AvjxIlnEc1SjPhyQyDhKutFmuuOA+cdzVQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 599a81c1-41a7-4abe-02e7-08d6cc7128fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 07:06:10.9109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2895
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHJ9C8ibzhic4gHaI3grBFmJCKYfBeCtqFK4ah+isx4=;
 b=hHP0FNFVSDu93jV76ngNY7W2DQufvO4ty7QjcY8NpVjdxZnQd/4E3k/MRVwwIPDfEbtBsQUGpOwS6eFSkEAvb/Fu99p7MPuG8NZBmdpLeVIgzo/inYbHynNYncsiC7IHlGFsLDA6TEZXNC1ioKj+zII6fE/eykwn+BcBphH+Dcc=
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IFttYWlsdG86YW1k
LWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZ10gT24gQmVoYWxmDQo+IE9mIFdhbmcs
IEtldmluKFlhbmcpDQo+IFNlbnQ6IE1vbmRheSwgQXByaWwgMjksIDIwMTkgMzowNSBQTQ0KPiBU
bzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5I
dWFuZ0BhbWQuY29tPjsgV2FuZywgS2V2aW4oWWFuZykNCj4gPEtldmluMS5XYW5nQGFtZC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBoZWxwZXIgZnVuY3Rp
b24gdG8gZ2V0IHNtdQ0KPiBmaXJtd2FyZSAmIGlmIHZlcnNpb24NCj4gDQo+IGFkZCB0aGlzIGhl
bHBlciBmdW5jdGlvbiB0byBnZXQgc21jIHZlcnNpb24uDQo+IA0KPiBDaGFuZ2UtSWQ6IEk2YjA2
NDcwY2VmZDEwZmFmY2YwNmRmOGE1ZThjYjAzYmY3OTYyMmMwDQo+IFNpZ25lZC1vZmYtYnk6IEtl
dmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBIdWFuZyBSdWkg
PHJheS5odWFuZ0BhbWQuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jICAgIHwgMzANCj4gKysrKysrKysrKysrKysrKysrKw0KPiAgLi4u
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oICAgIHwgIDEgKw0KPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgICAgIHwgMjMgKysrKysrKysr
LS0tLS0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRn
cHVfc211LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMN
Cj4gaW5kZXggMjVkMmJhMmI5MDE4Li5jMDIxYzA1NzI3ZTggMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCj4gQEAgLTI5LDYgKzI5LDM2IEBADQo+
ICAjaW5jbHVkZSAic211X3YxMV8wLmgiDQo+ICAjaW5jbHVkZSAiYXRvbS5oIg0KPiANCj4gK2lu
dCBzbXVfZ2V0X3NtY192ZXJzaW9uKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCAq
aWZfdmVyc2lvbiwNCj4gK3VpbnQzMl90ICpzbXVfdmVyc2lvbikgew0KPiArCWludCByZXQgPSAw
Ow0KPiArDQo+ICsJaWYgKCFpZl92ZXJzaW9uICYmICFzbXVfdmVyc2lvbikNCj4gKwkJcmV0dXJu
IC1FSU5WQUw7DQo+ICsNCj4gKwlpZiAoaWZfdmVyc2lvbikgew0KPiArCQlyZXQgPSBzbXVfc2Vu
ZF9zbWNfbXNnKHNtdSwNCj4gU01VX01TR19HZXREcml2ZXJJZlZlcnNpb24pOw0KPiArCQlpZiAo
cmV0KQ0KPiArCQkJcmV0dXJuIHJldDsNCj4gKw0KPiArCQlyZXQgPSBzbXVfcmVhZF9zbWNfYXJn
KHNtdSwgaWZfdmVyc2lvbik7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gcmV0Ow0KPiAr
CX0NCj4gKw0KPiArCWlmIChzbXVfdmVyc2lvbikgew0KPiArCQlyZXQgPSBzbXVfc2VuZF9zbWNf
bXNnKHNtdSwNCj4gU01VX01TR19HZXRTbXVWZXJzaW9uKTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJ
CXJldHVybiByZXQ7DQo+ICsNCj4gKwkJcmV0ID0gc211X3JlYWRfc21jX2FyZyhzbXUsIHNtdV92
ZXJzaW9uKTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJCXJldHVybiByZXQ7DQo+ICsJfQ0KPiArDQo+
ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiAgaW50IHNtdV9zZXRfc29mdF9mcmVxX3Jhbmdl
KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtDQo+IHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwN
Cj4gIAkJCSAgICB1aW50MzJfdCBtaW4sIHVpbnQzMl90IG1heCkNCj4gIHsNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oDQo+IGluZGV4IGU5
NThkNGNiNWJhZi4uNDM1NzI3YzhlZTIxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgNCj4gQEAgLTkzMSw0ICs5MzEsNSBAQCBpbnQg
c211X3NldF9zb2Z0X2ZyZXFfcmFuZ2Uoc3RydWN0IHNtdV9jb250ZXh0DQo+ICpzbXUsIGVudW0g
c211X2Nsa190eXBlIGNsa190eXBlLA0KPiAgCQkJICAgIHVpbnQzMl90IG1pbiwgdWludDMyX3Qg
bWF4KTsNCj4gIGludCBzbXVfc2V0X2hhcmRfZnJlcV9yYW5nZShzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwgZW51bQ0KPiBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsDQo+ICAJCQkgICAgdWludDMyX3Qg
bWluLCB1aW50MzJfdCBtYXgpOw0KPiAraW50IHNtdV9nZXRfc21jX3ZlcnNpb24oc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsIHVpbnQzMl90ICppZl92ZXJzaW9uLA0KPiArdWludDMyX3QgKnNtdV92
ZXJzaW9uKTsNCj4gICNlbmRpZg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvc211X3YxMV8wLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9z
bXVfdjExXzAuYw0KPiBpbmRleCBhYjg5Yzc5YjQzNTguLmMyZmUwMGY1MWIyYiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4gQEAgLTI0OSwyMCAr
MjQ5LDI3IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX2NoZWNrX2Z3X3N0YXR1cyhzdHJ1Y3QNCj4g
c211X2NvbnRleHQgKnNtdSkNCj4gDQo+ICBzdGF0aWMgaW50IHNtdV92MTFfMF9jaGVja19md192
ZXJzaW9uKHN0cnVjdCBzbXVfY29udGV4dCAqc211KSAgew0KPiAtCXVpbnQzMl90IHNtdV92ZXJz
aW9uID0gMHhmZjsNCj4gKwl1aW50MzJfdCBpZl92ZXJzaW9uID0gMHhmZiwgc211X3ZlcnNpb24g
PSAweGZmOw0KPiArCXVpbnQxNl90IHNtdV9tYWpvcjsNCj4gKwl1aW50OF90IHNtdV9taW5vciwg
c211X2RlYnVnOw0KPiAgCWludCByZXQgPSAwOw0KPiANCj4gLQlyZXQgPSBzbXVfc2VuZF9zbWNf
bXNnKHNtdSwgU01VX01TR19HZXREcml2ZXJJZlZlcnNpb24pOw0KPiArCXJldCA9IHNtdV9nZXRf
c21jX3ZlcnNpb24oc211LCAmaWZfdmVyc2lvbiwgJnNtdV92ZXJzaW9uKTsNCj4gIAlpZiAocmV0
KQ0KPiAtCQlnb3RvIGVycjsNCj4gKwkJcmV0dXJuIHJldDsNCj4gDQo+IC0JcmV0ID0gc211X3Jl
YWRfc21jX2FyZyhzbXUsICZzbXVfdmVyc2lvbik7DQo+IC0JaWYgKHJldCkNCj4gLQkJZ290byBl
cnI7DQo+ICsJc211X21ham9yID0gKHNtdV92ZXJzaW9uID4+IDE2KSAmIDB4ZmZmZjsNCj4gKwlz
bXVfbWlub3IgPSAoc211X3ZlcnNpb24gPj4gOCkgJiAweGZmOw0KPiArCXNtdV9kZWJ1ZyA9IChz
bXVfdmVyc2lvbiA+PiAwKSAmIDB4ZmY7DQo+ICsNCj4gKwlwcl9pbmZvKCJTTVUgRHJpdmVyIElG
IFZlcnNpb24gPSAweCUwOHgsIFNNVSBGVyBWZXJzaW9uID0gMHglMDh4DQo+ICglZC4lZC4lZClc
biIsDQo+ICsJCWlmX3ZlcnNpb24sIHNtdV92ZXJzaW9uLCBzbXVfbWFqb3IsIHNtdV9taW5vciwN
Cj4gc211X2RlYnVnKTsNCj4gDQo+IC0JaWYgKHNtdV92ZXJzaW9uICE9IHNtdS0+c21jX2lmX3Zl
cnNpb24pDQo+ICsJaWYgKGlmX3ZlcnNpb24gIT0gc211LT5zbWNfaWZfdmVyc2lvbikgew0KPiAr
CQlwcl9lcnIoIlNNVSBkcml2ZXIgaWYgdmVyc2lvbiBub3QgbWF0Y2hlZFxuIik7DQo+ICAJCXJl
dCA9IC1FSU5WQUw7DQo+IC1lcnI6DQo+ICsJfQ0KPiArDQo+ICAJcmV0dXJuIHJldDsNCj4gIH0N
Cj4gDQo+IC0tDQo+IDIuMjEuMA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
