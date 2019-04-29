Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FA9DC95
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2019 09:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA97890FE;
	Mon, 29 Apr 2019 07:04:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790071.outbound.protection.outlook.com [40.107.79.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCEE890FE
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 07:04:45 +0000 (UTC)
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3567.namprd12.prod.outlook.com (20.178.242.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Mon, 29 Apr 2019 07:04:42 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::450b:3fdb:3b6e:58df]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::450b:3fdb:3b6e:58df%2]) with mapi id 15.20.1835.018; Mon, 29 Apr 2019
 07:04:42 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: add helper function to get smu firmware &
 if version
Thread-Topic: [PATCH] drm/amd/powerplay: add helper function to get smu
 firmware & if version
Thread-Index: AQHU/lnRs1jb37kvJUWPUZZJbNxnRw==
Date: Mon, 29 Apr 2019 07:04:42 +0000
Message-ID: <20190429070419.17517-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0048.apcprd04.prod.outlook.com
 (2603:1096:202:14::16) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa0ebec5-2be7-4fb0-c82a-08d6cc70f420
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3567; 
x-ms-traffictypediagnostic: MN2PR12MB3567:
x-microsoft-antispam-prvs: <MN2PR12MB3567BF584BE30ED6AEB7B1FBA2390@MN2PR12MB3567.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(366004)(39860400002)(136003)(189003)(199004)(26005)(64756008)(5640700003)(66556008)(66946007)(72206003)(73956011)(66446008)(81156014)(81166006)(8676002)(86362001)(97736004)(66476007)(1076003)(14454004)(36756003)(6916009)(6486002)(71200400001)(71190400001)(6436002)(6506007)(386003)(50226002)(102836004)(486006)(305945005)(66066001)(68736007)(8936002)(52116002)(25786009)(99286004)(54906003)(7736002)(476003)(186003)(6116002)(3846002)(53936002)(478600001)(2906002)(5660300002)(4326008)(2351001)(256004)(6512007)(316002)(2616005)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3567;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YjFfXW9r8nVW6R/t1WYjEPTknEK6AbJFEUyp8inqWFzvvPZI4vjTXl+rIV51pS3Wi95bAMw93g9aZECK1WvpG9aRhgshmwe1oRR+bhrCKhHsEqzbRhMFKUUxc96NEmvp+wH4BsDYO3rhVdXaCE8+XVe5xOjJVc3e6CurC8WJvEFTAiXRMd4qYNKp0Af/M62tSvQ24LGu7n64hGWpdomYYGaqGaPx+AOuR7i1Uu0NPUYrmR/yScJvKTepQ4PgIIABte7LuXWlHwRe8NVkqLA8TkhRqS9QglDnha59J0ERxysXwD3HucOE0wrK8VFX/Bi1IJRNPCKseRi8um2hbHZWZ15N0SIXU6PV1H2uy5D2vv4XRm2azY/MEo+pkyY0A8Hu9i4YeDpvRnCLsIE2Fzointb9nzZX0GwJaouQEs1I28Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0ebec5-2be7-4fb0-c82a-08d6cc70f420
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 07:04:42.7869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3567
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tX0xwNp5dfnhusR2XdEYuJVhhb4oEI/R9vR4Kilpgs=;
 b=Ehc4qrED+++yMl2+Xsjz9ekD4HKc65ErmCHeUACGOpreG8ThC4iy6uhZi5zV2SghTYFmoP0rnTslQjkKUnos//b0a9BPQ12TAh+q1aSeULuZtBjZdUzIppqZPTGrXnRV/QaoT6r0yvI3SPIlF5KDzO47ukA8eWE3kt6kNoy+lLA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWRkIHRoaXMgaGVscGVyIGZ1bmN0aW9uIHRvIGdldCBzbWMgdmVyc2lvbi4NCg0KQ2hhbmdlLUlk
