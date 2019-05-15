Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E4B1FB91
	for <lists+amd-gfx@lfdr.de>; Wed, 15 May 2019 22:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEA68925E;
	Wed, 15 May 2019 20:38:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770080.outbound.protection.outlook.com [40.107.77.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F8589257
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 20:37:59 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2354.namprd12.prod.outlook.com (52.132.10.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Wed, 15 May 2019 20:37:58 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 20:37:58 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 6/7] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Topic: [PATCH 6/7] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Index: AQHVC14U4ss6Lgu5jUKe3Nyldkdp1w==
Date: Wed, 15 May 2019 20:37:58 +0000
Message-ID: <1557952664-12218-6-git-send-email-Oak.Zeng@amd.com>
References: <1557952664-12218-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1557952664-12218-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::17) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 783cf183-fb1a-4ae6-3668-08d6d9753716
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2354; 
x-ms-traffictypediagnostic: BL0PR12MB2354:
x-microsoft-antispam-prvs: <BL0PR12MB23540062E0D1C7658328ADF580090@BL0PR12MB2354.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(376002)(136003)(39860400002)(396003)(189003)(199004)(53936002)(52116002)(66556008)(64756008)(26005)(81156014)(2351001)(66476007)(81166006)(99286004)(71200400001)(50226002)(2501003)(7736002)(2906002)(36756003)(66066001)(8676002)(54906003)(6116002)(3846002)(76176011)(71190400001)(8936002)(186003)(5660300002)(305945005)(14444005)(102836004)(66446008)(316002)(386003)(6506007)(6916009)(256004)(486006)(4326008)(6436002)(86362001)(478600001)(25786009)(446003)(68736007)(73956011)(11346002)(66946007)(72206003)(2616005)(476003)(5640700003)(6512007)(14454004)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2354;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gJ7VKOQGEaTbVnKmE3WLM5XxR8NisjKz1NtD7LLr7OsD0/mORq2uGANU51tmsXFa031TRb64mT8DyO+zln7DRyocLdQIn2dF0/k7jT4etKF0qwMWr+6a+1e2zQKM9uCm3al2cFwWnpHxaebWaeApEqRPGp327135eInAXwFnWVWPCKsB/UXRw9AhFGTPQGwEnepKHmUdqwLtrav3geUaUXPXG+WzkXv/YFcJXRWTUnXR57K6VP54/OvKLl+bQLVpPymuD4+gdJ2u/n9TfxHiMrI1ovSdtr/cmZ9lQdWRPSlfbuHhWP+WQiKJpVBQscAaffMEvCRSa4yrvc1aPrvoT7g4wt0L5sLcs1LOC8nu2urxbGZjntNTQK3UOL98v2vM4tdXKhI8lZhB74qnym6ccrOHftGAXQ1tb9AqwSsRDVk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 783cf183-fb1a-4ae6-3668-08d6d9753716
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 20:37:58.0755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gLKVIUD5p5EUtTgnWM3qx/QCuVGYMFxq148pxkH2NQ=;
 b=IOuOyguCuBmoA2RLeMmH0cPIrn1n0iYUBUXuUCCo97a5P0LXKXFMW/gtbSWhkYY4vN4BtjaBRB/zFHVUiLfrMBDbxvrMThY4uQefppGFpxj67tcfiWQYZNgcFwOlHSw2X4xRKVOsfXQvHSOUqwTSJi549RQVDb0CihsjZ/zoeJ4=
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
di5jICAgICAgICAgICB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysNCiAuLi4vZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyB8ICA2ICsrKysNCiBpbmNsdWRl
L3VhcGkvbGludXgva2ZkX2lvY3RsLmggICAgICAgICAgICAgICAgICAgICB8IDIwICsrKysrKysr
KystDQogMyBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KaW5kZXggMzhhZTUzZi4u
ODI4YmQ2NiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFy
ZGV2LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMNCkBA
IC0xNTU5LDYgKzE1NTksNDMgQEAgc3RhdGljIGludCBrZmRfaW9jdGxfdW5tYXBfbWVtb3J5X2Zy
b21fZ3B1KHN0cnVjdCBmaWxlICpmaWxlcCwNCiAJcmV0dXJuIGVycjsNCiB9DQogDQorc3RhdGlj
IGludCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzKHN0cnVjdCBmaWxlICpmaWxlcCwNCisJCXN0
cnVjdCBrZmRfcHJvY2VzcyAqcCwgdm9pZCAqZGF0YSkNCit7DQorCWludCByZXR2YWw7DQorCXN0
cnVjdCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzX2FyZ3MgKmFyZ3MgPSBkYXRhOw0KKwlzdHJ1
Y3Qga2ZkX2RldiAqZGV2ID0gTlVMTDsNCisJc3RydWN0IGtnZF9tZW0gKm1lbTsNCisNCisJaWYg
KGFyZ3MtPm51bV9nd3MgPT0gMCkNCisJCXJldHVybiAtRUlOVkFMOw0KKw0KKwlpZiAoIWh3c19n
d3Nfc3VwcG9ydCB8fA0KKwkJZGV2LT5kcW0tPnNjaGVkX3BvbGljeSA9PSBLRkRfU0NIRURfUE9M
SUNZX05PX0hXUykNCisJCXJldHVybiAtRUlOVkFMOw0KKw0KKwlkZXYgPSBrZmRfZGV2aWNlX2J5
X2lkKGFyZ3MtPmdwdV9pZCk7DQorCWlmICghZGV2KSB7DQorCQlwcl9kZWJ1ZygiQ291bGQgbm90
IGZpbmQgZ3B1IGlkIDB4JXhcbiIsIGFyZ3MtPmdwdV9pZCk7DQorCQlyZXR1cm4gLUVJTlZBTDsN
CisJfQ0KKw0KKwlyZXR2YWwgPSBhbWRncHVfYW1ka2ZkX2FkZF9nd3NfdG9fcHJvY2VzcyhwLT5r
Z2RfcHJvY2Vzc19pbmZvLA0KKwkJCWRldi0+Z3dzLCAmbWVtKTsNCisJaWYgKHVubGlrZWx5KHJl
dHZhbCkpDQorCQlyZXR1cm4gcmV0dmFsOw0KKw0KKwltdXRleF9sb2NrKCZwLT5tdXRleCk7DQor
CXJldHZhbCA9IHBxbV9zZXRfZ3dzKCZwLT5wcW0sIGFyZ3MtPnF1ZXVlX2lkLCBtZW0pOw0KKwlt
dXRleF91bmxvY2soJnAtPm11dGV4KTsNCisNCisJaWYgKHVubGlrZWx5KHJldHZhbCkpDQorCQlh
bWRncHVfYW1ka2ZkX3JlbW92ZV9nd3NfZnJvbV9wcm9jZXNzKHAtPmtnZF9wcm9jZXNzX2luZm8s
IG1lbSk7DQorDQorCWFyZ3MtPmZpcnN0X2d3cyA9IDA7DQorCXJldHVybiByZXR2YWw7DQorfQ0K
Kw0KIHN0YXRpYyBpbnQga2ZkX2lvY3RsX2dldF9kbWFidWZfaW5mbyhzdHJ1Y3QgZmlsZSAqZmls
ZXAsDQogCQlzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnAsIHZvaWQgKmRhdGEpDQogew0KQEAgLTE3NjEs
NiArMTc5OCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1ka2ZkX2lvY3RsX2Rlc2MgYW1ka2Zk
X2lvY3Rsc1tdID0gew0KIAlBTURLRkRfSU9DVExfREVGKEFNREtGRF9JT0NfSU1QT1JUX0RNQUJV
RiwNCiAJCQkJa2ZkX2lvY3RsX2ltcG9ydF9kbWFidWYsIDApLA0KIA0KKwlBTURLRkRfSU9DVExf
REVGKEFNREtGRF9JT0NfQUxMT0NfUVVFVUVfR1dTLA0KKwkJCWtmZF9pb2N0bF9hbGxvY19xdWV1
ZV9nd3MsIDApLA0KIH07DQogDQogI2RlZmluZSBBTURLRkRfQ09SRV9JT0NUTF9DT1VOVAlBUlJB
WV9TSVpFKGFtZGtmZF9pb2N0bHMpDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jDQppbmRleCA4ZTQ1Mjk2Li5lMTVhZDQ4
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVl
dWVfbWFuYWdlci5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vz
c19xdWV1ZV9tYW5hZ2VyLmMNCkBAIC0zNjMsNiArMzYzLDEyIEBAIGludCBwcW1fZGVzdHJveV9x
dWV1ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sIHVuc2lnbmVkIGludCBxaWQp
DQogCQlyZXR1cm4gLTE7DQogCX0NCiANCisJaWYgKHBxbV9nZXRfZ3dzKHBxbSwgcWlkKSkgew0K
KwkJYW1kZ3B1X2FtZGtmZF9yZW1vdmVfZ3dzX2Zyb21fcHJvY2VzcyhwcW0tPnByb2Nlc3MtPmtn
ZF9wcm9jZXNzX2luZm8sDQorCQkJCXBxbV9nZXRfZ3dzKHBxbSwgcWlkKSk7DQorCQlwcW1fc2V0
X2d3cyhwcW0sIHFpZCwgTlVMTCk7DQorCX0NCisNCiAJaWYgKHBxbi0+a3EpIHsNCiAJCS8qIGRl
c3Ryb3kga2VybmVsIHF1ZXVlIChESVEpICovDQogCQlkcW0gPSBwcW4tPmtxLT5kZXYtPmRxbTsN
CmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva2ZkX2lvY3RsLmggYi9pbmNsdWRlL3Vh
cGkvbGludXgva2ZkX2lvY3RsLmgNCmluZGV4IDIwOTE3YzUuLjkxMmQ2OTAgMTAwNjQ0DQotLS0g
YS9pbmNsdWRlL3VhcGkvbGludXgva2ZkX2lvY3RsLmgNCisrKyBiL2luY2x1ZGUvdWFwaS9saW51
eC9rZmRfaW9jdGwuaA0KQEAgLTQxMCw2ICs0MTAsMjEgQEAgc3RydWN0IGtmZF9pb2N0bF91bm1h
cF9tZW1vcnlfZnJvbV9ncHVfYXJncyB7DQogCV9fdTMyIG5fc3VjY2VzczsJCS8qIHRvL2Zyb20g
S0ZEICovDQogfTsNCiANCisvKiBBbGxvY2F0ZSBHV1MgZm9yIHNwZWNpZmljIHF1ZXVlDQorICoN
CisgKiBAZ3B1X2lkOiAgICAgIGRldmljZSBpZGVudGlmaWVyDQorICogQHF1ZXVlX2lkOiAgICBx
dWV1ZSdzIGlkIHRoYXQgR1dTIGlzIGFsbG9jYXRlZCBmb3INCisgKiBAbnVtX2d3czogICAgIGhv
dyBtYW55IEdXUyB0byBhbGxvY2F0ZQ0KKyAqIEBmaXJzdF9nd3M6ICAgaW5kZXggb2YgdGhlIGZp
cnN0IEdXUyBhbGxvY2F0ZWQuDQorICogICAgICAgICAgICAgICBvbmx5IHN1cHBvcnQgY29udGln
dW91cyBHV1MgYWxsb2NhdGlvbg0KKyAqLw0KK3N0cnVjdCBrZmRfaW9jdGxfYWxsb2NfcXVldWVf
Z3dzX2FyZ3Mgew0KKwlfX3UzMiBncHVfaWQ7CQkvKiB0byBLRkQgKi8NCisJX191MzIgcXVldWVf
aWQ7CQkvKiB0byBLRkQgKi8NCisJX191MzIgbnVtX2d3czsJCS8qIHRvIEtGRCAqLw0KKwlfX3Uz
MiBmaXJzdF9nd3M7CS8qIGZyb20gS0ZEICovDQorfTsNCisNCiBzdHJ1Y3Qga2ZkX2lvY3RsX2dl
dF9kbWFidWZfaW5mb19hcmdzIHsNCiAJX191NjQgc2l6ZTsJCS8qIGZyb20gS0ZEICovDQogCV9f
dTY0IG1ldGFkYXRhX3B0cjsJLyogdG8gS0ZEICovDQpAQCAtNTI5LDcgKzU0NCwxMCBAQCBlbnVt
IGtmZF9tbWlvX3JlbWFwIHsNCiAjZGVmaW5lIEFNREtGRF9JT0NfSU1QT1JUX0RNQUJVRgkJXA0K
IAkJQU1ES0ZEX0lPV1IoMHgxRCwgc3RydWN0IGtmZF9pb2N0bF9pbXBvcnRfZG1hYnVmX2FyZ3Mp
DQogDQorI2RlZmluZSBBTURLRkRfSU9DX0FMTE9DX1FVRVVFX0dXUwkJXA0KKwkJQU1ES0ZEX0lP
V1IoMHgyMiwgc3RydWN0IGtmZF9pb2N0bF9hbGxvY19xdWV1ZV9nd3NfYXJncykNCisNCiAjZGVm
aW5lIEFNREtGRF9DT01NQU5EX1NUQVJUCQkweDAxDQotI2RlZmluZSBBTURLRkRfQ09NTUFORF9F
TkQJCTB4MUUNCisjZGVmaW5lIEFNREtGRF9DT01NQU5EX0VORAkJMHgyMw0KIA0KICNlbmRpZg0K
LS0gDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
