Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1771A0E8
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 18:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A61389FCA;
	Fri, 10 May 2019 16:01:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780040.outbound.protection.outlook.com [40.107.78.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9266489FC3
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 16:01:21 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2434.namprd12.prod.outlook.com (52.132.11.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Fri, 10 May 2019 16:01:19 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1856.012; Fri, 10 May 2019
 16:01:19 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/8] drm/amdkfd: Add interface to alloc gws from amdgpu
Thread-Topic: [PATCH 3/8] drm/amdkfd: Add interface to alloc gws from amdgpu
Thread-Index: AQHVB0mbniiYBAqH90Sg3N7geox1nA==
Date: Fri, 10 May 2019 16:01:19 +0000
Message-ID: <1557504063-1559-3-git-send-email-Oak.Zeng@amd.com>
References: <1557504063-1559-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1557504063-1559-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::40) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ee85874-242b-437c-5305-08d6d560bdae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2434; 
x-ms-traffictypediagnostic: BL0PR12MB2434:
x-microsoft-antispam-prvs: <BL0PR12MB2434E5857E972662B8D29B1D800C0@BL0PR12MB2434.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(396003)(346002)(39860400002)(136003)(189003)(199004)(2906002)(5660300002)(4326008)(186003)(6116002)(102836004)(26005)(478600001)(11346002)(446003)(72206003)(53936002)(2616005)(476003)(36756003)(6512007)(2351001)(14454004)(2501003)(486006)(3846002)(25786009)(8676002)(81166006)(81156014)(5640700003)(68736007)(6486002)(6436002)(316002)(71190400001)(86362001)(7736002)(305945005)(50226002)(54906003)(6916009)(8936002)(99286004)(71200400001)(66946007)(64756008)(66556008)(66476007)(66446008)(73956011)(76176011)(386003)(6506007)(14444005)(256004)(52116002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2434;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lduGZA4KVLOT1cpqF0lbiZGIYkqyHFFmbwHNa4NLb7709z80Txe/YcoOT/FPZtqPxzkY1Sxu4ceU4fCm4SEU+rpQcRgWC3GDOlKwL2DoiXO2d6HmKl2vejFvdGz8AOpxwe+TQaEjTuzDHS3n7ygGW9tK1DzGV6LM7qGKfu/qaPkDglmj/7cjx0OhQv1ZXsrBYVovOifOreARD0WdHydEGiR7aHwVp8guPsa6aslqjCJa8FF+kb/myACkanQpxuGPm/Phrrs+U5IYsSj2c2wB2wd9TJeO6ojt/sJLfliOn8WXYJRnisTOwXNJp/MwyMthDtaPnqc0Wwu//hjwbPP8eLPlSE7sTouPyrrDi7qq8OUtwBw4zyJsCrVRHeR8F8PHGPI11J9Ubeok90dcAyIsUBQ+gzJUht8onC17tufduFY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee85874-242b-437c-5305-08d6d560bdae
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 16:01:19.8127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2434
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZ4TtItCsYyNfZYWzx87ihJYivVm/FpF+YYQgN16MHs=;
 b=Yg5zGTs9y+BvGfWuXVwPxyyf3QgRCvvZdO++Rh48CQnQO9/A0aRsaLOezNIPdyOqQWiqbyRzFwx5lRsjvU2y3tsh8A8GrumVbdZgqBMPuqPqVzMMD5s5xkoDWV85REUd15ucXcgT0cdNrQdT/Z59ZwDQJeSETDv/u0+offTuaes=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "Keely, Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIGFtZGdwdV9hbWRrZmQgaW50ZXJmYWNlIHRvIGFsbG9jIGFuZCBmcmVlIGd3cw0KZnJvbSBh
bWRncHUNCg0KQ2hhbmdlLUlkOiBJNGViNDE4MzU2ZTVhNjA1MWFhMDljNWUyYzRhNDU0MjYzNjMx
ZDZhYg0KU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQotLS0NCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMgfCAzNCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
YW1ka2ZkLmggfCAgMiArKw0KIDIgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQ0KDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jDQppbmRleCA4MTUxMjIx
Li42YmM3ODU0IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FtZGtmZC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2Zk
LmMNCkBAIC0zMzksNiArMzM5LDQwIEBAIHZvaWQgYW1kZ3B1X2FtZGtmZF9mcmVlX2d0dF9tZW0o
c3RydWN0IGtnZF9kZXYgKmtnZCwgdm9pZCAqbWVtX29iaikNCiAJYW1kZ3B1X2JvX3VucmVmKCYo
Ym8pKTsNCiB9DQogDQoraW50IGFtZGdwdV9hbWRrZmRfYWxsb2NfZ3dzKHN0cnVjdCBrZ2RfZGV2
ICprZ2QsIHNpemVfdCBzaXplLA0KKwkJCQl2b2lkICoqbWVtX29iaikNCit7DQorCXN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopa2dkOw0KKwlzdHJ1
Y3QgYW1kZ3B1X2JvICpibyA9IE5VTEw7DQorCXN0cnVjdCBhbWRncHVfYm9fcGFyYW0gYnA7DQor
CWludCByOw0KKw0KKwltZW1zZXQoJmJwLCAwLCBzaXplb2YoYnApKTsNCisJYnAuc2l6ZSA9IHNp
emU7DQorCWJwLmJ5dGVfYWxpZ24gPSAxOw0KKwlicC5kb21haW4gPSBBTURHUFVfR0VNX0RPTUFJ
Tl9HV1M7DQorCWJwLmZsYWdzID0gQU1ER1BVX0dFTV9DUkVBVEVfTk9fQ1BVX0FDQ0VTUzsNCisJ
YnAudHlwZSA9IHR0bV9ib190eXBlX2RldmljZTsNCisJYnAucmVzdiA9IE5VTEw7DQorDQorCXIg
PSBhbWRncHVfYm9fY3JlYXRlKGFkZXYsICZicCwgJmJvKTsNCisJaWYgKHIpIHsNCisJCWRldl9l
cnIoYWRldi0+ZGV2LA0KKwkJCSJmYWlsZWQgdG8gYWxsb2NhdGUgZ3dzIEJPIGZvciBhbWRrZmQg
KCVkKVxuIiwgcik7DQorCQlyZXR1cm4gcjsNCisJfQ0KKw0KKwkqbWVtX29iaiA9IGJvOw0KKwly
ZXR1cm4gMDsNCit9DQorDQordm9pZCBhbWRncHVfYW1ka2ZkX2ZyZWVfZ3dzKHN0cnVjdCBrZ2Rf
ZGV2ICprZ2QsIHZvaWQgKm1lbV9vYmopDQorew0KKwlzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IChz
dHJ1Y3QgYW1kZ3B1X2JvICopbWVtX29iajsNCisNCisJYW1kZ3B1X2JvX3VucmVmKCZibyk7DQor
fQ0KKw0KIHVpbnQzMl90IGFtZGdwdV9hbWRrZmRfZ2V0X2Z3X3ZlcnNpb24oc3RydWN0IGtnZF9k
ZXYgKmtnZCwNCiAJCQkJICAgICAgZW51bSBrZ2RfZW5naW5lX3R5cGUgdHlwZSkNCiB7DQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oDQppbmRleCA1NzAwNjQzLi5j
MDBjOTc0IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZC5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmgN
CkBAIC0xNTMsNiArMTUzLDggQEAgaW50IGFtZGdwdV9hbWRrZmRfYWxsb2NfZ3R0X21lbShzdHJ1
Y3Qga2dkX2RldiAqa2dkLCBzaXplX3Qgc2l6ZSwNCiAJCQkJdm9pZCAqKm1lbV9vYmosIHVpbnQ2
NF90ICpncHVfYWRkciwNCiAJCQkJdm9pZCAqKmNwdV9wdHIsIGJvb2wgbXFkX2dmeDkpOw0KIHZv
aWQgYW1kZ3B1X2FtZGtmZF9mcmVlX2d0dF9tZW0oc3RydWN0IGtnZF9kZXYgKmtnZCwgdm9pZCAq
bWVtX29iaik7DQoraW50IGFtZGdwdV9hbWRrZmRfYWxsb2NfZ3dzKHN0cnVjdCBrZ2RfZGV2ICpr
Z2QsIHNpemVfdCBzaXplLCB2b2lkICoqbWVtX29iaik7DQordm9pZCBhbWRncHVfYW1ka2ZkX2Zy
ZWVfZ3dzKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHZvaWQgKm1lbV9vYmopOw0KIHVpbnQzMl90IGFt
ZGdwdV9hbWRrZmRfZ2V0X2Z3X3ZlcnNpb24oc3RydWN0IGtnZF9kZXYgKmtnZCwNCiAJCQkJICAg
ICAgZW51bSBrZ2RfZW5naW5lX3R5cGUgdHlwZSk7DQogdm9pZCBhbWRncHVfYW1ka2ZkX2dldF9s
b2NhbF9tZW1faW5mbyhzdHJ1Y3Qga2dkX2RldiAqa2dkLA0KLS0gDQoyLjcuNA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
