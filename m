Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F44D298D5
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 15:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631E86E0BB;
	Fri, 24 May 2019 13:23:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810080.outbound.protection.outlook.com [40.107.81.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29D36E0DE
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 13:23:51 +0000 (UTC)
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1245.namprd12.prod.outlook.com (10.169.206.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Fri, 24 May 2019 13:23:50 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8%8]) with mapi id 15.20.1922.017; Fri, 24 May 2019
 13:23:50 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/doc: Add RAS documentation to guide
Thread-Topic: [PATCH 2/2] drm/amd/doc: Add RAS documentation to guide
Thread-Index: AQHVEjPsPODRmSvPb0GbUupz1Uy4DQ==
Date: Fri, 24 May 2019 13:23:50 +0000
Message-ID: <20190524132326.7436-2-tom.stdenis@amd.com>
References: <20190524132326.7436-1-tom.stdenis@amd.com>
In-Reply-To: <20190524132326.7436-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:207:3c::17) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8951900d-07d2-49a4-600f-08d6e04b0f32
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1245; 
x-ms-traffictypediagnostic: MWHPR12MB1245:
x-microsoft-antispam-prvs: <MWHPR12MB1245A782B44198273CEF1E09F7020@MWHPR12MB1245.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(366004)(346002)(396003)(136003)(199004)(189003)(53936002)(2501003)(2906002)(5660300002)(3846002)(6116002)(66066001)(36756003)(25786009)(76176011)(2351001)(4326008)(6512007)(71200400001)(71190400001)(66946007)(6436002)(64756008)(66556008)(73956011)(66476007)(7736002)(6506007)(386003)(86362001)(305945005)(102836004)(66446008)(52116002)(316002)(486006)(8936002)(50226002)(256004)(99286004)(186003)(14454004)(6486002)(26005)(8676002)(2616005)(68736007)(446003)(476003)(81166006)(81156014)(5640700003)(478600001)(6916009)(11346002)(72206003)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1245;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ovaSnr2mvJcNzIXVwFH38Q+zXlYekIEy4GLsvSxN7ck9XqPzoSwbHhm/3QW/HTixcW771VtKuW9bvFaJJ6z8Gd1bX6suCN4jlN0KDGRHIzhGxfLkD2cR3sAgjiW0XTIvVNHdVtyqzbX1cf0U+t2tDjzP5yhnsFbvggB3D27CySyVhlAlnDXOYeEddJ45peZ7VvYE35lugHsPyJu35DKtPrpppA7QkRobK/NlyYCO7d5SM1bG43a75ZPeot15sd51PlRrDyfe3eA3Pn25CdedbG9XN85sTO9TSJrHJ2BbOcaZ3sAW7W/1AJAxbRUQLPgSrKVyCqHIk4m30NWUGAuiiD51V62O4Hbl/clMGmbzpLbic5c6gfb8/pJRYlFwilsqE3fdgAVRb2B579zJyaHT69pywid37J9l1mkkGutSwhQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8951900d-07d2-49a4-600f-08d6e04b0f32
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 13:23:50.5655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1245
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Txr7+VnH+k/EgoZacwtsZfiq6DkIAnnQ2dKxHm/hjrQ=;
 b=lHrKRq53BMCQoikFyWdFLSo/pyBObz07T1C9BINVuHn6TZdgNw7CB28DBcfJ43rsvA8nRnlR3rXCR/JWunqAgaubJJ4XLduXe6WJiUtU7Jve0Q+yowOXu0CMrKsiqhNb7oupnKG7O8Glmn96lWQm1YFRV7mUMT2wteTW1VFW7n8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogVG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQuY29tPg0KLS0tDQog
RG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1LnJzdCAgICAgICAgICAgIHwgMTEgKysrKysrKysrKysN
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCAgNCArKy0tDQogMiBm
aWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1LnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L2Ft
ZGdwdS5yc3QNCmluZGV4IGNhY2ZjZmFkMjM1Ni4uODYxMzg3OTgxMjhmIDEwMDY0NA0KLS0tIGEv
RG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1LnJzdA0KKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvYW1k
Z3B1LnJzdA0KQEAgLTc5LDYgKzc5LDE3IEBAIEFNREdQVSBYR01JIFN1cHBvcnQNCiAuLiBrZXJu
ZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYw0KICAgIDpp
bnRlcm5hbDoNCiANCitBTURHUFUgUkFTIGRlYnVnZnMgY29udHJvbCBpbnRlcmZhY2UNCis9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCisNCisuLiBrZXJuZWwtZG9jOjogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQorICAgOmRvYzogQU1ER1BVIFJB
UyBkZWJ1Z2ZzIGNvbnRyb2wgaW50ZXJmYWNlDQorDQorDQorLi4ga2VybmVsLWRvYzo6IGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KKyAgIDppbnRlcm5hbDoNCisNCisN
CiBHUFUgUG93ZXIvVGhlcm1hbCBDb250cm9scyBhbmQgTW9uaXRvcmluZw0KID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQogDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5jDQppbmRleCBkNTcxOWIwZmI4MmMuLjdjOGE0YWVkZjA3YyAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQpAQCAtMjQ0LDggKzI0NCw4IEBA
IHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfcGFyc2VfZGF0YShzdHJ1Y3QgZmls
ZSAqZiwNCiANCiAJcmV0dXJuIDA7DQogfQ0KLS8qDQotICogRE9DOiByYXMgZGVidWdmcyBjb250
cm9sIGludGVyZmFjZQ0KKy8qKg0KKyAqIERPQzogQU1ER1BVIFJBUyBkZWJ1Z2ZzIGNvbnRyb2wg
aW50ZXJmYWNlDQogICoNCiAgKiBJdCBhY2NlcHRzIHN0cnVjdCByYXNfZGVidWdfaWYgd2hvIGhh
cyB0d28gbWVtYmVycy4NCiAgKg0KLS0gDQoyLjIxLjANCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
