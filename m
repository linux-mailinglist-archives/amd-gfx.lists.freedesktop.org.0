Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D42B592
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC9689132;
	Sun, 28 Apr 2019 07:44:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810058.outbound.protection.outlook.com [40.107.81.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443BD890FE
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:07 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:06 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:06 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/27] drm/amdkfd: Shift sdma_engine_id and sdma_queue_id in
 mqd
Thread-Topic: [PATCH 04/27] drm/amdkfd: Shift sdma_engine_id and sdma_queue_id
 in mqd
Thread-Index: AQHU/ZYoK3nTvUWpwEaIZaFLZZrIMw==
Date: Sun, 28 Apr 2019 07:44:06 +0000
Message-ID: <20190428074331.30107-5-Felix.Kuehling@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190428074331.30107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d01ed75-c95a-440b-1334-08d6cbad4a66
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB2933786F572080CE55BD003F92380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1y3H1itI0rV4qejTrBisHrT6eiOFFpIpxr3vP2lUq1xfmxLjV0yZ3sjZYtsFXnzqtCo9TXQhYzDwmYNVhjhs1cE85kF1dyWD572OVfY3a7++yETp56xBbRGKA+JMPz+mSGIrgauNMjfRUTWT0zSPwlgRBgCBkFvq2vCgOz28DIWh11T7Mt9z4xnf1k08+DhzAZnbT207Ao8XrxK665ZPy0MYJHt/W9vw0WPG5A0uMpxS50igbvNINSD8WD628z0WFGrkwEcakI+d2HHjGFcEN1qOb66nFFstqOPi382YzKm1h0alG/OW1UDsVMq+UVH/exQhmfKWDt2f+3/lUmH71RF0XVrb3RK5ZnBlYaEy4Y+4sg8XAQiItznSSR7BAUxHrY0QbVrvVPSqQJLa0JKM4HoAICkHo+Aqsnkyt5Q//ms=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d01ed75-c95a-440b-1334-08d6cbad4a66
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:06.0430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEaazySX0J6dLY5WS+XRlQuQ2DJhtCFIQfPYeA6PFKM=;
 b=I/iy81iF7+760kTYKa82a9PDntXVMzFiHAJF3EOyfAoAIP08BiIGdhdO2IgfaEOMhaoFxtDA6Be5TLZ+4S16ktom8XOACeaDW8hSoDeN6dyn5b5oigal5WpZNEoFdIbWXVG/mzmld6oX3lq9wxRCVK4MYQxRwIxCKF86yo+hS/w=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPG96ZW5nQGFtZC5jb20+DQoNCkZXIG9mIHNvbWUgbmV3IEFTSUNzIHJl
