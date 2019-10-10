Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D7FD1F15
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 05:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4BF6EA88;
	Thu, 10 Oct 2019 03:45:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70AD6EA88
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 03:45:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mj+RojzOP5zMcjPvoCW/W/Z4vdtdRY0jI9X5bWqSw5hnOVtubeMUrLrsk/JeY1wI3zBTa7ecNSnHBiNQ+f3DFTht96PRomuKb4vTeggnsUuBqMZ1ClHEkXOSI22zsv7wyBRa7IlpU4Kg8LiKfooUwmEGtgg+kvIocQvNGEiaNcM9J8FTtdtEpyn7+yQ76TNDTZe2MeRvP4iDPqwDDlU/v0HYVc+11NjTCa9eWXMAJiSL6uuDJaywwQzSQb32pbSKu3A/qlKM+XcBxrEURiCWUhSQX7aJzIGe+/gJn5DfsDVNENktgaHtfGVI/JuYyOVUd+N85kwp8pJ/J8JX7bldwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gO8QI8mzhO37+HSiXnsbkUPHGLAqXxXy+EaAACHaLUE=;
 b=RWqj+DXCOxm7olBkyBGFLXromn7h7ovunBX+QH3Ve3KtIOWXnLKc89iyOgFJ98oKA0+T7c5ndl/ITk0drMdrlzfNsXbmqGBp3OFJHyOgi3CJbScVdaKwgH0C43kDXgYBeZj7q7Wue3m0cvGNZ4+28Tjca2gycvSBRdwfKkk0gX+DtYWMaaVXsMCIpIR6gY6aGaYFxywwgZ5KYpA4D32e4kNBw8VAlwvfcbksktHyEsPlV4ZnM1UOnQs4qSHqfG5qtd0TKNs/PCW5jvLJZTyut69hcAfi6JuIKnQCypPm9QoW7s0nhKfZEnxPjmwnzZ68Kliy59h7/jzohed/f1AhIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4077.namprd12.prod.outlook.com (52.135.50.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 10 Oct 2019 03:45:26 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d%5]) with mapi id 15.20.2327.025; Thu, 10 Oct 2019
 03:45:26 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/powerplay: enable df cstate control on swSMU
 routine
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: enable df cstate control on swSMU
 routine
