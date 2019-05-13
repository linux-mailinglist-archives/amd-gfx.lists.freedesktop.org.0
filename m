Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF951B303
	for <lists+amd-gfx@lfdr.de>; Mon, 13 May 2019 11:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5839899B5;
	Mon, 13 May 2019 09:37:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780077.outbound.protection.outlook.com [40.107.78.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AFA899B5
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 09:37:51 +0000 (UTC)
Received: from BYAPR12MB3048.namprd12.prod.outlook.com (20.178.53.221) by
 BYAPR12MB3429.namprd12.prod.outlook.com (20.178.196.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Mon, 13 May 2019 09:37:46 +0000
Received: from BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::3cb3:69b4:ec3e:db29]) by BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::3cb3:69b4:ec3e:db29%4]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 09:37:46 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: honor hw limit on fetching metrics data
Thread-Topic: [PATCH] drm/amd/powerplay: honor hw limit on fetching metrics
 data
Thread-Index: AQHVCW9PdaVFn+UIKUiutUSoVnEzkqZozBhA
Date: Mon, 13 May 2019 09:37:46 +0000
Message-ID: <BYAPR12MB3048852721EA09E7913619CBFE0F0@BYAPR12MB3048.namprd12.prod.outlook.com>
References: <20190513093602.17988-1-evan.quan@amd.com>
In-Reply-To: <20190513093602.17988-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d368ad7-935c-4cfa-0e0e-08d6d786a837
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3429; 
x-ms-traffictypediagnostic: BYAPR12MB3429:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB342927B9502A3FB3F87375C2FE0F0@BYAPR12MB3429.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:489;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(376002)(366004)(346002)(136003)(189003)(199004)(13464003)(8936002)(25786009)(316002)(186003)(486006)(73956011)(76116006)(66946007)(446003)(26005)(66446008)(64756008)(66556008)(66476007)(33656002)(476003)(11346002)(81166006)(55016002)(8676002)(81156014)(229853002)(2906002)(7736002)(6306002)(6116002)(9686003)(305945005)(3846002)(6436002)(52536014)(256004)(14444005)(71190400001)(71200400001)(72206003)(478600001)(14454004)(966005)(68736007)(2501003)(74316002)(53936002)(6246003)(86362001)(66066001)(76176011)(6506007)(53546011)(102836004)(4326008)(110136005)(5660300002)(99286004)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3429;
 H:BYAPR12MB3048.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hJxaNG8GoBu9fA2B6WOZyYMyjYf9/sbBo7ROL+qjf/7BIw7/VUMBxqNKXQah5RPAMehacKeQlOPIbAuGmIPZ2GbS6s2ZKoJCyE2MBhoH/rS8zTzFXd8ZO2DPXQiNBSsiUR/cPKLoRDs4Fsa6ZXMyaF9mplKEISTqT43MssU0JE9mE2QAJLUkrl07oacQlifkmlxlLxwiCFIr4sgmCewKkihQObk32cg9MSvpeR0o9nAFW/lohwGMGXgD0X+kafw+LG4piB6VySRcYCIzNW/K2C8zQTib2nVroK3VqAdyXKlIvCPOlCa+F67Jd3aWCWulPhpcBVeeQwffmYsX0T/7iIKsX0Wrffhmn/pzFwTkmk6svbmkvFEB+7C+ZZ1TgRwXlBVMGrVLsBA6+54kcemAgSA2mSsoY06f1vfBiaHiEuA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d368ad7-935c-4cfa-0e0e-08d6d786a837
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 09:37:46.6044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3429
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZlnwmQkZ8gLW7K+fVDWO6uRUwqCbfAWZBS7kVQ7nhs=;
 b=1H6Q0WZFVsV+bKbr/3OVfc+vq81mFpd4yGaWHiKq+RpZ/dDx13dAEKICZyhRqSTUtill9ZVPixtJj0PnUFMUKNVgSNVnTSlfs828TuPRg1P8Bw31FBD1W7g616IRciygAVM/1caJvTM0TtKErCn/TmdfF0Qwfppef3pGW/gx0Lo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgRXZhbiBRdWFuDQpTZW50OiBNb25kYXksIE1heSAx
