Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B517126744
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 17:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4727989C2C;
	Wed, 22 May 2019 15:51:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750071.outbound.protection.outlook.com [40.107.75.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567E389C1A
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 15:51:30 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2578.namprd12.prod.outlook.com (52.132.27.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Wed, 22 May 2019 15:51:27 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 15:51:27 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/7] drm/amdgpu: Add interface to alloc gws from amdgpu
Thread-Topic: [PATCH 2/7] drm/amdgpu: Add interface to alloc gws from amdgpu
Thread-Index: AQHVELY312vObbfAH0qU/C6lyFnjXQ==
Date: Wed, 22 May 2019 15:51:27 +0000
Message-ID: <1558540278-23734-2-git-send-email-Oak.Zeng@amd.com>
References: <1558540278-23734-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558540278-23734-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::14) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dee0f0b7-78ca-4708-e5af-08d6decd597e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2578; 
x-ms-traffictypediagnostic: BL0PR12MB2578:
x-microsoft-antispam-prvs: <BL0PR12MB2578D39CE822D11C7DF2B21380000@BL0PR12MB2578.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(39860400002)(346002)(376002)(136003)(199004)(189003)(64756008)(66446008)(6916009)(8676002)(66476007)(66556008)(73956011)(316002)(102836004)(53936002)(68736007)(2906002)(2501003)(66946007)(76176011)(7736002)(52116002)(186003)(2351001)(305945005)(5640700003)(81166006)(81156014)(386003)(6506007)(8936002)(6436002)(6512007)(26005)(54906003)(256004)(14444005)(478600001)(50226002)(11346002)(476003)(2616005)(446003)(486006)(71200400001)(3846002)(6116002)(66066001)(36756003)(71190400001)(99286004)(14454004)(25786009)(4326008)(86362001)(5660300002)(72206003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2578;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UVsqqms8OOQCXGGd3TZWKX97m+ImhbNtkQmz2kOFsrebzez2apEhUyrP01rDWxYel3mvf9TaY1pNPjMJxsJzyCO/uOR2ZA9OB5MfO97Xi5vb3ONdFWfR96/Py95mFDvEjgT2qyBTEu5hPQeuTosgM3du5C1O70UTWtTdL5W6QxYy7k/wHouHP7rqxrCDPB4X4m0mGyeeTom/Akcmq7eqYhE1UQku+7C8oLfF3w2y2SRcscxjHQL4crpT3m4N/vctXvaEZYoK9nSk4+BDotmd8w5+zfwKu0K1M5Cvk472jeiNtGAf6hyOBvPB+xSVACps41OqFZUKPziNmtwoLJYrweprukRSWdr4tbQrS5qGILBxxhwQteHNfUdyZWJz+V1Jxkxlu0PctA5nSMrkPkhDPMNf1JiGEk4KiFALsugZ9iY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee0f0b7-78ca-4708-e5af-08d6decd597e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 15:51:27.4182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2578
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Us+ZPFkAEQ/451fiIfGRs8xq65jW/Nhn7RGSRMV89n0=;
 b=Ar/ySDpLpLT3PUKoaU3Pou+5GtYMjHOjb7iuZ80JYcmdlQI4cw1uKaeSKis8U4lIzjFvkPACL3AXBQ07fJ1/qWqWXsRPNMttbWGtuQl81TnB6TJcZwVqe2a630ZZkj7aMj7c80hRRKaUqYvY+yAFrpuT2aE/U70623lMXrDDN/Y=
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
