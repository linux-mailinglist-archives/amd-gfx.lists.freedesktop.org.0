Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 438C41A0EC
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 18:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1666E792;
	Fri, 10 May 2019 16:01:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750049.outbound.protection.outlook.com [40.107.75.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CC56E799
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 16:01:33 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2577.namprd12.prod.outlook.com (52.132.27.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.14; Fri, 10 May 2019 16:01:31 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1856.012; Fri, 10 May 2019
 16:01:31 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 7/8] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Topic: [PATCH 7/8] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Index: AQHVB0mht++g2T+YgU2W1OlRt7Gimw==
Date: Fri, 10 May 2019 16:01:30 +0000
Message-ID: <1557504063-1559-7-git-send-email-Oak.Zeng@amd.com>
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
x-ms-office365-filtering-correlation-id: 33329c87-5643-489b-608e-08d6d560c449
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2577; 
x-ms-traffictypediagnostic: BL0PR12MB2577:
x-microsoft-antispam-prvs: <BL0PR12MB25779968BDB6347808EBF1B3800C0@BL0PR12MB2577.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(366004)(136003)(189003)(199004)(99286004)(76176011)(6916009)(6436002)(5660300002)(68736007)(102836004)(386003)(486006)(86362001)(4326008)(2501003)(6486002)(54906003)(256004)(316002)(7736002)(14444005)(305945005)(53936002)(8936002)(81156014)(52116002)(2351001)(476003)(6506007)(6512007)(2616005)(478600001)(2906002)(14454004)(5640700003)(81166006)(66446008)(64756008)(25786009)(71190400001)(66556008)(71200400001)(66476007)(11346002)(66066001)(3846002)(6116002)(66946007)(446003)(36756003)(72206003)(73956011)(8676002)(186003)(26005)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2577;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OmI89bVNENTqNFrFutfZeGIk3lcMvic79dyLMELpQ5EmaR5Y1F9pRaeUaSAd+KNzMul1AqAdItPLIgTtWS+KOz6GcQe5UF2ivFz51Gh2NcnXPZ6PE8qFpeUKJKl/V5OwJH6ERgl1xbc+9cWkz1Rdsxb5LNVJGLnr5DJ3kKXLFQG7EBwKwwQDPU1+zXFAmof1vrWwsFmzhyAO2+lgIe+Wbvvt9hllQua4IbwkKsJIfIXgaOSSz0J58LLyLS6itA4nxK/YxRZql9DUoPu6/MEbUB6XKbTG/LnEA0KS8tWSNQrmnIwnxA7eiTMnUurCKdkLPKYVtJ3GEKfTdMg39dGavz55RWLhHAiW54Y8y85l2iYN2DwZTCquGLstybp6Iqr9eVyXZRRbiuJtCG2+3ocBWxqz+7Gh+GYmCe64a1LEuaI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33329c87-5643-489b-608e-08d6d560c449
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 16:01:30.8822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2577
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOOCIuZ2Dgcx/5RcfMma5BAC5H9w4VqlPkLefmzSED0=;
 b=YGPxKQ8P75qiTskJZ7Z4DOdtg71Riw2utI5hhEoElOH94NUeA7rOVVeI79W0KZ0kP4YO++/pTa7NDQC+anYaCFFPH2hEQXea8dULBd1cgmuSqpAbEodr1eNj0w3ucGrKvzEx6YST3+tluQGOnO/MVMHpPWOexUJCNZ+B8VHv23I=
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
di5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiBpbmNsdWRlL3VhcGkv
bGludXgva2ZkX2lvY3RsLmggICAgICAgICAgIHwgMTkgKysrKysrKysrKysrKy0NCiAyIGZpbGVz
IGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jDQppbmRleCAzOGFlNTNmLi4xN2RkOTcwIDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KQEAgLTMzOCw2ICszMzgs
MTEgQEAgc3RhdGljIGludCBrZmRfaW9jdGxfZGVzdHJveV9xdWV1ZShzdHJ1Y3QgZmlsZSAqZmls
cCwgc3RydWN0IGtmZF9wcm9jZXNzICpwLA0KIA0KIAltdXRleF9sb2NrKCZwLT5tdXRleCk7DQog
DQorCWlmIChwcW1fZ2V0X2d3cygmcC0+cHFtLCBhcmdzLT5xdWV1ZV9pZCkpIHsNCisJCWFtZGdw
dV9hbWRrZmRfcmVtb3ZlX2d3c19mcm9tX3Byb2Nlc3MocC0+a2dkX3Byb2Nlc3NfaW5mbywNCisJ
CQkJcHFtX2dldF9nd3MoJnAtPnBxbSwgYXJncy0+cXVldWVfaWQpKTsNCisJCXBxbV9zZXRfZ3dz
KCZwLT5wcW0sIGFyZ3MtPnF1ZXVlX2lkLCBOVUxMKTsNCisJfQ0KIAlyZXR2YWwgPSBwcW1fZGVz
dHJveV9xdWV1ZSgmcC0+cHFtLCBhcmdzLT5xdWV1ZV9pZCk7DQogDQogCW11dGV4X3VubG9jaygm
cC0+bXV0ZXgpOw0KQEAgLTE1NTksNiArMTU2NCw0NCBAQCBzdGF0aWMgaW50IGtmZF9pb2N0bF91
bm1hcF9tZW1vcnlfZnJvbV9ncHUoc3RydWN0IGZpbGUgKmZpbGVwLA0KIAlyZXR1cm4gZXJyOw0K
IH0NCiANCitzdGF0aWMgaW50IGtmZF9pb2N0bF9hbGxvY19xdWV1ZV9nd3Moc3RydWN0IGZpbGUg
KmZpbGVwLA0KKwkJc3RydWN0IGtmZF9wcm9jZXNzICpwLCB2b2lkICpkYXRhKQ0KK3sNCisJaW50
IHJldHZhbDsNCisJc3RydWN0IGtmZF9pb2N0bF9hbGxvY19xdWV1ZV9nd3NfYXJncyAqYXJncyA9
IGRhdGE7DQorCXN0cnVjdCBrZmRfZGV2ICpkZXYgPSBOVUxMOw0KKwlzdHJ1Y3Qga2dkX21lbSAq
bWVtOw0KKw0KKwlpZiAoYXJncy0+bnVtX2d3cyA9PSAwKQ0KKwkJcmV0dXJuIC1FSU5WQUw7DQor
DQorCWlmICghaHdzX2d3c19zdXBwb3J0IHx8DQorCQlkZXYtPmRxbS0+c2NoZWRfcG9saWN5ID09
IEtGRF9TQ0hFRF9QT0xJQ1lfTk9fSFdTKQ0KKwkJcmV0dXJuIC1FSU5WQUw7DQorDQorCWRldiA9
IGtmZF9kZXZpY2VfYnlfaWQoYXJncy0+Z3B1X2lkKTsNCisJaWYgKCFkZXYpIHsNCisJCXByX2Rl
YnVnKCJDb3VsZCBub3QgZmluZCBncHUgaWQgMHgleFxuIiwgYXJncy0+Z3B1X2lkKTsNCisJCXJl
dHVybiAtRUlOVkFMOw0KKwl9DQorDQorCXJldHZhbCA9IGFtZGdwdV9hbWRrZmRfYWRkX2d3c190
b19wcm9jZXNzKHAtPmtnZF9wcm9jZXNzX2luZm8sDQorCQkJZGV2LT5nd3MsICZtZW0pOw0KKwlp
ZiAodW5saWtlbHkocmV0dmFsKSkNCisJCXJldHVybiByZXR2YWw7DQorDQorCW11dGV4X2xvY2so
JnAtPm11dGV4KTsNCisJcmV0dmFsID0gcHFtX3NldF9nd3MoJnAtPnBxbSwgYXJncy0+cXVldWVf
aWQsIG1lbSk7DQorCW11dGV4X3VubG9jaygmcC0+bXV0ZXgpOw0KKw0KKwlpZiAodW5saWtlbHko
cmV0dmFsKSkNCisJCWFtZGdwdV9hbWRrZmRfcmVtb3ZlX2d3c19mcm9tX3Byb2Nlc3MocC0+a2dk
X3Byb2Nlc3NfaW5mbywgbWVtKTsNCisNCisJLyogVGhlIGd3c19hcnJheSBwYXJhbWV0ZXIgaXMg
cmVzZXJ2ZWQgZm9yIGZ1dHVyZSBleHRlbnNpb24qLw0KKwlhcmdzLT5nd3NfYXJyYXlbMF0gPSAw
Ow0KKwlyZXR1cm4gcmV0dmFsOw0KK30NCisNCiBzdGF0aWMgaW50IGtmZF9pb2N0bF9nZXRfZG1h
YnVmX2luZm8oc3RydWN0IGZpbGUgKmZpbGVwLA0KIAkJc3RydWN0IGtmZF9wcm9jZXNzICpwLCB2
b2lkICpkYXRhKQ0KIHsNCkBAIC0xNzYxLDYgKzE4MDQsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGFtZGtmZF9pb2N0bF9kZXNjIGFtZGtmZF9pb2N0bHNbXSA9IHsNCiAJQU1ES0ZEX0lPQ1RMX0RF
RihBTURLRkRfSU9DX0lNUE9SVF9ETUFCVUYsDQogCQkJCWtmZF9pb2N0bF9pbXBvcnRfZG1hYnVm
LCAwKSwNCiANCisJQU1ES0ZEX0lPQ1RMX0RFRihBTURLRkRfSU9DX0FMTE9DX1FVRVVFX0dXUywN
CisJCQlrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzLCAwKSwNCiB9Ow0KIA0KICNkZWZpbmUgQU1E
S0ZEX0NPUkVfSU9DVExfQ09VTlQJQVJSQVlfU0laRShhbWRrZmRfaW9jdGxzKQ0KZGlmZiAtLWdp
dCBhL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9r
ZmRfaW9jdGwuaA0KaW5kZXggMjA5MTdjNS4uMTk2NGFiMiAxMDA2NDQNCi0tLSBhL2luY2x1ZGUv
dWFwaS9saW51eC9rZmRfaW9jdGwuaA0KKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2tmZF9pb2N0
bC5oDQpAQCAtNDEwLDYgKzQxMCwyMCBAQCBzdHJ1Y3Qga2ZkX2lvY3RsX3VubWFwX21lbW9yeV9m
cm9tX2dwdV9hcmdzIHsNCiAJX191MzIgbl9zdWNjZXNzOwkJLyogdG8vZnJvbSBLRkQgKi8NCiB9
Ow0KIA0KKy8qIEFsbG9jYXRlIEdXUyBmb3Igc3BlY2lmaWMgcXVldWUNCisgKg0KKyAqIEBncHVf
aWQ6ICAgICAgZGV2aWNlIGlkZW50aWZpZXINCisgKiBAcXVldWVfaWQ6ICAgIHF1ZXVlJ3MgaWQg
dGhhdCBHV1MgaXMgYWxsb2NhdGVkIGZvcg0KKyAqIEBudW1fZ3dzOiAgICAgaG93IG1hbnkgR1dT
IHRvIGFsbG9jYXRlDQorICogQGd3c19hcnJheTogICB1c2VkIHRvIHJldHVybiB0aGUgYWxsb2Nh
dGVkIGd3cw0KKyAqLw0KK3N0cnVjdCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzX2FyZ3Mgew0K
KwlfX3UzMiBncHVfaWQ7CQkvKiB0byBLRkQgKi8NCisJX191MzIgcXVldWVfaWQ7CQkvKiB0byBL
RkQgKi8NCisJX191MzIgbnVtX2d3czsJCS8qIHRvIEtGRCAqLw0KKwlfX3UzMiAqZ3dzX2FycmF5
OwkvKiBmcm9tIEtGRCAqLw0KK307DQorDQogc3RydWN0IGtmZF9pb2N0bF9nZXRfZG1hYnVmX2lu
Zm9fYXJncyB7DQogCV9fdTY0IHNpemU7CQkvKiBmcm9tIEtGRCAqLw0KIAlfX3U2NCBtZXRhZGF0
YV9wdHI7CS8qIHRvIEtGRCAqLw0KQEAgLTUyOSw3ICs1NDMsMTAgQEAgZW51bSBrZmRfbW1pb19y
ZW1hcCB7DQogI2RlZmluZSBBTURLRkRfSU9DX0lNUE9SVF9ETUFCVUYJCVwNCiAJCUFNREtGRF9J
T1dSKDB4MUQsIHN0cnVjdCBrZmRfaW9jdGxfaW1wb3J0X2RtYWJ1Zl9hcmdzKQ0KIA0KKyNkZWZp
bmUgQU1ES0ZEX0lPQ19BTExPQ19RVUVVRV9HV1MJCVwNCisJCUFNREtGRF9JT1dSKDB4MUUsIHN0
cnVjdCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzX2FyZ3MpDQorDQogI2RlZmluZSBBTURLRkRf
Q09NTUFORF9TVEFSVAkJMHgwMQ0KLSNkZWZpbmUgQU1ES0ZEX0NPTU1BTkRfRU5ECQkweDFFDQor
I2RlZmluZSBBTURLRkRfQ09NTUFORF9FTkQJCTB4MUYNCiANCiAjZW5kaWYNCi0tIA0KMi43LjQN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