MywgMjAxOSA1OjM2IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBR
dWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9w
b3dlcnBsYXk6IGhvbm9yIGh3IGxpbWl0IG9uIGZldGNoaW5nIG1ldHJpY3MgZGF0YQ0KDQpbQ0FV
VElPTjogRXh0ZXJuYWwgRW1haWxdDQoNClJlcXVlc3QgdG9vIGZyZXF1ZW50bHkgbWF5IGdldCBj
b3JydXB0IGRhdGEuDQoNCkNoYW5nZS1JZDogSWRlZDIzYWI3ZGQwMTQzNTc1NDc5NjQ0YzUwMzBj
ZWE3MWJkYzUzZmQNClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+
DQotLS0NCiAuLi4vZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggICAgfCAg
MyArKw0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jICAgICB8IDMz
ICsrKysrKysrKysrKysrKysrLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9pbmMvYW1kZ3B1X3NtdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5j
L2FtZGdwdV9zbXUuaA0KaW5kZXggM2E5YzI1Mzc1OWRjLi4yY2I0Y2MyYTgyMDggMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oDQorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oDQpAQCAtNDAz
LDYgKzQwMyw5IEBAIHN0cnVjdCBzbXVfY29udGV4dA0KICAgICAgICB1aW50MzJfdCBkZWZhdWx0
X3Bvd2VyX3Byb2ZpbGVfbW9kZTsNCg0KICAgICAgICB1aW50MzJfdCBzbWNfaWZfdmVyc2lvbjsN
CisNCisgICAgICAgdW5zaWduZWQgbG9uZyBtZXRyaWNzX3RpbWU7DQorICAgICAgIHZvaWQgKm1l
dHJpY3NfdGFibGU7DQogfTsNCg0KIHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHsNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jDQppbmRleCBkYjM4ZTIwNzA3ZjkuLjg3Y2Nj
YTA0NWYzNiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92
MTFfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0K
QEAgLTM2OSw2ICszNjksMTMgQEAgc3RhdGljIGludCBzbXVfdjExXzBfaW5pdF9wb3dlcihzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSkNCiAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCiAg
ICAgICAgc211X3Bvd2VyLT5wb3dlcl9jb250ZXh0X3NpemUgPSBzaXplb2Yoc3RydWN0IHNtdV8x
MV8wX2RwbV9jb250ZXh0KTsNCg0KKyAgICAgICBzbXUtPm1ldHJpY3NfdGltZSA9IDA7DQorICAg
ICAgIHNtdS0+bWV0cmljc190YWJsZSA9IGt6YWxsb2Moc2l6ZW9mKFNtdU1ldHJpY3NfdCksIEdG
UF9LRVJORUwpOw0KKyAgICAgICBpZiAoIXNtdS0+bWV0cmljc190YWJsZSkgew0KKyAgICAgICAg
ICAgICAgIGtmcmVlKHNtdV9wb3dlci0+cG93ZXJfY29udGV4dCk7DQorICAgICAgICAgICAgICAg
cmV0dXJuIC1FTk9NRU07DQorICAgICAgIH0NCisNCiAgICAgICAgcmV0dXJuIDA7DQogfQ0KDQpA
QCAtMzc5LDcgKzM4Niw5IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX2ZpbmlfcG93ZXIoc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUpDQogICAgICAgIGlmICghc211X3Bvd2VyLT5wb3dlcl9jb250ZXh0
IHx8IHNtdV9wb3dlci0+cG93ZXJfY29udGV4dF9zaXplID09IDApDQogICAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7DQoNCisgICAgICAga2ZyZWUoc211LT5tZXRyaWNzX3RhYmxlKTsNCiAg
ICAgICAga2ZyZWUoc211X3Bvd2VyLT5wb3dlcl9jb250ZXh0KTsNCisgICAgICAgc211LT5tZXRy
aWNzX3RhYmxlID0gTlVMTDsNCiAgICAgICAgc211X3Bvd2VyLT5wb3dlcl9jb250ZXh0ID0gTlVM
TDsNCiAgICAgICAgc211X3Bvd2VyLT5wb3dlcl9jb250ZXh0X3NpemUgPSAwOw0KDQpAQCAtMTA5
Myw2ICsxMTAyLDI2IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX3N0YXJ0X3RoZXJtYWxfY29udHJv
bChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkNCiAgICAgICAgcmV0dXJuIHJldDsNCiB9DQoNCitz
dGF0aWMgaW50IHNtdV92MTFfMF9nZXRfbWV0cmljc190YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwNCisgICAgICAgICAgICAgICBTbXVNZXRyaWNzX3QgKm1ldHJpY3NfdGFibGUpIHsNCisg
ICAgICAgaW50IHJldCA9IDA7DQorDQorICAgICAgIGlmICghc211LT5tZXRyaWNzX3RpbWUgfHwg
dGltZV9hZnRlcihqaWZmaWVzLCBzbXUtPm1ldHJpY3NfdGltZSArIEhaIC8gMTAwMCkpIHsNCisg
ICAgICAgICAgICAgICByZXQgPSBzbXVfdXBkYXRlX3RhYmxlKHNtdSwgVEFCTEVfU01VX01FVFJJ
Q1MsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2b2lkICopbWV0cmljc190YWJs
ZSwgZmFsc2UpOw0KKyAgICAgICAgICAgICAgIGlmIChyZXQpIHsNCisgICAgICAgICAgICAgICAg
ICAgICAgIHByX2luZm8oIkZhaWxlZCB0byBleHBvcnQgU01VIG1ldHJpY3MgdGFibGUhXG4iKTsN
CisgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQorICAgICAgICAgICAgICAgfQ0K
KyAgICAgICAgICAgICAgIG1lbWNweShzbXUtPm1ldHJpY3NfdGFibGUsIG1ldHJpY3NfdGFibGUs
IHNpemVvZihTbXVNZXRyaWNzX3QpKTsNCisgICAgICAgICAgICAgICBzbXUtPm1ldHJpY3NfdGlt
ZSA9IGppZmZpZXM7DQorICAgICAgIH0gZWxzZQ0KKyAgICAgICAgICAgICAgIG1lbWNweShtZXRy
aWNzX3RhYmxlLCBzbXUtPm1ldHJpY3NfdGFibGUsIA0KKyBzaXplb2YoU211TWV0cmljc190KSk7
DQorDQorICAgICAgIHJldHVybiByZXQ7DQorfQ0KKw0KIHN0YXRpYyBpbnQgc211X3YxMV8wX2dl
dF9jdXJyZW50X2FjdGl2aXR5X3BlcmNlbnQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsDQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90ICp2
YWx1ZSkgIHsgQEAgLTExMDIsNyArMTEzMSw3IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX2dldF9j
dXJyZW50X2FjdGl2aXR5X3BlcmNlbnQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsDQogICAgICAg
IGlmICghdmFsdWUpDQogICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQoNCi0gICAgICAg
cmV0ID0gc211X3VwZGF0ZV90YWJsZShzbXUsIFRBQkxFX1NNVV9NRVRSSUNTLCAodm9pZCAqKSZt
ZXRyaWNzLCBmYWxzZSk7DQorICAgICAgIHJldCA9IHNtdV92MTFfMF9nZXRfbWV0cmljc190YWJs
ZShzbXUsICZtZXRyaWNzKTsNCiAgICAgICAgaWYgKHJldCkNCiAgICAgICAgICAgICAgICByZXR1
cm4gcmV0Ow0KDQpAQCAtMTEzOSw3ICsxMTY4LDcgQEAgc3RhdGljIGludCBzbXVfdjExXzBfZ2V0
X2dwdV9wb3dlcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgKnZhbHVlKQ0KICAg
ICAgICBpZiAoIXZhbHVlKQ0KICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KDQotICAg
ICAgIHJldCA9IHNtdV91cGRhdGVfdGFibGUoc211LCBUQUJMRV9TTVVfTUVUUklDUywgKHZvaWQg
KikmbWV0cmljcywgZmFsc2UpOw0KKyAgICAgICByZXQgPSBzbXVfdjExXzBfZ2V0X21ldHJpY3Nf
dGFibGUoc211LCAmbWV0cmljcyk7DQogICAgICAgIGlmIChyZXQpDQogICAgICAgICAgICAgICAg
cmV0dXJuIHJldDsNCg0KLS0NCjIuMjEuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