OiBJNmIwNjQ3MGNlZmQxMGZhZmNmMDZkZjhhNWU4Y2IwM2JmNzk2MjJjMA0KU2lnbmVkLW9mZi1i
eTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyAgICB8IDMwICsrKysrKysrKysrKysrKysrKysN
CiAuLi4vZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggICAgfCAgMSArDQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgICAgIHwgMjMgKysrKysr
KysrLS0tLS0NCiAzIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVf
c211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCmluZGV4
IDI1ZDJiYTJiOTAxOC4uYzAyMWMwNTcyN2U4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hbWRncHVfc211LmMNCkBAIC0yOSw2ICsyOSwzNiBAQA0KICNpbmNsdWRlICJzbXVf
djExXzAuaCINCiAjaW5jbHVkZSAiYXRvbS5oIg0KIA0KK2ludCBzbXVfZ2V0X3NtY192ZXJzaW9u
KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCAqaWZfdmVyc2lvbiwgdWludDMyX3Qg
KnNtdV92ZXJzaW9uKQ0KK3sNCisJaW50IHJldCA9IDA7DQorDQorCWlmICghaWZfdmVyc2lvbiAm
JiAhc211X3ZlcnNpb24pDQorCQlyZXR1cm4gLUVJTlZBTDsNCisNCisJaWYgKGlmX3ZlcnNpb24p
IHsNCisJCXJldCA9IHNtdV9zZW5kX3NtY19tc2coc211LCBTTVVfTVNHX0dldERyaXZlcklmVmVy
c2lvbik7DQorCQlpZiAocmV0KQ0KKwkJCXJldHVybiByZXQ7DQorDQorCQlyZXQgPSBzbXVfcmVh
ZF9zbWNfYXJnKHNtdSwgaWZfdmVyc2lvbik7DQorCQlpZiAocmV0KQ0KKwkJCXJldHVybiByZXQ7
DQorCX0NCisNCisJaWYgKHNtdV92ZXJzaW9uKSB7DQorCQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNn
KHNtdSwgU01VX01TR19HZXRTbXVWZXJzaW9uKTsNCisJCWlmIChyZXQpDQorCQkJcmV0dXJuIHJl
dDsNCisNCisJCXJldCA9IHNtdV9yZWFkX3NtY19hcmcoc211LCBzbXVfdmVyc2lvbik7DQorCQlp
ZiAocmV0KQ0KKwkJCXJldHVybiByZXQ7DQorCX0NCisNCisJcmV0dXJuIHJldDsNCit9DQorDQog
aW50IHNtdV9zZXRfc29mdF9mcmVxX3JhbmdlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVt
IHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwNCiAJCQkgICAgdWludDMyX3QgbWluLCB1aW50MzJfdCBt
YXgpDQogew0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9h
bWRncHVfc211LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3Nt
dS5oDQppbmRleCBlOTU4ZDRjYjViYWYuLjQzNTcyN2M4ZWUyMSAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgNCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgNCkBAIC05MzEsNCArOTMxLDUg
QEAgaW50IHNtdV9zZXRfc29mdF9mcmVxX3JhbmdlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBl
bnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwNCiAJCQkgICAgdWludDMyX3QgbWluLCB1aW50MzJf
dCBtYXgpOw0KIGludCBzbXVfc2V0X2hhcmRfZnJlcV9yYW5nZShzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsDQogCQkJICAgIHVpbnQzMl90IG1pbiwg
dWludDMyX3QgbWF4KTsNCitpbnQgc211X2dldF9zbWNfdmVyc2lvbihzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgdWludDMyX3QgKmlmX3ZlcnNpb24sIHVpbnQzMl90ICpzbXVfdmVyc2lvbik7DQog
I2VuZGlmDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3Yx
MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0KaW5kZXgg
YWI4OWM3OWI0MzU4Li5jMmZlMDBmNTFiMmIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvc211X3YxMV8wLmMNCkBAIC0yNDksMjAgKzI0OSwyNyBAQCBzdGF0aWMgaW50IHNtdV92
MTFfMF9jaGVja19md19zdGF0dXMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpDQogDQogc3RhdGlj
IGludCBzbXVfdjExXzBfY2hlY2tfZndfdmVyc2lvbihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkN
CiB7DQotCXVpbnQzMl90IHNtdV92ZXJzaW9uID0gMHhmZjsNCisJdWludDMyX3QgaWZfdmVyc2lv
biA9IDB4ZmYsIHNtdV92ZXJzaW9uID0gMHhmZjsNCisJdWludDE2X3Qgc211X21ham9yOw0KKwl1
aW50OF90IHNtdV9taW5vciwgc211X2RlYnVnOw0KIAlpbnQgcmV0ID0gMDsNCiANCi0JcmV0ID0g
c211X3NlbmRfc21jX21zZyhzbXUsIFNNVV9NU0dfR2V0RHJpdmVySWZWZXJzaW9uKTsNCisJcmV0
ID0gc211X2dldF9zbWNfdmVyc2lvbihzbXUsICZpZl92ZXJzaW9uLCAmc211X3ZlcnNpb24pOw0K
IAlpZiAocmV0KQ0KLQkJZ290byBlcnI7DQorCQlyZXR1cm4gcmV0Ow0KIA0KLQlyZXQgPSBzbXVf
cmVhZF9zbWNfYXJnKHNtdSwgJnNtdV92ZXJzaW9uKTsNCi0JaWYgKHJldCkNCi0JCWdvdG8gZXJy
Ow0KKwlzbXVfbWFqb3IgPSAoc211X3ZlcnNpb24gPj4gMTYpICYgMHhmZmZmOw0KKwlzbXVfbWlu
b3IgPSAoc211X3ZlcnNpb24gPj4gOCkgJiAweGZmOw0KKwlzbXVfZGVidWcgPSAoc211X3ZlcnNp
b24gPj4gMCkgJiAweGZmOw0KKw0KKwlwcl9pbmZvKCJTTVUgRHJpdmVyIElGIFZlcnNpb24gPSAw
eCUwOHgsIFNNVSBGVyBWZXJzaW9uID0gMHglMDh4ICglZC4lZC4lZClcbiIsDQorCQlpZl92ZXJz
aW9uLCBzbXVfdmVyc2lvbiwgc211X21ham9yLCBzbXVfbWlub3IsIHNtdV9kZWJ1Zyk7DQogDQot
CWlmIChzbXVfdmVyc2lvbiAhPSBzbXUtPnNtY19pZl92ZXJzaW9uKQ0KKwlpZiAoaWZfdmVyc2lv
biAhPSBzbXUtPnNtY19pZl92ZXJzaW9uKSB7DQorCQlwcl9lcnIoIlNNVSBkcml2ZXIgaWYgdmVy
c2lvbiBub3QgbWF0Y2hlZFxuIik7DQogCQlyZXQgPSAtRUlOVkFMOw0KLWVycjoNCisJfQ0KKw0K
IAlyZXR1cm4gcmV0Ow0KIH0NCiANCi0tIA0KMi4yMS4wDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
