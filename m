Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0C746D82
	for <lists+amd-gfx@lfdr.de>; Sat, 15 Jun 2019 03:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C66893EC;
	Sat, 15 Jun 2019 01:27:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820070.outbound.protection.outlook.com [40.107.82.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBEC893EC
 for <amd-gfx@lists.freedesktop.org>; Sat, 15 Jun 2019 01:27:46 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2417.namprd12.prod.outlook.com (52.132.11.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Sat, 15 Jun 2019 01:27:44 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61%4]) with mapi id 15.20.1987.013; Sat, 15 Jun 2019
 01:27:44 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/4] Revert "drm/amdkfd: Fix sdma queue allocate race
 condition"
Thread-Topic: [PATCH 1/4] Revert "drm/amdkfd: Fix sdma queue allocate race
 condition"
Thread-Index: AQHVIxmI5JQU7MYMLkqz9R4iPJOgsg==
Date: Sat, 15 Jun 2019 01:27:44 +0000
Message-ID: <1560562057-19810-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::37) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fad34213-8bd2-48ad-af9c-08d6f130aa79
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BL0PR12MB2417; 
x-ms-traffictypediagnostic: BL0PR12MB2417:
x-microsoft-antispam-prvs: <BL0PR12MB24171B68411FAFE4F866894F80E90@BL0PR12MB2417.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:398;
x-forefront-prvs: 0069246B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(366004)(136003)(376002)(39860400002)(51234002)(199004)(189003)(6486002)(6116002)(72206003)(36756003)(14454004)(2906002)(6436002)(476003)(6512007)(53936002)(5640700003)(14444005)(256004)(2351001)(64756008)(68736007)(3846002)(6916009)(7736002)(52116002)(99286004)(305945005)(81166006)(66066001)(26005)(102836004)(25786009)(81156014)(4326008)(6506007)(486006)(73956011)(50226002)(54906003)(316002)(386003)(2501003)(2616005)(86362001)(5660300002)(66946007)(8676002)(66446008)(71200400001)(66476007)(71190400001)(478600001)(66556008)(8936002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2417;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Cu544d8y1tqsx7XqTPttiWoE9QBrheBAbuyr6Ev5CNuF0QiGRxBuCPrdfYWifIFUw/nxtAmzidbgUqIJoW8KyZTN49Edzs1Btb+ZKFaPkJxcJHzKqZAov8eEp1CMlsvmQC66HG04NqpW/te/k3OfQJpqDe29jj7YXBWC/0RDjk0d7iR5iZo9XfyLVwITR8L815sTAb/ToDKm2d92XWZIEwtcufBibtBoknhL8D1b1PmsMoo+8sBlEERE1f8yfUsksUv72H9x9NEAMzv5mxgCKWU3GYZTF/TND97UrmxuMRi+ZkUP8/St6F41v82WIc4LPameR0j7+s1MhM36If4wgsfKl0+xQFGabGC+sbY2YkPYrcFFdGPPyl5h9RK6cl3bfgRPosPl9rXD5TqKLwYnEWPKcEg3R8yHtq+kLbhPw3Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad34213-8bd2-48ad-af9c-08d6f130aa79
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2019 01:27:44.7385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2417
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ca4nSqZM2918eoFkXx+lyzJ2VJ3rrtubMtpP2ymdV9A=;
 b=QBfU3JwyJFYo2ptaupnc6OJLSpODgCv16sateKHZ3BEuouzuocaMfdxppRjYIFfPTJCbzY7VcVt/ulBPERKwjM7Ea8JfpIjbabJedJ1nW+RjQXCbKu0RgT/3QD1eu9siE1CAwvp0lkmIGfWN9HddSqaQ+OjJnDsjag4r/2x7ZLM=
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

VGhpcyByZXZlcnRzIGNvbW1pdCAwYTdjNzI4MWJkYWFlOGNmNjNkNzdiZTI2YTRiNDYxMjgxMTRi
ZGVjLg0KVGhpcyBmaXggaXMgbm90IHByb3Blci4gYWxsb2NhdGVfbXFkIGNhbid0IGJlIG1vdmVk
IGJlZm9yZQ0KYWxsb2NhdGVfc2RtYV9xdWV1ZSBhcyBpdCBkZXBlbmRzIG9uIHEtPnByb3BlcnRp
ZXMtPnNkbWFfaWQNCnNldCBpbiBsYXRlci4NCg0KQ2hhbmdlLUlkOiBJZjQ5MzRhZmViZGE4Y2Yz
N2RmY2RlOWI1MGNlNTM2NDNkNTI2NTg0ZA0KU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5a
ZW5nQGFtZC5jb20+DQotLS0NCiAuLi4vZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVl
dWVfbWFuYWdlci5jICB8IDI2ICsrKysrKysrKysrKy0tLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQppbmRleCAy
NTA3OThiLi5kNTY2YzI2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQpAQCAtMTEzMywyNyArMTEzMywyMyBAQCBz
dGF0aWMgaW50IGNyZWF0ZV9xdWV1ZV9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIg
KmRxbSwgc3RydWN0IHF1ZXVlICpxLA0KIAlpZiAoZHFtLT50b3RhbF9xdWV1ZV9jb3VudCA+PSBt
YXhfbnVtX29mX3F1ZXVlc19wZXJfZGV2aWNlKSB7DQogCQlwcl93YXJuKCJDYW4ndCBjcmVhdGUg
bmV3IHVzZXJtb2RlIHF1ZXVlIGJlY2F1c2UgJWQgcXVldWVzIHdlcmUgYWxyZWFkeSBjcmVhdGVk
XG4iLA0KIAkJCQlkcW0tPnRvdGFsX3F1ZXVlX2NvdW50KTsNCi0JCXJldHVybiAtRVBFUk07DQor
CQlyZXR2YWwgPSAtRVBFUk07DQorCQlnb3RvIG91dDsNCiAJfQ0KIA0KLQltcWRfbWdyID0gZHFt
LT5tcWRfbWdyc1tnZXRfbXFkX3R5cGVfZnJvbV9xdWV1ZV90eXBlKA0KLQkJCXEtPnByb3BlcnRp
ZXMudHlwZSldOw0KLQlxLT5tcWRfbWVtX29iaiA9IG1xZF9tZ3ItPmFsbG9jYXRlX21xZChtcWRf
bWdyLT5kZXYsICZxLT5wcm9wZXJ0aWVzKTsNCi0JaWYgKCFxLT5tcWRfbWVtX29iaikNCi0JCXJl
dHVybiAtRU5PTUVNOw0KLQ0KLQlkcW1fbG9jayhkcW0pOw0KIAlpZiAocS0+cHJvcGVydGllcy50
eXBlID09IEtGRF9RVUVVRV9UWVBFX1NETUEgfHwNCiAJCXEtPnByb3BlcnRpZXMudHlwZSA9PSBL
RkRfUVVFVUVfVFlQRV9TRE1BX1hHTUkpIHsNCiAJCXJldHZhbCA9IGFsbG9jYXRlX3NkbWFfcXVl
dWUoZHFtLCBxKTsNCiAJCWlmIChyZXR2YWwpDQotCQkJZ290byBvdXRfdW5sb2NrOw0KKwkJCWdv
dG8gb3V0Ow0KIAl9DQogDQogCXJldHZhbCA9IGFsbG9jYXRlX2Rvb3JiZWxsKHFwZCwgcSk7DQog
CWlmIChyZXR2YWwpDQogCQlnb3RvIG91dF9kZWFsbG9jYXRlX3NkbWFfcXVldWU7DQogDQorCW1x
ZF9tZ3IgPSBkcW0tPm1xZF9tZ3JzW2dldF9tcWRfdHlwZV9mcm9tX3F1ZXVlX3R5cGUoDQorCQkJ
cS0+cHJvcGVydGllcy50eXBlKV07DQogCS8qDQogCSAqIEV2aWN0aW9uIHN0YXRlIGxvZ2ljOiBt
YXJrIGFsbCBxdWV1ZXMgYXMgZXZpY3RlZCwgZXZlbiBvbmVzDQogCSAqIG5vdCBjdXJyZW50bHkg
YWN0aXZlLiBSZXN0b3JpbmcgaW5hY3RpdmUgcXVldWVzIGxhdGVyIG9ubHkNCkBAIC0xMTY1LDgg
KzExNjEsMTQgQEAgc3RhdGljIGludCBjcmVhdGVfcXVldWVfY3BzY2goc3RydWN0IGRldmljZV9x
dWV1ZV9tYW5hZ2VyICpkcW0sIHN0cnVjdCBxdWV1ZSAqcSwNCiAJCWRxbS0+YXNpY19vcHMuaW5p
dF9zZG1hX3ZtKGRxbSwgcSwgcXBkKTsNCiAJcS0+cHJvcGVydGllcy50YmFfYWRkciA9IHFwZC0+
dGJhX2FkZHI7DQogCXEtPnByb3BlcnRpZXMudG1hX2FkZHIgPSBxcGQtPnRtYV9hZGRyOw0KKwlx
LT5tcWRfbWVtX29iaiA9IG1xZF9tZ3ItPmFsbG9jYXRlX21xZChtcWRfbWdyLT5kZXYsICZxLT5w
cm9wZXJ0aWVzKTsNCisJaWYgKCFxLT5tcWRfbWVtX29iaikgew0KKwkJcmV0dmFsID0gLUVOT01F
TTsNCisJCWdvdG8gb3V0X2RlYWxsb2NhdGVfZG9vcmJlbGw7DQorCX0NCiAJbXFkX21nci0+aW5p
dF9tcWQobXFkX21nciwgJnEtPm1xZCwgcS0+bXFkX21lbV9vYmosDQogCQkJCSZxLT5nYXJ0X21x
ZF9hZGRyLCAmcS0+cHJvcGVydGllcyk7DQorCWRxbV9sb2NrKGRxbSk7DQogDQogCWxpc3RfYWRk
KCZxLT5saXN0LCAmcXBkLT5xdWV1ZXNfbGlzdCk7DQogCXFwZC0+cXVldWVfY291bnQrKzsNCkBA
IC0xMTkyLDEzICsxMTk0LDEzIEBAIHN0YXRpYyBpbnQgY3JlYXRlX3F1ZXVlX2Nwc2NoKHN0cnVj
dCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLCBzdHJ1Y3QgcXVldWUgKnEsDQogCWRxbV91bmxv
Y2soZHFtKTsNCiAJcmV0dXJuIHJldHZhbDsNCiANCitvdXRfZGVhbGxvY2F0ZV9kb29yYmVsbDoN
CisJZGVhbGxvY2F0ZV9kb29yYmVsbChxcGQsIHEpOw0KIG91dF9kZWFsbG9jYXRlX3NkbWFfcXVl
dWU6DQogCWlmIChxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZEX1FVRVVFX1RZUEVfU0RNQSB8fA0K
IAkJcS0+cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBFX1NETUFfWEdNSSkNCiAJCWRl
YWxsb2NhdGVfc2RtYV9xdWV1ZShkcW0sIHEpOw0KLW91dF91bmxvY2s6DQotCWRxbV91bmxvY2so
ZHFtKTsNCi0JbXFkX21nci0+ZnJlZV9tcWQobXFkX21nciwgcS0+bXFkLCBxLT5tcWRfbWVtX29i
aik7DQorb3V0Og0KIAlyZXR1cm4gcmV0dmFsOw0KIH0NCiANCi0tIA0KMi43LjQNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
