Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1F43B771
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2BA8913B;
	Mon, 10 Jun 2019 14:32:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760054.outbound.protection.outlook.com [40.107.76.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9E88913B
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jun 2019 14:32:12 +0000 (UTC)
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1390.namprd12.prod.outlook.com (10.169.206.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Mon, 10 Jun 2019 14:32:07 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8%8]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 14:32:07 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: Bail out of BO node creation if not enough
 VRAM
Thread-Topic: [PATCH] drm/amd/amdgpu: Bail out of BO node creation if not
 enough VRAM
Thread-Index: AQHVH5lHYnsypzm1aE+u6WgpA3XupQ==
Date: Mon, 10 Jun 2019 14:32:06 +0000
Message-ID: <20190610143157.26752-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::20) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9defba6b-5108-4f06-c3e1-08d6edb06991
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1390; 
x-ms-traffictypediagnostic: MWHPR12MB1390:
x-microsoft-antispam-prvs: <MWHPR12MB1390BD63A59FB9ADDB338478F7130@MWHPR12MB1390.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(366004)(376002)(39860400002)(199004)(189003)(6512007)(478600001)(66946007)(36756003)(72206003)(4326008)(6486002)(102836004)(6506007)(386003)(73956011)(66476007)(6436002)(50226002)(2906002)(52116002)(25786009)(5660300002)(5640700003)(99286004)(2501003)(68736007)(2351001)(2616005)(14454004)(81166006)(316002)(81156014)(8676002)(256004)(14444005)(476003)(86362001)(71190400001)(71200400001)(8936002)(66066001)(6916009)(6116002)(3846002)(305945005)(66446008)(7736002)(1076003)(64756008)(66556008)(53936002)(186003)(26005)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1390;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4c1zHZLuSjLTjMO65ozz5gDLy2V1qT5cLeXv0Vrhs76c0C5HwFmjnFEoGFb899Hv7kZV2GtfbxFtZU/tJ89Di7QC/bn7+rOI3U+UtmTd1HbNFJMFjqnCxESIYh0s8wNl61Qmlpd8Ww59oMLMvJICSIl4FdqTuCZoZEKJklyFRdgfLJ5+Rl3G1JH4p0pIqmvDtnHobGzmxr6WqLc36s+SHoxoEHh1tNmVjTfY9eejHbdN4YySvNKHEnOcfdEdi3G3qN9AKmr6p2/eoyGx09/OpztDnyaqcePWk1TnDOwK7Wk/PpwTTIMPw17yw5NFISf6IcWL7F9xh6FyFBh0fLbdnZBdm83v7yCGS9VxHsYPeZcpT6LbUv7ZUaD7FR5rTJ8esiFmgia7MBT54XHCx75CormzjDy8D/vwWdfxhAMnZuM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9defba6b-5108-4f06-c3e1-08d6edb06991
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 14:32:06.9858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1390
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4Rl+eCcba4c7TR4/xXSHqEoGzJw1nGcOj9J0iW+NQk=;
 b=oTPHqHaswwPHL0aUDCcZUG5zl7OnRnQE0/sVVCDxkvQP8z8fruXoCIgzYoXLThbCoVwYYa1sERGmkScRJOxeQOsf2HTHdlVWtK/CEScQrsxd29vjb6GQkh65L4WVGmm/f1tHN0aVBCDAM7w6AWvYVoVVzh0KmvV91uk/qmOYQDI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogVG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQuY29tPg0KLS0tDQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgfCAxNyArKysrKysr
KysrKystLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zy
YW1fbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYw0K
aW5kZXggOGFlYTJmMjFiMjAyLi43MGI0YTVhOTdlZDIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMNCkBAIC0yNzYsNyArMjc2LDcgQEAgc3RhdGlj
IGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFu
LA0KIAlzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGVzOw0KIAllbnVtIGRybV9tbV9pbnNlcnRfbW9k
ZSBtb2RlOw0KIAl1bnNpZ25lZCBsb25nIGxwZm4sIG51bV9ub2RlcywgcGFnZXNfcGVyX25vZGUs
IHBhZ2VzX2xlZnQ7DQotCXVpbnQ2NF90IHVzYWdlID0gMCwgdmlzX3VzYWdlID0gMDsNCisJdWlu
dDY0X3QgdmlzX3VzYWdlID0gMDsNCiAJdW5zaWduZWQgaTsNCiAJaW50IHI7DQogDQpAQCAtMjg0
LDYgKzI4NCwxMyBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21ncl9uZXcoc3RydWN0IHR0bV9t
ZW1fdHlwZV9tYW5hZ2VyICptYW4sDQogCWlmICghbHBmbikNCiAJCWxwZm4gPSBtYW4tPnNpemU7
DQogDQorCS8qIGJhaWwgb3V0IHF1aWNrbHkgaWYgdGhlcmUncyBsaWtlbHkgbm90IGVub3VnaCBW
UkFNIGZvciB0aGlzIEJPICovDQorCWF0b21pYzY0X2FkZChtZW0tPm51bV9wYWdlcyA8PCBQQUdF
X1NISUZULCAmbWdyLT51c2FnZSk7DQorCWlmIChhdG9taWM2NF9yZWFkKCZtZ3ItPnVzYWdlKSA+
IGFkZXYtPmdtYy5tY192cmFtX3NpemUpIHsNCisJCWF0b21pYzY0X3N1YihtZW0tPm51bV9wYWdl
cyA8PCBQQUdFX1NISUZULCAmbWdyLT51c2FnZSk7DQorCQlyZXR1cm4gLUVOT1NQQzsNCisJfQ0K
Kw0KIAlpZiAocGxhY2UtPmZsYWdzICYgVFRNX1BMX0ZMQUdfQ09OVElHVU9VUykgew0KIAkJcGFn
ZXNfcGVyX25vZGUgPSB+MHVsOw0KIAkJbnVtX25vZGVzID0gMTsNCkBAIC0zMDAsOCArMzA3LDEw
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21h
bmFnZXIgKm1hbiwNCiANCiAJbm9kZXMgPSBrdm1hbGxvY19hcnJheSgodWludDMyX3QpbnVtX25v
ZGVzLCBzaXplb2YoKm5vZGVzKSwNCiAJCQkgICAgICAgR0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8p
Ow0KLQlpZiAoIW5vZGVzKQ0KKwlpZiAoIW5vZGVzKSB7DQorCQlhdG9taWM2NF9zdWIobWVtLT5u
dW1fcGFnZXMgPDwgUEFHRV9TSElGVCwgJm1nci0+dXNhZ2UpOw0KIAkJcmV0dXJuIC1FTk9NRU07
DQorCX0NCiANCiAJbW9kZSA9IERSTV9NTV9JTlNFUlRfQkVTVDsNCiAJaWYgKHBsYWNlLT5mbGFn
cyAmIFRUTV9QTF9GTEFHX1RPUERPV04pDQpAQCAtMzIxLDcgKzMzMCw2IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwNCiAJ
CWlmICh1bmxpa2VseShyKSkNCiAJCQlicmVhazsNCiANCi0JCXVzYWdlICs9IG5vZGVzW2ldLnNp
emUgPDwgUEFHRV9TSElGVDsNCiAJCXZpc191c2FnZSArPSBhbWRncHVfdnJhbV9tZ3JfdmlzX3Np
emUoYWRldiwgJm5vZGVzW2ldKTsNCiAJCWFtZGdwdV92cmFtX21ncl92aXJ0X3N0YXJ0KG1lbSwg
Jm5vZGVzW2ldKTsNCiAJCXBhZ2VzX2xlZnQgLT0gcGFnZXM7DQpAQCAtMzQxLDE0ICszNDksMTIg
QEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFu
YWdlciAqbWFuLA0KIAkJaWYgKHVubGlrZWx5KHIpKQ0KIAkJCWdvdG8gZXJyb3I7DQogDQotCQl1
c2FnZSArPSBub2Rlc1tpXS5zaXplIDw8IFBBR0VfU0hJRlQ7DQogCQl2aXNfdXNhZ2UgKz0gYW1k
Z3B1X3ZyYW1fbWdyX3Zpc19zaXplKGFkZXYsICZub2Rlc1tpXSk7DQogCQlhbWRncHVfdnJhbV9t
Z3JfdmlydF9zdGFydChtZW0sICZub2Rlc1tpXSk7DQogCQlwYWdlc19sZWZ0IC09IHBhZ2VzOw0K
IAl9DQogCXNwaW5fdW5sb2NrKCZtZ3ItPmxvY2spOw0KIA0KLQlhdG9taWM2NF9hZGQodXNhZ2Us
ICZtZ3ItPnVzYWdlKTsNCiAJYXRvbWljNjRfYWRkKHZpc191c2FnZSwgJm1nci0+dmlzX3VzYWdl
KTsNCiANCiAJbWVtLT5tbV9ub2RlID0gbm9kZXM7DQpAQCAtMzU5LDYgKzM2NSw3IEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1h
biwNCiAJd2hpbGUgKGktLSkNCiAJCWRybV9tbV9yZW1vdmVfbm9kZSgmbm9kZXNbaV0pOw0KIAlz
cGluX3VubG9jaygmbWdyLT5sb2NrKTsNCisJYXRvbWljNjRfc3ViKG1lbS0+bnVtX3BhZ2VzIDw8
IFBBR0VfU0hJRlQsICZtZ3ItPnVzYWdlKTsNCiANCiAJa3ZmcmVlKG5vZGVzKTsNCiAJcmV0dXJu
IHIgPT0gLUVOT1NQQyA/IDAgOiByOw0KLS0gDQoyLjIxLjANCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
