Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84D31BD6A
	for <lists+amd-gfx@lfdr.de>; Mon, 13 May 2019 20:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B09289110;
	Mon, 13 May 2019 18:50:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700040.outbound.protection.outlook.com [40.107.70.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4851989110
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 18:50:14 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2514.namprd12.prod.outlook.com (52.132.11.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Mon, 13 May 2019 18:50:04 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 18:50:04 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 7/8] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Topic: [PATCH 7/8] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Index: AQHVCbytQn+XY/x6hEeNtjbgdjLBVg==
Date: Mon, 13 May 2019 18:50:04 +0000
Message-ID: <1557773393-13707-3-git-send-email-Oak.Zeng@amd.com>
References: <1557773393-13707-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1557773393-13707-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::35) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84239c8e-2489-4bab-741f-08d6d7d3cf86
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2514; 
x-ms-traffictypediagnostic: BL0PR12MB2514:
x-microsoft-antispam-prvs: <BL0PR12MB25147A49A4486D9F62651661800F0@BL0PR12MB2514.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(366004)(346002)(39860400002)(376002)(199004)(189003)(76176011)(25786009)(4326008)(99286004)(2501003)(52116002)(53936002)(54906003)(386003)(6506007)(2351001)(102836004)(36756003)(66066001)(476003)(2616005)(11346002)(446003)(486006)(6436002)(5640700003)(305945005)(6916009)(186003)(26005)(14454004)(6486002)(6116002)(3846002)(7736002)(66476007)(71190400001)(6512007)(71200400001)(68736007)(2906002)(5660300002)(50226002)(316002)(8936002)(81156014)(81166006)(8676002)(86362001)(478600001)(66556008)(64756008)(66446008)(72206003)(73956011)(14444005)(256004)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2514;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SL92SPSziegM1ASJK1H5bwhs1VmTPkjx3ZLqMhcm+fWnJQV5wtONatR6yWE6HSPwKtyLL+yPDFO73QTo+3ge5MaROzgw2W2IPlv/7U1oGSswKNFi8ttq1kIMtpqWFpZjBhupMJJTFFwvmK0zTJXoNnlf72qUyJlqU/KdSC2TDlJNVDo4/uCRwQvKMpcmDb7kzQ6jr6rxsewWBZlPWBSGMDaXXBzAtKC0K5k2jmQPzfQ8sYVXIYm64U9wpwANTAqBWH5PTdsz35YkFW+qxMDrFcCbl9sH5ul2jiw1BT9Uoi/NDwK1YGyCYGlfSMwpOcRdeQuCY3KknaHqeg78pBL/E6+FOFf3gTA1xqUkK7gQmBmmOJeI03NXABLXCiABe3z+DS5Mm2dbm+8KvTJxtyaBf9jkeFnY0QMXbMlw6m4JRB0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84239c8e-2489-4bab-741f-08d6d7d3cf86
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 18:50:04.5077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2514
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gLKVIUD5p5EUtTgnWM3qx/QCuVGYMFxq148pxkH2NQ=;
 b=slTnT8JE35XQ6igoQV5J+isBD8COK+4PczsIl4mJwmwrHI0DNMp/tVFsns9JUzy0nE75NxJ2xmgicDsVObigVWjmoiGo+9ytG56kA6ZPTaG0AhRWNRzAKgkDFYjM/eX40ZRwjjYa/H0CGlCDc6pqe7ALrtph5IfXCqc6mbgCc8I=
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
