Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BF21A0EA
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 18:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CD889FD9;
	Fri, 10 May 2019 16:01:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740079.outbound.protection.outlook.com [40.107.74.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7457889FD9
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 16:01:26 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2434.namprd12.prod.outlook.com (52.132.11.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Fri, 10 May 2019 16:01:24 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1856.012; Fri, 10 May 2019
 16:01:24 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/8] drm/amdkfd: Add function to set queue gws
Thread-Topic: [PATCH 5/8] drm/amdkfd: Add function to set queue gws
Thread-Index: AQHVB0me374LIvD1ck6fZqnSK9JpAA==
Date: Fri, 10 May 2019 16:01:24 +0000
Message-ID: <1557504063-1559-5-git-send-email-Oak.Zeng@amd.com>
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
x-ms-office365-filtering-correlation-id: ad972b58-d4a6-425b-76bd-08d6d560c05f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2434; 
x-ms-traffictypediagnostic: BL0PR12MB2434:
x-microsoft-antispam-prvs: <BL0PR12MB243474DDA548FBFF7C99AF44800C0@BL0PR12MB2434.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(396003)(346002)(39860400002)(136003)(189003)(199004)(2906002)(5660300002)(4326008)(186003)(6116002)(102836004)(26005)(478600001)(11346002)(446003)(72206003)(53936002)(2616005)(476003)(36756003)(6512007)(2351001)(14454004)(2501003)(486006)(3846002)(25786009)(8676002)(81166006)(81156014)(5640700003)(68736007)(6486002)(6436002)(316002)(71190400001)(86362001)(7736002)(305945005)(50226002)(54906003)(6916009)(8936002)(99286004)(71200400001)(66946007)(64756008)(66556008)(66476007)(66446008)(73956011)(76176011)(386003)(6506007)(14444005)(256004)(52116002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2434;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y/o2vF5JVzeQ2xvK5CFKf8VcLuB9yonk+PHTx0gtSkkD6aD73/HRi8Ap/u6a/3e7NBBwQQy3VJGfEb9VuPhIglqlE1fnw3wwaS0O6Pkz0qv42vNVtMtWAtfYTjYxqQS2uBN56HHi+VjorklpZt4MooOknCUgcUc3J1mRukE7DKRYkWxbub7/6RrPaqCTq/ZFUJyFyDYALyxY6KK1JhaGgYZBu189DjJxkf3SaEYWhojn9H4XBQiwFT06hO6e1GCwi2gcXeiDl/Lo3+CvIZpA8NA/kB2A9mhOEd3xK9moP+clxPuAYXDnQWHiYAQyy2MXpNwYP2QmQmZFOAQve6D56Kj4wBPbkhO6Zf6JLRyJL5YRqVrQQrcP9LKYM6I6aKpqszjGmASBJQyGsd6bJdlM+JrLKx6g7NnjFLzBCD1XOhg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad972b58-d4a6-425b-76bd-08d6d560c05f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 16:01:24.3450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2434
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbuLBBy4E4zZ02fqRbnVASuc4CtloHwkElvdTcMxuZI=;
 b=DQGtC1NMLZ0zbHyAjDzZcwJkROXE1zvMqQifNxDfmWQze7fuNtF/eJ70ydUUv/uFh9j6J0NI9Jwuc8lM1molu7fPeCzCNiHeVJY9DXlnCMDgYGnzQMVm7Dqv+AsqRYxGmYAE9eX52E5dNJLYulWGT9+vKtX5jERTjX7a6tT6R/c=
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

QWRkIGZ1bmN0aW9ucyBpbiBwcm9jZXNzIHF1ZXVlIG1hbmFnZXIgdG8NCnNldC9nZXQgcXVldWUg
Z3dzLiBBbHNvIHNldCBwcm9jZXNzJ3MgbnVtYmVyDQpvZiBnd3MgdXNlZC4gQ3VycmVudGx5IG9u
bHkgb25lIHF1ZXVlIGluDQpwcm9jZXNzIGNhbiB1c2UgYW5kIHVzZSBhbGwgZ3dzLg0KDQpDaGFu
Z2UtSWQ6IEkwM2U0ODBjODY5MmRiM2VhYmZjM2ExODhjY2U4OTA0ZDVkOTYyYWI3DQpTaWduZWQt
b2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICAgICAgICAgIHwgIDcgKysrKw0KIC4uLi9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jIHwgNDkgKysrKysrKysr
KysrKysrKysrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKQ0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCmluZGV4IDU5NjllMzcuLjA5YThkMGQgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQpAQCAtNDU0LDYgKzQ1NCw5IEBA
IHN0cnVjdCBxdWV1ZV9wcm9wZXJ0aWVzIHsNCiAgKg0KICAqIEBkZXZpY2U6IFRoZSBrZmQgZGV2
aWNlIHRoYXQgY3JlYXRlZCB0aGlzIHF1ZXVlLg0KICAqDQorICogQGd3czogUG9pbnRpbmcgdG8g
Z3dzIGtnZF9tZW0gaWYgdGhpcyBpcyBhIGd3cyBjb250cm9sIHF1ZXVlOyBOVUxMDQorICogb3Ro
ZXJ3aXNlLg0KKyAqDQogICogVGhpcyBzdHJ1Y3R1cmUgcmVwcmVzZW50cyB1c2VyIG1vZGUgY29t
cHV0ZSBxdWV1ZXMuDQogICogSXQgY29udGFpbnMgYWxsIHRoZSBuZWNlc3NhcnkgZGF0YSB0byBo
YW5kbGUgc3VjaCBxdWV1ZXMuDQogICoNCkBAIC00NzUsNiArNDc4LDcgQEAgc3RydWN0IHF1ZXVl
IHsNCiANCiAJc3RydWN0IGtmZF9wcm9jZXNzCSpwcm9jZXNzOw0KIAlzdHJ1Y3Qga2ZkX2RldgkJ
KmRldmljZTsNCisJdm9pZCAqZ3dzOw0KIH07DQogDQogLyoNCkBAIC04NjgsNiArODcyLDkgQEAg
aW50IHBxbV91cGRhdGVfcXVldWUoc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLCB1
bnNpZ25lZCBpbnQgcWlkLA0KIAkJCXN0cnVjdCBxdWV1ZV9wcm9wZXJ0aWVzICpwKTsNCiBpbnQg
cHFtX3NldF9jdV9tYXNrKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWdu
ZWQgaW50IHFpZCwNCiAJCQlzdHJ1Y3QgcXVldWVfcHJvcGVydGllcyAqcCk7DQoraW50IHBxbV9z
ZXRfZ3dzKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFp
ZCwNCisJCQl2b2lkICpnd3MpOw0KK3ZvaWQgKnBxbV9nZXRfZ3dzKHN0cnVjdCBwcm9jZXNzX3F1
ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCk7DQogc3RydWN0IGtlcm5lbF9xdWV1
ZSAqcHFtX2dldF9rZXJuZWxfcXVldWUoc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFt
LA0KIAkJCQkJCXVuc2lnbmVkIGludCBxaWQpOw0KIGludCBwcW1fZ2V0X3dhdmVfc3RhdGUoc3Ry
dWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLA0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0KaW5kZXggZTY1MmUy
NS4uMWU5ZWQ1OSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9w
cm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jDQpAQCAtMjYsNiArMjYsNyBAQA0KICNpbmNsdWRl
ICJrZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaCINCiAjaW5jbHVkZSAia2ZkX3ByaXYuaCINCiAj
aW5jbHVkZSAia2ZkX2tlcm5lbF9xdWV1ZS5oIg0KKyNpbmNsdWRlICJhbWRncHVfYW1ka2ZkLmgi
DQogDQogc3RhdGljIGlubGluZSBzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9ub2RlICpnZXRfcXVldWVf
YnlfcWlkKA0KIAkJCXN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWduZWQg
aW50IHFpZCkNCkBAIC00MDAsNiArNDAxLDU0IEBAIGludCBwcW1fc2V0X2N1X21hc2soc3RydWN0
IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLCB1bnNpZ25lZCBpbnQgcWlkLA0KIAlyZXR1cm4g
MDsNCiB9DQogDQoraW50IHBxbV9zZXRfZ3dzKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIg
KnBxbSwgdW5zaWduZWQgaW50IHFpZCwNCisJCQl2b2lkICpnd3MpDQorew0KKwlzdHJ1Y3Qga2Zk
X2RldiAqZGV2ID0gTlVMTDsNCisJc3RydWN0IHByb2Nlc3NfcXVldWVfbm9kZSAqcHFuOw0KKwlz
dHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNlICpwZGQ7DQorDQorCXBxbiA9IGdldF9xdWV1ZV9ieV9x
aWQocHFtLCBxaWQpOw0KKwlpZiAoIXBxbikgew0KKwkJcHJfZXJyKCJRdWV1ZSBpZCBkb2VzIG5v
dCBtYXRjaCBhbnkga25vd24gcXVldWVcbiIpOw0KKwkJcmV0dXJuIC1FSU5WQUw7DQorCX0NCisN
CisJaWYgKHBxbi0+cSkNCisJCWRldiA9IHBxbi0+cS0+ZGV2aWNlOw0KKwlpZiAoV0FSTl9PTigh
ZGV2KSkNCisJCXJldHVybiAtRU5PREVWOw0KKw0KKwlwZGQgPSBrZmRfZ2V0X3Byb2Nlc3NfZGV2
aWNlX2RhdGEoZGV2LCBwcW0tPnByb2Nlc3MpOw0KKwlpZiAoIXBkZCkgew0KKwkJcHJfZXJyKCJQ
cm9jZXNzIGRldmljZSBkYXRhIGRvZXNuJ3QgZXhpc3RcbiIpOw0KKwkJcmV0dXJuIC1FSU5WQUw7
DQorCX0NCisNCisJLyogT25seSBhbGxvdyBvbmUgcXVldWUgcGVyIHByb2Nlc3MgY2FuIGhhdmUg
R1dTIGFzc2lnbmVkICovDQorCWxpc3RfZm9yX2VhY2hfZW50cnkocHFuLCAmcHFtLT5xdWV1ZXMs
IHByb2Nlc3NfcXVldWVfbGlzdCkgew0KKwkJaWYgKHBxbi0+cSAmJiBwcW4tPnEtPmd3cykNCisJ
CQlyZXR1cm4gLUVJTlZBTDsNCisJfQ0KKw0KKwlwcW4tPnEtPmd3cyA9IGd3czsNCisJcGRkLT5x
cGQubnVtX2d3cyA9IGd3cyA/IGFtZGdwdV9hbWRrZmRfZ2V0X251bV9nd3MoZGV2LT5rZ2QpIDog
MDsNCisJcmV0dXJuIDA7DQorfQ0KKw0KK3ZvaWQgKnBxbV9nZXRfZ3dzKHN0cnVjdCBwcm9jZXNz
X3F1ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCkNCit7DQorCXN0cnVjdCBwcm9j
ZXNzX3F1ZXVlX25vZGUgKnBxbjsNCisNCisJcHFuID0gZ2V0X3F1ZXVlX2J5X3FpZChwcW0sIHFp
ZCk7DQorCWlmICghcHFuKSB7DQorCQlwcl9kZWJ1ZygiTm8gcXVldWUgJWQgZXhpc3RzIGZvciBn
ZXQgZ3dzIG9wZXJhdGlvblxuIiwgcWlkKTsNCisJCXJldHVybiBOVUxMOw0KKwl9DQorDQorCXJl
dHVybiBwcW4tPnEtPmd3czsNCit9DQorDQogc3RydWN0IGtlcm5lbF9xdWV1ZSAqcHFtX2dldF9r
ZXJuZWxfcXVldWUoDQogCQkJCQlzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sDQog
CQkJCQl1bnNpZ25lZCBpbnQgcWlkKQ0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
