Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0EE28D57
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 00:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9A46E093;
	Thu, 23 May 2019 22:41:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760074.outbound.protection.outlook.com [40.107.76.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E46A6E08A
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 22:41:20 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2339.namprd12.prod.outlook.com (52.132.10.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 22:41:18 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1900.020; Thu, 23 May 2019
 22:41:18 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 6/8] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Topic: [PATCH 6/8] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Index: AQHVEbijeoeaLry7/ku3EW0CI1FlFA==
Date: Thu, 23 May 2019 22:41:18 +0000
Message-ID: <1558651263-3478-6-git-send-email-Oak.Zeng@amd.com>
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
x-ms-office365-filtering-correlation-id: cadff282-5a3d-4eb4-6a57-08d6dfcfc547
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2339; 
x-ms-traffictypediagnostic: BL0PR12MB2339:
x-microsoft-antispam-prvs: <BL0PR12MB2339EFA8CF43906BB88289BE80010@BL0PR12MB2339.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(39860400002)(366004)(376002)(189003)(199004)(81156014)(8676002)(81166006)(71190400001)(8936002)(305945005)(68736007)(7736002)(50226002)(71200400001)(2351001)(4326008)(53936002)(36756003)(486006)(476003)(99286004)(52116002)(102836004)(5640700003)(25786009)(6512007)(66066001)(6506007)(54906003)(386003)(76176011)(73956011)(14444005)(256004)(2906002)(186003)(66476007)(64756008)(26005)(86362001)(66946007)(66446008)(66556008)(6486002)(2616005)(5660300002)(11346002)(478600001)(6916009)(2501003)(6116002)(3846002)(14454004)(446003)(72206003)(316002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2339;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n+LHyVax/QdkPVKOk0oNVJonjJsjKttPnHbO+ekQc7fjJPyLkKnpQaPN8mwCp38l9Dy5LJURH/pRgAbcgcBUAVvdtcjZneL+xSAZAF03SPeTEeQLdJZcWTN7hy6GrxXYQC2eTeBcmoqVvsNot4nbgsoN6d0uscPdY6bnvnSnMeB7VCKOfnZcuRR29hCu2dwmQmLFxZwO6bNibnQYiismOXtfEKScfrfHJDZ+N+bpKN7EszP/2MATpPGnfdWDJ//WUh2iqzT7SsF6pOwItZNcQTwcGYSgM8QKar2qxSWsLVhIiHC6gYC33XIGHH9Y8cPSjGZ+CG1T8dRIjOkU2o6dAhbpZpuZ6XRRDei0iOArVLgdqb1NyNXmmosFvkZk8SfsD1vQIrpMFL5Ufgm/hJjp6uzSFV89lt2eCBqhQvYTJY8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cadff282-5a3d-4eb4-6a57-08d6dfcfc547
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 22:41:18.6207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2339
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BReUlqe+l/B2BWFQifrwaFnwaLKzLroCJcrz64PwGQc=;
 b=Cx/FZluFIoku72Ke0szg5gvElZ3UhjDACUAJ6mwXRv/joFmfgirz6oRmZXbAcsTK6rMiQUYttgn4/GWikd4YPds+U/KPH9PUetjJAOwk3BnVLMOvEHjp0gI1kkgge0stC5kWN+WwatoIgpo6eDMFA1mSNNVwAQjZpwBJA4ZhrKw=
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

QWRkIGEgbmV3IGtmZCBpb2N0bCB0byBhbGxvY2F0ZSBxdWV1ZSBHV1MuIFF1ZXVlDQpHV1MgaXMg
cmVsZWFzZWQgb24gcXVldWUgZGVzdHJveS4NCg0KQ2hhbmdlLUlkOiBJNjAxNTNjMjZhNTc3OTky
YWQ4NzNlNDI5MmU3NTllNWMzZDViYmQxNQ0KU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5a
ZW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRl
di5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogaW5jbHVkZS91YXBpL2xpbnV4
L2tmZF9pb2N0bC5oICAgICAgICAgICB8IDIwICsrKysrKysrKysrKysrKysrKystDQogMiBmaWxl
cyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KaW5kZXggMzhhZTUzZi4uNDU1YTNkYiAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMNCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMNCkBAIC0xNTU5LDYgKzE1
NTksMzEgQEAgc3RhdGljIGludCBrZmRfaW9jdGxfdW5tYXBfbWVtb3J5X2Zyb21fZ3B1KHN0cnVj
dCBmaWxlICpmaWxlcCwNCiAJcmV0dXJuIGVycjsNCiB9DQogDQorc3RhdGljIGludCBrZmRfaW9j
dGxfYWxsb2NfcXVldWVfZ3dzKHN0cnVjdCBmaWxlICpmaWxlcCwNCisJCXN0cnVjdCBrZmRfcHJv
Y2VzcyAqcCwgdm9pZCAqZGF0YSkNCit7DQorCWludCByZXR2YWw7DQorCXN0cnVjdCBrZmRfaW9j
dGxfYWxsb2NfcXVldWVfZ3dzX2FyZ3MgKmFyZ3MgPSBkYXRhOw0KKwlzdHJ1Y3Qga2ZkX2RldiAq
ZGV2ID0gTlVMTDsNCisNCisJaWYgKCFod3NfZ3dzX3N1cHBvcnQgfHwNCisJCWRldi0+ZHFtLT5z
Y2hlZF9wb2xpY3kgPT0gS0ZEX1NDSEVEX1BPTElDWV9OT19IV1MpDQorCQlyZXR1cm4gLUVJTlZB
TDsNCisNCisJZGV2ID0ga2ZkX2RldmljZV9ieV9pZChhcmdzLT5ncHVfaWQpOw0KKwlpZiAoIWRl
dikgew0KKwkJcHJfZGVidWcoIkNvdWxkIG5vdCBmaW5kIGdwdSBpZCAweCV4XG4iLCBhcmdzLT5n
cHVfaWQpOw0KKwkJcmV0dXJuIC1FSU5WQUw7DQorCX0NCisNCisJbXV0ZXhfbG9jaygmcC0+bXV0
ZXgpOw0KKwlyZXR2YWwgPSBwcW1fc2V0X2d3cygmcC0+cHFtLCBhcmdzLT5xdWV1ZV9pZCwgYXJn
cy0+bnVtX2d3cyA/IGRldi0+Z3dzIDogTlVMTCk7DQorCW11dGV4X3VubG9jaygmcC0+bXV0ZXgp
Ow0KKw0KKwlhcmdzLT5maXJzdF9nd3MgPSAwOw0KKwlyZXR1cm4gcmV0dmFsOw0KK30NCisNCiBz
dGF0aWMgaW50IGtmZF9pb2N0bF9nZXRfZG1hYnVmX2luZm8oc3RydWN0IGZpbGUgKmZpbGVwLA0K
IAkJc3RydWN0IGtmZF9wcm9jZXNzICpwLCB2b2lkICpkYXRhKQ0KIHsNCkBAIC0xNzYxLDYgKzE3
ODYsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGtmZF9pb2N0bF9kZXNjIGFtZGtmZF9pb2N0
bHNbXSA9IHsNCiAJQU1ES0ZEX0lPQ1RMX0RFRihBTURLRkRfSU9DX0lNUE9SVF9ETUFCVUYsDQog
CQkJCWtmZF9pb2N0bF9pbXBvcnRfZG1hYnVmLCAwKSwNCiANCisJQU1ES0ZEX0lPQ1RMX0RFRihB
TURLRkRfSU9DX0FMTE9DX1FVRVVFX0dXUywNCisJCQlrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dz
LCAwKSwNCiB9Ow0KIA0KICNkZWZpbmUgQU1ES0ZEX0NPUkVfSU9DVExfQ09VTlQJQVJSQVlfU0la
RShhbWRrZmRfaW9jdGxzKQ0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9j
dGwuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaA0KaW5kZXggMjA5MTdjNS4uMDcw
ZDFiYyAxMDA2NDQNCi0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaA0KKysrIGIv
aW5jbHVkZS91YXBpL2xpbnV4L2tmZF9pb2N0bC5oDQpAQCAtNDEwLDYgKzQxMCwyMSBAQCBzdHJ1
Y3Qga2ZkX2lvY3RsX3VubWFwX21lbW9yeV9mcm9tX2dwdV9hcmdzIHsNCiAJX191MzIgbl9zdWNj
ZXNzOwkJLyogdG8vZnJvbSBLRkQgKi8NCiB9Ow0KIA0KKy8qIEFsbG9jYXRlIEdXUyBmb3Igc3Bl
Y2lmaWMgcXVldWUNCisgKg0KKyAqIEBncHVfaWQ6ICAgICAgZGV2aWNlIGlkZW50aWZpZXINCisg
KiBAcXVldWVfaWQ6ICAgIHF1ZXVlJ3MgaWQgdGhhdCBHV1MgaXMgYWxsb2NhdGVkIGZvcg0KKyAq
IEBudW1fZ3dzOiAgICAgaG93IG1hbnkgR1dTIHRvIGFsbG9jYXRlDQorICogQGZpcnN0X2d3czog
ICBpbmRleCBvZiB0aGUgZmlyc3QgR1dTIGFsbG9jYXRlZC4NCisgKiAgICAgICAgICAgICAgIG9u
bHkgc3VwcG9ydCBjb250aWd1b3VzIEdXUyBhbGxvY2F0aW9uDQorICovDQorc3RydWN0IGtmZF9p
b2N0bF9hbGxvY19xdWV1ZV9nd3NfYXJncyB7DQorCV9fdTMyIGdwdV9pZDsJCS8qIHRvIEtGRCAq
Lw0KKwlfX3UzMiBxdWV1ZV9pZDsJCS8qIHRvIEtGRCAqLw0KKwlfX3UzMiBudW1fZ3dzOwkJLyog
dG8gS0ZEICovDQorCV9fdTMyIGZpcnN0X2d3czsJLyogZnJvbSBLRkQgKi8NCit9Ow0KKw0KIHN0
cnVjdCBrZmRfaW9jdGxfZ2V0X2RtYWJ1Zl9pbmZvX2FyZ3Mgew0KIAlfX3U2NCBzaXplOwkJLyog
ZnJvbSBLRkQgKi8NCiAJX191NjQgbWV0YWRhdGFfcHRyOwkvKiB0byBLRkQgKi8NCkBAIC01Mjks
NyArNTQ0LDEwIEBAIGVudW0ga2ZkX21taW9fcmVtYXAgew0KICNkZWZpbmUgQU1ES0ZEX0lPQ19J
TVBPUlRfRE1BQlVGCQlcDQogCQlBTURLRkRfSU9XUigweDFELCBzdHJ1Y3Qga2ZkX2lvY3RsX2lt
cG9ydF9kbWFidWZfYXJncykNCiANCisjZGVmaW5lIEFNREtGRF9JT0NfQUxMT0NfUVVFVUVfR1dT
CQlcDQorCQlBTURLRkRfSU9XUigweDFFLCBzdHJ1Y3Qga2ZkX2lvY3RsX2FsbG9jX3F1ZXVlX2d3
c19hcmdzKQ0KKw0KICNkZWZpbmUgQU1ES0ZEX0NPTU1BTkRfU1RBUlQJCTB4MDENCi0jZGVmaW5l
IEFNREtGRF9DT01NQU5EX0VORAkJMHgxRQ0KKyNkZWZpbmUgQU1ES0ZEX0NPTU1BTkRfRU5ECQkw
eDFGDQogDQogI2VuZGlmDQotLSANCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
