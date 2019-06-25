Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A0F52860
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 11:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43696E0B4;
	Tue, 25 Jun 2019 09:43:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680084.outbound.protection.outlook.com [40.107.68.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967516E0B4
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 09:43:39 +0000 (UTC)
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3389.namprd12.prod.outlook.com (20.178.242.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 09:43:38 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::842b:e55b:7196:50f5]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::842b:e55b:7196:50f5%6]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 09:43:38 +0000
From: "Cui, Flora" <Flora.Cui@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amdgpu: fix scheduler timeout calc
Thread-Topic: [PATCH v2] drm/amdgpu: fix scheduler timeout calc
Thread-Index: AQHVKzp2dcoa3Bsw+UiWEOtivzzdFg==
Date: Tue, 25 Jun 2019 09:43:38 +0000
Message-ID: <1561455804-9644-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR02CA0220.apcprd02.prod.outlook.com
 (2603:1096:201:20::32) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cf59302-2045-4832-6de0-08d6f951992a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3389; 
x-ms-traffictypediagnostic: MN2PR12MB3389:
x-microsoft-antispam-prvs: <MN2PR12MB3389470EB70F3DDE1828F31DFAE30@MN2PR12MB3389.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(39860400002)(136003)(396003)(346002)(199004)(189003)(8936002)(71200400001)(71190400001)(81166006)(81156014)(5660300002)(8676002)(6486002)(305945005)(316002)(7736002)(68736007)(14454004)(6512007)(2351001)(5640700003)(72206003)(6436002)(478600001)(14444005)(256004)(66066001)(50226002)(53936002)(6506007)(386003)(102836004)(86362001)(2501003)(99286004)(2616005)(52116002)(66556008)(66446008)(64756008)(66476007)(486006)(476003)(36756003)(186003)(66946007)(73956011)(26005)(6916009)(4326008)(6116002)(3846002)(25786009)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3389;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7wfKr125Oao49v3rkzEHXp4vLYipuW7ZcdggCG44vqtgJCf7T5KN9H4HFZKB7hsHQCBVyOFXEkDLz66z2UM/MTKxzfbwJqFMvkHHxkM6kIwr9thl8+e1VZRqBZYoTotDKVPZYP9vtK0S4zYsfi7iCiQbiizsIASUGd4LLsjIXbSug35ejzon1KU7B3JICAxR8JcJa4Y1LVsxpRs7txjfIklXm45Qr+D3h7x99ke+ef0ZAkq8pXA2Vw9rP5nciLvDZ/YTZ2npeWn8XnLLiOnMm2Z0+kq9Kii1WH9fF4s/ZfhfqnMXxACGdtxhv1CPnu8AY/QsWWTU52Z0KGvZ2XjeY4ALOVPX8jyq0cenTForQkPmp4s7RRDeAMHnUO6ID+q5hYpPsTQHwKz+RWidg65w5tq4YZCsEJjg1nH468Xe4MY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf59302-2045-4832-6de0-08d6f951992a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 09:43:38.0833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyqUkgVDF1mAcyJmEuu2n4e/sJ9BLICRFRsCSGs6lJY=;
 b=EjKVnK0jc22nCTkXmLz2xDx3bqT8H60Vs5GKyQQ2dzJ0WNaoZ4cuEgVUgibuWycLFh9TLpwYYXZvxSmrno+skVZmxA4IEfk+mgpmfHHKMcxZYLg3OCveGazCNAMuK4sszMYnNgpVzLu5az4A+PJs0PUsiZMbAxHX0JYJfQzjvqI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Flora.Cui@amd.com; 
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

c2NoZWR1bGVyIHRpbWVvdXQgaXMgaW4gamlmZmllcw0KdjI6IG1vdmUgdGltZW91dCBjaGVjayB0
byBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyBhZnRlcg0KcGFyc2luZyB0
aGUgdmFsdWUgJiBhZGQgbmVnYXRpdmUgdmFsdWUgY2hlY2sNCg0KQ2hhbmdlLUlkOiBJMjY3MDhj
MTYzZGI5NDNmZjhkOTMwZGQ4MWJjYWI0YjRiOWQ4NGViMg0KU2lnbmVkLW9mZi1ieTogRmxvcmEg
Q3VpIDxmbG9yYS5jdWlAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kcnYuYyB8IDYgKysrKystDQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
DQppbmRleCA3Y2Y2YWIwLi43MjA2ZDBkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMNCkBAIC0xMzAwLDcgKzEzMDAsNyBAQCBpbnQgYW1kZ3B1X2RldmljZV9nZXRf
am9iX3RpbWVvdXRfc2V0dGluZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCSAqIEJ5
IGRlZmF1bHQgdGltZW91dCBmb3Igbm9uIGNvbXB1dGUgam9icyBpcyAxMDAwMC4NCiAJICogQW5k
IHRoZXJlIGlzIG5vIHRpbWVvdXQgZW5mb3JjZWQgb24gY29tcHV0ZSBqb2JzLg0KIAkgKi8NCi0J
YWRldi0+Z2Z4X3RpbWVvdXQgPSBhZGV2LT5zZG1hX3RpbWVvdXQgPSBhZGV2LT52aWRlb190aW1l
b3V0ID0gMTAwMDA7DQorCWFkZXYtPmdmeF90aW1lb3V0ID0gYWRldi0+c2RtYV90aW1lb3V0ID0g
YWRldi0+dmlkZW9fdGltZW91dCA9IG1zZWNzX3RvX2ppZmZpZXMoMTAwMDApOw0KIAlhZGV2LT5j
b21wdXRlX3RpbWVvdXQgPSBNQVhfU0NIRURVTEVfVElNRU9VVDsNCiANCiAJaWYgKHN0cm5sZW4o
aW5wdXQsIEFNREdQVV9NQVhfVElNRU9VVF9QQVJBTV9MRU5USCkpIHsNCkBAIC0xMzE0LDYgKzEz
MTQsMTAgQEAgaW50IGFtZGdwdV9kZXZpY2VfZ2V0X2pvYl90aW1lb3V0X3NldHRpbmdzKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIAkJCWlmICh0aW1lb3V0IDw9IDApIHsNCiAJCQkJaW5k
ZXgrKzsNCiAJCQkJY29udGludWU7DQorCQkJfSBlbHNlIGlmICgobG9uZyltc2Vjc190b19qaWZm
aWVzKHRpbWVvdXQpIDwgMCkgew0KKwkJCQl0aW1lb3V0ID0gTUFYX1NDSEVEVUxFX1RJTUVPVVQ7
DQorCQkJfSBlbHNlIHsNCisJCQkJdGltZW91dCA9IG1zZWNzX3RvX2ppZmZpZXModGltZW91dCk7
DQogCQkJfQ0KIA0KIAkJCXN3aXRjaCAoaW5kZXgrKykgew0KLS0gDQoyLjcuNA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
