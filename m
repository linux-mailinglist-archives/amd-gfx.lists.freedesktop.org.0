Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CE728616
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 20:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764B26E065;
	Thu, 23 May 2019 18:41:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541ED6E061
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 18:41:07 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2339.namprd12.prod.outlook.com (52.132.10.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 18:41:05 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1900.020; Thu, 23 May 2019
 18:41:05 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 6/7] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Topic: [PATCH 6/7] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Index: AQHVEZcUVTgQaE6NmUuqZadJ9KDxEw==
Date: Thu, 23 May 2019 18:41:05 +0000
Message-ID: <1558636843-9867-6-git-send-email-Oak.Zeng@amd.com>
References: <1558636843-9867-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558636843-9867-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::24)
 To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1a907e2-0a62-4703-a645-08d6dfae3694
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2339; 
x-ms-traffictypediagnostic: BL0PR12MB2339:
x-microsoft-antispam-prvs: <BL0PR12MB23391986FF9588DE0563BA4180010@BL0PR12MB2339.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(199004)(81156014)(8676002)(8936002)(305945005)(81166006)(7736002)(68736007)(36756003)(50226002)(71200400001)(2351001)(4326008)(53936002)(71190400001)(486006)(476003)(99286004)(52116002)(6506007)(102836004)(5640700003)(25786009)(6512007)(66066001)(54906003)(386003)(76176011)(14444005)(256004)(2906002)(66476007)(64756008)(186003)(26005)(86362001)(66946007)(66446008)(66556008)(73956011)(6116002)(6486002)(11346002)(2616005)(5660300002)(478600001)(2501003)(6916009)(3846002)(14454004)(446003)(72206003)(316002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2339;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RhDF9TMnwcd1/y817TcYDRDspmQldXcZ+6k7gar6ToTeR++ozPekwnR3xh8xwqr/BqHZwLFUBHDCmCeMSzPqMryXIqZ3y0fotJiunLNKSs9id9cKVpftsIfIjnl+1wJhf2jbaYmY33mDEMZMJGMMyOX67P1i1GCwULN7PxUviDrqA6++221Wj6vvEO7TQmzTkTWzjWW2l6GlBjSIB13D+8eHwwgZZRtsAkUmTNcACcfUii8oyNMMax6Unxb5mTREgaCex85UCKqZXD5oqp1FOaro6lTQRWf+Kbx4Il8hNprJFRrDfOEF0HMleJpxeFBepre1XCRQjh6oggi0xTZmkG7SL2zbe3wf6BGYAnSM5hU3P0Lkw+13mtxTVEvYE/ZHMSxH5OsU8w+ykg4WYdFBocxP16F/YLDnR/WsJLGPe94=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a907e2-0a62-4703-a645-08d6dfae3694
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 18:41:05.7176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2339
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+y1rS/kfEnT/qSWYGmX286BrHbL33rhVBWsDTvLbwQE=;
 b=pWil0sRGm4JX1nDGJ58yzWgk4u+4l176SBHunvNOLXpjVEseXQyrNbASQDhK+tAqpKBBgU8+49F3wJadt3wKeJjXbiSah6xhhrv8X0r7w9KODSjfZ1DRPDpCo/2F/LTxsmuBVNBe1kwWn2pdwqinbPgvdadHUipIg6w/EY7G62c=
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

QWRkIGEgbmV3IGtmZCBpb2N0bCB0byBhbGxvY2F0ZSBxdWV1ZSBHV1MuIFF1ZXVlDQpHV1MgaXMg
cmVsZWFzZWQgb24gcXVldWUgZGVzdHJveS4NCg0KQ2hhbmdlLUlkOiBJNjAxNTNjMjZhNTc3OTky
YWQ4NzNlNDI5MmU3NTllNWMzZDViYmQxNQ0KU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5a
ZW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRl
di5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogaW5jbHVkZS91YXBpL2xp
bnV4L2tmZF9pb2N0bC5oICAgICAgICAgICB8IDIwICsrKysrKysrKysrKysrKysrKystDQogMiBm
aWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KaW5kZXggMzhhZTUzZi4uZjNmMDhmZSAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMNCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMNCkBAIC0xNTU5LDYg
KzE1NTksMzQgQEAgc3RhdGljIGludCBrZmRfaW9jdGxfdW5tYXBfbWVtb3J5X2Zyb21fZ3B1KHN0
cnVjdCBmaWxlICpmaWxlcCwNCiAJcmV0dXJuIGVycjsNCiB9DQogDQorc3RhdGljIGludCBrZmRf
aW9jdGxfYWxsb2NfcXVldWVfZ3dzKHN0cnVjdCBmaWxlICpmaWxlcCwNCisJCXN0cnVjdCBrZmRf
cHJvY2VzcyAqcCwgdm9pZCAqZGF0YSkNCit7DQorCWludCByZXR2YWw7DQorCXN0cnVjdCBrZmRf
aW9jdGxfYWxsb2NfcXVldWVfZ3dzX2FyZ3MgKmFyZ3MgPSBkYXRhOw0KKwlzdHJ1Y3Qga2ZkX2Rl
diAqZGV2ID0gTlVMTDsNCisNCisJaWYgKGFyZ3MtPm51bV9nd3MgPT0gMCkNCisJCXJldHVybiAt
RUlOVkFMOw0KKw0KKwlpZiAoIWh3c19nd3Nfc3VwcG9ydCB8fA0KKwkJZGV2LT5kcW0tPnNjaGVk
X3BvbGljeSA9PSBLRkRfU0NIRURfUE9MSUNZX05PX0hXUykNCisJCXJldHVybiAtRUlOVkFMOw0K
Kw0KKwlkZXYgPSBrZmRfZGV2aWNlX2J5X2lkKGFyZ3MtPmdwdV9pZCk7DQorCWlmICghZGV2KSB7
DQorCQlwcl9kZWJ1ZygiQ291bGQgbm90IGZpbmQgZ3B1IGlkIDB4JXhcbiIsIGFyZ3MtPmdwdV9p
ZCk7DQorCQlyZXR1cm4gLUVJTlZBTDsNCisJfQ0KKw0KKwltdXRleF9sb2NrKCZwLT5tdXRleCk7
DQorCXJldHZhbCA9IHBxbV9zZXRfZ3dzKCZwLT5wcW0sIGFyZ3MtPnF1ZXVlX2lkLCBkZXYtPmd3
cyk7DQorCW11dGV4X3VubG9jaygmcC0+bXV0ZXgpOw0KKw0KKwlhcmdzLT5maXJzdF9nd3MgPSAw
Ow0KKwlyZXR1cm4gcmV0dmFsOw0KK30NCisNCiBzdGF0aWMgaW50IGtmZF9pb2N0bF9nZXRfZG1h
YnVmX2luZm8oc3RydWN0IGZpbGUgKmZpbGVwLA0KIAkJc3RydWN0IGtmZF9wcm9jZXNzICpwLCB2
b2lkICpkYXRhKQ0KIHsNCkBAIC0xNzYxLDYgKzE3ODksOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGFtZGtmZF9pb2N0bF9kZXNjIGFtZGtmZF9pb2N0bHNbXSA9IHsNCiAJQU1ES0ZEX0lPQ1RMX0RF
RihBTURLRkRfSU9DX0lNUE9SVF9ETUFCVUYsDQogCQkJCWtmZF9pb2N0bF9pbXBvcnRfZG1hYnVm
LCAwKSwNCiANCisJQU1ES0ZEX0lPQ1RMX0RFRihBTURLRkRfSU9DX0FMTE9DX1FVRVVFX0dXUywN
CisJCQlrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzLCAwKSwNCiB9Ow0KIA0KICNkZWZpbmUgQU1E
S0ZEX0NPUkVfSU9DVExfQ09VTlQJQVJSQVlfU0laRShhbWRrZmRfaW9jdGxzKQ0KZGlmZiAtLWdp
dCBhL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9r
ZmRfaW9jdGwuaA0KaW5kZXggMjA5MTdjNS4uMDcwZDFiYyAxMDA2NDQNCi0tLSBhL2luY2x1ZGUv
dWFwaS9saW51eC9rZmRfaW9jdGwuaA0KKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2tmZF9pb2N0
bC5oDQpAQCAtNDEwLDYgKzQxMCwyMSBAQCBzdHJ1Y3Qga2ZkX2lvY3RsX3VubWFwX21lbW9yeV9m
cm9tX2dwdV9hcmdzIHsNCiAJX191MzIgbl9zdWNjZXNzOwkJLyogdG8vZnJvbSBLRkQgKi8NCiB9
Ow0KIA0KKy8qIEFsbG9jYXRlIEdXUyBmb3Igc3BlY2lmaWMgcXVldWUNCisgKg0KKyAqIEBncHVf
aWQ6ICAgICAgZGV2aWNlIGlkZW50aWZpZXINCisgKiBAcXVldWVfaWQ6ICAgIHF1ZXVlJ3MgaWQg
dGhhdCBHV1MgaXMgYWxsb2NhdGVkIGZvcg0KKyAqIEBudW1fZ3dzOiAgICAgaG93IG1hbnkgR1dT
IHRvIGFsbG9jYXRlDQorICogQGZpcnN0X2d3czogICBpbmRleCBvZiB0aGUgZmlyc3QgR1dTIGFs
bG9jYXRlZC4NCisgKiAgICAgICAgICAgICAgIG9ubHkgc3VwcG9ydCBjb250aWd1b3VzIEdXUyBh
bGxvY2F0aW9uDQorICovDQorc3RydWN0IGtmZF9pb2N0bF9hbGxvY19xdWV1ZV9nd3NfYXJncyB7
DQorCV9fdTMyIGdwdV9pZDsJCS8qIHRvIEtGRCAqLw0KKwlfX3UzMiBxdWV1ZV9pZDsJCS8qIHRv
IEtGRCAqLw0KKwlfX3UzMiBudW1fZ3dzOwkJLyogdG8gS0ZEICovDQorCV9fdTMyIGZpcnN0X2d3
czsJLyogZnJvbSBLRkQgKi8NCit9Ow0KKw0KIHN0cnVjdCBrZmRfaW9jdGxfZ2V0X2RtYWJ1Zl9p
bmZvX2FyZ3Mgew0KIAlfX3U2NCBzaXplOwkJLyogZnJvbSBLRkQgKi8NCiAJX191NjQgbWV0YWRh
dGFfcHRyOwkvKiB0byBLRkQgKi8NCkBAIC01MjksNyArNTQ0LDEwIEBAIGVudW0ga2ZkX21taW9f
cmVtYXAgew0KICNkZWZpbmUgQU1ES0ZEX0lPQ19JTVBPUlRfRE1BQlVGCQlcDQogCQlBTURLRkRf
SU9XUigweDFELCBzdHJ1Y3Qga2ZkX2lvY3RsX2ltcG9ydF9kbWFidWZfYXJncykNCiANCisjZGVm
aW5lIEFNREtGRF9JT0NfQUxMT0NfUVVFVUVfR1dTCQlcDQorCQlBTURLRkRfSU9XUigweDFFLCBz
dHJ1Y3Qga2ZkX2lvY3RsX2FsbG9jX3F1ZXVlX2d3c19hcmdzKQ0KKw0KICNkZWZpbmUgQU1ES0ZE
X0NPTU1BTkRfU1RBUlQJCTB4MDENCi0jZGVmaW5lIEFNREtGRF9DT01NQU5EX0VORAkJMHgxRQ0K
KyNkZWZpbmUgQU1ES0ZEX0NPTU1BTkRfRU5ECQkweDFGDQogDQogI2VuZGlmDQotLSANCjIuNy40
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
