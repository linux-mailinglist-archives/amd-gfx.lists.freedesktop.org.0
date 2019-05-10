Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000321A0E7
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 18:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC7289FA9;
	Fri, 10 May 2019 16:01:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780047.outbound.protection.outlook.com [40.107.78.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C3C89FA9
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 16:01:18 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2434.namprd12.prod.outlook.com (52.132.11.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Fri, 10 May 2019 16:01:17 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1856.012; Fri, 10 May 2019
 16:01:17 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/8] drm/amdgpu: Remove GWS barriers pre-reservation for gfx
Thread-Topic: [PATCH 2/8] drm/amdgpu: Remove GWS barriers pre-reservation for
 gfx
Thread-Index: AQHVB0mZBD9/Sn2cVkux3Swkk/+ACw==
Date: Fri, 10 May 2019 16:01:16 +0000
Message-ID: <1557504063-1559-2-git-send-email-Oak.Zeng@amd.com>
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
x-ms-office365-filtering-correlation-id: 920e282e-f818-47c9-84fb-08d6d560bbf6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2434; 
x-ms-traffictypediagnostic: BL0PR12MB2434:
x-microsoft-antispam-prvs: <BL0PR12MB2434A85F816255C46C3C5ABB800C0@BL0PR12MB2434.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(396003)(346002)(39860400002)(136003)(189003)(199004)(2906002)(5660300002)(4326008)(186003)(6116002)(102836004)(26005)(478600001)(11346002)(446003)(72206003)(53936002)(2616005)(476003)(36756003)(6512007)(2351001)(14454004)(2501003)(486006)(3846002)(25786009)(8676002)(81166006)(81156014)(5640700003)(68736007)(6486002)(6436002)(316002)(71190400001)(86362001)(7736002)(305945005)(50226002)(54906003)(6916009)(8936002)(99286004)(71200400001)(66946007)(64756008)(66556008)(66476007)(66446008)(73956011)(76176011)(386003)(6506007)(256004)(52116002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2434;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PhD9Y7mHgI6uVs0cT/yXMZ+h8SC4E1vijodaR+mkukalkpVV6D8sRpR3EkLrM5kgVck/mlDn2LNHEqCj5nH8F43+Gf60G4xDq3Rf1M4aH026/ytSSRTnlTpWiG477w44UrGd9Y0r4PHDsv7zHiFrWb905mBCd2otkwoKsYzBsr3PpihuI3IUYzCHgVw76yORjfOSL/nUmE1uPQ8VU6ehL68yhm38pPritE8ybAgQ0LsfuuvC6029MUae8UfckNGEz2YFcitFoR2Lg+tVQEszmlbBA2vKZaNr7zn18I0OI+WPA3aNbWjlXtkvsHAY1kBwVixltkwntJbLN7J0/1iKwlCiJ9jzrjvf7sRBr6qZLTqfgOa+hW7HncDA50bLNW9A+guTrfU8EGHFKblyphlfmO8qgxSRBCGB5ciLkJGtZMk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 920e282e-f818-47c9-84fb-08d6d560bbf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 16:01:16.9474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2434
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWQeI4u8Sp7I/RJGNTlJkpH8eQE2PhrNLCgJT/iGNpQ=;
 b=KuQf5ItrfzjSMIA9hr61H4aduNMx0Pmgi+oIFE6/1REiouAYzEcC9juuSahY8WksNvfVCBSD2y7liYbzWNHerzaWOSF9rpOID+yYoPu49QPa5EcOJEtNZHi/9iV3A9Bm0v+1K33QAcTdnOO5kl+3rLKjMSiAnbvyz8v5C/RIR2w=
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

VXNlciBzcGFjZSBhbGxvY2F0ZWQgR1dTIGJhcnJpZXJzIGFyZSB1c2VkLiBUaGUga2VybmVsDQpw
cmUtYWxsb2NhdGVkIEdXUyBiYXJyaWVycyBhcmUgdW51c2VkLg0KDQpDaGFuZ2UtSWQ6IEk3YWFj
MjU5ZDFmNmI3MDY0ZDAyYWZmMjMxMjc5ZmY2MDVjMjllYTM0DQpTaWduZWQtb2ZmLWJ5OiBPYWsg
WmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9ib19saXN0LmMgfCAyICstDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dkcy5oICAgICB8IDMgKy0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jICAgICB8IDYgLS0tLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3
XzAuYyAgICAgICB8IDEgLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMg
ICAgICAgfCAxIC0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgICAg
IHwgMSAtDQogNiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygt
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xp
c3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmMNCmluZGV4
IDVjNzlkYTguLjI3M2MxNmIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYm9fbGlzdC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYm9fbGlzdC5jDQpAQCAtODIsNyArODIsNyBAQCBpbnQgYW1kZ3B1X2JvX2xpc3RfY3JlYXRl
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHAsDQogDQog
CWtyZWZfaW5pdCgmbGlzdC0+cmVmY291bnQpOw0KIAlsaXN0LT5nZHNfb2JqID0gYWRldi0+Z2Rz
Lmdkc19nZnhfYm87DQotCWxpc3QtPmd3c19vYmogPSBhZGV2LT5nZHMuZ3dzX2dmeF9ibzsNCisJ
bGlzdC0+Z3dzX29iaiA9IE5VTEw7DQogCWxpc3QtPm9hX29iaiA9IGFkZXYtPmdkcy5vYV9nZnhf
Ym87DQogDQogCWFycmF5ID0gYW1kZ3B1X2JvX2xpc3RfYXJyYXlfZW50cnkobGlzdCwgMCk7DQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dkcy5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dkcy5oDQppbmRleCBmODlmNTczLi43ZTVi
NGJhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dkcy5o
DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2RzLmgNCkBAIC0zOSwx
MyArMzksMTIgQEAgc3RydWN0IGFtZGdwdV9nZHMgew0KIAlzdHJ1Y3QgYW1kZ3B1X2dkc19hc2lj
X2luZm8Jb2E7DQogCXVpbnQzMl90CQkJZ2RzX2NvbXB1dGVfbWF4X3dhdmVfaWQ7DQogDQotCS8q
IEF0IHByZXNlbnQsIEdEUywgR1dTIGFuZCBPQSByZXNvdXJjZXMgZm9yIGdmeCAoZ3JhcGhpY3Mp
DQorCS8qIEF0IHByZXNlbnQsIEdEUyBhbmQgT0EgcmVzb3VyY2VzIGZvciBnZnggKGdyYXBoaWNz
KQ0KIAkgKiBpcyBhbHdheXMgcHJlLWFsbG9jYXRlZCBhbmQgYXZhaWxhYmxlIGZvciBncmFwaGlj
cyBvcGVyYXRpb24uDQogCSAqIFN1Y2ggcmVzb3VyY2UgaXMgc2hhcmVkIGJldHdlZW4gYWxsIGdm
eCBjbGllbnRzLg0KIAkgKiBUT0RPOiBtb3ZlIHRoaXMgb3BlcmF0aW9uIHRvIHVzZXIgc3BhY2UN
CiAJICogKi8NCiAJc3RydWN0IGFtZGdwdV9ibyoJCWdkc19nZnhfYm87DQotCXN0cnVjdCBhbWRn
cHVfYm8qCQlnd3NfZ2Z4X2JvOw0KIAlzdHJ1Y3QgYW1kZ3B1X2JvKgkJb2FfZ2Z4X2JvOw0KIH07
DQogDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQppbmRleCAzOGNlMTFl
Li5iMGU1MWU1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCkBA
IC0xNzkxLDEyICsxNzkxLDYgQEAgaW50IGFtZGdwdV90dG1faW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikNCiAJCXJldHVybiByOw0KIAl9DQogDQotCXIgPSBhbWRncHVfYm9fY3JlYXRl
X2tlcm5lbChhZGV2LCBhZGV2LT5nZHMuZ3dzLmdmeF9wYXJ0aXRpb25fc2l6ZSwNCi0JCQkJICAg
IDEsIEFNREdQVV9HRU1fRE9NQUlOX0dXUywNCi0JCQkJICAgICZhZGV2LT5nZHMuZ3dzX2dmeF9i
bywgTlVMTCwgTlVMTCk7DQotCWlmIChyKQ0KLQkJcmV0dXJuIHI7DQotDQogCXIgPSB0dG1fYm9f
aW5pdF9tbSgmYWRldi0+bW1hbi5iZGV2LCBBTURHUFVfUExfT0EsDQogCQkJICAgYWRldi0+Z2Rz
Lm9hLnRvdGFsX3NpemUpOw0KIAlpZiAocikgew0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dmeF92N18wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djdfMC5jDQppbmRleCBhNTllMGZkLi40ZDczNDU2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y3XzAuYw0KQEAgLTQ0OTcsNyArNDQ5Nyw2IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y3XzBf
c3dfZmluaSh2b2lkICpoYW5kbGUpDQogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0
cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOw0KIA0KIAlhbWRncHVfYm9fZnJlZV9rZXJuZWwo
JmFkZXYtPmdkcy5vYV9nZnhfYm8sIE5VTEwsIE5VTEwpOw0KLQlhbWRncHVfYm9fZnJlZV9rZXJu
ZWwoJmFkZXYtPmdkcy5nd3NfZ2Z4X2JvLCBOVUxMLCBOVUxMKTsNCiAJYW1kZ3B1X2JvX2ZyZWVf
a2VybmVsKCZhZGV2LT5nZHMuZ2RzX2dmeF9ibywgTlVMTCwgTlVMTCk7DQogDQogCWZvciAoaSA9
IDA7IGkgPCBhZGV2LT5nZngubnVtX2dmeF9yaW5nczsgaSsrKQ0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjhfMC5jDQppbmRleCAwMjk1NWU2Li5lMjU1NzU0IDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYw0KQEAgLTIwNjEsNyArMjA2MSw2IEBAIHN0YXRpYyBpbnQg
Z2Z4X3Y4XzBfc3dfZmluaSh2b2lkICpoYW5kbGUpDQogCXN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOw0KIA0KIAlhbWRncHVfYm9fZnJl
ZV9rZXJuZWwoJmFkZXYtPmdkcy5vYV9nZnhfYm8sIE5VTEwsIE5VTEwpOw0KLQlhbWRncHVfYm9f
ZnJlZV9rZXJuZWwoJmFkZXYtPmdkcy5nd3NfZ2Z4X2JvLCBOVUxMLCBOVUxMKTsNCiAJYW1kZ3B1
X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5nZHMuZ2RzX2dmeF9ibywgTlVMTCwgTlVMTCk7DQogDQog
CWZvciAoaSA9IDA7IGkgPCBhZGV2LT5nZngubnVtX2dmeF9yaW5nczsgaSsrKQ0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQppbmRleCA3ZDdkMjg3Li40MWQxZmMzIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KQEAgLTE3ODUsNyArMTc4NSw2IEBAIHN0
YXRpYyBpbnQgZ2Z4X3Y5XzBfc3dfZmluaSh2b2lkICpoYW5kbGUpDQogCX0NCiANCiAJYW1kZ3B1
X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5nZHMub2FfZ2Z4X2JvLCBOVUxMLCBOVUxMKTsNCi0JYW1k
Z3B1X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5nZHMuZ3dzX2dmeF9ibywgTlVMTCwgTlVMTCk7DQog
CWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+Z2RzLmdkc19nZnhfYm8sIE5VTEwsIE5VTEwp
Ow0KIA0KIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+Z2Z4Lm51bV9nZnhfcmluZ3M7IGkrKykNCi0t
IA0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