cXVpcmVzIHNkbWEgbXFkIHNpemUgdG8gYmUgbm90IG1vcmUgdGhhbg0KMTI4IGR3b3Jkcy4gUmVw
dXJwb3NlIHRoZSBsYXN0IDIgcmVzZXJ2ZWQgZmllbGRzIG9mIHNkbWEgbXFkIGZvcg0KZHJpdmVy
IGludGVybmFsIHVzZSwgc28gdGhlIHRvdGFsIG1xZCBzaXplIGlzIG5vIGJpZ2dlciB0aGFuIDEy
OA0KZHdvcmRzDQoNClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxvemVuZ0BhbWQuY29tPg0KUmV2
aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KU2lnbmVk
LW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQotLS0NCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvY2lrX3N0cnVjdHMuaCB8IDMgKy0tDQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9pbmNsdWRlL3Y5X3N0cnVjdHMuaCAgfCAzICstLQ0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvaW5jbHVkZS92aV9zdHJ1Y3RzLmggIHwgMyArLS0NCiAzIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvaW5jbHVkZS9jaWtfc3RydWN0cy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9p
bmNsdWRlL2Npa19zdHJ1Y3RzLmgNCmluZGV4IDc0OWVhYjk0ZTMzNS4uNjk5ZTY1OGMzY2VjIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Npa19zdHJ1Y3RzLmgNCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9jaWtfc3RydWN0cy5oDQpAQCAtMjgyLDgg
KzI4Miw3IEBAIHN0cnVjdCBjaWtfc2RtYV9ybGNfcmVnaXN0ZXJzIHsNCiAJdWludDMyX3QgcmVz
ZXJ2ZWRfMTIzOw0KIAl1aW50MzJfdCByZXNlcnZlZF8xMjQ7DQogCXVpbnQzMl90IHJlc2VydmVk
XzEyNTsNCi0JdWludDMyX3QgcmVzZXJ2ZWRfMTI2Ow0KLQl1aW50MzJfdCByZXNlcnZlZF8xMjc7
DQorCS8qIHJlc2VydmVkXzEyNiwxMjc6IHJlcHVycG9zZWQgZm9yIGRyaXZlci1pbnRlcm5hbCB1
c2UgKi8NCiAJdWludDMyX3Qgc2RtYV9lbmdpbmVfaWQ7DQogCXVpbnQzMl90IHNkbWFfcXVldWVf
aWQ7DQogfTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvdjlfc3Ry
dWN0cy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3Y5X3N0cnVjdHMuaA0KaW5kZXgg
Y2VhZjQ5MzIyNThkLi44YjM4M2RiZTFjZGEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2luY2x1ZGUvdjlfc3RydWN0cy5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1
ZGUvdjlfc3RydWN0cy5oDQpAQCAtMTUxLDggKzE1MSw3IEBAIHN0cnVjdCB2OV9zZG1hX21xZCB7
DQogCXVpbnQzMl90IHJlc2VydmVkXzEyMzsNCiAJdWludDMyX3QgcmVzZXJ2ZWRfMTI0Ow0KIAl1
aW50MzJfdCByZXNlcnZlZF8xMjU7DQotCXVpbnQzMl90IHJlc2VydmVkXzEyNjsNCi0JdWludDMy
X3QgcmVzZXJ2ZWRfMTI3Ow0KKwkvKiByZXNlcnZlZF8xMjYsMTI3OiByZXB1cnBvc2VkIGZvciBk
cml2ZXItaW50ZXJuYWwgdXNlICovDQogCXVpbnQzMl90IHNkbWFfZW5naW5lX2lkOw0KIAl1aW50
MzJfdCBzZG1hX3F1ZXVlX2lkOw0KIH07DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9pbmNsdWRlL3ZpX3N0cnVjdHMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS92aV9z
dHJ1Y3RzLmgNCmluZGV4IDcxN2ZiYWUxZDM2Mi4uYzE3NjEzMjg3Y2QwIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3ZpX3N0cnVjdHMuaA0KKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9pbmNsdWRlL3ZpX3N0cnVjdHMuaA0KQEAgLTE1MSw4ICsxNTEsNyBAQCBzdHJ1
Y3Qgdmlfc2RtYV9tcWQgew0KIAl1aW50MzJfdCByZXNlcnZlZF8xMjM7DQogCXVpbnQzMl90IHJl
c2VydmVkXzEyNDsNCiAJdWludDMyX3QgcmVzZXJ2ZWRfMTI1Ow0KLQl1aW50MzJfdCByZXNlcnZl
ZF8xMjY7DQotCXVpbnQzMl90IHJlc2VydmVkXzEyNzsNCisJLyogcmVzZXJ2ZWRfMTI2LDEyNzog
cmVwdXJwb3NlZCBmb3IgZHJpdmVyLWludGVybmFsIHVzZSAqLw0KIAl1aW50MzJfdCBzZG1hX2Vu
Z2luZV9pZDsNCiAJdWludDMyX3Qgc2RtYV9xdWV1ZV9pZDsNCiB9Ow0KLS0gDQoyLjE3LjENCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
