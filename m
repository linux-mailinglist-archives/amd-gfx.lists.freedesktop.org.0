Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B588316D50
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 23:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BDC6E84C;
	Tue,  7 May 2019 21:52:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680088.outbound.protection.outlook.com [40.107.68.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5210A6E84C
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 21:52:25 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB3463.namprd12.prod.outlook.com (20.178.196.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Tue, 7 May 2019 21:52:22 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 21:52:22 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/amdgpu: Improve error handling for HMM
Thread-Topic: [PATCH 1/1] drm/amdgpu: Improve error handling for HMM
Thread-Index: AQHVBR8mfWFt67IOikqZ0tcF6tC5eA==
Date: Tue, 7 May 2019 21:52:22 +0000
Message-ID: <20190507215202.14616-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::27) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ddb866b-3f33-47b3-4195-08d6d33648a0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3463; 
x-ms-traffictypediagnostic: BYAPR12MB3463:
x-microsoft-antispam-prvs: <BYAPR12MB3463FBDB37D4D9D50BF4C5D192310@BYAPR12MB3463.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(376002)(346002)(366004)(199004)(189003)(73956011)(64756008)(66556008)(6512007)(186003)(66476007)(2906002)(99286004)(66066001)(486006)(26005)(2616005)(256004)(86362001)(102836004)(71200400001)(8676002)(386003)(476003)(2501003)(6916009)(6506007)(4326008)(71190400001)(1076003)(50226002)(8936002)(3846002)(6116002)(81166006)(5660300002)(25786009)(68736007)(66446008)(305945005)(81156014)(54906003)(478600001)(5640700003)(52116002)(66946007)(316002)(53936002)(6436002)(36756003)(6486002)(2351001)(14454004)(72206003)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3463;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PCOeTqa2l34B/Q8GL0d9oygnQoCktiGmnedkLQbG+5uAJiv1p6tSDzS0dH24pmdVCUtbM6A8Xb7QlKfT53jsRlu9rH7JzR5ejuWmjKFTC9YltLy+eXbYYGlXYD52/DJD0XP3eGMcZnT4rKSAJagneSgK3HMgqm0J7nNpM/p60Y9uJYPpBQc7j/HvO9+FMubGqf0+yq5bRViSd2GliYnkkBCEhpD32mJXcZhhONgJ+aJ0nnCu7Ce7qUHDIFvsdjD+5bURH1Ptrv6+fXcpKQGLdIqc2VLoGAVvmlXo9EiRjnJylhBBBgQjXVyARePqZtdm7x3hKpCjETNE42XqH1bvrJHNO3Lg8zAuulYZl+08cIp/yTzIZH8gz7qtGh/VD8BchFOc7kEA/MhOXxNBv6ZeVzhJYLJ91mP0wJOQXrpFXMU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ddb866b-3f33-47b3-4195-08d6d33648a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 21:52:22.5124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3463
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BF+gcZxAWYiAWU8VS5l8jgaBeACDGu7Rfqde0vpeCw=;
 b=fEcAE35eCnsY0rCnmHdNfwy+Dinkb4SosLIutvYkhBGnhnZGDN/X8ojmR//okTOypnF/8E21FlfLe1DESpsPfkT2PgV69sJbHzwmf5NAQShI2vPzYTg1idyS2ALCreeVVpA+oK2V8D7ak57EP+oq53E0qo7b+xGrOSjKq09SHp0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIHVuc2lnbmVkIGxvbmcgZm9yIG51bWJlciBvZiBwYWdlcy4NCg0KQ2hlY2sgdGhhdCBwZm5z
IGFyZSB2YWxpZCBhZnRlciBobW1fdm1hX2ZhdWx0LiBJZiB0aGV5IGFyZSBub3QsDQpyZXR1cm4g
YW4gZXJyb3IgaW5zdGVhZCBvZiBjb250aW51aW5nIHdpdGggaW52YWxpZCBwYWdlIHBvaW50ZXJz
IGFuZA0KUFRFcy4NCg0KU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhs
aW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmMgfCAyMiArKysrKysrKysrKysrKysrKystLS0tDQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHRtLmMNCmluZGV4IGMxNDE5ODczN2RjZC4uMzhjZTExZTMzOGUwIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCkBAIC03MzQsMTAgKzczNCwxMSBAQCBpbnQg
YW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgdHRtX3R0ICp0dG0sIHN0cnVjdCBw
YWdlICoqcGFnZXMpDQogCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gZ3R0LT51c2VydGFzay0+bW07
DQogCXVuc2lnbmVkIGxvbmcgc3RhcnQgPSBndHQtPnVzZXJwdHI7DQogCXVuc2lnbmVkIGxvbmcg
ZW5kID0gc3RhcnQgKyB0dG0tPm51bV9wYWdlcyAqIFBBR0VfU0laRTsNCi0Jc3RydWN0IGhtbV9y
YW5nZSAqcmFuZ2VzOw0KIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9IE5VTEwsICp2bWFz
W01BWF9OUl9WTUFTXTsNCisJc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2VzOw0KKwl1bnNpZ25lZCBs
b25nIG5yX3BhZ2VzLCBpOw0KIAl1aW50NjRfdCAqcGZucywgZjsNCi0JaW50IHIgPSAwLCBpLCBu
cl9wYWdlczsNCisJaW50IHIgPSAwOw0KIA0KIAlpZiAoIW1tKSAvKiBIYXBwZW5zIGR1cmluZyBw
cm9jZXNzIHNodXRkb3duICovDQogCQlyZXR1cm4gLUVTUkNIOw0KQEAgLTgxMyw4ICs4MTQsMTQg
QEAgaW50IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoc3RydWN0IHR0bV90dCAqdHRtLCBz
dHJ1Y3QgcGFnZSAqKnBhZ2VzKQ0KIA0KIAl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOw0KIA0KLQlm
b3IgKGkgPSAwOyBpIDwgdHRtLT5udW1fcGFnZXM7IGkrKykNCisJZm9yIChpID0gMDsgaSA8IHR0
bS0+bnVtX3BhZ2VzOyBpKyspIHsNCiAJCXBhZ2VzW2ldID0gaG1tX3Bmbl90b19wYWdlKCZyYW5n
ZXNbMF0sIHBmbnNbaV0pOw0KKwkJaWYgKCFwYWdlc1tpXSkgew0KKwkJCXByX2VycigiUGFnZSBm
YXVsdCBmYWlsZWQgZm9yIHBmblslbHVdID0gMHglbGx4XG4iLA0KKwkJCSAgICAgICBpLCBwZm5z
W2ldKTsNCisJCQlnb3RvIG91dF9pbnZhbGlkX3BmbjsNCisJCX0NCisJfQ0KIAlndHQtPnJhbmdl
cyA9IHJhbmdlczsNCiANCiAJcmV0dXJuIDA7DQpAQCAtODI3LDYgKzgzNCwxMyBAQCBpbnQgYW1k
Z3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgdHRtX3R0ICp0dG0sIHN0cnVjdCBwYWdl
ICoqcGFnZXMpDQogCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7DQogDQogCXJldHVybiByOw0KKw0K
K291dF9pbnZhbGlkX3BmbjoNCisJZm9yIChpID0gMDsgaSA8IGd0dC0+bnJfcmFuZ2VzOyBpKysp
DQorCQlobW1fdm1hX3JhbmdlX2RvbmUoJnJhbmdlc1tpXSk7DQorCWt2ZnJlZShwZm5zKTsNCisJ
a3ZmcmVlKHJhbmdlcyk7DQorCXJldHVybiAtRU5PTUVNOw0KIH0NCiANCiAvKioNCkBAIC04NzEs
NyArODg1LDcgQEAgYm9vbCBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzX2RvbmUoc3RydWN0
IHR0bV90dCAqdHRtKQ0KICAqLw0KIHZvaWQgYW1kZ3B1X3R0bV90dF9zZXRfdXNlcl9wYWdlcyhz
dHJ1Y3QgdHRtX3R0ICp0dG0sIHN0cnVjdCBwYWdlICoqcGFnZXMpDQogew0KLQl1bnNpZ25lZCBp
Ow0KKwl1bnNpZ25lZCBsb25nIGk7DQogDQogCWZvciAoaSA9IDA7IGkgPCB0dG0tPm51bV9wYWdl
czsgKytpKQ0KIAkJdHRtLT5wYWdlc1tpXSA9IHBhZ2VzID8gcGFnZXNbaV0gOiBOVUxMOw0KLS0g
DQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
