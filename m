Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0DDB5A1
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD2089178;
	Sun, 28 Apr 2019 07:44:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810089.outbound.protection.outlook.com [40.107.81.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AA8891BF
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:20 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:18 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:18 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 22/27] drm/amdkfd: Fix gfx9 XNACK state save/restore
Thread-Topic: [PATCH 22/27] drm/amdkfd: Fix gfx9 XNACK state save/restore
Thread-Index: AQHU/ZYv14drBWoxe0qKOdQPU+eo+w==
Date: Sun, 28 Apr 2019 07:44:18 +0000
Message-ID: <20190428074331.30107-23-Felix.Kuehling@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190428074331.30107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 835db3db-a12a-475b-47e4-08d6cbad520f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB29338023268C3A1ABBA20E7192380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wJ9FxGxKc1HLOYwX3qQoVCMwxBMFcgdsOsM7CFy7T7I4W5EderPME1ZlW0xih+SsLiFJXhteD6jZHRc+ThaHs4l2BXlabe+V2u3u8ZJkaThICmQoj4ZKrvH7+9v59JeP1kjpaIfDxmM1ID7JWk8FKDkei8Gw9U9hnOfIyZhMztI502Is9mf2m+UtJ1YxrZCQ1aOujxbvXIBmd3W0XNdlokqSxSpEcg3EW2J3rXTOuJj2ncXcbWRgTwcsfOcdbatH6l+1p2CA/Ll7yqBb5uuPFOwM+kgIyYCII3+H9TeQP2tfmBssMRlWJ3ldKRfKN+Lvz2pb7Zll/WgwqSCcpmdoKRt/ZV7ASUGFtytL0C93gb569tRaPlV5bZZ96dGgEf+vqWFwXvARbcQcVF6wuLQV11V2O6/fdZKsXRGE28mchoY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835db3db-a12a-475b-47e4-08d6cbad520f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:18.8459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbVbkx8RaF79lkaeBYcUt21VE9yPyIhE6AMt8yB+Lks=;
 b=nF+EQbFT3Peixs7cYILS0YEs7oBhWPez1FjHwwO9xtcX7Aff4sjWUVGzmCQqGhII6F2ZXPTtGL+KrXwaJQqaw1nv/PIszQUTwfnE8pxP/qmYFlXKJO5JMb7kABZCo1aWCqDPiA1LhxuP500GP4u67dJsxyZ7+OZNeiJPwlwGQYo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Cornwall,
 Jay" <Jay.Cornwall@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmF5IENvcm53YWxsIDxKYXkuQ29ybndhbGxAYW1kLmNvbT4NCg0KU1FfV0FWRV9JQl9T