Thread-Index: AQHVfx0mLogWwOEJ9keqAabk4HWypA==
Date: Thu, 10 Oct 2019 03:45:26 +0000
Message-ID: <20191010034449.3878-2-evan.quan@amd.com>
References: <20191010034449.3878-1-evan.quan@amd.com>
In-Reply-To: <20191010034449.3878-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::18) To MN2PR12MB3344.namprd12.prod.outlook.com
 (2603:10b6:208:c5::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db87f8db-6e7b-4022-de78-08d74d344945
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB4077:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4077399E14CB214F85396CF9E4940@MN2PR12MB4077.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(199004)(189003)(14454004)(102836004)(5640700003)(446003)(486006)(8936002)(11346002)(2616005)(476003)(6506007)(386003)(2351001)(186003)(25786009)(316002)(6436002)(8676002)(256004)(66946007)(14444005)(66476007)(66556008)(64756008)(66446008)(305945005)(99286004)(71200400001)(7736002)(71190400001)(81166006)(81156014)(4326008)(66066001)(6486002)(2501003)(5660300002)(52116002)(2906002)(76176011)(86362001)(36756003)(3846002)(6116002)(6916009)(50226002)(6512007)(478600001)(26005)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4077;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VlyAyL0PEJlZxAWhkeRxrSb2xYzocKBqq4XxsQl2bNHPq5x1mj5bt9uRIxA9BWtObehxz+RSDP02XXa0+fZKLGoWIk7vjrGdRhznxbWBSeD5t0FzOokxYbxgTphuH6WFpIelTqP6EFFWBs8NLZH1nkEtwqAAgeoT+otQBRkTHZ8AkZ7LJtsHBGIL6U31JYac3xZv8owQNdy/VXCW0qdkuKpInGL80UBQvaCUBW9wcQPtlU5HnyhpG8XO+0gpb3mVlEiI/+z/+b6CvO/6qRSnu5oh6dBcD5qeF421+o0auVo+iSU3f1oxkWubJh3Dymk8QZqQauwDL9pffcJV7vo3QqyWqI93xoe6r5g0OB60R+bHeT8klJUewkwlPhDYFte+f87sRR8rE5DYNh3FrZpYh3vMC7glNfnH2/GPrPHMx5I=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db87f8db-6e7b-4022-de78-08d74d344945
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 03:45:26.2956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nXERgsqS9gfTuq8YunDesfZteY7+xzS0YlCeYjuQZ8NBOIO6DbP2nqjM3ftKwk2X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4077
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gO8QI8mzhO37+HSiXnsbkUPHGLAqXxXy+EaAACHaLUE=;
 b=wo61srpME5pK12Gh1HFvGtQidYgb/FM0tkSJPcgUjIpz6Yt32UNKCQL/zoBICqAx62f1NjxjOxkTKlLTiBrdMyF2WGFvJJuZ7rv3ttJvadG7M330amEh2PVQU+BVvCa0Eq+VvZbTJAgtPws7tdhbjcACm7fdinTK0dqBH/GIl6o=
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q3VycmVudGx5IHRoaXMgaXMgb25seSBzdXBwb3J0ZWQgb24gVmVnYTIwIHdpdGggNDAuNTAgYW5k
IGxhdGVyClNNQyBmaXJtd2FyZS4KCkNoYW5nZS1JZDogSTgzOTdmOWNjYzVkZWMzMmRjODZlZjc2
MzVjNWVkMjI3Yzc3ZTYxYTMKU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgICAg
fCAyMyArKysrKysrKysrKysrKysrKwogLi4uL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1k
Z3B1X3NtdS5oICAgIHwgIDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
c211X3R5cGVzLmggfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBf
cHB0LmMgICAgfCAyNSArKysrKysrKysrKysrKysrKystCiA0IGZpbGVzIGNoYW5nZWQsIDUxIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hbWRncHVfc211LmMKaW5kZXggMDU0Mzc2MzQyNDU0Li5hMzdhMWIxZDhhYmQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAgLTE4MzQsNiArMTgzNCwy
OSBAQCBpbnQgc211X3NldF9tcDFfc3RhdGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJcmV0
dXJuIHJldDsKIH0KIAoraW50IHNtdV9zZXRfZGZfY3N0YXRlKHN0cnVjdCBzbXVfY29udGV4dCAq
c211LAorCQkgICAgICBlbnVtIHBwX2RmX2NzdGF0ZSBzdGF0ZSkKK3sKKwlpbnQgcmV0ID0gMDsK
KworCS8qCisJICogVGhlIFNNQyBpcyBub3QgZnVsbHkgcmVhZHkuIFRoYXQgbWF5IGJlCisJICog
ZXhwZWN0ZWQgYXMgdGhlIElQIG1heSBiZSBtYXNrZWQuCisJICogU28sIGp1c3QgcmV0dXJuIHdp
dGhvdXQgZXJyb3IuCisJICovCisJaWYgKCFzbXUtPnBtX2VuYWJsZWQpCisJCXJldHVybiAwOwor
CisJaWYgKCFzbXUtPnBwdF9mdW5jcyB8fCAhc211LT5wcHRfZnVuY3MtPnNldF9kZl9jc3RhdGUp
CisJCXJldHVybiAwOworCisJcmV0ID0gc211LT5wcHRfZnVuY3MtPnNldF9kZl9jc3RhdGUoc211
LCBzdGF0ZSk7CisJaWYgKHJldCkKKwkJcHJfZXJyKCJbU2V0RGZDc3RhdGVdIGZhaWxlZCFcbiIp
OworCisJcmV0dXJuIHJldDsKK30KKwogY29uc3Qgc3RydWN0IGFtZF9pcF9mdW5jcyBzbXVfaXBf
ZnVuY3MgPSB7CiAJLm5hbWUgPSAic211IiwKIAkuZWFybHlfaW5pdCA9IHNtdV9lYXJseV9pbml0
LApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9z
bXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKaW5k
ZXggY2NmNzExYzMyN2M4Li40MDFhZmZkZWU0OWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaApAQCAtNDY4LDYgKzQ2OCw3IEBAIHN0cnVjdCBw
cHRhYmxlX2Z1bmNzIHsKIAlpbnQgKCpnZXRfcG93ZXJfbGltaXQpKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LCB1aW50MzJfdCAqbGltaXQsIGJvb2wgYXNpY19kZWZhdWx0KTsKIAlpbnQgKCpnZXRf
ZHBtX2Nsa19saW1pdGVkKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5
cGUgY2xrX3R5cGUsCiAJCQkJICAgdWludDMyX3QgZHBtX2xldmVsLCB1aW50MzJfdCAqZnJlcSk7
CisJaW50ICgqc2V0X2RmX2NzdGF0ZSkoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gcHBf
ZGZfY3N0YXRlIHN0YXRlKTsKIH07CiAKIHN0cnVjdCBzbXVfZnVuY3MKQEAgLTg1Miw1ICs4NTMs
NyBAQCBpbnQgc211X2ZvcmNlX2Nsa19sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJ
CQkgdWludDMyX3QgbWFzayk7CiBpbnQgc211X3NldF9tcDFfc3RhdGUoc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsCiAJCSAgICAgIGVudW0gcHBfbXAxX3N0YXRlIG1wMV9zdGF0ZSk7CitpbnQgc211
X3NldF9kZl9jc3RhdGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCisJCSAgICAgIGVudW0gcHBf
ZGZfY3N0YXRlIHN0YXRlKTsKIAogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9pbmMvc211X3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9pbmMvc211X3R5cGVzLmgKaW5kZXggMTJhMWRlNTVjZTNjLi5kOGM5YjdmOTFmY2MgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXVfdHlwZXMuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3R5cGVzLmgKQEAgLTE2
OSw2ICsxNjksNyBAQAogCV9fU01VX0RVTU1ZX01BUChQb3dlckdhdGVBdEh1YiksICAgICAgICAg
ICAgICBcCiAJX19TTVVfRFVNTVlfTUFQKFNldFNvZnRNaW5KcGVnKSwgICAgICAgICAgICAgIFwK
IAlfX1NNVV9EVU1NWV9NQVAoU2V0SGFyZE1pbkZjbGtCeUZyZXEpLCAgICAgICAgXAorCV9fU01V
X0RVTU1ZX01BUChERkNzdGF0ZUNvbnRyb2wpLCBcCiAKICN1bmRlZiBfX1NNVV9EVU1NWV9NQVAK
ICNkZWZpbmUgX19TTVVfRFVNTVlfTUFQKHR5cGUpCVNNVV9NU0dfIyN0eXBlCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKaW5kZXggOTllZmZkZTMzYWMxLi4xMDUw
NTY2Y2I2OWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2Ey
MF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMK
QEAgLTE0Myw2ICsxNDMsNyBAQCBzdGF0aWMgc3RydWN0IHNtdV8xMV8wX2NtbjJhaXNjX21hcHBp
bmcgdmVnYTIwX21lc3NhZ2VfbWFwW1NNVV9NU0dfTUFYX0NPVU5UXSA9CiAJTVNHX01BUChQcmVw
YXJlTXAxRm9yU2h1dGRvd24pLAogCU1TR19NQVAoU2V0TUdwdUZhbkJvb3N0TGltaXRScG0pLAog
CU1TR19NQVAoR2V0QVZGU1ZvbHRhZ2VCeURwbSksCisJTVNHX01BUChERkNzdGF0ZUNvbnRyb2wp
LAogfTsKIAogc3RhdGljIHN0cnVjdCBzbXVfMTFfMF9jbW4yYWlzY19tYXBwaW5nIHZlZ2EyMF9j
bGtfbWFwW1NNVV9DTEtfQ09VTlRdID0gewpAQCAtMzEzNSw2ICszMTM2LDI3IEBAIHN0YXRpYyBp
bnQgdmVnYTIwX2dldF90aGVybWFsX3RlbXBlcmF0dXJlX3JhbmdlKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LAogCXJldHVybiAwOwogfQogCitzdGF0aWMgaW50IHZlZ2EyMF9zZXRfZGZfY3N0YXRl
KHN0cnVjdCBzbXVfY29udGV4dCAqc211LAorCQkJCWVudW0gcHBfZGZfY3N0YXRlIHN0YXRlKQor
eworCXVpbnQzMl90IHNtdV92ZXJzaW9uOworCWludCByZXQ7CisKKwlyZXQgPSBzbXVfZ2V0X3Nt
Y192ZXJzaW9uKHNtdSwgTlVMTCwgJnNtdV92ZXJzaW9uKTsKKwlpZiAocmV0KSB7CisJCXByX2Vy
cigiRmFpbGVkIHRvIGdldCBzbXUgdmVyc2lvbiFcbiIpOworCQlyZXR1cm4gcmV0OworCX0KKwor
CS8qIFBQU01DX01TR19ERkNzdGF0ZUNvbnRyb2wgaXMgc3VwcG9ydGVkIHdpdGggNDAuNTAgYW5k
IGxhdGVyIGZ3cyAqLworCWlmIChzbXVfdmVyc2lvbiA8IDB4MjgzMjAwKSB7CisJCXByX2Vycigi
RGYgY3N0YXRlIGNvbnRyb2wgaXMgc3VwcG9ydGVkIHdpdGggNDAuNTAgYW5kIGxhdGVyIFNNQyBm
dyFcbiIpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwlyZXR1cm4gc211X3NlbmRfc21jX21z
Z193aXRoX3BhcmFtKHNtdSwgU01VX01TR19ERkNzdGF0ZUNvbnRyb2wsIHN0YXRlKTsKK30KKwog
c3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHZlZ2EyMF9wcHRfZnVuY3MgPSB7CiAJ
LnRhYmxlc19pbml0ID0gdmVnYTIwX3RhYmxlc19pbml0LAogCS5hbGxvY19kcG1fY29udGV4dCA9
IHZlZ2EyMF9hbGxvY2F0ZV9kcG1fY29udGV4dCwKQEAgLTMxNzcsNyArMzE5OSw4IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyB2ZWdhMjBfcHB0X2Z1bmNzID0gewogCS5nZXRf
ZmFuX3NwZWVkX3BlcmNlbnQgPSB2ZWdhMjBfZ2V0X2Zhbl9zcGVlZF9wZXJjZW50LAogCS5nZXRf
ZmFuX3NwZWVkX3JwbSA9IHZlZ2EyMF9nZXRfZmFuX3NwZWVkX3JwbSwKIAkuc2V0X3dhdGVybWFy
a3NfdGFibGUgPSB2ZWdhMjBfc2V0X3dhdGVybWFya3NfdGFibGUsCi0JLmdldF90aGVybWFsX3Rl
bXBlcmF0dXJlX3JhbmdlID0gdmVnYTIwX2dldF90aGVybWFsX3RlbXBlcmF0dXJlX3JhbmdlCisJ
LmdldF90aGVybWFsX3RlbXBlcmF0dXJlX3JhbmdlID0gdmVnYTIwX2dldF90aGVybWFsX3RlbXBl
cmF0dXJlX3JhbmdlLAorCS5zZXRfZGZfY3N0YXRlID0gdmVnYTIwX3NldF9kZl9jc3RhdGUsCiB9
OwogCiB2b2lkIHZlZ2EyMF9zZXRfcHB0X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQot
LSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
