Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AD24237F
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 13:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB51189487;
	Wed, 12 Jun 2019 11:08:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820042.outbound.protection.outlook.com [40.107.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E4F89487
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 11:08:45 +0000 (UTC)
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1294.namprd12.prod.outlook.com (10.169.205.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Wed, 12 Jun 2019 11:08:39 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8%8]) with mapi id 15.20.1987.010; Wed, 12 Jun 2019
 11:08:39 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: Bail out of BO node creation if not enough
 VRAM (v3)
Thread-Topic: [PATCH] drm/amd/amdgpu: Bail out of BO node creation if not
 enough VRAM (v3)
Thread-Index: AQHVIQ8v8WYAxqy6jEqFOOuLiEco1g==
Date: Wed, 12 Jun 2019 11:08:39 +0000
Message-ID: <20190612110829.4699-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR14CA0034.namprd14.prod.outlook.com
 (2603:10b6:404:13f::20) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f94a03a-95ff-4b6b-5cfb-08d6ef26523b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1294; 
x-ms-traffictypediagnostic: MWHPR12MB1294:
x-microsoft-antispam-prvs: <MWHPR12MB12941C32788F422D8910C304F7EC0@MWHPR12MB1294.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(39860400002)(346002)(366004)(396003)(199004)(189003)(2351001)(256004)(14444005)(3846002)(6116002)(66476007)(64756008)(66446008)(66556008)(186003)(68736007)(73956011)(66946007)(486006)(2616005)(476003)(5640700003)(26005)(6506007)(6436002)(102836004)(386003)(25786009)(53936002)(6512007)(99286004)(52116002)(2906002)(7736002)(305945005)(50226002)(6486002)(8936002)(81156014)(81166006)(8676002)(1076003)(478600001)(6916009)(66066001)(72206003)(14454004)(2501003)(5660300002)(316002)(71200400001)(71190400001)(36756003)(86362001)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1294;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5rZgJsAq767zHbC5PezFZavO0TNUVqwTfyKpJHu7Xea/KQy90TTKPubPCgex9zXoDaAckQdn6PbgCR1pX8VfovApSdPH0DNMP30cpcsk9X5ekwVgBCFFDgKUYrxcuvy5kG8DAH6U4tzCNeVOJRFl9LKaUBwaSL41evkD/PptVEu3U9IqUqtVE+zApliE3Q/5h1Jltc1mFmWbmoVSr+EI3XthcXOEYR5oy2xfyX10A1Bz6UuOffNP152wkuqOBzQu2nXqDZXU9MWGt82E4r1NEJMwyD5iuFRSVvmr3pny4VCjljZBIn2cXifpydRNoloqsn2mhmcw5bJSU3SAVmHuaSNZe8MUKa6o2CJjxyYWjSjVU6XTNWrSITojqX69YnQE6/h4VIDYjMGa5mZy/BM/D19EXg13bRsjXFjcZNFwAbM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f94a03a-95ff-4b6b-5cfb-08d6ef26523b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 11:08:39.1195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1294
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGFf8zF6mY+EhS1/bFRakSvmTai/brb3N5IG9fW93RY=;
 b=eWko2TdsDYdsqSSelYNF9KTIDSFQuOHssrk3bSkQWF7nSSvJiebxM4DFWACwSV0FEABBboB2qLpXBkWS2cjwgNHvivFr5CtL6ZntlpwEXkNDYHgL0vlQ2QTFmfl5X76uE3Tf/n3HV1P2KjbR0eKHcv4BB3g/JKoEV9b+iXTslLw=
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

