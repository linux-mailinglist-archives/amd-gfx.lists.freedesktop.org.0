Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED5E33D52
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 04:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F135D893C9;
	Tue,  4 Jun 2019 02:52:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750072.outbound.protection.outlook.com [40.107.75.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936A78938C
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 02:52:48 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2402.namprd12.prod.outlook.com (52.132.11.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 02:52:46 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 02:52:46 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/6] drm/amdkfd: Refactor create_queue_nocpsch
Thread-Topic: [PATCH 3/6] drm/amdkfd: Refactor create_queue_nocpsch
Thread-Index: AQHVGoCWSBtE6J6w1UWuNup9cA/GNQ==
Date: Tue, 4 Jun 2019 02:52:46 +0000
Message-ID: <1559616755-13116-3-git-send-email-Oak.Zeng@amd.com>
References: <1559616755-13116-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1559616755-13116-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::16) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4f5a9e0-fd53-42cb-e6cf-08d6e897b923
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BL0PR12MB2402; 
x-ms-traffictypediagnostic: BL0PR12MB2402:
x-microsoft-antispam-prvs: <BL0PR12MB2402D4C5BD07E2C3C80F844480150@BL0PR12MB2402.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(39860400002)(376002)(366004)(51234002)(189003)(199004)(446003)(11346002)(66066001)(68736007)(2351001)(8676002)(305945005)(53936002)(26005)(72206003)(7736002)(476003)(2616005)(14444005)(256004)(81156014)(76176011)(4326008)(86362001)(25786009)(386003)(6506007)(102836004)(2501003)(186003)(6916009)(5640700003)(36756003)(52116002)(8936002)(6512007)(6436002)(316002)(71200400001)(71190400001)(2906002)(54906003)(50226002)(478600001)(3846002)(6116002)(486006)(6486002)(5660300002)(64756008)(14454004)(66556008)(66446008)(81166006)(99286004)(66946007)(66476007)(73956011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2402;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wNc0RSjped3nPcP6eufpCnN8CBIM9O71/l8ytrfDjJ5fQn/SmRD3FE5qFARk1kUhChgUyJrccx03JCpkq8TWCjL7qqJEn/HQnMeZDObBc27oAOmpv+HJ2v8nOT/v+UrtB3GslYFoQo7KrboBX7O0JJjclt+9kkwuWr4iEhbM4qW63+RePfEEG9UGewolsoj64RXz1Bub5fwU8Aoz5rnSm2lmi4H4ydcAfBY+vh+csPmNO4mJa+XO5HMCxP71MwZHkHzC9l/toSWblUo95pGMaQaew8HSGVV3B3bSCvu6wr7MjBSy7M/K514ZmfYBOWu5Xr17HdVEVJsmKibkTefmS3wUAXMporjXgiu/5BCj2yIVF8FIAL+dzLQaHcw0w9s//MJYtpuVao0wEb+8NQsfIcBdcPcFkF7kzjDYCkHqFds=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f5a9e0-fd53-42cb-e6cf-08d6e897b923
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 02:52:46.6795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2402
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAK+6/lHZ2mkgvAyErK/t6xTFn+x7ssxmQFcGBxXXz4=;
 b=TEPFQI5JJtw/bBUFN20Im+3deZqG8BPfrCucw5vYqVD73EAhijb/R61KSW8W+SltC7WA13cG+IOwA2PdeDlFOlhBniEX4zctij2POlj4LxL/0xdU2ez/Q1SCOGJQDETdXCJ/pi36y+kkHMlOGIxPDSnsGlMm29ssl1+pF+Wj9h0=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBpcyBwcmVwYXJlIHdvcmsgdG8gZml4IGEgY2lyY3VsYXIgbG9jayBkZXBlbmRlbmN5Lg0K
Tm8gbG9naWMgY2hhbmdlDQoNCkNoYW5nZS1JZDogSTRlMGVlOTE4MjYwZTc3ODBkZTk3MmRkNzFm
NGNlNzg3YjRmNmRkZTkNClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29t
Pg0KLS0tDQogLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIu
YyAgfCAxNzEgKysrKysrKy0tLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDU3IGluc2Vy
dGlvbnMoKyksIDExNCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCmluZGV4IGRjMWE3MGIuLmRj
MzRlMGUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNl
X3F1ZXVlX21hbmFnZXIuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rl
dmljZV9xdWV1ZV9tYW5hZ2VyLmMNCkBAIC00MiwxMCArNDIsNiBAQA0KIHN0YXRpYyBpbnQgc2V0
X3Bhc2lkX3ZtaWRfbWFwcGluZyhzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiAJ
CQkJCXVuc2lnbmVkIGludCBwYXNpZCwgdW5zaWduZWQgaW50IHZtaWQpOw0KIA0KLXN0YXRpYyBp
bnQgY3JlYXRlX2NvbXB1dGVfcXVldWVfbm9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFn
ZXIgKmRxbSwNCi0JCQkJCXN0cnVjdCBxdWV1ZSAqcSwNCi0JCQkJCXN0cnVjdCBxY21fcHJvY2Vz
c19kZXZpY2UgKnFwZCk7DQotDQogc3RhdGljIGludCBleGVjdXRlX3F1ZXVlc19jcHNjaChzdHJ1
Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiAJCQkJZW51bSBrZmRfdW5tYXBfcXVldWVz
X2ZpbHRlciBmaWx0ZXIsDQogCQkJCXVpbnQzMl90IGZpbHRlcl9wYXJhbSk7DQpAQCAtNTUsMTMg
KzUxLDE0IEBAIHN0YXRpYyBpbnQgdW5tYXBfcXVldWVzX2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVl
dWVfbWFuYWdlciAqZHFtLA0KIA0KIHN0YXRpYyBpbnQgbWFwX3F1ZXVlc19jcHNjaChzdHJ1Y3Qg
ZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSk7DQogDQotc3RhdGljIGludCBjcmVhdGVfc2RtYV9x
dWV1ZV9ub2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KLQkJCQkJc3Ry
dWN0IHF1ZXVlICpxLA0KLQkJCQkJc3RydWN0IHFjbV9wcm9jZXNzX2RldmljZSAqcXBkKTsNCi0N
CiBzdGF0aWMgdm9pZCBkZWFsbG9jYXRlX3NkbWFfcXVldWUoc3RydWN0IGRldmljZV9xdWV1ZV9t
YW5hZ2VyICpkcW0sDQogCQkJCXN0cnVjdCBxdWV1ZSAqcSk7DQogDQorc3RhdGljIGlubGluZSB2
b2lkIGRlYWxsb2NhdGVfaHFkKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KKwkJ
CQlzdHJ1Y3QgcXVldWUgKnEpOw0KK3N0YXRpYyBpbnQgYWxsb2NhdGVfaHFkKHN0cnVjdCBkZXZp
Y2VfcXVldWVfbWFuYWdlciAqZHFtLCBzdHJ1Y3QgcXVldWUgKnEpOw0KK3N0YXRpYyBpbnQgYWxs
b2NhdGVfc2RtYV9xdWV1ZShzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCisJCQkJ
c3RydWN0IHF1ZXVlICpxKTsNCiBzdGF0aWMgdm9pZCBrZmRfcHJvY2Vzc19od19leGNlcHRpb24o
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKTsNCiANCiBzdGF0aWMgaW5saW5lDQpAQCAtMjIzLDYg
KzIyMCw5IEBAIHN0YXRpYyBpbnQgYWxsb2NhdGVfdm1pZChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21h
bmFnZXIgKmRxbSwNCiAJLyogaW52YWxpZGF0ZSB0aGUgVk0gY29udGV4dCBhZnRlciBwYXNpZCBh
bmQgdm1pZCBtYXBwaW5nIGlzIHNldCB1cCAqLw0KIAlrZmRfZmx1c2hfdGxiKHFwZF90b19wZGQo
cXBkKSk7DQogDQorCWRxbS0+ZGV2LT5rZmQya2dkLT5zZXRfc2NyYXRjaF9iYWNraW5nX3ZhKA0K
KwkJZHFtLT5kZXYtPmtnZCwgcXBkLT5zaF9oaWRkZW5fcHJpdmF0ZV9iYXNlLCBxcGQtPnZtaWQp
Ow0KKw0KIAlyZXR1cm4gMDsNCiB9DQogDQpAQCAtMjY5LDYgKzI2OSw3IEBAIHN0YXRpYyBpbnQg
Y3JlYXRlX3F1ZXVlX25vY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQog
CQkJCXN0cnVjdCBxdWV1ZSAqcSwNCiAJCQkJc3RydWN0IHFjbV9wcm9jZXNzX2RldmljZSAqcXBk
KQ0KIHsNCisJc3RydWN0IG1xZF9tYW5hZ2VyICptcWRfbWdyOw0KIAlpbnQgcmV0dmFsOw0KIA0K
IAlwcmludF9xdWV1ZShxKTsNCkBAIC0zMDAsMTggKzMwMSw0MSBAQCBzdGF0aWMgaW50IGNyZWF0
ZV9xdWV1ZV9ub2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KIAlxLT5w
cm9wZXJ0aWVzLnRiYV9hZGRyID0gcXBkLT50YmFfYWRkcjsNCiAJcS0+cHJvcGVydGllcy50bWFf
YWRkciA9IHFwZC0+dG1hX2FkZHI7DQogDQotCWlmIChxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZE
X1FVRVVFX1RZUEVfQ09NUFVURSkNCi0JCXJldHZhbCA9IGNyZWF0ZV9jb21wdXRlX3F1ZXVlX25v
Y3BzY2goZHFtLCBxLCBxcGQpOw0KLQllbHNlIGlmIChxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZE
X1FVRVVFX1RZUEVfU0RNQSB8fA0KLQkJCXEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVFVUVf
VFlQRV9TRE1BX1hHTUkpDQotCQlyZXR2YWwgPSBjcmVhdGVfc2RtYV9xdWV1ZV9ub2Nwc2NoKGRx
bSwgcSwgcXBkKTsNCi0JZWxzZQ0KLQkJcmV0dmFsID0gLUVJTlZBTDsNCisJbXFkX21nciA9IGRx
bS0+bXFkX21ncnNbZ2V0X21xZF90eXBlX2Zyb21fcXVldWVfdHlwZSgNCisJCQlxLT5wcm9wZXJ0
aWVzLnR5cGUpXTsNCisJaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVFVUVfVFlQRV9D
T01QVVRFKSB7DQorCQlyZXR2YWwgPSBhbGxvY2F0ZV9ocWQoZHFtLCBxKTsNCisJCWlmIChyZXR2
YWwpDQorCQkJZ290byBkZWFsbG9jYXRlX3ZtaWQ7DQorCQlwcl9kZWJ1ZygiTG9hZGluZyBtcWQg
dG8gaHFkIG9uIHBpcGUgJWQsIHF1ZXVlICVkXG4iLA0KKwkJCXEtPnBpcGUsIHEtPnF1ZXVlKTsN
CisJfSBlbHNlIGlmIChxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZEX1FVRVVFX1RZUEVfU0RNQSB8
fA0KKwkJcS0+cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBFX1NETUFfWEdNSSkgew0K
KwkJcmV0dmFsID0gYWxsb2NhdGVfc2RtYV9xdWV1ZShkcW0sIHEpOw0KKwkJaWYgKHJldHZhbCkN
CisJCQlnb3RvIGRlYWxsb2NhdGVfdm1pZDsNCisJCWRxbS0+YXNpY19vcHMuaW5pdF9zZG1hX3Zt
KGRxbSwgcSwgcXBkKTsNCisJfQ0KIA0KLQlpZiAocmV0dmFsKSB7DQotCQlpZiAobGlzdF9lbXB0
eSgmcXBkLT5xdWV1ZXNfbGlzdCkpDQotCQkJZGVhbGxvY2F0ZV92bWlkKGRxbSwgcXBkLCBxKTsN
Ci0JCWdvdG8gb3V0X3VubG9jazsNCisJcmV0dmFsID0gYWxsb2NhdGVfZG9vcmJlbGwocXBkLCBx
KTsNCisJaWYgKHJldHZhbCkNCisJCWdvdG8gb3V0X2RlYWxsb2NhdGVfaHFkOw0KKw0KKwlyZXR2
YWwgPSBtcWRfbWdyLT5pbml0X21xZChtcWRfbWdyLCAmcS0+bXFkLCAmcS0+bXFkX21lbV9vYmos
DQorCQkJCSZxLT5nYXJ0X21xZF9hZGRyLCAmcS0+cHJvcGVydGllcyk7DQorCWlmIChyZXR2YWwp
DQorCQlnb3RvIG91dF9kZWFsbG9jYXRlX2Rvb3JiZWxsOw0KKw0KKwlpZiAocS0+cHJvcGVydGll
cy5pc19hY3RpdmUpIHsNCisNCisJCWlmIChXQVJOKHEtPnByb2Nlc3MtPm1tICE9IGN1cnJlbnQt
Pm1tLA0KKwkJCQkJInNob3VsZCBvbmx5IHJ1biBpbiB1c2VyIHRocmVhZCIpKQ0KKwkJCXJldHZh
bCA9IC1FRkFVTFQ7DQorCQllbHNlDQorCQkJcmV0dmFsID0gbXFkX21nci0+bG9hZF9tcWQobXFk
X21nciwgcS0+bXFkLCBxLT5waXBlLA0KKwkJCQkJcS0+cXVldWUsICZxLT5wcm9wZXJ0aWVzLCBj
dXJyZW50LT5tbSk7DQorCQlpZiAocmV0dmFsKQ0KKwkJCWdvdG8gb3V0X3VuaW5pdF9tcWQ7DQog
CX0NCiANCiAJbGlzdF9hZGQoJnEtPmxpc3QsICZxcGQtPnF1ZXVlc19saXN0KTsNCkBAIC0zMzEs
NyArMzU1LDIxIEBAIHN0YXRpYyBpbnQgY3JlYXRlX3F1ZXVlX25vY3BzY2goc3RydWN0IGRldmlj
ZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQogCWRxbS0+dG90YWxfcXVldWVfY291bnQrKzsNCiAJcHJf
ZGVidWcoIlRvdGFsIG9mICVkIHF1ZXVlcyBhcmUgYWNjb3VudGFibGUgc28gZmFyXG4iLA0KIAkJ
CWRxbS0+dG90YWxfcXVldWVfY291bnQpOw0KKwlnb3RvIG91dF91bmxvY2s7DQogDQorb3V0X3Vu
aW5pdF9tcWQ6DQorCW1xZF9tZ3ItPnVuaW5pdF9tcWQobXFkX21nciwgcS0+bXFkLCBxLT5tcWRf
bWVtX29iaik7DQorb3V0X2RlYWxsb2NhdGVfZG9vcmJlbGw6DQorCWRlYWxsb2NhdGVfZG9vcmJl
bGwocXBkLCBxKTsNCitvdXRfZGVhbGxvY2F0ZV9ocWQ6DQorCWlmIChxLT5wcm9wZXJ0aWVzLnR5
cGUgPT0gS0ZEX1FVRVVFX1RZUEVfQ09NUFVURSkNCisJCWRlYWxsb2NhdGVfaHFkKGRxbSwgcSk7
DQorCWVsc2UgaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVFVUVfVFlQRV9TRE1BIHx8
DQorCQlxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZEX1FVRVVFX1RZUEVfU0RNQV9YR01JKQ0KKwkJ
ZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlKGRxbSwgcSk7DQorZGVhbGxvY2F0ZV92bWlkOg0KKwlpZiAo
bGlzdF9lbXB0eSgmcXBkLT5xdWV1ZXNfbGlzdCkpDQorCQlkZWFsbG9jYXRlX3ZtaWQoZHFtLCBx
cGQsIHEpOw0KIG91dF91bmxvY2s6DQogCWRxbV91bmxvY2soZHFtKTsNCiAJcmV0dXJuIHJldHZh
bDsNCkBAIC0zNzcsNTggKzQxNSw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBkZWFsbG9jYXRlX2hx
ZChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiAJZHFtLT5hbGxvY2F0ZWRfcXVl
dWVzW3EtPnBpcGVdIHw9ICgxIDw8IHEtPnF1ZXVlKTsNCiB9DQogDQotc3RhdGljIGludCBjcmVh
dGVfY29tcHV0ZV9xdWV1ZV9ub2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFt
LA0KLQkJCQkJc3RydWN0IHF1ZXVlICpxLA0KLQkJCQkJc3RydWN0IHFjbV9wcm9jZXNzX2Rldmlj
ZSAqcXBkKQ0KLXsNCi0Jc3RydWN0IG1xZF9tYW5hZ2VyICptcWRfbWdyOw0KLQlpbnQgcmV0dmFs
Ow0KLQ0KLQltcWRfbWdyID0gZHFtLT5tcWRfbWdyc1tLRkRfTVFEX1RZUEVfQ09NUFVURV07DQot
DQotCXJldHZhbCA9IGFsbG9jYXRlX2hxZChkcW0sIHEpOw0KLQlpZiAocmV0dmFsKQ0KLQkJcmV0
dXJuIHJldHZhbDsNCi0NCi0JcmV0dmFsID0gYWxsb2NhdGVfZG9vcmJlbGwocXBkLCBxKTsNCi0J
aWYgKHJldHZhbCkNCi0JCWdvdG8gb3V0X2RlYWxsb2NhdGVfaHFkOw0KLQ0KLQlyZXR2YWwgPSBt
cWRfbWdyLT5pbml0X21xZChtcWRfbWdyLCAmcS0+bXFkLCAmcS0+bXFkX21lbV9vYmosDQotCQkJ
CSZxLT5nYXJ0X21xZF9hZGRyLCAmcS0+cHJvcGVydGllcyk7DQotCWlmIChyZXR2YWwpDQotCQln
b3RvIG91dF9kZWFsbG9jYXRlX2Rvb3JiZWxsOw0KLQ0KLQlwcl9kZWJ1ZygiTG9hZGluZyBtcWQg
dG8gaHFkIG9uIHBpcGUgJWQsIHF1ZXVlICVkXG4iLA0KLQkJCXEtPnBpcGUsIHEtPnF1ZXVlKTsN
Ci0NCi0JZHFtLT5kZXYtPmtmZDJrZ2QtPnNldF9zY3JhdGNoX2JhY2tpbmdfdmEoDQotCQkJZHFt
LT5kZXYtPmtnZCwgcXBkLT5zaF9oaWRkZW5fcHJpdmF0ZV9iYXNlLCBxcGQtPnZtaWQpOw0KLQ0K
LQlpZiAoIXEtPnByb3BlcnRpZXMuaXNfYWN0aXZlKQ0KLQkJcmV0dXJuIDA7DQotDQotCWlmIChX
QVJOKHEtPnByb2Nlc3MtPm1tICE9IGN1cnJlbnQtPm1tLA0KLQkJICJzaG91bGQgb25seSBydW4g
aW4gdXNlciB0aHJlYWQiKSkNCi0JCXJldHZhbCA9IC1FRkFVTFQ7DQotCWVsc2UNCi0JCXJldHZh
bCA9IG1xZF9tZ3ItPmxvYWRfbXFkKG1xZF9tZ3IsIHEtPm1xZCwgcS0+cGlwZSwgcS0+cXVldWUs
DQotCQkJCQkgICAmcS0+cHJvcGVydGllcywgY3VycmVudC0+bW0pOw0KLQlpZiAocmV0dmFsKQ0K
LQkJZ290byBvdXRfdW5pbml0X21xZDsNCi0NCi0JcmV0dXJuIDA7DQotDQotb3V0X3VuaW5pdF9t
cWQ6DQotCW1xZF9tZ3ItPnVuaW5pdF9tcWQobXFkX21nciwgcS0+bXFkLCBxLT5tcWRfbWVtX29i
aik7DQotb3V0X2RlYWxsb2NhdGVfZG9vcmJlbGw6DQotCWRlYWxsb2NhdGVfZG9vcmJlbGwocXBk
LCBxKTsNCi1vdXRfZGVhbGxvY2F0ZV9ocWQ6DQotCWRlYWxsb2NhdGVfaHFkKGRxbSwgcSk7DQot
DQotCXJldHVybiByZXR2YWw7DQotfQ0KLQ0KIC8qIEFjY2VzcyB0byBEUU0gaGFzIHRvIGJlIGxv
Y2tlZCBiZWZvcmUgY2FsbGluZyBkZXN0cm95X3F1ZXVlX25vY3BzY2hfbG9ja2VkDQogICogdG8g
YXZvaWQgYXN5bmNocm9uaXplZCBhY2Nlc3MNCiAgKi8NCkBAIC05NjcsNDkgKzk1Myw2IEBAIHN0
YXRpYyB2b2lkIGRlYWxsb2NhdGVfc2RtYV9xdWV1ZShzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFn
ZXIgKmRxbSwNCiAJfQ0KIH0NCiANCi1zdGF0aWMgaW50IGNyZWF0ZV9zZG1hX3F1ZXVlX25vY3Bz
Y2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQotCQkJCQlzdHJ1Y3QgcXVldWUg
KnEsDQotCQkJCQlzdHJ1Y3QgcWNtX3Byb2Nlc3NfZGV2aWNlICpxcGQpDQotew0KLQlzdHJ1Y3Qg
bXFkX21hbmFnZXIgKm1xZF9tZ3I7DQotCWludCByZXR2YWw7DQotDQotCW1xZF9tZ3IgPSBkcW0t
Pm1xZF9tZ3JzW0tGRF9NUURfVFlQRV9TRE1BXTsNCi0NCi0JcmV0dmFsID0gYWxsb2NhdGVfc2Rt
YV9xdWV1ZShkcW0sIHEpOw0KLQlpZiAocmV0dmFsKQ0KLQkJcmV0dXJuIHJldHZhbDsNCi0NCi0J
cmV0dmFsID0gYWxsb2NhdGVfZG9vcmJlbGwocXBkLCBxKTsNCi0JaWYgKHJldHZhbCkNCi0JCWdv
dG8gb3V0X2RlYWxsb2NhdGVfc2RtYV9xdWV1ZTsNCi0NCi0JZHFtLT5hc2ljX29wcy5pbml0X3Nk
bWFfdm0oZHFtLCBxLCBxcGQpOw0KLQlyZXR2YWwgPSBtcWRfbWdyLT5pbml0X21xZChtcWRfbWdy
LCAmcS0+bXFkLCAmcS0+bXFkX21lbV9vYmosDQotCQkJCSZxLT5nYXJ0X21xZF9hZGRyLCAmcS0+
cHJvcGVydGllcyk7DQotCWlmIChyZXR2YWwpDQotCQlnb3RvIG91dF9kZWFsbG9jYXRlX2Rvb3Ji
ZWxsOw0KLQ0KLQlpZiAoIXEtPnByb3BlcnRpZXMuaXNfYWN0aXZlKQ0KLQkJcmV0dXJuIDA7DQot
DQotCXJldHZhbCA9IG1xZF9tZ3ItPmxvYWRfbXFkKG1xZF9tZ3IsIHEtPm1xZCwgMCwgMCwgJnEt
PnByb3BlcnRpZXMsDQotCQkJCWN1cnJlbnQtPm1tKTsNCi0JaWYgKHJldHZhbCkNCi0JCWdvdG8g
b3V0X3VuaW5pdF9tcWQ7DQotDQotCXJldHVybiAwOw0KLQ0KLW91dF91bmluaXRfbXFkOg0KLQlt
cWRfbWdyLT51bmluaXRfbXFkKG1xZF9tZ3IsIHEtPm1xZCwgcS0+bXFkX21lbV9vYmopOw0KLW91
dF9kZWFsbG9jYXRlX2Rvb3JiZWxsOg0KLQlkZWFsbG9jYXRlX2Rvb3JiZWxsKHFwZCwgcSk7DQot
b3V0X2RlYWxsb2NhdGVfc2RtYV9xdWV1ZToNCi0JZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlKGRxbSwg
cSk7DQotDQotCXJldHVybiByZXR2YWw7DQotfQ0KLQ0KIC8qDQogICogRGV2aWNlIFF1ZXVlIE1h
bmFnZXIgaW1wbGVtZW50YXRpb24gZm9yIGNwIHNjaGVkdWxlcg0KICAqLw0KLS0gDQoyLjcuNA0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
