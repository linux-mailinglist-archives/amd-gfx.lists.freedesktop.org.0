Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CB23290E
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 09:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF27E89274;
	Mon,  3 Jun 2019 07:02:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810084.outbound.protection.outlook.com [40.107.81.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905E989274
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 07:02:28 +0000 (UTC)
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (20.178.240.212) by
 MN2PR12MB2864.namprd12.prod.outlook.com (20.179.81.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Mon, 3 Jun 2019 07:02:26 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5%6]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 07:02:26 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/amd/powerplay: add smu message mutex
Thread-Topic: [PATCH] drm/amd/powerplay: add smu message mutex
Thread-Index: AQHVGdpNyariAW2pAEidv/SPPPYxAQ==
Date: Mon, 3 Jun 2019 07:02:26 +0000
Message-ID: <1559545315-25728-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:202:2e::15) To MN2PR12MB3437.namprd12.prod.outlook.com
 (2603:10b6:208:c3::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a6814fd-ab09-4dbe-bc8a-08d6e7f16f3b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2864; 
x-ms-traffictypediagnostic: MN2PR12MB2864:
x-microsoft-antispam-prvs: <MN2PR12MB2864ED806DA477C467EC0658EF140@MN2PR12MB2864.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(39860400002)(136003)(396003)(199004)(189003)(66446008)(64756008)(66556008)(6116002)(66476007)(68736007)(3846002)(478600001)(25786009)(14454004)(4326008)(110136005)(73956011)(66946007)(6512007)(6436002)(8936002)(81156014)(99286004)(71190400001)(71200400001)(15650500001)(2906002)(8676002)(72206003)(81166006)(52116002)(5660300002)(6486002)(386003)(6636002)(6506007)(53936002)(256004)(305945005)(102836004)(86362001)(36756003)(50226002)(14444005)(2501003)(7736002)(316002)(66066001)(2616005)(26005)(186003)(476003)(486006)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2864;
 H:MN2PR12MB3437.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sPGbSFoGkk2syYGAjR7oZVObM0wt9WveNwyLo7/cBpGBj/wQO3Efms0j5wn8Z/n25I6lWV6yJA6hqV53o2h+do6wSL/qAwquImJtGQ4gcVjVroHPRAvM05/ARuivruJ6FD+qFf89VJQOwn+VZxwpXkhFeYuu+0w6Lv1gpI+Txq4VPzUNtQ2Hw9QgAbeQSquSlKVnx3k4vnAZgBmqfOQ5wvV0Sx7e8kUCYa+35XOwMjTf097esIf2V0MTWJQpB7wPACC93Dzd5J2DgY3DSWrOHpREU6KCe8cQIRX7xibIYFNlIb/KlrkCrOS4i7sriXuib9wp+3H3n0cxtXHwPeTIPDcPJiumbkxVKPxso4GGCz6ShBj21w+iqPe2eZnCL+mLGRYNzeX5HdJHjFX9nydYcLaDhTSWD4NDpHe0PdhGXi0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6814fd-ab09-4dbe-bc8a-08d6e7f16f3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 07:02:26.5140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jacxiao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2864
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4YgAi4hVc24dx2vi9UcQGcMUxJx55f/B3HPrtA4zys=;
 b=qBLJRw1KRgxlNrpADZ68ZVkAnbWGqeKE4++qvP4KUCLNbzlhmskRneWYEqe+7ZajhY4vUUbCQGnWFEOW4+juWQ8VD+fcFkVPMfRAXn2xyLwQOC1sAlUwfPh3IN6ZFwwMmGdAZmDxOfKmXQQzWeIiSamFzJ+DwVm2kJrprwqP58M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Xiao@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIHNtdSBtZXNzYWdlIG11dGV4IHByZXZlbnRpbmcgYWdhaW5zdCByYWNlIGNvbmRpdGlvbiBp
c3N1ZS4NCg0KU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4NCi0t
LQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyAgICAgfCAxICsN
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIHwgMSArDQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgICAgICB8IDcgKysrKysr
LQ0KIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCmluZGV4IDMwMjZjN2Uu
LmRiMmJiZWMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRn
cHVfc211LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUu
Yw0KQEAgLTM1MCw2ICszNTAsNyBAQCBzdGF0aWMgaW50IHNtdV9lYXJseV9pbml0KHZvaWQgKmhh
bmRsZSkNCiAJc211LT5hZGV2ID0gYWRldjsNCiAJc211LT5wbV9lbmFibGVkID0gISFhbWRncHVf
ZHBtOw0KIAltdXRleF9pbml0KCZzbXUtPm11dGV4KTsNCisJbXV0ZXhfaW5pdCgmc211LT5tc2df
bXV0ZXgpOw0KIA0KIAlyZXR1cm4gc211X3NldF9mdW5jcyhhZGV2KTsNCiB9DQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgNCmluZGV4IDNlYjFkZTku
LjczNTIzM2UgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
YW1kZ3B1X3NtdS5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1k
Z3B1X3NtdS5oDQpAQCAtMzc0LDYgKzM3NCw3IEBAIHN0cnVjdCBzbXVfY29udGV4dA0KIAljb25z
dCBzdHJ1Y3Qgc211X2Z1bmNzCQkqZnVuY3M7DQogCWNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNz
CSpwcHRfZnVuY3M7DQogCXN0cnVjdCBtdXRleAkJCW11dGV4Ow0KKwlzdHJ1Y3QgbXV0ZXgJCQlt
c2dfbXV0ZXg7DQogCXVpbnQ2NF90IHBvb2xfc2l6ZTsNCiANCiAJc3RydWN0IHNtdV90YWJsZV9j
b250ZXh0CXNtdV90YWJsZTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFf
MC5jDQppbmRleCBkMmVlYjYyLi5kZTczN2EwIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3NtdV92MTFfMC5jDQpAQCAtMTA0LDYgKzEwNCw4IEBAIHN0YXRpYyBpbnQgc211X3Yx
MV8wX3NlbmRfbXNnKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MTZfdCBtc2cpDQogCWlm
IChpbmRleCA8IDApDQogCQlyZXR1cm4gaW5kZXg7DQogDQorCW11dGV4X2xvY2soJnNtdS0+bXNn
X211dGV4KTsNCisNCiAJc211X3YxMV8wX3dhaXRfZm9yX3Jlc3BvbnNlKHNtdSk7DQogDQogCVdS
RUczMl9TT0MxNShNUDEsIDAsIG1tTVAxX1NNTl9DMlBNU0dfOTAsIDApOw0KQEAgLTExMSwxMSAr
MTEzLDExIEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX3NlbmRfbXNnKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LCB1aW50MTZfdCBtc2cpDQogCXNtdV92MTFfMF9zZW5kX21zZ193aXRob3V0X3dhaXRp
bmcoc211LCAodWludDE2X3QpaW5kZXgpOw0KIA0KIAlyZXQgPSBzbXVfdjExXzBfd2FpdF9mb3Jf
cmVzcG9uc2Uoc211KTsNCi0NCiAJaWYgKHJldCkNCiAJCXByX2VycigiRmFpbGVkIHRvIHNlbmQg
bWVzc2FnZSAweCV4LCByZXNwb25zZSAweCV4XG4iLCBpbmRleCwNCiAJCSAgICAgICByZXQpOw0K
IA0KKwltdXRleF91bmxvY2soJnNtdS0+bXNnX211dGV4KTsNCiAJcmV0dXJuIHJldDsNCiANCiB9
DQpAQCAtMTMyLDYgKzEzNCw4IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX3NlbmRfbXNnKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LCB1aW50MTZfdCBtc2cpDQogCWlmIChpbmRleCA8IDApDQogCQly
ZXR1cm4gaW5kZXg7DQogDQorCW11dGV4X2xvY2soJnNtdS0+bXNnX211dGV4KTsNCisNCiAJcmV0
ID0gc211X3YxMV8wX3dhaXRfZm9yX3Jlc3BvbnNlKHNtdSk7DQogCWlmIChyZXQpDQogCQlwcl9l
cnIoIkZhaWxlZCB0byBzZW5kIG1lc3NhZ2UgMHgleCwgcmVzcG9uc2UgMHgleCwgcGFyYW0gMHgl
eFxuIiwNCkBAIC0xNDgsNiArMTUyLDcgQEAgc3RhdGljIGludCBzbXVfdjExXzBfc2VuZF9tc2co
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQxNl90IG1zZykNCiAJCXByX2VycigiRmFpbGVk
IHRvIHNlbmQgbWVzc2FnZSAweCV4LCByZXNwb25zZSAweCV4IHBhcmFtIDB4JXhcbiIsDQogCQkg
ICAgICAgaW5kZXgsIHJldCwgcGFyYW0pOw0KIA0KKwltdXRleF91bmxvY2soJnNtdS0+bXNnX211
dGV4KTsNCiAJcmV0dXJuIHJldDsNCiB9DQogDQotLSANCjEuOS4xDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
