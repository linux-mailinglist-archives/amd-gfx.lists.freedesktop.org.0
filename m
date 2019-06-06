Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9571937C35
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 20:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02ECE895E1;
	Thu,  6 Jun 2019 18:25:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790059.outbound.protection.outlook.com [40.107.79.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4612A894FF
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 18:25:21 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2579.namprd12.prod.outlook.com (52.132.27.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Thu, 6 Jun 2019 18:25:18 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1943.023; Thu, 6 Jun 2019
 18:25:18 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 6/6] drm/amdkfd: Fix sdma queue allocate race condition
Thread-Topic: [PATCH 6/6] drm/amdkfd: Fix sdma queue allocate race condition
Thread-Index: AQHVHJUxm+te8KOBBUeaEsdrqf2/Fw==
Date: Thu, 6 Jun 2019 18:25:18 +0000
Message-ID: <1559845507-3052-3-git-send-email-Oak.Zeng@amd.com>
References: <1559845507-3052-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1559845507-3052-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9cdda50b-6061-4ca9-a432-08d6eaac53d3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2579; 
x-ms-traffictypediagnostic: BL0PR12MB2579:
x-microsoft-antispam-prvs: <BL0PR12MB25790EDECE8E2A0CC8A8CAD880170@BL0PR12MB2579.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(136003)(366004)(39850400004)(346002)(51234002)(199004)(189003)(2906002)(6116002)(3846002)(11346002)(86362001)(6486002)(2501003)(478600001)(446003)(66476007)(6916009)(6436002)(64756008)(66556008)(66946007)(36756003)(73956011)(476003)(2616005)(66446008)(53936002)(5640700003)(486006)(99286004)(6512007)(4326008)(102836004)(5660300002)(186003)(71190400001)(71200400001)(6506007)(386003)(14454004)(72206003)(26005)(66066001)(50226002)(52116002)(8676002)(25786009)(14444005)(256004)(2351001)(54906003)(81156014)(81166006)(76176011)(305945005)(8936002)(68736007)(7736002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2579;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WLnIOSCqK4zg7DF2JAzqMP2eb/F8HRRF2zqv7GHhX1W20xEjI7etqISXbGGZK+wyOM/Ky3b+qGpgOd2dxVCyUZF8oSeCg2/MS6QDk88w6ZesHbmQCiQFp3uXfM5df5AtqSL7NGBDdCEJWBaSEMqGF3nI9XXDcMc0rx0ok65/zWghsSTiGwlznBCXO86nVhB6Dvg6kf/7WQKQNh3w/G94dDoPcprNVqXvKSeITvsMH52plTS7JeZGKEPw8FS5YHnDfaCqe9tI84ZEhbCj9ZWs6VckdfriGXW8El9NYsbXThrJbuznSXQ8PC6JH8NQYfKsLCqFiDaNKGKan9sSH6U4CETNeFTVZQfdl3HaDBXv2RC9T/5GxFmcxKFduDthtnW3YcLFcuc4FmCvK3St0uaamk18eSyUW7liArNAjiI/RoQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cdda50b-6061-4ca9-a432-08d6eaac53d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 18:25:18.4665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2579
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmtxWcN3QSV9L13RRkajdmPKP0OSNDQvVcXsf6Om9g4=;
 b=PQKFKlN1HxljF2DfQDAoHMPaG017XHUZAiLrksJnGuKi6DTlQb0MFkZg+SJ9PPczLKnywLA7MgbCcKM1esOeWHADT1gWfomnycziC41QchIy7FfuplrKcA4N9kRqAlfCeDyIXLfr0TsPZb8MGof2do1uwQqWn0UKhTKW4T9A+aw=
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Freehill, Chris" <Chris.Freehill@amd.com>,
 "Zeng, Oak" <Oak.Zeng@amd.com>, "Liu, Alex" <Alex.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U0RNQSBxdWV1ZSBhbGxvY2F0aW9uIHJlcXVpcmVzIHRoZSBkcW0gbG9jayBhdCBpdCBtb2RpZnkN
CnRoZSBnbG9iYWwgZHFtIG1lbWJlcnMuIE1vdmUgdXAgdGhlIGRxbV9sb2NrIHNvIHNkbWENCnF1
ZXVlIGFsbG9jYXRpb24gaXMgZW5jbG9zZWQgaW4gdGhlIGNyaXRpY2FsIHNlY3Rpb24uIE1vdmUN
Cm1xZCBhbGxvY2F0aW9uIG91dCBvZiBjcml0aWNhbCBzZWN0aW9uIHRvIGF2b2lkIGNpcmN1bGFy
DQpsb2NrIGRlcGVuZGVuY3kuDQoNCkNoYW5nZS1JZDogSTk2YWJkNDJlYWU2ZTc3YzgyYTViYTFi
OGU2MDBhZjNlZmU4ZDc5MWQNClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQu
Y29tPg0KLS0tDQogLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFn
ZXIuYyAgfCAyNCArKysrKysrKysrKy0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KaW5kZXggMTY2NjM2Yy4u
Y2QyNTliOCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZp
Y2VfcXVldWVfbWFuYWdlci5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
ZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KQEAgLTExMzMsMjMgKzExMzMsMjcgQEAgc3RhdGljIGlu
dCBjcmVhdGVfcXVldWVfY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sIHN0
cnVjdCBxdWV1ZSAqcSwNCiAJaWYgKGRxbS0+dG90YWxfcXVldWVfY291bnQgPj0gbWF4X251bV9v
Zl9xdWV1ZXNfcGVyX2RldmljZSkgew0KIAkJcHJfd2FybigiQ2FuJ3QgY3JlYXRlIG5ldyB1c2Vy
bW9kZSBxdWV1ZSBiZWNhdXNlICVkIHF1ZXVlcyB3ZXJlIGFscmVhZHkgY3JlYXRlZFxuIiwNCiAJ
CQkJZHFtLT50b3RhbF9xdWV1ZV9jb3VudCk7DQotCQlyZXR2YWwgPSAtRVBFUk07DQotCQlnb3Rv
IG91dDsNCisJCXJldHVybiAtRVBFUk07DQogCX0NCiANCisJbXFkX21nciA9IGRxbS0+bXFkX21n
cnNbZ2V0X21xZF90eXBlX2Zyb21fcXVldWVfdHlwZSgNCisJCQlxLT5wcm9wZXJ0aWVzLnR5cGUp
XTsNCisJcS0+bXFkX21lbV9vYmogPSBtcWRfbWdyLT5hbGxvY2F0ZV9tcWQobXFkX21nci0+ZGV2
LCAmcS0+cHJvcGVydGllcyk7DQorCWlmICghcS0+bXFkX21lbV9vYmopDQorCQlyZXR1cm4gLUVO
T01FTTsNCisNCisJZHFtX2xvY2soZHFtKTsNCiAJaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9PSBL
RkRfUVVFVUVfVFlQRV9TRE1BIHx8DQogCQlxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZEX1FVRVVF
X1RZUEVfU0RNQV9YR01JKSB7DQogCQlyZXR2YWwgPSBhbGxvY2F0ZV9zZG1hX3F1ZXVlKGRxbSwg
cSk7DQogCQlpZiAocmV0dmFsKQ0KLQkJCWdvdG8gb3V0Ow0KKwkJCWdvdG8gb3V0X3VubG9jazsN
CiAJfQ0KIA0KIAlyZXR2YWwgPSBhbGxvY2F0ZV9kb29yYmVsbChxcGQsIHEpOw0KIAlpZiAocmV0
dmFsKQ0KIAkJZ290byBvdXRfZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlOw0KIA0KLQltcWRfbWdyID0g
ZHFtLT5tcWRfbWdyc1tnZXRfbXFkX3R5cGVfZnJvbV9xdWV1ZV90eXBlKA0KLQkJCXEtPnByb3Bl
cnRpZXMudHlwZSldOw0KIAkvKg0KIAkgKiBFdmljdGlvbiBzdGF0ZSBsb2dpYzogbWFyayBhbGwg
cXVldWVzIGFzIGV2aWN0ZWQsIGV2ZW4gb25lcw0KIAkgKiBub3QgY3VycmVudGx5IGFjdGl2ZS4g
UmVzdG9yaW5nIGluYWN0aXZlIHF1ZXVlcyBsYXRlciBvbmx5DQpAQCAtMTE2MSwxMiArMTE2NSw4
IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3F1ZXVlX2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFu
YWdlciAqZHFtLCBzdHJ1Y3QgcXVldWUgKnEsDQogCQlkcW0tPmFzaWNfb3BzLmluaXRfc2RtYV92
bShkcW0sIHEsIHFwZCk7DQogCXEtPnByb3BlcnRpZXMudGJhX2FkZHIgPSBxcGQtPnRiYV9hZGRy
Ow0KIAlxLT5wcm9wZXJ0aWVzLnRtYV9hZGRyID0gcXBkLT50bWFfYWRkcjsNCi0JcS0+bXFkX21l
bV9vYmogPSBtcWRfbWdyLT5hbGxvY2F0ZV9tcWQobXFkX21nci0+ZGV2LCAmcS0+cHJvcGVydGll
cyk7DQotCWlmICghcS0+bXFkX21lbV9vYmopDQotCQlnb3RvIG91dF9kZWFsbG9jYXRlX2Rvb3Ji
ZWxsOw0KIAltcWRfbWdyLT5pbml0X21xZChtcWRfbWdyLCAmcS0+bXFkLCBxLT5tcWRfbWVtX29i
aiwNCiAJCQkJJnEtPmdhcnRfbXFkX2FkZHIsICZxLT5wcm9wZXJ0aWVzKTsNCi0JZHFtX2xvY2so
ZHFtKTsNCiANCiAJbGlzdF9hZGQoJnEtPmxpc3QsICZxcGQtPnF1ZXVlc19saXN0KTsNCiAJcXBk
LT5xdWV1ZV9jb3VudCsrOw0KQEAgLTExOTIsMTMgKzExOTIsMTMgQEAgc3RhdGljIGludCBjcmVh
dGVfcXVldWVfY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sIHN0cnVjdCBx
dWV1ZSAqcSwNCiAJZHFtX3VubG9jayhkcW0pOw0KIAlyZXR1cm4gcmV0dmFsOw0KIA0KLW91dF9k
ZWFsbG9jYXRlX2Rvb3JiZWxsOg0KLQlkZWFsbG9jYXRlX2Rvb3JiZWxsKHFwZCwgcSk7DQogb3V0
X2RlYWxsb2NhdGVfc2RtYV9xdWV1ZToNCiAJaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRf
UVVFVUVfVFlQRV9TRE1BIHx8DQogCQlxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZEX1FVRVVFX1RZ
UEVfU0RNQV9YR01JKQ0KIAkJZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlKGRxbSwgcSk7DQotb3V0Og0K
K291dF91bmxvY2s6DQorCWRxbV91bmxvY2soZHFtKTsNCisJbXFkX21nci0+ZnJlZV9tcWQobXFk
X21nciwgcS0+bXFkLCBxLT5tcWRfbWVtX29iaik7DQogCXJldHVybiByZXR2YWw7DQogfQ0KIA0K
LS0gDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