VFMuUkNOVCBncmV3IGZyb20gNCBiaXRzIHRvIDUgaW4gZ2Z4OS4gRG8gbm90IHRydW5jYXRlDQp3
aGVuIHNhdmluZyBpbiB0aGUgaGlnaCBiaXRzIG9mIFRUTVAxLg0KDQpTaWduZWQtb2ZmLWJ5OiBK
YXkgQ29ybndhbGwgPEpheS5Db3Jud2FsbEBhbWQuY29tPg0KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1
ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KU2lnbmVkLW9mZi1ieTogRmVsaXggS3Vl
aGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9jd3NyX3RyYXBfaGFuZGxlci5oICAgICAgIHwgMTIgKysrKysrLS0tLS0tDQogLi4u
L2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBfaGFuZGxlcl9nZng5LmFzbSAgICB8ICA4ICsr
KystLS0tDQogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMo
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9o
YW5kbGVyLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBfaGFuZGxlci5o
DQppbmRleCAwOTdkYTBkZDNiMDQuLmVlZDg0NWI0ZTlhNyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyLmgNCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyLmgNCkBAIC0zMTAsOCArMzEwLDggQEAg
c3RhdGljIGNvbnN0IHVpbnQzMl90IGN3c3JfdHJhcF9nZng5X2hleFtdID0gew0KIAkweGJlODAx
ZjZjLCAweDg2NmRmZjZkLA0KIAkweDAwMDBmZmZmLCAweGJlZjAwMDgwLA0KIAkweGI5NzAwMjgz
LCAweGI4ZjAyNDA3LA0KLQkweDhlNzA5YzcwLCAweDg3NmQ3MDZkLA0KLQkweGI4ZjAwM2M3LCAw
eDhlNzA5YjcwLA0KKwkweDhlNzA5YjcwLCAweDg3NmQ3MDZkLA0KKwkweGI4ZjAwM2M3LCAweDhl
NzA5YTcwLA0KIAkweDg3NmQ3MDZkLCAweGI4ZjBmODA3LA0KIAkweDg2NzBmZjcwLCAweDAwMDA3
ZmZmLA0KIAkweGI5NzBmODA3LCAweGJlZWUwMDdlLA0KQEAgLTU0OSwxMSArNTQ5LDExIEBAIHN0
YXRpYyBjb25zdCB1aW50MzJfdCBjd3NyX3RyYXBfZ2Z4OV9oZXhbXSA9IHsNCiAJMHgwMDAwMDA0
OCwgMHhjMDAzMWU3NywNCiAJMHgwMDAwMDA1OCwgMHhjMDA3MWViNywNCiAJMHgwMDAwMDA1Yywg
MHhiZjhjYzA3ZiwNCi0JMHg4NjZmZmY2ZCwgMHhmMDAwMDAwMCwNCi0JMHg4ZjZmOWM2ZiwgMHg4
ZTZmOTA2ZiwNCisJMHg4NjZmZmY2ZCwgMHhmODAwMDAwMCwNCisJMHg4ZjZmOWI2ZiwgMHg4ZTZm
OTA2ZiwNCiAJMHhiZWVlMDA4MCwgMHg4NzZlNmY2ZSwNCi0JMHg4NjZmZmY2ZCwgMHgwODAwMDAw
MCwNCi0JMHg4ZjZmOWI2ZiwgMHg4ZTZmOGY2ZiwNCisJMHg4NjZmZmY2ZCwgMHgwNDAwMDAwMCwN
CisJMHg4ZjZmOWE2ZiwgMHg4ZTZmOGY2ZiwNCiAJMHg4NzZlNmY2ZSwgMHg4NjZmZmY3MCwNCiAJ
MHgwMDgwMDAwMCwgMHg4ZjZmOTc2ZiwNCiAJMHhiOTZlZjgwNywgMHg4NjZkZmY2ZCwNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBfaGFuZGxlcl9nZng5
LmFzbSBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyX2dmeDku
YXNtDQppbmRleCA2YTAxMGM5ZTU1ZGUuLmUxYWMzNDUxNzY0MiAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyX2dmeDkuYXNtDQorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBfaGFuZGxlcl9nZng5LmFzbQ0KQEAg
LTE1MCwxMCArMTUwLDEwIEBAIHZhciBTX1NBVkVfU1BJX0lOSVRfTVRZUEVfU0hJRlQJCT0gICAy
OA0KIHZhciBTX1NBVkVfU1BJX0lOSVRfRklSU1RfV0FWRV9NQVNLCT0gICAweDA0MDAwMDAwCQkv
L2JpdFsyNl06IEZpcnN0V2F2ZUluVEcNCiB2YXIgU19TQVZFX1NQSV9JTklUX0ZJUlNUX1dBVkVf
U0hJRlQJPSAgIDI2DQogDQotdmFyIFNfU0FWRV9QQ19ISV9SQ05UX1NISUZUCQk9ICAgMjgJCQkv
L0ZJWE1FCSBjaGVjayB3aXRoIEJyaWFuIHRvIGVuc3VyZSBhbGwgZmllbGRzIG90aGVyIHRoYW4g
UENbNDc6MF0gY2FuIGJlIHVzZWQNCi12YXIgU19TQVZFX1BDX0hJX1JDTlRfTUFTSwkJPSAgIDB4
RjAwMDAwMDAJCS8vRklYTUUNCi12YXIgU19TQVZFX1BDX0hJX0ZJUlNUX1JFUExBWV9TSElGVAk9
ICAgMjcJCQkvL0ZJWE1FDQotdmFyIFNfU0FWRV9QQ19ISV9GSVJTVF9SRVBMQVlfTUFTSwk9ICAg
MHgwODAwMDAwMAkJLy9GSVhNRQ0KK3ZhciBTX1NBVkVfUENfSElfUkNOVF9TSElGVAkJPSAgIDI3
CQkJLy9GSVhNRQkgY2hlY2sgd2l0aCBCcmlhbiB0byBlbnN1cmUgYWxsIGZpZWxkcyBvdGhlciB0
aGFuIFBDWzQ3OjBdIGNhbiBiZSB1c2VkDQordmFyIFNfU0FWRV9QQ19ISV9SQ05UX01BU0sJCT0g
ICAweEY4MDAwMDAwCQkvL0ZJWE1FDQordmFyIFNfU0FWRV9QQ19ISV9GSVJTVF9SRVBMQVlfU0hJ
RlQJPSAgIDI2CQkJLy9GSVhNRQ0KK3ZhciBTX1NBVkVfUENfSElfRklSU1RfUkVQTEFZX01BU0sJ
PSAgIDB4MDQwMDAwMDAJCS8vRklYTUUNCiANCiB2YXIgc19zYXZlX3NwaV9pbml0X2xvCQkgICAg
PQlleGVjX2xvDQogdmFyIHNfc2F2ZV9zcGlfaW5pdF9oaQkJICAgID0JZXhlY19oaQ0KLS0gDQoy
LjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
