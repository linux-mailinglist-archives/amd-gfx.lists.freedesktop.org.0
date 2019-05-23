Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C58B28615
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 20:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC63E6E061;
	Thu, 23 May 2019 18:41:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E8B6E061
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 18:41:06 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2339.namprd12.prod.outlook.com (52.132.10.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 18:41:04 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1900.020; Thu, 23 May 2019
 18:41:04 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/7] drm/amdkfd: Add function to set queue gws
Thread-Topic: [PATCH 5/7] drm/amdkfd: Add function to set queue gws
Thread-Index: AQHVEZcTNbLvvOtk3kGEdZiJ2fOHYA==
Date: Thu, 23 May 2019 18:41:04 +0000
Message-ID: <1558636843-9867-5-git-send-email-Oak.Zeng@amd.com>
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
x-ms-office365-filtering-correlation-id: f66d904a-40da-4357-b5c7-08d6dfae35d7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2339; 
x-ms-traffictypediagnostic: BL0PR12MB2339:
x-microsoft-antispam-prvs: <BL0PR12MB2339C4938617E6E396F760A880010@BL0PR12MB2339.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(199004)(81156014)(8676002)(8936002)(305945005)(81166006)(7736002)(68736007)(36756003)(50226002)(71200400001)(2351001)(4326008)(53936002)(71190400001)(486006)(476003)(99286004)(52116002)(6506007)(102836004)(5640700003)(25786009)(6512007)(66066001)(54906003)(386003)(76176011)(14444005)(256004)(2906002)(66476007)(64756008)(186003)(26005)(86362001)(66946007)(66446008)(66556008)(73956011)(6116002)(6486002)(11346002)(2616005)(5660300002)(478600001)(2501003)(6916009)(3846002)(14454004)(446003)(72206003)(316002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2339;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qTQAu8ERPqGqC50MjJh8Jmob+UGe1D6xvzy3eq+79YTzDQMjBx5CsqIoAsMo1vUOn1oo0Esg5xIF1A8QJ7Cx2jEE+dr1X3gQMs6hb37X94ncPIX2fxGGSRC4t+zqYnOM/GY9dMUqIP4I0osKLM+EoRv/Ja1UuM9Y7Y0kQZ0H9nNLFfytBP4GwqmE9zho7jM/xibsVTaezMF+S0Kw8u7Ciqk8HPBoPhURq8l68sOcBh09zdBIWYY9kovCxflUECjwv4QMLowUJnHtNsgrUjr6SKErnrWwuOWvE3Clgmhmnfc9i4oEzokSJMBmWg1JfH+2Gjxf3Qj2o9/qp1p0yHjYv0fGHQzOIOvrQaDUS7SeByGjHwprLxjbco5KrAEiR2ylw3ktpw+LJziuCbIUM42dM6tDmQvXkJSlMYWpGawR+7E=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f66d904a-40da-4357-b5c7-08d6dfae35d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 18:41:04.5393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2339
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmiLtks/bUUcqWkExgVdcPE/BTikLfaucb6IYjmb1jM=;
 b=gHrQP2DjRufvn+IK8AvE0WsXKdFt2RtjR3quBYLPYMKskST7f/gPCLqa8xkZoq6YXXpJu04u8woqgg3EdOkzlVFdMPTnbrWx16h7QBnoFKYmB02mtA7ZiIcwqrRNvYH9zogXdKA5mzF5dnGKD6Xtqiwt5LrraicDkq9QD1MwxB4=
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

QWRkIGZ1bmN0aW9ucyBpbiBwcm9jZXNzIHF1ZXVlIG1hbmFnZXIgdG8NCnNldCBxdWV1ZSBnd3Mu
IEFsc28gc2V0IHByb2Nlc3MncyBudW1iZXINCm9mIGd3cyB1c2VkLiBDdXJyZW50bHkgb25seSBv
bmUgcXVldWUgaW4NCnByb2Nlc3MgY2FuIHVzZSBhbmQgdXNlIGFsbCBnd3MuDQoNCkNoYW5nZS1J
ZDogSTAzZTQ4MGM4NjkyZGIzZWFiZmMzYTE4OGNjZTg5MDRkNWQ5NjJhYjcNClNpZ25lZC1vZmYt
Ynk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3ByaXYuaCAgICAgICAgICAgICAgfCAgNiArKysNCiAuLi4vZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyB8IDU2ICsrKysrKysrKysrKysr
KysrKysrKysNCiAyIGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQppbmRleCA1OTY5ZTM3Li40MGE1YzY3IDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KQEAgLTQ1NCw2ICs0NTQsOSBAQCBzdHJ1
Y3QgcXVldWVfcHJvcGVydGllcyB7DQogICoNCiAgKiBAZGV2aWNlOiBUaGUga2ZkIGRldmljZSB0
aGF0IGNyZWF0ZWQgdGhpcyBxdWV1ZS4NCiAgKg0KKyAqIEBnd3M6IFBvaW50aW5nIHRvIGd3cyBr
Z2RfbWVtIGlmIHRoaXMgaXMgYSBnd3MgY29udHJvbCBxdWV1ZTsgTlVMTA0KKyAqIG90aGVyd2lz
ZS4NCisgKg0KICAqIFRoaXMgc3RydWN0dXJlIHJlcHJlc2VudHMgdXNlciBtb2RlIGNvbXB1dGUg
cXVldWVzLg0KICAqIEl0IGNvbnRhaW5zIGFsbCB0aGUgbmVjZXNzYXJ5IGRhdGEgdG8gaGFuZGxl
IHN1Y2ggcXVldWVzLg0KICAqDQpAQCAtNDc1LDYgKzQ3OCw3IEBAIHN0cnVjdCBxdWV1ZSB7DQog
DQogCXN0cnVjdCBrZmRfcHJvY2VzcwkqcHJvY2VzczsNCiAJc3RydWN0IGtmZF9kZXYJCSpkZXZp
Y2U7DQorCXZvaWQgKmd3czsNCiB9Ow0KIA0KIC8qDQpAQCAtODY4LDYgKzg3Miw4IEBAIGludCBw
cW1fdXBkYXRlX3F1ZXVlKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWdu
ZWQgaW50IHFpZCwNCiAJCQlzdHJ1Y3QgcXVldWVfcHJvcGVydGllcyAqcCk7DQogaW50IHBxbV9z
ZXRfY3VfbWFzayhzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sIHVuc2lnbmVkIGlu
dCBxaWQsDQogCQkJc3RydWN0IHF1ZXVlX3Byb3BlcnRpZXMgKnApOw0KK2ludCBwcW1fc2V0X2d3
cyhzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sIHVuc2lnbmVkIGludCBxaWQsDQor
CQkJdm9pZCAqZ3dzKTsNCiBzdHJ1Y3Qga2VybmVsX3F1ZXVlICpwcW1fZ2V0X2tlcm5lbF9xdWV1
ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sDQogCQkJCQkJdW5zaWduZWQgaW50
IHFpZCk7DQogaW50IHBxbV9nZXRfd2F2ZV9zdGF0ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5h
Z2VyICpwcW0sDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3By
b2Nlc3NfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3By
b2Nlc3NfcXVldWVfbWFuYWdlci5jDQppbmRleCBlNjUyZTI1Li5kNjllMTdhIDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5j
DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5h
Z2VyLmMNCkBAIC0yNiw2ICsyNiw3IEBADQogI2luY2x1ZGUgImtmZF9kZXZpY2VfcXVldWVfbWFu
YWdlci5oIg0KICNpbmNsdWRlICJrZmRfcHJpdi5oIg0KICNpbmNsdWRlICJrZmRfa2VybmVsX3F1
ZXVlLmgiDQorI2luY2x1ZGUgImFtZGdwdV9hbWRrZmQuaCINCiANCiBzdGF0aWMgaW5saW5lIHN0
cnVjdCBwcm9jZXNzX3F1ZXVlX25vZGUgKmdldF9xdWV1ZV9ieV9xaWQoDQogCQkJc3RydWN0IHBy
b2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLCB1bnNpZ25lZCBpbnQgcWlkKQ0KQEAgLTc0LDYgKzc1
LDU0IEBAIHZvaWQga2ZkX3Byb2Nlc3NfZGVxdWV1ZV9mcm9tX2RldmljZShzdHJ1Y3Qga2ZkX3By
b2Nlc3NfZGV2aWNlICpwZGQpDQogCXBkZC0+YWxyZWFkeV9kZXF1ZXVlZCA9IHRydWU7DQogfQ0K
IA0KK2ludCBwcW1fc2V0X2d3cyhzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sIHVu
c2lnbmVkIGludCBxaWQsDQorCQkJdm9pZCAqZ3dzKQ0KK3sNCisJc3RydWN0IGtmZF9kZXYgKmRl
diA9IE5VTEw7DQorCXN0cnVjdCBwcm9jZXNzX3F1ZXVlX25vZGUgKnBxbjsNCisJc3RydWN0IGtm
ZF9wcm9jZXNzX2RldmljZSAqcGRkOw0KKwlzdHJ1Y3Qga2dkX21lbSAqbWVtOw0KKwlpbnQgcmV0
Ow0KKw0KKwkvKiBEb24ndCBhbGxvdyB1bnNldCBnd3MgKi8NCisJaWYgKCFnd3MpDQorCQlyZXR1
cm4gLUVJTlZBTDsNCisNCisJcHFuID0gZ2V0X3F1ZXVlX2J5X3FpZChwcW0sIHFpZCk7DQorCWlm
ICghcHFuKSB7DQorCQlwcl9lcnIoIlF1ZXVlIGlkIGRvZXMgbm90IG1hdGNoIGFueSBrbm93biBx
dWV1ZVxuIik7DQorCQlyZXR1cm4gLUVJTlZBTDsNCisJfQ0KKw0KKwlpZiAocHFuLT5xKQ0KKwkJ
ZGV2ID0gcHFuLT5xLT5kZXZpY2U7DQorCWlmIChXQVJOX09OKCFkZXYpKQ0KKwkJcmV0dXJuIC1F
Tk9ERVY7DQorDQorCXBkZCA9IGtmZF9nZXRfcHJvY2Vzc19kZXZpY2VfZGF0YShkZXYsIHBxbS0+
cHJvY2Vzcyk7DQorCWlmICghcGRkKSB7DQorCQlwcl9lcnIoIlByb2Nlc3MgZGV2aWNlIGRhdGEg
ZG9lc24ndCBleGlzdFxuIik7DQorCQlyZXR1cm4gLUVJTlZBTDsNCisJfQ0KKw0KKwkvKiBPbmx5
IGFsbG93IG9uZSBxdWV1ZSBwZXIgcHJvY2VzcyBjYW4gaGF2ZSBHV1MgYXNzaWduZWQgKi8NCisJ
bGlzdF9mb3JfZWFjaF9lbnRyeShwcW4sICZwcW0tPnF1ZXVlcywgcHJvY2Vzc19xdWV1ZV9saXN0
KSB7DQorCQlpZiAocHFuLT5xICYmIHBxbi0+cS0+Z3dzKQ0KKwkJCXJldHVybiAtRUlOVkFMOw0K
Kwl9DQorDQorCXJldCA9IGFtZGdwdV9hbWRrZmRfYWRkX2d3c190b19wcm9jZXNzKHBkZC0+cHJv
Y2Vzcy0+a2dkX3Byb2Nlc3NfaW5mbywNCisJCQlnd3MsICZtZW0pOw0KKwlpZiAodW5saWtlbHko
cmV0KSkNCisJCXJldHVybiByZXQ7DQorDQorCXBxbi0+cS0+Z3dzID0gbWVtOw0KKwlwZGQtPnFw
ZC5udW1fZ3dzID0gYW1kZ3B1X2FtZGtmZF9nZXRfbnVtX2d3cyhkZXYtPmtnZCk7DQorDQorCXJl
dHVybiBwcW4tPnEtPmRldmljZS0+ZHFtLT5vcHMudXBkYXRlX3F1ZXVlKHBxbi0+cS0+ZGV2aWNl
LT5kcW0sDQorCQkJCQkJCXBxbi0+cSk7DQorfQ0KKw0KIHZvaWQga2ZkX3Byb2Nlc3NfZGVxdWV1
ZV9mcm9tX2FsbF9kZXZpY2VzKHN0cnVjdCBrZmRfcHJvY2VzcyAqcCkNCiB7DQogCXN0cnVjdCBr
ZmRfcHJvY2Vzc19kZXZpY2UgKnBkZDsNCkBAIC0zMzAsNiArMzc5LDEzIEBAIGludCBwcW1fZGVz
dHJveV9xdWV1ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sIHVuc2lnbmVkIGlu
dCBxaWQpDQogCQkJaWYgKHJldHZhbCAhPSAtRVRJTUUpDQogCQkJCWdvdG8gZXJyX2Rlc3Ryb3lf
cXVldWU7DQogCQl9DQorDQorCQlpZiAocHFuLT5xLT5nd3MpIHsNCisJCQlhbWRncHVfYW1ka2Zk
X3JlbW92ZV9nd3NfZnJvbV9wcm9jZXNzKHBxbS0+cHJvY2Vzcy0+a2dkX3Byb2Nlc3NfaW5mbywN
CisJCQkJcHFuLT5xLT5nd3MpOw0KKwkJCXBkZC0+cXBkLm51bV9nd3MgPSAwOw0KKwkJfQ0KKw0K
IAkJa2ZyZWUocHFuLT5xLT5wcm9wZXJ0aWVzLmN1X21hc2spOw0KIAkJcHFuLT5xLT5wcm9wZXJ0
aWVzLmN1X21hc2sgPSBOVUxMOw0KIAkJdW5pbml0X3F1ZXVlKHBxbi0+cSk7DQotLSANCjIuNy40
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
