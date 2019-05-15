Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DF21FB8E
	for <lists+amd-gfx@lfdr.de>; Wed, 15 May 2019 22:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B89089208;
	Wed, 15 May 2019 20:37:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790071.outbound.protection.outlook.com [40.107.79.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CE789208
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 20:37:57 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2818.namprd12.prod.outlook.com (20.177.207.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Wed, 15 May 2019 20:37:55 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 20:37:55 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/7] drm/amdkfd: Add function to set queue gws
Thread-Topic: [PATCH 4/7] drm/amdkfd: Add function to set queue gws
Thread-Index: AQHVC14T1oGMRMr7tUiS8VSGXNB0WQ==
Date: Wed, 15 May 2019 20:37:55 +0000
Message-ID: <1557952664-12218-4-git-send-email-Oak.Zeng@amd.com>
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
x-ms-office365-filtering-correlation-id: 53ae5eba-225b-4aa0-99a6-08d6d975357c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2818; 
x-ms-traffictypediagnostic: BL0PR12MB2818:
x-microsoft-antispam-prvs: <BL0PR12MB281843847637234EA772F4AB80090@BL0PR12MB2818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(376002)(136003)(366004)(199004)(189003)(8676002)(2906002)(186003)(8936002)(6506007)(386003)(50226002)(81156014)(81166006)(102836004)(3846002)(6116002)(72206003)(14454004)(66066001)(54906003)(71190400001)(71200400001)(14444005)(256004)(5660300002)(76176011)(52116002)(66446008)(64756008)(66476007)(66556008)(66946007)(73956011)(99286004)(7736002)(305945005)(53936002)(6916009)(86362001)(6436002)(486006)(6486002)(476003)(446003)(2616005)(11346002)(5640700003)(2501003)(2351001)(26005)(478600001)(6512007)(4326008)(25786009)(36756003)(68736007)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2818;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /BuBZV9xuIlbQHkrj9qC75Aln+yI8ULstKxRmCtT3u9klmhqEAF7YbCB/xpMj4MKs+VfOEJ8To7GP/QpXSEznLwl/YmaitiscjnEV3VbFJz35UN8YQlhv6Oshyg1YezkT0xGZoQq/lT+v06/4GP1aA7TLLDKSNliBAI2VHVnTqRBOifIve5B7xUoVIudVKwvD4g2tUpHNQstSidVYd1sHoJ9r6KeGpc66kV4ksHrSmuH4OgdWjVgu1cm8nCD/Kp4gPp8XTqR2O62yTamfn+TzoioGmiv1w2L8TeegPcBTPi0+bvPw49hcut6PmgGrDsFZXZi6vpdB66G/ujZEQiIH1vYB2YtI/6+P3VvvXowiD8cOWvQp4akbVIuKypxLwIdneIXRLsI3DF7OyhtlTGyUYQp5HAiESpy6NsJvu1rE3U=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ae5eba-225b-4aa0-99a6-08d6d975357c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 20:37:55.7489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2818
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1t3eRlz5olCB8GnkINOBbJesildte07K9NYwnzWGkNI=;
 b=LunkmdAlB/joL4ADYKSopgcQSHCHWZalzlzyIqqlcMFxFwRu6qS7h6sqd92A8Cu0MhkUnZW2aa3IdUggG8JbyQrfkZbGg3ST+X9VEIRsQEZCSCs5nooRpL+3k8ZRJ2SeXO6mNbooncT9AAC+La7DYo4H8WA6DjPv066c+ig4uvM=
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
bS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICAgICAgICAgIHwgIDYgKysrDQogLi4uL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMgfCA1MCArKysrKysrKysr
KysrKysrKysrKysrDQogMiBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KaW5kZXggNTk2OWUzNy4uNDBhNWM2NyAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCkBAIC00NTQsNiArNDU0LDkgQEAg
c3RydWN0IHF1ZXVlX3Byb3BlcnRpZXMgew0KICAqDQogICogQGRldmljZTogVGhlIGtmZCBkZXZp
Y2UgdGhhdCBjcmVhdGVkIHRoaXMgcXVldWUuDQogICoNCisgKiBAZ3dzOiBQb2ludGluZyB0byBn
d3Mga2dkX21lbSBpZiB0aGlzIGlzIGEgZ3dzIGNvbnRyb2wgcXVldWU7IE5VTEwNCisgKiBvdGhl
cndpc2UuDQorICoNCiAgKiBUaGlzIHN0cnVjdHVyZSByZXByZXNlbnRzIHVzZXIgbW9kZSBjb21w
dXRlIHF1ZXVlcy4NCiAgKiBJdCBjb250YWlucyBhbGwgdGhlIG5lY2Vzc2FyeSBkYXRhIHRvIGhh
bmRsZSBzdWNoIHF1ZXVlcy4NCiAgKg0KQEAgLTQ3NSw2ICs0NzgsNyBAQCBzdHJ1Y3QgcXVldWUg
ew0KIA0KIAlzdHJ1Y3Qga2ZkX3Byb2Nlc3MJKnByb2Nlc3M7DQogCXN0cnVjdCBrZmRfZGV2CQkq
ZGV2aWNlOw0KKwl2b2lkICpnd3M7DQogfTsNCiANCiAvKg0KQEAgLTg2OCw2ICs4NzIsOCBAQCBp
bnQgcHFtX3VwZGF0ZV9xdWV1ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sIHVu
c2lnbmVkIGludCBxaWQsDQogCQkJc3RydWN0IHF1ZXVlX3Byb3BlcnRpZXMgKnApOw0KIGludCBw
cW1fc2V0X2N1X21hc2soc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLCB1bnNpZ25l
ZCBpbnQgcWlkLA0KIAkJCXN0cnVjdCBxdWV1ZV9wcm9wZXJ0aWVzICpwKTsNCitpbnQgcHFtX3Nl
dF9nd3Moc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLCB1bnNpZ25lZCBpbnQgcWlk
LA0KKwkJCXZvaWQgKmd3cyk7DQogc3RydWN0IGtlcm5lbF9xdWV1ZSAqcHFtX2dldF9rZXJuZWxf
cXVldWUoc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLA0KIAkJCQkJCXVuc2lnbmVk
IGludCBxaWQpOw0KIGludCBwcW1fZ2V0X3dhdmVfc3RhdGUoc3RydWN0IHByb2Nlc3NfcXVldWVf
bWFuYWdlciAqcHFtLA0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0KaW5kZXggZTY1MmUyNS4uOGU0NTI5NiAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFn
ZXIuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVf
bWFuYWdlci5jDQpAQCAtMjYsNiArMjYsNyBAQA0KICNpbmNsdWRlICJrZmRfZGV2aWNlX3F1ZXVl
X21hbmFnZXIuaCINCiAjaW5jbHVkZSAia2ZkX3ByaXYuaCINCiAjaW5jbHVkZSAia2ZkX2tlcm5l
bF9xdWV1ZS5oIg0KKyNpbmNsdWRlICJhbWRncHVfYW1ka2ZkLmgiDQogDQogc3RhdGljIGlubGlu
ZSBzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9ub2RlICpnZXRfcXVldWVfYnlfcWlkKA0KIAkJCXN0cnVj
dCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCkNCkBAIC03NCw2
ICs3NSw1NSBAQCB2b2lkIGtmZF9wcm9jZXNzX2RlcXVldWVfZnJvbV9kZXZpY2Uoc3RydWN0IGtm
ZF9wcm9jZXNzX2RldmljZSAqcGRkKQ0KIAlwZGQtPmFscmVhZHlfZGVxdWV1ZWQgPSB0cnVlOw0K
IH0NCiANCitpbnQgcHFtX3NldF9nd3Moc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFt
LCB1bnNpZ25lZCBpbnQgcWlkLA0KKwkJCXZvaWQgKmd3cykNCit7DQorCXN0cnVjdCBrZmRfZGV2
ICpkZXYgPSBOVUxMOw0KKwlzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9ub2RlICpwcW47DQorCXN0cnVj
dCBrZmRfcHJvY2Vzc19kZXZpY2UgKnBkZDsNCisNCisJcHFuID0gZ2V0X3F1ZXVlX2J5X3FpZChw
cW0sIHFpZCk7DQorCWlmICghcHFuKSB7DQorCQlwcl9lcnIoIlF1ZXVlIGlkIGRvZXMgbm90IG1h
dGNoIGFueSBrbm93biBxdWV1ZVxuIik7DQorCQlyZXR1cm4gLUVJTlZBTDsNCisJfQ0KKw0KKwlp
ZiAocHFuLT5xKQ0KKwkJZGV2ID0gcHFuLT5xLT5kZXZpY2U7DQorCWlmIChXQVJOX09OKCFkZXYp
KQ0KKwkJcmV0dXJuIC1FTk9ERVY7DQorDQorCXBkZCA9IGtmZF9nZXRfcHJvY2Vzc19kZXZpY2Vf
ZGF0YShkZXYsIHBxbS0+cHJvY2Vzcyk7DQorCWlmICghcGRkKSB7DQorCQlwcl9lcnIoIlByb2Nl
c3MgZGV2aWNlIGRhdGEgZG9lc24ndCBleGlzdFxuIik7DQorCQlyZXR1cm4gLUVJTlZBTDsNCisJ
fQ0KKw0KKwkvKiBPbmx5IGFsbG93IG9uZSBxdWV1ZSBwZXIgcHJvY2VzcyBjYW4gaGF2ZSBHV1Mg
YXNzaWduZWQgKi8NCisJbGlzdF9mb3JfZWFjaF9lbnRyeShwcW4sICZwcW0tPnF1ZXVlcywgcHJv
Y2Vzc19xdWV1ZV9saXN0KSB7DQorCQlpZiAocHFuLT5xICYmIHBxbi0+cS0+Z3dzKQ0KKwkJCXJl
dHVybiAtRUlOVkFMOw0KKwl9DQorDQorCXBxbi0+cS0+Z3dzID0gZ3dzOw0KKwlwZGQtPnFwZC5u
dW1fZ3dzID0gZ3dzID8gYW1kZ3B1X2FtZGtmZF9nZXRfbnVtX2d3cyhkZXYtPmtnZCkgOiAwOw0K
KwlyZXR1cm4gMDsNCit9DQorDQorc3RhdGljIHZvaWQgKnBxbV9nZXRfZ3dzKHN0cnVjdCBwcm9j
ZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCkNCit7DQorCXN0cnVjdCBw
cm9jZXNzX3F1ZXVlX25vZGUgKnBxbjsNCisNCisJcHFuID0gZ2V0X3F1ZXVlX2J5X3FpZChwcW0s
IHFpZCk7DQorCWlmICghcHFuKSB7DQorCQlwcl9kZWJ1ZygiTm8gcXVldWUgJWQgZXhpc3RzIGZv
ciBnZXQgZ3dzIG9wZXJhdGlvblxuIiwgcWlkKTsNCisJCXJldHVybiBOVUxMOw0KKwl9DQorDQor
CXJldHVybiBwcW4tPnEtPmd3czsNCit9DQorDQorDQogdm9pZCBrZmRfcHJvY2Vzc19kZXF1ZXVl
X2Zyb21fYWxsX2RldmljZXMoc3RydWN0IGtmZF9wcm9jZXNzICpwKQ0KIHsNCiAJc3RydWN0IGtm
ZF9wcm9jZXNzX2RldmljZSAqcGRkOw0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