KHYyKTogUmV0dXJuIDAgYW5kIHNldCBtZW0tPm1tX25vZGUgdG8gTlVMTC4NCih2Myk6IFVzZSBh
dG9taWM2NF9hZGRfcmV0dXJuIGluc3RlYWQuDQoNClNpZ25lZC1vZmYtYnk6IFRvbSBTdCBEZW5p
cyA8dG9tLnN0ZGVuaXNAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92cmFtX21nci5jIHwgMTcgKysrKysrKysrKysrLS0tLS0NCiAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMNCmluZGV4IDhhZWEyZjIxYjIwMi4uYzk2M2Fk
ODYwNzJlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zy
YW1fbWdyLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21n
ci5jDQpAQCAtMjc2LDcgKzI3Niw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhz
dHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwNCiAJc3RydWN0IGRybV9tbV9ub2RlICpu
b2RlczsNCiAJZW51bSBkcm1fbW1faW5zZXJ0X21vZGUgbW9kZTsNCiAJdW5zaWduZWQgbG9uZyBs
cGZuLCBudW1fbm9kZXMsIHBhZ2VzX3Blcl9ub2RlLCBwYWdlc19sZWZ0Ow0KLQl1aW50NjRfdCB1
c2FnZSA9IDAsIHZpc191c2FnZSA9IDA7DQorCXVpbnQ2NF90IHZpc191c2FnZSA9IDA7DQogCXVu
c2lnbmVkIGk7DQogCWludCByOw0KIA0KQEAgLTI4NCw2ICsyODQsMTMgQEAgc3RhdGljIGludCBh
bWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLA0KIAlp
ZiAoIWxwZm4pDQogCQlscGZuID0gbWFuLT5zaXplOw0KIA0KKwkvKiBiYWlsIG91dCBxdWlja2x5
IGlmIHRoZXJlJ3MgbGlrZWx5IG5vdCBlbm91Z2ggVlJBTSBmb3IgdGhpcyBCTyAqLw0KKwlpZiAo
YXRvbWljNjRfYWRkX3JldHVybihtZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZULCAmbWdyLT51
c2FnZSkgPiBhZGV2LT5nbWMubWNfdnJhbV9zaXplKSB7DQorCQlhdG9taWM2NF9zdWIobWVtLT5u
dW1fcGFnZXMgPDwgUEFHRV9TSElGVCwgJm1nci0+dXNhZ2UpOw0KKwkJbWVtLT5tbV9ub2RlID0g
TlVMTDsNCisJCXJldHVybiAwOw0KKwl9DQorDQogCWlmIChwbGFjZS0+ZmxhZ3MgJiBUVE1fUExf
RkxBR19DT05USUdVT1VTKSB7DQogCQlwYWdlc19wZXJfbm9kZSA9IH4wdWw7DQogCQludW1fbm9k
ZXMgPSAxOw0KQEAgLTMwMCw4ICszMDcsMTAgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3Jf
bmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLA0KIA0KIAlub2RlcyA9IGt2bWFs
bG9jX2FycmF5KCh1aW50MzJfdCludW1fbm9kZXMsIHNpemVvZigqbm9kZXMpLA0KIAkJCSAgICAg
ICBHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7DQotCWlmICghbm9kZXMpDQorCWlmICghbm9kZXMp
IHsNCisJCWF0b21pYzY0X3N1YihtZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZULCAmbWdyLT51
c2FnZSk7DQogCQlyZXR1cm4gLUVOT01FTTsNCisJfQ0KIA0KIAltb2RlID0gRFJNX01NX0lOU0VS
VF9CRVNUOw0KIAlpZiAocGxhY2UtPmZsYWdzICYgVFRNX1BMX0ZMQUdfVE9QRE9XTikNCkBAIC0z
MjEsNyArMzMwLDYgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1f
bWVtX3R5cGVfbWFuYWdlciAqbWFuLA0KIAkJaWYgKHVubGlrZWx5KHIpKQ0KIAkJCWJyZWFrOw0K
IA0KLQkJdXNhZ2UgKz0gbm9kZXNbaV0uc2l6ZSA8PCBQQUdFX1NISUZUOw0KIAkJdmlzX3VzYWdl
ICs9IGFtZGdwdV92cmFtX21ncl92aXNfc2l6ZShhZGV2LCAmbm9kZXNbaV0pOw0KIAkJYW1kZ3B1
X3ZyYW1fbWdyX3ZpcnRfc3RhcnQobWVtLCAmbm9kZXNbaV0pOw0KIAkJcGFnZXNfbGVmdCAtPSBw
YWdlczsNCkBAIC0zNDEsMTQgKzM0OSwxMiBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21ncl9u
ZXcoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sDQogCQlpZiAodW5saWtlbHkocikp
DQogCQkJZ290byBlcnJvcjsNCiANCi0JCXVzYWdlICs9IG5vZGVzW2ldLnNpemUgPDwgUEFHRV9T
SElGVDsNCiAJCXZpc191c2FnZSArPSBhbWRncHVfdnJhbV9tZ3JfdmlzX3NpemUoYWRldiwgJm5v
ZGVzW2ldKTsNCiAJCWFtZGdwdV92cmFtX21ncl92aXJ0X3N0YXJ0KG1lbSwgJm5vZGVzW2ldKTsN
CiAJCXBhZ2VzX2xlZnQgLT0gcGFnZXM7DQogCX0NCiAJc3Bpbl91bmxvY2soJm1nci0+bG9jayk7
DQogDQotCWF0b21pYzY0X2FkZCh1c2FnZSwgJm1nci0+dXNhZ2UpOw0KIAlhdG9taWM2NF9hZGQo
dmlzX3VzYWdlLCAmbWdyLT52aXNfdXNhZ2UpOw0KIA0KIAltZW0tPm1tX25vZGUgPSBub2RlczsN
CkBAIC0zNTksNiArMzY1LDcgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVj
dCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLA0KIAl3aGlsZSAoaS0tKQ0KIAkJZHJtX21tX3Jl
bW92ZV9ub2RlKCZub2Rlc1tpXSk7DQogCXNwaW5fdW5sb2NrKCZtZ3ItPmxvY2spOw0KKwlhdG9t
aWM2NF9zdWIobWVtLT5udW1fcGFnZXMgPDwgUEFHRV9TSElGVCwgJm1nci0+dXNhZ2UpOw0KIA0K
IAlrdmZyZWUobm9kZXMpOw0KIAlyZXR1cm4gciA9PSAtRU5PU1BDID8gMCA6IHI7DQotLSANCjIu
MjEuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
