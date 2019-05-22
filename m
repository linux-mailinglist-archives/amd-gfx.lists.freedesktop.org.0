Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 384DF26748
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 17:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A034289C2A;
	Wed, 22 May 2019 15:51:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1850389C28
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 15:51:36 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2578.namprd12.prod.outlook.com (52.132.27.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Wed, 22 May 2019 15:51:34 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 15:51:34 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 6/7] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Topic: [PATCH 6/7] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Index: AQHVELY7pwG4hZ7xo0Wk2tJX7W9dmA==
Date: Wed, 22 May 2019 15:51:34 +0000
Message-ID: <1558540278-23734-6-git-send-email-Oak.Zeng@amd.com>
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
x-ms-office365-filtering-correlation-id: 4a2de870-a47c-4ce1-5b57-08d6decd5d8a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2578; 
x-ms-traffictypediagnostic: BL0PR12MB2578:
x-microsoft-antispam-prvs: <BL0PR12MB2578A4E9DCE473F2A8B593FD80000@BL0PR12MB2578.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(39860400002)(346002)(376002)(136003)(199004)(189003)(64756008)(66446008)(6916009)(8676002)(66476007)(66556008)(73956011)(316002)(102836004)(53936002)(68736007)(2906002)(2501003)(66946007)(76176011)(7736002)(52116002)(186003)(2351001)(305945005)(5640700003)(81166006)(81156014)(386003)(6506007)(8936002)(6436002)(6512007)(26005)(54906003)(256004)(14444005)(478600001)(50226002)(11346002)(476003)(2616005)(446003)(486006)(71200400001)(3846002)(6116002)(66066001)(36756003)(71190400001)(99286004)(14454004)(25786009)(4326008)(86362001)(5660300002)(72206003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2578;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SZolcMr/EMSKLKUoldDWEgmG7VTOoQnhJX1Tfifw/9gHxc1unc6c7OobUFK8MdtQ4QW7Ruh/xSwkENlkZbICcufQ2puElFMqS/sc3ZOMoUWyvSeL71GFm/fqEWxsYnxEhoUsMXAVJwKiaYY7/MWCBI919DTPu2Dp5SUg8ocOggSzENpY6zHf2ePlw6SQJc8Ln1GlnJ44Lnu1mtnZvbCKuMhMADrszzWrHo1CampbJzIZIf9aVTcPmOLVPJsek7uaS7di6PKVCEHmkhFIfXvLQTSJPse92/aVUmqhJJKPNUxkgngEIrLwM3sjTvoBAIddPQwCs/rMuY+ht1z9hK+3kPN/vi8DyC3LHdkZf3jyOnpy/252cydLXghkJ3B5Wruw1umvJHVj5FvnGb2cdHZUm4inCvgdhwDQxizXk2T9ldw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2de870-a47c-4ce1-5b57-08d6decd5d8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 15:51:34.2561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2578
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGIpHX9nYCpa0WDMVsVB1lE2+lrrzYf1cTUbpQrp6Xo=;
 b=g6m2EK975J1neYqfSPuG6ONXlXo2CwEyEXsVMeGwCbaWGA23gL1EwLjT6ZBOAZ81RyZJelAWmGt1QXQdK7fAA0pp4gLuOIPupWlmzG+jI1Cdi4w80oiZepcahpNMkzWVod3B3kDvc+bTg8HFWMzdpGBk28SYtEN2q+ZDs43Yq6s=
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
di5jIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiBpbmNsdWRlL3VhcGkv
bGludXgva2ZkX2lvY3RsLmggICAgICAgICAgIHwgMjAgKysrKysrKysrKysrKysrLQ0KIDIgZmls
ZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMNCmluZGV4IDM4YWU1M2YuLjgyOGJkNjYgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jDQorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jDQpAQCAtMTU1OSw2ICsx
NTU5LDQzIEBAIHN0YXRpYyBpbnQga2ZkX2lvY3RsX3VubWFwX21lbW9yeV9mcm9tX2dwdShzdHJ1
Y3QgZmlsZSAqZmlsZXAsDQogCXJldHVybiBlcnI7DQogfQ0KIA0KK3N0YXRpYyBpbnQga2ZkX2lv
Y3RsX2FsbG9jX3F1ZXVlX2d3cyhzdHJ1Y3QgZmlsZSAqZmlsZXAsDQorCQlzdHJ1Y3Qga2ZkX3By
b2Nlc3MgKnAsIHZvaWQgKmRhdGEpDQorew0KKwlpbnQgcmV0dmFsOw0KKwlzdHJ1Y3Qga2ZkX2lv
Y3RsX2FsbG9jX3F1ZXVlX2d3c19hcmdzICphcmdzID0gZGF0YTsNCisJc3RydWN0IGtmZF9kZXYg
KmRldiA9IE5VTEw7DQorCXN0cnVjdCBrZ2RfbWVtICptZW07DQorDQorCWlmIChhcmdzLT5udW1f
Z3dzID09IDApDQorCQlyZXR1cm4gLUVJTlZBTDsNCisNCisJaWYgKCFod3NfZ3dzX3N1cHBvcnQg
fHwNCisJCWRldi0+ZHFtLT5zY2hlZF9wb2xpY3kgPT0gS0ZEX1NDSEVEX1BPTElDWV9OT19IV1Mp
DQorCQlyZXR1cm4gLUVJTlZBTDsNCisNCisJZGV2ID0ga2ZkX2RldmljZV9ieV9pZChhcmdzLT5n
cHVfaWQpOw0KKwlpZiAoIWRldikgew0KKwkJcHJfZGVidWcoIkNvdWxkIG5vdCBmaW5kIGdwdSBp
ZCAweCV4XG4iLCBhcmdzLT5ncHVfaWQpOw0KKwkJcmV0dXJuIC1FSU5WQUw7DQorCX0NCisNCisJ
cmV0dmFsID0gYW1kZ3B1X2FtZGtmZF9hZGRfZ3dzX3RvX3Byb2Nlc3MocC0+a2dkX3Byb2Nlc3Nf
aW5mbywNCisJCQlkZXYtPmd3cywgJm1lbSk7DQorCWlmICh1bmxpa2VseShyZXR2YWwpKQ0KKwkJ
cmV0dXJuIHJldHZhbDsNCisNCisJbXV0ZXhfbG9jaygmcC0+bXV0ZXgpOw0KKwlyZXR2YWwgPSBw
cW1fc2V0X2d3cygmcC0+cHFtLCBhcmdzLT5xdWV1ZV9pZCwgbWVtKTsNCisJbXV0ZXhfdW5sb2Nr
KCZwLT5tdXRleCk7DQorDQorCWlmICh1bmxpa2VseShyZXR2YWwpKQ0KKwkJYW1kZ3B1X2FtZGtm
ZF9yZW1vdmVfZ3dzX2Zyb21fcHJvY2VzcyhwLT5rZ2RfcHJvY2Vzc19pbmZvLCBtZW0pOw0KKw0K
KwlhcmdzLT5maXJzdF9nd3MgPSAwOw0KKwlyZXR1cm4gcmV0dmFsOw0KK30NCisNCiBzdGF0aWMg
aW50IGtmZF9pb2N0bF9nZXRfZG1hYnVmX2luZm8oc3RydWN0IGZpbGUgKmZpbGVwLA0KIAkJc3Ry
dWN0IGtmZF9wcm9jZXNzICpwLCB2b2lkICpkYXRhKQ0KIHsNCkBAIC0xNzYxLDYgKzE3OTgsOCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGtmZF9pb2N0bF9kZXNjIGFtZGtmZF9pb2N0bHNbXSA9
IHsNCiAJQU1ES0ZEX0lPQ1RMX0RFRihBTURLRkRfSU9DX0lNUE9SVF9ETUFCVUYsDQogCQkJCWtm
ZF9pb2N0bF9pbXBvcnRfZG1hYnVmLCAwKSwNCiANCisJQU1ES0ZEX0lPQ1RMX0RFRihBTURLRkRf
SU9DX0FMTE9DX1FVRVVFX0dXUywNCisJCQlrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzLCAwKSwN
CiB9Ow0KIA0KICNkZWZpbmUgQU1ES0ZEX0NPUkVfSU9DVExfQ09VTlQJQVJSQVlfU0laRShhbWRr
ZmRfaW9jdGxzKQ0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaCBi
L2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaA0KaW5kZXggMjA5MTdjNS4uMDcwZDFiYyAx
MDA2NDQNCi0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaA0KKysrIGIvaW5jbHVk
ZS91YXBpL2xpbnV4L2tmZF9pb2N0bC5oDQpAQCAtNDEwLDYgKzQxMCwyMSBAQCBzdHJ1Y3Qga2Zk
X2lvY3RsX3VubWFwX21lbW9yeV9mcm9tX2dwdV9hcmdzIHsNCiAJX191MzIgbl9zdWNjZXNzOwkJ
LyogdG8vZnJvbSBLRkQgKi8NCiB9Ow0KIA0KKy8qIEFsbG9jYXRlIEdXUyBmb3Igc3BlY2lmaWMg
cXVldWUNCisgKg0KKyAqIEBncHVfaWQ6ICAgICAgZGV2aWNlIGlkZW50aWZpZXINCisgKiBAcXVl
dWVfaWQ6ICAgIHF1ZXVlJ3MgaWQgdGhhdCBHV1MgaXMgYWxsb2NhdGVkIGZvcg0KKyAqIEBudW1f
Z3dzOiAgICAgaG93IG1hbnkgR1dTIHRvIGFsbG9jYXRlDQorICogQGZpcnN0X2d3czogICBpbmRl
eCBvZiB0aGUgZmlyc3QgR1dTIGFsbG9jYXRlZC4NCisgKiAgICAgICAgICAgICAgIG9ubHkgc3Vw
cG9ydCBjb250aWd1b3VzIEdXUyBhbGxvY2F0aW9uDQorICovDQorc3RydWN0IGtmZF9pb2N0bF9h
bGxvY19xdWV1ZV9nd3NfYXJncyB7DQorCV9fdTMyIGdwdV9pZDsJCS8qIHRvIEtGRCAqLw0KKwlf
X3UzMiBxdWV1ZV9pZDsJCS8qIHRvIEtGRCAqLw0KKwlfX3UzMiBudW1fZ3dzOwkJLyogdG8gS0ZE
ICovDQorCV9fdTMyIGZpcnN0X2d3czsJLyogZnJvbSBLRkQgKi8NCit9Ow0KKw0KIHN0cnVjdCBr
ZmRfaW9jdGxfZ2V0X2RtYWJ1Zl9pbmZvX2FyZ3Mgew0KIAlfX3U2NCBzaXplOwkJLyogZnJvbSBL
RkQgKi8NCiAJX191NjQgbWV0YWRhdGFfcHRyOwkvKiB0byBLRkQgKi8NCkBAIC01MjksNyArNTQ0
LDEwIEBAIGVudW0ga2ZkX21taW9fcmVtYXAgew0KICNkZWZpbmUgQU1ES0ZEX0lPQ19JTVBPUlRf
RE1BQlVGCQlcDQogCQlBTURLRkRfSU9XUigweDFELCBzdHJ1Y3Qga2ZkX2lvY3RsX2ltcG9ydF9k
bWFidWZfYXJncykNCiANCisjZGVmaW5lIEFNREtGRF9JT0NfQUxMT0NfUVVFVUVfR1dTCQlcDQor
CQlBTURLRkRfSU9XUigweDFFLCBzdHJ1Y3Qga2ZkX2lvY3RsX2FsbG9jX3F1ZXVlX2d3c19hcmdz
KQ0KKw0KICNkZWZpbmUgQU1ES0ZEX0NPTU1BTkRfU1RBUlQJCTB4MDENCi0jZGVmaW5lIEFNREtG
RF9DT01NQU5EX0VORAkJMHgxRQ0KKyNkZWZpbmUgQU1ES0ZEX0NPTU1BTkRfRU5ECQkweDFGDQog
DQogI2VuZGlmDQotLSANCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
