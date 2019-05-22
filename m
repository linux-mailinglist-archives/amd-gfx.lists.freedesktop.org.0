Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB71C26747
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 17:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F3589BB3;
	Wed, 22 May 2019 15:51:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03FE89C27
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 15:51:34 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2578.namprd12.prod.outlook.com (52.132.27.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Wed, 22 May 2019 15:51:33 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 15:51:33 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/7] drm/amdkfd: Add function to set queue gws
Thread-Topic: [PATCH 5/7] drm/amdkfd: Add function to set queue gws
Thread-Index: AQHVELY65xF00Db5zUeRY0Zl6rvHtg==
Date: Wed, 22 May 2019 15:51:32 +0000
Message-ID: <1558540278-23734-5-git-send-email-Oak.Zeng@amd.com>
References: <1558540278-23734-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558540278-23734-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::14) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8275bd24-db32-4560-95ad-08d6decd5cc2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2578; 
x-ms-traffictypediagnostic: BL0PR12MB2578:
x-microsoft-antispam-prvs: <BL0PR12MB2578FEE74859F0819D58B80580000@BL0PR12MB2578.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(39860400002)(346002)(376002)(136003)(199004)(189003)(64756008)(66446008)(6916009)(8676002)(66476007)(66556008)(73956011)(316002)(102836004)(53936002)(68736007)(2906002)(2501003)(66946007)(76176011)(7736002)(52116002)(186003)(2351001)(305945005)(5640700003)(81166006)(81156014)(386003)(6506007)(8936002)(6436002)(6512007)(26005)(54906003)(256004)(14444005)(478600001)(50226002)(11346002)(476003)(2616005)(446003)(486006)(71200400001)(3846002)(6116002)(66066001)(36756003)(71190400001)(99286004)(14454004)(25786009)(4326008)(86362001)(5660300002)(72206003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2578;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sg/PqyPzKGVEeTnG1XcJDRU/jmZwiaGHyQZ5DYqzKNJvWc7qSFpXkxiHJbjtgkdtIsWVxOLOwuL04x9yEDLrxxGZt+QKRV5N3o709c+LU1rcYYr/jc57+AtFdSaM/frJYwDlGT1k6ne6vE9hCiVgJvsNsFI4ERipm4AqCsZndlH4w87O14hGwoQqtXcwgoWoNyZT4b/3mdgMSNI5JFgfBMN11Ok6mnHyaavQ2LJuk3N2dIiTpeORuezLpyJTfcqB5Xc3X2sszJksRYEv5A0mcVoz1SkrH2QdXWIxGX4hYl+MqQH0ulj+NecL6xL3OuXFCWZf1vlB56fljysXiMAO7MqodLURMcwvXxLe5mME8xulA9olPuyBJFbdFWe3kOjFbFi0jvRzmTxCMbTCMlt4gmfizox7AdsH8m43E2GCrtE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8275bd24-db32-4560-95ad-08d6decd5cc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 15:51:32.8720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2578
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEvuTeS3nY6umP2E2bp0//OKUYSNpCiqc5KwtIMlbVM=;
 b=CuHIVuSlqyR/Ipg20aAArvghuE1UBnswBMLFRYRafKwe+NQAty3zxNmQ7L1nNhTSYfYw+DOgFqa4NF1QERCc0AsppL0TEat/LNT2WwOYVhaSvv+lIlbgOmx9DsnULMdkHzwvcXGdCwWFicJzAZZTF5T5JLz8wy5ZZtoMbdht5aM=
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
cm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMgfCA1OCArKysrKysrKysr
KysrKysrKysrKysrDQogMiBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspDQoNCmRpZmYg
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
ZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0KaW5kZXggZTY1MmUyNS4uYTc4NDk0ZCAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFn
ZXIuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVf
bWFuYWdlci5jDQpAQCAtMjYsNiArMjYsNyBAQA0KICNpbmNsdWRlICJrZmRfZGV2aWNlX3F1ZXVl
X21hbmFnZXIuaCINCiAjaW5jbHVkZSAia2ZkX3ByaXYuaCINCiAjaW5jbHVkZSAia2ZkX2tlcm5l
bF9xdWV1ZS5oIg0KKyNpbmNsdWRlICJhbWRncHVfYW1ka2ZkLmgiDQogDQogc3RhdGljIGlubGlu
ZSBzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9ub2RlICpnZXRfcXVldWVfYnlfcWlkKA0KIAkJCXN0cnVj
dCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCkNCkBAIC03NCw2
ICs3NSw1NyBAQCB2b2lkIGtmZF9wcm9jZXNzX2RlcXVldWVfZnJvbV9kZXZpY2Uoc3RydWN0IGtm
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
Kw0KKwlyZXR1cm4gcHFuLT5xLT5kZXZpY2UtPmRxbS0+b3BzLnVwZGF0ZV9xdWV1ZShwcW4tPnEt
PmRldmljZS0+ZHFtLA0KKwkJCQkJCQlwcW4tPnEpOw0KK30NCisNCitzdGF0aWMgdm9pZCAqcHFt
X2dldF9nd3Moc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLCB1bnNpZ25lZCBpbnQg
cWlkKQ0KK3sNCisJc3RydWN0IHByb2Nlc3NfcXVldWVfbm9kZSAqcHFuOw0KKw0KKwlwcW4gPSBn
ZXRfcXVldWVfYnlfcWlkKHBxbSwgcWlkKTsNCisJaWYgKCFwcW4pIHsNCisJCXByX2RlYnVnKCJO
byBxdWV1ZSAlZCBleGlzdHMgZm9yIGdldCBnd3Mgb3BlcmF0aW9uXG4iLCBxaWQpOw0KKwkJcmV0
dXJuIE5VTEw7DQorCX0NCisNCisJcmV0dXJuIHBxbi0+cS0+Z3dzOw0KK30NCisNCisNCiB2b2lk
IGtmZF9wcm9jZXNzX2RlcXVldWVfZnJvbV9hbGxfZGV2aWNlcyhzdHJ1Y3Qga2ZkX3Byb2Nlc3Mg
KnApDQogew0KIAlzdHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNlICpwZGQ7DQpAQCAtMzEzLDYgKzM2
NSwxMiBAQCBpbnQgcHFtX2Rlc3Ryb3lfcXVldWUoc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdl
ciAqcHFtLCB1bnNpZ25lZCBpbnQgcWlkKQ0KIAkJcmV0dXJuIC0xOw0KIAl9DQogDQorCWlmIChw
cW1fZ2V0X2d3cyhwcW0sIHFpZCkpIHsNCisJCWFtZGdwdV9hbWRrZmRfcmVtb3ZlX2d3c19mcm9t
X3Byb2Nlc3MocHFtLT5wcm9jZXNzLT5rZ2RfcHJvY2Vzc19pbmZvLA0KKwkJCQlwcW1fZ2V0X2d3
cyhwcW0sIHFpZCkpOw0KKwkJcHFtX3NldF9nd3MocHFtLCBxaWQsIE5VTEwpOw0KKwl9DQorDQog
CWlmIChwcW4tPmtxKSB7DQogCQkvKiBkZXN0cm95IGtlcm5lbCBxdWV1ZSAoRElRKSAqLw0KIAkJ
ZHFtID0gcHFuLT5rcS0+ZGV2LT5kcW07DQotLSANCjIuNy40DQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
