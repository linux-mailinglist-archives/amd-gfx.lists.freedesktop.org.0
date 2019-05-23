Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCECF28D51
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 00:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676456E08C;
	Thu, 23 May 2019 22:41:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760055.outbound.protection.outlook.com [40.107.76.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973376E083
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 22:41:15 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2339.namprd12.prod.outlook.com (52.132.10.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 22:41:14 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1900.020; Thu, 23 May 2019
 22:41:14 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/8] drm/amdgpu: Add interface to alloc gws from amdgpu
Thread-Topic: [PATCH 2/8] drm/amdgpu: Add interface to alloc gws from amdgpu
Thread-Index: AQHVEbig6UwloiHahkGbJlQ+z0uz6A==
Date: Thu, 23 May 2019 22:41:14 +0000
Message-ID: <1558651263-3478-2-git-send-email-Oak.Zeng@amd.com>
References: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::24) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05412d5b-dbab-4108-112a-08d6dfcfc2b1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2339; 
x-ms-traffictypediagnostic: BL0PR12MB2339:
x-microsoft-antispam-prvs: <BL0PR12MB2339E3E8275DE79E993DDF9480010@BL0PR12MB2339.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(39860400002)(366004)(376002)(189003)(199004)(81156014)(8676002)(81166006)(71190400001)(8936002)(305945005)(68736007)(7736002)(50226002)(71200400001)(2351001)(4326008)(53936002)(36756003)(486006)(476003)(99286004)(52116002)(102836004)(5640700003)(25786009)(6512007)(66066001)(6506007)(54906003)(386003)(76176011)(73956011)(14444005)(256004)(2906002)(186003)(66476007)(64756008)(26005)(86362001)(66946007)(66446008)(66556008)(6486002)(2616005)(5660300002)(11346002)(478600001)(6916009)(2501003)(6116002)(3846002)(14454004)(446003)(72206003)(316002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2339;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EG4zVQzqd/tZKcL0B2p3z4/awFn+xn0513+ZiKZ16S3PylxovLWoSlRktFmUYlYBJBCclWZ8WTZGQoIcur+mHLUIYbA0p/30Za3O6LClOxRBzdhsijvYcl8k8iJUC9nkDpbcO11RvfDoD5+ojHKZxwMG2yuo8ITNgd3gYp952NjieMcqnM5442yGO3hZodnpH91bahgzNpWzvMTn5Bh1w49AQF2WEWZhQEaCOs/BOrTBoxe2d0ZFzMFxgp0iMIblmk7yQ+d6s6A1gjFbUd4n4RkA4uGPNnz8iWgw4/plB+m35DeU9B165TFdi5fPshXHiRJtWHV2WtFkAQnUYfYZhHojZTEWUOtgoFxqyIwBF7bfDbH8T98FSRap/RhF1gGo+IVpRiHXlmDBiOtz+4AFodlocTFQamapuMZSLP4tsxg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05412d5b-dbab-4108-112a-08d6dfcfc2b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 22:41:14.0220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2339
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Us+ZPFkAEQ/451fiIfGRs8xq65jW/Nhn7RGSRMV89n0=;
 b=aJbsQo4SCY+qtcg0ZziRW5uN3rhDPuaAA8tR0oE2a4HskL996rVXFNO4rVH7ZJtabDO3PPoHkPz2G69Dh9yKMQXsu9K9DAxayacuLiUsK3ZJDV6p59BWd3X2NZUxPxUUK61ZWdjP3OB+HAVi3Q061bG6Yjv8mccxJ9m7auh07YE=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng,
 Oak" <Oak.Zeng@amd.com>, "Keely, Sean" <Sean.Keely@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIGFtZGdwdV9hbWRrZmQgaW50ZXJmYWNlIHRvIGFsbG9jIGFuZCBmcmVlIGd3cw0KZnJvbSBh
bWRncHUNCg0KQ2hhbmdlLUlkOiBJNGViNDE4MzU2ZTVhNjA1MWFhMDljNWUyYzRhNDU0MjYzNjMx
ZDZhYg0KU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQpSZXZpZXdl
ZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQotLS0NCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMgfCAzNCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkLmggfCAgMiArKw0KIDIgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQ0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jDQppbmRleCBhNDc4MGQ1Li40
YWYzOTg5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMN
CkBAIC0zMzksNiArMzM5LDQwIEBAIHZvaWQgYW1kZ3B1X2FtZGtmZF9mcmVlX2d0dF9tZW0oc3Ry
dWN0IGtnZF9kZXYgKmtnZCwgdm9pZCAqbWVtX29iaikNCiAJYW1kZ3B1X2JvX3VucmVmKCYoYm8p
KTsNCiB9DQogDQoraW50IGFtZGdwdV9hbWRrZmRfYWxsb2NfZ3dzKHN0cnVjdCBrZ2RfZGV2ICpr
Z2QsIHNpemVfdCBzaXplLA0KKwkJCQl2b2lkICoqbWVtX29iaikNCit7DQorCXN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopa2dkOw0KKwlzdHJ1Y3Qg
YW1kZ3B1X2JvICpibyA9IE5VTEw7DQorCXN0cnVjdCBhbWRncHVfYm9fcGFyYW0gYnA7DQorCWlu
dCByOw0KKw0KKwltZW1zZXQoJmJwLCAwLCBzaXplb2YoYnApKTsNCisJYnAuc2l6ZSA9IHNpemU7
DQorCWJwLmJ5dGVfYWxpZ24gPSAxOw0KKwlicC5kb21haW4gPSBBTURHUFVfR0VNX0RPTUFJTl9H
V1M7DQorCWJwLmZsYWdzID0gQU1ER1BVX0dFTV9DUkVBVEVfTk9fQ1BVX0FDQ0VTUzsNCisJYnAu
dHlwZSA9IHR0bV9ib190eXBlX2RldmljZTsNCisJYnAucmVzdiA9IE5VTEw7DQorDQorCXIgPSBh
bWRncHVfYm9fY3JlYXRlKGFkZXYsICZicCwgJmJvKTsNCisJaWYgKHIpIHsNCisJCWRldl9lcnIo
YWRldi0+ZGV2LA0KKwkJCSJmYWlsZWQgdG8gYWxsb2NhdGUgZ3dzIEJPIGZvciBhbWRrZmQgKCVk
KVxuIiwgcik7DQorCQlyZXR1cm4gcjsNCisJfQ0KKw0KKwkqbWVtX29iaiA9IGJvOw0KKwlyZXR1
cm4gMDsNCit9DQorDQordm9pZCBhbWRncHVfYW1ka2ZkX2ZyZWVfZ3dzKHN0cnVjdCBrZ2RfZGV2
ICprZ2QsIHZvaWQgKm1lbV9vYmopDQorew0KKwlzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IChzdHJ1
Y3QgYW1kZ3B1X2JvICopbWVtX29iajsNCisNCisJYW1kZ3B1X2JvX3VucmVmKCZibyk7DQorfQ0K
Kw0KIHVpbnQzMl90IGFtZGdwdV9hbWRrZmRfZ2V0X2Z3X3ZlcnNpb24oc3RydWN0IGtnZF9kZXYg
KmtnZCwNCiAJCQkJICAgICAgZW51bSBrZ2RfZW5naW5lX3R5cGUgdHlwZSkNCiB7DQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oDQppbmRleCA1NzAwNjQzLi5jMDBj
OTc0IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtm
ZC5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmgNCkBA
IC0xNTMsNiArMTUzLDggQEAgaW50IGFtZGdwdV9hbWRrZmRfYWxsb2NfZ3R0X21lbShzdHJ1Y3Qg
a2dkX2RldiAqa2dkLCBzaXplX3Qgc2l6ZSwNCiAJCQkJdm9pZCAqKm1lbV9vYmosIHVpbnQ2NF90
ICpncHVfYWRkciwNCiAJCQkJdm9pZCAqKmNwdV9wdHIsIGJvb2wgbXFkX2dmeDkpOw0KIHZvaWQg
YW1kZ3B1X2FtZGtmZF9mcmVlX2d0dF9tZW0oc3RydWN0IGtnZF9kZXYgKmtnZCwgdm9pZCAqbWVt
X29iaik7DQoraW50IGFtZGdwdV9hbWRrZmRfYWxsb2NfZ3dzKHN0cnVjdCBrZ2RfZGV2ICprZ2Qs
IHNpemVfdCBzaXplLCB2b2lkICoqbWVtX29iaik7DQordm9pZCBhbWRncHVfYW1ka2ZkX2ZyZWVf
Z3dzKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHZvaWQgKm1lbV9vYmopOw0KIHVpbnQzMl90IGFtZGdw
dV9hbWRrZmRfZ2V0X2Z3X3ZlcnNpb24oc3RydWN0IGtnZF9kZXYgKmtnZCwNCiAJCQkJICAgICAg
ZW51bSBrZ2RfZW5naW5lX3R5cGUgdHlwZSk7DQogdm9pZCBhbWRncHVfYW1ka2ZkX2dldF9sb2Nh
bF9tZW1faW5mbyhzdHJ1Y3Qga2dkX2RldiAqa2dkLA0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
